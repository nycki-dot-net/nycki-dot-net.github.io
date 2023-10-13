#!/usr/bin/python3
from pathlib import Path

p = Path(__file__).with_name('xkcd-rgb.txt')
print(':root {')
with p.open('r') as f:
    for line in f.readlines():
        if line[0] == '#': continue
        if len(line) == 0: continue
        color_name, color_hex = line.strip().split('\t')
        color_name = color_name.replace(' ', '-')
        color_name = color_name.replace('/', '-slash-')
        color_name = color_name.replace("'", '')
        css_statement = f'\t--xkcd-{color_name}: {color_hex};'
        print(css_statement)
print('}')
