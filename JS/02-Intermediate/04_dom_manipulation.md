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
