# julius4seg

[Julius Japanese Dictation-kit](https://github.com/julius-speech/dictation-kit)をPythonから叩いている風にするためのスクリプト．

grammer-kitとsegmentation-kitを足して2で割ったような立ち位置．

## Usage

### Cloneして使う方

see: https://github.com/yamachu/julius4seg/blob/master/sample/README.md

### Dockerで使う方

see: https://hub.docker.com/r/yamachu/julius4seg

```sh
$ docker pull yamachu/julius4seg:latest
```

#### segmentationしたい方

コマンド例

```sh
$ docker run --rm -v `pwd`/sample:/tmp yamachu/julius4seg sp-segment /tmp/sample_voice.wav /tmp/sample_kana.txt /tmp/seg.txt
```

第一引数に `sp-segment` を入れて、その後に続く引数は[sample](https://github.com/yamachu/julius4seg/blob/master/sample/README.md)の `run_segment.py` と同様

ファイル入力前提で作られているので、ローカルのディレクトリをマウントして、そのファイルを指定するようにして下さい。

#### silenceを除去したい方

コマンド例

```sh
$ docker run --rm -v `pwd`/sample:/tmp yamachu/julius4seg sp-remove /tmp/sample_voice.wav /tmp/seg.txt /tmp/out.wav
```

第一引数に `sp-remove` を入れて、その後に続く引数は[sample](https://github.com/yamachu/julius4seg/blob/master/sample/README.md)の `run_remover.py` と同様

## 注意事項

このスクリプトを実行するのに依存しているDictation-kitはgit lfsがインストールされていないと音響モデルも一緒にクローンできないため注意．

Juliusの標準的なサポートフォーマットである16kHz, 16bit, monoの音声を対象としている．

macOSX, Python3.6で動作を確認．
