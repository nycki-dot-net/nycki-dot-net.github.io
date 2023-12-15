all: static site/index.html site/index.md

.PHONY: clean site static

clean:
	rm -r site

site:
	mkdir -p site

static: site
	cp -r static/* site

site/xkcd.css: src/xkcd-rgb.txt src/xkcd-css.py
	python3 src/xkcd-css.py > site/xkcd.css

site/style.css: site/xkcd.css src/style.css
	cp src/style.css site/style.css

site/index.html: site/style.css src/index.md src/nav.html
	pandoc src/index.md \
		--standalone \
		--section-divs \
		--css style.css \
		--no-highlight \
		--include-before-body src/nav.html \
		--from markdown+emoji \
		-o site/index.html

site/index.md: src/index.md
	cp src/index.md site/index.md
