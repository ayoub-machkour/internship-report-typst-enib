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
    CHAPITRE 6 : Étude d'impact RSE-RNE du projet 
  ]
]
#pagebreak()
#header_layout
#v(-6em)

#text[*Introduction*]

#magic_box(
  content: [
Dans le contexte actuel de transformation numérique, la responsabilité des organisations s'étend au-delà des aspects sociétaux traditionnels pour inclure une dimension numérique croissante. L'ENIB place le développement durable et la responsabilité sociétale (RSE), ainsi que la responsabilité numérique (RNE), au centre de sa stratégie #cite(label("enib_rse_2024")).

Le projet de modernisation du système de gestion documentaire s'inscrit pleinement dans cette dynamique. Il vise à rationaliser la production de documents pédagogiques, à réduire l'empreinte environnementale et à favoriser une gouvernance numérique plus responsable. Ce chapitre explore en profondeur les impacts RSE-RNE de notre solution, en examinant à la fois les aspects techniques et organisationnels qui contribuent à cette démarche.
  ]
)


= Gouvernance et organisation responsable

La gouvernance numérique responsable constitue un pilier essentiel du projet. L'ENIB cherche à instaurer des pratiques de gestion documentaire transparentes et éthiques, en s'appuyant sur des outils modernes et des processus rigoureux.

La centralisation des données pédagogiques repose sur des fichiers Markdown stockés dans GitLab#cite(label("enib_gitlab")). Ces fichiers constituent la “single source of truth” pour deux systèmes distincts : VitePress pour la génération du site web pédagogique et Typst pour la génération de documents PDF. Cette approche évite la duplication des contenus et réduit les risques d'incohérence, tout en répondant aux exigences de sobriété numérique.

Chaque modification des fichiers Markdown est soumise à un processus de validation rigoureux via GitLab#cite(label("enib_gitlab")). L'ingénieure pédagogique valide systématiquement les contributions des enseignants et administratifs avant leur intégration, garantissant ainsi la qualité et la cohérence des documents produits. GitLab permet également une traçabilité complète des modifications, assurant une transparence totale sur l'évolution des documents.

L'interface web développée avec Flask joue un rôle clé dans la gouvernance participative du projet. Elle permet aux utilisateurs de personnaliser les documents PDF sans manipuler directement les fichiers source, facilitant ainsi la contribution des différents acteurs de l'école. Cette approche réduit la charge cognitive des utilisateurs et améliore leur implication dans la gestion documentaire#cite(label("strategie_rne")).

#pagebreak()
#header_layout
#v(-6em)

== Impact environnemental et sobriété numérique
#v(1em)

Le projet adopte une approche de sobriété numérique à travers des choix technologiques visant à optimiser les ressources et à réduire l'empreinte environnementale.



L'un des principaux leviers d'optimisation réside dans le remplacement de LaTeX par Typst pour la génération de documents PDF. Typst est plus rapide et consomme moins de ressources CPU que LaTeX, réduisant ainsi la consommation électrique des serveurs. De plus, Typst nécessite une installation d'environ 100 Mo, contre plus de 3 Go pour LaTeX, ce qui allège considérablement l'empreinte numérique#cite(label("typst_forum")).

L'environnement de développement est standardisé grâce à Miniconda, qui permet de créer des environnements virtuels isolés. En utilisant un fichier typst_environment.yml, il est possible de reproduire l'environnement de génération de PDF sur n'importe quelle machine disposant de Miniconda, sans nécessiter d'installation manuelle supplémentaire. Cette approche évite la multiplication d'installations inutiles et garantit la reproductibilité du système de manière légère et écoresponsable.

Pour la partie web, VitePress nécessite quelques installations supplémentaires comme gray-matter, Chart.js, vite, et vue. Contrairement à la génération PDF, VitePress dépend de Node.js, ce qui implique des installations spécifiques en l'absence de ce dernier. Toutefois, ces installations sont limitées et n'alourdissent pas excessivement l'environnement numérique de l'école.

