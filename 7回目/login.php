<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/main.css">
<link href="css/index.css" rel="stylesheet">
<style>div{padding: 10px;font-size:16px;}</style>
<title>ログイン</title>
</head>
<body>

<!-- Head[Start] -->
<header>
  <nav class="navbar">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="index.php">ご利用登録</a>
      </div>
    </div>
  </nav>
</header>
<!-- Head[End] -->

<!-- Main[Start] -->
<form method="post" action="login_act.php">
  <div class="jumbotron">
   <fieldset>
    <legend>ドラ●もんキャラゲームログイン</legend>
     <label class="form_a">ID：<input type="text" name="lid" class="form"></label><br>
     <label class="form_a">PW：<input type="text" name="lpw" class="form"></label><br>
     <input type="submit" class="btn" value="ログイン">
    </fieldset>
  </div>
</form>
<!-- Main[End] -->

</body>
</html>
