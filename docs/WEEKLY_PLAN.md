# 📅 Planning Hebdomadaire

*Suivi de progression — 10h/semaine pendant 3 semaines*

---

## 📊 Vue d'ensemble

| Semaine | Dates | Objectif | Status |
|---------|-------|----------|--------|
| 1 | 14-21 avril | Foundation & Setup | ✅ Terminée (en avance) |
| 2 | 22-28 avril | AI Integration | ✅ Terminée (en avance) |
| 3 | 16-21 avril | Polish & Deploy | 🔄 En cours |

---

## 🎯 Semaine 1 : Foundation & Setup

**Dates :** 14 avril - 21 avril 2026
**Heures disponibles :** 10h
**Objectif :** Rails app + YouTube API + première feature

### Planning détaillé

#### Jour 1-2 : Setup & Documentation (3h)
- [x] Créer le repo GitHub ✅
- [x] Structure /docs ✅
- [x] README.md professionnel
- [x] Setup Rails app avec Claude Code
- [x] Decision Record : "Pourquoi Rails ?"
- [x] **Livrable** : Weekly Update #1

#### Jour 3-4 : YouTube API Integration (4h)
- [x] S'inscrire à YouTube Data API
- [x] Créer le contrôleur Videos (AnalysesController)
- [x] Récupérer les commentaires d'une vidéo
- [x] Afficher dans une vue simple
- [x] **Documenter** : Prompt utilisé + erreurs

#### Jour 5-7 : First Feature (3h)
- [x] Créer le modèle Analysis (Video & Comment combinés)
- [x] Sauvegarder les commentaires en DB
- [x] Afficher stats basiques + dashboard complet
- [x] **Livrable** : Feature fonctionnelle ✅

### Livrables publics attendus

- [x] Weekly Update #1 publié sur GitHub
- [ ] Post LinkedIn #1 : "Je construis un outil PM en public"
- [x] Decision Record : Tech Stack (#001, #002, #003)
- [x] 3-5 commits avec messages clairs (10+ commits)

### Métriques de succès

- [x] Rails app tourne en local
- [x] Au moins 1 vidéo YouTube analysée avec succès
- [x] Base de données créée et fonctionnelle
- [x] Documentation à jour

---

## 🎯 Semaine 2 : AI Integration

**Dates :** 15 avril - 16 avril 2026 (terminée en avance)
**Heures disponibles :** 10h
**Objectif :** Claude API + Features 1, 2, 5

### Planning détaillé

#### Jour 1-2 : Claude API Setup (3h)
- [x] Intégrer Anthropic Ruby SDK
- [x] Créer le service ClaudeService (AnalyzerService)
- [x] Tester premier prompt d'analyse
- [x] **Documenter** : Évolution des prompts

#### Jour 3-5 : Core Features (5h)
- [x] Feature 1 : Pain Points Clustering
- [x] Feature 2 : Feature Request Ranker (+ priority tags + sentiment)
- [x] Dashboard avec résultats
- [x] **Documenter** : Comment l'IA structure les données

#### Jour 6-7 : Executive Summary (2h)
- [x] Feature 5 : Executive Summary intégré dans le dashboard
- [x] Gestion d'erreurs (URL invalide, vidéo privée, quota, timeout)
- [x] Historique des analyses
- [x] Thumbnail + titre + chaîne affichés dans le dashboard
- [ ] Export en format clean (reporté semaine 3)
- [x] **Livrable** : Dashboard fonctionnel ✅

### Livrables publics attendus

- [ ] Weekly Update #2
- [ ] Post LinkedIn #2 : "Comment j'ai intégré l'IA"
- [x] Prompt Library v1.0
- [x] Screenshots du dashboard

### Métriques de succès

- [x] Claude API répond en JSON structuré
- [x] Pain Points + Feature Requests + Sentiment affichés
- [x] App déployée en production sur Render ✅
- [x] URL publique fonctionnelle

---

## 🎯 Semaine 3 : Polish & Deploy

**Dates :** 29 avril - 5 mai 2026
**Heures disponibles :** 10h
**Objectif :** Feature 3 + Déploiement + Portfolio

### Planning détaillé

#### Jour 1-3 : Sentiment Timeline (4h)
- [x] Ajouter Chart.js (CDN dans layout) ✅
- [x] Calculer sentiment par période (ClaudeService#analyze_sentiment_timeline) ✅
- [x] Graphique interactif Chart.js (ligne verte/grise/rouge) ✅
- [x] Fix axe X illisible (maxTicksLimit: 12, rotation 45°) ✅
- [x] **Documenter** : Decision Record #004, #005 ✅

#### Jour 4-5 : Déploiement (3h)
- [x] Déployer sur Render.com ✅
- [x] Config variables d'environnement
- [x] Tests en production
- [ ] **Documenter** : Challenges déploiement

#### Jour 4-5 : Dashboard Enrichi (3h)
- [x] Pain Points : % + sévérité 🔥 + verbatims ✅
- [x] Feature Requests : % en plus des votes ✅
- [x] Section Recommended Actions (top 3 actions PM) ✅
- [x] Passage Claude Opus → Haiku (~10x moins cher) ✅

#### Jour 6-7 : Portfolio & Démo (3h)
- [ ] Vidéo démo 90 secondes
- [ ] PM Case Study final
- [ ] README.md avec screenshots
- [ ] Post LinkedIn final

### Livrables publics attendus

- [ ] Weekly Update #3 (final)
- [ ] PM Case Study complet
- [ ] Vidéo démo sur YouTube/Loom
- [ ] Post LinkedIn #3 : Bilan projet
- [ ] App en production accessible publiquement

---

## 📝 Template : Daily Log

*À remplir à chaque session de travail*

### Session du [date]
**Durée :** [heures]
**Objectif :** [ce que je voulais accomplir]

**Accompli :**
- [tâche 1]
- [tâche 2]

**Bloqué sur :**
- [problème 1]

**Appris :**
- [learning 1]

**Next action :**
- [prochaine tâche]

---

*Ce document est mis à jour en temps réel pendant le projet.*
