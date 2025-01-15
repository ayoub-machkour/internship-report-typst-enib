#import "../template.typ": header_layout, footer_layout, magic_box


#set page(
  margin: (x: 2cm, y: 5cm),
  footer: footer_layout
)

#set text(font: "Segoe UI", size: 12pt)
#set heading(numbering: "1.1")
#set par(justify: true)

#header_layout 
#v(15em) 
#align(center)[
  #text(size: 26pt, weight: "bold")[
    CHAPITRE 3 : Choix techniques
  ]
]

#pagebreak()


#header_layout
#v(-6em)

#text(weight: "bold",size:16pt)[Introduction]

#magic_box(

  content:"
    La génération automatisée de documents pédagogiques représente un défi technique majeur, nécessitant une architecture robuste capable de répondre à des besoins multiples : traitement efficace des données, production de documents de haute qualité et interface utilisateur intuitive. Dans ce contexte, le choix des technologies et outils constitue une étape cruciale qui impactera directement la performance, la maintenabilité et l'évolutivité du système. Ce chapitre présente l'architecture technique mise en place pour répondre aux exigences spécifiques de l'ENIB. Nous commencerons par détailler chaque composant technologique sélectionné, en expliquant son rôle précis dans l'architecture globale. Ensuite, nous analyserons de manière comparative les alternatives disponibles pour chaque technologie, en justifiant nos choix selon des critères objectifs tels que la performance, la facilité d'utilisation et la maturité des solutions. Une attention particulière sera portée à la cohérence de l'ensemble des outils sélectionnés, leur intégration mutuelle et leur capacité à former un écosystème technologique performant et pérenne."

)

= Notre choix

#table(
  columns: (0.4fr,0.6fr,1fr),
  inset: 3pt,
  align: horizon,
  
  // En-têtes
  [*Outil & Logo*], [*Description*], [*Utilisation*],
  
  // Python
  [
    #stack(
      spacing: 0.5em,
      align(center)[*Python 3.12.6*
      \ ★53.4k (CPython)],
      align(center)[#image("../images/python.png", width: 1.5cm, height: 1.7cm)]
    )
  ],
  [
    Langage de programmation de haut niveau, interprété, orienté objet, avec un typage dynamique fort

  ],
  [
    Au cœur du système, Python orchestre le processus complet de génération des documents, en gérant le traitement des fichiers JSON et Markdown ainsi que les métadonnées. Il assure le développement web via Flask pour l'interface utilisateur et le traitement des données. Python gère également l'automatisation avec des scripts de génération JSON et la synchronisation avec le système de versionnement, tout en assurant les calculs des volumes horaires et crédits ECTS.

  ],
)

#pagebreak()
#header_layout
#v(-6em)

