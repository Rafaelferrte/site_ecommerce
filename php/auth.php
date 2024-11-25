<?php
session_start();
include('db_connect.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = md5($_POST['password']); // Criptografar a senha com MD5

    $query = $conn->prepare("SELECT id FROM usuarios WHERE username = ? AND password = ?");
    $query->bind_param("ss", $username, $password);
    $query->execute();
    $result = $query->get_result();

    if ($result->num_rows === 1) {
        $_SESSION['loggedin'] = true;
        $_SESSION['username'] = $username;
        header("Location: ../index.php");
        exit;
    } else {
        echo "<script>alert('Usuário ou senha inválidos!'); window.location.href='../index.php';</script>";
    }
}
?>
