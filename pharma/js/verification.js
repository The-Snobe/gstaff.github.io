$(document).ready(function() {

    // Cacher les champs initialement
    $('.champ').hide();
  
    // Fonction pour afficher/cacher les champs selon la nature sélectionnée
    $('input[name="nature"]').on('click', function() {
      var nature = $('input[name="nature"]:checked').val();
      if (nature == 'depot') {
        $('.champ').show();
      } else {
        $('.champ').hide();
      }
    });
  
    // Fonction pour ajouter la classe 'selected' sur le bouton cliqué
    $('.bouton').on('click', function() {
      $('.bouton').removeClass('selected');
      $(this).addClass('selected');
    });
  
    // Fonction pour valider le formulaire
    $('form').on('submit', function(event) {
      event.preventDefault(); // Empêcher l'envoi du formulaire
  
      // Validation des champs obligatoires
      var id = $('input[name="id"]').val();
      var code = $('select[name="code"]').val();
      var qte = $('input[name="qte"]').val();
      var date = $('input[name="date"]').val();
      var nature = $('input[name="nature"]:checked').val();
  
      if (id == '' || code == '' || qte == '' || date == '' || nature == '') {
        alert('Tous les champs doivent être remplis!');
        return false;
      }
  
      // Confirmation de l'action choisie
      var action = $('.selected').val();
      var message = '';
      switch (action) {
        case 'Ajouter':
          message = 'Êtes-vous sûr de vouloir ajouter ce produit?';
          break;
        case 'Supprimer':
          message = 'Êtes-vous sûr de vouloir supprimer ce produit?';
          break;
        case 'Modifier':
          message = 'Êtes-vous sûr de vouloir modifier ce produit?';
          break;
        case 'Recherche':
          message = 'Êtes-vous sûr de vouloir lancer la recherche?';
          break;
        default:
          break;
      }
  
      if (confirm(message)) {
        alert('Action confirmée!');
        $('input[type="text"], select').val('');
        $('input[name="nature"]').prop('checked', false);
        $('.champ').hide();
        $('.bouton').removeClass('selected');
      } else {
        alert('Action annulée!');
      }
    });
  
  });
  