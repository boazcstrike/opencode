---
name: agent-browser
description: Browser automation CLI for AI agents. Use when the user needs to interact with websites, including navigating pages, filling forms, clicking buttons, taking screenshots, extracting data, testing web apps, or automating any browser task. Triggers include requests to "open a website", "fill out a form", "click a button", "take a screenshot", "scrape data from a page", "test this web app", "login to a site", "automate browser actions", or any task requiring programmatic web interaction.
allowed-tools: Bash(agent-browser:*)
---

# Browser Automation with agent-browser

> **Installation:** The agent-browser binaries for all platforms are available in this skill directory. Use the platform-specific launcher:
> - On Windows: `./agent-browser.bat`
> - On macOS/Linux: `./agent-browser.sh`
> All command examples below use `./agent-browser.sh` (macOS/Linux syntax). On Windows, substitute with `./agent-browser.bat`.

## Core Workflow

Every browser automation follows this pattern:

1. **Navigate**: `./agent-browser.sh open <url>`
2. **Snapshot**: `./agent-browser.sh snapshot -i` (get element refs like `@e1`, `@e2`)
3. **Interact**: Use refs to click, fill, select
4. **Re-snapshot**: After navigation or DOM changes, get fresh refs

```bash
./agent-browser.sh open https://example.com/form
./agent-browser.sh snapshot -i
# Output: @e1 [input type="email"], @e2 [input type="password"], @e3 [button] "Submit"

./agent-browser.sh fill @e1 "user@example.com"
./agent-browser.sh fill @e2 "password123"
./agent-browser.sh click @e3
./agent-browser.sh wait --load networkidle
./agent-browser.sh snapshot -i  # Check result
```

## Essential Commands

```bash
# Navigation
./agent-browser.sh open <url>              # Navigate (aliases: goto, navigate)
./agent-browser.sh close                   # Close browser

# Snapshot
./agent-browser.sh snapshot -i             # Interactive elements with refs (recommended)
./agent-browser.sh snapshot -i -C          # Include cursor-interactive elements (divs with onclick, cursor:pointer)
./agent-browser.sh snapshot -s "#selector" # Scope to CSS selector

# Interaction (use @refs from snapshot)
./agent-browser.sh click @e1               # Click element
./agent-browser.sh fill @e2 "text"         # Clear and type text
./agent-browser.sh type @e2 "text"         # Type without clearing
./agent-browser.sh select @e1 "option"     # Select dropdown option
./agent-browser.sh check @e1               # Check checkbox
./agent-browser.sh press Enter             # Press key
./agent-browser.sh scroll down 500         # Scroll page

# Get information
./agent-browser.sh get text @e1            # Get element text
./agent-browser.sh get url                 # Get current URL
./agent-browser.sh get title               # Get page title

# Wait
./agent-browser.sh wait @e1                # Wait for element
./agent-browser.sh wait --load networkidle # Wait for network idle
./agent-browser.sh wait --url "**/page"    # Wait for URL pattern
./agent-browser.sh wait 2000               # Wait milliseconds

# Capture
./agent-browser.sh screenshot              # Screenshot to temp dir
./agent-browser.sh screenshot --full       # Full page screenshot
./agent-browser.sh pdf output.pdf          # Save as PDF
```

## Common Patterns

### Form Submission

```bash
./agent-browser.sh open https://example.com/signup
./agent-browser.sh snapshot -i
./agent-browser.sh fill @e1 "Jane Doe"
./agent-browser.sh fill @e2 "jane@example.com"
./agent-browser.sh select @e3 "California"
./agent-browser.sh check @e4
./agent-browser.sh click @e5
./agent-browser.sh wait --load networkidle
```

### Authentication with State Persistence

```bash
# Login once and save state
./agent-browser.sh open https://app.example.com/login
./agent-browser.sh snapshot -i
./agent-browser.sh fill @e1 "$USERNAME"
./agent-browser.sh fill @e2 "$PASSWORD"
./agent-browser.sh click @e3
./agent-browser.sh wait --url "**/dashboard"
./agent-browser.sh state save auth.json

# Reuse in future sessions
./agent-browser.sh state load auth.json
./agent-browser.sh open https://app.example.com/dashboard
```

### Session Persistence

```bash
# Auto-save/restore cookies and localStorage across browser restarts
./agent-browser.sh --session-name myapp open https://app.example.com/login
# ... login flow ...
./agent-browser.sh close  # State auto-saved to ~/.agent-browser/sessions/

# Next time, state is auto-loaded
./agent-browser.sh --session-name myapp open https://app.example.com/dashboard

# Encrypt state at rest
export AGENT_BROWSER_ENCRYPTION_KEY=$(openssl rand -hex 32)
./agent-browser.sh --session-name secure open https://app.example.com

# Manage saved states
./agent-browser.sh state list
./agent-browser.sh state show myapp-default.json
./agent-browser.sh state clear myapp
./agent-browser.sh state clean --older-than 7
```

### Data Extraction

```bash
./agent-browser.sh open https://example.com/products
./agent-browser.sh snapshot -i
./agent-browser.sh get text @e5           # Get specific element text
./agent-browser.sh get text body > page.txt  # Get all page text

# JSON output for parsing
./agent-browser.sh snapshot -i --json
./agent-browser.sh get text @e1 --json
```

### Parallel Sessions

