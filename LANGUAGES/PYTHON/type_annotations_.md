### TYPE ANNOTATIONS

> Hints that describe what types variables, parameters, and return values are expected to be.
>
> **Not enforced at runtime** — Python ignores them when running code. They help editors, readers, and static checkers (`mypy`, `pyright`, `Ruff`).

```python
def greet(name: str) -> str:
    return f"Hello, {name}"
```

**Good practice:** Annotate public APIs (functions, classes, module-level values). Run `mypy file.py` or enable Pylance/Pyright in your editor.

---

### BASIC TYPES

> Built-in types you will use most often.

```python
count: int = 10
price: float = 19.99
name: str = "Alice"
active: bool = True
raw: bytes = b"\x00\xff"
nothing: None = None
```

| Type | Use for |
|------|---------|
| `int` | Whole numbers |
| `float` | Decimals |
| `str` | Text |
| `bool` | `True` / `False` |
| `bytes` | Raw binary data |
| `None` | Absence of a value (often with `Optional`) |

---

### COLLECTIONS (Python 3.9+)

> Use built-in generics — `list[str]` not `List[str]`. The old `typing.List`, `typing.Dict`, etc. still work but are legacy.

```python
names: list[str] = ["Alice", "Bob"]
scores: dict[str, int] = {"Alice": 90, "Bob": 85}
unique: set[int] = {1, 2, 3}
point: tuple[int, int] = (10, 20)           # fixed length
mixed: tuple[int, ...] = (1, 2, 3, 4)     # variable length, same type
matrix: list[list[int]] = [[1, 2], [3, 4]]
```

#### Read-only collections (good practice)

> Accept `Sequence` / `Mapping` in function params when you won't mutate — more flexible for callers.

```python
from collections.abc import Sequence, Mapping

def total(scores: Sequence[int]) -> int:
    return sum(scores)

def lookup(data: Mapping[str, int], key: str) -> int:
    return data[key]
```

---

### FUNCTIONS

> Annotate every parameter and the return type. Use `-> None` when a function returns nothing meaningful.

```python
def add(a: int, b: int) -> int:
    return a + b

def log(message: str) -> None:
    print(message)

def process(items: list[str], *, uppercase: bool = False) -> list[str]:
    ...
```

#### `*args` and `**kwargs`

```python
def sum_all(*args: int) -> int:
    return sum(args)

def merge(**kwargs: str) -> dict[str, str]:
    return kwargs
```

---

### OPTIONAL & UNION

> When a value can be missing or one of several types.

```python
# Python 3.10+ — preferred
def find_user(id: int) -> dict | None:
    ...

def parse(value: str | int) -> str:
    return str(value)

# Pre-3.10 / explicit imports
from typing import Optional, Union

def find_user_old(id: int) -> Optional[dict]:
    ...

def parse_old(value: Union[str, int]) -> str:
    return str(value)
```

**Good practice:** Prefer `X | None` over `Optional[X]`. Prefer `X | Y` over `Union[X, Y]`.

---

### CONSTANTS — `Final`

> Python has no real constants. Best practice: `UPPER_SNAKE_CASE` + `Final` + type. Type checkers error on reassignment.

```python
from typing import Final

MAX_RETRIES: Final[int] = 3
API_URL: Final[str] = "https://api.example.com"

MAX_RETRIES = 5  # mypy: Cannot assign to final name
```

> `Final` locks the **name**, not mutable contents.

```python
TAGS: Final[list[str]] = ["admin", "user"]
TAGS.append("guest")   # OK
TAGS = ["other"]       # error
```

---

### TYPE ALIASES

> Shorthand for complex types. Keeps signatures readable.

```python
# Python 3.12+
type UserId = int
type ScoreMap = dict[str, int]
type Point = tuple[float, float]

# Python 3.10–3.11
from typing import TypeAlias

UserId: TypeAlias = int
ScoreMap: TypeAlias = dict[str, int]
```

```python
def get_user(uid: UserId) -> ScoreMap:
    ...
```

---

### `Callable`

> Type for functions passed as arguments.

```python
from collections.abc import Callable

def apply_twice(fn: Callable[[int], int], value: int) -> int:
    return fn(fn(value))

def run(callback: Callable[[], None]) -> None:
    callback()
```

> `Callable[[arg types], return type]` — empty `[]` means no args.

---

### `Literal`

> Value must be one of specific literals — great for flags, modes, and API options.

