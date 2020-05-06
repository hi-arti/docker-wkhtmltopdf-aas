#!/bin/bash

gunicorn -b 0.0.0.0:80 --worker-class=$WORKER_CLASS --threads=$WORKER_THREADS --worker-connections=$WORKER_CONNECTIONS --workers=$WORKERS_COUNT --log-level=$LOG_LEVEL --log-file - --timeout=$WORKER_TIMEOUT app:application