### DECORATORS

> A **decorator** wraps a function or class to add behavior **before**, **after**, or **around** it — without changing the original code.
>
> Syntax: `@decorator` above a `def` is shorthand for `func = decorator(func)`.

```python
@timer
def fetch_data():
    ...

# Same as:
def fetch_data():
    ...
fetch_data = timer(fetch_data)
```

**Mental model:** A decorator is a function that takes a function and returns a (usually new) function.

---

### PREREQUISITES — FUNCTIONS ARE OBJECTS

> Before decorators, you need three ideas Python is built on.

#### 1. Functions can be assigned and passed

```python
def greet(name: str) -> str:
    return f"Hello, {name}"

say_hi = greet          # assign to another name
run = greet             # pass as argument later
print(say_hi("Alice"))  # Hello, Alice
```

#### 2. Functions can live inside functions (closures)

```python
def outer(msg: str):
    def inner(name: str) -> str:
        return f"{msg}, {name}"
    return inner

hello = outer("Hello")
print(hello("Bob"))  # Hello, Bob
```

> `inner` remembers `msg` from `outer` — that's a **closure**.

#### 3. Functions can return functions

```python
def make_multiplier(n: int):
    def multiply(x: int) -> int:
        return x * n
    return multiply

double = make_multiplier(2)
print(double(5))  # 10
```

**You already know decorators** once you understand: *a function that receives a function, builds a wrapper, and returns it.*

---

### YOUR FIRST DECORATOR (NO `@` YET)

> Manually wrap a function to see what `@` actually does.

```python
def shout(fn):
    def wrapper(name: str) -> str:
        result = fn(name)
        return result.upper()
    return wrapper

def greet(name: str) -> str:
    return f"Hello, {name}"

greet = shout(greet)
print(greet("alice"))  # HELLO, ALICE
```

**Flow:**
1. `shout` receives `greet`
2. `shout` defines `wrapper` that calls `greet` and transforms the result
3. `shout` returns `wrapper`
4. `greet` now points to `wrapper`, not the original function

---

### `@` SYNTAX

> Sugar for reassignment. Cleaner and standard.

```python
def shout(fn):
    def wrapper(name: str) -> str:
        result = fn(name)
        return result.upper()
    return wrapper

@shout
def greet(name: str) -> str:
    return f"Hello, {name}"

print(greet("alice"))  # HELLO, ALICE
```

---

### `functools.wraps` — ALWAYS USE IT

> Naive wrappers overwrite `__name__`, `__doc__`, and other metadata. `wraps` copies them from the original function.

```python
from functools import wraps

def shout(fn):
    @wraps(fn)
    def wrapper(name: str) -> str:
        result = fn(name)
        return result.upper()
    return wrapper

@shout
def greet(name: str) -> str:
    """Return a greeting."""
    return f"Hello, {name}"

print(greet.__name__)  # greet  (without wraps: wrapper)
print(greet.__doc__)   # Return a greeting.
```

**Good practice:** Every decorator you write should use `@wraps(fn)` on the inner wrapper.

**Senior tip:** `wrapper.__wrapped__` points to the original function — useful for testing and introspection.

```python
assert greet.__wrapped__ is not greet
greet.__wrapped__("alice")  # call unwrapped version
```

---

### WRAPPER MUST MATCH ANY SIGNATURE

> Use `*args` and `**kwargs` so the decorator works on any function.

```python
from functools import wraps

def log_calls(fn):
    @wraps(fn)
    def wrapper(*args, **kwargs):
        print(f"Calling {fn.__name__}{args, kwargs}")
        result = fn(*args, **kwargs)
        print(f"{fn.__name__} returned {result!r}")
        return result
    return wrapper

@log_calls
def add(a: int, b: int) -> int:
    return a + b

@log_calls
def greet(name: str, punct: str = "!") -> str:
    return f"Hi {name}{punct}"

add(2, 3)
greet("Bob", punct="?")
```

---

### DECORATORS WITH ARGUMENTS

> When the decorator itself needs config (`@retry(3)`), you need **three nested levels**.

```
@decorator_factory(arg)   →   decorator_factory returns decorator
@decorator                  →   decorator receives function
def func():                 →   decorator returns wrapper
```

