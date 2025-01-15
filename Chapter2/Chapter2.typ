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
    CHAPITRE 2 : Analyse du système existant et Spécifications
  ]
]
#pagebreak()


#header_layout
#v(-6em)

#text(weight: "bold",size:16pt)[Introduction]

#magic_box(
  content:"
Ce chapitre présente une analyse détaillée du système de gestion documentaire actuellement en place à l'ENIB. Mis en œuvre en mars 2023, ce système repose sur une architecture combinant un site web statique généré par VitePress et un processus de génération de documents PDF via LaTeX. Cette analyse permet de comprendre l'organisation actuelle, ses points forts et ses limitations, éléments essentiels pour appréhender les évolutions nécessaires face aux nouveaux besoins de l'école."
)

#v(1em)

= Analyse du système existant
#v(1em)
== Système de Gestion de Contenu Actuel

#text(weight: "bold")[ Évolution et contexte
]

Le système documentaire de l'ENIB a été profondément remanié en mars 2023 pour répondre aux nouvelles exigences pédagogiques et institutionnelles. Initialement, le programme pédagogique était élaboré en LaTeX, avec une production directe de documents PDF. Bien que cette méthode garantisse une mise en page professionnelle, elle s'est révélée inadaptée face à des besoins pédagogiques croissants. En 2021, la Commission des Titres d'Ingénieur (CTI) a souligné la nécessité d'intégrer l'approche par compétences (APC)#cite(label("cti_apc_2021")), imposant une restructuration majeure du système documentaire pour mieux répondre aux standards et attentes de l'évaluation académique.

Pour accompagner cette transformation, l'ENIB a recruté Mme Mathilde MENORET ingénieure pédagogique, afin de garantir la cohérence et l'efficacité dans la mise en œuvre des nouvelles solutions. Ce recrutement stratégique s'est accompagné de l'adoption de VitePress en mars 2023. Ce framework moderne permet de générer automatiquement un site web statique à partir de fichiers Markdown, facilitant ainsi la diffusion et l'accessibilité des contenus pédagogiques. Le système a été enrichi par l'intégration de GitLab, qui offre une plateforme centralisée pour stocker, versionner et modifier les fichiers Markdown, tout en assurant un contrôle précis des contributions des enseignants.

#text(weight: "bold")[ Structure et Organisation du Contenu
]

Le contenu pédagogique est désormais structuré en deux parties principales dans chaque fichier Markdown.
#pagebreak()
#header_layout
#v(-6em)
- #text(weight: "bold")[La première partie] comprend un en-tête YAML qui contient les métadonnées essentielles du cours : les acquis d'apprentissage terminaux (AAT), le coefficient, l'identifiant unique du
cours, ainsi que les volumes horaires détaillés pour chaque type d'enseignement (cours magistraux, TD, TP, etc.).

#v(1em)
#figure(
  image("../images/YamL.png", width: 2in, height: 6in),
  caption: "Structure des métadonnées du cours (En-tête YAML)"
)

- #text(weight: "bold")[La seconde partie] présente le contenu pédagogique proprement dit, organisé en sections distinctes : la description générale du cours, les acquis d'apprentissage visés (AAV) avec leur volume horaire et les compétences associées, les modalités d'évaluation, les mots-clés, les prérequis et les ressources pédagogiques. Cette structure permet une présentation claire et cohérente des informations pédagogiques.

#pagebreak()
#header_layout
#v(-6em)

#v(1em)
#figure(
  image("../images/Contenu.png", width: 6.8in, height: 4in),
  caption: "Contenu pédagogique et acquis d'apprentissage du cours"
)



#text(weight: "bold",size:14pt)[Processus de Gestion et Organisation du Système
]

Le système s'appuie sur un dépôt GitLab centralisé qui structure la gestion et la validation des contenus pédagogiques. Cette plateforme accueille 112 contributeurs, majoritairement des enseignants disposant de droits de développeur. La supervision est assurée par trois administrateurs clés : M. Vincent CHOQUEUSE, Mme Mathilde MENORET et M. Gilles CHAUVEAU.

L'architecture du système s'articule autour de trois composants principaux : les fichiers sources, les outils de traitement Python, et les fichiers générés. Les fichiers sources comprennent les fichiers de configuration, les fichiers JSON définissant la structure des cours et des AAT, ainsi que les fichiers de contenu incluant les descriptions des cours et des templates LaTeX. Les outils Python (build_json.py, build_csv.py, build_md.py et build_latex.py) traitent ces données sources pour générer différents types de fichiers : des fichiers CSV documentant les volumes horaires et les mappings UE-AAT-AAV, des fichiers JSON structurant la hiérarchie AAT-AAV, des fichiers Markdown pour la documentation, et des fichiers LaTeX pour la production de documents PDF.

#pagebreak()
#header_layout
#v(-6em)

#figure(
  image("../images/architecture.png", width: 6in, height: 3.84in),
  caption: "Architecture technique du système documentaire (VitPress)"
)




