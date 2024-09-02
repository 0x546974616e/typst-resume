#import "./globals.typ": colors, spacing, column-size
#import "./heading.typ": h2
#import "./layout.typ": right-panel, left-panel
#import "./section.typ": *

#let fullname(config) = {
  if "profil" in config {
    let items = get-fullname(config.profil)
    if items.len() >= 1 {
      return items.join(" ")
    }
  }

  ""
}

#let resume(config, lang) = {
  set page(
    margin: 0pt,
  )

  set text(
    size: 11.5pt,
    fill: colors.fg3,
    font: "Quicksand",
    // font: "Lato",
    weight: 400,
    lang: lang,
  )

  let author = fullname(config)
  set document(
    ..if author.len() > 0 {(
      author: author,
      title: author,
    )}
  )

  table(
    columns: (column-size, 1fr),
    stroke: none,
    inset: 0pt,
    left-panel({
      if "picture" in config {
        make-picture(config.picture)
      }
      else {
        v(size)
      }

      if "skills" in config and config.skills.len() >= 1 {
        h2(color: colors.fg4)[Skills]
        make-skills(config.skills)
      }

      if "interests" in config and config.interests.len() >= 1 {
        h2(color: colors.fg4)[Interests]
        make-interests(config.interests)
      }
    }), // left-panel
    right-panel({
      v(1.5 * spacing.large)

      if "profil" in config {
        make-header(config.profil)
        h2[Profil]
        make-profil(config.profil)
      }

      if "experiences" in config and config.experiences.len() >= 1 {
        h2[Experiences]
        make-table(
          config.experiences, (
            date: ( "start", "stop", "&months" ),
            title: ( "company", "position" ),
            body: ( "description", ),
            transform: (
              // months: (month) => [(#month months)],
              months: (month) => {
                "(" + str(month) + get-lang((
                  en: " months)",
                  fr: " mois)",
                ))
              }
            ),
          ),
        ) // make-table
      } // endif

      if "educations" in config and config.educations.len() >= 1 {
        h2[Education]
        make-table(
          config.educations, (
            date: ( "start", "stop" ),
            title: ( "schooling", "school" ),
            body: ( "description", ),
            transform: (:),
          ),
        ) // make-table
      } // endif

      if "projects" in config and config.projects.len() >= 1 {
        h2[Projects]
        make-table(
          config.projects, (
            date: ( "start", "stop" ),
            title: ( "title", "&repository" ),
            body: ( "description", ),
            transform: (
              repository: repository => {
                align(
                  horizon,
                  text(
                    size: 0.80em,
                    fill: colors.fg2,
                    "(" + link(repository) + ")"
                  ) // text
                ) // align
              } // function
            ),
          ),
        ) // make-table
      } // endif
    }) // right-panel
  ) // table
}
