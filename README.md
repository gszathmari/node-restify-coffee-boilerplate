# Node Restify CoffeeScript Boilerplate

Boilerplate built on [Node.js](http://nodejs.org), [Restify](http://mcavage.me/node-restify), [CoffeeScript](http://coffeescript.org) for building APIs

[![Build Status](https://travis-ci.org/gszathmari/node-restify-coffee-boilerplate.svg)](https://travis-ci.org/gszathmari/node-restify-coffee-boilerplate)
[![Coverage Status](https://coveralls.io/repos/gszathmari/node-restify-coffee-boilerplate/badge.svg)](https://coveralls.io/r/gszathmari/node-restify-coffee-boilerplate)
[![Dependencies](https://david-dm.org/gszathmari/node-restify-coffee-boilerplate.svg)](https://david-dm.org/gszathmari/node-restify-coffee-boilerplate)

## Usage

### Prerequisites

Install packages as the following:

```sh
$ npm install -g coffee-script coffeelint mocha
```

### Configuration

The global configuration file is located in `./config/global.yaml`

The defaults should be sufficient in any developer environment, however you may want to change the parameters in production environments.

#### Environmental Variables

The current variables are also for configuration besides the global configuration file

* `PORT` (optional): TCP port where the API will listen *(default: 5000)*

### Running

The API can be started with the following:

```sh
$ npm start
```

### Testing

Run unit and end-to-end tests with the following:

```sh
$ npm test
```

### Misc

The boilerplate can be compiled into pure JavaScript with the following command:

```sh
$ npm run build
```

This will compile CoffeeScript to JavaScript into the `lib/` directory

## Documentation

### API Blueprint

Blueprint is available on [Apiary](http://docs.noderestifycoffeeboilerplate.apiary.io/)

The documentation is rendered from the `apiary.apib` file from this repository

### Live API

This boilerplate application is running on Heroku

```sh
$ curl http://node-restify-coffee.gaborszathmari.me

{"message":"Hello World!"}
```

## Contribute

Pull requests are welcome

Check [CONTRIBUTE.md](CONTRIBUTE.md) for more details

### Contributors

- [Gabor Szathmari](http://gaborszathmari.me) - [@gszathmari](https://twitter.com/gszathmari)

## Credits

This project was inspired by the following boilerplates:

* [node-restify-boilerplate](https://github.com/dominiklessel/node-restify-boilerplate)
* [express-coffee](https://github.com/twilson63/express-coffee)

The project was first featured on the [Rainbow and Unicorn](https://blog.gaborszathmari.me/2015/06/17/api-boilerplate-in-restify-and-coffeescript/) security blog

## License

See the [LICENSE](LICENSE) file for license rights and limitations (MIT)
