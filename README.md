# 2link

## つらい

## いろいろ

main*.mがシミュレーション本体。delta*.mがode45に渡す関数。F_*.mによってdelta*.m内で必要な一般化力の計算を行う。
mainPDg.mでは重力補償つきPD制御を行う。F_PDg.mではデバッグ用途に \thetad_1'やe'を出力する。

anime.mでアニメーション、trace.mで各種情報のプロット。
アニメーションにて、関節が*のリンクは参照すべきリンク、関節がoのリンクは実際のリンク。
右上に表示される数字は時間、その下が系のエネルギー。

t*という名前の変数は基本的にθ*。t1ならθ_1、dtd1ならθd1'とか。tのみode45の出力する時間。Xdとかtdは参照点。
*2*は変換の関数。xy2tはxy座標から関節角度を計算。ベクトルは基本的に縦。

mainPDg.mでは変数phiを設定することによって追従すべき軌跡の初期位相を設定(Xdは周波数fの円を描く)。
phi=1などとすると(phi=0の時の)t=1の時の点を始めとして円を描き始めるが、t=1(phi=0の時のt=2,つまり180度)でやはりおかしくなる・・・・

Xd.mとdXd.mのendの上のコメントアウトされてる行では定点軌跡を出力するようになっている。コメントを外して定点セットさせると、これはうまく動く・・・・

## 参考

http://www.ac.ctrl.titech.ac.jp/member/yamakita/robot2.pdf
http://www.me.saga-u.ac.jp/~izumi/lecture/two_link.pdf