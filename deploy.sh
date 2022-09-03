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
�/�cdeploy.sh }Q�O�0��x���Ly�ʁ�08(����Km�����-0��� @��Լ�����w��NU�&���l` 6�S��2)��[��b˕R
�j��/�9�NR+��� �4@�VNXB3�������ynC���*њw���W>8d�C8��z�����ȼ���a�y��ߪ�in^$�K7�b��#��`���E��fNU.�������d��쵣�M8^�f1��삿��Lǋ)����I�$)�sckCR�Ti/�z���1]}��åV��l�ጾ�u�GB--�v�x~���%���g�_�ؿ�<  