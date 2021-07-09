<?php

session_start();
echo $_SESSION["name"];

// sesssionチェック
if (
  !isset($_SESSION['chk_ssid']) ||
  $_SESSION["chk_ssid"] != session_id()
) {
    echo "login Error";
    exit();
}



//1.  DB接続します xxxにDB名を入れます
try {
$pdo = new PDO('mysql:dbname=a_db;charset=utf8;host=localhost','root','root');
} catch (PDOException $e) {
  exit('データベースに接続できませんでした。'.$e->getMessage());
}

//２．データ登録SQL作成
//作ったテーブル名を書く場所  xxxにテーブル名を入れます
$stmt = $pdo->prepare("SELECT * FROM gs_user_table");
$status = $stmt->execute();

//３．データ表示
$view="";
if($status==false){
  //execute（SQL実行時にエラーがある場合）
  $error = $stmt->errorInfo();
  exit("ErrorQuery:".$error[2]);
}else{
  //Selectデータの数だけ自動でループしてくれる $resultの中に「カラム名」が入ってくるのでそれを表示させる例
  while( $result = $stmt->fetch(PDO::FETCH_ASSOC)){
    $view .= "<p>";
    $view .= '<a href="detail.php?id='.$result["id"].'">';
    // $view .= $result["id"]."：".$result["u_name"]." / ";
    $view .= $result["indate"]."："."◆".$result["u_name"]." / ";
    $view .= "email:".$result["email"]." / ";
    $view .= "ユーザID:".$result["u_id"]." / ";
    // $view .= "ユーザPASS:".$result["u_pw"]." / ";
    // $view .= "感想:".$result["naiyou"]." / ";
    $view .= '</a>';
//削除用
    $view .= '';
    $view .= '<a href="delete.php?id='.$result["id"].'">';
    $view .= '【削除】';
    $view .= '</a>';

    $view .= "</p>";
  }

}
?>


<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ドラ●もんキャラゲーム登録データ表示</title>
<link rel="stylesheet" href="css/range.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>div{padding: 10px;font-size:16px;}</style>
</head>
<body id="main">
<!-- Head[Start] -->
<header>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
      <!-- <a class="navbar-brand" href="index.php">ユーザ用データ登録</a> -->
      <a class="navbar-brand" href="logout.php">ログアウト</a>
      </div>
    </div>
  </nav>
</header>
<!-- Head[End] -->

<!-- Main[Start] $view-->
<div>
    <h2>【ドラ●もんキャラゲーム登録ユーザ情報一覧】</h2>
    <div class="container jumbotron"><?=$view?></div>
</div>
<!-- Main[End] -->

</body>
</html>


