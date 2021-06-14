<?php

$hands = ['ジャイア●','●太','ドラ●もん'];

if(isset($_POST['playerHand'])){
    $playerHand = $_POST['playerHand'];

    // $num = 0;
    // $win = 0;
    // $lose = 0;

    $key = array_rand($hands);
    $pcHand = $hands[$key];

    if($playerHand == $pcHand){
        $shobu = '『引き分け』'.'<br/>'.'<img src="https://wowcar.jp/wp-content/uploads/2020/08/dora.jpg" width="500" >';
    } else if($playerHand == 'ジャイア●' && $pcHand == '●太'){
        $shobu = '『あなた(ジャイア●)の勝ち』'.'<br/>'.'<img src="https://i.pinimg.com/originals/6e/6d/68/6e6d68fa78474b91afb45e226e95cedf.png" width="350" >'.
        '<img src="https://pbs.twimg.com/media/C-qgShiUIAAkrdu.jpg" width="400" >'.'<br/>'.'●太をイジメるな！';
    } else if($playerHand == '●太' && $pcHand == 'ドラ●もん'){
        $shobu = '『あなた(●太)の勝ち』'.'<br/>'.'<img src="https://pics.prcm.jp/c18a1b4179a0f/84480670/jpeg/84480670_220x220.jpeg" width="300">'.
        '<img src="https://pics.prcm.jp/3679b25f5a1c3/84975790/jpeg/84975790_220x220.jpeg" width="300">'.'<br/>'.'ドラ●もんは●太に頼られると弱いよ😉';
    } else if($playerHand == 'ドラ●もん' && $pcHand == 'ジャイア●'){
        $shobu = '『あなた(ドラ●もん)の勝ち』'.'<br/>'.'<img src="https://www.takaratomy.co.jp/products/kurohige/doraemon/img/img_index01.png" width="250">'.
        '　　'.'<img src="http://d2dcan0armyq93.cloudfront.net/photo/odai/400/74e2abc145f2ece06b881ffe3b668012_400.jpg" width="350">'.'<br/>'.'力勝負のジャイア●は未来道具には勝てない😊！';
    } else if($playerHand == '●太' && $pcHand == 'ジャイア●'){
        $shobu = '『あなた(●太)の負け』'.'<br/>'.'<img src="https://i.pinimg.com/originals/6e/6d/68/6e6d68fa78474b91afb45e226e95cedf.png" width="350">'.
        '　　'.'<img src="https://pics.prcm.jp/a3ab22b4897b0/70878567/jpeg/70878567_220x210.jpeg" width="350">'.'<br/>'.'●太をイジメるな😂！';
    } else if($playerHand == 'ドラ●もん' && $pcHand == '●太'){
        $shobu = '『あなた(ドラ●もん)の負け』'.'<br/>'.'<img src="https://pics.prcm.jp/c18a1b4179a0f/84480670/jpeg/84480670_220x220.jpeg" width="300">'.
        '<img src="https://pics.prcm.jp/3679b25f5a1c3/84975790/jpeg/84975790_220x220.jpeg" width="300">'.'<br/>'.'ドラ●もんは●太に頼られると弱いよ😱';
    } else if($playerHand == 'ジャイア●' && $pcHand == 'ドラ●もん'){
        $shobu = '『あなた(ジャイア●)の負け』'.'<br/>'.'<img src="https://www.takaratomy.co.jp/products/kurohige/doraemon/img/img_index01.png" width="250">'.
        '　　'.'<img src="http://d2dcan0armyq93.cloudfront.net/photo/odai/400/74e2abc145f2ece06b881ffe3b668012_400.jpg" width="350">'.'<br/>'.'力勝負のジャイア●は未来道具には勝てない😌！';
    }
}

?>

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
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ドラ●もんキャラゲーム</title>
    <link rel="stylesheet" href="style.css" type="text/css" />
    <link rel="stylesheet" href="style.css?v=2" type="text/css" />
</head>
<body>
<div id="wrapper">
    <header>
    <div class="header-logo"><?= $logo ?>ドラ●もんキャラゲーム</div>
    </header>
    <main>
        <h2 class="pc">コンピューター：<?= htmlspecialchars($pcHand, ENT_QUOTES); ?></h2><br>
        <h1 class="res">結果は・・・<?= $shobu ?></h1>
        <h3>あなた：<?= htmlspecialchars($playerHand, ENT_QUOTES); ?></h3><br>
        <div class="shobu-box">
            <p><a class="red" href="index.php">>>もう一回勝負する</a></p>
        </div>
    </main>
    <footer>
        <p class="footer2">💡勝敗を分ける力関係 👉 [ジャイア● ＞ ●太、 ドラ●もん ＞ ジャイア●、 ●太 ＞ ドラ●もん]</p>
        <p class="subfooter2">🎈ミニゲームの答え🎈：タイトルアイコン箇所</p>
    </footer>
</div>
</body>
</html>
