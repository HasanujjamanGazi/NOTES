# JS - OPERATORS

### UNARY

> There is 6 unary operators `+ - ! typeof ++ --`.

```javascript
// + before any string coverts it to its number value.
+"5"    // Number.
+"hey"  // NaN

// - before any number make it negetive.
-5 // its the value negetive 5.

// ! returns the inverted type
!0  // false
!12 // true

// typeof returns the datatype
typeof 12   // Number

// Increment ++ Decrement --
let a = 2;
let b = 2;
console.log(a++);   // 2
console.log(a);     // 3
console.log(b--);   // 2
console.log(b);     // 1
// It returns the value of then operate.

let a = 2;
let b = 2;
console.log(++a);   // 3
console.log(--b);   // 1
// It operates then return the value.
```

### TERNARY

> In good practice devs only use this as assigning value.

> Don't use it as an alternative of `if-else`.

```javascript
// condition ? if true : if false
12 > 10 ? console.log("yes") : console.log("no")

// TERNARY CHAIN
let score = 78;
let grade = score >= 90 ? "A" : score >= 75 ? "B" : score >= 50 ? "C" : "D";    // B 
```
