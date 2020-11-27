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
```
/
|-- src
|  `---/PROGRAM
|  `---/build.sh
|-- smake
```
