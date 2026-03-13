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

## Requirements

- Ruby >= 3.4
- [LegionIO](https://github.com/LegionIO/LegionIO) framework
- SMTP server

## License

MIT
