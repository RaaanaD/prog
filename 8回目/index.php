<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>データ登録</title>
  <link href="css/index.css" rel="stylesheet">
  <style>div{padding: 10px;font-size:16px;}</style>
</head>
<body>

<!-- Head[Start] -->
<header>
  <nav class="navbar">
    <div class="container-fluid">
      <div class="navbar_header">
        <a class="navbar-brand" href="login_user.php">ログイン</a>
        <a class="navbar-brand" href="login.php">　管理者用ページ</a>
      </div>
    </div>
  </nav>
</header>
<!-- Head[End] -->

<!-- Main[Start] -->

<!-- ここからinsert.phpにデータを送ります -->

<form method="post" action="insert.php" class="haikei">
  <div class="jumbotron">
   <fieldset>
    <legend><h2 class="c">★ ドラ●もんキャラゲームご利用登録 ★</h2></legend>
     <label class="form">名前：<input type="text" name="u_name" class="form1"></label><br>
     <label class="form">email：<input type="text" name="email" class="form2"></label><br>
     <label class="form">ID：<input type="text" name="u_id" class="form3"></label><br>
     <label class="form">PW：<input type="text" name="u_pw" class="form4"></label><br>
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
     <input type="submit" class="btn" value="送信">
    </fieldset>
  </div>
  <h3 class="a">＊ご利用登録頂きましたら左上のログインよりお進み下さい</h3>
  <div class="b"></div>
</form>
<!-- Main[End] -->

<!-- $u_name = $_POST["u_name"];
$u_id = $_POST["u_id"];
$u_pw = $_POST["u_pw"];
$life_flg = $_POST["life_flg"]; -->



</body>
</html>
