# mug_manager

A Flutter mug manager application. Contains Imposter config files for spinning up a mock backend that the application can connect to.

## Getting started

To start the mock backend, launch Docker and start the Imposter implementation.

```bash
open -a Docker
imposter up -p 8080 --config path/to/imposter
```

Then, start the application by running `main.dart`.
