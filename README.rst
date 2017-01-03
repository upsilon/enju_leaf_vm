Next-L Enju 1.2 開発用 Vagrant マシン
=====================================

使い方
------

#. ``git clone --recursive git://github.com/upsilon/enju_leaf_vm.git``
#. ``cd enju_leaf_vm``
#. ``vagrant up``
#. ``vagrant ssh -c 'cd /vagrant; bundle exec foreman start'``

起動後は ``http://localhost:8080/`` で閲覧できる状態になります。


注意点
------

この環境は、ホスト側のファイルを編集して ``vagrant rsync`` で同期することを想定した構成となっています。

ゲスト側にあるソースコードは直接編集しないで下さい。同期時に元の内容に戻ってしまいます。


その他
------

Q. なんで `next-l/enju_leaf_vm <https://github.com/next-l/enju_leaf_vm>`_ を使わないの？
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A1: 開発用のエディタや Git などのコマンドはホスト側のものを使いたかった

A2: Ubuntu より使い慣れている Debian を使いたかった


Q. rsync ではなく双方向に同期できる vboxsf は使わないの？
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
使いたかったけど vboxsf めっちゃ遅い。。


Q. Ruby のバージョンが古い？
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Debian 8 (jessie) がベースなので Rubi 2.1 がインストールされます
(https://packages.debian.org/jessie/ruby)
