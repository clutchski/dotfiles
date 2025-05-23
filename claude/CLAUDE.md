This file guides Claude Code on my coding principles and preferences.

## Development Style
Follow **Test-Driven Development (TDD)**:
- Write one failing test first.
- Write the minimal code needed to make the test pass.
- Refactor the code if needed.
- Repeat this cycle for each feature or requirement.

## Workflow Preferences
- Make a To Do list and show me before you start working.
- Ask the user for confirmation before proceeding to the next step.
- Explain the purpose of each test before writing it.
- Use small, incremental steps for clarity and traceability.

## Code Style
- Use clear, readable code.
- Prefer standard testing libraries for the language (e.g., `pytest`, `unittest`, `jest`).
- When using pytest, plain assert are fine e.g. assert x == 1
- Add comments only where they help clarify intent. They should explain why not
  how.

## Tools
- Ripgrep installed for efficient code searching
