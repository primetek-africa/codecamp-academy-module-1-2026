# MongoDB Atlas Practice Challenge 3 — Sample Mflix Database

For this exercise, you will work with the `sample_mflix` database in MongoDB Atlas.

The database contains the following collections:

- `comments`
- `embedded_movies`
- `movies`
- `sessions`
- `theaters`
- `users`

The objective is to practice the MongoDB operations learned in class using a 
realistic dataset.

---

## Part 1 — Reading Documents

### Challenge 1 — Display All Movies
Retrieve all documents from the `movies` collection.

### Challenge 2 — Find One Movie
Use `findOne()` to retrieve a single movie from the `movies` collection.

### Challenge 3 — Find Movies by Genre
Find all movies that belong to the Action genre. Use a query filter with `genres`.

### Challenge 4 — Find Movies by Year
Find all movies released in 1995. Use the `year` field.

### Challenge 5 — Find Movies with a Specific Rating
Find all movies with an IMDb rating greater than or equal to 8. Use the `$gte` operator.

---

## Part 2 — Query Operators

### Challenge 6 — Find Movies Within a Rating Range
Find movies with an IMDb rating between 7 and 9. Use `$gte` and `$lte`.

### Challenge 7 — Find Movies with Multiple Genres
Find movies that contain both `Drama` and `Comedy` in the `genres` array.

### Challenge 8 — Find Movies from Specific Years
Find movies released in either 1990, 1995, or 2000. Use the `$in` operator.

### Challenge 9 — Find Movies Without a Specific Genre
Find movies that do not contain the genre `Horror`. 
Use an appropriate MongoDB query operator.

---

## Part 3 — Projections, Sorting and Limiting

### Challenge 10 — Project Movie Information
Retrieve movies showing only `title`, `year`, and `genres`. 
Do not display the other fields.

### Challenge 11 — Sort Movies by Rating
Retrieve movies sorted by IMDb rating from highest to lowest. Use `sort()`.

### Challenge 12 — Find the Top 10 Movies
Retrieve the 10 highest-rated movies. Combine `sort()` and `limit()`.

---

## Part 4 — Working with Arrays and Embedded Documents

### Challenge 13 — Find Movies with a Specific Actor
Find movies where "Tom Hanks" appears in the `cast` array.

### Challenge 14 — Find Movies with a Specific Director
Find movies directed by "Steven Spielberg".

### Challenge 15 — Query Embedded IMDb Data
Find movies where the IMDb rating is greater than 8.5. The rating is stored 
inside the `imdb` embedded document. You should use MongoDB dot notation.

---

## Part 5 — Working with Other Collections

### Challenge 16 — Find Users by Email Domain
Use the `users` collection to find users whose email address belongs 
to `gmail.com`. Use a regular expression with `$regex`.

### Challenge 17 — Find Theaters in a Specific State
Use the `theaters` collection to find theaters located in California. 
Use the appropriate field from the document structure.

### Challenge 18 — Find Comments by a User
Use the `comments` collection to find all comments created by a specific user. 
First retrieve a user from the `users` collection and then use the appropriate 
identifier from that document to search the `comments` collection.

---

## Part 6 — Updates and Deletes

### Challenge 19 — Update a User
Choose one user from the `users` collection and update an existing field using 
`$set`. For example, update the user's name. Your operation must use `updateOne()`
and `$set`.

### Challenge 20 — Add Data to a Movie
Choose one movie from the `movies` collection and add a new value to an existing 
array using `$push`. For example, add a new actor to the `cast` array. 
Your operation must use `updateOne()` and `$push`. After the update, use 
`findOne()` to verify the result.

---

## Operations Practiced

By completing these 20 challenges, you will practice:

- `find()`, `findOne()`
- `$eq`, `$gte`, `$lte`, `$in`, `$nin`, `$regex`
- Projection
- `sort()`, `limit()`
- Dot notation
- Arrays
- Embedded documents
- `updateOne()`, `$set`, `$push`

## Important

- Do not modify or delete large portions of the Atlas sample dataset.
- For update exercises, modify only the specific document required by the challenge.
- The goal is to practice MongoDB queries against a real-world dataset 
    while learning how to work with arrays, embedded documents, query operators, 
    projections, sorting, and updates.