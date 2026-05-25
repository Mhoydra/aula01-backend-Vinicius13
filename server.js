const express = require('express');
const path = require('path');

const app = express();

app.use(express.static('/public'));
app.use(express.urlencoded({ extended: true }));

app.get('/',(req,res) => {
    res.sendFile(path.join(__dirname,'public','index.html'));
});

app.get('/login',(req,res) => {
    res.sendFile(path.join(__dirname,'public','login.html'));
});

app.post('/login',(req,res) => {
    const email = req.body.email;
    const senha = req.body.senha;

    console.log('Email recebido:', email);
    console.log('Senah recebida:', senha);

    res.send(`
        <h1>Dados recebidos pelo servidor</h1>
        <p>E-mail: ${email}</p>
        <p>Senha: ${senha}</p>
        <a href="/login">Voltar</a>
    `);
});

app.get('/cadastro',(req,res) => {
    res.sendFile(path.join(__dirname,'public','cadastro.html'));
});

app.post('/cadastro',(req,res) => {
    const nome = req.body.nome;
    const email = req.body.email;
    const senha = req.body.senha;

    console.log('Nome recebido:',nome);
    console.log('Email recebido:',email);
    console.log('Senha recebido:',senha);

    res.send(`
        <h1>Dados recebidos pelo servidor</h1>
        <p>Nome: ${nome}</p>
        <p>E-mail: ${email}</p>
        <p>Senha: ${senha}</p>
        <a href="/login">Voltar</a>
    `);
});

app.listen(3000, () => {
    console.log("Servidor Rodando e http://localhost:3000");
});

