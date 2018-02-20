# サンプル

## セグメンテーションツール

### 実行例

`python3 run_segment.py sample_voice.wav sample_kan.txt sample_kana.txt sp_kan.txt seg.txt`

### 注意事項

_run_segment.py_ 内の
```
sp_inserter.JULIUS_ROOT = PurePath('/Users/yamachu/tmp/dictation-kit')
```
のPATHを自分の環境に合わせること．

またJuliusの制約上，長い音声をセグメンテーションしようとした場合，失敗することがあります．


## その他

サンプルのテキストは[日本声優統計学会](http://voice-statistics.github.io/)より，[声優統計コーパス 音素バランス文](https://github.com/voice-statistics/voice-statistics.github.com/blob/master/assets/doc/balance_sentences.txt)の001をお借りいたしました．

またsample音声は本サンプルの実行以外での使用を禁じます．

