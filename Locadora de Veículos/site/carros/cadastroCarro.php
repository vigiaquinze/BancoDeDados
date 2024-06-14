<?php
include '../functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';

if (!empty($_POST)) {
    $placa = isset($_POST['placa']) ? $_POST['placa'] : '';
    $modelo = isset($_POST['modelo']) ? $_POST['modelo'] : '';
    $ano = isset($_POST['ano']) ? $_POST['ano'] : '';
    $numero_agencia = isset($_POST['numero_agencia']) ? $_POST['numero_agencia'] : '';
    $disponibilidade = isset($_POST['disponibilidade']) ? $_POST['disponibilidade'] : '';
    $valor_hora = isset($_POST['valor_hora']) ? $_POST['valor_hora'] : '';
    $cor = isset($_POST['cor']) ? $_POST['cor'] : '';
    $status = isset($_POST['status']) ? $_POST['status'] : '';


    try {
        $stmt = $pdo->prepare('INSERT INTO carro (placa, modelo, ano, numero_agencia, disponibilidade, valor_hora, cor, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)');
        $stmt->execute([$placa, $modelo, $ano, $numero_agencia, $disponibilidade, $valor_hora, $cor, $status]);
        $msg = 'Carro cadastrado com sucesso!';
    } catch (Exception $e) {
        $msg = $e;
    }
}
?>

<head>
    <?= template_head2("Cadastro de carro") ?>
</head>

<body>
    <?= template_header2()?>
    <div class="content update">
        <h1 style="margin: 0px auto; width: 100%; text-align: center; margin-top: 80px;">Cadastrar carro</h1>
        <?php if ($msg): ?>
            <div class="alert alert-info" role="alert">
                <?= $msg ?>
            </div>
        <?php endif; ?>
        <form action="cadastroCarro.php" method="POST">
            <div class="form-group col-3">
                <label for="marca">Placa:</label>
                <input type="text" id="placa" name="placa" placeholder="Placa" class="form-control" required>
            </div>
            <div class="form-group col-3">
            <label for="modelo">Modelo:</label>
                <input type="text" id="modelo" name="modelo" placeholder="Modelo" class="form-control" required>
            </div>
            <div class="form-group col-3">
                <label for="placa">Ano:</label>
                <input type="text" id="ano" name="ano" placeholder="Ano" class="form-control" required>
            </div>
            <div class="form-group col-3">
                <label for="ano">Cor:</label>
                <input type="text" id="cor" name="cor" placeholder="Cor" class="form-control" required>
            </div>
            <div class="form-group col-3">
                <label for="valor_hora">Valor por hora:</label>
            </div>
            <div class="form-group col-3">
                <div class="rowButtons">
                    <h5>R$</h5>
                    <input type="number" id="valor_hora" name="valor_hora" placeholder="" class="form-control col-3" required>
                    <p>,00 p/hora.</p>
                </div>
            </div>
            <div class="form-group col-3">
                <label for="disponibilidade">Disponibilidade:</label>
                <select class="form-select" name="disponibilidade" id="disponibilidade" required>
                    <option value="Disponível">Disponível</option>
                    <option value="Reservado">Reservado</option>
                </select>
            </div>
            <div class="form-group col-3">
            <label for="status">Status:</label>
                <select class="form-select" name="status" id="status" required>
                    <option value="Bom">Bom</option>
                    <option value="Em manutenção">Em manutenção</option>
                    <option value="Necessario manutenção">Necessário manutenção</option>
                </select>
            </div>
            <div class="form-group col-3">
                <label for="numero_agencia">Numero da agência:</label>
                <input type="text" id="numero_agencia" name="numero_agencia" class="form-control" required>
            </div>
            <div class="form-group col-3 rowButtons">
                <input type="submit" value="Cadastrar" class="btn btn-primary">
            </div>
        </form>
    </div>
    <?=template_footer()?>
</body>

</html>