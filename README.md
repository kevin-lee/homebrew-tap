# Kevin-lee Homebrew Tap

Homebrew formulae for tools by [kevin-lee](https://github.com/kevin-lee).

## Available Formulae

| Formula | Description |
|---|---|
| `ai-skills` | CLI tool for managing AI coding agent skills across multiple agents |

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

- **macOS** (Apple Silicon / ARM64)
- **Linux** (ARM64, x86_64)

### Update

```sh
brew upgrade ai-skills
```

### Uninstall

```sh
brew uninstall ai-skills
```

## Documentation

- **ai-skills:** [https://github.com/kevin-lee/ai-skills](https://github.com/kevin-lee/ai-skills)
- **Homebrew:** `brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh)
