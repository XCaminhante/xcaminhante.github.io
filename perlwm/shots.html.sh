#@+leo-ver=5-thin
#@+node:caminhante.20211115084240.1: * @file shots.html.sh
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
#@+node:caminhante.20211115084305.1: ** content
(
#@+others
#@+node:caminhante.20211114192507.1: *3* title
h1 'Perl Window Manager'
#@+node:caminhante.20211115084350.1: *3* 1.
cat <<AAA
<p>
A sample screen shot. Remember that appearance is not the current focus of the project - so it doesn't really look that
special (but these days you've got to have screenshots - even if you are writing a console app!). In the future, I hope
to be able to use themes from existing window managers.
</p>
<p><a href="perlwm/images/shot.png"><img src="perlwm/images/shot-small.png"/></a></p>
AAA
#@+node:caminhante.20211114192645.1: *3* copy
echo "<small>http://perlwm.sourceforge.net/ adapted copy</small>" | p
#@-others
) | content
#@+node:caminhante.20211113222420.1: ** footer
footer 'GPLv3+'
#@-others
) | ( hhead "XCaminhante' files" 'https://xcaminhante.github.io/'; body ) | page pt-BR
#@-leo
