# JS - ARRAY

<!-- ## ARRAY
 -->


## ARRAY - METHODS

### TOSTRING

```javascript
// Makes the array to a string.
let arr = [1, 2, 3, 4];
arr.toString(); // "1, 2, 3, 4"
```

### JOIN

> `join()` converts all elements of an array into a single string, separated by a specified delimiter.

```javascript
let arr = [1, 2, 3, 4];
arr.join("_"); // "1_2_3_4"
```

### POP

> `pop()` method pop out the last element of the array & **changes the original array**.

```javascript
let arr = [1, 2, 3, 4];
arr.pop(); // [1, 2, 3]
```

### PUSH

> `push()` method add the element to the last & **returns the length of the array**

> **Changes the original array**.

```javascript
let arr = [1, 2, 3, 4];
len = arr.push(100); // 5 // [1, 2, 3, 4, 100]
```

### SHIFT

> Removes the first element & returns it.

> Changes the original array.

```javascript
let arr = [1, 2, 3, 4];
firstElement = arr.shift(); // 1 // [2, 3, 4]
```

### UNSHIFT

> Add the element at the start & returns length.

> Changes the original array.

```javascript
let arr = [1, 2, 3, 4];
firstElement = arr.unShift(100); // 5 // [100, 2, 3, 4]
```

### DELETE (Its an operator)

> Deletes the array element & Changes the original array but `doesn't changes the array length`.

```javascript
let arr = [1, 2, 100, 3, 4];
delete arr[2]; // [1, 2, 3, 4]
```

### CONCAT

> It takes arrays as input & creates a new array merging all the arrays.

```javascript
let arr1 = [1, 2, 3, 4];
let arr2 = [11, 12, 13, 14];
let arr3 = [21, 22, 23, 24];
arr1.concat(arr2, arr3); // [1, 2, 3, 4, 11, 12, 13, 14, 21, 22, 23, 24]
```

### SORT

> This method changes the original array.

> By default, it sorts items in `lexicographic (dictionary)` order.

> Strings follow Unicode order - `'Zebra'` comes before `'apple'` because `'Z'` comes before `'a'` in Unicode.

```javascript
// COMMON
let numbers = [245, 5, 4, 7, 71, 14, 323, 6, 333, 156];
let fruits = ["apple", "coconut", "banana"];
let fruitsAndAnimals = ["apple", "coconut", "banana", "Zebra", "Apple"];
let users = [
  { name: "Bob", age: 22 },
  { name: "Alice", age: 30 },
  { name: "Charlie", age: 25 },
];
let products = [
  { name: "Banana", category: "Fruit", price: 50 },
  { name: "Carrot", category: "Vegetable", price: 30 },
  { name: "Apple", category: "Fruit", price: 40 },
  { name: "Potato", category: "Vegetable", price: 25 },
  { name: "Mango", category: "Fruit", price: 80 },
];
```

#### SIMPLE SORT - NUMBERS

```javascript
numbers.sort(); // [14, 156, 245, 323, 333, 4, 5, 6, 7, 71]
```

#### SIMPLE SORT - WORDS

```javascript
fruits.sort(); // ['apple', 'banana', 'coconut']
```

#### SIMPLE SORT - WORDS (UNICODE)

```javascript
fruitsAndAnimals.sort(); // ['Apple', 'Zebra', 'apple', 'banana', 'coconut']
```

#### NUMBERS SORT (ASCENDING)

```javascript
numbers.sort((a, b) => a - b);
// [4, 5, 6, 7, 14, 71, 156, 245, 323, 333]
```

#### NUMBERS SORT (DESCENDING)

```javascript
numbers.sort((a, b) => b - a);
// [333, 323, 245, 156, 71, 14, 7, 6, 5, 4]
```

#### COMPARE SORT - WORDS (CASE INSENSITIVE)

```javascript
fruitsAndAnimals.sort((a, b) => a.toLowerCase().localeCompare(b.toLowerCase()));
// ['Apple', 'apple', 'banana', 'coconut', 'Zebra']
```

#### COMPARE SORT - OBJECTS (BY PROPERTY)

```javascript
users.sort((a, b) => a.age - b.age);
// [
//   { name: 'Bob', age: 22 },
//   { name: 'Charlie', age: 25 },
//   { name: 'Alice', age: 30 }
// ]
```

