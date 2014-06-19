
# To the extent possible under law, the person who associated CC0
# with this work has waived all copyright and related or neighboring
# rights to this work.
# http://creativecommons.org/publicdomain/zero/1.0/

all : clean generate

clean :
	rm -rf layers build

generate :
	mkdir layers
	mkdir build
	./src/generate-layers.pl < simple-properties.txt
	rm -rf layers
