var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var connection = require('./lib/db');
var md5 = require('md5');

app.set('view engine', 'ejs');

app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.json());

app.get('/', function(req, res){
    res.render('index');
});

app.get('/about', function(req, res){
  res.render('about');
});

app.get('/login', function(req, res){
  res.render('login');
});

app.get('/register', function(req, res){
  res.render('register');
});

app.post('/register-form', function(req, res){
  var data = res.json({
    name: req.body.username,
    email: req.body.email,
    password: md5(req.body.password)
   })

  var sql = 'INSERT INTO user(username, password, email) VALUES(?,?,?)'
  var params = [data.username, data.email, data.password]
  connection.query(sql, params, function(res){
    
  })
});

app.listen(3000, function() {
  console.log('Example app listening on port 3000!');
});
