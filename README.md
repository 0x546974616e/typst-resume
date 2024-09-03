
# Typst Resume

A simple and modern resume template written in [Typst][].

[Typst]: https://github.com/typst/typst

## To build

```sh
make
make all
make watch

make all CONFIG=<path/to/file.yaml> LANGCC=<lang>
make watch CONFIG=<path/to/file.yaml> LANGCC=<lang>
```

If no `CONFIG` is provided, [`example.yaml`](configs/example.yaml) is loaded by default.

(Translations are still WIP)
