## EXECUTION CONTEXT

> JS code runs in two phases - Memory Phase & Execution Phase. These two together is called executions context.</br>
> It is more like an created environment where js code runs in these two phases. Every variables & other things all are saved here.

### MEMORY PHASE

> In this phase JS allocates memory for every thing. Like all the variables and functions etc.</br>
> It does not stores the values of those.

```javascript
let value = 12;
function myFunc() {
    console.log(value);
};
myFunc();
```

> In the above code JS allocates memory for `value` & `myFunc`. But is this stage JS stores `undefined` in those.</br>

### EXECUTION PHASE

> In this phase JS actually executes the code.</br>
> This is the reason of hoisting.</br>
> For this reason if the variables declared with `var` are used before declaration its holds the value `undefined`.

## LEXICAL SCOPE (JS)

> In this type of scoping in JS some variable is available in its lexical scope.</br>
> If a variable is physically a direct children of any function then the variable can be used through the entire function despite of it begin inside another function inside the parent function.

```javascript
function abcd() {
    let a = 12;
    function efgh() {
        console.log(a);
        let b = 34;
        function ijkl() {
            console.log(b);
        }
    }
}
```

> In the above example a is physically `a` direct child of `abcd()` so lexical scope of `a` is `abcd()`. So a is available in the whole `abcd()` even in `efgh()` & `ijkl()`.</br>
> But the lexical scope of `b` is `efgh()`. So `b` is available only in `efgh()` & `ijkl()` but not outside the `efgh()` in the `abcd()`.

## DYNAMIC SCOPE (JS ❌)

> In ths kind of scoping value of variables depends on where the functions are called.

```javascript
let a = 12;
function func1() {
    console.log(a);
}

function func2() {
    let a = 23;
    func1();
}
func2();
```

> In the above example (If this is an dynamic scoping language)(JS ❌) `func1()` logs the value of `a` & it is called inside `func2()`. So it will take the value of `a` from where it is called.</br>
> So the output will be 12.</br>
> But if this was a language using dynamic scope the output would have 23.</br>

## CLOSURES

> A function that returns a functions & the returned function uses variable of parent function.</br>
> It is used for making variables **private variables** & reducing **global pollution**.

### What special about closures ...

```javascript
function abcd() {
    let a = 12;
    return function () {
        console.log(a);
    }
}

let print = abcd();
print();
```

> In the above example we see it logs 12 in the console.</br>
> When a function is executed it is removed from the call stack & all the variable of that function is also gone from the memory.</br>
> So when the `print()` is called the function `abcd()` is already removed from the call stack. So `a` is already removed from the memory. So how Js is logging the value of `a` after that ?

> So When closure are executes JS creates a **Backlinks** of all the variables of the closure. That is called `[[environment]]`.

### USE

> In this counter we can't change the `count` from outside. So it is a private variable.</br>
> When we save the returned variable in a variable. It creates its own `[[environment]]`. So individual variable has its own `count`.

```javascript
function count() {
    let count = 0;
    return function () {
        count++;
        console.log(count);
    }
}

let counter1 = count();
counter1();     // 1
counter1();     // 2
counter1();     // 3

let counter2 = count();
// counter2 has its own count so it starts count from 1.
counter2();     // 1
counter2();     // 2
counter2();     // 3
counter2();     // 4
counter2();     // 5
```

### Encapsulation

> Its basically privatize a variable in closures & giving a function to change it through. But we can't change the variable outside or in the user side.

```javascript
// Aam Zindegi ❌
let clickCount = 0;
function click() {
    if (clickCount <= 5) {
        clickCount++;
        console.log(clickCount);
    } else {
        console.log("Limit Exceeded.")
    }
}
click();
// But if after exceeding the limit the user reassign the clickCounter to 0. It will start count again.
```

```javascript
// Encapsulation Zindegi ✅
function clickLimiter() {
    let clickCount = 0;
    return function () {
        if (clickCount <= 5) {
            clickCount++;
            console.log(clickCount);
        } else {
            console.log("Limit Exceeded.");
        }
    }
}
let click = clickLimiter();
click();
// Now the limit exceeds then user can not reassign the clickCount because its encapsulated.
```