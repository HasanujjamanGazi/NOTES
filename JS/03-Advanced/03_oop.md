## OOPS - OBJECT ORIENTED PROGRAMMING

#### Raw Object Oriented Programming

```javascript
function CreateUser(name, age, color) {
  this.name = name;
  this.age = age;
  this.color = color;
}

CreateUser.prototype.company = "Higro";
CreateUser.prototype.write = function (text) {
  let msg = document.createElement("h1");
  msg.style.color = this.color;
  msg.textContent = text;
  document.body.appendChild(msg);
};

const user1 = new CreateUser("panna", 69, "#8ABEB9");
const user2 = new CreateUser("hasan", 69, "#F9B487");

user1.write("Hey dear are you busy ?");
user2.write("yes !");
user1.write("Oh ! Ok then ! Sorry !");
user2.write("Yeah don't disturb now !");
```

### CLASS

```javascript
class CreateUser {
  constructor(name, age, color) {
    this.name = name;
    this.age = age;
    this.color = color;
  }

  write(text){
    let msg = document.createElement("h1");
    msg.style.color = this.color;
    msg.textContent = text;
    document.body.appendChild(msg);
  }
}

const user1 = new CreateUser("panna", 69, "#8ABEB9");
const user2 = new CreateUser("hasan", 69, "#F9B487");

user1.write("Hey dear are you busy ?");
user2.write("yes !");
user1.write("Oh ! Ok then ! Sorry !");
user2.write("Yeah don't disturb now !");
```


### CLASS EXTENSION

> If we have to create another class that have all the features of previous class so we dont have to recode those. We can just extend the class and have all those features in the child class.

```javascript
class Admin extends CreateUser{
  constructor(name, age, color){
    super(name, age, color)
    this.role = "admin"
  }

  remove() {
    document.querySelector("h1").array.forEach((element) => {
      element.remove()
    });
  }
}
```

> `super()` is the constructor of the parent class. So we have to pass all those what it requires.

### INHERITANCE

> There is 2 types of inhertance. `class`ical inhertance & `prototypal` inhertance. In JS we have prototypel inheritance.

```javascript
const coffee = {
  color: "dark",
  drink: function (){
    console.log("drinking...");
  }
}

const americano = Object.create(coffee);
americano.taste = "bitter";
```