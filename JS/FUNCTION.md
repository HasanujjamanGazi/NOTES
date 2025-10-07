# JS

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