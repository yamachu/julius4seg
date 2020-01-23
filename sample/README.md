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

<details>
<summary>セグメント結果の例</summary>

```
0 71 silB
72 74 m
75 83 a
84 91 t
92 108 a
109 137 sp
138 144 t
145 164 o:
165 170 j
171 173 i
174 179 n
180 185 o
186 194 y
195 211 o:
212 214 n
215 230 i
231 286 sp
287 291 g
292 298 o
299 304 d
305 313 a
314 320 i
321 337 my
338 342 o
343 345 u
346 356 o:
357 362 t
363 365 o
366 372 y
373 375 o
376 382 b
383 386 a
387 389 r
390 397 e
398 402 r
403 420 u
421 453 sp
454 472 sh
473 475 u
476 484 y
485 500 o:
501 503 n
504 512 a
513 525 my
526 532 o:
533 552 o:
553 557 n
558 573 o
574 589 sp
590 605 ch
606 619 u:
620 635 o:
636 640 n
641 645 i
646 654 h
655 662 a
663 666 i
667 674 s
675 679 a
680 682 r
683 690 e
691 693 r
694 696 u
697 706 k
707 710 o
711 715 t
716 720 o
721 729 m
730 735 o
736 762 o:
763 772 i
773 872 silE
```
</details>

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

また無音区間と判定された最初のフレームの初めから、また最後のフレームの終わりからn[msec]を削除できる `m` オプションを使用できる．

![実行結果](https://github.com/yamachu/julius4seg/raw/master/sample/result.png "サンプル")


## その他

サンプルのテキストは[日本声優統計学会](http://voice-statistics.github.io/)より，[声優統計コーパス 音素バランス文](https://github.com/voice-statistics/voice-statistics.github.com/blob/master/assets/doc/balance_sentences.txt)の001をお借りいたしました．

またsample音声は本サンプルの実行以外での使用を禁じます．

