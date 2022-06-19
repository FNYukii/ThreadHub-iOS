# Thread Hub for iOS
## 概要
iOSとiPadOSで利用できる掲示板アプリです。  
ユーザーがスレッドを作成し、他のユーザーがそれにコメントを追加していく仕様です。
匿名掲示板となっており、アカウント登録不要で利用することができます。

## 特徴
**SwiftUI**を用いて開発し、データの管理には**Firebase Cloud Firestore**を利用しています。
コメントの投稿者のIDを生成するために、**Firebase Authentication**も利用しています。

## フレームワーク・ライブラリ
- SwiftUI
- [Firebase](https://github.com/firebase/firebase-ios-sdk)

## スクリーンショット
<div style="display: flex; justify-content: space-between;">
  <img style="display: block; width: 48%;" src="https://user-images.githubusercontent.com/65577595/174473440-ff86f12c-994f-45fb-bcb9-e314f219b358.png"/>
  <img style="display: block; width: 48%;" src="https://user-images.githubusercontent.com/65577595/174473462-ad3f183d-15d1-48f0-aa9f-dcc5dcf1912b.png"/>
</div>
