
​<?php
$id=$_GET['id'];

try {
  $pdo = new PDO('mysql:dbname=a_db;charset=utf8;host=localhost', 'root', 'root');
} catch (PDOException $e) {
  exit('DbConnectError:'.$e->getMessage());
}

$sql = "SELECT * FROM gs_user_table WHERE id=:id";
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':id', $id, PDO::PARAM_INT);
$status = $stmt->execute();
$view='';
if ($status==false) {
    //execute（SQL実行時にエラーがある場合）
    $error = $stmt->errorInfo();
    exit("ErrorQuery:".$error[2]);
} else {
    //１データのみ抽出の場合はwhileループで取り出さない(一個しかデータが返ってこないので一レコード取得する)
    $row = $stmt->fetch();
}
?>
​

<!-- htmlを貼り付けます -->
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>データ登録</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <style>div{padding: 10px;font-size:16px;}</style>
</head>
<body>
<!-- Head[Start] -->
<header>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
    <div class="navbar-header"><a class="navbar-brand" href="select.php">データ一覧</a></div>
    </div>
  </nav>
</header>
<!-- Head[End] -->
<!-- Main[Start] -->
<!-- ここからupdate.phpにデータを送ります -->
<form method="post" action="update.php">
  <div class="jumbotron">
   <fieldset>
    <legend>ポン太カフェご利用アンケート</legend>
    <label>ID：<input type="text" name="id" value="<?=$row["id"]?>"></label><br>
     <label>名前：<input type="text" name="u_name" value="<?=$row["u_name"]?>"></label><br>
     <label>ユーザID：<input type="text" name="u_id" value="<?=$row["u_id"]?>"></label><br>
     <label>ユーザPW：<input type="text" name="u_pw" value="<?=$row["u_pw"]?>"></label><br>
     <!-- <label><textArea name="naiyou" rows="4" cols="40"></textArea>
     </label><br> -->
     <input type='hidden' name="id" value="<?=$row["id"]?>">
     <input type="submit" value="更新">
    </fieldset>
  </div>
</form>
<!-- Main[End] -->
</body>
<!-- htmlを貼り付けます -->