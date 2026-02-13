---
name: sheets-cli
description: Read, write, and update Google Sheets data via CLI. Use when the user asks to read spreadsheet data, update cells, append rows, or work with Google Sheets. Triggers on mentions of spreadsheets, sheets, Google Sheets, tabular data in the cloud, or specific sheet names like "Projects" or "Tasks".
---

# sheets-cli

CLI for Google Sheets primitives. Read tables, append rows, update cells by key or index, batch operations.

> **Installation:** The sheets-cli binary is available in this skill directory at `./dist/sheets-cli.exe`. Use `./dist/sheets-cli.exe` for all commands.

## Quick Reference

```bash
# Find spreadsheet by name
./dist/sheets-cli.exe sheets find --name "Projects"

# List sheets/tabs
./dist/sheets-cli.exe sheets list --spreadsheet <id-or-url>

# Read table data
./dist/sheets-cli.exe read table --spreadsheet <id> --sheet "Sheet1" --limit 100

# Update by key column (preferred - rows can shift)
./dist/sheets-cli.exe update key --spreadsheet <id> --sheet "Projects" \
  --key-col "Name" --key "Acme" --set '{"Status":"Done"}'

# Append row
./dist/sheets-cli.exe append --spreadsheet <id> --sheet "Projects" \
  --values '{"Name":"NewCo","Status":"Active"}'
```

## Workflow Pattern

Always follow **read → decide → dry-run → apply**:

```bash
# 1. Understand current state
./dist/sheets-cli.exe read table --sheet "Tasks" --limit 100

# 2. Dry-run first
./dist/sheets-cli.exe update key --sheet "Tasks" --key-col "ID" --key "TASK-42" \
  --set '{"Status":"Complete"}' --dry-run

# 3. Apply if dry-run looks correct
./dist/sheets-cli.exe update key --sheet "Tasks" --key-col "ID" --key "TASK-42" \
  --set '{"Status":"Complete"}'
```

## Commands

### Auth (Setup)
```bash
./dist/sheets-cli.exe auth login --credentials <oauth-client.json>
./dist/sheets-cli.exe auth status
./dist/sheets-cli.exe auth logout
```

### Find Spreadsheet by Name
```bash
./dist/sheets-cli.exe sheets find --name "<query>" [--limit 10]
```
Searches Google Drive for spreadsheets matching the name. Returns ID, name, URL.

> Requires Google Drive API enabled in the project.

### List Sheets/Tabs
```bash
./dist/sheets-cli.exe sheets list --spreadsheet <id>
```

### Sheet Info
```bash
./dist/sheets-cli.exe sheet info --spreadsheet <id> --sheet "<name>"
./dist/sheets-cli.exe sheet info --spreadsheet <id> --gid <gid>
```
Get sheet metadata by name or GID.

### Get Header Row
```bash
./dist/sheets-cli.exe header --spreadsheet <id> --sheet "<name>" [--header-row N]
```
Returns column headers. Auto-detects header row if not specified.

### Read Table Data
```bash
./dist/sheets-cli.exe read table --spreadsheet <id> --sheet "<name>" [--limit N] [--raw]
```
Returns `{ headers: ["_row", ...], rows: [{_row: N, ...}, ...], headerRow: N }`.

Each row includes `_row` - the absolute sheet row number for use with `update row`.

### Read Raw Range
```bash
./dist/sheets-cli.exe read range --spreadsheet <id> --range "Sheet1!A1:B10"
```

### Append Row
```bash
./dist/sheets-cli.exe append --spreadsheet <id> --sheet "<name>" \
  --values '<json>' [--dry-run]
```
JSON object with column names as keys. Column matching is case-insensitive with normalized whitespace.

### Update by Key (Preferred)
```bash
./dist/sheets-cli.exe update key --spreadsheet <id> --sheet "<name>" \
  --key-col "<column>" --key "<value>" --set '<json>' \
  [--allow-multi] [--dry-run]
```
Finds rows where `key-col` equals `key`, updates columns from `--set`. Throws if multiple matches unless `--allow-multi`.

### Update by Row Index
```bash
./dist/sheets-cli.exe update row --spreadsheet <id> --sheet "<name>" \
  --row <n> --set '<json>' [--dry-run]
```
Updates specific row by 1-indexed row number. Use `_row` from `read table` output directly.

## Row Numbering

- `read table` returns `headerRow` and rows with `_row` field
- `_row` is the absolute sheet row number - use directly with `update row --row`
- Example: `headerRow: 2` means headers on row 2, first data row is `_row: 3`
- **Never calculate row numbers manually** - always use `_row` from read output

### Set Range
```bash
./dist/sheets-cli.exe set range --spreadsheet <id> --range "Sheet1!A1:B2" \
  --values '<2d-json-array>' [--dry-run]
```

### Batch Operations
```bash
./dist/sheets-cli.exe batch --spreadsheet <id> --ops '<json-array>' [--dry-run]
```
Operations: `append`, `updateRow`, `updateKey`, `setRange`.

## Global Options

| Option | Description |
|--------|-------------|
| `--spreadsheet <id>` | Spreadsheet ID or full URL |
| `--dry-run` | Preview without applying |
| `--header-row <n>` | Header row (auto-detects if omitted) |
| `--value-input <mode>` | `USER_ENTERED` (default) or `RAW` |

## Output Format

All commands return JSON:

```json
{
  "ok": true,
  "cmd": "update key",
  "spreadsheetId": "...",
  "sheet": "Projects",
  "result": { "matchedRows": 1, "updatedCells": 2 }
}
```

Errors:
```json
{
  "ok": false,
  "cmd": "update key",
  "error": { "code": "VALIDATION_ERROR", "message": "..." }
}
```

## Best Practices

1. **Use `sheets find`** to get spreadsheet ID from name
2. **`--spreadsheet` accepts URLs** - paste full Google Sheets URL directly
3. **Prefer key-based updates** over row indices - rows shift on insert/delete
4. **Always dry-run** before writes
5. **Check `ok` field** in response before proceeding
6. **Batch related operations** for atomicity
7. **Column names match case-insensitively** with normalized whitespace
8. **Header row auto-detects** - skips empty rows to find first data row
9. **Headerless sheets:** `read table` returns columns as `A`, `B`, ...; use column letters for `--set` / `--key-col`
11. **Column letter vs header:** When a key like `ID` or `URL` matches both a header name and a column letter pattern, the header match wins. Column letter addressing (`A`, `B`, `AA`) is only used as fallback when no header matches
10. **Empty sheets:** `append` can bootstrap by writing a header row from JSON keys
11. **`read table --range`** accepts `A1:Z` (auto-prefixed with the sheet)

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 10 | Validation error |
| 20 | Auth error |
| 30 | Permission error |
| 40 | API/transient error |