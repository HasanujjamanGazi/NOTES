# JS - FUNCTIONS

> We can get the length of functions with the `length` property.</br>
> The length of functions is the number of parameters it has.

```javascript
function abcd(a, b) {
    // Do
}
abcd.length    // 2
```

### FUNCTIONS (LEGACY)

```javascript
//  CREATION
function functionName(params) {
  // DO SOMETHING;
  return; // SOMETHING
};

// CALL FUNCTION
functionName(params);
```

> In JavaScript, we can create a function without a name.

```javascript
// You can use this function as a parameter of another function.
function () {
    // DO SOMETHING;
};
```

> In JavaScript, functions can be assigned to variables just like values.

```javascript
const greet = function () {
    console.log("Hello my dear");
};
// Now you can call the function by the variable it is assigned to.
```

---

### ARROW FUNCTION

> In a regular arrow function, `{ }` creates a function block - so you must use `return` to give back a value.

> In a shorthand arrow function, `{ }` are not used - **JS automatically returns the expression after the arrow**.

```javascript
// Long arrow function
const greet = (params) => {
    // DO SOMETHING;
    // RETURN SOMETHING; (OPTIONAL)
};
```

```javascript
// Shorthand arrow function
const greet = (a, b) => a + b
// Here a + b will br returned automatically.
```

---

### IIFE (IMMEDIATELY INVOKED FUNCTION EXPRESSION)

> Used to create private variable.

```javascript
// Do not give name of the function
(function () {
    // Do Something
})();
```

---

### HIGHER ORDER FUNCTIONS

> A function that is either taking another function as argument or returning a function or may be both.

<!-- ```javascript
function abcd() {
    return function () {
        // Do;
    }
};

abcd()();
// abcd() is returning a function then its invoked
``` -->

```javascript
function calc_discount(discount) {
  return function (price) {
    return price - price * (discount / 100);
  };
}

let counter = calc_discount(10);
// This is a higher order function that takes a percentage of discount & return a function that return the discounted price.
counter(100);
```

---

### CLOSURES

> A function that returns a functions & in the returned function a variable of parent function is used.

```javascript
function abcd() {
  let a = 12;
  return function () {
    console.log(a);
  };
}

let print = abcd();
print();
```

---

### PURE & IMPURE FUNCTIONS

#### PURE FUNCTIONS

> Functions that *doesn't changes any outer value*.

```javascript
let a = 23;

function do() {
    console.log(a);
    // Not changing any value
}
```

#### IMPURE FUNCTIONS

> Functions that *changes any outer value*.

```javascript
let a = 23;

function do() {
    a++;
    // changing the value
    console.log(a);
}
```
