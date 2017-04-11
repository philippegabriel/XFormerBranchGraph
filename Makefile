.PHONY: clean deploy test
targets=$(subst .dot,.png,$(shell ls *.dot))
targets+=$(subst .dot,.svg,$(shell ls *.dot))
all: clean $(targets) deploy
%.png:%.dot
	dot -Tpng -o$@ $<
%.svg:%.dot
	dot -Tsvg -o$@ $<
clean:
	rm -f $(targets)
deploy:
	cp $(targets) *.html /var/www/transformer
test:
	echo $(targets)
