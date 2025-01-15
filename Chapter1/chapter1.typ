#import "../template.typ": header_layout, magic_box, footer_layout

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
    Chapitre 1: Contexte institutionnel et stratégique de l'ENIB
  ]
]

#pagebreak()


#header_layout
#v(-6em)

#text(weight: "bold",size:16pt)[Introduction]


#magic_box(
  content: "
  Ce premier chapitre présente l'École Nationale d'Ingénieurs de Brest (ENIB), établissement au sein duquel notre projet a été développé. Cette présentation permettra de comprendre le contexte institutionnel, les spécificités de l'école et les enjeux liés à la gestion de ses documents pédagogiques. Nous aborderons notamment son organisation, ses formations et sa collaboration avec les différents acteurs du monde professionnel."
)


#v(1em)

= L'ENIB : Une école d'ingénieurs en évolution:
#v(1em)
Créée en 1961, #text(weight: "bold")[l'École Nationale d'Ingénieurs de Brest] est l'une des 204 écoles d'ingénieurs françaises accréditées#cite(label("wikipedia_enib")). Située dans le Technopôle Brest-Iroise à Plouzané, l'ENIB a récemment évolué vers le statut d'établissement public à caractère scientifique, culturel et professionnel #text(weight: "bold")[(EPSCP)]. Cette évolution marque une étape importante dans le développement de l'établissement. Au 1er janvier 2025, l'ENIB franchira une nouvelle étape en devenant une école interne d'un #text(weight: "bold")[Institut National Polytechnique (INP)], lui-même membre de l'établissement public expérimental de l'université de Bretagne occidentale. Cette transformation s'inscrit dans une stratégie de renforcement des synergies locales, l'INP accueillant également l'ESIAB et un #text(weight: "bold")[Institut d'Administration des Entreprises (IAE)].

#v(1em)
== Engagements écologiques et développement durable
#v(1em)

L'ENIB place le développement durable et la responsabilité sociétale au cœur de sa mission éducative. Depuis près de quinze ans, l'école intègre les transitions socio-écologiques et les questions éthiques dans ses programmes d'enseignement. Tous les étudiants et le personnel sont formés et sensibilisés aux enjeux de la transition écologique et du développement soutenable#cite(label("enib_rse")). 

En 2023, l'ENIB a introduit le module « Projet éco-responsable », consolidant ainsi son engagement envers une formation centrée sur les #text(weight: "bold")[Objectifs de Développement Durable (ODD)]. L'école collabore également avec des institutions locales, telles que le campus brestois de l’#text(weight: "bold")[École européenne supérieure d’art de Bretagne (EESAB)], pour aborder le design de la transition à travers des activités pédagogiques conjointes et offrir des parcours doubles aux élèves-ingénieurs. 

#pagebreak()
#header_layout
#v(-6em)

Par ailleurs, l'ENIB a entrepris des actions concrètes pour réduire son empreinte carbone. En 2022-2023, l'école a rénové son système d'éclairage en adoptant la technologie LED dans l'ensemble de ses bâtiments, une initiative financée en partie par le #text(weight: "bold")[Fonds européen de développement régional (FEDER)]. Cette modernisation vise à diminuer de 23% la consommation électrique de l'établissement.

#v(1em)

== Infrastructures et équipements
#v(1em)
L'ENIB met à disposition des infrastructures modernes et diversifiées pour soutenir la formation et la recherche de ses étudiants et chercheurs. Ces équipements favorisent l'innovation, la pratique et la réalisation de projets concrets.

  - #text(weight: "bold")[Centre Européen de Réalité Virtuelle (CERV)] : Créé en 2004, le CERV est une plateforme dédiée à la recherche et à l’innovation en réalité virtuelle. Équipé de systèmes immersifs et interactifs, il permet de mener des projets en modélisation et simulation. Le CERV accueille des chercheurs du Lab-STICC (UMR6285 CNRS) et d’autres partenaires académiques et industriels. Les étudiants participent également à des projets, renforçant leurs compétences dans des domaines comme l’industrie, la santé ou la défense#cite(label("cerv_enib")).
  - #text(weight: "bold")[La Forge] : Inaugurée en 2023, La Forge est un espace de prototypage conçu pour permettre aux étudiants de concrétiser leurs projets d’ingénierie. Équipée d’imprimantes 3D, de fraiseuses numériques et d’outils de conception assistée par ordinateur, elle encourage la créativité, l’innovation et l’apprentissage par la pratique dans des domaines tels que la mécanique, la robotique et l’électronique#cite(label("forge_inauguration")).
  #text(weight: "bold")[Laboratoires Partenaires]

