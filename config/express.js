// config/express.js
var express = require('express');
var load = require('express-load');
var bodyParser = require('body-parser');

module.exports = function(){
	var app = express();

	//cofiguração de ambiente
	app.set('port',3000);
	
	//middleware
	app.use(express.static('./public'));

	load('models', {cwd: 'app'})
	   .then('controllers')
   	   .then('routes')
   	   .into(app);

	app.set('view engine', 'ejs');
	app.set('views','./app/views');

	app.use(bodyParser.urlencoded({extended: true}));
	app.use(bodyParser.json());
	app.use(require('method-override')())


	return app;
};