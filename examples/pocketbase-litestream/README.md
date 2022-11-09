## About

In this example, we will setup PocketBase database replication with Litestream (\w Minio).

**What is Litestream?**

Litestream is a streaming replication tool for SQLite databases. It runs as a separate background process and continuously copies write-ahead log pages from disk to one or more replicas. This asynchronous replication provides disaster recovery similar to what is available with database servers like Postgres or MySQL.

## Getting Started

We’ll use a Docker compose of PocketBase, Litestream and MinIO for this example. This gets us up and running quickly.

First, start the cluster:
```sh
docker compose up -d
```

Then open a web browser to http://localhost:9001/ and enter the default credentials:
```
Username: minioadmin
Password: minioadmin
```

Next, navigate to “Buckets”, click the “Create Bucket” button in the top right corner and then click the “Save” icon. Name your bucket, `pocketbase`.

## Replicating your database

> On first-run you may see some error since we do not have a bucket setup on our Minio instance, that is okay to ignore the error. Once you setup Mino everything will be good-to-go!

We’ll run Litestream to replicate our PocketBase database by mount the `pocketbase-data` for on both **PocketBase** and **Litestream** container.

Litestream continuously monitors your database and backs it up to Minio. We can see this by making some changes to PocketBase database.

Example Litestream configuration:

```yml
# See litestream.yml

access-key-id: minioadmin
secret-access-key: minioadmin

dbs:
  - path: /data/data.db
    replicas:
      - type: s3
        bucket: pocketbase
        endpoint: http://minio:9000
        skip-verify: true
        region: us-east1
```

You should see Litestream print some initialization commands and then wait indefinitely. Normally, Litestream is run as a background service so it continuously watches your database for new changes so the command does not exit.
