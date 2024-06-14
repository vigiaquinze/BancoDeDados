<?php
include '../functions.php';
// Conectar ao banco de dados PostgreSQL
$pdo = pdo_connect_pgsql();

$tabela_resultados = "";

if (isset($_POST['cnh'])) {
    $cnh = $_POST['cnh'];
    try {
        // Consulta para buscar os carros alugados e as datas de aluguel
        $sql = "
        SELECT clientes.nome AS nome_cliente , carro.marca, carro.modelo, carro.placa, locacao.data_locacao, locacao.data_devolucao
        FROM clientes
        INNER JOIN locacao ON clientes.id_cliente = locacao.id_cliente
        INNER JOIN carro ON carro.id_carro = locacao.id_carro
        WHERE clientes.cnh = :cnh
        ";

        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':cnh', $cnh);
        $stmt->execute();

        $alugueis = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($alugueis) {
            $tabela_resultados .= "<h2>Carros locacaodos por {$alugueis[0]['nome_cliente']}:</h2>";
            $tabela_resultados .= "<table border='1'>";
            $tabela_resultados .= "<thead><tr><td>Marca</td><td>Modelo</td><td>Placa</td><td>Data de Início</td><td>Data de Fim</td></tr></thead>";

            foreach ($alugueis as $aluguel) {
                $tabela_resultados .= "<tr>";
                $tabela_resultados .= "<td>{$aluguel['marca']}</td>";
                $tabela_resultados .= "<td>{$aluguel['modelo']}</td>";
                $tabela_resultados .= "<td>{$aluguel['placa']}</td>";
                $tabela_resultados .= "<td>{$aluguel['data_locacao']}</td>";
                $tabela_resultados .= "<td>{$aluguel['data_devolucao']}</td>";
                $tabela_resultados .= "</tr>";
            }

            $tabela_resultados .= "</table>";
        } else {
            $tabela_resultados .= "Nenhum carro locacaodo por este cliente.";
        }
    } catch (PDOException $e) {
        $tabela_resultados .= "Erro: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <?= template_head2("Pesquisar Cliente") ?>
</head>

<body>
    <?= template_header2() ?>
    <div class="content read">
        <form method="post" action="buscarCliente.php" class="form-group col-3 smallPage justify-content-center">
            <label for="cnh">CNH do Cliente:</label>
            <input type="text" id="cnh" name="cnh" class="form-control" required>
            <button type="submit" class="btn btn-primary">Consultar</button>
        </form>

        <?= $tabela_resultados ?>
    </div>
    <?= template_footer() ?>
</body>

</html>