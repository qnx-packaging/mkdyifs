SHELL := /bin/bash
SCRIPTS := mkdyifs bin/mkdyifs

PREFIX ?= /usr/local
DESTDIR ?=

.PHONY: lint lint-shellcheck lint-bash install

lint: lint-bash lint-shellcheck

lint-bash:
	bash -n $(SCRIPTS)

lint-shellcheck:
	shellcheck $(SCRIPTS)

install:
	install -d -m0755 "$(DESTDIR)$(PREFIX)/share/mkdyifs"
	install -m0755 mkdyifs "$(DESTDIR)$(PREFIX)/share/mkdyifs/mkdyifs"
	cp -a common hooks install "$(DESTDIR)$(PREFIX)/share/mkdyifs/"
	install -D -m0755 bin/mkdyifs "$(DESTDIR)$(PREFIX)/bin/mkdyifs"
