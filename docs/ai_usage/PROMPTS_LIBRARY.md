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

## Prompt #1 : Pain Points Clustering

**Version :** v1.0 (brouillon)
**Date :** [À remplir quand tu le crées]
**Statut :** Draft
**Feature :** Pain Points Clustering

### Prompt
Tu es un Product Manager expert en analyse qualitative de feedback utilisateur.
CONTEXTE :
J'ai récupéré [X] commentaires YouTube sur une vidéo de démonstration produit.
TÂCHE :
Analyse tous ces commentaires et identifie les TOP 5 PAIN POINTS récurrents mentionnés par les utilisateurs.
Pour chaque pain point, fournis :

Un titre court et descriptif
Le pourcentage de commentaires concernés (estimation)
2-3 exemples de verbatims représentatifs
Un score de sévérité de 1 à 10

FORMAT DE SORTIE (JSON strict) :
{
"pain_points": [
{
"title": "Titre du pain point",
"percentage": 34,
"severity": 8,
"examples": [
"Verbatim 1",
"Verbatim 2"
]
},
...
]
}
COMMENTAIRES :
[Liste des commentaires YouTube ici]

### Input Example
COMMENTAIRES :

"The onboarding is too confusing, spent 30 minutes just to add my first task"
"Love the UI but where is the mobile app?"
"Great product but the tutorial needs work"
"No mobile version is a dealbreaker for me"
"The interface is beautiful"
"Onboarding tutorial is not clear at all"
[... + 494 autres commentaires]


### Output Example

```json
{
  "pain_points": [
    {
      "title": "Onboarding complexe",
      "percentage": 34,
      "severity": 8,
      "examples": [
        "The onboarding is too confusing, spent 30 minutes just to add my first task",
        "Onboarding tutorial is not clear at all"
      ]
    },
    {
      "title": "Mobile app manquante",
      "percentage": 28,
      "severity": 7,
      "examples": [
        "Love the UI but where is the mobile app?",
        "No mobile version is a dealbreaker for me"
      ]
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
