# JS NOTES

## SCOPE

> `var` is function scoped.

```javascript
var a = 23;
// b is not available here
function () {
  var b = 12
  // a, b is available here.
}
```

### LEXICAL SCOPING

> 

---

## TRUTHY & FALSY

> `!!` before anything tells returns its truthy or falsy nature.

```javascript
!!"panna"         // true
// Only false values in JS.
!!0               // false
!!""              // false
!!null            // false
!!undefined       // false
!!false           // false
!!document.all    // false
```

## DATA TYPES

> `+string` makes it a number if its a number or makes it `NaN`

```javascript
+"10"     // number
+"panna"  // NaN
```

---
<!-- ### TYPEOF & INSTANCEOF -->

> `typeof` returns the type. Used to return type of primitives.

> `instanceof` checks if the second operand is instance of first operand.

```javascript
typeof []     // Object
typeof null   // Object
typeof NaN    // Object
```

> So can't check if a variable is array / object ro not.

```javascript
let a = [];
let b = {};
a instanceof Array    // true
b instanceof Object    // true
```

---

