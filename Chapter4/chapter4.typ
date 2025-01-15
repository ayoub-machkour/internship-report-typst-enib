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
    CHAPITRE 4 : Implémentation de Typst
  ]
] 

#pagebreak()
#header_layout
#v(-6em)

#text[*Introduction*]

#magic_box(

  content:"
La rédaction de documents techniques et académiques nécessite des outils adaptés aux exigences modernes. Dans ce contexte, Typst émerge comme une solution novatrice, proposant une approche repensée de la composition de documents. Ce chapitre présente une analyse approfondie de cet outil, depuis ses origines jusqu'à son application concrète dans notre contexte académique. Notre étude s'articule en trois axes majeurs : une exploration des fondements et fonctionnalités de Typst, une analyse comparative avec LaTeX mettant en lumière ses avantages distinctifs, et enfin la présentation de notre solution de modèle pour les rapports de stage de l'ENIB."

)

= Comprendre Typst : Origines et Fonctionnalités

== La Naissance de Typst

La création de Typst en 2019 par Martin Haug et Laurent Kirsch marque un tournant dans l'histoire des systèmes de composition de documents #cite(label("typst-2021")). Cette initiative est née d'une observation critique du paysage des outils de rédaction technique, dominé depuis les années 1980 par LaTeX #cite(label("latex-history")). Comme l'expliquent Wilson et al.#cite(label("latex-vs-typst")), l'évolution des besoins en matière de rédaction technique et académique nécessitait une approche plus moderne de la composition de documents. Plusieurs facteurs ont motivé ce développement :

=== Contexte Historique

- 1970s-1980s : Domination de TeX et LaTeX
- 	1990s-2000s : Tentatives d'amélioration avec LyX et autres éditeurs WYSIWYG
- 2010s : Émergence des besoins modernes (collaboration en temps réel, prévisualisation instantanée)
- 	2019 : Lancement de Typst comme réponse à ces nouveaux besoins

=== Évolution du Projet

Le développement de Typst s'est structuré autour de plusieurs phases clés :

+ Phase Alpha (2019-2020) : Développement du moteur de rendu
+ Phase Bêta (2020-2021) : Implémentation des fonctionnalités de base
+ Version 1.0 (2023) : Première version stable avec support complet des fonctionnalités essentielles
+	Développement Continu : Ajouts réguliers de nouvelles fonctionnalités et optimisations


#pagebreak()
#header_layout
#v(-6em)
== Contexte et Point de Départ

#text[*Système LaTeX Initial*]

Le système de génération de PDF de l'ENIB reposait initialement sur une architecture développée par Monsieur Vincent Choqueuse. Son approche se basait sur LaTeX pour produire les PDF de la formation FISEA. La chaîne de traitement commençait avec des fichiers Markdown enrichis d'en-têtes YAML contenant les métadonnées essentielles des cours : volumes horaires, coefficients, rattachements aux UE. Un script Python traitait ces fichiers Markdown pour générer des fichiers TeX individuels pour chaque cours et chaque semestre.

Le fichier central main.tex, également généré par le script Python, orchestrait l'assemblage de tous ces composants. Il importait les packages LaTeX requis, définissait la mise en page globale du document, et incluait systématiquement tous les fichiers TeX des cours et des semestres dans le bon ordre. Chaque fichier TeX de cours contenait la structure complète d'un enseignement, avec ses tableaux de volumes horaires, sa description et ses acquis d'apprentissage. Les fichiers TeX des semestres, quant à eux, présentaient les synthèses semestrielles avec les totaux (ECTS, volumes horaires, etc.).

Cette approche modulaire permettait une génération automatisée des documents finaux, mais la syntaxe complexe de LaTeX, avec ses nombreuses commandes basées sur des backslashes, rendait le système difficile à maintenir et à faire évoluer. Les fichiers TeX générés étaient volumineux, peu attrayants, et nécessitaient beaucoup de temps pour la génération.

== Première Phase : Adaptation Initiale vers Typst

