import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("test")
    console.log(document.querySelector('.needer-conversation'))
    console.log(document.querySelector('.helper-conversation'))
    document.addEventListener("DOMContentLoaded", () => {
      const neederTab = document.getElementById('needer-tab');
      const helperTab = document.getElementById('helper-tab');
      neederTab.addEventListener('click', () => this.showNeederConversations());
      helperTab.addEventListener('click', () => this.showHelperConversations());
    });
  }
  
  showNeederConversations() {
    this.hideHelperConversations();
    this.showNeederConversationsContent();
  }
  
  showHelperConversations() {
    this.hideNeederConversations();
    this.showHelperConversationsContent();
  }
  
  hideNeederConversations() {
    const neederConversations = document.querySelectorAll('.needer-conversation');
    console.log(neederConversations); 
    neederConversations.forEach(conversation => {
      conversation.style.display = 'none';
    });
  }

  showNeederConversationsContent() {
    const neederConversations = document.querySelectorAll('.needer-conversation');
    neederConversations.forEach(conversation => {
      conversation.style.display = 'block';
    });
  }

  hideHelperConversations() {
    const helperConversations = document.querySelectorAll('.helper-conversation');
    helperConversations.forEach(conversation => {
      conversation.style.display = 'none';
    });
  }

  showHelperConversationsContent() {
    const helperConversations = document.querySelectorAll('.helper-conversation');
    helperConversations.forEach(conversation => {
      conversation.style.display = 'block';
    });
  }
}
