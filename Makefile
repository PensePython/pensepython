# Makefile for Sphinx documentation
#
# You can set these variables from the command line.
COURSEID = pensePython
APPNAME  = pensePython
LOGINREQ  = false
LOGLEVEL  = 10
COURSEURL = https://panda.ime.usp.br

#
#
TEMPLATEDEFS  = -A course_id=$(COURSEID) -A appname=$(APPNAME) -A loglevel=$(LOGLEVEL) -A course_url=$(COURSEURL) -A login_required=$(LOGINREQ)
SPHINXOPTS    = -a -E 
SPHINXBUILD   = /usr/local/bin/sphinx-build
PAPER         =
BUILDDIR      = static/$(COURSEID)
# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) $(TEMPLATEDEFS) source
# the i18n builder cannot share the environment and doctrees with the others
I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) source

.PHONY: help clean pensePython

help:
	@echo "Please use \'make <target>' where <target> is one of"
	@echo "  pensePython  para compilar a tradução do livro Think Python"

all:	pensePython

clean:
	-rm -rf static/*
	-rm -rf pensePython/*~

############################################################
# pensePython: tradução do livro Think Python
pensePython: COURSEID  = pensePython
pensePython: APPNAME   = pensePython
pensePython: LOGINREQ  = false
pensePython: COURSEURL = https://panda.ime.usp.br
pensePython:
	$(SPHINXBUILD) -d static/$(COURSEID)/doctrees $(SPHINXOPTS) -A project='Pense em Python' $(TEMPLATEDEFS) pensePython static/$(COURSEID)

