##
#
#   Makefile
#
#   (c) 2022 Matt Meissner. All rights reserved.
#
#   <#description#>
#
##

VPATH += src

THEMES = $(addprefix themes/,$(addsuffix .zip,$(notdir $(wildcard src/*.nnwtheme))))

all: $(THEMES)

themes/%.zip: %/Info.plist %/stylesheet.css %/template.html
	zip -u $@ $^

clean:
	$(RM) $(THEMES)

clobber: clean



# vi: set tw=80 ts=4 sw=4 noet:
