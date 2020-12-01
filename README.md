# Bug Bench

## Bug Label
### Bug type
- buffer-overflow
- integer-overflow
- format-string
### Single point
```
{
  "project": (string),
  "version": (string),
  "file": (string),
  "line": (int),
  "type": (string, see above),
  "CVE": (string, CVE-XXXX-XXXX),
  "report": (string, bug report or CVE report),
  "patch": (string option, patch commit)
}
```
### Two points
```
{
  "project": (string),
  "version": (string),
  "source": {
    "file": (string),
    "line": (int),
  },
  "sink": {
    "file": (string),
    "line": (int),
  },
  "type": (string, see above),
  "CVE": (string, CVE-XXXX-XXXX),
  "report": (string, bug report or CVE report),
  "patch": (string option, patch commit)
}
```

## Benchmark
```
benchmark
|--- PROGRAM1
    `--- VER1
    |    `--- label.json
    |    `--- Dockerfile
    |    `--- build.sh
    `--- VER2
    |    `--- label.json
    |    `--- Dockerfile
    |    `--- build.sh
    ...
```

## Docker
- Base image: `prosyslab/bug-bench-base` in Dockerhub built from [docker/Dockerfile](docker/Dockerfile)
```sh
/
|-- src/
|  `-- PROGRAM/
|  `-- build.sh
|-- smake/
|-- infer/  # shall be mounted
|-- out/
   `-- smake-out/
      `-- captured/
   `-- infer-out/
```

### How to build with respect to desired target?

```sh
$ $BUILD [ sparrow | infer ]
```

For example, to build target for Sparrow, run `$BUILD sparrow`. Then, the built target along with either Sparrow or Infer will be located at `/out/*`.

### How to mount `infer`?

```sh
$ docker run -it -v PATH/TO/INFER/:/infer REPO:TAG
```

FYI, look out for `-v` option in `docker run --help`.