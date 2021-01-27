<?php
$requete = $db->query('SELECT UPPER(nom) AS nom_maj FROM jeux-video');
while ($donnees = $requete->fetch())
{
echo $donnees['nom_maj'] . '<br />';
}
$requete->closeCursor();
?>