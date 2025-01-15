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
    CHAPITRE 5 : Développement de l'interface utilisateur
  ]
]
#pagebreak()
#header_layout
#v(-6em)

#text[*Introduction*]

#magic_box(

content: "

Après avoir migré avec succès la génération des documents PDF vers Typst et mis en place un système de configuration flexible, l'étape suivante consistait à développer des interfaces utilisateur adaptées aux besoins du personnel administratif de l'ENIB. La manipulation directe des fichiers de configuration YAML pour la personnalisation des PDF et la gestion des métadonnées des fichiers Markdown pouvait s'avérer source d'erreurs et ralentir le processus de mise à jour du programme pédagogique.

Ce chapitre présente les différentes interfaces développées pour faciliter la gestion du programme pédagogique. Nous aborderons d'abord la création d'un outil en ligne de commande pour la gestion des métadonnées YAML, puis le développement d'une interface web intuitive avec Flask pour la personnalisation des documents PDF, et enfin l'intégration de la formation FISEA dans le site statique VitePress existant."

)


#v(1em)

= Gestion des métadonnées YAML 


Les fichiers Markdown qui composent le programme pédagogique comportent, en en-tête, des métadonnées YAML indispensables : acquis d’apprentissage (AAT), coefficients, volumes horaires, tags, etc. Pour éviter les erreurs de saisie et fluidifier la maintenance, un outil interactif a été développé en Python. Il s’appuie notamment sur PyYAML pour analyser et modifier le YAML, colorama pour afficher en couleur les informations et avertissements (vert pour les succès, rouge pour les erreurs, jaune pour les avertissements), et dataclasses pour structurer plus clairement le code. 


== Structure et organisation du code


Pour clarifier la structure et renforcer la maintenabilité, le projet est réparti en trois fichiers principaux. Le premier, models.py, définit les classes de données. La classe CourseMetadata regroupe toutes les informations d’un cours (identifiant, coefficient, volumes, tags, etc.) et autorise l’ajout, la modification ou la suppression de champs, tout en gardant une trace des changements. La classe Volume se consacre à la gestion des volumes horaires, comme le  CM, le TD, le TP ou le travail personnel, en assurant la cohérence et les conversions nécessaires (CM, TD, etc. en texte, total_edt en nombre décimal).

#pagebreak()
#header_layout
#v(-6em)

#v(1em)
#figure(
  image("../images/tree.png", width: 4in, height: 3.5in),
  caption: "Résultat de la Commande 'tree' : Structure des Répertoires"
)

#v(1em)
#figure(
  image("../images/class-Yaml.png", width: 6.55in, height: 4.2in),
  caption: "Diagramme de classes du Système de Gestion des Métadonnées YAML"
)

#pagebreak()
#header_layout
#v(-6em)

Le second fichier, managers.py contient la logique de lecture et d’écriture des fichiers Markdown, assurée par la classe MetadataManager. Celle-ci fait le lien avec CourseMetadata et Volume, veille à la cohérence du format de sortie et gère la détection et la résolution d’erreurs (fichier introuvable, syntaxe YAML incorrecte, etc.). Un mécanisme de type singleton est également mis en place pour l’intégration JSON : une fonction get_integrator() crée une unique instance de MetadataJSONIntegrator, puis la réutilise systématiquement. Ce fonctionnement évite la création de multiples instances concurrentes et prévient les rechargements ou opérations coûteuses répétées, tout en réduisant le risque de surcharge système.

Le troisième fichier, cli.py, regroupe la logique d’interface en ligne de commande : les menus, les saisies et l’affichage coloré des messages. C’est dans ce fichier que l’utilisateur navigue entre les différents modes (modification d’un seul fichier ou opérations en lot), tandis que les retours visuels (succès, avertissements, erreurs) sont gérés.

Cette organisation présente plusieurs avantages. Les classes de données (dans models.py) sont clairement séparées de la logique métier (dans managers.py) et de l’interface CLI (dans cli.py). Chacune de ces parties peut évoluer de manière indépendante. Il est par exemple envisageable de changer complètement l’interface (passer d’une CLI à une application Flask) sans modifier la gestion interne des métadonnées.


