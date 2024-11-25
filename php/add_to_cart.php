<?php
session_start();
include('db_connect.php');

if (isset($_GET['id'])) {
    $produto_id = intval($_GET['id']);
    $conn->query("INSERT INTO carrinho (produto_id) VALUES ($produto_id)");
    header("Location: ../index.php");
}
?>