<?php
include '../functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';

$carro = $pdo->query("SELECT id_carro, modelo FROM carro WHERE disponibilidade = 'Disponível' AND status = 'Bom'")->fetchAll(PDO::FETCH_ASSOC);
$clientes = $pdo->query('SELECT id_cliente, nome FROM clientes')->fetchAll(PDO::FETCH_ASSOC);
$carroLista = $pdo->query('SELECT id_carro FROM carro')->fetchAll(PDO::FETCH_ASSOC);

if (!empty($_POST)) {
    $valor_total = isset($_POST['valor_total']) ? $_POST['valor_total'] : '';
    $id_carro = isset($_POST['id_carro']) ? $_POST['id_carro'] : '';
    $id_cliente = isset($_POST['id_cliente']) ? $_POST['id_cliente'] : '';
    $data_locacao = isset($_POST['data_locacao']) ? $_POST['data_locacao'] : '';
    $data_devolucao = isset($_POST['data_devolucao']) ? $_POST['data_devolucao'] : '';

    if ($valor_total > 0 && !empty($id_carro) && !empty($id_cliente) && !empty($data_locacao) && !empty($data_devolucao)) {
        try {
            // Begin transaction
            $pdo->beginTransaction();

            // Insert into locacao
            $stmt = $pdo->prepare('INSERT INTO locacao (valor_total, id_carro, id_cliente, data_locacao, data_devolucao) VALUES (?, ?, ?, ?, ?)');
            $stmt->execute([$valor_total, $id_carro, $id_cliente, $data_locacao, $data_devolucao]);

            // Update disponibilidade in carro
            $stmt = $pdo->prepare('UPDATE carro SET disponibilidade = ? WHERE id_carro = ?');
            $stmt->execute(['Alugado', $id_carro]);

            // Commit transaction
            $pdo->commit();

            $msg = 'Aluguel registrado com sucesso e disponibilidade do carro atualizada para alugado!';
        } catch (Exception $e) {
            // Rollback transaction in case of error
            $pdo->rollBack();
            $msg = 'Erro: ' . $e->getMessage();
        }
    } else {
        $msg = 'Por favor, preencha todos os campos e certifique-se de que o valor total seja maior que 0.';
    }
}
?>


<head>
    <?= template_head2("Cadastro de Aluguel") ?>
</head>

<body>
    <?= template_header2() ?>
    <div class="container smallPage">
        <h1 class="text-center my-4">Cadastrar Aluguel</h1>
        <?php if ($msg): ?>
            <div class="alert alert-info" role="alert">
                <?= $msg ?>
            </div>
        <?php endif; ?>
        <form action="createAluga.php" class="form-group justify-content-center" method="POST">
        <div class="col-4">
            </div>
            <div class="col-8">
                <div class="rowButtons">
                    <label for="valor_hora" class="margin0 mx-5">Valor total:</label>
                    <h5>R$</h5>
                    <input type="number" id="valor_total" name="valor_total" placeholder="" class="form-control col-3" required>
                </div>
            </div>
            <div class="form-group">
                <label for="id_carro">ID do Carro:</label>
                <select name="id_carro" id="id_carro" value="<?= $carroLista['id_carro'] ?>" required>
                    <option value="">Selecione um carro</option>
                    <?php foreach ($carro as $carros) : ?>
                        <option value="<?= $carros['id_carro'] ?>"><?= $carros['modelo'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group">
                <label for="id_cliente">ID do Cliente:</label>
                <select name="id_cliente" id="id_cliente" required>
                    <option value="">Selecione um cliente</option>
                    <?php foreach ($clientes as $cliente) : ?>
                        <option value="<?= $cliente['id_cliente'] ?>"><?= $cliente['nome'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group">
                <label for="data_locacao">Data de Início:</label>
                <input type="date" class="form-control" id="data_locacao" name="data_locacao" required>
            </div>
            <div class="form-group">
                <label for="data_devolucao">Data de Fim:</label>
                <input type="date" class="form-control" id="data_devolucao" name="data_devolucao" required>
            </div>
            <div class="rowButtons">
                <input type="submit" value="Cadastrar" class="btn btn-primary">
            </div>
        </form>
    </div>
    <?= template_footer() ?>
</body>

</html>