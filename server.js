var express = require('express');
var app = express();

app.set('view engine', 'ejs');

app.use(express.static('public'));

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

app.listen(3000, function() {
  console.log('Example app listening on port 3000!');
});