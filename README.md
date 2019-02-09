# Docker&Laravel開発環境

## Docker

### 起動

```
docker-compose up -d
```

### 終了

```
docker-compose down
```

### シェル起動

```
# まず、コンテナのIDを調べる
docker container ls

# シェル起動
docker container exec -it [コンテナID] bash
```

## Laravel

### 使用準備

#### 本体インストール

```
composer create-project --no-install --no-scripts laravel/laravel server_src "5.5.*"
```

composerがインストールするパッケージのバージョンをDockerのPHPに合わせるためにこの段階ではパッケージをインストールさせない。なので、`--no-install`を指定。

また、プロジェクト作成時に自動で`php artisan key:generate`が実行されるが、これは`.env`ファイルがないとエラーが出るので`--no-scripts`で抑制。

#### composerがインストールするパッケージのバージョンを、DockerのPHPバージョンと合わせるようにする

`composer.json`を以下の形式で書き換える

```
{
    "require": {
        ~
    },
    "config": {
        ~
        "platform": {
            "php": "7.2.13"
        }
    }
}
```

[composerでPHPのバージョンを制限したい - Qiita](https://qiita.com/kd9951/items/14cddc050745185011ee)

#### `.env`ファイル作成

```
cp .env.example .env
php artisan key:generate
```
