## VARIABLES

> These are containers in which we can store value. It has a identifier.

```javascript
var myName = "Panna";
let age = 96;
const marks = [23, 345, 23 ,12];
```
> Difference between declaration & initialization.

```javascript
var myVar;      // Declaration
var myVar = 23  // Declaration & Initialization
```

## SCOPE

### GLOBAL SCOPE

> Not inside any block (Not inside any bracket).</br>
> Avalable everywhere.

### BLOCK SCOPE

> Inside a Block (Inside a second bracket).</br>
> Availble Only inside that block.

```javascript
{
    let value = 12;
}
```

### FUNCTIONAL SCOPE

> Inside a function.</br>
> Available inside the whole function.

```javascript
var a = 23;
// b is not available here
function () {
  var b = 12
  // a, b is available here.
}
```

## VARIABLES DECLARATION

> We can declare variables in 3 ways.

### VAR

> It adds the variable to the window object.</br>
> It is Fuction scoped.</br>
> It can be redeclared.</br>
> There is no **TDZ** in var.

```javascript
var num = 12;
var num = "panna";
// No error / Legit Code
```

### LET

> It can be reassigned but not redeclared.</br>
> It is block scoped.

```javascript
let num = 12;
let num = "panna";
// error / Not Legit Code ❌
```

### CONST

> It cannot be redeclared or reassigned.</br>
> But we can change value inside arrays & Objects.</br>

#### Temporal Dead Zone (TDZ)

> The area avobe where the variable is declared.(The area before the variable is decalred).</br>

#### HOISTING

> 