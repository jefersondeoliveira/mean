// app/controllers/contato.js

var contatos = [
	{_id: 1, nome: 'contato 01', email: 'contato1@email.com'},
	{_id: 2, nome: 'contato 02', email: 'contato2@email.com'},
	{_id: 3, nome: 'contato 03', email: 'contato3@email.com'},
	{_id: 4, nome: 'contato 04', email: 'contato4@email.com'}
];

module.exports = function(){
	var controllers = {};
	controllers.listaContatos = function(req, res){

		res.json(contatos);

	};
	controllers.obtemContato = function(req, res){

		var idContato = req.params.id;
		var contato = contatos.filter(function(contato){
			return contato._id == idContato;
		});
		contato != '' ? res.json(contato) : res.status(404).send('Contato não encontrado');

	};
	return controllers;
};