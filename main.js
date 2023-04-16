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

app.get('/song', (req, res) => {
  res.sendFile(__dirname + '/song.html');
});

app.get('/draftsong', (req, res) => {
  res.sendFile(__dirname + '/draftsong.html');
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

    socket.on('draft song', (flag) => {
      let query = '';
      if (flag) {
        query = 'SELECT * FROM `songs` WHERE usada = 0;';
      } else {
        query = 'SELECT * FROM `songs` WHERE usada = 0 AND dificuldade != \'Extrema\';';
      }
      connection.query(query,
        function(err, results, fields) {
          let len = results.length;
          let rand = Math.floor(Math.random() * len);
          // console.log(results); results contains rows returned by server
          //console.log(fields); // fields contains extra meta data about results, if available
          connection.query(`UPDATE songs SET usada = 1 WHERE id = ${results[rand].id}`,
            function(err, results, fields) {

            });
          io.emit('draft song', results[rand]);
          console.log("drafting song");
        } // callback
      ); // query
    }); // socket.on('load scores')
  });

server.listen(3000, () => {
  console.log('listening on *:3000');
});