TARGETS = mssop


LATEX   = pdflatex
BIBTEX  = bibtex

all:  $(TARGETS) debug

$(MSC_RENDERED):
	echo $@
	$(MSC) -T $(MSC_TYPE) -o $@.$(MSC_TYPE) $@.msc

$(TARGETS):
	$(LATEX) $@
	-$(BIBTEX) $@ > $(BIBTEX)_out.log
	$(LATEX) $@
	$(LATEX) $@
	$(LATEX) $@

debug:
	-grep Warning *.log

clean:
	rm -f images/*.aux images/*.log *.aux *.bbl *.blg *.log *.dvi *.bak *~ $(TARGETS:%=%.pdf)