```python
from typing import Literal

Mode = Literal["read", "write", "append"]

def open_file(path: str, mode: Mode) -> None:
    ...

def set_status(status: Literal[200, 404, 500]) -> None:
    ...
```

**Good practice:** Prefer `Literal` over plain `str` when only a few values are valid.

---

### `TypedDict`

> Dict with known keys and value types — lighter than a full class for JSON-like data.

```python
from typing import TypedDict

class User(TypedDict):
    id: int
    name: str
    email: str

def create_user(data: User) -> User:
    return data

user: User = {"id": 1, "name": "Alice", "email": "a@x.com"}
```

#### Partial / optional keys

```python
from typing import TypedDict, NotRequired  # NotRequired: 3.11+

class Config(TypedDict, total=False):
    debug: bool
    timeout: int

class Profile(TypedDict):
    name: str
    age: NotRequired[int]
```

---

### `Protocol` (structural typing)

> "Anything that has these methods/attributes" — duck typing with type safety. Preferred over ABCs for simple interfaces.

```python
from typing import Protocol

class Drawable(Protocol):
    def draw(self) -> None: ...

def render(shape: Drawable) -> None:
    shape.draw()
```

> Any class with a matching `draw()` works — no inheritance required.

---

### `TypeVar` & Generics

> Reusable functions/classes that work across types while staying type-safe.

```python
from typing import TypeVar

T = TypeVar("T")

def first(items: list[T]) -> T:
    return items[0]

def pair(a: T, b: T) -> tuple[T, T]:
    return (a, b)
```

```python
from typing import Generic

T = TypeVar("T")

class Stack(Generic[T]):
    def __init__(self) -> None:
        self._items: list[T] = []

    def push(self, item: T) -> None:
        self._items.append(item)

    def pop(self) -> T:
        return self._items.pop()
```

---

### `Self` (Python 3.11+)

> Return type for methods that return the same instance (fluent APIs).

```python
from typing import Self

class Builder:
    def set_name(self, name: str) -> Self:
        self.name = name
        return self

    def build(self) -> Self:
        return self
```

---

### `ClassVar`

> Annotate attributes shared by the class, not per instance.

```python
from typing import ClassVar

class Counter:
    total: ClassVar[int] = 0

    def __init__(self) -> None:
        Counter.total += 1
```

---

### `NewType`

> Distinct type from an existing one — prevents mixing IDs, etc.

```python
from typing import NewType

UserId = NewType("UserId", int)
OrderId = NewType("OrderId", int)

def get_user(uid: UserId) -> str:
    ...

uid = UserId(42)
get_user(42)      # mypy error — expected UserId, got int
get_user(uid)     # OK
```

---

### `Annotated`

> Attach metadata to a type (validators, serializers, docs). Used heavily by Pydantic / FastAPI.

```python
from typing import Annotated

PositiveInt = Annotated[int, "must be > 0"]
UserId = Annotated[int, "database primary key"]

def set_age(age: PositiveInt) -> None:
    ...
```

---

### `overload`

> Multiple type signatures for one function — for type checkers only, not runtime.

```python
from typing import overload

@overload
def process(x: int) -> int: ...

@overload
def process(x: str) -> str: ...

def process(x: int | str) -> int | str:
    if isinstance(x, int):
        return x * 2
    return x.upper()
```

---

### `Never` & `NoReturn`

> Function never returns normally (always raises or loops forever).

```python
from typing import Never, NoReturn

def fail(msg: str) -> NoReturn:
    raise RuntimeError(msg)

def assert_never(value: Never) -> None:
    """Use in exhaustive match/if chains."""
    raise AssertionError(f"Unhandled: {value}")
```

```python
def handle(status: Literal["ok", "error"]) -> str:
    if status == "ok":
        return "done"
    elif status == "error":
        return "failed"
    else:
        assert_never(status)  # mypy knows this branch is unreachable
```

---

### `TYPE_CHECKING` & forward references

> Import types only for checking (avoids circular imports at runtime).

```python
from __future__ import annotations  # postpone eval of annotations (3.7+)

from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from models import User

def save(user: User) -> None:
    ...
```

> `from __future__ import annotations` — **good practice** at top of modern files. Lets you use `User` without quotes before the class is defined.

---

### `@final` decorator

> Mark a class, method, or attribute as not overridable. Different from `Final` type — this is for inheritance.

```python
from typing import final

@final
class Config:
    @final
    def load(self) -> None:
        ...
```

---

### NARROWING WITH `TypeGuard` / `TypeIs`

