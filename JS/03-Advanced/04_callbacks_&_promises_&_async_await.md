## CALLBACK

> When a we pass a function as an argumnent to a function to be called upon fulfiling certain criteria then the function pass as argument is called as callback function.

```javascript
// In reality this function will stay in library.
function getProfile(username, callback) {
    let user = `${username}@gmail.com`;
    callback(username);
}

// What we will write.
getProfile("panna", function(data){
    console.log(data);
})
```

## PROMISES

> Promises are a functions that only return two states `resolve` or `reject` & it will be in pending status till it got any result.

```javascript
const pr = new Promise(function (res, rej) {
  setTimeout(() => {
    let num = Math.random * 10;
    if (num > 5) res("resolved ==> " + num);
    else rej("Rejected ==> " + num);
  }, 1000);
});

pr.then(function (val) {
  console.log(val);
}).catch(function (err) {
  console.log(err);
});
```

## ASYNC & AWAIT

> `async` before a function makes the function run side by side the main code without interupting it and give its output when resolved.</br>
> We always wait for resolving of a unpredictable return. So we attach `await` before using it.Because we dont know when it will resolve.

```javascript
const pr = new Promise(function (res, rej) {
  setTimeout(() => {
    let num = Math.random * 10;
    if (num > 5) res("resolved ==> " + num);
    else rej("Rejected ==> " + num);
  }, 1000);
});

// It is adviced to keep things inside try-catch in an `async function`
async function abcd() {
  try {
    let val = await pr;
    console.log(val);
  } catch (error) {
    console.log(error);
  }
}
```

### CALLBACK HELL

> DB

```javascript
// DATABASE
const profile = {
  profileList: ["ab", "bc", "cd", "de", "ef", "f0"],
  ab: {
    username: "a@b",
    _id: 1,
    post: [
      { status: "saved", postInfo: { likes: 12, tag: "private" } },
      { status: "not_saved", postInfo: { likes: 345, tag: "private" } },
      { status: "not_saved", postInfo: { likes: 45, tag: "private" } },
      { status: "saved", postInfo: { likes: 867, tag: "private" } },
      { status: "not_saved", postInfo: { likes: 24, tag: "private" } },
    ],
  },
  bc: {
    username: "b@c",
    _id: 2,
    post: [
      { status: "saved", postInfo: { likes: 85, tag: "public" } },
      { status: "saved", postInfo: { likes: 84, tag: "public" } },
      { status: "not_saved", postInfo: { likes: 62, tag: "private" } },
      { status: "not_saved", postInfo: { likes: 54, tag: "private" } },
      { status: "saved", postInfo: { likes: 74, tag: "public" } },
    ],
  },
  cd: {
    username: "c@d",
    _id: 3,
    post: [
      { status: "not_saved", postInfo: { likes: 18, tag: "private" } },
      { status: "not_saved", postInfo: { likes: 84, tag: "private" } },
      { status: "not_saved", postInfo: { likes: 37, tag: "private" } },
      { status: "saved", postInfo: { likes: 723, tag: "private" } },
      { status: "saved", postInfo: { likes: 56743, tag: "private" } },
    ],
  },
  de: {
    username: "d@e",
    _id: 4,
    post: [
      { status: "not_saved", postInfo: { likes: 245, tag: "private" } },
      { status: "saved", postInfo: { likes: 5634, tag: "public" } },
      { status: "saved", postInfo: { likes: 63, tag: "public" } },
      { status: "saved", postInfo: { likes: 74, tag: "public" } },
      { status: "saved", postInfo: { likes: 757, tag: "private" } },
    ],
  },
  ef: {
    username: "e@f",
    _id: 5,
    post: [
      { status: "not_saved", postInfo: { likes: 6232, tag: "private" } },
      { status: "saved", postInfo: { likes: 8453, tag: "private" } },
      { status: "saved", postInfo: { likes: 74, tag: "private" } },
      { status: "saved", postInfo: { likes: 33, tag: "private" } },
      { status: "saved", postInfo: { likes: 856, tag: "private" } },
    ],
  },
  f0: {
    username: "f@0",
    _id: 6,
    post: [
      { status: "saved", postInfo: { likes: 67, tag: "public" } },
      { status: "not_saved", postInfo: { likes: 345, tag: "public" } },
      { status: "saved", postInfo: { likes: 97, tag: "public" } },
      { status: "not_saved", postInfo: { likes: 75, tag: "private" } },
      { status: "saved", postInfo: { likes: 24, tag: "public" } },
    ],
  },
};
```

