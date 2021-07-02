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

<!-- ここからinsert.phpにデータを送ります -->
<form method="post" action="insert.php">
  <div class="jumbotron">
   <fieldset>
    <legend>★チーズアカデミーサイトログイン★</legend>
     <label>名前：<input type="text" name="u_name"></label><br>
     <label>ID：<input type="text" name="u_id"></label><br>
     <label>PW：<input type="text" name="u_pw"></label><br>
     <!-- <label>ご利用感想：<br><textArea name="naiyou" rows="4" cols="40"></textArea></label><br> -->
     <!-- 種類：<select name='animal'>
     <option value='dog'>犬</option>
     <option value='cat'>猫</option>
     <option value='rabit'>うさぎ</option>
     <option value='aru'>アルパカ</option>
     <option value='monkey'>サル</option>
     <option value='monkey'>蛇</option>
     </select><br>
     ランキング：<select name='rank'>ランキング：
     <option value='young'>1</option>
     <option value='middle'>2</option>
     <option value='senior'>3</option>
     <option value='senior'>4</option>
     <option value='senior'>5</option>
     <option value='senior'>6</option>
     </select><br> -->
</form>
     <input type="submit" value="送信">
    </fieldset>
  </div>
</form>
<!-- Main[End] -->

<!-- $u_name = $_POST["u_name"];
$u_id = $_POST["u_id"];
$u_pw = $_POST["u_pw"];
$life_flg = $_POST["life_flg"]; -->



</body>
</html>
