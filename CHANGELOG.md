# Changelog

## [Unreleased]

## [0.2.1] - 2026-03-22

### Changed
- Add legion-cache, legion-crypt, legion-data, legion-json, legion-logging, legion-settings, and legion-transport as runtime dependencies
- Update spec_helper with real sub-gem helper stubs

## [0.2.0] - 2026-03-15

### Added
- `Helpers::Client` module with `connection(address:, port:)` returning a `Net::SMTP` instance
- Standalone `Client` class including all runners for use outside the Legion runtime
- `spec/client_spec.rb` covering `Client` initialization, connection building, and runner delegation

### Changed
- `Runners::Email#send` now delegates SMTP connection to `connection()` helper instead of calling `Net::SMTP.start` directly

## [0.1.0] - 2026-03-13

### Added
- Initial release