```bash
./agent-browser.sh --session site1 open https://site-a.com
./agent-browser.sh --session site2 open https://site-b.com

./agent-browser.sh --session site1 snapshot -i
./agent-browser.sh --session site2 snapshot -i

./agent-browser.sh session list
```

### Connect to Existing Chrome

```bash
# Auto-discover running Chrome with remote debugging enabled
./agent-browser.sh --auto-connect open https://example.com
./agent-browser.sh --auto-connect snapshot

# Or with explicit CDP port
./agent-browser.sh --cdp 9222 snapshot
```

### Visual Browser (Debugging)

```bash
./agent-browser.sh --headed open https://example.com
./agent-browser.sh highlight @e1          # Highlight element
./agent-browser.sh record start demo.webm # Record session
```

### Local Files (PDFs, HTML)

```bash
# Open local files with file:// URLs
./agent-browser.sh --allow-file-access open file:///path/to/document.pdf
./agent-browser.sh --allow-file-access open file:///path/to/page.html
./agent-browser.sh screenshot output.png
```

### iOS Simulator (Mobile Safari)

```bash
# List available iOS simulators
./agent-browser.sh device list

# Launch Safari on a specific device
./agent-browser.sh -p ios --device "iPhone 16 Pro" open https://example.com

# Same workflow as desktop - snapshot, interact, re-snapshot
./agent-browser.sh -p ios snapshot -i
./agent-browser.sh -p ios tap @e1          # Tap (alias for click)
./agent-browser.sh -p ios fill @e2 "text"
./agent-browser.sh -p ios swipe up         # Mobile-specific gesture

# Take screenshot
./agent-browser.sh -p ios screenshot mobile.png

# Close session (shuts down simulator)
./agent-browser.sh -p ios close
```

**Requirements:** macOS with Xcode, Appium (`npm install -g appium && appium driver install xcuitest`)

**Real devices:** Works with physical iOS devices if pre-configured. Use `--device "<UDID>"` where UDID is from `xcrun xctrace list devices`.

## Ref Lifecycle (Important)

Refs (`@e1`, `@e2`, etc.) are invalidated when the page changes. Always re-snapshot after:

- Clicking links or buttons that navigate
- Form submissions
- Dynamic content loading (dropdowns, modals)

```bash
./agent-browser.sh click @e5              # Navigates to new page
./agent-browser.sh snapshot -i            # MUST re-snapshot
./agent-browser.sh click @e1              # Use new refs
```

## Semantic Locators (Alternative to Refs)

When refs are unavailable or unreliable, use semantic locators:

```bash
./agent-browser.sh find text "Sign In" click
./agent-browser.sh find label "Email" fill "user@test.com"
./agent-browser.sh find role button click --name "Submit"
./agent-browser.sh find placeholder "Search" type "query"
./agent-browser.sh find testid "submit-btn" click
```

## JavaScript Evaluation (eval)

Use `eval` to run JavaScript in the browser context. **Shell quoting can corrupt complex expressions** -- use `--stdin` or `-b` to avoid issues.

```bash
# Simple expressions work with regular quoting
./agent-browser.sh eval 'document.title'
./agent-browser.sh eval 'document.querySelectorAll("img").length'

# Complex JS: use --stdin with heredoc (RECOMMENDED)
./agent-browser.sh eval --stdin <<'EVALEOF'
JSON.stringify(
  Array.from(document.querySelectorAll("img"))
    .filter(i => !i.alt)
    .map(i => ({ src: i.src.split("/").pop(), width: i.width }))
)
EVALEOF

# Alternative: base64 encoding (avoids all shell escaping issues)
./agent-browser.sh eval -b "$(echo -n 'Array.from(document.querySelectorAll("a")).map(a => a.href)' | base64)"
```

**Why this matters:** When the shell processes your command, inner double quotes, `!` characters (history expansion), backticks, and `$()` can all corrupt the JavaScript before it reaches agent-browser. The `--stdin` and `-b` flags bypass shell interpretation entirely.

**Rules of thumb:**
- Single-line, no nested quotes -> regular `eval 'expression'` with single quotes is fine
- Nested quotes, arrow functions, template literals, or multiline -> use `eval --stdin <<'EVALEOF'`
- Programmatic/generated scripts -> use `eval -b` with base64

## Deep-Dive Documentation

| Reference | When to Use |
|-----------|-------------|
| [references/commands.md](references/commands.md) | Full command reference with all options |
| [references/snapshot-refs.md](references/snapshot-refs.md) | Ref lifecycle, invalidation rules, troubleshooting |
| [references/session-management.md](references/session-management.md) | Parallel sessions, state persistence, concurrent scraping |
| [references/authentication.md](references/authentication.md) | Login flows, OAuth, 2FA handling, state reuse |
| [references/video-recording.md](references/video-recording.md) | Recording workflows for debugging and documentation |
| [references/proxy-support.md](references/proxy-support.md) | Proxy configuration, geo-testing, rotating proxies |

## Ready-to-Use Templates

| Template | Description |
|----------|-------------|
| [templates/form-automation.sh](templates/form-automation.sh) | Form filling with validation |
| [templates/authenticated-session.sh](templates/authenticated-session.sh) | Login once, reuse state |
| [templates/capture-workflow.sh](templates/capture-workflow.sh) | Content extraction with screenshots |

```bash
./templates/form-automation.sh https://example.com/form
./templates/authenticated-session.sh https://app.example.com/login
./templates/capture-workflow.sh https://example.com ./output
```
