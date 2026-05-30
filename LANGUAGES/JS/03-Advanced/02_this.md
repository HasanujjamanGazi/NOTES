## THIS

> `this` keyword holds dynamic value. In different places it holds different value.

```javascript
// Global Scope ==> Window
// Function ==> Window

// Method ==> Object
const obj = {
    name: "panna",
    myFunc: function (){
        console.log(this);      // obj
    }
}

// Event handler ==> Element, event listener is added to
document.querySelector("h1")
.addEventListener("click", function (){
    console.log(this);          // <h1></h1>
})

// Class ==> Blank Object
```

> Arrow functions always take the value of `this` from their parent.</br>

## THIS METHODS (CALL APPLY BIND)

### CALL

> We can set a the value of `this` is a particular place.

```javascript
let obj = {
    name: "panna",
    age: 123,
    role: "dev",
}

function abcd(a, b, c, d) {
    // this ==> window (inside function)
    console.log(this.name, a, b, c, d);
}

abcd.call(obj, 1, 2, 3, 4);
// First parameter is value of `this` rest is default arguments
```
> Now the value of `this` of `abcd()` is `obj` object.

### APPLY

> Works same as `call` but just it takes all the default arguments in a array.

```javascript
abcd.apply(obj, [1, 2, 3, 4]);
```

### BIND

> Works more or less like `call` but instead of calling the function it returns a functions that have `obj` as the value of `this`.

```javascript
let fnc = abcd.bind(obj, 1, 2, 3, 4);
fnc();
```