> Tell the checker that a runtime check refined the type (Python 3.10+ / 3.13+).

```python
from typing import TypeGuard

def is_str_list(val: list[object]) -> TypeGuard[list[str]]:
    return all(isinstance(x, str) for x in val)

def process(items: list[object]) -> None:
    if is_str_list(items):
        items[0].upper()  # checker knows items is list[str]
```

---

## GOOD PRACTICES (SUMMARY)

> What senior devs typically do.

- Annotate **public** function signatures and class attributes
- Use **built-in generics** — `list[str]`, `dict[str, int]` (not `List`, `Dict`)
- Use **`X | None`** instead of `Optional[X]`
- Use **`Final`** for module constants
- Use **`TypedDict`** or **dataclasses** instead of bare `dict` for structured data
- Use **`Protocol`** for flexible interfaces
- Use **`Literal`** for fixed string/int options
- Accept **`Sequence` / `Mapping`** when you won't mutate inputs
- Add **`from __future__ import annotations`** in new modules
- Run **`mypy`** or enable strict mode in Pyright/Pylance
- Return **`-> None`** explicitly on void functions

---

## RARE / LESS COMMON (STILL VALID)

> Annotations you *can* use but seniors rarely reach for in everyday code.

#### `Any` — avoid when possible

```python
from typing import Any

def bad(data: Any) -> Any:  # disables type checking — last resort
    return data
```

> Prefer `object`, a `Protocol`, or a concrete union instead.

#### `cast()` — escape hatch

```python
from typing import cast

value: object = get_something()
name = cast(str, value)  # tells checker "trust me" — no runtime check
```

> Use only when you know more than the checker. Prefer `isinstance` + narrowing.

#### `reveal_type()` — debug helper

```python
from typing import reveal_type

x = [1, 2, 3]
reveal_type(x)  # mypy prints: Revealed type is "builtins.list[builtins.int]"
```

#### Old `typing` imports (legacy)

```python
# Still valid, but avoid in new code (Python 3.9+)
from typing import List, Dict, Tuple, Set, FrozenSet

names: List[str] = []  # use list[str] instead
```

#### String forward references (pre-`__future__`)

```python
class Node:
    def add_child(self, child: "Node") -> None:
        ...
```

#### `Ellipsis` in tuples

```python
# tuple of (header, *many ints, footer)
Row = tuple[str, *tuple[int, ...], str]
```

#### `ParamSpec` & `Concatenate` (advanced decorators)

```python
from typing import ParamSpec, Concatenate, TypeVar

P = ParamSpec("P")
R = TypeVar("R")

def logged(fn: Callable[P, R]) -> Callable[P, R]:
    def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
        print("calling", fn.__name__)
        return fn(*args, **kwargs)
    return wrapper
```

> Powerful for preserving decorator signatures — rarely needed unless writing libraries.

#### `TypedDict` with `Unpack` (3.11+)

```python
from typing import TypedDict, Unpack

class Options(TypedDict):
    debug: bool
    timeout: int

def connect(host: str, **options: Unpack[Options]) -> None:
    ...
```

#### `@runtime_checkable` Protocol

```python
from typing import Protocol, runtime_checkable

@runtime_checkable
class SupportsClose(Protocol):
    def close(self) -> None: ...

isinstance(obj, SupportsClose)  # works at runtime (limited checks)
```

> Only checks method *existence*, not signatures. Use sparingly.

#### `enum.Enum` vs `Literal`

```python
from enum import Enum

class Status(Enum):
    PENDING = "pending"
    DONE = "done"

def set_status(status: Status) -> None:
    ...
```

> Seniors often prefer `Enum` over `Literal` when values are shared across modules or need methods.

#### `type` statement (Python 3.12+)

```python
type Point = tuple[float, float]
type JsonValue = dict[str, "JsonValue"] | list["JsonValue"] | str | int | float | bool | None
```

#### Ignoring checks

```python
from typing import no_type_check

@no_type_check
def legacy_lib_wrapper(...):
    ...  # mypy skips this function entirely
```

```python
x: int = "wrong"  # type: ignore[assignment]  — suppress one line (use rarely)
```

---

### TOOLING

```bash
# Install
pip install mypy

# Check a file or project
mypy script.py
mypy src/
```

> **Pylance / Pyright** — built into VS Code/Cursor. Set `python.analysis.typeCheckingMode` to `"basic"` or `"strict"`.
>
> **Ruff** — can lint annotation style (e.g. flag `Optional[X]` when `X | None` is available).