#table(
  columns: (0.4fr,0.6fr,1fr),
  inset: 3pt,
  align: horizon,
  // Miniconda
  [
    #stack(
      spacing: 0.5em,
      align(center)[*Miniconda*\ ★ 3.3k],
      align(center)[#image("../images/miniconda.png", width: 1.5cm, height: 1.7cm)]
      
    )
  ],
  [
    Distribution minimale de l'environnement Conda, gestionnaire de packages et d'environnements Python
  ],
  [
    Miniconda assure la gestion centralisée de l'environnement de développement et de production via l'environnement isolé typst_env. Il gère précisément les versions des bibliothèques clés comme Python 3.12.6, Typst 0.11.1 et Pandoc 3.5, garantissant une reproduction exacte de l'environnement sur différentes machines pour un comportement cohérent du système.
  ],

     // Flask
  [
    #stack(
      spacing: 0.5em,
      align(center)[*Flask 3.0.3*\ ★ 65.5k],
      align(center)[#image("../images/Flask.png", width: 1.5cm, height: 2cm)]
    )
  ],
  [
    Framework web léger en Python pour la création d'applications web

  ],
  [
    Développement d'une interface web complète pour :
    1. Affichage et modification de la configuration via config.yaml
    2. Prévisualisation des documents générés
    3. Gestion des uploads de fichiers Markdown
  ],

  // Jinja2
  [
    #stack(
      spacing: 0.5em,
      align(center)[*  Jinja2 3.1.4*\ ★ 9.6k],
      align(center)[#image("../images/jinja2.png", width: 2.4cm, height: 1.1cm)]
    )
  ],
  [
  Moteur de templates Python pour la génération de documents

  ],

  [
    1.	Génération dynamique des fichiers Typst à partir des templates. 
    2.	Transformation des données JSON et Markdown en documents structurés. 
    3.	Permet la séparation entre la logique et la présentation des documents.

  ],

  // Pandoc
  [
    #stack(
      spacing: 0.5em,
      align(center)[*Pandoc 3.5*\ ★ 31.2k],
      align(center)[#image("../images/pandoc.png", width: 2.3cm, height: 1.5cm)]
    )
  ],
  [
    Convertisseur universel de documents supportant de nombreux formats

  ],
  [
    Pandoc assure la conversion des fichiers Markdown vers les formats intermédiaires via des filtres LUA personnalisés, gérant le traitement des métadonnées YAML et l'extraction des données de cours. Il s'intègre au système de templates pour la génération des tables des matières, la création des index et la gestion des références, tout en appliquant des filtres spécifiques pour les données de volume horaire et la numérotation automatique.

  ],
  //Matplotib
  [
    #stack(
      spacing: 0.5em,
      align(center)[*Matplotlib 3.9.2*\ ★ 18.1k],
      align(center)[#image("../images/Matplotlib.png", width: 2cm, height: 1.9cm)]
      
    )
  ],
  [
    Bibliothèque de visualisation de données en Python qui produit des graphiques de qualité publication

  ],
  [
    gère la création des visualisations des AAT à travers des graphiques circulaires représentant les compétences, avec une palette de couleurs personnalisée. La bibliothèque assure l'export en format vectoriel pour une intégration de haute qualité dans les PDFs, tout en permettant une personnalisation fine des styles graphiques.

  ],
)

#pagebreak()
#header_layout
#v(-6em)

#show figure.where(
  kind: table
): set figure.caption(position: bottom)
#figure(
table(
  columns: (0.4fr,0.6fr,1fr),
  inset: 11pt,
  align: horizon,
  
  [
    #stack(
      spacing: 0.5em,
      align(center)[*Make 4.4.1*\ ★5.1k (GNU Make)],
      align(center)[#image("../images/Makefile.png", width: 1.7cm, height: 2cm)] 
    )
  ],
  [
    Outil d'automatisation de la compilation et de l'exécution de tâches

  ],
  [
   Orchestration du processus de build complet : 
    - génération des fichiers JSON, conversion Markdown vers Typst, compilation des PDF.
    - Gestion des dépendances entre les différentes étapes de génération.
  ],
  //Vitepress
  [
    #stack(
      spacing: 0.5em,
      align(center)[*Vitepress*\ ★ 9.9k],
      align(center)[#image("../images/Vitepress.png", width: 2cm, height: 2cm)] 
    )
  ],
  [
    Framework de génération de sites statiques basé sur Vue.js, conçu spécialement pour la documentation technique

  ],
  [
   VitePress génère le site statique multilingue à partir des fichiers Markdown structurés. Il intègre les composants Vue.js personnalisés comme ChartDonut pour les AAT et les tableaux dynamiques. La gestion des données est assurée par gray-matter pour les métadonnées YAML et chart.js pour les graphiques, offrant une expérience utilisateur moderne et responsive.

  ],

  //typst
  [
    #stack(
      spacing: 0.5em,
      align(center)[*Typst 0.11.1*\ ★ 23.4k],
      align(center)[#image("../images/Typst.png", width: 2cm, height: 2cm)] 
    )
  ],
  [
    Système moderne de composition de documents, conçu comme une alternative moderne à LaTeX

  ],
  [
    Prend en charge la génération des PDF des programmes pédagogiques avec une mise en page professionnelle et une gestion avancée des styles. Il utilise des templates personnalisés pour les différentes sections du document, avec une gestion cohérente des styles et de la typographie. L'intégration dynamique permet d'incorporer les données JSON dans les templates et de générer automatiquement les éléments structurels comme les tables des matières.

  ],
),
  caption: [Outils et Technologies du Projet]

)

