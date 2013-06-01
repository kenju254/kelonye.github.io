FILES=$(shell find css fonts) index.html

public: node_modules components $(FILES)
	@component build -o $@ -n $@ -c

node_modules:
	@npm install

components:
	@component install

clean:
	@rm -rf public

.PHONY: clean