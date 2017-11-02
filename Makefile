.PHONY: clean deploy test
targets=$(addprefix ./png/,$(subst .dot,.png,$(shell ls *.dot)))
targets+=$(addprefix ./svg/,$(subst .dot,.svg,$(shell ls *.dot)))
all: $(targets) deploy
./png/%.png:%.dot
	dot -Tpng -o$@ $<
./svg/%.svg:%.dot
	dot -Tsvg -o$@ $<
clean:
	rm -f $(targets)
deploy:
	cp $(targets) *.html /var/www/transformer
test:
	echo $(targets)
