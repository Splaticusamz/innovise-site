# Innovise Technologies Design System
## For AI Agent Consumption

> This document defines the complete design system for **Innovise Technologies**.
> When generating any UI, component, or page for this brand, follow these specifications.
>
> Based on BrandForge classic template, customized for Innovise on 4/6/2026.

---

## 1. Brand DNA

- **Name:** Innovise Technologies
- **Tagline:** "Innovative Software, Built for You."
- **Description:** A Seattle-based custom software consultancy that partners with businesses of all sizes to design, build, and maintain tailored software solutions.
- **Personality:** Precise/Conversational 20%, Classic/Contemporary 30%, Reserved/Energetic 20%, Spacious/Dense 10%, Muted/Vivid 15%
- **Industry:** Technology / Software Consulting
- **Audience:** Business owners, CTOs, startup founders, and operations leaders who need custom software but may not have in-house development teams
- **Feel:** Trustworthy, competent, approachable, pragmatic
- **References:** The Innovise logo uses coral-orange (#F47C64) on charcoal; the UI extends that hue into a full scale for surfaces and interactive states.

## 2. Color System

### Philosophy
Confident coral-oranges paired with warm off-white surfaces. The palette matches the logo accent and communicates technical authority without corporate coldness. Every color earns its place: no decoration, only function.

### Semantic colors
- **brand.primary:** #c24a36
- **brand.primary-hover:** #a63d2c
- **brand.primary-active:** #8a3325
- **brand.accent (logo match):** #f47c64

- **feedback.success:** #1f6b45
- **feedback.warning:** #8a5a12
- **feedback.error:** #8c2f2f
- **feedback.info:** #1e4e7a

### Surfaces & text
- **surface.page:** #faf7f5
- **surface.card:** #ffffff
- **surface.inset:** #f1eae7
- **surface.inverse:** #111111
- **surface.hero:** #c24a36

- **text.primary:** #161616
- **text.secondary:** #444444
- **text.tertiary:** #6b6b6b
- **text.on-primary:** #f7f5f0
- **text.on-inverse:** #f7f5f0

### Do
- Use the brand coral sparingly for CTAs, section accents, and key moments; use **brand-400** (#f47c64) for accents that must match the logo exactly.
- Keep neutrals warm, quiet, and low-chroma.
- Prioritize contrast and legibility over decorative color variation (use **brand-500+** for large areas with white text).
- Use the hero coral background for the main hero section and key feature blocks.

### Don't
- Do not introduce unrelated bright accent palettes or neon gradients.
- Do not rely on color alone to convey status.
- Do not use overly cool corporate blues as dominant UI color.
- Do not overuse saturated orange: it should feel intentional, not loud.

## 3. Typography

### Font stacks
- **Headings:** "IBM Plex Sans", system-ui, sans-serif
- **Body:** "Source Sans 3", system-ui, sans-serif
- **Mono:** "JetBrains Mono", ui-monospace, monospace

### Type scale (base 16px, ratio 1.25)
| Token | Size | Line height | Weight | Tracking |
|-------|------|-------------|--------|------------|
| text-xs | 10px | 1.5 | 400 | 0 |
| text-sm | 13px | 1.5 | 400 | 0 |
| text-base | 16px | 1.8 | 400 | 0 |
| text-lg | 20px | 1.55 | 400 | 0 |
| text-xl | 26px | 1.55 | 500 | 0.015em |
| text-2xl | 32px | 1.2 | 500 | 0.015em |
| text-3xl | 41px | 1.2 | 600 | 0.01em |
| text-4xl | 52px | 1.15 | 600 | 0.01em |
| text-5xl | 65px | 1.1 | 700 | 0 |

### Rules
- Use IBM Plex Sans for headings and interface labels: precision and authority.
- Use Source Sans 3 for body copy: readable and approachable in long-form content.
- Use JetBrains Mono for any code snippets or technical references.
- Favor semibold (600) for section headings, medium (500) for subheadings.
- Keep line lengths between 60-75 characters for body text.

## 4. Spacing & Layout

- **Base unit:** 4px
- **Density:** spacious
- **Max width:** 1200px
- **Grid:** 12 columns, 28px gutters
- **Edge padding:** 24px mobile / 64px desktop

### Scale (excerpt)
- **space-0:** 0px
- **space-1:** 4px
- **space-2:** 8px
- **space-3:** 16px
- **space-4:** 24px
- **space-5:** 32px
- **space-6:** 48px
- **space-7:** 64px
- **space-8:** 80px
- **space-9:** 96px
- **space-10:** 120px
- **space-11:** 160px
- **space-12:** 200px

### Rules
- Generous whitespace between sections. Let content breathe.
- Cards and feature blocks should have ample internal padding (space-6 minimum).
- Hero sections get space-10 or more vertical padding.
- Section spacing: space-9 to space-11 between major page sections.

## 5. Shape Language

### Border radius
- **radius-none:** 0px
- **radius-sm:** 4px
- **radius-md:** 8px
- **radius-lg:** 12px
- **radius-xl:** 16px
- **radius-full:** 9999px

### Shadows
- **shadow-sm:** 0 1px 2px rgba(0,0,0,0.06)
- **shadow-md:** 0 4px 18px rgba(0,0,0,0.08)
- **shadow-lg:** 0 12px 40px rgba(0,0,0,0.12)
- **shadow-xl:** 0 20px 60px rgba(0,0,0,0.15)

### Rules
- Cards use radius-md with subtle shadow-sm; elevate to shadow-md on hover.
- Buttons use radius-md for a modern but not overly rounded feel.
- Team member photos use radius-full (circle crop).
- Prefer clean lines and contrast over heavy shadows.

## 6. Motion & Feel

- **Philosophy:** subtle and purposeful

### Durations
- **duration-instant:** 0ms
- **duration-fast:** 120ms
- **duration-normal:** 200ms
- **duration-slow:** 350ms
- **duration-entrance:** 500ms

### Easings
- **default:** cubic-bezier(0.25, 0.1, 0.25, 1)
- **enter:** cubic-bezier(0, 0, 0.2, 1)
- **exit:** cubic-bezier(0.4, 0, 1, 1)
- **bounce:** cubic-bezier(0.34, 1.56, 0.64, 1)

### Interactions
- **button:** Hover: background darkens ~10%, translateY(-1px), shadow-md. Press: scale(0.98).
- **card:** Hover: shadow-md, translateY(-4px), duration-normal.
- **link:** Hover: brand.primary color, underline slides in from left.
- **input:** Focus: border brand.primary; ring 3px brand.primary @ 20% opacity.
- **scroll:** Sections fade + slide up on scroll-into-view, staggered by 100ms per element.

### Rules
- Keep all motion purposeful: it should guide attention, not distract.
- Honor prefers-reduced-motion.
- Stagger entrance animations for card grids and feature lists.
- No motion for the sake of motion. Every animation should communicate state change.

## 7. Voice & Microcopy

Professional yet human. Speak like a trusted advisor, not a corporate brochure. Be direct, clear, and confident without being stiff.

### Patterns
| Context | Pattern | Example |
|---------|---------|---------|
| primaryCta | Action-oriented | Let's Build Together |
| secondaryCta | Exploratory | See How We Work |
| empty | Friendly | Nothing here yet. Let's change that. |
| error | Helpful | Something went wrong. Let's try that again. |
| success | Affirming | All set. You're good to go. |

### Tone guidelines
- Lead with outcomes, not features ("Ship faster" not "CI/CD pipeline management")
- Address the reader directly ("your business", "your team")
- Keep paragraphs short (2-3 sentences max)
- Use active voice exclusively
- Numbers and specifics over vague claims

### Forbidden
- Don't hesitate to
- Please note that
- synergy / leverage / circle back / touch base / utilize
- "We are a leading..."
- "Best-in-class"
- "End-to-end solutions"

### Rules
- Sentence case for all headings and buttons.
- Exclamation marks only in success messages and marketing headlines (sparingly).
- Prefer short, human labels.

## 8. Component Notes

```json
{
  "button": {
    "variants": ["primary", "secondary", "ghost", "outline"],
    "sizes": ["sm", "md", "lg"],
    "notes": "Primary: max once per viewport section. Always pair with clear label.",
    "primary": {
      "background": "#0F3D2E",
      "text": "#F7F5F0",
      "radius": "8px",
      "border": "none",
      "padding": "12px 28px"
    },
    "secondary": {
      "background": "transparent",
      "text": "#0F3D2E",
      "radius": "8px",
      "border": "2px solid #0F3D2E"
    },
    "ghost": {
      "background": "transparent",
      "text": "#0F3D2E",
      "radius": "8px",
      "border": "none"
    }
  },
  "card": {
    "paddingToken": "space-6",
    "hover": "shadow-md + translateY(-4px)",
    "background": "#FFFFFF",
    "border": "1px solid #E8E4DD",
    "radius": "8px",
    "shadow": "0 1px 2px rgba(0,0,0,0.06)"
  },
  "input": {
    "label": "above",
    "validation": "inline + border color change",
    "background": "#FFFFFF",
    "text": "#161616",
    "border": "1px solid #D8D2C6",
    "focusRing": "2px solid #0F3D2E",
    "radius": "8px",
    "padding": "12px 16px"
  },
  "navbar": {
    "style": "sticky, transparent on hero, solid on scroll",
    "background": "#FFFFFF",
    "shadow": "shadow-sm on scroll",
    "height": "72px",
    "logo": "left",
    "links": "center or right",
    "cta": "right, primary button"
  },
  "section": {
    "maxWidth": "1200px",
    "paddingY": "space-9 to space-11",
    "heading": "text-3xl or text-4xl, centered or left",
    "subheading": "text-lg, text.secondary, max-width 600px"
  },
  "footer": {
    "background": "#111111",
    "text": "#F7F5F0",
    "linkHover": "#1a6b4a",
    "paddingY": "space-8"
  }
}
```

## 9. Imagery & Assets

Clean, purposeful imagery. Favor abstract tech patterns, workspace photography with natural lighting, and clean UI screenshots. No stock-photo cliches.

- **Icons:** Lucide (outlined, 1.5px stroke)
- **Logo:** `/assets/images/logo/innovise-main-logo.png`
- **Client logos:** `/assets/images/clients/`
- **Team photos:** `/assets/images/team/` (circle-cropped in UI)

### Rules
- Icons should be consistent in weight and style across the entire site.
- Client logos displayed in grayscale by default, color on hover.
- Team photos always circle-cropped with a subtle border.
- Prefer geometric patterns or subtle gradients for decorative backgrounds.
- No saturated 3D illustrations, mascots, or isometric art.

## 10. Dark Mode

- **Strategy:** system preference detection

| Token | Light | Dark |
|-------|-------|------|
| surface.page | #faf7f5 | #0a0a0a |
| surface.card | #ffffff | #141414 |
| surface.inset | #f1eae7 | #1a1a1a |
| surface.inverse | #111111 | #1a1a1a |
| surface.hero | #c24a36 | #3d1812 |
| text.primary | #161616 | #ededed |
| text.secondary | #444444 | #a3a3a3 |
| text.tertiary | #6b6b6b | #737373 |
| text.on-primary | #f7f5f0 | #ededed |
| text.on-inverse | #f7f5f0 | #ededed |
| brand.primary | #c24a36 | #9a3d2e |
| brand.accent | #f47c64 | #e07058 |

### Rules
- Preserve the same restrained contrast model in dark mode.
- Avoid pure black; use softened dark neutrals.
- Keep brand coral slightly muted in dark contexts to prevent glow.
- Test all text/background combinations for WCAG AA contrast minimum.

---

## 11. Page Structure & Layout Guide

### Homepage sections (in order)
1. **Navigation**: Sticky, transparent over hero, solid on scroll
2. **Hero**: Full-width brand coral bg (or photo + coral overlay), headline + subheadline + CTA, subtle pattern overlay
3. **Trusted By**: Client logo strip, grayscale, subtle animation
4. **Services Overview**: 6-card grid (2x3 desktop, 1-col mobile) with icons
5. **How We Work**: 3-step process with connecting visual (Agile methodology)
6. **Service Packages**: 4 cards with featured highlights
7. **About / Team**: Split section: company story left, team cards right
8. **Testimonials / Social Proof**: If available
9. **CTA Section**: Full-width brand coral bg, compelling headline + contact button
10. **Footer**: Dark, links, social, copyright

### Services page
- Hero with page title
- Detailed service descriptions in alternating layout (text left/right with icons)
- Additional services grid
- CTA at bottom

### Responsive breakpoints
- **mobile:** 0 - 639px
- **tablet:** 640px - 1023px
- **desktop:** 1024px+
- **wide:** 1440px+
