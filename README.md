# OrangeHRM Robot Framework Automation (Hiring Task)

Target app: https://opensource-demo.orangehrmlive.com/

Default credentials (demo site):
- Username: `Admin`
- Password: `admin123`

---

## Project structure

- `tests/`  
  Test suites (entry point: `tests/orangehrm_assignment.robot`)

- `pages/`  
  Page Object Model (POM) keywords per page (Robot keywords only)

- `resources/`  
  Shared utilities, data, and locators:
  - `testdata.robot` → variables (URL, credentials, default browser, etc.)
  - `locators.robot` → selectors
  - `common.robot` → shared keywords (open/close app, waiting helpers, etc.)

- `results/`  
  Execution outputs (`log.html`, `report.html`, screenshots, `output.xml`)

---

## Prerequisites

- Python 3.11+ (3.10+ should also work)
- Google Chrome **or** Mozilla Firefox installed

> This project uses Selenium 4 + Selenium Manager, so you typically don’t need to manually install drivers.

---

## Setup (Windows)

```powershell
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
```

---

## Run tests

### Run all tests (default browser = Chrome)

```powershell
python -m robot -d results tests
```

### Run in headless mode

```powershell
python -m robot -d results -v HEADLESS:True tests
```

### Run on **Chrome** or **Firefox**

The browser is controlled via the Robot variable `${BROWSER}` (default is set in `resources/testdata.robot`).

Run on Chrome:
```powershell
python -m robot -d results -v BROWSER:chrome tests
```

Run on Firefox:
```powershell
python -m robot -d results -v BROWSER:firefox tests
```

You can combine with headless:
```powershell
python -m robot -d results -v BROWSER:firefox -v HEADLESS:True tests
```

---

## Reports

After execution, open:
- `results\report.html`
- `results\log.html`

---

## Keyword documentation (“comment on each keyword”)

Per the requirement **not to change any script code**, the keyword explanations are provided as documentation:

- `docs/KEYWORDS.md` → step-by-step explanation of every custom keyword under `resources/` and `pages/`.

---

## CI (GitHub Actions) - Windows

This repo includes a Windows GitHub Actions workflow:

- `.github/workflows/robot-windows.yml`

It runs the suite on **Windows** against both **Chrome** and **Firefox** (matrix), in headless mode, and uploads `results/` as artifacts.
