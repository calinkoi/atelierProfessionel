<?php

// Definir l'URL de l'API .NET
// **Assurez-vous que le port est bien 5299**
$api_url = 'http://localhost:5299/api/User/GetUsers'; 

echo "<h1>Consommation de l'API .NET : GET /api/User/GetUsers</h1>";

// Initialisation de la session cURL
$ch = curl_init();

// Config de la requete GET
curl_setopt($ch, CURLOPT_URL, $api_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

// Executer la requete
$response = curl_exec($ch);
    // Afficher la réponse brute (même si elle est vide ou en erreur)
    echo "<ul>";
    echo $response;
    echo "</ul";
?>