<?php

    $score=$_REQUEST['hidden'];
    $commentaire=$_REQUEST['Q17'];

    try{
        $bdd= new PDO('mysql:host=localhost;dbname=MeetCourseAnalyzer;charset=utf-8','Meet_Course_Analyzer','passer', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
    }
    catch(Exception $e){
        die ('Erreur :'.$e->getMessage());
    }

    $req = $bdd->prepare('UPDATE Evaluation set noteEvaluation=?,commentaire=? where IDEvaluation=(select IDEvaluation from Evaluation order by IDEvaluation desc limit 1)');
    $req->execute([$score,$commentaire]);
?>
