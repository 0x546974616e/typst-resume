#import "./globals.typ": colors, spacing, column-size

#let left-panel(content) = {
  // 1
  // |\
  // | \
  // |  \2
  // |   |
  // |   |
  // 4---3
  polygon(
    fill: colors.bg2,
    (0pt, 0pt),
    (column-size, column-size),
    (column-size, 100%),
    (0pt, 100%),
  ) // polygon

  place(
    dy: -100%,
    text(
      fill: colors.fg4,
      block(
        inset: 1.5 * spacing.large,
        content,
      ) // block
    ) // text
  ) // place
}

#let right-panel(content) = {
  block(
    fill: colors.bg1,
    inset: 1.5 * spacing.large,
    content,
  ) // block
}
