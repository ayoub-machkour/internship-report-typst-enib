#import "../template.typ": header_layout, magic_box, simple_box, footer_layout

// Configuration globale de la page avec header et footer
#set page(
 margin: (x: 2cm, y: 5cm),
 header: {
   header_layout
   v(-4em)
 },
 footer: footer_layout
)

#set text(font: "Segoe UI", size: 12pt)
#set heading(numbering: "1.1")
#set par(justify: true)

#header_layout
#v(-6em)
#text(size:14pt)[*Introduction Générale*]
#v(1em)

#text(weight:"bold")[L'École Nationale d'Ingénieurs de Brest (ENIB)], récemment transformée en établissement public à caractère scientifique, culturel et professionnel #text(weight:"bold")[(EPSCP)], s'apprête à intégrer en 2025 un nouvel Institut National Polytechnique (INP Bretagne) aux côtés de l'#text(weight:"bold")[ESIAB] et de l'IAE. Dans ce contexte de transformation institutionnelle, l'ENIB enrichit également son offre de formation avec l'ouverture d'une nouvelle voie de #text(weight:"bold")[formation d'ingénieurs par apprentissage (FISEA)], accréditée par la #text(weight:"bold")[Commission des Titres d'Ingénieur (CTI)].

Cette évolution s'accompagne d'un besoin croissant de gestion documentaire sophistiquée, notamment pour répondre aux exigences de différents acteurs. La CTI, en tant qu'organisme d'accréditation, requiert une documentation précise et structurée du programme pédagogique. #text(weight:"bold")[Les Opérateurs de Compétences (OPCO)], qui financent la formation des étudiants en alternance, exigent quant à eux des programmes de formation personnalisés. Le service des relations internationales nécessite également des documents adaptés pour les mobilités étudiantes.

Jusqu'à présent, la préparation de ces documents reposait sur un processus manuel chronophage, impliquant de multiples manipulations de fichiers et sources de données, source potentielle d'erreurs et d'incohérences. Notre projet vise à répondre à ces enjeux en développant un outil permettant la génération automatisée et personnalisée des programmes de formation, tout en garantissant une source unique de vérité pour l'ensemble des données pédagogiques.

Ce rapport s'articule autour de 6 chapitres qui retracent notre démarche et nos réalisations. #text(weight:"bold")[Le chapitre 1] présente le contexte de transformation de l'école et les enjeux documentaires associés. #text(weight:"bold")[Le chapitre 2] dresse un état des lieux du système de gestion documentaire actuellement en place à l'ENIB et décrit les besoins fonctionnels du projet. #text(weight:"bold")[Le chapitre 3] présente et détaille les outils et technologies retenus pour répondre aux besoins, en justifiant ces choix.
#text(weight:"bold")[Le chapitre 4] présente l'implémentation de cet outil moderne pour la génération automatisée des documents PDF ainsi que la réalisation de ce rapport.
#text(weight:"bold")[Le chapitre 5] détaille les améliorations apportées au site existant et le développement d'une nouvelle interface web pour personnaliser les documents PDF.
#text(weight:"bold")[Le chapitre 6] analyse les aspects environnementaux et sociétaux de la solution. 