```python
from functools import wraps

def repeat(times: int):
    def decorator(fn):
        @wraps(fn)
        def wrapper(*args, **kwargs):
            for _ in range(times):
                result = fn(*args, **kwargs)
            return result
        return wrapper
    return decorator

@repeat(3)
def say(msg: str) -> None:
    print(msg)

say("hi")  # prints "hi" three times
```

#### Optional: make both `@decorator` and `@decorator()` work

```python
from functools import wraps

def smart_repeat(fn=None, *, times: int = 2):
    def decorator(f):
        @wraps(f)
        def wrapper(*args, **kwargs):
            for _ in range(times):
                result = f(*args, **kwargs)
            return result
        return wrapper

    if fn is None:
        return decorator
    return decorator(fn)

@smart_repeat
def once(): ...

@smart_repeat(times=5)
def five_times(): ...
```

---

### STACKING DECORATORS

> Applied **bottom-up** — closest to the function runs first in the wrapping chain.

```python
@decorator_a
@decorator_b
@decorator_c
def func():
    ...

# Equivalent to:
func = decorator_a(decorator_b(decorator_c(func)))
```

```python
from functools import wraps

def bold(fn):
    @wraps(fn)
    def wrapper(*args, **kwargs):
        return f"**{fn(*args, **kwargs)}**"
    return wrapper

def italic(fn):
    @wraps(fn)
    def wrapper(*args, **kwargs):
        return f"_{fn(*args, **kwargs)}_"
    return wrapper

@bold
@italic
def title() -> str:
    return "Hello"

print(title())  # **_Hello_**
```

---

### CLASS-BASED DECORATORS

> A class with `__call__` can act as a decorator — good when you need state.

```python
from functools import wraps

class CountCalls:
    def __init__(self, fn):
        wraps(fn)(self)
        self.fn = fn
        self.count = 0

    def __call__(self, *args, **kwargs):
        self.count += 1
        print(f"Call #{self.count} to {self.fn.__name__}")
        return self.fn(*args, **kwargs)

@CountCalls
def work() -> None:
    print("working")

work()
work()
# Call #1 to work
# working
# Call #2 to work
# working
```

#### Class decorator with arguments

```python
class RateLimit:
    def __init__(self, max_calls: int):
        self.max_calls = max_calls

    def __call__(self, fn):
        count = 0

        @wraps(fn)
        def wrapper(*args, **kwargs):
            nonlocal count
            if count >= self.max_calls:
                raise RuntimeError("Rate limit exceeded")
            count += 1
            return fn(*args, **kwargs)
        return wrapper

@RateLimit(3)
def api_call() -> str:
    return "ok"
```

---

### DECORATING CLASSES

> Class decorators receive a class and return a class (original or modified).

```python
def add_repr(cls):
    def __repr__(self):
        return f"{cls.__name__}({self.__dict__!r})"
    cls.__repr__ = __repr__
    return cls

@add_repr
class User:
    def __init__(self, name: str):
        self.name = name

print(User("Alice"))  # User({'name': 'Alice'})
```

> Built-in examples: `@dataclass`, `@total_ordering`, `@functools.total_ordering`.

```python
from dataclasses import dataclass

@dataclass
class Point:
    x: float
    y: float
```

---

### BUILT-IN DECORATORS YOU ALREADY USE

#### `@property`

> Turns a method into a getter. Part of the **descriptor** system.

```python
class Circle:
    def __init__(self, radius: float):
        self.radius = radius

    @property
    def area(self) -> float:
        return 3.14159 * self.radius ** 2

c = Circle(5)
print(c.area)  # no () — looks like an attribute
```

#### `@staticmethod` and `@classmethod`

```python
class Math:
    factor = 10

    @staticmethod
    def add(a: int, b: int) -> int:
        return a + b  # no self, no cls

    @classmethod
    def scale(cls, value: int) -> int:
        return value * cls.factor

Math.add(1, 2)       # 3
Math.scale(5)        # 50
```

#### `functools.lru_cache`

> Memoize results — cache decorator with arguments built in.

```python
from functools import lru_cache

@lru_cache(maxsize=128)
def fib(n: int) -> int:
    if n < 2:
        return n
    return fib(n - 1) + fib(n - 2)
```

#### `functools.singledispatch`

> Function overloading by first argument type.

```python
from functools import singledispatch

@singledispatch
def serialize(obj) -> str:
    raise TypeError(f"Unsupported: {type(obj)}")

@serialize.register
def _(obj: int) -> str:
    return str(obj)

@serialize.register
def _(obj: list) -> str:
    return "[" + ", ".join(serialize(x) for x in obj) + "]"
```

