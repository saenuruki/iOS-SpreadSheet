# iOS-SpreadSheet

## はじめに
業務で頻繁に利用されるスプレッドシートをRPA化することを目的としています。
シートをリアルタイムで共同編集することで業務効率化が著しく向上し、現在ではExcalと代わり必須のビジネスツールとなっています。
その容易な操作性により、非常に多くの重要なデータが未活用のまま眠らせてしまうことも多いです。

スプレッドシートをアプリケーションのデータベースとして機能させることで、業務効率化を更に向上します。
また、GASのAPI機能を活用することで、 **高速に** 、 **無料で** 、サービスを公開することができます。
 - SQLの知識いらずに直感的にデータを操作可能
 - サーバーサイド知識いらずにAPIを公開可能

こちらのリポジトリのソースを用いて、以下の構成を実現できます。
iOSアプリは、シートのデータを「読み取り」、確認問題を実施します。
回答の正誤をデバイスIDと紐づけてシートに「書き込み」を行い、個人の苦手な分野を分析する機能を提供します。

![EvangVD-Architecture](https://github.com/saenuruki/iOS-SpreadSheet/blob/master/images/EvangVD-Architecture.png)

## GASのAPI公開の仕方

### 1. スプレッドシートの上部の「ツール」から「スクリプト エディタ」を選択し、GASコンソール画面に移動します。
![gas-1](https://github.com/saenuruki/iOS-SpreadSheet/blob/master/images/gas-1.png)

### 2. 本リポジトリ内の `webAPI.gs` をGASコンソール画面に貼り付けます。(適宜参照する行や列は変更してください)
![gas-2](https://github.com/saenuruki/iOS-SpreadSheet/blob/master/images/gas-2.png)

### 3. 上部「ファイル」から「版を管理...」を選択し、現在のスクリプトのバージョンを管理します。
![gas-3](https://github.com/saenuruki/iOS-SpreadSheet/blob/master/images/gas-3.png)

### 4. 「Save new version」を選択し、最新のバージョンを作成したら、「OK」を押して閉じます。
![gas-4](https://github.com/saenuruki/iOS-SpreadSheet/blob/master/images/gas-4.png)

### 5. 上部「公開」から「ウェブアプリケーションとして導入...」を選択し、外部からリクエストに応答出来るようにします。
![gas-5](https://github.com/saenuruki/iOS-SpreadSheet/blob/master/images/gas-5.png)

### 6. `Create web app URL` が公開されるURLとなるため、メモしておきます。最新の版であることを確認し、「更新」を押します。
![gas-6](https://github.com/saenuruki/iOS-SpreadSheet/blob/master/images/gas-6.png)



## iOSアプリの使い方

### 1. Xcodeのプロジェクトファイルを開きます。
![ios-1](https://github.com/saenuruki/iOS-SpreadSheet/blob/master/images/ios-1.png)

### 2. 赤枠のアプリ設定情報を入力します。
![ios-2](https://github.com/saenuruki/iOS-SpreadSheet/blob/master/images/ios-2.png)

### 3. `Constant.swift` に先ほどコピーした `Web App URL` を貼り付けます。
![ios-3](https://github.com/saenuruki/iOS-SpreadSheet/blob/master/images/ios-3.png)

### 4. 赤枠のボタンを押すと、シミュレーターが起動します。
![ios-4](https://github.com/saenuruki/iOS-SpreadSheet/blob/master/images/ios-4.png)


### 最後に

AppStoreに現在公開中です。
是非遊んでみてください。
URL：[https://apps.apple.com/jp/app/evangvitaldata/id1497444016](https://apps.apple.com/jp/app/evangvitaldata/id1497444016)
