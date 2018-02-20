# julius4seg

[Julius Japanese Dictation-kit](https://github.com/julius-speech/dictation-kit)をPythonから叩いている風にするためのスクリプト．

grammer-kitとsegmentation-kitを足して2で割ったような立ち位置．

## 注意事項

このスクリプトを実行するのに依存しているDictation-kitはgit lfsがインストールされていないと音響モデルも一緒にクローンできないため注意．

Juliusの標準的なサポートフォーマットである16kHz, 16bit, monoの音声を対象としている．

macOSX, Python3.6で動作を確認．
