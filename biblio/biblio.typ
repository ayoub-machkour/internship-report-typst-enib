#import "../template.typ": header_layout, footer_layout

// Configuration de la page
#set page(
    margin: (x: 0.5in, y: 2in),
    columns: 1,
    footer: footer_layout
)

// Configuration du document
#set text(font: "Segoe Ui", size: 11pt)
#set heading(numbering: none)

// Configuration de la bibliographie
#set bibliography(
  style: "ieee",
  title: none
)

// En-tête
#header_layout
#v(-6em)

= BIBLIOGRAPHIE
#v(1em)

// Bibliographie principale
#bibliography("biblio.bib")

#v(-34em)
#header_layout
