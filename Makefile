##
#
#   Makefile
#
#   (c) 2022 Matt Meissner. All rights reserved.
#
#   <#description#>
#
##

BUILDDIR = .build
THEMES = $(shell ls -d *.nnwtheme)
ZIPS = $(foreach theme,$(THEMES),$(BUILDDIR)/$(theme).zip)

.PHONY: all
all: $(ZIPS)

$(BUILDDIR):
	install -d $@

$(BUILDDIR)/%.zip: %/Info.plist %/stylesheet.css %/template.html | $(BUILDDIR)
	# stylelint --formatter unix $*/stylesheet.css
	zip -u $@ $^

.PHONY: clean
clean:
	$(RM) $(ZIPS)

.PHONY: clobber
clobber: clean
	$(RM) -r $(BUILDDIR)/

.PHONY: install
install: $(ZIPS)
	for zip in $(ZIPS); do \
		bname=$$(basename $${zip} | sed 's/\+/%2b/g'); \
		cp $${zip} ~/Sites; \
		open "netnewswire://theme/add?url=http://$$(hostname -s).local/~matt/$${bname}"; \
	done


# vi: set tw=80 ts=4 sw=4 noet:
