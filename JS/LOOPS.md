# JS

## LOOPS

### FOR (Legacy)

```javascript
for (let i = 0; i < 5: i++;) {
    console.log("Legacy");
}
```

### FOR IN

> This is used to iterate over **keys** of iterable.

```javascript
for (const key in object) {
  console.log(`${key} : ${object[key]}`);
}
```

### FOR OF

> This is used to iterate over **values** of iterable.

> It doesn't works with **objects**.

```javascript
for (const value of array) {
  console.log(value);
}
```

### FOR EACH

> This is a array method used to iterate through arrays.

```javascript
let lst = ['h', 'e', 'l', 'l', 'o'];
############# PENDING #############
```

### WHILE

```javascript
let flag = 0;
while (flag < 100) {
  // DO THIS
  flag++;
}
```

### DO WHILE

> This loop executes the inner code once before checking the condition.

```javascript
let flag = 0;
do {
    // DO THIS ONCE THEN CHECK CONDITION
} while (condition);
```