---

### REAL-WORLD PATTERNS

#### Timer

```python
import time
from functools import wraps

def timer(fn):
    @wraps(fn)
    def wrapper(*args, **kwargs):
        start = time.perf_counter()
        result = fn(*args, **kwargs)
        elapsed = time.perf_counter() - start
        print(f"{fn.__name__} took {elapsed:.4f}s")
        return result
    return wrapper
```

#### Retry

```python
import time
from functools import wraps

def retry(times: int = 3, delay: float = 1.0):
    def decorator(fn):
        @wraps(fn)
        def wrapper(*args, **kwargs):
            last_error = None
            for attempt in range(1, times + 1):
                try:
                    return fn(*args, **kwargs)
                except Exception as e:
                    last_error = e
                    print(f"Attempt {attempt} failed: {e}")
                    time.sleep(delay)
            raise last_error
        return wrapper
    return decorator

@retry(times=3, delay=0.5)
def fetch() -> dict:
    ...
```

#### Validate arguments

```python
from functools import wraps

def require_positive(fn):
    @wraps(fn)
    def wrapper(n: int, *args, **kwargs):
        if n <= 0:
            raise ValueError("n must be positive")
        return fn(n, *args, **kwargs)
    return wrapper

@require_positive
def sqrt_approx(n: int) -> float:
    return n ** 0.5
```

#### Deprecation warning

```python
import warnings
from functools import wraps

def deprecated(reason: str):
    def decorator(fn):
        @wraps(fn)
        def wrapper(*args, **kwargs):
            warnings.warn(
                f"{fn.__name__} is deprecated: {reason}",
                DeprecationWarning,
                stacklevel=2,
            )
            return fn(*args, **kwargs)
        return wrapper
    return decorator

@deprecated("Use fetch_v2 instead")
def fetch_v1() -> None:
    ...
```

#### Auth / permission check (framework-style)

```python
from functools import wraps

def require_role(role: str):
    def decorator(fn):
        @wraps(fn)
        def wrapper(user, *args, **kwargs):
            if user.role != role:
                raise PermissionError(f"Requires role: {role}")
            return fn(user, *args, **kwargs)
        return wrapper
    return decorator

@require_role("admin")
def delete_user(user, target_id: int) -> None:
    ...
```

---

### DECORATORS ON METHODS — GOTCHAS

> Decorating instance methods works, but order with `@classmethod` / `@staticmethod` matters.

```python
class API:
    @classmethod
    @timer          # timer wraps the classmethod object
    def ping(cls) -> str:
        return "pong"
```

**Rule:** Put `@classmethod` or `@staticmethod` **below** other decorators (closer to the `def`).

```python
# Correct
@classmethod
@my_decorator
def method(cls): ...

# Wrong — my_decorator receives classmethod descriptor incorrectly
@my_decorator
@classmethod
def method(cls): ...
```

#### Instance methods that need `self` in the decorator

```python
def log_method(fn):
    @wraps(fn)
    def wrapper(self, *args, **kwargs):
        print(f"{self.__class__.__name__}.{fn.__name__}")
        return fn(self, *args, **kwargs)
    return wrapper
```

---

### CONTEXT MANAGER DECORATOR — `contextlib.contextmanager`

> Related pattern: decorator that turns a generator into a `with` block.

```python
from contextlib import contextmanager

@contextmanager
def temp_file(path: str):
    f = open(path, "w")
    try:
        yield f
    finally:
        f.close()
        import os
        os.remove(path)

with temp_file("out.txt") as f:
    f.write("data")
```

---

### TYPE ANNOTATIONS FOR DECORATORS

> Preserve the wrapped function's signature for type checkers (Python 3.10+).

```python
from collections.abc import Callable
from functools import wraps
from typing import ParamSpec, TypeVar

P = ParamSpec("P")
R = TypeVar("R")

def log_calls(fn: Callable[P, R]) -> Callable[P, R]:
    @wraps(fn)
    def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
        print(f"Calling {fn.__name__}")
        return fn(*args, **kwargs)
    return wrapper
```

> `ParamSpec` keeps `mypy` happy — callers still get correct arg/return types.

---

### HOW DECORATORS REALLY WORK (SENIOR)

