By Olife & Urban

# Application de covoiturage #

## Introduction ##
Le thème général du projet est une application de covoiturage.

## Objectif ##

Notre objectif est de proposer une application (mobile et web) de mise en relation de personne désirant réaliser du co-voiturage, l'application propose de poster ou rechercher une offre grâce à plusieurs critères (fréquence, horaires, rayon de recherche, ...) et permet de mettre directement les personnes en contact. Ce projet est innovant car grâce à l'application mobile, il sera possible de géolocaliser le pilote ou le passager depuis son mobile. Il sera donc possible de suivre la progression de son conducteur avant qu'il arrive sur le lieu de rendez-vous. Ainsi ces applications correspondent aussi bien pour des personnes pratiquant le covoiturage de façon régulière que pour des demandes occasionnelles. L'interface mobile et web gérera le "multipays".
Architecture

Le projet est composé de 2 applications distinct, une application mobile pour l'OS Android et une application Web hébergé sur un serveur apache tomcat. L'architecture est décrit à l'aide des schémas ci-joint.




## Fonctionnalité ##

### Mobile ###

  1. Rechercher une offre de covoiturage
  1. Fonction de recherche du meilleur trajet
  1. Fonction affiche liste de tous les trajets classés par date
  1. Affiche la liste de tous les trajets non réalisés d'un usager
  1. Geolocation du pilote ou passager de covoiturage
  1. Affiche le trajet du pilote vers le passager de covoiturage
  1. Tchat usager entre pilote/passager/ami

### Serveur ###

  1. Gestion des profils usagers (conducteur ou passager)
  1. Gestion droit (élément public ou privé)
  1. Recherche conducteur ou passager par critères (région par exemple)
  1. Gestion des offres et demandes par critères (quotidien, hebdomadaire, soirée, évenements, rayon de recherche...)
  1. Poster offre de covoiturage
  1. Recherche offre de covoiturage
  1. Différente fonction de recherche du meilleur trajet
  1. Historique covoiturage
  1. Gestion des communications entre conducteur et passager
  1. Système de notation des conducteurs (ponctualité, amabilité, ...)
  1. Gestion des tarifs de covoiturage
  1. Outil adminstrateur (Statiques, supprimer compte, fonction écrire message administrateur...)
  1. Gestion du multilangues et multidevises

### Méthodologie ###

  1. Diagramme
  1. MCD
  1. Serveur SVN
  1. Wiki interprojet

### Outils ###

  1. MySQL (couhe applicatif : CSDAO)
  1. Eclipse
  1. Hibernate (couche applicatif : CSDAO)
  1. Struts 2 (couche applicatif : CSAppWe)
  1. Maven (toutes les couches)
  1. Spring (couche applicatif : CSEngine)
  1. CXF (couche applicatif : CSAppWebService)
  1. Java/jee/jme
  1. Api android de google (application mobile)
  1. Librairie standard java/j2ee/j2me