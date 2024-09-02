
.PHONY: all watch

INPUT = resume.typ
OUTPUT = $(basename $(notdir $(CONFIG))).pdf

LANG ?= en
CONFIG ?= ./configs/example.yaml

OPTIONS += --input config=$(CONFIG)
OPTIONS += --input lang=$(LANG)

all:
	typst compile $(OPTIONS) $(INPUT) $(OUTPUT)

watch:
	typst watch $(OPTIONS) $(INPUT) $(OUTPUT) --open
