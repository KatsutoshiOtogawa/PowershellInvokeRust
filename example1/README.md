# csharpをあらかじめビルドせずに実行する。

実行時にビルドするため、実行環境をあまり考えなくてよくなる。またディレクトリ構成が楽になる。

本番、運用ではやらないほうがいい。

powershellで文字列をパースした後に、csharpで動的にビルドする作りなので
割とバグりやすい(パースを信じるな。)。

powershelから

```
```