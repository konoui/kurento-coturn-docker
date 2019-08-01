## USAGE

```
docker run --rm -d --name kms -p 8888:8888 -e KMS_TURN_URL=kurento:kurento@<turn-public-ip>:3478  kurento/kurento-media-server:latest
```

### TEST
You will get something like:
Don't worry about the second line (500 Internal Server Error). It's ok, because we are not talking the protocol kurento media server expects, we are just checking that the server is up and listening for connections.

```
$ curl -i -N -H "Connection: Upgrade" -H "Upgrade: websocket" -H "Host: 127.0.0.1:8888" -H "Origin: 127.0.0.1" http://127.0.0.1:8888/kurento
1:8888/kurento
HTTP/1.1 500 Internal Server Error
Server: WebSocket++/0.5.1
```

```
The kurento media server log is available through the usual way Docker exposes logs for its containers. So assuming you named your container kms (with --name kms as we did above):

$ docker logs kms
```

Ref: [Kurento Media Server](https://hub.docker.com/r/kurento/kurento-media-server/)
Ref: [STUN and TURN servers](https://doc-kurento.readthedocs.io/en/latest/user/installation.html#stun-and-turn-servers)
