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

## 💎 FEATURES MVP - 3 Features Core — Orientées Démo Entretien

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

**Problème utilisateur :**
Quand tu analyses 500 commentaires manuellement, tu lis dans l'ordre chronologique. Tu risques de :
- Manquer des patterns récurrents
- Te faire influencer par les derniers commentaires lus
- Ne pas quantifier objectivement la fréquence des problèmes

**Solution :**
L'outil analyse TOUS les commentaires d'un coup, détecte automatiquement les catégories de problèmes récurrents, et affiche les **Top 5 Pain Points** avec :
- % de commentaires concernés
- Exemples de verbatims représentatifs
- Score de sévérité (1-10)

**Exemple de sortie :**

┌─────────────────────────────────────────────────────────┐
│ TOP 5 PAIN POINTS — Vidéo "Product Demo SaaS v3.0"     │
├─────────────────────────────────────────────────────────┤
│ 1. Onboarding complexe                  34% │ 🔥🔥🔥🔥🔥 │
│    "I spent 30 min just to add my first task"          │
│    "The tutorial is confusing"                          │
│                                                          │
│ 2. Mobile app manquante                 28% │ 🔥🔥🔥🔥   │
│    "No mobile version = dealbreaker"                    │
│                                                          │
│ 3. Intégrations limitées                19% │ 🔥🔥🔥     │
│    "Where is the Slack integration?"                    │
└─────────────────────────────────────────────────────────┘

**Démo en entretien :**
> "Voilà un exemple concret. J'ai analysé 500 commentaires sur une vidéo de produit SaaS. L'outil a identifié que 34% des users mentionnent le même pain point d'onboarding. Ça m'a permis de prioriser cette feature en Sprint 1 de façon data-driven."

**Temps estimé :** 9h (4h backend + 3h frontend + 2h buffer)

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

**Problème utilisateur :**
Les feature requests sont éparpillées dans les commentaires. Tu dois :
- Les extraire manuellement (1 par 1)
- Les compter à la main
- Deviner si c'est urgent ou juste un nice-to-have

**Solution :**
L'outil extrait automatiquement toutes les demandes de features, les classe par fréquence de mention, détecte le sentiment associé, et génère un **backlog priorisé**.

**Exemple de sortie :**

┌──────────────────────────────────────────────────────────┐
│ FEATURE REQUESTS — Ranked by Impact                     │
├──────────────────────────────────────────────────────────┤
│ Rank │ Feature      │ Mentions │ Sentiment │ Priority  │
├──────┼──────────────┼──────────┼───────────┼───────────┤
│  1   │ Dark Mode    │    45    │ 89% 😊    │ Quick win │
│  2   │ Mobile App   │    38    │ 67% 😠    │ CRITICAL  │
│  3   │ Export PDF   │    12    │ 34% 😐    │ Nice to have │
└──────────────────────────────────────────────────────────┘

**Démo en entretien :**
> "Je combine données quantitatives et qualitatives. L'outil me donne une première priorisation basée sur fréquence ET sentiment. Évidemment, je croise ça avec la stratégie business, mais ça m'évite de passer à côté d'un quick win."

**Temps estimé :** 6h (3h backend + 2h frontend + 1h buffer)


---

### Feature 3 : **Executive Summary Auto-Generator** 🔴 MUST HAVE

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

**Problème utilisateur :**
Après ton analyse, tu dois briefer ton CEO ou VP Product. Ils n'ont pas le temps de lire 50 slides. Ils veulent :
- Les 3 insights clés
- La recommandation actionnable
- En 30 secondes max

**Solution :**
L'outil génère automatiquement un résumé de 5 lignes orienté décision, ton professionnel, format bullet points.

**Exemple de sortie :**

📊 YouTube Feedback Analysis — Vidéo "Product Demo v3.0"
────────────────────────────────────────────────────────

- 512 commentaires analysés sur 30 jours
- Sentiment global : 72% positif, 18% neutre, 10% négatif
- Top pain point : Onboarding complexe (34% des mentions)
- Top feature request : Dark mode (45 mentions)
- ✅ Recommandation : Prioriser l'amélioration de l'onboarding
  avant d'ajouter de nouvelles features

**Démo en entretien :**
> "Je synthétise toujours mes analyses en executive summary. Mon outil le fait automatiquement pour gagner du temps. Un CEO n'a pas le temps de lire 50 slides — il veut les 3 points qui comptent + la recommandation."

