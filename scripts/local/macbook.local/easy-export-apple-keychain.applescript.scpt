FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
	@header
		Export Apple's Keychain Access passwords easily
	@discussion
		April 2019 sangonz - https://github.com/sangonz
		Thanks to https://github.com/lifepillar/CSVKeychain - see Lifepillar's awesome
		work if you want more information.
		This is just a minimalist script to only export a keychain to be easily used
		by https://github.com/sangonz/pass-import.
	@license
		Copyright (c) 2011-2018, Lifepillar

		Permission is hereby granted, free of charge, to any person obtaining a copy of
		this software and associated documentation files (the "Software"), to deal in
		the Software without restriction, including without limitation the rights to
		use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
		the Software, and to permit persons to whom the Software is furnished to do so,
		subject to the following conditions:

		The above copyright notice and this permission notice shall be included in all
		copies or substantial portions of the Software.

		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
		IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
		FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
		COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
		IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
		CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
     � 	 	r 
 	 @ h e a d e r 
 	 	 E x p o r t   A p p l e ' s   K e y c h a i n   A c c e s s   p a s s w o r d s   e a s i l y 
 	 @ d i s c u s s i o n 
 	 	 A p r i l   2 0 1 9   s a n g o n z   -   h t t p s : / / g i t h u b . c o m / s a n g o n z 
 	 	 T h a n k s   t o   h t t p s : / / g i t h u b . c o m / l i f e p i l l a r / C S V K e y c h a i n   -   s e e   L i f e p i l l a r ' s   a w e s o m e 
 	 	 w o r k   i f   y o u   w a n t   m o r e   i n f o r m a t i o n . 
 	 	 T h i s   i s   j u s t   a   m i n i m a l i s t   s c r i p t   t o   o n l y   e x p o r t   a   k e y c h a i n   t o   b e   e a s i l y   u s e d 
 	 	 b y   h t t p s : / / g i t h u b . c o m / s a n g o n z / p a s s - i m p o r t . 
 	 @ l i c e n s e 
 	 	 C o p y r i g h t   ( c )   2 0 1 1 - 2 0 1 8 ,   L i f e p i l l a r 
 
 	 	 P e r m i s s i o n   i s   h e r e b y   g r a n t e d ,   f r e e   o f   c h a r g e ,   t o   a n y   p e r s o n   o b t a i n i n g   a   c o p y   o f 
 	 	 t h i s   s o f t w a r e   a n d   a s s o c i a t e d   d o c u m e n t a t i o n   f i l e s   ( t h e   " S o f t w a r e " ) ,   t o   d e a l   i n 
 	 	 t h e   S o f t w a r e   w i t h o u t   r e s t r i c t i o n ,   i n c l u d i n g   w i t h o u t   l i m i t a t i o n   t h e   r i g h t s   t o 
 	 	 u s e ,   c o p y ,   m o d i f y ,   m e r g e ,   p u b l i s h ,   d i s t r i b u t e ,   s u b l i c e n s e ,   a n d / o r   s e l l   c o p i e s   o f 
 	 	 t h e   S o f t w a r e ,   a n d   t o   p e r m i t   p e r s o n s   t o   w h o m   t h e   S o f t w a r e   i s   f u r n i s h e d   t o   d o   s o , 
 	 	 s u b j e c t   t o   t h e   f o l l o w i n g   c o n d i t i o n s : 
 
 	 	 T h e   a b o v e   c o p y r i g h t   n o t i c e   a n d   t h i s   p e r m i s s i o n   n o t i c e   s h a l l   b e   i n c l u d e d   i n   a l l 
 	 	 c o p i e s   o r   s u b s t a n t i a l   p o r t i o n s   o f   t h e   S o f t w a r e . 
 
 	 	 T H E   S O F T W A R E   I S   P R O V I D E D   " A S   I S " ,   W I T H O U T   W A R R A N T Y   O F   A N Y   K I N D ,   E X P R E S S   O R 
 	 	 I M P L I E D ,   I N C L U D I N G   B U T   N O T   L I M I T E D   T O   T H E   W A R R A N T I E S   O F   M E R C H A N T A B I L I T Y ,   F I T N E S S 
 	 	 F O R   A   P A R T I C U L A R   P U R P O S E   A N D   N O N I N F R I N G E M E N T .   I N   N O   E V E N T   S H A L L   T H E   A U T H O R S   O R 
 	 	 C O P Y R I G H T   H O L D E R S   B E   L I A B L E   F O R   A N Y   C L A I M ,   D A M A G E S   O R   O T H E R   L I A B I L I T Y ,   W H E T H E R 
 	 	 I N   A N   A C T I O N   O F   C O N T R A C T ,   T O R T   O R   O T H E R W I S E ,   A R I S I N G   F R O M ,   O U T   O F   O R   I N 
 	 	 C O N N E C T I O N   W I T H   T H E   S O F T W A R E   O R   T H E   U S E   O R   O T H E R   D E A L I N G S   I N   T H E   S O F T W A R E . 
   
  
 l     ��������  ��  ��        l     ��  ��      Select keychain file     �   *   S e l e c t   k e y c h a i n   f i l e      l    	 ����  r     	    I    ��  