#pagebreak()
#header_layout
#v(-6em)

== Analyse comparative des alternatives

#v(1em)

#text(weight: "bold")[Python 3.12.6
]


#show figure.where(
  kind: table
): set figure.caption(position: bottom)
#figure(
 table(
  columns: (1fr,1fr,1fr,1fr,1fr),
  inset: 4pt,
  align: horizon,
  // En-têtes
  [*Critère *],
  [*Python*],
  [*Java*],
  [*JavaScript*],
  [*C++*],
  

  [
    #stack(
      spacing: 0.5em,
      align(center)[Facilité d'utilisation ],
    )
  ],
  [
   Excellente
  ],
  [
    Complexe

  ],
  [
    Bonne
  ],
  [
    Très complexe
  ],
  [
    #stack(
      spacing: 0.5em,
      [ Temps de développement],
    )
  ],
  [
    Rapide
  ],
  [
    Long
  ],
  [
    Moyen
  ],
  [
    Long
  ],
  [
    #stack(
      spacing: 0.5em,
      align(center)[Support intégré web
 ],
    )
  ],
  [
    Excellent
  ],
  [
    Complexe
  ],
  [
    Natif
  ],
  [
    Limité
  ],
  [
    #stack(
      spacing: 0.5em,
      align(center)[Classement TIOBE

 ],
    )
  ],
  [1],[2],[7],[4]

),
caption: [Python et ses alternatives]
)
#v(1em)

Le choix de ces quatre langages pour la comparaison est justifié par leur position dominante dans l'index TIOBE de janvier 2024, où Python occupe la première place avec 15.16% de part de marché, suivi de Java (11.72%), C++ (9.96%) et JavaScript (3.17% - 7ème place). Bien que d'autres langages comme C(5) ou PHP (6) soient également populaires, ils n'ont pas été retenus car soit trop bas niveau (C), soit trop liés à un écosystème spécifique (C avec Microsoft), soit trop spécialisés (PHP pour le web). Python s'impose comme le choix optimal pour notre projet grâce à sa position dominante actuelle, sa facilité d'utilisation, sa rapidité de développement, son excellent support des technologies web et son écosystème scientifique robuste, offrant ainsi le meilleur compromis entre performance, accessibilité et polyvalence par rapport aux alternatives disponibles.


#v(1em)

#text(weight: "bold")[Miniconda
]

#show figure.where(
  kind: table
): set figure.caption(position: bottom)
#figure(
 table(
  columns: (1fr,1fr,1fr,1fr,1fr),
  inset: 4pt,
  align: horizon,
  // En-têtes
  [*Critère *],
  [*Miniconda*],
  [*Anaconda*],
  [*venv/virtualenv*],
  [*Poetry*],

  [
    #stack(
      spacing: 0.5em,
      align(center)[Taille installation],
    )
  ],
  [
    ~400MB
  ],
  [
    >3GB
  ],
  [
    < 50MB
  ],
  [
    ~100MB
  ],
  [
    #stack(
      spacing: 0.5em,
      align(center)[Gestion dépendances],
    )
  ],
  [
    Complète
  ],
  [
    Complète
  ],
  [
    Basique
  ],
  [
    Avancée
  ],
  [
    #stack(
      spacing: 0.5em,
      align(center)[Multi-plateforme],
    )
  ],
  [
    Totale
  ],
  [
    Totale
  ],
  [
    Limitée
  ],
  [
    Bonne
  ]
),
caption: [Miniconda et ses alternatives]
)

#v(1em)

