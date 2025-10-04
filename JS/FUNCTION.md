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

```javascript
const greet = (params) => {
    // DO SOMETHING;
};
```