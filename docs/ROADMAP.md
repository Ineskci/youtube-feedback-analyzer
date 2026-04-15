# 📅 ROADMAP — YouTube Feedback Analyzer

**Durée totale :** 3 semaines (30 heures)
**Objectif :** 3 features MVP + déploiement + portfolio assets

---

## 🎯 VUE D'ENSEMBLE

| Sprint | Durée | Objectif | Livrables |
|--------|-------|----------|-----------|
| **Sprint 1** | Semaine 1 (10h) | Foundation + Feature #1 | Pain Points Clustering fonctionnel |
| **Sprint 2** | Semaine 2 (10h) | Features #3 et #2 | Executive Summary + Feature Requests |
| **Sprint 3** | Semaine 3 (10h) | Deploy + Portfolio | App en prod + Case Study + Démo vidéo |

---

## 📆 SPRINT 1 — Semaine 1 (10h)

### 🎯 Objectif
Rails app opérationnelle + YouTube API intégrée + Feature #1 (Pain Points Clustering) terminée à 100%

### Jour 1-2 : Setup Rapide (3h)

**Lundi 2h :**
- [ ] Finaliser structure `/docs` sur GitHub
- [ ] Créer Rails app : `rails new youtube-feedback-analyzer --database=postgresql --css=tailwind`
- [ ] Test : `rails server` démarre
- [ ] **Livrable :** Commit "chore: initial Rails setup"

**Mardi 1h :**
- [ ] S'inscrire à YouTube Data API (Google Cloud Console)
- [ ] Obtenir API key
- [ ] S'inscrire à Anthropic API
- [ ] Obtenir API key Claude
- [ ] Configurer `.env` avec les 2 clés
- [ ] **Livrable :** Decision Record #003 "Rails Setup Choices"

### Jour 3-4 : Feature #1 Backend (4h)

**Mercredi 2h :**
- [ ] Générer modèle `Video` : `rails g model Video url:string title:string`
- [ ] Générer modèle `Comment` : `rails g model Comment video:references content:text author:string`
- [ ] Migrer : `rails db:migrate`
- [ ] Créer service `YouTubeService` pour fetch comments
- [ ] Test manuel : récupérer 10 comments d'une vidéo dans `rails console`

**Jeudi 2h :**
- [ ] Créer service `PainPointsAnalyzer`
- [ ] Rédiger prompt Claude v0.1 (brouillon)
- [ ] Appeler Claude API avec prompt
- [ ] Parser la réponse JSON
- [ ] Stocker résultats (dans `Video` ou table séparée)
- [ ] **Livrable :** Prompt v1.0 documenté dans `prompts-library.md`

### Jour 5-7 : Feature #1 Frontend + Doc (3h)

