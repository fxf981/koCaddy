#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�\�cstart.sh �SQo�0~����j���WF#!��}�x@uLb����fd�~��T�Z^w�����Wd-$1Bא*��A�K&4��)IY��!@�F�<�y��` <-`��p�YΥÐ�XV�j7@���h�V֌lc�.���4�W2�M�H ?�t#�GG��J�x+_E���0g�a_]�>Ňdx
��Y ���̟7����ڟ���8L,��h���CL���ǿ�<���{�t���f��v��.���7N����DG+8�Џդ�|��(y4�Gs$L��[���/�g�dA�@m��7��Js������y}ۥ�[�~������ �;/��"3����Fih7%$�7��Tt�2��=OO��$��;z� ��>�����l8��,�h�BtB	���5� �.�;+E��P���eJ�Nw�-rA D�{wE�h�.��Io�s�[�۸(�X�V������   