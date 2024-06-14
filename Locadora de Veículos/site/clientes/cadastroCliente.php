<?php
include '../functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';
// Verifica se os dados POST não estão vazios
if (!empty($_POST)) {
    // Se os dados POST não estiverem vazios, insere um novo registro
    $nome = isset($_POST['nome']) ? $_POST['nome'] : '';
    $cnh = isset($_POST['cnh']) ? $_POST['cnh'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $telefone = isset($_POST['telefone']) ? $_POST['telefone'] : '';
    $cartao = isset($_POST['cartao']) ? $_POST['cartao'] : '';
    $cidade = isset($_POST['cidade']) ? $_POST['cidade'] : '';
    $estado = isset($_POST['estado']) ? $_POST['estado'] : '';
    $endereco = isset($_POST['endereco']) ? $_POST['endereco'] : '';
    $id_pagamento = isset($_POST['id_pagamento']) ? $_POST['id_pagamento'] : '';
    
    // Insere um novo registro na tabela clientes
    try {
        $stmt = $pdo->prepare('INSERT INTO clientes (nome, cnh, email, telefone, cartao, cidade, estado, endereco, id_pagamento) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)');
        $stmt->execute([$nome, $cnh, $email, $telefone, $cartao, $cidade, $estado, $endereco, $id_pagamento]);
        $msg = 'Cliente cadastrado com Sucesso!';
    } catch (Exception $e) {
        $msg = 'Erro ao cadastrar cliente: ' . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <?= template_head2("Cadastro de cliente") ?>
</head>

<body>
    <?= template_header2() ?>
    <div class="container" id="register">
        <h2 class="text-center my-4">Cadastro de cliente</h2>
        <?php if ($msg): ?>
            <div class="alert alert-info" role="alert">
                <?= $msg ?>
            </div>
        <?php endif; ?>
        <form class="form-group justify-content-center" action="cadastroCliente.php" method="POST">
            <div class="form-group">
                <label for="nome">Nome completo:</label>
                <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome completo" required>
            </div>
            <div class="form-group">
                <label for="cnh">CNH:</label>
                <input type="text" class="form-control" id="cnh" name="cnh" placeholder="CNH" required>
            </div>
            <div class="form-group">
                <label for="email">E-mail:</label>
                <input type="text" class="form-control" id="email" name="email" placeholder="E-mail" required>
            </div>
            <div class="form-group">
                <label for="telefone">Telefone:</label>
                <input type="text" class="form-control" id="telefone" name="telefone" placeholder="Telefone" required>
            </div>
            <div class="form-group">
                <label for="cartao">Cartão de Crédito/Débito:</label>
                <input type="text" class="form-control" id="cartao" name="cartao" placeholder="Cartão de Crédito/Débito" required>
            </div>
            <div class="form-group">
                <label for="cidade">Cidade:</label>
                <input type="text" class="form-control" id="cidade" name="cidade" placeholder="Cidade" required>
            </div>
            <div class="form-group">
                <label for="estado">UF:</label>
                <input type="text" class="form-control" id="estado" name="estado" placeholder="UF" required>
            </div>
            <div class="form-group">
                <label for="endereco">Endereço:</label>
                <input type="text" class="form-control" id="endereco" name="endereco" placeholder="Endereço" required>
            </div>
            <div class="form-group">
                <label for="id_pagamento">Id. do Pagamento:</label>
                <input type="text" class="form-control" id="id_pagamento" name="id_pagamento" placeholder="Id. do Pagamento">
            </div>
            <div class="rowButtons">
                <input type="submit" class="btn btn-primary" value="Cadastrar">
            </div>
        </form>
    </div>
    <?= template_footer() ?>
</body>

</html>
