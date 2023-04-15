const express = require('express');
const mysql = require('mysql2');
const app = express();
const http = require('http');
const server = http.createServer(app);
const { Server } = require("socket.io");
const io = new Server(server);

app.use(express.static('css'));
app.use(express.static('src'));
app.use(express.static('public'));

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  database: 'just_dance'
});

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

app.get('/groups', (req, res) => {
  res.sendFile(__dirname + '/groups.html');
});

app.get('/score', (req, res) => {
  res.sendFile(__dirname + '/score.html');
});

app.get('/brackets', (req, res) => {
  res.sendFile(__dirname + '/brackets.html');
});

io.on('connection', (socket) => {
    console.log('a user connected');

    socket.on('new score', (obj) => {
      console.log(obj);
      connection.query(`UPDATE competidores SET group_score = ${obj.score} WHERE id = ${obj.id}`,
        function(err, results, fields) {
          //console.log(results); // results contains rows returned by server
          //console.log(fields); // fields contains extra meta data about results, if available
        } // callback
      ); // query
      io.emit('new score', obj);
    });

    socket.on('load scores', () => {
      connection.query('SELECT * FROM `competidores`',
        function(err, results, fields) {
          //console.log(results); // results contains rows returned by server
          //console.log(fields); // fields contains extra meta data about results, if available
          socket.emit('load scores', results);
        } // callback
      ); // query
    }); // socket.on('load scores')
  });

server.listen(3000, () => {
  console.log('listening on *:3000');
});