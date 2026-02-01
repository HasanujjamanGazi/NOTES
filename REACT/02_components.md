## REACT COMPONENT

> In react we create al the parts of website as a component so that if somthing is updating then it should update only that component.

> We create components by creating a separate function and returning the a part of website.

```javascript
import React from 'react'

const App = () => {
  return (
    <>
        <h1>HASANUJJAMAN GAZI</h1>
    </>
  )
}

export default App
```

> Now it can be acessed from other files thrugh importing it.

```javascript
import App from './App.jsx'
```

## PROPS DRILLING

When we have a component that repeats many times on a website, but the data inside each one is different, we use props to pass data to it.

First, we usually create an array of data (objects).
Then we loop through the array (using `map`) and create the same component again and again.

While creating each component, we send the required data as props.
Inside the component, we receive those props and display the data.

This process of passing data from a parent component to child components using props is called props drilling.

> We can pass data like this...... In the form of JSX. Its nothing its just giving arguments to a function then we can access it from the card component or you can say card function.

```javascript
import React from 'react'

const App = () => {
  return (
    <>
        <Card user="panna"/>
    </>
  )
}

export default App
```

> This props drilling will support only passing value in the parent to child flow.

