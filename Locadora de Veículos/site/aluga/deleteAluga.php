<?php
include '../functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';
// Verifica se o ID do contato existe
if (isset($_GET['id_locacao'])) {
    // Seleciona o registro que será deletado
    $stmt = $pdo->prepare('SELECT * FROM locacao WHERE id_locacao = ?');
    $stmt->execute([$_GET['id_locacao']]);
    $contact = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$contact) {
        exit('Carro não encontrado!');
    }
    // Certifique-se de que o usuário confirma antes da exclusão
    if (isset($_GET['confirm'])) {
        if ($_GET['confirm'] == 'yes') {
            // O usuário clicou no botão "Sim", deleta o registro
            try {
                $stmt = $pdo->prepare('DELETE FROM locacao WHERE id_locacao = ?');
                $stmt->execute([$_GET['id_locacao']]);

                $stmt = $pdo->prepare('UPDATE carros SET disponibilidade = "Disponível" WHERE id_carro = ?');
                $stmt->execute([$contact['id_carro']]);
                $msg = 'Registro de aluguel apagado com Sucesso!';
                $button = '<a href="readAluga.php" class="create-contact">Voltar</a>';
            } catch (Exception $e) {
                $msg = 'Erro ao deletar o registro';
                print($e);
            }
        } else {
            // O usuário clicou no botão "Não", redireciona de volta para a página de leitura
            header('Location: readAluga.php');
            exit;
        }
    }
} else {
    exit('Nenhum ID especificado!');
}
?>

<head>
    <?= template_head2("Deletar Carros") ?>
</head>

<body>

    <?= template_header2() ?>
    <?= voltar("indexAluga.php") ?>
    <div class="container smallPage">
        <h2>Excluir registro <?= $contact['id_locacao'] ?></h2>
        <?php if ($msg && $button) : ?>
            <p><?= $msg ?></p>
            <div><?= $button ?></div>
        <?php else : ?>
            <p>Você tem certeza que deseja apagar o registro de aluguel <?= $contact['id_locacao'] ?>?</p>
            <div class="yesno">
                <a href="deleteAluga.php?id_locacao=<?= $contact['id_locacao'] ?>&confirm=yes">Sim</a>
                <a href="deleteAluga.php?id_locacao=<?= $contact['id_locacao'] ?>&confirm=no">Não</a>
            </div>
        <?php endif; ?>
    </div>

</body>

</html>


<?= template_footer() ?>