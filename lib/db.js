var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'charfi11',
  password : 'pioupiou',
  database: 'express'
});

connection.connect(function(error){
    if(!!error){
      console.log(error);
    }else{
      console.log('connect to database!');
    }
  });  

connection.end();