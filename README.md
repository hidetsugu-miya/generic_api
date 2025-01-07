# プロジェクトの概要

## プロジェクト名

為替レートAPI

## プロジェクトの概要

為替レートを保存し、取得するAPIです。

## プロジェクトの目的

大きな目的は以下のとおりです。

* 自身の勉強のために行っています。
* githubのpublicリポジトリでスキル判定を受けるために行っています。

## 使用技術一覧

![Ruby](https://img.shields.io/badge/Ruby-3.4.2-red.svg?logo=ruby&style=flat)
![Rails](https://img.shields.io/badge/Rails-8.0.1-CC0000.svg?logo=rails&style=flat)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-17.2-336791.svg?logo=postgresql&style=flat)
![Docker](https://img.shields.io/badge/Docker-latest-2496ED.svg?logo=docker&style=flat)

# 開発環境

## 初期設定

最初に以下のコマンドを実行してください。

```
$ make init
```

実行後は以下の処理が行われます。

* dockerのnetworkを作成
* dockerのbuild
* railsに必要なgemのインストール
* データベースの作成

その後、http://localhost:53000/ にアクセスして、画面が表示されれば成功です。

## テスト

テストを実行する場合は以下のコマンドを実行してください。

```
make rspec
```

## 静的コード解析

静的コード解析にはrubocopを使用しています。  
実行する場合は以下のコマンドを実行してください。

```
make rubocop
```

## モデルのアノテーション

[annotaterb](https://github.com/drwl/annotaterb)を使用しています。
`rails db:migrate`を実行した際に自動的に付与されます。
手動更新は以下のコマンドで行えます。

```
make annotate_models
```

# API設計

基本的な方針はRestful API に基づくものとします。

## HTTP メソッドに関する操作の定義

アルバム（album）を例にサンプルを提示します。

| TH | TH | TH | TH |TH |
| ---- | ---- | ---- | ---- | ---- |
|リソース|POST|GET|PUT|DELETE|
|/albums|新しいアルバムの作成|全てのアルバムを取得|アルバムを一括更新|全てのアルバムを削除|
|/albums/:album_id|Error|アルバムを一つ取得|アルバムの詳細を更新|アルバムの詳細を削除|

## レスポンス設計

### 期待する結果が単数形である場合

```json
{
  "id": 1
}
```

### 期待する結果が複数形である場合

ページネーションとして利用できることを想定して、total、limit、offsetの情報を持つものとします。

```json
{
  "total": 1,
  "items": [
    {
      "id": 1
    }
  ]
}
```

## エンドポイント設計

{verb} /{feature_name}/{version}/{resource_name}

* verb
    * GETやPOSTなど、メソッドを指定します。
* feature_name
    * 機能名を指します。特定の企業に公開する場合は、企業名を含めることがあります。
    * 自社内で利用するものは feature_nameをprivate とします。
* version
    * v1やv2などバージョンを指定します。
* resource_name
    * リソース名を指定します。

# 今後の開発予定

* [ ] nextjsを使用したフロントエンドの作成（別プロジェクト予定）
