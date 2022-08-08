# bookkeeper
## usage
### dry run
```bash
docker run -it --rm ttbb/bookkeeper:nake bash
```
### run with port
```bash
docker run -p 2181:2181 -p 3181:3181 -p 4181:4181 -p 8080:8080 -it --rm ttbb/bookkeeper:nake bash
```
