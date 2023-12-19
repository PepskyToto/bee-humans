// app/assets/javascripts/conversations.js

document.addEventListener("DOMContentLoaded", function() {
  const neederTab = document.getElementById('needer-tab');
  const helperTab = document.getElementById('helper-tab');

  // Ajoutez des gestionnaires d'événements pour basculer entre les vues
  neederTab.addEventListener('click', function() {
    showNeederConversations();
  });

  helperTab.addEventListener('click', function() {
    showHelperConversations();
  });

  // Fonctions pour afficher les conversations correspondantes
  function showNeederConversations() {
    hideHelperConversations();
    showNeederConversationsContent();
  }

  function showHelperConversations() {
    hideNeederConversations();
    showHelperConversationsContent();
  }

  function hideNeederConversations() {
    // Code pour masquer les conversations avec les needers
    const neederConversations = document.querySelectorAll('.needer-conversation');
    neederConversations.forEach(conversation => {
      conversation.style.display = 'none';
    });
  }

  function showNeederConversationsContent() {
    // Code pour afficher les conversations avec les needers
    const neederConversations = document.querySelectorAll('.needer-conversation');
    neederConversations.forEach(conversation => {
      conversation.style.display = 'block';
    });
  }

  function hideHelperConversations() {
    // Code pour masquer les conversations avec les helpers
    const helperConversations = document.querySelectorAll('.helper-conversation');
    helperConversations.forEach(conversation => {
      conversation.style.display = 'none';
    });
  }

  function showHelperConversationsContent() {
    // Code pour afficher les conversations avec les helpers
    const helperConversations = document.querySelectorAll('.helper-conversation');
    helperConversations.forEach(conversation => {
      conversation.style.display = 'block';
    });
  }
});
