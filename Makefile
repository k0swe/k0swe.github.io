
.PHONY: all
all: _site

.PHONY: install
install:
	gem install bundler
	bundler install

_site: install
	bundler exec jekyll build

.PHONY: serve
serve: install
	bundler exec jekyll serve

.PHONY: clean
clean:
	rm -rf _site
