#@+leo-ver=5-thin
#@+node:caminhante.20211114192841.1: * @file docs.html.sh
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
#@+node:caminhante.20211114193044.1: ** content
(
#@+others
#@+node:caminhante.20211114192507.1: *3* title
h1 'Perl Window Manager'
#@+node:caminhante.20211114193132.1: *3* 1.
cat <<AAA | p
<b>Sorry, this documentation is pretty out of date - and applies to perlwm 0.0.1.</b>
AAA
cat <<AAA | p
There are currently a handful of configuration variables that you can change (althought they are not yet in a seperate
configuration file). They control things like fonts, colors, and the combinations in which they are used, as well as
actions and bindings.
AAA
#@+node:caminhante.20211114194331.1: *3* %font
echo "<b>%font</b> - this defines the fonts that will be used. It maps a name to a font definition." | p
filecode 'docs.html.font.snippet' | pre | p
#@+node:caminhante.20211114194342.1: *3* %color
echo "<b>%color</b> - this defines the colors that will be used. It maps a name to a color definition." | p
filecode 'docs.html.color.snippet' | pre | p
#@+node:caminhante.20211114194353.1: *3* %gc
cat <<AAA | p
<b>%gc</b> - this defines the GCs (graphics contexts) that will be used to draw various elements. It maps names to GC
attributes - fonts and colors used must be in defined in %font or %color. GCs are cached (as are fonts and colors).
(Currently, the value of this variable looks a bit redundant, but in future it should become more useful.)
AAA
filecode 'docs.html.gc.snippet' | pre | p
#@+node:caminhante.20211114194357.1: *3* %dim
echo "<b>%dim</b> - this defines various dimensions." | p
filecode 'docs.html.dim.snippet' | pre | p
#@+node:caminhante.20211114194404.1: *3* %actions
cat <<AAA | p
<b>%actions</b> - this defines 'actions' (perhaps 'functions' might be a better term). They define what piece of code
gets executed for a particular event (press, drag and release).
AAA
filecode 'docs.html.actions.snippet' | pre | p
#@+node:caminhante.20211114194411.1: *3* %bindings
cat <<AAA | p
<b>%bindings</b> - this defines how buttons (and in the future keys) are bound to actions in various contexts.
AAA
filecode 'docs.html.bindings.snippet' | pre | p
#@+node:caminhante.20211114194417.1: *3* Sample action code
cat <<'AAA' | p
<b>Sample action code</b>. Here is the code needed to define the 'move' action. It will be called during a drag (after
an appropriate binding has been triggered). The three parameters are <code>$c</code> (client - describes the window),
<code>$s</code> (state - describes the current action state) and <code>$e</code> (event - the most recent X event). What
this function <em>does</em> is move the current window <code>my</code> the incremental amount the mouse moved since the
last event. This configuration gives us what is usually called 'opaque move' - the whole window will move with the
mouse. Other behaviour can be easily achieved by handling just the press and release, or handling the drag differently.
AAA
filecode 'docs.html.sample.snippet' | pre | p
#@+node:caminhante.20211114192645.1: *3* copy
echo "<small>http://perlwm.sourceforge.net/ adapted copy</small>" | p
#@-others
) | content
#@+node:caminhante.20211113222420.1: ** footer
footer 'GPLv3+'
#@-others
) | ( head "XCaminhante' files" 'https://xcaminhante.github.io/'; body ) | page pt-BR
#@-leo
