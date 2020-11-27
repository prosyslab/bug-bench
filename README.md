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
```
/
|-- src
|  `---/PROGRAM
|  `---/build.sh
|-- smake
```
