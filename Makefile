JADE 			= $(shell find client -name "*.jade") index.jade
HTML 			= $(JADE:.jade=.html)
TEMPLATES = $(JADE:.jade=.js)

COFFEE = $(shell find client -name "*.coffee")
JS 		 = $(COFFEE:.coffee=.js)

LESS = $(shell find client -name "*.less" | grep -v bootstrap)
CSS  = $(LESS:.less=.css)

build: $(JS) $(CSS) $(HTML) $(TEMPLATES)
	@component build --dev

%.css: %.less
	lessc $< > $@

%.html: %.jade
	jade < $< --path $< > $@

%.js: %.html
	component convert $<

%.js: %.coffee
	coffee -bc $<

clean:
	rm -rf $(JS) $(CSS) $(HTML) $(TEMPLATES)

.PHONY: clean