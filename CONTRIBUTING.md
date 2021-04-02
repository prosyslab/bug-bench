# Contribution Guidelines

1. Create a source code repository `[PROGRAM]-[VERSION]` at [prosyslab-warehouse](https://github.com/prosyslab-warehouse) and push the original code. If multiple versions are affected by the bug, pick the latest one.
2. Create a directory `[PROGRAM]/[VERSION]` in [benchmark](benchmark).
3. Write a Dockerfile in the directory following the template below:
```Dockerfile
FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install [put your dependencies]

COPY build.sh $SRC

ENV URL=https://github.com/prosyslab-warehouse/[PROGRAM REPO, e.g., tar-1.28.git]
ENV PROGRAM=[source directory name, e.g., tar-1.28]

RUN git clone $URL

WORKDIR $PROGRAM
```
4. Write a build script `build.sh` in the directory following the template below:
```sh
#!/usr/bin/env bash

[Build commands to generate Makefile]

if [[ $1 == "sparrow" ]]; then
  [Put smake commands here. If you are not sure, put the following command.]
  echo "TODO: $1"
  exit 1
elif [[ $1 == "infer" ]]; then
  [Put infer commands here. If you are not sure, put the following command.]
  echo "TODO: $1"
  exit 1
elif [[ $1 == "codeql" ]]; then
  [Put codeql commands here. If you are not sure, put the following command.]
  echo "TODO: $1"
  exit 1
else
  echo "Unknown build target"
  exit 1
fi
```
5. Write a label file `label.json` in the directory. See the other examples in this repository.
