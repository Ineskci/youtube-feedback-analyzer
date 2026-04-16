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

---

## Decision 004 : Passage de Claude Opus à Haiku

**Date :** 16 avril 2026
**Status :** ✅ Acceptée
**Contexte :** Optimisation des coûts après mise en production

### Problème
Le prototype utilisait `claude-opus-4-6` pour toutes les analyses. Coût estimé par analyse : $0.10–0.15. Non viable pour un outil utilisé en démo fréquente.

### Options considérées

| Modèle | Input | Output | Qualité |
|---|---|---|---|
| claude-opus-4-6 | $15/MTok | $75/MTok | Meilleure |
| claude-sonnet-4-6 | $3/MTok | $15/MTok | Très bonne |
| claude-haiku-4-5-20251001 | $0.80/MTok | $4/MTok | Bonne |

### Décision
**Haiku pour les deux appels** (analyse principale + timeline)

### Justification
- Les prompts sont très structurés avec output JSON strict → Haiku suit bien les instructions
- La qualité des insights reste professionnelle (testée en production sur GoPro HERO5)
- Réduction de coût ~10x : $0.01–0.02 par analyse au lieu de $0.10–0.15
- Pour un portfolio PM, la fiabilité > la perfection marginale d'Opus

### Trade-offs acceptés
- Haiku peut être moins nuancé sur des commentaires très complexes ou ambigus
- Si la qualité s'avère insuffisante pour certains cas, on peut passer Sonnet sur l'analyse principale uniquement

### Comment je présente ça en entretien
"J'ai fait un arbitrage coût/qualité explicite. Haiku produit des insights suffisamment bons pour mon cas d'usage, à 10x moins cher. C'est du PM thinking appliqué aux décisions techniques : on optimise pour le 'good enough' quand le perfectionnisme n'apporte pas de valeur supplémentaire."

---

## Decision 005 : Enrichissement du prompt — Verbatims, Sévérité, % et Recommended Actions

**Date :** 16 avril 2026
**Status :** ✅ Acceptée
**Contexte :** Feedback critique d'une revue produit (score initial : 6.4/10)

### Problème
Le dashboard montrait des données mais manquait d'actionnabilité :
- Pain Points : juste "8 mentions" sans contexte ni preuve
- Feature Requests : "6 votes" sans poids relatif
- Aucune recommandation claire pour le PM

### Décision
Enrichir le prompt `analyze_comments` avec 4 nouveaux champs :

1. **`percentage`** (pain points + feature requests) : `count / total * 100` — plus impactant que les chiffres bruts
2. **`severity`** (pain points) : score 1–5 basé sur fréquence + niveau de frustration
3. **`verbatims`** (pain points) : 2 citations exactes de commentaires — prouve que c'est data-driven
4. **`recommended_actions`** : top 3 actions PM avec rationale et priorité (high/medium/low)

### Justification
- "34% des users affectés" est plus parlant que "8 mentions" pour un stakeholder C-level
- Les verbatims transforment le dashboard d'un "nice data viz" en outil crédible
- Les Recommended Actions répondent à "et maintenant, je fais quoi ?" — c'est la question d'un PM, pas d'un data analyst

### Trade-offs acceptés
- Prompt plus long → légèrement plus de tokens consommés
- `max_tokens` augmenté de 2048 à 4096 pour la réponse
- Claude Haiku peut parfois choisir des verbatims génériques — acceptable pour un MVP

### Comment je présente ça en entretien
"Suite à une revue produit, j'ai identifié que mon outil manquait d'actionnabilité. J'ai itéré le prompt Claude pour qu'il retourne des verbatims, des pourcentages, et des recommandations concrètes. C'est un exemple de boucle feedback → amélioration produit que j'applique à mon propre outil."
