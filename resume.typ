#import "./template/project.typ": resume

#if not "config" in sys.inputs {
  panic("Please provide a config file with --input config=FILE")
}

#if not "lang" in sys.inputs {
  panic("Please provide a language with --input lang=LANG")
}

#resume(
  yaml(sys.inputs.config),
  sys.inputs.lang,
)
