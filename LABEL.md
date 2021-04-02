# Bug Label
## Bug type
- buffer-overflow
- integer-overflow
- integer-underflow
- format-string
- command-injection

## Single point
```
{
  "project": (string),
  "version": (string),
  "file": (string),
  "line": (int),
  "type": (string, see above),
  "CVE": (string option, CVE-XXXX-XXXX),
  "report": (string option, bug report or CVE report),
  "patch": (string option, patch commit),
  "code": (string)
}
```
## Two points
```
{
  "project": (string),
  "version": (string),
  "source": {
    "file": (string),
    "line": (int),
    "code": (string)
  },
  "sink": {
    "file": (string),
    "line": (int),
    "code": (string)
  },
  "type": (string, see above),
  "CVE": (string option, CVE-XXXX-XXXX),
  "report": (string option, bug report or CVE report),
  "patch": (string option, patch commit)
}
```

## Note
- "line": -1 if the location is not found yet.