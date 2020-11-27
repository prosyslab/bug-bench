# Bug Bench

## Bug Label
### Bug type
- buffer-overflow
- integer-overflow
- format-string
### Single point
```
{
  "project": (string, NAME-VER),
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
  "project": (string, NAME-VER),
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

## Docker
- Base image: `prosyslab/bug-bench-base` in Dockerhub built from [docker/Dockerfile](docker/Dockerfile)
```
/
|-- src
|  `---/PROGRAM
|  `---/build.sh
|-- smake
```
