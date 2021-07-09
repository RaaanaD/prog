<?php
//関数を定義
$d = date("s");
if($d <= 20){
    $logo = '<img class="logo" src="https://pbs.twimg.com/media/DORlWt1VwAA-VKN.jpg:small" width="40">';
}else if($d >= 20 && $d <= 40){
    $logo = '<img class="logo" src="https://i.pinimg.com/originals/52/dc/7c/52dc7c7ecfa7810567e36d06ed351a44.png" width="40">';
}else{
    $logo = '<img class="logo" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCZVKkzYXskeFvyNXnVyNRQ6-r4cY4C7TQGr6uDHgWCoVyk_WZaYNraxA0QNuWO6pSSHE&usqp=CAU" width="40">';
}
?>

<!DOCTYPE html>
<html>
<html lang="ja">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ドラ●もんキャラゲーム</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <link rel="stylesheet" href="css/style.css?v=2" type="text/css" />
</head>
<body>
<div id="wrapper">
    <header>
        <div class="header-logo"><?= $logo ?>ドラ●もんキャラゲーム</div>
    </header>
    <main>
    <!-- <?= $u_name ?> -->
        <h1>ドラ●もんキャラゲーム！</h1>
        <p class="subtitle">ドラ●もんキャラでランダムコンピュータと勝負😄</p>

        <div class="form-box">
            <form action="game2.php" method="post">
                <label>
                    <input type="radio" title="playerHand" name="playerHand" value="ジャイア●"  class="radio">
                    <img src="https://lh6.googleusercontent.com/proxy/hDdIenOmcVQHqCpyMfCyFBPhi_RvsaPKRcCACn75EEUjf22G7BEm0Yewm7dy94Nkh8XwHpOscGkqGJ4j4BYLIBJhX5HYu6YE59rIcNMcGGLejg=s0-d" width="250" class="radio_image">
                </label>
                <label>
                    <input type="radio" title="playerHand" name="playerHand" value="●太" class="radio">
                    <img src="https://i-ogp.pximg.net/c/540x540_70/img-master/img/2007/11/26/11/04/21/195530_p0_square1200.jpg"  width="250" class="radio_image">
                </label>
                <label>
                    <input type="radio" title="playerHand" name="playerHand" value="ドラ●もん" class="radio">
                    <img src="https://i.pinimg.com/originals/52/dc/7c/52dc7c7ecfa7810567e36d06ed351a44.png" width="220" class="radio_image">.<br/>
                </label>
                <div class="item">
                <ul class="item">
                    <li class="items"><p class="items">ジャイア●</p></li>
                    <li class="items"><p class="items">●太</p></li>
                    <li class="items"><p class="items">ドラ●もん</p></li>
                </ul></div><br/>
                <button type="submit" class="battle-button">勝負する！</button>
            </form>
        </div>

    </main>
    <footer>
        <p class="footer">ジャイア●、●太、ドラ●もんで好きなドラ●もんキャラを選択して、ランダムコンピューターと勝負しよう！</p>
        <p class="subfooter">🎈ミニゲーム🎈：変更箇所を探せ！時間が経つと本ページの中で変わっている所を見つけよう！</p>
    </footer>
</div>
</body>
</html>

