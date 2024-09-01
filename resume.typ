#import "./template/project.typ": resume

#{
  if not "config" in sys.inputs {
    panic("Please provide a config file with --input config=FILE")
  }

  resume(yaml(sys.inputs.config))
}
