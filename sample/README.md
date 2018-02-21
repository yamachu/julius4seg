# サンプル

## セグメンテーションツール

### 実行例

spを挿入したテキストが必要な場合（spを考慮した言語モデルの作成などの用途）

```
python3 run_segment.py sample_voice.wav -it sample_kan.txt -ot sp_kan.txt sample_kana.txt seg.txt
```

音素のセグメントのみが必要な場合（主に合成などで無音区間を除去したい場合など）

```
python3 run_segment.py sample_voice.wav sample_kana.txt seg.txt
```

### 注意事項

_run_segment.py_ 内の
```
sp_inserter.JULIUS_ROOT = PurePath('/Users/yamachu/tmp/dictation-kit')
```
のPATHを自分の環境に合わせること．

またJuliusの制約上，長い音声をセグメンテーションしようとした場合，失敗することがあります．


## 無音除去ツール

セグメンテーションツールより得られたセグメンテーションファイルを元にファイルの無音区間を除去する．

### 実行例

全ての無音データを削除する場合

```
python3 run_remover.py sample_voice.wav seg.txt out.wav
```

音声の先頭と終端の無音区間のトリミングを行う場合（例では500msecに揃える）

```
python3 run_remover.py sample_voice.wav seg.txt out.wav -s 500 -e 500 -E
```

### 注意事項

_run_remover.py_ 内の
```
sp_remover.MARGIN = 5
```
を好みで変更すること．
ここでは無音区間と判定された最初のフレームの初めの5msec後と，無音区間と判定された最後のフレームの終わりから5msec前までを削除するよう指定している．

![実行結果](https://github.com/yamachu/julius4seg/raw/master/sample/result.png "サンプル")


## その他

サンプルのテキストは[日本声優統計学会](http://voice-statistics.github.io/)より，[声優統計コーパス 音素バランス文](https://github.com/voice-statistics/voice-statistics.github.com/blob/master/assets/doc/balance_sentences.txt)の001をお借りいたしました．

またsample音声は本サンプルの実行以外での使用を禁じます．

