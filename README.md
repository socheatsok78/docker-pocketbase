<p align="center">
    <a href="https://pocketbase.io" target="_blank" rel="noopener">
        <img src="https://i.imgur.com/ZfD4BHO.png" alt="PocketBase - open source backend in 1 file" />
    </a>
</p>

## About

Docker Image for [PocketBase](https://github.com/pocketbase/pocketbase).

## Image

| Registry                | Image                             |
| ----------------------- | --------------------------------- |
| Docker Hub              | `docker.io/pocketbase/pocketbase` |
| GitHub Package Registry | `ghcr.io/pocketbase/pocketbase`   |

Following platforms for this image are available:

```
$ docker run --rm mplatform/mquery pocketbase/pocketbase:latest
* Supported platforms:
   - linux/amd64
   - linux/arm64
```

## How to use this image

Running the container:
```
$ docker run --name pocketbase -v $(pwd)/pocketbase:/opt/pocketbase -d pocketbase/pocketbase
```

## Environment Variables

```
PB_HOST=0.0.0.0
PB_PORT=8090
PB_DATA_DIR=/opt/pocketbase
PB_DEBUG=
PB_ENCRYPTION_KEY=kHyRfPRyLOFr0VPsDytT4cXNGVA1vE7e
```

## License

Licensed under the [MIT](LICENSE).
