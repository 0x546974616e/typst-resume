#import "./globals.typ": colors, spacing

#let h2(content, color: colors.fg2) = {
  block(
    align(
      left + horizon,
      stack(
        dir: ltr,
        spacing: spacing.medium,
        rect(
          width: 7pt,
          height: 7pt,
          fill: color,
        ), // rect
        heading(
          level: 2,
          text(
            fill: color,
            upper(content),
          ) // text
        ), // heading
      ) // stack
    ) // align
  ) // block
}

#let h3(content, color: colors.fg1) = {
  heading(
    level: 3,
    text(
      fill: color,
      weight: 500,
      upper(content)
    ) // text
  ) // heading
}

#let h4(value) = text(
  weight: 500,
  fill: colors.fg1,
  if type(value) == "content" {
    return value
  }
  else {
    str(value)
  }
)
