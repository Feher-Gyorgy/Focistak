require("dotenv").config();

const express = require("express");
const mysql = require("mysql");
const app = express();

const pool = require("./config/database.js");

//#region middlewares
app.use(express.json());
//#endregion middlewares

//#region players
app.get("/players", (req, res) => {
  pool.getConnection(function (error, connection) {
    if (error) {
      console.log("szerver hiba");
      return;
    }
    const sql = "SELECT * FROM players";
    connection.query(sql, (error, results, fields) => {
      if (error) {
        console.log("sql hiba");
        return;
      }
      res.send(results);
    });
    connection.release();
  });
});

app.get("/players/:id", (req, res) => {
  const id = req.params.id;
  pool.getConnection(function (error, connection) {
    if (error) {
      console.log("szerver hiba");
      return;
    }

    const sql = `
    SELECT * FROM players
  WHERE id = ?
  `;
    connection.query(sql, [id], (error, results, fields) => {
      if (error) {
        console.log("sql hiba");
        return;
      }
      res.send(results[0]);
    });
    connection.release();
  });
});

app.post("/players", (req, res) => {
  console.log(req.body);
  const newR = {
    focistaNev: req.body.focistaNev,
    posztId: req.body.posztId,
    csapatId: req.body.csapatId,
  };

  pool.getConnection(function (error, connection) {
    if (error) {
      console.log("szerver hiba");
      return;
    }
    const sql = `
    INSERT INTO players
      (focistaNev, posztId, csapatId)
      VALUES
      (?, ?, ?)
    `;
    connection.query(sql, [newR.focistaNev, newR.posztId, newR.csapatId], (error, results, fields) => {
      if (error) {
        console.log("sql hiba");
        return;
      }
      if (!results.affectedRows) {
        console.log("insert meghiúsult")
        return;
      }
      newR.id = results.insertId;
      res.send(newR);
    });
    connection.release();
  });
 
});
//#endregion players

app.listen(process.env.APP_PORT, () => {
  console.log(`Data server, listen port: ${process.env.APP_PORT}`);
});
