### GENERATORS

> A **generator** produces values **one at a time**, on demand — instead of building a full list in memory.
>
> Created with a function that uses `yield`, or with a **generator expression** `(x for x in items)`.

```python
def count_up_to(n: int):
    for i in range(1, n + 1):
        yield i

for num in count_up_to(3):
    print(num)  # 1, 2, 3
```

**Mental model:** A generator is a **paused function** — it runs until `yield`, hands you a value, then waits for you to ask for the next one.

---

### PREREQUISITES — ITERABLES & ITERATORS

> Generators are a special kind of **iterator**. Understand the iteration protocol first.

#### Iterable vs iterator

| Term | Meaning |
|------|---------|
| **Iterable** | Anything you can loop over (`list`, `str`, `dict`, generator) |
| **Iterator** | Object that yields items one-by-one via `next()` |

```python
nums = [1, 2, 3]          # iterable (a list)
it = iter(nums)           # iterator
print(next(it))           # 1
print(next(it))           # 2
print(next(it))           # 3
next(it)                  # StopIteration — no more items
```

> `for x in thing` secretly does: get iterator → call `next()` until `StopIteration`.

#### Iterator protocol

```python
class CountDown:
    def __init__(self, start: int):
        self.current = start

    def __iter__(self):
        return self

    def __next__(self):
        if self.current <= 0:
            raise StopIteration
        value = self.current
        self.current -= 1
        return value

for n in CountDown(3):
    print(n)  # 3, 2, 1
```

> A **generator function** does all of this automatically — no class needed.

---

### THE PROBLEM GENERATORS SOLVE

> Lists compute **everything upfront**. Generators compute **only when needed**.

```python
# List — all 1 million squares in memory at once
squares_list = [x ** 2 for x in range(1_000_000)]

# Generator — one square at a time, tiny memory
squares_gen = (x ** 2 for x in range(1_000_000))
```

**Use generators when:**
- Data is large or unbounded (files, streams, infinite sequences)
- You may not need every value (early `break`, `any()`, `next()`)
- You want a clean **pipeline** of processing steps

**Use lists when:**
- You need random access (`items[5]`)
- You need to iterate multiple times
- You need `len()` or sorting the full dataset

---

### YOUR FIRST GENERATOR (`yield`)

> `yield` pauses the function and sends a value out. Next `next()` resumes after the `yield`.

```python
def greet_three():
    yield "Hello"
    yield "Bonjour"
    yield "Hola"

gen = greet_three()
print(next(gen))  # Hello
print(next(gen))  # Bonjour
print(next(gen))  # Hola
next(gen)         # StopIteration
```

**`return` vs `yield`:**

| | `return` | `yield` |
|---|----------|---------|
| Ends function | Yes, permanently | Pauses; can resume |
| Returns | One value | A stream of values |
| Function type | Normal function | Generator function |

```python
def with_return():
    return 42

def with_yield():
    yield 42

print(with_return())   # 42
print(with_yield())    # <generator object ...>
```

---

### GENERATOR OBJECTS & `next()`

> Calling a generator function does **not** run the body — it returns a generator object.

```python
def naturals():
    n = 1
    while True:
        yield n
        n += 1

gen = naturals()
print(next(gen))  # 1
print(next(gen))  # 2
print(next(gen))  # 3
```

#### Local state is preserved between `yield`s

```python
def accumulator():
    total = 0
    while True:
        value = yield total
        if value is not None:
            total += value

acc = accumulator()
next(acc)          # prime the generator (advance to first yield)
acc.send(10)       # 10
acc.send(5)        # 15
```

> More on `send()` in a later section.

---

### `for` LOOPS & GENERATORS

> `for` handles `next()` and `StopIteration` for you.

```python
def fibonacci_up_to(limit: int):
    a, b = 0, 1
    while a <= limit:
        yield a
        a, b = b, a + b

for num in fibonacci_up_to(20):
    print(num)  # 0, 1, 1, 2, 3, 5, 8, 13
```

#### Early exit still saves work

```python
def expensive():
    for i in range(1_000_000):
        print(f"generating {i}")
        yield i

for x in expensive():
    if x == 3:
        break  # stops — no more prints after 3
```

---

### GENERATOR EXPRESSIONS

> Like list comprehensions but with `()` — returns a generator, not a list.

```python
# List comprehension
squares_list = [x ** 2 for x in range(5)]

# Generator expression
squares_gen = (x ** 2 for x in range(5))

print(sum(squares_gen))  # 30
```

