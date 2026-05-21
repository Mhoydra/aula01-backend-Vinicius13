const express = require('express');

const app = express();

app.get('/', (req, res) => {
    res.send('Pagina inicial com Express');
});

app.get('/sobre', (req, res) => {
    res.send('Pagina sobre');
});

app.get('/contato', (req, res) => {
    res.send('Pagina contato');
});

app.get('/produtos', (req, res) => {
    res.send('Lista de produtos');
});

app.get('/servicos', (req, res) => {
    res.send('Lista de servicos');
});

app.listen(3000, () => {
    console.log("Servidor Rodando e http://localhost:3000")
});