L’ENIB s’appuie sur des laboratoires de recherche partenaires pour offrir un accès à des équipements de haute technologie.

  - #text(weight: "bold")[	Institut de Recherche Dupuy de Lôme (IRDL)]: Spécialisé en ingénierie mécanique et science des matériaux, l’IRDL mène des études sur la durabilité des structures et la fatigue des matériaux. Il dispose de machines d’essais avancées et de systèmes de mesure permettant d’analyser les chocs et vibrations, contribuant ainsi à des projets dans les secteurs maritimes, aéronautique et automobile#cite(label("irdl")).
  
- #text(weight: "bold")[	Lab-STICC (UMR CNRS 6285)]: Laboratoire multidisciplinaire, le Lab-STICC travaille sur l’électronique, la photonique, les hyperfréquences et les télécommunications. L’ENIB participe activement aux projets de recherche, permettant aux étudiants de se former sur des 

équipements de pointe dans les domaines des systèmes embarqués, du traitement du signal et des télécommunications optiques#cite(label("labsticc_enib")).

#pagebreak()
#header_layout
#v(-6em)
#text(weight: "bold")[Projets Complémentaires
]

- #text(weight: "bold")[	Lab’Optic]: Créé en 2024, ce laboratoire commun avec IMT Atlantique, l’ENSSAT et Orange se concentre sur les télécommunications optiques. Il vise à développer des technologies
pour améliorer les réseaux à haut débit, impliquant les étudiants dans des projets innovants.
- #text(weight: "bold")[	Subventions et Nouveaux Équipements :] L’ENIB bénéficie de financements européens et régionaux pour l’acquisition d’équipements de recherche et de prototypage. Ces investissements renforcent la formation pratique des étudiants et leur permettent de travailler sur des outils industriels de dernière génération.



Grâce à ses infrastructures internes et à ses collaborations avec des laboratoires partenaires, l’ENIB garantit à ses étudiants un environnement d’apprentissage riche, favorisant l’acquisition de compétences techniques et la réalisation de projets innovants.


#v(1em)

== Organisation et gouvernance
#v(1em)

#figure(
  image("../images/organisation.png", width: 5in, height: 4in),
  caption: "Organisation de l'ENIB - Répartition des Pôles et Directions"
)

L’organisation de l’ENIB repose sur trois pôles principaux, comme illustré dans l’organigramme ci-dessus :

#pagebreak()
#header_layout
#v(-6em)

- #text(weight: "bold")[Le pôle Études] Il regroupe trois départements d’enseignement : électronique, informatique et mécatronique, qui assurent la formation des étudiants dans les disciplines clés de l’ingénierie. 

- #text(weight: "bold")[Le pôle Recherche], supervise les relations internationales et les relations entreprises, renforçant ainsi les collaborations scientifiques et industrielles. Il encadre également les activités de recherche menées dans les laboratoires partenaires.

- #text(weight: "bold")[	La Direction Générale des Services (DGS)], chargée de la gestion administrative et des ressources. Elle s’occupe des ressources humaines, des finances, de la communication et des services liés à la scolarité et aux relations entreprises.

L’école emploie 126 personnes, comprenant 73 enseignants (dont 53 permanents à l’ENIB) et 53 personnels BIATSS (Bibliothèques, Ingénieurs, Administratifs, Techniciens, de Santé et de Service). Cette organisation garantit un encadrement optimal pour les 768 élèves actuellement en formation, avec une part significative d’internationaux (21%) et de femmes (18%).


