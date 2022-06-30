# Google Cloud Docker

A collection of Docker images running Google Cloud emulators so they can be run on Github Actions

## Pub/Sub

The Google Cloud Pub/Sub emulator image starts a Pub/Sub emulator upon start of the Docker container. 
To configure it, you can use the following environment variables : 

| ENV VAR | Type | Default value | Description |
|---------|------|---------------|-------------|
| PUBSUB_PROJECT_ID | `string` | `"dev"` | The Google Cloud project ID to use |
| PUBSUB_LISTEN_ADDRESS | `string` | `"0.0.0.0:8085"` | The host and port to listen to |

To run the image, do the following : 

```bash
docker run -d Dal-Papa/google-cloud-pubsub
```

## Datastore

The Google Cloud Datastore emulator image starts a Datastore emulator upon start of the Docker container. 
To configure it, you can use the following environment variables : 

| ENV VAR | Type | Default value | Description |
|---------|------|---------------|-------------|
| DATASTORE_PROJECT_ID | `string` | `"dev"` | The Google Cloud project ID to use |
| DATASTORE_LISTEN_ADDRESS | `string` | `"0.0.0.0:8081"` | The host and port to listen to |

To run the image, do the following : 

```bash
docker run -d Dal-Papa/google-cloud-datastore
```