Dans un premier temps, la structure fondamentale du projet a été maintenue. Les fichiers Markdown sont restés la source primaire des données, et Pandoc a conservé son rôle central dans l'analyse de ces fichiers. Les templates Jinja2 ont également été adaptés, et les scripts Python existants ont été modifiés (create_main.py) ou complétés par un nouveau script (create_courses.py). L'arborescence du projet conservait sa logique de séparation entre les dossiers.



#figure(
  image("../images/latex.png", width: 5in, height: 1.8in),
  caption: "Commande tree pour le premier projet (LaTeX)"
)

#pagebreak()
#header_layout
#v(-6em)

#figure(
  image("../images/typst2.png", width: 4.2in, height: 4in),
  caption: "Commande tree pour le nouveau projet (Typst)"
)

== Adaptation des Templates et du Système de Filtrage

La transposition des fichiers de mise en forme LaTeX vers Typst a marqué une étape clé dans la modernisation du système de documentation. L’ancien système reposait sur trois fichiers principaux: main.tex, semester.tex et apc.tex, chacun jouant un rôle spécifique dans l’organisation et la présentation des documents PDF. Main.tex assurait la structure globale du document, en définissant les paramètres de mise en page, la table des matières, la couverture, et en orchestrant l’inclusion des fichiers des cours et semestres. Semester.tex se concentrait sur la mise en forme des informations propres à chaque semestre, notamment les totaux des volumes horaires, des crédits ECTS et les synthèses associées. Apc.tex était dédié à l’Approche par Compétences, structurant les tableaux des acquis d’apprentissage et des compétences liées aux cours.

Ces fichiers ont été remplacés par main.typ, semester.typ et tables.typ, chacun conçu pour exploiter les capacités modernes de Typst tout en simplifiant leur maintenance. Main.typ conserve son rôle central en définissant la structure principale du document et en orchestrant l’inclusion des fichiers Typst pour les cours et semestres. Semester.typ reprend la gestion des informations semestrielles en les adaptant à une syntaxe plus lisible et maintenable. Tables.typ a été introduit pour gérer spécifiquement les tableaux, notamment ceux des #pagebreak()
#header_layout
#v(-6em)volumes horaires et des acquis d’apprentissage, en exploitant la flexibilité de Typst pour des présentations plus claires et homogènes.

La syntaxe de Typst a permis de simplifier considérablement le système. Les sections et sous-sections, autrefois définies par des commandes complexes comme \section et \subsection en LaTeX, utilisent désormais une notation intuitive avec le symbole \# Les tableaux, auparavant gérés par des environnements lourds tels que \begin{table} et \end{table}, ont été remplacés par des structures plus légères grâce à la syntaxe native de Typst. Ces nouvelles structures permettent de définir directement les colonnes, les en-têtes, et les lignes avec des listes ou des blocs structurés, sans nécessiter de nombreuses commandes intermédiaires.

Dans LaTeX, créer un tableau nécessitait un environnement dédié et plusieurs commandes pour délimiter les colonnes, insérer des lignes et définir des styles. Voici un exemple de tableau en LaTeX:

#figure(
  image("../images/tablelatex.png", width: 5in, height: 2in),
  caption: "Exemple de tableau en LaTeX"
)

Ce tableau nécessite plusieurs commandes, comme \hline pour insérer des lignes horizontales, et une définition rigide des colonnes ({|c|c|c|}) qui limite la flexibilité. De plus, tout ajustement, tel que la largeur des colonnes, demande des modifications supplémentaires dans la structure du tableau, rendant son maintien et sa personnalisation complexes.

En revanche, Typst propose une approche bien plus intuitive et concise pour créer des tableaux. Avec Typst, voici comment le même tableau serait écrit:

#pagebreak()
#header_layout
#v(-6em)

#figure(
  image("../images/tabletypst.png", width: 4in, height: 2in),
  caption: "Exemple de tableau en Typst"
)