#### COMPARE SORT - OBJECTS (BY MULTIPLE CRITERIA)

```javascript
products.sort(
  (a, b) => a.category.localeCompare(b.category) || a.price - b.price
);
// [
//   { name: 'Apple', category: 'Fruit', price: 40 },
//   { name: 'Banana', category: 'Fruit', price: 50 },
//   { name: 'Mango', category: 'Fruit', price: 80 },
//   { name: 'Potato', category: 'Vegetable', price: 25 },
//   { name: 'Carrot', category: 'Vegetable', price: 30 }
// ]
```

### REVERSE

> It reverses the original array.

```javascript
let arr = [1, 2, 3, 4];
arr.reverse();    // [4, 3, 2, 1]
```

### SPLICE

> `splice()` can remove any number of elements from any index & insert any number of new elements at that position.

> Modifies the original array & *returns the deleted items*.

```javascript
// arr.splice(start, deleteCount, items...);
let numbers = [1, 2, 3, 4, 5 , 6];
let delItems = numbers.splice(2, 3, 2020, 2021, 2022, 2023, 2024, 2025);
// [1, 2, 2020, 2021, 2022, 2023, 2024, 2025, 6]
console.log(delItems); // [3, 4, 5]
```

### FOR EACH

> This is a array method used to iterate through arrays.

> Takes value, index, array as input & loops through them

```javascript
let arr = [4, 5, 6, 7];
arr.forEach((value, index, arr) => {
  console.log(`${value ** 2} :: ${index} :: ${arr}`);
});
```

### ARRAY.FROM

> Used to create array from any other object.

```javascript
let name = "panna";
let arr = Array.from(name);    // ['p', 'a', 'n', 'n', 'a']
```

## HIGHER ORDER ARRAY METHOD

### MAP

> `map()` loops through an array, applies a function to each element, and **returns a new array** with the **results**.

```javascript
let arr = [4, 5, 6, 7];
let result = arr.map((value, index, arr) => value ** 2);
console.log(result);    // [16, 25, 36, 49]
```

### FILTER

> `filter()` loops through an array, *tests each element with a function*, and **returns a new array** with only the **elements that pass the test**.

```javascript
let arr = [34, 21, 2, 43, 1, 0, 52];
newArr = arr.filter((value, index, arr) => value < 10);
console.log(newArr)    // [2, 1, 0]
```

### REDUCE

> When making one value from a array.

> `reduce()` starts by taking the **1st** and **2nd** elements of the array and passes them into the callback function. The value returned from that callback becomes the `accumulated result (accumulator)`. Next, this accumulated value is used as the **"first"** value, and the 3rd element from the array becomes the **"second"** value. The callback is executed again with these two values. This process keeps repeating - the returned value from each step becomes the accumulator for the next one, while the next element from the array becomes the new input. After the callback has run for all elements, `reduce()` returns the final `accumulated` result.

```javascript
let arr = [1, 2, 3, 4, 5];
let result = arr.reduce((value1, value2) => value1 + value2);
console.log(result);    // 15
```

```javascript
// If we pass empty array
[].reduce((a, b) => a + b);
// ❌ TypeError: Reduce of empty array with no initial value

// If we pass empty array with initial value
[].reduce((a, b) => a + b, 0); // ✅ returns 0 safely

let arr = [1, 2, 3, 4, 5];
let result = arr.reduce((accumulator, val) => accumulator + val, 0);
console.log(result);    // 15
```

### FIND

> Takes a callback function & return the first value that matches the condition.

``` javascript
let arr = [1, 2, 3, 1, 4, 5];
arr.find((val) => val === 1)    // returns the first 1
```

### SOME

> It takes a callback function & checks if the condition matches even for one element to returns `true`.

```javascript
let arr = [34, 56, 78, 90];
arr.some((val) => val > 85)   // returns true because there is one 90
```

### EVERY

> It takes a callback function & checks if the condition if true for every element.

```javascript
let arr = [34, 56, 78, 90];
arr.some((val) => val > 10);  // true
```

## DESTRUCTURING

```javascript
let arr = [2, 5, 7, 8, 9];
let [a, b,, d] = arr;
// a = 2, b = 5, d = 8
```

## SPREAD

```javascript
let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
let arr2 = [...arr];
// It takes all the values and spreads them inside [], creating a new array.
// This is how we copy an array without keeping its reference — changes here won’t affect the original array.
```

