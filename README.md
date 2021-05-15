# another way
- another wayはコワーキングスペースのマッチングサイトとなっています。
- https://anotherway.herokuapp.com/ 起動するまで少々時間がかかります。申し訳ございません。
- テストアカウント：emailはtest@test.com、パスワードはhogehogeでログインできます

## 動機
- 現在新型コロナの影響で相次いで飲食店が倒産しています。私の地元の行きつけの飲食店も店を畳みました。
居酒屋の昼間の空席を見て、使われていない席をコワーキングスペースとして貸し出すことができれば追加投資なしで事業を継続できるのではないかと考えたため作成しました。
- 書籍web進化論を読んでからgoogleのようなプラットフォーム型のモデルに憧れていたため、作成しました。
- インターン先もプラットホーム型のビジネスをしていたため開発でのアウトプットも兼ねて作成しました。

## 工夫した点,これから改善しようと考えている点
 ### 工夫した点
 - 小学生が初見で使えるようなアプリを作りたかったため、シンプルなUIにした点。
 - アプリの最終的な目標は決済していただくことだと思うので、途中で離脱しないように決済までのクリック数を減らしたりフォームにplaceholderを埋め込んだり、SNSでのログインを導入したりと最終的なコンバージョン率を高めようとした点。
 ### 就活終了したら改善、手を加えようとしている点
 - テストのカバー率が低い部分のテストコードの記述をしていきたいと考えています。
 - ユーザーの使い勝手だけでなくエンジニアにとっても管理しやすいアプリが優秀なアプリだと考えています。そのためadmin画面を今後充実させていきたいと考えています。
 ### 技術的に今後追加したい機能
 - AWSの利用
 - actioncableを使った個人チャット機能
 - より柔軟なレスポンシブへの対応
 - 決済手段の拡充
 - googleカレンダーとの連携

## 機能,仕様
1. hamlを使った記述
1. devise gemを使ったログイン                              
1. facebook google githubといったSNSのアカウントでのログイン
1. スペースの投稿、更新、削除機能
1. google-map apiの導入                
1. rspec factorybotでのテスト記述
1. 検索機能
1. コメント機能                            
1. お気に入り機能
1. アプリのフィードバックをメールで送信できる機能
1. 決済機能
1. csv一括ダウンロード機能
1. github actionを使った継続的インテグレーションの導入
1. twiter、lineでのシェア機能                           
1. エラーページのカスタム
1. 日本語に対応したUI
1. basic認証機能
1. ページネーション機能
1. bootstrapでのフロント記述

