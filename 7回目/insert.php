<?php
//1. POSTデータ取得

//まず前のphpからデーターを受け取る（この受け取ったデータをもとにbindValueと結びつけるため）
$u_name = $_POST["u_name"];
$u_id = $_POST["u_id"];
$u_pw = $_POST["u_pw"];
// $naiyou = $_POST["naiyou"];
// $animal = $_POST["animal"];
// $rank = $_POST["rank"];
// $life_flg = $_POST["life_flg"];

//2. DB接続します xxxにDB名を入力する
//ここから作成したDBに接続をしてデータを登録します xxxxに作成したデータベース名を書きます
// mamppの方は
// $pdo = new PDO('mysql:dbname=xxx;charset=utf8;host=localhost', 'root', 'root');

try {
    $pdo = new PDO('mysql:dbname=a_db;charset=utf8;host=localhost', 'root', 'root');
} catch (PDOException $e) {
    exit('DbConnectError:'.$e->getMessage());
}


//３．データ登録SQL作成 //ここにカラム名を入力する
//xxx_table(テーブル名)はテーブル名を入力します
// $stmt = $pdo->prepare("INSERT INTO gs_user_table(id, u_name, u_id, u_pw, life_flg, indate)
$stmt = $pdo->prepare("INSERT INTO gs_user_table(id, u_name, u_id, u_pw, indate)
VALUES(NULL, :u_name, :u_id, :u_pw, sysdate())");
$stmt->bindValue(':u_name', $u_name, PDO::PARAM_STR);//Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':u_id', $u_id, PDO::PARAM_STR);//Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':u_pw', $u_pw, PDO::PARAM_STR);
// $stmt->bindValue(':naiyou', $naiyou, PDO::PARAM_STR);
// $stmt->bindValue(':animal', $animal, PDO::PARAM_INT);
// $stmt->bindValue(':rank', $rank, PDO::PARAM_INT);
$status=$stmt->execute();

//４．データ登録処理後
if ($status==false) {
    //SQL実行時にエラーがある場合（エラーオブジェクト取得して表示）
    $error = $stmt->errorInfo();
    exit("QueryError:".$error[2]);
} else {
    //５．index.phpへリダイレクト 書くときにLocation: in この:　のあとは半角スペースがいるので注意！！
    header("Location: select.php");
    exit;
}