La génération de documents PDF est réalisée uniquement à la demande, évitant ainsi la production systématique de fichiers inutiles. Ce mode de fonctionnement permet de limiter l'utilisation des ressources serveurs, tout en répondant de manière précise aux besoins spécifiques.

L'interface web développée avec Flask en Python s'inscrit dans cette logique de sobriété numérique. Contrairement aux solutions client-lourdes comme Qt, Flask permet de s'appuyer directement sur le navigateur, évitant ainsi des installations locales lourdes et réduisant l'empreinte numérique. Cette approche légère et multiplateforme simplifie l'accès au système, tout en garantissant une meilleure portabilité et une maintenance facilitée#cite(label("planeks_flask")).

La génération PDF via Typst est déclenchée uniquement lorsque nécessaire, optimisant l'utilisation des ressources serveurs et réduisant la consommation énergétique. En adoptant Flask et Typst, l'ENIB privilégie des solutions efficaces et durables, en adéquation avec ses engagements de sobriété numérique.

== Relations de travail et inclusion numérique

Le projet contribue à améliorer les conditions de travail du personnel administratif en automatisant les tâches répétitives liées à la génération et à la mise à jour des documents #pagebreak()
#header_layout
#v(-6em)pédagogiques. Cette automatisation libère du temps pour des activités à plus forte valeur ajoutée, telles que l'accompagnement des étudiants ou l'amélioration des processus pédagogiques.




Exemple concret d'automatisation : La création de livrets pédagogiques et de programmes de cours est désormais automatisée. Auparavant, ces documents étaient élaborés manuellement, un processus long et fastidieux nécessitant souvent plusieurs heures de travail. Dans certains cas, deux personnes étaient mobilisées pour rédiger, vérifier et mettre en page ces livrables afin de garantir leur conformité et leur qualité. Cette charge de travail ralentissait la production et augmentait le risque d'erreurs ou d'incohérences#cite(label("enib_stage_template")).

Désormais, grâce à l'intégration de Typst, les informations saisies dans les fichiers Markdown sont automatiquement formatées et compilées en documents prêts à l'emploi. Ce processus garantit une mise en page uniforme, réduit considérablement le temps de création et libère les équipes de tâches répétitives, leur permettant ainsi de se concentrer sur des missions à plus forte valeur ajoutée.

L'interface web développée permet à tous les utilisateurs, quel que soit leur niveau technique, de générer des documents PDF de manière intuitive. La simplicité de cette interface réduit la charge cognitive et favorise une plus grande inclusion numérique au sein de l'école.

Le site web VitePress permet de rendre les programmes pédagogiques accessibles en français et en anglais, renforçant ainsi l'inclusion des étudiants et enseignants internationaux. Cette fonctionnalité contribue à la diversité linguistique de l'école et facilite la communication avec les partenaires étrangers.

==  Impact sociétal et développement numérique local
#v(1em)

Le projet exerce un impact significatif sur l'écosystème éducatif et local. En centralisant et standardisant la documentation pédagogique, il rend l'information plus accessible et compréhensible pour les étudiants, les familles et les entreprises partenaires.

Dans le cadre de ce projet, un template de rapport de stage a été développé en utilisant Typst. Ce template, conforme aux exigences de l'ENIB, sera mis à disposition des futurs étudiants pour leur permettre de rédiger leurs rapports de manière structurée et professionnelle. Ce choix s'inscrit dans une démarche d'initiation des étudiants aux outils numériques modernes #cite(label("enib_stage_template")).

Historiquement, un template LaTeX, conçu par M. Vincent Choqueuse, était proposé aux étudiants. Toutefois, LaTeX présente une courbe d'apprentissage relativement élevée et une configuration complexe, ce qui pouvait décourager certains utilisateurs. Typst, en revanche, se distingue par sa simplicité syntaxique et sa rapidité de compilation, offrant une alternative plus accessible et moins gourmande en ressources.

#pagebreak()
#header_layout
#v(-6em)