Dans notre choix d'outil de gestion d'environnement Python, Miniconda s'impose comme la solution optimale, offrant un équilibre parfait entre légèreté et fonctionnalités complètes. #pagebreak()
#header_layout
#v(-6em)Contrairement à Anaconda avec ses gigaoctets de packages préinstallés souvent superflus, ou aux alternatives comme venv et virtualenv qui se limitent aux packages Python purs, Miniconda nous permet de gérer efficacement à la fois les packages Python et les dépendances binaires essentielles comme Pandoc et Typst. Bien que Poetry propose une approche moderne, sa spécialisation dans le développement de packages Python le rend moins adapté à nos besoins, tandis que la maturité et la stabilité de l'écosystème Conda garantissent une fiabilité à long terme pour notre projet.



#text[*Flask*]

#show figure.where(
  kind: table
): set figure.caption(position: bottom)
#figure(
 table(
  columns: (1fr,1fr,1fr,1fr,1fr),
  inset: 4pt,
  align: horizon,
  // En-têtes
  [*Critère *],
  [*Flask*],
  [*Django*],
  [*FastAPI*],
  [*Pyramid*],

  [
    #stack(
      spacing: 0.5em,
      align(center)[Taille installation],
    )
  ],
  [
    Légère(~600KB)
  ],
  [
    Lourde(>10MB)
  ],
  [
    Légère(~2MB)
  ],
  [
    Légère(~400KB)
  ],
  [
    #stack(
      spacing: 0.5em,
      align(center)[Gestion dépendances
 ],
    )
  ],
  [
    Complète
  ],
  [
    Complète
  ],
  [
    Basique
  ],
  [
    Avancée
  ],
  [
    #stack(
      spacing: 0.5em,
      align(center)[Courbe d'apprentissage],
    )
  ],
  [
    Simple
  ],
  [
    Complexe
  ],
  [
    Modérée
  ],
  [
    Modéré
  ],
),
caption: [Flask et ses alternatives]
)

Dans notre choix de framework web, Flask s'est distingué comme la solution idéale grâce à sa légèreté et sa flexibilité exceptionnelle. Contrairement à Django qui impose une structure rigide avec de nombreuses fonctionnalités superflues, ou à FastAPI qui est principalement orienté API REST, Flask nous offre exactement ce dont nous avons besoin pour notre interface web, avec une intégration native de Jinja2 et une courbe d'apprentissage douce. Pyramid, bien que complet, propose une approche plus complexe qui dépasserait nos besoins actuels pour une simple interface de configuration et de prévisualisation.


#v(1em)

#text[*Jinja2*]


#show figure.where(
  kind: table
): set figure.caption(position: bottom)
#figure(
 table(
  columns: (1fr,1fr,1fr,1fr,1fr),
  inset: 4pt,
  align: horizon,
  // En-têtes
  [*Critère *],
  [*Jinja2*],
  [*Mako*],
  [*Django Templates*],
  [*Mustache*],

  [
    #stack(
      spacing: 0.5em,
      align(center)[Performance],
    )
  ],
  [
    Excellente
  ],
  [
    Bonne
  ],
  [
    Django-only
  ],
  [
    Limitée
  ],
  [
    #stack(
      spacing: 0.5em,
      align(center)[Intégration Python],
    )
  ],
  [
    Native
  ],
  [
    Complète
  ],
  [
    Basique
  ],
  [
    Avancée
  ],
  [
    #stack(
      spacing: 0.5em,
      align(center)[Documentation],
    )
  ],
  [
    Très complète
  ],
  [
    Bonne
  ],
  [
    Très bonne
  ],
  [
    Basique
  ]

),
caption: [Jinja2 et ses alternatives]
)

