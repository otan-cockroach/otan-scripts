import sys
import json
import collections

all = ''
for line in sys.stdin.readlines():
    if line.startswith('#'):
        continue
    for f, t in [
        ('castsource', '"castsource"'),
        ('casttarget', '"casttarget"'),
        ('castfunc', '"castfunc"'),
        ('castcontext', '"castcontext"'),
        ('castmethod', '"castmethod"'),
        ('=>', ':'),
        ("'", '"'),
    ]:
        line = line.replace(f, t)
    all += line

loaded = json.loads(all)

group_by = collections.defaultdict(list)
for entry in loaded:
    group_by[entry['castsource']] += [entry]

def convert_castcontext(c):
    if c == 'e':
        return 'CastContextExplicit'
    if c == 'a':
        return 'CastContextAssignment'
    if c == 'i':
        return 'CastContextImplicit'
    assert False, c

def convert_method(c):
    if c == 'f':
        return 'CastMethodFunc'
    if c == 'i':
        return 'CastMethodIO'
    if c == 'b':
        return 'CastMethodBinary'
    assert False, c

for src in sorted(group_by.keys()):
    entries = group_by[src]
    print('oid.T_{}: map[oid.Oid]Castable'.format(src) + '{')
    for entry in sorted(entries, key=lambda x: x['casttarget']):
        print('  oid.T_{}: {{Method: {}, Context: {}}},'.format(
            entry['casttarget'],
            convert_method(entry['castmethod']),
            convert_castcontext(entry['castcontext']),
        ))
    print('},')
