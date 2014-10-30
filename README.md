## My Docker Setup

## nginx

### Create a vhost config

```bash
	cd nginx/config/conf.d
	cp vhost.example default.conf
	nano default.conf
```

### Build the image

```bash
	docker build -t simon-nginx .
```

### Run a container

```bash
    ./run.sh <container_name> <sites_path> <logs_path>
```