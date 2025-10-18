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

## TERNARY OPERATOR

> Shorthand for the if-else statement.

```javascript
// (condition) ? expression1 : expression2;
let id = age >= 18 ? "Adult" : "Minor";
```

## SWITCH CASE

> Switch takes one expression & matches it with all the cases and whenever a case is matched then it executes the rest of the code.

> `break;` is a statement that break out a switch statement. If you not use break after one case matched it will execute all the code after that even if their case is not matched.

```javascript
switch (new Date().getDay()) {
  case 0:
    day = "Sunday";
    break;
  case 1:
    day = "Monday";
    break;
  case 2:
    day = "Tuesday";
    break;
  case 3:
    day = "Wednesday";
    break;
  case 4:
    day = "Thursday";
    break;
  case 5:
    day = "Friday";
    break;
  case 6:
    day = "Saturday";
}
```
