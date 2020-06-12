import toml

with open('Gopkg.lock') as f:
    lockFile = toml.load(f)

with open('modules.txt') as f:
    modulesFile = f.readlines()

class Info(object):
    def __init__(self, rev=None, ver=None):
        self.rev = rev[:8] if rev else None
        self.ver = ver

    def __repr__(self):
        return '{}:{}'.format(self.ver, self.rev)

lockToInfo = {}
for project in lockFile['projects']:
    lockToInfo[project['source'][len('https://'):] if 'source' in project else project['name']] = Info(
        rev=project['revision'],
        ver=project['version'] if 'version' in project else None,
    )

def parse_modules_version(v):
    if v.endswith('+incompatible'):
        v = v[:-len('+incompatible')]
    components = v.split('-')
    if len(components) < 3:
        return Info(ver=v)
    return Info(rev=components[len(components) - 1])

modulesToInfo = {}
for line in modulesFile:
    if line[0] != '#':
        continue
    components = line.strip().split(' ')
    name = components[len(components) - 2]
    version = components[len(components) - 1]
    modulesToInfo[name] = parse_modules_version(version)

def pretty_name(s):
    return '[{}](https://{})'.format(s, s)

for name, info in lockToInfo.items():
    if name not in modulesToInfo:
        print('- [ ] item in Gopkg.lock but not in go.sum: {}'.format(pretty_name(name)))
        continue
    moduleInfo = modulesToInfo[name]
    if moduleInfo.ver is not None:
        if moduleInfo.ver != info.ver:
            if info.ver:
                print('- [ ] mismatching version: {} - go.sum {} vs Gopkg.lock {}'.format(pretty_name(name), moduleInfo.ver, info.ver))
            else:
                print('- [ ] version in go.mod, but SHA in Gopkg.lock: {} - go.sum {} vs Gopkg.lock SHA {}'.format(pretty_name(name), moduleInfo.ver, info.rev))
    elif moduleInfo.rev != info.rev:
        print('- [ ] mismatching SHA for {} - [go.sum {} vs Gopkg.lock {}](https://{}/compare/{}...{})'.format(pretty_name(name), moduleInfo.rev, info.rev, name, info.rev, moduleInfo.rev))

for name, info in modulesToInfo.items():
    if name not in lockToInfo:
        print('- [ ] item in go.sum but not in Gopkg.lock: {}'.format(pretty_name(name)))

