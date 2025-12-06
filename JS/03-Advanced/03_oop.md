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

```