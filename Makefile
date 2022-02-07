##
#
#   Makefile
#
#   (c) 2022 Matt Meissner. All rights reserved.
#
#   <#description#>
#
##

all: zip/Default+.nnwtheme.zip

ZIPS = zip/Default+.nnwtheme.zip

zip/Default+.nnwtheme.zip: Default+.nnwtheme/Info.plist Default+.nnwtheme/stylesheet.css Default+.nnwtheme/template.html
	zip -u $@ $^


zip/%.zip: %/Info.plist %/stylesheet.css %/template.html
zip/%z: %/Info.plist %/stylesheet.css %/template.html

zip/%.zip zip/%z:
	cd src && zip -u ../$@ $*
	#cd $(<D) && zip -u ../../$@ $^

clean:
	$(RM) $(ZIPS)

clobber: clean

.PHONY: install
install: $(ZIPS)
	cp zip/Default+.nnwtheme.zip ~/Sites
	open 'netnewswire://theme/add?url=http://link.local/~matt/Default%2b.nnwtheme.zip'


# vi: set tw=80 ts=4 sw=4 noet:
