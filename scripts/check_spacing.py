#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Check all Markdown files in the current working directory (recursively)
for CJK characters directly adjacent to half-width parentheses:

- CJK character immediately before '('
- ')' immediately before CJK character

Parentheses inside Markdown links `[...](...)` are ignored.
Only problematic lines are printed, with column number pointing to the parenthesis.
"""

import re
import glob

# CJK Unified Ideographs (basic + extension A)
CJK_PATTERN = r'[\u4e00-\u9fff\u3400-\u4dbf]'

RE_LEFT  = re.compile(CJK_PATTERN + r'\(')   # CJK + '('
RE_RIGHT = re.compile(r'\)' + CJK_PATTERN)   # ')' + CJK

# Markdown link pattern (including image links)
RE_LINK = re.compile(r'!?\[[^\]]*\]\([^)]*\)')


def get_link_intervals(line):
    """
    Return a list of (start, end) 0-based intervals for each Markdown link
    in the line.
    """
    return [(m.start(), m.end()) for m in RE_LINK.finditer(line)]


def is_inside_intervals(pos, intervals):
    """Check if a 0-based position falls inside any interval."""
    return any(start <= pos < end for start, end in intervals)


def check_file(filepath):
    """
    Scan a single Markdown file.
    Returns a list of issues, each as (line_number, matched_text, column_of_paren).
    Column is 1-based and points to the '(' or ')' character.
    """
    issues = []
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            for line_no, line in enumerate(f, 1):
                link_intervals = get_link_intervals(line)

                # CJK + '('
                for m in RE_LEFT.finditer(line):
                    paren_pos = m.start() + 1          # 0-based position of '('
                    if not is_inside_intervals(paren_pos, link_intervals):
                        col = m.start() + 2            # 1-based column of '('
                        issues.append((line_no, m.group(), col))

                # ')' + CJK
                for m in RE_RIGHT.finditer(line):
                    paren_pos = m.start()              # 0-based position of ')'
                    if not is_inside_intervals(paren_pos, link_intervals):
                        col = m.start() + 1            # 1-based column of ')'
                        issues.append((line_no, m.group(), col))
    except UnicodeDecodeError:
        issues.append(('DECODE_ERROR', None, None))
    return issues


def main():
    # Recursively find all .md files in the current directory
    md_files = glob.glob('**/*.md', recursive=True)
    if not md_files:
        print("No .md files found in the current directory.")
        return

    total_issues = 0
    for fpath in sorted(md_files):
        issues = check_file(fpath)
        if not issues:
            continue

        if issues[0][0] == 'DECODE_ERROR':
            print(f"[WARN] {fpath} : encoding error (not UTF-8, skipped)")
            continue

        for line_no, match_text, col in issues:
            # VS Code-friendly clickable format
            print(f"{fpath}:{line_no}:{col}: found \"{match_text}\"")
            total_issues += 1

    if total_issues == 0:
        print("[OK] All Markdown files are clean (no issues found).")
    else:
        print(f"\nScan complete. Found {total_issues} potential issue(s).")


if __name__ == '__main__':
    main()
