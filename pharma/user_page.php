<?php

@include 'config.php';

session_start();

if(!isset($_SESSION['user_name'])){
   header('location:index.php');
}

?>

<!DOCTYPE html>
<html lang="fr">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>user page</title>

   <!-- custom css file link  -->
   <link rel="stylesheet" href="./css/style.css">

</head>
<body>

   
<div class="container">

   <div class="content">
      <h3>page <span>utilisateur</span></h3>
      <h1>BIENVENUE <span><?php echo $_SESSION['user_name'] ?></span></h1>
      <p>ceci est la page utilisateur</p>
      
      <a href="logout.php" class="btn">DECONNECTEZ VOUS</a>
      <a href="produits.php" class="btn">GESTION DES PRODUITS</a>
   </div>

</div>

</body>
</html>