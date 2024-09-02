
#let column-size = 160pt

#let spacing = (
  small: 2pt,
  medium: 4pt,
  large: 6pt,
)

#let colors = (
  fg1: rgb(60, 120, 216), // light blue
  fg2: rgb(17, 85, 204), // dark blue
  fg3: rgb("#434343"), // dark gray
  fg4: white,
  bg1: white,
  bg2: rgb(60, 120, 216), // light blue
  bg3: rgb(17, 85, 204), // dark blue
)

// State are boring now...
#let lang() = sys.inputs.at("lang", default: "en")
#let get-lang(object) = {
  if type(object) != "dictionary" {
    return object
  }

  let _lang = lang()
  if not _lang in object {
    // TODO: Better error handling.
    panic(_lang + " is missing.")
  }

  return object.at(_lang)
}
