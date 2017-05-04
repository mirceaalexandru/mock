'use strict';

const restify = require('restify');

var server = restify.createServer({
	name: 'Mock Server'
});

server.get('/ping', ping);

function ping(req, res, next) {
	console.log('ping');
	res.json({
		code: 'pong',
		timestamp: new Date()
	});
	next();
}

let port = process.env.MOCK_SERVER_PORT || 3050;
console.log(`Listen on ${port}`);
server.listen(port);
