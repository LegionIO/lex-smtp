# lex-smtp: SMTP Email Extension for LegionIO

**Repository Level 3 Documentation**
- **Category**: `/Users/miverso2/rubymine/legion/extensions/CLAUDE.md`

## Purpose

Legion Extension that sends emails via SMTP from within Legion task chains. Provides runners for composing and delivering email messages.

**License**: MIT

## Architecture

```
Legion::Extensions::Smtp
└── Runners/
    └── Email              # Email composition and delivery via SMTP
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/smtp.rb` | Entry point, extension registration |
| `lib/legion/extensions/smtp/runners/email.rb` | Email sending logic |

## Testing

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
