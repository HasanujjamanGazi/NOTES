## DOM SELECTION

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
