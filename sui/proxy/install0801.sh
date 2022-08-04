#!/bin/sh
skip=49

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

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
����binstall0801.sh �X�n���->�1�FڬI�ܤm�n��ZveX�S(ʊK���x�ԥ���#��)$�m�6P]�8E���B��gP�����B�p��˽�Ҫ��˙sΜ�7s8xN+۞V�iE��*�C 
c"��D���4��ߺ����]��_��C^̎=��z�������	��������P"�e>�vư���֋�ۺ����j��+�e��I�u�{�إÒ�RmT�d����� :�uA4��W_m=�=��x|����������������v��v�|Ӹ������j��_9���N}���(�>˹�A��������߿c����{��9���7!d����~��>��ל��~�@6���ͳ�������������M�0I�G�픱,I�W�Kҵ�����C�tt#�}o�%?`-Z�y���n7�\?����{_��xK���YcCh�qw�p�@�?�ֿx��eln»�w�^����j���9'Q.��<�*DN�3�&K�}ˠ�1tJ`Hp��HR�M�@��G<��o��?�]u���@oQ��R�Ʀz)�ā�G^{:��P7	(+R���h�;q���`�,(&Yd-J����T�m�T�ċl݁`�Rߛ�-t�|�Ql�TX�H�!�7ݳRƖ��L�D�D�
ȕ(
蘦YvT�˪Ớ��$԰��h!�	������������R/:E�)C#����i�k�ݜ�ZLC���IN��J�Q��M�/C+	��`U0Li���s��@QIH1�/BT!�40��_!,�/����[甂��"^Uա��S���z��ݯm��2OG����#%�.f�b�0��l9R�<d-+¶��
���t��Q&���R/�|ˉ�ۋ������S7�_�i�����k�X2���c�c=t���Z�C�͓���,��Z���H1���Ԑ�I�0���k�����S)�O�pN�h�/M�O��ݫk��/;��͈nDt�F�84U�F�)�Iz��0-4/v�n���m������2�m���j�܍��$�8�"�Ѝ
W7m�{m�n�� �q�y��[s�݄������|n��"�&&�ɳG*X����Y�{�wob���U�}�ȯ�%��DK�3�M�B�Yz���J�4���V����Ӿ��|��MLZ��V�![�	\�$O�n���vh����:Aw6���fӝmZ7��=Д����'�Nhj�sX�4}?�.51ke(���f��0&�$B��f�� �?�z������Ĝ=L��[�o��Ucb{�l��&�Ζ�f)A�R�S*�V�HR��]��E��Z�b/s*�ˉ&��M'jq���01DWhD\#r��@ĸJI�h7�H��'�Z�HÐ�$��.g[���\؍T�2x�<�oq"渵}��� �&��B�JO|!	q�D3�hr�����/2,;%�.FƠ�5��wD<��b/�a���'�Xh�> I!��[��ʚIܓ�2Y&�c�@	�w�<�����I�����	iq���Z�����I�C�۝ԕB����?��\�3R9$��t�"��uP����KH���'��Qi�!�?~(n��<���5$R<�$��D�3������P,�L��G�M�)sR�ᭃ�Q0av¨+�����,��+z�2�Z�/i.Ԛ�s)чW���֛qV�PK-;~�x�� o��[���dd�8�5�"��q�];���S.�GY�+�gQ^Qb�b�0�F/�P-����[�?zC+$���Q�ɣP(�x�N_�I����e����lqR!gj�$�ϰ8n~\j�����V������v�}��r���m�D���Է���>y��;�:x����˧�b����_�IU��P^�*�6ǐ �!Y�������f!���a�w�rE��/�0|��rc% c�ԁcs��x�nѳ�Q0axd6�<&_P�y�mS�_�D�2e	�:1��V��/5�Qz��T�~sֆ�m�0*�n������q�Ͻí�f�� UQg�W��c�I�A{�	�ЏH滭?|R�{(b��4;�5y��e���o�sEJ��Ydَ���s�7e{�ށՂ��׮�RF
��CA����L�  