== Formation et spécialités
#v(1em)

L'ENIB délivre un seul diplôme d'ingénieur généraliste avec trois dominantes : électronique, informatique et mécatronique#cite(label("enib_formation")). La Commission des Titres d'Ingénieur (CTI) reconnaît trois voies traditionnelles d'obtention du diplôme d'ingénieur : la Formation Initiale sous Statut Étudiant (FISE), la Formation Initiale sous Statut Apprenti (FISA), et la Formation Continue (FC). Actuellement, l'ENIB propose ce diplôme principalement par la voie FISE, qui constitue un cursus de 5 ans basé sur un tronc commun équilibré et le contrôle continu, ainsi que par la Formation Continue avec possibilité de Validation des Acquis de l'Expérience (VAE)#cite(label("enib_cycle_ingenieur")).


La nouvelle voie FISEA, en cours de mise en place, vient enrichir cette offre avec un parcours hybride innovant combinant une première année sous statut étudiant suivie de deux années sous statut apprenti#cite(label("fisea_enseeiht")). Cette formation, qui fait partie des nouvelles modalités d'accès au diplôme d'ingénieur reconnues par la CTI depuis 2019, accueillera 24 étudiants par promotion, dont 14 recrutés à Bac+2 et 10 issus du cycle préparatoire de l'ENIB. Cette voie se distingue de la FISA traditionnelle par son format mixte étudiant-apprenti. En 2024, 31 formations d'ingénieurs en France étaient accréditées par la CTI pour proposer ce type de formation mixte, illustrant l'essor de cette approche pédagogique innovante et la volonté des écoles de diversifier leurs modalités d’apprentissage#cite(label("cti_formations")).


#v(1em)

== Réseau des anciens élèves et insertion professionnelle

#v(1em)

Depuis sa création, l'ENIB a formé plus de 5 000 ingénieurs, répartis en France et dans plus de 60 pays#cite(label("enib_formation")). L'Association Nationale des Ingénieurs de l'ENI de Brest (ANIENIB) joue un #pagebreak()
#header_layout
#v(-6em)rôle clé dans l'animation de ce réseau #cite(label("anienib")), en organisant des événements tels que des tables rondes métiers et des simulations d'entretien d'embauche. 

Ces initiatives permettent aux étudiants de bénéficier de l'expérience des anciens, d'appréhender la diversité des métiers d'ingénieur et de se préparer efficacement à leur insertion professionnelle. L'ENIB met également l'accent sur l'interaction avec les entreprises dès le début du cursus, facilitant ainsi l'accès à des opportunités de carrière variées dans des secteurs d'activité porteurs#cite(label("enib_etudiants")). 

En complément, l'école organise régulièrement des journées entreprises, des entretiens professionnels et des conférences techniques, renforçant les liens entre les étudiants et le monde professionnel. Cette approche proactive vise à assurer une transition fluide des diplômés vers le marché du travail, en adéquation avec les besoins des industries contemporaines#cite(label("enib_etudiants")).



#v(1em)



== Les acteurs impliqués dans la données administratives
#v(1em)
#text(weight: "bold")[Les organisations externes et leurs exigences:
]

La Commission des Titres d'Ingénieur (CTI) est l'organisme indépendant chargé, depuis 1934, d'évaluer et d'accréditer les formations d'ingénieurs en France. L'ENIB doit régulièrement fournir des documents précis et conformes à ses exigences lors des audits périodiques ou sur demande spécifique. Ces exigences documentaires sont détaillées dans le Référentiel 2024 de la CTI #cite(label("cti_referentiel")) et comprennent plusieurs catégories essentielles.

