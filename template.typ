// template.typ
#let header_layout = {
  place(
    right,
    dy: -4.4cm,
    dx: 0cm,
    image("cover/Ecole.png", width: 1.2in, height: 0.5in)
  )
}

// Utility functions for boxes
#let magic_box(title: "", content: "") = {
  block(
    width: 100%,
    fill: rgb(245, 245, 245),
    inset: 1em,
    radius: 4pt,
    stroke: 1pt + rgb(200, 200, 200),
  )[
    #text(weight: "bold")[#title]
    #v(-1em)
    #content
  ]
}

#let simple_box(content) = {
  block(
    width: 100%,
    fill: rgb(245, 245, 245),
    inset: 1em,
    radius: 4pt,
  )[#content]
}

#let footer_layout = {
  {
    grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 5pt,
      place(
        left + bottom, 
        dy: 1em,
        text(size: 12pt, fill: gray)[y24terro\@enib.fr \ a24machko\@enib.fr]
      ),
      align(center + bottom)[
        #context {
          counter(page).display("1")
        }
      ],
      align(right + bottom)[
        #text(size: 12pt)[Rapport de stage]
      ]
    )
    
    place(
      bottom,
      dx: -2cm,
      dy: 0pt,
      image("cover/front-background.png", width: 100% + 4cm)
    )
  }
}