> Under the hood, `@decorator` on a function is just reassignment. On a class, same idea.
>
> `@property` and descriptors are a **different mechanism** — they implement `__get__`, `__set__`, `__delete__` on the class, not simple function wrapping.

<pre>
DECORATOR LAYERS (with arguments)

@factory(arg)          →  factory(arg) returns decorator
@decorator             →  decorator(func) returns wrapper
def func():            →  name `func` now refers to wrapper

CALL FLOW

caller → wrapper → (before logic) → original func → (after logic) → return
</pre>

#### Inspecting and unwrapping

```python
from functools import wraps

def deco(fn):
    @wraps(fn)
    def wrapper(*args, **kwargs):
        return fn(*args, **kwargs)
    return wrapper

@deco
def work(): ...

work.__wrapped__           # original work
import inspect
inspect.unwrap(work)       # walks __wrapped__ chain
```

---

## GOOD PRACTICES (SUMMARY)

> What senior devs do consistently.

- Use **`@functools.wraps`** on every wrapper
- Accept **`*args, **kwargs`** unless the decorator is specialized
- Use **decorator factories** (`def deco(arg):`) when you need configuration
- Remember stacking order: **bottom decorator wraps first**
- Put **`@classmethod` / `@staticmethod` closest to the `def`**
- Use **`ParamSpec`** when typing generic decorators
- Prefer **built-ins** (`lru_cache`, `dataclass`, `property`) before rolling your own
- Keep decorators **focused** — one job (log, retry, validate), not everything
- Test the **unwrapped** function via `__wrapped__` when needed
- Don't over-decorate — too many layers hurt readability and debugging

---

## COMMON MISTAKES

```python
# 1. Forgetting return value
def bad(fn):
    def wrapper(*args, **kwargs):
        fn(*args, **kwargs)  # BUG: returns None always
    return wrapper

# 2. Forgetting wraps — breaks __name__, __doc__, debugging tools
def bad(fn):
    def wrapper(*args, **kwargs):
        return fn(*args, **kwargs)
    return wrapper

# 3. Calling decorator factory wrong
@repeat              # BUG: repeat is not the decorator, repeat() is
def func(): ...

@repeat(3)           # correct
def func(): ...

# 4. Mutating shared state across calls accidentally
def bad(fn):
    log = []  # shared by all calls if not careful
    def wrapper(*args, **kwargs):
        log.append(fn.__name__)
        return fn(*args, **kwargs)
    return wrapper
```

---

## LEARNING PATH — REVISIT CHECKLIST

> Read in order first time. Later, use this to refresh from zero to senior.

| Stage | Topic | You should be able to… |
|-------|--------|-------------------------|
| 1 | Functions as objects | Pass and return functions |
| 2 | Closures | Explain how `wrapper` remembers outer variables |
| 3 | Manual wrap | Write `func = deco(func)` without `@` |
| 4 | `@` syntax | Convert between manual and `@` forms |
| 5 | `wraps` | Explain why `__name__` breaks without it |
| 6 | `*args, **kwargs` | Write one decorator for any function |
| 7 | Decorator with args | Write three-level `factory → decorator → wrapper` |
| 8 | Stacking | Predict order of `@a @b def f` |
| 9 | Class decorators | Build one with `__call__` and optional state |
| 10 | Built-ins | Use `@property`, `lru_cache`, `@dataclass` |
| 11 | Real patterns | Implement timer, retry, validate, deprecated |
| 12 | Methods | Place `@classmethod` correctly with other decorators |
| 13 | Typing | Use `ParamSpec` + `TypeVar` for a typed decorator |
| 14 | Senior | Explain `__wrapped__`, descriptors vs wrappers |

---

### QUICK REFERENCE — COPY-PASTE TEMPLATE

```python
from collections.abc import Callable
from functools import wraps
from typing import ParamSpec, TypeVar

P = ParamSpec("P")
R = TypeVar("R")

def my_decorator(fn: Callable[P, R]) -> Callable[P, R]:
    @wraps(fn)
    def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
        # before
        result = fn(*args, **kwargs)
        # after
        return result
    return wrapper


def my_decorator_with_args(option: str):
    def decorator(fn: Callable[P, R]) -> Callable[P, R]:
        @wraps(fn)
        def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
            # use `option` here
            return fn(*args, **kwargs)
        return wrapper
    return decorator
```
