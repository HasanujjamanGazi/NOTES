# JS

## DOCUMENT

1. ### DOCUMENT ELEMENT
    ```javascript
    // Returns whole HTML document
    document.documentElement
    // Returns the head of the HTML
    document.head
    // Returns the body of the HTML
    document.body
    // Returns the title of the page
    document.title
    ```

2. ### DOCUMENT INFO
    ```javascript
    // Returns full URL of the page
    document.URL
    // Returns the domain name of the page
    document.domain
    // Returns the baseURI of a relative URL
    document.baseURI
    ```
3. ### DOCUMENT COLLECTIONS
    ```javascript
    // Collection of all scripts element
    document.scripts
    // Collection of all forms element
    document.forms
    // Collection of all images element
    document.images
    // Collection of all links element
    document.links
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
  if (card) { /* do something */ }
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
nodes.forEach(n => console.log(n.nodeType));

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

// Adds multiple child / text at the end
parent.append(...nodesOrStrings);

// Inserts a node before a existing child
// If referenceNode is null, acts like appendChild()
parent.insertBefore(newNode, referenceNode);

// Parses and inserts HTML text at a specific position relative to an element
// element.insertAdjacentHTML(position, htmlString);
element.insertAdjacentHTML("beforeend", "<p>Inserted!</p>");
const positions = {
  'beforebegin': "Before the element itself",
  'afterbegin': "Before the first child",
  'beforeend': "After the last child",
  'afterend': "After the element itself",
}
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
</div>

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

