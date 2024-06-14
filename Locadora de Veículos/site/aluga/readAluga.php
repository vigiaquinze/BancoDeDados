<?php
include '../functions.php';

// Conectar ao banco de dados PostgreSQL
$pdo = pdo_connect_pgsql();
// Obter a página via solicitação GET (parâmetro URL: page), se não existir, defina a página como 1 por padrão
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
// Número de registros para mostrar em cada página
$records_per_page = 10;

// Preparar a instrução SQL e obter registros da tabela clientes com os carros alugados
$stmt = $pdo->prepare('SELECT locacao.id_locacao, clientes.nome AS cliente_nome, carro.modelo, carro.placa, locacao.data_locacao, locacao.data_devolucao 
                        FROM locacao 
                        INNER JOIN clientes ON locacao.id_cliente = clientes.id_cliente 
                        INNER JOIN carro ON locacao.id_carro = carro.id_carro
                        ORDER BY clientes.id_cliente OFFSET :offset LIMIT :limit');
$stmt->bindValue(':offset', ($page - 1) * $records_per_page, PDO::PARAM_INT);
$stmt->bindValue(':limit', $records_per_page, PDO::PARAM_INT);
$stmt->execute();
// Buscar os registros para exibi-los em nosso modelo.
$alugueis = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Obter o número total de registros, isso é para determinar se deve haver um botão de próxima e anterior
$num_records = $pdo->query('SELECT COUNT(*) FROM locacao')->fetchColumn();

?>

<head>
    <?= template_head2("Listar Clientes e Carros Alugados") ?>
</head>

<body>
    <?= template_header2() ?>
    <div class="content col-6 listar justify-content-center">
        <table class="table">
            <thead>
                <tr>
                    <th>Nome do cliente</th>
                    <th>Modelo</th>
                    <th>Placa</th>
                    <th>Data de Início</th>
                    <th>Data de Fim</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($alugueis as $aluguel) : ?>
                    <tr>
                        <td><?= $aluguel['cliente_nome'] ?></td>
                        <td><?= $aluguel['modelo'] ?></td>
                        <td><?= $aluguel['placa'] ?></td>
                        <td><?= $aluguel['data_locacao'] ?></td>
                        <td><?= $aluguel['data_devolucao'] ?></td>
                        <td class="actions">
                            <a href="updateAluga.php?id_locacao=<?= $aluguel['id_locacao'] ?>" class="edit"><i class="fas fa-pen fa-xs"></i></a>
                            <a href="deleteAluga.php?id_locacao=<?= $aluguel['id_locacao'] ?>" class="trash"><i class="fas fa-trash fa-xs"></i></a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <div class="pagination">
            <?php if ($page > 1) : ?>
                <a href="readAluga.php?page=<?= $page - 1 ?>"><i class="fas fa-angle-double-left fa-sm"></i></a>
            <?php endif; ?>
            <?php if ($page * $records_per_page < $num_records) : ?>
                <a href="readAluga.php?page=<?= $page + 1 ?>"><i class="fas fa-angle-double-right fa-sm"></i></a>
            <?php endif; ?>
        </div>
    </div>
    <?= template_footer() ?>
</body>

</html>