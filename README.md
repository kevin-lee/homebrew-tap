# Kevin-lee Homebrew Tap

Homebrew formulae for tools by [kevin-lee](https://github.com/kevin-lee).

## Available Formulae

| Formula | Description |
|---|---|
| `ai-skills` | CLI tool for managing AI coding agent skills across multiple agents |

## Available Casks

| Cask | Description |
|---|---|
| `claude-proxymate` | Proxy app to analyze Claude Code's live traffic |

## Installation

### ai-skills

Install directly (taps automatically):

```sh
brew install kevin-lee/tap/ai-skills
```

Or tap first, then install:

```sh
brew tap kevin-lee/tap
brew install ai-skills
```

Or in a `Brewfile`:

```ruby
tap "kevin-lee/tap"
brew "ai-skills"
```

After installation, the `aiskills` command is available:

```sh
aiskills --version
aiskills --help
```

### Supported Platforms

- **ai-skills:** macOS (Apple Silicon / ARM64), Linux (ARM64, x86_64)
- **claude-proxymate:** macOS (Apple Silicon / ARM64, Intel / x86_64)

### Update

```sh
brew upgrade ai-skills
```

### Uninstall

```sh
brew uninstall ai-skills
```

### claude-proxymate

Install directly (taps automatically):

```sh
brew install --cask kevin-lee/tap/claude-proxymate
```

Or tap first, then install:

```sh
brew tap kevin-lee/tap
brew install --cask claude-proxymate
```

Or in a `Brewfile`:

```ruby
tap "kevin-lee/tap"
cask "claude-proxymate"
```

After installation, **Claude Proxymate** is available in `/Applications`. The app is
notarized, so it opens without a Gatekeeper prompt.

#### Update

```sh
brew upgrade --cask claude-proxymate
```

#### Uninstall

```sh
brew uninstall --cask claude-proxymate
```

To also remove app preferences and caches:

```sh
brew uninstall --zap --cask claude-proxymate
```

## Documentation

- **ai-skills:** [https://github.com/kevin-lee/ai-skills](https://github.com/kevin-lee/ai-skills)
- **claude-proxymate:** [https://github.com/kevin-lee/claude-proxymate](https://github.com/kevin-lee/claude-proxymate)
- **Homebrew:** `brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh)
