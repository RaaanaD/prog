<?php
session_start();

$lid = $_POST["lid"];
$lpw = $_POST["lpw"];


//1.  DB接続します
try {
    $pdo = new PDO('mysql:dbname=gs_db;charset=utf8;host=localhost', 'root', 'root');
} catch (PDOException $e) {
    exit('DbConnectError:'.$e->getMessage());
}


//2. データ登録SQL作成
$stmt = $pdo->prepare("SELECT * FROM gs_user_table WHERE lid=:lid AND lpw=:lpw");
$stmt->bindValue(':lid', $_POST["lid"]);
$stmt->bindValue(':lpw', $_POST["lpw"]);
$res = $stmt->execute();

//3. SQL実行時にエラーがある場合
if ($res==false) {
    // queryError($stmt);
    $error = $stmt->errorInfo();
    exit("QueryError:".$error[2]);
}

//4. 抽出データ数を取得
//$count = $stmt->fetchColumn(); //SELECT COUNT(*)で使用可能()
$val = $stmt->fetch(); //1レコードだけ取得する方法

//5. 該当レコードがあればSESSIONに値を代入 ※空っぽじゃなければ（認証がオッケーだったときに新しくセッションIDを作る）
if ($val["id"] != "") {
    $_SESSION["chk_ssid"]  = session_id();//ここでログインしているか判断するsessionID
    $_SESSION["name"]      = $val['name'];//DBに格納されたnameという引き出しに入っているデータ //test1管理者
    header("Location:select.php");
} else {
    //logout処理を経由して全画面へ
    header("Location:logout.php");
}

exit();
