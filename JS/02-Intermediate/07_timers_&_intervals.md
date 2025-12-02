## TIMERS & INTERVALS

> `setTimeOut` takes a callback function & time in milisecond. Then it executes the callback function after the specified time.

```javascript
const delay = setTimeout(() => {
  // Do Something
}, 5000);

// clearTimeout(delay);
// To clear the timer.
```

> `setInterval` takes a callback function & time in miliseconds. Then it keeps executing the callback function in that time interval.

```javascript
const interval = setInterval(() => {
  // Do Something;
}, 3000);

// clearInterval(interval);
// To clear the interval.
```
