# JS

## ARRAY METHODS

### TOSTRING

```javascript
// Makes the array to a string.
let lst = [1, 2, 3, 4];
lst.toString();     // "1, 2, 3, 4"
```

### JOIN

> `join()` converts all elements of an array into a single string, separated by a specified delimiter.

```javascript
let lst = [1, 2, 3, 4];
lst.join("_");     // "1_2_3_4"
```

### POP

> `pop()` method pop out the last element of the array & **changes the original array**.

```javascript
let lst = [1, 2, 3, 4];
lst.pop();     // [1, 2, 3]
```

### PUSH

> `push()` method add the element to the last & **returns the length of the array**

>**Changes the original array**.

```javascript
let lst = [1, 2, 3, 4];
len = lst.push(100);     // 5 // [1, 2, 3, 4, 100]
```

### SHIFT

> Removes the first element & returns it.

> Changes the original array.

```javascript
let lst = [1, 2, 3, 4];
firstElement = lst.shift();     // 1 // [2, 3, 4]
```

### UNSHIFT

> Add the element at the start & returns length.

> Changes the original array.

```javascript
let lst = [1, 2, 3, 4];
firstElement = lst.unShift(100);     // 5 // [100, 2, 3, 4]
```

### DELETE (Its an operator)

> Deletes the array element & Changes the original array.

```javascript
let lst = [1, 2, 100, 3, 4];
delete lst[2];    // [1, 2, 3, 4]
```