L'utilisation de ce nouveau template ne se limite pas à alléger la charge de travail des étudiants. Il favorise également leur acculturation aux technologies émergentes, les préparant ainsi à adopter des outils modernes dans leur futur environnement professionnel. De plus, cette initiative contribue à renforcer les compétences numériques des étudiants, un atout précieux dans un marché du travail en constante évolution.

Le projet n'impacte pas uniquement les étudiants, mais bénéficie également à l'écosystème académique local. En simplifiant la gestion documentaire et en standardisant les formats utilisés, l'ENIB améliore sa réactivité face aux demandes des entreprises partenaires. Les dossiers d'alternance, les programmes de formation et les brochures institutionnelles peuvent être produits plus rapidement, avec une qualité constante. Cette efficacité accrue favorise l'ancrage territorial de l'école et renforce son attractivité auprès des acteurs économiques locaux.

== Comparaison avec d'autres établissements
#v(1em)

L'ENIB s'inscrit dans une dynamique partagée par plusieurs établissements d'enseignement supérieur, visant à moderniser les processus de gestion documentaire grâce à des outils numériques plus légers et respectueux de l'environnement.

Dans certaines écoles, l'usage de LaTeX reste la solution privilégiée pour la production de documents académiques. Par exemple, l'INSA Lyon propose des templates LaTeX dédiés à la rédaction de thèses et mémoires, garantissant une standardisation des livrables et répondant aux exigences académiques#cite(label("insa_manuscrit"))#cite(label("insa_stage_template")).

Cependant, malgré la robustesse de LaTeX, ses limites en termes de lourdeur, de complexité et de consommation de ressources ont conduit l'ENIB à opter pour Typst. Ce dernier permet une génération de documents PDF plus rapide, légère et facile à maintenir, contribuant ainsi à la réduction de l'empreinte environnementale de l'établissement. Contrairement à LaTeX, Typst s'intègre de manière plus fluide avec les autres outils déjà en place, tels que VitePress et Flask, créant ainsi un écosystème cohérent et performant.

L'approche adoptée par l'ENIB illustre une volonté d'innovation continue, tout en s'alignant avec des objectifs de sobriété numérique et de responsabilité sociétale. Cette stratégie positionne l'école à la pointe des pratiques de transformation numérique durable dans l'enseignement supérieur.


== Impacts indirects et effets numériques induits

#v(1em)

Au-delà des bénéfices directs observés, la modernisation du système documentaire génère des impacts indirects significatifs. En introduisant des outils modernes comme Typst #pagebreak()
#header_layout
#v(-6em)et VitePress, l'ENIB contribue au développement des compétences numériques de ses enseignants et personnels administratifs.

L'utilisation quotidienne de GitLab pour gérer les fichiers Markdown et suivre les modifications favorise l'appropriation de pratiques de versionnage, essentielles dans les métiers du numérique. Ce type d'outillage, initialement limité à la gestion documentaire, pourrait être étendu à d'autres projets internes, renforçant ainsi la transformation numérique globale de l'établissement.

L'automatisation de la génération de documents améliore également la capacité de l'ENIB à répondre rapidement aux demandes externes. Par exemple, les demandes de documents pédagogiques spécifiques formulées par les OPCO (Opérateurs de Compétences) dans le cadre des formations en alternance peuvent désormais être satisfaites plus efficacement, grâce à des outils qui permettent une personnalisation rapide et précise des contenus.

De plus, l'architecture modulaire du système facilite son extension à d'autres domaines de l'école. Les composants développés pour la génération des PDF ou l'interface de gestion documentaire pourraient être réutilisés pour d'autres projets, accélérant ainsi la digitalisation de l'ensemble des services administratifs.

== Perspectives d'amélioration RSE-RNE

Bien que les résultats obtenus soient encourageants, plusieurs pistes d'amélioration ont été identifiées pour renforcer encore davantage l'impact RSE-RNE du projet.

Sur le plan technique, la mise en place d'un système de monitoring des ressources serveurs pourrait permettre de mesurer précisément l'empreinte carbone associée à la génération des documents PDF. Cette mesure offrirait une vision claire des consommations énergétiques et permettrait d'identifier des axes de réduction supplémentaires. 