�� .earsffdralis        afdr  m     ��
�� afdrkchn  �� ��
�� 
from  m    ��
�� fldmfldu��    o      ���� 0 defaultpath defaultPath��  ��        l  
  ����  r   
     I  
 ���� 
�� .sysostdfalis    ��� null��    ��   
�� 
prmp  m     ! ! � " " ^ P l e a s e   s e l e c t   t h e   k e y c h a i n   f i l e   t o   b e   e x p o r t e d :   �� # $
�� 
ftyp # J     % %  &�� & m     ' ' � ( ( $ c o m . a p p l e . k e y c h a i n��   $ �� ) *
�� 
dflc ) o    ���� 0 defaultpath defaultPath * �� + ,
�� 
lfiv + m    ��
�� boovfals , �� + -
�� 
mlsl - �� +��
�� 
shpc��    o      ���� 0 keychain  ��  ��     . / . l     ��������  ��  ��   /  0 1 0 l     �� 2 3��   2   Handle export file    3 � 4 4 &   H a n d l e   e x p o r t   f i l e 1  5 6 5 l    - 7���� 7 r     - 8 9 8 b     ) : ; : l    % <���� < c     % = > = o     !���� 0 keychain   > m   ! $��
�� 
ctxt��  ��   ; m   % ( ? ? � @ @  - e x p o r t 2 . t x t 9 o      ���� 0 
exportpath 
exportPath��  ��   6  A B A l  . j C���� C O   . j D E D Z   4 i F G���� F I  4 @�� H��
�� .coredoexnull���     obj  H 4   4 <�� I
�� 
file I o   8 ;���� 0 
exportpath 
exportPath��   G k   C e J J  K L K I  C b�� M N
�� .sysodlogaskr        TEXT M b   C N O P O m   C F Q Q � R R @ T h e   e x p o r t   f i l e   a l r e a d y   e x i s t s :   P l  F M S���� S n   F M T U T 1   I M��
�� 
psxp U o   F I���� 0 
exportpath 
exportPath��  ��   N �� V W
�� 
btns V J   Q V X X  Y�� Y m   Q T Z Z � [ [  E x i t��   W �� \��
�� 
dflt \ m   Y \ ] ] � ^ ^  E x i t��   L  _�� _ L   c e����  ��  ��  ��   E m   . 1 ` `�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��   B  a b a l  k v c���� c r   k v d e d l  k r f���� f n   k r g h g 1   n r��
�� 
psxp h o   k n���� 0 
exportpath 
exportPath��  ��   e o      ���� 0 
exportpath 
exportPath��  ��   b  i j i l     ��������  ��  ��   j  k l k l     �� m n��   m   Get user password    n � o o $   G e t   u s e r   p a s s w o r d l  p q p l  w � r���� r I  w ��� s t
�� .sysodlogaskr        TEXT s m   w z u u � v v L T y p e   p a s s w o r d   t o   u n l o c k   k e y c h a i n   i t e m s t �� w x
�� 
dtxt w m   } � y y � z z   x �� { |
�� 
appr { m   � � } } � ~ ~  S e t   p a s s w o r d | ��  �
�� 
disp  m   � ���
�� stic    � �� ���
�� 
htxt � m   � ���
�� boovtrue��  ��  ��   q  � � � l  � � ����� � r   � � � � � l  � � ����� � n   � � � � � 1   � ���
�� 
ttxt � l  � � ����� � 1   � ���
�� 
rslt��  ��  ��  ��   � o      ���� 0 thepassword thePassword��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �   Execute the exportation    � � � � 0   E x e c u t e   t h e   e x p o r t a t i o n �  � � � l  � � ����� � I  � ��� ���
�� .sysoexecTEXT���     TEXT � b   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � : s e c u r i t y   - q   d u m p - k e y c h a i n   - d   � n   � � � � � 1   � ���
�� 
strq � n   � � � � � 1   � ���
�� 
psxp � l  � � ����� � o   � ����� 0 keychain  ��  ��   � m   � � � � � � �    & > � n   � � � � � 1   � ���
�� 
strq � o   � ����� 0 
exportpath 
exportPath � m   � � � � � � �    &��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �   Autofill the passwords    � � � � .   A u t o f i l l   t h e   p a s s w o r d s �  � � � l  � � ����� � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � � � � ?�      ��  ��  ��   �  � � � l  �= ����� � O   �= � � � V   �< � � � k   �7 � �  � � � O   �/ � � � k   �. � �  � � � r   � � � � m   � ���
�� boovtrue � 1   ���
�� 
pisf �  ��� � Q  . � � � � k  % � �  � � � I �� ���
�� .prcskprsnull���     ctxt � o  	���� 0 thepassword thePassword��   �  � � � I �� ���
�� .sysodelanull��� ��� nmbr � m   � � ?���������   �  � � � I �� ���
�� .prcskprsnull���     ctxt � o  ��
�� 
ret ��   �  ��� � I %�� ���
�� .sysodelanull��� ��� nmbr � m  ! � � ?���������  ��   � R      ��~�}
� .ascrerr ****      � ****�~  �}   � l --�| � ��|   �   Skip error    � � � �    S k i p   e r r o r��   � 4   � ��{ �
�{ 
prcs � m   � � � � � � �  S e c u r i t y A g e n t �  ��z � I 07�y ��x
�y .sysodelanull��� ��� nmbr � m  03 � � ?�      �x  �z   � I  � ��w ��v
�w .coredoexnull���     obj  � l  � � ��u�t � 6 � � � � � 2  � ��s
�s 
prcs � =  � � � � � 1   � ��r
�r 
pnam � m   � � � � � � �  S e c u r i t y A g e n t�u  �t  �v   � m   � � � ��                                                                                  sevs  alis    \  Macintosh HD                   BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��   �  � � � l     �q�p�o�q  �p  �o   �  ��n � l >I ��m�l � I >I�k ��j
�k .sysodlogaskr        TEXT � b  >E � � � m  >A � � � � � , F i n i s h e d !   E x p o r t e d   i n   � o  AD�i�i 0 
exportpath 
exportPath�j  �m  �l  �n       �h � ��h   � �g
�g .aevtoappnull  �   � **** � �f ��e�d � ��c
�f .aevtoappnull  �   � **** � k    I � �   � �   � �  5 � �  A � �  a � �  p    �  �  �  �  ��b�b  �e  �d   �   � >�a�`�_�^�]�\ !�[ '�Z�Y�X�W�V�U�T�S ?�R `�Q�P Q�O�N Z�M ]�L�K u�J y�I }�H�G�F�E�D�C�B ��A � ��@ ��? ��>�= � ��<�; ��:�9�8 �
�a afdrkchn
�` 
from
�_ fldmfldu
�^ .earsffdralis        afdr�] 0 defaultpath defaultPath
�\ 
prmp
�[ 
ftyp
�Z 
dflc
�Y 
lfiv
�X 
mlsl
�W 
shpc�V 
�U .sysostdfalis    ��� null�T 0 keychain  
�S 
ctxt�R 0 
exportpath 
exportPath
�Q 
file
�P .coredoexnull���     obj 
�O 
psxp
�N 
btns
�M 
dflt�L 
�K .sysodlogaskr        TEXT
�J 
dtxt
�I 
appr
�H 
disp
�G stic   
�F 
htxt�E 
�D 
rslt
�C 
ttxt�B 0 thepassword thePassword
�A 
strq
�@ .sysoexecTEXT���     TEXT
�? .sysodelanull��� ��� nmbr
�> 
prcs  
�= 
pnam
�< 
pisf
�; .prcskprsnull���     ctxt
�: 
ret �9  �8  �cJ���l E�O*����kv���f�f�f� E�O�a &a %E` Oa  7*a _ /j  'a _ a ,%a a kva a a  OhY hUO_ a ,E` Oa a a  a !a "a #a $a %ea & O_ 'a (,E` )Oa *�a ,a +,%a ,%_ a +,%a -%j .Oa /j 0Oa 1 k hh*a 2-a 3[a 4,\Za 581j *a 2a 6/ 5e*a 7,FO $_ )j 8Oa 9j 0O_ :j 8Oa 9j 0W X ; <hUOa /j 0[OY��UOa =_ %j ascr  ��ޭ