**Samedi 2h :**
- [ ] Créer contrôleur `VideosController`
- [ ] Routes : `resources :videos, only: [:new, :create, :show]`
- [ ] Vue `new.html.erb` : formulaire URL YouTube
- [ ] Vue `show.html.erb` : affichage Top 5 Pain Points
- [ ] Styling Tailwind basique (lisible, pas obligé d'être beau)

**Dimanche 1h :**
- [ ] Tester avec 1 vraie vidéo YouTube
- [ ] Prendre screenshot du dashboard
- [ ] Rédiger Weekly Update #1
- [ ] Commit + push
- [ ] **Livrable :** Weekly Update #1 publié sur GitHub

### ✅ CHECKPOINT Fin Semaine 1

**Questions à te poser :**
1. Feature #1 fonctionne-t-elle de bout en bout (URL → Dashboard) ?
2. As-tu un screenshot du résultat ?
3. Le prompt est-il documenté ?

**Décision :**
- ✅ OUI aux 3 questions → Continue Sprint 2
- ⚠️ NON à 1-2 questions → ARRÊTE, polish Feature #1 avant de continuer
- ❌ NON aux 3 questions → STOP, revois le scope de Feature #1

---

## 📆 SPRINT 2 — Semaine 2 (10h)

### 🎯 Objectif
Feature #3 (Executive Summary) + Feature #2 (Feature Request Ranker) terminées à 100%

### Jour 1-2 : Feature #3 Executive Summary (3h)

**Lundi 1h30 :**
- [ ] Créer service `SummaryGenerator`
- [ ] Rédiger prompt Claude v2.0 (réutilise pain points de Feature #1)
- [ ] Test avec la même vidéo que Feature #1

**Mardi 1h30 :**
- [ ] Ajouter section "Executive Summary" dans `show.html.erb`
- [ ] Styling Tailwind (encadré, format bullet points)
- [ ] Test avec 2-3 vidéos différentes
- [ ] **Livrable :** Prompt v2.0 documenté

### Jour 3-5 : Feature #2 Feature Request Ranker (5h)

**Mercredi 2h :**
- [ ] Créer service `FeatureRequestAnalyzer`
- [ ] Rédiger prompt Claude v3.0 (extraction + ranking)
- [ ] Appeler Claude API
- [ ] Parser réponse JSON (liste de feature requests)

**Jeudi 2h :**
- [ ] Optionnel : Créer modèle `FeatureRequest` (ou garder en JSON)
- [ ] Ajouter section "Feature Requests" dans `show.html.erb`
- [ ] Affichage tableau : Rank | Feature | Mentions | Sentiment | Priority

**Vendredi 1h :**
- [ ] Test avec plusieurs vidéos
- [ ] Debug si nécessaire
- [ ] **Livrable :** Prompt v3.0 documenté

### Jour 6-7 : Documentation (2h)

**Samedi 1h :**
- [ ] Rédiger Decision Record #004 "Comment j'ai crafté mes prompts Claude"
- [ ] Mettre à jour `prompts-library.md` avec les 3 prompts finaux + learnings

**Dimanche 1h :**
- [ ] Rédiger Weekly Update #2
- [ ] Screenshots des 3 features
- [ ] Commit + push
- [ ] **Livrable :** Weekly Update #2 publié

### ✅ CHECKPOINT Fin Semaine 2

**Questions à te poser :**
1. Les 3 features fonctionnent-elles toutes de bout en bout ?
2. As-tu des screenshots de chaque feature ?
3. Les 3 prompts sont-ils documentés ?

**Décision :**
- ✅ OUI aux 3 questions → GO Deploy (Sprint 3)
- ⚠️ NON à 1-2 questions → TERMINE les features, SKIP le polish
- ❌ Feature #2 pas terminée → ACCEPTE 2 features, documente le pivot, DEPLOY quand même

---

## 📆 SPRINT 3 — Semaine 3 (10h)

### 🎯 Objectif
App déployée en production + Assets portfolio complets

### Jour 1-3 : Déploiement (4h)

**Lundi 2h :**
- [ ] Créer compte Render.com (gratuit)
- [ ] Créer nouvelle Web Service (Rails)
- [ ] Connecter repo GitHub
- [ ] Configurer ENV variables (YOUTUBE_API_KEY, ANTHROPIC_API_KEY)

**Mardi 1h :**
- [ ] Premier deploy
- [ ] Tester en production (forcément, il y aura des bugs)
- [ ] Fix erreurs de production (CORS, secrets, database...)

**Mercredi 1h :**
- [ ] Tester toutes les features en prod
- [ ] Rédiger Decision Record #005 "Challenges du déploiement"
- [ ] **Livrable :** URL publique de l'app

### Jour 4-7 : Portfolio Assets (6h)

**Jeudi 2h :**
- [ ] Rédiger PM Case Study complet (`docs/portfolio/case-study.md`)
  - Problème / User Research / Solution / Décisions / Résultats / Learnings
- [ ] Ajouter screenshots des 3 features
- [ ] Ajouter screenshots des Decision Records

**Vendredi 2h :**
- [ ] Écrire script vidéo démo (90 secondes max)
- [ ] Enregistrer screen recording (OBS ou Loom)
- [ ] Montage basique (iMovie, DaVinci Resolve gratuit, ou Descript)
- [ ] Upload sur YouTube ou Loom
- [ ] **Livrable :** Vidéo démo avec lien

**Samedi 1h :**
- [ ] Mettre à jour README.md professionnel
  - Description projet
  - Screenshots
  - Lien démo live
  - Tech stack
  - Comment lancer localement
- [ ] Commit + push

**Dimanche 1h :**
- [ ] Rédiger Weekly Update #3 (bilan final)
- [ ] Rédiger post LinkedIn final
- [ ] Publier sur LinkedIn
- [ ] **Livrable :** Weekly Update #3 + Post LinkedIn

### ✅ LIVRABLE FINAL

**Checklist du projet terminé :**
- [ ] App déployée avec URL publique fonctionnelle
- [ ] 3 features opérationnelles (Pain Points + Summary + Feature Requests)
- [ ] 3 Weekly Updates publiés sur GitHub
- [ ] 5 Decision Records minimum rédigés
- [ ] PM Case Study complet
- [ ] Vidéo démo 90 secondes
- [ ] README.md professionnel
- [ ] Au moins 1 post LinkedIn publié

---

## 🚨 RÈGLES DE PILOTAGE

### Tracking Hebdomadaire

**Format obligatoire à chaque fin de semaine :**
### Pivots Autorisés

**Tu PEUX pivoter si :**
- Checkpoint J+7 : Feature #1 < 70% → Simplifier Feature #1
- Checkpoint J+14 : Seulement 2 features terminées → Accepter, documenter, déployer avec 2

**Tu NE PEUX PAS :**
- Ajouter des features non prévues
- Commencer Feature #2 si Feature #1 n'est pas à 100%
- Sauter la documentation pour "aller plus vite"

---

*Roadmap créée le 14 avril 2026*
*Inès Kaci — YouTube Feedback Analyzer*
