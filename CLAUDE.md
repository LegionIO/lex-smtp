# lex-smtp: SMTP Email Extension for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that sends emails via SMTP from within Legion task chains. Uses Ruby's built-in `Net::SMTP` library - no external gem dependency.

**GitHub**: https://github.com/LegionIO/lex-smtp
**License**: MIT

## Architecture

```
Legion::Extensions::Smtp
└── Runners/
    └── Email              # Email composition and delivery via Net::SMTP
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/smtp.rb` | Entry point, extension registration |
| `lib/legion/extensions/smtp/runners/email.rb` | `send(to:, body:, from:, subject:, port: 25, address: 'localhost')` |

## Runner: Email

```ruby
# Payload
{
  to: "recipient@example.com",
  from: "sender@example.com",
  subject: "Hello",
  body: "Message body",
  address: "smtp.example.com",  # default: localhost
  port: 587                      # default: 25
}
```

Uses `Net::SMTP.start` to deliver messages. No TLS/authentication support in current implementation.

## Dependencies

No runtime gem dependencies - uses Ruby's built-in `net/smtp`.

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
