## EVENT LISTENER

### ADD

> Pass the event name as a string & a callback that will run on the event.

```javascript
let item = document.querySelector("h1");
item.addEventListener("Event Name", function () {
  // Do Something.
});

// OR
function eventFunction() {
  // Do Something;
}
item.addEventListener("Event Name", eventFunction); // Dont't call it here like eventFunction() ❌
```

### REMOVE

> Pass the name of the event as string & pass the exact added callback function.

```javascript
let item = document.querySelector("h1");

function eventFunction() {
  // Do Something;
}
item.removeEventListener("Event Name", eventFunction); // Dont't call it here like eventFunction() ❌
```
### CAPTURING PHASE

> Event listeners runs in two phases. **capturing phase** & **bubbling phase**.

> When a event occurs JS always checks all of its parents first from upper to lower if the capture phase is on or not (By default its always off). If its off then it will check its children till the target of the event & start bubbling phase. But if some element's event listener is set to capturing phase on then it will run first.

```javascript
// EXAMPLE - CAPTURING PHASE OFF
<div class="a">
  <div class="b">
    <div class="c"></div>
  </div>
</div>
```

> If event occur in `C` then in capturing phase JS always checks in `A > B > C` order if capturing phase on or not. If not then it will enter bubbling phase. So the event listeners will run in `C > B > A` order.

```javascript
// EXAMPLE - CAPTURING PHASE ON
<div class="a">
  <div class="b">
    <div class="c">
      <div class="d"></div>
    </div>
  </div>
</div>
// Let's say the capturing phase is on for 'B'
```
> JS checks if capturing phase is true
>
> Phase 1(Capturing):</br>
> For A => false => NO</br>
> For B => true => RUN</br>
> For C => false => NO</br>
></br>
> Phase 2(Target):</br>
> For D => Just Run</br>
></br>
> Phase 3(Bubbling):</br>
> For C => false => RUN</br>
> For B => false => NO</br>
> For A => false => RUN</br>

#### HOW TO ON CAPTURING PHASE

```javascript
document.addEventListener("click", function () {
  // Do Something;
}, true);   // Give the option value TRUE.
```

### BUBBLING PHASE

> When an event occurs in a children element & there is no event listener then it searches for event listener in the parent element till the `HTML` element.

> Even if the element have event listener it will go to the parents run the event listeners.

> If we want to set event listener for multiple children then we just add one event listener to the parent element an toggle something through the `target`.

In the following example we wanted when ever someone click on the `li` then it become strickthrough. So instead of adding event listener to all the `li` we added one event listener to the `ul` so that through `Event Bubbling` all the `li` inherit it.

```javascript
// USE
<ul>
  <li></li>
  <li></li>
  <li></li>
</ul>;

const lst = document.querySelector("ul");
lst.addEventListner("click", function (evt) {
  evt.target.classList.toggle("line-though");
});
```

#### IMP

> We can select one element & click on it through JS.

```javascript
const item = document.querySelector("button");
item.click(); // It will run a click event on it.
```
