#let cover-page(
  title: "« Titre du stage »",
  year: "year",
  student_name: "Nom de l'étudiant",
  company_name: "Nom de l'entreprise",
  start_date: "Date de début",
  end_date: "Date de fin",
  tutor_company: "Tuteur entreprise",
  tutor_academic: "Tuteur académique",
  is_confidential: true,
) = {
  set page(
    margin: (x: 1in, y: 2in),
    columns: 1,
    numbering: none,
    background: {
      if is_confidential {
        place(
          center + horizon,
          rotate(45deg,
            text(
              fill: rgb("#cc4949").lighten(100%),
              weight: "bold",
              size: 32pt,
            )[CONFIDENTIEL]
          )
        )
      }

      place(
        right,
        rect(
          width: 21em,
          height: 102%,
          fill: rgb("#90d1df")
        )
      )
      
      // 3 vertical lines
      for i in range(3) {
        place(
          right + top,
          dx: -(21.5em + i * 1em),
          rect(
            width: 0.15cm,
            height: 100%,
            fill: rgb("#90d1df")
          )
        )
      }

      // Enib Cover image
      let cover-width = 55%
      let cover-height = 50%
      let cover-x = 87% - cover-width 
      let cover-y = 28% 

      place(
        top + left,
        dx: cover-x,
        dy: cover-y,
        rect(
          width: cover-width,
          height: cover-height,
          image("Enib_Cover.png"),
          stroke: none
        )
      )

      // Year
      place(
        top + right,
        dx: -4em,
        dy: 6.5em,
        text(
          fill: black,
          size: 30pt,
          
          year
        )
      )

      // Informations détaillées
      place(
        bottom + right,
        dx: -0.5em,
        dy: -4em,
        block(
          width: 20em,
          height: auto,
          inset: 1em,
          align(left)[
            #text(weight: "bold", fill: white, size: 12pt)[#student_name]
            #v(0.3em)
            #text(fill: white, size: 12pt)[Période : #start_date - #end_date]
            #v(0.3em)
            #text(fill: white, size: 12pt)[Tuteur académique : #tutor_academic]
            #v(0.3em)
            #text(fill: white, size: 12pt)[Tuteur entreprise : #tutor_company]
          ]
        )
      )
    }
  )

  // Logos
  place(
    top + left,
    dy: -3.4cm,
    dx: -1.2cm,
    image("Ecole.png", width: 1.9in, height: 0.9in)
  )

  

  v(3em)
  block(
    fill: rgb("#90d1df"),
    inset: 2em,
    width: 50em,
    height: auto,
  )[
    #align(center)[
      #text(
        fill: black,
        size: 0.4in,
        font: "Segoe UI",
        weight: "bold"
      )[Stage PPE]
    ]
  ]

  place(
    bottom + left,
    dy: -6em,
    dx: 0.1em,
    block(
      fill: rgb("#90d1df"),
      inset: 1em,
      width: 50em,
      height: auto,
    )[
      #align(center)[
        #text(
          fill: black,
          size: 0.3in,
          font: "Segoe UI",
          weight: "bold"
        )[#title]
      ]
    ]
  )
}