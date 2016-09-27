var express = require('express');
var _ = require('underscore');
var linq = require('linq');

var app = express()

var people = [
  {
    "id": 1,
    "name": "Spence Chen",
    "age": 20,
    "phone": "+1 (929) 535-3923"
  },
  {
    "id": 2,
    "name": "Dorsey Spears",
    "age": 23,
    "phone": "+1 (878) 414-3393"
  },
  {
    "id": 3,
    "name": "Higgins Hahn",
    "age": 24,
    "phone": "+1 (978) 456-3280"
  },
  {
    "id": 4,
    "name": "Mcdonald Peterson",
    "age": 37,
    "phone": "+1 (812) 428-2904"
  },
  {
    "id": 5,
    "name": "Hannah Bates",
    "age": 23,
    "phone": "+1 (825) 578-2298"
  },
  {
    "id": 6,
    "name": "Evangelina Santiago",
    "age": 39,
    "phone": "+1 (922) 532-3163"
  },
  {
    "id": 7,
    "name": "Ballard Craig",
    "age": 25,
    "phone": "+1 (833) 446-2826"
  },
  {
    "id": 8,
    "name": "Brown Holt",
    "age": 33,
    "phone": "+1 (961) 570-2724"
  }
]

app.get('/', function (req, res) {
  res.send('Welcome!');
});

app.get('/list', function (req, res) {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  var shortList = [];
  _.each(people, function(person){
    shortList.push( { id: person.id, name: person.name })
  });
  res.write(JSON.stringify(shortList));
  res.end();
});

app.get('/listall', function (req, res) {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.write(JSON.stringify(people));
  res.end();
});

app.get('/personbyid', function(req, res) {
  var id = req.query["id"];
  res.writeHead(200, { 'Content-Type': 'application/json' });
  var person = linq.from(people)
    .where(function(i){return i.id == id})
    .toArray();
  res.write(JSON.stringify(person));
  res.end();
});

app.post('/add', function (req, res) {
  people.push(req.body);
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.write(JSON.stringify(req.body));
  res.end();
});

app.listen(8000);