=== Choix de la formation et modes d’édition
#v(1em)
L’application invite d’abord l’utilisateur à choisir la formation qu’il souhaite modifier (FISE ou FISEA), comme l’illustre la Figure 16. Une fois ce premier choix effectué, elle propose deux modes : la modification d’un seul fichier à la fois ou la réalisation d’opérations en lot sur l’ensemble des cours de la formation sélectionnée. Dans le premier cas, l’utilisateur opte pour un fichier précis et accède à plusieurs menus (champs simples, volumes, tags) afin d’ajouter, de modifier ou de supprimer des informations de manière structurée. Dans le second cas, il peut réaliser des opérations groupées, par exemple l’ajout d’un champ à tous les fichiers ou la suppression d’un champ obsolète.

#figure(
  image("../images/int1.png", width: 6in, height: 1.8in),
  caption: "Interface de sélection du mode de modification."
)

#pagebreak()
#header_layout
#v(-6em)

=== Modification individuelle

Lorsque l’utilisateur choisit la modification d’un seul fichier, une liste numérotée des fichiers disponibles est présentée. Il sélectionne alors un cours précis et accède à un menu structuré en trois sections : la gestion des champs standards (identifiant, coefficient, type), la modification des volumes horaires (CM, TD, TP, projet) et la manipulation des tags. Chaque section autorise la visualisation des valeurs actuelles, l’ajout de nouveaux éléments, la modification et la suppression.

#figure(
  image("../images/str1.png", width: 6in, height: 5in),
  caption: "Structure et navigation de l'outil de gestion des métadonnées"
)


#pagebreak()
#header_layout
#v(-6em)


#figure(
  image("../images/etat1.png", width: 5.36in, height: 4.2in),
  caption: "Diagramme d'État – Mode Individuel de Modification des Fichiers YAML"
)

=== Opérations en lot

Les opérations en lot autorisent la manipulation simultanée de plusieurs fichiers. Sept types d’opérations sont proposés : ajouter ou modifier des champs standards, supprimer des champs, gérer les volumes horaires (ajout, modification, suppression), ajouter des tags ou en supprimer. Avant chaque opération, l’outil informe du nombre de fichiers concernés et demande une confirmation. L’utilisateur peut également visualiser un exemple représentatif des métadonnées afin de mieux anticiper l’impact de sa modification.

#pagebreak()
#header_layout
#v(-6em)


#figure(
  image("../images/menu.png", width: 5in, height: 2.3in),
  caption: "Menu des opérations par lot "
)

#v(3em)

#figure(
  image("../images/etat2.png", width: 5.2in, height: 3.44in),
  caption: "Diagramme d'État – Processus de Modification en Mode Groupé"
)

Cette approche renforce à la fois la cohérence et la rapidité de mise à jour,  les utilisateurs peuvent effectuer des modifications massives en quelques clics. De plus, la séparation du code en trois fichiers (models, managers, cli) facilite la maintenance et permet d’envisager facilement l’évolution de l’outil, qu’il s’agisse d’intégrer de nouveaux champs, de remplacer la CLI par une interface web ou d’étendre les fonctions de contrôle d’erreurs.

#pagebreak()
#header_layout
#v(-6em)


== Interface Web avec Flask

La manipulation directe du fichier de configuration YAML pour personnaliser la génération des PDF présentait plusieurs risques, notamment des erreurs de syntaxe ou des modifications non intentionnelles. Pour répondre à cette problématique et faciliter l'utilisation par le personnel administratif, nous avons développé une interface web utilisant le framework Flask.

Le choix de Flask s'est imposé pour sa légèreté et sa facilité d'intégration avec l'écosystème Python existant. L'application s'organise autour d'un fichier principal app.py qui gère les routes et la logique métier, utilisant les outils existants comme ConfigHandler.py depuis le dossier tools/ pour la gestion de la configuration. Les templates HTML sont stockés dans le dossier templates/, tandis que les ressources statiques (CSS, JavaScript, images) sont organisées dans le dossier static/.

L'interface s'appuie sur les technologies web standards : HTML5 pour la structure, CSS3 pour le style via le fichier style.css, et JavaScript natif (vanilla) pour l'interactivité côté client avec main.js. Bootstrap 5 assure une mise en page responsive et professionnelle. Pour les communications asynchrones entre le client et le serveur, nous utilisons l'API Fetch, ce qui permet de mettre à jour dynamiquement l'interface sans rechargement de page.

