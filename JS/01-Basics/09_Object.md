# OBJECTS

> When we want ot store details about a thing we create objects & when we want to store similar informations we create arrays.

> Consist of key value pairs.

### SYNTAX

```javascript
let obj = {
  firstName: "hasanujjaman",
  lastName: "gazi",
}
```

### ACCESS

```javascript
let obj = {
  firstName: "hasanujjaman",
  lastName: "gazi",
}

obj[firstname];
obj.firstName;
```

> `obj[variable]` takes a variable in & search for it's value in the object. We can give exact value also.

> `obj.firstName` is a way to retrieve data of object.

```javascript
let obj = {
  firstName: "hasanujjaman",
  lastName: "gazi",
}

let a = "firstName";
obj[a];   // we can find data with a variable with this method.

// ❌ But we can't do this.
obj.a;
// We have to provide the actual name
obj.firstName;
```

> `Object.keys(obj)` returns a array of keys of the object.

> `Object.entries(obj)` returs a array of arrays containing key & value pairs.

```javascript
let obj = {
  user: "panna",
  age: 123,
  role: "dev",
}

Object.keys(obj)    // ["user", "age", "role"]
Object.entires(obj)    // [['user', 'panna'], ['age', 123], ['role', 'dev']]
```

### DEEP ACCESS

```javascript
let users = {
  name: "panna",
  address: {
    city: "Basanti",
    pin: 743312,
    location: {
      lat: 23.4,
      long: 87.5
    },
  },
}

users.address.location.lat;     // Deep Access
users?.address?.location?.lat;     // Optional Chaining
```

### DESTRUCTURING

```javascript
let users = {
  name: "panna",
  address: {
    city: "Basanti",
    pin: 743312,
    location: {
      lat: 23.4,
      long: 87.5
    },
  },
}

// Have to give the exact name of the variable as in the object.
let {lat, long} = users.address.location;
```

### ITERATION

> We can iterate through objects with for in loop.

```javascript
let obj = {
  user: "panna",
  age: 123,
  role: "dev",
}

for (let key in obj) {
  // obj.key ❌
  console.log(key, obj[key]);
}
```

### COPY OBJECTS

> objects can be copies with spread operator(`...`), `Object.assign()` & using `JSON.stringify`.

```javascript
// With spread operator
let obj = {
  user: "panna",
  age: 123,
  role: "dev",
}

let newObj = {...obj}   // Does not work with nested Objects

// With Object.assign()
newObj = Object.assing(obj)    // It coppies the obj    // Not used recently
newObj = Object.assing({hobbies: "coding"}, obj)    // It will be added to the newObj

// with JSON
let users = {
  name: "panna",
  address: {
    city: "Basanti",
    pin: 743312,
    location: {
      lat: 23.4,
      long: 87.5
    },
  },
}

newObj = JSON.parse(JSON.stringify(users));
// Used dor nested objects so they don't pass reference values.
```

### COMPUTED PROPERTIES

```javascript
let role = "admin";

let users = {
  name: "panna",
  [role]: true,
  address: {
    city: "Basanti",
    pin: 743312,
  },
};

console.log(users);
// {
//   name: 'panna',
//   admin: true,
//   address: { city: 'Basanti', pin: 743312 }
// }
```

### COMPARING OBJECTS

> Comparing two JS Objects always returns `FALSE`.

### CREATING PRIMITIVES AS OBJECTS

> Primitives can be declared as objects by the `new` keyword.

```javascript
let value1 = new String("Panna Gazi");      // object
let value2 = new Boolean(true);     // object
```
