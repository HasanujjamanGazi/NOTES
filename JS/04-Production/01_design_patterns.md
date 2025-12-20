## MODULE PATTERN

> In this coding pattern we have to write every thing in an IIFE and only give access to those what is meant to be accessible publically.

```javascript
const Bank = (function () {
  let bankBalance = 230000;

  function checkBalance() {
    console.log(bankBalance);
  }

  function withdraw(val) {
    if (val <= bankBalance) {
      bankBalance -= val;
      console.log(bankBalance);
    } else {
      console.error("Invalid Amount!");
    }
  }

  function setBalance(val) {
    bankBalance = val;
    console.log(bankBalance);
  }

  return {
    checkBalance,
    withdraw,
    setBalance,
  };
})();
```


### IIFE

> Immediately Invoked Function Expression.</br>
> With this we can create private variables and secure our environment.

```javascript
// This function is immediately invoked by itself.
let fnc = (function () {
  // Do Something
})()
```

## REVEALING MODULE PATTERN

> In module pattern we return all as the name as it is.

```javascript
// Like This
return {
  checkBalance,
  withdraw,
  setBalance,
};
```

> But in revealing module pattern we rename the functions or returns.

```javascript
// Like This
return {
  check: checkBalance,
  draw: withdraw,
  set: setBalance,
};
```

## FACTORY FUNCTION PATTERN

> In this pattern we can create a function to create large number of objects with similar features.</br>
> We create a function that returns a object. When we create objects with that function all the objects will be unique.

```javascript
function createProduct(name, price) {
  let stock = 12;
  return {
    name,
    price,
    stock,
    buy: function (qty) {
      if (qty <= stock) {
        stock -= qty;
        console.log(`${qty} bought ${stock} left.`);
      } else {
        console.error("Stock out of range !");
      }
    },
    checkStock: function () {
      console.log(`${stock} left`);
    }
  }
}

const iphone = createProduct("iphone", 70000);
const kitkat = createProduct("kitkat", 10);

iphone.buy(3);    // 3 bought 9 left.
kitkat.buy(5);    // 5 bought 7 left.
// Now the Iphone stock is 9.
// Now the Kitkat stock is 7.
```

