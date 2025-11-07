# MONGODB

> It's an non-relational NO-SQL (_Not only SQL_) database

> `Document` : Fundamental Unit (Like Row in SQL DB but flexible).
> </br> Its composed of fields: (key:value).
> </br> Its store data in JSON format (internally BSON).

```javascript
// EXAMPLE
{
  "_id": "12434",
  "name": "panna",
  "address": {
    "street": "streetName",
    "city": "cityName",
    "code": "123123"
  },
  "skills": ["python", "javascript", "mongodb"]
}
```

### DATA TYPES

## COMMANDS OF MONGOSH SHELL

```bash
# To start mongosh shell :
mongosh

# To list the data bases :
show dbs

# To show current database :
db

# To show the available collections in present db :
show collections

# Switch database :
# Creates new database if not available and make is in use.
use db_name
```

## CREATE

> `insertOne(data, options)`
> </br> `insertMany(data, options)`

```bash

```

## READ

> `find(filter, options)`
> </br> `findOne(filter, options)`

```bash

```

## UPDATE

> `updateOne(filter, data, options)`
> </br> `updateMany(filter, data, options)`
> </br> `replaceOne(filter, data, options)`

```bash

```

## DELETE

> `deleteOne(filter, options)`
> </br> `deleteMany(filter, options)`

```bash

```
```js

```