**Syntax difference:**

```python
[x * 2 for x in range(3)]    # list → [0, 2, 4]
(x * 2 for x in range(3))    # generator → lazy
```

> Generator expressions cannot have `:=` walrus or complex multi-line logic — use a `def` with `yield` for that.

---

### LAZY EVALUATION & MEMORY

> Values are produced **just in time** — great for big files and streams.

```python
def read_lines(path: str):
    with open(path) as f:
        for line in f:
            yield line.strip()

# Only one line in memory at a time
for line in read_lines("huge.log"):
    if "ERROR" in line:
        print(line)
```

#### Chaining without loading everything

```python
def numbers():
    for i in range(5):
        yield i

def double(source):
    for x in source:
        yield x * 2

def only_big(source):
    for x in source:
        if x >= 4:
            yield x

pipeline = only_big(double(numbers()))
print(list(pipeline))  # [4, 6, 8]
```

---

### `yield from` — DELEGATION

> Hand off iteration to another generator or iterable — flattens nested loops.

```python
def generator_a():
    yield 1
    yield 2

def generator_b():
    yield from generator_a()
    yield 3

print(list(generator_b()))  # [1, 2, 3]
```

#### Flatten nested data

```python
def flatten(nested: list[list[int]]):
    for sublist in nested:
        yield from sublist

print(list(flatten([[1, 2], [3], [4, 5]])))  # [1, 2, 3, 4, 5]
```

> `yield from` also forwards `send()`, `throw()`, and `close()` — important for advanced coroutine-style code.

---

### BUILDING PIPELINES

> Small generators composed together — readable, testable, memory-efficient.

```python
def read_numbers(path: str):
    with open(path) as f:
        for line in f:
            yield int(line.strip())

def filter_even(source):
    for n in source:
        if n % 2 == 0:
            yield n

def square(source):
    for n in source:
        yield n ** 2

def pipeline(path: str):
    return square(filter_even(read_numbers(path)))

# list(pipeline("nums.txt"))  # process file in one pass
```

**Good practice:** Each step does **one transformation**. Name them clearly.

---

### INFINITE GENERATORS

> No `StopIteration` until you stop asking — useful for IDs, retries, round-robin.

```python
def counter(start: int = 0):
    n = start
    while True:
        yield n
        n += 1

def cycle(items: list[str]):
    while True:
        for item in items:
            yield item

ids = counter(1000)
print(next(ids))  # 1000
print(next(ids))  # 1001

round_robin = cycle(["A", "B", "C"])
print(next(round_robin))  # A
print(next(round_robin))  # B
```

> Use `itertools.count`, `itertools.cycle`, `itertools.repeat` for common infinite patterns (see Built-in helpers).

---

### GENERATOR METHODS — `send`, `throw`, `close`

> Generators are **bidirectional** — you can push values in, raise exceptions, and shut them down.

#### `send(value)` — push data into the generator

```python
def echo():
    while True:
        received = yield
        print(f"Got: {received}")

e = echo()
next(e)           # prime (must advance to first yield)
e.send("hello")   # Got: hello
e.send("world")   # Got: world
```

```python
def running_average():
    total = 0
    count = 0
    avg = yield 0
    while True:
        value = yield avg
        total += value
        count += 1
        avg = total / count

avg = running_average()
print(next(avg))       # 0
print(avg.send(10))    # 10.0
print(avg.send(20))    # 15.0
```

#### `throw(exc)` — inject an exception

```python
def gen():
    try:
        yield 1
        yield 2
    except ValueError:
        yield "recovered"

g = gen()
print(next(g))              # 1
print(g.throw(ValueError))  # recovered
```

#### `close()` — stop the generator

```python
def gen():
    try:
        yield 1
        yield 2
    finally:
        print("cleanup")

g = gen()
print(next(g))  # 1
g.close()       # cleanup — raises GeneratorExit inside
```

> **Senior note:** `send`/`throw`/`close` powered pre-`async`/`await` coroutines. Modern async code uses `async def` instead, but generators still matter for iteration and data pipelines.

---

### CLASSES VS GENERATOR FUNCTIONS

> Both can be iterators. Prefer generators for simple iteration; use classes when you need rich behavior.

