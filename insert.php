<?php

use function PHPSTORM_META\type;

try{
        $score=$_REQUEST['hidden'];
        $commentaire=$_REQUEST['Q17'];
        
        $bdd= new PDO('mysql:host=localhost;dbname=meetcourseanalyzer','Meet_Course_Analyzer','passer', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
        
        $req = $bdd->query(
        "SELECT IDEvaluation
        From Evaluation
        ORDER BY IDEvaluation DESC
        LIMIT 1");

        $lastRow = $req -> fetch();

        $req = $bdd->prepare(
            "UPDATE Evaluation 
            SET noteEvaluation = ?, commentaire = ?
            WHERE IDEvaluation = ?");
        $req->execute([$score,$commentaire, $lastRow['IDEvaluation']]);
        header('location:https://apps.google.com/meet/');
    }
    catch(Exception $e){
        die ('Erreur :'.$e/* ->getMessage() */);
    }
?>
