#@+leo-ver=5-thin
#@+node:caminhante.20211115083539.1: * @file news.html.sh
. wiki.sh
(
#@+others
#@+node:caminhante.20211113222153.1: ** header
header "XCaminhante' files" 'index.html'
#@+node:caminhante.20211114192004.1: ** menu
(
#@+others
#@+node:caminhante.20211113222237.1: *3* main pages
( menulink 'Vesta CMS' vesta.html
menulink 'PerlWM' perlwm/index.html
menulink 'WindWM' windwm/index.html
menulink 'External Links' links.html ) | menuframe 'Main pages'
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
#@+node:caminhante.20211115083740.1: ** content
(
#@+others
#@+node:caminhante.20211114192507.1: *3* title
h1 'Perl Window Manager'
#@+node:caminhante.20211115083859.1: *3* 1.
cat <<'AAA'
<b>2004.05.23</b>
<p>
perlwm-0.0.7 is released. There is a new config system. If you run <code>perl -MPerlWM::Config -e
'PerlWM::Config->load()->save(default => 1)'</code> all the default preferences will be written to a file
(~/.perlwm/config.pm). Hopefully in the next release, you'll be able to configure more things.
</p>
<b>2004.05.16</b>
<p>
perlwm-0.0.6 is released. Not much new here, just a couple of minor bug fixes related to the search action.
</p>
<b>2003.12.22</b>
<p>
perlwm-0.0.5 is released. Yet more cleanup in the event handling code. Keyboard bindings now work, along with grabs and
some support for 'modal' actions. You can now re-size and move windows with the keyboard, as well as raise, lower and
switch focus.
</p>
<b>2003.11.10</b>
<p>
perlwm-0.0.4 is released. More cleanup in the event handling code, the focus handling is much more reliable now. Also,
the focus frame is now highlighted again, and with an animated color blend too.
</p>
<b>2003.11.08</b>
<p>
perlwm-0.0.3 is released. Still no new functionality, but the event code has been further cleaned up, and various stuff
which was just lumped in PerlWM.pm has been moved into Frame, Client or Action.
</p>
<b>2003.11.02</b>
<p>
perlwm-0.0.2 is released. Slow progress eh? Well I've been busy. This is pretty much a completely re-write compared to
0.0.1, but a lot more works.
</p>
<b>2000.05.18</b>
<p>
perlwm-0.0.1 is released. This version has (very) basic window manager functionality. The configuration is currently
embedded in perlwm itself, but this will change. Currently, you can move and resize windows, but not iconify them. Most
window manager hints are ignored (except the title).
</p>
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
