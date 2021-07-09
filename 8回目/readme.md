1,2.課題内容、工夫点：<br>
php、SQLを用いてログイン認証、ログアウト、ユーザデータの管理、更新、削除を管理者のみが<br>
実施できるゲームサイトの作成をした。<br>

①ユーザ側データ登録画面　先ずは、ユーザ情報を登録して、その際のID,PASSを用いてログイン出来る仕様にした。<br>
<img src="https://user-images.githubusercontent.com/83898574/125111134-7f8bbf00-e120-11eb-9a43-84c66d081eba.png" width="800px">

②ユーザ側ゲーム画面　事前登録したID,PASSを用いてログインを実施することでゲームが利用出来る仕様にした。<br>
*ユーザ側ログイン画面のID,PASS = green、greengreen<br>
<img src="https://user-images.githubusercontent.com/83898574/125110585-bad9be00-e11f-11eb-8213-59ae801db6e5.png" width="800px"><br>

③管理者側ユーザデータ管理画面　①で登録するユーザデータを管理者のみのID,PASSを用いて管理及び更新、削除ができて、<br>
ログアウト後はユーザからは本管理者ユーザデータ管理画面には入れない仕様にした。<br>
*管理者ログイン画面のID,PASS = test1、test1<br>
<img src="https://user-images.githubusercontent.com/83898574/125110769-fa080f00-e11f-11eb-886b-079d33a13a93.png" width="800px"><br>

3.質問・疑問：<br>
game.php画面にて「ようこそユーザ名（ログイン中ユーザ）さん」という表記をしたく、line30に<?= $u_name ?>、$result["u_name"]<br>
などの記載をしましたが、表示されませんでした。<br>
ログイン中のユーザ名を表記させる方法を知りたいです。<br>

4.その他(感想、シェアしたいことなんでも)：<br>
余裕があれば、管理者側のCSSも設定したい。