Le workflow de validation assure un contrôle qualité rigoureux : chaque modification est systématiquement soumise à l'approbation de l'ingénieur pédagogique avant publication. L'intégration continue est gérée par GitLab CI/CD à travers un pipeline comprenant plusieurs étapes automatisées. L'étape d'installation configure l'environnement Node.js et installe les dépendances nécessaires. L'étape d'extraction, déclenchée manuellement, exécute les scripts Python pour générer les fichiers JSON, Markdown et CSV, avec des versions distinctes pour le français et l'anglais. La phase de construction utilise VitePress pour générer le site statique. Enfin, l'étape de déploiement permet de publier le site soit dans un environnement de test accessible via www.wtest.enib.fr/propositions, soit en production sur web.enib.fr/programmepeda. Cette automatisation garantit une génération cohérente et systématique de l'ensemble des documents du programme pédagogique.



#text(weight: "bold",size:14pt)[Processus de génération documentaire:
]

Parallèlement au site web, un système de génération de documents PDF a été développé spécifiquement pour l'accréditation de la formation FISEA en 2024. Ce processus utilise une chaîne d'outils permettant de produire le programme pédagogique complet de la formation au format PDF. Python assure le traitement des données et l'automatisation générale du processus. Jinja2 est utilisé pour générer des fichiers LaTeX à partir de templates, en les alimentant avec des données structurées en Python. Pandoc permet la conversion des fichiers Markdown vers le format LaTeX, tandis que des filtres Lua personnalisés assurent #pagebreak()
#header_layout
#v(-6em)le traitement des balises spécifiques comme les informations de cours et les tableaux de volumes horaires. LaTeX finalise la chaîne en assurant la mise en forme professionnelle des documents.


#figure(
  image("../images/archLatex.png", width: 5in, height: 2.7in),
  caption: "Architecture global du système de generation de PDF (LaTeX)"
)

Cette chaîne de traitement permet de générer des documents PDF structurés à partir des contenus Markdown, en suivant une séquence précise de transformations et de mise en forme. 



#text(weight: "bold",size:14pt)[Limitations et défis actuels
]

La gestion documentaire actuelle de l’ENIB repose sur deux systèmes parallèles : un site web et la génération de PDF. Bien que fonctionnels, ces modes de fonctionnement présentent des limites en matière d’optimisation et d’efficacité.

Le site web, reconnu pour sa qualité et sa capacité à mettre en valeur la formation FISE, ne prend pas encore en compte la nouvelle formation FISEA. Parallèlement, la génération automatisée de PDF, déjà opérationnelle pour la FISEA, n’a pas été étendue à la formation FISE, ce qui crée un déséquilibre entre les deux approches.

Un défi majeur réside dans la production de documents personnalisés pour les organismes externes. Les demandes spécifiques, comme celles de l’OPCO pour les contrats de professionnalisation ou de la CTI pour les évaluations, nécessitent un investissement considérable en temps de la part du personnel administratif. Actuellement, l’extraction d’informations depuis le site web ou le partage de liens permet de répondre à ces besoins, mais au prix d’une mobilisation importante des ressources humaines. Une automatisation plus poussée permettrait de libérer du temps pour des tâches à plus forte valeur ajoutée, tout en maintenant le niveau d’excellence reconnu de l’établissement.

#pagebreak()
#header_layout
#v(-6em)
Le processus de génération de PDF basé sur LaTeX, bien qu’efficace, présente plusieurs limites techniques :



- 	La complexité de son utilisation requiert une expertise spécifique.
- 	Les temps de compilation sont relativement longs.
- 	La maintenance des templates s’avère laborieuse.
- 	Les modifications rapides de mise en forme représentent un défi important.


== Spécifications du Nouveau Système

#v(1em)
#text(weight: "bold")[ Objectifs et Vision
]

Face aux nouveaux besoins liés à l'introduction de la formation FISEA et aux limitations du système de génération PDF existant, l'ENIB a entrepris une évolution majeure de sa gestion documentaire. Cette évolution repose sur deux axes complémentaires et techniquement indépendants.

#v(1em)
#text(weight: "bold")[ Extension du Site Web VitePress
]

L’extension du site VitePress permet d’unifier la présentation des formations FISE et FISEA au sein de la même plateforme web, garantissant une navigation fluide et cohérente. Les scripts existants ont été modifiés pour gérer les deux formations de manière harmonisée. La formation FISEA a été intégrée en réutilisant la structure de la FISE, évitant ainsi les duplications inutiles tout en assurant une cohérence globale.

Afin de répondre aux exigences d’internationalisation, des fiches de cours en anglais ont été créées pour la formation FISEA. Cette démarche assure une présentation bilingue, déjà appliquée à la FISE, et répond ainsi aux attentes des partenaires et des étudiants étrangers. L’ensemble du site continue de s’appuyer sur des fichiers Markdown, simplifiant la rédaction et la mise à jour des contenus par les enseignants et administrateurs, sans nécessiter de compétences techniques particulières.



