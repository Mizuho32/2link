# 2link

## つらい

## いろいろ

main*.mがシミュレーション本体。delta*.mがode45に渡す関数。F_*.mによってdelta*.m内で必要な一般化力の計算を行う。
mainPDg.mでは重力補償つきPD制御を行う。F_PDg.mではデバッグ用途に \thetad_1'やe'を出力する。

anime.mでアニメーション、trace.mで各種情報のプロット
