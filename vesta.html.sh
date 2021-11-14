#@+leo-ver=5-thin
#@+node:caminhante.20211113232631.1: * @file vesta.html.sh
. wiki.sh
(
#@+others
#@+node:caminhante.20211113222153.1: ** header
header "XCaminhante' files" 'index.html'
#@+node:caminhante.20211114124512.1: ** menu
(
#@+others
#@+node:caminhante.20211113222237.1: *3* main pages
( menulink 'About' index.html
menulink 'Vesta CMS' vesta.html
menulink 'PerlWM' perlwm/index.html
menulink 'WindWM' windwm/index.html
menulink 'External Links' links.html ) | menuframe
#@+node:caminhante.20211114124647.1: *3* Vesta's related websites' backups
( menulink 'www.vestasys.org' "vesta/index.html"
menulink 'wiki.vestasys.org' "wiki-vesta/FrontPage.html"
menulink 'pub.vestasys.org' "pub-vesta/index.html"
) | menuframe "Vesta's websites' backups"
#@-others
) | menu
#@+node:caminhante.20211114124543.1: ** content
(
#@+others
#@+node:caminhante.20211114124900.1: *3* title
h1 'Vesta CMS'
#@+node:caminhante.20211114185209.1: *3* 1.
h2 'What is this project about'
echo 'Vesta Configuration Management System is an advanced software configuration management system. It handles source revision control and automated construction. It is the result of over 10 years of research and development at the Compaq/Digital Systems Research Center.' | p
echo 'Vesta CMS is LGPL-licensed software. This is an atempt to backup and revive the software. A copy of the associated websites will be mirrored here and the source-code mirrored on a Git repo.' | p
#@+node:caminhante.20211114185304.1: *3* 2.
h2 "$(link 'http://www.vestasys.org/' 'http://www.vestasys.org/') mirror"
( link 'Here.' "vesta/index.html"; echo " It's still under revision." ) | p
#@+node:caminhante.20211114185751.1: *3* 3.
h2 "$(link 'http://wiki.vestasys.org/' 'http://wiki.vestasys.org/') mirror"
( link 'Here.' "wiki-vesta/FrontPage.html"; echo " It's still under revision." ) | p
#@+node:caminhante.20211114185948.1: *3* 4.
h2 "$(link 'http://pub.vestasys.org/' 'http://pub.vestasys.org/') mirror"
link 'Will reside here soon.' "pub-vesta/index.html" | p
#@-others
) | content
#@+node:caminhante.20211113222420.1: ** footer
footer 'GPLv3+'
#@-others
) | ( head "XCaminhante' files" 'https://xcaminhante.github.io/'; body ) | page pt-BR
#@-leo