> LIBRARY

```javascript
// LIBRARY
function getData(profile, cb) {
  console.log("Fetching The Whole Data Set...");
  setTimeout(() => {
    console.log(profile);
    cb(profile.profileList);
  }, 1000);
}

function getProfile(users, cb) {
  console.log("Fetching User Data...");
  setTimeout(() => {
    console.log(users);
    let randomUser = Math.floor(Math.random() * 6);
    let userProfile = profile[users[randomUser]];
    cb(userProfile);
  }, 2000);
}

function getPost(userProfile, cb) {
  console.log("Fetching Post...");
  setTimeout(() => {
    console.log(userProfile._id);
    console.log(userProfile.username);
    let randomPost = Math.floor(Math.random() * 5);
    cb(userProfile.post[randomPost]);
  }, 3000);
}

function getPostInfo(post, cb) {
  console.log("Fetching Post Likes...");
  setTimeout(() => {
    console.log(post.status);
    console.log(post);
    cb(post.postInfo);
  }, 4000);
}
```

> SERVER

```javascript
// CALLBACK HELL // PYRAMID OF DOOM
getData(profile, function (users) {
  getProfile(users, function (userProfile) {
    getPost(userProfile, function (post) {
      getPostInfo(post, function (postInfo) {
        console.log("Likes: " + postInfo.likes);
        console.log("Tag: " + postInfo.tag);
      });
    });
  });
});
```

### HOW .THEN .CATCH SOLVES CALLBACK HELL PROBLEM

> This is how the old js solved the callback hell problem then.

> LIBRARY

```javascript
// LIBRARY
function getData(profile) {
  console.log("Fetching The Whole Data Set...");
  return new Promise((resolve) => {
    setTimeout(() => {
      console.log(profile);
      resolve(profile.profileList);
    }, 1000);
  });
}

function getProfile(users) {
  console.log("Fetching User Data...");
  return new Promise((resolve) => {
    setTimeout(() => {
      console.log(users);
      let randomUser = Math.floor(Math.random() * 6);
      let userProfile = profile[users[randomUser]];
      resolve(userProfile);
    }, 2000);
  });
}

function getPost(userProfile) {
  console.log("Fetching Post...");
  return new Promise((resolve) => {
    setTimeout(() => {
      console.log(userProfile._id);
      console.log(userProfile.username);
      let randomPost = Math.floor(Math.random() * 5);
      resolve(userProfile.post[randomPost]);
    }, 3000);
  });
}

function getPostInfo(post) {
  console.log("Fetching Post Likes...");
  return new Promise((resolve) => {
    setTimeout(() => {
      console.log(post.status);
      console.log(post);
      resolve(post.postInfo);
    }, 4000);
  });
}
```

> SERVER

```javascript
// SERVER
getData(profile)
  .then(getProfile)
  .then(getPost)
  .then(getPostInfo)
  .then((postInfo) => {
    console.log("Likes:", postInfo.likes);
    console.log("Tag:", postInfo.tag);
  })
  .catch(console.error);
```

### HOW `ASYNC` & `AWAIT` SOLVES CALLBACK HELL PROBLEM

> LIBRARY

```javascript
// REFINED LIBRARY CODE
function getData(profile) {
  return new Promise((resolve) => {
    console.log("Fetching The Whole Data Set...");
    setTimeout(() => resolve(profile.profileList), 1000);
  });
}

function getProfile(users) {
  return new Promise((resolve) => {
    console.log("Fetching User Data...");
    setTimeout(() => {
      let randomUser = Math.floor(Math.random() * users.length);
      resolve(profile[users[randomUser]]);
    }, 2000);
  });
}

function getPost(userProfile) {
  return new Promise((resolve) => {
    console.log("Fetching Post...");
    setTimeout(() => {
      let randomPost = Math.floor(Math.random() * userProfile.post.length);
      resolve(userProfile.post[randomPost]);
    }, 3000);
  });
}

function getPostInfo(post) {
  return new Promise((resolve) => {
    console.log("Fetching Post Likes...");
    setTimeout(() => resolve(post.postInfo), 4000);
  });
}
```

> SERVER

```javascript
// SERVER
async function run() {
  try {
    const users = await getData(profile);
    const userProfile = await getProfile(users);
    const post = await getPost(userProfile);
    const postInfo = await getPostInfo(post);

    console.log("Likes:", postInfo.likes);
    console.log("Tag:", postInfo.tag);
  } catch (err) {
    console.error(err);
  }
}

run();
```