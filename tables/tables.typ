#import "../template.typ": header_layout, footer_layout

#set page(
  margin: (x: 2cm, y: 5cm),
  footer: footer_layout
)

#set text(font: "Segoe UI", size: 10pt)

// Table of Contents
#header_layout
#v(-5em)

#outline(
  title: text(font: "Segoe UI", weight: "bold", size: 16pt)[Table des Matières#v(0.5em)],
  indent: true,
  depth: 3
)
#v(-12em)
#header_layout

#pagebreak(weak: false)

// List of Figures
#header_layout
#v(-6em)

#outline(
  title: text(font: "Segoe UI", weight: "bold", size: 16pt)[Table des Figures#v(0.5em)],
  target: figure.where(kind: image)
)

#pagebreak(weak: false)

// List of Tables
#header_layout
#v(-5em)

#outline(
  title: text(font: "Segoe UI", weight: "bold", size: 16pt)[Liste des Tableaux#v(1em)],
  target: figure.where(kind: table)
)