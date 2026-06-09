### Clean Code Rules

> General habits that keep Python readable and maintainable.

- **Reduce nesting** — Flatten logic with early returns, guard clauses, or small helpers instead of deep `if`/`for` chains.
- **Descriptive names** — Variables and functions should explain *what* they hold or *do* (`user_count`, not `n`).
- **Code over comments** — Prefer clear names over explaining unclear code with comments. Comment only non-obvious logic.
- **Group repeated values** — If the same numbers/strings appear often, put them in a dict, list, or constants at the top.
- **Small functions** — One job per function. Split large blocks into named, reusable pieces.

---

### `if __name__ == "__main__"`

> Every Python file has a special `__name__` variable.
> - **Run directly** → `__name__` is `"__main__"`
> - **Imported** → `__name__` is the module name (e.g. `"utils"`)

Use this guard so script-only code (CLI, tests, demos) does not run when the file is imported elsewhere.

```python
def main():
    print("Runs only when executed directly")

if __name__ == "__main__":
    main()
```

**Why it matters:** A file can be both a reusable module and a runnable script. The guard keeps imports side-effect free.

---

### Main Entry Point

> Don't run logic at the top level. Define a `main()` that wires everything together, then call it from the `__name__` guard.

```python
def load_data(path: str) -> list[str]:
    ...

def process(items: list[str]) -> list[str]:
    ...

def main():
    data = load_data("input.txt")
    result = process(data)
    print(result)

if __name__ == "__main__":
    main()
```

**Why it matters:** Keeps the file importable. Other modules can use `load_data` and `process` without triggering the full program.

---

### Reusable Functions

> Split code into small, single-purpose functions. Each piece should do one thing and be callable from anywhere.

```python
# Bad — one big block, hard to reuse or test
def handle_users(users):
    active = [u for u in users if u["active"]]
    names = [u["name"].upper() for u in active]
    return names

# Good — composable pieces
def filter_active(users: list[dict]) -> list[dict]:
    return [u for u in users if u["active"]]

def extract_names(users: list[dict]) -> list[str]:
    return [u["name"] for u in users]

def uppercase(items: list[str]) -> list[str]:
    return [s.upper() for s in items]
```

---

### Type Annotations

> Optional but useful. They document intent, improve editor autocomplete, and catch bugs early with tools like `mypy`.

```python
# Variables
count: int = 10
name: str = "Alice"
scores: list[int] = [90, 85, 72]

# Functions — annotate params and return type
def upper_everything(elements: list[str]) -> list[str]:
    return [element.upper() for element in elements]

# Optional / multiple types
from typing import Optional

def find_user(id: int) -> Optional[dict]:
    ...
```

**Tip:** Run `mypy your_file.py` to statically check annotations.

---

### List Comprehensions

> Use when building a list from an iterable in one clear expression. Prefer a regular `for` loop if the logic is complex or has side effects.

```python
# Readable — simple transform or filter
squares = [x ** 2 for x in range(10)]
evens = [x for x in numbers if x % 2 == 0]
names = [user["name"].upper() for user in users]

# Too dense — use a loop or helper instead
# result = [do_a(x) for x in items if check(x) and validate(x) for y in get_y(x)]
```

**Rule of thumb:** If it doesn't fit on one line comfortably, split it out.

---

### Constants

> Python has no true constants — names can always be reassigned. Convention: `UPPER_SNAKE_CASE` + type annotation. Linters/editors will flag reassignment.

```python
from typing import Final

MAX_RETRIES: Final[int] = 3
DEFAULT_TIMEOUT: Final[float] = 30.0
API_BASE_URL: Final[str] = "https://api.example.com"

MAX_RETRIES = 5  # mypy error + linter warning (Pylance, Ruff)
```

**Where to put them:** Module-level, or a dedicated `constants.py` / `config.py` for shared values.
