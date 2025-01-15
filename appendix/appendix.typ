#import "../template.typ": header_layout, footer_layout

#set page(
  margin: (x: 2cm, y: 5cm),
  numbering: "1/1",
  footer: footer_layout
)

#set text(font: "Segoe UI", size: 12pt)
#set par(justify: true)

#set heading(numbering: none)

// Fonction pour les annexes stylisées
#let annex_block(title: none, content) = {
  block(
    width: 100%,
    inset: 1em,
    radius: 4pt,
    stroke: 1pt + rgb(200, 200, 200),
  )[
    #if title != none {
      text(weight: "bold", size: 12pt)[#title]
    }
    #content
  ]
}
#header_layout
#v(-6em)

= ANNEXES

#v(1em)

#annex_block(
  title: "https://git.enib.fr/a24machko/md_to_typst
",
  []
)

#annex_block(
  title: "https://git.enib.fr/a24machko/vitepress
",
  []
)

#annex_block(
  title: "https://git.enib.fr/y24terro/template_rapport_de_stage
",
  []
)

#annex_block(
  title: "https://git.enib.fr/y24terro/rapport_de_stage_2024_2025
",
  []
)