```python
# Generator — concise
def squares(n: int):
    for i in range(n):
        yield i ** 2

# Class — more control, multiple methods
class Squares:
    def __init__(self, n: int):
        self.n = n
        self.i = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self.i >= self.n:
            raise StopIteration
        value = self.i ** 2
        self.i += 1
        return value
```

**Rule of thumb:** If it's just "yield values in a loop", use a generator function.

---

### BUILT-IN & `itertools` HELPERS

> Don't reinvent common generator patterns.

```python
import itertools

# Infinite
itertools.count(10, 2)       # 10, 12, 14, ...
itertools.cycle("AB")        # A, B, A, B, ...
itertools.repeat(7, 3)       # 7, 7, 7

# Finite / slicing
itertools.islice(range(100), 5, 10)  # 5..9
itertools.chain([1, 2], [3, 4])      # 1, 2, 3, 4

# Grouping / combinations
itertools.groupby(sorted(["aa", "ab", "bb"]))
itertools.combinations([1, 2, 3], 2)

# Duplicate an iterator (stores values — uses memory)
a, b = itertools.tee(range(3), 2)
```

#### Built-in functions that accept generators

```python
nums = (x for x in range(10) if x % 2 == 0)

sum(nums)           # 20
max(x for x in [3, 1, 4])  # 4
any(x > 5 for x in [1, 2]) # False
all(x > 0 for x in [1, 2]) # True
```

> After `sum(nums)`, the generator is **exhausted** — can't reuse it.

---

### REAL-WORLD PATTERNS

#### Read a large file in chunks

```python
def read_chunks(path: str, size: int = 8192):
    with open(path, "rb") as f:
        while chunk := f.read(size):
            yield chunk
```

#### Batch items

```python
def batch(source, size: int):
    batch_list = []
    for item in source:
        batch_list.append(item)
        if len(batch_list) == size:
            yield batch_list
            batch_list = []
    if batch_list:
        yield batch_list

list(batch(range(7), 3))  # [[0,1,2], [3,4,5], [6]]
```

#### Pagination (API / DB)

```python
def paginate(fetch_page, start=1):
    page = start
    while True:
        data = fetch_page(page)
        if not data:
            break
        yield from data
        page += 1
```

#### Unique items while streaming

```python
def unique(source):
    seen = set()
    for item in source:
        if item not in seen:
            seen.add(item)
            yield item
```

#### Retry with backoff (generator-style)

```python
import time

def retry_delays(max_attempts: int = 5, base: float = 1.0):
    for attempt in range(max_attempts):
        yield base * (2 ** attempt)

for delay in retry_delays(3):
    print(delay)  # 1.0, 2.0, 4.0
```

---

### TYPE ANNOTATIONS

> Annotate generator functions with `Iterator` or `Generator`.

```python
from collections.abc import Iterator, Iterable

def count_up_to(n: int) -> Iterator[int]:
    for i in range(1, n + 1):
        yield i

def flatten(items: Iterable[list[int]]) -> Iterator[int]:
    for sub in items:
        yield from sub
```

#### `Generator[YieldType, SendType, ReturnType]`

```python
from collections.abc import Generator

def running_avg() -> Generator[float, float, None]:
    # yields float, accepts send(float), returns None
    total = count = 0
    while True:
        value = yield (total / count if count else 0.0)
        if value is not None:
            total += value
            count += 1
```

> For simple "yield and iterate" code, `Iterator[T]` is enough. Use full `Generator` when you use `send()`.

---

### HOW GENERATORS WORK (SENIOR)

<pre>
GENERATOR LIFECYCLE

1. Call gen_func()     →  returns generator object (body NOT run yet)
2. next(gen)           →  run until yield → return value → pause
3. next(gen) again     →  resume after yield → next yield or StopIteration
4. gen.close()         →  throw GeneratorExit → run finally blocks

FRAME STATE

Local variables and instruction pointer are frozen between yields.
That's why `n` in count_up_to keeps incrementing across calls.
</pre>

#### `return` inside a generator

```python
def gen():
    yield 1
    return "done"  # raises StopIteration with value "done" (Python 3.3+)

g = gen()
print(next(g))  # 1
try:
    next(g)
except StopIteration as e:
    print(e.value)  # done
```

#### Generator expression scope (Python 3 — lazy)

```python
# In Python 3, gen exp variables don't leak
result = list(x * 2 for x in range(3))
# x is not left in local scope
```

#### Relationship to `async`

