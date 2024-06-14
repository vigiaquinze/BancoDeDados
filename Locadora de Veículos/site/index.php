<?php
include 'functions.php';
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<?= template_head("MovelCar") ?>
</head>

<body>
    <!-- Navbar -->
    <?= template_header() ?>

    <!-- Jumbotron -->
    <div class="jumbotron jumbotron-fluid text-center text-white">
        <div class="container">
            <h1 class="display-3" style="font-weight: 600;">Bem-vindo à MovelCar</h1>
            <p class="lead">Encontre o carro perfeito para sua viagem.</p>
        </div>
    </div>

    <!-- Cars Section -->
    <div class="container" id="cars">
        <h2 class="text-center my-4">Alguns dos nossos carros</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <img src="https://revistacarro.com.br/wp-content/uploads/2023/12/FiatTitano.jpg"
                        class="card-img-top" alt="Fiat Titano">
                    <div class="card-body">
                        <h5 class="card-title" style="font-weight: 900;">Fiat Titano</h5>
                        <p class="card-text">O Fiat Titano é um SUV de médio porte projetado para oferecer uma
                            combinação ideal de conforto, desempenho e tecnologia. Com um design robusto e
                            contemporâneo, o Titano se destaca tanto nas ruas urbanas quanto nas estradas mais
                            desafiadoras.</p>
                        <a href="#" class="btn btn-primary">Ver mais</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <img src="https://portallubes.com.br/wp-content/uploads/2020/10/fiat-suv-projecao.jpg"
                        class="card-img-top" alt="Fiat SUV">
                    <div class="card-body">
                        <h5 class="card-title" style="font-weight: 900;">Fiat SUV</h5>
                        <p class="card-text">O Fiat Pulse é um SUV compacto e moderno, projetado para oferecer uma
                            experiência de condução dinâmica e confortável, ideal tanto para a cidade quanto para
                            aventuras fora dela. Com um design arrojado e sofisticado, o Pulse reflete a identidade
                            contemporânea da Fiat.</p>
                        <a href="#" class="btn btn-primary">Ver mais</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <img src="https://fotos-jornaldocarro-estadao.nyc3.cdn.digitaloceanspaces.com/wp-content/uploads/2021/12/21105422/Fiat-Uno-Ciao.jpg"
                        class="card-img-top" alt="Uno Ciao">
                    <div class="card-body">
                        <h5 class="card-title" style="font-weight: 900;">Uno Ciao</h5>
                        <p class="card-text">O Fiat Uno Ciao é uma edição limitada que homenageia o legado do Fiat Uno,
                            um dos carros mais populares e queridos do Brasil. Com um design nostálgico e uma série de
                            detalhes exclusivos, o Uno Ciao celebra o fim de uma era com estilo e personalidade.</p>
                        <a href="#" class="btn btn-primary">Ver mais</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <?= template_footer()?>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>