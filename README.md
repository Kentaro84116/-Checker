# 卒単Checker Webアプリ

iPhone・PCで使える、科目台帳型の単位管理Webアプリです。ログイン後、科目・年度目標データをSupabaseに保存して端末間同期します。PWA対応でホーム画面にも追加できます。

## 必要なもの
- GitHubアカウント
- Supabaseアカウント（無料枠から開始可能）
- Renderアカウント（Static Site）

## 1. Supabaseの準備
1. Supabaseで新しいプロジェクトを作成。
2. SQL Editorで `supabase_schema.sql` の内容を実行。
3. Project Settings → APIから Project URL と anon/public key を取得。
4. `config.js` の `YOUR_SUPABASE_PROJECT_URL` と `YOUR_SUPABASE_ANON_KEY` を置き換える。
   - anon/public keyを使用し、service_role keyは絶対にブラウザへ置かないでください。

## 2. Renderで公開
1. このフォルダの内容をGitHubリポジトリのルートへアップロード。
2. Renderで New → Static Site を選び、そのリポジトリを接続。
3. Build Commandは空欄、Publish Directoryは `.` に設定してDeploy。
4. 発行された `https://....onrender.com` のURLでアクセス。

## 3. 使い始める
1. アプリを開き、メールアドレスとパスワードで新規登録。
2. 必要なら届いた確認メールのリンクを開き、ログイン。
3. 科目と年度目標を登録。
4. iPhoneのSafariなら共有メニュー → ホーム画面に追加。

## 注意
- この試作版はログインユーザーごとにデータを分離します。
- データ同期はネット接続時に行います。大切なデータは「設定・データ」から定期的にバックアップしてください。
- 同じアカウントを複数端末で同時に編集した場合の競合解決は未実装です。
- 卒業要件の区分別不足判定、CSV/Excel取込、複数大学の要件テンプレートは今後の拡張項目です。
