origens := $(shell find . -name '*.html.sh')
destinos := $(origens:.html.sh=.html)
all: $(destinos)

%.html: %.html.sh wiki.sh
	bash "$<" > ".tmp.$@"
	mv ".tmp.$@" "$@"