#v(1em)
#text(weight: "bold")[ Nouveau Système de Génération PDF
]

La refonte du système de génération PDF repose sur le remplacement de LaTeX par Typst, une solution moderne qui améliore significativement la rapidité de compilation et simplifie la maintenance. Avec Typst, les PDF sont générés plus rapidement tout en respectant la charte graphique de l’ENIB. Cette transition réduit la complexité associée à LaTeX, rendant le système plus stable et fiable.

Une interface web développée avec Flask accompagne cette nouvelle architecture. Grâce à cette interface, les utilisateurs peuvent configurer et générer des documents PDF sans avoir à manipuler directement des scripts ou des fichiers de configuration complexes. La sélection #pagebreak()
#header_layout
#v(-6em)des semestres, des cours et l’ajustement des volumes horaires s'effectuent désormais via une interface intuitive accessible depuis un navigateur web.



#text(weight: "bold",size:14pt)[Gestion des Métadonnées
]

La gestion des métadonnées a été optimisée grâce au développement d’un script Python. Cet outil permet de modifier les en-têtes YAML des fichiers Markdown directement depuis la ligne de commande. Il offre plusieurs fonctionnalités essentielles, telles que l’ajout de nouveaux champs, la modification des informations existantes et la suppression de champs obsolètes. Les administrateurs peuvent appliquer ces changements à un fichier ou à l’ensemble des fiches de cours, garantissant une cohérence des métadonnées entre les formations FISE et FISEA.


#v(1em)
#text(weight: "bold",size:14pt)[Automatisation et Configuration
]

 L’utilisation du système a été simplifiée par la création d’un Makefile qui automatise les tâches courantes. Les commandes permettent de générer les PDF complets ou de compiler uniquement les fichiers Typst nécessaires. La personnalisation des documents repose sur un fichier de configuration YAML centralisé, qui permet d’ajuster la table des matières, les volumes horaires et la mise en page des documents finaux. La configuration de la page de garde, des sections à inclure ou à exclure, ainsi que des tableaux et graphiques, est également gérée à travers ce fichier YAML.

Cette approche modulaire prévient les erreurs liées aux modifications directes des templates et scripts, tout en accélérant les ajustements en fonction des demandes de partenaires internes ou externes de l’école.



#v(1em)
#text(weight: "bold",size:14pt)[Interface Web et Gestion des Versions
]

L’interface web Flask joue un rôle clé dans la gestion documentaire en remplaçant la modification manuelle des fichiers YAML par une solution graphique et intuitive. Cette interface permet aux utilisateurs de personnaliser les cours, de sélectionner les semestres et d’ajuster les volumes horaires sans avoir à écrire de code. Elle offre la génération automatisée de fichiers JSON, Typst et PDF, garantissant une production rapide et uniforme des documents.

L’interface permet également de basculer facilement entre les branches GitLab pour accéder aux versions précédentes des fiches de cours.


#text(weight: "bold",size:14pt)[Gestion des Données
]

La génération des fichiers JSON repose sur le principe de "single source of truth". Les données pédagogiques sont consolidées dans deux fichiers JSON distincts, l’un pour la FISE et#pagebreak()
#header_layout
#v(-6em) l’autre pour la FISEA. Cette approche garantit que toutes les informations sont regroupées en un seul endroit, simplifiant ainsi la maintenance et évitant la dispersion des données à travers de multiples fichiers Markdown.

#v(1em)
#text(weight: "bold",size:14pt)[Architecture Unifiée

]
Même si les systèmes de génération PDF et de gestion du site web VitePress sont développés séparément, ils partagent une source commune, à savoir les fichiers Markdown stockés dans GitLab. Cette unification garantit que toute mise à jour effectuée sur le site web est immédiatement reflétée dans les documents PDF générés. L’utilisation de GitLab comme référentiel unique pour toutes les données pédagogiques assure la cohérence et la continuité des informations entre les différents supports.

#v(1em)
#text(weight: "bold",size:14pt)[Conclusion
]

L'analyse du système existant révèle une architecture documentaire robuste mais confrontée à des défis croissants. Le site web VitePress démontre son efficacité pour la  FISE mais nécessite une extension pour intégrer la FISEA. Parallèlement, le système de génération PDF basé sur LaTeX, bien que fonctionnel, présente des limitations significatives en termes de performance et de facilité d'utilisation.

Face à ces constats, une évolution du système s'impose selon deux axes principaux : l'extension du site web pour une gestion unifiée de la FISE et de la FISEA, et le développement d'une nouvelle chaîne de génération PDF plus efficace. Cette transformation demande une analyse approfondie des différentes technologies disponibles, notamment pour la génération de documents PDF, l'automatisation des processus et le développement d'interfaces utilisateur. Le chapitre suivant présentera une étude comparative des solutions envisagées, justifiant chaque choix technique par rapport aux alternatives existantes, avec une attention particulière aux critères de performance, de maintenabilité et d'ergonomie qui ont guidé nos décisions.



