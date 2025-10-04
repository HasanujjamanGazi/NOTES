# JS

### STRING

```javascript
let str1 = "Hello My Dear.";
let str2 = 'Hello My Dear.';
// YOU CAN'T DO THIS
// let str2 = "Hello My Dear.';
```

### STRING LITERAL

> Template literals are used to include variables or expressions inside strings using ${ xxx } syntax.

```javascript
let phNumber = 7470000000;
let str = `My mobile number is ${phNumber}`;
```

### ESCAPE SEQUENCE

> Escape sequences are used to represent special characters inside a string.

```javascript
str = 'Jatin\'s Pen'
// Newline = \n
// Tab = \t
```

### STRING PROPERTY

> In JavaScript, properties are accessed without using parentheses.

> JavaScript strings have only one property. This is because a string is a **primitive** data type, and its `length` is stored directly with the primitive.  
> 
> When we use a **string method**, JavaScript temporarily wraps the **string primitive** in a **String object**, which provides access to all the string methods. After the method executes, the wrapper object disappears.


#### LENGTH

```javascript
let name = "Hasanujjaman Gazi";
name.length     // returns the length of the String
```

### STRING METHODS

> Methods in JavaScript are object functions called with parentheses.

#### UPPERCASE & LOWERCASE

```javascript
let name = "Hasanujjaman Gazi";
name.toUpperCase();     // returns the uppercase version of the string.
name.toLowerCase();     // returns the lowercase version of the string.
```
#### SLICE

```javascript
// Extracts substring from startIndex to end or endIndex if given.
let name = "panna";
name.slice(startIndex, endIndex);
```

#### REPLACE

```javascript
// Replace the first occurrence of a substring & return a new string.
let name = "Gazi Hasanujjaman Gazi";
name.replace("Gazi", "Pagi");   // Pazi Hasanujjaman Gazi
```

#### REPLACE ALL

```javascript
// Replace the all occurrence of a substring & return a new string.
let name = "Gazi Hasanujjaman Gazi";
name.replaceAll("Gazi", "Pagi");    // Pazi Hasanujjaman Pazi
```

#### TRIM

```javascript
// Removes white spaces from starting & ending.
let name = "    Hasanujjaman Gazi    ";
name.trim();    // "Hasanujjaman Gazi"
```

#### STARTSWITH & ENDSWITH

```javascript
// Checks if the strings starts / ends with the substring or not.
let name = "Hasanujjaman Gazi";
name.startsWith("Has");    // true
name.endsWith("Gaza");    // false
```

#### INCLUDES

```javascript
// checks if the substring is in the string or not.
let name = "Hasanujjaman Gazi";
name.includes("Gazi");    // true
```

#### INDEXOF & LASTINDEXOF
```javascript
// Returns the index of the first occurrence of param.
let name = "Banana";
name.indexOf("na");    // 2
// Returns the index of the last occurrence of param.
name.lastIndexOf("na");    // 4
```
