
.PHONY: all watch

INPUT = resume.typ
CONFIG ?= ./configs/example.yaml
OUTPUT = $(basename $(notdir $(CONFIG))).pdf

all:
	typst compile --input config=$(CONFIG) $(INPUT) $(OUTPUT)

watch:
	typst watch --input config=$(CONFIG) $(INPUT) $(OUTPUT) --open
