Varnish App
-----------

A simple page render which uses a Varnish cache

To start the project, simply run `docker-compose up`

Node JS Server
--------

The Node JS server can be viewed here `http://localhost:8080/src`.
This is a simple static file server.

Node JS API Server
---------

The Node JS API server can be viewed here `http://localhost:1234/esi`
This is a very simple express server.

Varnish Server
----------

The varnish server uses both Node JS server to serve the content, with the API used for dynamic ESIs.

The varnish server can be viewed here `http://localhost/src`