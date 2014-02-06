=====================
sphinx-xml2review-xsl
=====================

XSL Template convert from Sphinx XML file to ReVIEW format.

概要
----

このXSLテンプレートは、Sphinxから出力されたXMLファイルを、ReVIEW形式のテキストに変換するためのものです。ただし、そのままビルドできるようにはできていないため、あくまでも作業の補助ツールとして考えてください。

このテンプレートを利用するには、LinuxやOS XなどのUnixライクOSであれば `xsltproc` 、Windowsでは `msxsl.exe`_ などのXSLTプロセッサが必要です。以下のようにコマンドを実行して、出力を適当なファイルにリダイレクトしてください。

.. code::
    $ xsltproc sphinxxml2review.xslt <your xml file>

.. _`msxsl.exe`: http://www.microsoft.com/en-us/download/details.aspx?id=21714

制限事項
--------

- テーブルの情報が上手く変換できていません。各セルがタブ区切りで出力しますので、適宜編集してください。
- 変換はファイル毎に行われるため、doctreeで表現された文書構造を表すことができません。
- カスタムのディレクディブなどは無視されてしまいますので、別途ルールを追加する必要があります。内容がそのまま出力されるはずです。

著作権情報
----------

Copyright 2013 Akihiro Takizawa <akihiro.takizawa@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
