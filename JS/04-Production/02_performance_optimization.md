## PERFORMANCE OPTIMIZATION

### DEBOUNCE

> Debounce ensures that a function runs only once after repeated actions stop, instead of running on every action.

> When a user is typing in a search box, debounce waits until the user stops typing, then runs the search.

```javascript
// Debounce
function debounce(fnc, delay) {
  let timer;
  return function (...args) {
    clearTimeout(timer);
    timer = setTimeout(function () {
      fnc(...args);
    }, delay);
  };
}
```

> In input eventlistener instead of giving a function we will givee this debounce Function and give the function as the argument of debounce function.

> In a debounce function, we create a timer variable and return a function that is used in an event listener.</br>
> Every time this returned function is called, we clear the previous timeout and set a new timeout with a fixed delay.</br>
> If the function is called again before the delay finishes, the old timeout is cleared and the action does not run.</br>
> The action is executed only when no new calls happen during the delay, meaning the action runs after the activity stops.</br>

### THROTLE

> Nothing to do with action it will execute the function in an fixed interval.

```javascript
function throttle(fnc, delay) {
  let timer = 0;
  return function (...args) {
    let now = Date.now();
    if (now - timer >= delay) {
      timer = now;
      fnc(...args);
    }
  };
}
```

### LAZY LOADING

> In this method we only render the part which is visible to user. And as the parts are coming in the viewport then load. It optimizes the site a little bit.

```javascript

```