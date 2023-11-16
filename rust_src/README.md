
ネイティブモジュールなので、各OSごとにbuild targetを指定する
欲しい環境ごとにビルドすること。
マルチプラットフォームに実行したい場合はそのOSごとに
ビルドする必要がある。

Powershellから関数呼び出し時ににこれらのネイティブモジュールへのパスが
解決されている必要がある。

クロスコンパイルを行う場合は下記のようにクロスコンパイルする環境をそれぞれとって来る必要があるが、
クロスコンパイルするより、github actionでビルドするosを変えて、
upload-artifactでビルドしたものをまとめて、アップロードしたほうが良い。

```bash
rustup target add aarch64-pc-windows-msvc
```


```bash
# 
cargo build --target x86_64-pc-windows-msvc
cargo build --target aarch64-pc-windows-msvc

cargo build --target x86_64-apple-darwin
cargo build --target aarch64-apple-darwin

cargo build --target x86_64-unknown-linux-gnu
cargo build --target aarch64-unknown-linux-gnu
```


```bash
gh secret set NUGET_API_KEY -b ""
```
