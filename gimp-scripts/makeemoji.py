filename = 'lasse'

sys.argv = ['', '/Users/otan/' + filename + '.png', '/Users/otan/' + filename + '-party.png']
exec(open("/Users/otan/otan-scripts/gimp-scripts/Rotate_Party.py"))
sys.argv = ['', '/Users/otan/' + filename + '.png', '/Users/otan/' + filename + '-conga.png']
exec(open("/Users/otan/otan-scripts/gimp-scripts/Slide.py"))
sys.argv = ['', '/Users/otan/' + filename + '.png', '/Users/otan/' + filename + '-intensifies.png']
exec(open("/Users/otan/otan-scripts/gimp-scripts/Intensify_bounce.py"))
