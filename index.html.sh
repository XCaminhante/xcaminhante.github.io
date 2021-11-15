#@+leo-ver=5-thin
#@+node:caminhante.20211114190846.1: * @file index.html.sh
. wiki.sh
(
#@+others
#@+node:caminhante.20211113222153.1: ** header
header "XCaminhante' files" 'index.html'
#@+node:caminhante.20211114191005.1: ** menu
(
#@+others
#@+node:caminhante.20211113222237.1: *3* main pages
( menulink 'About' index.html
menulink 'Vesta CMS' vesta.html
menulink 'PerlWM' perlwm/index.html
menulink 'WindWM' windwm/index.html
menulink 'External Links' links.html ) | menuframe
#@-others
) | menu
#@+node:caminhante.20211114191101.1: ** content
(
#@+others
#@+node:caminhante.20211114191121.1: *3* title
h1 'About this site'
#@+node:caminhante.20211114191134.1: *3* 1.
echo "I'll put technically interesting (at least for me) projects, articles and links here." | p
echo "My projects aren't much interesting yet, but they'll be. Someday." | p
#@-others
) | content
#@+node:caminhante.20211113222420.1: ** footer
footer 'GPLv3+'
#@-others
) | ( hhead "XCaminhante' files" 'https://xcaminhante.github.io/'; body ) | page pt-BR
#@-leo
