# Claude Code Setup

## MCP Servers

### Playwright

Playwright for providing claude code with web browser access. You can invoke this by asking it to use playwright to navigate to a URL, etc:

```shell
claude mcp add playwright npx @playwright/mcp@latest
```

### Sequential Thinking

Sequential thinking for breaking down complex problems into manageable steps:

```shell
claude mcp add sequential-thinking npx @modelcontextprotocol/server-sequential-thinking
```

Invoke this by adding `--seq` to the end of any prompt.

### Context7

Context7 allows you to fetch up to date docs and examples for usage in development.

```
claude mcp add context7 npx @upstash/context7-mcp
```

From the Context7 docs:

```
Context7 MCP provides the following tools that LLMs can use:

resolve-library-id: Resolves a general library name into a Context7-compatible library ID.

libraryName (required): The name of the library to search for
get-library-docs: Fetches documentation for a library using a Context7-compatible library ID.

context7CompatibleLibraryID (required): Exact Context7-compatible library ID (e.g., /mongodb/docs, /vercel/next.js)
topic (optional): Focus the docs on a specific topic (e.g., "routing", "hooks")
tokens (optional, default 10000): Max number of tokens to return. Values less than the default value of 10000 are automatically increased to 10000.
```

## SuperClaude

The current setup leverages [SuperClaude](https://github.com/SuperClaude-Org/SuperClaude_Framework). Their install is currently sort of broken so here's what I did to make it work.

### `uv`

`uv` is the package manager for Python projects. Install it via homebrew using:

```shell
brew install uv
```

### Install SuperClaude

Create a temp directory:

```shell
mkdir tmp-superclaude
cd tmp-superclaude
```

Initialize a python project:

```shell
uv init
```

Install SuperClaude as a dependency:

```shell
uv pip install SuperClaude
```

Run SuperClaude to add all the extensions to claude:

```shell
SueprClaude Install
```

I chose to only install the core and slash commands.
