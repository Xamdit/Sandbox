const app = require("express")();
const svrid = process.env.SVRID;

app.get("/", (req, res) =>
    res.send(`this is server ${svrid} speaking!`))
app.listen(svrid, () => console.log(`${svrid} is listening on ${svrid}`))
