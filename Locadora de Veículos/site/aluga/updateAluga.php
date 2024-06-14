<?php
include '../functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';

// Verifica se o ID do carro existe
if (isset($_GET['id_locacao'])) {
    if (!empty($_POST)) {
        $valor_total = isset($_POST['valor_total']) ? $_POST['valor_total'] : '';
        $id_cliente = isset($_POST['id_cliente']) ? $_POST['id_cliente'] : '';
        $id_carro = isset($_POST['id_carro']) ? $_POST['id_carro'] : '';
        $data_locacao = isset($_POST['data_locacao']) ? $_POST['data_locacao'] : '';
        $data_devolucao = isset($_POST['data_devolucao']) ? $_POST['data_devolucao'] : '';

        try {
            $stmt = $pdo->prepare('UPDATE locacao SET valor_total = ?, id_cliente = ?, data_locacao = ?, data_devolucao = ?, id_carro = ? WHERE id_locacao = ?');
            $stmt->execute([$valor_total, $id_cliente, $data_locacao, $data_devolucao, $id_carro, $_GET['id_locacao']]);
            $msg = 'Aluguel atualizado com sucesso!';
            $button = '<a href="readAluga.php" class="create-contact">Voltar</a>';
        } catch (Exception $e) {
            $msg = 'Erro: ' . $e->getMessage();
        }
    }

    // Obter os detalhes do aluguel da tabela locacao
    $stmt = $pdo->prepare('SELECT * FROM locacao WHERE id_locacao = ?');
    $stmt->execute([$_GET['id_locacao']]);
    $aluguel = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$aluguel) {
        exit('Aluguel não encontrado!');
    }
} else {
    exit('Nenhum carro especificado!');
}
?>

<head>
    <?= template_head2('Editar Aluguel') ?>
</head>

<body>
    <?= template_header2() ?>
    <div class="container smallPage">
        <h2>Atualizar Aluguel para Carro - <?= $aluguel['id_carro'] ?></h2>
        <form action="updateAluga.php?id_locacao=<?= $_GET['id_locacao'] ?>" method="post">
            <div class="form-group">
                <label for="valor_total">Valor Total:</label>
                <input type="text" id="valor_total" name="valor_total" value="<?= $aluguel['valor_total'] ?>" required>
            </div>
            <div class="form-group">
                <label for="id_cliente">ID Cliente:</label>
                <input type="text" id="id_cliente" name="id_cliente" value="<?= $aluguel['id_cliente'] ?>" required readonly>
            </div>
            <div class="form-group">
                <label for="id_carro">ID carro:</label>
                <input type="text" id="id_carro" name="id_carro" value="<?= $aluguel['id_carro'] ?>" required readonly>
            </div>
            <div class="form-group">
                <label for="data_locacao">Data de Início:</label>
                <input type="date" id="data_locacao" name="data_locacao" value="<?= $aluguel['data_locacao'] ?>" required>
            </div>
            <div class="form-group">
                <label for="data_devolucao">Data de Fim:</label>
                <input type="date" id="data_devolucao" name="data_devolucao" value="<?= $aluguel['data_devolucao'] ?>" required>
            </div>
            <div class="form-group rowButtons">
                <input type="submit" value="Atualizar" class="btn btn-primary">
            </div>
        </form>
        <?php if ($msg) : ?>
            <p><?= $msg ?></p>
            <div><?= $button ?></div>
        <?php endif; ?>
    </div>

    <?= template_footer() ?>
</body>

</html>