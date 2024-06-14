<?php
    include 'functions.php';
?>

<head>
    <?=template_head("Administração")?>
</head>
<body>
    <?=template_header2()?>
    <div class="col-6 justify-content-center margin0">
        <h1 style="margin: 0px auto; width: 100%; text-align: center; margin-top: 80px;">Área do administrador</h1>
        <h2 style="margin: 0px auto; width: 100%; text-align: center; margin-top: 80px;">Área de clientes</h2>
        <div class="col smallPage justify-content-center">
            <a href="clientes/cadastroCliente.php">
                <button class="btn btn-primary">
                    <h4>Cadastrar cliente</h4>
                </button>
                <p>Cadastre um novo cliente para a lista de clientes.</p>
            </a>
            <a href="clientes/listarClientes.php">
                <button class="btn btn-secondary">
                    <h4>Listar clientes</h4>
                </button>
                <p>Lista com todos os clientes cadastrados no nosso banco de dados.</p>
            </a>
            <a href="clientes/buscarCliente.php">
                <button class="btn btn-info">
                    <h4>Pesquisar um cliente específico</h4>
                </button>
            <p>Busque e edite ou apague um cliente específico cadastrado em nosso banco de dados.</p>
            </a>
        </div>
        <br>
        <h2 style="margin: 0px auto; width: 100%; text-align: center; margin-top: 80px;">Área de carros</h2>
        <div class="col smallPage justify-content-center">
            <a href="carros/cadastroCarro.php">
                <button class="btn btn-primary">
                    <h4>Cadastrar carro</h4>
                </button>
                <p>Cadastre um novo carro para a lista de carros.</p>
            </a>
            <a href="carros/listarCarros.php">
                <button class="btn btn-secondary">
                    <h4>Listar carros</h4>
                </button>
                <p>Lista com todos os carros cadastrados no nosso banco de dados.</p>
            </a>
            <a href="carros/buscarCarro.php">
                <button class="btn btn-info">
                    <h4>Pesquisar um carro específico</h4>
                </button>
            <p>Busque e edite ou apague um carro específico cadastrado em nosso banco de dados.</p>
            </a>
        </div>
        <br>
        <h2 style="margin: 0px auto; width: 100%; text-align: center; margin-top: 80px;">Área de alugueis</h2>
        <div class="col smallPage justify-content-center">
            <a href="aluga/createAluga.php">
                <button class="btn btn-primary">
                    <h4>Cadastrar aluguel</h4>
                </button>
                <p>Cadastre um novo carro para a lista de aluguéis.</p>
            </a>
            <a href="aluga/readAluga.php">
                <button class="btn btn-secondary">
                    <h4>Listar aluguéis</h4>
                </button>
                <p>Lista com todos os aluguéis cadastrados no nosso banco de dados.</p>
            </a>
            <a href="aluga/searchAluga.php">
                <button class="btn btn-info">
                    <h4>Pesquisar um aluguel específico</h4>
                </button>
            <p>Busque e edite ou apague um aluguel específico cadastrado em nosso banco de dados.</p>
            </a>
        </div>
    </div>
    <?=template_footer()?>
</body>
</html>