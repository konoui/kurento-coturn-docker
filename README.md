## kurento and coturn example on docker on aws
[Node.js - Hello world](https://doc-kurento.readthedocs.io/en/6.10.0/tutorials/node/tutorial-helloworld.html) using [coturn](https://github.com/coturn/coturn) work.

## Usage
```
$ export COTURN_PUBLIC_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
$ docker-compose up -d
```

