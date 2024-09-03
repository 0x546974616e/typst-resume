
.PHONY: all watch

INPUT = resume.typ
OUTPUT = $(basename $(notdir $(CONFIG))).pdf

LANGCC ?= en # To avoid conflicts with LANG and LANGUAGE (CC = Country Code).
CONFIG ?= ./configs/example.yaml

OPTIONS += --input config=$(CONFIG)
OPTIONS += --input lang=$(LANGCC)

all:
	typst compile $(OPTIONS) $(INPUT) $(OUTPUT)

watch:
	typst watch $(OPTIONS) $(INPUT) $(OUTPUT) --open
