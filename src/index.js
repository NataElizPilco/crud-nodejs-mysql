import app from "./app.js";
import { port } from "./config.js";
import { pool } from "./db.js";

app.get('/ping', async (req, ress) => {
    const resul = await pool.query('SELECT name FROM customer;')
    ress.json(resul[0])
} )

app.listen(port);
console.log(`server on port ${port}`);
