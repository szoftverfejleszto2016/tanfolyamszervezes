const express = require("express");
const app = express();
app.use(express.json());
require('dotenv').config();
const mysql = require('mysql');
const cors = require("cors");
app.use(cors());

const pool = mysql.createPool({
    host: process.env.HOST,
    port: process.env.PORT,
    database: process.env.DATABASE,
    user: process.env.USER,
    password: process.env.PASSWORD,
    dateStrings: true
});

app.get("/public/csoportok", function (req, res) {
    const q = "SELECT * FROM csoportok WHERE indulas >= date(now())";
    pool.query(q, [req.params.elem],
        function (error, results) {
            if (!error) {
                res.send(results);
            } else {
                res.send(error);
            }
        });
});

app.listen(5000, function () {
    console.log("Server elindítva az 5000-es porton...");
});
