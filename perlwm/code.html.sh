#@+leo-ver=5-thin
#@+node:caminhante.20211114191709.1: * @file code.html.sh
. wiki.sh
(
#@+others
#@+node:caminhante.20211113222153.1: ** header
header "XCaminhante' files" 'index.html'
#@+node:caminhante.20211114192004.1: ** menu
(
#@+others
#@+node:caminhante.20211113222237.1: *3* main pages
( menulink 'About' index.html
menulink 'Vesta CMS' vesta.html
menulink 'PerlWM' perlwm/index.html
menulink 'WindWM' windwm/index.html
menulink 'External Links' links.html ) | menuframe
#@+node:caminhante.20211114192244.1: *3* PerlWM pages
( menulink 'Home' "perlwm/index.html"
menulink 'News' "perlwm/news.html"
menulink 'Screen shot' "perlwm/shots.html"
menulink 'Docs (outdated)' "perlwm/docs.html"
menulink 'Code release' "perlwm/code.html"
menulink 'Original site' "http://perlwm.sourceforge.net/"
) | menuframe 'Perl WM'


#@-others
) | menu
#@+node:caminhante.20211114192152.1: ** content
(
#@+others
#@+node:caminhante.20211114192507.1: *3* title
h1 'Perl Window Manager'
#@+node:caminhante.20211114192521.1: *3* 1.
echo "There are a number of ways you can get the code:" | p
outerlink 'At the original site.' "http://prdownloads.sourceforge.net/perlwm/perlwm-0.0.7.tar.gz?download" | p
outerlink 'At this mirror.' "https://github.com/XCaminhante/perlwm/releases" | p
#@+node:caminhante.20211114192645.1: *3* copy
echo "<small>http://perlwm.sourceforge.net/ adapted copy</small>" | p
#@-others
) | content
#@+node:caminhante.20211113222420.1: ** footer
footer 'GPLv3+'
#@-others
) | ( hhead "XCaminhante' files" 'https://xcaminhante.github.io/'; body ) | page pt-BR
#@-leo
