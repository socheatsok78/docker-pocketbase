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
| Docker Hub              | `docker.io/socheatsok78/pocketbase` |
| GitHub Package Registry | `ghcr.io/socheatsok78/pocketbase`   |

Following platforms for this image are available:

```
$ docker run --rm mplatform/mquery socheatsok78/pocketbase:main

Image: socheatsok78/pocketbase:main (digest: sha256:ecae74e29a6edfb0baf7e5a8ca625ceaadaacbf745af7724a97f6d6aaff168a3)
 * Manifest List: Yes (Image type: application/vnd.docker.distribution.manifest.list.v2+json)
 * Supported platforms:
   - linux/amd64
   - linux/arm64
```

## How to use this image

Running the container:
```
$ docker run --name pocketbase -v $(pwd)/pocketbase:/opt/pocketbase -d ghcr.io/socheatsok78/pocketbase

  ____            _        _   ____
 |  _ \ ___   ___| | _____| |_| __ )  __ _ ___  ___
 | |_) / _ \ / __| |/ / _ \ __|  _ \ / _` / __|/ _ \
 |  __/ (_) | (__|   <  __/ |_| |_) | (_| \__ \  __/
 |_|   \___/ \___|_|\_\___|\__|____/ \__,_|___/\___|

 pocketbase version 0.7.10

+ pocketbase serve --encryptionEnv=PB_ENCRYPTION_KEY --dir=/opt/pocketbase --http=0.0.0.0:8090
> Server started at: http://0.0.0.0:8090
  - REST API: http://0.0.0.0:8090/api/
  - Admin UI: http://0.0.0.0:8090/_/
```

## Environment Variables

```env
# enable debug mode, aka. showing more detailed logs (default false)
PB_DEBUG=

# api HTTP server address (default "0.0.0.0:8090")
PB_HOST=0.0.0.0
PB_PORT=8090

# CORS allowed domain origins list (default [*])
PB_CORS=

# the directory to store PocketBase data (default "/opt/pocketbase")
PB_DATA_DIR=/opt/pocketbase

# the directory to serve static files (default "/var/pocketbase/public")
PB_PUBLIC_DIR=/var/pocketbase/public

# the env variable whose value of 32 characters will be used 
# as encryption key for the app settings (default none)
PB_ENCRYPTION_KEY=kHyRfPRyLOFr0VPsDytT4cXNGVA1vE7e
```

## License

Licensed under the [MIT](LICENSE).
