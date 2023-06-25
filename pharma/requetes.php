<?php 


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "stockges";
// connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
die("Connection failed: " . mysqli_connect_error());
} 
?>


<!DOCTYPE html>
<html>
<head>
	<title>chcode_appli</title>
	<meta charset="utf8">
	<link rel="stylesheet" type="text/css" href="requet.css">
</head>

<body>
	<h3 align="center">Restes en stock</h3>
	<div align="center">
	<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]) ?>" method="POST"  >
	<select name="nom" id="nom"  >
         <option  value="sevelamer">sevelamer</option>
        <option  value="sertraline">sertraline</option>
        <option  value="spiramycine">spiramycine</option>
        <option  value="nefazodone">nefazodone</option>
        <option  value="sucralfate">sucralfate</option>
        <option  value="nimodipine">nimodipine</option>
        <option  value="doliprane">doliprane</option>
     </select>
     <input type="submit" name="submit" value="Vérifier">
	</form>
	
	<?php 
//recherche
$nom=@$_POST['nom'];
if(isset($_POST['submit'])){
//String qr="select codeprod,nomprod,prix,sum(qte) as stock,sum(qte)*prix as montant from vue1 group by codeprod ";
$exer=mysqli_query($conn,"select codeprod,nomprod,prix,sum(qte) as stock,sum(qte)*prix as montant from vue1 where nomprod='$nom' group by nomprod");
if($exer){
   print'<div style="overflow-x:auto;">';
	print'<table border="1" id="tbfich">';
	print'<tr><th>Code produit</th><th>Nom produit</th><th>Prix unitaire</th><th>Quantité en stock</th><th>Montant</th></tr>';
	if($row = mysqli_fetch_assoc($exer)){
	$codep=$row['codeprod'];
	$nomp=$row['nomprod'];
	$prix=$row['prix'];
	$stock=$row['stock'];
	$montant=$row['montant'];
	print'<tr>';
	print'<td>';
	     echo $codep;
	print'</td>';
	
	
	print'<td>';
	     echo 	$nomp;
	print'</td>';
	
		print'<td>';
	     echo 	$prix;
	print'</td>';
	
	print'<td>';
	     echo 	$stock;
	print'</td>';
	print'<td>';
	     echo 	$montant;
	print'</td>';
	
	
	print'</tr>';
		}
	print'</table >';
print'</div>';
}

}
?>
<?php 
//affichage
$exe4=mysqli_query($conn,"select codeprod,nomprod,prix,sum(qte) as stock,sum(qte)*prix as montant from vue1  group by nomprod");
if($exe4){
   print'<div style="overflow-x:auto;">';
	print'<table border="5" id="tbfich">';
print'<tr><th>Code produit</th><th>Nom produit</th><th>Prix unitaire</th><th>Quantité en stock</th><th>Montant</th></tr>';
	while($row = mysqli_fetch_assoc($exe4)){
	$codep=$row['codeprod'];
	$nomp=$row['nomprod'];
	$prix=$row['prix'];
	$stock=$row['stock'];
	$montant=$row['montant'];
	print'<tr>';
	print'<td>';
	     echo $codep;
	print'</td>';
	
	
	print'<td>';
	     echo 	$nomp;
	print'</td>';
	
		print'<td>';
	     echo 	$prix;
	print'</td>';
	
	print'<td>';
	     echo 	$stock;
	print'</td>';
	print'<td>';
	     echo 	$montant;
	print'</td>';
	
	print'</tr>';
		}
	print'</table >';
print'</div>';
}


?>
<?php
//total
//$exe5="select sum(prix*qte) as total from vue1";
$exe5=mysqli_query($conn,"select sum(prix*qte) as total from vue1");
	if($rst = mysqli_fetch_assoc($exe5)){
	$total=$rst['total'];
	echo  "Montant total des produits en stock :<b> $total</b><br><br>";
	} 


?>
<button onclick="document.location = 'mouvement.php'" id="bt">Mouvement</button>
<button onclick="document.location = 'produits.php'" id="bt">Produits</button>
<p><a href="logout.php" class="btn">DECONNECTEZ VOUS</a></p>
	</div>
</body>
</html>