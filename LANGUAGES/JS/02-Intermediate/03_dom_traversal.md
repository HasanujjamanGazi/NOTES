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
