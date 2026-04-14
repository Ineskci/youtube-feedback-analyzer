📝 PRODUCT_BRIEF.md — Contenu Complet
Copie-colle TOUT ce qui suit dans ton fichier docs/PRODUCT_BRIEF.md :

markdown# 🚀 YouTube Feedback Analyzer — Product Brief V2.0
**Projet PM Portfolio-Ready avec Documentation Publique**

---

## 📋 EXECUTIVE SUMMARY

**Persona cible :** Product Managers en startup/scale-up
**Problème :** Analyser manuellement des centaines de commentaires YouTube prend 5-10h/semaine
**Solution :** Dashboard IA qui transforme les commentaires YouTube en insights actionnables en 2 minutes
**Différenciateur CV :** Features que tu utiliseras réellement dans ton métier de PM + démonstrables en entretien

---

## 🎯 STRATÉGIE : Features "Portfolio-First"

### Principe directeur

Chaque feature doit répondre à cette question :
> **"Est-ce que je peux expliquer cette feature en entretien ET démontrer comment elle résout un vrai problème PM ?"**

---

## 💎 FEATURES MVP — Orientées Démo Entretien

### Feature 1 : **User Pain Points Clustering** 🔴 MUST HAVE

**Ce que ça fait :**
- Analyse tous les commentaires
- Identifie automatiquement les catégories de problèmes récurrents
- Affiche les top 5 pain points avec :
  - % de commentaires concernés
  - Exemples de verbatims représentatifs
  - Score de sévérité (1-10)

**Pourquoi c'est puissant pour un entretien :**
Recruteur : "Comment tu priorises les features ?"
Toi : "Voilà un exemple concret. J'ai analysé 500 commentaires
sur une vidéo de produit SaaS. L'outil a identifié que 34%
des users mentionnent le même pain point de onboarding.
Ça m'a permis de prioriser cette feature en Sprint 1."

**Démo live en entretien :**
- Tu montres une vraie vidéo YouTube d'un produit tech
- Tu lances l'analyse en direct
- En 2 min, tu as un rapport structuré
- **Impact : Le recruteur voit que tu es data-driven**

---

### Feature 2 : **Feature Request Ranker** 🔴 MUST HAVE

**Ce que ça fait :**
- Extrait toutes les demandes de features des commentaires
- Les classe par fréquence de mention
- Détecte le sentiment associé (combien de gens sont frustrés vs. enthousiastes)
- Génère une "feature request backlog" priorisée

**Sortie exemple :**

Dark Mode — 45 mentions — 89% positif — "High impact, easy win"
Mobile App — 38 mentions — 67% frustré — "Critical pain point"
Export PDF — 12 mentions — 34% neutre — "Nice to have"


**Pourquoi c'est puissant pour un entretien :**
Recruteur : "Comment tu construis un product backlog ?"
Toi : "Je combine données quantitatives et qualitatives.
Regarde cet outil que j'ai construit : il analyse
le feedback utilisateur brut et me donne une première
priorisation basée sur la fréquence ET le sentiment.
Évidemment, je croise ça avec la stratégie business,
mais ça m'évite de passer à côté d'un quick win."

---

### Feature 3 : **Sentiment Timeline** 🟡 SHOULD HAVE

**Ce que ça fait :**
- Graphique qui montre l'évolution du sentiment au fil du temps
- Détecte les pics de frustration ou d'enthousiasme
- Corrèle avec les dates de release de nouvelles features

**Exemple visuel :**
Jan    Feb    Mar    Apr    May
😊 ─── 😐 ─── 😠 ─── 😊 ─── 😊
    ↑
Release v2.0
(bug majeur)

**Pourquoi c'est puissant pour un entretien :**
Recruteur : "Comment tu mesures le succès d'une release ?"
Toi : "Au-delà des métriques produit classiques, je track
le sentiment utilisateur avant/après une release.
Mon outil analyse ça automatiquement sur YouTube.
Ça m'a déjà permis de détecter un bug critique
3 jours après une release grâce à un spike négatif."

---

### Feature 4 : **Competitive Intelligence Tracker** 🟡 SHOULD HAVE

**Ce que ça fait :**
- Compare les commentaires de TON produit vs. ceux de tes concurrents
- Identifie ce que les users aiment/détestent chez la concurrence
- Extrait les opportunités de différenciation

**Exemple de rapport :**
TON PRODUIT vs. CONCURRENT A
────────────────────────────
Ton avantage :

UX jugée "plus intuitive" (67% vs. 34%)
Support client "réactif" (mentions 3x plus fréquentes)

Leur avantage :

