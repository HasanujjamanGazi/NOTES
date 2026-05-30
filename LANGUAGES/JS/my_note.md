# JS

## JS LABEL

> A label provides a `identifier` to a statement or a block of code.

```javascript
labelName: statement;
labelName: {
  // Block of code
}
```

#### Use Case

```javascript
// Find the match
const arr1 = [1, 3, 5, 7];
const arr2 = [5, 11, 9];

// Use Case: OPTIMIZATION
loop1: for (let i = 0; i < arr1.length; i++) {
  loop2: for (let j = 0; j < arr2.length; j++) {
    if (arr1[i] === arr2[j]) {
      console.log("Matched: " + arr1[i]);
      break loop1; // Stop at Goal.
    } else {
      console.log(`${arr1[i]} -- ${arr2[j]}`);
    }
  }
}
```

> **In the above code we breaks out the all the loops when the goal is met. But if it is not done the will run to the last using unnecessary computation power.**