Les documents stratégiques et administratifs incluent les statuts de l'école, les contrats d'objectifs et la note stratégique. Les documents pédagogiques comprennent le syllabus complet, le règlement des études, les maquettes de diplômes, une vue d'ensemble des semestres et le programme pédagogique détaillé. En ce qui concerne les documents de suivi et résultats, l'école doit fournir les données certifiées sur les effectifs ainsi que les enquêtes d'insertion professionnelle. Pour la vie étudiante, les documents requis sont notamment les chartes associatives et le livret d'accueil. Tous ces documents doivent être regroupés dans un dossier numérique accessible aux auditeurs et régulièrement mis à jour par l'école pour répondre aux exigences d'évaluation et d'accréditation de la CTI.

Les Opérateurs de Compétences (OPCO), créés en 2019, sont des organismes étatiques essentiels dans l'écosystème de la formation professionnelle#cite(label("opco_alternance")). Ils supervisent le financement et le suivi des formations en alternance à l'ENIB, tant pour les contrats de professionnalisation que pour les contrats d'apprentissage#cite(label("opco_mobilites")). Pour assurer ce suivi, les OPCO requièrent une documentation détaillée et personnalisée pour chaque étudiant, spécifiant précisément les modules de formation suivis. Notre outil répond à ce besoin en générant automatiquement des documents adaptés au parcours individuel de chaque étudiant.


#v(1em)
#pagebreak()
#header_layout
#v(-6em)


#text(weight: "bold")[Les structures internes de l'ENIB:
]

La gestion documentaire à l'ENIB repose principalement sur l'interaction entre deux services clés. Le Service Relations Entreprises et Scolarité, sous la responsabilité de Madame Chantal CALVES, est en charge de la production et de la validation des documents pédagogiques. Son équipe assure quotidiennement la gestion administrative des formations, la génération des conventions de stage et des contrats d'alternance, ainsi que le suivi des documents liés aux parcours des étudiants.

Le Service Numérique (SNUM), dirigé par Julian SERY, apporte le support technique nécessaire à cette gestion documentaire. Il supervise l'infrastructure informatique et assure la sécurité des données. L'équipe technique du SNUM maintient les systèmes d'information existants et accompagne l'intégration de nouvelles solutions, comme notre outil de génération automatisée de documents pédagogiques.

Cette organisation permet une gestion efficace des documents pédagogiques : les aspects métier sont pilotés par le service Relations Entreprises et Scolarité qui définit les besoins et valide les contenus, tandis que le SNUM assure l'intégration technique et le support des outils mis en place. Cette collaboration étroite entre les deux services est essentielle pour garantir une gestion documentaire fiable et efficace, répondant aux exigences de tous les acteurs de la formation.

#v(1em)

== Enjeux et perspectives - Conclusion
#v(1em)

L'évolution de l'ENIB, tant sur le plan institutionnel avec sa transformation en #text(weight: "bold")[EPSCP] et son intégration prochaine à l'#text(weight: "bold")[INP], que sur le plan pédagogique avec l'introduction de la voie #text(weight: "bold")[FISEA], génère des besoins croissants en matière de gestion documentaire. Cette évolution s'accompagne de nombreux défis dans la production et la gestion des documents pédagogiques.

En premier lieu, l'école doit répondre aux exigences documentaires de différents acteurs. Les documents doivent être adaptés aux besoins spécifiques de la CTI pour les accréditations, des #text(weight: "bold")[OPCO] pour le suivi des alternants, et du service des relations internationales pour la mobilité des étudiants. Cette diversité des destinataires nécessite une grande flexibilité dans la production des documents, tout en maintenant leur cohérence.

Par ailleurs, la multiplication des parcours de formation (voie classique, contrats de professionnalisation et apprentissage) complexifie la gestion documentaire. Les documents pédagogiques doivent pouvoir s'adapter aux différents cursus tout en garantissant une cohérence globale de la formation.

#pagebreak()
#header_layout
#v(-6em)

Face à ces enjeux, le développement d'un outil adapté et évolutif pour la gestion documentaire devient indispensable. Cette compréhension approfondie du contexte nous conduit naturellement au chapitre suivant, qui détaillera le cahier des charges de notre projet.