Intégrations tierces (demandées dans 45% de tes commentaires)
Pricing transparent (frustration récurrente chez toi)


**Pourquoi c'est puissant pour un entretien :**
Recruteur : "Comment tu fais de la veille concurrentielle ?"
Toi : "J'ai automatisé une partie avec cet outil. Il analyse
les commentaires YouTube de nos concurrents directs et
détecte les gaps dans notre produit. Par exemple, j'ai
identifié qu'on était en retard sur les intégrations API,
ce qui a orienté notre roadmap Q2."

---

### Feature 5 : **Executive Summary Auto-Generator** 🔴 MUST HAVE

**Ce que ça fait :**
- Génère un résumé de 5 lignes pour ton CEO/VP Product
- Bullet points actionnables
- Ton professionnel, orienté décision

**Exemple de sortie :**
📊 YouTube Feedback Analysis — Vidéo "Product Demo v3.0"
────────────────────────────────────────────────────────

512 commentaires analysés sur 30 jours
Sentiment global : 72% positif, 18% neutre, 10% négatif
Top pain point : Onboarding complexe (34% des mentions)
Top feature request : Dark mode (45 mentions)
Recommandation : Prioriser l'amélioration de l'onboarding
avant d'ajouter de nouvelles features


**Pourquoi c'est puissant pour un entretien :**
Recruteur : "Comment tu communiques avec les stakeholders ?"
Toi : "Je synthétise toujours mes analyses en executive summary.
Mon outil le fait automatiquement pour gagner du temps.
Un CEO n'a pas le temps de lire 50 slides — il veut
les 3 points qui comptent + la recommandation."

---

## 🎬 DEMO SCENARIO POUR ENTRETIEN (Script à préparer)

### Setup (30 secondes)
"Pour illustrer mon approche product, j'ai construit un outil
que j'utilise vraiment dans mon travail quotidien. Il analyse
le feedback utilisateur sur YouTube avec l'IA."

### Demo live (2 minutes)

**Étape 1 — Problème**
"Imaginez : vous lancez une nouvelle feature. Vous avez
500 commentaires YouTube. Lire tout ça = 5 heures de travail.
Et vous risquez de manquer des patterns importants."

**Étape 2 — Solution**
[Tu ouvres ton dashboard]
"Je colle l'URL de la vidéo. L'outil récupère tous les commentaires,
les analyse avec Claude AI, et me donne ça en 2 minutes."

**Étape 3 — Insights**
[Tu montres les résultats]
"Ici, les top pain points avec leur fréquence. Là, les feature
requests priorisées. Et ici, l'évolution du sentiment dans le temps."

**Étape 4 — Impact**
"Avec ça, je peux prioriser mon backlog de façon data-driven,
détecter les bugs critiques rapidement, et comprendre ce qui
différencie mon produit de la concurrence."

---

## 🛠️ TECH STACK

### Backend
- **Ruby on Rails 7**
- **PostgreSQL**
- **Sidekiq** (jobs async)
- **anthropic-ruby** gem
- **google-api-client** gem

### Frontend
- **Hotwire** (Turbo + Stimulus)
- **Tailwind CSS**
- **Chart.js**
- **ViewComponent**

### Déploiement
- **Render.com**
- **Redis Cloud**
- **GitHub Actions**

---

## 📅 ROADMAP — 3 SEMAINES (10h/semaine)

### SPRINT 1 (Semaine 1) — Foundation & Setup

**Objectif :** Rails app + YouTube API + première feature

#### Jour 1-2 : Setup & Documentation (3h)
- [x] Créer le repo GitHub
- [ ] Setup Rails app
- [ ] Decision Record : "Pourquoi Rails ?"
- [ ] **Livrable** : Weekly Update #1

#### Jour 3-4 : YouTube API Integration (4h)
- [ ] YouTube Data API setup
- [ ] Contrôleur Videos
- [ ] Récupération commentaires
- [ ] Vue simple d'affichage

#### Jour 5-7 : First Feature (3h)
- [ ] Modèle Video & Comment
- [ ] Sauvegarde en DB
- [ ] Stats basiques
- [ ] **Livrable** : Feature fonctionnelle

**Livrables publics :**
- ✅ Weekly Update #1
- ✅ Post LinkedIn #1
- ✅ Decision Record : Tech Stack

---

### SPRINT 2 (Semaine 2) — AI Integration & Core Features

**Objectif :** Claude API + Features 1, 2, 5

#### Jour 1-2 : Claude API Setup (3h)
- [ ] Anthropic Ruby SDK
- [ ] Service AnalyzerService
- [ ] Test premier prompt