La syntaxe Typst permet de définir les colonnes (par exemple, avec des tailles fixes comme 4cm ou automatiques avec auto) et d’ajouter les lignes directement dans une liste structurée. Les en-têtes, données, et mises en page sont séparés de manière claire, ce qui améliore considérablement la lisibilité et la maintenabilité du code.

Le script filter.lua, utilisé dans le processus de transformation via Pandoc, a également été révisé en profondeur. Sa fonction principale consiste à convertir les éléments Markdown et les métadonnées associées en syntaxe Typst. Là où l’ancien filtre produisait des commandes LaTeX comme \includegraphics ou \begin{table}, la nouvelle version génère des équivalents Typst concis et modernes. Par exemple, les images sont désormais intégrées via la commande \#figure, tandis que les tableaux bénéficient d’une syntaxe structurée simplifiée.

Cette transition a permis non seulement de réduire la complexité du système, mais aussi d’augmenter sa lisibilité et sa maintenabilité, tout en adoptant une approche plus flexible et adaptée aux besoins actuels.

== Structuration des Données et Organisation du Projet

La réorganisation de l'architecture du projet a constitué une étape majeure de la migration. Le dossier build initial regroupait l'ensemble des fichiers générés dans des sous-dossiers comme courses et semester. Cette organisation, adaptée à une seule formation, a dû évoluer pour accueillir la formation FISE. De nouveaux dossiers ont été créés : courses_fise et courses_fisea pour les cours, semester_fise et semester_fisea pour les semestres, permettant une séparation claire des contenus par formation, les graphiques générés par Matplotlib sont stockées aussi dans les dossiers de cours correspondants.

== Centralisation des Données et Automatisation

Un nouveau script Python a été développé pour centraliser l'ensemble des informations du système. Ce script analyse systématiquement les en-têtes YAML des fichiers Markdown ainsi que les fichiers JSON auxiliaires (aat.json et course.json) qui décrivent les acquis #pagebreak()
#header_layout
#v(-6em)d'apprentissage et la structure des cours. Il génère ensuite deux fichiers JSON principaux, fise.json et fisea.json, qui servent de référence unique pour toutes les informations nécessaires à la génération des documents.

Cette approche de "source unique de vérité" garantit une cohérence parfaite entre les différentes utilisations des données. Toute modification dans un fichier source se répercute automatiquement lors de la compilation suivante, assurant ainsi la synchronisation des informations à travers tout le système.

#figure(
  image("../images/json.png", width: 5in, height: 3.1in),
  caption: "Génération Centralisée des Fichiers JSON(FISE/FISEA)"
)

== Optimisation et Contrôle de la Génération

Un fichier de configuration YAML a été implémenté pour offrir un contrôle fin sur la génération des documents. Il permet notamment de gérer l'inclusion ou l'exclusion de sections globales comme l'Approche par Compétences, d'activer ou de désactiver l'affichage de certains éléments comme les tableaux de volumes horaires, et de personnaliser la présentation des schémas dans les pages de cours.

Un Makefile complet a été développé pour simplifier l'utilisation du système. Il offre différentes cibles comme make json pour la génération des fichiers JSON, make typst pour la création des fichiers Typst, et make pdf pour la compilation finale. Cette approche permet aux utilisateurs non techniques de générer facilement les documents sans avoir à maîtriser les détails techniques du système.

#pagebreak()
#header_layout
#v(-6.5em)

#figure(
  image("../images/configyaml.png", width: 3.7in, height: 9in),
  caption: "fichier de configuration YAML"
)

#pagebreak()
#header_layout
#v(-6em)

== Performances et Résultats

Les tests de performances réalisés sur le document TemplateContratsPro_2024-2025 démontrent des améliorations significatives. Le temps de compilation est passé de 4,469 secondes avec LaTeX à 0,852 seconde avec Typst, soit une réduction de plus de 80%. L'empreinte système a été considérablement réduite, passant de 4-7 Go pour une installation LaTeX complète à seulement 20-30 Mo pour Typst. La taille des documents PDF générés a légèrement augmenté, passant de 0,470 Mo à 0,623 Mo, une augmentation de 32%, principalement due à l'incorporation complète des polices, mais qui reste acceptable au regard des gains en performances et en facilité d'utilisation.

