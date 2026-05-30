# JS

## CONTROL FLOW

### IF - ELSE

```javascript
if (condition) {
    //Do
} else if (condition) {
    // DO
    // We can add as much else if as we want.
} else {
    // DO
}
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
