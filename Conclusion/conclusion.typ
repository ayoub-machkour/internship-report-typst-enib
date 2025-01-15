#import "../template.typ": header_layout, magic_box, footer_layout

#set page(
  margin: (x: 2cm, y: 5cm),
  footer: footer_layout
)

#set text(font: "Segoe UI", size: 12pt)
#set heading(numbering: "1.1")
#set par(justify: true)


#header_layout
#v(-6em)
= Conclusion générale :

#v(1em)
Ce projet de modernisation du système documentaire de l'ENIB marque une évolution majeure dans la gestion des documents pédagogiques de l'école. Face à un système initial fragmenté reposant sur LaTeX et des processus manuels chronophages, nous avons développé une solution répondant efficacement aux besoins de l'établissement.

L'architecture technique mise en place repose sur deux projets complémentaires qui ont été fusionnés pour garantir une source unique de vérité. Le premier projet, centré sur Typst et Flask, automatise la génération de documents PDF personnalisables. L'interface web développée permet au personnel administratif de produire rapidement des documents adaptés aux exigences des OPCO et autres partenaires. Le second projet enrichit le site web VitePress existant pour intégrer la formation FISEA. Bien que techniquement indépendants, ces deux systèmes s'appuient sur les mêmes fichiers Markdown sources centralisés sur GitLab, assurant ainsi une parfaite cohérence des informations diffusées.

Cette transformation s'inscrit pleinement dans la démarche RSE-RNE de l'ENIB. L'utilisation d'outils légers comme Typst réduit significativement l'empreinte environnementale du système, tandis que le développement d'un template de rapport de stage modernise les outils mis à disposition des étudiants.

Les perspectives d'évolution sont nombreuses : optimisation des performances, nouvelles fonctionnalités, renforcement du monitoring environnemental. La solution développée constitue un socle solide pour accompagner les futures transformations de l'ENIB, notamment son intégration au nouvel Institut National Polytechnique.

Ce projet démontre qu'une approche technique moderne, associée à une vision responsable, peut générer des solutions performantes qui améliorent concrètement le quotidien des utilisateurs. L'ENIB dispose désormais d'un système documentaire fiable et évolutif, aligné sur ses objectifs de transformation numérique durable.

