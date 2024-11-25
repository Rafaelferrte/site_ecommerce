<?php
session_start();
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("Location: login.php");
    exit;
}

include('../php/db_connect.php');
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrinho</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container mt-5">
        <h1 class="text-center mb-5">Carrinho de Compras</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Produto</th>
                    <th>Quantidade</th>
                    <th>Preço</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $result = $conn->query("SELECT c.id, p.nome, p.preco, c.quantidade FROM carrinho c INNER JOIN produtos p ON c.produto_id = p.id");
                $total = 0;
                while ($row = $result->fetch_assoc()) {
                    $subtotal = $row['preco'] * $row['quantidade'];
                    $total += $subtotal;
                    echo '
                <tr>
                    <td>' . $row['nome'] . '</td>
                    <td>' . $row['quantidade'] . '</td>
                    <td>R$ ' . number_format($subtotal, 2, ',', '.') . '</td>
                </tr>';
                }
                ?>
                <tr>
                    <td colspan="2" class="text-end"><strong>Total</strong></td>
                    <td><strong>R$ <?php echo number_format($total, 2, ',', '.'); ?></strong></td>
                </tr>
            </tbody>
        </table>
        <div class="d-flex justify-content-end mb-3">
            <a href="../index.php" class="btn btn-success">Voltar</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>