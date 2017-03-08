.PHONY: clean deploy test
targets:=$(subst .dot,.png,$(shell ls *.dot))
all: clean $(targets) deploy
%.png:%.dot
	dot -Tpng -o$@ $<
clean:
	rm -f $(targets)
deploy:
	cp *.png *.html /var/www/transformer
test:
	echo $(targets)
