# JS - LOOPS

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

```javascript
for (const key in arr) {
  console.log(key);    // It will still return the keys not the elements.
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

> Takes value, index, array as input & we can access them in loop

```javascript
let lst = [4, 5, 6, 7];
lst.forEach((value, index, arr) => {
  console.log(`${value ** 2} :: ${index} :: ${arr}`);
});
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
