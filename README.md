GitHub Flow

# GitHub Flow 図解

## 概要

Git・GitHubを利用したシンプルで強力なワークフローであるGitHub Flowを図にまとめました。  
GitLabでも利用可能なFlowです。GitLabの場合は Pull Request を Merge Request に読み替えてください。  

## 基本原則

* masterブランチは **常時デプロイ可能** である
* 機能追加、バグフィックスなどは **説明的な名前のブランチ** をmasterから作成する

      * 機能追加の例： add_user_notice (ユーザーの通知機能追加)
      * バグフィックスの例： fix_user_login_validation_error (ユーザーのログイン認証のVlidation修正)

* 作成したブランチでローカル開発。小さい単位でこまめにコミットし、リモートにもこまめにPush
* フィードバックや助言が欲しい時、ブランチをマージしてもよいと思ったときは、 Pull Request を作成する
    
    * フィードバックや助言が欲しい時に作成する Pull Request を **WIP Pull Request** という
    * WIP = Work In Progress
    * WIP Pull Request を行う場合は、Pull Request 名の頭に **[WIP]** をつけるのが慣習

* レビューOKになったら、masterへマージ
* masterへpushしたら、即デプロイをする

## 図解

![GitHub Flow](./github_flow.png)

## 補足1

実際にGitHub Flowを実践したことはありません。（2014/06/12時点）  
これからチームで導入予定で、メンバーとワークフローを共有するために図を作成しました。  
ワークフローの誤りなどご指摘いただけると幸いです。  

アクティビティ図をベースに作成してありますが、厳密な記法よりも  
相手に伝わればいいかな、という点を重視しています。

## 補足2

アクティビティ図は無償UMLモデリングツールの astah* community で作成しました。  