La génération des documents repose sur des commandes Make, déclenchées par deux boutons principaux : “Generate PDF” et “Delete All” . Le bouton "Generate PDF" permet de déclencher automatiquement l'ensemble du processus de génération (JSON, Typst et PDF) en une seule action. Pour plus de flexibilité, un menu déroulant associé à ce bouton offre la )possibilité d'exécuter individuellement chaque étape : la génération des fichiers JSON (make json), la création des fichiers Typst (make typst), ou la compilation des PDF (make pdf). De même, le bouton "Delete All" permet un nettoyage complet, tandis que son menu déroulant propose des options plus granulaires : make clean-json pour nettoyer les fichiers JSON, make clean-typst pour les fichiers Typst, et make clean-pdf pour les fichiers PDF.

L'interface web, illustrée dans la Figure 22, propose un tableau de bord complet pour le suivi et la gestion de la génération des documents. L'interface principale, via l'onglet "Status Overview", affiche l'état en temps réel des différents fichiers (JSON, Typst, PDF) pour les deux formations (FISE et FISEA). La barre supérieure contient trois menus déroulants : un sélecteur de branche GitLab permettant de choisir et basculer entre les différentes versions des cours (lors du changement de branche, les fichiers de cours actuels sont automatiquement remplacés par ceux de la nouvelle branche), un menu "Generate PDF" offrant le choix entre une génération complète ou des étapes spécifiques (JSON, Typst ou PDF), et un menu "Delete All" proposant soit une suppression complète soit un nettoyage sélectif (fichiers JSON, Typst ou PDF uniquement). Pour chaque fichier généré (JSON et PDF), un bouton de téléchargement devient disponible, permettant aux utilisateurs de récupérer directement les documents finaux pour les deux formations.

#pagebreak()
#header_layout
#v(-6em)

#figure(
  image("../images/use case.png", width: 8in, height: 6.7in),
  caption: "Diagramme de Cas d'Utilisation – Gestion et Génération de Documents PDF"
)

#pagebreak()
#header_layout
#v(-6em)

#figure(
  image("../images/board1.png", width: 6in, height: 3in),
  caption: "Vue d'ensemble du tableau de bord avec l'état des fichiers générés"
)

L'onglet "Config" s'organise en quatre sections distinctes. La section "Front Page"  illustrée dans la Figure 23, permet la personnalisation de la page de garde, où l'utilisateur peut modifier le titre, le sous-titre, l'année académique et les informations de contact. La section "Content"  illustrée dans la Figure 24 offre deux niveaux de personnalisation : la structure de la table des matières (affichage des semestres seuls ou avec leurs cours) et la sélection des sections de présentation du cursus (Organisation, Approche par Compétences, Intersemestres, sessions Automne-Printemps, Recrutement bac+2, Année 4 et 5).



#figure(
  image("../images/board2.png", width: 5.5in, height: 2.7in),
  caption: "Configuration de la page de garde"
)

#pagebreak()
#header_layout
#v(-6em)

#figure(
  image("../images/board3.png", width: 6in, height: 3in),
  caption: "Configuration des sections de contenu du document"
)

La section "Display for Courses" illustrée dans la Figure 25, permet de définir finement l'affichage des informations. L'utilisateur peut choisir d'afficher uniquement les semestres, uniquement les cours, ou les deux. Pour chaque cours, il peut activer ou désactiver l'affichage du tableau d'informations générales, du tableau des volumes et du graphique AAT. Le tableau d'informations générales peut être personnalisé en sélectionnant les colonnes à afficher (UE, Type, Coefficient, Volume Estimé, Volume EDT).


#figure(
  image("../images/board4.png", width: 6in, height: 3in),
  caption: "Paramètres d'affichage des informations de cours"
)

#pagebreak()
#header_layout
#v(-6em)

La dernière section, "Choose Courses",  illustrée dans la Figure 26 présente une interface de sélection arborescente des cours organisée par semestre. Pour chaque semestre, les cours sont listés avec leur code, identifiant UE et volume horaire EDT actuel. L'interface permet de sélectionner individuellement chaque cours en cochant les cases correspondantes, et offre la possibilité de modifier directement le volume EDT pour chaque cours via un champ éditable. Toute modification du volume horaire est automatiquement enregistrée dans le fichier de configuration et se reflète dans le PDF généré.