Le choix de Jinja2 comme moteur de template s'est naturellement imposé par sa puissance et son intégration parfaite avec notre écosystème Python. Comparé à d'autres moteurs de template comme Mako ou Cheetah qui offrent des fonctionnalités plus limitées, ou à des solutions plus complexes comme Django Templates qui sont étroitement liées à leur framework, Jinja2 offre le meilleur compromis entre flexibilité et simplicité, tout en maintenant #pagebreak()
#header_layout
#v(-6em)des performances excellentes et une syntaxe claire pour la création de nos templates de documents.


#text[*Vitepress*]

#show figure.where(
  kind: table
): set figure.caption(position: bottom)
#figure(
 table(
  columns: (1fr,1fr,1fr,1fr,1fr),
  inset: 4pt,
  align: horizon,
  // En-têtes
  [*Critère *],
  [*Vitepress*],
  [*Docusaurus*],
  [*MkDocs*],
  [*Sphinx*],

   [
    #stack(
      spacing: 0.5em,
      align(center)[Temps de build],
    )
  ], 
  [< 1s],[2-3s],[1-2s],[>3s],
  [
    #stack(
      spacing: 0.5em,
      align(center)[Framework],
    )
  ], 

  [Vue.js],[React],[Moyenne],[Très complexe],
  
  [
    #stack(
      spacing: 0.5em,
      align(center)[Configuration],
    )
  ], 
  [Simple],[complexe],[Moyenne],[Très complexe]
),
caption:[Vitepress et ses alternatives]
)



Pour la génération de notre site de documentation, VitePress représente la solution la plus adaptée, combinant performance exceptionnelle et simplicité d'utilisation. Contrairement à Docusaurus qui nécessite une configuration complexe avec React, ou à MkDocs qui manque de fonctionnalités modernes, VitePress offre un excellent support du Hot Module Replacement et une intégration native avec Vue.js. Sphinx, bien que puissant, aurait introduit une complexité excessive pour nos besoins de documentation technique.


#text(weight: "bold")[Make
]

#show figure.where(
  kind: table
): set figure.caption(position: bottom)
#figure(
 table(
  columns: (1fr,1fr,1fr,1fr,1fr),
  inset: 4pt,
  align: horizon,
  // En-têtes
  [*Critère *],
  [*Make*],
  [*Gradle*],
  [*npm scripts*],
  [*Ant*],

  [
    #stack(
      spacing: 0.5em,
      align(center)[Dépendances],
    )
  ],
  [Minimales],[Java],[Node.js],[Java],
  [
    #stack(
      spacing: 0.5em,
      align(center)[Taille],
    )
  ],
  [Légère (~1MB)],[Lourde (>100MB)],[Moyenne],[Moyenne],
  [
    #stack(
      spacing: 0.5em,
      align(center)[Vitesse exécution],
    )
  ],
  [Très rapide],[Moyenne],[Moyenne],[Lente]
),
caption: [Make et ses alternatives]
)

#v(1em)

Make s'est révélé être l'outil d'automatisation idéal pour notre projet, offrant une solution éprouvée et universelle pour la gestion des builds. Comparé à des alternatives comme Gradle qui nécessite Java et une configuration complexe, ou npm scripts qui dépend de Node.js, Make propose une approche simple et efficace sans dépendances supplémentaires. Sa disponibilité universelle et sa capacité à gérer efficacement les dépendances entre les différentes étapes de notre processus de génération en font l'outil parfait pour notre workflow.

#pagebreak()
#header_layout
#v(-6em)

#text[*Pandoc*]

#show figure.where(
  kind: table
): set figure.caption(position: bottom)
#figure(
 table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  inset: 5pt,
  align: horizon,
  [*Critère*], [*Pandoc*], [*python-markdown*], [*CommonMark*], [*Mistune*],

  [Formats supportés], [>40 formats], [Markdown uniquement], [Markdown strict], [Markdown uniquement],
  [Performance], [Bonne], [Très bonne], [Excellente], [Excellente],
  [Extensibilité], [Excellente (Lua)], [Moyenne (Python)], [Limitée], [Moyenne]
),
caption: [Pandoc et ses alternatives]
)


