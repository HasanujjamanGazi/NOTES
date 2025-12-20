# GSAP

## METHODS

### GSAP TO

> `gsap.to` takes to argument the selector & a object `{}` with all the css & gsap property.</br>
> Initial (default) ==> Final (specified).

```javascript
// EXAMPLE
gsap.to("#box", {
    x: 1200,
    duration: 2,
    delay: 1,
    borderRadius: "50%",
    rotate: 360,
    backgroundColor: "#7132CA",
})
```

### GSAP FROM

> `gsap.from` takes to argument the selector & a object `{}` with all the css & gsap property.</br>
> Final (specified) ==> Initial (default).

```javascript
// EXAMPLE
gsap.from("#box", {
    x: 1200,
    duration: 2,
    delay: 1,
    borderRadius: "50%",
    rotate: 360,
    backgroundColor: "#7132CA",
})
```

### TIMELINE

> It creates a timeline and when we create add animation with that timeline then all the animation will be executed one after another.

```javascript
const tl = gsap.timeline();

// Here the animation of box-1 will be executed first then box2 just after that.

tl.from("#box1", {
    x: 1200,
    duration: 2,
    delay: 1,
    borderRadius: "50%",
    rotate: 360,
    backgroundColor: "#7132CA",
})

tl.from("#box2", {
    x: 1200,
    duration: 2,
    delay: 1,
    borderRadius: "50%",
    rotate: 360,
    backgroundColor: "#7132CA",
})
```

 