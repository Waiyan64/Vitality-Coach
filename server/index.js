const path = require("path");
const express = require("express");
const mysql = require("mysql2");
const bodyParser = require("body-parser");

const PORT = process.env.PORT || 3001;

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "Idonttell99$",
  database: "vitality_coach",
});

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Have Node serve the files for our built React app
app.use(express.static(path.resolve(__dirname, "../client/build")));

app.get("/api", (req, res) => {
  res.json({ message: "Hello from server!" });
});

// All other GET requests not handled before will return our React app
app.get("*", (req, res) => {
  res.sendFile(path.resolve(__dirname, "../client/build", "index.html"));
});

app.listen(PORT, () => {
  console.log(`Server listening on ${PORT}`);
});

app.post("/api/submit-form", (req, res) => {
  const { username, selectedAge } = req.body;

  // INSERT query
  const sql = "INSERT INTO users (name, age) VALUES (?, ?)";

  // Values to insert
  const values = [username, selectedAge];

  pool.getConnection((err, connection) => {
    if (err) {
      console.error("Error getting a database connection:", err);
      res.status(500).send("Server Error");
      return;
    }

    connection.query(sql, values, (error, results) => {
      connection.release(); // Release the connection back to the pool

      if (error) {
        console.error("Error executing the query:", error);
        res.status(500).send("Database Error");
        return;
      }
      res.json({ message: `User '${username}' added to the database` });
    });
  });
});

app.post("/api/get-training-plan", (req, res) => {
  const { yourGoal: objective_id, healthConditions: physical_limitation_id } =
    req.body;

  // gettting exercise data from database
  // query for just exercise with out objective or physical limitation
  let query = "";
  query = `SELECT * FROM exercises
              ORDER BY RAND()
              LIMIT 6;`;

  if (objective_id != 0 && physical_limitation_id === 0) {
    query = `SELECT e.*
              FROM exercises e
              INNER JOIN exercise_objectives eo ON e.id = eo.exercise_id
              WHERE eo.objective_id = ${objective_id}
              ORDER BY RAND()
              LIMIT 6;`;
  }

  if (objective_id === 0 && physical_limitation_id != 0) {
    query = `SELECT e.*
              FROM exercises e
              LEFT JOIN (
                SELECT DISTINCT eo.exercise_id
                FROM exercise_objectives eo
                INNER JOIN exercise_physical_limitations ep ON eo.exercise_id = ep.exercise_id
                WHERE ep.physical_limitation_id != ${physical_limitation_id}
                ORDER BY RAND()
                ) random_exercises ON e.id = random_exercises.exercise_id
                WHERE random_exercises.exercise_id IS NULL
                ORDER BY RAND()
                LIMIT 6`;
  }

  if (objective_id != 0 && physical_limitation_id != 0) {
    query = `SELECT e.*
    FROM exercises e
    LEFT JOIN (
      SELECT DISTINCT eo.exercise_id
      FROM exercise_objectives eo
      INNER JOIN exercise_physical_limitations ep ON eo.exercise_id = ep.exercise_id
      WHERE eo.objective_id = ${objective_id}
      AND ep.physical_limitation_id != ${physical_limitation_id}
      ORDER BY RAND()
      ) random_exercises ON e.id = random_exercises.exercise_id
      LIMIT 6`;
  }

  pool.getConnection((err, connection) => {
    connection.query(query, (err, results) => {
      connection.release(); // Release the database connection

      if (err) {
        console.error("Error executing SQL query:", err);
        return res.status(500).json({ error: "Database query error" });
      }
      res.json(results); // Send the query results as a JSON response
    });
  });
});

app.post("/api/get-meal-plan", (req, res) => {
  const {
    yourGoal: objective_id,
    dietaryPreferences: dietary_restriction_id,
    eatingHabits,
  } = req.body;

  const limit = 7 * eatingHabits;
  // gettting exercise data from database
  // query for just exercise with out objective or physical limitation
  let query = "";
  query = `SELECT * FROM dishes
              ORDER BY RAND()
              LIMIT ${limit};`;

  if (objective_id != 0 && dietary_restriction_id === 0) {
    query = `SELECT DISTINCT d.*
                FROM dishes d
                LEFT JOIN dish_objectives_unsuitable do ON d.id = do.dish_id AND do.objective_id = ${objective_id}
                WHERE do.objective_id IS NULL OR do.objective_id != ${objective_id}
                ORDER BY RAND()
                LIMIT ${limit};`;
  }

  if (dietary_restriction_id != 0) {
    query = `SELECT DISTINCT d.*
                FROM dishes d
                LEFT JOIN dish_objectives_unsuitable do ON d.id = do.dish_id AND do.objective_id = 0
                LEFT JOIN dish_dietary_restrictions dr ON d.id = dr.dish_id AND dr.dietary_restriction_id = ${dietary_restriction_id}
                WHERE do.objective_id IS NULL OR do.objective_id != ${objective_id}
                AND dr.dietary_restriction_id IS NULL OR dr.dietary_restriction_id != ${dietary_restriction_id}
                ORDER BY RAND()
                LIMIT ${limit};`;
  }

  pool.getConnection((err, connection) => {
    connection.query(query, (err, results) => {
      connection.release(); // Release the database connection

      if (err) {
        console.error("Error executing SQL query:", err);
        return res.status(500).json({ error: "Database query error" });
      }

      res.json(results); // Send the query results as a JSON response
    });
  });
});