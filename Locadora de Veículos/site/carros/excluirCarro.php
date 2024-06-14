<?php
include '../functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';
// Verifica se o ID do carro existe
if (isset($_GET['id_carro'])) {
    // Seleciona o registro que será deletado
    $stmt = $pdo->prepare('SELECT * FROM carro WHERE id_carro = ?');
    $stmt->execute([$_GET['id_carro']]);
    $carro = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$carro) {
        exit('Carro Não Localizado!');
    }
    // Certifique-se de que o usuário confirma antes da exclusão
    if (isset($_GET['confirm'])) {
        if ($_GET['confirm'] == 'yes') {
            // O usuário clicou no botão "Sim", deleta o registro
            $stmt = $pdo->prepare('DELETE FROM carro WHERE id_carro = ?');
            $stmt->execute([$_GET['id_carro']]);
            $msg = 'Carro Apagado com Sucesso!';
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
    <?= template_head2("Exclusão de carro") ?>
</head>

<body>
    <?= template_header2() ?>
<div class="content col-6 listar justify-content-center" style="height: 70vh">
	<h2>Apagar <?=$carro['nome']?></h2>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php else: ?>
	<p>Você tem certeza que deseja apagar o carro <?=$carro['nome']?>?</p>
    <div class="yesno">
        <a href="excluirCarro.php?id_carro=<?=$carro['id_carro']?>&confirm=yes"><button class="btn btn-primary">Sim</button></a>
        <a href="excluirCarro.php?id_carro=<?=$carro['id_carro']?>&confirm=no"><button class="btn btn-secondary">Não</button></a>
    </div>
    <?php endif; ?>
</div>
<?= template_footer() ?>
</body>