#figure(
  image("../images/board5.png", width: 5.5in, height: 2.9in),
  caption: "Interface de sélection des cours et gestion des volumes horaires"
)



L'intégration avec GitLab constitue une amélioration importante de l'interface, permettant une gestion efficace des différentes versions des cours. Initialement, nous avions opté pour une approche basée sur Git, en effectuant un clone complet du projet dans un dossier temporaire, puis en copiant uniquement le dossier contenant les cours vers l'emplacement de travail. Cependant, cette méthode a montré ses limites lors des changements de branche, générant des conflits et des erreurs de gestion Git.

Pour résoudre ces problèmes, nous avons adopté une solution plus robuste utilisant l'API GitLab. Grâce à un token d'accès configuré dans GitLab, l'interface peut désormais récupérer directement les fichiers Markdown des cours depuis n'importe quelle branche du dépôt. Lorsqu'un utilisateur change de branche via le sélecteur, le système supprime automatiquement les fichiers de cours existants et télécharge ceux de la nouvelle branche sélectionnée. Cette approche simplifiée évite les complications liées à la gestion Git tout en permettant de générer des PDF basés sur différentes versions du programme pédagogique.

Pour éviter que l'interface ne télécharge systématiquement les fichiers depuis GitLab à chaque lancement, nous avons ajouté une étape de confirmation. Au démarrage de l'application, l'utilisateur est invité via le terminal à confirmer s'il souhaite mettre à jour les #pagebreak()
#header_layout
#v(-6em)fichiers depuis GitLab. Cette simple question permet d'optimiser le temps de démarrage en évitant des téléchargements inutiles lorsque les fichiers locaux sont déjà à jour.

Du point de vue technique, l'interaction côté client a été entièrement développée en JavaScript vanilla pour maintenir la simplicité et les performances de l'application. Les communications avec le serveur sont gérées via l'API Fetch, offrant une alternative moderne et performante à AJAX pour toutes les opérations asynchrones : sauvegarde de la configuration, récupération des statuts, et nettoyage des logs. Le suivi en temps réel de la génération des documents est assuré par un système d'indicateurs visuels dynamiques, où chaque type de fichier (JSON, Typst, PDF) dispose d'un badge de statut qui se met à jour automatiquement. Une console de logs interactive, utilisant un code couleur selon le niveau des messages (information, avertissement, erreur), permet aux utilisateurs de suivre précisément l'avancement des opérations et d'identifier rapidement les éventuels problèmes. L'ensemble de ces fonctionnalités est implémenté sans dépendance à des frameworks JavaScript complexes, garantissant ainsi des performances optimales tout en maintenant une grande maintenabilité du code.

== Intégration FISEA dans VitePress

L'extension du système documentaire pour inclure la formation FISEA a nécessité une refonte de l'architecture existante. Ce développement s'est effectué en parallèle de la fusion des deux projets précédemment séparés (site VitePress et génération PDF) pour établir une véritable source unique de vérité. Cette section détaille les modifications techniques réalisées pour intégrer FISEA : adaptation des scripts de génération, mise à jour de la configuration VitePress et création des nouveaux fichiers de données.

=== Contexte et état initial 

Le site statique VitePress était initialement conçu pour ne prendre en compte que la formation FISE. Le script build_json.py générait le fichier aat_tree.json pour la gestion des acquis d'apprentissage, tandis que build_md.py créait les index Markdown par semestre. VitePress utilisait ces fichiers pour construire le site web, en s'appuyant sur les fichiers config.js et MenusConfig.js placés dans le dossier .vitepress qui définissaient la navigation (navbar, sidebar) uniquement pour les semestres de la formation FISE.
La génération des fichiers LaTeX était assurée par build_tex.py qui créait un fichier LaTeX pour chaque cours ainsi qu'un fichier principal main.tex. Lors de la compilation de main.tex, un PDF de 441 pages était généré, mais présentait plusieurs problèmes : table des matières incorrecte et mise en page incohérente.

#pagebreak()
#header_layout
#v(-6em)


#figure(
  image("../images/pipeline.png", width: 5in, height: 4.2in),
  caption: "Pipeline de Génération VitePress et PDF (Avant Intégration FISEA)"
)

