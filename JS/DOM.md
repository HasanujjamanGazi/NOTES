# JS

## DOCUMENT

1. ### DOCUMENT ELEMENT

   ```javascript
   // Returns whole HTML document
   document.documentElement;
   // Returns the head of the HTML
   document.head;
   // Returns the body of the HTML
   document.body;
   // Returns the title of the page
   document.title;
   ```

2. ### DOCUMENT INFO
   ```javascript
   // Returns full URL of the page
   document.URL;
   // Returns the domain name of the page
   document.domain;
   // Returns the baseURI of a relative URL
   document.baseURI;
   ```
3. ### DOCUMENT COLLECTIONS
   ```javascript
   // Collection of all scripts element
   document.scripts;
   // Collection of all forms element
   document.forms;
   // Collection of all images element
   document.images;
   // Collection of all links element
   document.links;
   ```
4. ### DOM READY EVENT

   ```javascript
   // Executes after the document is loaded
   document.addEventListener("DOMContentLoaded", () => {
     console.log("DOM is ready");
   });
   ```

   ```javascript
   // Executes after teh entire page is loaded
   window.addEventListener("load", () => {
     console.log("Page fully loaded");
   });
   ```

5. ### SCRIPT LOADING

   1. #### NORMAL

      ```html
      <!-- Browser stop parsing the HTML while loading script & loads after HTML loads usually. -->
      <script src="script.js"></script>
      ```

   2. #### ASYNCHRONOUSLY LOADING

      ```html
      <!-- 1. async
      Script downloaded parallel to HTML & executes as soon as downloaded.
      Scripts that don't depends on DOM -->
      <script src="script.js" async></script>
      <!-- 1. defer
      Script downloaded parallel to HTML & executes after the DOM is fully parsed.
      Scripts that depends on DOM -->
      <script src="script.js" defer></script>
      ```

## DOM SELECTION

### ELEMENT SELECTOR

```javascript
// By Id
const header = document.getElementById("main-header");

// By Class
// Support multiple --class--
const cards = document.getElementsByClassName("card");

// By Tag
const paragraphs = document.getElementsByTagName("p");

// By CSS selector
// Selects the first element only
const firstCard = document.querySelector(".card");

// By CSS selector
// Selects all the elements
const firstCard = document.querySelectorAll(".card");
```

Returns one element object with specific `ID` or `null`.

```javascript
const header = document.getElementById("header");
```

Returns a **Live** `HTMLCollection` with a particular class.

Can select element with multiple classes.

```javascript
const cards = document.getElementsByClassName("card");
```

Same as `getElementsByClassName` but it select by `tagName`.

```javascript
const paragraphs = document.getElementsByTagName("p");
```

Selects the first element matching the css selector.

Returns a single element object.

```javascript
const firstCard = document.querySelector(".card");
```

Select all the element the css selector.

Returns a **static** `NodeList`.

```javascript
const allCards = document.querySelectorAll(".card");
```

### HTML COLLECTION

> A **live** collection of DOM elements.

> Updates automatically if the DOM changes.

### NODE LIST

> A collection of **NODES**.

> can be live / static.

> `childNodes` creates a live node list & `querySelectorAll()` creates a static node list.

## DOM TRAVERSAL

### PARENT

```javascript
// If parent is document it returns document node
const el = document.querySelector(".item");
console.log(el.parentNode);

// Direct parent element (skips non element node)
const text = document.querySelector("p").firstChild;
console.log(text.parentElement.tagName); // "P"

// find nearest .card ancestor of a clicked element
document.addEventListener("click", (e) => {
  const card = e.target.closest(".card");
  if (card) {
    /* do something */
  }
});
```

### CHILDREN

`getElementsByTagName`, `getElementsByClassName`, `querySelectorAll` these are **descendants** only.

```javascript
// HTML Collection of children
const parent = document.getElementById("list");
console.log(parent.children[0]); // first child element

// Node List of children
const nodes = document.getElementById("para").childNodes;
nodes.forEach((n) => console.log(n.nodeType));

// First Child Node
const first = el.firstChild;

// Last Child Node
const last = el.lastChild;

// First Child Element (skips text/comments)
const firstEl = el.firstElementChild;

// Last Child Element (skips text/comments)
const lastEl = el.lastElementChild;

// Count of Children(element)
console.log(list.childElementCount);

// Checks if there is any child node or not
if (node.hasChildNodes()) {
  // iterate childNodes
}
```

### SIBLINGS

```javascript
// Immediate Next sibling Node
let n = el.nextSibling;

// Immediate Previous sibling Node
let n = el.previousSibling;

// Immediate Next sibling Element
let n = el.nextElementSibling;

// Immediate Previous sibling Element
let n = el.previousElementSibling;
```

## DOM MANIPULATION

### CREATION

> It just creates the html does not show it on the site. To show you have to append it.

```javascript
// CREATE ELEMENT NODE
const div = document.createElement("div");
div.id = "myDiv";
div.className = "container";

// CREATE TEXT NODE
const text = document.createTextNode("Hello World");

// CREATE COMMENT NODE
const comment = document.createComment("This is a dynamic comment");
```

### INSERTING

