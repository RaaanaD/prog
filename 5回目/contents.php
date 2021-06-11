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
        $shobu = '『引き分け』'.'<br/>'.'<img src="https://wowcar.jp/wp-content/uploads/2020/08/dora.jpg" width="400" >';
    } else if($playerHand == 'ジャイア●' && $pcHand == '●太'){
        $shobu = '『勝ち』'.'<br/>'.'<img src="https://i.pinimg.com/originals/6e/6d/68/6e6d68fa78474b91afb45e226e95cedf.png" width="200" >'.'<br/>'.'●太をイジメるな！';
    } else if($playerHand == '●太' && $pcHand == 'ドラ●もん'){
        $shobu = '『勝ち』'.'<br/>'.'<img src="https://lh3.googleusercontent.com/proxy/IJchBWBgKH88rPTtTRvQ0eFugbmiXQVW0nqf9fEz6UHW6ZAbnsrWOH_ATO_T9imeeuXE2kQDDXDf7tJB_QbENPvZOiiOlTNBO6dEWfVELmK_BFhMq71RfrMisjohwKTw6eFnVeEwZh5wSnoz=s0-d" width="400">'.'<br/>'.'ドラ●もんは●太に頼られると弱いよ😉';
    } else if($playerHand == 'ドラ●もん' && $pcHand == 'ジャイア●'){
        $shobu = '『勝ち』'.'<br/>'.'<img src="https://www.takaratomy.co.jp/products/kurohige/doraemon/img/img_index01.png" width="200">'.'<br/>'.'力勝負のジャイア●は未来道具には勝てない😊！';
    } else if($playerHand == '●太' && $pcHand == 'ジャイア●'){
        $shobu = '『負け』'.'<br/>'.'<img src="https://i.pinimg.com/originals/6e/6d/68/6e6d68fa78474b91afb45e226e95cedf.png" width="200">'.'<br/>'.'●太をイジメるな😂！';
    } else if($playerHand == 'ドラ●もん' && $pcHand == '●太'){
        $shobu = '『負け』'.'<br/>'.'<img src="https://lh3.googleusercontent.com/proxy/IJchBWBgKH88rPTtTRvQ0eFugbmiXQVW0nqf9fEz6UHW6ZAbnsrWOH_ATO_T9imeeuXE2kQDDXDf7tJB_QbENPvZOiiOlTNBO6dEWfVELmK_BFhMq71RfrMisjohwKTw6eFnVeEwZh5wSnoz=s0-d" width="400">'.'<br/>'.'ドラ●もんは●太に頼られると弱いよ😱';
    } else if($playerHand == 'ジャイア●' && $pcHand == 'ドラ●もん'){
        $shobu = '『負け』'.'<br/>'.'<img src="https://www.takaratomy.co.jp/products/kurohige/doraemon/img/img_index01.png" width="200">'.'<br/>'.'力勝負のジャイア●は未来道具には勝てない😌！';
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf8">
    <title>ドラ●もんキャラゲーム</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div id="wrapper">
    <header>
        <div class="header-logo">ドラ●もんキャラゲーム！</div>
    </header>
    <main>
        <h2 class="pc">コンピューター：<?= $pcHand ?></h2><br>
        <h1 class="res">結果は・・・</h1>
        <div class="shobu-box">
            <p class="result-word"><?= $shobu ?></p>

            <h3>あなた：<?= $playerHand ?></h3><br>

            <p><a class="red" href="index2.php">>>もう一回勝負する</a></p>
        </div>
    </main>
    <footer>

    </footer>
</div>
</body>
</html>
