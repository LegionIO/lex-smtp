# lex-smtp

SMTP email extension for [LegionIO](https://github.com/LegionIO/LegionIO). Compose and deliver emails via SMTP from within task chains using Ruby's built-in `Net::SMTP`.

## Installation

```bash
gem install lex-smtp
```

Or add to your Gemfile:

```ruby
gem 'lex-smtp'
```

## Usage

Send an email by triggering the `email.send` runner:

```json
{
  "to": "recipient@example.com",
  "from": "sender@example.com",
  "subject": "Hello from Legion",
  "body": "Message body text",
  "address": "smtp.example.com",
  "port": 587
}
```

## Runner

| Runner | Method | Required Parameters |
|--------|--------|-------------------|
| Email | `send` | `to`, `from`, `subject`, `body` |

Optional: `address` (default: `localhost`), `port` (default: `25`)

## Standalone Client

Use `lex-smtp` as a standalone email client without the full Legion framework:

```ruby
require 'legion/extensions/smtp/client'

client = Legion::Extensions::Smtp::Client.new(address: 'smtp.example.com', port: 587)
client.send(to: 'user@example.com', from: 'bot@example.com', subject: 'Hello', body: 'World')
```

Options passed to `Client.new` become defaults for all sends. You can override per-call via the `send` keyword arguments.

## Requirements

- Ruby >= 3.4
- [LegionIO](https://github.com/LegionIO/LegionIO) framework
- SMTP server

## License

MIT
