<?php

session_start();
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("Location: ./pages/login.php");
    exit;
}

include('./php/db_connect.php');
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loja Simples</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-end mb-3">
            <a href="./php/logout.php" class="btn btn-success">Logout</a>
        </div>
        <h1 class="text-center mb-5">Produtos</h1>
        <div class="row">
            <?php
            $result = $conn->query("SELECT * FROM produtos");
            while ($row = $result->fetch_assoc()) {
                echo '
            <div class="col-md-4 mb-4">
                <div class="card w-100" id="card">
                    <img src="./assets/' . $row['imagem'] . '" class="card-img-top" alt="' . $row['nome'] . '">
                    <div class="card-body">
                        <h5 class="card-title">' . $row['nome'] . '</h5>
                        <p class="card-text">' . $row['descricao'] . '</p>
                        <p class="card-text"><strong>R$ ' . $row['preco'] . '</strong></p>
                        <a href="./php/add_to_cart.php?id=' . $row['id'] . '" class="btn btn-primary">Adicionar ao Carrinho</a>
                    </div>
                </div>
            </div>';
            }
            ?>
            <div class="d-flex justify-content-end mb-3">
                <a href="./pages/cart.php" class="btn btn-success">Ir para o Carrinho</a>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>