# Docker webszerver beállítása

Konfigurácio ```YAML```
```
version: '3'

services:
  web:
    image: "választott webszerver"
    container_name: docker_web
    ports:
      - "Szökséges portok"
    volumes:
      - "külső mappa csatolása cssak olvasásra"
    restart: always
```

> docker-compose up -d
