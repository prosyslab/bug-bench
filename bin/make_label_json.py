#!/usr/bin/env python3
import os
import argparse
import json

script_dir = os.path.dirname(os.path.abspath(__file__))

def parse_input_file(input_file):
    bug_entries = []
    with open(input_file, 'r') as f:
        lines = f.readlines()
        for i in range(0, len(lines), 5):
            bug_entry = {
                "file": lines[i].strip(),
                "line": int(lines[i+1].strip()),
                "type": lines[i+2].strip(),
                "CVE": lines[i+3].strip(),
                "report": lines[i+4].strip(),
                "patch": null,
                "bug-trace": []
            }
            bug_entries.append(bug_entry)
    return bug_entries

def create_bug_report(project, version, input_file):
    bug_entries = parse_input_file(input_file)
    report = []
    for bug in bug_entries:
        entry = {
            "project": project,
            "version": version,
            "file": bug["file"],
            "line": bug["line"],
            "type": bug["type"],
            "CVE": bug["CVE"],
            "report": bug["report"],
            "patch": bug["patch"],
            "bug-trace": bug["bug-trace"]
        }
        report.append(entry)
    return report

def main():
    parser = argparse.ArgumentParser(description='Generate bug report JSON.')
    parser.add_argument('--project', required=True, help='Project name')
    parser.add_argument('--version', required=True, help='Project version')
    parser.add_argument('--input', required=True, help='Input text file')

    args = parser.parse_args()

    bug_report = create_bug_report(args.project, args.version, args.input)
    output_dir = os.path.join(script_dir, '../benchmark', args.project, args.version)
    os.makedirs(output_dir, exist_ok=True)
    output_file = os.path.join(output_dir, 'label.json')
    with open(output_file, 'w') as f:
        json.dump(bug_report, f, indent=2)

if __name__ == '__main__':
    main()
