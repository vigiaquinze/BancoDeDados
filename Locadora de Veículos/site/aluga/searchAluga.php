<?php
include '../functions.php';

// Conectar ao banco de dados PostgreSQL
$pdo = pdo_connect_pgsql();
// Obter a página via solicitação GET (parâmetro URL: page), se não existir, defina a página como 1 por padrão
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
// Número de registros para mostrar em cada página
$records_per_page = 8;

$data_devolucao = '';
$data_locacao = '';

if (isset($_GET['data_locacao']) && isset($_GET['data_devolucao'])) {
    $data_locacao = $_GET['data_locacao'];
    $data_devolucao = $_GET['data_devolucao'];
    $sql = 'SELECT locacao.id_locacao, clientes.nome AS cliente_nome, carro.modelo, carro.placa, locacao.data_locacao, locacao.data_devolucao FROM locacao 
    INNER JOIN clientes ON locacao.id_cliente = clientes.id_cliente 
    INNER JOIN carro ON locacao.id_carro = carro.id_carro
    WHERE data_locacao >= :data_locacao AND data_devolucao <= :data_devolucao ORDER BY data_locacao OFFSET :offset LIMIT :limit';
} else {
    $sql = 'SELECT locacao.id_locacao, clientes.nome AS cliente_nome, carro.modelo, carro.placa, locacao.data_locacao, locacao.data_devolucao FROM locacao 
    INNER JOIN clientes ON locacao.id_cliente = clientes.id_cliente 
    INNER JOIN carro ON locacao.id_carro = carro.id_carro
    ORDER BY id_locacao OFFSET :offset LIMIT :limit';
}

$stmt = $pdo->prepare($sql);

if (isset($_GET['data_locacao']) && isset($_GET['data_devolucao'])) {
    $stmt->bindParam(':data_locacao', $data_locacao);
    $stmt->bindParam(':data_devolucao', $data_devolucao);
}
$stmt->bindValue(':offset', ($page - 1) * $records_per_page, PDO::PARAM_INT);
$stmt->bindValue(':limit', $records_per_page, PDO::PARAM_INT);
$stmt->execute();
$alugueis = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Obter o número total de registros, isso é para determinar se deve haver um botão de próxima e anterior
$num_alugueis = $pdo->query('SELECT COUNT(*) FROM locacao')->fetchColumn();
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <?= template_head2("Listar Aluguéis") ?>
</head>

<body>
    <?= template_header2() ?>
    <div class="content col-6 listar justify-content-center">
        <form action="searchAluga.php" method="get">
            <label for="data_locacao">Data Início:</label>
            <input type="date" name="data_locacao" id="data_locacao" value="<?= isset($_GET['data_locacao']) ? $_GET['data_locacao'] : '' ?>">
            <label for="data_devolucao">Data Fim:</label>
            <input type="date" name="data_devolucao" id="data_devolucao" value="<?= isset($_GET['data_devolucao']) ? $_GET['data_devolucao'] : '' ?>">
            <div class="rowButtons">
                <input type="submit" value="Filtrar" class="btn btn-primary">
            </div>
        </form>

        <table class="table">
            <thead>
                <tr>
                    <th>Id do Aluguel</th>
                    <th>Nome do cliente</th>
                    <th>Modelo</th>
                    <th>Placa</th>
                    <th>Data de Início</th>
                    <th>Data de Fim</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($alugueis as $aluguel) : ?>
                    <tr>
                        <td><?= $aluguel['id_locacao'] ?></td>
                        <td><?= $aluguel['cliente_nome'] ?></td>
                        <td><?= $aluguel['modelo'] ?></td>
                        <td><?= $aluguel['placa'] ?></td>
                        <td><?= $aluguel['data_locacao'] ?></td>
                        <td><?= $aluguel['data_devolucao'] ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <div class="pagination">
            <?php if ($page > 1) : ?>
                <a href="searchAluga.php?page=<?= $page - 1 ?>&data_locacao=<?= urlencode(isset($_GET['data_locacao']) ? $_GET['data_locacao'] : '') ?>&data_devolucao=<?= urlencode(isset($_GET['data_devolucao']) ? $_GET['data_devolucao'] : '') ?>"><i class="fas fa-angle-double-left fa-sm"></i></a>
            <?php endif; ?>
            <?php if ($page * $records_per_page < $num_alugueis) : ?>
                <a href="searchAluga.php?page=<?= $page + 1 ?>&data_locacao=<?= urlencode(isset($_GET['data_locacao']) ? $_GET['data_locacao'] : '') ?>&data_devolucao=<?= urlencode(isset($_GET['data_devolucao']) ? $_GET['data_devolucao'] : '') ?>"><i class="fas fa-angle-double-right fa-sm"></i></a>
            <?php endif; ?>
        </div>
    </div>
    <?= template_footer() ?>
</body>

</html>