L'optimisation continue des dépendances du projet, notamment pour l'environnement VitePress, pourrait également contribuer à réduire l'empreinte numérique. L'exploration de solutions alternatives plus légères à certaines bibliothèques comme Chart.js ou gray-matter pourrait s'inscrire dans cette démarche.

== Recommandations pour une évolution durable
#v(1em)
Pour assurer la pérennité et l'amélioration continue de cette transformation numérique, il est essentiel de mettre en place des outils permettant de mesurer et réduire l'empreinte carbone du système. L'intégration de solutions telles que Scaphandre (outil de mesure en temps réel de la consommation énergétique des serveurs)#cite(label("scaphandre_github")) ou CO2.js (qui estime l'empreinte carbone des sites web)#cite(label("co2js_greenweb")) permettrait de suivre précisément l'impact environnemental des opérations numériques, comme la génération de PDF avec Typst ou les déploiements VitePress.


#pagebreak()
#header_layout
#v(-6em)

En complément, des outils tels que Green Metrics Tool ou Cloud Carbon Footprint pourraient être utilisés pour analyser l'impact carbone des infrastructures cloud et services associés, offrant ainsi une vision globale, tant locale que dématérialisée. Cette approche garantirait une évaluation complète de l'ensemble du système, couvrant les serveurs sur site ainsi que les ressources hébergées dans le cloud.


Ces outils pourraient être automatisés et intégrés directement dans le pipeline GitLab CI/CD, générant des rapports d'empreinte carbone après chaque compilation ou mise à jour du site. Cette automatisation offrirait un suivi constant sans nécessiter d'intervention humaine, tout en sensibilisant les équipes à l'impact réel des opérations numériques.


L'ENIB pourrait également renforcer sa collaboration avec d'autres écoles engagées dans des démarches similaires, comme l'INSA Lyon ou l'Université de Nantes. Le partage des outils développés (comme les scripts Flask ou Typst) et la mutualisation des innovations techniques permettraient d'optimiser les ressources tout en accélérant les avancées technologiques.

Enfin, des développements futurs pourraient inclure l'ajout d'une génération PDF multilingue, actuellement limitée au site web VitePress, ainsi que l'amélioration de l'interface Flask pour rendre la personnalisation des documents plus intuitive. L'intégration d'un tableau de bord interactif, affichant en temps réel l'empreinte carbone du système grâce à Scaphandre ou CO2.js, offrirait une transparence accrue et renforcerait la sensibilisation à la sobriété numérique.

En mettant en œuvre ces actions, l'ENIB s'affirmera comme un acteur clé de la digitalisation responsable, réduisant son empreinte écologique tout en poursuivant son engagement vers une transformation numérique durable et performante.

== Conclusion
#v(1em)

Le projet de modernisation documentaire de l'ENIB représente une avancée significative vers une gestion plus responsable et durable des ressources pédagogiques. L'utilisation de Typst pour la génération des documents PDF, ainsi que la création d'un template de rapport de stage, illustrent une volonté claire d'optimiser les processus tout en préparant les étudiants aux technologies de demain.

En remplaçant des solutions plus lourdes comme LaTeX par des outils modernes et plus légers, l'ENIB démontre qu'il est possible de concilier innovation technologique, efficacité opérationnelle et responsabilité environnementale.
Les choix technologiques et organisationnels effectués au cours de ce projet s'inscrivent dans une logique de transformation numérique durable, en harmonie avec les objectifs de développement durable de l'établissement. La mise à disposition du template Typst pour les futurs étudiants reflète cette volonté de partager et de diffuser des pratiques numériques responsables.
En #pagebreak()
#header_layout
#v(-6em)s'engageant dans cette démarche, l'ENIB se positionne non seulement comme un acteur de la transition écologique, mais également comme un précurseur dans l'intégration des outils numériques dans les processus pédagogiques et administratifs. À travers cette initiative, l'ENIB s'affirme non seulement comme un acteur clé de la transition numérique responsable mais aussi comme une référence pour d'autres établissements souhaitant s'engager dans des démarches similaires.




