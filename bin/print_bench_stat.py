#!/usr/bin/env python3

import os, json, csv

FILE_PATH=os.path.dirname(os.path.abspath(__file__))
ROOT=os.path.abspath(os.path.join(FILE_PATH, ".."))
BENCHMARK_DIR=os.path.join(ROOT, "benchmark")

def get_benchmark_data():
  out = os.path.join(ROOT, "stat.tsv")
  projects = os.listdir(BENCHMARK_DIR)
  stat = dict()
  for project in projects:
      stat[project] = dict()
      versions = os.listdir(os.path.join(BENCHMARK_DIR, project))
      for version in versions:
          stat[project][version] = dict()
          label_file = os.path.join(BENCHMARK_DIR, project, version, "label.json")
          if not os.path.exists(label_file):
              stat[project][version]['bug_trace'] = '0'
              stat[project][version]['bugs'] = '0'
              continue
          with open(label_file, 'r') as f:
              data = json.load(f)
              stat[project][version]['bugs'] = len(data)
              stat[project][version]['bug_trace'] = 0
              for bug in data:
                  if 'bug-trace' in bug.keys() and bug['bug-trace'] != []:
                      stat[project][version]['bug_trace'] += 1
  return stat

def print_stat(stat):
    stat = get_benchmark_data()
    with open(os.path.join(ROOT, "stat.tsv"), 'w') as f:
        writer = csv.writer(f, delimiter='\t')
        writer.writerow(['Project', 'Version', '# Bugs', '# Bug Trace'])
        f.flush()
        for project in stat:
            for version in stat[project]:
                writer.writerow([project, version, stat[project][version]['bugs'], stat[project][version]['bug_trace']])
                f.flush()
    f.close()     
def main():
    stat = get_benchmark_data()
    print_stat(stat)            

if __name__ == "__main__":
    main()