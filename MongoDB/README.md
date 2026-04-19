# 📌 MongoDB Module — NoSQL Queries, Aggregations & Data Exploration  
Comprehensive documentation of MongoDB exercises across Sprint 5

This directory contains all work developed for the **MongoDB module**, focused on exploring a NoSQL database using the *cine_app* dataset.  
The sprint covers document queries, filtering, sorting, aggregations, regex searches, and geospatial visualization.

The goal of this module is to demonstrate proficiency in:

- MongoDB CRUD operations  
- Aggregation pipelines  
- Query operators (`$match`, `$group`, `$or`, `$regex`, `$gte`, `$lte`, etc.)  
- Sorting, limiting, and filtering documents  
- Working with nested fields and arrays  
- Counting documents and grouping results  
- Basic geospatial visualization (theatres map)  
- Using MongoDB Compass and the Mongo shell  

---

## 🗂️ Folder Structure

```
MongoDB/
│
├── README.md
└── Sprint5_AnaClaudiaDaCosta.pdf     (full report with screenshots)
```

---

## 🧭 Overview of Sprint 5

### **1. Database Setup**
The sprint begins by creating the **cine_app** database and importing the provided collections:

- `movies`
- `comments`
- `users`
- `theatres`
- `sessions`

A total of **50,304 comments**, **23,500+ movies**, **185 users**, and **1,600+ theatres** were successfully imported.

---

## 🧪 Level 1 — Core Queries

### ✔️ 1. Retrieve the first two comments  
Sorted by date in ascending order using:

```js
db.comments.find().sort({ date: 1 }).limit(2)
```

### ✔️ 2. Count registered users  
```js
db.users.countDocuments()
```

Result: **185 users**

### ✔️ 3. Count theatres in California  
```js
db.theatres.countDocuments({ "location.address.state": "CA" })
```

Result: **169 theatres**

### ✔️ 4. Identify the first registered user  
Sorted by `_id`:

```js
db.users.find().sort({ _id: 1 }).limit(1)
```

### ✔️ 5. Count comedy movies  
```js
db.movies.countDocuments({ genres: "Comedy" })
```

Result: **7024 comedy films**

---

## 🧪 Level 1 — Additional Queries

### ✔️ Movies from 1932 that are either Drama or in French  
Using `$or` with array fields:

```js
db.movies.find({
  year: 1932,
  $or: [
    { genres: "Drama" },
    { languages: "French" }
  ]
})
```

### ✔️ US movies with 5–9 awards, produced between 2012–2014  
```js
db.movies.find({
  countries: "USA",
  "awards.wins": { $gte: 5, $lte: 9 },
  year: { $gte: 2012, $lte: 2014 }
})
```

---

## 🧪 Level 2 — Aggregations

### ✔️ 1. Count comments from users with the domain “gameofthrones”  
Using regex:

```js
db.comments.countDocuments({
  email: { $regex: /gameofthron\.es$/i }
})
```

Result: **22,841 comments**

### ✔️ 2. Count theatres per ZIP code in Washington DC  
Aggregation pipeline:

```js
db.theatres.aggregate([
  { $match: { "location.address.state": "DC" } },
  { $group: { _id: "$location.address.zipcode", Total_zipcode: { $sum: 1 } } }
])
```

---

## 🧪 Level 3 — Advanced Queries

### ✔️ 1. Movies directed by John Landis with IMDb rating between 7.5 and 8  
```js
db.movies.find({
  directors: "John Landis",
  "imdb.rating": { $gte: 7.5, $lte: 8 }
})
```

### ✔️ 2. Map visualization of all theatres  
Using MongoDB Compass geospatial view to plot theatre coordinates on a world map.

---

## 🎯 Skills Demonstrated

- Querying nested documents and arrays  
- Sorting and limiting results  
- Using comparison operators (`$gte`, `$lte`)  
- Using logical operators (`$or`)  
- Using regex for pattern matching  
- Aggregation pipelines with `$match` and `$group`  
- Counting documents efficiently  
- Working with geospatial data in Compass  
- Combining multiple filters in a single query  

---

## 📄 Notes

This sprint provides hands‑on experience with MongoDB’s flexible document model and powerful aggregation framework.  
It complements the SQL module by demonstrating how to work with semi‑structured data and NoSQL querying patterns.
