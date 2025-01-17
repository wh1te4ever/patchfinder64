ifeq ($(OS),Windows_NT) 
	detected_OS := Windows
else
    detected_OS := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
endif

all: patchfinder64

.PHONY: patchfinder64

bin:
	@mkdir bin

patchfinder64: bin/patchfinder64

bin/patchfinder64: patchfinder64.c | bin
ifeq ($(detected_OS),Darwin)
		gcc -g -DHAVE_MAIN patchfinder64.c -o ./bin/patchfinder64
else
		gcc -g -DHAVE_MAIN -DNOT_DARWIN patchfinder64.c -o ./bin/patchfinder64
endif

clean:
	rm -f bin/patchfinder64
