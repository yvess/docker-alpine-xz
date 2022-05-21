# README

Minimal alpine utility container with xz.
This is usefull for xz tar support. 

Example usage for restore/backup data with bind volumes of folder `/var/services`

```bash
# export
docker run -it --rm -v $(pwd)/var:/var/services:ro -v $(pwd):/backup yvess/alpine-xz \
	sh -c "cd /var/ && tar c -vJf services/ /backup/exports/var_services.tar.xz"

# restore
docker run -it --rm -v $(pwd)/var:/var/services -v $(pwd):/backup:ro yvess/alpine-xz \
        sh -c "cd /var && rm -Rf services/* && tar x -vJf /backup/exports/var_services.tar.xz"
}
```

Docker repo is on [yvess/alpine-xz](https://hub.docker.com/r/yvess/alpine-xz).