```javascript
// Append a `node` as last child
parent.appendChild(child);

// Prepend a `node` as first child
parant.prepend(child);

// Adds multiple child / text at the end
parent.append(...nodesOrStrings);

// Inserts a node before a existing child
// If referenceNode is null, acts like appendChild()
parent.insertBefore(newNode, referenceNode);

// Parses and inserts HTML text at a specific position relative to an element
// element.insertAdjacentHTML(position, htmlString);
element.insertAdjacentHTML("beforeend", "<p>Inserted!</p>");
const positions = {
  beforebegin: "Before the element itself",
  afterbegin: "Before the first child",
  beforeend: "After the last child",
  afterend: "After the element itself",
};
```

### REMOVING

```javascript
// Remove the node itself
// node.remove();
div.remove();

// Removes specific child from parent
parent.removeChild(child);
```

### REPLACING

```javascript
// Swap element with other
// Returns the removes node
// The new node must be created before replacing
parent.replaceChild(newDiv, oldDiv);
```

### CLONING

```javascript
<div id="box">
  <p>Hello</p>
</div>;

// Creates a copy of a existing node
// Takes parameter [true / false]

// true
// Copy the node & all its children nodes
const deepClone = box.cloneNode(true);
// <div id="box"><p>Hello</p></div>

// false
// Copy only the node without its children
const deepClone = box.cloneNode(false);
// <div id="box"></div>
```

### ATTRIBUTE MANIPULATION

```javascript
<div id="box">
  <a href="https://www.google.com">Link</a>
</div>;

let a = document.querySelector("a");
// To set a attribute
// Pass `attribute` & its value
a.setAttribute("href", "https://www.youtube.com/");

// To get the value of a attribute pass the attribute name
let b = a.getAttribute("href");

// To remove the attribute pass the atribute name
a.removeAttribute("href");
```

### STYLE MANIPULATION

```javascript
<h1>hello guys</h1>;

let h1 = document.querySelector("h1");
// Change style
h1.style.color = "gray";

// Add Class
h1.classList.add("my-class");
// Remove Class
h1.classList.remove("my-class");
// Toggle class ==> removes when exists / adds when doesn't exists.
h1.classList.toggle("my-class");
```

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

### COMMON EVENTS

#### CLICK

#### MOUSE ENTER

#### INPUT

#### INPUT

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

## FORM HANDLING

> 1. Stop the form to reload on submit (prevent default).
> 2. Add inline checks for form for valid data with `required`, `pattern` attribute (although it can be bypassed).
> 3. Use regex in js to get a valid input.
> 4. All this front-end code can be bypassed so we have to add validators at back-end as well as in the database.

```javascript
// HTML
<form>
  <input required pattern="[a-z_]{3,20}" type="text" name="username" />
  <input required type="email" />
  <input required type="password" />
  <input type="submit" />
</form>

// JS
const form = document.querySelector("form");
const username = document.querySelector("input[name='username']");
const email = document.querySelector("input[type='email']");
const password = document.querySelector("input[type='password']");

form.addEventListener("submit", function (evt) {
  evt.preventDefault();
  // Preventing form reload on submit.
  
  // REGEX code for valid inputs.
  const usernameRegex = /^[a-zA-Z0-9_]{3,16}$/;
  const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

  // Validate
  console.log(
    usernameRegex.test(username.value),
    emailRegex.test(email.value),
    passwordRegex.test(password.value),
  );
});
```

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

## STORAGE

### LOCAL STORAGE

> Its the storage of the browser. It stores data permanently. Data will still be there even you close the bowser then reopen it. It only deleted if you delete it.

> We can only store string data so we have to convert everything to string with `JSON.stringify()` & to parse the data use `JSON.parse()`.

```javascript
// CREATE
localStorage.setItem("name", "panna gazi");
// READ
const localNameValue = localStorage.getItem("name");
console.log(localNameValue);
// UPDATE
localStorage.setItem("name", "hasanujjaman gazi");
localStorage.setItem("age", "12");
// REMOVE
localStorage.removeItem("name");
// CLEAR - clear all that stored
localStorage.clear();
```

### SESSION STORAGE

> It stores data temporarily in the browser till user close the tab. Close the tab & data is gone.

```javascript
// Same as localStorage.
// Just remains till the tab is open.
```

### COOKIES

> It is similar to local storage but Its for small data.

> You can only store small amount of data.

> All data stored in cookies all sent to server on reload.

```javascript
document.cookie = "email=name@example.com";
```



<h1><center>NOTES</h1></center>

## DOM - DOCUMENT OBJECT MODEL

In JS everything is stored under the `window` object. All the variables, functions etc.

And everything on the HTML is stored inside the `document` object which stay inside the `window` object

## BOM - BROWSER OBJECT MODEL

Additional objects provided by the host environment(browser).

`alert`, `prompt`, `confirm` these are the part of BOM.

## DOM

> "The Document Object Model is a platform- and language-independent interface that allows programs and scripts to dynamically access and update the content, structure, and style of documents."

```javascript
// HTML → Parser → Tokens → DOM → Render Tree → Screen
```

## RENDERING LIFECYCLE

```javascript
// Parsing HTML → CSSOM & Style Calculation → Layout (Reflow) → Painting & Compositing → Dynamic Updates via JavaScript
```

## DOM NODES

There are 12 nodes in dom.

### ELEMENT NODE

> HTML element.

### ATTRIBUTE NODE

> Attribute of an HTML element.

### TEXT NODE

> Text Content of an HTML element.

### COMMENT NODE

> Comments in HTML file.

### DOCUMENT NODE

> Entire HTML document.

### DOCUMENT TYPE NODE

> <!DOCTYPE>

### DOCUMENT FRAGMENT NODE

> Lightweight container of a group of Nodes.

Rest of the nodes are for XML mainly/only
