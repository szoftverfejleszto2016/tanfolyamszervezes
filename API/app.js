require('dotenv').config()
const express = require("express");
const app = express();
app.use(express.json());
require('dotenv').config();
const cors = require("cors");
app.use(cors());
const bcrypt = require('bcrypt');
const jwt = require("jsonwebtoken");
const mysql = require('mysql');

const pool = mysql.createPool({
    host: process.env.HOST,
    port: process.env.PORT,
    database: process.env.DATABASE,
    user: process.env.USER,
    password: process.env.PASSWORD,
    dateStrings: true
});

// publikus API
app.get("/public/csoportok", function (req, res) {
    const q = "SELECT csoportok.csid,kepzesek.knev,indulas,beosztas,ar,"
        + "COUNT(jid) AS letszam "
        + "FROM kepzesek JOIN csoportok ON csoportok.kid=kepzesek.kid "
        + "LEFT JOIN jelentkezok ON csoportok.csid = jelentkezok.csid "
        + "WHERE indulas >= date(now()) GROUP BY csid";
    pool.query(q, function (error, results) {
        if (!error) {
            res.send(results);
        } else {
            res.send(error);
        }
    });
});

app.post("/public/jelentkezok", function (req, res) {
    const q = "INSERT INTO jelentkezok (csid, jnev, szulnev, szulido, "
        + "szulhely, anyjaneve, cim, telefon, email) "
        + "VALUES (?,?,?,?,?,?,?,?,?)";
    pool.query(q,
        [req.body.csid,
        req.body.jnev,
        req.body.szulnev,
        req.body.szulido,
        req.body.szulhely,
        req.body.anyjaneve,
        req.body.cim,
        req.body.telefon,
        req.body.email
        ],
        function (error, results) {
            if (!error) {
                res.send(results);
            } else {
                res.send(error);
            }
        });
});

// admin API
app.post("/admin", function (req, res) {
    const hash = process.env.ADMIN;
    if (!bcrypt.compareSync(req.body.password, hash))
        return res.status(401).send({ message: "Hibás jelszó!" })
    const token = jwt.sign({
        password: req.body.password}, 
        process.env.TOKEN_SECRET, 
        { expiresIn: 3600 })
    res.json({ token: token, message: "Sikeres bejelentkezés." })
});

app.post("/admin/csoportok", function (req, res) {

});

app.listen(5000, function () {
    console.log("Server elindítva az 5000-es porton...");
});