**Temps estimé :** 3h (1h backend + 1h frontend + 1h buffer)


---

## 🛠️ TECH STACK

### Backend
- **Ruby on Rails 7** — Framework web structuré
- **PostgreSQL** — Database production-ready
- **Sidekiq** — Background jobs async (pour analyses longues)
- **anthropic-ruby** gem — API Claude
- **google-api-client** gem — YouTube Data API v3

### Frontend
- **Hotwire** (Turbo + Stimulus) — Interactivité moderne sans React
- **Tailwind CSS** — Utility-first styling
- **Chart.js** — (si besoin pour visualisations futures)
- **ViewComponent** — Composants réutilisables

### Déploiement
- **Render.com** — Hébergement gratuit/low-cost
- **Redis Cloud** — Pour Sidekiq
- **GitHub Actions** — CI/CD basique

---

## 📅 ROADMAP — 3 Semaines (30h Total)

### SPRINT 1 — Semaine 1 (10h) : Foundation + Feature #1

**Objectif :** Rails app opérationnelle + YouTube API + Pain Points Clustering

**Jour 1-2 (3h) : Setup Rapide**
- [x] Structure GitHub `/docs` créée
- [x] PRODUCT_BRIEF_V3.md rédigé
- [ ] Rails app créée avec PostgreSQL + Tailwind
- [ ] YouTube Data API credentials obtenues
- [ ] Anthropic API setup
- [ ] Premier test : récupérer 10 comments d'une vidéo
- [ ] **Livrable :** Decision Record #003 "Rails Setup Choices"

**Jour 3-4 (4h) : Feature #1 Backend**
- [ ] Modèle `Video` + `Comment`
- [ ] Service `PainPointsAnalyzer`
  - Appel Claude API
  - Parsing réponse JSON
  - Stockage résultats
- [ ] Test manuel avec 1 vraie vidéo YouTube
- [ ] Itérations prompts jusqu'à résultat satisfaisant
- [ ] **Livrable :** Prompt v1.0 documenté dans `prompts-library.md`