L'architecture du système présentait deux contraintes majeures pour l'ajout de la formation FISEA. D'une part, la structure des données était conçue spécifiquement pour FISE, avec une arborescence reflétant uniquement les semestres de cette formation (S1A, S2P, S3A, etc.). D'autre part, le processus de génération PDF basé sur LaTeX ne permettait pas de créer facilement des documents personnalisés avec une sélection précise de semestres ou de cours, une fonctionnalité essentielle notamment dans le cadre des documents destinés aux OPCO ou d'autres cas.

=== Fusion des projets et objectifs FISEA

Avant d'intégrer FISEA, la première étape a consisté à fusionner le projet VitePress et celle de la génération de PDF, initialement distincts. Cette fusion visait à établir une source unique de vérité où les mêmes fichiers de cours Markdown serviraient à la fois au site web et aux documents PDF, éliminant les risques de divergence de contenu.

Les fichiers de cours pour FISE étaient initialement stockés dans docs/content et leur version anglaise dans docs/en. Pour maintenir cette organisation, les fichiers FISEA ont été ajoutés aux mêmes emplacements. La version anglaise des fichiers FISEA, qui n'existait pas initialement, a été créée par traduction des fichiers Markdown pour assurer une cohérence linguistique avec FISE.

#pagebreak()
#header_layout
#v(-6em)
L'ancien script build_latex.py a été retiré au profit de Typst pour la génération des PDF. Cette transition a permis de générer des PDF mieux structurés, sans les limitations rencontrées avec LaTeX. Les scripts existants (build_csv.py, build_json.py, build_md.py) sont demeurés chargés de l'extraction et du prétraitement des métadonnées, mais la production finale de PDF est déléguée à un nouveau flux utilisant Typst.

#figure(
  image("../images/pipeline2.png", width: 7.9in, height: 4.05in),
  caption: "Pipeline de Génération VitePress et PDF (Après  Intégration FISEA)"
)



=== Mise à jour des scripts JSON et CSV

Les scripts de gestion des JSON et CSV ont dû être enrichis pour traiter les deux formations. Les scripts détectent désormais deux formations distinctes par la présence de fise.json et fisea.json. L'extraction des cours s'effectue dans chaque fichier, et deux séries de données peuvent être générées, par exemple fise_volumes.csv et fisea_volumes.csv. Cette séparation s'avère pratique car chaque formation apparaît avec ses propres semestres, volumes horaires et informations de cours.

Dans build_csv.py, la fonction extract_course_data a été adaptée pour prendre en compte la clé "FISE" ou "FISEA" et ainsi différencier les cheminements. Le script lit deux JSON distincts, puis écrit deux CSV, un pour chaque formation. L'ancien code n'extrayait que course.json, mais il s'agit maintenant d'englober fise.json et fisea.json, rendant le système plus souple sans rompre l'existant.

#pagebreak()
#header_layout
#v(-6em)

Le script build_json.py n'a nécessité que peu de modifications, hormis la possibilité de l'appeler deux fois (une pour course.json, une pour course_fisea.json) ou d'unifier la gestion AAT. L'essentiel tient au fait que la structure de la formation FISEA peut différer avec ses semestres alternés et cours spécifiques, mais reste manipulée par les mêmes routines JSON.

Le script build_md.py, qui crée les index par semestre, a été adapté pour générer non seulement les dossiers S1A, S2P, etc., mais aussi S5_FISEA, S6_FISEA. La nouveauté est l'ajout d'un paramètre program_path (dont la valeur peut être "fise" ou "fisea"), transmis aux fonctions export_index et sync_course_header. Il insère automatiquement un sous-répertoire fisea dans le chemin, aboutissant par exemple à ../docs/content/fisea/S5_FISEA. Ce mécanisme permet de séparer physiquement les contenus Markdown des deux formations tout en réutilisant exactement les mêmes fonctions de génération.


=== Adaptation de la configuration VitePress

==== Configuration initiale

La configuration de VitePress, contenue dans config.js et MenusConfig.js, était focalisée sur la formation FISE. Les semestres mentionnés se bornaient à S1A, S2P, S3A, S4A, etc. 

