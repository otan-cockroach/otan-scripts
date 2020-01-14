
permutations = [
    'ON UPDATE NO ACTION',
    'ON UPDATE RESTRICT',
    'ON UPDATE SET NULL',
    'ON UPDATE SET DEFAULT',
    'ON UPDATE CASCADE',
]

print("""statement ok
CREATE TABLE t1 (a INT PRIMARY KEY); CREATE TABLE t2 (a INT DEFAULT 1)
""")

for first in permutations:
    for second in permutations:

        print("""# '{}', followed by '{}'
statement ok
ALTER TABLE t2 ADD CONSTRAINT fk1 FOREIGN KEY (a) REFERENCES t1 {}; ALTER TABLE t2 ADD CONSTRAINT fk2 FOREIGN KEY (a) REFERENCES t1 {}

statement ok
insert into t1 values (123); insert into t2 values (123)
""".format(first, second, first, second))

        expected = "\n123"

        # swap to make logic easier.
        if 'NO ACTION' in first or 'RESTRICT' in first:
            temp = first
            first = second
            second = temp

        if 'SET DEFAULT' in first:
            print("statement error value \\[1\\] not found in t1@primary \\[a\\]")
        elif 'CASCADE' in first or 'SET NULL' in first:
            if 'CASCADE' in first:
                expected = "\n2"
            elif 'SET NULL' in first:
                expected = "\nNULL"
            else:
                assert False, "{}, {}".format(first, second)
            print("statement ok")
        elif 'NO ACTION' in second or 'RESTRICT' in second:
            print('statement error foreign key violation: values \\[123\\] in columns \\[a\\] referenced in table "t2"')
        else:
            assert False, "{}, {}".format(first, second)
        print("""UPDATE t1 SET a = 2 WHERE a = 123

query I
SELECT * FROM t2
----{}

statement ok
ALTER TABLE t2 DROP CONSTRAINT fk1; ALTER TABLE t2 DROP CONSTRAINT fk2; TRUNCATE TABLE t2; TRUNCATE TABLE t1
""".format(expected))

print("""statement ok
DROP TABLE t2 CASCADE; DROP TABLE t1 CASCADE

""")
