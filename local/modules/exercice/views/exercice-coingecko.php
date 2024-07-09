<link rel="stylesheet" href="<?= WEBSITE_URL ?>/public/css/exercice.css">
<div class="body-content">
    <div class="container">
        <pre>
            <?php print_r($this->view['test']);
                $apiKey = 'CG-m5vvXranWNDwoM1JwKa12xjW';
                $url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=100&x_cg_demo_api_key=$apiKey";
                $url_usd = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&x_cg_demo_api_key=$apiKey";
                $data = file_get_contents($url);
                $data_usd = file_get_contents($url_usd);
                $cryptos = json_decode($data, true);
                $cryptos_usd = json_decode($data_usd, true);
            ?>
        </pre>
        <table class="crypto-table">
            <thead>
                <tr>
                    <th>Classement</th>
                    <th>Logo</th>
                    <th>Nom de la crypto</th>
                    <th>Symbol</th>
                    <th>Prix en euro</th>
                    <th>Prix en dollar</th>
                    <th>Variation du prix sur 24h</th>
                    <th>Variation du prix sur 7 jours</th>
                    <th>Variation du prix sur 30 jours</th>
                    <th>Courbe</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($cryptos as $index => $crypto): ?>
                    <?php $rank = $index + 1; ?>
                    <tr>
                        <td><?= $rank ?></td>
                        <td><img src="<?= $crypto['image'] ?>" alt="<?= $crypto['name'] ?>" class="crypto-logo"></td>
                        <td><?= $crypto['name'] ?></td>
                        <td><?= $crypto['symbol'] ?></td>
                        <td><?= number_format($crypto['current_price'], 2, ',', ' ') ?> €</td>
                        <td><?= number_format($cryptos_usd[$index]['current_price'], 2, ',', ' ') ?> $</td>
                        <td><?= number_format($crypto['price_change_percentage_24h'], 2) ?> %</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>