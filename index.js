// import package
import express from "express";
import pg from "pg";
import bodyParser from "body-parser";


const app = express();
const port = 3000;
// DATABASE
const db = new pg.Client({
    user: "postgres",
    host: "localhost",
    database: "kegiatan",
    password: "root",
    port: 5432
});
db.connect();

app.use(bodyParser.urlencoded({ extended: true }));
app.set("view engine", "ejs");
app.use(express.static("public"));

// data
let kegiatan = [];
// Route - Ke Home
app.get("/", async (req,res) => {
    try {
        const query = await db.query("SELECT * FROM task ORDER BY id ASC");
        kegiatan = query.rows;
        res.render('index', {
            title: "Project To Do List",
            todo: kegiatan,
        })
    } catch (error) {
        console.log(error);
    }
});
// ROUTE - ADD TODO
app.post("/add", async (req,res) => {
    try {
        const newKegiatan = req.body['task']
        await db.query(`INSERT INTO task (kegiatan) VALUES ($1)`, [newKegiatan]);
        res.redirect("/");
    } catch (error) {
        res.status(500).send({
            error: "data gagal ditambahkan"
        });
    }
});
// DELETE
app.post("/delete", async (req,res) => {
    try {
        const id = req.body.deleteTask;
        await db.query("DELETE FROM task WHERE id = $1", [id]);
        res.redirect("/");
    } catch (error) {
        res.status(500).send({
            error: "Gagal Untuk Menghapus Kegiatan"
        })
    }
});
// SERVER RUNNING
app.listen(port, () => {
    console.log(`Running server in port ${port}`);
})