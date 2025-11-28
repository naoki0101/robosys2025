# 選手検索コマンド

![test](https://github.com/naoki0101/robosys2025/actions/workflows/test.yml/badge.svg)


*ロボットシステム学（robosys2025）の課題として作成した  

**野球選手情報検索コマンド `serch`** と、そのテストスクリプトをまとめたディレクトリです。

- 選手名から **チーム名・背番号** を調べる

- **チーム名 + 背番号** から選手名を調べる

という 2 つの機能を 1 つのコマンドで両立させています。

---

## 構成

KADAI/

├── LICENSE

├── README.md

├── data/

│   └── players.csv

├── serch

├── test.bash

└── tmp/
  
  └── data/
  
      └── players.csv


## 実行方法
  1,インストール

    リポジトリをcloneし、KADAIディレクトリに移動する。

　  git clone https://github.com/naoki0101/robosys2025.git

　  cd ~/robosys2025/KADAI

  2,実行

　　①　名前から検索

　　　echo "大谷翔平" | ./serch

　 ②　チーム名＋背番号から検索

　　　echo "ロサンゼルスドジャース,17" | ./serch

## 実行例

  ①　echo "大谷翔平" | ./serch

　　　大谷翔平,ロサンゼルスドジャース,17

  ②　echo "ロサンゼルスドジャース,17" | ./serch

　　　大谷翔平,ロサンゼルスドジャース,17 

## 必要なソフトウェア
　　　＊ python

                 テスト済み： 3.11～3.14

## テスト環境
＊　Ubuntu 24.04


## ライセンス

＊このソフトウェアパッケージは３乗項BSDライセンスのもと使用再頒布できます。

＊詳しくはLICENSE欄を見てください。

## 参考文献
＊[1] motoki1990, “pythonでcsvを読み込む方法まとめ（csv.DictReaderの使い方）”, 

    Qiita, 2020. https://qiita.com/motoki1990/items/0274d8bcf1a97fe4a869

　[2] ttsubo, “Pythonのpathlibの使い方（Pathオブジェクト入門）”, 

    Qiita, 2017. https://qiita.com/ttsubo/items/9ffc6117a2df72e7a39a

　[3] ykhirao, “Pythonで標準入力（stdin）を扱う方法”, 

    Qiita, 2021. https://qiita.com/ykhirao/items/2d90e1c8e93b2e8dddc4

　[4] kawaz, “BashでPIPESTATUSを理解する（パイプの終了ステータス）”, 

    Qiita, 2016. https://qiita.com/kawaz/items/cb4d8ba737b7b187c29c

　[5] koara-local, “exitコードの意味と使い方（UNIXの基本）”, 

    Qiita, 2021. https://qiita.com/koara-local/items/e6381329598e6a14e9cc


© 2025 Naoki Otsubo
