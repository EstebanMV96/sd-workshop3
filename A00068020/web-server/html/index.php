<?php
echo "<p>Materias cursadas</p>";
$con = new PDO('mysql:host=25.8.240.42;dbname=mydb;charset=utf8mb4', 'admin', 'admin');
if (!$con)
  {
  die('Could not connect');
  }
foreach($con->query('SELECT * FROM materia') as $row) {
    echo $row['nombre'].' '.$row['profesor'];
}
?>