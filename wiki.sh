#!/bin/bash
#@+leo-ver=5-thin
#@+node:caminhante.20211113154658.1: * @file wiki.sh
#@@first
#@+others
#@+node:caminhante.20211113154749.1: ** function page
function page { cat <<AAA
<!DOCTYPE html>
<html lang="$1">
`cat`
</html>
AAA
}
#@+node:caminhante.20211113155149.1: *3* function head
function head { cat <<AAA
<head>
<meta charset="utf-8"/>
<meta name="editor" content="Leo Editor"/>
<meta name="author" content="https://github.com/XCaminhante"/>
`[ ! -z $2 ] && echo "<base href=\"$2\"/>"`<title>$1</title>
<style type="text/css">@import "style.css";</style>
</head>
AAA
}
#@+node:caminhante.20211113155259.1: *3* function body
function body { cat <<AAA
<body>
`cat`
</body>
AAA
}
#@+node:caminhante.20211113155353.1: *4* function header
function header { cat <<AAA
<div id="header"><a href="$2">$1</a></div>
AAA
}
#@+node:caminhante.20211113155828.1: *4* function menu
function menu { cat <<AAA
<div id="menu">
`cat`
</div>
AAA
}
#@+node:caminhante.20211113155856.1: *5* function menuframe
function menuframe { cat <<AAA
<div class="menuframe">`if [ ! -z "$1" ]; then echo "<span>$1</span><br/>"; fi`
`cat`
</div>
AAA
}
#@+node:caminhante.20211113161059.1: *5* function meunlink
function menulink { cat <<AAA
<a href="$2">$1</a><br/>
AAA
}
#@+node:caminhante.20211113162111.1: *4* function content
function content { cat <<AAA
<div id="content">
`cat`
</div>
AAA
}
#@+node:caminhante.20211113162226.1: *5* function hx
function hx { cat <<AAA
<h$1>$2</h$1>
AAA
}
#@+node:caminhante.20211113162302.1: *6* function h1
function h1 { hx 1 "$1"; }
#@+node:caminhante.20211113162342.1: *6* function h2
function h2 { hx 2 "$1"; }
#@+node:caminhante.20211113162342.2: *6* function h3
function h3 { hx 3 "$1"; }
#@+node:caminhante.20211113163411.1: *5* function p
function p { cat <<AAA
<p>`cat`</p>
AAA
}
#@+node:caminhante.20211113172429.1: *5* function pre
function pre { cat <<AAA
<pre>`cat`</pre>
AAA
}
#@+node:caminhante.20211113163516.1: *5* function code
function code { cat <<AAA
<code>`cat`</code>
AAA
}
#@+node:caminhante.20211113172218.1: *5* function filecode
function filecode {
    cat "$1" | sed -r -e 's/\r//g' -e 's/</\&lt;/g' -e 's/(.*)/<code>\1<\/code>/g'
}
#@+node:caminhante.20211113221342.1: *5* function outerlink
function outerlink { cat <<AAA
<a target="_blank" href="$2">$1</a>
AAA
}
#@+node:caminhante.20211114185332.1: *5* function link
function link { cat <<AAA
<a href="$2">$1</a>
AAA
}
#@+node:caminhante.20211113164249.1: *4* function footer
function footer { cat <<AAA
<div id="footer">
All content is © `date '+%Y'` by its respective authors.
By submitting content to this site, you agree to release it under the <a href="LICENSE.txt">$1 license</a>.
</div>
AAA
}
#@-others
#@-leo
