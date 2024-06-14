<?php
include '../functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';

// Verifica se o ID do cliente existe
if (isset($_GET['id_cliente'])) {
    if (!empty($_POST)) {
        // Atualiza o registro
        $nome = isset($_POST['nome']) ? $_POST['nome'] : '';
        $cnh = isset($_POST['cnh']) ? $_POST['cnh'] : '';
        $email = isset($_POST['email']) ? $_POST['email'] : '';
        $telefone = isset($_POST['telefone']) ? $_POST['telefone'] : '';
        $cartao = isset($_POST['cartao']) ? $_POST['cartao'] : '';
        $cidade = isset($_POST['cidade']) ? $_POST['cidade'] : '';
        $estado = isset($_POST['estado']) ? $_POST['estado'] : '';
        $endereco = isset($_POST['endereco']) ? $_POST['endereco'] : '';
        $id_pagamento = isset($_POST['id_pagamento']) ? $_POST['id_pagamento'] : '';
        
        try {
            $stmt = $pdo->prepare('UPDATE clientes SET nome = ?, cnh = ?, email = ?, telefone = ?, cartao = ?, cidade = ?, estado = ?, endereco = ?, id_pagamento = ? WHERE id_cliente = ?');
            $stmt->execute([$nome, $cnh, $email, $telefone, $cartao, $cidade, $estado, $endereco, $id_pagamento, $_GET['id_cliente']]);
            $msg = 'Atualização Realizada com Sucesso!';
        } catch (Exception $e) {
            $msg = 'Erro ao atualizar cliente: ' . $e->getMessage();
        }
    }

    // Obter o cliente da tabela clientes
    $stmt = $pdo->prepare('SELECT * FROM clientes WHERE id_cliente = ?');
    $stmt->execute([$_GET['id_cliente']]);
    $cliente = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$cliente) {
        exit('Cliente não localizado!');
    }
} else {
    exit('Nenhum cliente especificado!');
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <?= template_head2("Editando cliente") ?>
</head>

<body>
    <?= template_header2() ?>
    <div class="content update">
        <h2 class="text-center my-4">Editando <?=$cliente['nome']?></h2>
        <?php if ($msg): ?>
            <div class="alert alert-info" role="alert">
                <?= $msg ?>
            </div>
        <?php endif; ?>
        <form action="editarCliente.php?id_cliente=<?=$cliente['id_cliente']?>" method="post">
            <div class="form-group">
                <label for="nome">Nome completo:</label>
                <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome completo" value="<?=$cliente['nome']?>" required>
            </div>
            <div class="form-group">
                <label for="cnh">CNH:</label>
                <input type="text" class="form-control" id="cnh" name="cnh" placeholder="CNH" value="<?=$cliente['cnh']?>" required>
            </div>
            <div class="form-group">
                <label for="email">E-mail:</label>
                <input type="text" class="form-control" id="email" name="email" placeholder="E-mail" value="<?=$cliente['email']?>" required>
            </div>
            <div class="form-group">
                <label for="telefone">Telefone:</label>
                <input type="text" class="form-control" id="telefone" name="telefone" placeholder="Telefone" value="<?=$cliente['telefone']?>" required>
            </div>
            <div class="form-group">
                <label for="cartao">Cartão de Crédito/Débito:</label>
                <input type="text" class="form-control" id="cartao" name="cartao" placeholder="Cartão de Crédito/Débito" value="<?=$cliente['cartao']?>" required>
            </div>
            <div class="form-group">
                <label for="cidade">Cidade:</label>
                <input type="text" class="form-control" id="cidade" name="cidade" placeholder="Cidade" value="<?=$cliente['cidade']?>" required>
            </div>
            <div class="form-group">
                <label for="estado">UF:</label>
                <input type="text" class="form-control" id="estado" name="estado" placeholder="UF" value="<?=$cliente['estado']?>" required>
            </div>
            <div class="form-group">
                <label for="endereco">Endereço:</label>
                <input type="text" class="form-control" id="endereco" name="endereco" placeholder="Endereço" value="<?=$cliente['endereco']?>" required>
            </div>
            <div class="form-group">
                <label for="id_pagamento">Id. do Pagamento:</label>
                <input type="text" class="form-control" id="id_pagamento" name="id_pagamento" placeholder="Id. do Pagamento" value="<?=$cliente['id_pagamento']?>">
            </div>
            <div class="rowButtons">
                <input type="submit" class="btn btn-primary" value="Atualizar">
            </div>
        </form>
    </div>
    <?= template_footer() ?>
</body>

</html>
