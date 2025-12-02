## FORM HANDLING

> 1. Stop the form to reload on submit (prevent default).
> 2. Add inline checks for form for valid data with `required`, `pattern` attribute (although it can be bypassed).
> 3. Use regex in js to get a valid input.
> 4. All this front-end code can be bypassed so we have to add validators at back-end as well as in the database.

```javascript
// HTML
<form>
  <input required pattern="[a-z_]{3,20}" type="text" name="username" />
  <input required type="email" />
  <input required type="password" />
  <input type="submit" />
</form>

// JS
const form = document.querySelector("form");
const username = document.querySelector("input[name='username']");
const email = document.querySelector("input[type='email']");
const password = document.querySelector("input[type='password']");

form.addEventListener("submit", function (evt) {
  evt.preventDefault();
  // Preventing form reload on submit.
  
  // REGEX code for valid inputs.
  const usernameRegex = /^[a-zA-Z0-9_]{3,16}$/;
  const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

  // Validate
  console.log(
    usernameRegex.test(username.value),
    emailRegex.test(email.value),
    passwordRegex.test(password.value),
  );
});
```
