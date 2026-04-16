# 📅 Weekly Update #2 — AI Integration & Deploy

**Semaine :** 2/3
**Dates :** 15 avril - 16 avril 2026
**Heures travaillées :** ~8h / 10h prévues
**Statut :** ✅ Terminée (en avance)

---

## 🎯 Objectif de la Semaine

- ✅ Intégrer Claude API pour analyser les commentaires
- ✅ Features 1, 2 et 5 terminées
- ✅ App déployée en production sur Render

---

## ✅ Ce Qui a Été Fait

### AI Integration
- [x] `ClaudeService` — appel API Anthropic avec prompt structuré JSON
- [x] Feature 1 : Pain Points Clustering (top 5 avec fréquence)
- [x] Feature 2 : Feature Request Ranker (+ priority tags Critical/Quick Win/Nice to Have + sentiment 😊/😤)
- [x] Feature 5 : Executive Summary en 2-3 phrases
- [x] Sentiment global (positif / neutre / négatif en %)
- [x] Prompt v1.0 documenté dans `prompts-library.md`

### UX Improvements
- [x] Historique des analyses (`/analyses`)
- [x] Thumbnail + titre de la vidéo + nom de la chaîne dans le dashboard
- [x] Gestion d'erreurs : URL invalide, vidéo privée, quota dépassé, timeout
- [x] UI entièrement en anglais

### Déploiement
- [x] App déployée sur Render (Docker + PostgreSQL)
- [x] Variables d'environnement configurées
- [x] Migrations automatiques au démarrage via `docker-entrypoint`
- [x] URL publique : https://youtube-feedback-analyzer.onrender.com

---

## ⚠️ Blockers & Challenges

**Blocker #1 : Tailwind CSS en production**
- **Problème :** tailwindcss-rails v4 installé automatiquement, incompatible avec la config existante
- **Temps perdu :** ~1h
- **Solution :** Épingler à v3 (`~> 3.3.1`) + créer `application.tailwind.css` + `tailwind.config.js` + ajouter la plateforme Linux au `Gemfile.lock`

**Blocker #2 : DATABASE_URL non chargée**
- **Problème :** `database.yml` en production pointait vers localhost au lieu de lire `DATABASE_URL`
- **Temps perdu :** ~30 min
- **Solution :** Simplifier la config production à `url: <%= ENV["DATABASE_URL"] %>`

**Blocker #3 : RAILS_MASTER_KEY avec le `%` terminal**
- **Problème :** Copie du `%` final du terminal dans Render
- **Temps perdu :** ~10 min
- **Solution :** Ne jamais copier le `%` — c'est un caractère de fin de ligne du shell

---

## 📝 Learnings de la Semaine

### Technique
- **Prompt engineering :** Demander UNIQUEMENT du JSON sans texte autour évite les erreurs de parsing. La structure du JSON dans le prompt est critique.
- **Docker + Gemfile.lock :** Il faut ajouter les plateformes Linux au lock file avec `bundle lock --add-platform x86_64-linux` avant de déployer avec Docker
- **Propshaft vs Sprockets :** Propshaft (Rails 8) gère les assets différemment — le dossier `builds` doit être ajouté manuellement au load path

### Product
- **Insight :** Le thumbnail de la vidéo dans l'historique change complètement la lisibilité — une image vaut plus qu'une URL de 60 caractères
- **Insight :** Priority tags (Critical/Quick Win/Nice to Have) rendent les feature requests immédiatement actionnables pour un PM

### Process
- **Ce qui a bien marché :** Avancer feature par feature, tester en local avant de déployer
- **À retenir :** Toujours tester `assets:precompile` localement avant de pousser en production

---

## 📸 Screenshots

*Dashboard avec thumbnail, pain points et feature requests avec priority tags*

---

## 🎯 Objectif Semaine Prochaine

**Sprint 3 : Polish & Portfolio**
- Sentiment Timeline avec Chart.js
- Design système (identité visuelle)
- Weekly Update #2 + Post LinkedIn #2
- PM Case Study + vidéo démo
- README.md avec screenshots

---

## ✅ Checkpoint Semaine 2

**Claude API fonctionne en production ?** ✅ OUI
**App accessible publiquement ?** ✅ OUI
**Prompt documenté ?** ✅ OUI

**Décision pour Semaine 3 :**
- [x] ✅ Continue Sprint 3 comme prévu

---

*Weekly Update #2 publié le 16 avril 2026*
*Inès Kaci — YouTube Feedback Analyzer*
