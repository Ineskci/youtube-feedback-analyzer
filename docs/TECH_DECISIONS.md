# 🔧 Tech Decisions Log

*Documentation des décisions techniques et produit majeures du projet*

---

## Decision 001 : Pourquoi Rails et pas Python ?

**Date :** 14 avril 2026
**Status :** ✅ Acceptée
**Contexte :** Choix du framework backend pour le MVP

### Options considérées

#### Option A : Python + Flask
**Avantages :**
- Plus simple pour débutant
- Écosystème IA mature (majoritairement Python)
- Nombreux exemples avec OpenAI/Claude

**Inconvénients :**
- Moins structuré (trop de liberté = décisions à prendre)
- Moins impressionnant sur un CV web dev
- Pas de conventions établies

#### Option B : Ruby on Rails
**Avantages :**
- Convention over Configuration = apprends les bonnes pratiques
- Écosystème mature pour web apps
- Hotwire = moderne sans complexité React
- Plus valorisant sur un portfolio tech

**Inconvénients :**
- Courbe d'apprentissage plus raide
- Moins de ressources IA-focused en Ruby

### Décision

**Rails** ✅

### Justification

En tant que PM, je dois démontrer :
1. Ma capacité à apprendre des technologies complexes
2. Ma compréhension des bonnes pratiques web
3. Ma vision long-terme (Rails = framework d'entreprise)

Le temps d'apprentissage supplémentaire est un **investissement**, pas un coût.

### Trade-offs acceptés

- J'accepte une courbe d'apprentissage plus raide
- J'accepte de devoir traduire les exemples Python en Ruby
- Je gagne en crédibilité technique sur mon CV

### Impact sur le projet

- Roadmap rallongée de ~3 jours pour apprentissage Rails
- Meilleure architecture du code (MVC strict)
- Portfolio plus solide pour postuler dans des scale-ups tech

---

---

*Ce document sera mis à jour à chaque décision majeure. Chaque décision doit pouvoir être justifiée en entretien.*

## Decision 002 : Scope MVP — 3 Features au lieu de 5

**Date :** 14 avril 2026
**Contexte :** Révision du scope après analyse réaliste
**Statut :** Decided

## Problème
Mon Product Brief initial prévoyait 5 features en 30h :
1. Pain Points Clustering
2. Feature Request Ranker
3. Sentiment Timeline
4. Competitive Intelligence
5. Executive Summary

Estimation honnête : 40-50h nécessaires, pas 30h.

## Décision
Réduire à 3 features core :
1. Pain Points Clustering (7h)
2. Executive Summary (2h)
3. Feature Request Ranker (5h)

Features coupées : #3 Sentiment Timeline, #4 Competitive Intelligence

## Raison
- **Réalisme** : Je suis débutante Rails, je dois bufferiser
- **Cohérence MVP** : Les 3 features forment un workflow complet
- **Portfolio impact** : Mieux vaut 3 features solides que 5 à moitié

## Comment je présente ça en entretien
"J'avais prévu 5 features. J'ai ruthlessly coupé 2 nice-to-haves
pour me concentrer sur le core value. C'est du PM 101 : livrer
de la qualité sur un scope réduit plutôt que du superficiel
sur un scope trop large."

---

## Decision 003 : Rails Setup — Choix Techniques du Projet

**Date :** 14-15 avril 2026
**Status :** ✅ Acceptée
**Contexte :** Choix des outils et configuration lors du `rails new`

### Décisions prises

#### PostgreSQL (pas SQLite)
- SQLite = base de données fichier, pas adaptée à la production
- PostgreSQL = standard industrie, supporté nativement par Render/Heroku
- Décision : PostgreSQL dès le départ pour éviter une migration plus tard

#### Import Maps (pas Webpack/Node)
- Webpack = complexité Node.js, npm, bundler à gérer
- Import Maps = le navigateur charge le JS directement, zéro build step
- Pour ce projet (pas de React, pas de TypeScript), Import Maps suffit largement

#### Hotwire (Turbo + Stimulus) au lieu de React
- React = overkill pour des pages qui se rechargent, courbe d'apprentissage élevée
- Hotwire = interactivité moderne avec des conventions Rails, moins de JS à écrire
- Aligné avec la philosophie Rails 8 : "less JavaScript by default"

#### Un seul model `Analysis` au lieu de `Video` + `Comment`
- Le plan initial prévoyait deux modèles séparés
- Un seul `Analysis` stockant les commentaires en JSON est plus simple pour le MVP
- Trade-off accepté : moins flexible si on veut requêter les commentaires individuellement

### Trade-offs acceptés

- Import Maps = pas de npm packages avancés (Chart.js devra être chargé via CDN)
- Model unique = commentaires stockés en JSON, pas requêtables individuellement en SQL

### Comment je présente ça en entretien
"J'ai choisi de minimiser la complexité technique pour maximiser la vitesse d'itération.
Sur un MVP solo, chaque couche de complexité ajoutée est une dette de maintenance.
J'ai documenté les trade-offs pour pouvoir migrer si le produit évolue."
