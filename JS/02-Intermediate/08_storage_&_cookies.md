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
