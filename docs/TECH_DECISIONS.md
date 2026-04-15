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

## Decision 002 : [Template pour prochaine décision]

**Date :** [date]
**Status :** [🤔 En discussion / ✅ Acceptée / ❌ Rejetée]
**Contexte :** [Pourquoi cette décision doit être prise]

### Options considérées

#### Option A : [nom]
**Avantages :**
- [point 1]
- [point 2]

**Inconvénients :**
- [point 1]
- [point 2]

#### Option B : [nom]
[...]

### Décision

[Choix] ✅/❌

### Justification

[Pourquoi ce choix est aligné avec les objectifs du projet]

### Trade-offs acceptés

- [Ce qu'on sacrifie]

### Impact sur le projet

- [Conséquences concrètes]

---

*Ce document sera mis à jour à chaque décision majeure. Chaque décision doit pouvoir être justifiée en entretien.*

# Decision Record #002 : Scope MVP — 3 Features au lieu de 5

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
