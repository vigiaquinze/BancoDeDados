<?php
include '../functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';
// Verifica se o ID do cliente existe
if (isset($_GET['id_cliente'])) {
    // Seleciona o registro que será deletado
    $stmt = $pdo->prepare('SELECT * FROM clientes WHERE id_cliente = ?');
    $stmt->execute([$_GET['id_cliente']]);
    $cliente = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$cliente) {
        exit('Cliente Não Localizado!');
    }
    // Certifique-se de que o usuário confirma antes da exclusão
    if (isset($_GET['confirm'])) {
        if ($_GET['confirm'] == 'yes') {
            // O usuário clicou no botão "Sim", deleta o registro
            $stmt = $pdo->prepare('DELETE FROM clientes WHERE id_cliente = ?');
            $stmt->execute([$_GET['id_cliente']]);
            $msg = 'Cliente Apagado com Sucesso!';
        } else {
            // O usuário clicou no botão "Não", redireciona de volta para a página de leitura
            header('Location: read.php');
            exit;
        }
    }
} else {
    exit('Nenhum ID especificado!');
}
?>

<head>
    <?= template_head2("Exclusão de cliente") ?>
</head>

<body>
    <?= template_header2() ?>
<div class="content col-6 listar justify-content-center" style="height: 70vh">
	<h2>Apagar <?=$cliente['nome']?></h2>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php else: ?>
	<p>Você tem certeza que deseja apagar o cliente <?=$cliente['nome']?>?</p>
    <div class="yesno">
        <a href="excluirCliente.php?id_cliente=<?=$cliente['id_cliente']?>&confirm=yes"><button class="btn btn-primary">Sim</button></a>
        <a href="excluirCliente.php?id_cliente=<?=$cliente['id_cliente']?>&confirm=no"><button class="btn btn-secondary">Não</button></a>
    </div>
    <?php endif; ?>
</div>
<?= template_footer() ?>
</body>
