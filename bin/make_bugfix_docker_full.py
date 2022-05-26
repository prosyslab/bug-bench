#!/usr/bin/env python3

import sys
import os

BENCHMARKS_BUGFIX_FULL = [("jasper", "1.900.3"), ("libtiff", "4.0.6"),
                          ("libtiff", "4.0.7"), ("libxml2", "8f30bd"),
                          ("libxml2", "cbb271"), ("openjpeg", "c02f14")]

PROJECT_HOME = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BENCHMARK_DIR = os.path.join(PROJECT_HOME, "benchmark")

def read_docker_file(docker_file):
    with open(docker_file, 'r') as f:
        return f.read()


def write_docker_file(docker_file, file_content):
    with open(docker_file, 'w') as f:
        f.write(file_content)


def find_prog_env(lines, program, version):
    for line in lines:
        if line.startswith("WORKDIR"):
            env = line.split(" $")[1].strip()
            if program.upper() in env:
                return env

def edit_docker_file(docker_file, program, version):
    raw_lines = read_docker_file(docker_file).split("\n")
    prog_env = find_prog_env(raw_lines, program, version)
    new_lines = []
    new_lines.append(f"\n# {program}-{version}")
    new_lines.append(f"ENV {prog_env}={program}-{version}")
    for line in raw_lines:
        if line.startswith("FROM"):
            new_lines.append(f"ENV BENCH_SRC_{prog_env}=$BENCHMARK/{program}/{version}")
            new_lines.append(f"ENV BUILD_{prog_env}=$SCRIPT_BUILD/${prog_env}-build.sh")
        elif line.startswith("COPY"):
            if "build.sh" in line:
                new_lines.append(f"COPY $BENCH_SRC_{prog_env}/build.sh $BUILD_{prog_env}")
            elif "input" in line:
                new_lines.append(f"RUN mkdir -p $INPUT/${prog_env}")
                new_lines.append(f"COPY $BENCH_SRC_{prog_env}/input $INPUT/${prog_env}")
                new_lines.append(f"ENV TEST_{prog_env}=$INPUT/${prog_env}/test.sh")
            else:
                print("Unknown COPY line:", line)
                exit(1)
        elif line.startswith("RUN apt-get -y update"):
            continue
        else:
            new_lines.append(line)
    new_lines.append("WORKDIR $SRC")
    return "\n".join(new_lines) + "\n"


def make_full_content():
    content = ""
    for (program, version) in BENCHMARKS_BUGFIX_FULL:
        bench_docker_file = os.path.join(BENCHMARK_DIR, program, version, "Dockerfile-bugfix")
        content += edit_docker_file(bench_docker_file, program, version)
    return content


if __name__ == "__main__":
    full_docker_file = sys.argv[1]
    full_docker_dir = os.path.dirname(full_docker_file)
    base_docker_file = os.path.join(full_docker_dir, "Dockerfile-base")

    base_content = read_docker_file(base_docker_file)

    full_content = make_full_content()
    merged_content = base_content + "\n" + full_content
    write_docker_file(full_docker_file, merged_content)
