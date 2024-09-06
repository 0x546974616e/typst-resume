#import "./globals.typ": colors, spacing, get-lang
#import "./heading.typ": h3, h4

#let make-picture(picture) = {
  block(
    inset: spacing.medium,
    // inset: spacing.large,
    block(
      clip: true,
      radius: 100%,
      stroke: none,
      // stroke: 6pt + colors.bg2,
      // stroke: 4pt + colors.bg3,
      image("../" + picture),
    ) // block
  ) // block
}

#let get-fullname(profil) = (
  ("lastname", "firstname")
    .map(info => profil.at(info, default: none))
    .filter(info => info != none)
)

#let make-header(profil) = {
  let items = ()
  let fullname = get-fullname(profil)

  if fullname.len() >= 1 {
    items.push(
      text(
        size: 1.5em,
        weight: 500,
        fill: colors.fg1,
        fullname.join(" ")
      ) // text
    )
  }

  if "position" in profil {
    items.push(
      text(
        size: 1.125em,
        weight: 400,
        fill: colors.fg3,
        get-lang(profil.position),
      ) // text
    )
  }

  if "description" in profil {
    items.push(
      text(
        size: 1.0em,
        weight: 400,
        fill: colors.fg3,
        get-lang(profil.description),
      ) // text
    )
  }

  if items.len() >= 1 {
    stack(
      dir: ttb,
      spacing: spacing.medium,
      ..items,
    ) // stack
  }
}

#let make-profil(profil) = {
  let details = ()
  // TODO: Translate.
  for info in ("phone", "email", "age", "address", "@github") {
    let href = info.first() == "@"
    if href { info = info.slice(1) }
    if info in profil {
      details.push(
        stack(
          dir: ttb,
          spacing: 2 * spacing.medium,
          h3(info),
          if href { link(str(profil.at(info))) }
          else { str(profil.at(info))}
        ) // stack
      )
    }
  }

  if details.len() >= 1 {
    // TODO: TMP
    let columns = if details.len() >= 4 {
      (2fr, 3.25fr, 1fr)
    }
    else {
      (1fr, 1fr, 1fr)
    }

    table(
      columns: columns, // (auto, 1fr, auto),
      // align: (left, center, left),
      gutter: 2 * spacing.large,
      stroke: none,
      inset: 0pt,
      ..details,
    ) // table
  }
}

#let make-skills(skills) = {
  stack(
    dir: ttb,
    spacing: 2 * spacing.large,
    ..skills.map(
      ((field, skills)) => {
        stack(
          dir: ttb,
          spacing: 2 * spacing.medium,
          h3(get-lang(field), color: colors.fg4),
          par(
            leading: spacing.medium,
            skills.map(skill => box(get-lang(skill))).join(", "),
          ) // par
        ) // stack
      } // function
    ) // map
  ) // stack
}

#let make-interests(interests) = {
  interests = get-lang(interests)
  stack(
    dir: ttb,
    spacing: spacing.medium,
    ..interests.intersperse(",").chunks(2).map(array.join)
  ) // stack
}

/**
 * Example:
 * ```typ
 * #make-table(
 *   config.experiences, (
 *     // "&" concat a field with the previous one (only for dates).
 *     date: ( "start", "stop", "&months" ),
 *     title: ( "company", "position" ),
 *     body: ( "description", ),
 *     transform: (
 *       months: (month) => [(#month months)],
 *     ),
 *   ),
 * )
 * ```
 */
#let make-table(objects, fields) = {
  if objects.len() <= 0 {
    return // Nothing
  }

  stack(
    dir: ttb,
    spacing: 2 * spacing.large,
    ..objects.map(
      object => {
        let header = ()
        let body = ()

        // 1. Date & Title
        for field in (fields.date, fields.title).flatten() {
          let stick = field.first() == "&"
          if stick { field = field.slice(1) }
          if field in object {
            let item = get-lang(object.at(field));
            if field in fields.transform {
              item = fields.transform.at(field)(item)
            }

            if header.len() >= 1 and stick {
              // TODO: Inefficient, check if type is array instead.
              item = (header.pop(), item)
            }

            header.push(item)
          }
        }

        // 2. Body
        for field in fields.body {
          if field in object {
            let items = get-lang(object.at(field))
            for item in items {
              if field in fields.transform {
                item = fields.transform.at(field)(item)
              }

              body.push(item)
            }
          }
        }

        // A. Prepare items
        let items = ()

        // B. Add header
        if header.len() >= 2 and object.at("break", default: false) {
          // TODO: Inefficient, check if type is array instead.
          let last2 = (header.pop(),).flatten()
          let last1 = (header.pop(),).flatten()

          // B.1.
          // +------------------------------------+
          // | +--------------------+ +---------+ |
          // | | item - item - item | | - last1 | |
          // | +--------------------+ | - last2 | |
          // |                        +---------+ |
          // +------------------------------------+
          items.push(
            stack(
              dir: ltr,
              spacing: spacing.medium,
              ..header.intersperse(sym.dash.en).flatten().map(h4),
              stack(
                dir: ttb,
                spacing: spacing.medium,
                ..(last1, last2).map(
                  item => stack(
                    dir: ltr,
                    spacing: spacing.medium,
                    h4(sym.dash.en),
                    ..item.map(h4),
                  ) // stack
                ) // map
              ) // stack
            ), // stack
          )
        }
        else {
          // B.2. Add all items on the same line.
          // +----------------------------------+
          // | item - item - item - item - item |
          // +----------------------------------+
          items.push(
            stack(
              dir: ltr,
              spacing: spacing.medium,
              ..header.intersperse(sym.dash.en).flatten().map(h4),
            ), // stack
          )
        }

        // C. Add body
        if body.len() >= 1 {
          items.push(
            stack(
              dir: ttb,
              spacing: spacing.medium,
              ..body.map(par.with(leading: spacing.medium)),
            ) // stack
          ) // push
        }

        // Return
        stack(
          dir: ttb,
          spacing: 2 * spacing.medium,
          ..items,
        ) // stack
      } // function
    ) // map
  ) // stack
}
