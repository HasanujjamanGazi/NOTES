## FETCH API

> Own method of js to call API.

```javascript
fetch("https://randomuser.me/api/")
  .then((rawdata) => {
    return rawdata.json();
  })
  .then((data) => {
    console.log(data.results[0].name);
    // sample
    // { title: 'Mrs', first: 'Isla', last: 'Latt' }
  })
  .catch((err) => {
    console.log(err);
  });
```