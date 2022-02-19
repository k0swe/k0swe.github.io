
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

.PHONY: update
update: install
	bundler update

.PHONY: format
format:
		prettier --write .

.PHONY: clean
clean:
	rm -rf _site
