1.課題内容：<br>
php、SQLを連携させて、ユーザ登録、ログイン機能を実装したゲームの作成をした。<br>
ユーザ情報の登録、表示、更新、削除機能も付加している。<br>

2.工夫した点・こだわった点：<br>
・実際の利用イメージで、ユーザ側の登録、ログイン表示をさせた点。<br>
・今後、作成するサービスとして利用する可能性の高いログイン機能の実装をした点。<br>

3.質問・疑問：<br>
ユーザ情報の登録、表示、更新、削除機能、ログイン機能もできている様に感じるが、<br>
insert.phpで以下エラーが発生している。原因、解決策やヒントを可能であればお教え頂ければ<br>
幸いです。<br>

Warning: Undefined array key "u_name" in /Applications/MAMP/htdocs/php_db2/insert.php on line 5<br>
Warning: Undefined array key "u_id" in /Applications/MAMP/htdocs/php_db2/insert.php on line 6<br>
Warning: Undefined array key "u_pw" in /Applications/MAMP/htdocs/php_db2/insert.php on line 7<br>
Fatal error: Uncaught PDOException: SQLSTATE[23000]: Integrity constraint violation: 1048 Column 'u_name'<br>
cannot be null in /Applications/MAMP/htdocs/php_db2/insert.php:36 Stack trace: #0 /Applications/MAMP/htdocs/php_db2/insert.php(36)<br>
: PDOStatement->execute() #1 {main} thrown in /Applications/MAMP/htdocs/php_db2/insert.php on line 36<br>

4.その他(感想、シェアしたいことなんでも)：<br>
課題を通してphp、SQLの勉強ができたと感じる。<br>
ちょっとしたスペルなどのミスでも、phpはエラーが発生するのでその点時間もかかり、難しさを感じた。<br>
phpMyadminなどの操作も不慣れではあるが、徐々にでも慣れてエラーの解決などもっと早くできる様に<br>
なりたい。