**Jour 5-7 (3h) : Feature #1 Frontend + Doc**
- [ ] Dashboard view `/videos/:id/analysis`
- [ ] Affichage Top 5 Pain Points avec %
- [ ] Screenshot pris (preuve que c'est lisible)
- [ ] **Livrable :** Weekly Update #1 publié sur GitHub

**✅ CHECKPOINT Fin Semaine 1 :**
- Feature #1 fonctionne de bout en bout ?
- Prompt documenté ?
- Screenshot pris ?
- → SI NON : ARRÊTE et POLISH Feature #1

---

### SPRINT 2 — Semaine 2 (10h) : Feature #3 + Feature #2

**Objectif :** Executive Summary + Feature Request Ranker

**Jour 1-2 (3h) : Feature #3 Executive Summary**
- [ ] Service `SummaryGenerator`
  - Réutilise pain points de Feature #1
  - 1 prompt Claude pour synthétiser
- [ ] Affichage dans dashboard (section dédiée)
- [ ] Test avec 2-3 vidéos différentes
- [ ] **Livrable :** Prompt v2.0 documenté

**Jour 3-5 (5h) : Feature #2 Feature Request Ranker**
- [ ] Service `FeatureRequestAnalyzer`
  - Nouveau prompt Claude
  - Extraction feature requests
  - Ranking par fréquence + sentiment
- [ ] Modèle `FeatureRequest` (optionnel, peut être juste JSON)
- [ ] Affichage tableau priorisé
- [ ] Test + debug
- [ ] **Livrable :** Prompt v3.0 documenté

**Jour 6-7 (2h) : Documentation + Weekly Update**
- [ ] Decision Record #004 "Comment j'ai crafté mes prompts Claude"
- [ ] Prompts Library V2 : les 3 prompts finaux documentés
- [ ] **Livrable :** Weekly Update #2 publié

**✅ CHECKPOINT Fin Semaine 2 :**
- 3 features fonctionnelles à 100% ?
- Prompts documentés ?
- → SI OUI : GO Deploy. SI NON : TERMINE les features, SKIP polish

---

### SPRINT 3 — Semaine 3 (10h) : Deploy + Portfolio

**Objectif :** App en production + Assets portfolio

**Jour 1-3 (4h) : Déploiement**
- [ ] Setup compte Render.com
- [ ] Config ENV variables (API keys)
- [ ] Premier deploy + test production
- [ ] Fix bugs prod (toujours en avoir)
- [ ] **Livrable :** Decision Record #005 "Challenges du déploiement"

**Jour 4-7 (6h) : Portfolio Assets**
- [ ] PM Case Study complet (2h)
  - Problème / Process / Décisions / Résultats / Learnings
- [ ] Vidéo démo 90 secondes (2h)
  - Script / Screen recording / Montage basique
- [ ] README.md professionnel avec screenshots (1h)
- [ ] **Livrable :** Weekly Update #3 + Post LinkedIn final (1h)

**✅ LIVRABLE FINAL :**
- [ ] App déployée avec URL publique
- [ ] 3 features fonctionnelles
- [ ] 3 Weekly Updates publiés
- [ ] 5 Decision Records
- [ ] PM Case Study complet
- [ ] Vidéo démo 90 secondes

---

## 🚨 GUARDRAILS — Non Négociables

### Definition of Done (DoD)

**Une feature n'est "terminée" que si :**
1. ✅ Backend fonctionne — testé manuellement avec 1 vraie vidéo YouTube
2. ✅ Frontend affiche résultats — LISIBLE + COMPRÉHENSIBLE + Screenshot pris
3. ✅ Prompt Claude documenté dans `prompts-library.md`
4. ✅ Decision Record rédigée avec section "Comment je présente ça en entretien"

**Pas de "90% fini, je polish plus tard".**

---

### Kill Switch Timeline

**Checkpoint J+7 (Fin Semaine 1, 10h écoulées) :**
- ✅ Feature #1 terminée à 100% → ON TRACK, continue
- ⚠️ Feature #1 à 70-99% → WARNING, accélère ou simplifie Feature #1
- ❌ Feature #1 < 70% → STOP, revoir le scope de Feature #1

**Checkpoint J+14 (Fin Semaine 2, 20h écoulées) :**
- ✅ 3 features terminées → GO Deploy
- ⚠️ 2 features terminées → SKIP polish, DEPLOY avec 2 features
- ❌ 1 feature terminée → PIVOT : Deploy avec 1 feature + doc sur "pourquoi j'ai coupé"

**Pas de négociation. Pas de "encore 2h et c'est bon".**

---

### Les 5 Pièges à Éviter

**Piège #1 : "Je vais juste essayer un truc rapidement"**
- Symptôme : 3h perdues à débugger un "test rapide"
- Solution : Chaque changement = commit Git + message clair

**Piège #2 : "Le prompt marche à 70%, je finis plus tard"**
- Symptôme : 5 features à 70%, aucune terminée
- Solution : Règle des 80% → un prompt à 80% = TERMINÉ, next feature

**Piège #3 : "Je vais faire un design un peu mieux"**
- Symptôme : 4h sur Tailwind alors que Feature #2 n'est pas codée
- Solution : Design = Semaine 3 SEULEMENT si features terminées

**Piège #4 : "Claude Code a généré du code, ça marche, next"**
- Symptôme : Tu ne comprends pas ton propre code
- Solution : Règle des 5 minutes → si tu ne peux pas expliquer le code en 5min, STOP et comprends-le

**Piège #5 : "J'ai documenté dans ma tête, je l'écrirai ce weekend"**
- Symptôme : Samedi, tu as oublié 70% de tes décisions
- Solution : Document PENDANT, pas après. Règle des 10 minutes → chaque session de code de 2h = 10min de doc à la FIN

---

## 📊 MÉTRIQUES DE SUCCÈS

| Métrique | Cible | Pourquoi |
|----------|-------|----------|
| Temps d'analyse | < 2 min | Démontre l'efficacité de l'IA |
| Précision insights | > 80% | Démontre la qualité des prompts |
| Features terminées | 3/3 | Démontre la capacité à livrer |
| Decision Records | 5 minimum | Démontre le process PM |
| Weekly Updates | 3 publiés | Démontre la documentation continue |

---

## 🎯 COMMENT JE PRÉSENTE CE PROJET EN ENTRETIEN

### Hook (15 secondes)
"En tant que Junior PM, dès mon Day 1, on va me demander d'analyser du feedback. J'ai construit mon propre outil pour être productive immédiatement."

### Demo (2 minutes)
[Screen recording]
1. Colle URL YouTube
2. Analyse temps réel
3. Dashboard : Pain Points + Feature Requests + Executive Summary

### Value Proposition (30 secondes)
"Résultats :
- 500 commentaires → 2 minutes au lieu de 5 heures
- Pain points identifiés avec fréquence


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