Les items de la sidebar et de la navbar redirigeaient l'utilisateur vers les dossiers correspondants (par exemple /content/S1A/), en s'appuyant sur un JSON unique, course.json.




#figure(
  image("../images/vitepress1.png", width: 5.4in, height: 3in),
  caption: "Interface initiale VitePress affichant uniquement les semestres FISE"
)

==== Nouvelle configuration double formation 

Deux nouveaux JSON (course_fise.json et éventuellement course_fise.en.json) ont été introduits, et MenusConfig.js importe désormais course_fisea.json et course_fisea_en.json. Les fonctions fiseaSemesterItems et enFiseaSemesterItems sont apparues, listant les semestres #pagebreak()
#header_layout
#v(-6em)S5_FISEA, S6_FISEA et ainsi de suite. Dans config.js, on combine les sidebars FISE et FISEA à l'aide de getSidebarSemester('fr', 'fise') et getSidebarSemester('fr', 'fisea'). On dispose aussi de pages d'accueil distinctes (index_fise.html, index_fisea.html) pour diriger l'utilisateur selon la formation choisie. VitePress affiche alors deux parcours distincts, correspondant à chacune des formations. L'utilisateur peut aisément naviguer entre les semestres FISE ou FISEA, et basculer en anglais si le site dispose des versions .en.




#figure(
  image("../images/vitepress2.png", width: 6.4in, height: 3.6in),
  caption: "Nouvelle interface VitePress intégrant les semestres FISE et FISEA"
)

=== Bénéfices de l'intégration

Cette intégration permet de gérer simultanément la formation FISE, qui existait déjà, et la formation FISEA, qui vient s'y ajouter, sans dupliquer entièrement les scripts ou altérer en profondeur la structure initiale. L'approche rend la maintenance plus aisée, puisque tout demeure centralisé dans une seule base, organisée par formation. La possibilité d'évoluer vers une troisième formation se trouve renforcée : il suffirait d'ajouter un nouveau JSON et quelques ajustements similaires pour étendre le site à un nouvel ensemble de cours et de semestres. Le passage de LaTeX à Typst modernise par ailleurs le flux de génération PDF et supprime la dépendance au script build_latex.py, tout en s'insérant harmonieusement dans la logique de scripts existants qui ne font que préparer les données.

L'intégration de FISEA dans VitePress a considérablement étendu le périmètre initial du site, conçu pour FISE uniquement. Les scripts Python gèrent désormais deux formations parallèlement et produisent JSON, CSV ou index Markdown spécifiques, tandis que VitePress offre deux parcours de navigation distincts. Les semestres FISE et FISEA cohabitent dans un #pagebreak()
#header_layout
#v(-6em)écosystème unifié, la maintenance restant concentrée sur des fichiers de configuration et de script uniques, aisément adaptables si de nouvelles évolutions apparaissent. La transition de LaTeX vers Typst assure un processus de génération PDF plus léger, tout en tirant parti de la structure de code existante. L'école dispose donc d'un système capable de gérer deux cursus distincts, voire davantage à l'avenir, tout en préservant la robustesse et la simplicité de la solution VitePress.



#text[*Conclusion*]

Le développement des interfaces utilisateur représente la dernière étape technique de notre projet de modernisation du système documentaire de l'ENIB. Les outils mis en place offrent une solution robuste et intuitive pour la gestion du programme pédagogique, en priorisant l'expérience utilisateur et l'efficacité opérationnelle.

L'interface web Flask, couplée à l'outil de gestion des métadonnées et à l'intégration FISEA dans VitePress, forme un écosystème cohérent qui répond pleinement aux besoins identifiés lors de l'analyse initiale, notamment pour la génération de documents adaptés aux exigences des différents acteurs internes et externes de l'école.

Le système mis en place démontre la pertinence des choix technologiques effectués. La migration vers Typst, l'utilisation de Flask pour l'interface web, et l'intégration réussie dans l'infrastructure GitLab existante ont permis de créer une solution performante et évolutive.

La prochaine étape du projet consistera à évaluer l'impact environnemental et sociétal de la solution mise en place, notamment en termes d'efficacité énergétique et d'accessibilité. Cette analyse RSE-RNE permettra de valider nos choix techniques et d'identifier d'éventuelles pistes d'amélioration pour réduire l'empreinte écologique du système.