Pandoc s'impose comme le choix optimal pour notre projet grâce à sa polyvalence et son extensibilité incomparable via les filtres Lua, qui gère la transformation complexe des métadonnées et le formatage structuré (entêtes, sections, tableaux), Pandoc peut être précisément adapté à nos besoins grâce à son système de filtres. Contrairement à python-markdown ou Mistune qui se limitent au format Markdown, Pandoc gère plus de 40 formats différents et permet une personnalisation poussée de la conversion, notamment pour les tables, les figures et la gestion de la mise en page. Bien que CommonMark soit plus rapide pour le Markdown pur, sa limitation à une implémentation stricte ne convient pas à nos besoins de transformation complexes qui nécessitent la flexibilité offerte par les filtres Lua de Pandoc.


#text[*Typst*]

#show figure.where(
  kind: table
): set figure.caption(position: bottom)
#figure(
 table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  inset: 5pt,
  align: horizon,
  [*Critère*], [*Typst*], [*Word*], [*AsciiDoc*], [*LateX*],

  [Temps compilation], [< 1s], [N/A], [~2s], [>10s],
  [Programmabilité], [Native], [Limitée], [Bonne], [Extensive],
  [Installation], [~100MB], [>1GB], [~50MB], [>2GB]
),
caption: [Typst et ses alternatives]
)

Typst se démarque par sa rapidité de compilation exceptionnelle et sa programmabilité native, essentielles pour notre génération automatisée de documents. Contrairement à Word qui manque de capacités d'automatisation robustes, ou à LaTeX qui ne garantit pas une qualité typographique constante pour les PDF, Typst offre le meilleur compromis entre performance et qualité. AsciiDoc, bien que puissant, n'atteint pas le niveau de programmabilité et d'intégration que nous offre Typst.

#pagebreak()
#header_layout
#v(-6em)

#v(1em)

#text[*Matplotlib*]

#table(
  columns: (1fr,1fr,1fr,1fr,1fr),
  inset: 4pt,
  align: horizon,
  [*Critère *], [*Matplotlib*], [*Plotly*], [*Bokeh*], [*Seaborn*],

  [Export PDF], [Excellent], [Limité], [Moyen], [Hérite Matplotlib],
  [Documentation], [Exhaustive], [Très bonne], [Bonne], [Très bonne],
  [Performance], [Très bonne], [Bonne], [Bonne], [Très bonne]
)

Matplotlib reste incontournable pour notre projet grâce à son contrôle total sur le rendu et son excellente qualité d'export PDF, essentiels pour la génération de nos graphiques circulaires représentant les AAT. Plotly et Bokeh, bien qu'excellents pour les visualisations web interactives, ne conviennent pas à nos besoins d'export PDF statique de haute qualité. Seaborn, construit sur Matplotlib, ajoute une couche d'abstraction inutile pour nos besoins spécifiques de visualisation des AAT qui nécessitent un contrôle précis sur les aspects graphiques comme les couleurs, la disposition et l'export vectoriel.




#text[*Conclusion*]

L'architecture technique développée pour ce projet repose sur une sélection rigoureuse d'outils open source modernes et performants. Python constitue le cœur du système, orchestrant l'ensemble du processus de génération de documents, tandis que Miniconda assure la reproductibilité de l'environnement de développement. La chaîne de traitement documentaire, constituée de Pandoc, Jinja2 et Typst, offre une solution moderne et puissante pour la génération de documents de haute qualité, complétée par Flask pour l'interface web et VitePress pour la documentation. Cette architecture démontre qu'il est possible de construire un système robuste en s'appuyant sur des technologies modernes, tout en maintenant une complexité maîtrisée. Les choix technologiques effectués répondent aux besoins actuels de l'ENIB en matière de génération de documents pédagogiques, tout en posant les bases d'évolutions futures grâce à leur flexibilité et leur interopérabilité. Le chapitre 4 sera consacré à l'étude approfondie de Typst, en examinant ses mécanismes internes et sa syntaxe innovante pour la composition de documents académiques.

