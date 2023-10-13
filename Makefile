all: static site/index-2.html

.PHONY: site static

site:
	mkdir -p site

static: site
	cp -r static/* site

site/index-2.html: src/index.md src/nav.html
	pandoc src/index.md \
		--standalone \
		--section-divs \
		--css style.css \
		--no-highlight \
		--include-before-body src/nav.html \
		--from markdown+emoji \
		-o site/index-2.html
