const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Outfit', ...defaultTheme.fontFamily.sans],
        display: ['DM Serif Display', 'Georgia', 'serif'],
      },
      colors: {
        background:   'hsl(var(--background))',
        foreground:   'hsl(var(--foreground))',
        card:         'hsl(var(--card))',
        border:       'hsl(var(--border))',
        muted:        'hsl(var(--muted))',
        'muted-foreground': 'hsl(var(--muted-foreground))',
        coral:        'hsl(var(--coral))',
        'coral-deep': 'hsl(var(--coral-deep))',
        lavender:     'hsl(var(--lavender))',
        'sky-blob':   'hsl(var(--sky-blob))',
        'peach-blob': 'hsl(var(--peach-blob))',
        'severity-high':   'hsl(var(--severity-high))',
        'severity-medium': 'hsl(var(--severity-medium))',
        'severity-low':    'hsl(var(--severity-low))',
        'surface-quote':   'hsl(var(--surface-quote))',
      },
      borderRadius: {
        DEFAULT: 'var(--radius)',
      },
    },
  },
  plugins: []
}
