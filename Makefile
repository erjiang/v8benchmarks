#
# Makefile for FoxScheme, to create one foxscheme.js
#
#
# MINIFY is expected to be some program that takes JavaScript file
# and reduces its file size: $(MINIFY) in.js -o output.js
MINIFY=yuicomp
#
# FILES is a list of all the FoxScheme files, in the order that
# they should be run
FILES=\
base.js \
crypto.js \
deltablue.js \
earley-boyer.js \
raytrace.js \
regexp.js \
richards.js \
splay.js

OUTPUT_PATH=bin
OUTPUT = $(OUTPUT_PATH)/v8marks.js

$(OUTPUT): $(FILES) Makefile
	cat $(FILES) > $(OUTPUT)

rhino: $(OUTPUT) run_rhino.js
	cp $(OUTPUT) $(OUTPUT_PATH)/v8marks_rhino.js
	cat run_rhino.js >> $(OUTPUT_PATH)/v8marks_rhino.js

mug: $(OUTPUT) run_mug.js
	cp $(OUTPUT) $(OUTPUT_PATH)/v8marks_mug.js
	cat run_mug.js >> $(OUTPUT_PATH)/v8marks_mug.js

clean:
	rm $(OUTPUT)
	rm $(OUTPUT_PATH)/v8marks_rhino.js