== Illustration du Processus de Génération des Documents PDF avec Typst

#figure(
  image("../images/PDF.png", width: 7in, height: 4.2in),
  caption: "Diagramme de séquence- génération de documents PDF avec Typst"
)


La Figure 12 illustre le flux général de génération des documents pédagogiques PDF utilisant Typst. L'utilisateur déclenche l'ensemble du processus en exécutant la commande make pdf. Cette commande active successivement les cibles du Makefile, qui coordonne #pagebreak()
#header_layout
#v(-6em)l'analyse des métadonnées, la génération des fichiers JSON centralisés (fise.json et fisea.json), et la production des fichiers Typst pour chaque cours et semestre. Ces étapes conduisent à la compilation finale par Typst, produisant les documents PDF finaux.


== Développement d'un Template de Rapport de Stage

Suite à la migration réussie vers Typst, nous avons développé un template moderne et flexible pour la rédaction des rapports de stage des étudiants de l'ENIB. Ce template exploite pleinement les capacités de Typst tout en maintenant les standards académiques de l'école.


=== Architecture du Template

Le template s'organise autour d'une structure modulaire permettant une séparation claire des responsabilités :

#figure(
  image("../images/treerapport.png", width: 2in, height: 3in),
  caption: "Commande tree pour le template de rapport"
)

=== Le Fichier Principal (main.typ)

Le fichier main.typ constitue le point d'entrée du template et orchestre l'ensemble du document. Il commence par importer le module de la page de couverture et définit les paramètres fondamentaux de mise en page. Une caractéristique notable est la gestion de la confidentialité via une variable booléenne qui, lorsqu'elle est activée, applique un filigrane "CONFIDENTIEL" en rotation sur chaque page. La configuration de base utilise la police Segoe UI en taille 12pt et définit des marges spécifiques pour le document.

#pagebreak()
#header_layout
#v(-6em)

La structure du document est ensuite organisée de manière méthodique avec une séparation claire entre les différentes parties. Le fichier gère intelligemment la numérotation des sections en la désactivant pour les parties préliminaires (remerciements, tables), l'activant pour le corps principal du rapport (introduction et chapitres), puis la désactivant à nouveau pour les parties finales (bibliographie, annexes, résumé). Cette approche modulaire permet d'inclure séparément chaque partie du rapport via des fichiers dédiés, facilitant ainsi la maintenance et la clarté du code.

== Conclusion

La migration du système de génération de PDF de l’ENIB, passant de LaTeX à Typst, a marqué une étape clé dans la modernisation de la gestion documentaire. Cette transition a permis d'améliorer significativement la lisibilité, la maintenabilité et les performances du processus tout en répondant aux besoins croissants de l'institution.

Grâce à Typst, le système bénéficie d'une syntaxe intuitive qui remplace les commandes complexes de LaTeX, rendant la génération des documents plus rapide et plus accessible. Les nouveaux templates adaptés aux formations FISE et FISEA offrent une gestion claire des sections, tableaux et graphiques, tout en minimisant les risques d’erreurs.

La centralisation des données via les fichiers JSON (fise.json et fisea.json), générés automatiquement par des scripts Python, assure une parfaite cohérence entre les différentes utilisations des informations pédagogiques. Par ailleurs, l’intégration d’un fichier de configuration YAML et d’un Makefile complet simplifie grandement l’utilisation pour des utilisateurs non techniques.

Les tests de performances ont confirmé des gains significatifs: une réduction de plus de 80% du temps de compilation et une empreinte système bien plus légère, passant de plusieurs gigaoctets à quelques dizaines de mégaoctets. Ces améliorations s’accompagnent d’une flexibilité accrue pour les futures évolutions du système.

En somme, cette migration ne constitue pas seulement une adaptation technique, mais représente une véritable transformation, dotant l’ENIB d’un système documentaire moderne, robuste et évolutif, parfaitement adapté aux exigences pédagogiques et administratives actuelles.


