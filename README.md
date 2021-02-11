another wayはコワーキングスペースのマッチングサイトとなっている。
現在コロナの影響で相次いで飲食店が倒産している。私の地元の行きつけの飲食店も店を畳んだ。。

居酒屋の昼間の空席を見て、この使われていない席をコワーキングスペースとして貸し出すことができれば追加投資なしで新たな収入源が作れるのではと思ったのがアプリ作成の動機である。


以下機能,仕様を列挙していく
１記法                            
haml

２ログイン機能
devise                                  

3 SNSを使ったログイン       
facebook google github
                                    
4 CRUD機能
投稿の作成、更新、削除機能
　　　　　　　　　　   
5 google-mapの導入                                

6 検索機能

7 ページネーション

8 データベース関係
コメント機能                            
お気に入り機能

9 メール送信機能
actionmailer        

10 payjpを使った決済機能

11 admin画面の作成
csvダウンロード機能

12 ci/cd 
github action                                

13 snsシェア機能
twiterシェア機能　                      
lineシェア機能

14 basic認証                                    

15 エラーページ自作  

16 i18nを使って日本語に対応  

* Ruby version
2.6.6

* Database initialization
$ bundle exec rake db:create
$ bundle exec rake db:migrate

* How to run the test suite
$ bundle exec rake spec


今後実装したい機能
より丁寧なレスポンシブに対応したUI
決済周りをより堅牢にまた決済手段の拡充
actioncableを使ったメッセージ機能
googleカレンダーとの連携
admin画面の充実