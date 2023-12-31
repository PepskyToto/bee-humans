import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    console.log(currentUserIsSender)
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
        <div class="${this.#userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  #insertMessageAndScrollDown(data) {
    if (data.destroy) {
      const form = document.querySelector('#new_message');
      const refus = document.querySelector('#refus-message');
      if (form) {
        form.remove();
        refus.insertAdjacentHTML("beforeend", "<p>La demande de service a été refusée</p>");
      }
    } else if (data.accepted) {
      const refus = document.getElementById('refus-message');
      if (refus) {
        refus.innerHTML = "<p>La demande de service a été acceptée</p>";
      }
    } else if (data.service_aborted) {
      const form = document.querySelector('#new_message');
      const accepted = document.getElementById('accepted');
      if (form) {
        form.remove();
        accepted.innerHTML = "<p>Vous n'avez pas honoré votre service</p>";
      }
    } else {
      const currentUserIsSender = this.currentUserIdValue === data.sender_id;
      const messageElement = this.#buildMessageElement(currentUserIsSender, data.message);

      this.messagesTarget.insertAdjacentHTML("beforeend", messageElement);
      this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
    }
  }
  

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
