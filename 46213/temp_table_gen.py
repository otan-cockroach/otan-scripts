from sqlalchemy import create_engine
import time
import sys

if len(sys.argv) != 3:
    print('usage: {} <ip> <num_times>'.format(sys.argv[0]))
    sys.exit(1)
connect_args = {'sslmode': 'disable'}
engine = create_engine(
    'cockroachdb://root@{}:26257/defaultdb'.format(sys.argv[1]),
    connect_args=connect_args,
)

for i in range(1, int(sys.argv[2]) + 1):
    with engine.connect() as con:
        con.execute('SET experimental_enable_temp_tables = true')
        t = time.time()
        con.execute('CREATE TEMP TABLE a_{} (a int)'.format(i))
        total = time.time() - t
        print('iteration {} took {}s'.format(i, total))
