## SCROLL-TRIGGER

> This is a pluign for `GSAP`. It allows the animation to be trigger through scrolling.</br>
> To use it we have to atach the cdn of scrolltrigger after the gsap cdn or install scrolltrigger in project.

```javascript
// EXAMPLE
gsap.from("#box", {
  x: 1200,
  duration: 2,
  delay: 1,
  borderRadius: "50%",
  rotate: 360,
  backgroundColor: "#7132CA",
  scrollTrigger: "#box",
});
```

### SCROLL-TRIGGER SPECIFIC PROPERTIES

```javascript
gsap.from("#box", {
  x: 1200,
  duration: 2,
  delay: 1,
  borderRadius: "50%",
  rotate: 360,
  scrollTrigger: {
    trigger: "#box", // Selector
    scroller: "body", // Upon scroll
    markers: true, // Shows markers in screen ==> Just for dev
    start: "top 80%", // Scroller start ==> when start of element met this point animation triggers.
    end: "top 20%", // Scoller end
    scrub: true, // It Makes the animation to start at scroller start & end at scroller end.
    // If we give scrub a value 1 to 5 then it makes the animation a lot smoother.
  },
});
```

### PIN

> When we use `pin` we have to set the scrolltrigger to its **parent**.

```javascript
gsap.to("page1 h2", {
  transform: "translateX:()",
  scrollerTrigger: {
    trigger: "#page",
    scroller: "body",
    markers: true,
    start: "top 0%",
    pin: true,
  },
});
```
