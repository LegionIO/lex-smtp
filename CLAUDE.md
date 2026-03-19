# lex-smtp: SMTP Email Extension for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that sends emails via SMTP from within Legion task chains. Uses Ruby's built-in `Net::SMTP` library - no external gem dependency.

**GitHub**: https://github.com/LegionIO/lex-smtp
**Version**: 0.2.0
**License**: MIT

## Architecture

```
Legion::Extensions::Smtp
├── Helpers/
│   └── Client             # connection(address:, port:) -> Net::SMTP instance
├── Runners/
│   └── Email              # send(...) delegates to connection via Helpers::Client
└── Client                 # Standalone class: includes Runners::Email + Helpers::Client
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/smtp.rb` | Entry point, extension registration |
| `lib/legion/extensions/smtp/helpers/client.rb` | `connection(address:, port:)` returns `Net::SMTP` instance |
| `lib/legion/extensions/smtp/client.rb` | Standalone `Client` class; includes `Runners::Email` and `Helpers::Client`; holds default opts |
| `lib/legion/extensions/smtp/runners/email.rb` | `send(to:, body:, from:, subject:, port: 25, address: 'localhost')` — delegates to `connection` |

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

The runner calls `connection(address:, port:)` (provided by `Helpers::Client`) to obtain a `Net::SMTP` instance, then calls `.start` on it to deliver the message. No TLS/authentication support in current implementation.

## Helpers::Client

`Legion::Extensions::Smtp::Helpers::Client` is a module that provides a single method:

```ruby
def connection(address: 'localhost', port: 25, **_opts)
  Net::SMTP.new(address, port)
end
```

It is included into both the standalone `Client` class and any runner host that needs a raw SMTP connection object.

## Standalone Client

`Legion::Extensions::Smtp::Client` can be used outside the Legion runtime:

```ruby
require 'legion/extensions/smtp/client'

client = Legion::Extensions::Smtp::Client.new(address: 'smtp.example.com', port: 587)

client.send(
  to: 'recipient@example.com',
  from: 'sender@example.com',
  subject: 'Hello',
  body: 'Message body'
)
```

The constructor merges provided options over defaults `{ address: 'localhost', port: 25 }` and stores them as `@opts`. The `connection` method on the class merges per-call overrides on top of `@opts`, so instance defaults can be overridden per call if needed.

## Dependencies

| Gem | Purpose |
|-----|---------|
| `net-smtp` | SMTP client (extracted from Ruby stdlib in Ruby 3.1; declared as explicit dependency) |

## Development

18 specs total.

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
