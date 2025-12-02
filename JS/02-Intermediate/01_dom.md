## DOCUMENT

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
