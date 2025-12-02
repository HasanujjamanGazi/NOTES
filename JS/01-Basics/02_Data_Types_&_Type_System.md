# JS - PRIMITIVES & NON PRIMITIVES

### TYPE OF (OPERATOR)

> Returns the data type of the value.

```javascript
typeof "Panna Gazi";    // str
```

## PRIMITIVES #7

### NULL

> A primitive value representing the absence of object.

> Use when u want something with no value.

```javascript
const myValue = null;
```

### NUMBER

> Representing a mathematical value.

```javascript
const myNumber1 = 123;
const myNumber2 = 12.3;
```

### BOOLEAN

> A datatype representing TRUE / FALSE.

```javascript
const myBool1 = true;
const myBool2 = false;
```

### BIGINT

> There is a limit in storing number values in a variable i `bits` number larger can produce errors i code so they are set as `BigInt`.

```javascript
const val = 982347918732495n;
const val = BigInt(198237498123948719834791);
```

#### MAX_SAFE_INTEGER

```javascript
let maxInt = Number.MAX_SAFE_INTEGER    // 9007199254740991
```
> Number larger than `MAX_SAFE_INTEGER` should be stored as `BigInt` as it may cause code error.

```javascript
const myBigInt1 = BigInt(1234567890123456789012345);
const myBigInt2 = 1234567890123456789012345;
```

### STRING

> A chain of characters enclosed in quotes.

```javascript
const str = "Hasanujjaman Gazi !";
```

### SYMBOL

> A unique and primitive identifier.

```javascript
const obj = {
    'uid': 1234.
    'firstName': "panna",
    'lastName': "gazi"
}
// Want to add **uid** without changing the internal value. Used when external library's objects need some tweaks.
// obj['uid'] = 6345   // will update
obj[Symbol(uid)] = 6457    // add new value.
```

### UNDEFINED

> A primitive value representing **no assigned value**.

> Don't use it yourself to differentiate your null value & undefined itself.

```javascript
const myValue = undefined;
```

## NON PRIMITIVES / REFERENCE #1

### OBJECTS

> A collection of key & value pairs.

```javascript
const obj = {
    'name': "Panna Gazi",
    'isDev': true,
    'rank': 0,
    'skill': ["ctrl + c", "ctrl + v"],
    'hobbies': null,
    'normalHumanBehavior': undefined,
}
```

## DYNAMIC TYPING

> JS is a dynamically typed language.

> We can store any data type in a variable.

## DATA TYPES NOTES

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
