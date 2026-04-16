# 🧠 Prompts Library — YouTube Feedback Analyzer

Ce document contient tous les prompts Claude utilisés dans le projet, avec versions itérées, learnings, et exemples.

---

## 📌 FORMAT STANDARD

Pour chaque prompt, je documente :
1. **Version** : v1.0, v1.1, v2.0...
2. **Date** : Quand créé/mis à jour
3. **Statut** : Draft / Testing / Production
4. **Prompt complet** : Le texte exact envoyé à Claude
5. **Input example** : Exemple de données en entrée
6. **Output example** : Résultat attendu
7. **Learnings** : Ce qui marche / ce qui ne marche pas / itérations

---

## Prompt #1 : Analyse Complète (Pain Points + Feature Requests + Sentiment)

**Version :** v1.0
**Date :** 15 avril 2026
**Statut :** ✅ Production
**Feature :** Pain Points Clustering + Feature Request Ranker + Sentiment
**Fichier :** `app/services/claude_service.rb`

### Prompt

```
Tu es un expert en analyse de feedback produit. Analyse ces [N] commentaires YouTube
et retourne UNIQUEMENT un JSON valide avec cette structure exacte :

{
  "pain_points": [
    { "title": "...", "description": "...", "count": 0 }
  ],
  "feature_requests": [
    { "title": "...", "description": "...", "votes": 0 }
  ],
  "sentiment": {
    "positive": 0,
    "neutral": 0,
    "negative": 0
  },
  "summary": "..."
}

Règles :
- pain_points : top 5 problèmes récurrents avec leur fréquence estimée
- feature_requests : top 5 demandes de fonctionnalités
- sentiment : pourcentages (doivent totaliser 100)
- summary : résumé exécutif en 2-3 phrases

Commentaires à analyser :
[liste numérotée des commentaires]

Réponds UNIQUEMENT avec le JSON, sans texte avant ou après.
```

### Input Example

45 commentaires sur une vidéo de review iPhone 17 (en portugais brésilien)

### Output Example

```json
{
  "pain_points": [
    {
      "title": "Photos/vidéos trop jaunes ou orangées",
      "description": "Plusieurs utilisateurs se plaignent que les photos ont des tons trop jaunes",
      "count": 6
    }
  ],
  "feature_requests": [
    {
      "title": "Meilleure autonomie de batterie",
      "description": "Les utilisateurs demandent une batterie plus performante",
      "votes": 5
    }
  ],
  "sentiment": { "positive": 42, "neutral": 33, "negative": 25 },
  "summary": "L'iPhone 17 est bien accueilli pour son rapport qualité-prix..."
}
```

### Learnings

**✅ Ce qui marche :**
- Demander UNIQUEMENT du JSON évite le texte parasite autour de la réponse
- La structure fixe avec `count` et `votes` rend le parsing fiable
- Claude répond en anglais même si les commentaires sont dans une autre langue

**❌ Ce qui ne marche pas :**
- Avec moins de 20 commentaires, les résultats manquent de pertinence
- Le `count` est une estimation, pas un comptage exact
- Claude Haiku entoure parfois le JSON de backticks ` ```json ``` ` → résolu avec `.gsub(/\A```json\s*|\s*```\z/, "")`

**🔄 Itérations :**
- v1.0 : prompt initial → fonctionne en production
- v2.0 (16 avril 2026) : ajout de `percentage`, `severity` (1-5), `verbatims` (2 quotes), et `recommended_actions` — voir Decision 005

---

## Prompt #1 v2.0 : Analyse Enrichie (production)

**Version :** v2.0
**Date :** 16 avril 2026
**Statut :** ✅ Production
**Modèle :** claude-haiku-4-5-20251001 (passage depuis Opus — voir Decision 004)

### Nouveaux champs ajoutés

```json
{
  "pain_points": [
    {
      "title": "...",
      "description": "...",
      "count": 8,
      "percentage": 34,
      "severity": 5,
      "verbatims": [
        "Can't transfer videos to my phone without crashes",
        "The app is completely broken since the last update"
      ]
    }
  ],
  "recommended_actions": [
    {
      "action": "Fix file transfer reliability",
      "rationale": "34% of users report crashes — highest frequency pain point",
      "priority": "high"
    }
  ]
}
```

### Pourquoi ces ajouts

| Champ | Avant | Après | Impact |
|---|---|---|---|
| `count` seul | "8 mentions" | "34% · 8 mentions" | Plus parlant pour C-level |
| Sans severity | — | 🔥🔥🔥🔥🔥 | Hiérarchie visuelle immédiate |
| Sans verbatims | "users complain about X" | Citations exactes | Crédibilité data-driven |
| Sans actions | Données brutes | "Fix X, Sprint #1" | Dashboard actionnable |