| | Generator | Async generator |
|---|-----------|-----------------|
| Keyword | `yield` | `async def` + `yield` / `async for` |
| Pause on | `next()` / `send()` | `await` / event loop |
| Use case | Sync iteration, pipelines | Async I/O streams |

```python
async def async_range(n: int):
    for i in range(n):
        yield i
```

---

## GOOD PRACTICES (SUMMARY)

> What senior devs do consistently.

- Use generators for **large or infinite** data — not everything needs to be a list
- Prefer **generator expressions** for simple one-liner transforms in function calls: `sum(x for x in ...)`
- Use **`yield from`** to delegate instead of nested `for` loops
- Build **small pipeline steps** — one job per generator
- Name generator functions as **iterables**: `read_lines`, `parse_rows`, `filter_active`
- Remember: generators are **single-use** — exhaust once, then make a new one
- Use **`itertools`** before writing custom infinite/cycle/batch logic
- Annotate return type as **`Iterator[T]`** on public generator APIs
- Use **`with open(...)` inside** the generator so files close properly
- For async I/O streams, use **`async def` generators** instead of forcing `send()`

---

## COMMON MISTAKES

```python
# 1. Treating generator like a list
gen = (x for x in range(3))
print(gen[0])       # TypeError — no indexing
print(len(gen))     # TypeError — no length

# 2. Reusing exhausted generator
gen = (x for x in range(3))
list(gen)           # [0, 1, 2]
list(gen)           # [] — already exhausted

# 3. Forgetting to prime before send()
def gen():
    while True:
        val = yield
        print(val)

g = gen()
g.send("hi")        # TypeError — must next(g) first

# 4. Building a list when you only need one pass
# Bad for huge data:
data = [process(x) for x in huge_source]
# Good:
data = (process(x) for x in huge_source)

# 5. Holding references to huge state inside generator after done
def bad():
    huge = [0] * 10_000_000
    yield 1
    # huge stays in frame until generator is garbage-collected
```

---

## LEARNING PATH — REVISIT CHECKLIST

> Read in order first time. Later, use this to refresh from zero to senior.

| Stage | Topic | You should be able to… |
|-------|--------|-------------------------|
| 1 | Iterable vs iterator | Explain `iter()`, `next()`, `StopIteration` |
| 2 | The problem | Compare list comp vs generator expression memory |
| 3 | `yield` | Write a function that yields multiple values |
| 4 | Generator object | Explain why `gen()` doesn't run the body immediately |
| 5 | `next()` & `for` | Drive a generator manually and with `for` |
| 6 | Generator expressions | Convert `[...]` to `(...)` when appropriate |
| 7 | Lazy pipelines | Chain 2–3 generators without loading all data |
| 8 | `yield from` | Delegate to sub-generators and flatten nested lists |
| 9 | Infinite generators | Build `counter()` / `cycle()` safely |
| 10 | `send/throw/close` | Explain priming and why async replaced most `send` use |
| 11 | `itertools` | Reach for `islice`, `chain`, `count`, `tee` |
| 12 | Real patterns | Implement batching, file reading, pagination |
| 13 | Typing | Annotate with `Iterator[T]` and `Generator[...]` |
| 14 | Senior | Explain frame state, exhaustion, `return` in generators |

---

### QUICK REFERENCE — COPY-PASTE TEMPLATES

#### Basic generator

```python
from collections.abc import Iterator

def my_generator(n: int) -> Iterator[int]:
    for i in range(n):
        yield i
```

#### Generator expression

```python
result = sum(x ** 2 for x in range(10) if x % 2 == 0)
```

#### Pipeline step

```python
from collections.abc import Iterable, Iterator

def transform(source: Iterable[int]) -> Iterator[int]:
    for item in source:
        yield item * 2
```

#### `yield from` delegation

```python
def combined() -> Iterator[int]:
    yield from range(3)
    yield from range(10, 13)
```

#### Batching

```python
from collections.abc import Iterable, Iterator, TypeVar

T = TypeVar("T")

def batch(source: Iterable[T], size: int) -> Iterator[list[T]]:
    chunk: list[T] = []
    for item in source:
        chunk.append(item)
        if len(chunk) == size:
            yield chunk
            chunk = []
    if chunk:
        yield chunk
```

#### File line reader

```python
from collections.abc import Iterator
from pathlib import Path

def read_lines(path: Path) -> Iterator[str]:
    with path.open() as f:
        for line in f:
            yield line.rstrip("\n")
```
