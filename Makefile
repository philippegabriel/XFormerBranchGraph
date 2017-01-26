.PHONY: clean deploy test
targets:=$(subst .dot,.png,$(shell ls *.dot))
all: $(targets) deploy
%.png:%.dot
	dot -Tpng -o$@ $<
clean:
	rm -f $(targets)
deploy:
	cp $(targets) /var/www/pub
test:
	echo $(targets)