---

## Prompt #2 : Executive Summary Generator

**Version :** v1.0 (brouillon)
**Date :** [À remplir quand tu le crées]
**Statut :** Draft
**Feature :** Executive Summary

### Prompt
Tu es un Product Manager qui doit briefer son CEO.
CONTEXTE :
J'ai analysé [X] commentaires YouTube sur une vidéo produit.
Voici les pain points identifiés : [pain_points_json]
Voici les feature requests identifiées : [feature_requests_json]
TÂCHE :
Génère un Executive Summary de 5 lignes maximum, format bullet points, orienté décision.
Le CEO veut savoir :

Combien de commentaires analysés
Sentiment global (% positif / neutre / négatif)
Le pain point #1
La feature request #1
Une recommandation actionnable

TONE : Professionnel, direct, orienté action.
FORMAT DE SORTIE (texte formaté) :

[Ligne 1]
[Ligne 2]
[Ligne 3]
[Ligne 4]
✅ Recommandation : [Action concrète]


### Input Example
PAIN POINTS :
[JSON des pain points de Prompt #1]
FEATURE REQUESTS :
[JSON des feature requests de Prompt #3]

### Output Example

512 commentaires analysés sur 30 jours
Sentiment global : 72% positif, 18% neutre, 10% négatif
Top pain point : Onboarding complexe (34% des mentions)
Top feature request : Dark mode (45 mentions)
✅ Recommandation : Prioriser l'amélioration de l'onboarding avant d'ajouter de nouvelles features


### Learnings

**✅ Ce qui marche :**
- [À remplir après tests]

**❌ Ce qui ne marche pas :**
- [À remplir après tests]

**🔄 Itérations :**
- v1.0 → v1.1 : [Changements apportés]

---

## Prompt #3 : Feature Request Ranker

**Version :** v1.0 (brouillon)
**Date :** [À remplir quand tu le crées]
**Statut :** Draft
**Feature :** Feature Request Ranker

### Prompt
Tu es un Product Manager qui analyse les demandes de features utilisateurs.
CONTEXTE :
J'ai récupéré [X] commentaires YouTube sur une vidéo de démonstration produit.
TÂCHE :

Extrais TOUTES les demandes de features (nouvelles fonctionnalités souhaitées)
Groupe les demandes similaires
Compte combien de fois chaque feature est mentionnée
Analyse le sentiment associé (frustration vs. enthousiasme)
Classe par ordre de priorité

Pour chaque feature request, fournis :

Nom de la feature
Nombre de mentions
Sentiment moyen (en %)
Tag de priorité : "Critical" / "Quick win" / "Nice to have"

FORMAT DE SORTIE (JSON strict) :
{
"feature_requests": [
{
"feature": "Nom de la feature",
"mentions": 45,
"sentiment_positive_pct": 89,
"priority_tag": "Quick win"
},
...
]
}
COMMENTAIRES :
[Liste des commentaires YouTube ici]

### Input Example
COMMENTAIRES :

"Please add a dark mode!"
"Dark mode would be amazing"
"I need a mobile app ASAP, this is frustrating"
"Mobile version please!!!"
"Export to PDF would be nice"
[... + 495 autres commentaires]


### Output Example

```json
{
  "feature_requests": [
    {
      "feature": "Dark Mode",
      "mentions": 45,
      "sentiment_positive_pct": 89,
      "priority_tag": "Quick win"
    },
    {
      "feature": "Mobile App",
      "mentions": 38,
      "sentiment_positive_pct": 67,
      "priority_tag": "Critical"
    },
    {
      "feature": "Export PDF",
      "mentions": 12,
      "sentiment_positive_pct": 34,
      "priority_tag": "Nice to have"
    }
  ]
}
```

### Learnings

**✅ Ce qui marche :**
- [À remplir après tests]

**❌ Ce qui ne marche pas :**
- [À remplir après tests]

**🔄 Itérations :**
- v1.0 → v1.1 : [Changements apportés]

---

## 📝 TEMPLATE POUR NOUVEAUX PROMPTS

```markdown
## Prompt #X : [Nom de la Feature]

**Version :** v1.0
**Date :** [Date]
**Statut :** Draft / Testing / Production
**Feature :** [Nom]

### Prompt
[Texte complet du prompt]

### Input Example
[Exemple de données en entrée]

### Output Example
[Résultat attendu]

### Learnings
**✅ Ce qui marche :**
- [Point 1]

**❌ Ce qui ne marche pas :**
- [Point 1]

**🔄 Itérations :**
- v1.0 → v1.1 : [Changements]
```

---

*Prompts Library créée le 14 avril 2026*
*Inès Kaci — YouTube Feedback Analyzer*
