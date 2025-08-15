#@+leo-ver=5-thin
#@+node:caminhante.20211113195431.1: * @file links.html.sh
. wiki.sh
(
#@+others
#@+node:caminhante.20211113222153.1: ** header
header "XCaminhante' files" 'index.html'
#@+node:caminhante.20211113222211.1: ** menu
(
#@+others
#@+node:caminhante.20211113222237.1: *3* main pages
( menulink 'Vesta CMS' vesta.html
menulink 'PerlWM' perlwm/index.html
menulink 'WindWM' windwm/index.html
menulink 'External Links' links.html ) | menuframe 'Main pages'
#@-others
) | menu
#@+node:caminhante.20211113222124.1: ** content
(
#@+others
#@+node:caminhante.20211113221247.1: *3* title
h1 'External Links'
#@+node:caminhante.20211113221253.1: *3* 1
h2 'Technical blogs, link blogs'
outerlink "Tony Finch's link log" 'https://dotat.at/:/?' | p
#@+node:caminhante.20211113222033.1: *3* 2
h2 'Old technological treasures'
outerlink 'Simple Forth' "https://web.archive.org/web/20000823134712/http://www.albany.net/~hello/simple.htm" | p
#@+node:caminhante.20211113222642.1: *3* 3
h2 'Perl links'
outerlink 'The Impatient Introduction to Perl' "https://www.perl.org/books/impatient-perl/" | p
#@+node:caminhante.20211113222643.1: *3* 4
h2 'Miscelanea'
outerlink 'Zeppo.' "zeppo.html" | p
outerlink 'In memorian, fzort.org' "fzort.html" | p
#@-others
) | content
#@+node:caminhante.20211113222420.1: ** footer
footer 'GPLv3+'
#@-others
) | ( hhead "XCaminhante' files" 'https://xcaminhante.github.io/'; body ) | page pt-BR
#@-leo
