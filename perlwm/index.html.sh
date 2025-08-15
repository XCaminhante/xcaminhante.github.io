#@+leo-ver=5-thin
#@+node:caminhante.20211115084542.1: * @file index.html.sh
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
#@+node:caminhante.20211115084616.1: ** content
(
#@+others
#@+node:caminhante.20211114192507.1: *3* title
h1 'Perl Window Manager'
#@+node:caminhante.20211115084657.1: *3* 1.
cat <<AAA
<p>
<b>perlwm</b> is a window manager written entirely in perl. Why would you want such a thing? Why would a perl one be
worth having? Who knows - it seemed like a good idea at the time; I was getting fed up with having to switch between
workspaces to get stuff done on my laptop and I had some vague ideas about how a better window manager might help me. I
set off to find the perfect window manager, but couldn't really find one which solved all my problems.
</p><p>
So, rather than do <em>the right thing</em> and contribute to an existing window manager, I decided to write my own - in
perl. All the mature window managers looked pretty tricky to make any major changes - especially changes in behaviour.
Also, I thought that perl would be good at some of the configuration stuff I wanted, and I was hacking a lot of perl
recently and doing wonderful things in just a few lines.
</p><p>
There had been talk of perl window managers before, but I couldn't find one which had got as far as actually managing
any windows. Not really knowing where to start, I stumbled across <code>X11::Protocol</code> on CPAN. That and the
chapter on window management in one of the X books got me going. Within a couple of hours, I was drawing my own frames.
</p><p>
Since other people had mentioned the idea before, I thought that making it all public would in some way repay my debt to
society and so this project (kindly hosted for free by <a href="http://sourceforge.net/">SourceForge</a>) was started.
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
