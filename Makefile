origens := $(shell find . -name '*.html.sh')
destinos := $(origens:.html.sh=.html)

.PHONY: all

all: $(destinos)

.SECONDEXPANSION:
%.html: %.html.sh $$(wildcard $$@.*.snippet) wiki.sh
	bash "$<" > "$@.tmp"
	mv "$@.tmp" "$@"
