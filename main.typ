#import "cover/cover.typ": cover-page

#set text(font: "Segoe UI", size: 12pt)

#let is_confidential = false 

#set page(
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1/1",
  background: if is_confidential {
    place(
      center + horizon,
      rotate(45deg,
        text(
          fill: rgb("#cccccc").lighten(60%),
          weight: "bold",
          size: 72pt,
        )[CONFIDENTIEL]
      )
    )
  }
)

// Create the cover PAGE
#cover-page(
  title: "Optimisation et Modernisation de la \n Génération du Programme Pédagogique",
  year: "2024/2025",
  student_name: "MACHKOUR Ayoub - TERRO Yassine",
  company_name: "ENIB",
  start_date: "9 Septembre 2024",
  end_date: "20 décembre 2024",
  tutor_academic: "CHOQUEUSE Vincent",
  tutor_company: "MENORET Mathilde" 
)

// Disable heading numbering for acknowledgements and tables
#set heading(numbering: none)

#include "Acknowledgement/acknowledgement.typ"
#include "tables/tables.typ"

// Enable heading numbering for main content

#include "Introduction/introduction.typ"
#include "Chapter1/chapter1.typ"
#include "Chapter2/Chapter2.typ"
#include "Chapter3/chapter3.typ"
#include "Chapter4/chapter4.typ"
#include "Chapter5/chapter5.typ"
#include "Chapter6/chapter6.typ"
#include "Conclusion/conclusion.typ"

// Disable heading numbering for back matter
#set heading(numbering: none)

#include "biblio/biblio.typ"
#include "appendix/appendix.typ"