#### Jour 3-5 : Features 1 & 2 (5h)
- [ ] Pain Points Clustering
- [ ] Feature Request Ranker
- [ ] Dashboard affichage

#### Jour 6-7 : Feature 5 (2h)
- [ ] Executive Summary Generator
- [ ] Export format clean

**Livrables publics :**
- ✅ Weekly Update #2
- ✅ Post LinkedIn #2
- ✅ Prompt Library v1.0

---

### SPRINT 3 (Semaine 3) — Polish, Deploy & Portfolio

**Objectif :** Feature 3 + Déploiement + Portfolio

#### Jour 1-3 : Sentiment Timeline (4h)
- [ ] Chart.js integration
- [ ] Calcul sentiment par période
- [ ] Graphique interactif

#### Jour 4-5 : Déploiement (3h)
- [ ] Deploy sur Render
- [ ] Config env variables
- [ ] Tests production

#### Jour 6-7 : Portfolio & Démo (3h)
- [ ] Vidéo démo 90sec
- [ ] PM Case Study
- [ ] README screenshots
- [ ] Post LinkedIn final

**Livrables publics :**
- ✅ Weekly Update #3
- ✅ PM Case Study complet
- ✅ Vidéo démo
- ✅ App en production

---

## 📱 STRATÉGIE LINKEDIN

### Post 1 (Semaine 1) — Annonce
🚀 Je construis un outil PM en public
Problème : Analyser 500 commentaires YouTube = 5 heures
Solution : Dashboard IA → 2 minutes
Je documente tout :
✅ Décisions produit
✅ Usage de l'IA
✅ Erreurs & apprentissages
Suivez sur GitHub : [lien]
#ProductManagement #BuildInPublic #AI

### Post 2 (Semaine 2) — Learning
💡 Ce que j'ai appris en intégrant Claude AI

Un bon prompt = 80% du résultat
L'IA accélère, ne remplace pas la réflexion
Toujours valider les outputs

Exemple : [screenshot]
Process complet : [lien GitHub]
#AI #ProductManagement

### Post 3 (Semaine 3) — Showcase
✅ Projet terminé : YouTube Feedback Analyzer
3 semaines, 30 heures, 1 outil utilisable
Résultat :
📊 5 features fonctionnelles
🤖 IA intégrée
📈 Dashboard démo-ready
Appris :

[Point 1]
[Point 2]

Démo : [lien]
Recruteurs : DM ouvert 😉
#ProductManagement #Portfolio

---

## 🎬 VIDÉO DÉMO — Script 90 secondes

**0-15 sec : Hook**
"En tant que PM, analyser 500 commentaires = 5 heures.
J'ai construit un outil qui fait ça en 2 minutes."

**15-45 sec : Demo**
[Screen recording]

Colle URL YouTube
Analyse temps réel
Dashboard insights


**45-75 sec : Value**
Résultats :

Pain points + fréquence
Feature requests priorisées
Sentiment timeline
Executive summary


**75-90 sec : CTA**
"Construit en 3 semaines avec Rails + Claude AI.
Code sur GitHub. Lien en description."

---

## ✅ CHECKLIST FINALE — Portfolio PM-Ready

### Produit
- [ ] 5 features principales fonctionnent
- [ ] Déployé en production (URL publique)
- [ ] Testé avec vraie vidéo YouTube

### Documentation Build in Public
- [ ] 3 Weekly Updates sur GitHub
- [ ] 3 Decision Records
- [ ] AI Usage Log complet

### Portfolio
- [ ] PM Case Study rédigé
- [ ] Vidéo démo 90 secondes
- [ ] README professionnel
- [ ] 1 testimonial (quelqu'un qui a testé)

### LinkedIn
- [ ] 3 posts publiés minimum
- [ ] Projet ajouté dans "Projets"
- [ ] URL en bio

---

## 🎯 MÉTRIQUES DE SUCCÈS

| Métrique | Cible | Pourquoi |
|----------|-------|----------|
| Temps d'analyse | < 2 min | Démontre l'efficacité |
| Précision insights | > 80% | Démontre la qualité IA |
| Clarté dashboard | 9/10 | Démontre UI/UX thinking |
| Questions en entretien | > 5 | Démontre que ça intrigue |

---

## 🚀 NEXT ACTIONS

1. ✅ Setup GitHub — FAIT
2. ⏳ Setup Claude Project
3. ⏳ Rails app création
4. ⏳ YouTube API integration

---

*Product Brief créé le 14 avril 2026*
*Auteure : Inès Kaci — PM en reconversion*
*Le Wagon São Paulo — Batch #2203*
