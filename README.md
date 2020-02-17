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


## iOSアプリの使い方

/EvangVitalData/EvangVitalData.xcodeproj Xcodeのプロジェクトファイルを起動する。

EvangVitalData > General > Targets[EvangVitalData] > Identity

Display Name: アプリ名 (例：EvangVitalData)

Bundle Indentifier: 一意のID (例：com.myapp.EvangVitalData)

Version: 1.0

Build: 1

/EvangVitalData/EvangVitalData/Utils/Constant.swift

static let sheetURL: String = "https://script.google.com/macros/s/AKf \* \* \* \* \* \* \* \* \* \* \* \* \* \* swg/exec"

⌘ + R
