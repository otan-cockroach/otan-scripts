DROP TABLE IF EXISTS seed;

CREATE TABLE IF NOT EXISTS seed AS
	SELECT
		g::INT2 AS _int2,
		g::INT4 AS _int4,
		g::INT8 AS _int8,
		g::FLOAT4 AS _float4,
		g::FLOAT8 AS _float8,
		'2001-01-01'::DATE + g AS _date,
		'2001-01-01'::TIMESTAMP + g * '1 day'::INTERVAL AS _timestamp,
		'2001-01-01'::TIMESTAMPTZ + g * '1 day'::INTERVAL AS _timestamptz,
		g * '1 day'::INTERVAL AS _interval,
		g % 2 = 1 AS _bool,
		g::DECIMAL AS _decimal,
		g::STRING AS _string,
		g::STRING::BYTES AS _bytes,
		substring('00000000-0000-0000-0000-' || g::STRING || '00000000000', 1, 36)::UUID AS _uuid,
		'0.0.0.0'::INET + g AS _inet,
		g::STRING::JSONB AS _jsonb
	FROM
		generate_series(1, 5) AS g;

INSERT INTO seed DEFAULT VALUES;
CREATE INDEX on seed (_int8, _float8, _date);
CREATE INVERTED INDEX on seed (_jsonb);

SET statement_timeout='1m0s';

SELECT
	tab_3._string AS col_1,
	'\x44581bd515714a05':::BYTES AS col_2,
	'5947:bfc:4571:b290:3be2:33f6:7782:4238/97':::INET AS col_3
FROM
	defaultdb.public.seed@[0] AS tab_1
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2 ON (tab_1._string) = (tab_2._string),
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_3
WHERE
	(false AND (NULL OR tab_3._bool))
ORDER BY
	tab_2._interval, tab_2._timestamp ASC
LIMIT
	93:::INT8;

SELECT
	tab_8._inet AS col_4
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_4,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_5
	RIGHT JOIN defaultdb.public.seed@[0] AS tab_6
		JOIN defaultdb.public.seed@[0] AS tab_7 ON
				(tab_6._int8) = (tab_7._int8) AND (tab_6._interval) = (tab_7._interval) ON false,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_8
WHERE
	true
LIMIT
	82:::INT8;

WITH
	with_6 (col_15, col_16)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							NULL,
							(
								WITH
									with_5 (col_13)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(NULL),
														(
															'{"B&hgKnaVGV?/": [false, null, []], "foobar": {":G%V{^%k?[$B": [[], []], "Px|<KiVezf0": [], "b": null, "baz": {}, "foo": {"foobar": 0.6275399542302973}}, "i19VWl+s<1": ["foo"]}':::JSONB
														),
														(
															'{"62hf[VTz`x=m": {}, "baz": {";D$": {}, "foobar": {}}, "c": [], "foo": [{"%OHbh{": {}, "foo": [{}, []]}, [[]], null]}':::JSONB
														),
														(
															(
																WITH
																	with_1 (col_5)
																		AS (
																			SELECT
																				'02:21:11.165194+01:41:00':::TIMETZ
																					AS col_5
																			FROM
																				defaultdb.public.seed@[0] AS tab_9
																		),
																	with_3 (col_9)
																		AS (
																			SELECT
																				*
																			FROM
																				(
																					VALUES
																						(
																							ARRAY[e'\r\x1ez2\x059\x04e':::STRING:::NAME]
																						),
																						(
																							ARRAY['(':::STRING:::NAME,'j!iB3':::STRING:::NAME,e'\U00002603':::STRING,e'?6?\x0b\t\x15\x0eG':::STRING:::NAME]
																						),
																						(
																							ARRAY[e',\x16|S:':::STRING:::NAME,'"':::STRING]
																						),
																						(
																							(
																								SELECT
																									(
																										WITH
																											with_2
																												(col_6)
																												AS (
																													SELECT
																														*
																													FROM
																														(
																															VALUES
																																(
																																	'X':::STRING
																																),
																																(
																																	e'm%&<\x16Q%.6':::STRING
																																)
																														)
																															AS tab_12
																																(
																																	col_6
																																)
																												)
																										SELECT
																											NULL
																												AS col_7
																										FROM
																											with_2
																												AS cte_ref_1
																										WHERE
																											false
																										LIMIT
																											1:::INT8
																									)
																										AS col_8
																								FROM
																									defaultdb.public.seed
																										AS tab_10
																									JOIN defaultdb.public.seed
																											AS tab_11 ON
																											(tab_10._int8)
																											= (tab_11._int8)
																											AND (tab_10._float8)
																												= (tab_11._float8)
																								WHERE
																									true
																								ORDER BY
																									tab_11._date
																								LIMIT
																									1:::INT8
																							)
																						),
																						(
																							ARRAY['"':::STRING,e'\x06':::STRING:::NAME,e'N\x1c1b':::STRING:::NAME,'R':::STRING:::NAME,e'\'':::STRING,e'[\r)f':::STRING:::NAME]
																						)
																				)
																					AS tab_13 (col_9)
																		),
																	with_4 (col_11)
																		AS (
																			SELECT
																				*
																			FROM
																				(
																					VALUES
																						(
																							('15:56:35.185569':::TIME::TIME - (SELECT '09:53:08.89616':::TIME AS col_10 FROM defaultdb.public.seed@[0] AS tab_14 ORDER BY tab_14._float4 LIMIT 1:::INT8)::TIME)::INTERVAL
																						),
																						(
																							'66 years 10 mons 484 days 06:31:47.72114':::INTERVAL
																						),
																						(
																							'39 years 2 mons 74 days 17:25:40.979284':::INTERVAL
																						),
																						(
																							'-62 years -121 days -06:43:44.414501':::INTERVAL
																						),
																						(
																							age('1970-01-08 12:38:48.00014+00:00':::TIMESTAMPTZ::TIMESTAMPTZ, ('1970-01-11 13:46:11.000844+00:00':::TIMESTAMPTZ::TIMESTAMPTZ - '10 years 10 mons 709 days 11:41:07.668219':::INTERVAL::INTERVAL)::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL
																						),
																						(
																							'-24 years -2 mons -254 days -17:03:03.941931':::INTERVAL
																						)
																				)
																					AS tab_15 (col_11)
																		)
																SELECT
																	tab_16._jsonb AS col_12
																FROM
																	with_1 AS cte_ref_2,
																	defaultdb.public.seed@seed__int8__float8__date_idx
																		AS tab_16
																ORDER BY
																	tab_16._date ASC
																LIMIT
																	1:::INT8
															)
														)
												)
													AS tab_17 (col_13)
										)
								SELECT
									'1970-01-04 12:27:07.000104+00:00':::TIMESTAMP AS col_14
								FROM
									defaultdb.public.seed@[0] AS tab_18, with_5 AS cte_ref_3
								LIMIT
									1:::INT8
							)
						)
				)
					AS tab_19 (col_15, col_16)
		),
	with_7 (col_17) AS (SELECT * FROM (VALUES (NULL)) AS tab_20 (col_17))
SELECT
	(-0.2673390661936708):::FLOAT8 AS col_18,
	'1970-01-08 22:54:14.000814+00:00':::TIMESTAMP AS col_19,
	'{"^~&9^c.([M5": {"4mM[+": {}, "j,mNtRhPN2": {"-2xcR": 0.049612779427754966, "bar": false, "l&w50 5": "foobar"}}, "a": {"O!9L9": [".|IY"], "b": []}, "foo": {}, "gu#beP": "gn]1jUqa`&", "q+Ng$]@vqbc": {}}':::JSONB
		AS col_20,
	32767:::INT8 AS col_21,
	'10 years 2 mons 933 days 00:47:21.039182':::INTERVAL AS col_22,
	(-638820152):::INT8 AS col_23,
	tab_21._bytes AS col_24
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_21
LIMIT
	32:::INT8;

WITH
	with_8 (col_25)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('-53 years -8 mons -456 days -23:25:45.919799':::INTERVAL),
						(
							age('1970-01-05 05:32:55.000546+00:00':::TIMESTAMPTZ::TIMESTAMPTZ, experimental_strptime('':::STRING::STRING, NULL::STRING)::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL
						),
						('67 years 2 mons 301 days 05:45:01.599743':::INTERVAL),
						('20 years 6 mons 37 days 23:02:24.376914':::INTERVAL)
				)
					AS tab_22 (col_25)
		),
	with_9 (col_26)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						('1970-01-03 02:43:33.000583+00:00':::TIMESTAMP),
						('0001-01-01 00:00:00+00:00':::TIMESTAMP),
						('1970-01-10 20:12:28.00039+00:00':::TIMESTAMP)
				)
					AS tab_23 (col_26)
		)
SELECT
	concat_agg(tab_24._bytes::BYTES)::BYTES AS col_27, tab_24._float4 AS col_28
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_24, with_8 AS cte_ref_4
GROUP BY
	tab_24._float4, tab_24._bytes
HAVING
	bool_or(tab_24._bool::BOOL)::BOOL
LIMIT
	66:::INT8;

SELECT
	0:::INT8 AS col_34,
	false AS col_35,
	tab_28._interval AS col_36,
	tab_29._int2 AS col_37,
	tab_29._date AS col_38,
	'33.61.6.143/16':::INET AS col_39,
	tab_29._float8 AS col_40,
	tab_28._decimal AS col_41,
	false AS col_42,
	(-7272439967804699844):::INT8 AS col_43,
	tab_28._jsonb AS col_44,
	tab_29._timestamp AS col_45
FROM
	defaultdb.public.seed@[0] AS tab_28, defaultdb.public.seed@[0] AS tab_29
LIMIT
	95:::INT8;

WITH
	with_13 (col_46)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[3050020587:::OID,3334010416:::OID]),
						(ARRAY[1852014675:::OID]),
						(ARRAY[2819033710:::OID,2068896936:::OID,2835045999:::OID]),
						(ARRAY[36881807:::OID,0:::OID]),
						(ARRAY[3397501579:::OID,2522026445:::OID])
				)
					AS tab_30 (col_46)
		),
	with_14 (col_47)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('98a5469d-a6b9-48f4-ab69-213100c372a2':::UUID),
						('2f0dc2d0-dcc1-41a4-8390-ae7097b7c966':::UUID),
						('3178bb7b-c096-4559-ab83-d82c3afa0734':::UUID),
						(NULL),
						('00000000-0000-0000-0000-000000000000':::UUID)
				)
					AS tab_31 (col_47)
		)
SELECT
	'2f609763-c91b-43a0-b8ee-2f3ede215260':::UUID AS col_48
FROM
	with_14 AS cte_ref_6
WHERE
	true
ORDER BY
	cte_ref_6.col_47, cte_ref_6.col_47, cte_ref_6.col_47, cte_ref_6.col_47 DESC
LIMIT
	83:::INT8;

DELETE FROM defaultdb.public.seed AS tab_32 WHERE tab_32._bool;

INSERT
INTO
	defaultdb.public.seed AS tab_33
WITH
	with_15 (col_49)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('HJQW':::STRING),
						(e'|5N\x15>7':::STRING),
						(e'J\x12K\x03\x1eI\x15P':::STRING),
						('dNF>':::STRING)
				)
					AS tab_34 (col_49)
		)
SELECT
	25208:::INT8 AS col_50,
	(-331244234):::INT8 AS col_51,
	7491393552723559775:::INT8 AS col_52,
	'NaN':::FLOAT8 AS col_53,
	round((acos(1.7976931348623157e+308:::FLOAT8::FLOAT8)::FLOAT8::FLOAT8 ^ (-2.183650019115348):::FLOAT8::FLOAT8)::FLOAT8::FLOAT8)::FLOAT8
		AS col_54,
	NULL AS col_55,
	'1970-01-06 11:37:40.000307+00:00':::TIMESTAMP AS col_56,
	NULL AS col_57,
	'-77 years -1 mons -348 days -23:49:33.578671':::INTERVAL AS col_58,
	false AS col_59,
	31178111036.59175978:::DECIMAL AS col_60,
	e'\U00002603':::STRING AS col_61,
	'\xf77df6fd7e42b995':::BYTES AS col_62,
	'c9ac482a-c79e-48b7-98c2-c274d24313c9':::UUID AS col_63,
	NULL AS col_64,
	NULL AS col_65;

DELETE FROM defaultdb.public.seed AS tab_38 ORDER BY tab_38._float4 DESC LIMIT 68:::INT8;

WITH
	with_18 (col_85)
		AS (SELECT * FROM (VALUES (e'mN\x01p QT\x0e':::STRING:::NAME), ('g':::STRING:::NAME)) AS tab_39 (col_85))
SELECT
	date_trunc('sL':::STRING::STRING, NULL::TIME)::INTERVAL AS col_86,
	tab_40._float4 AS col_87,
	(-7607631.589473608565):::DECIMAL AS col_88,
	true AS col_89,
	(-29086):::INT8 AS col_90,
	tab_40._bytes AS col_91,
	tab_40._int4 AS col_92,
	'1970-01-05 10:33:19.000469+00:00':::TIMESTAMPTZ AS col_93,
	timezone('Z1':::STRING::STRING, tab_40._string::STRING)::TIMESTAMP AS col_94
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_40
WHERE
	tab_40._bool;

SELECT
	tab_42._decimal AS col_95
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_41,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_42
WHERE
	tab_41._bool;

SELECT
	tab_43._int2 AS col_96,
	tab_43._decimal AS col_97,
	tab_43._date AS col_98,
	'6e38136c-4f62-47ad-8869-e6907c606485':::UUID AS col_99,
	tab_43._float4 AS col_100,
	0.9362409102741291:::FLOAT8 AS col_101
FROM
	defaultdb.public.seed@[0] AS tab_43
WHERE
	false
ORDER BY
	tab_43._bytes ASC;

UPDATE defaultdb.public.seed AS tab_44 SET _bytes = '\x6c54fb29360227':::BYTES, _int2 = tab_44._int4;

INSERT
INTO
	defaultdb.public.seed AS tab_45
WITH
	with_19 (col_102) AS (SELECT * FROM (VALUES (677798775:::OID)) AS tab_46 (col_102))
SELECT
	tab_47._int8 AS col_103,
	(-1):::INT8 AS col_104,
	tab_47._int4 AS col_105,
	tab_47._float4 AS col_106,
	tab_47._float4 AS col_107,
	tab_49._date AS col_108,
	tab_47._timestamp AS col_109,
	tab_47._timestamptz AS col_110,
	tab_47._interval AS col_111,
	tab_47._bool AS col_112,
	tab_47._decimal AS col_113,
	e'\'':::STRING AS col_114,
	tab_47._bytes AS col_115,
	tab_47._uuid AS col_116,
	'0.0.0.0/0':::INET AS col_117,
	'[true, 0.9281093072499578]':::JSONB AS col_118
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_47,
	defaultdb.public.seed AS tab_48
	JOIN defaultdb.public.seed AS tab_49 ON (tab_48._int8) = (tab_49._int8) AND (tab_48._float8) = (tab_49._float8),
	with_19 AS cte_ref_7,
	with_19 AS cte_ref_8
WHERE
	tab_47._bool;

UPDATE
	defaultdb.public.seed AS tab_50
SET
	_int4 = (-1229388789):::INT8,
	_uuid = 'ebaa14f8-98c3-47f0-b223-f36ae2eb56f8':::UUID,
	_inet = '4285:2927:24c7:3d09:f6c5:7535:e311:8456/113':::INET,
	_decimal = 3.884959695215375044E+30:::DECIMAL,
	_interval = tab_50._interval
WHERE
	true
ORDER BY
	tab_50._bytes DESC, tab_50._string DESC, tab_50._int2
LIMIT
	4:::INT8;

SELECT
	stddev(tab_51._float8::FLOAT8) OVER (PARTITION BY tab_51._float8)::FLOAT8 AS col_119
FROM
	defaultdb.public.seed@[0] AS tab_51
WHERE
	not_ilike_escape(tab_51._string::STRING, e']s\x05T}A':::STRING::STRING, e'\fu\x7foOLY':::STRING::STRING)::BOOL
GROUP BY
	tab_51._float8
HAVING
	max(tab_51._bool::BOOL)::BOOL
ORDER BY
	tab_51._float8
LIMIT
	1:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_52
SELECT
	10636:::INT8 AS col_120,
	NULL AS col_121,
	NULL AS col_122,
	0.5226197242736816:::FLOAT8 AS col_123,
	NULL AS col_124,
	'1975-12-10':::DATE AS col_125,
	NULL AS col_126,
	'1970-01-08 00:19:56.000566+00:00':::TIMESTAMPTZ AS col_127,
	'65 years 2 mons 406 days 22:59:13.2907':::INTERVAL AS col_128,
	true AS col_129,
	NULL AS col_130,
	e'\U00002603':::STRING AS col_131,
	'\xc548':::BYTES AS col_132,
	'45bb0b45-9df9-4f5c-8c56-e94cc2f928b9':::UUID AS col_133,
	NULL AS col_134,
	'1':::JSONB AS col_135
LIMIT
	68:::INT8;

WITH
	with_20 (col_136)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-1918877379):::INT8),
						(250010501:::INT8),
						(2147483647:::INT8),
						(CASE WHEN NULL THEN 1729394041:::INT8 ELSE (-1496769954):::INT8 END)
				)
					AS tab_53 (col_136)
		),
	with_21 (col_137) AS (SELECT * FROM (VALUES ('':::STRING), (NULL)) AS tab_54 (col_137)),
	with_22 (col_138)
		AS (
			SELECT
				*
			FROM
				(VALUES (B'01100001101000010000100011100001010000101'), (NULL), (NULL), (NULL)) AS tab_55 (col_138)
		)
SELECT
	tab_56._jsonb AS col_139,
	tab_56._int2 AS col_140,
	0.525048553943634:::FLOAT8 AS col_141,
	'1970-01-03 11:17:03.000494+00:00':::TIMESTAMP AS col_142,
	tab_56._bytes AS col_143,
	'1981-10-04':::DATE AS col_144,
	NULL AS col_145,
	'45 years 9 mons 656 days 20:35:34.058637':::INTERVAL AS col_146,
	(-389144030327638863):::INT8 AS col_147
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_56
LIMIT
	17:::INT8;

WITH
	with_23 (col_148)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(5e-324:::FLOAT8),
						(NULL),
						(0.40639641574549756:::FLOAT8),
						(0.9876380538137292:::FLOAT8),
						(1.401298464324817e-45:::FLOAT8),
						((-1.9161310968411935):::FLOAT8)
				)
					AS tab_57 (col_148)
		),
	with_24 (col_149)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							e'[{"G=Yw=?o": {"Gio `\\"5\'cr_": {}, "foo": false}, "c": [], "foobar": ["foo"]}, {"<w\\"NA@Nc\'": true}, [null]]':::JSONB
						),
						('1':::JSONB),
						('null':::JSONB),
						(
							e'[[[{"b": {"a": false}, "foobar": {}}, {}], {"PQl.x-$M<\\"\\\\": {}, "_V6h;DgDua,N": ":RX", "{:l": {"a": {}}}, true, {}]]':::JSONB
						),
						((NULL::JSONB->'-':::STRING::STRING)::JSONB)
				)
					AS tab_58 (col_149)
		),
	with_25 (col_150)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-0.9651506758168638):::FLOAT8),
						(0.3910248994951866:::FLOAT8),
						((-1.0755630881983977):::FLOAT8)
				)
					AS tab_59 (col_150)
		)
SELECT
	cte_ref_9.col_149 AS col_151
FROM
	with_24 AS cte_ref_9
WHERE
	false
LIMIT
	73:::INT8;

SELECT
	CASE WHEN false THEN tab_61._date ELSE tab_60._date END AS col_152,
	tab_61._date AS col_153,
	'1970-05-30':::DATE AS col_154,
	tab_60._date AS col_155
FROM
	defaultdb.public.seed AS tab_60
	JOIN defaultdb.public.seed AS tab_61 ON (tab_60._int8) = (tab_61._int8) AND (tab_60._float8) = (tab_61._float8)
WHERE
	true
ORDER BY
	tab_61._date, tab_61._date, tab_61._date ASC, tab_60._date DESC, tab_61._date ASC;

SELECT '-infinity':::DATE AS col_156 LIMIT 48:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_62
SELECT
	tab_64._int2 AS col_157,
	1837491151:::INT8 AS col_158,
	tab_63._int2 AS col_159,
	tab_64._float8 AS col_160,
	0.13115427065697688:::FLOAT8 AS col_161,
	NULL AS col_162,
	tab_64._timestamp AS col_163,
	'3000-01-01 00:00:00+00:00':::TIMESTAMPTZ AS col_164,
	tab_64._interval AS col_165,
	tab_63._bool AS col_166,
	NULL AS col_167,
	tab_64._string AS col_168,
	CASE WHEN false THEN tab_64._bytes ELSE '\x03c63b':::BYTES END AS col_169,
	tab_63._uuid AS col_170,
	NULL AS col_171,
	tab_63._jsonb AS col_172
FROM
	defaultdb.public.seed@[0] AS tab_63, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_64
ORDER BY
	tab_63._string;

SELECT
	tab_65._bool AS col_173,
	1.3358941596441787:::FLOAT8 AS col_174,
	NULL AS col_175,
	tab_65._decimal AS col_176,
	'9a8c08f7-e47a-413a-a67a-24071fe0261a':::UUID AS col_177,
	NULL AS col_178,
	tab_65._int4 AS col_179,
	0.35067835450172424:::FLOAT8 AS col_180,
	'-9 years -1 mons -12 days -16:43:58.414589':::INTERVAL AS col_181,
	tab_65._inet AS col_182,
	e'\x16uXR+i1H$':::STRING AS col_183,
	tab_65._timestamp AS col_184,
	tab_65._int4 AS col_185,
	tab_65._bytes AS col_186,
	'1970-01-03 05:10:01.000131+00:00':::TIMESTAMPTZ AS col_187,
	tab_65._int2 AS col_188
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_65;

SELECT
	tab_67._date AS col_189, '1984-11-09':::DATE AS col_190
FROM
	defaultdb.public.seed AS tab_66 JOIN defaultdb.public.seed AS tab_67 ON (tab_66._int8) = (tab_67._int8)
WHERE
	false
LIMIT
	89:::INT8;

WITH
	with_26 (col_191)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('ca89ee6a-fb81-4275-b217-776a07188de2':::UUID),
						('4d00779d-38ff-461c-a7fb-fe523f9f876e':::UUID),
						('80d84a6c-e759-4e1f-97ac-64b81bff331b':::UUID),
						('c377fbb0-6dee-4521-990e-29b4823460cd':::UUID),
						('ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID),
						(crdb_internal.cluster_id()::UUID)
				)
					AS tab_68 (col_191)
		),
	with_27 (col_192) AS (SELECT * FROM (VALUES ('"':::STRING), (e'q{H;`\x15ma\x13':::STRING)) AS tab_69 (col_192))
SELECT
	count(*) AS col_193
FROM
	defaultdb.public.seed@[0] AS tab_70
WHERE
	false
GROUP BY
	tab_70._jsonb
HAVING
	crdb_internal.is_admin()::BOOL
LIMIT
	13:::INT8;

WITH
	with_28 (col_194, col_195)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL, NULL),
						((-8672701598987972973):::INT8, 127:::INT8),
						(8424582118369836479:::INT8, NULL),
						(NULL, NULL),
						(
							((-8639585589863694255):::INT8::INT8 ^ 8187640899391208905:::INT8::INT8)::INT8,
							892596275:::INT8
						),
						((-167361940146123957):::INT8, (-1):::INT8)
				)
					AS tab_71 (col_194, col_195)
		)
SELECT
	(-2.181187391281128):::FLOAT8 AS col_196,
	tab_72._int8 AS col_197,
	'-51 years -1 mons -445 days -07:26:50.01951':::INTERVAL AS col_198,
	2.1805184060890066:::FLOAT8 AS col_199
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_72
WHERE
	tab_72._bool;

WITH
	with_29 (col_200) AS (SELECT * FROM (VALUES (242202718:::OID)) AS tab_73 (col_200))
SELECT
	tab_75._date AS col_201, '1972-10-30':::DATE AS col_202, tab_75._date AS col_203, '1972-04-05':::DATE AS col_204
FROM
	defaultdb.public.seed AS tab_74 JOIN defaultdb.public.seed AS tab_75 ON (tab_74._int8) = (tab_75._int8)
WHERE
	true
LIMIT
	85:::INT8;

WITH
	with_30 (col_205) AS (SELECT * FROM (VALUES (true)) AS tab_76 (col_205)),
	with_31 (col_206)
		AS (SELECT * FROM (VALUES (3883446927:::OID), (1635934217:::OID), (3137881646:::OID)) AS tab_77 (col_206))
SELECT
	(-0.46183450999490105):::FLOAT8 AS col_207
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_78
WHERE
	tab_78._bool
ORDER BY
	tab_78._inet DESC, tab_78._decimal DESC
LIMIT
	30:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_79
SELECT
	(-16931):::INT8 AS col_208,
	(-1928732751):::INT8 AS col_209,
	COALESCE((-7422667977534137036):::INT8, 7204931852940955314:::INT8) AS col_210,
	(-0.78591388463974):::FLOAT8 AS col_211,
	(-1.4642508877646632):::FLOAT8 AS col_212,
	'1990-04-09':::DATE AS col_213,
	'0001-01-01 00:00:00+00:00':::TIMESTAMP AS col_214,
	COALESCE(NULL, '1970-01-06 08:16:41.000635+00:00':::TIMESTAMPTZ) AS col_215,
	'-10 years -2 mons -897 days -04:22:44.097649':::INTERVAL AS col_216,
	false AS col_217,
	(-7.937131290750614427E+22):::DECIMAL AS col_218,
	NULL AS col_219,
	'\x1a':::BYTES AS col_220,
	'cbc7a57b-1a62-4b74-86ca-41f9191a1acc':::UUID AS col_221,
	'6719:c93b:f7f7:8a95:2eff:bb3:e8b6:88ea/96':::INET AS col_222,
	e'{"bar": [{}], "c": [{"!(={,n{w 7": {}, "$j{&;+!alob": [], "bar": {"b": true}, "baz": {}, "foobar": null, "sY\\"$h2-": {}}, {"foobar": [null]}], "m{uQ8>pl": []}':::JSONB
		AS col_223
LIMIT
	13:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_80 (_int2, _int8, _float4, _float8, _date, _bool, _decimal, _string, _jsonb)
SELECT
	tab_85._int4 AS col_224,
	tab_86._int4 AS col_225,
	tab_82._float4 AS col_226,
	tab_86._float8 AS col_227,
	'1979-05-10':::DATE AS col_228,
	tab_81._bool AS col_229,
	(-5.88225115230437546E+20):::DECIMAL AS col_230,
	tab_86._string AS col_231,
	'1':::JSONB AS col_232
FROM
	defaultdb.public.seed@[0] AS tab_81
	INNER JOIN defaultdb.public.seed@[0] AS tab_82 ON NULL
	CROSS JOIN defaultdb.public.seed AS tab_83
		JOIN defaultdb.public.seed AS tab_84 ON (tab_83._jsonb) = (tab_84._jsonb),
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_85,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_86
WHERE
	tab_86._bool
ORDER BY
	tab_81._decimal DESC
LIMIT
	36:::INT8;

WITH
	with_32 (col_233)
		AS (SELECT * FROM (VALUES (NULL), ('':::STRING), ('y':::STRING), ('f':::STRING)) AS tab_87 (col_233))
SELECT
	count(*) AS col_234
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_88
GROUP BY
	tab_88._jsonb
LIMIT
	64:::INT8;

SELECT
	current_timestamp():::DATE::DATE AS col_235,
	NULL AS col_236,
	(-933158129):::INT8 AS col_237,
	tab_89._timestamp AS col_238,
	tab_89._jsonb AS col_239,
	0.7045685052871704:::FLOAT8 AS col_240,
	680559151712.2185738:::DECIMAL AS col_241,
	tab_89._inet AS col_242,
	tab_89._bytes AS col_243,
	tab_89._interval AS col_244
FROM
	defaultdb.public.seed@[0] AS tab_89;

SELECT 417261746:::OID AS col_245;

WITH
	with_33 (col_246)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-1):::DECIMAL),
						(47363761847699.91960:::DECIMAL),
						((-732.1594696497689489):::DECIMAL),
						(6607648.392499806511:::DECIMAL)
				)
					AS tab_90 (col_246)
		)
SELECT
	1:::DECIMAL AS col_247
FROM
	with_33 AS cte_ref_10
ORDER BY
	cte_ref_10.col_246 DESC, cte_ref_10.col_246 ASC, cte_ref_10.col_246 DESC;

SELECT NULL AS col_248 LIMIT 86:::INT8;

WITH
	with_34 (col_249)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							ARRAY[B'1101100011001001011100001010',B'0001001101101001001100000100',B'0010100011001011011101000100']
						),
						(ARRAY[B'1001100100001111110011111101']),
						(
							ARRAY[B'0101010110000111101100001111',B'0001000111011111101101100011',B'0001101111111000111011100110']
						),
						(
							ARRAY[B'0011101101010111011110010010',B'0111010111111110011001001001',B'0000000000000000000000000000000000000000000000000000000000000000',B'1000100111001111110001010110']
						),
						(
							ARRAY[B'0100100110010100101111101001',B'1110110100011111000100010011',B'0100110011001101011001110101',B'1000110000011001010011100000',B'1100101001000001001011001100']
						)
				)
					AS tab_91 (col_249)
		)
SELECT
	tab_92._timestamptz AS col_250, tab_92._decimal AS col_251
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_92
WHERE
	tab_92._bool
LIMIT
	7:::INT8;

SELECT
	concat_agg(tab_93._string::STRING)::STRING AS col_252
FROM
	defaultdb.public.seed@[0] AS tab_93
GROUP BY
	tab_93._string
ORDER BY
	tab_93._string, tab_93._string DESC;

INSERT
INTO
	defaultdb.public.seed AS tab_95 (_int2, _int4, _int8, _float8, _date, _timestamp, _timestamptz, _bool, _uuid, _inet)
SELECT
	tab_96._int2 AS col_253,
	958272998:::INT8 AS col_254,
	9223372036854775807:::INT8 AS col_255,
	tab_97._float4 AS col_256,
	'1996-09-08':::DATE AS col_257,
	'1970-01-09 17:51:20.00007+00:00':::TIMESTAMP AS col_258,
	tab_97._timestamptz AS col_259,
	tab_96._bool AS col_260,
	'e520270f-16bf-49b6-b0e9-f8bde6c100b4':::UUID AS col_261,
	tab_97._inet AS col_262
FROM
	defaultdb.public.seed@[0] AS tab_96
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_97 ON
			(tab_96._inet) = (tab_97._inet)
			AND (tab_96._int4) = (tab_97._int2)
			AND (tab_96._interval) = (tab_97._interval)
WHERE
	(tab_96._jsonb::JSONB->>e'4q5\x15':::STRING::STRING)::STRING SIMILAR TO '0uzb':::STRING
ORDER BY
	tab_96._interval DESC, tab_96._int2 ASC, tab_97._int2, tab_96._bytes DESC
LIMIT
	85:::INT8;

WITH
	with_35 (col_279)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						('1970-01-03 20:25:23.000944+00:00':::TIMESTAMPTZ),
						('1970-01-11 16:12:11.000464+00:00':::TIMESTAMPTZ),
						('1970-01-10 02:44:24.000907+00:00':::TIMESTAMPTZ),
						(NULL),
						('1970-01-06 03:05:35.000722+00:00':::TIMESTAMPTZ)
				)
					AS tab_100 (col_279)
		),
	with_36 (col_280) AS (SELECT e'\t) [\x18Y~{R':::STRING AS col_280 FROM with_35 AS cte_ref_11 WHERE true)
SELECT
	tab_101._int8 AS col_281,
	NULL AS col_282,
	tab_101._int2 AS col_283,
	'1970-01-09 15:37:49.000735+00:00':::TIMESTAMP AS col_284,
	tab_101._int8 AS col_285,
	1.401298464324817e-45:::FLOAT8 AS col_286
FROM
	defaultdb.public.seed@[0] AS tab_101;

WITH
	with_37 (col_287)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(ARRAY[(-3459):::INT8,(-15550):::INT8]),
						(NULL),
						(ARRAY[(-10585):::INT8,(-29884):::INT8,(-8607):::INT8]),
						(ARRAY[26578:::INT8,2213:::INT8,(-20290):::INT8,31907:::INT8,(-11332):::INT8,(-5491):::INT8]),
						(NULL)
				)
					AS tab_102 (col_287)
		),
	with_38 (col_288) AS (SELECT * FROM (VALUES ((-0.03313590472864336):::FLOAT8)) AS tab_103 (col_288)),
	with_39 (col_289) AS (SELECT * FROM (VALUES (NULL), (NULL)) AS tab_104 (col_289))
SELECT
	'1990-02-14':::DATE AS col_290
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_105
WHERE
	tab_105._bool
ORDER BY
	tab_105._interval;

UPDATE defaultdb.public.seed AS tab_106 SET _uuid = 'a18dc0dd-5024-47a0-ad28-fa48ed84fc42':::UUID, _float4 = NULL;

SELECT
	tab_108._int4 AS col_291, '-10 years -265 days -15:43:10.058936':::INTERVAL AS col_292, tab_107._uuid AS col_293
FROM
	defaultdb.public.seed@[0] AS tab_107, defaultdb.public.seed@[0] AS tab_108
WHERE
	NULL;

INSERT
INTO
	defaultdb.public.seed AS tab_109
WITH
	with_40 (col_294)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(B'000000000101000010101001'),
						(B'0111010111001100100100001001000110010101010000100011001001101110101111110111101111'),
						(B'10101111101010'),
						(B'000010001001001101')
				)
					AS tab_110 (col_294)
		)
SELECT
	tab_111._int2 AS col_295,
	tab_111._int4 AS col_296,
	crdb_internal.get_namespace_id(tab_111._int8::INT8, tab_111._string::STRING)::INT8 AS col_297,
	tab_111._float8 AS col_298,
	(
		SELECT
			tab_111._float4 AS col_299
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_112
			JOIN defaultdb.public.seed@[0] AS tab_113 ON (tab_112._int4) = (tab_113._int2)
		WHERE
			true
		LIMIT
			1:::INT8
	)
		AS col_300,
	NULL AS col_301,
	tab_111._timestamp AS col_302,
	tab_111._timestamptz AS col_303,
	NULL AS col_304,
	tab_111._bool AS col_305,
	tab_111._decimal AS col_306,
	e'QUzz`\x13oZ':::STRING AS col_307,
	tab_111._bytes AS col_308,
	tab_111._uuid AS col_309,
	'63.74.224.109/18':::INET AS col_310,
	'[{"$MRF": "_#]_Q6)FhX", "=0*d05_3": {"a": [[{}, 1.2031259171082596, null], null]}}, 0.30039327541394756, {"Fumy ]": "pLt#PHfJq", "foo": [{}]}, false, {}]':::JSONB
		AS col_311
FROM
	defaultdb.public.seed@[0] AS tab_111, with_40 AS cte_ref_12
LIMIT
	56:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_114 (_float8, _date, _timestamp, _timestamptz, _interval, _bool, _uuid)
SELECT
	1.0924085939845454:::FLOAT8 AS col_312,
	'1977-10-17':::DATE AS col_313,
	tab_115._timestamp AS col_314,
	tab_115._timestamptz AS col_315,
	'-30 years -1 mons -360 days -22:44:45.077976':::INTERVAL AS col_316,
	('0.0.0.0/0':::INET::INET << tab_115._inet::INET)::BOOL AS col_317,
	tab_115._uuid AS col_318
FROM
	defaultdb.public.seed@[0] AS tab_115
ORDER BY
	tab_115._timestamp DESC,
	tab_115._int8 ASC,
	tab_115._string DESC,
	tab_115._timestamp ASC,
	tab_115._float8 DESC,
	tab_115._uuid DESC,
	tab_115._timestamp ASC,
	tab_115._timestamptz DESC,
	tab_115._float4 DESC,
	tab_115._float8
LIMIT
	4:::INT8;

WITH
	with_41 (col_319, col_320) AS (SELECT * FROM (VALUES ('\x':::BYTES, '-m+':::STRING)) AS tab_116 (col_319, col_320)),
	with_42 (col_321)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(ARRAY[22594:::INT8,17996:::INT8]),
						(
							ARRAY[27201:::INT8,(-26456):::INT8,(-21676):::INT8,(-785):::INT8,(-7501):::INT8,(-30632):::INT8]
						),
						(NULL),
						(ARRAY[19389:::INT8,14461:::INT8])
				)
					AS tab_117 (col_321)
		),
	with_43 (col_322)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-07 19:24:45.000687+00:00':::TIMESTAMPTZ),
						('1970-01-04 11:34:42.000397+00:00':::TIMESTAMPTZ),
						('1970-01-01 20:12:18.000804+00:00':::TIMESTAMPTZ),
						('1970-01-05 21:07:40.000583+00:00':::TIMESTAMPTZ)
				)
					AS tab_118 (col_322)
		)
SELECT
	cte_ref_13.col_322 AS col_323
FROM
	with_43 AS cte_ref_13
LIMIT
	15:::INT8;

SELECT tab_119._bytes AS col_324 FROM defaultdb.public.seed@[0] AS tab_119 WHERE false LIMIT 18:::INT8;

SELECT
	NULL AS col_325,
	tab_120._bytes AS col_326,
	tab_121._date AS col_327,
	'-21 years -3 mons -43 days -02:22:10.238691':::INTERVAL AS col_328,
	tab_120._string AS col_329,
	tab_120._uuid AS col_330
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_120,
	defaultdb.public.seed AS tab_121
	JOIN defaultdb.public.seed AS tab_122 ON (tab_121._int8) = (tab_122._int8) AND (tab_121._float8) = (tab_122._float8)
LIMIT
	70:::INT8;

SELECT 947761805:::INT8 AS col_331 LIMIT 95:::INT8;

WITH
	with_44 (col_332)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-870331131):::INT8),
						((-1137823977):::INT8),
						((-560032496):::INT8),
						(1745430864:::INT8),
						(1339287975:::INT8),
						(NULL)
				)
					AS tab_123 (col_332)
		),
	with_45 (col_333)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1978-07-13':::DATE),
						('1970-01-01':::DATE),
						(NULL),
						(localtimestamp():::DATE::DATE),
						('1996-04-26':::DATE)
				)
					AS tab_124 (col_333)
		)
SELECT
	tab_125._jsonb AS col_334,
	tab_125._bool AS col_335,
	tab_125._int8 AS col_336,
	'1970-01-03 19:37:20.000743+00:00':::TIMESTAMP AS col_337,
	'1973-09-04':::DATE AS col_338,
	(-0.3812878429889679):::FLOAT8 AS col_339,
	tab_125._decimal AS col_340,
	'\xc297295adc':::BYTES AS col_341,
	tab_125._string AS col_342,
	NULL AS col_343,
	tab_125._int4 AS col_344
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_125
WHERE
	NULL
LIMIT
	40:::INT8;

SELECT
	'00000000-0000-0000-0000-000000000000':::UUID AS col_345,
	NULL AS col_346,
	1.1386334068100243:::FLOAT8 AS col_347,
	'1970-01-07 10:11:46.000078+00:00':::TIMESTAMP AS col_348,
	1151897311654100082:::INT8 AS col_349
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_126
ORDER BY
	tab_126._string DESC
LIMIT
	97:::INT8;

WITH
	with_46 (col_350)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						((-0.9490031599998474):::FLOAT8),
						(0.7953453063964844:::FLOAT8),
						(0.44803935289382935:::FLOAT8),
						(2.124640703201294:::FLOAT8)
				)
					AS tab_127 (col_350)
		),
	with_47 (col_351)
		AS (
			SELECT
				*
			FROM
				(VALUES (3899583965:::OID), (552289688:::OID), (4082344275:::OID), (3855658384:::OID), (NULL))
					AS tab_128 (col_351)
		)
SELECT
	B'0101001101110011110101101101100111' AS col_352
LIMIT
	23:::INT8;

SELECT
	tab_129._float4 AS col_353, (-2.519966153638758):::FLOAT8 AS col_354
FROM
	defaultdb.public.seed@[0] AS tab_129
	JOIN defaultdb.public.seed@[0] AS tab_130 ON
			(tab_129._string) = (tab_130._string)
			AND (tab_129._uuid) = (tab_130._uuid)
			AND (tab_129._float8) = (tab_130._float4)
			AND (tab_129._timestamptz) = (tab_130._timestamptz)
			AND (tab_129._int8) = (tab_130._int4)
ORDER BY
	tab_129._timestamp DESC, tab_130._interval, tab_130._int4 ASC
LIMIT
	41:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_131 (_int2, _int8, _float8, _date, _bool, _string, _bytes, _uuid, _inet, _jsonb)
WITH
	with_48 (col_355, col_356)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							B'001001100111101011001001101011011000',
							ARRAY[(-26903):::INT8,(-25769):::INT8,11531:::INT8,32767:::INT8]
						),
						(B'010100000111010111000111000011111111', ARRAY[1403:::INT8,(-13076):::INT8])
				)
					AS tab_132 (col_355, col_356)
		),
	with_49 (col_357)
		AS (
			SELECT
				'1970-01-08 18:32:03.000496+00:00':::TIMESTAMPTZ AS col_357
			FROM
				defaultdb.public.seed@[0] AS tab_133
			WHERE
				tab_133._bool
		)
SELECT
	(-21827):::INT8 AS col_358,
	3656130910163147941:::INT8 AS col_359,
	0.9362666242797242:::FLOAT8 AS col_360,
	'1972-04-17':::DATE AS col_361,
	false AS col_362,
	NULL AS col_363,
	'\xddd97efe91f150a3':::BYTES AS col_364,
	'e7353093-ca29-448f-9d47-74e63a7640a8':::UUID AS col_365,
	'725e:d896:9d2c:8440:227c:f2d2:2bb6:9491/112':::INET AS col_366,
	'[[[{}, [], [], []], ["DL#"], {"2O%u6&6hh": true, "58esZ#||{": []}], {"+GnCB/}@Pa2}": null}, [{}]]':::JSONB
		AS col_367
LIMIT
	98:::INT8;

WITH
	with_50 (col_368, col_369)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1982-08-22':::DATE, '-47 years -9 mons -778 days -08:14:07.376285':::INTERVAL),
						('1991-03-02':::DATE, '-46 years -10 mons -321 days -02:56:52.083322':::INTERVAL),
						('1980-10-17':::DATE, '-1 years -11 mons -997 days -18:25:12.947446':::INTERVAL)
				)
					AS tab_134 (col_368, col_369)
		),
	with_53 (col_376)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(
								WITH
									with_51 (col_370)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														('':::STRING),
														(
															CASE
															WHEN true THEN e'<\nc(':::STRING
															ELSE e'\x1fU\x06}op\'\x0by':::STRING
															END
														),
														(COALESCE('|-o%?:TkT':::STRING, ';x^':::STRING)),
														(NULL)
												)
													AS tab_135 (col_370)
										),
									with_52 (col_371, col_372, col_373, col_374)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(
															B'010110',
															false,
															B'11011010001010000101110000',
															B'11001001101111111'
														)
												)
													AS tab_136 (col_371, col_372, col_373, col_374)
										)
								SELECT
									(NULL::INT8 << 5158754430005796854:::INT8::INT8)::INT8 AS col_375
								FROM
									with_51 AS cte_ref_14
								WHERE
									true
								LIMIT
									1:::INT8
							)
						),
						((-4803456813542503423):::INT8),
						(NULL)
				)
					AS tab_137 (col_376)
		),
	with_54 (col_377)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('-72 years -8 mons -650 days -02:50:41.990051':::INTERVAL),
						('82 years 11 mons 535 days 21:20:56.257115':::INTERVAL),
						(NULL),
						('70 years 3 mons 758 days 06:23:57.4005':::INTERVAL),
						(date_trunc(e'\n\\j^\f\x1bH':::STRING::STRING, NULL::TIME)::INTERVAL),
						('-64 years -10 mons -972 days -22:55:36.42361':::INTERVAL)
				)
					AS tab_138 (col_377)
		)
SELECT
	'-63 years -7 mons -988 days -11:03:58.277495':::INTERVAL AS col_378
FROM
	with_54 AS cte_ref_15;

SELECT
	tab_142._inet AS col_379,
	('21:44:50.968577+07:18:00':::TIMETZ::TIMETZ + tab_139._date::DATE)::TIMESTAMPTZ AS col_380,
	e'r?\x13':::STRING AS col_381,
	tab_142._bytes AS col_382,
	(-1.1150800483164072):::FLOAT8 AS col_383,
	tab_139._int2 AS col_384,
	e'\'y':::STRING AS col_385
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_139,
	defaultdb.public.seed AS tab_140
	JOIN defaultdb.public.seed AS tab_141 ON (tab_140._int8) = (tab_141._int8),
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_142
ORDER BY
	tab_142._bytes, tab_142._timestamptz DESC;

INSERT
INTO
	defaultdb.public.seed AS tab_143 (_int4, _int8, _timestamp, _interval, _bool, _string, _jsonb)
SELECT
	(-603088708):::INT8 AS col_386,
	(-4745846416318509488):::INT8 AS col_387,
	'-2000-01-01 00:00:00+00:00':::TIMESTAMP AS col_388,
	tab_144._interval AS col_389,
	tab_144._bool AS col_390,
	e'a\x0567\x06':::STRING AS col_391,
	tab_144._jsonb AS col_392
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_144
WHERE
	true;

SELECT
	2747648132456655152:::INT8 AS col_393, (-3801):::INT8 AS col_394, 0.30188490654133715:::FLOAT8 AS col_395
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_145
ORDER BY
	tab_145._float4,
	tab_145._inet DESC,
	tab_145._timestamp DESC,
	tab_145._int4 DESC,
	tab_145._int8 DESC,
	tab_145._bytes DESC,
	tab_145._string DESC,
	tab_145._bytes
LIMIT
	9:::INT8;

WITH
	with_55 (col_396)
		AS (
			SELECT
				*
			FROM
				(VALUES (e'z\x1f+\x15i?':::STRING), (e'\U00002603':::STRING), ('s"':::STRING)) AS tab_146 (col_396)
		),
	with_56 (col_397)
		AS (
			SELECT * FROM (VALUES ('00:00:00':::TIME)) AS tab_147 (col_397)
			INTERSECT ALL
				SELECT
					*
				FROM
					(
						VALUES
							('14:11:32.83602':::TIME),
							('18:51:01.604559':::TIME),
							('23:59:59.999999':::TIME),
							('13:46:11.780371':::TIME),
							('12:59:40.385109':::TIME),
							(NULL)
					)
						AS tab_148 (col_398)
		),
	with_57 (col_399)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((2405830177:::OID, 609860943:::OID, '22:06:09.242208-10:49:00':::TIMETZ)),
						((4185678046:::OID, 1318276180:::OID, '00:30:54.787369+14:51:00':::TIMETZ))
				)
					AS tab_149 (col_399)
		)
SELECT
	tab_150._date AS col_400, tab_150._interval AS col_401
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_150
WHERE
	NULL;

WITH
	with_58 (col_402)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(0.4215798898511147:::FLOAT8),
						((-0.5787732855107):::FLOAT8),
						(0.5625846247037147:::FLOAT8),
						(NULL),
						((-1.1869170580693482):::FLOAT8)
				)
					AS tab_151 (col_402)
		)
SELECT
	ln(cte_ref_16.col_402::FLOAT8)::FLOAT8 AS col_403
FROM
	with_58 AS cte_ref_16
WHERE
	(false AND false)
GROUP BY
	cte_ref_16.col_402;

SELECT
	count(*) AS col_404
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_152
WHERE
	true
GROUP BY
	tab_152._jsonb
HAVING
	not_ilike_escape('g&':::STRING::STRING, COALESCE(CASE WHEN false THEN experimental_strftime('1970-01-06 10:13:43.000836+00:00':::TIMESTAMPTZ::TIMESTAMPTZ, e'\x1ezbHVu\x1e9':::STRING::STRING)::STRING ELSE e'Vy\x1c':::STRING END, e'\'Ol[%':::STRING)::STRING, NULL::STRING)::BOOL
LIMIT
	47:::INT8;

UPDATE
	defaultdb.public.seed AS tab_153
SET
	_timestamptz = tab_153._timestamptz
WHERE
	tab_153._bool
ORDER BY
	tab_153._decimal
LIMIT
	65:::INT8;

SELECT
	'81 years 9 mons 882 days 01:05:57.573529':::INTERVAL AS col_405,
	NULL AS col_406,
	NULL AS col_407,
	tab_154._float4 AS col_408,
	2147483647:::INT8 AS col_409,
	8.488996706174677793E+22:::DECIMAL AS col_410,
	tab_154._timestamp AS col_411
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_154
WHERE
	tab_154._bool
ORDER BY
	tab_154._float8;

SELECT
	max(tab_155._date::DATE)::DATE AS col_412
FROM
	defaultdb.public.seed@[0] AS tab_155
WHERE
	tab_155._bool
GROUP BY
	tab_155._date, tab_155._int4, tab_155._decimal
HAVING
	bool_or(tab_155._bool::BOOL)::BOOL
ORDER BY
	tab_155._date, tab_155._int4, tab_155._date ASC
LIMIT
	55:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_156
		(_int4, _int8, _float4, _timestamp, _interval, _bool, _decimal, _bytes, _uuid, _inet)
SELECT
	2824375:::INT8 AS col_413,
	(-6834456454840535536):::INT8 AS col_414,
	tab_157._float4 AS col_415,
	'1970-01-08 02:26:49.000494+00:00':::TIMESTAMP AS col_416,
	'54 years 4 mons 667 days 19:06:22.470185':::INTERVAL AS col_417,
	tab_157._bool AS col_418,
	((-32768):::INT8::INT8 - tab_157._decimal::DECIMAL)::DECIMAL AS col_419,
	NULL AS col_420,
	tab_157._uuid AS col_421,
	tab_157._inet AS col_422
FROM
	defaultdb.public.seed@[0] AS tab_157
LIMIT
	80:::INT8;

WITH
	with_59 (col_426)
		AS (
			SELECT
				*
			FROM
				(VALUES (3741528850:::OID), (NULL), (211396483:::OID), (1480009104:::OID), (NULL)) AS tab_159 (col_426)
		),
	with_60 (col_427)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), (NULL), (NULL), (to_jsonb(650343882:::OID)::JSONB), (NULL)) AS tab_160 (col_427)
		),
	with_61 (col_428) AS (SELECT * FROM (VALUES (e'\x00':::STRING), ('0-*Go':::STRING:::NAME)) AS tab_161 (col_428))
SELECT
	tab_166._inet AS col_429,
	tab_162._bool AS col_430,
	tab_162._bool AS col_431,
	(-2.546023094459308633E+27):::DECIMAL AS col_432
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_162,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_163
	JOIN defaultdb.public.seed AS tab_164
		JOIN defaultdb.public.seed AS tab_165 ON (tab_164._jsonb) = (tab_165._jsonb) ON
			(tab_163._jsonb) = (tab_164._jsonb) AND (tab_163._jsonb) = (tab_165._jsonb)
	LEFT JOIN defaultdb.public.seed@[0] AS tab_166 ON false
WHERE
	tab_166._bool
ORDER BY
	tab_163._interval ASC, tab_162._decimal DESC
LIMIT
	48:::INT8;

SELECT (-0.22325442731380463):::FLOAT8 AS col_433, NULL AS col_434 LIMIT 76:::INT8;

SELECT
	0.20656977593898773:::FLOAT8 AS col_435,
	tab_168._date AS col_436,
	'9fc56cc0-945f-433b-b9c6-4de7974afa74':::UUID AS col_437,
	tab_169._bytes AS col_438,
	tab_169._bool AS col_439,
	tab_168._timestamptz AS col_440,
	tab_168._interval AS col_441,
	tab_167._timestamp AS col_442,
	'1970-01-06 10:50:11.000379+00:00':::TIMESTAMPTZ AS col_443
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_167,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_168,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_169
ORDER BY
	tab_169._inet, tab_169._uuid DESC, tab_167._timestamptz ASC, tab_168._uuid, tab_168._float4
LIMIT
	40:::INT8;

DELETE FROM defaultdb.public.seed AS tab_170 WHERE true;

SELECT e'\U00002603':::STRING AS col_446 LIMIT 93:::INT8;

SELECT
	tab_172._float8 AS col_447,
	tab_172._int8 AS col_448,
	'a6f8ff01-5b64-45dc-9d64-96d2cd5a8642':::UUID AS col_449,
	'88c:bdd3:107e:4bb1:544d:758f:a82c:b796/43':::INET AS col_450,
	tab_172._float4 AS col_451
FROM
	defaultdb.public.seed@[0] AS tab_172
WHERE
	false
ORDER BY
	tab_172._uuid
LIMIT
	61:::INT8;

UPDATE
	defaultdb.public.seed AS tab_176
SET
	_int8 = tab_176._int8, _float8 = tab_176._float4, _float4 = tab_176._float8, _timestamptz = tab_176._timestamptz
WHERE
	tab_176._bool;

WITH
	with_63 (col_468, col_469)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(4183445188:::OID, ARRAY[13236:::INT8,2159:::INT8,(-7787):::INT8]),
						(NULL, ARRAY[(-677):::INT8,17911:::INT8,(-4351):::INT8,22623:::INT8]),
						(1817941633:::OID, ARRAY[(-3786):::INT8,(-1792):::INT8]),
						(2322283106:::OID, ARRAY[(-1):::INT8])
				)
					AS tab_177 (col_468, col_469)
		),
	with_64 (col_470)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), ((-586685800):::INT8), (NULL), ((-551799842):::INT8), ((-848659199):::INT8))
					AS tab_178 (col_470)
		)
SELECT
	'-64 years -5 mons -865 days -17:21:53.482856':::INTERVAL AS col_471
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_179,
	defaultdb.public.seed@[0] AS tab_180,
	with_63 AS cte_ref_18
WHERE
	tab_179._bool;

SELECT
	6.443821413583336756E+22:::DECIMAL AS col_472
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_181
LIMIT
	12:::INT8;

SELECT e'\x7f[25:':::STRING:::NAME AS col_473 LIMIT 82:::INT8;

SELECT
	tab_182._uuid AS col_474,
	tab_182._int2 AS col_475,
	tab_182._int2 AS col_476,
	tab_182._inet AS col_477,
	tab_182._jsonb AS col_478,
	'1970-01-01 00:21:13.000896+00:00':::TIMESTAMPTZ AS col_479,
	(-5.72015126402620162E+23):::DECIMAL AS col_480,
	(-0.8931200288871177):::FLOAT8 AS col_481,
	'1971-04-14':::DATE AS col_482
FROM
	defaultdb.public.seed@[0] AS tab_182
LIMIT
	69:::INT8;

DELETE FROM
	defaultdb.public.seed AS tab_183
WHERE
	tab_183._bool
ORDER BY
	tab_183._decimal DESC, tab_183._float8
LIMIT
	81:::INT8;

WITH
	with_65 (col_483) AS (SELECT * FROM (VALUES (0:::OID), (NULL)) AS tab_184 (col_483)),
	with_66 (col_484)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(e'[\x19/':::STRING:::NAME),
						(e'Dn\x11X':::STRING:::NAME),
						(e'\x18Wj\x07 ,\x7f\x1c':::STRING:::NAME),
						('0b':::STRING:::NAME)
				)
					AS tab_185 (col_484)
		),
	with_67 (col_485)
		AS (
			SELECT
				*
			FROM
				(VALUES ('08:33:58.084942':::TIME), ('03:49:50.88447':::TIME), ('00:00:00':::TIME)) AS tab_186 (col_485)
		)
SELECT
	4115313952:::OID AS col_486
FROM
	with_65 AS cte_ref_19
GROUP BY
	cte_ref_19.col_483
LIMIT
	66:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_187
SELECT
	tab_189._int8 AS col_487,
	tab_189._int4 AS col_488,
	tab_189._int2 AS col_489,
	tab_189._float8 AS col_490,
	tab_188._float8 AS col_491,
	tab_188._date AS col_492,
	tab_189._timestamp AS col_493,
	tab_189._timestamptz AS col_494,
	tab_189._interval AS col_495,
	false AS col_496,
	tab_189._decimal AS col_497,
	(
		WITH
			with_68 (col_498)
				AS (
					SELECT
						*
					FROM
						(VALUES (NULL), ('8da:4c5e:d4f3:1dbd:207f:dd6d:36a0:6958/16':::INET), ('54.13.107.0/9':::INET))
							AS tab_190 (col_498)
				)
		SELECT
			tab_192._string AS col_499
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_191,
			defaultdb.public.seed@[0] AS tab_192
			JOIN defaultdb.public.seed@[0] AS tab_193 ON (tab_192._date) = (tab_193._date)
		WHERE
			true
		ORDER BY
			tab_193._inet ASC, tab_193._int2, tab_191._int4 ASC
		LIMIT
			1:::INT8
	)
		AS col_500,
	'\xd471e9c03b6abb':::BYTES AS col_501,
	'26b8fd0f-6a67-41cf-bb18-c6c736771689':::UUID AS col_502,
	'65.77.15.37/22':::INET AS col_503,
	tab_189._jsonb AS col_504
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_188, defaultdb.public.seed@[0] AS tab_189
LIMIT
	42:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_194 (_int4, _int8, _float4, _date, _timestamp, _timestamptz, _string, _inet, _jsonb)
SELECT
	DISTINCT
	1020691888:::INT8 AS col_505,
	fnv32('\xdf':::BYTES::BYTES)::INT8 AS col_506,
	(-0.39092060923576355):::FLOAT8 AS col_507,
	'1972-11-09':::DATE AS col_508,
	NULL AS col_509,
	'1970-01-11 05:20:43.0002+00:00':::TIMESTAMPTZ AS col_510,
	e'NKRm\x11S':::STRING AS col_511,
	'23.83.35.252/7':::INET AS col_512,
	NULL AS col_513;

SELECT
	'1f7ce28e-7580-4041-9b23-1f081ef049b0':::UUID AS col_514
FROM
	defaultdb.public.seed@[0] AS tab_195
ORDER BY
	tab_195._float4 DESC
LIMIT
	55:::INT8;

SELECT
	tab_196._int2 AS col_515,
	tab_196._date AS col_516,
	e'[0.10441799551819092, {"foobar": "f;z", "{ZOge\\\\oTs": true}, 0.1683017942122048, {}, "`mo+]0%@WL$T", [[], {}]]':::JSONB
		AS col_517,
	'1970-01-02 10:34:36.000316+00:00':::TIMESTAMP AS col_518,
	e'{"(}0-eK": {"bar": {"baz": {}}, "baz": []}, "\\\\\'(~\'": {"3q}": [[{}, {}]], "b": {"bar": 0.6933110987280516}}, "zMDn": true}':::JSONB
		AS col_519,
	tab_196._decimal AS col_520
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_196
	RIGHT JOIN defaultdb.public.seed AS tab_197
		JOIN defaultdb.public.seed AS tab_198 ON (tab_197._jsonb) = (tab_198._jsonb) ON true
LIMIT
	100:::INT8;

INSERT INTO defaultdb.public.seed AS tab_199 DEFAULT VALUES;

SELECT
	(-6.607766309898992222E+26):::DECIMAL AS col_521,
	(-1657658660806723886):::INT8 AS col_522,
	tab_200._float4 AS col_523,
	tab_201._int8 AS col_524,
	tab_200._int8 AS col_525,
	tab_200._uuid AS col_526,
	tab_200._float8 AS col_527,
	tab_201._bool AS col_528,
	tab_201._string AS col_529,
	tab_201._string AS col_530,
	to_json(tab_200._timestamp)::JSONB AS col_531,
	tab_200._bytes AS col_532,
	tab_200._date AS col_533,
	'\x4183b411d322fc':::BYTES AS col_534,
	tab_201._jsonb AS col_535,
	tab_201._int2 AS col_536,
	tab_201._interval AS col_537,
	('1 day':::INTERVAL::INTERVAL * tab_201._int4::INT8)::INTERVAL AS col_538,
	tab_201._timestamptz AS col_539,
	(-1631):::INT8 AS col_540,
	tab_200._uuid AS col_541,
	(-7.082104694090470178E+24):::DECIMAL AS col_542,
	'1970-01-11 07:00:15.000757+00:00':::TIMESTAMP AS col_543,
	tab_200._float8 AS col_544,
	'0001-01-01 00:00:00+00:00':::TIMESTAMP AS col_545
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_200
	JOIN defaultdb.public.seed@[0] AS tab_201 ON (tab_200._int4) = (tab_201._int2)
ORDER BY
	tab_201._interval, tab_201._decimal ASC, tab_201._uuid ASC;

SELECT
	count(*) AS col_546
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_202
WHERE
	true
GROUP BY
	tab_202._jsonb;

DELETE FROM
	defaultdb.public.seed AS tab_203
ORDER BY
	tab_203._int8, tab_203._decimal ASC, tab_203._float4 DESC
LIMIT
	2:::INT8;

WITH
	with_69 (col_547)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'B~\x04R\f':::STRING), (e'\'':::STRING), (e'\x02;N-':::STRING), (NULL), (e'\\\x14?C':::STRING)
				)
					AS tab_204 (col_547)
			UNION
				SELECT
					*
				FROM
					(
						VALUES
							(e'\'i\x01!k':::STRING),
							((SELECT '':::STRING AS col_548 LIMIT 1:::INT8)),
							(e'S\x14[':::STRING),
							(NULL),
							(NULL)
					)
						AS tab_205 (col_549)
		)
SELECT
	false AS col_550
LIMIT
	91:::INT8;

SELECT
	character_length('\x':::BYTES::BYTES)::INT8 AS col_551,
	round(tab_206._float8::FLOAT8, 127:::INT8::INT8)::FLOAT8 AS col_552,
	tab_206._bytes AS col_553
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_206
WHERE
	tab_206._bool
LIMIT
	92:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_207 (_int2, _int4, _float4, _timestamp, _decimal, _bytes, _jsonb)
WITH
	with_70 (col_554)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						('93.123.123.162/14':::INET),
						('ed49:63c4:cb5c:79cf:257d:782:4ef:a713/46':::INET),
						(NULL),
						('fc58:3e50:16f5:9799:a31:cc86:982b:1ea6/47':::INET)
				)
					AS tab_208 (col_554)
		),
	with_71 (col_555)
		AS (
			SELECT
				*
			FROM
				(VALUES ('{".b )^$TD=[d": [{}, {}], "^f><+*": {}, "b": [[]], "{-:H{c": true}':::JSONB))
					AS tab_209 (col_555)
		)
SELECT
	NULL AS col_556,
	(-1577156359):::INT8 AS col_557,
	NULL AS col_558,
	('1970-01-04 22:05:11.000214+00:00':::TIMESTAMP::TIMESTAMP - '27 years 9 mons 848 days 11:02:17.875921':::INTERVAL::INTERVAL)::TIMESTAMP
		AS col_559,
	NULL AS col_560,
	'\x640e':::BYTES AS col_561,
	'[{"foo": {"#>a": 0.25997762647008754, "NLr8uuV8": "foobar"}}, [], {"WUe(kB%C4": {"a": {"b": {}}, "bar": false, "foobar": 0.548887206187342}, "c": {}, "foo": 1.381593430809621}, [], [{}]]':::JSONB
		AS col_562;

WITH
	with_74 (col_566)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('3395:5cc8:a96c:1786:a826:2a19:e06b:ca0c/126':::INET),
						(
							(
								WITH
									with_72 (col_563)
										AS (
											SELECT
												*
											FROM
												(VALUES (0:::OID), (4069521298:::OID), (3097381742:::OID))
													AS tab_210 (col_563)
										),
									with_73 (col_564)
										AS (
											SELECT
												'223.206.237.35/5':::INET AS col_564
											FROM
												with_72 AS cte_ref_20
											WHERE
												NULL
										)
								SELECT
									tab_211._inet AS col_565
								FROM
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_211
								LIMIT
									1:::INT8
							)
						)
				)
					AS tab_212 (col_566)
		)
SELECT
	tab_213._timestamptz AS col_567,
	tab_213._float8 AS col_568,
	(-0.7066110617100667):::FLOAT8 AS col_569,
	tab_213._bool AS col_570,
	tab_213._inet AS col_571,
	(
		WITH
			with_75 (col_572)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								('1970-01-01 13:43:38.000084+00:00':::TIMESTAMPTZ),
								('3000-01-01 00:00:00+00:00':::TIMESTAMPTZ),
								('1970-01-09 00:35:21.000973+00:00':::TIMESTAMPTZ),
								(NULL),
								('1970-01-04 03:11:37.00022+00:00':::TIMESTAMPTZ)
						)
							AS tab_214 (col_572)
				),
			with_76 (col_573)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(B'000010001110010001001100010100101110111100111'),
								(NULL),
								(B'110111101110100100111101011011011010000001001'),
								(B'001111111010101010011110000010001110001111011'),
								(NULL)
						)
							AS tab_215 (col_573)
				)
		SELECT
			'1989-05-08':::DATE AS col_574
		FROM
			with_75 AS cte_ref_21
		ORDER BY
			cte_ref_21.col_572 ASC, cte_ref_21.col_572
		LIMIT
			1:::INT8
	)
		AS col_575,
	'1970-01-11 05:00:16.000029+00:00':::TIMESTAMP AS col_576,
	'10643ba1-ed30-4f2f-bb90-843e7d7d3156':::UUID AS col_577,
	(-35379659607.35003788):::DECIMAL AS col_578,
	e'[[[{"*Z;r S": "EP:2XiK\'nA", "baz": "8JPE}h"}, null, {}], {"WP+Z)hBU#": {}, "c": true}, true, [], 0.8045200538559145], 2.9860074892545834]':::JSONB
		AS col_579,
	tab_213._interval AS col_580,
	tab_213._int4 AS col_581,
	tab_213._string AS col_582
FROM
	defaultdb.public.seed@[0] AS tab_213
LIMIT
	91:::INT8;

UPDATE
	defaultdb.public.seed AS tab_216
SET
	_bytes = tab_216._bytes,
	_bool
		= ('5e4a:71eb:2fbc:34e8:bc79:7efa:7066:14c1/76':::INET::INET >> 'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET::INET)::BOOL,
	_int2 = 12290:::INT8;

WITH
	with_77 (col_583) AS (SELECT * FROM (VALUES ((-17667):::INT8)) AS tab_217 (col_583)),
	with_78 (col_584)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-03 14:11:58.000463+00:00':::TIMESTAMP),
						('1970-01-09 15:27:33.00048+00:00':::TIMESTAMP),
						(NULL),
						('1970-01-05 00:01:49.00088+00:00':::TIMESTAMP),
						(NULL),
						('1970-01-03 20:19:36.000852+00:00':::TIMESTAMP)
				)
					AS tab_218 (col_584)
		),
	with_79 (col_585)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), (gen_random_uuid()::UUID), ('deebabce-9ed1-44a9-ad92-95c9bab1143a':::UUID))
					AS tab_219 (col_585)
		)
SELECT
	max(tab_220._interval::INTERVAL)::INTERVAL AS col_586,
	crdb_internal.round_decimal_values(tab_220._decimal::DECIMAL, NULL::INT8)::DECIMAL AS col_587
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_220
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_221 ON
			(tab_220._float4) = (tab_221._float8)
			AND (tab_220._int4) = (tab_221._int2)
			AND (tab_220._int8) = (tab_221._int2)
GROUP BY
	tab_220._decimal, tab_220._interval
LIMIT
	13:::INT8;

UPDATE
	defaultdb.public.seed AS tab_222
SET
	_inet = '8d76:3d13:70a8:9dbc:8a55:f663:98b0:1085/78':::INET
WHERE
	tab_222._bool;

SELECT
	tab_223._string AS col_588,
	tab_223._timestamp AS col_589,
	tab_223._interval AS col_590,
	tab_223._timestamptz AS col_591,
	tab_223._bytes AS col_592,
	tab_223._int4 AS col_593,
	tab_223._uuid AS col_594,
	'{"bar": [[], null], "foo": {"bar": [{"V1^6pJUw[": {}}, "0p8", "X@R"], "s)>F~|=": {}}, "foobar": {"foobar": []}}':::JSONB
		AS col_595,
	tab_223._date AS col_596,
	tab_223._int8 AS col_597,
	'92d5:8925:f9a:5799:1307:d77b:4f12:dc9d/23':::INET AS col_598
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_223
LIMIT
	38:::INT8;

SELECT
	'1972-01-01':::DATE AS col_599
FROM
	defaultdb.public.seed AS tab_224
	JOIN defaultdb.public.seed AS tab_225 ON
			(tab_224._int8) = (tab_225._int8)
			AND (tab_224._float8) = (tab_225._float8)
			AND (tab_224._date) = (tab_225._date)
WHERE
	false;

UPDATE defaultdb.public.seed AS tab_226 SET _timestamp = '0001-01-01 00:00:00+00:00':::TIMESTAMP LIMIT 62:::INT8;

UPDATE defaultdb.public.seed AS tab_227 SET _uuid = tab_227._uuid LIMIT 32:::INT8;

WITH
	with_82 (col_600, col_601)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(31839:::INT8, (-15246):::INT8),
						((-12939):::INT8, 1991:::INT8),
						(28831:::INT8, 27537:::INT8),
						(17604:::INT8, NULL),
						(127:::INT8, 4902:::INT8)
				)
					AS tab_228 (col_600, col_601)
			INTERSECT
				SELECT
					*
				FROM
					(
						VALUES
							(
								29274:::INT8,
								(
									WITH
										with_80 (col_602)
											AS (
												SELECT
													*
												FROM
													(
														VALUES
															((-0.127559960720257):::FLOAT8),
															((-0.898105645698259):::FLOAT8),
															(
																(NULL::FLOAT8 % (-0.7931659360121429):::FLOAT8::FLOAT8)::FLOAT8
															),
															(3.4028234663852886e+38:::FLOAT8),
															(
																((-0.5599360784218568):::FLOAT8::FLOAT8 % ((-0.42664482813960014):::FLOAT8::FLOAT8 + (-0.4266354813268819):::FLOAT8::FLOAT8)::FLOAT8::FLOAT8)::FLOAT8
															)
													)
														AS tab_229 (col_602)
											),
										with_81 (col_603)
											AS (
												SELECT
													*
												FROM
													(VALUES ((-1.2303740371268237):::FLOAT8)) AS tab_230 (col_603)
											)
									SELECT
										32219:::INT8 AS col_604
									FROM
										with_80 AS cte_ref_22
									WHERE
										true
									ORDER BY
										cte_ref_22.col_602
									LIMIT
										1:::INT8
								)
							),
							((-24882):::INT8, (-128):::INT8),
							(11270:::INT8, (-32462):::INT8),
							(29505:::INT8, NULL)
					)
						AS tab_231 (col_605, col_606)
			UNION
				SELECT
					*
				FROM
					(
						VALUES
							(30112:::INT8, 10383:::INT8),
							((-8203):::INT8, (-21621):::INT8),
							(10562:::INT8, (-31492):::INT8),
							(27580:::INT8, (-6985):::INT8),
							((-7019):::INT8, NULL),
							(16108:::INT8, (-3506):::INT8)
					)
						AS tab_232 (col_607, col_608)
		),
	with_83 (col_609) AS (SELECT * FROM (VALUES (849551066349421035.5:::DECIMAL)) AS tab_233 (col_609))
SELECT
	tab_234._interval AS col_610, tab_234._string AS col_611, tab_234._int2 AS col_612
FROM
	defaultdb.public.seed@[0] AS tab_234;

WITH
	with_84 (col_613)
		AS (
			SELECT
				*
			FROM
				(VALUES (3434955092:::OID), (1248490233:::OID), (329033957:::OID), (2251175280:::OID))
					AS tab_235 (col_613)
		),
	with_85 (col_614) AS (SELECT * FROM (VALUES (true), (true)) AS tab_236 (col_614))
SELECT
	cte_ref_23.col_613 AS col_615
FROM
	with_84 AS cte_ref_23
WHERE
	e'.\x04`[fz\n\x10N':::STRING ILIKE e'\x7f;c':::STRING
GROUP BY
	cte_ref_23.col_613
HAVING
	inet_contains_or_equals('0.0.0.0/0':::INET::INET, '6.17.138.80/14':::INET::INET)::BOOL
ORDER BY
	cte_ref_23.col_613, cte_ref_23.col_613 DESC, cte_ref_23.col_613, cte_ref_23.col_613 ASC;

WITH
	with_86 (col_616) AS (SELECT * FROM (VALUES (e'A%1\x1e)':::STRING)) AS tab_237 (col_616)),
	with_87 (col_617, col_618)
		AS (
			SELECT * FROM (VALUES ('':::STRING, 2270085878:::OID)) AS tab_238 (col_617, col_618)
			EXCEPT ALL
				SELECT
					*
				FROM
					(VALUES (e'\x03!qs*\x1a\x10$':::STRING:::NAME, 2743201712:::OID)) AS tab_239 (col_619, col_620)
		)
SELECT
	ARRAY['':::STRING,e'\x1ci^\x0e\x15@~':::STRING,e'\x0f\x13u}b':::STRING,'5':::STRING,'o_':::STRING,'V':::STRING]
		AS col_621;

WITH
	with_90 (col_625)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(3434571617:::OID),
						(782406716:::OID),
						(1092323634:::OID),
						(2855311552:::OID),
						(
							(
								WITH
									with_88 (col_622) AS (SELECT * FROM (VALUES (NULL)) AS tab_240 (col_622)),
									with_89 (col_623)
										AS (
											SELECT
												*
											FROM
												(VALUES (0:::OID), (702952283:::OID), (798603893:::OID))
													AS tab_241 (col_623)
										)
								SELECT
									3256441678:::OID AS col_624
								FROM
									defaultdb.public.seed@[0] AS tab_242
								ORDER BY
									tab_242._int8
								LIMIT
									1:::INT8
							)
						)
				)
					AS tab_243 (col_625)
		),
	with_91 (col_626)
		AS (SELECT * FROM (VALUES ('-79 years -3 mons -719 days -23:14:18.944939':::INTERVAL)) AS tab_244 (col_626))
SELECT
	max(tab_245._timestamp::TIMESTAMP) OVER (PARTITION BY tab_245._int8, tab_245._int4, tab_245._timestamp ROWS CURRENT ROW)::TIMESTAMP
		AS col_627,
	bit_or(tab_245._int8::INT8)::INT8 AS col_628,
	tab_245._int8 AS col_629
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_245
GROUP BY
	tab_245._int4, tab_245._int8, tab_245._timestamp
ORDER BY
	tab_245._int8 DESC
LIMIT
	87:::INT8;

WITH
	with_92 (col_630)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('d87f6a4b-7db1-445d-a9dd-233f7e40b898':::UUID),
						('5aa4925c-26e1-4ddb-a26c-55e97a8e4bd4':::UUID),
						(NULL),
						('ca16d8e8-0f1e-44e8-865c-4d18cc2891bb':::UUID),
						(crdb_internal.cluster_id()::UUID)
				)
					AS tab_246 (col_630)
		),
	with_93 (col_631, col_632)
		AS (
			SELECT
				*
			FROM
				(VALUES (true, (-31732):::INT8), (true, 22438:::INT8), (true, 29519:::INT8))
					AS tab_247 (col_631, col_632)
		),
	with_94 (col_633)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-06 14:55:11.000955+00:00':::TIMESTAMP),
						('1970-01-06 06:13:16.000108+00:00':::TIMESTAMP),
						('1970-01-09 04:56:57.000193+00:00':::TIMESTAMP),
						('1970-01-09 09:34:10.000044+00:00':::TIMESTAMP)
				)
					AS tab_248 (col_633)
		)
SELECT
	'\xe29883':::BYTES AS col_634, NULL AS col_635
LIMIT
	8:::INT8;

UPDATE
	defaultdb.public.seed AS tab_249
SET
	_string = (tab_249._string::STRING || e'\x132\r\x02[@+MY':::STRING::STRING)::STRING
ORDER BY
	tab_249._inet ASC, tab_249._interval, tab_249._string, tab_249._int4 ASC
LIMIT
	74:::INT8;

UPDATE
	defaultdb.public.seed AS tab_250
SET
	_timestamptz = tab_250._timestamptz
WHERE
	(NOT tab_250._bool)
LIMIT
	76:::INT8;

SELECT
	tab_252._uuid AS col_636,
	tab_251._date AS col_637,
	'-30 years -4 mons -985 days -08:03:58.782559':::INTERVAL AS col_638,
	'\x35361517865a98c5fe':::BYTES AS col_639
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_251
	JOIN defaultdb.public.seed@[0] AS tab_252 ON (tab_251._float8) = (tab_252._float4)
WHERE
	true
LIMIT
	18:::INT8;

INSERT INTO defaultdb.public.seed AS tab_253 DEFAULT VALUES;

SELECT
	tab_254._string AS col_640
FROM
	defaultdb.public.seed@[0] AS tab_254
ORDER BY
	tab_254._string DESC, tab_254._inet DESC;

UPDATE
	defaultdb.public.seed AS tab_255
SET
	_float8 = 0.1288062600232256:::FLOAT8, _string = e'\x12s}\x03':::STRING
ORDER BY
	tab_255._bool DESC, tab_255._timestamp, tab_255._string ASC
LIMIT
	5:::INT8;

SELECT
	NULL AS col_641, tab_256._int4 AS col_642, '14 years 10 mons 421 days 14:52:02.548222':::INTERVAL AS col_643
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_256
ORDER BY
	tab_256._string DESC, tab_256._int2 DESC
LIMIT
	46:::INT8;

WITH
	with_96 (col_646)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						('1970-01-11 21:15:34.000722+00:00':::TIMESTAMP),
						('1970-01-04 06:47:55.000832+00:00':::TIMESTAMP),
						(
							timezone((NULL::STRING || ('[{"foo": []}, {"foo": null}, [false, {"Y*|p[L": [], "c": []}], {"bar": {}, "baz": {}, "c": {}}, {}, 1.3210856512550535]':::JSONB::JSONB#>>(WITH with_95 (col_644) AS (SELECT * FROM (VALUES (NULL), (0.3096999111934845:::FLOAT8), (NULL), (1.16971872540209:::FLOAT8)) AS tab_257 (col_644)) SELECT ARRAY[e'\x066"@':::STRING] AS col_645 FROM defaultdb.public.seed@seed__int8__float8__date_idx AS tab_258 WHERE false ORDER BY tab_258._float4 DESC, tab_258._timestamp ASC LIMIT 1:::INT8)::STRING[])::STRING::STRING)::STRING::STRING, 'NU`lR':::STRING::STRING)::TIMESTAMP
						)
				)
					AS tab_259 (col_646)
		),
	with_97 (col_647)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							e'[[{"E)Bu#": [[[]]], "c": null, "l>Fxt\'&n@-": {}}], false, false, ["jS[gQ0l;3Qs~"], 0.8828429357111431, null]':::JSONB
						),
						(
							'[[false, []], {"#?zYK": [], "a": {}, "r/DUkk": {"$ag": [false], "_nF": [], "b": "b", "foobar": true}}]':::JSONB
						),
						(
							e'{"C791ki(": [{"jvelu&9": {}, "v{{%": {"baz": []}}], "FO;%*a)oJ4ED": [], "bar": [[{}, true]], "foobar": [{"7h15Jy]Nrl": "42mRONza", "]wTqi\\"Tu": []}]}':::JSONB
						)
				)
					AS tab_260 (col_647)
		)
SELECT
	cte_ref_24.col_647 AS col_648
FROM
	with_97 AS cte_ref_24;

SELECT ARRAY['1970-01-12 00:07:53.000536+00:00':::TIMESTAMPTZ] AS col_649, NULL AS col_650 LIMIT 43:::INT8;

SELECT
	'[null, "Lfm(", [{"21fP`w&A3": "Tw<`,k", "LSw+": {}}]]':::JSONB AS col_651, tab_264._int2 AS col_652
FROM
	defaultdb.public.seed AS tab_261
	JOIN defaultdb.public.seed AS tab_262 ON
			(tab_261._int8) = (tab_262._int8)
			AND (tab_261._float8) = (tab_262._float8)
			AND (tab_261._date) = (tab_262._date)
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_263 ON
			(tab_262._date) = (tab_263._date)
			AND (tab_262._date) = (tab_263._date)
			AND (tab_262._date) = (tab_263._date)
	INNER JOIN defaultdb.public.seed@[0] AS tab_264 ON true
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_265 ON
			(tab_264._int8) = (tab_265._int2) AND (tab_264._timestamptz) = (tab_265._timestamptz)
WHERE
	tab_265._bool
LIMIT
	12:::INT8;

SELECT count(*) AS col_653 FROM defaultdb.public.seed@[0] AS tab_266 GROUP BY tab_266._jsonb LIMIT 60:::INT8;

WITH
	with_98 (col_654)
		AS (
			SELECT
				*
			FROM
				(VALUES (B'0111111111111111111111111111111111111111111111111111111111111111')) AS tab_267 (col_654)
		),
	with_99 (col_655)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(0:::OID),
						(1262039047:::OID),
						(689915483:::OID),
						(476852264:::OID),
						(4275236085:::OID),
						(1759281704:::OID)
				)
					AS tab_268 (col_655)
		),
	with_100 (col_656)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), (ARRAY[2989887787:::OID,4061197238:::OID]), (ARRAY[82250113:::OID]))
					AS tab_269 (col_656)
		)
SELECT
	1184397267:::OID AS col_657
FROM
	with_99 AS cte_ref_25
ORDER BY
	cte_ref_25.col_655 ASC;

INSERT
INTO
	defaultdb.public.seed AS tab_270 (_int2, _int4, _float4, _float8, _interval, _bool, _inet)
SELECT
	tab_271._int2 AS col_658,
	tab_271._int2 AS col_659,
	tab_271._float4 AS col_660,
	tab_271._float4 AS col_661,
	'-23 years -9 mons -962 days -09:09:14.146728':::INTERVAL AS col_662,
	tab_271._bool AS col_663,
	tab_271._inet AS col_664
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_271
LIMIT
	26:::INT8;

UPDATE
	defaultdb.public.seed AS tab_272
SET
	_int8 = tab_272._int8
ORDER BY
	tab_272._decimal DESC, tab_272._float4 DESC
LIMIT
	63:::INT8;

WITH
	with_101 (col_665, col_666)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'b\x1c,':::STRING, e'\x13&06\rq1':::STRING:::NAME),
						(e'w\x19':::STRING, '':::STRING:::NAME),
						('}':::STRING, NULL),
						('W':::STRING, e'o5:7_\x1a\x1d':::STRING:::NAME),
						('/':::STRING, e'fC\x10':::STRING:::NAME)
				)
					AS tab_273 (col_665, col_666)
		)
SELECT
	crdb_internal.range_stats(tab_274._bytes::BYTES)::JSONB AS col_667
FROM
	defaultdb.public.seed@[0] AS tab_274
WHERE
	false
ORDER BY
	tab_274._interval ASC;

WITH
	with_102 (col_668)
		AS (
			SELECT * FROM (VALUES ('00:00:00+15:59:00':::TIMETZ)) AS tab_275 (col_668)
			UNION
				SELECT
					*
				FROM
					(
						VALUES
							('12:51:56.547341-13:51:00':::TIMETZ),
							(timezone(e'\x11':::STRING::STRING, '00:00:00+15:59:00':::TIMETZ::TIMETZ)::TIMETZ)
					)
						AS tab_276 (col_669)
		),
	with_103 (col_670)
		AS (
			SELECT
				*
			FROM
				(VALUES (558381870:::OID), (1236708064:::OID), (2694071701:::OID), (NULL), (4035709875:::OID))
					AS tab_277 (col_670)
		)
SELECT
	147142477216642059:::INT8 AS col_671,
	tab_278._float8 AS col_672,
	cte_ref_26.col_670 AS col_673,
	(-15372):::INT8 AS col_674
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_278, with_103 AS cte_ref_26
LIMIT
	82:::INT8;

SELECT
	89533952652.45756533:::DECIMAL AS col_675,
	'1970-01-12 06:32:48.000122+00:00':::TIMESTAMPTZ AS col_676,
	tab_279._bool AS col_677,
	tab_279._date AS col_678,
	tab_279._int4 AS col_679,
	tab_279._float8 AS col_680,
	40404143:::INT8 AS col_681
FROM
	defaultdb.public.seed@[0] AS tab_279
WHERE
	false
LIMIT
	10:::INT8;

SELECT
	tab_291._jsonb AS col_711
FROM
	defaultdb.public.seed@[0] AS tab_291
ORDER BY
	tab_291._float4 DESC, tab_291._int8 DESC, tab_291._timestamp
LIMIT
	3:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_292
WITH
	with_111 (col_713)
		AS (SELECT * FROM (VALUES ((SELECT COALESCE(NULL, NULL) AS col_712 LIMIT 1:::INT8))) AS tab_293 (col_713))
SELECT
	31284:::INT8 AS col_714,
	2077184870:::INT8 AS col_715,
	(-3269482046039301179):::INT8 AS col_716,
	(-0.7924873232841492):::FLOAT8 AS col_717,
	NULL AS col_718,
	'infinity':::DATE AS col_719,
	'1970-01-08 20:42:16.000176+00:00':::TIMESTAMP AS col_720,
	NULL AS col_721,
	'1 day':::INTERVAL AS col_722,
	true AS col_723,
	(-427.9408038301950734):::DECIMAL AS col_724,
	NULL AS col_725,
	'\x22':::BYTES AS col_726,
	NULL AS col_727,
	'39.173.250.233/20':::INET AS col_728,
	'{">L*": true, "c": {"){2e[a>&=": [], "foo": [], "foobar": {}}, "foobar": [{}, [{"foobar": {}}, []], {}, {}]}':::JSONB
		AS col_729
FROM
	with_111 AS cte_ref_31
ORDER BY
	cte_ref_31.col_713 DESC;

INSERT
INTO
	defaultdb.public.seed AS tab_294 (_int2, _int4, _float4, _float8, _timestamptz, _bool)
SELECT
	tab_295._int2 AS col_730,
	(-92638420):::INT8 AS col_731,
	tab_296._float4 AS col_732,
	1.0:::FLOAT8 AS col_733,
	'1970-01-03 15:26:44.000965+00:00':::TIMESTAMPTZ AS col_734,
	tab_295._bool AS col_735
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_295,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_296
WHERE
	false
LIMIT
	100:::INT8;

UPDATE
	defaultdb.public.seed AS tab_297
SET
	_date = tab_297._date, _float8 = tab_297._float4
WHERE
	tab_297._bool
LIMIT
	19:::INT8;

SELECT
	tab_298._bytes AS col_736,
	1.0339185168063703:::FLOAT8 AS col_737,
	'1970-01-06 10:02:47.000837+00:00':::TIMESTAMP AS col_738
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_298
WHERE
	false
ORDER BY
	tab_298._uuid DESC, tab_298._timestamp DESC, tab_298._float4;

WITH
	with_112 (col_739) AS (SELECT * FROM (VALUES (e'7 \x04\x1b\x1aCoy\\':::STRING)) AS tab_299 (col_739))
SELECT
	NULL AS col_740, e'\x00':::STRING AS col_741, cte_ref_33.col_739 AS col_742
FROM
	with_112 AS cte_ref_32, with_112 AS cte_ref_33, with_112 AS cte_ref_34
LIMIT
	24:::INT8;

SELECT tab_300._int4 AS col_743 FROM defaultdb.public.seed@[0] AS tab_300 ORDER BY tab_300._int8;

UPDATE
	defaultdb.public.seed AS tab_305
SET
	_uuid = 'f85784a5-e0c1-4144-b446-af0665af9821':::UUID, _int4 = 1829699455:::INT8
WHERE
	tab_305._bool
ORDER BY
	tab_305._bool ASC, tab_305._interval ASC
LIMIT
	2:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_306 (_int2, _int4, _int8, _float4, _timestamptz, _interval, _string, _bytes, _uuid)
SELECT
	24819:::INT8 AS col_758,
	NULL AS col_759,
	(-4449861881635142647):::INT8 AS col_760,
	(
		WITH
			with_113 (col_761)
				AS (
					SELECT
						tab_309._inet AS col_761
					FROM
						defaultdb.public.seed@[0] AS tab_309,
						defaultdb.public.seed@seed__int8__float8__date_idx AS tab_310
					WHERE
						tab_310._bool
					EXCEPT ALL
						SELECT
							*
						FROM
							(
								VALUES
									(NULL),
									('212.0.179.124/17':::INET),
									(NULL),
									('d0b8:655d:cf9d:a521:8bba:51b6:ba1e:924a/96':::INET),
									(NULL),
									('31.132.90.214/2':::INET)
							)
								AS tab_311 (col_762)
				)
		SELECT
			(-0.24353919923305511):::FLOAT8 AS col_763
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_312
		WHERE
			true
		LIMIT
			1:::INT8
	)
		AS col_764,
	'1970-01-03 19:12:25.000111+00:00':::TIMESTAMPTZ AS col_765,
	'-60 years -2 mons -999 days -24:05:55.190588':::INTERVAL AS col_766,
	e'\x17\x12zC;\x1c':::STRING AS col_767,
	'\x42fe9cd8aec34a0a':::BYTES AS col_768,
	'c98af02a-b6c0-4558-ad9d-b014e30213a8':::UUID AS col_769
FROM
	defaultdb.public.seed AS tab_307
	JOIN defaultdb.public.seed AS tab_308 ON
			(tab_307._int8) = (tab_308._int8)
			AND (tab_307._float8) = (tab_308._float8)
			AND (tab_307._date) = (tab_308._date)
ORDER BY
	tab_308._date ASC, tab_308._date;

WITH
	with_114 (col_786, col_787)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-12222):::INT8, 1895107738:::OID),
						(0:::INT8, 4156695096:::OID),
						(9080:::INT8, 879733558:::OID),
						((-585):::INT8, 2367333876:::OID)
				)
					AS tab_314 (col_786, col_787)
		),
	with_115 (col_789)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('NaN':::FLOAT8),
						(
							(
								SELECT
									0.04735823445912024:::FLOAT8 AS col_788
								FROM
									defaultdb.public.seed@[0] AS tab_315
								ORDER BY
									tab_315._int8
								LIMIT
									1:::INT8
							)
						),
						((-1.626331706260614):::FLOAT8),
						('-Inf':::FLOAT8),
						(ln((-1.0):::FLOAT8::FLOAT8)::FLOAT8)
				)
					AS tab_316 (col_789)
		),
	with_116 (col_790)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('17:58:34.610444':::TIME),
						(
							('19:44:27.310817':::TIME::TIME + '40 years 1 mon 728 days 11:01:43.859246':::INTERVAL::INTERVAL)::TIME
						),
						('12:44:03.66578':::TIME),
						('06:22:46.752805':::TIME),
						('14:25:55.910707':::TIME)
				)
					AS tab_317 (col_790)
		)
SELECT
	tab_318._jsonb AS col_791, '1970-01-02 09:53:39.000514+00:00':::TIMESTAMPTZ AS col_792
FROM
	with_115 AS cte_ref_35, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_318
ORDER BY
	tab_318._date;

WITH
	with_117 (col_793) AS (SELECT * FROM (VALUES (()), (()), (()), (()), (NULL), (())) AS tab_319 (col_793)),
	with_118 (col_794) AS (SELECT * FROM (VALUES (0:::OID), (3827708302:::OID)) AS tab_320 (col_794))
SELECT
	cte_ref_36.col_793 AS col_795
FROM
	with_117 AS cte_ref_36
ORDER BY
	cte_ref_36.col_793 DESC, cte_ref_36.col_793 ASC, cte_ref_36.col_793, cte_ref_36.col_793 ASC
LIMIT
	50:::INT8;

SELECT
	tab_321._timestamp AS col_796,
	tab_321._int2 AS col_797,
	NULL AS col_798,
	'':::STRING AS col_799,
	tab_321._bytes AS col_800,
	'a249c477-8055-4b74-8c8b-3910f61bc749':::UUID AS col_801
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_321
WHERE
	tab_321._bool;

INSERT
INTO
	defaultdb.public.seed AS tab_322
		(_int2, _int8, _float4, _float8, _date, _timestamp, _interval, _bytes, _inet, _jsonb)
WITH
	with_119 (col_802, col_803)
		AS (
			SELECT
				*
			FROM
				(VALUES (B'10110001010011011111000000', B'01101000010110111110010110011011100010'), (NULL, NULL))
					AS tab_323 (col_802, col_803)
		),
	with_120 (col_804)
		AS (
			SELECT
				*
			FROM
				(VALUES (4254670571:::OID), (NULL), (3860664493:::OID), (1546644549:::OID)) AS tab_324 (col_804)
		)
SELECT
	(-1):::INT8 AS col_805,
	NULL AS col_806,
	0.0:::FLOAT8 AS col_807,
	(-1.302224415696724):::FLOAT8 AS col_808,
	tab_325._date AS col_809,
	('-59 years -1 mons -904 days -09:07:03.546134':::INTERVAL::INTERVAL + '1970-01-07 00:27:47.000309+00:00':::TIMESTAMP::TIMESTAMP)::TIMESTAMP
		AS col_810,
	'00:00:00':::INTERVAL AS col_811,
	'\x58':::BYTES AS col_812,
	'210.192.208.5/21':::INET AS col_813,
	'{"HNx6J": [{"H28": {}, "b": true}, [], []], "[<7x9a{f7": [{}], "foo": [false]}':::JSONB AS col_814
FROM
	defaultdb.public.seed AS tab_325
	JOIN defaultdb.public.seed AS tab_326 ON
			(tab_325._int8) = (tab_326._int8) AND (tab_325._float8) = (tab_326._float8),
	with_119 AS cte_ref_37
LIMIT
	47:::INT8;

SELECT
	max(tab_327._timestamp::TIMESTAMP)::TIMESTAMP AS col_815
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_327
GROUP BY
	tab_327._timestamp
HAVING
	max(tab_327._bool::BOOL)::BOOL
ORDER BY
	tab_327._timestamp ASC;

SELECT
	tab_328._int8 AS col_816, tab_328._jsonb AS col_817, tab_328._timestamp AS col_818
FROM
	defaultdb.public.seed@[0] AS tab_328
LIMIT
	27:::INT8;

WITH
	with_121 (col_819)
		AS (
			SELECT
				495325250:::OID AS col_819
			FROM
				defaultdb.public.seed@seed__int8__float8__date_idx AS tab_329
				CROSS JOIN defaultdb.public.seed@[0] AS tab_330
		),
	with_122 (col_820) AS (SELECT * FROM (VALUES (false), ((NOT true)), (true)) AS tab_331 (col_820))
SELECT
	tab_332._int8 AS col_821
FROM
	defaultdb.public.seed@[0] AS tab_332
LIMIT
	67:::INT8;

SELECT
	'0001-01-01 00:00:00+00:00':::TIMESTAMP AS col_822,
	'\xa2b79788c3960b3d':::BYTES AS col_823,
	tab_333._timestamptz AS col_824,
	tab_333._inet AS col_825,
	(-0.09066113084554672):::FLOAT8 AS col_826,
	NULL AS col_827,
	(-1.1349446071662888):::FLOAT8 AS col_828,
	'1970-01-03 04:06:52.000449+00:00':::TIMESTAMP AS col_829,
	tab_335._interval AS col_830,
	tab_334._float8 AS col_831,
	('67.123.100.251/2':::INET::INET << tab_335._inet::INET)::BOOL AS col_832
FROM
	defaultdb.public.seed@[0] AS tab_333, defaultdb.public.seed@[0] AS tab_334, defaultdb.public.seed@[0] AS tab_335
WHERE
	true
ORDER BY
	tab_334._int2 DESC
LIMIT
	58:::INT8;

WITH
	with_123 (col_833)
		AS (
			SELECT * FROM (VALUES ('2$':::STRING)) AS tab_336 (col_833)
			UNION
				SELECT
					*
				FROM
					(
						VALUES
							(
								(crdb_internal.range_stats('\x7bce8134b3af42':::BYTES::BYTES)::JSONB::JSONB->>(-7416081437478425194):::INT8::INT8)::STRING
							),
							(NULL),
							(crdb_internal.locality_value(e'\x0bB\x1d6\x04N':::STRING::STRING)::STRING),
							(NULL),
							(NULL),
							(e'\x00':::STRING)
					)
						AS tab_337 (col_834)
		)
SELECT
	cte_ref_38.col_833 AS col_835
FROM
	with_123 AS cte_ref_38
LIMIT
	48:::INT8;

SELECT 2349143259:::OID AS col_836, NULL AS col_837;

UPDATE defaultdb.public.seed AS tab_343 SET _float8 = 0.9581403785209016:::FLOAT8, _bytes = NULL;

UPDATE
	defaultdb.public.seed AS tab_344
SET
	_timestamptz = tab_344._timestamptz
WHERE
	tab_344._bool
ORDER BY
	tab_344._int8 DESC
LIMIT
	44:::INT8;

SELECT
	tab_346._decimal AS col_849, tab_346._int2 AS col_850
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_345, defaultdb.public.seed@[0] AS tab_346
WHERE
	true
ORDER BY
	tab_346._bytes DESC, tab_345._timestamp ASC
LIMIT
	61:::INT8;

SELECT
	tab_347._float8 AS col_851,
	NULL AS col_852,
	(SELECT tab_347._decimal AS col_853 LIMIT 1:::INT8) AS col_854,
	tab_347._jsonb AS col_855,
	'Nr<$-':::STRING AS col_856,
	19343:::INT8 AS col_857
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_347
WHERE
	tab_347._bool
ORDER BY
	tab_347._timestamp ASC
LIMIT
	19:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_348
		(_int4, _int8, _float8, _date, _timestamptz, _interval, _decimal, _string, _bytes, _uuid)
SELECT
	(-241529669):::INT8 AS col_858,
	tab_349._int8 AS col_859,
	NULL AS col_860,
	'1977-04-03':::DATE AS col_861,
	tab_349._timestamptz AS col_862,
	tab_349._interval AS col_863,
	1138268.774046727635:::DECIMAL AS col_864,
	tab_349._string AS col_865,
	'\x4a1c087b81':::BYTES AS col_866,
	tab_349._uuid AS col_867
FROM
	defaultdb.public.seed@[0] AS tab_349
WHERE
	NULL
ORDER BY
	tab_349._bytes DESC;

SELECT
	tab_351._string AS col_868,
	tab_351._int8 AS col_869,
	tab_351._interval AS col_870,
	tab_351._timestamp AS col_871,
	tab_350._jsonb AS col_872,
	0.5992568264317045:::FLOAT8 AS col_873,
	tab_351._uuid AS col_874
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_350 LEFT JOIN defaultdb.public.seed@[0] AS tab_351 ON true
WHERE
	false
LIMIT
	98:::INT8;

WITH
	with_127 (col_875)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((B'101010000000110101110010010111011100101000',)),
						((B'010101100100011011100101010011000111101100',)),
						((B'0111111111111111111111111111111111111111111111111111111111111111',))
				)
					AS tab_352 (col_875)
		),
	with_128 (col_876)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-10 21:06:40.000127+00:00':::TIMESTAMP),
						('1970-01-02 04:52:59.000767+00:00':::TIMESTAMP),
						('1970-01-12 07:37:04.000543+00:00':::TIMESTAMP),
						('1970-01-08 00:04:25.00009+00:00':::TIMESTAMP),
						('1970-01-07 04:48:42.000158+00:00':::TIMESTAMP)
				)
					AS tab_353 (col_876)
		),
	with_129 (col_877)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							CASE
							WHEN false THEN 'ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID
							ELSE '5ba9deb8-02a9-43f4-acc9-2bf14efd841b':::UUID
							END
						),
						('9c3d389e-e236-4dbd-a430-5a0b6d358889':::UUID)
				)
					AS tab_354 (col_877)
			INTERSECT
				SELECT
					*
				FROM
					(VALUES ('488b81e7-0ed7-41f3-95c2-0602840048f0':::UUID), (NULL), (NULL)) AS tab_355 (col_878)
		)
SELECT
	min(cte_ref_40.col_876::TIMESTAMP)::TIMESTAMP AS col_879
FROM
	with_128 AS cte_ref_40
GROUP BY
	cte_ref_40.col_876
LIMIT
	96:::INT8;

SELECT
	count(*) AS col_880
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_356
WHERE
	tab_356._bool
GROUP BY
	tab_356._jsonb
LIMIT
	67:::INT8;

UPDATE
	defaultdb.public.seed AS tab_358
SET
	_jsonb = tab_358._jsonb, _timestamp = tab_358._timestamp
WHERE
	tab_358._bool
LIMIT
	3:::INT8;

SELECT NULL AS col_883 LIMIT 44:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_359
SELECT
	tab_360._int4 AS col_884,
	NULL AS col_885,
	tab_360._int8 AS col_886,
	(-0.03531993180513382):::FLOAT8 AS col_887,
	(-0.5325175373822678):::FLOAT8 AS col_888,
	'1976-06-02':::DATE AS col_889,
	'3000-01-01 00:00:00+00:00':::TIMESTAMP AS col_890,
	'1970-01-08 06:01:48.000905+00:00':::TIMESTAMPTZ AS col_891,
	tab_360._interval AS col_892,
	tab_360._bool AS col_893,
	tab_360._decimal AS col_894,
	e'i\x1c\x01':::STRING AS col_895,
	'\xee4433e56c4f8cc3':::BYTES AS col_896,
	'00000000-0000-0000-0000-000000000000':::UUID AS col_897,
	(tab_360._inet::INET & tab_360._inet::INET)::INET AS col_898,
	(tab_360._jsonb::JSONB - ARRAY[e'C\x02C:.\x07*RU':::STRING]::STRING[])::JSONB AS col_899
FROM
	defaultdb.public.seed@[0] AS tab_360
WHERE
	ilike_escape(e'\x00':::STRING::STRING, e'\n,<|':::STRING::STRING, 'c':::STRING::STRING)::BOOL;

SELECT
	tab_361._int8 AS col_900, '1970-01-11 23:17:42.000503+00:00':::TIMESTAMP AS col_901, tab_361._jsonb AS col_902
FROM
	defaultdb.public.seed@[0] AS tab_361
WHERE
	tab_361._bool;

INSERT
INTO
	defaultdb.public.seed AS tab_362
WITH
	with_131 (col_903, col_904)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-0.20350914214069082):::FLOAT8, (-0.7243810892105103):::FLOAT8),
						(0.11145311632879751:::FLOAT8, (-1.5008292198181152):::FLOAT8),
						(0.468392155604078:::FLOAT8, (-1.275375247001648):::FLOAT8),
						(1.2353484060825173:::FLOAT8, 0.5544959306716919:::FLOAT8),
						((-0.523914072949207):::FLOAT8, (-1.2759720087051392):::FLOAT8)
				)
					AS tab_363 (col_903, col_904)
			UNION
				SELECT
					*
				FROM
					(
						VALUES
							(NULL, 1.3378190994262695:::FLOAT8),
							(1.0030239133212993:::FLOAT8, NULL),
							(1.1764695758235955:::FLOAT8, COALESCE(1.2987343072891235:::FLOAT8, NULL)),
							((-0.04909625846622512):::FLOAT8, (-0.6435112357139587):::FLOAT8),
							(NULL, (-1.5100632905960083):::FLOAT8),
							(1.534289632465961:::FLOAT8, (-0.4736305773258209):::FLOAT8)
					)
						AS tab_364 (col_905, col_906)
		),
	with_132 (col_907)
		AS (
			SELECT
				*
			FROM
				(VALUES (3165121917:::OID), (970414092:::OID), (545466005:::OID), (2263270175:::OID), (818409785:::OID))
					AS tab_365 (col_907)
		)
SELECT
	16205:::INT8 AS col_908,
	(
		SELECT
			1855869346:::INT8 AS col_909
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_366, defaultdb.public.seed@[0] AS tab_367
		ORDER BY
			tab_367._timestamptz DESC
		LIMIT
			1:::INT8
	)
		AS col_910,
	(-128):::INT8 AS col_911,
	(-0.8542791604995728):::FLOAT8 AS col_912,
	0.47282797879317207:::FLOAT8 AS col_913,
	'1982-06-30':::DATE AS col_914,
	'1970-01-12 06:44:35.000044+00:00':::TIMESTAMP AS col_915,
	'1970-01-12 11:44:32.000772+00:00':::TIMESTAMPTZ AS col_916,
	NULL AS col_917,
	NULL AS col_918,
	NULL AS col_919,
	e'\x1cx':::STRING AS col_920,
	'\x8723472357b606':::BYTES AS col_921,
	(
		SELECT
			tab_369._uuid AS col_922
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_368, defaultdb.public.seed@[0] AS tab_369
		WHERE
			tab_369._bool
		LIMIT
			1:::INT8
	)
		AS col_923,
	NULL AS col_924,
	'{"test": "json"}':::JSONB AS col_925
FROM
	with_132 AS cte_ref_42
LIMIT
	39:::INT8;

SELECT count(*) AS col_926 FROM defaultdb.public.seed@[0] AS tab_370 WHERE false GROUP BY tab_370._jsonb LIMIT 48:::INT8;

UPDATE
	defaultdb.public.seed AS tab_371
SET
	_inet = '114.8.224.23/12':::INET,
	_jsonb = '{";isb<75": [false, [[{}], {}, [{}]], false], "IXaq0]": true}':::JSONB,
	_date = '1970-11-17':::DATE,
	_uuid = crdb_internal.cluster_id()::UUID,
	_int4 = tab_371._int4,
	_timestamptz = NULL
ORDER BY
	tab_371._inet ASC
LIMIT
	65:::INT8;

WITH
	with_133 (col_943) AS (SELECT * FROM (VALUES (2058:::INT8), ((-1865):::INT8)) AS tab_374 (col_943))
SELECT
	cte_ref_43.col_943 AS col_944
FROM
	with_133 AS cte_ref_43
WHERE
	true
ORDER BY
	cte_ref_43.col_943 DESC
LIMIT
	96:::INT8;

WITH
	with_134 (col_945)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'\x00':::STRING),
						(e'\t':::STRING),
						(e'g\x1a\x1f':::STRING),
						(e'[gZ\x1c<&v+[':::STRING),
						(NULL)
				)
					AS tab_375 (col_945)
		),
	with_135 (col_946)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(B'1010101011101101001110111011111'),
						(B'1111101111011010110110000001100'),
						(B'0111100110010000101101101010010')
				)
					AS tab_376 (col_946)
		)
SELECT
	B'1111001010110100000001101110110' AS col_947
FROM
	with_135 AS cte_ref_44
ORDER BY
	cte_ref_44.col_946 ASC;

INSERT
INTO
	defaultdb.public.seed AS tab_377 (_int8, _float4, _timestamptz, _interval, _bool, _string, _inet)
SELECT
	tab_378._int4 AS col_948,
	NULL AS col_949,
	'1970-01-10 11:57:19.000877+00:00':::TIMESTAMPTZ AS col_950,
	tab_378._interval AS col_951,
	((NULL::TIME IN ('00:00:00':::TIME, current_time():::TIME::TIME)) AND (tab_378._bool AND tab_378._bool)) AS col_952,
	tab_378._string AS col_953,
	tab_378._inet AS col_954
FROM
	defaultdb.public.seed@[0] AS tab_378
WHERE
	true;

UPDATE defaultdb.public.seed AS tab_379 SET _timestamptz = NULL LIMIT 87:::INT8;

WITH
	with_136 (col_955)
		AS (
			SELECT
				*
			FROM
				(VALUES (('1982-07-30':::DATE::DATE + '00:00:00':::TIME::TIME)::TIMESTAMP)) AS tab_380 (col_955)
		),
	with_137 (col_956, col_957)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('\x13':::BYTES, (-0.3009404242038727):::FLOAT8),
						('\xc247':::BYTES, NULL),
						('\x71b205a2288fc3':::BYTES, (-0.7150353193283081):::FLOAT8)
				)
					AS tab_381 (col_956, col_957)
		),
	with_138 (col_958)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1238c960-9403-4572-9257-0857bee9cceb':::UUID),
						(NULL),
						(NULL),
						('32fad00f-eb51-4448-8ba5-c992d5ff397a':::UUID),
						(NULL)
				)
					AS tab_382 (col_958)
		)
SELECT
	'9eb46ddd-88f5-4388-a55c-041c345c8ad5':::UUID AS col_959
FROM
	with_138 AS cte_ref_45
LIMIT
	85:::INT8;

WITH
	with_139 (col_960)
		AS (
			SELECT
				*
			FROM
				(VALUES (ARRAY[1939257505:::INT8,(-927457264):::INT8,(-575066636):::INT8,486497193:::INT8]))
					AS tab_383 (col_960)
			EXCEPT SELECT * FROM (VALUES (ARRAY[1:::INT8,570893494:::INT8])) AS tab_384 (col_961)
		),
	with_140 (col_962) AS (SELECT * FROM (VALUES (1090694374:::OID), (587314049:::OID)) AS tab_385 (col_962)),
	with_141 (col_963, col_964)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('-70 years -1 mons -54 days -20:16:32.317123':::INTERVAL, 0.10970176756381989:::FLOAT8),
						('00:00:00':::INTERVAL, (-1.8337063789367676):::FLOAT8)
				)
					AS tab_386 (col_963, col_964)
		)
SELECT
	tab_387._int4 AS col_965, tab_387._int4 AS col_966
FROM
	defaultdb.public.seed@[0] AS tab_387
WHERE
	tab_387._bool
ORDER BY
	tab_387._uuid DESC;

SELECT NULL AS col_967;

SELECT
	('1984-12-29':::DATE::DATE - 9223372036854775807:::INT8::INT8)::DATE AS col_968
FROM
	defaultdb.public.seed@[0] AS tab_388
WHERE
	(NOT true)
LIMIT
	78:::INT8;

WITH
	with_142 (col_969) AS (SELECT * FROM (VALUES (3447129500:::OID), (3368482176:::OID)) AS tab_389 (col_969)),
	with_143 (col_970)
		AS (SELECT * FROM (VALUES ('\x704b8facf3fc0eb2':::BYTES), ('\xaaae1cac4c76':::BYTES)) AS tab_390 (col_970))
SELECT
	count_rows()::INT8 AS col_971
FROM
	defaultdb.public.seed@[0] AS tab_391
WHERE
	false
GROUP BY
	tab_391._int8
LIMIT
	83:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_392
SELECT
	tab_393._int2 AS col_972,
	tab_393._int4 AS col_973,
	(-237797062525513836):::INT8 AS col_974,
	tab_394._float8 AS col_975,
	(-0.165446869893435):::FLOAT8 AS col_976,
	tab_393._date AS col_977,
	'-2000-01-01 00:00:00+00:00':::TIMESTAMP AS col_978,
	NULL AS col_979,
	date_trunc(tab_393._string::STRING, ('03:09:28.459721':::TIME::TIME - tab_393._interval::INTERVAL)::TIME::TIME)::INTERVAL
		AS col_980,
	tab_393._bool AS col_981,
	513018228.3609020118:::DECIMAL AS col_982,
	('["foobar", ["[IA&zOzkof1m", {}], "a", []]':::JSONB::JSONB#>>ARRAY[e'r\\':::STRING]::STRING[])::STRING AS col_983,
	tab_394._bytes AS col_984,
	tab_393._uuid AS col_985,
	'ea7a:9f13:bd86:f3e1:b90c:fad2:811b:c932/49':::INET AS col_986,
	tab_393._jsonb AS col_987
FROM
	defaultdb.public.seed@[0] AS tab_393
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_394 ON (tab_393._decimal) = (tab_394._decimal),
	defaultdb.public.seed AS tab_395
	JOIN defaultdb.public.seed AS tab_396 ON (tab_395._jsonb) = (tab_396._jsonb)
ORDER BY
	tab_393._timestamp ASC, tab_394._date, tab_393._uuid DESC
LIMIT
	91:::INT8;

WITH
	with_144 (col_988, col_989, col_990)
		AS (
			SELECT
				tab_399._int4 AS col_988, tab_399._inet AS col_989, (tab_399._bool AND true) AS col_990
			FROM
				defaultdb.public.seed@[0] AS tab_397,
				defaultdb.public.seed@[0] AS tab_398
				JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_399 ON
						(tab_398._float8) = (tab_399._float8)
		),
	with_145 (col_991)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1838962816:::INT8),
						(972225817:::INT8),
						((-1494967637):::INT8),
						(1:::INT8),
						(281054251:::INT8),
						(NULL)
				)
					AS tab_400 (col_991)
		)
SELECT
	tab_401._bytes AS col_992,
	tab_401._timestamp AS col_993,
	(-22629):::INT8 AS col_994,
	tab_401._int2 AS col_995,
	tab_401._int2 AS col_996,
	tab_401._decimal AS col_997,
	true AS col_998,
	tab_401._date AS col_999,
	NULL AS col_1000,
	tab_401._timestamptz AS col_1001,
	(tab_401._float8::FLOAT8 - (tab_401._float8::FLOAT8 // (-0.36043032550728027):::FLOAT8::FLOAT8)::FLOAT8::FLOAT8)::FLOAT8
		AS col_1002,
	'true':::JSONB AS col_1003
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_401
ORDER BY
	tab_401._bytes
LIMIT
	50:::INT8;

SELECT
	tab_403._date AS col_1004,
	tab_403._timestamp AS col_1005,
	'1970-01-09 10:57:56.000152+00:00':::TIMESTAMPTZ AS col_1006,
	tab_404._string AS col_1007,
	NULL AS col_1008,
	(-194679683):::INT8 AS col_1009,
	(-6466):::INT8 AS col_1010
FROM
	defaultdb.public.seed@[0] AS tab_403, defaultdb.public.seed@[0] AS tab_404
ORDER BY
	tab_404._inet ASC;

WITH
	with_146 (col_1011, col_1012)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[1826338898:::OID,4014907537:::OID], '8676a402-2728-4776-a825-c8acf96a8c36':::UUID),
						(
							ARRAY[3348305224:::OID,666686069:::OID,3789695719:::OID,1597514879:::OID],
							'b03f7c3b-e182-4cd5-bf04-b58e90bb9738':::UUID
						),
						(NULL, '7c281d91-ecb4-49d3-aa43-ecb5e41de984':::UUID),
						(ARRAY[1859726162:::OID], '4a03d70e-f211-479f-a8f7-483ebc8ea3c3':::UUID),
						(
							COALESCE(
								ARRAY[]:::OID[],
								CASE
								WHEN NULL THEN ARRAY[387200507:::OID,1797017518:::OID,2854729702:::OID,2173948386:::OID]
								ELSE ARRAY[590142970:::OID,3859529362:::OID,4006149708:::OID,3122667004:::OID]
								END
							),
							'6e58d346-e9d5-4d12-bfce-60a4f891c9ea':::UUID
						)
				)
					AS tab_405 (col_1011, col_1012)
		)
SELECT
	max(cte_ref_46.col_1012::UUID)::UUID AS col_1013
FROM
	with_146 AS cte_ref_46
WHERE
	NULL
GROUP BY
	cte_ref_46.col_1012
ORDER BY
	cte_ref_46.col_1012 DESC
LIMIT
	6:::INT8;

WITH
	with_147 (col_1014)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('t_':::STRING),
						(e'Z$?N\x05':::STRING),
						('XQe':::STRING),
						(
							(json_set(e'{"4+\\\\rT=NHM<": null, "a": false, "foo": [false, null, []]}':::JSONB::JSONB, ARRAY['':::STRING,e'\x0b=dBU$s':::STRING,'I6':::STRING]::STRING[], NULL::JSONB)::JSONB::JSONB->>1:::INT8::INT8)::STRING
						),
						(e',M0!\x10c':::STRING)
				)
					AS tab_406 (col_1014)
		),
	with_148 (col_1015)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('59 years 5 mons 145 days 11:31:40.735587':::INTERVAL),
						('3 years 9 mons 201 days 07:14:35.164958':::INTERVAL),
						('-5 mons -326 days -21:49:43.234077':::INTERVAL)
				)
					AS tab_407 (col_1015)
		)
SELECT
	'{"SKy": [{}, []], "foo": [0.0672137412232797, []], "jM`J": [{}, {}], "|F6)": [true, []]}':::JSONB AS col_1016,
	tab_408._inet AS col_1017,
	tab_408._bool AS col_1018,
	tab_408._interval AS col_1019,
	NULL AS col_1020,
	tab_408._timestamptz AS col_1021,
	tab_408._date AS col_1022
FROM
	defaultdb.public.seed@[0] AS tab_408
WHERE
	tab_408._bool
ORDER BY
	tab_408._date, tab_408._int2 ASC, tab_408._bytes DESC;

WITH
	with_149 (col_1023)
		AS (SELECT * FROM (VALUES ((-1622482173971429180):::INT8), (1564354315198537568:::INT8)) AS tab_409 (col_1023)),
	with_150 (col_1024)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), (2729083382:::OID), (NULL), (804561089:::OID), (1132912214:::OID), (2856597332:::OID))
					AS tab_410 (col_1024)
		),
	with_151 (col_1026)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'yw:\x18\x1c|h+e':::STRING:::NAME),
						(
							(
								SELECT
									NULL AS col_1025
								FROM
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_411
								LIMIT
									1:::INT8
							)
						),
						(e'5^:\'\x0eT\x11':::STRING:::NAME)
				)
					AS tab_412 (col_1026)
		)
SELECT
	(-2201063705067367726):::INT8 AS col_1027
FROM
	with_149 AS cte_ref_47
WHERE
	true
ORDER BY
	cte_ref_47.col_1023 ASC, cte_ref_47.col_1023, cte_ref_47.col_1023 ASC
LIMIT
	75:::INT8;

UPDATE
	defaultdb.public.seed AS tab_413
SET
	_timestamp = tab_413._timestamp,
	_int8 = tab_413._int4,
	_timestamptz = '1970-01-05 03:48:31.000056+00:00':::TIMESTAMPTZ
LIMIT
	89:::INT8;

UPDATE
	defaultdb.public.seed AS tab_414
SET
	_float4 = tab_414._float4
WHERE
	tab_414._bool
ORDER BY
	tab_414._uuid DESC, tab_414._date ASC
LIMIT
	55:::INT8;

DELETE FROM defaultdb.public.seed AS tab_415 LIMIT 84:::INT8;

SELECT
	24084:::INT8 AS col_1028,
	tab_416._timestamptz AS col_1029,
	'3e7b:681a:9a5:b098:ebf1:5268:6883:b6aa/33':::INET AS col_1030,
	'1977-08-17':::DATE AS col_1031
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_416
WHERE
	false
ORDER BY
	tab_416._float4 ASC
LIMIT
	38:::INT8;

WITH
	with_156 (col_1046)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(COALESCE(3365261157:::OID, 2018696067:::OID)),
						(0:::OID),
						(816379325:::OID),
						(1981575619:::OID),
						(NULL)
				)
					AS tab_422 (col_1046)
		),
	with_157 (col_1048, col_1049)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(NULL::FLOAT8[] || ARRAY[1.8875492233993998:::FLOAT8]::FLOAT8[])::FLOAT8[],
							'1970-01-08 22:26:25.000441+00:00':::TIMESTAMPTZ
						),
						(NULL, '1970-01-01 07:12:21.000938+00:00':::TIMESTAMPTZ),
						(
							ARRAY[(-1.2656811484995278):::FLOAT8,(-0.1975506862652655):::FLOAT8,0.9991765414237147:::FLOAT8,(-0.28568257943497427):::FLOAT8],
							'1970-01-09 20:45:39.001+00:00':::TIMESTAMPTZ
						),
						(
							ARRAY[(-2.0494619298988823):::FLOAT8,(-0.9119394309730285):::FLOAT8,0.9205622887660516:::FLOAT8,(-0.7444308170428509):::FLOAT8],
							CASE
							WHEN true THEN '1970-01-12 10:07:16.000279+00:00':::TIMESTAMPTZ
							ELSE experimental_strptime(ltrim(e'FD`p\x1f':::STRING::STRING, NULL::STRING)::STRING::STRING, e'moi0Y)c\x1b':::STRING::STRING)::TIMESTAMPTZ
							END
						),
						(
							(
								SELECT
									NULL AS col_1047
								FROM
									defaultdb.public.seed@[0] AS tab_423
								WHERE
									tab_423._bool
								LIMIT
									1:::INT8
							),
							'1970-01-06 18:13:49.00067+00:00':::TIMESTAMPTZ
						)
				)
					AS tab_424 (col_1048, col_1049)
		)
SELECT
	'18c1:aa8a:b8a0:5a22:c660:e39a:1436:f5b0/63':::INET AS col_1050, tab_425._timestamptz AS col_1051
FROM
	with_157 AS cte_ref_49,
	defaultdb.public.seed@[0] AS tab_425
	JOIN defaultdb.public.seed AS tab_426
		JOIN defaultdb.public.seed AS tab_427 ON
				(tab_426._int8) = (tab_427._int8)
				AND (tab_426._float8) = (tab_427._float8)
				AND (tab_426._date) = (tab_427._date) ON
			(tab_425._date) = (tab_426._date)
			AND (tab_425._date) = (tab_427._date)
			AND (tab_425._date) = (tab_426._date)
LIMIT
	81:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_428
WITH
	with_158 (col_1052, col_1053)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL, '-61 years -11 mons -841 days -12:44:59.226262':::INTERVAL),
						(
							B'0011011001111001111011000000100001101010111110',
							'-79 years -6 mons -26 days -03:47:59.994863':::INTERVAL
						),
						(B'1110101100100011110010011100010010100001010101', NULL)
				)
					AS tab_429 (col_1052, col_1053)
		),
	with_159 (col_1054) AS (SELECT * FROM (VALUES (())) AS tab_430 (col_1054))
SELECT
	(-8146):::INT8 AS col_1055,
	tab_432._int2 AS col_1056,
	tab_431._int8 AS col_1057,
	0.6622439026832581:::FLOAT8 AS col_1058,
	tab_431._float4 AS col_1059,
	tab_431._date AS col_1060,
	tab_431._timestamp AS col_1061,
	tab_431._timestamptz AS col_1062,
	tab_431._interval AS col_1063,
	tab_431._bool AS col_1064,
	mod(tab_431._decimal::DECIMAL, tab_431._decimal::DECIMAL)::DECIMAL AS col_1065,
	tab_431._string AS col_1066,
	tab_432._bytes AS col_1067,
	NULL AS col_1068,
	'f0fe:7092:c65f:e633:497:203c:84c4:c0b1/114':::INET AS col_1069,
	e'{"6f*": {"4\'k;a)8gV+": true, "<RrNyB~D,x{H": {".B82Qq": [], "GsPX": "foo"}, "foobar": {}}, "a": [], "b": [[[null]], true]}':::JSONB
		AS col_1070
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_431
	JOIN defaultdb.public.seed@[0] AS tab_432 ON
			(tab_431._float8) = (tab_432._float8)
			AND (tab_431._float8) = (tab_432._float4)
			AND (tab_431._timestamp) = (tab_432._timestamp)
			AND (tab_431._float4) = (tab_432._float4)
			AND (tab_431._float4) = (tab_432._float8)
WHERE
	false
ORDER BY
	tab_431._float4 DESC, tab_431._decimal DESC, tab_432._uuid DESC
LIMIT
	66:::INT8;

UPDATE defaultdb.public.seed AS tab_435 SET _jsonb = '1':::JSONB LIMIT 39:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_436
WITH
	with_160 (col_1088)
		AS (SELECT * FROM (VALUES (false), (true), (false), (false), (false), (true)) AS tab_437 (col_1088)),
	with_161 (col_1089)
		AS (
			SELECT
				*
			FROM
				(VALUES (81057051:::OID), (633068021:::OID), (NULL), (2049773900:::OID), (NULL), (2066334276:::OID))
					AS tab_438 (col_1089)
		)
SELECT
	16217:::INT8 AS col_1090,
	(-431186631):::INT8 AS col_1091,
	(-2365614672089942616):::INT8 AS col_1092,
	NULL AS col_1093,
	(0.24601798794035137:::FLOAT8::FLOAT8 * 3.4028234663852886e+38:::FLOAT8::FLOAT8)::FLOAT8 AS col_1094,
	'1983-11-05':::DATE AS col_1095,
	'1970-01-06 20:39:38.000543+00:00':::TIMESTAMP AS col_1096,
	'1970-01-02 12:35:16.000635+00:00':::TIMESTAMPTZ AS col_1097,
	NULL AS col_1098,
	cte_ref_50.col_1088 AS col_1099,
	671806034804825.5885:::DECIMAL AS col_1100,
	'':::STRING AS col_1101,
	NULL AS col_1102,
	'59a5e045-2dde-4bf0-b972-52befb070beb':::UUID AS col_1103,
	'b5:7b6b:6d07:979c:b914:6105:8f06:af09/18':::INET AS col_1104,
	e'{"46;jJKNhGX": [[{}]], "N\'E1^@n": [{"foo": 1.5851175311711938}, {}], "bar": {}, "foo": {"\\" j1": ["a", null], "QMSOv@nvd2": {}}}':::JSONB
		AS col_1105
FROM
	with_160 AS cte_ref_50
ORDER BY
	cte_ref_50.col_1088 ASC, cte_ref_50.col_1088 ASC;

UPDATE
	defaultdb.public.seed AS tab_439
SET
	_bool = true,
	_inet = '162.129.2.197/21':::INET,
	_string = tab_439._string,
	_int8 = tab_439._int4,
	_date = tab_439._date
WHERE
	false;

SELECT
	tab_440._timestamp AS col_1106,
	tab_440._float4 AS col_1107,
	tab_440._date AS col_1108,
	CASE WHEN tab_440._bool THEN tab_440._int4 ELSE tab_440._int4 END AS col_1109,
	tab_440._float4 AS col_1110
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_440
ORDER BY
	tab_440._interval, tab_440._date ASC, tab_440._float4 ASC, tab_440._int2, tab_440._timestamp DESC;

INSERT
INTO
	defaultdb.public.seed AS tab_443 (_int2, _int8, _float4, _float8, _bool, _string, _uuid)
WITH
	with_164 (col_1130)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(COALESCE(0:::OID, 2317477244:::OID)),
						(CASE WHEN false THEN 62629040:::OID ELSE 2358192713:::OID END),
						(2942880253:::OID),
						(
							(
								WITH
									with_162 (col_1127) AS (SELECT B'1000100001' AS col_1127),
									with_163 (col_1128)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														('\x':::BYTES),
														('\xf0621be7e694':::BYTES),
														('\x8d4278d2':::BYTES),
														('\x4d5b36b0':::BYTES)
												)
													AS tab_444 (col_1128)
										)
								SELECT
									628466363:::OID AS col_1129
								FROM
									with_162 AS cte_ref_51
								LIMIT
									1:::INT8
							)
						)
				)
					AS tab_445 (col_1130)
		)
SELECT
	NULL AS col_1131,
	7692344205858866946:::INT8 AS col_1132,
	(-0.4600638151168823):::FLOAT8 AS col_1133,
	(-0.4422343639319972):::FLOAT8 AS col_1134,
	NULL AS col_1135,
	'':::STRING AS col_1136,
	'454b66ec-5961-4012-8d36-0a672bc5afef':::UUID AS col_1137
FROM
	with_164 AS cte_ref_52, with_164 AS cte_ref_53
ORDER BY
	cte_ref_52.col_1130
LIMIT
	71:::INT8;

SELECT
	NULL AS col_1138,
	tab_447._date AS col_1139,
	tab_446._date AS col_1140,
	tab_446._date AS col_1141,
	tab_446._date AS col_1142,
	NULL AS col_1143
FROM
	defaultdb.public.seed AS tab_446 JOIN defaultdb.public.seed AS tab_447 ON (tab_446._int8) = (tab_447._int8)
ORDER BY
	tab_447._date DESC, tab_447._date, tab_446._date DESC;

SELECT
	tab_448._int4 AS col_1144,
	NULL AS col_1145,
	tab_450._bool AS col_1146,
	tab_448._bytes AS col_1147,
	tab_450._float4 AS col_1148,
	NULL AS col_1149,
	tab_450._bool AS col_1150
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_448,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_449
	JOIN defaultdb.public.seed@[0] AS tab_450 ON (tab_449._uuid) = (tab_450._uuid)
LIMIT
	75:::INT8;

WITH
	with_165 (col_1151)
		AS (
			SELECT
				B'101' AS col_1151
			FROM
				defaultdb.public.seed@seed__int8__float8__date_idx AS tab_451,
				defaultdb.public.seed@seed__int8__float8__date_idx AS tab_452
			WHERE
				tab_451._bool
		),
	with_166 (col_1152)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							ARRAY[(-6663033667280566.017):::DECIMAL,4.54285218983438793E+35:::DECIMAL,(-4.643511260691567944E+28):::DECIMAL,(-84447521698850.35824):::DECIMAL]
						),
						(
							ARRAY[(-0.04263960465400443695):::DECIMAL,(-0.2389184631143677223):::DECIMAL,(-2.382885458176859132E+28):::DECIMAL,3.464639421355013305E+22:::DECIMAL]
						),
						(ARRAY[(-8376752501.379433396):::DECIMAL,(-1840.492805082715471):::DECIMAL]),
						(
							ARRAY[(-7.531453624827621496E+29):::DECIMAL,(-7.350173494231239979E+25):::DECIMAL,4032808228704745936:::DECIMAL]
						)
				)
					AS tab_453 (col_1152)
		)
SELECT
	count(*) AS col_1153
FROM
	defaultdb.public.seed@[0] AS tab_454
WHERE
	tab_454._bool
GROUP BY
	tab_454._jsonb
LIMIT
	23:::INT8;

WITH
	with_167 (col_1154)
		AS (SELECT * FROM (VALUES ('252.221.29.58/5':::INET), ('0.0.0.0/0':::INET)) AS tab_456 (col_1154)),
	with_168 (col_1155) AS (SELECT * FROM (VALUES (2083292913:::OID), (2955449614:::OID)) AS tab_457 (col_1155))
SELECT
	'";J+"':::JSONB AS col_1156, 'ff41a403-b0e3-4761-9a93-289c4671c11e':::UUID AS col_1157
FROM
	defaultdb.public.seed@[0] AS tab_458
WHERE
	tab_458._bool
ORDER BY
	tab_458._uuid ASC, tab_458._int8, tab_458._timestamp DESC;

WITH
	with_169 (col_1158)
		AS (
			SELECT
				*
			FROM
				(VALUES (e')p-,Mj\x10~':::STRING), (e'7\x15KfA':::STRING), (e'mlO8Kr\x19M\b':::STRING))
					AS tab_459 (col_1158)
		)
SELECT
	tab_460._interval AS col_1159,
	'{"test": "json"}':::JSONB AS col_1160,
	tab_460._decimal AS col_1161,
	'i6':::STRING AS col_1162,
	(-1.0186976371462868):::FLOAT8 AS col_1163,
	1.6766806840896606:::FLOAT8 AS col_1164
FROM
	defaultdb.public.seed@[0] AS tab_460
ORDER BY
	tab_460._uuid DESC
LIMIT
	99:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_461 (_float8, _timestamptz, _interval, _bool, _uuid)
SELECT
	tab_462._float4 AS col_1165,
	tab_463._timestamptz AS col_1166,
	'-51 years -177 days -14:19:41.826333':::INTERVAL AS col_1167,
	true AS col_1168,
	'fa6d5647-218a-440a-81c6-18cda11ed6a7':::UUID AS col_1169
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_462, defaultdb.public.seed@[0] AS tab_463
WHERE
	(false OR (tab_462._bool OR tab_462._bool))
ORDER BY
	tab_462._date DESC, tab_462._float8 ASC
LIMIT
	34:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_464 (_float4, _date, _timestamptz, _decimal, _bytes, _inet)
SELECT
	0.352340966463089:::FLOAT8 AS col_1170,
	tab_465._date AS col_1171,
	'1970-01-10 17:47:51.000656+00:00':::TIMESTAMPTZ AS col_1172,
	(-4576895.442887253326):::DECIMAL AS col_1173,
	tab_465._bytes AS col_1174,
	tab_465._inet AS col_1175
FROM
	defaultdb.public.seed@[0] AS tab_465
LIMIT
	79:::INT8;

SELECT
	(-8797):::INT8 AS col_1176, NULL AS col_1177, '93db:d9cf:eb7f:78d2:6ba2:10c4:11d1:54ed/108':::INET AS col_1178
FROM
	defaultdb.public.seed@[0] AS tab_466
WHERE
	tab_466._bool
ORDER BY
	tab_466._timestamptz ASC, tab_466._int2 ASC
LIMIT
	15:::INT8;

INSERT INTO defaultdb.public.seed AS tab_467 DEFAULT VALUES;

DELETE FROM defaultdb.public.seed AS tab_468 ORDER BY tab_468._timestamptz DESC LIMIT 67:::INT8;

DELETE FROM defaultdb.public.seed AS tab_471;

SELECT
	tab_472._bool AS col_1195,
	NULL AS col_1196,
	tab_472._int2 AS col_1197,
	34725175217986959:::INT8 AS col_1198,
	tab_472._jsonb AS col_1199,
	NULL AS col_1200,
	'd9badadc-257b-46fe-a031-645f1e8e8b21':::UUID AS col_1201,
	tab_472._timestamp AS col_1202
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_472
WHERE
	tab_472._bool
LIMIT
	61:::INT8;

UPDATE
	defaultdb.public.seed AS tab_473
SET
	_decimal = sign(tab_473._decimal::DECIMAL)::DECIMAL
ORDER BY
	tab_473._interval, tab_473._date, tab_473._float4 ASC, tab_473._uuid DESC
LIMIT
	11:::INT8;

SELECT
	tab_474._date AS col_1203,
	tab_474._uuid AS col_1204,
	tab_474._bytes AS col_1205,
	'1970-01-09 09:28:35.000791+00:00':::TIMESTAMP AS col_1206
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_474
WHERE
	tab_474._bool
ORDER BY
	tab_474._date DESC;

DELETE FROM defaultdb.public.seed AS tab_475 WHERE false LIMIT 27:::INT8;

WITH
	with_170 (col_1207)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('-26 years -930 days -15:59:02.76497':::INTERVAL),
						('40 years 11 mons 313 days 18:59:21.360333':::INTERVAL),
						(NULL),
						('49 years 3 mons 447 days 15:27:06.813607':::INTERVAL),
						(NULL)
				)
					AS tab_476 (col_1207)
		)
SELECT
	tab_477._timestamptz AS col_1208,
	tab_477._float4 AS col_1209,
	false AS col_1210,
	tab_477._uuid AS col_1211,
	tab_477._int4 AS col_1212,
	NULL AS col_1213,
	'{"EC9`o": [0.5601302946226139, {}, false], "foo": 1.5330760751085952, "g{%,/Z:feH": true}':::JSONB AS col_1214,
	'\xfbdedcea36a26d':::BYTES AS col_1215
FROM
	with_170 AS cte_ref_54, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_477
LIMIT
	35:::INT8;

WITH
	with_171 (col_1216)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1714ee49-dd31-458c-b15b-dd3ad70d6acd':::UUID),
						(NULL),
						('22a8d491-4287-4a10-a7f6-b1e20824b5f8':::UUID),
						('f398600d-0485-4c69-9154-24db3360a523':::UUID)
				)
					AS tab_478 (col_1216)
		),
	with_175 (col_1221, col_1222)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(
								WITH
									with_172 (col_1217)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(NULL),
														(NULL),
														('18:13:12.768896+09:04:00':::TIMETZ),
														('20:46:10.735385-08:49:00':::TIMETZ)
												)
													AS tab_479 (col_1217)
										),
									with_173 (col_1218)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(B'11011010000001010'),
														(B'11111100111101010'),
														(
															B'0000000000000000000000000000000000000000000000000000000000000000'
														),
														(B'01001101101011111'),
														(B'10101100010011011'),
														(B'10001000011000001')
												)
													AS tab_480 (col_1218)
										),
									with_174 (col_1219)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														('07:28:50.529298+07:54:00':::TIMETZ),
														(COALESCE('00:00:00+15:59:00':::TIMETZ, NULL)),
														('17:49:29.973816+03:39:00':::TIMETZ)
												)
													AS tab_481 (col_1219)
										)
								SELECT
									722949394:::INT8 AS col_1220
								FROM
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_482
								WHERE
									false
								LIMIT
									1:::INT8
							),
							0:::OID
						),
						((-1373345894):::INT8, 2151999595:::OID),
						(1459278231:::INT8, 324867551:::OID)
				)
					AS tab_483 (col_1221, col_1222)
		)
SELECT
	tab_484._interval AS col_1223, (tab_484._date::DATE - 'infinity':::DATE::DATE)::INT8 AS col_1224
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_484
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_485 ON (tab_484._int8) = (tab_485._int2)
WHERE
	(NOT false)
ORDER BY
	tab_484._uuid DESC, tab_484._interval ASC;

SELECT
	tab_486._date AS col_1225,
	(SELECT tab_487._date AS col_1226 FROM defaultdb.public.seed@[0] AS tab_489 LIMIT 1:::INT8) AS col_1227,
	'1983-06-23':::DATE AS col_1228,
	tab_488._jsonb AS col_1229
FROM
	defaultdb.public.seed AS tab_486
	JOIN defaultdb.public.seed AS tab_487 ON (tab_486._int8) = (tab_487._int8) AND (tab_486._float8) = (tab_487._float8)
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_488 ON
			(tab_487._date) = (tab_488._date) AND (tab_486._date) = (tab_488._date)
WHERE
	tab_488._string NOT ILIKE tab_488._string;

SELECT NULL AS col_1230 LIMIT 2:::INT8;

DELETE FROM defaultdb.public.seed AS tab_490 WHERE tab_490._bool LIMIT 62:::INT8;

WITH
	with_176 (col_1231)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(3126390949:::OID),
						(10963365:::OID),
						(637964643:::OID),
						(NULL),
						(2155974610:::OID),
						(3189132616:::OID)
				)
					AS tab_491 (col_1231)
		)
SELECT
	cte_ref_55.col_1231 AS col_1232
FROM
	with_176 AS cte_ref_55;

WITH
	with_177 (col_1233, col_1234)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-128):::INT8, true),
						((-32768):::INT8, true),
						((-3516):::INT8, CASE WHEN true THEN true ELSE true END)
				)
					AS tab_492 (col_1233, col_1234)
		)
SELECT
	count(*) AS col_1235
FROM
	defaultdb.public.seed@[0] AS tab_493
GROUP BY
	tab_493._jsonb
HAVING
	not_like_escape('9nrN_|':::STRING::STRING, ';8x~VtI{?':::STRING::STRING, e'\U00002603':::STRING::STRING)::BOOL;

WITH
	with_178 (col_1236)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						('1970-01-03 19:01:05.000746+00:00':::TIMESTAMPTZ),
						('1970-01-03 06:20:19.000051+00:00':::TIMESTAMPTZ),
						('1970-01-04 22:45:05.000242+00:00':::TIMESTAMPTZ),
						('1970-01-01 11:49:28.000047+00:00':::TIMESTAMPTZ),
						('1970-01-03 09:33:49.000103+00:00':::TIMESTAMPTZ)
				)
					AS tab_494 (col_1236)
		),
	with_179 (col_1237, col_1238)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(B'0000110111101101110101011110001111100001010100', NULL),
						(B'0111110100000111101011110111000010111110111001', NULL),
						(B'0101011000001010001011010011100001010011000101', 2501915526:::OID),
						(B'0100110001001010111010010101110111111000100111', NULL)
				)
					AS tab_495 (col_1237, col_1238)
		)
SELECT
	(((-4.071882725060203616E+28):::DECIMAL::DECIMAL * NULL::INT8)::DECIMAL::DECIMAL ^ 3481184237844602110:::INT8::INT8)::DECIMAL
		AS col_1239;

WITH
	with_180 (col_1240)
		AS (SELECT * FROM (VALUES (1352108621604322801:::INT8), ((-6310532680041199011):::INT8)) AS tab_496 (col_1240)),
	with_181 (col_1241) AS (SELECT * FROM (VALUES (1589429387:::OID)) AS tab_497 (col_1241))
SELECT
	tab_498._timestamptz AS col_1242,
	tab_498._float4 AS col_1243,
	false AS col_1244,
	tab_498._jsonb AS col_1245,
	'73 years 10 mons 370 days 03:51:51.048015':::INTERVAL AS col_1246,
	(-0.3634185791015625):::FLOAT8 AS col_1247,
	(-3541):::INT8 AS col_1248,
	tab_498._bytes AS col_1249,
	tab_498._string AS col_1250,
	'23.64.213.151/23':::INET AS col_1251,
	466301956:::INT8 AS col_1252,
	NULL AS col_1253,
	tab_498._date AS col_1254,
	tab_498._timestamp AS col_1255,
	6559605586637273002:::INT8 AS col_1256,
	length(tab_498._string::STRING)::INT8 AS col_1257,
	tab_498._decimal AS col_1258
FROM
	with_180 AS cte_ref_56, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_498
ORDER BY
	tab_498._int4, tab_498._int4 ASC, tab_498._decimal
LIMIT
	17:::INT8;

WITH
	with_182 (col_1259) AS (SELECT * FROM (VALUES (3797656888:::OID)) AS tab_499 (col_1259)),
	with_183 (col_1260)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), (NULL), ('18:53:11.780952':::TIME), ('17:42:21.767381':::TIME)) AS tab_500 (col_1260)
		),
	with_184 (col_1261)
		AS (SELECT * FROM (VALUES ('1970-01-04 05:35:05.000238+00:00':::TIMESTAMPTZ), (NULL)) AS tab_501 (col_1261))
SELECT
	tab_502._decimal AS col_1262,
	tab_502._int2 AS col_1263,
	tab_502._int2 AS col_1264,
	'1970-01-07 00:00:46.000608+00:00':::TIMESTAMPTZ AS col_1265,
	'1977-09-22':::DATE AS col_1266
FROM
	defaultdb.public.seed@[0] AS tab_502
LIMIT
	62:::INT8;

WITH
	with_189 (col_1285, col_1286)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('null':::JSONB, true),
						(
							'[[["ruG"], {}], {"bar": 2.6156992611243206, "c": []}, [], {}]':::JSONB,
							not_ilike_escape(e'Iy1-S\x0bx;n':::STRING::STRING, crdb_internal.cluster_name()::STRING::STRING, sha256('':::STRING::STRING)::STRING::STRING)::BOOL
						)
				)
					AS tab_510 (col_1285, col_1286)
		)
SELECT
	cte_ref_59.col_1285 AS col_1287, NULL AS col_1288
FROM
	with_189 AS cte_ref_59
WHERE
	false
LIMIT
	75:::INT8;

UPDATE
	defaultdb.public.seed AS tab_511
SET
	_timestamptz = tab_511._timestamptz
WHERE
	tab_511._string SIMILAR TO tab_511._string
LIMIT
	96:::INT8;

UPDATE
	defaultdb.public.seed AS tab_512
SET
	_jsonb = tab_512._jsonb,
	_int2 = 32767:::INT8,
	_decimal = (tab_512._decimal::DECIMAL / tab_512._decimal::DECIMAL)::DECIMAL,
	_uuid = '78e1b72e-d1c4-4017-93d1-f5c033a6fa82':::UUID,
	_bytes = tab_512._bytes
ORDER BY
	tab_512._string DESC
LIMIT
	20:::INT8;

SELECT
	tab_513._bool AS col_1289,
	tab_513._decimal AS col_1290,
	tab_513._int2 AS col_1291,
	tab_513._float8 AS col_1292,
	tab_513._float4 AS col_1293,
	('51 years 3 mons 963 days 22:35:33.452744':::INTERVAL::INTERVAL + '1988-11-04':::DATE::DATE)::TIMESTAMP
		AS col_1294,
	NULL AS col_1295,
	tab_513._inet AS col_1296,
	'{"a": {}, "bar": ";z8#h{", "c": [[0.17591866267946554], false], "foo": {}}':::JSONB AS col_1297,
	'1970-01-07 16:32:45.000631+00:00':::TIMESTAMPTZ AS col_1298,
	tab_513._bytes AS col_1299,
	NULL AS col_1300,
	'd58b0708-28fe-42a3-ad73-e6d3e5585f2d':::UUID AS col_1301,
	tab_513._int8 AS col_1302
FROM
	defaultdb.public.seed@[0] AS tab_513
LIMIT
	69:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_514 (_bool, _uuid, _inet, _jsonb)
SELECT
	tab_518._bool AS col_1303, tab_517._uuid AS col_1304, tab_518._inet AS col_1305, 'null':::JSONB AS col_1306
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_515
	JOIN defaultdb.public.seed@[0] AS tab_516 ON
			(tab_515._inet) = (tab_516._inet)
			AND (tab_515._float8) = (tab_516._float8)
			AND (tab_515._timestamptz) = (tab_516._timestamptz)
			AND (tab_515._float4) = (tab_516._float8),
	defaultdb.public.seed@[0] AS tab_517,
	defaultdb.public.seed@[0] AS tab_518
ORDER BY
	tab_515._timestamptz ASC
LIMIT
	21:::INT8;

SELECT
	(-23033):::INT8 AS col_1307,
	tab_519._float8 AS col_1308,
	NULL AS col_1309,
	e'\U00002603':::STRING AS col_1310,
	tab_519._timestamp AS col_1311,
	tab_519._bytes AS col_1312,
	tab_519._date AS col_1313
FROM
	defaultdb.public.seed@[0] AS tab_519
LIMIT
	61:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_520 (_int2, _int8, _float4, _timestamp, _interval, _bytes, _uuid)
SELECT
	tab_521._int8 AS col_1314,
	tab_522._int4 AS col_1315,
	(-0.9626731872558594):::FLOAT8 AS col_1316,
	tab_522._timestamp AS col_1317,
	'-6 years -11 mons -728 days -08:50:28.726991':::INTERVAL AS col_1318,
	(tab_522._bytes::BYTES || tab_522._bytes::BYTES)::BYTES AS col_1319,
	'ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID AS col_1320
FROM
	defaultdb.public.seed@[0] AS tab_521
	JOIN defaultdb.public.seed@[0] AS tab_522 ON (tab_521._int4) = (tab_522._int4) AND (tab_521._bool) = (tab_522._bool)
ORDER BY
	tab_521._decimal
LIMIT
	99:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_523 (_int4, _int8, _float4, _timestamptz, _interval, _decimal, _string, _uuid, _inet)
WITH
	with_190 (col_1321) AS (SELECT tab_524._int8 AS col_1321 FROM defaultdb.public.seed@[0] AS tab_524),
	with_191 (col_1322)
		AS (
			SELECT
				*
			FROM
				(VALUES (e'\x1eqD\x1c\x012[':::STRING), (e'n#\x0fdrVUX\x02':::STRING), (NULL), ('':::STRING), (NULL))
					AS tab_525 (col_1322)
		)
SELECT
	tab_526._int8 AS col_1323,
	tab_526._int2 AS col_1324,
	tab_526._float4 AS col_1325,
	tab_526._timestamptz AS col_1326,
	tab_526._interval AS col_1327,
	tab_526._decimal AS col_1328,
	quote_literal(tab_526._int8):::STRING::STRING AS col_1329,
	'3ef1295c-3973-4eac-a965-89ae29196aca':::UUID AS col_1330,
	'73.134.41.118/8':::INET AS col_1331
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_526
LIMIT
	86:::INT8;

UPDATE
	defaultdb.public.seed AS tab_527
SET
	_bytes = '\x5109a686610628':::BYTES,
	_float8 = tab_527._float8,
	_bool = false,
	_int4 = (-270143789):::INT8,
	_int8 = tab_527._int4
WHERE
	(tab_527._bool IS NULL)
ORDER BY
	tab_527._bool ASC
LIMIT
	92:::INT8;

SELECT
	tab_529._jsonb AS col_1332
FROM
	defaultdb.public.seed AS tab_528 JOIN defaultdb.public.seed AS tab_529 ON (tab_528._jsonb) = (tab_529._jsonb)
LIMIT
	26:::INT8;

SELECT
	tab_530._int2 AS col_1333,
	e'\x114\b+7M1T\x1c':::STRING AS col_1334,
	tab_530._bytes AS col_1335,
	tab_530._float4 AS col_1336,
	tab_530._uuid AS col_1337,
	tab_530._bool AS col_1338,
	tab_530._date AS col_1339,
	'1970-01-08 00:01:43.000621+00:00':::TIMESTAMPTZ AS col_1340,
	tab_530._timestamp AS col_1341,
	'71 years 5 mons 395 days 14:05:23.992013':::INTERVAL AS col_1342,
	tab_530._jsonb AS col_1343,
	tab_530._inet AS col_1344,
	tab_530._decimal AS col_1345,
	tab_530._int2 AS col_1346,
	23638:::INT8 AS col_1347,
	(
		WITH
			with_192 (col_1348, col_1349)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(NULL, (e'akm\x04\x02L%\x04':::STRING, '1970-01-06 11:08:43.00032+00:00':::TIMESTAMP)),
								(0:::OID, ('':::STRING, '1970-01-09 20:43:46.000214+00:00':::TIMESTAMP)),
								(
									741527174:::OID,
									(e'AQhd&1\x01':::STRING, '1970-01-08 00:49:06.000549+00:00':::TIMESTAMP)
								),
								(0:::OID, (e'\x04':::STRING, '1970-01-06 11:13:49.000941+00:00':::TIMESTAMP)),
								(2888558424:::OID, NULL)
						)
							AS tab_531 (col_1348, col_1349)
				)
		SELECT
			tab_530._float8 AS col_1350
		FROM
			with_192 AS cte_ref_60
		WHERE
			true
		ORDER BY
			cte_ref_60.col_1349 ASC
		LIMIT
			1:::INT8
	)
		AS col_1351
FROM
	defaultdb.public.seed@[0] AS tab_530
ORDER BY
	tab_530._bool ASC
LIMIT
	77:::INT8;

UPDATE
	defaultdb.public.seed AS tab_532
SET
	_uuid = '6e3b2feb-bda1-483c-a621-590acffd5cd1':::UUID, _float8 = tab_532._float4, _interval = tab_532._interval
WHERE
	false
ORDER BY
	tab_532._inet
LIMIT
	70:::INT8;

WITH
	with_193 (col_1352, col_1353)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(left('\xaa13895f31d8':::BYTES::BYTES, (-1):::INT8::INT8)::BYTES, NULL),
						(
							convert_to((e'91\x05$\x0bkS':::STRING::STRING || '':::STRING::STRING)::STRING::STRING, ('0.3730363518006452':::JSONB::JSONB->>e'\n\t.Z':::STRING::STRING)::STRING::STRING)::BYTES,
							e'\x0f\x03\x15EBQ':::STRING
						),
						('\x22':::BYTES, 'pD':::STRING)
				)
					AS tab_533 (col_1352, col_1353)
		)
SELECT
	'\x71f7013e':::BYTES AS col_1354, cte_ref_61.col_1353 AS col_1355
FROM
	with_193 AS cte_ref_61
LIMIT
	90:::INT8;

UPDATE
	defaultdb.public.seed AS tab_534
SET
	_timestamp = NULL, _int8 = tab_534._int2, _string = tab_534._string
WHERE
	tab_534._bool
LIMIT
	28:::INT8;

WITH
	with_194 (col_1356)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('-18 years -10 mons -418 days -04:16:14.046903':::INTERVAL),
						(
							COALESCE(
								'21 years 8 mons 244 days 06:37:44.031403':::INTERVAL,
								'-18 years -4 mons -663 days -06:11:46.925452':::INTERVAL
							)
						),
						(date_trunc(e'\x00':::STRING::STRING, '20:04:49.457977':::TIME::TIME)::INTERVAL),
						(('00:00:00':::INTERVAL::INTERVAL / (-1.7783421454814017):::FLOAT8::FLOAT8)::INTERVAL),
						('-73 years -5 mons -658 days -10:16:21.901722':::INTERVAL)
				)
					AS tab_535 (col_1356)
		),
	with_195 (col_1357)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('08:45:07.543784+05:41:00':::TIMETZ),
						('02:55:44.240591-10:55:00':::TIMETZ),
						('21:37:27.242497+05:33:00':::TIMETZ),
						('15:36:22.520291+13:45:00':::TIMETZ),
						('08:43:24.176663-03:49:00':::TIMETZ)
				)
					AS tab_536 (col_1357)
		)
SELECT
	tab_537._float4 AS col_1358,
	tab_537._uuid AS col_1359,
	tab_537._inet AS col_1360,
	tab_537._string AS col_1361,
	NULL AS col_1362,
	tab_537._int4 AS col_1363,
	tab_537._bytes AS col_1364,
	tab_537._jsonb AS col_1365,
	tab_537._date AS col_1366,
	'-70 years -11 mons -414 days -08:50:15.878415':::INTERVAL AS col_1367,
	tab_537._bool AS col_1368,
	(-4.407179043101096973E+23):::DECIMAL AS col_1369
FROM
	defaultdb.public.seed@[0] AS tab_537
WHERE
	tab_537._bool
LIMIT
	95:::INT8;

SELECT
	ARRAY[e'\n\x1b\x06A&\tsB':::STRING,e'pTe\b\x0e':::STRING,e'#cO\x10,Yy\x02,':::STRING,';':::STRING] AS col_1370
LIMIT
	23:::INT8;

WITH
	with_196 (col_1371) AS (SELECT * FROM (VALUES (NULL)) AS tab_538 (col_1371)),
	with_197 (col_1372)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(0.20837284624576569:::FLOAT8),
						((-1.0362035036087036):::FLOAT8),
						((-0.7944328188896179):::FLOAT8),
						(0.3458155393600464:::FLOAT8),
						(0.3216981887817383:::FLOAT8)
				)
					AS tab_539 (col_1372)
		)
SELECT
	ret_1 AS col_1373, 0.14001914858818054:::FLOAT8 AS col_1374
FROM
	with_196 AS cte_ref_62,
	[
		UPDATE
			defaultdb.public.seed AS tab_540
		SET
			_timestamp = '1970-01-08 19:33:07.000908+00:00':::TIMESTAMP, _int8 = 4307249433036511854:::INT8
		WHERE
			NULL
		LIMIT
			52:::INT8
		RETURNING
			NULL AS ret_1
	],
	with_197 AS cte_ref_63
ORDER BY
	cte_ref_62.col_1371 ASC, ret_1;

WITH
	with_198 (col_1375, col_1376, col_1377)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(false, 855602273169294.5707:::DECIMAL, '1970-01-10 07:01:33.000584+00:00':::TIMESTAMPTZ),
						(
							false,
							COALESCE(
								NULL,
								COALESCE((-8.369361372085091891E+22):::DECIMAL, 1.172353568034988279E+24:::DECIMAL)
							),
							date_trunc(NULL::STRING, '0001-01-01 00:00:00+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::TIMESTAMPTZ
						),
						(true, 1:::DECIMAL, '1970-01-07 03:09:51.000644+00:00':::TIMESTAMPTZ),
						(NULL, (-2.560269175596829894E+30):::DECIMAL, '1970-01-04 06:39:31.000175+00:00':::TIMESTAMPTZ),
						(true, 3791691574605214663:::DECIMAL, statement_timestamp():::TIMESTAMPTZ::TIMESTAMPTZ),
						(true, NULL, '1970-01-03 23:33:04.000967+00:00':::TIMESTAMPTZ)
				)
					AS tab_541 (col_1375, col_1376, col_1377)
		),
	with_199 (col_1378)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-01 18:58:49.00075+00:00':::TIMESTAMPTZ),
						('1970-01-02 15:30:35.000325+00:00':::TIMESTAMPTZ),
						(COALESCE('1970-01-03 03:54:14.000973+00:00':::TIMESTAMPTZ, NULL)),
						('-2000-01-01 00:00:00+00:00':::TIMESTAMPTZ),
						(
							date_trunc(NULL::STRING, clock_timestamp():::TIMESTAMPTZ::TIMESTAMPTZ::TIMESTAMPTZ)::TIMESTAMPTZ
						)
				)
					AS tab_542 (col_1378)
		),
	with_200 (col_1379)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[]:::INT2[]),
						(ARRAY[(-31260):::INT8,(-11374):::INT8,22528:::INT8,22483:::INT8,(-1):::INT8]),
						(ARRAY[(-4099):::INT8,23839:::INT8,24535:::INT8]),
						(ARRAY[(-9296):::INT8,31094:::INT8]),
						(ARRAY[(-30899):::INT8]),
						(ARRAY[30482:::INT8])
				)
					AS tab_543 (col_1379)
		)
SELECT
	('1970-01-04 11:43:13.000755+00:00':::TIMESTAMPTZ::TIMESTAMPTZ + age(cte_ref_64.col_1378::TIMESTAMPTZ, '1970-01-09 04:29:00.000278+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL::INTERVAL)::TIMESTAMPTZ
		AS col_1380
FROM
	with_199 AS cte_ref_64
LIMIT
	15:::INT8;

WITH
	with_201 (col_1381) AS (SELECT * FROM (VALUES (4156335205:::OID)) AS tab_544 (col_1381)),
	with_202 (col_1382)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(556416512:::OID),
						(1846805648:::OID),
						(COALESCE(2381156403:::OID, 442302347:::OID)),
						(0:::OID),
						(NULL),
						(0:::OID)
				)
					AS tab_545 (col_1382)
		)
SELECT
	tab_546._timestamp AS col_1383
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_546
WHERE
	NULL
ORDER BY
	tab_546._date DESC, tab_546._bool DESC, tab_546._bool DESC, tab_546._date, tab_546._float8, tab_546._int8
LIMIT
	12:::INT8;

SELECT
	min(tab_549._string::STRING)::STRING AS col_1384
FROM
	defaultdb.public.seed AS tab_547
	JOIN defaultdb.public.seed AS tab_548 ON (tab_547._jsonb) = (tab_548._jsonb),
	defaultdb.public.seed@[0] AS tab_549
GROUP BY
	tab_549._string
HAVING
	max(tab_549._bool::BOOL)::BOOL;

UPDATE
	defaultdb.public.seed AS tab_550
SET
	_bytes = tab_550._bytes,
	_timestamptz = '1970-01-02 08:53:33.000292+00:00':::TIMESTAMPTZ,
	_float4 = tab_550._float8,
	_int8 = 32767:::INT8;

WITH
	with_203 (col_1385)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('15bd4a9c-ac09-4e14-9bcb-5070eb1d2588':::UUID),
						('323e9166-b1bd-416f-9b02-88d221b3dbb7':::UUID),
						('168e5f28-cf2a-4f43-aaef-3b84fd256a01':::UUID)
				)
					AS tab_551 (col_1385)
		),
	with_204 (col_1386) AS (SELECT B'1110111100010110000011000011010011111010' AS col_1386)
SELECT
	'1978-03-30':::DATE AS col_1387,
	tab_552._interval AS col_1388,
	tab_552._uuid AS col_1389,
	'1970-01-02 03:40:57.000775+00:00':::TIMESTAMP AS col_1390,
	('\xc38eca61765f0a':::BYTES::BYTES || tab_552._bytes::BYTES)::BYTES AS col_1391,
	tab_552._float4 AS col_1392,
	tab_552._inet AS col_1393,
	tab_552._string AS col_1394
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_552
WHERE
	NULL
ORDER BY
	tab_552._timestamptz ASC
LIMIT
	13:::INT8;

UPDATE defaultdb.public.seed AS tab_553 SET _date = '4714-11-24 BC':::DATE;

WITH
	with_205 (col_1395)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-6268250499615512602):::INT8),
						(3693836010469947237:::INT8),
						(NULL),
						((-918810984268337361):::INT8),
						((-5725240203118798300):::INT8)
				)
					AS tab_554 (col_1395)
			UNION ALL SELECT * FROM (VALUES (NULL)) AS tab_555 (col_1396)
		)
SELECT
	'1972-01-24':::DATE AS col_1397,
	tab_556._float4 AS col_1398,
	'1970-01-05 05:17:34.000098+00:00':::TIMESTAMP AS col_1399,
	(-4084351240579301193):::INT8 AS col_1400,
	NULL AS col_1401,
	NULL AS col_1402,
	tab_556._jsonb AS col_1403,
	tab_556._bool AS col_1404,
	tab_556._uuid AS col_1405,
	tab_556._float4 AS col_1406,
	tab_556._inet AS col_1407,
	tab_556._decimal AS col_1408
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_556
LIMIT
	52:::INT8;

UPDATE
	defaultdb.public.seed AS tab_557
SET
	_inet = tab_557._inet, _int4 = tab_557._int4, _timestamptz = NULL
LIMIT
	73:::INT8;

SELECT
	CASE WHEN NULL THEN tab_566._decimal ELSE 50809660258379494.40:::DECIMAL END AS col_1419,
	NULL AS col_1420,
	tab_566._date AS col_1421,
	tab_566._float4 AS col_1422
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_566
WHERE
	false;

WITH
	with_211 (col_1423) AS (SELECT * FROM (VALUES (4266689938:::OID)) AS tab_567 (col_1423))
SELECT
	1279604607:::OID AS col_1424
FROM
	with_211 AS cte_ref_65
WHERE
	true
GROUP BY
	cte_ref_65.col_1423;

WITH
	with_212 (col_1425)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('396f:647d:160b:94d8:859c:6886:96c1:8a97/22':::INET),
						('70.129.106.201/14':::INET),
						('61.4.134.246/17':::INET),
						('172.78.67.240/7':::INET),
						('171.113.212.83/9':::INET)
				)
					AS tab_568 (col_1425)
			INTERSECT ALL
				SELECT
					*
				FROM
					(
						VALUES
							(
								netmask(('213.48.242.53/23':::INET::INET + 562912944127676179:::INT8::INT8)::INET::INET)::INET
							),
							('c7b5:4bd0:d7cb:27f3:bc5f:29f9:e591:2f12/23':::INET),
							('ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET),
							(('61.243.2.19/0':::INET::INET | '240.4.115.90/30':::INET::INET)::INET)
					)
						AS tab_569 (col_1426)
		)
SELECT
	count(*) AS col_1427
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_570
WHERE
	tab_570._bool
GROUP BY
	tab_570._int8, tab_570._float8, tab_570._date
HAVING
	crdb_internal.is_admin()::BOOL
ORDER BY
	tab_570._date, tab_570._int8 ASC
LIMIT
	78:::INT8;

UPDATE defaultdb.public.seed AS tab_571 SET _inet = tab_571._inet LIMIT 49:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_572 (_int2, _date, _timestamp, _interval, _bool, _decimal, _jsonb)
SELECT
	tab_573._int8 AS col_1428,
	tab_573._date AS col_1429,
	'1970-01-07 19:30:01.00075+00:00':::TIMESTAMP AS col_1430,
	tab_573._interval AS col_1431,
	tab_573._bool AS col_1432,
	tab_573._decimal AS col_1433,
	'{":;Zlu/": false, "I.~t~^8": ["b"], "foo": []}':::JSONB AS col_1434
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_573
LIMIT
	45:::INT8;

SELECT
	stddev(tab_574._decimal::DECIMAL)::DECIMAL AS col_1435
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_574
WHERE
	false
GROUP BY
	tab_574._decimal;

WITH
	with_213 (col_1436) AS (SELECT * FROM (VALUES ('23:59:59.999999':::TIME)) AS tab_575 (col_1436))
SELECT
	'04:52:35.21554':::TIME AS col_1437
FROM
	with_213 AS cte_ref_66
LIMIT
	49:::INT8;

UPDATE
	defaultdb.public.seed AS tab_582
SET
	_int8 = 4100639730835661216:::INT8
WHERE
	false
ORDER BY
	tab_582._int4 DESC
LIMIT
	6:::INT8;

WITH
	with_218 (col_1454)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[1.156905013118872444E+34:::DECIMAL,(-5.010668957038961322E+26):::DECIMAL]),
						(ARRAY[4.584541774787619387E+20:::DECIMAL,8.235876928627859621E+19:::DECIMAL])
				)
					AS tab_583 (col_1454)
		)
SELECT
	'1994-12-23':::DATE AS col_1455, tab_584._uuid AS col_1456
FROM
	defaultdb.public.seed@[0] AS tab_584
WHERE
	false
ORDER BY
	tab_584._uuid DESC
LIMIT
	54:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_585 (_int2, _int8, _float4, _date, _timestamp, _bool, _string, _bytes, _uuid)
SELECT
	tab_586._int8 AS col_1457,
	tab_586._int4 AS col_1458,
	tab_586._float8 AS col_1459,
	'1986-10-10':::DATE AS col_1460,
	tab_586._timestamp AS col_1461,
	tab_586._bool AS col_1462,
	tab_586._string AS col_1463,
	NULL AS col_1464,
	NULL AS col_1465
FROM
	defaultdb.public.seed@[0] AS tab_586
WHERE
	NULL
ORDER BY
	tab_586._int8 ASC
LIMIT
	9:::INT8;

SELECT
	'1970-01-08 23:14:36.000389+00:00':::TIMESTAMPTZ AS col_1466,
	tab_588._bool AS col_1467,
	'{}':::JSONB AS col_1468,
	1.370018720626831:::FLOAT8 AS col_1469,
	tab_587._timestamptz AS col_1470,
	tab_587._int2 AS col_1471,
	NULL AS col_1472,
	tab_588._jsonb AS col_1473,
	tab_587._float8 AS col_1474,
	tab_588._decimal AS col_1475,
	(-85057083):::INT8 AS col_1476,
	tab_588._timestamp AS col_1477,
	NULL AS col_1478,
	tab_587._inet AS col_1479,
	tab_589._jsonb AS col_1480,
	tab_587._float4 AS col_1481,
	'140.112.219.196/16':::INET AS col_1482,
	e']FszzE\x7f':::STRING AS col_1483,
	json_build_array(tab_587._timestamp)::JSONB AS col_1484,
	'\x5c8bb726':::BYTES AS col_1485,
	tab_587._interval AS col_1486
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_587
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_588
		JOIN defaultdb.public.seed AS tab_589
			JOIN defaultdb.public.seed AS tab_590 ON (tab_589._jsonb) = (tab_590._jsonb) ON
				(tab_588._jsonb) = (tab_590._jsonb) ON
			(tab_587._date) = (tab_588._date) AND (tab_587._jsonb) = (tab_588._jsonb)
LIMIT
	52:::INT8;

WITH
	with_219 (col_1487)
		AS (
			SELECT
				*
			FROM
				(VALUES ((-1374527140):::INT8), (957830325:::INT8), ((-1555536389):::INT8), (127:::INT8))
					AS tab_591 (col_1487)
		),
	with_220 (col_1488, col_1489)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('20:49:26.610137-03:13:00':::TIMETZ, to_hex('8':::STRING::STRING)::STRING),
						('14:35:37.93526-05:48:00':::TIMETZ, '':::STRING),
						(timezone(NULL::STRING, NULL::TIMETZ)::TIMETZ, e'\x00':::STRING)
				)
					AS tab_592 (col_1488, col_1489)
		)
SELECT
	(-2767600325496246695):::INT8 AS col_1490, true AS col_1491, tab_594._int4 AS col_1492, tab_594._bytes AS col_1493
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_593,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_594
WHERE
	false
LIMIT
	35:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_595
WITH
	with_221 (col_1494)
		AS (SELECT * FROM (VALUES (NULL), (NULL), (ARRAY[1:::INT8,1489254275:::INT8])) AS tab_596 (col_1494)),
	with_222 (col_1495)
		AS (
			SELECT
				*
			FROM
				(VALUES (3864338087:::OID), (2754812939:::OID), (2902977286:::OID), (0:::OID)) AS tab_597 (col_1495)
		)
SELECT
	(-5723):::INT8 AS col_1496,
	(-122132821):::INT8 AS col_1497,
	fnv64a(NULL::BYTES)::INT8 AS col_1498,
	1.401298464324817e-45:::FLOAT8 AS col_1499,
	1.0:::FLOAT8 AS col_1500,
	'1987-09-12':::DATE AS col_1501,
	('1979-01-16':::DATE::DATE - '23:07:17.193413':::TIME::TIME)::TIMESTAMP AS col_1502,
	NULL AS col_1503,
	NULL AS col_1504,
	true AS col_1505,
	554.4688866708551705:::DECIMAL AS col_1506,
	e'\U00002603':::STRING AS col_1507,
	NULL AS col_1508,
	NULL AS col_1509,
	netmask('2c1f:49f5:7fcd:497c:af97:5b07:74fe:6764/43':::INET::INET)::INET AS col_1510,
	'{"0~$n_Tz2xWix": [[], 0.4551621287521389], "fk0G^Q": [{",M(`:,OB?)": []}, 0.2774608596307332, {}], "foo": [["H!*&hA&G"], [{}, "+5ZLJM)r"]]}':::JSONB
		AS col_1511;

SELECT
	tab_598._timestamp AS col_1512, '1970-01-05 01:34:47.000819+00:00':::TIMESTAMPTZ AS col_1513
FROM
	defaultdb.public.seed@[0] AS tab_598
LIMIT
	21:::INT8;

SELECT
	count(*) AS col_1514
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_599
WHERE
	tab_599._bool
GROUP BY
	tab_599._int8, tab_599._float8, tab_599._date
HAVING
	isnan(4144267502960.329384:::DECIMAL::DECIMAL)::BOOL
ORDER BY
	tab_599._float8 DESC
LIMIT
	51:::INT8;

SELECT
	DISTINCT
	tab_600._string AS col_1515,
	'110.183.225.65/15':::INET AS col_1516,
	0.24444199969136735:::FLOAT8 AS col_1517,
	tab_600._interval AS col_1518,
	tab_600._int4 AS col_1519
FROM
	defaultdb.public.seed@[0] AS tab_600
WHERE
	(NOT tab_600._bool)
ORDER BY
	col_1516 ASC, col_1519 ASC, col_1518 ASC
LIMIT
	16:::INT8;

SELECT
	NULL AS col_1520,
	'{"test": "json"}':::JSONB AS col_1521,
	false AS col_1522,
	tab_602._interval AS col_1523,
	('{}':::JSONB::JSONB - NULL::STRING[])::JSONB AS col_1524,
	(tab_602._inet::INET + (-2543573185723762156):::INT8::INT8)::INET AS col_1525,
	'cb7df1c8-9bcf-48f2-a1ed-ed40427bf4a2':::UUID AS col_1526
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_601, defaultdb.public.seed@[0] AS tab_602
WHERE
	tab_601._bool
LIMIT
	83:::INT8;

SELECT
	(-6529):::INT8 AS col_1552, (-1471242254):::INT8 AS col_1553
FROM
	defaultdb.public.seed@[0] AS tab_610
WHERE
	tab_610._bool
LIMIT
	26:::INT8;

UPDATE
	defaultdb.public.seed AS tab_613
SET
	_decimal = tab_613._decimal, _int2 = (-22987):::INT8, _string = tab_613._string, _int4 = tab_613._int2
ORDER BY
	tab_613._inet DESC, tab_613._bool ASC
LIMIT
	96:::INT8;

WITH
	with_228 (col_1557)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-02 11:18:05.000584+00:00':::TIMESTAMP),
						(NULL),
						('1970-01-08 09:14:38.0002+00:00':::TIMESTAMP)
				)
					AS tab_614 (col_1557)
		)
SELECT
	1223384985:::OID AS col_1558
LIMIT
	36:::INT8;

WITH
	with_229 (col_1559, col_1560)
		AS (
			SELECT
				tab_615._decimal AS col_1559, NULL AS col_1560
			FROM
				defaultdb.public.seed@seed__int8__float8__date_idx AS tab_615
		),
	with_230 (col_1561)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('{}':::JSONB),
						(NULL),
						(NULL),
						('[{"bar": {"foobar": []}, "o5$;b": [null, "c", {"baz": null}, {}, [{}, {}]]}, false]':::JSONB),
						(
							'[[[true, {}, "foobar", {"b": []}], {}, []], {".6@5`)": {"a": null, "f-H@|{": {}, "~RI*</4VwW": []}}, {}]':::JSONB
						),
						(
							e'{"P/\'ok2&": [false, {"b": {"0-{": []}}, {}, {"}s*3/": []}, {"b": {}}, [null, []], null], "ZQ&zptB-": 0.6861522203538645}':::JSONB
						)
				)
					AS tab_616 (col_1561)
		)
SELECT
	cte_ref_71.col_1559 AS col_1562, 806975233:::OID AS col_1563
FROM
	with_229 AS cte_ref_71
WHERE
	false
LIMIT
	79:::INT8;

WITH
	with_231 (col_1564)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-1908177488038442263):::INT8),
						(1282249177908978001:::INT8),
						(NULL),
						((-943619043491831878):::INT8)
				)
					AS tab_617 (col_1564)
		),
	with_232 (col_1565)
		AS (
			SELECT
				*
			FROM
				(VALUES (855658653:::OID), (3803119108:::OID), (2021138268:::OID), (1604138607:::OID))
					AS tab_618 (col_1565)
		),
	with_233 (col_1566)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('f587:5e13:b954:2242:3bcc:1875:e135:a178/0':::INET),
						(netmask('29.7.110.175/18':::INET::INET)::INET)
				)
					AS tab_619 (col_1566)
		)
SELECT
	NULL AS col_1567
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_620
LIMIT
	17:::INT8;

UPDATE
	defaultdb.public.seed AS tab_621
SET
	_uuid = tab_621._uuid, _float4 = tab_621._float8, _timestamp = tab_621._timestamp;

WITH
	with_234 (col_1568)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(CASE WHEN NULL THEN e'zq\x1e6\x15':::STRING ELSE e' \f':::STRING END),
						(e'\tGHMR':::STRING),
						('7':::STRING)
				)
					AS tab_622 (col_1568)
		),
	with_236 (col_1572)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'\x00':::STRING),
						(NULL),
						(e'5]w\x1e':::STRING),
						(
							(
								SELECT
									tab_623._string AS col_1569
								FROM
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_623
								ORDER BY
									tab_623._uuid DESC
								LIMIT
									1:::INT8
							)
						),
						(
							(
								WITH
									with_235 (col_1570) AS (SELECT * FROM (VALUES (NULL)) AS tab_624 (col_1570))
								SELECT
									'&I:':::STRING AS col_1571
								FROM
									with_235 AS cte_ref_72, with_235 AS cte_ref_73
								LIMIT
									1:::INT8
							)
						)
				)
					AS tab_625 (col_1572)
			UNION ALL
				SELECT
					*
				FROM
					(VALUES (COALESCE(e'\x00':::STRING, e'\U00002603':::STRING)), (NULL), (NULL)) AS tab_626 (col_1573)
		)
SELECT
	tab_627._decimal AS col_1574,
	'1970-01-02 17:27:54.000362+00:00':::TIMESTAMPTZ AS col_1575,
	e'\x13\x1e':::STRING AS col_1576,
	tab_627._uuid AS col_1577
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_627
WHERE
	tab_627._bool
ORDER BY
	tab_627._float8 DESC, tab_627._bool ASC, tab_627._float4 DESC
LIMIT
	16:::INT8;

WITH
	with_237 (col_1578)
		AS (
			SELECT
				*
			FROM
				(VALUES (3392653710:::OID), (NULL), (329431462:::OID), (749924226:::OID)) AS tab_628 (col_1578)
		)
SELECT
	tab_629._int4 AS col_1584
FROM
	defaultdb.public.seed@[0] AS tab_629
WHERE
	'{"6jrpD6j": true, "B]T,<;cc": [], "foo": false}':::JSONB::JSONB
	IN (
			WITH
				with_238 (col_1579, col_1580)
					AS (
						SELECT
							*
						FROM
							(
								VALUES
									(1817193465:::OID, NULL),
									(
										2855274271:::OID,
										CASE
										WHEN false THEN '1970-01-12 02:21:47.000675+00:00':::TIMESTAMP
										ELSE '1970-01-10 11:06:31.000257+00:00':::TIMESTAMP
										END
									),
									(NULL, NULL)
							)
								AS tab_630 (col_1579, col_1580)
					),
				with_239 (col_1581) AS (SELECT * FROM (VALUES ('16:33:26.224466':::TIME)) AS tab_631 (col_1581)),
				with_240 (col_1582)
					AS (
						SELECT
							*
						FROM
							(
								VALUES
									(COALESCE(e'UUcLb[X\x14':::STRING:::NAME, '':::STRING:::NAME)),
									(NULL),
									(e'|\b':::STRING:::NAME)
							)
								AS tab_632 (col_1582)
					)
			SELECT
				e'{"-&~puC6T": {"7B\\\\KB?": {}, "baz": 0.40014973436802714}, ";&#:4": {}, "LXj": [], "a": [[{" u\\\\*|ro\\"~": false}], {}, {}], "baz": {"c": "foobar"}}':::JSONB::JSONB
					AS col_1583
			FROM
				with_238 AS cte_ref_74
			WHERE
				NULL
			LIMIT
				44:::INT8
		)
LIMIT
	88:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_633 (_int2, _int8, _float4, _float8, _timestamptz, _bool, _string, _inet, _jsonb)
SELECT
	tab_636._int4 AS col_1585,
	32767:::INT8 AS col_1586,
	0.2016107589006424:::FLOAT8 AS col_1587,
	tab_634._float4 AS col_1588,
	'1970-01-11 11:09:28.000391+00:00':::TIMESTAMPTZ AS col_1589,
	tab_634._bool AS col_1590,
	tab_636._string AS col_1591,
	'0.0.0.0/0':::INET AS col_1592,
	tab_634._jsonb AS col_1593
FROM
	defaultdb.public.seed@[0] AS tab_634,
	defaultdb.public.seed@[0] AS tab_635,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_636
WHERE
	tab_635._bool
LIMIT
	91:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_637
		(_int2, _float4, _float8, _timestamp, _timestamptz, _interval, _decimal, _string, _bytes, _uuid, _jsonb)
WITH
	with_241 (col_1594) AS (SELECT * FROM (VALUES (ARRAY[2206218024:::OID])) AS tab_638 (col_1594)),
	with_242 (col_1595)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), (3007585940:::OID), (2350231008:::OID), (2475124106:::OID)) AS tab_639 (col_1595)
		)
SELECT
	NULL AS col_1596,
	(
		WITH
			with_243 (col_1597)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								('3000-01-01 00:00:00+00:00':::TIMESTAMPTZ),
								('1970-01-07 03:45:38.000332+00:00':::TIMESTAMPTZ),
								('1970-01-02 21:58:50.000293+00:00':::TIMESTAMPTZ)
						)
							AS tab_640 (col_1597)
				),
			with_244 (col_1598)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(CASE WHEN false THEN NULL ELSE NULL END),
								(e'\x00':::STRING),
								(NULL),
								(e'#c\x05@\x11:`#':::STRING:::NAME)
						)
							AS tab_641 (col_1598)
				)
		SELECT
			0.5168430209159851:::FLOAT8 AS col_1599
		FROM
			with_244 AS cte_ref_76
		WHERE
			true
		LIMIT
			1:::INT8
	)
		AS col_1600,
	(-0.22437120558684842):::FLOAT8 AS col_1601,
	'0001-01-01 00:00:00+00:00':::TIMESTAMP AS col_1602,
	'1970-01-06 20:07:10.000394+00:00':::TIMESTAMPTZ AS col_1603,
	'81 years 7 mons 541 days 17:51:47.690091':::INTERVAL AS col_1604,
	3132318703343838.777:::DECIMAL AS col_1605,
	version()::STRING AS col_1606,
	('\xe379a442419081f6':::BYTES::BYTES || '\x':::BYTES::BYTES)::BYTES AS col_1607,
	'904240c1-2659-4558-86d4-685a45c947e6':::UUID AS col_1608,
	'[[{"a": []}, {"5 }t": true, "U,TN]E9f ": {}}, [null], true, true], {}, true]':::JSONB AS col_1609
FROM
	with_242 AS cte_ref_75
WHERE
	false
LIMIT
	53:::INT8;

SELECT
	tab_643._interval AS col_1610, tab_642._bool AS col_1611, tab_645._jsonb AS col_1612
FROM
	defaultdb.public.seed@[0] AS tab_642
	JOIN defaultdb.public.seed@[0] AS tab_643 ON (tab_642._decimal) = (tab_643._decimal),
	defaultdb.public.seed AS tab_644
	JOIN defaultdb.public.seed AS tab_645 ON (tab_644._jsonb) = (tab_645._jsonb)
WHERE
	tab_643._bool
LIMIT
	60:::INT8;

WITH
	with_245 (col_1613) AS (SELECT * FROM (VALUES (e'\x0e\x1br[N':::STRING)) AS tab_646 (col_1613)),
	with_246 (col_1614)
		AS (SELECT * FROM (VALUES (4196657082:::OID), (3932183958:::OID), (1540624498:::OID)) AS tab_647 (col_1614)),
	with_247 (col_1615) AS (SELECT * FROM (VALUES (e'\x15':::STRING:::NAME)) AS tab_648 (col_1615))
SELECT
	(
		WITH
			with_248 (col_1616)
				AS (
					SELECT
						*
					FROM
						(VALUES ('2fkF':::STRING), ('':::STRING), (e'\x07<_\t"aw':::STRING)) AS tab_649 (col_1616)
				),
			with_249 (col_1617)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								('':::STRING),
								(e'\'r5WA\x1f':::STRING:::NAME),
								(e'2\x110\'4T\x11':::STRING:::NAME),
								(e'\'':::STRING),
								(CASE WHEN true THEN NULL ELSE ',':::STRING:::NAME END),
								(NULL)
						)
							AS tab_650 (col_1617)
				)
		SELECT
			cte_ref_77.col_1615 AS col_1618
		FROM
			with_248 AS cte_ref_78
		LIMIT
			1:::INT8
	)
		AS col_1619
FROM
	with_247 AS cte_ref_77;

SELECT
	'1984-01-20':::DATE AS col_1620, tab_651._date AS col_1621
FROM
	defaultdb.public.seed AS tab_651
	JOIN defaultdb.public.seed AS tab_652 ON
			(tab_651._int8) = (tab_652._int8)
			AND (tab_651._float8) = (tab_652._float8)
			AND (tab_651._date) = (tab_652._date);

WITH
	with_252 (col_1626)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							ARRAY[1.1708526611328125:::FLOAT8,(-0.1089983582496643):::FLOAT8,(-0.2757185399532318):::FLOAT8,(-0.7256190180778503):::FLOAT8,0.20511800050735474:::FLOAT8]
						),
						(
							ARRAY[3.4028234663852886e+38:::FLOAT8,0.06582053750753403:::FLOAT8,1.401298464324817e-45:::FLOAT8,(-0.9292421936988831):::FLOAT8,0.675003707408905:::FLOAT8,0.42406973242759705:::FLOAT8,0.9218223094940186:::FLOAT8,0.578820526599884:::FLOAT8]
						),
						(NULL),
						(
							ARRAY[(-1.3661508560180664):::FLOAT8,0.0:::FLOAT8,(-1.092297077178955):::FLOAT8,(-1.9813544750213623):::FLOAT8,1.0818405151367188:::FLOAT8]
						)
				)
					AS tab_656 (col_1626)
		),
	with_253 (col_1627, col_1628)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('12:55:36.040073':::TIME, '\x85fcf20df28747f4':::BYTES),
						('07:34:59.853545':::TIME, NULL),
						(
							'19:44:38.308583':::TIME,
							crdb_internal.encode_key(NULL::INT8, (-174356106861964155):::INT8::INT8, ARRAY[125612631:::OID,3457257042:::OID,3814739001:::OID,573066834:::OID])::BYTES
						),
						('23:12:33.149246':::TIME, '\xcc4f':::BYTES),
						('17:41:46.287409':::TIME, '\x69565913f85d28':::BYTES)
				)
					AS tab_657 (col_1627, col_1628)
		),
	with_254 (col_1629)
		AS (
			SELECT
				*
			FROM
				(VALUES ('1970-01-11 10:42:27.000711+00:00':::TIMESTAMP), ('-2000-01-01 00:00:00+00:00':::TIMESTAMP))
					AS tab_658 (col_1629)
		)
SELECT
	ARRAY[(-0.2023681104183197):::FLOAT8,0.15890558063983917:::FLOAT8,1.0871926546096802:::FLOAT8,0.5889286994934082:::FLOAT8,(-0.4619131088256836):::FLOAT8,(-0.7004539966583252):::FLOAT8]
		AS col_1630
FROM
	with_252 AS cte_ref_80;

UPDATE
	defaultdb.public.seed AS tab_659
SET
	_decimal = tab_659._decimal
WHERE
	(tab_659._decimal = 583270.7030465516335:::DECIMAL)
ORDER BY
	tab_659._decimal ASC
LIMIT
	29:::INT8;

SELECT
	tab_661._interval AS col_1632,
	0.4229201130853939:::FLOAT8 AS col_1633,
	tab_661._jsonb AS col_1634,
	tab_661._timestamp AS col_1635,
	tab_661._string AS col_1636,
	(-1750130943):::INT8 AS col_1637,
	NULL AS col_1638,
	(tab_661._int4::INT8 % tab_661._int8::INT8)::INT8 AS col_1639,
	tab_661._date AS col_1640,
	tab_661._inet AS col_1641,
	('\x':::BYTES::BYTES || '\x39c1396dbd':::BYTES::BYTES)::BYTES AS col_1642,
	(-17538):::INT8 AS col_1643,
	tab_661._bool AS col_1644,
	'NaN':::DECIMAL AS col_1645,
	NULL AS col_1646,
	tab_661._uuid AS col_1647
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_661
WHERE
	tab_661._bool
ORDER BY
	tab_661._interval DESC;

INSERT
INTO
	defaultdb.public.seed AS tab_662
		(_int2, _float4, _float8, _timestamp, _timestamptz, _bool, _decimal, _string, _bytes, _uuid, _inet)
WITH
	with_255 (col_1648, col_1649)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('acf368ae-204e-4caf-a856-05142980af62':::UUID, NULL),
						(NULL, e'MIH\x1fsfvu':::STRING),
						('1ef7883c-19dd-4fee-b696-ae381f31f968':::UUID, e'\r[<m':::STRING)
				)
					AS tab_663 (col_1648, col_1649)
		)
SELECT
	(-22830):::INT8 AS col_1650,
	(-1.3984044790267944):::FLOAT8 AS col_1651,
	(-0.7960090120961033):::FLOAT8 AS col_1652,
	('1989-12-01':::DATE::DATE + '08:04:03.690246':::TIME::TIME)::TIMESTAMP AS col_1653,
	'1970-01-07 14:52:22.000432+00:00':::TIMESTAMPTZ AS col_1654,
	false AS col_1655,
	(-26250758.32646844187):::DECIMAL AS col_1656,
	e'\\\x04A\tb':::STRING AS col_1657,
	'\x3a83b7':::BYTES AS col_1658,
	cte_ref_81.col_1648 AS col_1659,
	'50.114.160.237/24':::INET AS col_1660
FROM
	with_255 AS cte_ref_81
WHERE
	NULL
LIMIT
	92:::INT8;

WITH
	with_256 (col_1661)
		AS (
			SELECT
				*
			FROM
				(VALUES ('3000-01-01 00:00:00+00:00':::TIMESTAMP), ('1970-01-10 22:21:23.000501+00:00':::TIMESTAMP))
					AS tab_664 (col_1661)
		)
SELECT
	count(*) AS col_1662
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_665
WHERE
	tab_665._bool
GROUP BY
	tab_665._jsonb
HAVING
	crdb_internal.is_admin()::BOOL
LIMIT
	15:::INT8;

WITH
	with_257 (col_1663)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[2178176175:::OID,4264654073:::OID,1790525866:::OID,2419850897:::OID]),
						(ARRAY[1341614572:::OID]),
						(ARRAY[1412624918:::OID,3963524719:::OID]),
						(ARRAY[0:::OID,3338720721:::OID])
				)
					AS tab_666 (col_1663)
		),
	with_258 (col_1664)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('44 years 2 mons 849 days 23:43:04.367328':::INTERVAL),
						('-69 years -355 days -10:39:11.592608':::INTERVAL),
						(age('1970-01-03 19:43:05.000753+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL),
						('81 years 4 mons 440 days 18:23:16.970541':::INTERVAL),
						('50 years 11 mons 188 days 23:44:38.886763':::INTERVAL),
						('1 day':::INTERVAL)
				)
					AS tab_667 (col_1664)
		)
SELECT
	(-680116979):::INT8 AS col_1665, tab_668._bytes AS col_1666, tab_668._inet AS col_1667
FROM
	defaultdb.public.seed@[0] AS tab_668
WHERE
	tab_668._bool
ORDER BY
	tab_668._float4, tab_668._decimal, tab_668._float4, tab_668._date DESC
LIMIT
	54:::INT8;

UPDATE defaultdb.public.seed AS tab_669 SET _uuid = tab_669._uuid, _string = NULL, _decimal = tab_669._decimal;

WITH
	with_259 (col_1668)
		AS (SELECT * FROM (VALUES (NULL), (1814950259:::INT8), ((-798782041):::INT8)) AS tab_670 (col_1668))
SELECT
	tab_673._date AS col_1669,
	tab_672._jsonb AS col_1670,
	tab_674._date AS col_1671,
	tab_671._jsonb AS col_1672,
	tab_673._date AS col_1673
FROM
	defaultdb.public.seed AS tab_671
	JOIN defaultdb.public.seed AS tab_672 ON (tab_671._jsonb) = (tab_672._jsonb),
	defaultdb.public.seed AS tab_673
	JOIN defaultdb.public.seed AS tab_674 ON
			(tab_673._int8) = (tab_674._int8)
			AND (tab_673._float8) = (tab_674._float8)
			AND (tab_673._date) = (tab_674._date)
WHERE
	NULL;

SELECT
	tab_675._uuid AS col_1674,
	'1970-01-06 20:57:22.000389+00:00':::TIMESTAMPTZ AS col_1675,
	tab_675._interval AS col_1676
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_675
WHERE
	true;

UPDATE
	defaultdb.public.seed AS tab_678
SET
	_timestamptz = tab_678._timestamptz,
	_decimal = (-4.66892997415606639E+26):::DECIMAL,
	_float4 = tab_678._float8,
	_int4 = tab_678._int8
LIMIT
	91:::INT8;

WITH
	with_262 (col_1683, col_1684)
		AS (
			SELECT
				*
			FROM
				(VALUES ('Bh%Qsk':::STRING, 'Pr@W1':::STRING:::NAME), ('"':::STRING, e'{,\x139H<':::STRING:::NAME))
					AS tab_679 (col_1683, col_1684)
		)
SELECT
	20448:::INT8 AS col_1685, '1970-01-04 23:39:39.000996+00:00':::TIMESTAMP AS col_1686
FROM
	with_262 AS cte_ref_83, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_680
ORDER BY
	tab_680._bool DESC
LIMIT
	55:::INT8;

SELECT
	tab_682._date AS col_1687
FROM
	defaultdb.public.seed AS tab_681 JOIN defaultdb.public.seed AS tab_682 ON (tab_681._int8) = (tab_682._int8)
WHERE
	true
ORDER BY
	tab_681._date, tab_682._date DESC, tab_682._date
LIMIT
	12:::INT8;

SELECT
	tab_684._inet AS col_1688,
	'1981-02-27':::DATE AS col_1689,
	tab_683._float8 AS col_1690,
	tab_684._int4 AS col_1691,
	tab_683._bytes AS col_1692,
	tab_684._bytes AS col_1693,
	tab_683._timestamp AS col_1694,
	tab_684._int4 AS col_1695,
	(-1517049591):::INT8 AS col_1696,
	'null':::JSONB AS col_1697,
	0.8076470296101661:::FLOAT8 AS col_1698,
	tab_683._timestamptz AS col_1699,
	tab_685._date AS col_1700
FROM
	defaultdb.public.seed@[0] AS tab_683
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_684 ON (tab_683._interval) = (tab_684._interval),
	defaultdb.public.seed@[0] AS tab_685
ORDER BY
	tab_685._float4
LIMIT
	31:::INT8;

WITH
	with_263 (col_1701)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(COALESCE(0.6394990086555481:::FLOAT8, (-0.372078001499176):::FLOAT8)),
						((-0.4035249352455139):::FLOAT8)
				)
					AS tab_686 (col_1701)
		),
	with_264 (col_1702)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1995-12-05':::DATE),
						('1985-05-07':::DATE),
						(localtimestamp(NULL::INT8):::DATE::DATE),
						(current_date()::DATE),
						('1979-04-12':::DATE)
				)
					AS tab_687 (col_1702)
		)
SELECT
	count(*) AS col_1703
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_688
WHERE
	false
GROUP BY
	tab_688._jsonb
HAVING
	not_like_escape(e'J\x14\x19rtz':::STRING::STRING, '':::STRING::STRING, NULL::STRING)::BOOL
LIMIT
	15:::INT8;

SELECT
	NULL AS col_1704
FROM
	defaultdb.public.seed AS tab_689 JOIN defaultdb.public.seed AS tab_690 ON (tab_689._jsonb) = (tab_690._jsonb)
LIMIT
	40:::INT8;

SELECT
	tab_691._float8 AS col_1705,
	tab_691._timestamp AS col_1706,
	'1970-01-03 08:30:44.000904+00:00':::TIMESTAMPTZ AS col_1707,
	tab_691._int8 AS col_1708,
	tab_691._float4 AS col_1709,
	tab_691._date AS col_1710,
	tab_691._inet AS col_1711,
	tab_691._jsonb AS col_1712
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_691
ORDER BY
	tab_691._inet DESC
LIMIT
	50:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_692
SELECT
	tab_694._int8 AS col_1713,
	2025873127:::INT8 AS col_1714,
	483088741044453301:::INT8 AS col_1715,
	3.4028234663852886e+38:::FLOAT8 AS col_1716,
	tab_694._float4 AS col_1717,
	transaction_timestamp():::DATE::DATE AS col_1718,
	tab_695._timestamp AS col_1719,
	tab_694._timestamptz AS col_1720,
	tab_693._interval AS col_1721,
	tab_694._bool AS col_1722,
	tab_695._decimal AS col_1723,
	'A-@[5#[_':::STRING AS col_1724,
	right('\xe387a1babe48':::BYTES::BYTES, tab_695._int2::INT8)::BYTES AS col_1725,
	'ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID AS col_1726,
	'2468:2315:e8f2:9643:ae06:f9ad:8155:778c/109':::INET AS col_1727,
	to_json(tab_694._timestamptz)::JSONB AS col_1728
FROM
	defaultdb.public.seed@[0] AS tab_693,
	defaultdb.public.seed@[0] AS tab_694,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_695
ORDER BY
	tab_695._decimal ASC, tab_693._inet DESC, tab_694._decimal ASC, tab_695._int4 ASC;

SELECT
	tab_696._float8 AS col_1729, tab_696._interval AS col_1730, tab_696._timestamptz AS col_1731
FROM
	defaultdb.public.seed@[0] AS tab_696
WHERE
	tab_696._bool
ORDER BY
	tab_696._interval DESC, tab_696._timestamp ASC
LIMIT
	41:::INT8;

WITH
	with_265 (col_1732)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(timezone('22:20:26.186115-02:55:00':::TIMETZ::TIMETZ, '':::STRING::STRING)::TIMETZ),
						('09:07:18.193568-10:02:00':::TIMETZ)
				)
					AS tab_697 (col_1732)
		),
	with_266 (col_1733)
		AS (
			SELECT * FROM (VALUES (NULL)) AS tab_698 (col_1733)
			UNION
				SELECT
					*
				FROM
					(
						VALUES
							(0:::DECIMAL),
							(
								((-7.150292798381297214E+29):::DECIMAL::DECIMAL // 5537557628320907842:::INT8::INT8)::DECIMAL
							)
					)
						AS tab_699 (col_1734)
		),
	with_267 (col_1735)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[1.4306079149246216:::FLOAT8,(-1.2281482219696045):::FLOAT8]),
						(
							ARRAY[0.45888763666152954:::FLOAT8,(-1.2145090103149414):::FLOAT8,1.5921133756637573:::FLOAT8]
						),
						(
							CASE
							WHEN false
							THEN ARRAY[(-2.083608388900757):::FLOAT8,'-Inf':::FLOAT8,0.25589850544929504:::FLOAT8,1.0705046653747559:::FLOAT8]
							ELSE ARRAY[]:::FLOAT4[]
							END
						)
				)
					AS tab_700 (col_1735)
		)
SELECT
	0.5753291750364321:::FLOAT8 AS col_1736, false AS col_1737;

SELECT
	'"':::STRING AS col_1738,
	1.4668015241622925:::FLOAT8 AS col_1739,
	tab_701._float8 AS col_1740,
	tab_701._inet AS col_1741,
	tab_701._interval AS col_1742
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_701
ORDER BY
	tab_701._bytes, tab_701._int2
LIMIT
	71:::INT8;

SELECT
	0.5569635675821374:::FLOAT8 AS col_1743,
	tab_703._int4 AS col_1744,
	tab_702._interval AS col_1745,
	tab_702._int2 AS col_1746,
	tab_702._bytes AS col_1747,
	NULL AS col_1748
FROM
	defaultdb.public.seed@[0] AS tab_702, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_703;

UPDATE
	defaultdb.public.seed AS tab_704
SET
	_int4 = 1:::INT8,
	_string = e'$\x12/\b':::STRING,
	_bytes = '\x':::BYTES,
	_uuid = '4db2e533-95ab-4ce2-9b52-70bfde496a90':::UUID
WHERE
	tab_704._bool
LIMIT
	9:::INT8;

WITH
	with_268 (col_1749) AS (SELECT * FROM (VALUES (true), (false)) AS tab_705 (col_1749))
SELECT
	true AS col_1750
FROM
	with_268 AS cte_ref_84, with_268 AS cte_ref_85
ORDER BY
	cte_ref_85.col_1749 ASC
LIMIT
	88:::INT8;

WITH
	with_269 (col_1751)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'8o\x16K\x0f>Ru\x1d':::STRING:::NAME),
						('':::STRING:::NAME),
						(e'#\x1c\x02]C\x02\x04\x06':::STRING:::NAME),
						(e'(\bg\x1b\x0fO}':::STRING:::NAME)
				)
					AS tab_706 (col_1751)
		),
	with_270 (col_1752) AS (SELECT NULL AS col_1752 FROM defaultdb.public.seed@[0] AS tab_707)
SELECT
	tab_708._int4 AS col_1753,
	tab_708._jsonb AS col_1754,
	'1970-01-07 07:40:20.000664+00:00':::TIMESTAMP AS col_1755,
	tab_709._decimal AS col_1756,
	NULL AS col_1757,
	(-26962):::INT8 AS col_1758,
	'1970-01-01 23:44:19.000724+00:00':::TIMESTAMPTZ AS col_1759,
	tab_708._string AS col_1760,
	tab_709._int8 AS col_1761,
	'3000-01-01 00:00:00+00:00':::TIMESTAMPTZ AS col_1762,
	(-0.7696459889411926):::FLOAT8 AS col_1763,
	'\xac63':::BYTES AS col_1764,
	'1970-01-09 12:30:35.000665+00:00':::TIMESTAMP AS col_1765,
	tab_708._float4 AS col_1766,
	'f1812c21-64a7-4fc8-b835-6abffc54fd7f':::UUID AS col_1767,
	ARRAY[(-31346):::INT8,(-15268):::INT8,(-8282):::INT8,6808:::INT8] AS col_1768,
	'73.104.142.221/1':::INET AS col_1769,
	tab_708._inet AS col_1770,
	tab_709._float4 AS col_1771,
	tab_708._date AS col_1772,
	tab_708._jsonb AS col_1773,
	0.5228956603652738:::FLOAT8 AS col_1774
FROM
	defaultdb.public.seed@[0] AS tab_708,
	with_270 AS cte_ref_86,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_709
WHERE
	true
LIMIT
	99:::INT8;

WITH
	with_271 (col_1775)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(NULL),
						(ARRAY[1923794901:::OID,3552069293:::OID]),
						(ARRAY[593358029:::OID]),
						(ARRAY[543700212:::OID,0:::OID,140227063:::OID,391321547:::OID,2487931426:::OID])
				)
					AS tab_710 (col_1775)
		),
	with_272 (col_1776, col_1777, col_1778)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'\\9r \x10':::STRING, e'b\x12\x7f\x10 K[':::STRING:::NAME, B'1101110001001011100'),
						(e',\x1co':::STRING, NULL, B'0111111111111111111111111111111111111111111111111111111111111111'),
						(e'\x03\x11':::STRING, e'\x02\x01IC':::STRING:::NAME, NULL),
						(
							NULL,
							COALESCE(e'/\x7f\tZ\n^U':::STRING:::NAME, e'\x05260':::STRING:::NAME),
							B'0010011001111010100'
						),
						('2e<':::STRING, e'\x7fqs\'\x1d':::STRING:::NAME, B'0100001110101110000'),
						(
							e'\x03':::STRING,
							e'2<\x176':::STRING:::NAME,
							B'0111111111111111111111111111111111111111111111111111111111111111'
						)
				)
					AS tab_711 (col_1776, col_1777, col_1778)
		)
SELECT
	count(*) AS col_1779
FROM
	defaultdb.public.seed@[0] AS tab_712
GROUP BY
	tab_712._int8
HAVING
	inet_contained_by_or_equals('c930:ba85:1d48:7d22:463c:bfd3:dc55:565e/95':::INET::INET, (('1990-11-24':::DATE::DATE - '1970-03-05':::DATE::DATE)::INT8::INT8 + 'dccc:da73:c22b:6b34:7e76:c929:ae38:e4e8/9':::INET::INET)::INET::INET)::BOOL
LIMIT
	78:::INT8;

SELECT
	tab_713._timestamptz AS col_1780, tab_713._int2 AS col_1781
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_713
LIMIT
	16:::INT8;

INSERT INTO defaultdb.public.seed AS tab_714 DEFAULT VALUES;

SELECT
	tab_715._uuid AS col_1782,
	tab_715._bytes AS col_1783,
	NULL AS col_1784,
	tab_715._timestamptz AS col_1785,
	tab_715._decimal AS col_1786,
	NULL AS col_1787
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_715
LIMIT
	90:::INT8;

WITH
	with_273 (col_1788)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1629589583:::OID),
						(2764333479:::OID),
						(359739017:::OID),
						(459701934:::OID),
						(4128008749:::OID),
						(3642179122:::OID)
				)
					AS tab_716 (col_1788)
		)
SELECT
	cte_ref_88.col_1788 AS col_1789, 1715743966:::OID AS col_1790
FROM
	with_273 AS cte_ref_87, with_273 AS cte_ref_88
LIMIT
	21:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_717
SELECT
	tab_718._int2 AS col_1791,
	tab_718._int4 AS col_1792,
	tab_718._int4 AS col_1793,
	tab_718._float4 AS col_1794,
	tab_718._float4 AS col_1795,
	'1993-07-30':::DATE AS col_1796,
	'1970-01-10 23:34:16.000999+00:00':::TIMESTAMP AS col_1797,
	tab_718._timestamptz AS col_1798,
	'1 mon 1 day':::INTERVAL AS col_1799,
	false AS col_1800,
	(-1.234E+401):::DECIMAL AS col_1801,
	COALESCE(e'\ft\t,gn\tn':::STRING, tab_718._string) AS col_1802,
	'\x':::BYTES AS col_1803,
	tab_718._uuid AS col_1804,
	tab_718._inet AS col_1805,
	tab_718._jsonb AS col_1806
FROM
	defaultdb.public.seed@[0] AS tab_718
WHERE
	true
ORDER BY
	tab_718._float8 DESC;

DELETE FROM defaultdb.public.seed AS tab_719 ORDER BY tab_719._int2 LIMIT 90:::INT8;

DELETE FROM defaultdb.public.seed AS tab_720 LIMIT 46:::INT8;

SELECT
	'1996-07-26':::DATE AS col_1807,
	(-30815):::INT8 AS col_1808,
	tab_721._string AS col_1809,
	tab_721._float8 AS col_1810,
	(-7432739607571520616):::INT8 AS col_1811,
	NULL AS col_1812,
	(-755673281):::INT8 AS col_1813
FROM
	defaultdb.public.seed@[0] AS tab_721
WHERE
	tab_721._bool
ORDER BY
	tab_721._timestamp ASC
LIMIT
	79:::INT8;

SELECT
	sum_int(tab_723._int8::INT8)::INT8 AS col_1814, tab_723._int8 AS col_1815
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_722,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_723
GROUP BY
	tab_722._int2, tab_723._int8
LIMIT
	80:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_724
WITH
	with_274 (col_1816)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(12326:::INT8), (NULL), ((-4637):::INT8), ((-14093):::INT8), ((-9064):::INT8), ((-27048):::INT8)
				)
					AS tab_725 (col_1816)
		),
	with_275 (col_1817)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[(-22779):::INT8]),
						(ARRAY[]:::INT2[]),
						(ARRAY[28019:::INT8,20052:::INT8]),
						(ARRAY[(-21209):::INT8,26398:::INT8])
				)
					AS tab_726 (col_1817)
		)
SELECT
	(-31339):::INT8 AS col_1818,
	tab_727._int8 AS col_1819,
	6411694950473228510:::INT8 AS col_1820,
	tab_727._float8 AS col_1821,
	tab_727._float8 AS col_1822,
	tab_727._date AS col_1823,
	'1970-01-05 03:48:57.000205+00:00':::TIMESTAMP AS col_1824,
	tab_727._timestamptz AS col_1825,
	date_trunc(e'RA\n\x14^Cn{':::STRING::STRING, '00:00:00':::TIME::TIME)::INTERVAL AS col_1826,
	tab_727._bool AS col_1827,
	tab_727._decimal AS col_1828,
	tab_727._string AS col_1829,
	tab_727._bytes AS col_1830,
	NULL AS col_1831,
	'309f:f28d:95b4:bee9:23a3:bdff:a97d:d07e/79':::INET AS col_1832,
	'{"test": "json"}':::JSONB AS col_1833
FROM
	defaultdb.public.seed@[0] AS tab_727
WHERE
	(NOT tab_727._bool)
ORDER BY
	tab_727._bytes, tab_727._timestamp DESC, tab_727._int4 ASC;

SELECT
	(NULL::JSONB->>tab_728._int4::INT8)::STRING AS col_1834,
	tab_728._interval AS col_1835,
	e'[{"0YP3": {"/V\\\\vH<>W{": {}, "baz": [null, []], "xB0y": {}}, "F]kitz!DA": [[]], "c": true}, null, true]':::JSONB
		AS col_1836,
	tab_728._float4 AS col_1837,
	NULL AS col_1838
FROM
	defaultdb.public.seed@[0] AS tab_728
ORDER BY
	tab_728._int8 ASC
LIMIT
	21:::INT8;

WITH
	with_276 (col_1839)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(right('\xb907c1f7ce':::BYTES::BYTES, 1327966790004951070:::INT8::INT8)::BYTES),
						(COALESCE(NULL, ('\x33531d05':::BYTES::BYTES || '\x':::BYTES::BYTES)::BYTES)),
						('\xc121':::BYTES)
				)
					AS tab_729 (col_1839)
		),
	with_277 (col_1840, col_1841, col_1842, col_1843)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('9ac8:b1ff:3ced:dbfc:5c24:93d8:780a:338/49':::INET, 3904028458:::OID, 1051236675:::OID, NULL),
						(
							'90f4:8154:21aa:7ae8:edb6:fcb6:5cc9:2fab/8':::INET,
							1129801652:::OID,
							NULL,
							'\x13fb7c6b5b2b999c91':::BYTES
						)
				)
					AS tab_730 (col_1840, col_1841, col_1842, col_1843)
		)
SELECT
	count(*) AS col_1844
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_731
WHERE
	(NOT tab_731._bool)
GROUP BY
	tab_731._int8, tab_731._float8, tab_731._date
HAVING
	inet_contained_by_or_equals('183.38.246.224/17':::INET::INET, 'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET::INET)::BOOL
LIMIT
	58:::INT8;

UPDATE
	defaultdb.public.seed AS tab_732
SET
	_timestamp = tab_732._timestamp
WHERE
	B'0000000000000000000000000000000000000000000000000000000000000000'::BIT(30)
	NOT IN (
			WITH
				with_278 (col_1845)
					AS (SELECT * FROM (VALUES (ARRAY[]:::INT2[]), (ARRAY[]:::INT2[])) AS tab_733 (col_1845)),
				with_279 (col_1846)
					AS (
						SELECT
							*
						FROM
							(
								VALUES
									(112265982:::OID),
									(2004665420:::OID),
									(825204702:::OID),
									(3730132399:::OID),
									(516564598:::OID)
							)
								AS tab_734 (col_1846)
					)
			SELECT
				B'010011101011110011110111000100'::BIT(30) AS col_1847
			FROM
				defaultdb.public.seed@seed__int8__float8__date_idx AS tab_735
			ORDER BY
				tab_735._int2
			LIMIT
				14:::INT8
		);

SELECT
	NULL AS col_1848, tab_736._jsonb AS col_1849, tab_736._decimal AS col_1850
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_736
WHERE
	tab_736._string LIKE (NULL::JSONB->>NULL::INT8)::STRING;

SELECT
	min(tab_737._string::STRING)::STRING AS col_1851,
	min(tab_737._uuid::UUID)::UUID AS col_1852,
	max(tab_737._date::DATE)::DATE AS col_1853,
	sum(tab_737._float8::FLOAT8)::FLOAT8 AS col_1854
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_737
WHERE
	tab_737._bool
GROUP BY
	tab_737._float8, tab_737._date, tab_737._jsonb, tab_737._uuid, tab_737._string
HAVING
	bool_and(tab_737._bool::BOOL)::BOOL
ORDER BY
	tab_737._uuid ASC, tab_737._float8 ASC, tab_737._string
LIMIT
	20:::INT8;

INSERT INTO defaultdb.public.seed AS tab_738 DEFAULT VALUES;

SELECT
	tab_739._inet AS col_1855,
	tab_739._uuid AS col_1856,
	'290 years':::INTERVAL AS col_1857,
	tab_739._float8 AS col_1858,
	(-0.11947992264987095):::FLOAT8 AS col_1859,
	tab_739._bytes AS col_1860,
	isnan(tab_739._float8::FLOAT8)::BOOL AS col_1861,
	tab_739._jsonb AS col_1862,
	(-3038):::INT8 AS col_1863,
	e'\U00002603':::STRING AS col_1864,
	tab_739._timestamptz AS col_1865,
	tab_739._timestamp AS col_1866,
	'1981-09-09':::DATE AS col_1867,
	tab_739._int4 AS col_1868,
	(-80055880477.4574296):::DECIMAL AS col_1869,
	7561886071296676720:::INT8 AS col_1870
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_739
WHERE
	tab_739._bool;

SELECT
	8504:::INT8 AS col_1871,
	(-9223372036854775807):::INT8 AS col_1872,
	tab_740._uuid AS col_1873,
	NULL AS col_1874,
	0.00019916142628062516:::FLOAT8 AS col_1875,
	tab_740._interval AS col_1876
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_740
LIMIT
	82:::INT8;

INSERT INTO defaultdb.public.seed AS tab_741 DEFAULT VALUES;

UPDATE
	defaultdb.public.seed AS tab_742
SET
	_string = tab_742._string
WHERE
	(false OR false)
ORDER BY
	tab_742._uuid, tab_742._int4 DESC, tab_742._date DESC, tab_742._float8 ASC
LIMIT
	100:::INT8;

SELECT
	'1970-01-03 17:00:33.000986+00:00':::TIMESTAMPTZ AS col_1877,
	tab_743._uuid AS col_1878,
	tab_743._interval AS col_1879,
	tab_743._date AS col_1880,
	tab_743._string AS col_1881
FROM
	defaultdb.public.seed@[0] AS tab_743
LIMIT
	4:::INT8;

SELECT
	NULL AS col_1882, tab_744._timestamptz AS col_1883, tab_744._float4 AS col_1884
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_744
WHERE
	false
ORDER BY
	tab_744._int8
LIMIT
	51:::INT8;

WITH
	with_280 (col_1885)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY['\xead909dd':::BYTES,'\xb53f3c9067838de0':::BYTES]),
						(ARRAY['\xa33ecc43':::BYTES]),
						(
							(ARRAY['\x1a72714b3b5078':::BYTES,'\xa92f':::BYTES,'\x9bd8e1':::BYTES]::BYTES[] || NULL::BYTES[])::BYTES[]
						),
						(NULL),
						(
							ARRAY['\x37':::BYTES,'\x353b44144f':::BYTES,'\x98d3c609ef1d51':::BYTES,'\xebab6d0222':::BYTES]
						),
						(ARRAY['\xa2d026aac105c296':::BYTES,'\xff':::BYTES,'\x0fb872e109c7b274a2':::BYTES])
				)
					AS tab_745 (col_1885)
		),
	with_281 (col_1886)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-1.3470495473630102):::FLOAT8),
						((-1.5990273216831996):::FLOAT8),
						(1.1153065511914426:::FLOAT8),
						((0.5516600896697058:::FLOAT8::FLOAT8 ^ 0.21077967118168617:::FLOAT8::FLOAT8)::FLOAT8),
						((-0.21603106944195605):::FLOAT8),
						((-0.5112380773044232):::FLOAT8)
				)
					AS tab_746 (col_1886)
		)
SELECT
	count(*) AS col_1887
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_747
GROUP BY
	tab_747._int8
LIMIT
	37:::INT8;

UPDATE defaultdb.public.seed AS tab_748 SET _bytes = tab_748._bytes ORDER BY tab_748._inet LIMIT 88:::INT8;

WITH
	with_282 (col_1888) AS (SELECT * FROM (VALUES (NULL)) AS tab_749 (col_1888))
SELECT
	false AS col_1889
LIMIT
	1:::INT8;

DELETE FROM defaultdb.public.seed AS tab_750;

SELECT
	'\xd31923':::BYTES AS col_1890,
	((-7222686565260941636):::INT8::INT8 + tab_751._inet::INET)::INET AS col_1891,
	tab_751._decimal AS col_1892,
	tab_751._timestamp AS col_1893,
	CASE WHEN tab_751._bool THEN tab_751._timestamptz ELSE tab_751._timestamptz END AS col_1894,
	e'%\n\rhH':::STRING AS col_1895,
	tab_751._float4 AS col_1896,
	'1995-04-23':::DATE AS col_1897,
	tab_751._int2 AS col_1898,
	jsonb_insert('[[{"C$`": true, "b": null, "baz": false, "c": null}, [[], "z_UNE#F"], false], {}]':::JSONB::JSONB, ARRAY[e'\U00002603':::STRING,e'\x06_\x7fq*V*':::STRING]::STRING[], e'[{"3+[X&?.$ub>%": {"9$|\\"E*WcW": {"8CrUeHb,FuK": {}}}, "c": false, "foo": 0.2708195269508163}, []]':::JSONB::JSONB)::JSONB
		AS col_1899,
	tab_751._float4 AS col_1900,
	false AS col_1901,
	'73 years 5 mons 536 days 13:55:52.042552':::INTERVAL AS col_1902,
	tab_751._int8 AS col_1903,
	'0b8708ae-ae16-4061-bb96-022a24c9edc0':::UUID AS col_1904,
	(-13995):::INT8 AS col_1905
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_751
WHERE
	tab_751._bool
ORDER BY
	tab_751._int4 DESC;

DELETE FROM defaultdb.public.seed AS tab_752 WHERE tab_752._bool LIMIT 17:::INT8;

UPDATE
	defaultdb.public.seed AS tab_753
SET
	_float8 = tab_753._float4, _int4 = (-437838267):::INT8
WHERE
	tab_753._string SIMILAR TO tab_753._string
ORDER BY
	tab_753._int4 ASC
LIMIT
	19:::INT8;

UPDATE defaultdb.public.seed AS tab_754 SET _float8 = tab_754._float4, _int8 = (-32768):::INT8 LIMIT 59:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_755
WITH
	with_283 (col_1908, col_1909)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(
								SELECT
									(
										SELECT
											B'0000001111001' AS col_1906
										FROM
											defaultdb.public.seed@seed__int8__float8__date_idx AS tab_757,
											defaultdb.public.seed@[0] AS tab_758
										WHERE
											false
										ORDER BY
											tab_757._timestamptz, tab_758._string DESC
										LIMIT
											1:::INT8
									)
										AS col_1907
								FROM
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_756
								ORDER BY
									tab_756._string ASC
								LIMIT
									1:::INT8
							),
							NULL
						),
						(CASE WHEN true THEN B'1111110110010' ELSE B'1010100100001' END, e'\x14\t.I\x13ZN]':::STRING),
						(NULL, 'h0w':::STRING)
				)
					AS tab_759 (col_1908, col_1909)
		)
SELECT
	(-14072):::INT8 AS col_1910,
	1301942821:::INT8 AS col_1911,
	NULL AS col_1912,
	0.7363705635070801:::FLOAT8 AS col_1913,
	1.3257840667790521:::FLOAT8 AS col_1914,
	'1972-04-18':::DATE AS col_1915,
	'1970-01-07 16:56:47.00013+00:00':::TIMESTAMP AS col_1916,
	NULL AS col_1917,
	'-53 years -7 mons -113 days -22:37:19.336047':::INTERVAL AS col_1918,
	(true AND crdb_internal.is_admin()::BOOL) AS col_1919,
	8.000897783329980644E+37:::DECIMAL AS col_1920,
	cte_ref_89.col_1909 AS col_1921,
	'\xcb':::BYTES AS col_1922,
	'e4a97e86-a999-4eec-86a8-4fb022fd959d':::UUID AS col_1923,
	'cbfc:ed15:f8b9:f5be:eb14:dcdd:436a:7b3/60':::INET AS col_1924,
	NULL AS col_1925
FROM
	with_283 AS cte_ref_89
LIMIT
	41:::INT8;

SELECT tab_765._date AS col_1933 FROM defaultdb.public.seed@seed__int8__float8__date_idx AS tab_765 LIMIT 60:::INT8;

DELETE FROM defaultdb.public.seed AS tab_766 ORDER BY tab_766._date LIMIT 62:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_767
SELECT
	(-25522):::INT8 AS col_1934,
	1997755779:::INT8 AS col_1935,
	2995936996334993946:::INT8 AS col_1936,
	NULL AS col_1937,
	0.8479863774270926:::FLOAT8 AS col_1938,
	NULL AS col_1939,
	NULL AS col_1940,
	ret_2 AS col_1941,
	'-40 years -1 mons -233 days -16:51:08.975531':::INTERVAL AS col_1942,
	false AS col_1943,
	(-5495.563124012798680):::DECIMAL AS col_1944,
	e'e\x1b<\n<t':::STRING AS col_1945,
	'\x6d24':::BYTES AS col_1946,
	'c51b80d6-c1f7-4184-a9a7-b712154bf1a3':::UUID AS col_1947,
	'11.232.205.25/18':::INET AS col_1948,
	'{"test": "json"}':::JSONB AS col_1949
FROM
	[
		DELETE FROM
			defaultdb.public.seed AS tab_768
		WHERE
			tab_768._bool
		ORDER BY
			tab_768._int8 ASC, tab_768._date
		LIMIT
			28:::INT8
		RETURNING
			_timestamptz AS ret_2
	];

UPDATE defaultdb.public.seed AS tab_776 SET _timestamp = '1970-01-07 18:16:44.000837+00:00':::TIMESTAMP LIMIT 9:::INT8;

SELECT
	count(*) AS col_1974
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_777
WHERE
	true
GROUP BY
	tab_777._jsonb
HAVING
	similar_to_escape(NULL::STRING, e'6I\x7f\x07(\x02':::STRING::STRING, e'F\x01j\x1fOb]SR':::STRING::STRING)::BOOL;

UPDATE
	defaultdb.public.seed AS tab_778
SET
	_float4 = tab_778._float4, _bytes = tab_778._bytes, _inet = tab_778._inet, _date = tab_778._date
LIMIT
	32:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_779
WITH
	with_293 (col_1975)
		AS (SELECT * FROM (VALUES (B'011001010001000010100010000010111011101100000')) AS tab_780 (col_1975))
SELECT
	(-14248):::INT8 AS col_1976,
	1891543135:::INT8 AS col_1977,
	(-2147483648):::INT8 AS col_1978,
	tab_781._float8 AS col_1979,
	0.5971869051939012:::FLOAT8 AS col_1980,
	now():::DATE::DATE AS col_1981,
	tab_781._timestamp AS col_1982,
	'1970-01-07 11:18:40.000425+00:00':::TIMESTAMPTZ AS col_1983,
	(tab_781._float8::FLOAT8 * tab_781._interval::INTERVAL)::INTERVAL AS col_1984,
	tab_781._bool AS col_1985,
	tab_781._decimal AS col_1986,
	tab_781._string AS col_1987,
	'\x1ed2cee2':::BYTES AS col_1988,
	NULL AS col_1989,
	'88.155.68.205/31':::INET AS col_1990,
	tab_781._jsonb AS col_1991
FROM
	defaultdb.public.seed@[0] AS tab_781
ORDER BY
	tab_781._timestamp DESC, tab_781._float8 DESC
LIMIT
	94:::INT8;

DELETE FROM defaultdb.public.seed AS tab_782 WHERE tab_782._bool;

INSERT
INTO
	defaultdb.public.seed AS tab_783 (_int2, _float8, _timestamp, _interval, _bool, _decimal, _jsonb)
SELECT
	tab_785._int8 AS col_1992,
	(-0.45141742093574566):::FLOAT8 AS col_1993,
	tab_785._timestamp AS col_1994,
	tab_785._interval AS col_1995,
	true AS col_1996,
	tab_784._decimal AS col_1997,
	tab_784._jsonb AS col_1998
FROM
	defaultdb.public.seed@[0] AS tab_784, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_785;

SELECT
	(-30937):::INT8 AS col_1999,
	(-2098609398172959888):::INT8 AS col_2000,
	tab_786._float4 AS col_2001,
	tab_786._interval AS col_2002,
	tab_786._date AS col_2003,
	tab_786._timestamptz AS col_2004,
	tab_786._bool AS col_2005,
	'\xda104d6348':::BYTES AS col_2006,
	tab_786._string AS col_2007,
	NULL AS col_2008,
	NULL AS col_2009,
	7.838128381065012582E+31:::DECIMAL AS col_2010,
	'566b67eb-099d-42ec-a0a0-37d35972c44c':::UUID AS col_2011,
	55401081:::INT8 AS col_2012,
	tab_786._jsonb AS col_2013
FROM
	defaultdb.public.seed@[0] AS tab_786
WHERE
	tab_786._bool
ORDER BY
	tab_786._float8 DESC, tab_786._timestamp ASC, tab_786._bool DESC, tab_786._date DESC, tab_786._string DESC
LIMIT
	61:::INT8;

SELECT
	DISTINCT 8.258244201597033835E+32:::DECIMAL AS col_2014
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_787,
	defaultdb.public.seed@[0] AS tab_788,
	defaultdb.public.seed AS tab_789
	JOIN defaultdb.public.seed AS tab_790 ON (tab_789._jsonb) = (tab_790._jsonb)
ORDER BY
	col_2014 ASC, col_2014 ASC
LIMIT
	90:::INT8;

SELECT
	tab_791._decimal AS col_2015,
	tab_791._timestamp AS col_2016,
	11204:::INT8 AS col_2017,
	tab_791._inet AS col_2018,
	false AS col_2019,
	tab_791._bytes AS col_2020,
	tab_791._timestamptz AS col_2021,
	tab_791._interval AS col_2022,
	tab_791._int4 AS col_2023,
	NULL AS col_2024,
	'00000000-0000-0000-0000-000000000000':::UUID AS col_2025,
	tab_791._string AS col_2026,
	tab_791._int8 AS col_2027
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_791
ORDER BY
	tab_791._date
LIMIT
	80:::INT8;

WITH
	with_294 (col_2028)
		AS (
			SELECT
				*
			FROM
				(VALUES ('01:32:16.241039':::TIME), ('23:59:59.999999':::TIME), ('04:57:20.941387':::TIME))
					AS tab_792 (col_2028)
		),
	with_295 (col_2029)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[(-9819):::INT8,0:::INT8]),
						(ARRAY[(-14614):::INT8,(-1319):::INT8,19167:::INT8,(-6195):::INT8]),
						(ARRAY[(-30979):::INT8,4473:::INT8,(-2394):::INT8]),
						(NULL)
				)
					AS tab_793 (col_2029)
		)
SELECT
	count(*) AS col_2030
FROM
	defaultdb.public.seed@[0] AS tab_794
GROUP BY
	tab_794._jsonb
LIMIT
	88:::INT8;

SELECT
	tab_795._timestamptz AS col_2031,
	tab_795._timestamp AS col_2032,
	'aa90:9aaf:e6b7:903e:75fc:9cd9:ff72:d363/99':::INET AS col_2033,
	tab_795._bytes AS col_2034
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_795
WHERE
	tab_795._bool;

INSERT
INTO
	defaultdb.public.seed AS tab_796 (_int2, _int8, _float4, _timestamp, _timestamptz, _string, _bytes, _uuid, _jsonb)
WITH
	with_297 (col_2036)
		AS (
			SELECT * FROM (VALUES (NULL), ((SELECT 4214248097:::OID AS col_2035 LIMIT 1:::INT8))) AS tab_797 (col_2036)
			UNION ALL
				SELECT
					*
				FROM
					(
						VALUES
							(NULL),
							(
								(
									WITH
										with_296 (col_2037)
											AS (
												SELECT
													*
												FROM
													(
														VALUES
															(
																e'{"+\\"[,\\\\cAX1nI": {"`Qag.*": {"H)e": []}, "c": {"bar": [{}, [[]]]}, "i~@s:": null}, "K9NZ&KS,m.": false, "c": {}, "|,b0]>8-`Cx": "baz"}':::JSONB
															),
															(
																('[[[[{}, []], {}, {}, {"Zj.x": {"b": {}}, "c": false}, 0.4049294097738442, [], "baz"], false, []]]':::JSONB::JSONB->rtrim('FR':::STRING::STRING, e'v{k\x0b':::STRING::STRING)::STRING::STRING)::JSONB
															)
													)
														AS tab_798 (col_2037)
											)
									SELECT
										2546065610:::OID AS col_2038
									FROM
										with_296 AS cte_ref_94
									WHERE
										NULL
									LIMIT
										1:::INT8
								)
							),
							(1375276813:::OID),
							(3296039126:::OID),
							(0:::OID)
					)
						AS tab_799 (col_2039)
		)
SELECT
	1:::INT8 AS col_2040,
	tab_800._int8 AS col_2041,
	NULL AS col_2042,
	tab_800._timestamp AS col_2043,
	'1970-01-01 05:17:15.000596+00:00':::TIMESTAMPTZ AS col_2044,
	tab_800._string AS col_2045,
	'\x435d89091a48216b':::BYTES AS col_2046,
	tab_800._uuid AS col_2047,
	e'{"\\\\4g1T@#m=DH": [], "baz": ["bar"], "c": {"b": [null, []], "d-5e->fsPa.": [{"baz": [true]}], "zt<": true}}':::JSONB
		AS col_2048
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_800, with_297 AS cte_ref_95
WHERE
	tab_800._bool;

UPDATE
	defaultdb.public.seed AS tab_801
SET
	_date
		= (
			SELECT
				tab_801._date AS col_2049
			FROM
				defaultdb.public.seed@[0] AS tab_802
			ORDER BY
				tab_802._decimal DESC, tab_802._inet DESC, tab_802._timestamptz DESC
			LIMIT
				1:::INT8
		)
ORDER BY
	tab_801._int2 DESC
LIMIT
	66:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_803
WITH
	with_299 (col_2052)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(
								WITH
									with_298 (col_2050)
										AS (
											SELECT
												*
											FROM
												(VALUES ('-infinity':::DATE), ('1978-08-15':::DATE))
													AS tab_804 (col_2050)
										)
								SELECT
									3187562947:::OID AS col_2051
								FROM
									defaultdb.public.seed@[0] AS tab_805
								WHERE
									tab_805._bool
								ORDER BY
									tab_805._uuid ASC, tab_805._float8 DESC, tab_805._date DESC
								LIMIT
									1:::INT8
							)
						),
						(771618120:::OID),
						(4260657745:::OID),
						(1928314916:::OID)
				)
					AS tab_806 (col_2052)
		),
	with_300 (col_2053)
		AS (SELECT * FROM (VALUES (e'sTK\x03\x1a<\x17u<':::STRING), (e'\x1d':::STRING)) AS tab_807 (col_2053)),
	with_301 (col_2054)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-3361259096831509770):::INT8),
						((-4872005370705954800):::INT8),
						(NULL),
						((-7671099272314356986):::INT8),
						(1252291048857840444:::INT8)
				)
					AS tab_808 (col_2054)
		)
SELECT
	7607:::INT8 AS col_2055,
	2147483647:::INT8 AS col_2056,
	(-2147483648):::INT8 AS col_2057,
	(-0.6527538299560547):::FLOAT8 AS col_2058,
	'-Inf':::FLOAT8 AS col_2059,
	'1978-08-13':::DATE AS col_2060,
	'1970-01-09 15:59:41.000124+00:00':::TIMESTAMP AS col_2061,
	'1970-01-09 07:16:44.000871+00:00':::TIMESTAMPTZ AS col_2062,
	(NULL::INT8 * '-29 years -6 mons -190 days -00:41:48.821923':::INTERVAL::INTERVAL)::INTERVAL AS col_2063,
	false AS col_2064,
	(-1):::DECIMAL AS col_2065,
	e'E!,q\x17':::STRING AS col_2066,
	('\xf9eea84ddd92f2':::BYTES::BYTES || '\x0421f3516c1c':::BYTES::BYTES)::BYTES AS col_2067,
	'0ec4c076-a506-4d69-943a-32830b32ebed':::UUID AS col_2068,
	'202.4.186.171/2':::INET AS col_2069,
	'[[{}, [], [], true], {"QJqh": []}, [{}, null, []]]':::JSONB AS col_2070
FROM
	with_300 AS cte_ref_96
WHERE
	NULL
LIMIT
	57:::INT8;

SELECT
	(tab_809._float8::FLOAT8 % tab_809._float4::FLOAT8)::FLOAT8 AS col_2071, tab_809._uuid AS col_2072
FROM
	defaultdb.public.seed@[0] AS tab_809
WHERE
	true
LIMIT
	16:::INT8;

WITH
	with_302 (col_2073)
		AS (
			SELECT
				*
			FROM
				(VALUES (ARRAY[23326:::INT8]), (ARRAY[13878:::INT8,18431:::INT8]), (ARRAY[]:::INT2[]))
					AS tab_810 (col_2073)
		)
SELECT
	count(*) AS col_2074
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_811
GROUP BY
	tab_811._int8
HAVING
	crdb_internal.is_admin()::BOOL
LIMIT
	63:::INT8;

WITH
	with_303 (col_2075)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(0:::OID),
						(2380250264:::OID),
						(3345168728:::OID),
						(1525270311:::OID),
						(2862870568:::OID),
						(1099068691:::OID)
				)
					AS tab_812 (col_2075)
		)
SELECT
	874924438:::OID AS col_2076
FROM
	with_303 AS cte_ref_97
WHERE
	true
ORDER BY
	cte_ref_97.col_2075 ASC
LIMIT
	76:::INT8;

SELECT
	'5c1cc596-b3da-4208-b587-515b96c80760':::UUID AS col_2077,
	tab_813._jsonb AS col_2078,
	'1993-10-22':::DATE AS col_2079,
	'1970-01-12 11:45:26.000709+00:00':::TIMESTAMPTZ AS col_2080,
	0.3968484103679657:::FLOAT8 AS col_2081,
	662678719512205744:::INT8 AS col_2082,
	tab_813._int2 AS col_2083,
	'[UJ':::STRING AS col_2084,
	tab_813._timestamp AS col_2085,
	(-0.6483306748154283):::FLOAT8 AS col_2086,
	tab_813._inet AS col_2087,
	(tab_813._inet::INET << tab_813._inet::INET)::BOOL AS col_2088,
	tab_813._int2 AS col_2089,
	tab_813._interval AS col_2090
FROM
	defaultdb.public.seed@[0] AS tab_813;

INSERT
INTO
	defaultdb.public.seed AS tab_814
SELECT
	18015:::INT8 AS col_2091,
	(-253860592):::INT8 AS col_2092,
	4245165998056689926:::INT8 AS col_2093,
	0.7237764596939087:::FLOAT8 AS col_2094,
	NULL AS col_2095,
	tab_815._date AS col_2096,
	NULL AS col_2097,
	tab_815._timestamptz AS col_2098,
	'39 years 11 mons 700 days 12:51:18.841059':::INTERVAL AS col_2099,
	tab_815._bool AS col_2100,
	tab_815._decimal AS col_2101,
	tab_815._string AS col_2102,
	'\x0dbc6f0828da17':::BYTES AS col_2103,
	tab_815._uuid AS col_2104,
	'4.115.196.84/15':::INET AS col_2105,
	tab_815._jsonb AS col_2106
FROM
	defaultdb.public.seed@[0] AS tab_815;

WITH
	with_304 (col_2107)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(B'0000000000000000000000000000000000000000000000000000000000000000'),
						(B'101110011110101110110000001')
				)
					AS tab_816 (col_2107)
		)
SELECT
	'77862f3a-5f69-4fcf-93ad-0842955bfa13':::UUID AS col_2108
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_817
WHERE
	(NULL OR true)
LIMIT
	27:::INT8;

INSERT INTO defaultdb.public.seed AS tab_818 DEFAULT VALUES;

WITH
	with_305 (col_2109)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-2.1932048443814267):::FLOAT8),
						(5e-324:::FLOAT8),
						(0.03440054492845235:::FLOAT8),
						(NULL),
						(((-0.722216228506358):::FLOAT8::FLOAT8 // NULL::FLOAT8)::FLOAT8)
				)
					AS tab_819 (col_2109)
		),
	with_306 (col_2110, col_2111)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[1722763491:::OID,801626772:::OID], 1575455416:::OID),
						(ARRAY[425421555:::OID,0:::OID,3345036423:::OID], 3171300134:::OID)
				)
					AS tab_820 (col_2110, col_2111)
		)
SELECT
	ARRAY[105788049:::OID] AS col_2112, 0.4645907913860938:::FLOAT8 AS col_2113, 3298355773:::OID AS col_2114
FROM
	with_305 AS cte_ref_98, with_306 AS cte_ref_99
WHERE
	true
ORDER BY
	cte_ref_99.col_2111 DESC;

SELECT
	tab_821._decimal AS col_2115,
	tab_822._bytes AS col_2116,
	'c4b388ac-5dfb-4557-adb7-880cc90e4ed8':::UUID AS col_2117,
	tab_822._float8 AS col_2118,
	tab_821._jsonb AS col_2119,
	e'[{"&-iT": "BmTe(hpB", "`J@ $E": null, "foo": null, "o$9:.3": {"qLItE*QW?": []}, "r<Kyzp&": []}, [{"baz": 0.19515575730800888}, false, []], "LD\\">kD^^", {}, {}]':::JSONB
		AS col_2120,
	tab_822._bytes AS col_2121,
	0.5684792995452881:::FLOAT8 AS col_2122,
	tab_822._uuid AS col_2123,
	(-8381821784203660703):::INT8 AS col_2124,
	32077:::INT8 AS col_2125,
	'206.125.30.6/27':::INET AS col_2126,
	tab_822._interval AS col_2127,
	(-32768):::INT8 AS col_2128,
	'1970-01-11 16:38:02.000886+00:00':::TIMESTAMPTZ AS col_2129
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_821
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_822 ON
			(tab_821._date) = (tab_822._date) AND (tab_821._jsonb) = (tab_822._jsonb)
WHERE
	tab_822._bool
ORDER BY
	tab_822._float8, tab_821._bytes, tab_822._timestamp ASC
LIMIT
	97:::INT8;

UPDATE
	defaultdb.public.seed AS tab_823
SET
	_float4 = 0.2594551146030426:::FLOAT8
ORDER BY
	tab_823._date DESC
LIMIT
	46:::INT8;

WITH
	with_307 (col_2130) AS (SELECT * FROM (VALUES (NULL), (NULL), (ARRAY[]:::INT4[])) AS tab_824 (col_2130))
SELECT
	tab_825._uuid AS col_2131, NULL AS col_2132, '1997-03-14':::DATE AS col_2133
FROM
	defaultdb.public.seed@[0] AS tab_825
ORDER BY
	tab_825._int4, tab_825._date DESC, tab_825._decimal ASC, tab_825._int4 DESC, tab_825._decimal
LIMIT
	42:::INT8;

SELECT tab_826._bool AS col_2134 FROM defaultdb.public.seed@[0] AS tab_826;

INSERT INTO defaultdb.public.seed AS tab_827 DEFAULT VALUES;

SELECT
	tab_828._timestamptz AS col_2136,
	tab_829._uuid AS col_2137,
	tab_828._int8 AS col_2138,
	tab_829._string AS col_2139,
	'a9cf8522-5feb-44e5-853b-36e385833a94':::UUID AS col_2140,
	0.5344095826148987:::FLOAT8 AS col_2141,
	tab_829._bytes AS col_2142
FROM
	defaultdb.public.seed@[0] AS tab_828, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_829
WHERE
	EXISTS(
		SELECT
			B'0000000000000000000000000000000000000000000000000000000000000000' AS col_2135
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_830,
			[DELETE FROM defaultdb.public.seed AS tab_831 RETURNING _int8 AS ret_3]
		LIMIT
			64:::INT8
	)
LIMIT
	98:::INT8;

SELECT
	DISTINCT tab_832._string AS col_2143, tab_832._jsonb AS col_2144, NULL AS col_2145, tab_832._int4 AS col_2146
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_832
WHERE
	true
LIMIT
	19:::INT8;

SELECT
	(-0.446465357724242):::FLOAT8 AS col_2147
FROM
	defaultdb.public.seed@[0] AS tab_833
	JOIN defaultdb.public.seed@[0] AS tab_834 ON (tab_833._int2) = (tab_834._int8) AND (tab_833._uuid) = (tab_834._uuid)
LIMIT
	48:::INT8;

SELECT
	bool_and(tab_835._bool::BOOL)::BOOL AS col_2148,
	xor_agg(tab_836._bytes::BYTES)::BYTES AS col_2149,
	max(tab_835._jsonb::JSONB) OVER (PARTITION BY tab_836._float4 ORDER BY tab_836._float4 DESC ROWS (-5009381417301285138):::INT8 PRECEDING)::JSONB
		AS col_2150,
	tab_836._float4 AS col_2151
FROM
	defaultdb.public.seed@[0] AS tab_835, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_836
WHERE
	false
GROUP BY
	tab_835._jsonb, tab_836._bytes, tab_836._float4, tab_835._bool
HAVING
	max(tab_836._bool::BOOL)::BOOL
ORDER BY
	tab_835._bool ASC;

UPDATE
	defaultdb.public.seed AS tab_837
SET
	_interval = '-62 years -1 mons -975 days -14:24:03.577069':::INTERVAL,
	_timestamptz = tab_837._timestamptz,
	_date = '1970-01-01':::DATE
WHERE
	tab_837._bool
LIMIT
	46:::INT8;

SELECT ARRAY[1559933389:::OID] AS col_2152, NULL AS col_2153;

INSERT
INTO
	defaultdb.public.seed AS tab_838 (_int4, _int8, _timestamp, _interval, _string, _uuid, _jsonb)
WITH
	with_308 (col_2154)
		AS (
			SELECT
				*
			FROM
				(VALUES ('':::STRING), (e'\x04R([?/':::STRING), ('4 ':::STRING), ('':::STRING)) AS tab_839 (col_2154)
		)
SELECT
	tab_840._int4 AS col_2155,
	((-7587635574579980312):::INT8::INT8 % (-1788297053966230733):::INT8::INT8)::INT8 AS col_2156,
	NULL AS col_2157,
	tab_840._interval AS col_2158,
	NULL AS col_2159,
	tab_840._uuid AS col_2160,
	tab_840._jsonb AS col_2161
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_840
WHERE
	tab_840._bool
LIMIT
	94:::INT8;

SELECT
	NULL AS col_2162, true AS col_2163, (-5616118770037288218):::INT8 AS col_2164
FROM
	defaultdb.public.seed@[0] AS tab_841
WHERE
	tab_841._bool
ORDER BY
	tab_841._timestamptz
LIMIT
	17:::INT8;

SELECT
	count(*) AS col_2165
FROM
	defaultdb.public.seed@[0] AS tab_842
WHERE
	6.746592289268966246E+32:::DECIMAL::DECIMAL NOT IN (tab_842._decimal,)
GROUP BY
	tab_842._jsonb
HAVING
	inet_contained_by_or_equals('234.56.105.220/11':::INET::INET, NULL::INET)::BOOL;

SELECT
	json_agg(tab_844._jsonb)::JSONB AS col_2170
FROM
	defaultdb.public.seed@[0] AS tab_844
WHERE
	tab_844._bool
GROUP BY
	tab_844._jsonb
HAVING
	max(tab_844._bool::BOOL)::BOOL
LIMIT
	11:::INT8;

SELECT B'0111111111111111111111111111111111111111111111111111111111111111' AS col_2171;

INSERT
INTO
	defaultdb.public.seed AS tab_845 (_int4, _float4, _float8, _timestamptz, _bool, _decimal, _bytes, _uuid, _jsonb)
SELECT
	0:::INT8 AS col_2172,
	NULL AS col_2173,
	((-1.039459133805558):::FLOAT8::FLOAT8 - (-1.4247716599028144):::FLOAT8::FLOAT8)::FLOAT8 AS col_2174,
	COALESCE('1970-01-07 01:42:04.000507+00:00':::TIMESTAMPTZ, '0001-01-01 00:00:00+00:00':::TIMESTAMPTZ) AS col_2175,
	NULL ILIKE repeat(e'R{\x15FpX':::STRING::STRING, (-922739510734640514):::INT8::INT8)::STRING AS col_2176,
	COALESCE(172437.5879862149085:::DECIMAL, 8.366512245315213254E+22:::DECIMAL) AS col_2177,
	'\x925092fd441d755fc8':::BYTES AS col_2178,
	'faeadf6f-38cc-47bd-9c3d-f5444a3ad973':::UUID AS col_2179,
	'[{"%XE#/LJ": true, "a": {}}, [], [{"b": {}}]]':::JSONB AS col_2180;

UPDATE defaultdb.public.seed AS tab_846 SET _bool = tab_846._bool WHERE tab_846._bool;

UPDATE
	defaultdb.public.seed AS tab_847
SET
	_float4 = tab_847._float4, _float8 = (-0.23402875180530272):::FLOAT8, _date = '1994-01-26':::DATE
ORDER BY
	tab_847._inet ASC, tab_847._date
LIMIT
	5:::INT8;

SELECT
	tab_848._string AS col_2184, 'eca200b4-9701-4a5e-b686-43b01242bb06':::UUID AS col_2185
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_848
WHERE
	EXISTS(
		WITH
			with_310 (col_2181)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(0.7620263924929247:::FLOAT8),
								(((-2.466793448232173):::FLOAT8::FLOAT8 ^ 0.8205167442325825:::FLOAT8::FLOAT8)::FLOAT8),
								((-0.4350011766309211):::FLOAT8),
								(1.401298464324817e-45:::FLOAT8)
						)
							AS tab_849 (col_2181)
				)
		SELECT
			'1970-01-04 17:15:36.0005+00:00':::TIMESTAMP AS col_2182, NULL AS col_2183
		FROM
			defaultdb.public.seed AS tab_850
			JOIN defaultdb.public.seed AS tab_851 ON
					(tab_850._int8) = (tab_851._int8)
					AND (tab_850._float8) = (tab_851._float8)
					AND (tab_850._date) = (tab_851._date)
			LEFT JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_852 ON
					like_escape(tab_848._string::STRING, tab_848._string::STRING, 'e>':::STRING::STRING)::BOOL
		WHERE
			tab_852._bool
		LIMIT
			20:::INT8
	)
LIMIT
	41:::INT8;

SELECT
	1.1567096710205078:::FLOAT8 AS col_2186
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_853
WHERE
	true
LIMIT
	24:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_857 (_int2, _int8, _float4, _timestamptz, _decimal, _string, _inet, _jsonb)
SELECT
	26142:::INT8 AS col_2190,
	fnv64((WITH with_313 (col_2191, col_2192) AS (SELECT * FROM (VALUES (B'101001101011101110100', 'NaN':::FLOAT8), (NULL, 0.13491682706507663:::FLOAT8), (B'110010100110101010111', 0.0:::FLOAT8), (B'001101101110010000100', (-0.6580374080503593):::FLOAT8)) AS tab_859 (col_2191, col_2192)) SELECT '\xa8d8405bc963e2ca':::BYTES AS col_2193 FROM with_313 AS cte_ref_100 WHERE true ORDER BY cte_ref_100.col_2192 LIMIT 1:::INT8)::BYTES)::INT8
		AS col_2194,
	(-0.5614551305770874):::FLOAT8 AS col_2195,
	now():::TIMESTAMPTZ::TIMESTAMPTZ AS col_2196,
	pow((-62091.74140641526365):::DECIMAL::DECIMAL, 5444.165421097466725:::DECIMAL::DECIMAL)::DECIMAL AS col_2197,
	concat_agg(tab_858._string::STRING)::STRING AS col_2198,
	netmask(('a517:dd01:9199:e5e3:c9:4579:b82b:bdb6/48':::INET::INET + 4306971813777723262:::INT8::INT8)::INET::INET)::INET
		AS col_2199,
	jsonb_agg(tab_858._string) OVER (PARTITION BY tab_858._string)::JSONB AS col_2200
FROM
	defaultdb.public.seed@[0] AS tab_858
GROUP BY
	tab_858._string
HAVING
	min(tab_858._bool::BOOL)::BOOL
ORDER BY
	tab_858._string ASC, tab_858._string, tab_858._string, tab_858._string DESC
LIMIT
	34:::INT8;

UPDATE
	defaultdb.public.seed AS tab_860
SET
	_float8 = 0.6021682311829976:::FLOAT8, _float4 = tab_860._float4
LIMIT
	12:::INT8;

SELECT
	true AS col_2201,
	'af178f6a-7c18-4006-b500-12e76e0be1ff':::UUID AS col_2202,
	tab_861._bytes AS col_2203,
	tab_861._string AS col_2204,
	22011:::INT8 AS col_2205,
	tab_861._float4 AS col_2206
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_861
WHERE
	tab_861._bool
ORDER BY
	tab_861._int2 ASC, tab_861._date ASC
LIMIT
	17:::INT8;

WITH
	with_314 (col_2207)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-03 17:47:24.000185+00:00':::TIMESTAMPTZ),
						(NULL),
						('1970-01-06 20:46:20.000879+00:00':::TIMESTAMPTZ),
						('1970-01-09 19:48:12.000266+00:00':::TIMESTAMPTZ)
				)
					AS tab_862 (col_2207)
		),
	with_315 (col_2208)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1978-06-20':::DATE),
						('1982-02-05':::DATE),
						(localtimestamp():::DATE::DATE),
						('1990-06-10':::DATE)
				)
					AS tab_863 (col_2208)
		)
SELECT
	'-42 years -1 mons -265 days -05:52:14.249226':::INTERVAL AS col_2209, NULL AS col_2210
LIMIT
	72:::INT8;

SELECT tab_864._int2 AS col_2211 FROM defaultdb.public.seed@seed__int8__float8__date_idx AS tab_864 LIMIT 29:::INT8;

SELECT
	'\x6f2a3d86':::BYTES AS col_2212,
	tab_865._float8 AS col_2213,
	'{"b": "b", "ncvM": [[false, [], []], [{}], false, {}, [], []]}':::JSONB AS col_2214,
	tab_865._bool AS col_2215,
	'9e77d80b-0e5a-42e8-8519-ee4130735a48':::UUID AS col_2216,
	tab_865._string AS col_2217,
	(-29456):::INT8 AS col_2218,
	NULL AS col_2219,
	0.6132834553718567:::FLOAT8 AS col_2220
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_865
WHERE
	tab_865._bool;

UPDATE
	defaultdb.public.seed AS tab_866
SET
	_timestamp = NULL, _decimal = 624222329034.5666334:::DECIMAL
WHERE
	tab_866._bool;

SELECT
	'2c9b8618-c277-4318-a122-66173f247af9':::UUID AS col_2221
FROM
	defaultdb.public.seed@[0] AS tab_867
LIMIT
	17:::INT8;

UPDATE defaultdb.public.seed AS tab_868 SET _interval = tab_868._interval;

INSERT
INTO
	defaultdb.public.seed AS tab_869 (_int4, _int8, _float8, _date, _bool, _decimal, _bytes)
WITH
	with_316 (col_2222)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(CASE WHEN true THEN e'd\x19}\x06':::STRING ELSE e'\x00':::STRING END),
						(e'8l\x11Y':::STRING),
						(e'\x18G\x04+?':::STRING),
						(CASE WHEN NULL THEN NULL ELSE e'e\x14&':::STRING END)
				)
					AS tab_870 (col_2222)
		)
SELECT
	(-707502124):::INT8 AS col_2223,
	(-1549082448828316588):::INT8 AS col_2224,
	tab_871._float8 AS col_2225,
	'-infinity':::DATE AS col_2226,
	true AS col_2227,
	NULL AS col_2228,
	tab_871._bytes AS col_2229
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_871, with_316 AS cte_ref_101
ORDER BY
	tab_871._float4;

WITH
	with_319 (col_2233)
		AS (SELECT * FROM (VALUES (20326:::INT8), (9515:::INT8), ((-22300):::INT8)) AS tab_874 (col_2233))
SELECT
	COALESCE(23577:::INT8, cte_ref_102.col_2233) AS col_2234
FROM
	with_319 AS cte_ref_102
LIMIT
	61:::INT8;

SELECT '-15 years -348 days -21:06:37.186132':::INTERVAL AS col_2235;

SELECT
	tab_875._float8 AS col_2236,
	tab_875._bytes AS col_2237,
	'1970-01-09 14:24:30.000654+00:00':::TIMESTAMPTZ AS col_2238,
	e'\x02\x19':::STRING AS col_2239,
	tab_875._float8 AS col_2240,
	current_timestamp():::TIMESTAMP::TIMESTAMP AS col_2241
FROM
	defaultdb.public.seed@[0] AS tab_875
WHERE
	(tab_875._bool AND true)
LIMIT
	26:::INT8;

WITH
	with_320 (col_2242) AS (SELECT tab_876._string AS col_2242 FROM defaultdb.public.seed@[0] AS tab_876),
	with_321 (col_2243, col_2244)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							'[2.5948051459318426, {}, {")bozpBGZuYp": "odl-]VnYoo_}", "foo": {}}, {"d=72Ws5z`": {}, "foobar": {}}, {}]':::JSONB,
							'\x9f1efa':::BYTES
						),
						(
							e'{"\\\\oU!pk@[": [{"baz": false, "c": {"baz": {}}}, {"foo": {}}, []], "a": null, "bar": [], "c": false, "{u>h(Dr": false}':::JSONB,
							'\x10db8c5c13dd01':::BYTES
						),
						(
							'{"bar": [], "c": null, "foobar": {"b": true, "baz": [{"J3M": [[[]]]}], "y[K": []}, "o00Fz.": [[{}]]}':::JSONB,
							'\xbc4b92':::BYTES
						)
				)
					AS tab_877 (col_2243, col_2244)
		),
	with_322 (col_2245) AS (SELECT * FROM (VALUES ('\xfc5b5622978c9d':::BYTES), ('\x':::BYTES)) AS tab_878 (col_2245))
SELECT
	'\xc0cf7f':::BYTES AS col_2246
FROM
	with_322 AS cte_ref_103
WHERE
	true;

INSERT
INTO
	defaultdb.public.seed AS tab_879
SELECT
	1:::INT8 AS col_2247,
	tab_880._int2 AS col_2248,
	(-2379336503289504594):::INT8 AS col_2249,
	1.0143073797225952:::FLOAT8 AS col_2250,
	(-1.4862707451470947):::FLOAT8 AS col_2251,
	tab_880._date AS col_2252,
	'1970-01-08 21:14:39.000615+00:00':::TIMESTAMP AS col_2253,
	tab_880._timestamptz AS col_2254,
	'-48 years -5 mons -846 days -23:52:12.561827':::INTERVAL AS col_2255,
	tab_880._bool AS col_2256,
	(-0.6138022778930476949):::DECIMAL AS col_2257,
	NULL AS col_2258,
	right(tab_880._bytes::BYTES, tab_880._int2::INT8)::BYTES AS col_2259,
	NULL AS col_2260,
	'cec1:cb85:4675:5532:8ec0:8c0f:80e7:44ad/5':::INET AS col_2261,
	tab_880._jsonb AS col_2262
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_880
ORDER BY
	tab_880._float8 ASC, tab_880._date DESC
LIMIT
	99:::INT8;

UPDATE defaultdb.public.seed AS tab_881 SET _float4 = NULL;

DELETE FROM defaultdb.public.seed AS tab_882 LIMIT 68:::INT8;

WITH
	with_324 (col_2266)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(0:::OID),
						(2395672243:::OID),
						(
							(
								WITH
									with_323 (col_2263, col_2264)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(
															'1970-01-12 07:59:38.000105+00:00':::TIMESTAMP,
															'09:45:28.612194+14:22:00':::TIMETZ
														),
														(
															'-2000-01-01 00:00:00+00:00':::TIMESTAMP,
															'20:05:05.909024+10:03:00':::TIMETZ
														),
														(NULL, '19:53:40.746842-00:42:00':::TIMETZ),
														(
															NULL,
															timezone('11:11:24.201107+02:16:00':::TIMETZ::TIMETZ, e'\x18uru!\x07I\x152':::STRING::STRING)::TIMETZ
														),
														('1970-01-04 17:19:09.000747+00:00':::TIMESTAMP, NULL),
														(
															'1970-01-06 11:43:16.000251+00:00':::TIMESTAMP,
															'20:56:35.0962-12:49:00':::TIMETZ
														)
												)
													AS tab_883 (col_2263, col_2264)
										)
								SELECT
									4247386752:::OID AS col_2265
								FROM
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_884
								WHERE
									true
								LIMIT
									1:::INT8
							)
						),
						(1629331180:::OID),
						(2227293629:::OID),
						(0:::OID)
				)
					AS tab_885 (col_2266)
		),
	with_325 (col_2267)
		AS (
			SELECT * FROM (VALUES (NULL), (2826217508:::OID)) AS tab_886 (col_2267)
			UNION
				SELECT
					*
				FROM
					(
						VALUES
							(1640406854:::OID),
							(2834172588:::OID),
							(2867844150:::OID),
							(3268775627:::OID),
							(
								(
									SELECT
										1622664364:::OID AS col_2268
									FROM
										defaultdb.public.seed@[0] AS tab_887
									GROUP BY
										tab_887._date
									HAVING
										max(tab_887._bool::BOOL)::BOOL
									LIMIT
										1:::INT8
								)
							),
							(4219043639:::OID)
					)
						AS tab_888 (col_2269)
		)
SELECT
	count(*) AS col_2270
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_889
WHERE
	tab_889._bool
GROUP BY
	tab_889._int8, tab_889._float8
HAVING
	similar_to_escape(e'\x13\x11i\x1a,':::STRING::STRING, NULL::STRING, (e'+\x13NHX~':::STRING::STRING || 'X6':::STRING::STRING)::STRING::STRING)::BOOL;

INSERT
INTO
	defaultdb.public.seed AS tab_890
SELECT
	tab_891._int4 AS col_2271,
	32767:::INT8 AS col_2272,
	(-2289085256318172871):::INT8 AS col_2273,
	0.40989401936531067:::FLOAT8 AS col_2274,
	(-0.14488853359647802):::FLOAT8 AS col_2275,
	(tab_891._date::DATE - (-8230956617770506927):::INT8::INT8)::DATE AS col_2276,
	tab_891._timestamp AS col_2277,
	'1970-01-06 09:35:11.000945+00:00':::TIMESTAMPTZ AS col_2278,
	NULL AS col_2279,
	tab_891._bool AS col_2280,
	56625446425241137.72:::DECIMAL AS col_2281,
	tab_891._string AS col_2282,
	'\x30':::BYTES AS col_2283,
	tab_891._uuid AS col_2284,
	tab_891._inet AS col_2285,
	json_build_array(tab_891._int8)::JSONB AS col_2286
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_891
WHERE
	tab_891._bool
ORDER BY
	tab_891._interval DESC, tab_891._int4
LIMIT
	31:::INT8;

SELECT
	tab_892._decimal AS col_2287
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_892
WHERE
	false
ORDER BY
	tab_892._float4 ASC
LIMIT
	14:::INT8;

WITH
	with_326 (col_2288)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-789799830370865870.0):::DECIMAL),
						((-3001603875212.008516):::DECIMAL),
						((-8.832116676554311963E+25):::DECIMAL),
						(0:::DECIMAL)
				)
					AS tab_893 (col_2288)
		),
	with_327 (col_2289) AS (SELECT * FROM (VALUES (B'111001'), (B'101000'), (B'000011')) AS tab_894 (col_2289))
SELECT
	NULL AS col_2290
LIMIT
	79:::INT8;

WITH
	with_328 (col_2291) AS (SELECT * FROM (VALUES (268629464:::OID), (0:::OID)) AS tab_895 (col_2291))
SELECT
	count(*) AS col_2292
FROM
	defaultdb.public.seed@[0] AS tab_896
WHERE
	tab_896._bool
GROUP BY
	tab_896._jsonb
HAVING
	inet_contained_by_or_equals('212.40.155.70/19':::INET::INET, broadcast(('0.0.0.0/0':::INET::INET & '204.233.63.178/16':::INET::INET)::INET::INET)::INET::INET)::BOOL;

WITH
	with_331 (col_2296)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							COALESCE(
								(
									WITH
										with_329 (col_2293)
											AS (
												SELECT
													*
												FROM
													(
														VALUES
															(NULL),
															(NULL),
															(732206182:::INT8),
															(631409469:::INT8),
															((-1731038776):::INT8)
													)
														AS tab_897 (col_2293)
											),
										with_330 (col_2294)
											AS (
												SELECT
													*
												FROM
													(
														VALUES
															(ARRAY[18945:::INT8]),
															(ARRAY[23195:::INT8,4342:::INT8,0:::INT8]),
															(
																ARRAY[(-2471):::INT8,(-9125):::INT8,0:::INT8,(-22235):::INT8,27768:::INT8,19978:::INT8,15562:::INT8]
															),
															(ARRAY[]:::INT2[])
													)
														AS tab_898 (col_2294)
											)
									SELECT
										2600138850:::OID AS col_2295
									FROM
										with_329 AS cte_ref_104
									GROUP BY
										cte_ref_104.col_2293
									HAVING
										inet_contains_or_equals(NULL::INET, NULL::INET)::BOOL
									ORDER BY
										cte_ref_104.col_2293 DESC, cte_ref_104.col_2293, cte_ref_104.col_2293
									LIMIT
										1:::INT8
								),
								2543127573:::OID
							)
						),
						(4191004716:::OID),
						(2385353370:::OID),
						(1197557362:::OID),
						(2286391842:::OID)
				)
					AS tab_899 (col_2296)
		),
	with_332 (col_2297)
		AS (
			SELECT
				*
			FROM
				(VALUES (e'\rG\x01_Nu\x1do^':::STRING), (e'\x1aT&M1i&\x1b\x1b':::STRING), ('q':::STRING), ('':::STRING))
					AS tab_900 (col_2297)
		)
SELECT
	cte_ref_105.col_2296 AS col_2298
FROM
	with_331 AS cte_ref_105
GROUP BY
	cte_ref_105.col_2296;

DELETE FROM defaultdb.public.seed AS tab_901 LIMIT 19:::INT8;

WITH
	with_333 (col_2299, col_2300)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-905516838):::INT8, '-ocbP':::STRING),
						((-517532759):::INT8, e'6\x1cb\fK&\\':::STRING),
						((-1290376846):::INT8, e'&}\t\x01\'$':::STRING)
				)
					AS tab_902 (col_2299, col_2300)
		),
	with_334 (col_2301)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('-63 years -4 mons -351 days -09:26:27.974562':::INTERVAL),
						('-61 years -11 mons -264 days -02:20:04.835181':::INTERVAL)
				)
					AS tab_903 (col_2301)
			INTERSECT ALL
				SELECT
					*
				FROM
					(
						VALUES
							('-58 years -663 days -06:52:29.425377':::INTERVAL),
							('62 years 4 mons 997 days 13:47:48.737385':::INTERVAL),
							('15 years 2 mons 976 days 17:29:04.062327':::INTERVAL),
							('66 years 1 mon 322 days 02:46:32.061937':::INTERVAL),
							('58 years 11 mons 245 days 12:53:04.14837':::INTERVAL),
							('-35 years -2 mons -560 days -08:14:54.001419':::INTERVAL)
					)
						AS tab_904 (col_2302)
		)
SELECT
	tab_905._int4 AS col_2303,
	'0e5e477f-35c8-4494-bea8-6873c14626d9':::UUID AS col_2304,
	e'z\x13\x1a\x17\x1cA':::STRING AS col_2305,
	tab_905._decimal AS col_2306,
	'-69 years -6 mons -709 days -10:45:35.071591':::INTERVAL AS col_2307,
	'2479:3abc:7cf9:6808:fa07:1e07:a3f7:1519/33':::INET AS col_2308,
	'{"baz": {"baz": {"a": []}}, "foobar": ["4<l", {"foobar": []}, "c", "XNGb"], "g8/": [[false], {"^[+": false}, {}], "ynQ&!ZXJ": null}':::JSONB
		AS col_2309,
	(tab_905._date::DATE - '04:39:53.745258':::TIME::TIME)::TIMESTAMP AS col_2310,
	'1970-01-09 04:01:39.000725+00:00':::TIMESTAMPTZ AS col_2311,
	31592:::INT8 AS col_2312,
	NULL AS col_2313,
	tab_905._float4 AS col_2314,
	tab_905._int8 AS col_2315,
	'5874897-12-31':::DATE AS col_2316,
	NULL AS col_2317,
	true AS col_2318
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_905
WHERE
	tab_905._bool
ORDER BY
	tab_905._decimal ASC
LIMIT
	67:::INT8;

SELECT
	tab_906._jsonb AS col_2319,
	NULL AS col_2320,
	'-51 years -9 mons -433 days -14:01:53.034853':::INTERVAL AS col_2321,
	tab_906._int8 AS col_2322,
	'1981-02-10':::DATE AS col_2323
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_906
WHERE
	(NOT tab_906._bool)
LIMIT
	75:::INT8;

SELECT
	4709656375715600729:::INT8 AS col_2324,
	tab_907._timestamp AS col_2325,
	(-163884187797805513.8):::DECIMAL AS col_2326
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_907
ORDER BY
	tab_907._bool DESC
LIMIT
	18:::INT8;

UPDATE
	defaultdb.public.seed AS tab_908
SET
	_bytes = tab_908._bytes, _inet = '673e:9ce0:33b0:8853:f8eb:bd62:16c9:f97d/120':::INET
WHERE
	tab_908._bool;

INSERT
INTO
	defaultdb.public.seed AS tab_909
WITH
	with_335 (col_2327)
		AS (SELECT * FROM (VALUES ('1970-01-01 00:13:39.000272+00:00':::TIMESTAMP)) AS tab_910 (col_2327))
SELECT
	(-128):::INT8 AS col_2328,
	(-606329547):::INT8 AS col_2329,
	4304812981195610315:::INT8 AS col_2330,
	NULL AS col_2331,
	(-0.7105912876516056):::FLOAT8 AS col_2332,
	'1993-09-22':::DATE AS col_2333,
	cte_ref_106.col_2327 AS col_2334,
	'1970-01-04 17:13:02.000954+00:00':::TIMESTAMPTZ AS col_2335,
	(age('1970-01-01 04:45:23.000926+00:00':::TIMESTAMPTZ::TIMESTAMPTZ, ('1970-01-03 21:46:00.000959+00:00':::TIMESTAMPTZ::TIMESTAMPTZ + '-78 years -3 mons -945 days -08:07:44.965882':::INTERVAL::INTERVAL)::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL::INTERVAL * 1939077115938561800:::INT8::INT8)::INTERVAL
		AS col_2336,
	false AS col_2337,
	NULL AS col_2338,
	NULL AS col_2339,
	'\x2b2525':::BYTES AS col_2340,
	'aa260699-57a6-4ac7-84e4-17d4dc4a79e3':::UUID AS col_2341,
	'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET AS col_2342,
	NULL AS col_2343
FROM
	with_335 AS cte_ref_106
WHERE
	NULL;

SELECT 1698743104:::INT8 AS col_2344;

WITH
	with_337 (col_2345, col_2346, col_2347)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL, 933374930:::OID, B'1000'),
						(
							width_bucket(array_position(ARRAY['1 day':::INTERVAL,'-50 years -8 mons -926 days -24:00:42.547349':::INTERVAL,'-57 years -6 mons -727 days -09:49:22.557813':::INTERVAL,'51 years 5 mons 255 days 24:38:16.849034':::INTERVAL]::INTERVAL[], ('2 years 9 mons 404 days 22:19:56.160046':::INTERVAL::INTERVAL * 6236038336503653443:::INT8::INT8)::INTERVAL::INTERVAL)::INT8::INT8, 7606982135782875758:::INT8::INT8, octet_length(e'\x06~t\x1aH5/':::STRING::STRING)::INT8::INT8, 8316431448557047552:::INT8::INT8)::INT8,
							70267625:::OID,
							B'1111'
						)
				)
					AS tab_911 (col_2345, col_2346, col_2347)
			UNION
				SELECT
					*
				FROM
					(
						VALUES
							(
								fnv64('\x392e17033149290038':::BYTES::BYTES)::INT8,
								4110489935:::OID,
								(
									WITH
										with_336 (col_2348)
											AS (
												SELECT
													*
												FROM
													(
														VALUES
															(
																B'0010011010000010110011100111010110001101100001100100000101001110100110011100111010111000000'
															),
															(B'010100111000100010001100001000011101101001110110100011'),
															(NULL),
															(B'010111110000011100111100000000100100100000')
													)
														AS tab_912 (col_2348)
											)
									SELECT
										B'0110' AS col_2349
									FROM
										defaultdb.public.seed@[0] AS tab_913
									WHERE
										false
									ORDER BY
										tab_913._bool ASC
									LIMIT
										1:::INT8
								)
							)
					)
						AS tab_914 (col_2350, col_2351, col_2352)
		),
	with_338 (col_2354)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(
								SELECT
									e'\\tY':::STRING:::NAME AS col_2353
								FROM
									defaultdb.public.seed AS tab_915
									JOIN defaultdb.public.seed AS tab_916 ON (tab_915._int8) = (tab_916._int8)
								WHERE
									(NULL AND false)
								LIMIT
									1:::INT8
							)
						),
						(e'DtF|\x1a\fUx\t':::STRING:::NAME),
						(e'ts\f.H\x13':::STRING:::NAME),
						('':::STRING:::NAME)
				)
					AS tab_917 (col_2354)
		)
SELECT
	cte_ref_107.col_2354 AS col_2355
FROM
	with_338 AS cte_ref_107;

SELECT
	e'"I\\\\VU7_d7b"':::JSONB AS col_2356,
	(tab_918._jsonb::JSONB - (-7666456062221272076):::INT8::INT8)::JSONB AS col_2357
FROM
	defaultdb.public.seed AS tab_918 JOIN defaultdb.public.seed AS tab_919 ON (tab_918._jsonb) = (tab_919._jsonb)
LIMIT
	78:::INT8;

WITH
	with_339 (col_2358)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1979-09-26':::DATE),
						('1983-03-02':::DATE),
						('1971-10-18':::DATE),
						('1995-02-01':::DATE),
						('1981-04-07':::DATE),
						('1970-08-29':::DATE)
				)
					AS tab_920 (col_2358)
		),
	with_340 (col_2359)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(3529728760:::OID),
						(NULL),
						(1733430045:::OID),
						(COALESCE(4085639334:::OID, 2424633520:::OID)),
						(1778125189:::OID),
						(1740703608:::OID)
				)
					AS tab_921 (col_2359)
		)
SELECT
	'1970-01-06 10:59:28.000037+00:00':::TIMESTAMPTZ AS col_2360,
	(-1798712673):::INT8 AS col_2361,
	tab_922._date AS col_2362,
	NULL AS col_2363,
	tab_922._inet AS col_2364,
	e'[{"1LSZ&im": 0.18550032516709958, "GtPiu^<_Ch": "PFlT1s%0C", "a": {}, "om`SDMu]": {}}, {"c": {"2zB[L=": [{}, "a"]}, "r0>": null}, {}, [false], "6?S\\\\[\'"]':::JSONB
		AS col_2365,
	tab_922._decimal AS col_2366,
	NULL AS col_2367,
	tab_922._uuid AS col_2368,
	NULL AS col_2369
FROM
	defaultdb.public.seed@[0] AS tab_922
ORDER BY
	tab_922._float8 ASC
LIMIT
	28:::INT8;

SELECT
	NULL AS col_2370,
	tab_923._jsonb AS col_2371,
	tab_923._bool AS col_2372,
	tab_923._float8 AS col_2373,
	1:::INT8 AS col_2374,
	tab_923._decimal AS col_2375,
	tab_923._float4 AS col_2376,
	tab_923._int4 AS col_2377,
	'r':::STRING AS col_2378
FROM
	defaultdb.public.seed@[0] AS tab_923
LIMIT
	58:::INT8;

SELECT
	count(*) AS col_2379
FROM
	defaultdb.public.seed@[0] AS tab_924
WHERE
	false
GROUP BY
	tab_924._int8, tab_924._float8;

WITH
	with_343 (col_2383)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							('00:23:45.705317':::TIME::TIME + '26 years 2 mons 692 days 24:14:27.442271':::INTERVAL::INTERVAL)::TIME
						),
						('08:07:01.151399':::TIME)
				)
					AS tab_927 (col_2383)
		),
	with_344 (col_2384)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('20:15:55.911723-00:26:00':::TIMETZ),
						(
							(('00:00:00':::INTERVAL::INTERVAL + '00:00:00+15:59:00':::TIMETZ::TIMETZ)::TIMETZ::TIMETZ - '-14 years -8 mons -498 days -06:08:09.360539':::INTERVAL::INTERVAL)::TIMETZ
						),
						(CASE WHEN NULL THEN NULL ELSE '19:41:56.980497-08:23:00':::TIMETZ END)
				)
					AS tab_928 (col_2384)
		)
SELECT
	count(*) AS col_2385
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_929
GROUP BY
	tab_929._int8
HAVING
	not_ilike_escape('':::STRING::STRING, e'P\x103':::STRING::STRING, e'?6ECs\n`\x15_':::STRING::STRING)::BOOL;

INSERT
INTO
	defaultdb.public.seed AS tab_930 (_int4, _float4, _float8, _interval, _bytes, _uuid)
WITH
	with_345 (col_2386)
		AS (SELECT * FROM (VALUES (('234.214.119.78/16':::INET, e'ia!{c\x15':::STRING))) AS tab_931 (col_2386)),
	with_348 (col_2392, col_2393)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							'fd5c:f8cb:e463:f63:2600:578:e915:1906/105':::INET,
							(
								WITH
									with_346 (col_2388)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(
															(
																SELECT
																	(-25552):::INT8 AS col_2387
																FROM
																	defaultdb.public.seed@seed__int8__float8__date_idx
																		AS tab_932,
																	defaultdb.public.seed@[0] AS tab_933
																LIMIT
																	1:::INT8
															)
														),
														(NULL),
														(629:::INT8)
												)
													AS tab_934 (col_2388)
											UNION ALL SELECT * FROM (VALUES ((-6520):::INT8)) AS tab_935 (col_2389)
										),
									with_347 (col_2390)
										AS (
											SELECT
												1221708771:::OID AS col_2390
											FROM
												with_346 AS cte_ref_109, with_346 AS cte_ref_110
										)
								SELECT
									ARRAY[1329714641:::OID] AS col_2391
								FROM
									with_347 AS cte_ref_111
								WHERE
									true
								ORDER BY
									cte_ref_111.col_2390 DESC, cte_ref_111.col_2390 DESC
								LIMIT
									1:::INT8
							)
						),
						('64e4:7f86:dfc3:6cfd:404:4fed:ace4:6c6f/101':::INET, ARRAY[]:::OID[])
				)
					AS tab_936 (col_2392, col_2393)
		)
SELECT
	381891584:::INT8 AS col_2394,
	1.84480881690979:::FLOAT8 AS col_2395,
	NULL AS col_2396,
	(age('1970-01-08 23:31:32.000036+00:00':::TIMESTAMPTZ::TIMESTAMPTZ, transaction_timestamp():::TIMESTAMPTZ::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL::INTERVAL * 1.46245821522017:::FLOAT8::FLOAT8)::INTERVAL
		AS col_2397,
	'\x66ee':::BYTES AS col_2398,
	'326fdae3-18c2-458a-a4ef-beaa6030aa6f':::UUID AS col_2399
FROM
	with_345 AS cte_ref_112
WHERE
	true;

WITH
	with_349 (col_2400, col_2401)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(0:::OID, '-12 years -9 mons -400 days -12:24:00.186352':::INTERVAL),
						(3963766891:::OID, '2 mons 122 days 02:39:58.899533':::INTERVAL),
						(273500434:::OID, '-36 years -1 mons -589 days -05:37:23.509145':::INTERVAL),
						(COALESCE(1201770104:::OID, 2417104593:::OID), '00:00:00':::INTERVAL),
						(1137693716:::OID, '39 years 1 mon 934 days 15:59:07.738533':::INTERVAL),
						(
							1620766748:::OID,
							CASE
							WHEN (NULL AND (NULL ~ e'F%2\x0b\x054]+':::STRING))
							THEN '-53 years -3 mons -56 days -24:03:48.522832':::INTERVAL
							ELSE '-62 years -2 mons -270 days -06:52:04.642991':::INTERVAL
							END
						)
				)
					AS tab_937 (col_2400, col_2401)
		)
SELECT
	NULL AS col_2402
FROM
	defaultdb.public.seed@[0] AS tab_938
WHERE
	tab_938._string ~ tab_938._string
ORDER BY
	tab_938._interval ASC;

SELECT
	'1970-01-03 01:21:33.000148+00:00':::TIMESTAMPTZ AS col_2403,
	tab_939._interval AS col_2404,
	tab_939._float8 AS col_2405,
	tab_939._int4 AS col_2406,
	('c351:5030:de46:7820:2ec:f491:b856:ff2/27':::INET::INET - tab_939._int2::INT8)::INET AS col_2407,
	'1977-10-12':::DATE AS col_2408,
	tab_939._int8 AS col_2409
FROM
	defaultdb.public.seed@[0] AS tab_939
WHERE
	true;

INSERT
INTO
	defaultdb.public.seed AS tab_940 (_float8, _timestamptz, _interval, _bool, _string, _inet, _jsonb)
WITH
	with_350 (col_2410)
		AS (SELECT * FROM (VALUES (COALESCE(2230030294:::OID, 3081921090:::OID)), (NULL)) AS tab_941 (col_2410)),
	with_351 (col_2411) AS (SELECT * FROM (VALUES (1450286880:::OID), (3370637594:::OID)) AS tab_942 (col_2411))
SELECT
	tab_943._float8 AS col_2412,
	'1970-01-10 09:29:25.000392+00:00':::TIMESTAMPTZ AS col_2413,
	NULL AS col_2414,
	tab_943._bool AS col_2415,
	tab_943._string AS col_2416,
	tab_943._inet AS col_2417,
	NULL AS col_2418
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_943
WHERE
	tab_943._bool
ORDER BY
	tab_943._date ASC, tab_943._float8, tab_943._int8 DESC
LIMIT
	48:::INT8;

SELECT tab_944._int8 AS col_2419 FROM defaultdb.public.seed@[0] AS tab_944 WHERE true LIMIT 37:::INT8;

WITH
	with_352 (col_2420, col_2421)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('39 years 11 mons 67 days 07:14:55.821503':::INTERVAL, NULL),
						('-5 years -6 mons -33 days -22:43:20.345577':::INTERVAL, (-1716103269874816945):::INT8)
				)
					AS tab_945 (col_2420, col_2421)
			INTERSECT ALL
				SELECT
					*
				FROM
					(
						VALUES
							('-19 years -7 mons -78 days -23:34:49.623411':::INTERVAL, (-4566800783569390805):::INT8),
							('54 years 310 days 03:39:49.172849':::INTERVAL, 2287972000796164731:::INT8),
							(NULL, NULL),
							('-41 years -6 mons -406 days -07:03:50.049236':::INTERVAL, (-8158349873941161519):::INT8)
					)
						AS tab_946 (col_2422, col_2423)
		)
SELECT
	(-1588540618660951708):::INT8 AS col_2424
FROM
	with_352 AS cte_ref_113
WHERE
	NULL
LIMIT
	11:::INT8;

UPDATE
	defaultdb.public.seed AS tab_947
SET
	_bool = tab_947._bool
WHERE
	tab_947._bool
ORDER BY
	tab_947._timestamptz
LIMIT
	88:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_948 (_int2, _float4, _date, _timestamptz, _interval, _decimal, _string, _inet, _jsonb)
SELECT
	17949:::INT8 AS col_2425,
	tab_949._float4 AS col_2426,
	'1990-06-08':::DATE AS col_2427,
	tab_949._timestamptz AS col_2428,
	tab_949._interval AS col_2429,
	tab_949._decimal AS col_2430,
	tab_949._string AS col_2431,
	'17.180.198.20/7':::INET AS col_2432,
	'0.20305090263883613':::JSONB AS col_2433
FROM
	defaultdb.public.seed@[0] AS tab_949
WHERE
	true
ORDER BY
	tab_949._float4 ASC
LIMIT
	54:::INT8;

SELECT
	count(*) AS col_2434
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_950
WHERE
	true
GROUP BY
	tab_950._jsonb
HAVING
	like_escape(NULL::STRING, e'\x00':::STRING::STRING, NULL::STRING)::BOOL
LIMIT
	1:::INT8;

SELECT
	tab_953._jsonb AS col_2451, tab_953._float8 AS col_2452
FROM
	defaultdb.public.seed@[0] AS tab_953
ORDER BY
	tab_953._decimal
LIMIT
	63:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_954
SELECT
	7968:::INT8 AS col_2453,
	NULL AS col_2454,
	7581438922375550898:::INT8 AS col_2455,
	NULL AS col_2456,
	(-0.17056438039550448):::FLOAT8 AS col_2457,
	tab_955._date AS col_2458,
	tab_955._timestamp AS col_2459,
	NULL AS col_2460,
	tab_955._interval AS col_2461,
	tab_955._bool AS col_2462,
	tab_955._decimal AS col_2463,
	tab_955._string AS col_2464,
	tab_955._bytes AS col_2465,
	'db91fb76-88d7-496b-9cf1-2f20ac247a6d':::UUID AS col_2466,
	NULL AS col_2467,
	tab_955._jsonb AS col_2468
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_955
LIMIT
	42:::INT8;

WITH
	with_353 (col_2469)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), (1073066972:::OID), (767436218:::OID), (2962688238:::OID), (NULL)) AS tab_956 (col_2469)
		),
	with_354 (col_2470)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('3000-01-01 00:00:00+00:00':::TIMESTAMPTZ),
						('1970-01-02 11:49:51.000313+00:00':::TIMESTAMPTZ),
						(current_timestamp():::TIMESTAMPTZ::TIMESTAMPTZ)
				)
					AS tab_957 (col_2470)
		),
	with_355 (col_2471)
		AS (
			SELECT * FROM (VALUES ((-0.9721607596431132):::FLOAT8)) AS tab_958 (col_2471)
			EXCEPT
				SELECT
					*
				FROM
					(
						VALUES
							(0.31324494493374544:::FLOAT8),
							(
								(
									SELECT
										tab_959._float8 AS col_2472
									FROM
										defaultdb.public.seed@seed__int8__float8__date_idx AS tab_959
									WHERE
										tab_959._bool
									LIMIT
										1:::INT8
								)
							),
							(NULL)
					)
						AS tab_960 (col_2473)
		)
SELECT
	0.03995130993446460545:::DECIMAL AS col_2474
FROM
	defaultdb.public.seed@[0] AS tab_961
WHERE
	false
ORDER BY
	tab_961._bytes
LIMIT
	70:::INT8;

SELECT
	'1994-04-22':::DATE AS col_2475, '1970-07-31':::DATE AS col_2476
FROM
	defaultdb.public.seed AS tab_962
	JOIN defaultdb.public.seed AS tab_963 ON
			(tab_962._int8) = (tab_963._int8)
			AND (tab_962._float8) = (tab_963._float8)
			AND (tab_962._date) = (tab_963._date)
WHERE
	false
LIMIT
	90:::INT8;

SELECT
	e':\x7f\\?=pa\x01o':::STRING AS col_2477,
	5065:::INT8 AS col_2478,
	'72d56367-b65a-437d-bfd8-a3f50eb0cedd':::UUID AS col_2479,
	tab_964._int4 AS col_2480,
	tab_964._interval AS col_2481,
	(-0.5793972611427307):::FLOAT8 AS col_2482,
	'1997-02-23':::DATE AS col_2483,
	true AS col_2484,
	(-0.9232176752812862):::FLOAT8 AS col_2485,
	'\x83c8f4ea374880e3':::BYTES AS col_2486,
	6.478820732365437998E+32:::DECIMAL AS col_2487
FROM
	defaultdb.public.seed@[0] AS tab_964
WHERE
	tab_964._bool
ORDER BY
	tab_964._uuid DESC, tab_964._int2 DESC, tab_964._timestamptz ASC
LIMIT
	49:::INT8;

SELECT
	'44 years 5 mons 802 days 24:37:55.367192':::INTERVAL AS col_2488,
	tab_965._int4 AS col_2489,
	tab_965._bytes AS col_2490,
	tab_965._uuid AS col_2491,
	tab_965._string AS col_2492,
	0.4077345132827759:::FLOAT8 AS col_2493
FROM
	defaultdb.public.seed@[0] AS tab_965
LIMIT
	19:::INT8;

WITH
	with_356 (col_2494) AS (SELECT * FROM (VALUES (NULL), (3560089995:::OID)) AS tab_966 (col_2494)),
	with_357 (col_2495) AS (SELECT * FROM (VALUES (NULL)) AS tab_967 (col_2495))
SELECT
	cte_ref_114.col_2495 AS col_2496
FROM
	with_357 AS cte_ref_114
LIMIT
	57:::INT8;

UPDATE
	defaultdb.public.seed AS tab_968
SET
	_bool = (tab_968._inet::INET >> tab_968._inet::INET)::BOOL, _int4 = tab_968._int4, _int8 = 127:::INT8
LIMIT
	18:::INT8;

SELECT
	tab_969._timestamptz AS col_2497,
	tab_969._bytes AS col_2498,
	(-1862634):::INT8 AS col_2499,
	tab_969._jsonb AS col_2500,
	true AS col_2501,
	tab_969._timestamp AS col_2502,
	tab_969._date AS col_2503
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_969
WHERE
	false
ORDER BY
	tab_969._decimal DESC
LIMIT
	75:::INT8;

WITH
	with_358 (col_2504)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(B'00110010011010'),
						(
							CASE
							WHEN true THEN B'0000000000000000000000000000000000000000000000000000000000000000'
							ELSE NULL
							END
						),
						(B'11111110010000'),
						(NULL)
				)
					AS tab_970 (col_2504)
		)
SELECT
	'f26d3192-1f64-4793-815b-1a3902c197c3':::UUID AS col_2505, tab_971._float8 AS col_2506
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_971
LIMIT
	13:::INT8;

SELECT
	true AS col_2507
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_972
ORDER BY
	tab_972._inet, tab_972._int2 DESC, tab_972._uuid, tab_972._uuid ASC
LIMIT
	22:::INT8;

WITH
	with_359 (col_2508, col_2509, col_2510)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[2083088939:::OID,4025905901:::OID], NULL, e'\n2EP-c':::STRING:::NAME),
						(ARRAY[956739312:::OID,0:::OID], NULL, e':Vah5=\x05>m':::STRING:::NAME),
						(ARRAY[]:::OID[], '\x1f6d6b':::BYTES, NULL),
						(
							ARRAY[382957894:::OID,3408879531:::OID,3842858203:::OID],
							'\x8934620124aa35cf':::BYTES,
							e'd\x14e\x0b\x14.':::STRING:::NAME
						),
						(ARRAY[1951694254:::OID], '\x8e8a22bf20':::BYTES, e'A\x05':::STRING:::NAME)
				)
					AS tab_973 (col_2508, col_2509, col_2510)
		),
	with_360 (col_2511) AS (SELECT * FROM (VALUES (NULL), (143643007:::OID), (1595318512:::OID)) AS tab_974 (col_2511))
SELECT
	1410323914:::OID AS col_2512
FROM
	with_360 AS cte_ref_115
WHERE
	true;

SELECT
	count(*) AS col_2513
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_975
WHERE
	false
GROUP BY
	tab_975._jsonb
HAVING
	inet_same_family(('ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET::INET & '85da:1ea9:aa07:973c:3190:367:9ec4:1dcb/84':::INET::INET)::INET::INET, '6630:3242:2e52:8935:f582:3ad3:251c:3ef1/41':::INET::INET)::BOOL;

UPDATE
	defaultdb.public.seed AS tab_976
SET
	_bool = false, _int2 = 11276:::INT8, _decimal = tab_976._decimal
WHERE
	tab_976._bool;

SELECT
	tab_977._int8 AS col_2514, 'NaN':::FLOAT8 AS col_2515
FROM
	defaultdb.public.seed@[0] AS tab_977
ORDER BY
	tab_977._int2 DESC, tab_977._timestamp, tab_977._bytes ASC
LIMIT
	32:::INT8;

UPDATE
	defaultdb.public.seed AS tab_985
SET
	_bool = tab_985._bool
WHERE
	e'2\x07\x1a2`\x12\x1az_':::STRING ~* tab_985._string
ORDER BY
	tab_985._timestamp ASC
LIMIT
	64:::INT8;

UPDATE defaultdb.public.seed AS tab_986 SET _inet = tab_986._inet;

INSERT
INTO
	defaultdb.public.seed AS tab_988
		(_int2, _int4, _int8, _float4, _date, _timestamp, _timestamptz, _bytes, _uuid, _jsonb)
SELECT
	(-21446):::INT8 AS col_2524,
	(-121737065):::INT8 AS col_2525,
	(
		SELECT
			family('3.138.72.87/4':::INET::INET)::INT8 AS col_2526
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_991
		ORDER BY
			tab_991._int4 DESC,
			tab_991._inet DESC,
			tab_991._timestamptz ASC,
			tab_991._bytes ASC,
			tab_991._bytes ASC,
			tab_991._float8 DESC
		LIMIT
			1:::INT8
	)
		AS col_2527,
	(-0.6126556992530823):::FLOAT8 AS col_2528,
	(
		WITH
			with_364 (col_2529)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								('72 years 7 mons 83 days 24:05:51.734487':::INTERVAL),
								('-44 years -869 days -21:40:34.50909':::INTERVAL),
								('-7 years -8 mons -353 days -12:55:33.898191':::INTERVAL),
								('55 years 11 mons 780 days 09:29:42.534088':::INTERVAL)
						)
							AS tab_992 (col_2529)
				)
		SELECT
			'1984-02-10':::DATE AS col_2530
		FROM
			defaultdb.public.seed@[0] AS tab_993,
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_994,
			defaultdb.public.seed@[0] AS tab_995
		ORDER BY
			tab_995._int2
		LIMIT
			1:::INT8
	)
		AS col_2531,
	'1970-01-08 22:47:51.000065+00:00':::TIMESTAMP AS col_2532,
	'-2000-01-01 00:00:00+00:00':::TIMESTAMPTZ AS col_2533,
	'\x31ea8178309a':::BYTES AS col_2534,
	crdb_internal.cluster_id()::UUID AS col_2535,
	'2.391395878293943':::JSONB AS col_2536
FROM
	defaultdb.public.seed AS tab_989 JOIN defaultdb.public.seed AS tab_990 ON (tab_989._int8) = (tab_990._int8)
WHERE
	NULL
ORDER BY
	tab_990._date DESC;

SELECT
	tab_996._float8 AS col_2537,
	transaction_timestamp():::TIMESTAMPTZ::TIMESTAMPTZ AS col_2538,
	e'[[{"*T&sQ4s": {"][EPr9h%&90": false}, "+&0A(6~)wnD": {"(X;P,teK6": null, "v1GLOt;hKoq": {"b": {}, "foo": {}}}, ":scjj&PnBj": true}, true, {}], {"\\\\uGygV": {"5CoQ": []}}]':::JSONB
		AS col_2539
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_996;

INSERT
INTO
	defaultdb.public.seed AS tab_997
SELECT
	tab_999._int4 AS col_2540,
	tab_999._int8 AS col_2541,
	tab_999._int8 AS col_2542,
	tab_999._float8 AS col_2543,
	tab_998._float4 AS col_2544,
	tab_999._date AS col_2545,
	NULL AS col_2546,
	'1970-01-11 11:54:45.000115+00:00':::TIMESTAMPTZ AS col_2547,
	tab_999._interval AS col_2548,
	true AS col_2549,
	tab_998._decimal AS col_2550,
	'Nj':::STRING AS col_2551,
	tab_999._bytes AS col_2552,
	'f787be1f-0f4f-403c-9ca1-148283abc2dd':::UUID AS col_2553,
	tab_999._inet AS col_2554,
	jsonb_object(ARRAY[e'\x1b40}\x7fP\t^':::STRING,'':::STRING,'':::STRING,e'<H\f\x17 h\x1c':::STRING]::STRING[])::JSONB
		AS col_2555
FROM
	defaultdb.public.seed@[0] AS tab_998, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_999
WHERE
	tab_998._bool
ORDER BY
	tab_999._float8 DESC
LIMIT
	59:::INT8;

SELECT
	tab_1001._date AS col_2556,
	'1974-07-11':::DATE AS col_2557,
	'5874897-12-31':::DATE AS col_2558,
	tab_1001._date AS col_2559,
	'1991-11-01':::DATE AS col_2560
FROM
	defaultdb.public.seed AS tab_1000 JOIN defaultdb.public.seed AS tab_1001 ON (tab_1000._int8) = (tab_1001._int8)
WHERE
	true
ORDER BY
	tab_1001._date;

WITH
	with_365 (col_2561)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(ARRAY[2610384171:::OID,2301687706:::OID,2325353678:::OID]::OID[] || 2923709481:::OID::OID)::OID[]
						),
						(ARRAY[]:::OID[]),
						(ARRAY[218332906:::OID])
				)
					AS tab_1002 (col_2561)
		)
SELECT
	(-5679293653159757552):::INT8 AS col_2562
LIMIT
	46:::INT8;

SELECT '65.97.206.169/31':::INET AS col_2563;

SELECT
	'1982-05-29':::DATE AS col_2564, tab_1004._date AS col_2565, tab_1004._date AS col_2566, tab_1003._date AS col_2567
FROM
	defaultdb.public.seed AS tab_1003
	JOIN defaultdb.public.seed AS tab_1004 ON
			(tab_1003._int8) = (tab_1004._int8) AND (tab_1003._float8) = (tab_1004._float8);

UPDATE
	defaultdb.public.seed AS tab_1005
SET
	_int8 = 5360311487211575844:::INT8
WHERE
	EXISTS(
		SELECT true AS col_2568 FROM defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1006 WHERE tab_1006._bool
	)
LIMIT
	99:::INT8;

SELECT
	'a5ff:a7e7:e5cf:7a70:474:d86a:7368:95b/112':::INET AS col_2569, NULL AS col_2570
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1007
WHERE
	NULL
LIMIT
	97:::INT8;

WITH
	with_366 (col_2571)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1241634262:::OID),
						(CASE WHEN NULL THEN 472094416:::OID ELSE NULL END),
						(4204112513:::OID),
						(3011398872:::OID)
				)
					AS tab_1008 (col_2571)
		)
SELECT
	cte_ref_117.col_2571 AS col_2572
FROM
	with_366 AS cte_ref_117
LIMIT
	68:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1009 (_int8, _float8, _timestamptz, _bool, _string, _bytes, _inet)
WITH
	with_367 (col_2573, col_2574)
		AS (SELECT * FROM (VALUES (703038587:::OID, e'4K\x14\b]x\x16':::STRING)) AS tab_1010 (col_2573, col_2574))
SELECT
	(-3228090457638268910):::INT8 AS col_2575,
	tab_1013._float8 AS col_2576,
	'1970-01-05 01:44:57.000645+00:00':::TIMESTAMPTZ AS col_2577,
	tab_1013._bool AS col_2578,
	e'!o_(AA.\n':::STRING AS col_2579,
	tab_1013._bytes AS col_2580,
	tab_1013._inet AS col_2581
FROM
	defaultdb.public.seed AS tab_1011
	JOIN defaultdb.public.seed AS tab_1012 ON (tab_1011._jsonb) = (tab_1012._jsonb),
	defaultdb.public.seed@[0] AS tab_1013
WHERE
	true
LIMIT
	22:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1014
SELECT
	(-9544):::INT8 AS col_2582,
	762315615:::INT8 AS col_2583,
	1:::INT8 AS col_2584,
	CASE
	WHEN NULL
	THEN (
		SELECT
			tab_1015._float8 AS col_2585
		FROM
			defaultdb.public.seed@[0] AS tab_1015
		ORDER BY
			tab_1015._int2, tab_1015._bool DESC
		LIMIT
			1:::INT8
	)
	ELSE 0.38093897700309753:::FLOAT8
	END
		AS col_2586,
	cot((-0.09813461824807557):::FLOAT8::FLOAT8)::FLOAT8 AS col_2587,
	NULL AS col_2588,
	'0001-01-01 00:00:00+00:00':::TIMESTAMP AS col_2589,
	'1970-01-10 20:51:01.000915+00:00':::TIMESTAMPTZ AS col_2590,
	(
		SELECT
			tab_1016._interval AS col_2591
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1016
		ORDER BY
			tab_1016._bytes DESC
		LIMIT
			1:::INT8
	)
		AS col_2592,
	true AS col_2593,
	(-1878399808696467.976):::DECIMAL AS col_2594,
	e'1p\x14>\x13h':::STRING AS col_2595,
	('\xec8b':::BYTES::BYTES || NULL::BYTES)::BYTES AS col_2596,
	'f619e9c4-ab79-4dd2-b853-8486a66804ae':::UUID AS col_2597,
	'e305:4e5c:c196:618b:1b67:71a0:3e17:3070/11':::INET AS col_2598,
	NULL AS col_2599
LIMIT
	39:::INT8;

SELECT 3407368908:::OID AS col_2603 LIMIT 14:::INT8;

SELECT
	tab_1018._uuid AS col_2604,
	tab_1018._date AS col_2605,
	tab_1018._float8 AS col_2606,
	tab_1018._timestamp AS col_2607
FROM
	defaultdb.public.seed@[0] AS tab_1018
WHERE
	tab_1018._bool
LIMIT
	52:::INT8;

SELECT
	(-1135281627):::INT8 AS col_2608,
	e'[[{}], {}, [[false], ["b", false, false]], {"a": {"9?FT2mw": []}, "b": "\\\\jERGQ$yvF2"}]':::JSONB AS col_2609,
	tab_1019._float8 AS col_2610,
	tab_1020._string AS col_2611,
	tab_1020._int2 AS col_2612,
	17596:::INT8 AS col_2613,
	'1979-09-23':::DATE AS col_2614,
	tab_1020._float8 AS col_2615,
	tab_1020._timestamptz AS col_2616,
	'\xf272624a':::BYTES AS col_2617,
	tab_1020._string AS col_2618,
	NULL AS col_2619,
	('[{"Z<$": {"b": {"%I(O?yyw": [], "b": {}}, "c": {"Zd^IHR3`~0T": "foo", "baz": []}}, "b": {"bar": 0.20350582105929216, "})qE[dxiu": true}}, [null, true], {"HP2Uy{ZaF": {}, "b": {}, "bar": false}]':::JSONB::JSONB - ARRAY[e'\'':::STRING,e'#/\b\x12p ^i':::STRING,e'\U00002603':::STRING,e'\x03':::STRING,e'E3zP#/\x02':::STRING]::STRING[])::JSONB
		AS col_2620,
	'1970-01-01 04:55:44.000437+00:00':::TIMESTAMP AS col_2621,
	'60 years 4 mons 644 days 23:15:28.8211':::INTERVAL AS col_2622,
	'-77 years -9 mons -371 days -23:52:45.3895':::INTERVAL AS col_2623,
	'\x36b13d81fd8165':::BYTES AS col_2624,
	tab_1020._float8 AS col_2625,
	tab_1019._inet AS col_2626,
	'c190ad3e-e64e-45c1-bada-44d887d83491':::UUID AS col_2627,
	(-2340.379620034691948):::DECIMAL AS col_2628
FROM
	defaultdb.public.seed@[0] AS tab_1019, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1020
WHERE
	true
ORDER BY
	tab_1020._inet, tab_1019._uuid ASC, tab_1020._interval, tab_1020._inet, tab_1020._int4 ASC
LIMIT
	94:::INT8;

SELECT
	950280226:::INT8 AS col_2629,
	tab_1021._timestamptz AS col_2630,
	tab_1021._int2 AS col_2631,
	tab_1021._int4 AS col_2632,
	tab_1021._float4 AS col_2633,
	tab_1021._jsonb AS col_2634
FROM
	defaultdb.public.seed@[0] AS tab_1021
WHERE
	tab_1021._bool
LIMIT
	45:::INT8;

SELECT
	tab_1022._decimal AS col_2635,
	NULL AS col_2636,
	(-10654):::INT8 AS col_2637,
	date_trunc(NULL::STRING, tab_1022._date::DATE)::TIMESTAMPTZ AS col_2638,
	e'.\x12`Z\x1cS':::STRING AS col_2639,
	tab_1022._uuid AS col_2640,
	'\x2e32':::BYTES AS col_2641,
	tab_1022._float8 AS col_2642,
	tab_1022._inet AS col_2643,
	e'{"C%5NP": {"N\'uQ_i": [[], {}], "a": false, "gFxazn:Q!U": {}}, "Iq3I1V#nxvv": null, "a": [], "b": null, "foo": {"@MB03>lnpB": "O?%_Oq", "uZ5;tcIE~aj": [true]}, "tHl": {"b": true}}':::JSONB
		AS col_2644,
	'1970-01-06 18:19:56.000633+00:00':::TIMESTAMP AS col_2645,
	true AS col_2646,
	'39 years 1 mon 710 days 11:47:24.922227':::INTERVAL AS col_2647,
	2100328435081991006:::INT8 AS col_2648,
	tab_1022._float8 AS col_2649,
	tab_1022._date AS col_2650
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1022
LIMIT
	6:::INT8;

WITH
	with_372 (col_2659)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(NULL),
						(
							(
								WITH
									with_369 (col_2651)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														('-48 years -10 mons -791 days -14:54:34.893291':::INTERVAL),
														(NULL),
														(
															age('1970-01-04 17:48:35.000994+00:00':::TIMESTAMPTZ::TIMESTAMPTZ, '1970-01-04 15:44:45.000821+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL
														),
														('-15 years -1 mons -523 days -20:35:30.229187':::INTERVAL)
												)
													AS tab_1023 (col_2651)
										),
									with_370 (col_2652)
										AS (
											SELECT * FROM (VALUES (3707387309:::OID), (0:::OID)) AS tab_1024 (col_2652)
											UNION
												SELECT
													*
												FROM
													(
														VALUES
															(2208019478:::OID),
															(3592739789:::OID),
															(1288677178:::OID),
															(879603441:::OID),
															(NULL)
													)
														AS tab_1025 (col_2653)
										)
								SELECT
									'\x63a2dede':::BYTES AS col_2658
								FROM
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1026
									JOIN (
											WITH
												with_371 (col_2654)
													AS (
														SELECT
															*
														FROM
															(
																VALUES
																	((-0.08517560482109832):::FLOAT8),
																	((-0.4105162760745876):::FLOAT8)
															)
																AS tab_1027 (col_2654)
														UNION ALL
															SELECT
																*
															FROM
																(
																	VALUES
																		((-0.8106461505451288):::FLOAT8),
																		(0.40599882279676025:::FLOAT8)
																)
																	AS tab_1028 (col_2655)
													)
											SELECT
												count(*) AS col_2656
											FROM
												defaultdb.public.seed@[0] AS tab_1029
											GROUP BY
												tab_1029._int8, tab_1029._float8, tab_1029._date
											ORDER BY
												tab_1029._int8 DESC
											LIMIT
												5:::INT8
										)
											AS tab_1030 (col_2657) ON (tab_1026._int8) = (tab_1030.col_2657)
								ORDER BY
									tab_1026._uuid,
									tab_1030.col_2657 DESC,
									tab_1026._timestamp DESC,
									tab_1026._bool DESC
								LIMIT
									1:::INT8
							)
						)
				)
					AS tab_1031 (col_2659)
		)
SELECT
	'00:00:00+15:59:00':::TIMETZ AS col_2660;

DELETE FROM defaultdb.public.seed AS tab_1033 ORDER BY tab_1033._uuid ASC LIMIT 43:::INT8;

WITH
	with_373 (col_2677)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							ARRAY[(-18062):::INT8,(-3343):::INT8,(-12981):::INT8,(-15369):::INT8,23208:::INT8,(-22900):::INT8]
						),
						(ARRAY[1:::INT8,0:::INT8,(-3807):::INT8]),
						(NULL),
						(
							ARRAY[(-19295):::INT8,7496:::INT8,22556:::INT8,0:::INT8,15444:::INT8,(-10794):::INT8,10411:::INT8,(-27008):::INT8]
						),
						(ARRAY[0:::INT8,7415:::INT8,26133:::INT8]),
						(ARRAY[(-30548):::INT8])
				)
					AS tab_1034 (col_2677)
		)
SELECT
	tab_1035._int2 AS col_2678, (-20968):::INT8 AS col_2679
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1035
LIMIT
	69:::INT8;

WITH
	with_377 (col_2684, col_2685)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(4222648111:::OID, 'K,':::STRING),
						(2170755009:::OID, NULL),
						(3193986851:::OID, ')2W]/>':::STRING),
						(2798932988:::OID, NULL),
						(
							(
								WITH
									with_374 (col_2680)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														('01:56:55.093223':::TIME),
														('03:07:54.944045':::TIME),
														('11:28:28.652002':::TIME),
														('18:46:58.157892':::TIME),
														('18:51:12.397096':::TIME),
														(
															(age(NULL::TIMESTAMPTZ, date_trunc(e'\x19D|z\r!N':::STRING::STRING, '1989-05-30':::DATE::DATE)::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL::INTERVAL + NULL::TIME)::TIME
														)
												)
													AS tab_1036 (col_2680)
										),
									with_375 (col_2681)
										AS (
											SELECT
												DISTINCT
												(tab_1037._decimal::DECIMAL ^ NULL::DECIMAL)::DECIMAL AS col_2681
											FROM
												defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1037
											WHERE
												true
										),
									with_376 (col_2682)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(
															(e'{"baz": [[{}], []], "c": [null, {"7qB[]zHY": 1.4176790984407877, "foo": "oTb}b&"}, []], "zKl&": {"$#\\\\]t(\\\\q7Q": []}}':::JSONB::JSONB->>e'S.$&\tW':::STRING::STRING)::STRING
														),
														(e'/Z\x03<;\'r9':::STRING),
														(e'yu\x19VM-':::STRING),
														(e'\'':::STRING),
														(NULL)
												)
													AS tab_1038 (col_2682)
										)
								SELECT
									1303391887:::OID AS col_2683
								FROM
									with_376 AS cte_ref_119,
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1039
									JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1040 ON
											(tab_1039._int8) = (tab_1040._int2)
											AND (tab_1039._jsonb) = (tab_1040._jsonb)
								WHERE
									tab_1040._bool
								LIMIT
									1:::INT8
							),
							'g':::STRING
						)
				)
					AS tab_1041 (col_2684, col_2685)
		)
SELECT
	((2147483647:::INT8,), ARRAY['db499a2d-66ba-4d62-aa62-bb73a913bca1':::UUID,'817a2778-866b-4768-9b65-177de2e8f3c4':::UUID,'ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID], 2337356636:::OID)
		AS col_2686,
	('f':::STRING, 3996688764:::OID, 2087872568:::OID, NULL) AS col_2687
LIMIT
	71:::INT8;

SELECT
	count(*) AS col_2688
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1042
WHERE
	true
GROUP BY
	tab_1042._int8, tab_1042._float8
HAVING
	inet_same_family('59.199.250.128/26':::INET::INET, NULL::INET)::BOOL
LIMIT
	43:::INT8;

WITH
	with_378 (col_2689)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('03:10:47.832474':::TIME),
						(current_time():::TIME::TIME),
						(NULL),
						('18:08:58.0342':::TIME),
						(localtime():::TIME::TIME),
						('00:00:00':::TIME)
				)
					AS tab_1043 (col_2689)
		),
	with_379 (col_2692)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(2571736851:::OID),
						(NULL),
						(
							(
								SELECT
									(
										SELECT
											3498044109:::OID AS col_2690
										FROM
											defaultdb.public.seed@[0] AS tab_1045
										LIMIT
											1:::INT8
									)
										AS col_2691
								FROM
									defaultdb.public.seed@[0] AS tab_1044
								WHERE
									tab_1044._bool
								ORDER BY
									tab_1044._uuid ASC, tab_1044._date
								LIMIT
									1:::INT8
							)
						)
				)
					AS tab_1046 (col_2692)
		)
SELECT
	'1996-11-25':::DATE AS col_2693
FROM
	defaultdb.public.seed@[0] AS tab_1047
LIMIT
	85:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1048
WITH
	with_380 (col_2694)
		AS (SELECT * FROM (VALUES (NULL), (NULL), (2766034143:::OID), (1709296909:::OID)) AS tab_1049 (col_2694)),
	with_381 (col_2695, col_2696)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							COALESCE(
								ARRAY[1808328257:::OID,3386775747:::OID],
								ARRAY[1108980980:::OID,182684053:::OID,1995672101:::OID]
							),
							'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET
						),
						(ARRAY[1351523965:::OID], '225.190.185.67/28':::INET),
						(
							ARRAY[4207107590:::OID],
							hostmask('dc1b:ffc5:e6f7:b1e6:e8e7:6c19:dfdd:168f/46':::INET::INET)::INET
						)
				)
					AS tab_1050 (col_2695, col_2696)
		)
SELECT
	(-9234):::INT8 AS col_2697,
	2028837743:::INT8 AS col_2698,
	(-9008557634057475392):::INT8 AS col_2699,
	(-1.4082165956497192):::FLOAT8 AS col_2700,
	NULL AS col_2701,
	('1973-08-26':::DATE::DATE + (NULL::INT8 | (-1831507226537586876):::INT8::INT8)::INT8::INT8)::DATE AS col_2702,
	'1970-01-04 15:37:52.00056+00:00':::TIMESTAMP AS col_2703,
	'1970-01-01 12:46:58.000437+00:00':::TIMESTAMPTZ AS col_2704,
	'11 years 4 mons 548 days 04:33:25.813063':::INTERVAL AS col_2705,
	false AS col_2706,
	'Infinity':::DECIMAL AS col_2707,
	e'\x1f\r[w':::STRING AS col_2708,
	(NULL::BYTES || '\x':::BYTES::BYTES)::BYTES AS col_2709,
	(
		WITH
			with_382 (col_2710)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								('3000-01-01 00:00:00+00:00':::TIMESTAMPTZ),
								('1970-01-05 20:14:42.000086+00:00':::TIMESTAMPTZ),
								('1970-01-03 08:46:47.000925+00:00':::TIMESTAMPTZ),
								(NULL)
						)
							AS tab_1051 (col_2710)
				),
			with_383 (col_2711)
				AS (
					SELECT
						*
					FROM
						(VALUES (4087746007:::OID), (3681228339:::OID), (1285936636:::OID), (1379317796:::OID))
							AS tab_1052 (col_2711)
				)
		SELECT
			'08bbd113-3779-4c0e-af47-986a0b501348':::UUID AS col_2712
		FROM
			defaultdb.public.seed AS tab_1053
			JOIN defaultdb.public.seed AS tab_1054 ON (tab_1053._int8) = (tab_1054._int8)
		WHERE
			NULL
		LIMIT
			1:::INT8
	)
		AS col_2713,
	'34.203.35.143/2':::INET AS col_2714,
	NULL AS col_2715
FROM
	with_380 AS cte_ref_120, with_380 AS cte_ref_121
ORDER BY
	cte_ref_121.col_2694;

WITH
	with_384 (col_2716, col_2717)
		AS (
			SELECT
				*
			FROM
				(VALUES (B'01011111000101111110101100010111011001', e'\x158-G\x02$S':::STRING))
					AS tab_1055 (col_2716, col_2717)
			EXCEPT
				SELECT
					*
				FROM
					(
						VALUES
							(NULL, NULL),
							(B'11110001011111010101110111011011000011', e'#\x06MvB':::STRING),
							(B'01001110110101011110000011111110001000', NULL),
							(B'00101010111010100001000101000011101000', NULL)
					)
						AS tab_1056 (col_2718, col_2719)
		)
SELECT
	423017113808768694:::INT8 AS col_2720, tab_1057._jsonb AS col_2721
FROM
	defaultdb.public.seed@[0] AS tab_1057
WHERE
	tab_1057._bool
ORDER BY
	tab_1057._float4;

INSERT
INTO
	defaultdb.public.seed AS tab_1058
		(_int2, _int8, _float4, _float8, _date, _timestamp, _interval, _bool, _decimal, _string, _bytes)
SELECT
	13941:::INT8 AS col_2722,
	NULL AS col_2723,
	(-1.1936076879501343):::FLOAT8 AS col_2724,
	(-0.06508352176810517):::FLOAT8 AS col_2725,
	tab_1059._date AS col_2726,
	tab_1059._timestamp AS col_2727,
	tab_1059._interval AS col_2728,
	false AS col_2729,
	NULL AS col_2730,
	e'\rtDV\x10':::STRING AS col_2731,
	tab_1059._bytes AS col_2732
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1059
WHERE
	tab_1059._bool
ORDER BY
	tab_1059._decimal
LIMIT
	81:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1060
SET
	_date
		= (
			WITH
				with_385 (col_2734)
					AS (
						SELECT
							*
						FROM
							(
								VALUES
									(B'0000010111000100'),
									(B'1111111111010000'),
									(B'1010100101111000'),
									(
										(
											SELECT
												B'1100100111100101' AS col_2733
											FROM
												defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1061
											ORDER BY
												tab_1061._float8
											LIMIT
												1:::INT8
										)
									),
									(B'1010000011100010'),
									(B'1000111111101010')
							)
								AS tab_1062 (col_2734)
					)
			SELECT
				tab_1060._date AS col_2735
			FROM
				with_385 AS cte_ref_122
			WHERE
				true
			ORDER BY
				cte_ref_122.col_2734
			LIMIT
				1:::INT8
		);

SELECT
	e'\x1fz\x05k!C':::STRING AS col_2736, (-4.103194135068089078E+32):::DECIMAL AS col_2737
FROM
	defaultdb.public.seed@[0] AS tab_1063
LIMIT
	42:::INT8;

WITH
	with_386 (col_2738)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'C\x17`B\x11':::STRING),
						(e'\x15\bf>C':::STRING),
						('@}':::STRING),
						('X':::STRING),
						(e'rX\b\x05':::STRING),
						(':':::STRING)
				)
					AS tab_1064 (col_2738)
		)
SELECT
	'53 years 4 mons 603 days 16:53:46.380785':::INTERVAL AS col_2739
LIMIT
	9:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1065
SET
	_float8 = tab_1065._float4, _uuid = tab_1065._uuid
WHERE
	true
ORDER BY
	tab_1065._int8, tab_1065._bool ASC, tab_1065._decimal
LIMIT
	13:::INT8;

SELECT
	(-28110):::INT8 AS col_2740, tab_1066._timestamp AS col_2741, false AS col_2742
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1066
WHERE
	tab_1066._bool;

WITH
	with_387 (col_2743)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[(-17392):::INT8]),
						(
							ARRAY[(-12568):::INT8,(-32510):::INT8,127:::INT8,(-25066):::INT8,(-15252):::INT8,(-17609):::INT8,20046:::INT8]
						),
						(ARRAY[25444:::INT8,29842:::INT8,1:::INT8]),
						(ARRAY[20126:::INT8,12706:::INT8,27795:::INT8]),
						(ARRAY[12216:::INT8,24069:::INT8,(-4743):::INT8])
				)
					AS tab_1067 (col_2743)
		)
SELECT
	NULL AS col_2744
FROM
	with_387 AS cte_ref_123;

UPDATE
	defaultdb.public.seed AS tab_1068
SET
	_inet = tab_1068._inet, _uuid = tab_1068._uuid
ORDER BY
	tab_1068._inet DESC, tab_1068._bytes DESC, tab_1068._int2 ASC, tab_1068._float8
LIMIT
	14:::INT8;

SELECT tab_1069._float4 AS col_2745 FROM defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1069 WHERE true;

SELECT
	tab_1070._timestamp AS col_2746,
	'\xa4ab6a526137ab03':::BYTES AS col_2747,
	tab_1070._decimal AS col_2748,
	NULL AS col_2749,
	'[[[[], {"q+#QyG[3Vg)": [{}, 0.14331892119046938]}, {}], {"FzZ": {}, "UlP,YyLM?-!": 0.41870338121207673}, "bar", [], []], 1.3133113846577968]':::JSONB
		AS col_2750
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1070
WHERE
	false;

SELECT
	DISTINCT
	tab_1071._float8 AS col_2751,
	tab_1071._int2 AS col_2752,
	'\xdde3c6':::BYTES AS col_2753,
	tab_1071._int2 AS col_2754,
	tab_1071._string AS col_2755
FROM
	defaultdb.public.seed@[0] AS tab_1071
LIMIT
	87:::INT8;

SELECT
	'1970-09-22':::DATE AS col_2756,
	tab_1072._interval AS col_2757,
	e'ps-$\x1bks':::STRING AS col_2758,
	tab_1072._int2 AS col_2759,
	tab_1072._inet AS col_2760,
	'\xabb2f28939037cdae8':::BYTES AS col_2761,
	NULL AS col_2762
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1072
WHERE
	false
ORDER BY
	tab_1072._float8 DESC, tab_1072._decimal
LIMIT
	8:::INT8;

SELECT
	false AS col_2767,
	tab_1074._timestamptz AS col_2768,
	tab_1074._string AS col_2769,
	tab_1074._int2 AS col_2770,
	(-15675):::INT8 AS col_2771,
	'\x8c24b1ba':::BYTES AS col_2772,
	'30 years 3 mons 670 days 12:19:22.258005':::INTERVAL AS col_2773
FROM
	defaultdb.public.seed@[0] AS tab_1074
WHERE
	e'\x00':::STRING::STRING IN (tab_1074._string, tab_1074._string, tab_1074._string)
LIMIT
	35:::INT8;

WITH
	with_389 (col_2774, col_2775)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'\r8Q,\x7f3':::STRING, '\x12fb0e7facf3376b':::BYTES),
						(e'\x00':::STRING, NULL),
						(e'v\x17YZk}hr\x07':::STRING, '\xd31ed81ad9':::BYTES)
				)
					AS tab_1075 (col_2774, col_2775)
		)
SELECT
	tab_1076._int8 AS col_2776,
	tab_1077._bytes AS col_2777,
	tab_1077._float8 AS col_2778,
	tab_1077._int2 AS col_2779,
	tab_1076._interval AS col_2780,
	e',\x01\x0e^H\x01A':::STRING AS col_2781,
	cte_ref_126.col_2775 AS col_2782,
	tab_1076._float8 AS col_2783
FROM
	defaultdb.public.seed@[0] AS tab_1076
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1077 ON
			(tab_1076._int2) = (tab_1077._int8) AND (tab_1076._int4) = (tab_1077._int4),
	with_389 AS cte_ref_126
WHERE
	tab_1076._bool
LIMIT
	78:::INT8;

SELECT
	(-1850249794):::INT8 AS col_2784, tab_1079._bytes AS col_2785
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1078
	INNER JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1079 ON false
WHERE
	tab_1079._bool
LIMIT
	22:::INT8;

UPDATE defaultdb.public.seed AS tab_1080 SET _float8 = ceil(tab_1080._float4::FLOAT8)::FLOAT8 WHERE true;

WITH
	with_390 (col_2786, col_2787)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							ARRAY['-24 years -3 mons -699 days -24:35:21.38975':::INTERVAL,'11 years 615 days 15:43:24.466949':::INTERVAL,'75 years 8 mons 565 days 21:40:15.034605':::INTERVAL,'26 years 8 mons 466 days 02:27:16.116449':::INTERVAL,'-6 years -6 mons -901 days -13:47:32.756647':::INTERVAL,'-31 years -2 mons -468 days -00:30:43.367105':::INTERVAL],
							e'[\n_':::STRING
						),
						(
							ARRAY['-28 years -3 mons -92 days -24:45:46.706613':::INTERVAL,'17 years 1 mon 917 days 18:37:21.701899':::INTERVAL,'-8 years -5 mons -985 days -17:49:56.39752':::INTERVAL,'-44 years -7 mons -710 days -20:49:55.562181':::INTERVAL,'21 years 2 mons 313 days 13:25:48.29812':::INTERVAL],
							e'S\x06A*\x16j|':::STRING
						),
						(ARRAY['76 years 11 mons 600 days 23:42:45.130125':::INTERVAL], ')z.f':::STRING),
						(
							(age('1970-01-07 18:31:39.001+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL::INTERVAL || ARRAY['19 years 11 mons 436 days 14:51:51.862677':::INTERVAL,'40 years 8 mons 644 days 04:50:31.577015':::INTERVAL,'-71 years -101 days -22:22:46.606611':::INTERVAL,'59 years 7 mons 504 days 08:22:18.846389':::INTERVAL,'42 years 5 mons 804 days 15:53:18.971886':::INTERVAL,'78 years 411 days 15:00:59.381328':::INTERVAL]::INTERVAL[])::INTERVAL[],
							('1':::JSONB::JSONB->>e'\x0fTm~)\x12S:':::STRING::STRING)::STRING
						),
						(
							ARRAY['-33 years -6 mons -369 days -04:35:02.324083':::INTERVAL,'-35 years -7 mons -74 days -17:12:49.518413':::INTERVAL,'4 mons 820 days 14:21:32.719735':::INTERVAL],
							'*':::STRING
						)
				)
					AS tab_1081 (col_2786, col_2787)
		),
	with_391 (col_2788)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(
							'[[{"Yd;;GP0L(Jw": null, "bar": [], "baz": true}, {}, {"foo": {"dwv25": [0.0283107347601462]}}], {"!OWm?h|;|S": {}}]':::JSONB
						),
						(
							e'{" IRW": null, " O>.Q$,oO1": [{"`LyH": null}], "/J@~BF,^r\\"){": null, "lIE\\"KG}1p&\\\\": 0.062096207213700794}':::JSONB
						),
						(NULL)
				)
					AS tab_1082 (col_2788)
		),
	with_392 (col_2789, col_2790)
		AS (SELECT B'000000011110111000' AS col_2789, NULL AS col_2790 FROM with_391 AS cte_ref_127)
SELECT
	count(*) AS col_2791
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1083
GROUP BY
	tab_1083._int8
ORDER BY
	tab_1083._int8
LIMIT
	53:::INT8;

WITH
	with_394 (col_2794, col_2795)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('222.4.145.134/28':::INET, 221418598:::OID),
						('0.0.0.0/0':::INET, 848776496:::OID),
						(
							(NULL::INET - octet_length((WITH with_393 (col_2792) AS (SELECT ('13:47:35.28379':::TIME::TIME - '00:00:00':::INTERVAL::INTERVAL)::TIME AS col_2792 FROM defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1084 WHERE tab_1084._bool) SELECT rpad('dej?b':::STRING::STRING, NULL::INT8)::STRING AS col_2793 FROM with_393 AS cte_ref_128 GROUP BY cte_ref_128.col_2792 HAVING not_similar_to_escape(NULL::STRING, e'od\x1b\x05v9.\b4':::STRING::STRING, 'x:3':::STRING::STRING)::BOOL ORDER BY cte_ref_128.col_2792 DESC LIMIT 1:::INT8)::STRING)::INT8::INT8)::INET,
							3921644629:::OID
						),
						('52.191.61.6/21':::INET, 0:::OID),
						('47.81.130.78/3':::INET, 2941571878:::OID)
				)
					AS tab_1085 (col_2794, col_2795)
		),
	with_395 (col_2796)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('758a:9172:3ec0:3b02:87ce:9776:9bb3:ad4d/11':::INET),
						(
							hostmask(set_masklen('231.78.14.26/12':::INET::INET, (-1857709309921026521):::INT8::INT8)::INET::INET)::INET
						),
						('e798:2cb8:49e2:737c:4b27:ad19:12ad:a8fc/20':::INET),
						('221.58.196.99/0':::INET),
						(
							set_masklen('ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET::INET, (-2147483648):::INT8::INT8)::INET
						),
						('8fb2:a217:5bd9:f711:bd7f:9d16:dcaf:7e46/23':::INET)
				)
					AS tab_1086 (col_2796)
		)
SELECT
	true AS col_2797, e'k\t7\x1e( ':::STRING AS col_2798
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1087,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1088
WHERE
	(true AND tab_1088._bool)
ORDER BY
	tab_1087._float8 ASC, tab_1087._int8 ASC, tab_1088._timestamp, tab_1088._timestamptz ASC, tab_1087._string
LIMIT
	91:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1089
SELECT
	NULL AS col_2799,
	1719625211:::INT8 AS col_2800,
	2998720887904726545:::INT8 AS col_2801,
	0.6943739056587219:::FLOAT8 AS col_2802,
	(-0.41654287487016306):::FLOAT8 AS col_2803,
	'1991-07-18':::DATE AS col_2804,
	tab_1090._timestamp AS col_2805,
	tab_1090._timestamptz AS col_2806,
	tab_1090._interval AS col_2807,
	tab_1090._bool AS col_2808,
	'Infinity':::DECIMAL AS col_2809,
	tab_1090._string AS col_2810,
	tab_1090._bytes AS col_2811,
	tab_1090._uuid AS col_2812,
	broadcast(tab_1090._inet::INET)::INET AS col_2813,
	tab_1090._jsonb AS col_2814
FROM
	defaultdb.public.seed@[0] AS tab_1090
LIMIT
	35:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1091
SET
	_float4 = tab_1091._float8, _timestamptz = tab_1091._timestamptz
WHERE
	tab_1091._bool;

UPDATE defaultdb.public.seed AS tab_1092 SET _date = tab_1092._date WHERE tab_1092._bool LIMIT 80:::INT8;

UPDATE defaultdb.public.seed AS tab_1093 SET _int8 = tab_1093._int2 LIMIT 26:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1094
SET
	_inet = 'e4c:44ee:c1a7:5547:aec1:fc4f:d4ff:c6/112':::INET
ORDER BY
	tab_1094._string
LIMIT
	57:::INT8;

SELECT
	count(*) AS col_2815
FROM
	defaultdb.public.seed@[0] AS tab_1095
WHERE
	tab_1095._bool
GROUP BY
	tab_1095._int8
HAVING
	inet_contained_by_or_equals('4.176.137.6':::INET::INET, '0.0.0.0/0':::INET::INET)::BOOL
ORDER BY
	tab_1095._int8 DESC;

SELECT 1712058754:::OID AS col_2816;

INSERT
INTO
	defaultdb.public.seed AS tab_1096 (_int4, _int8, _float4, _float8, _date, _interval, _bool, _uuid)
SELECT
	(-1987007628):::INT8 AS col_2817,
	tab_1097._int4 AS col_2818,
	tab_1097._float8 AS col_2819,
	tab_1097._float4 AS col_2820,
	'1982-01-30':::DATE AS col_2821,
	tab_1097._interval AS col_2822,
	false AS col_2823,
	tab_1097._uuid AS col_2824
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1097;

INSERT
INTO
	defaultdb.public.seed AS tab_1098
SELECT
	32767:::INT8 AS col_2825,
	740154409:::INT8 AS col_2826,
	2699940323637871442:::INT8 AS col_2827,
	(-0.06725921481847763):::FLOAT8 AS col_2828,
	NULL AS col_2829,
	'1983-01-03':::DATE AS col_2830,
	'1970-01-11 21:38:43.00078+00:00':::TIMESTAMP AS col_2831,
	'1970-01-06 18:05:59.000679+00:00':::TIMESTAMPTZ AS col_2832,
	'-28 years -6 mons -906 days -13:31:43.8439':::INTERVAL AS col_2833,
	true AS col_2834,
	(-25608206970460656.15):::DECIMAL AS col_2835,
	NULL AS col_2836,
	'\x6021':::BYTES AS col_2837,
	NULL AS col_2838,
	NULL AS col_2839,
	'{"*LJvLS1Qvf": [[], {}, [[]], false], "gY(dyP}X{;": "4De}V"}':::JSONB AS col_2840;

UPDATE
	defaultdb.public.seed AS tab_1099
SET
	_bytes = '\x87476acc58':::BYTES,
	_timestamptz = tab_1099._timestamptz,
	_bool = NULL,
	_int2 = NULL,
	_jsonb = tab_1099._jsonb,
	_decimal = tab_1099._decimal
WHERE
	tab_1099._bool;

SELECT
	e'\x19':::STRING AS col_2841, tab_1100._timestamptz AS col_2842
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1100
WHERE
	tab_1100._bool;

UPDATE
	defaultdb.public.seed AS tab_1102
SET
	_float4 = tab_1102._float4, _timestamptz = tab_1102._timestamptz
LIMIT
	63:::INT8;

SELECT
	(-546188718):::INT8 AS col_2844, NULL AS col_2845, (-25943):::INT8 AS col_2846
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1103
WHERE
	tab_1103._bool
LIMIT
	99:::INT8;

SELECT
	tab_1104._jsonb AS col_2847,
	'1995-04-14':::DATE AS col_2848,
	NULL AS col_2849,
	tab_1104._timestamp AS col_2850,
	(-81050353):::INT8 AS col_2851,
	NULL AS col_2852,
	tab_1104._int2 AS col_2853,
	tab_1104._interval AS col_2854,
	tab_1104._decimal AS col_2855,
	tab_1104._float8 AS col_2856,
	false AS col_2857,
	'\x42791a6f134413ca12':::BYTES AS col_2858,
	tab_1104._float8 AS col_2859,
	tab_1104._inet AS col_2860,
	(-30452):::INT8 AS col_2861
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1104
WHERE
	true
LIMIT
	17:::INT8;

WITH
	with_396 (col_2862)
		AS (SELECT * FROM (VALUES (0.28674891376717837:::FLOAT8), (NULL), ('+Inf':::FLOAT8)) AS tab_1105 (col_2862)),
	with_397 (col_2863, col_2864)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(CASE WHEN false THEN e'9M"\x10>m':::STRING:::NAME ELSE NULL END, NULL),
						(COALESCE(NULL, 'esTf':::STRING:::NAME), (-364796057):::INT8)
				)
					AS tab_1106 (col_2863, col_2864)
		)
SELECT
	count(*) AS col_2865
FROM
	defaultdb.public.seed@[0] AS tab_1107
WHERE
	tab_1107._bool
GROUP BY
	tab_1107._int8
ORDER BY
	tab_1107._int8 ASC;

DELETE FROM
	defaultdb.public.seed AS tab_1108
WHERE
	EXISTS(
		WITH
			with_398 (col_2866)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(ARRAY[(-4681):::INT8]),
								(NULL),
								(ARRAY[1898:::INT8,28076:::INT8,(-1):::INT8,(-11294):::INT8]),
								(NULL)
						)
							AS tab_1109 (col_2866)
				)
		SELECT
			tab_1108._bytes AS col_2867, tab_1108._float4 AS col_2868
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1110, with_398 AS cte_ref_129
		ORDER BY
			tab_1110._uuid DESC, tab_1110._timestamp DESC, tab_1110._bool ASC
		LIMIT
			89:::INT8
	)
LIMIT
	35:::INT8;

SELECT ARRAY[(-8331):::INT8,(-16064):::INT8,22072:::INT8,7306:::INT8] AS col_2869 LIMIT 90:::INT8;

SELECT 'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET AS col_2870;

SELECT
	tab_1112._decimal AS col_2871
FROM
	defaultdb.public.seed@[0] AS tab_1111, defaultdb.public.seed@[0] AS tab_1112
WHERE
	tab_1111._bool
ORDER BY
	tab_1111._float8, tab_1111._inet DESC
LIMIT
	9:::INT8;

WITH
	with_399 (col_2872) AS (SELECT * FROM (VALUES (B'10001101011111010001011001001000100010')) AS tab_1113 (col_2872)),
	with_400 (col_2873)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						('1970-01-03 17:00:14.00069+00:00':::TIMESTAMPTZ),
						('1970-01-03 19:38:59.000961+00:00':::TIMESTAMPTZ),
						('1970-01-02 03:05:31.000887+00:00':::TIMESTAMPTZ),
						('0001-01-01 00:00:00+00:00':::TIMESTAMPTZ),
						('1970-01-02 06:49:56.000006+00:00':::TIMESTAMPTZ)
				)
					AS tab_1114 (col_2873)
		),
	with_401 (col_2874) AS (SELECT '09:51:26.978957+01:20:00':::TIMETZ AS col_2874 FROM with_400 AS cte_ref_130)
SELECT
	tab_1117._inet AS col_2875
FROM
	defaultdb.public.seed AS tab_1115
	JOIN defaultdb.public.seed AS tab_1116 ON (tab_1115._jsonb) = (tab_1116._jsonb)
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1117 ON
			(tab_1115._jsonb) = (tab_1117._jsonb) AND (tab_1116._jsonb) = (tab_1117._jsonb);

SELECT
	tab_1121._int8 AS col_2879,
	3.4028234663852886e+38:::FLOAT8 AS col_2880,
	NULL AS col_2881,
	'1990-10-23':::DATE AS col_2882,
	'aab5cd8a-f74d-44db-8f8c-931d51c55560':::UUID AS col_2883,
	tab_1121._timestamptz AS col_2884
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1121
WHERE
	true;

SELECT
	count(*) AS col_2885
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1122
WHERE
	NULL
GROUP BY
	tab_1122._int8
HAVING
	isnan(1559981.475556370283:::DECIMAL::DECIMAL)::BOOL
ORDER BY
	tab_1122._int8, tab_1122._int8 ASC
LIMIT
	62:::INT8;

SELECT
	tab_1124._date AS col_2886,
	COALESCE(tab_1123._date, (898880371757257695:::INT8::INT8 + tab_1124._date::DATE)::DATE) AS col_2887
FROM
	defaultdb.public.seed AS tab_1123
	JOIN defaultdb.public.seed AS tab_1124 ON
			(tab_1123._int8) = (tab_1124._int8)
			AND (tab_1123._float8) = (tab_1124._float8)
			AND (tab_1123._date) = (tab_1124._date)
ORDER BY
	tab_1123._date DESC;

SELECT
	tab_1125._timestamp AS col_2888, tab_1125._uuid AS col_2889, 4139:::INT8 AS col_2890
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1125
LIMIT
	98:::INT8;

INSERT INTO defaultdb.public.seed AS tab_1126 DEFAULT VALUES;

WITH
	with_404 (col_2891)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('04:01:42.18385+03:58:00':::TIMETZ),
						('18:41:20.166329+01:56:00':::TIMETZ),
						(NULL),
						('11:34:42.32197-13:35:00':::TIMETZ)
				)
					AS tab_1127 (col_2891)
		)
SELECT
	1054499117:::OID AS col_2892
LIMIT
	37:::INT8;

WITH
	with_405 (col_2893)
		AS (
			SELECT * FROM (VALUES ('1970-01-03 19:19:05.000333+00:00':::TIMESTAMP)) AS tab_1128 (col_2893)
			EXCEPT ALL
				SELECT
					*
				FROM
					(VALUES ('1970-01-07 06:10:02.000909+00:00':::TIMESTAMP), ('0001-01-01 00:00:00+00:00':::TIMESTAMP))
						AS tab_1129 (col_2894)
				EXCEPT ALL
					SELECT
						*
					FROM
						(VALUES (NULL), ('1970-01-12 13:34:39.000083+00:00':::TIMESTAMP)) AS tab_1130 (col_2895)
		),
	with_406 (col_2896)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'\x04C*z!e\n[h':::STRING),
						(e'Lv\x12u16~}':::STRING),
						(NULL),
						(CASE WHEN NULL THEN ';LZoC':::STRING ELSE e'OE\x1b\x1c*':::STRING END),
						(e'l\\Mj$8!Z5':::STRING)
				)
					AS tab_1131 (col_2896)
		)
SELECT
	cte_ref_131.col_2893 AS col_2897
FROM
	with_405 AS cte_ref_131
ORDER BY
	cte_ref_131.col_2893 DESC
LIMIT
	73:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1132 (_int2, _int4, _int8, _date, _timestamp, _interval, _bool, _bytes, _inet)
SELECT
	(-22774):::INT8 AS col_2898,
	651060887:::INT8 AS col_2899,
	2412155572796369930:::INT8 AS col_2900,
	tab_1133._date AS col_2901,
	NULL AS col_2902,
	'14 years 11 mons 76 days 20:34:16.808388':::INTERVAL AS col_2903,
	NULL AS col_2904,
	tab_1133._bytes AS col_2905,
	'796b:c06:abfa:3b1e:d54a:c32e:e739:1fc4/65':::INET AS col_2906
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1133
WHERE
	true
ORDER BY
	tab_1133._float4 DESC
LIMIT
	5:::INT8;

WITH
	with_407 (col_2908, col_2909, col_2910)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('11:53:33.421232':::TIME, 3.4028234663852886e+38:::FLOAT8, '\x0a236fd2df7b97':::BYTES),
						('03:23:56.353248':::TIME, (-0.1904655247926712):::FLOAT8, '\x83d830e1':::BYTES),
						('05:07:21.677256':::TIME, NULL, '\x355299a31c':::BYTES),
						(
							'06:30:24.646025':::TIME,
							(
								SELECT
									NULL AS col_2907
								FROM
									defaultdb.public.seed AS tab_1134
									JOIN defaultdb.public.seed AS tab_1135 ON (tab_1134._jsonb) = (tab_1135._jsonb)
								LIMIT
									1:::INT8
							),
							NULL
						),
						('02:00:20.795173':::TIME, (-0.4944148361682892):::FLOAT8, '\xe89283a1':::BYTES)
				)
					AS tab_1136 (col_2908, col_2909, col_2910)
		),
	with_408 (col_2911)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(experimental_uuid_v4()::BYTES),
						('\x923f':::BYTES),
						(NULL),
						('\xc5fd9c822087c1':::BYTES),
						('\xaf115d49bf31':::BYTES),
						(NULL)
				)
					AS tab_1137 (col_2911)
		),
	with_409 (col_2912)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), (679995791643227683:::INT8), ((-1):::INT8), ((-2147483648):::INT8))
					AS tab_1138 (col_2912)
		)
SELECT
	tab_1139._string AS col_2913,
	tab_1139._float4 AS col_2914,
	tab_1139._inet AS col_2915,
	'a7f1aa77-ffea-431c-b248-bd9ab5d0b495':::UUID AS col_2916,
	'1970-01-10 04:46:52.00015+00:00':::TIMESTAMPTZ AS col_2917,
	tab_1139._decimal AS col_2918,
	(-0.46783682703971863):::FLOAT8 AS col_2919,
	'\x8ad4f2c078':::BYTES AS col_2920,
	true AS col_2921,
	tab_1139._timestamp AS col_2922,
	tab_1139._int8 AS col_2923,
	tab_1139._int4 AS col_2924,
	tab_1139._interval AS col_2925,
	NULL AS col_2926,
	'1978-01-21':::DATE AS col_2927,
	tab_1139._jsonb AS col_2928
FROM
	defaultdb.public.seed@[0] AS tab_1139
ORDER BY
	tab_1139._decimal, tab_1139._float4 ASC;

UPDATE defaultdb.public.seed AS tab_1140 SET _int2 = 13719:::INT8 WHERE true;

INSERT
INTO
	defaultdb.public.seed AS tab_1141
WITH
	with_410 (col_2929)
		AS (SELECT * FROM (VALUES ('15 years 2 mons 853 days 20:07:47.648951':::INTERVAL)) AS tab_1142 (col_2929))
SELECT
	(-10491):::INT8 AS col_2930,
	(-1847637628):::INT8 AS col_2931,
	7167233614194888121:::INT8 AS col_2932,
	(-0.5853415131568909):::FLOAT8 AS col_2933,
	0.0:::FLOAT8 AS col_2934,
	'1970-06-02':::DATE AS col_2935,
	'1970-01-04 04:37:52.000243+00:00':::TIMESTAMP AS col_2936,
	'1970-01-01 02:07:34.000579+00:00':::TIMESTAMPTZ AS col_2937,
	cte_ref_132.col_2929 AS col_2938,
	true AS col_2939,
	3.956683194456717075:::DECIMAL AS col_2940,
	COALESCE(
		e'V=`\x16-':::STRING,
		(e'[[{"foo": "KtOVQK\\"Mk:)"}, {"baz": [[]]}, {"a": {}, "~rBR=\\\\k;ydM>": [[]]}], null, "e%xsd("]':::JSONB::JSONB#>>(NULL::STRING[] || e'(\x05':::STRING::STRING)::STRING[]::STRING[])::STRING
	)
		AS col_2941,
	NULL AS col_2942,
	'00000000-0000-0000-0000-000000000000':::UUID AS col_2943,
	'107.184.162.182/2':::INET AS col_2944,
	COALESCE(
		e'{"foobar": {"\'}591 F": [null, []], "8CoOx": [{}, [], []], "vHZF- F": true}, "~qDQ.&Xg;^Q": {"baz": {"foobar": {}}}}':::JSONB,
		'{"b": [], "foobar": {"/H]L&I$": {"c": {"Q>T[": {"Aoy K:D#l3q": null}}}}, "hph|3w": [{" X{r{j@]": {"$2FDY": 0.09769555617682624}, "86I": {}, "Sm9UL": {"c": {"foo": "AC9MgN"}}, "b": [], "io1": []}, {"foobar": []}], "i,6{r}Y=._": []}':::JSONB
	)
		AS col_2945
FROM
	with_410 AS cte_ref_132
WHERE
	true
LIMIT
	26:::INT8;

SELECT B'000110110000011110010' AS col_2946;

UPDATE
	defaultdb.public.seed AS tab_1143
SET
	_uuid = '46c4e01a-d232-431a-99b2-2872f4b66c6c':::UUID,
	_string = e'6ky]ode\x07':::STRING,
	_int4 = tab_1143._int2,
	_float8 = tab_1143._float8,
	_int2 = tab_1143._int4,
	_timestamptz = '1970-01-06 20:00:01.000421+00:00':::TIMESTAMPTZ
WHERE
	false
LIMIT
	32:::INT8;

SELECT
	'f949b6c3-7e24-4ee5-8c00-1e01cf6a9a72':::UUID AS col_2947,
	tab_1144._int2 AS col_2948,
	'1974-05-18':::DATE AS col_2949,
	tab_1144._int8 AS col_2950,
	tab_1144._int8 AS col_2951
FROM
	defaultdb.public.seed@[0] AS tab_1144
ORDER BY
	tab_1144._int8 DESC, tab_1144._decimal
LIMIT
	87:::INT8;

UPDATE defaultdb.public.seed AS tab_1145 SET _decimal = tab_1145._decimal;

INSERT
INTO
	defaultdb.public.seed AS tab_1150 (_int2, _int8, _float8, _date, _timestamp, _interval, _string, _uuid, _inet)
SELECT
	tab_1151._int2 AS col_2960,
	(-4999995844855566877):::INT8 AS col_2961,
	ceil(tab_1151._float4::FLOAT8)::FLOAT8 AS col_2962,
	tab_1151._date AS col_2963,
	'1970-01-02 20:54:22.000191+00:00':::TIMESTAMP AS col_2964,
	tab_1151._interval AS col_2965,
	'*vf':::STRING AS col_2966,
	tab_1152._uuid AS col_2967,
	NULL AS col_2968
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1151
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1152 ON
			(tab_1151._float8) = (tab_1152._float8)
			AND (tab_1151._float4) = (tab_1152._float8)
			AND (tab_1151._int4) = (tab_1152._int2)
			AND (tab_1151._timestamp) = (tab_1152._timestamp)
WHERE
	true
LIMIT
	24:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1153
SET
	_timestamptz = NULL, _int4 = tab_1153._int4
WHERE
	tab_1153._bool
ORDER BY
	tab_1153._bytes, tab_1153._string DESC
LIMIT
	80:::INT8;

SELECT ARRAY[(-1.0):::FLOAT8] AS col_2969;

SELECT '1970-01-05 04:19:55.000368+00:00':::TIMESTAMPTZ AS col_2970;

SELECT
	tab_1154._int4 AS col_2971, NULL AS col_2972, tab_1154._date AS col_2973
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1154
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1155 ON (tab_1154._interval) = (tab_1155._interval),
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1156,
	[
		DELETE FROM
			defaultdb.public.seed AS tab_1157
		WHERE
			tab_1157._bool
		RETURNING
			e'.\t4Q<\x120':::STRING:::NAME AS ret_4, _bytes AS ret_5, e' o\x04\x0ea5_>C':::STRING AS ret_6
	]
ORDER BY
	tab_1155._date DESC
LIMIT
	69:::INT8;

SELECT
	tab_1158._int4 AS col_2974,
	'71 years 6 mons 494 days 18:14:44.480139':::INTERVAL AS col_2975,
	tab_1158._bytes AS col_2976,
	tab_1158._timestamptz AS col_2977,
	tab_1158._int2 AS col_2978,
	tab_1158._inet AS col_2979
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1158
ORDER BY
	tab_1158._int8 ASC, tab_1158._timestamptz DESC
LIMIT
	95:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1159
WITH
	with_413 (col_2980)
		AS (
			SELECT * FROM (VALUES (3281718441:::OID), (499587049:::OID)) AS tab_1160 (col_2980)
			EXCEPT
				SELECT
					*
				FROM
					(
						VALUES
							(2483739090:::OID),
							(782904652:::OID),
							(NULL),
							(3133082958:::OID),
							(2241865934:::OID),
							(NULL)
					)
						AS tab_1161 (col_2981)
		)
SELECT
	NULL AS col_2982,
	(-436312760):::INT8 AS col_2983,
	2678254713443811556:::INT8 AS col_2984,
	(-1.5567512512207031):::FLOAT8 AS col_2985,
	(-0.7874388622091423):::FLOAT8 AS col_2986,
	tab_1162._date AS col_2987,
	'1970-01-11 21:03:20.000846+00:00':::TIMESTAMP AS col_2988,
	'1970-01-08 11:37:25.000611+00:00':::TIMESTAMPTZ AS col_2989,
	age('1970-01-11 09:27:16.000536+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL AS col_2990,
	true AS col_2991,
	(-2.932799766906266540E+28):::DECIMAL AS col_2992,
	e'"oA\x07\x10\fqT~':::STRING AS col_2993,
	'\xb9bbb8a437':::BYTES AS col_2994,
	(
		SELECT
			tab_1164._uuid AS col_2995
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1164
			JOIN defaultdb.public.seed@[0] AS tab_1165 ON false
		LIMIT
			1:::INT8
	)
		AS col_2996,
	'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET AS col_2997,
	'true':::JSONB AS col_2998
FROM
	defaultdb.public.seed AS tab_1162 JOIN defaultdb.public.seed AS tab_1163 ON (tab_1162._int8) = (tab_1163._int8)
WHERE
	true
LIMIT
	37:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1166
SET
	_timestamp = tab_1166._timestamp, _decimal = tab_1166._decimal
ORDER BY
	tab_1166._string, tab_1166._bytes DESC, tab_1166._bytes ASC, tab_1166._interval ASC, tab_1166._decimal
LIMIT
	22:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1167 (_float8, _date, _timestamp, _interval, _bool, _jsonb)
WITH
	with_414 (col_2999)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(B'010000000111101001101101101010'),
						(B'101001101110110110010100011100'),
						(B'101001000000111011000011100101'),
						(B'101100110100010101111111100101')
				)
					AS tab_1168 (col_2999)
		)
SELECT
	tab_1169._float8 AS col_3000,
	tab_1169._date AS col_3001,
	('9 years 11 mons 911 days 09:02:49.023871':::INTERVAL::INTERVAL + tab_1169._date::DATE)::TIMESTAMP AS col_3002,
	tab_1169._interval AS col_3003,
	true AS col_3004,
	json_extract_path(e'[null, [[{"9^M1uG": null, "ZcdO:}k\\"B": {"a": {}, "foo": {}}}, {}], [{"c": []}, "a"], null, {}]]':::JSONB::JSONB, tab_1169._string::STRING)::JSONB
		AS col_3005
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1169;

SELECT NULL AS col_3006 LIMIT 97:::INT8;

SELECT
	tab_1170.col_3008 AS col_3009
FROM
	(SELECT DISTINCT 289585200:::INT8 AS col_3007 ORDER BY col_3007 ASC) AS tab_1170 (col_3008)
WHERE
	NULL
ORDER BY
	tab_1170.col_3008 DESC, tab_1170.col_3008;

INSERT
INTO
	defaultdb.public.seed AS tab_1171 (_int4, _int8, _date, _timestamp, _decimal, _bytes, _uuid, _jsonb)
SELECT
	1325608964:::INT8 AS col_3010,
	tab_1173._int2 AS col_3011,
	tab_1172._date AS col_3012,
	'1970-01-01 15:36:11.00055+00:00':::TIMESTAMP AS col_3013,
	tab_1173._decimal AS col_3014,
	(tab_1172._bytes::BYTES || tab_1172._bytes::BYTES)::BYTES AS col_3015,
	tab_1173._uuid AS col_3016,
	e'[[{"`\\\\)<[mKFd7D3": {"foo": null, "gW6:rr!E6n": null}, "baz": [{"`gQH|G": []}]}, {"bar": true, "c": true}, {">$/\\"6a": {}}, [], []], {"J8v4af": {}}, []]':::JSONB
		AS col_3017
FROM
	defaultdb.public.seed@[0] AS tab_1172
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1173 ON (tab_1172._float8) = (tab_1173._float8),
	[DELETE FROM defaultdb.public.seed AS tab_1174 RETURNING NULL AS ret_7]
LIMIT
	33:::INT8;

WITH
	with_415 (col_3018)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('6de7:4d6:cd9a:3ee1:dca2:830b:95ee:4538/29':::INET),
						('1fb7:b973:24b7:c293:9af9:3079:ad3e:277f/21':::INET),
						(
							set_masklen('115.185.107.206/30':::INET::INET, length('xwCE1& ':::STRING::STRING)::INT8::INT8)::INET
						),
						('186.157.38.71/25':::INET),
						('ed29:9e0e:b039:7294:2eaa:730c:d0c8:d96e/102':::INET)
				)
					AS tab_1175 (col_3018)
		)
SELECT
	(-1.7912319898605347):::FLOAT8 AS col_3019
LIMIT
	63:::INT8;

INSERT INTO defaultdb.public.seed AS tab_1176 DEFAULT VALUES;

SELECT 2350807962:::OID AS col_3020 LIMIT 63:::INT8;

WITH
	with_416 (col_3021)
		AS (
			SELECT * FROM (VALUES ('abdd0d35-8578-47d4-9fd0-0af747ccb066':::UUID)) AS tab_1177 (col_3021)
			UNION ALL
				SELECT
					*
				FROM
					(
						VALUES
							('d2ea77cf-9f7d-4766-96ee-186baee74a85':::UUID),
							('5e041bc9-9937-464e-86b8-8a271a15c6b3':::UUID),
							(NULL),
							('81ab16f2-7809-4656-bbee-2b5457b730bf':::UUID),
							('e9d80197-3107-4c7c-8db8-c9080b4aa323':::UUID),
							('aa29dde0-86f1-4f08-9807-f73b18d808c1':::UUID)
					)
						AS tab_1178 (col_3022)
		),
	with_417 (col_3023) AS (SELECT * FROM (VALUES (now():::TIMESTAMP::TIMESTAMP)) AS tab_1179 (col_3023))
SELECT
	cte_ref_133.col_3023 AS col_3024
FROM
	with_417 AS cte_ref_133
WHERE
	false;

INSERT
INTO
	defaultdb.public.seed AS tab_1180
SELECT
	tab_1181._int8 AS col_3025,
	tab_1181._int8 AS col_3026,
	NULL AS col_3027,
	(-1.3417643308639526):::FLOAT8 AS col_3028,
	tab_1181._float4 AS col_3029,
	tab_1181._date AS col_3030,
	'1970-01-01 10:46:53.000019+00:00':::TIMESTAMP AS col_3031,
	tab_1181._timestamptz AS col_3032,
	tab_1181._interval AS col_3033,
	NULL AS col_3034,
	(-1.421256885960695926E+20):::DECIMAL AS col_3035,
	'':::STRING AS col_3036,
	tab_1181._bytes AS col_3037,
	'562c67ee-0b9e-41d2-9aa8-ddf3cbd4726b':::UUID AS col_3038,
	tab_1181._inet AS col_3039,
	'[{"4E9aF+11": null, "foo": [null, []]}, {"a": [[]]}, {}]':::JSONB AS col_3040
FROM
	defaultdb.public.seed@[0] AS tab_1181
WHERE
	tab_1181._bool;

SELECT
	count(*) AS col_3041
FROM
	defaultdb.public.seed@[0] AS tab_1182
WHERE
	true
GROUP BY
	tab_1182._int8
HAVING
	inet_contains_or_equals('44.163.241.234/30':::INET::INET, (NULL::INT8 + '82.247.203.62/6':::INET::INET)::INET::INET)::BOOL
ORDER BY
	tab_1182._int8 DESC, tab_1182._int8 DESC;

SELECT
	(NULL::TIMETZ + tab_1183._date::DATE)::TIMESTAMPTZ AS col_3042,
	tab_1184._uuid AS col_3043,
	tab_1184._string AS col_3044,
	'23.220.90.30/5':::INET AS col_3045
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1183
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1184 ON
			(tab_1183._int4) = (tab_1184._int2) AND (tab_1183._int2) = (tab_1184._int8)
WHERE
	tab_1184._bool
ORDER BY
	tab_1183._bytes DESC
LIMIT
	14:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1185
SET
	_float8 = NULL
WHERE
	tab_1185._bool
ORDER BY
	tab_1185._timestamptz ASC, tab_1185._date DESC
LIMIT
	16:::INT8;

DELETE FROM defaultdb.public.seed AS tab_1186 WHERE (tab_1186._bool AND tab_1186._bool) LIMIT 63:::INT8;

SELECT
	count(*) AS col_3046
FROM
	defaultdb.public.seed@[0] AS tab_1187
WHERE
	true
GROUP BY
	tab_1187._int8
HAVING
	isnan(8.840870397855141666E+37:::DECIMAL::DECIMAL)::BOOL
LIMIT
	14:::INT8;

DELETE FROM defaultdb.public.seed AS tab_1188 ORDER BY tab_1188._inet LIMIT 9:::INT8;

DELETE FROM
	defaultdb.public.seed AS tab_1189
WHERE
	tab_1189._int8::INT8 NOT IN ((tab_1189._int2::INT8 >> (-4465247213952990366):::INT8::INT8)::INT8, NULL)
ORDER BY
	tab_1189._decimal DESC, tab_1189._timestamptz ASC
LIMIT
	29:::INT8;

INSERT INTO defaultdb.public.seed AS tab_1190 DEFAULT VALUES;

SELECT
	tab_1191._inet AS col_3047
FROM
	defaultdb.public.seed@[0] AS tab_1191
WHERE
	tab_1191._bool
ORDER BY
	tab_1191._bytes
LIMIT
	60:::INT8;

SELECT
	'8afc:6875:9820:f081:fddb:a226:fbfc:997a/10':::INET AS col_3048
FROM
	defaultdb.public.seed@[0] AS tab_1192
WHERE
	tab_1192._bool;

INSERT INTO defaultdb.public.seed AS tab_1193 DEFAULT VALUES;

SELECT
	count(*) AS col_3049
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1194
GROUP BY
	tab_1194._jsonb
LIMIT
	22:::INT8;

SELECT
	tab_1195._jsonb AS col_3050,
	'655a:520c:7de2:86e0:e975:e7ac:9971:f1cf/85':::INET AS col_3051,
	'75 years 5 mons 883 days 14:01:50.069522':::INTERVAL AS col_3052,
	log(3.706630487308503016:::DECIMAL::DECIMAL)::DECIMAL AS col_3053
FROM
	defaultdb.public.seed@[0] AS tab_1195
WHERE
	false;

UPDATE
	defaultdb.public.seed AS tab_1196
SET
	_interval = tab_1196._interval,
	_timestamptz = '0001-01-01 00:00:00+00:00':::TIMESTAMPTZ,
	_string = NULL,
	_bool = tab_1196._bool,
	_int8 = tab_1196._int4
LIMIT
	82:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1197
SET
	_timestamp = tab_1197._timestamp, _uuid = tab_1197._uuid
WHERE
	false
ORDER BY
	tab_1197._float8 ASC,
	tab_1197._inet DESC,
	tab_1197._inet ASC,
	tab_1197._string ASC,
	tab_1197._float8,
	tab_1197._float4
LIMIT
	47:::INT8;

SELECT
	tab_1198._uuid AS col_3054,
	NULL AS col_3055,
	tab_1198._timestamp AS col_3056,
	'239.199.17.30/31':::INET AS col_3057,
	'1970-01-04 18:14:33.000866+00:00':::TIMESTAMPTZ AS col_3058,
	tab_1198._date AS col_3059,
	e'{"1:\\"O": {"F~RS}X\\\\YF": []}, "75hd,#$iPJ/": ["[lD+C&$", false], "D=;\'Ga<vi": {}, "PAa$\\"Z0(H=JC": [], "a {SR=j\'R{": true, "c": []}':::JSONB
		AS col_3060,
	'\xd82a1290bf':::BYTES AS col_3061,
	(tab_1198._float8::FLOAT8 - tab_1198._float4::FLOAT8)::FLOAT8 AS col_3062,
	tab_1198._float8 AS col_3063,
	(tab_1198._timestamptz::TIMESTAMPTZ - '1970-01-04 21:53:47.000918+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL
		AS col_3064,
	(
		SELECT
			319.6494539252364930:::DECIMAL AS col_3065
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1199
			JOIN defaultdb.public.seed@[0] AS tab_1200 ON (tab_1199._timestamp) = (tab_1200._timestamp)
		WHERE
			true
		LIMIT
			1:::INT8
	)
		AS col_3066
FROM
	defaultdb.public.seed@[0] AS tab_1198
WHERE
	true
ORDER BY
	tab_1198._timestamptz ASC;

WITH
	with_419 (col_3071)
		AS (
			SELECT
				*
			FROM
				(VALUES ((-1.110607624053955):::FLOAT8), ('NaN':::FLOAT8), ((-0.7464714646339417):::FLOAT8))
					AS tab_1204 (col_3071)
		)
SELECT
	cte_ref_135.col_3071 AS col_3072
FROM
	with_419 AS cte_ref_135;

SELECT
	tab_1205._string AS col_3073
FROM
	defaultdb.public.seed@[0] AS tab_1205
ORDER BY
	tab_1205._timestamptz DESC
LIMIT
	69:::INT8;

WITH
	with_422 (col_3097)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(statement_timestamp():::TIMESTAMPTZ::TIMESTAMPTZ),
						('1970-01-05 07:42:45.000535+00:00':::TIMESTAMPTZ)
				)
					AS tab_1211 (col_3097)
		)
SELECT
	(false AND EXISTS (SELECT e'{"8)8zDwIerNx": {}, "bar": [[{"?34C.": [[[]]], "bar": "baz"}, {}], [], {"xej4z,c\\\\n": {"foo": true}}, 0.04171184575657677], "zJS": true}':::JSONB AS col_3098))
		AS col_3099,
	NULL AS col_3100,
	CASE WHEN tab_1212._bool THEN tab_1212._int4 ELSE 8965055727656911127:::INT8 END AS col_3101
FROM
	defaultdb.public.seed@[0] AS tab_1212;

UPDATE
	defaultdb.public.seed AS tab_1213
SET
	_float8 = (3.4028234663852886e+38:::FLOAT8::FLOAT8 % 0.502456587905905:::FLOAT8::FLOAT8)::FLOAT8
WHERE
	tab_1213._bool;

UPDATE
	defaultdb.public.seed AS tab_1214
SET
	_float8 = tab_1214._float4,
	_interval = '-11 years -3 mons -579 days -18:08:16.381549':::INTERVAL,
	_bytes = NULL,
	_int4 = tab_1214._int2,
	_date = '1996-07-28':::DATE,
	_timestamptz = '1970-01-11 06:05:20.000028+00:00':::TIMESTAMPTZ
WHERE
	tab_1214._bool
ORDER BY
	tab_1214._inet
LIMIT
	40:::INT8;

WITH
	with_423 (col_3102) AS (SELECT * FROM (VALUES (B'11011101100011000001010110100111')) AS tab_1216 (col_3102))
SELECT
	tab_1217._int4 AS col_3103,
	'71 years 5 mons 997 days 07:50:45.819871':::INTERVAL AS col_3104,
	tab_1217._jsonb AS col_3105,
	NULL AS col_3106,
	tab_1217._float4 AS col_3107,
	tab_1217._float4 AS col_3108
FROM
	with_423 AS cte_ref_137, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1217
WHERE
	tab_1217._bool
ORDER BY
	cte_ref_137.col_3102, tab_1217._int8, cte_ref_137.col_3102 DESC, tab_1217._interval, tab_1217._date DESC
LIMIT
	60:::INT8;

SELECT
	count(*) AS col_3109
FROM
	defaultdb.public.seed@[0] AS tab_1218
WHERE
	(tab_1218._bool AND tab_1218._bool)
GROUP BY
	tab_1218._int8, tab_1218._float8, tab_1218._date
LIMIT
	62:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1219
		(_int8, _float4, _date, _timestamp, _timestamptz, _interval, _decimal, _bytes, _uuid)
SELECT
	(-228161661947134291):::INT8 AS col_3110,
	tab_1220._float4 AS col_3111,
	'1988-03-30':::DATE AS col_3112,
	'1970-01-05 08:10:10.000629+00:00':::TIMESTAMP AS col_3113,
	tab_1220._timestamptz AS col_3114,
	date_trunc(tab_1220._string::STRING, '01:17:15.128642':::TIME::TIME)::INTERVAL AS col_3115,
	tab_1220._decimal AS col_3116,
	'\xff':::BYTES AS col_3117,
	'563f9132-4692-434b-9d1d-3d30775a5c8c':::UUID AS col_3118
FROM
	defaultdb.public.seed@[0] AS tab_1220
ORDER BY
	tab_1220._int4 DESC;

SELECT
	1.401298464324817e-45:::FLOAT8 AS col_3119, 'd8394464-71a2-4518-88d7-af8cd05d7874':::UUID AS col_3120
LIMIT
	75:::INT8;

SELECT
	tab_1221._float8 AS col_3125,
	tab_1221._jsonb AS col_3126,
	tab_1221._int2 AS col_3127,
	NULL AS col_3128,
	tab_1221._timestamptz AS col_3129,
	0:::INT8 AS col_3130
FROM
	defaultdb.public.seed@[0] AS tab_1221
WHERE
	EXISTS(
		WITH
			with_424 (col_3121) AS (SELECT tab_1222._timestamp AS col_3121 FROM defaultdb.public.seed@[0] AS tab_1222),
			with_425 (col_3122, col_3123)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(0:::OID, '1994-05-30':::DATE),
								(0:::OID, '1974-11-02':::DATE),
								(3054644195:::OID, '5874897-12-31':::DATE)
						)
							AS tab_1223 (col_3122, col_3123)
				)
		SELECT
			(B'1111011100001010001110001010010000011100', 3854846718:::OID, B'10011100110000111101011', NULL)
				AS col_3124
		FROM
			with_425 AS cte_ref_138
		WHERE
			NULL
		LIMIT
			52:::INT8
	);

WITH
	with_426 (col_3131, col_3132)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							'[{"foobar": [0.6539673285271618]}, {"baz": [{"iU)S": {"b": null}}, null]}, [], 0.8606928014032285, []]':::JSONB,
							'664e2cfc-6262-49bd-9539-8865fa18d45c':::UUID
						),
						(
							e'[{"n/,kc\'T`\\"i": 1.5890168323419671}, [], {"!@Os%TH)K9}T": {"FTU": [{"bar": []}, false], "foobar": ["RBv"]}, ":-d]MS\\\\9_": {}, "c": false}, "]4;\\\\9`KHW`X", [{}]]':::JSONB,
							'7a580dc5-33ba-4d58-aabe-4c5d3451c8a0':::UUID
						),
						(
							e'{"5,\\\\S?": [{}, {}], "Pq0l\\\\I6B/": {}, "gSbRXrx#r>": [[[]], true, [], {"c": [{}]}]}':::JSONB,
							'5e1071f3-1431-429d-8146-cf13d08ebd38':::UUID
						),
						('"foobar"':::JSONB, NULL),
						('[{"&N(": null, "JVfJA!1d(}": {}, "foo": null}, 0.9974915818288439]':::JSONB, NULL)
				)
					AS tab_1224 (col_3131, col_3132)
		)
SELECT
	e'[{".I\'Hq7+ULK": {}, "b": [{"foo": [{}, {}]}, "W0kpVB#-u[L", {"foobar": {}}]}, {}, {"baz": true}, []]':::JSONB
		AS col_3133
FROM
	with_426 AS cte_ref_139
WHERE
	false;

INSERT
INTO
	defaultdb.public.seed AS tab_1225
SELECT
	NULL AS col_3134,
	NULL AS col_3135,
	(-8975683780688392201):::INT8 AS col_3136,
	tab_1226._float4 AS col_3137,
	tab_1226._float4 AS col_3138,
	'1991-11-06':::DATE AS col_3139,
	NULL AS col_3140,
	'3000-01-01 00:00:00+00:00':::TIMESTAMPTZ AS col_3141,
	'290 years':::INTERVAL AS col_3142,
	inet_contains_or_equals(tab_1226._inet::INET, '6bc5:e82b:889c:cceb:a03b:ff91:3eff:b6dd/31':::INET::INET)::BOOL
		AS col_3143,
	NULL AS col_3144,
	tab_1226._string AS col_3145,
	'\xd67ac15206dfee5d':::BYTES AS col_3146,
	'0be0bca7-6e17-4cee-abab-f5719732662e':::UUID AS col_3147,
	tab_1226._inet AS col_3148,
	tab_1226._jsonb AS col_3149
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1226
WHERE
	crdb_internal.is_admin()::BOOL;

SELECT
	((-0.6145390201856356):::FLOAT8::FLOAT8 // (-0.0020134626538776956):::FLOAT8::FLOAT8)::FLOAT8 AS col_3150,
	tab_1227._timestamp AS col_3151,
	e']U\'':::STRING AS col_3152,
	tab_1227._date AS col_3153,
	NULL AS col_3154,
	tab_1227._bytes AS col_3155,
	tab_1227._interval AS col_3156,
	(-0.581230878829956):::FLOAT8 AS col_3157,
	(-4913202.502945699309):::DECIMAL AS col_3158,
	tab_1227._bool AS col_3159
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1227
WHERE
	tab_1227._bool
LIMIT
	75:::INT8;

SELECT
	tab_1228._float4 AS col_3161
FROM
	defaultdb.public.seed@[0] AS tab_1228
WHERE
	EXISTS(
		SELECT
			tab_1229._decimal AS col_3160
		FROM
			defaultdb.public.seed@[0] AS tab_1229
		WHERE
			tab_1229._bool
		ORDER BY
			tab_1229._bool ASC
		LIMIT
			33:::INT8
	)
ORDER BY
	tab_1228._decimal ASC,
	tab_1228._float8 ASC,
	tab_1228._date ASC,
	tab_1228._float8 ASC,
	tab_1228._float4 ASC,
	tab_1228._timestamp ASC;

UPDATE
	defaultdb.public.seed AS tab_1230
SET
	_timestamp = tab_1230._timestamp,
	_inet = tab_1230._inet,
	_timestamptz = tab_1230._timestamptz,
	_decimal = tab_1230._decimal
WHERE
	(NOT false)
ORDER BY
	tab_1230._timestamp DESC, tab_1230._float4 DESC
LIMIT
	60:::INT8;

UPDATE defaultdb.public.seed AS tab_1231 SET _timestamp = tab_1231._timestamp;

SELECT
	tab_1232._float8 AS col_3162
FROM
	defaultdb.public.seed@[0] AS tab_1232
WHERE
	tab_1232._bool
ORDER BY
	tab_1232._string DESC, tab_1232._string DESC
LIMIT
	89:::INT8;

WITH
	with_427 (col_3163, col_3164)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID, '153.43.253.202/31':::INET),
						('3fb10de8-90eb-4b1a-ae5b-b88540cafa1a':::UUID, NULL),
						(
							'e1208b52-b430-40f3-a55c-2143f87a12eb':::UUID,
							'472c:ca4e:817:20f:d8f9:a8bf:8c1a:d6ca/46':::INET
						)
				)
					AS tab_1233 (col_3163, col_3164)
		),
	with_428 (col_3165) AS (SELECT * FROM (VALUES (NULL)) AS tab_1234 (col_3165)),
	with_429 (col_3166, col_3167)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(sha1('\xdadbdfaf8c1d339c85':::BYTES::BYTES)::STRING, '1994-09-27':::DATE),
						(sha256(e'qgv\x10u\x18\x0b':::STRING::STRING)::STRING, '1970-01-01':::DATE)
				)
					AS tab_1235 (col_3166, col_3167)
		)
SELECT
	tab_1236._decimal AS col_3168,
	cte_ref_140.col_3163 AS col_3169,
	tab_1236._jsonb AS col_3170,
	cte_ref_141.col_3164 AS col_3171,
	tab_1236._int8 AS col_3172,
	tab_1236._bytes AS col_3173,
	cte_ref_140.col_3164 AS col_3174,
	(-895603638858859117):::INT8 AS col_3175,
	'7e6da1ee-d828-4142-bce6-62000c412a70':::UUID AS col_3176,
	'245.221.53.59/28':::INET AS col_3177,
	'1972-03-02':::DATE AS col_3178
FROM
	defaultdb.public.seed@[0] AS tab_1236, with_427 AS cte_ref_140, with_427 AS cte_ref_141
WHERE
	tab_1236._bool
ORDER BY
	cte_ref_141.col_3164, tab_1236._decimal ASC;

SELECT
	NULL AS col_3179,
	e'{"EahA Sq": {"bar": {}, "qFq\\"fKO": false}, "foobar": null, "jmSP92(S[(": [{}, false]}':::JSONB AS col_3180,
	tab_1237._inet AS col_3181,
	true AS col_3182,
	tab_1237._uuid AS col_3183,
	tab_1238._date AS col_3184,
	0:::INT8 AS col_3185,
	NULL AS col_3186,
	tab_1237._float8 AS col_3187
FROM
	defaultdb.public.seed@[0] AS tab_1237
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1238 ON (tab_1237._float4) = (tab_1238._float4)
ORDER BY
	tab_1238._interval;

UPDATE defaultdb.public.seed AS tab_1239 SET _string = tab_1239._string WHERE false LIMIT 43:::INT8;

UPDATE defaultdb.public.seed AS tab_1240 SET _inet = tab_1240._inet LIMIT 81:::INT8;

WITH
	with_430 (col_3189, col_3190, col_3191)
		AS (
			SELECT
				e'\'':::STRING AS col_3189, B'000000110' AS col_3190, NULL AS col_3191
			FROM
				defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1242,
				defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1243
			UNION
				SELECT
					*
				FROM
					(
						VALUES
							(
								'EnQ`Ppv':::STRING,
								NULL,
								CASE
								WHEN false THEN NULL
								ELSE ARRAY[2650645296:::OID,217419598:::OID,2830911734:::OID,1144937506:::OID,1693212028:::OID]
								END
							),
							(
								NULL,
								B'0000000000000000000000000000000000000000000000000000000000000000',
								ARRAY[2028999408:::OID,1375785768:::OID,452426702:::OID,3083588082:::OID]
							),
							('l,}/':::STRING, B'0111111111111111111111111111111111111111111111111111111111111111', NULL)
					)
						AS tab_1244 (col_3192, col_3193, col_3194)
		)
SELECT
	3468033945312544879:::INT8 AS col_3195, tab_1245._jsonb AS col_3196, tab_1245._interval AS col_3197
FROM
	defaultdb.public.seed@[0] AS tab_1245
LIMIT
	51:::INT8;

SELECT
	tab_1246._inet AS col_3198,
	tab_1246._float4 AS col_3199,
	'1970-01-05 13:21:40.000932+00:00':::TIMESTAMPTZ AS col_3200,
	NULL AS col_3201,
	0.9536221462679018:::FLOAT8 AS col_3202,
	tab_1246._int2 AS col_3203,
	27038:::INT8 AS col_3204,
	tab_1246._timestamp AS col_3205,
	tab_1246._interval AS col_3206,
	'f76b7a78-6d1d-47af-8d42-ba0bbe853725':::UUID AS col_3207
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1246
WHERE
	true
ORDER BY
	tab_1246._bool ASC
LIMIT
	71:::INT8;

WITH
	with_434 (col_3220)
		AS (
			SELECT
				*
			FROM
				(VALUES ('1990-08-08':::DATE), ('1976-03-11':::DATE), ('5874897-12-31':::DATE)) AS tab_1251 (col_3220)
		),
	with_435 (col_3221)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(crdb_internal.lease_holder('\xa17b9f66b8a7c70712':::BYTES::BYTES)::INT8::INT8 + '1977-12-16':::DATE::DATE)::DATE
						),
						('4714-11-24 BC':::DATE),
						(localtimestamp():::DATE::DATE)
				)
					AS tab_1252 (col_3221)
		),
	with_436 (col_3222) AS (SELECT * FROM (VALUES (1320072832:::OID)) AS tab_1253 (col_3222))
SELECT
	'09:00:36.47867':::TIME AS col_3223
LIMIT
	74:::INT8;

SELECT
	tab_1255._jsonb AS col_3224
FROM
	defaultdb.public.seed AS tab_1254 JOIN defaultdb.public.seed AS tab_1255 ON (tab_1254._jsonb) = (tab_1255._jsonb)
WHERE
	'(':::STRING ILIKE e'S\x1dE&\\7l':::STRING;

UPDATE defaultdb.public.seed AS tab_1256 SET _date = tab_1256._date LIMIT 16:::INT8;

WITH
	with_437 (col_3225)
		AS (
			SELECT
				*
			FROM
				(VALUES (e'\U00002603':::STRING), (NULL), (e'gaF\x13':::STRING), (e'\x15':::STRING))
					AS tab_1257 (col_3225)
		),
	with_438 (col_3226)
		AS (
			SELECT * FROM (VALUES (170466009:::OID)) AS tab_1258 (col_3226)
			EXCEPT
				SELECT
					*
				FROM
					(VALUES (1410580902:::OID), (3246644853:::OID), (3850237797:::OID), (4135444794:::OID))
						AS tab_1259 (col_3227)
				EXCEPT
					SELECT
						*
					FROM
						(
							VALUES
								(COALESCE(1810909346:::OID, 1626697872:::OID)),
								(138210275:::OID),
								(1366786547:::OID),
								(1967531877:::OID),
								(NULL),
								(0:::OID)
						)
							AS tab_1260 (col_3228)
		)
SELECT
	age(tab_1261._timestamptz::TIMESTAMPTZ, '3000-01-01 00:00:00+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL
		AS col_3229,
	NULL AS col_3230,
	tab_1261._string AS col_3231,
	1024737249:::INT8 AS col_3232,
	0.7723677158355713:::FLOAT8 AS col_3233,
	7355757945659975815:::INT8 AS col_3234,
	e'{"V s": {"j\\\\Qrc]Dl11d": {}}, "foobar": {"a": {"{CM^|[.MDdjC": []}, "foo": {}, "g\\"/=.AF(F1d": [[], {"b": true, "o ^FQ~": [[]]}, {}]}}':::JSONB
		AS col_3235,
	tab_1261._date AS col_3236,
	tab_1261._inet AS col_3237,
	tab_1261._int8 AS col_3238
FROM
	defaultdb.public.seed@[0] AS tab_1261
WHERE
	tab_1261._bool
LIMIT
	69:::INT8;

WITH
	with_439 (col_3239, col_3240, col_3241)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							NULL,
							crdb_internal.get_zone_config(((-3392498759596514324):::INT8::INT8 << NULL::INT8)::INT8::INT8)::BYTES,
							539780841:::OID
						),
						('17:51:09.516559':::TIME, NULL, 1615098306:::OID),
						(NULL, '\x74dab96f03':::BYTES, 3322391537:::OID),
						('05:14:22.295815':::TIME, '\x22':::BYTES, 2124864150:::OID),
						('21:25:07.245127':::TIME, '\x':::BYTES, 929145538:::OID),
						(NULL, '\x3a26e14acb2eb1':::BYTES, 0:::OID)
				)
					AS tab_1262 (col_3239, col_3240, col_3241)
		),
	with_440 (col_3242)
		AS (
			SELECT
				*
			FROM
				(VALUES ((-0.8575335339823331):::FLOAT8), (NULL), ((-0.9322662901166627):::FLOAT8))
					AS tab_1263 (col_3242)
		),
	with_441 (col_3244, col_3245)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							ARRAY[180281656:::OID,1881974696:::OID,0:::OID],
							(
								SELECT
									')/u&e[':::STRING:::NAME AS col_3243
								FROM
									defaultdb.public.seed AS tab_1264
									JOIN defaultdb.public.seed AS tab_1265 ON (tab_1264._jsonb) = (tab_1265._jsonb),
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1266
								WHERE
									true
								GROUP BY
									tab_1266._int4
								LIMIT
									1:::INT8
							)
						),
						(
							ARRAY[2751987618:::OID,3752175483:::OID,2295326957:::OID,2708477300:::OID,562901077:::OID,2875549394:::OID,503396209:::OID],
							'Xn':::STRING:::NAME
						)
				)
					AS tab_1267 (col_3244, col_3245)
		)
SELECT
	cte_ref_142.col_3240 AS col_3246
FROM
	with_439 AS cte_ref_142, with_439 AS cte_ref_143
LIMIT
	88:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1273 (_int2, _int4, _float8, _date, _timestamptz, _string, _inet, _jsonb)
SELECT
	tab_1274._int4 AS col_3254,
	tab_1274._int4 AS col_3255,
	(-0.01931429205075544):::FLOAT8 AS col_3256,
	tab_1274._date AS col_3257,
	'1970-01-04 13:30:34.000632+00:00':::TIMESTAMPTZ AS col_3258,
	tab_1274._string AS col_3259,
	tab_1274._inet AS col_3260,
	'[[[[{"hsQ<p": []}, [[{}]], {}]], [[], []], [], 1.1674389035644093], {}]':::JSONB AS col_3261
FROM
	defaultdb.public.seed@[0] AS tab_1274
ORDER BY
	tab_1274._int4 ASC, tab_1274._inet
LIMIT
	7:::INT8;

SELECT (-21221381273500825.98):::DECIMAL AS col_3262 FROM defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1275;

UPDATE defaultdb.public.seed AS tab_1276 SET _timestamptz = NULL WHERE true LIMIT 2:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1277
		(_int4, _int8, _date, _timestamp, _interval, _bool, _decimal, _string, _bytes, _uuid, _jsonb)
SELECT
	(-1475801664):::INT8 AS col_3263,
	NULL AS col_3264,
	'1970-07-01':::DATE AS col_3265,
	'0001-01-01 00:00:00+00:00':::TIMESTAMP AS col_3266,
	'80 years 56 days 00:02:34.031288':::INTERVAL AS col_3267,
	tab_1278._bool AS col_3268,
	(-8.927403379032042487E+25):::DECIMAL AS col_3269,
	tab_1278._string AS col_3270,
	tab_1278._bytes AS col_3271,
	'409aa1ca-a5e6-4e1d-9d8d-83f383664741':::UUID AS col_3272,
	tab_1278._jsonb AS col_3273
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1278
WHERE
	NULL
ORDER BY
	tab_1278._bytes, tab_1278._string, tab_1278._inet
LIMIT
	36:::INT8;

SELECT
	count(*) AS col_3274
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1279
GROUP BY
	tab_1279._jsonb
LIMIT
	61:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1280 (_int2, _int4, _float8, _timestamp, _bytes, _uuid, _inet)
SELECT
	tab_1281._int2 AS col_3275,
	tab_1281._int2 AS col_3276,
	(-0.11421729570707473):::FLOAT8 AS col_3277,
	tab_1281._timestamp AS col_3278,
	tab_1281._bytes AS col_3279,
	'dc6eb2ec-df09-48d7-afd9-82f2bc72dee4':::UUID AS col_3280,
	NULL AS col_3281
FROM
	defaultdb.public.seed@[0] AS tab_1281
LIMIT
	21:::INT8;

SELECT
	'{"bar": [[]], "f4>|WodlN@~@": [{}], "foo": []}':::JSONB AS col_3282,
	tab_1282._string AS col_3283,
	tab_1283._int4 AS col_3284,
	'1984-01-29':::DATE AS col_3285,
	tab_1283._timestamp AS col_3286,
	tab_1282._bytes AS col_3287,
	tab_1283._timestamp AS col_3288,
	tab_1283._int4 AS col_3289,
	'-77 years -6 mons -432 days -11:36:41.624886':::INTERVAL AS col_3290,
	tab_1282._uuid AS col_3291,
	tab_1283._int4 AS col_3292,
	true AS col_3293,
	'c537:89bb:69ea:5bc6:7fcb:a324:f4cb:bae9/12':::INET AS col_3294,
	tab_1283._string AS col_3295,
	tab_1282._timestamptz AS col_3296,
	tab_1282._int4 AS col_3297,
	1.6574087142944336:::FLOAT8 AS col_3298,
	tab_1282._bytes AS col_3299,
	tab_1283._float8 AS col_3300,
	true AS col_3301
FROM
	defaultdb.public.seed@[0] AS tab_1282, defaultdb.public.seed@[0] AS tab_1283
WHERE
	NULL
LIMIT
	9:::INT8;

DELETE FROM
	defaultdb.public.seed AS tab_1284
WHERE
	true
ORDER BY
	tab_1284._date ASC, tab_1284._timestamptz, tab_1284._inet, tab_1284._float8 DESC
LIMIT
	63:::INT8;

SELECT '3903181c-7f34-4d4a-8c25-85d3f89f2ec1':::UUID AS col_3302 LIMIT 94:::INT8;

WITH
	with_446 (col_3303)
		AS (
			SELECT
				*
			FROM
				(VALUES ('1973-09-23':::DATE), ('1985-05-09':::DATE), ('4714-11-24 BC':::DATE)) AS tab_1285 (col_3303)
		)
SELECT
	tab_1286._int4 AS col_3304,
	'\x27':::BYTES AS col_3305,
	(tab_1286._interval::INTERVAL / tab_1286._float8::FLOAT8)::INTERVAL AS col_3306,
	true AS col_3307,
	tab_1286._timestamp AS col_3308,
	tab_1286._int4 AS col_3309,
	tab_1286._float4 AS col_3310,
	tab_1286._decimal AS col_3311
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1286
LIMIT
	59:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1287
SET
	_uuid = tab_1287._uuid, _int8 = COALESCE(tab_1287._int8, tab_1287._int2), _bool = false
LIMIT
	13:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1288 (_int4, _int8, _float8, _timestamp, _timestamptz, _bool, _inet)
SELECT
	NULL AS col_3312,
	tab_1289._int8 AS col_3313,
	0.7541298897556201:::FLOAT8 AS col_3314,
	tab_1289._timestamp AS col_3315,
	tab_1289._timestamptz AS col_3316,
	false AS col_3317,
	NULL AS col_3318
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1289
WHERE
	false
LIMIT
	4:::INT8;

INSERT INTO defaultdb.public.seed AS tab_1290 DEFAULT VALUES;

INSERT
INTO
	defaultdb.public.seed AS tab_1291 (_int2, _int8, _float4, _float8, _timestamp, _interval, _decimal, _uuid)
WITH
	with_447 (col_3319) AS (SELECT * FROM (VALUES ('1986-08-04':::DATE)) AS tab_1292 (col_3319)),
	with_448 (col_3320)
		AS (
			SELECT * FROM (VALUES (NULL)) AS tab_1293 (col_3320)
			INTERSECT ALL
				SELECT
					*
				FROM
					(
						VALUES
							(NULL),
							('`kt':::STRING),
							(e'F=\n%':::STRING),
							(NULL),
							('K"rx':::STRING),
							(e'>MC\x12p:X\x19':::STRING)
					)
						AS tab_1294 (col_3321)
			INTERSECT ALL
				SELECT
					*
				FROM
					(
						VALUES
							(e'\r\x0f':::STRING),
							(e'\x1b$<':::STRING),
							(e'h-,\x17a\x1f\x03B\x7f':::STRING),
							(CASE WHEN NULL THEN e'3aw0$\x19~h':::STRING ELSE e'\x0f@{|Y\t\x15':::STRING END),
							(e'A|\x10H':::STRING)
					)
						AS tab_1295 (col_3322)
		)
SELECT
	1898:::INT8 AS col_3323,
	tab_1296._int8 AS col_3324,
	(-1.167396068572998):::FLOAT8 AS col_3325,
	tab_1296._float4 AS col_3326,
	'0001-01-01 00:00:00+00:00':::TIMESTAMP AS col_3327,
	'46 years 1 mon 298 days 02:16:46.848949':::INTERVAL AS col_3328,
	tab_1296._decimal AS col_3329,
	tab_1296._uuid AS col_3330
FROM
	defaultdb.public.seed@[0] AS tab_1296
ORDER BY
	tab_1296._int4 ASC;

INSERT
INTO
	defaultdb.public.seed AS tab_1297
		(_float4, _date, _timestamp, _timestamptz, _interval, _bool, _string, _bytes, _inet)
WITH
	with_449 (col_3331) AS (SELECT * FROM (VALUES ((-1967699150006908862):::INT8), (1:::INT8)) AS tab_1298 (col_3331))
SELECT
	CASE WHEN tab_1299._bool THEN (-0.2627427875995636):::FLOAT8 ELSE tab_1299._float4 END AS col_3332,
	'1970-08-30':::DATE AS col_3333,
	tab_1299._timestamp AS col_3334,
	'1970-01-06 16:22:08.000402+00:00':::TIMESTAMPTZ AS col_3335,
	age('1970-01-07 02:57:28.000072+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL AS col_3336,
	tab_1299._bool AS col_3337,
	e'!i\x1eZB6\x1d\x15[':::STRING AS col_3338,
	'\x1e45a65d':::BYTES AS col_3339,
	tab_1299._inet AS col_3340
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1299
LIMIT
	39:::INT8;

WITH
	with_450 (col_3341)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(
							'[null, [[true, [{}]], {"a": null, "baz": 0.2971510411143923, "c": {"yPLCV{oX": {}}}]]':::JSONB
						),
						(
							CASE
							WHEN true
							THEN e'["baz", [{}, false], {".\\\\aJM_Y1q": [{"a": [{"}P@4;sI!7*i": []}]}, []]}, [{}]]':::JSONB
							ELSE NULL
							END
						),
						(
							'[null, [{"*RABCQ": {}}], [null, null, {}], {"a": []}, {"c": []}, [[{}]], {}, {}, [[]]]':::JSONB
						),
						(
							e'[[{"\\\\3&#DV": [], "b": [[]], "bar": true}], [{}, "`*\'Y6(\'Iaa3", {"c": null}, {}], "bar"]':::JSONB
						),
						(
							e'[{"\\\\6T0U": {"VwNCB*{>tU=6": [], "baz": {}, "c": false, "foobar": [[null, null], {}], "hR0o": [{}]}}, {}]':::JSONB
						)
				)
					AS tab_1300 (col_3341)
		),
	with_451 (col_3342)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[(-14509):::INT8,(-3594):::INT8]),
						(
							ARRAY[(-5092):::INT8,11974:::INT8,32767:::INT8,(-8841):::INT8,10112:::INT8,(-17714):::INT8,(-1552):::INT8]
						),
						(ARRAY[(-29960):::INT8,(-8341):::INT8,31527:::INT8]),
						(ARRAY[25987:::INT8,0:::INT8,(-1):::INT8])
				)
					AS tab_1301 (col_3342)
		)
SELECT
	e'{"+vW{,": [], "93Sn": {"*s%G)qY]t": {"b": {"\'vyHSC\\\\_1": null, "a": [{}], "baz": 0.26895859664203126, "foo": null, "u1d\\\\H&#$:a": {}}}, "LH2R)S4n3v": [], "h)>FDuBOv|d": []}, "xcv": [{}]}':::JSONB
		AS col_3343,
	tab_1303._jsonb AS col_3344,
	cte_ref_145.col_3341 AS col_3345
FROM
	with_450 AS cte_ref_145,
	defaultdb.public.seed AS tab_1302
	JOIN defaultdb.public.seed AS tab_1303 ON (tab_1302._jsonb) = (tab_1303._jsonb)
LIMIT
	97:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1304
		(_int2, _int8, _float4, _date, _timestamp, _timestamptz, _interval, _string, _bytes, _uuid, _inet)
SELECT
	4855:::INT8 AS col_3346,
	octet_length('\x89b5b86ae1d00275':::BYTES::BYTES)::INT8 AS col_3347,
	NULL AS col_3348,
	'1982-07-09':::DATE AS col_3349,
	'-2000-01-01 00:00:00+00:00':::TIMESTAMP AS col_3350,
	'1970-01-05 17:40:32.000602+00:00':::TIMESTAMPTZ AS col_3351,
	'-25 years -6 mons -40 days -13:41:45.639432':::INTERVAL AS col_3352,
	e'hDXx\x14':::STRING AS col_3353,
	'\x74':::BYTES AS col_3354,
	'c947bd3f-e07c-4621-8d23-180a6711e8f5':::UUID AS col_3355,
	'bc0e:8563:9d1:fcf2:b98e:47b9:d83a:9c2c/15':::INET AS col_3356
LIMIT
	85:::INT8;

SELECT
	(-0.16530712003348214):::FLOAT8 AS col_3357,
	tab_1305._int8 AS col_3358,
	'00:00:00':::INTERVAL AS col_3359,
	(-5105051471893975434):::INT8 AS col_3360
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1305
WHERE
	tab_1305._bool
LIMIT
	75:::INT8;

SELECT
	count(*) AS col_3361
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1306
GROUP BY
	tab_1306._int8, tab_1306._float8, tab_1306._date
ORDER BY
	tab_1306._date ASC;

SELECT
	count(*) AS col_3362
FROM
	defaultdb.public.seed@[0] AS tab_1307
WHERE
	tab_1307._string
	ILIKE experimental_strftime('1970-01-11 07:16:40.000764+00:00':::TIMESTAMP::TIMESTAMP, tab_1307._string::STRING)::STRING
GROUP BY
	tab_1307._int8, tab_1307._float8, tab_1307._date;

SELECT
	(-0.3256397843360901):::FLOAT8 AS col_3363, 1064611100:::INT8 AS col_3364, tab_1308._float4 AS col_3365
FROM
	defaultdb.public.seed@[0] AS tab_1308
LIMIT
	28:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1309 (_int2, _float4, _float8, _timestamptz, _interval, _bool, _string, _jsonb)
SELECT
	tab_1310._int2 AS col_3366,
	1.6555590629577637:::FLOAT8 AS col_3367,
	(-0.7190960582481054):::FLOAT8 AS col_3368,
	'1970-01-03 18:45:31.000715+00:00':::TIMESTAMPTZ AS col_3369,
	tab_1310._interval AS col_3370,
	tab_1310._bool AS col_3371,
	tab_1310._string AS col_3372,
	'{"F/ntC(8{-:Ih": "ZS;Ep8{`bW:b", "aK:hirVJ_yJ": false}':::JSONB AS col_3373
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1310
ORDER BY
	tab_1310._float4 DESC, tab_1310._date ASC, tab_1310._date, tab_1310._float8 DESC;

UPDATE defaultdb.public.seed AS tab_1311 SET _timestamp = tab_1311._timestamp LIMIT 67:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1312 (_int2, _int4, _timestamp, _timestamptz, _interval, _bool, _string, _uuid)
WITH
	with_452 (col_3374)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(B'101100010101000111'),
						(B'001101111001001111'),
						(B'011010000000111101'),
						(B'100000101000101000')
				)
					AS tab_1313 (col_3374)
		),
	with_455 (col_3380)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(2130.052971214060847:::DECIMAL),
						((-1.234E+401):::DECIMAL),
						(cbrt((-48194764792.38324796):::DECIMAL::DECIMAL)::DECIMAL),
						((-3163.322234802919560):::DECIMAL),
						(
							(
								WITH
									with_453 (col_3375)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(782731215:::OID),
														(1798235218:::OID),
														(576593047:::OID),
														(NULL),
														(112956332:::OID),
														(NULL)
												)
													AS tab_1314 (col_3375)
										),
									with_454 (col_3376, col_3377, col_3378)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(
															'1986-07-28':::DATE,
															(-0.6921530961990356):::FLOAT8,
															'jK$':::STRING
														),
														(
															'1994-07-18':::DATE,
															0.738255500793457:::FLOAT8,
															e'fi\x01G1aAs}':::STRING
														)
												)
													AS tab_1315 (col_3376, col_3377, col_3378)
										)
								SELECT
									(-1.236355751612945855E+26):::DECIMAL AS col_3379
								FROM
									with_454 AS cte_ref_146
								WHERE
									((true OR ilike_escape(NULL::STRING, e'\f\x01,':::STRING::STRING, cte_ref_146.col_3378::STRING)::BOOL) AND false)
								LIMIT
									1:::INT8
							)
						)
				)
					AS tab_1316 (col_3380)
		),
	with_456 (col_3381)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							CASE
							WHEN like_escape(e'\x0eB{':::STRING::STRING, NULL::STRING, (rpad(e'\x03hm\x14GZ':::STRING::STRING, (-1659068826880615063):::INT8::INT8, '':::STRING::STRING)::STRING::STRING || '5KF>P3]#':::STRING::STRING)::STRING::STRING)::BOOL
							THEN NULL
							ELSE '1970-01-04 06:33:03.000381+00:00':::TIMESTAMPTZ
							END
						),
						('1970-01-05 13:42:28.000187+00:00':::TIMESTAMPTZ)
				)
					AS tab_1317 (col_3381)
		)
SELECT
	NULL AS col_3382,
	1274162422:::INT8 AS col_3383,
	NULL AS col_3384,
	'1970-01-11 15:53:30.000194+00:00':::TIMESTAMPTZ AS col_3385,
	'47 years 3 mons 181 days 09:33:29.462918':::INTERVAL AS col_3386,
	NULL AS col_3387,
	NULL AS col_3388,
	CASE
	WHEN NULL THEN '53d7ff92-d6d4-49bf-97ac-b52490170874':::UUID
	ELSE 'ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID
	END
		AS col_3389
FROM
	defaultdb.public.seed AS tab_1318 JOIN defaultdb.public.seed AS tab_1319 ON (tab_1318._jsonb) = (tab_1319._jsonb)
WHERE
	false
LIMIT
	75:::INT8;

SELECT
	tab_1320._uuid AS col_3390, '\x58':::BYTES AS col_3391, tab_1320._int4 AS col_3392, tab_1320._bool AS col_3393
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1320
WHERE
	NULL
ORDER BY
	tab_1320._interval ASC, tab_1320._int4 ASC
LIMIT
	15:::INT8;

SELECT
	e'/\f\x0b;\x05':::STRING AS col_3394, tab_1321._int8 AS col_3395
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1321
WHERE
	tab_1321._bool
ORDER BY
	tab_1321._string
LIMIT
	79:::INT8;

INSERT INTO defaultdb.public.seed AS tab_1322 DEFAULT VALUES;

WITH
	with_457 (col_3396)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(('1993-12-22':::DATE::DATE + 7932863500761049994:::INT8::INT8)::DATE),
						(('1995-03-20':::DATE::DATE - NULL::INT8)::DATE)
				)
					AS tab_1323 (col_3396)
		)
SELECT
	jsonb_agg(tab_1324._jsonb)::JSONB AS col_3397, min(tab_1325._jsonb::JSONB)::JSONB AS col_3398
FROM
	defaultdb.public.seed AS tab_1324 JOIN defaultdb.public.seed AS tab_1325 ON (tab_1324._jsonb) = (tab_1325._jsonb)
WHERE
	(NOT true)
GROUP BY
	tab_1324._jsonb, tab_1325._jsonb
HAVING
	ilike_escape('N':::STRING::STRING, NULL::STRING, 'S':::STRING::STRING)::BOOL
LIMIT
	40:::INT8;

WITH
	with_458 (col_3399) AS (SELECT * FROM (VALUES (1131599:::OID), (2772818307:::OID)) AS tab_1326 (col_3399))
SELECT
	tab_1328._uuid AS col_3400,
	(-7193):::INT8 AS col_3401,
	NULL AS col_3402,
	(true AND false) AS col_3403,
	'60aa:c69b:a738:1c3e:e7b9:5f:38a0:78bb/114':::INET AS col_3404,
	87874859:::INT8 AS col_3405,
	tab_1327._float4 AS col_3406,
	NULL AS col_3407
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1327
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1328 ON (tab_1327._int8) = (tab_1328._int2)
WHERE
	false
ORDER BY
	tab_1327._float4 ASC, tab_1327._inet, tab_1327._uuid;

SELECT
	count(*) AS col_3408
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1329
WHERE
	tab_1329._bool
GROUP BY
	tab_1329._jsonb
HAVING
	inet_contains_or_equals('204.26.153.70/1':::INET::INET, 'fbbb:eca9:de55:aec5:bc4f:811a:6194:b743/22':::INET::INET)::BOOL;

UPDATE defaultdb.public.seed AS tab_1330 SET _inet = tab_1330._inet WHERE true LIMIT 20:::INT8;

DELETE FROM defaultdb.public.seed AS tab_1331 WHERE tab_1331._bool;

UPDATE
	defaultdb.public.seed AS tab_1332
SET
	_decimal = (-5.404988985130757924E+24):::DECIMAL, _int4 = tab_1332._int4
WHERE
	tab_1332._bool;

UPDATE
	defaultdb.public.seed AS tab_1337
SET
	_int8 = tab_1337._int2
ORDER BY
	tab_1337._string DESC, tab_1337._inet DESC
LIMIT
	89:::INT8;

SELECT
	tab_1340._jsonb AS col_3422, (-753755590):::INT8 AS col_3423, tab_1340._timestamptz AS col_3424
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1340
ORDER BY
	tab_1340._inet, tab_1340._interval DESC
LIMIT
	4:::INT8;

WITH
	with_464 (col_3425)
		AS (
			SELECT
				*
			FROM
				(VALUES (0:::OID), (3124055047:::OID), (327873650:::OID), (NULL), (NULL)) AS tab_1341 (col_3425)
		),
	with_465 (col_3426)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'*g\fE\x05&VB*':::STRING),
						(e'\x0e\x02M':::STRING),
						('':::STRING),
						(NULL),
						(e'7cc\x1a\x155F]j':::STRING)
				)
					AS tab_1342 (col_3426)
		),
	with_466 (col_3427)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(true),
						(false),
						(
							('6e79:b4ff:c4de:e626:8ff6:ea28:f8ee:ad03/116':::INET::INET << 'c9ab:1354:9483:7b38:8c14:69c0:80b0:9cb/85':::INET::INET)::BOOL
						),
						(true),
						(false),
						(true)
				)
					AS tab_1343 (col_3427)
			UNION ALL
				SELECT
					*
				FROM
					(
						VALUES
							(false),
							(true),
							(true),
							(true),
							(
								((to_english(663289656996393157:::INT8::INT8)::STRING ~* e'dg\x070fOtO':::STRING) AND (NULL AND true))
							),
							(false)
					)
						AS tab_1344 (col_3428)
		)
SELECT
	(
		WITH
			with_467 (col_3429)
				AS (
					SELECT * FROM (VALUES (1064022069:::OID)) AS tab_1345 (col_3429)
					INTERSECT SELECT * FROM (VALUES (NULL), (NULL)) AS tab_1346 (col_3430)
				)
		SELECT
			ARRAY[false,false] AS col_3431
		FROM
			with_467 AS cte_ref_148
		ORDER BY
			cte_ref_148.col_3429
		LIMIT
			1:::INT8
	)
		AS col_3432
LIMIT
	43:::INT8;

WITH
	with_468 (col_3433, col_3434)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[(-24666):::INT8], 8182589914016.878534:::DECIMAL),
						(ARRAY[93:::INT8], (-4.451799305434746706E+21):::DECIMAL),
						(ARRAY[13474:::INT8,24133:::INT8], (-2533360946267699.198):::DECIMAL),
						(
							ARRAY[23152:::INT8,19971:::INT8],
							(CASE WHEN false THEN 4.206106467493753857E+24:::DECIMAL ELSE (-1.604084938953919325E+26):::DECIMAL END::DECIMAL / (-6569759171599919676):::INT8::INT8)::DECIMAL
						),
						(ARRAY[5621:::INT8,(-1):::INT8,12818:::INT8,16606:::INT8], 0.454442650122777250:::DECIMAL),
						(ARRAY[15615:::INT8], (-0.3097795649928046583):::DECIMAL)
				)
					AS tab_1347 (col_3433, col_3434)
		)
SELECT
	cte_ref_149.col_3433 AS col_3435, NULL AS col_3436
FROM
	with_468 AS cte_ref_149
WHERE
	false;

SELECT B'0000000000000000000000000000000000000000000000000000000000000000' AS col_3437 LIMIT 84:::INT8;

SELECT '1970-01-03 19:59:21.000475+00:00':::TIMESTAMPTZ AS col_3438 LIMIT 52:::INT8;

SELECT
	'{"..wi": [[[false]], {"LrS0Ah+=?": []}, [{}, {}], {"baz": [], "c": "&e9", "{f3XzQ*b": []}], "b": false, "foo": {"i7h(ih:w:": null}}':::JSONB
		AS col_3439,
	tab_1348._jsonb AS col_3440
FROM
	defaultdb.public.seed AS tab_1348 JOIN defaultdb.public.seed AS tab_1349 ON (tab_1348._jsonb) = (tab_1349._jsonb)
LIMIT
	10:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1350
SET
	_timestamptz = '1970-01-03 01:42:52.000916+00:00':::TIMESTAMPTZ
WHERE
	false
LIMIT
	2:::INT8;

SELECT
	'5072:6a7c:3ffd:d051:a0c9:c54c:94d9:847e':::INET AS col_3441,
	tab_1351._float4 AS col_3442,
	'1970-01-07 06:48:25.000805+00:00':::TIMESTAMPTZ AS col_3443
FROM
	defaultdb.public.seed@[0] AS tab_1351
WHERE
	false
LIMIT
	87:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1352
SELECT
	tab_1353._int8 AS col_3444,
	tab_1353._int8 AS col_3445,
	sum_int(tab_1353._int8::INT8)::INT8 AS col_3446,
	(-0.6779988408088684):::FLOAT8 AS col_3447,
	corr(tab_1353._int8::INT8, tab_1353._float4::FLOAT8)::FLOAT8 AS col_3448,
	min(tab_1353._date::DATE) OVER (PARTITION BY tab_1353._float4 ORDER BY tab_1353._int8 ASC GROUPS NULL PRECEDING)::DATE
		AS col_3449,
	timezone(e'%\x0e5{':::STRING::STRING, '1970-01-07 19:35:54.00068+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::TIMESTAMP
		AS col_3450,
	current_timestamp(tab_1353._int8::INT8):::TIMESTAMPTZ::TIMESTAMPTZ AS col_3451,
	age(experimental_strptime(NULL::STRING, e'/!NW\x1b':::STRING::STRING)::TIMESTAMPTZ::TIMESTAMPTZ, ('-82 years -7 mons -995 days -19:58:27.100983':::INTERVAL::INTERVAL + '1970-01-05 18:09:04.00096+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL
		AS col_3452,
	inet_contained_by_or_equals('3b4f:2d3e:991:f6c5:d06d:ac91:5c50:874/88':::INET::INET, '103.80.248.26/26':::INET::INET)::BOOL
		AS col_3453,
	abs((-0.7687275977068970391):::DECIMAL::DECIMAL)::DECIMAL AS col_3454,
	substr(']@':::STRING::STRING, e'\x18y\x11\x0e=e\x03':::STRING::STRING, e'\x01':::STRING::STRING)::STRING
		AS col_3455,
	right(NULL::BYTES, tab_1353._int8::INT8)::BYTES AS col_3456,
	crdb_internal.cluster_id()::UUID AS col_3457,
	broadcast('23.159.94.208/19':::INET::INET)::INET AS col_3458,
	json_agg(tab_1353._date)::JSONB AS col_3459
FROM
	defaultdb.public.seed@[0] AS tab_1353
WHERE
	false
GROUP BY
	tab_1353._date, tab_1353._int8, tab_1353._float4
ORDER BY
	tab_1353._date, tab_1353._int8
LIMIT
	47:::INT8;

WITH
	with_469 (col_3460, col_3461, col_3462)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'T%nj@7\x03':::STRING, '1970-01-01 06:24:55.000605+00:00':::TIMESTAMP, NULL),
						('A`':::STRING, '1970-01-07 10:26:35.000712+00:00':::TIMESTAMP, 1389249192:::INT8),
						(
							e'v\x06f\x06H0t\x07':::STRING,
							'1970-01-04 14:04:33.000006+00:00':::TIMESTAMP,
							2147483647:::INT8
						)
				)
					AS tab_1354 (col_3460, col_3461, col_3462)
		)
SELECT
	e'[{"Is([71": [], "MC*FbwC(Y9o": "El$f{Au+&=<>", "S\'v": [{}], "bar": {"b": false, "baz": true}}, false, {"Kp8(#KR99": true, "aq2.QUI": 0.24923090743354318, "nuw": {"bar": 0.09854802576513544}}]':::JSONB
		AS col_3463,
	tab_1355._jsonb AS col_3464
FROM
	defaultdb.public.seed AS tab_1355 JOIN defaultdb.public.seed AS tab_1356 ON (tab_1355._jsonb) = (tab_1356._jsonb)
LIMIT
	31:::INT8;

SELECT NULL AS col_3465 LIMIT 43:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1357
SET
	_float8 = tab_1357._float4,
	_timestamptz = tab_1357._timestamptz,
	_string = COALESCE(tab_1357._string, e'1 \x17':::STRING),
	_timestamp = '1970-01-04 15:05:49.000434+00:00':::TIMESTAMP,
	_interval = tab_1357._interval,
	_uuid = tab_1357._uuid
WHERE
	false;

SELECT
	tab_1358._inet AS col_3466,
	(-8.837452975219812075E+33):::DECIMAL AS col_3467,
	tab_1358._date AS col_3468,
	'0.0.0.0/0':::INET AS col_3469,
	tab_1358._int4 AS col_3470,
	'-51 years -6 mons -632 days -09:13:04.619857':::INTERVAL AS col_3471,
	(-1.234E+401):::DECIMAL AS col_3472
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1358, defaultdb.public.seed@[0] AS tab_1359
WHERE
	tab_1359._bool
ORDER BY
	tab_1358._int8, tab_1359._timestamptz ASC
LIMIT
	41:::INT8;

WITH
	with_470 (col_3473)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'\ni':::STRING:::NAME),
						('dk':::STRING:::NAME),
						('.':::STRING:::NAME),
						(e'6\x1fE\x15':::STRING:::NAME),
						(e'/p[s\x1eI':::STRING:::NAME),
						(NULL)
				)
					AS tab_1360 (col_3473)
		)
SELECT
	'\xee4c840a77':::BYTES AS col_3474;

SELECT
	tab_1362._date AS col_3475
FROM
	defaultdb.public.seed@[0] AS tab_1361, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1362
LIMIT
	15:::INT8;

SELECT
	tab_1367._interval AS col_3481,
	NULL AS col_3482,
	(-1.5094380378723145):::FLOAT8 AS col_3483,
	tab_1367._timestamptz AS col_3484,
	tab_1366._inet AS col_3485,
	tab_1367._timestamptz AS col_3486,
	true AS col_3487,
	'{"foo": true}':::JSONB AS col_3488,
	tab_1366._int2 AS col_3489,
	'':::STRING AS col_3490
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1366,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1367
WHERE
	tab_1366._bool;

WITH
	with_474 (col_3491, col_3492)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1.2420869722065393:::FLOAT8, 0:::OID),
						(0.1891234996679294:::FLOAT8, 1487523326:::OID),
						(NULL, NULL)
				)
					AS tab_1368 (col_3491, col_3492)
		),
	with_475 (col_3493)
		AS (SELECT * FROM (VALUES (4099845024:::OID), (1681327130:::OID), (NULL)) AS tab_1369 (col_3493))
SELECT
	cte_ref_151.col_3491 AS col_3494,
	cte_ref_152.col_3492 AS col_3495,
	cte_ref_152.col_3492 AS col_3496,
	cte_ref_152.col_3491 AS col_3497
FROM
	with_474 AS cte_ref_151, with_474 AS cte_ref_152
WHERE
	false;

INSERT INTO defaultdb.public.seed AS tab_1370 DEFAULT VALUES;

SELECT
	min(tab_1371._jsonb::JSONB)::JSONB AS col_3498
FROM
	defaultdb.public.seed@[0] AS tab_1371
	JOIN defaultdb.public.seed@[0] AS tab_1372 ON (tab_1371._date) = (tab_1372._date)
GROUP BY
	tab_1371._jsonb
LIMIT
	57:::INT8;

SELECT
	NULL AS col_3499,
	tab_1373._bool AS col_3500,
	tab_1373._int2 AS col_3501,
	'1970-01-11 20:03:47.000383+00:00':::TIMESTAMPTZ AS col_3502,
	'\xc69b32f4dfd803':::BYTES AS col_3503,
	tab_1373._float8 AS col_3504,
	NULL AS col_3505,
	tab_1373._jsonb AS col_3506,
	tab_1373._date AS col_3507,
	(-1.4266254450723226):::FLOAT8 AS col_3508,
	tab_1373._int2 AS col_3509,
	tab_1373._int8 AS col_3510,
	tab_1373._uuid AS col_3511,
	tab_1373._decimal AS col_3512
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1373
ORDER BY
	tab_1373._decimal
LIMIT
	87:::INT8;

SELECT count(*) AS col_3513 FROM defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1374 GROUP BY tab_1374._jsonb;

SELECT
	tab_1377._interval AS col_3514,
	tab_1375._int2 AS col_3515,
	NULL AS col_3516,
	'\x8adedf35915c66b3':::BYTES AS col_3517,
	e'[[{"c": {"vJAa": {}}}, {"b": "c", "k+3p\\\\D=": {"c": {"bar": "baz"}}}, [[]], [], {}], false, {}]':::JSONB
		AS col_3518,
	div((-6.46453178922915093E+25):::DECIMAL::DECIMAL, 8.679593205172886978:::DECIMAL::DECIMAL)::DECIMAL AS col_3519
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1375
	LEFT JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1376
		JOIN defaultdb.public.seed@[0] AS tab_1377 ON (tab_1376._interval) = (tab_1377._interval) ON true
ORDER BY
	tab_1377._bool ASC, tab_1376._interval
LIMIT
	76:::INT8;

SELECT
	count(*) AS col_3536
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1382
GROUP BY
	tab_1382._jsonb
HAVING
	not_like_escape((tab_1382._jsonb::JSONB->>(-128):::INT8::INT8)::STRING::STRING, e'JtO\x17\x0bZ(k':::STRING::STRING, 'FEX#':::STRING::STRING)::BOOL
LIMIT
	92:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1383
SET
	_interval = NULL, _timestamptz = statement_timestamp():::TIMESTAMPTZ::TIMESTAMPTZ
ORDER BY
	tab_1383._float4
LIMIT
	37:::INT8;

UPDATE defaultdb.public.seed AS tab_1384 SET _interval = NULL;

SELECT
	tab_1386._bool AS col_3537
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1385, defaultdb.public.seed@[0] AS tab_1386
LIMIT
	41:::INT8;

SELECT
	'118.82.214.181/9':::INET AS col_3538, 0.36086141077947176:::FLOAT8 AS col_3539, NULL AS col_3540
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1387,
	defaultdb.public.seed@[0] AS tab_1388,
	defaultdb.public.seed@[0] AS tab_1389
WHERE
	e']@\ro+':::STRING::STRING NOT IN (tab_1388._string, quote_ident(e'q\x0b\x0eU':::STRING::STRING)::STRING)
ORDER BY
	tab_1388._float4 ASC, tab_1388._uuid, tab_1389._int2 DESC, tab_1389._decimal DESC, tab_1388._int8 DESC
LIMIT
	100:::INT8;

SELECT
	count(*) AS col_3541
FROM
	defaultdb.public.seed@[0] AS tab_1390
GROUP BY
	tab_1390._jsonb
HAVING
	isnan((-7.033651406096365685E+31):::DECIMAL::DECIMAL)::BOOL;

SELECT
	0.14460702240467072:::FLOAT8 AS col_3542,
	tab_1391._float4 AS col_3543,
	'\x28fb':::BYTES AS col_3544,
	tab_1391._string AS col_3545,
	(-1.3201924562454224):::FLOAT8 AS col_3546,
	tab_1391._int2 AS col_3547,
	'1970-01-02 09:31:38.000758+00:00':::TIMESTAMPTZ AS col_3548
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1391
	INNER JOIN defaultdb.public.seed@[0] AS tab_1392 ON false,
	defaultdb.public.seed@[0] AS tab_1393
ORDER BY
	tab_1391._bool;

WITH
	with_476 (col_3549) AS (SELECT * FROM (VALUES (ARRAY[]:::OID[])) AS tab_1394 (col_3549)),
	with_477 (col_3550)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), ('1985-11-02':::DATE), (NULL), (NULL), ('1980-03-14':::DATE)) AS tab_1395 (col_3550)
		),
	with_478 (col_3551)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(current_timestamp():::TIMESTAMPTZ::TIMESTAMPTZ),
						(
							CASE
							WHEN true THEN '1970-01-09 08:50:25.0001+00:00':::TIMESTAMPTZ
							ELSE '1970-01-04 16:57:58.000378+00:00':::TIMESTAMPTZ
							END
						),
						('1970-01-10 15:06:05.000631+00:00':::TIMESTAMPTZ),
						(NULL),
						(NULL),
						(NULL)
				)
					AS tab_1396 (col_3551)
		)
SELECT
	'1970-01-09 04:50:38.000537+00:00':::TIMESTAMPTZ AS col_3552
FROM
	with_478 AS cte_ref_153;

SELECT
	tab_1399._timestamp AS col_3553,
	tab_1399._float8 AS col_3554,
	tab_1398._date AS col_3555,
	tab_1399._uuid AS col_3556,
	tab_1397._jsonb AS col_3557
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1397,
	defaultdb.public.seed@[0] AS tab_1398,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1399
LIMIT
	30:::INT8;

WITH
	with_479 (col_3558) AS (SELECT * FROM (VALUES (3892118591:::OID)) AS tab_1400 (col_3558))
SELECT
	tab_1401._int4 AS col_3559, tab_1401._float4 AS col_3560, tab_1402._int2 AS col_3561
FROM
	defaultdb.public.seed@[0] AS tab_1401
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1402 ON (tab_1401._string) = (tab_1402._string)
LIMIT
	27:::INT8;

SELECT
	NULL AS col_3562,
	tab_1403._int4 AS col_3563,
	tab_1403._timestamp AS col_3564,
	tab_1403._int2 AS col_3565,
	'1974-07-16':::DATE AS col_3566,
	tab_1403._string AS col_3567,
	tab_1403._interval AS col_3568
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1403
WHERE
	tab_1403._bool
ORDER BY
	tab_1403._int2
LIMIT
	80:::INT8;

SELECT
	(-1583934633):::INT8 AS col_3569,
	tab_1404._jsonb AS col_3570,
	'':::STRING AS col_3571,
	NULL AS col_3572,
	(-1131546375783959473):::INT8 AS col_3573
FROM
	defaultdb.public.seed@[0] AS tab_1404
WHERE
	true
ORDER BY
	tab_1404._int4, tab_1404._float4 DESC
LIMIT
	18:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1405
		(_int4, _float8, _date, _timestamptz, _interval, _bool, _decimal, _string, _bytes, _inet)
WITH
	with_480 (col_3574)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-78098115999878.19615):::DECIMAL),
						(
							COALESCE(
								round(log((-0.5846453134904024811):::DECIMAL::DECIMAL)::DECIMAL::DECIMAL, (-6843255257129961149):::INT8::INT8)::DECIMAL,
								7.221424231081330605E+35:::DECIMAL
							)
						),
						(66238368.05226133769:::DECIMAL),
						((-80826645631677053.04):::DECIMAL)
				)
					AS tab_1406 (col_3574)
		)
SELECT
	456793033:::INT8 AS col_3575,
	(-0.11974326523680294):::FLOAT8 AS col_3576,
	'-infinity':::DATE AS col_3577,
	'1970-01-11 10:57:45.000942+00:00':::TIMESTAMPTZ AS col_3578,
	'-71 years -11 mons -266 days -20:11:47.850027':::INTERVAL AS col_3579,
	('aea:245d:18ab:12ab:642b:60d8:fb6e:2a34/49':::INET::INET >> netmask((5977775647814785004:::INT8::INT8 + '5c94:fc61:6892:1382:525c:4deb:6b00:b214/124':::INET::INET)::INET::INET)::INET::INET)::BOOL
		AS col_3580,
	NULL AS col_3581,
	e'\x03@v,O\x14':::STRING AS col_3582,
	'\x':::BYTES AS col_3583,
	'217.245.174.253/14':::INET AS col_3584;

WITH
	with_481 (col_3585) AS (SELECT * FROM (VALUES (((-1.2524412870407104):::FLOAT8,))) AS tab_1407 (col_3585)),
	with_482 (col_3586)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[(-128):::INT8]),
						(ARRAY[27328:::INT8,(-25842):::INT8,17818:::INT8]),
						(ARRAY[(-1):::INT8,(-7493):::INT8,2193:::INT8,(-1):::INT8])
				)
					AS tab_1408 (col_3586)
		)
SELECT
	(0.3409753739833832:::FLOAT8,) AS col_3587
FROM
	with_481 AS cte_ref_154
WHERE
	inet_contains_or_equals('229.171.202.107/1':::INET::INET, '0.0.0.0/0':::INET::INET)::BOOL
ORDER BY
	cte_ref_154.col_3585 ASC, cte_ref_154.col_3585
LIMIT
	95:::INT8;

WITH
	with_483 (col_3588)
		AS (SELECT * FROM (VALUES ('1970-01-07 01:27:24.000182+00:00':::TIMESTAMP)) AS tab_1409 (col_3588)),
	with_484 (col_3589, col_3590)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(e'[{"baz": {"YFKa_": [], "a": {}, "baz": [[]]}, "foobar": null, "}g~xWFWu": {"V{FS`Uk\'4n": null, "a": 0.07805698955954038, "wIZ@c=": []}}, "baz", []]':::JSONB::JSONB - ARRAY['q':::STRING,e'"f[U`\t\'"#':::STRING,'@2UYL':::STRING,e'#\x0b\x0f\x0fB':::STRING]::STRING[])::JSONB,
							3905366201:::OID
						)
				)
					AS tab_1410 (col_3589, col_3590)
		)
SELECT
	tab_1411._uuid AS col_3591,
	'16 years 9 mons 294 days 21:36:33.980155':::INTERVAL AS col_3592,
	tab_1411._timestamp AS col_3593
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1411
WHERE
	NULL
LIMIT
	48:::INT8;

WITH
	with_485 (col_3594)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((e'l|% \x06\x04_lW':::STRING, false, '04:26:29.853093':::TIME, 2044406977:::OID)),
						((e'T\x13.CJ:':::STRING, false, '15:10:08.254598':::TIME, 2357723851:::OID))
				)
					AS tab_1412 (col_3594)
		)
SELECT
	count(*) AS col_3595
FROM
	defaultdb.public.seed@[0] AS tab_1413
WHERE
	tab_1413._bool
GROUP BY
	tab_1413._jsonb
HAVING
	inet_contained_by_or_equals((SELECT tab_1414._inet AS col_3596 FROM defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1414 ORDER BY tab_1414._float4 DESC LIMIT 1:::INT8)::INET, '187.151.54.151/8':::INET::INET)::BOOL
LIMIT
	69:::INT8;

UPDATE defaultdb.public.seed AS tab_1415 SET _uuid = tab_1415._uuid, _decimal = tab_1415._decimal;

WITH
	with_486 (col_3597, col_3598)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('%M':::STRING, '0001-01-01 00:00:00+00:00':::TIMESTAMP),
						('':::STRING, '1970-01-04 04:45:24.00027+00:00':::TIMESTAMP),
						('[k8GQN':::STRING, '1970-01-03 07:35:58.000202+00:00':::TIMESTAMP),
						(CASE WHEN false THEN e'K\x14\n-S':::STRING ELSE NULL END, NULL),
						(e'.\x1aHQ/[':::STRING, '1970-01-06 14:44:54.000018+00:00':::TIMESTAMP)
				)
					AS tab_1416 (col_3597, col_3598)
		)
SELECT
	7442662450090797703:::INT8 AS col_3599, NULL AS col_3600, 1054638957:::INT8 AS col_3601
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1417
LIMIT
	9:::INT8;

WITH
	with_487 (col_3611, col_3612)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							date_trunc(crdb_internal.locality_value(e'\x1e~e':::STRING::STRING)::STRING::STRING, '11:23:43.116562':::TIME::TIME)::INTERVAL,
							0:::OID
						)
				)
					AS tab_1422 (col_3611, col_3612)
		)
SELECT
	(-63685.94379633534368):::DECIMAL AS col_3613
LIMIT
	69:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1423
WITH
	with_488 (col_3614) AS (SELECT * FROM (VALUES (ARRAY[1681724240:::OID]), (NULL)) AS tab_1424 (col_3614)),
	with_489 (col_3615, col_3616)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('3000-01-01 00:00:00+00:00':::TIMESTAMPTZ, B'0110110010001100'),
						(NULL, B'0010010010101011'),
						(NULL, B'1110000111101111')
				)
					AS tab_1425 (col_3615, col_3616)
		)
SELECT
	CASE WHEN true THEN 5469:::INT8 ELSE (-15173):::INT8 END AS col_3617,
	(-34421269):::INT8 AS col_3618,
	count_rows()::INT8 AS col_3619,
	1.7046986818313599:::FLOAT8 AS col_3620,
	atan2((-2.631031740044175):::FLOAT8::FLOAT8, (1.4428899368559467:::FLOAT8::FLOAT8 % (-0.15816055784879274):::FLOAT8::FLOAT8)::FLOAT8::FLOAT8)::FLOAT8
		AS col_3621,
	localtimestamp():::DATE::DATE AS col_3622,
	current_timestamp(5651700735355596432:::INT8::INT8):::TIMESTAMP::TIMESTAMP AS col_3623,
	transaction_timestamp():::TIMESTAMPTZ::TIMESTAMPTZ AS col_3624,
	date_trunc('':::STRING::STRING, current_time():::TIME::TIME::TIME)::INTERVAL AS col_3625,
	similar_to_escape(e';y\n\f_':::STRING::STRING, 'j':::STRING::STRING, e'5]\x1a\x0bQ`e':::STRING::STRING)::BOOL
		AS col_3626,
	cluster_logical_timestamp()::DECIMAL AS col_3627,
	btrim('gb{$':::STRING::STRING, NULL::STRING)::STRING AS col_3628,
	right('\x51e8d7fc9d37dc5b61':::BYTES::BYTES, (-8835413243139782450):::INT8::INT8)::BYTES AS col_3629,
	crdb_internal.cluster_id()::UUID AS col_3630,
	broadcast('30.7.44.110/20':::INET::INET)::INET AS col_3631,
	jsonb_insert((e'[[false, {"baz": [], "d8YV": "R,-b)\\","}, [null, {"bar": {}, "foobar": {"M~B": null}}], "KUthqy;PAbO"], {}, false]':::JSONB::JSONB - (abs((-4923069301532244845):::INT8::INT8)::INT8::INT8 % NULL::INT8)::INT8::INT8)::JSONB::JSONB, ARRAY['?Y':::STRING,'':::STRING,'':::STRING]::STRING[], '1':::JSONB::JSONB)::JSONB
		AS col_3632
FROM
	with_489 AS cte_ref_155
WHERE
	NULL
GROUP BY
	cte_ref_155.col_3616
LIMIT
	54:::INT8;

SELECT
	count(*) AS col_3633
FROM
	defaultdb.public.seed@[0] AS tab_1426
GROUP BY
	tab_1426._int8, tab_1426._float8, tab_1426._date
ORDER BY
	tab_1426._int8;

UPDATE defaultdb.public.seed AS tab_1427 SET _timestamptz = tab_1427._timestamptz LIMIT 39:::INT8;

SELECT
	tab_1428._interval AS col_3634,
	tab_1429._decimal AS col_3635,
	tab_1429._date AS col_3636,
	tab_1428._timestamp AS col_3637,
	e'{"c": {"<}}S{": [{"<N`eDf?x": 0.32034348538039376, "baz": {}}], "[,1": false, "j#wBGiot;r": [[[[]], {}], {"\'~VXB^-;&": {}}, false, false]}, "u#W3": true}':::JSONB
		AS col_3638
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1428,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1429
ORDER BY
	tab_1428._interval DESC
LIMIT
	89:::INT8;

SELECT
	'9b8d4712-3291-4d3b-bdf0-0ba2ccc72f14':::UUID AS col_3639
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1430
WHERE
	NULL;

UPDATE
	defaultdb.public.seed AS tab_1431
SET
	_decimal = COALESCE((-3.920716736614145757E+36):::DECIMAL, tab_1431._decimal)
WHERE
	tab_1431._bool;

WITH
	with_490 (col_3640)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(('00000000-0000-0000-0000-000000000000':::UUID,)),
						(('43edb110-a18b-4c03-b06f-f5f66c674fa6':::UUID,)),
						(('0624ba89-8b85-4fe0-90dd-23cfedc56a05':::UUID,)),
						(('8d9d9804-6b79-4b95-a70b-10bc3b954a0e':::UUID,)),
						(NULL),
						(('d8059c5d-34d7-4db1-b4cb-dc2633a15281':::UUID,))
				)
					AS tab_1432 (col_3640)
		)
SELECT
	('50c35e0f-f428-470d-978c-8564b57119c5':::UUID,) AS col_3641
FROM
	with_490 AS cte_ref_156
GROUP BY
	cte_ref_156.col_3640
LIMIT
	45:::INT8;

SELECT
	tab_1433._jsonb AS col_3645
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1433
WHERE
	NULL::UUID
	NOT IN (
			WITH
				with_491 (col_3642) AS (SELECT * FROM (VALUES (e'\\1~Bym\x18e4':::STRING)) AS tab_1434 (col_3642)),
				with_492 (col_3643)
					AS (
						SELECT
							*
						FROM
							(VALUES (NULL), (NULL), (NULL), (3487819941:::OID), (2147556086:::OID))
								AS tab_1435 (col_3643)
					)
			SELECT
				tab_1433._uuid::UUID AS col_3644
			FROM
				with_492 AS cte_ref_157
			LIMIT
				13:::INT8
		)
LIMIT
	26:::INT8;

DELETE FROM defaultdb.public.seed AS tab_1436 WHERE false ORDER BY tab_1436._int8 DESC LIMIT 20:::INT8;

WITH
	with_493 (col_3646)
		AS (SELECT * FROM (VALUES ('14:40:01.532806':::TIME), (NULL), ('00:00:00':::TIME)) AS tab_1437 (col_3646))
SELECT
	tab_1438._int2 AS col_3647,
	'c927:5ec6:a2d4:f524:d9b4:3d5e:55c4:71a3/27':::INET AS col_3648,
	tab_1438._float8 AS col_3649,
	(-19080):::INT8 AS col_3650
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1438
WHERE
	tab_1438._bool;

WITH
	with_494 (col_3651)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(COALESCE(e'CZ;\x1e\x18Yh':::STRING, e'\x0f\n/pO;':::STRING)),
						(e'\x0foo\x10':::STRING),
						(e'\x04':::STRING),
						('':::STRING)
				)
					AS tab_1439 (col_3651)
		),
	with_495 (col_3652)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(B'10100100001001001101001001011001100010001'),
						(B'11001011000011000101000101111010011101010'),
						(B'0000000000000000000000000000000000000000000000000000000000000000')
				)
					AS tab_1440 (col_3652)
		)
SELECT
	tab_1441._decimal AS col_3661,
	'-39 years -4 mons -299 days -23:10:13.194044':::INTERVAL AS col_3662,
	NULL AS col_3663,
	'1970-01-06 09:16:37.0001+00:00':::TIMESTAMPTZ AS col_3664,
	NULL AS col_3665,
	tab_1441._bool AS col_3666,
	tab_1441._int4 AS col_3667,
	tab_1441._float8 AS col_3668
FROM
	with_494 AS cte_ref_158, defaultdb.public.seed@[0] AS tab_1441
WHERE
	(tab_1441._bool AND EXISTS (WITH with_496 (col_3653) AS (SELECT * FROM (VALUES (1877152213:::OID), (4232987083:::OID), (1293688663:::OID)) AS tab_1442 (col_3653)), with_497 (col_3654) AS (SELECT * FROM (VALUES (0:::OID), (NULL)) AS tab_1443 (col_3654)), with_498 (col_3655, col_3656) AS (SELECT * FROM (VALUES ('\xdf':::BYTES, 19645:::INT8), ('\x471f1cbe470d8db9':::BYTES, 15987:::INT8), ('\xcb':::BYTES, 25480:::INT8)) AS tab_1444 (col_3655, col_3656) EXCEPT SELECT * FROM (VALUES ('\x5e1adfb139':::BYTES, (-4320):::INT8), (left('\x9d63f261c2':::BYTES::BYTES, ((-6995321510390976570):::INT8::INT8 * (-6040256796256512741):::INT8::INT8)::INT8::INT8)::BYTES, CASE WHEN true THEN CASE WHEN NULL THEN 3477:::INT8 ELSE NULL END ELSE 2165:::INT8 END), ('\x9b53e2cb4a85aa5754':::BYTES, 19261:::INT8), ('\x':::BYTES, 25102:::INT8), ('\x8c':::BYTES, NULL)) AS tab_1445 (col_3657, col_3658)) SELECT '1970-01-11 20:21:42.000453+00:00':::TIMESTAMP AS col_3659, tab_1441._jsonb AS col_3660 FROM with_498 AS cte_ref_159 WHERE false ORDER BY cte_ref_159.col_3656, cte_ref_159.col_3655 LIMIT 56:::INT8))
ORDER BY
	cte_ref_158.col_3651 ASC, tab_1441._int4 DESC, tab_1441._int8
LIMIT
	65:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1446 (_int2, _int4, _int8, _date, _timestamptz, _bool, _uuid)
SELECT
	18007:::INT8 AS col_3669,
	tab_1447._int8 AS col_3670,
	NULL AS col_3671,
	'1983-01-27':::DATE AS col_3672,
	tab_1447._timestamptz AS col_3673,
	tab_1447._bool AS col_3674,
	'b9e364c5-65b9-4abc-90f5-7bb63d2e99f9':::UUID AS col_3675
FROM
	defaultdb.public.seed@[0] AS tab_1447
WHERE
	tab_1447._bool;

WITH
	with_499 (col_3676)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							ARRAY['142.205.129.222/6':::INET,'7e:226e:e3f6:505f:677a:cc1d:6725:4c60/87':::INET,'174.180.53.134/22':::INET]
						)
				)
					AS tab_1448 (col_3676)
		)
SELECT
	count(*) AS col_3677
FROM
	defaultdb.public.seed@[0] AS tab_1449
GROUP BY
	tab_1449._jsonb
HAVING
	like_escape('':::STRING::STRING, (e'_v?]\x05':::STRING::STRING || '#wCI':::STRING::STRING)::STRING::STRING, (SELECT tab_1450._string AS col_3678 FROM defaultdb.public.seed@[0] AS tab_1450 LIMIT 1:::INT8)::STRING)::BOOL
LIMIT
	36:::INT8;

WITH
	with_500 (col_3679, col_3680)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							('29 years 7 mons 410 days 21:17:59.721327':::INTERVAL::INTERVAL - '-60 years -7 mons -975 days -19:57:01.493366':::INTERVAL::INTERVAL)::INTERVAL,
							false
						)
				)
					AS tab_1451 (col_3679, col_3680)
		),
	with_501 (col_3681)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('11:11:36.17651-05:09:00':::TIMETZ),
						('01:35:38.259986-08:18:00':::TIMETZ),
						('18:55:46.184692-05:58:00':::TIMETZ),
						(localtime():::TIMETZ::TIMETZ),
						('22:14:16.60377-00:13:00':::TIMETZ),
						('09:08:49.132033+13:03:00':::TIMETZ)
				)
					AS tab_1452 (col_3681)
		),
	with_502 (col_3682) AS (SELECT * FROM (VALUES (266859849:::INT8), (NULL)) AS tab_1453 (col_3682))
SELECT
	true AS col_3683
FROM
	defaultdb.public.seed@[0] AS tab_1454, with_500 AS cte_ref_160, with_502 AS cte_ref_161
LIMIT
	60:::INT8;

WITH
	with_503 (col_3684)
		AS (
			SELECT
				1.2527964115142822:::FLOAT8 AS col_3684
			FROM
				defaultdb.public.seed@[0] AS tab_1455
				JOIN defaultdb.public.seed AS tab_1456
					JOIN defaultdb.public.seed AS tab_1457 ON (tab_1456._int8) = (tab_1457._int8) ON
						(tab_1455._date) = (tab_1456._date)
			WHERE
				false
			GROUP BY
				tab_1455._string, tab_1455._int4, tab_1455._timestamptz, tab_1455._date
		)
SELECT
	2.2166030406951904:::FLOAT8 AS col_3685
FROM
	with_503 AS cte_ref_162;

INSERT INTO defaultdb.public.seed AS tab_1458 DEFAULT VALUES;

DELETE FROM
	defaultdb.public.seed AS tab_1459
WHERE
	EXISTS(
		SELECT
			('[[[{"0LDx<,Jg": {">g$Ns~(z": 0.03733764960889869}, "baz": {}}, {"aGMR_V% {2": []}], "IV7j?uuam", {}], {"!5!3*^V;5_8=": []}, {}, [[]]]':::JSONB, 3177740740:::OID, 13215:::INT8, e';\x0f\n':::STRING)
				AS col_3686
		FROM
			defaultdb.public.seed@[0] AS tab_1460
		ORDER BY
			tab_1460._float4 ASC
		LIMIT
			11:::INT8
	)
LIMIT
	42:::INT8;

SELECT
	tab_1462._bool AS col_3687,
	'\xe29883':::BYTES AS col_3688,
	'-81 years -3 mons -755 days -13:16:44.777216':::INTERVAL AS col_3689,
	tab_1462._decimal AS col_3690,
	NULL AS col_3691,
	tab_1461._uuid AS col_3692,
	tab_1462._int8 AS col_3693,
	isnan(CASE WHEN false THEN ((-4052592115796994216):::INT8::INT8 / (-3900269081950992923):::INT8::INT8)::DECIMAL ELSE tab_1461._decimal END::DECIMAL)::BOOL
		AS col_3694,
	1103553429:::INT8 AS col_3695,
	(-1.381584184313015327E+28):::DECIMAL AS col_3696
FROM
	defaultdb.public.seed@[0] AS tab_1461, defaultdb.public.seed@[0] AS tab_1462
WHERE
	tab_1462._bool;

WITH
	with_504 (col_3697)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(CASE WHEN true THEN 11755:::INT8 ELSE (-5495):::INT8 END),
						(NULL),
						(NULL),
						(NULL),
						((-19335):::INT8)
				)
					AS tab_1463 (col_3697)
		),
	with_505 (col_3698)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'f\x16,!':::STRING),
						(NULL),
						(e'Um\r%':::STRING),
						(NULL),
						(
							('null':::JSONB::JSONB#>>ARRAY['':::STRING,'<d~tt7rCR':::STRING,e'\U00002603':::STRING]::STRING[])::STRING
						),
						('"0C':::STRING)
				)
					AS tab_1464 (col_3698)
		),
	with_506 (col_3699)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						('1970-01-02 16:50:38.000267+00:00':::TIMESTAMP),
						('1970-01-08 01:31:43.00038+00:00':::TIMESTAMP),
						('1970-01-04 23:40:07.000076+00:00':::TIMESTAMP),
						(NULL),
						(
							COALESCE(
								'1970-01-07 11:07:01.000317+00:00':::TIMESTAMP,
								'1970-01-03 01:25:41.000774+00:00':::TIMESTAMP
							)
						)
				)
					AS tab_1465 (col_3699)
		)
SELECT
	md5(cte_ref_163.col_3698::STRING)::STRING AS col_3700
FROM
	with_505 AS cte_ref_163
WHERE
	false
LIMIT
	76:::INT8;

WITH
	with_507 (col_3701)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-8.563693850308349849E+19):::DECIMAL),
						((-650366.6790805222080):::DECIMAL),
						((-63270775571.18623098):::DECIMAL),
						((-3.205109720168020309E+22):::DECIMAL)
				)
					AS tab_1466 (col_3701)
		),
	with_508 (col_3702) AS (SELECT * FROM (VALUES (NULL)) AS tab_1467 (col_3702))
SELECT
	(-1.881260173323592):::FLOAT8 AS col_3703;

UPDATE defaultdb.public.seed AS tab_1468 SET _bytes = tab_1468._bytes;

WITH
	with_509 (col_3704) AS (SELECT * FROM (VALUES (NULL)) AS tab_1469 (col_3704)),
	with_510 (col_3705)
		AS (SELECT * FROM (VALUES (0.6340674757957458:::FLOAT8), (0.6892939805984497:::FLOAT8)) AS tab_1470 (col_3705))
SELECT
	1:::INT8 AS col_3706,
	NULL AS col_3707,
	e'[[{"l7&:{MIj3i": [{"foo": "c"}]}, [{}], "foo"], {"E.(": {"A>n~g?\'": {".~u": [], "JWt(": []}}, "_&GRB": null}]':::JSONB
		AS col_3708
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1471
	JOIN defaultdb.public.seed@[0] AS tab_1472 ON
			(tab_1471._string) = (tab_1472._string)
			AND (tab_1471._int4) = (tab_1472._int4)
			AND (tab_1471._timestamptz) = (tab_1472._timestamptz)
LIMIT
	81:::INT8;

WITH
	with_511 (col_3709) AS (SELECT * FROM (VALUES (NULL), (B'01'), (B'10')) AS tab_1473 (col_3709)),
	with_512 (col_3710) AS (SELECT * FROM (VALUES (NULL), ('1987-08-19':::DATE)) AS tab_1474 (col_3710))
SELECT
	29625:::INT8 AS col_3711
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1475
LIMIT
	100:::INT8;

SELECT
	'true':::JSONB AS col_3712
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1476,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1477
WHERE
	false
LIMIT
	29:::INT8;

SELECT
	tab_1478._interval AS col_3713,
	tab_1478._timestamp AS col_3714,
	tab_1478._timestamptz AS col_3715,
	tab_1478._decimal AS col_3716
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1478
ORDER BY
	tab_1478._uuid ASC
LIMIT
	5:::INT8;

WITH
	with_513 (col_3717)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('06:29:10.493102-04:22:00':::TIMETZ),
						('00:00:00+15:59:00':::TIMETZ),
						('22:09:50.416655-08:07:00':::TIMETZ),
						('08:15:01.258262-04:57:00':::TIMETZ)
				)
					AS tab_1479 (col_3717)
		),
	with_514 (col_3718)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[1370550710:::OID]),
						(ARRAY[0:::OID,3055404298:::OID,87315937:::OID,2209940529:::OID,3607370278:::OID]),
						(ARRAY[867181607:::OID,4113537914:::OID,0:::OID])
				)
					AS tab_1480 (col_3718)
		)
SELECT
	() AS col_3719
LIMIT
	98:::INT8;

WITH
	with_515 (col_3720)
		AS (
			SELECT
				*
			FROM
				(VALUES (1516247989:::OID), (NULL), (0:::OID), (4282957425:::OID), (NULL)) AS tab_1481 (col_3720)
		)
SELECT
	2602936554:::OID AS col_3721
LIMIT
	50:::INT8;

SELECT 4208938619:::OID AS col_3722 LIMIT 1:::INT8;

SELECT
	tab_1483._int2 AS col_3723, tab_1483._bool AS col_3724, 0:::INT8 AS col_3725, tab_1483._float8 AS col_3726
FROM
	defaultdb.public.seed@[0] AS tab_1483
WHERE
	(tab_1483._bool AND (NULL OR false))
ORDER BY
	tab_1483._timestamptz ASC, tab_1483._date, tab_1483._bool ASC, tab_1483._int8 ASC, tab_1483._date ASC
LIMIT
	99:::INT8;

UPDATE defaultdb.public.seed AS tab_1484 SET _date = tab_1484._date LIMIT 42:::INT8;

UPDATE defaultdb.public.seed AS tab_1485 SET _int2 = tab_1485._int8 WHERE tab_1485._bool LIMIT 82:::INT8;

UPDATE defaultdb.public.seed AS tab_1486 SET _float8 = tab_1486._float4;

WITH
	with_516 (col_3727) AS (SELECT * FROM (VALUES ((-74192645440.7928261):::DECIMAL)) AS tab_1487 (col_3727)),
	with_517 (col_3728)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(0.10572503035811395:::FLOAT8),
						(1.8169505708047171:::FLOAT8),
						(((-0.7008156191065009):::FLOAT8::FLOAT8 - 0.5481660881698829:::FLOAT8::FLOAT8)::FLOAT8),
						(0.2876725777973463:::FLOAT8),
						(NULL),
						((-0.8828215827824852):::FLOAT8)
				)
					AS tab_1488 (col_3728)
		)
SELECT
	tab_1490._uuid AS col_3730,
	tab_1490._date AS col_3731,
	258595.8261376513202:::DECIMAL AS col_3732,
	tab_1490._date AS col_3733,
	1121444425929474694:::INT8 AS col_3734,
	tab_1489._bytes AS col_3735,
	tab_1489._inet AS col_3736
FROM
	with_517 AS cte_ref_164,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1489,
	defaultdb.public.seed@[0] AS tab_1490
WHERE
	'13:35:35.901373+03:38:00':::TIMETZ::TIMETZ
	NOT IN (
			SELECT
				'08:20:40.335591+05:56:00':::TIMETZ::TIMETZ AS col_3729
			FROM
				defaultdb.public.seed AS tab_1491
				JOIN defaultdb.public.seed AS tab_1492 ON (tab_1491._int8) = (tab_1492._int8)
			WHERE
				false
			ORDER BY
				tab_1492._date DESC
			LIMIT
				39:::INT8
		)
LIMIT
	67:::INT8;

SELECT
	((-0.3257675997992193):::FLOAT8::FLOAT8 / (-0.19212869158189172):::FLOAT8::FLOAT8)::FLOAT8 AS col_3737,
	tab_1494._float8 AS col_3738,
	tab_1494._uuid AS col_3739
FROM
	defaultdb.public.seed@[0] AS tab_1493, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1494
WHERE
	tab_1494._bool
LIMIT
	73:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1498
WITH
	with_519 (col_3748, col_3749)
		AS (
			SELECT
				755748623:::INT8 AS col_3748, '.':::STRING:::NAME AS col_3749
			FROM
				defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1499
			INTERSECT ALL
				SELECT
					*
				FROM
					(VALUES (COALESCE((-1136839855):::INT8, (-583268516):::INT8), '4':::STRING:::NAME))
						AS tab_1500 (col_3750, col_3751)
		),
	with_520 (col_3752) AS (SELECT * FROM (VALUES (1674256176:::INT8), ((-925805608):::INT8)) AS tab_1501 (col_3752)),
	with_521 (col_3753)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('r':::STRING),
						('oyb':::STRING),
						(e'uFYg\x04wG|\b':::STRING),
						(e'=\'\x17wWw':::STRING),
						(e'<Sxz:?}x\x1b':::STRING)
				)
					AS tab_1502 (col_3753)
		)
SELECT
	23909:::INT8 AS col_3754,
	23021574:::INT8 AS col_3755,
	NULL AS col_3756,
	COALESCE(NULL, NULL) AS col_3757,
	0.23510666170699746:::FLOAT8 AS col_3758,
	NULL AS col_3759,
	'1970-01-10 17:14:23.000152+00:00':::TIMESTAMP AS col_3760,
	(experimental_follower_read_timestamp()::TIMESTAMPTZ::TIMESTAMPTZ - '-29 years -8 mons -498 days -09:04:28.895007':::INTERVAL::INTERVAL)::TIMESTAMPTZ
		AS col_3761,
	'8 years 5 mons 547 days 22:14:26.850613':::INTERVAL AS col_3762,
	false AS col_3763,
	1.089024853673866971E+25:::DECIMAL AS col_3764,
	(SELECT e'bU$}y\x7fX\x10':::STRING AS col_3765 FROM defaultdb.public.seed@[0] AS tab_1505 LIMIT 1:::INT8)
		AS col_3766,
	CASE WHEN false THEN NULL ELSE '\xfa052592095b':::BYTES END AS col_3767,
	'8588ce33-1644-4111-ae4d-c5f077e4d0dd':::UUID AS col_3768,
	NULL AS col_3769,
	tab_1504._jsonb AS col_3770
FROM
	defaultdb.public.seed AS tab_1503 JOIN defaultdb.public.seed AS tab_1504 ON (tab_1503._jsonb) = (tab_1504._jsonb)
LIMIT
	30:::INT8;

WITH
	with_522 (col_3771) AS (SELECT * FROM (VALUES (NULL), ('':::STRING)) AS tab_1506 (col_3771)),
	with_523 (col_3772)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1622558087:::INT8),
						((-487792779):::INT8),
						(1539616918:::INT8),
						(550146911:::INT8),
						(1304024611:::INT8),
						((-609865043):::INT8)
				)
					AS tab_1507 (col_3772)
		),
	with_524 (col_3773) AS (SELECT * FROM (VALUES ((-3937):::INT8), (19223:::INT8)) AS tab_1508 (col_3773))
SELECT
	tab_1509._int8 AS col_3774,
	0.45849431971704147:::FLOAT8 AS col_3775,
	tab_1509._bool AS col_3776,
	tab_1509._int4 AS col_3777,
	'b6cc:6e4:5d7e:ecb3:3c09:ddc8:8030:1bc3/54':::INET AS col_3778
FROM
	defaultdb.public.seed@[0] AS tab_1509;

SELECT
	count(*) AS col_3779
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1510
WHERE
	true
GROUP BY
	tab_1510._int8, tab_1510._float8
HAVING
	inet_contained_by_or_equals('f527:1959:dfc0:7832:c073:14be:9936:d1aa/89':::INET::INET, 'c459:5449:4dcb:8481:908f:dca6:9a57:d8d/82':::INET::INET)::BOOL
ORDER BY
	tab_1510._float8 DESC
LIMIT
	50:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1511
SET
	_decimal = 6879564884272.764886:::DECIMAL
ORDER BY
	tab_1511._uuid, tab_1511._uuid ASC, tab_1511._float4 DESC
LIMIT
	30:::INT8;

WITH
	with_525 (col_3780) AS (SELECT * FROM (VALUES (1736736475:::INT8)) AS tab_1512 (col_3780)),
	with_526 (col_3781)
		AS (
			SELECT
				*
			FROM
				(VALUES (8279:::INT8), ((-15101):::INT8), (10998:::INT8), ((-29638):::INT8)) AS tab_1513 (col_3781)
		),
	with_527 (col_3782) AS (SELECT * FROM (VALUES (3162449690:::OID), (2856718871:::OID)) AS tab_1514 (col_3782))
SELECT
	(-1):::INT8 AS col_3783
FROM
	with_526 AS cte_ref_165
LIMIT
	42:::INT8;

DELETE FROM defaultdb.public.seed AS tab_1515 LIMIT 7:::INT8;

SELECT
	tab_1516._date AS col_3784, tab_1516._float4 AS col_3785, tab_1516._int4 AS col_3786
FROM
	defaultdb.public.seed@[0] AS tab_1516
WHERE
	true
ORDER BY
	tab_1516._uuid, tab_1516._interval DESC, tab_1516._float8 ASC
LIMIT
	16:::INT8;

SELECT
	'\x9953':::BYTES AS col_3788,
	(-0.012003152317010823):::FLOAT8 AS col_3789,
	(-0.20236118137836456):::FLOAT8 AS col_3790,
	tab_1517._int4 AS col_3791,
	tab_1517._string AS col_3792,
	'14 years 10 mons 681 days 06:39:28.045426':::INTERVAL AS col_3793
FROM
	defaultdb.public.seed@[0] AS tab_1517
WHERE
	EXISTS(
		SELECT
			ARRAY[0:::OID,3401913929:::OID,2142510039:::OID,443056682:::OID] AS col_3787
		FROM
			defaultdb.public.seed@[0] AS tab_1518
		WHERE
			tab_1518._bool
		LIMIT
			47:::INT8
	)
ORDER BY
	tab_1517._bytes, tab_1517._float8 ASC, tab_1517._int2 DESC
LIMIT
	1:::INT8;

WITH
	with_528 (col_3794)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							CASE
							WHEN true THEN ARRAY[]:::NAME[]
							ELSE ARRAY[e'gS\'\x11{;\b8':::STRING:::NAME,e'g\x0bJp-Na':::STRING:::NAME,e'\U00002603':::STRING]
							END
						),
						(
							ARRAY['&Sjg<ERn`':::STRING:::NAME,e'R?qXT*\x16\x10':::STRING:::NAME,'r/)':::STRING:::NAME,e'\'':::STRING:::NAME]
						),
						(ARRAY[e'q6\x14W':::STRING:::NAME,'4c%I&N':::STRING:::NAME,e'(<\x04\t@3U+a':::STRING:::NAME]),
						(ARRAY[]:::NAME[])
				)
					AS tab_1519 (col_3794)
		),
	with_529 (col_3795) AS (SELECT * FROM (VALUES (NULL), ('20:36:38.501668+09:07:00':::TIMETZ)) AS tab_1520 (col_3795))
SELECT
	'05:24:41.065686-04:58:00':::TIMETZ AS col_3796
FROM
	with_529 AS cte_ref_166
WHERE
	false;

WITH
	with_530 (col_3797)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							e'{"a": false, "b": {"L&-6BMf": {"${#$b =RsM": {}, ".G>s/\'dI=D3|": {"s@#77v[": false}, "aAN": "b<%", "foo": []}, "L/5L%EPhYg": [[[1.0210470728973673]]]}}':::JSONB
						),
						(
							jsonb_object(ARRAY['':::STRING,e'k\x02EN{P':::STRING]::STRING[], ARRAY[':r1&?':::STRING,e'\x043>!q8\x1do':::STRING,'':::STRING,'':::STRING]::STRING[])::JSONB
						),
						(NULL),
						(NULL),
						(
							'{"bar": 1.9779663978913298, "lp%L!:DT": [[{"U9L|0Yd^=v@o": []}, false, "y*m", [[]], [], []], 1.8033217193724838, {}, 0.5725442548993906]}':::JSONB
						),
						(
							e'{"An((Drc{nL-": {"b": {" \\"A*,QoXk>a": 0.8120295156274476}, "c": null, "seX<;`|,C\\\\": []}, "baz": {"V VzOA": [":n>rdd+o^g?q"], "a": {}, "c": [], "foo": {"$\\\\FYr": [], "baz": []}}}':::JSONB
						)
				)
					AS tab_1521 (col_3797)
		),
	with_531 (col_3799)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(2392859321:::OID),
						(1433245359:::OID),
						(1215973063:::OID),
						(1867874310:::OID),
						(
							(
								SELECT
									4078220795:::OID AS col_3798
								FROM
									defaultdb.public.seed@[0] AS tab_1522
								LIMIT
									1:::INT8
							)
						),
						(3036595639:::OID)
				)
					AS tab_1523 (col_3799)
		)
SELECT
	525299146:::OID AS col_3800
FROM
	with_531 AS cte_ref_167
ORDER BY
	cte_ref_167.col_3799;

WITH
	with_532 (col_3801) AS (SELECT * FROM (VALUES (NULL)) AS tab_1524 (col_3801))
SELECT
	'1970-01-01':::DATE AS col_3802,
	tab_1526._int8 AS col_3803,
	tab_1525._float4 AS col_3804,
	tab_1525._decimal AS col_3805,
	tab_1526._int8 AS col_3806,
	'00000000-0000-0000-0000-000000000000':::UUID AS col_3807
FROM
	defaultdb.public.seed@[0] AS tab_1525
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1526 ON
			(tab_1525._date) = (tab_1526._date) AND (tab_1525._int8) = (tab_1526._int2),
	with_532 AS cte_ref_168
WHERE
	tab_1526._bool;

UPDATE
	defaultdb.public.seed AS tab_1527
SET
	_inet = 'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET
WHERE
	(NOT tab_1527._bool)
LIMIT
	63:::INT8;

SELECT (-29100):::INT8 AS col_3808 FROM defaultdb.public.seed@[0] AS tab_1528;

WITH
	with_533 (col_3809)
		AS (
			SELECT * FROM (VALUES ((-0.682157576084137):::FLOAT8), (1.5697742700576782:::FLOAT8)) AS tab_1529 (col_3809)
		)
SELECT
	tab_1530._int2 AS col_3810,
	(-8.87599770320048257E+24):::DECIMAL AS col_3811,
	e'0.sY8Q\x17\x0e\r':::STRING AS col_3812
FROM
	defaultdb.public.seed@[0] AS tab_1530
WHERE
	(NOT true)
LIMIT
	10:::INT8;

WITH
	with_534 (col_3813) AS (SELECT * FROM (VALUES (2843559324:::OID)) AS tab_1531 (col_3813))
SELECT
	tab_1533._interval AS col_3814,
	tab_1533._bool AS col_3815,
	NULL AS col_3816,
	tab_1533._string AS col_3817,
	NULL AS col_3818,
	tab_1532._interval AS col_3819,
	32767:::INT8 AS col_3820,
	tab_1533._int8 AS col_3821,
	tab_1533._bytes AS col_3822,
	'2b0:944e:8c51:9f3b:e034:2835:21bd:abab/112':::INET AS col_3823,
	tab_1533._timestamptz AS col_3824,
	tab_1533._date AS col_3825,
	(-378689145504.4396171):::DECIMAL AS col_3826,
	tab_1532._string AS col_3827,
	tab_1532._int8 AS col_3828,
	tab_1533._uuid AS col_3829,
	'\xe6cede46':::BYTES AS col_3830,
	(-1):::INT8 AS col_3831
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1532
	LEFT JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1533 ON true
WHERE
	tab_1533._bool
ORDER BY
	tab_1533._int4 DESC
LIMIT
	58:::INT8;

DELETE FROM defaultdb.public.seed AS tab_1534 WHERE tab_1534._bool;

INSERT
INTO
	defaultdb.public.seed AS tab_1535
SELECT
	tab_1536._int2 AS col_3832,
	(-1833575069):::INT8 AS col_3833,
	(-1053023763685778809):::INT8 AS col_3834,
	tab_1536._float4 AS col_3835,
	(-1.3106174771533068):::FLOAT8 AS col_3836,
	tab_1536._date AS col_3837,
	tab_1536._timestamp AS col_3838,
	'1970-01-04 19:52:20.000103+00:00':::TIMESTAMPTZ AS col_3839,
	NULL AS col_3840,
	false AS col_3841,
	69677135167332244.02:::DECIMAL AS col_3842,
	e'$q\x02Sa\x07':::STRING AS col_3843,
	'\x940cc2c14771b0':::BYTES AS col_3844,
	'ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID AS col_3845,
	tab_1536._inet AS col_3846,
	tab_1536._jsonb AS col_3847
FROM
	defaultdb.public.seed@[0] AS tab_1536
ORDER BY
	tab_1536._uuid DESC
LIMIT
	12:::INT8;

WITH
	with_535 (col_3848) AS (SELECT * FROM (VALUES (0:::OID)) AS tab_1537 (col_3848)),
	with_536 (col_3849) AS (SELECT * FROM (VALUES ('-Inf':::FLOAT8)) AS tab_1538 (col_3849))
SELECT
	cte_ref_169.col_3848 AS col_3850
FROM
	with_535 AS cte_ref_169
WHERE
	(false AND false)
ORDER BY
	cte_ref_169.col_3848
LIMIT
	78:::INT8;

SELECT
	tab_1539._jsonb AS col_3851,
	tab_1539._date AS col_3852,
	tab_1539._decimal AS col_3853,
	(-1):::INT8 AS col_3854,
	tab_1539._int4 AS col_3855,
	NULL AS col_3856,
	'\xcf':::BYTES AS col_3857,
	tab_1539._inet AS col_3858,
	tab_1539._string AS col_3859,
	'1970-01-02 20:50:48.000375+00:00':::TIMESTAMP AS col_3860,
	tab_1539._interval AS col_3861,
	tab_1539._bool AS col_3862
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1539
WHERE
	true
ORDER BY
	tab_1539._int2 DESC;

INSERT
INTO
	defaultdb.public.seed AS tab_1545
WITH
	with_542 (col_3873)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(
							timezone('05:50:17.547072+13:58:00':::TIMETZ::TIMETZ, e'nM`\x12Uam?':::STRING::STRING)::TIMETZ
						),
						('18:55:06.537802-03:33:00':::TIMETZ),
						('15:21:52.186065-12:26:00':::TIMETZ)
				)
					AS tab_1546 (col_3873)
		),
	with_543 (col_3874) AS (SELECT * FROM (VALUES (NULL), (2845648151:::OID)) AS tab_1547 (col_3874)),
	with_544 (col_3875)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('99.219.241.108':::INET),
						(broadcast('f3ac:533f:83da:18b6:b857:9cc6:a947:da9b/4':::INET::INET)::INET)
				)
					AS tab_1548 (col_3875)
		)
SELECT
	(-25890):::INT8 AS col_3876,
	355229665:::INT8 AS col_3877,
	32767:::INT8 AS col_3878,
	tab_1549._float4 AS col_3879,
	tab_1549._float8 AS col_3880,
	tab_1549._date AS col_3881,
	tab_1549._timestamp AS col_3882,
	tab_1549._timestamptz AS col_3883,
	NULL AS col_3884,
	tab_1549._bool AS col_3885,
	9.214592530672860976E+32:::DECIMAL AS col_3886,
	tab_1549._string AS col_3887,
	'\x5e4a3a5f':::BYTES AS col_3888,
	tab_1549._uuid AS col_3889,
	tab_1549._inet AS col_3890,
	tab_1549._jsonb AS col_3891
FROM
	defaultdb.public.seed@[0] AS tab_1549
LIMIT
	51:::INT8;

SELECT
	1:::INT8 AS col_3892,
	tab_1550._date AS col_3893,
	627279435427605066:::INT8 AS col_3894,
	tab_1550._timestamp AS col_3895,
	tab_1550._float4 AS col_3896,
	NULL AS col_3897,
	(-239915726):::INT8 AS col_3898,
	3.757179904802727631E+29:::DECIMAL AS col_3899,
	tab_1550._inet AS col_3900,
	'\x':::BYTES AS col_3901,
	false AS col_3902,
	tab_1550._string AS col_3903,
	'1970-01-10 21:02:29.000315+00:00':::TIMESTAMPTZ AS col_3904,
	NULL AS col_3905,
	tab_1550._float8 AS col_3906,
	'-30 years -11 mons -894 days -09:05:44.749899':::INTERVAL AS col_3907
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1550
WHERE
	false
LIMIT
	66:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1551 (_int4, _int8, _float4, _float8, _date, _interval, _bool, _string, _uuid, _jsonb)
WITH
	with_545 (col_3908)
		AS (
			SELECT
				*
			FROM
				(VALUES ((-0.5860784358958274):::FLOAT8), ((-1.2589741259825744):::FLOAT8)) AS tab_1552 (col_3908)
		),
	with_546 (col_3909)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-4516824022818498347):::INT8),
						(7541160308635368537:::INT8),
						((-998827026056967961):::INT8),
						((-2603883241910762132):::INT8),
						((-2898472288989929519):::INT8),
						((-2506065977746934088):::INT8)
				)
					AS tab_1553 (col_3909)
		),
	with_547 (col_3910)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-10 10:37:39.000636+00:00':::TIMESTAMPTZ),
						('1970-01-03 01:11:59.000925+00:00':::TIMESTAMPTZ)
				)
					AS tab_1554 (col_3910)
		)
SELECT
	(-1288076865):::INT8 AS col_3911,
	tab_1555._int8 AS col_3912,
	tab_1555._float4 AS col_3913,
	tab_1555._float4 AS col_3914,
	tab_1555._date AS col_3915,
	tab_1555._interval AS col_3916,
	tab_1555._bool AS col_3917,
	NULL AS col_3918,
	tab_1555._uuid AS col_3919,
	tab_1555._jsonb AS col_3920
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1555
WHERE
	true;

SELECT
	count(*) AS col_3921
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1556
WHERE
	false
GROUP BY
	tab_1556._int8, tab_1556._float8, tab_1556._date
HAVING
	isnan(0.03093648396163644362:::DECIMAL::DECIMAL)::BOOL
LIMIT
	55:::INT8;

SELECT
	tab_1557._float4 AS col_3922,
	'63e4ad65-a856-43b9-bf45-d11fca301412':::UUID AS col_3923,
	tab_1557._float4 AS col_3924,
	(-7.808677068918486427E+24):::DECIMAL AS col_3925
FROM
	defaultdb.public.seed@[0] AS tab_1557
ORDER BY
	tab_1557._timestamp ASC, tab_1557._int2 ASC, tab_1557._date DESC
LIMIT
	24:::INT8;

DELETE FROM defaultdb.public.seed AS tab_1558 ORDER BY tab_1558._interval ASC LIMIT 97:::INT8;

WITH
	with_548 (col_3926)
		AS (SELECT * FROM (VALUES (NULL), (e'\x00':::STRING), ('nY|kN"':::STRING)) AS tab_1559 (col_3926)),
	with_549 (col_3927)
		AS (SELECT * FROM (VALUES ('ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID)) AS tab_1560 (col_3927))
SELECT
	NULL AS col_3928,
	tab_1561._float8 AS col_3929,
	tab_1562._timestamp AS col_3930,
	tab_1562._jsonb AS col_3931,
	(-1674199548):::INT8 AS col_3932,
	'1970-01-07 08:34:08.000684+00:00':::TIMESTAMPTZ AS col_3933,
	'1987-09-13':::DATE AS col_3934,
	tab_1562._inet AS col_3935,
	tab_1562._timestamp AS col_3936,
	tab_1561._float8 AS col_3937
FROM
	defaultdb.public.seed@[0] AS tab_1561
	CROSS JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1562,
	with_548 AS cte_ref_172
WHERE
	true;

INSERT
INTO
	defaultdb.public.seed AS tab_1572 (_int4, _int8, _float4, _date, _timestamp, _bool, _decimal, _uuid)
SELECT
	975502258:::INT8 AS col_3962,
	fnv32(NULL::STRING)::INT8 AS col_3963,
	(-2.1809513568878174):::FLOAT8 AS col_3964,
	localtimestamp(8679028913761349791:::INT8::INT8):::DATE::DATE AS col_3965,
	max(tab_1573._timestamp::TIMESTAMP)::TIMESTAMP AS col_3966,
	isnan((-0.45252974217985964):::FLOAT8::FLOAT8)::BOOL AS col_3967,
	log((-1.502459750407967379E+32):::DECIMAL::DECIMAL)::DECIMAL AS col_3968,
	crdb_internal.cluster_id()::UUID AS col_3969
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1573
WHERE
	tab_1573._bool
GROUP BY
	tab_1573._timestamp, tab_1573._bytes, tab_1573._timestamptz;

INSERT INTO defaultdb.public.seed AS tab_1574 DEFAULT VALUES;

SELECT (-2096027615):::INT8 AS col_3970 LIMIT 20:::INT8;

INSERT INTO defaultdb.public.seed AS tab_1575 DEFAULT VALUES;

WITH
	with_555 (col_3971)
		AS (
			SELECT
				*
			FROM
				(VALUES (771790814:::OID), (531509170:::OID), (3821689088:::OID), (398012566:::OID))
					AS tab_1576 (col_3971)
		)
SELECT
	1078311019:::OID AS col_3972, 1267729378:::OID AS col_3973
FROM
	with_555 AS cte_ref_176, with_555 AS cte_ref_177
WHERE
	NULL::UUID IN ('00000000-0000-0000-0000-000000000000':::UUID, '9c574161-0058-4dff-953b-d180bd95fa53':::UUID)
LIMIT
	67:::INT8;

UPDATE defaultdb.public.seed AS tab_1577 SET _float4 = tab_1577._float4 WHERE true;

SELECT 'fb4708a2-9f36-44c7-854c-6ea5f0884f02':::UUID AS col_3974 LIMIT 61:::INT8;

WITH
	with_559 (col_3979) AS (SELECT * FROM (VALUES (1438:::INT8)) AS tab_1581 (col_3979)),
	with_560 (col_3980) AS (SELECT * FROM (VALUES (0:::OID)) AS tab_1582 (col_3980)),
	with_561 (col_3981)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-5.039029855556638245E+32):::DECIMAL),
						((-101.1391097455742883):::DECIMAL),
						((NULL::INT8 / (-1):::DECIMAL::DECIMAL)::DECIMAL)
				)
					AS tab_1583 (col_3981)
		)
SELECT
	e'\x0f\n':::STRING AS col_3982
LIMIT
	24:::INT8;

SELECT
	tab_1584._bytes AS col_3983,
	tab_1584._timestamp AS col_3984,
	(tab_1584._int2::INT8 + tab_1584._date::DATE)::DATE AS col_3985,
	tab_1584._int4 AS col_3986
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1584
WHERE
	tab_1584._bool
ORDER BY
	tab_1584._bytes DESC, tab_1584._string DESC
LIMIT
	57:::INT8;

SELECT
	e'%n\b\x1e]\x0b3':::STRING AS col_3987
FROM
	defaultdb.public.seed@[0] AS tab_1585
ORDER BY
	tab_1585._timestamp DESC
LIMIT
	36:::INT8;

WITH
	with_565 (col_3992)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(NULL),
						(
							(
								WITH
									with_562 (col_3988)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														((-0.20590189155395233):::FLOAT8),
														((-0.12038706410193623):::FLOAT8),
														(0.9896004774370232:::FLOAT8),
														((-0.3980853700996224):::FLOAT8),
														(NULL),
														((-2.4111658911106564):::FLOAT8)
												)
													AS tab_1586 (col_3988)
										),
									with_563 (col_3989)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(
															broadcast(hostmask('161.212.92.83/2':::INET::INET)::INET::INET)::INET
														),
														('ce55:72a0:5d86:1066:d0a:72a6:7dd0:b6e0/47':::INET),
														(NULL),
														('27.229.117.87/30':::INET)
												)
													AS tab_1587 (col_3989)
										),
									with_564 (col_3990)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(3944261450:::OID),
														(2311590723:::OID),
														(72348480:::OID),
														(440385945:::OID),
														(0:::OID)
												)
													AS tab_1588 (col_3990)
										)
								SELECT
									732562327:::OID AS col_3991
								FROM
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1589
									JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1590 ON
											(tab_1589._int8) = (tab_1590._int8)
								LIMIT
									1:::INT8
							)
						),
						(2509136469:::OID),
						(2169874308:::OID)
				)
					AS tab_1591 (col_3992)
		)
SELECT
	cte_ref_179.col_3992 AS col_3993
FROM
	with_565 AS cte_ref_179
WHERE
	false;

SELECT
	'\xc26d0f74':::BYTES AS col_3994,
	tab_1592._interval AS col_3995,
	tab_1592._float4 AS col_3996,
	timezone('1970-01-11 17:23:16.000677+00:00':::TIMESTAMP::TIMESTAMP, e'\x00':::STRING::STRING)::TIMESTAMPTZ
		AS col_3997,
	tab_1592._date AS col_3998,
	'7976e99d-21fd-457b-9da8-204bbaa97b58':::UUID AS col_3999
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1592
WHERE
	tab_1592._bool
LIMIT
	43:::INT8;

SELECT
	count(*) AS col_4000
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1593
GROUP BY
	tab_1593._jsonb
HAVING
	like_escape((tab_1593._jsonb::JSONB->>COALESCE(4293512900359112335:::INT8, (-9223372036854775807):::INT8)::INT8)::STRING::STRING, regexp_replace(e'*tNf\x19':::STRING::STRING, CASE WHEN true THEN e'\x16':::STRING ELSE '':::STRING END::STRING, e'\x1a':::STRING::STRING, e'&*"Q\x07?':::STRING::STRING)::STRING::STRING, e'\n':::STRING::STRING)::BOOL;

WITH
	with_566 (col_4001)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-0.17131578243706969):::FLOAT8),
						((-1.1269380575620054):::FLOAT8),
						(1.3362625401228412:::FLOAT8),
						(NULL),
						(COALESCE(sign(0.1068913821861519:::FLOAT8::FLOAT8)::FLOAT8, (-0.10466264777021528):::FLOAT8)),
						((-1.1377477909296188):::FLOAT8)
				)
					AS tab_1594 (col_4001)
		),
	with_567 (col_4002) AS (SELECT * FROM (VALUES ((-1735192316):::INT8), (NULL)) AS tab_1595 (col_4002))
SELECT
	(-1.0):::FLOAT8 AS col_4003
FROM
	with_566 AS cte_ref_180
WHERE
	false;

UPDATE defaultdb.public.seed AS tab_1596 SET _string = tab_1596._string LIMIT 83:::INT8;

WITH
	with_568 (col_4004)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(hostmask('40.128.2.15/14':::INET::INET)::INET),
						('78.102.34.149':::INET),
						('7058:2498:5156:6a1b:f797:1f59:22a5:1bcb/12':::INET),
						(NULL),
						('53.197.28.202/27':::INET)
				)
					AS tab_1597 (col_4004)
		),
	with_569 (col_4005)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							'[{}, [true, {"kft!": {"b": {"bar": {}}, "foo": []}}, null], [[{}, true]], {"fsY": [0.7605348870983637]}]':::JSONB
						),
						('{"test": "json"}':::JSONB),
						(NULL),
						(
							e'{"+e.wAgq": [[], {}], "3M>\'RD": [], "a": [[1.223395312293612, {}], [], true, {"4qz2qyv rV-": [], "a": "baz"}, "b"]}':::JSONB
						),
						('{"test": "json"}':::JSONB),
						(
							e'[{"4C./": {"bar": null}, "bar": [], "foo": [0.33944956926005104, true], "{&Hu]&q3r>": []}, {"N\\"fG*hR!3PmS": 1.8218358848857963, "zd:7(c": [1.1846334548884814]}, true, {"v\\\\0": []}]':::JSONB
						)
				)
					AS tab_1598 (col_4005)
		)
SELECT
	avg(tab_1599._interval::INTERVAL)::INTERVAL AS col_4006
FROM
	defaultdb.public.seed@[0] AS tab_1599
WHERE
	true
GROUP BY
	tab_1599._interval
HAVING
	bool_and(tab_1599._bool::BOOL)::BOOL
LIMIT
	12:::INT8;

SELECT
	true AS col_4007, tab_1601._interval AS col_4008
FROM
	defaultdb.public.seed@[0] AS tab_1600, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1601
LIMIT
	43:::INT8;

SELECT
	tab_1602._jsonb AS col_4009, tab_1602._int8 AS col_4010, tab_1602._float4 AS col_4011, tab_1602._decimal AS col_4012
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1602
LIMIT
	42:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1603
WITH
	with_570 (col_4013)
		AS (SELECT * FROM (VALUES (1631380360:::OID), (2418033846:::OID), (1112057558:::OID)) AS tab_1604 (col_4013)),
	with_571 (col_4014)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(NULL),
						(ARRAY[(-28673):::INT8,19024:::INT8,(-21652):::INT8]),
						(ARRAY[15211:::INT8,13400:::INT8,(-25626):::INT8,(-11788):::INT8])
				)
					AS tab_1605 (col_4014)
		)
SELECT
	NULL AS col_4015,
	(-1211192546):::INT8 AS col_4016,
	count(tab_1607._bytes)::INT8 AS col_4017,
	0.0:::FLOAT8 AS col_4018,
	ceiling(5e-324:::FLOAT8::FLOAT8)::FLOAT8 AS col_4019,
	localtimestamp((1989450950897701881:::INT8::INT8 << (-5019310378531636972):::INT8::INT8)::INT8::INT8):::DATE::DATE
		AS col_4020,
	clock_timestamp():::TIMESTAMP::TIMESTAMP AS col_4021,
	date_trunc(CASE WHEN NULL THEN 'X':::STRING ELSE e'9KBL\x16*\x1dH"':::STRING END::STRING, '1989-04-23':::DATE::DATE)::TIMESTAMPTZ
		AS col_4022,
	date_trunc('S]Kp':::STRING::STRING, '13:07:16.653307':::TIME::TIME)::INTERVAL AS col_4023,
	ilike_escape('':::STRING::STRING, e'\\F':::STRING::STRING, e'\x0bL\x12\n\'1\x19':::STRING::STRING)::BOOL
		AS col_4024,
	round(1:::DECIMAL::DECIMAL, 7254890118945358153:::INT8::INT8)::DECIMAL AS col_4025,
	quote_nullable(e'Y\x11v\x0b\x11':::STRING::STRING):::STRING::STRING AS col_4026,
	string_agg(tab_1607._bytes::BYTES, tab_1607._bytes::BYTES) OVER (PARTITION BY tab_1607._bytes)::BYTES AS col_4027,
	gen_random_uuid()::UUID AS col_4028,
	hostmask('15.13.99.200/24':::INET::INET)::INET AS col_4029,
	jsonb_build_object(tab_1607._bytes)::JSONB AS col_4030
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1606,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1607,
	with_570 AS cte_ref_181
WHERE
	true
GROUP BY
	tab_1607._bytes
HAVING
	max(tab_1606._bool::BOOL)::BOOL
ORDER BY
	tab_1607._bytes ASC, tab_1607._bytes ASC, tab_1607._bytes
LIMIT
	96:::INT8;

SELECT
	0.5544711947441101:::FLOAT8 AS col_4032, tab_1608._decimal AS col_4033, tab_1608._timestamptz AS col_4034
FROM
	defaultdb.public.seed@[0] AS tab_1608
WHERE
	tab_1608._int2::INT8 NOT IN (SELECT (-2147483648):::INT8::INT8 AS col_4031 LIMIT 52:::INT8)
ORDER BY
	tab_1608._int4, tab_1608._interval ASC, tab_1608._interval DESC
LIMIT
	67:::INT8;

SELECT B'0111111111111111111111111111111111111111111111111111111111111111' AS col_4039 LIMIT 63:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1612 (_int4, _float4, _float8, _timestamp, _interval, _bool, _string, _inet, _jsonb)
SELECT
	tab_1613._int2 AS col_4040,
	(-0.17467714846134186):::FLOAT8 AS col_4041,
	tab_1613._float4 AS col_4042,
	'1970-01-05 02:17:28.000088+00:00':::TIMESTAMP AS col_4043,
	tab_1613._interval AS col_4044,
	COALESCE(tab_1613._bool, true) AS col_4045,
	e'\n\x15i\x7f\x0e':::STRING AS col_4046,
	'81.137.221.82/11':::INET AS col_4047,
	tab_1613._jsonb AS col_4048
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1613
WHERE
	tab_1613._bool
LIMIT
	51:::INT8;

WITH
	with_575 (col_4052)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(2.5442288482029807:::FLOAT8),
						(2.4543386086787438:::FLOAT8),
						(2.205148215417669:::FLOAT8),
						(0.9041778543527783:::FLOAT8),
						((-0.33558592123820385):::FLOAT8)
				)
					AS tab_1618 (col_4052)
		),
	with_576 (col_4053) AS (SELECT * FROM (VALUES (1.2751208543777466:::FLOAT8)) AS tab_1619 (col_4053))
SELECT
	'1994-03-04':::DATE AS col_4054,
	tab_1620._int4 AS col_4055,
	tab_1620._interval AS col_4056,
	'1970-01-06 16:26:17.000858+00:00':::TIMESTAMPTZ AS col_4057
FROM
	defaultdb.public.seed@[0] AS tab_1620
WHERE
	tab_1620._bool;

SELECT
	1.8286047128478478:::FLOAT8 AS col_4058, tab_1621._bytes AS col_4059, tab_1621._int2 AS col_4060
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1621
WHERE
	false
LIMIT
	50:::INT8;

SELECT
	count(*) AS col_4061
FROM
	defaultdb.public.seed@[0] AS tab_1622
WHERE
	true
GROUP BY
	tab_1622._jsonb
HAVING
	not_ilike_escape(e'zq\x17':::STRING::STRING, e'\x0f=rQ#':::STRING::STRING, regexp_extract('X':::STRING::STRING, 'X<MT':::STRING::STRING)::STRING::STRING)::BOOL
LIMIT
	17:::INT8;

WITH
	with_577 (col_4063)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1752311369:::OID),
						(1061642791:::OID),
						(
							(
								SELECT
									NULL AS col_4062
								FROM
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1623,
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1624
								WHERE
									tab_1624._bool
								LIMIT
									1:::INT8
							)
						)
				)
					AS tab_1625 (col_4063)
		),
	with_578 (col_4064)
		AS (SELECT * FROM (VALUES ('ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET), (NULL)) AS tab_1626 (col_4064))
SELECT
	(tab_1627._jsonb::JSONB#>NULL::STRING[])::JSONB AS col_4065, tab_1629._float8 AS col_4066
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1627
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1628 ON
			(tab_1627._int4) = (tab_1628._int2)
			AND (tab_1627._float4) = (tab_1628._float4)
			AND (tab_1627._int2) = (tab_1628._int8)
			AND (tab_1627._int8) = (tab_1628._int2),
	defaultdb.public.seed@[0] AS tab_1629
WHERE
	NULL
LIMIT
	11:::INT8;

WITH
	with_579 (col_4067) AS (SELECT * FROM (VALUES (NULL)) AS tab_1630 (col_4067)),
	with_580 (col_4068)
		AS (
			SELECT
				*
			FROM
				(VALUES (49914563:::OID), (0:::OID), (1491310318:::OID), (2544643725:::OID), (3983666108:::OID))
					AS tab_1631 (col_4068)
		),
	with_581 (col_4069, col_4070)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('':::STRING, '1':::JSONB),
						(NULL, '[{"baz": []}, [{"foo": false}, 1.423214584721448, [], {}, [[true]], "a"], {}]':::JSONB),
						(
							e'Sp\\Q':::STRING,
							e'{"\\"+NCDl": {"a": {}, "foobar": {"c|[r!b)}8#P": []}}, "AhbSB": {"c": false}, "b": [[{}, {}, {}], null], "foo": false}':::JSONB
						),
						(
							e'\x19#p2QF{':::STRING,
							e'{"T7f|\\"xu4EZ": false, "bar": [{}, []], "foo": {"F,G./zM}pHx\\"": {}, "K{c\\\\I^&>:": [], "b": [true, "b"], "c": [{}, []], "dy&7": 0.6832455417924017, "foobar": []}, "yb,RK^": {"RH= 8N": []}}':::JSONB
						)
				)
					AS tab_1632 (col_4069, col_4070)
			UNION
				SELECT
					*
				FROM
					(
						VALUES
							('C:I?':::STRING, 'false':::JSONB),
							(
								'':::STRING,
								e'{";Ej# w1": true, "CS.#5GVOg": null, "N>V]5\\\\<ApH#O": [["a"], true, [true]], "b": {"bar": null}, "c": "QM$:*lF"}':::JSONB
							)
					)
						AS tab_1633 (col_4071, col_4072)
		)
SELECT
	tab_1634._jsonb AS col_4073,
	tab_1634._decimal AS col_4074,
	tab_1634._timestamp AS col_4075,
	(-1753430489):::INT8 AS col_4076
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1634
WHERE
	(tab_1634._bool OR tab_1634._bool)
LIMIT
	66:::INT8;

SELECT
	'null':::JSONB AS col_4077,
	'-66 years -9 mons -227 days -16:29:57.287617':::INTERVAL AS col_4078,
	tab_1635._int8 AS col_4079,
	tab_1635._int8 AS col_4080,
	tab_1635._int8 AS col_4081
FROM
	defaultdb.public.seed@[0] AS tab_1635
ORDER BY
	tab_1635._float8 ASC
LIMIT
	74:::INT8;

SELECT '\xd630ddf1':::BYTES AS col_4082 LIMIT 31:::INT8;

DELETE FROM defaultdb.public.seed AS tab_1636;

SELECT
	('1 day':::INTERVAL::INTERVAL - NULL::INTERVAL)::INTERVAL AS col_4083,
	tab_1637._uuid AS col_4084,
	(-497):::INT8 AS col_4085,
	tab_1637._jsonb AS col_4086,
	true AS col_4087,
	'1970-01-03 09:15:12.000823+00:00':::TIMESTAMP AS col_4088,
	tab_1637._float4 AS col_4089,
	NULL AS col_4090
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1637
LIMIT
	93:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1638
SELECT
	NULL AS col_4091,
	1968572384:::INT8 AS col_4092,
	326687861862508800:::INT8 AS col_4093,
	(-1.3166099786758423):::FLOAT8 AS col_4094,
	(0.12024399683889708:::FLOAT8::FLOAT8 + COALESCE(0.5916099255225373:::FLOAT8, 1.2988333995549137:::FLOAT8)::FLOAT8)::FLOAT8
		AS col_4095,
	'1989-05-12':::DATE AS col_4096,
	'1970-01-10 16:53:40.000506+00:00':::TIMESTAMP AS col_4097,
	experimental_follower_read_timestamp()::TIMESTAMPTZ AS col_4098,
	(NULL::INTERVAL / (-0.07996387157813734):::FLOAT8::FLOAT8)::INTERVAL AS col_4099,
	NULL AS col_4100,
	(-61737.2458648511011):::DECIMAL AS col_4101,
	'':::STRING AS col_4102,
	'\x':::BYTES AS col_4103,
	'b9204b1b-f25f-43af-80ff-41112b4f1238':::UUID AS col_4104,
	'46.79.190.124':::INET AS col_4105,
	e'{"3X4L;": false, "bar": [",OWLrxUnc", []], "baz": {}, "fgL\'J%~=-O": {"0Omy_gYcj": [{}, true]}, "foo": [[]], "mHtVNQ&,": []}':::JSONB
		AS col_4106
LIMIT
	35:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1639 (_int8, _date, _interval, _bytes)
WITH
	with_582 (col_4107, col_4108)
		AS (
			SELECT
				*
			FROM
				(VALUES ((-6888456772085011787):::INT8, NULL), (family(NULL::INET)::INT8, 3863463178:::OID))
					AS tab_1640 (col_4107, col_4108)
		)
SELECT
	592359253862650516:::INT8 AS col_4109,
	tab_1641._date AS col_4110,
	'33 years 9 mons 361 days 08:31:57.694913':::INTERVAL AS col_4111,
	tab_1641._bytes AS col_4112
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1641
ORDER BY
	tab_1641._decimal
LIMIT
	13:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1642
		(_int4, _float8, _timestamp, _timestamptz, _interval, _bool, _decimal, _string, _bytes, _uuid, _inet, _jsonb)
SELECT
	tab_1643._int4 AS col_4113,
	NULL AS col_4114,
	'3000-01-01 00:00:00+00:00':::TIMESTAMP AS col_4115,
	'0001-01-01 00:00:00+00:00':::TIMESTAMPTZ AS col_4116,
	'82 years 7 mons 92 days 01:55:15.673356':::INTERVAL AS col_4117,
	tab_1643._bool AS col_4118,
	tab_1643._decimal AS col_4119,
	NULL AS col_4120,
	tab_1643._bytes AS col_4121,
	'2c94a6d3-6394-41e6-adce-dce06dd2d92e':::UUID AS col_4122,
	tab_1643._inet AS col_4123,
	tab_1643._jsonb AS col_4124
FROM
	defaultdb.public.seed@[0] AS tab_1643
WHERE
	tab_1643._bool
ORDER BY
	tab_1643._float8, tab_1643._int4 ASC
LIMIT
	66:::INT8;

SELECT
	127:::INT8 AS col_4126,
	26016:::INT8 AS col_4127,
	tab_1645._jsonb AS col_4128,
	tab_1645._string AS col_4129,
	(tab_1645._date::DATE - '23 years 1 mon 339 days 17:01:06.165251':::INTERVAL::INTERVAL)::TIMESTAMP AS col_4130
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1645
LIMIT
	72:::INT8;

WITH
	with_583 (col_4131)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							e'[{"U<I": "b", "b# ": ["{zm`B:"], "bar": true, "kOL": [], "v%q": {}}, {"947C]]L~(}": 0.18410393320190288, "a": {}, "p[`i3yVgTg": "Or\\\\zO-)%]"}, true]':::JSONB
						),
						(
							e'[{"foobar": {"MkOb": {}, "Qz+dm\\\\Q80": {"L`&B1": [], "b": ["lDyU07M=5"]}, "])h[": false}, "sC7*(XMBW-": [false]}, {"a": {}, "bar": false}, true]':::JSONB
						),
						(
							e'[[{"\\"9\\"!((rK\\"\\\\": [{}], "baz": {"c": true}}, null, []], [{}, 1.0997394023131264], {"foobar": null}, {}]':::JSONB
						),
						('{"b": {"D;>AF#A": [], "t|EB(|c!rj": {}}}':::JSONB)
				)
					AS tab_1646 (col_4131)
		)
SELECT
	max(cte_ref_183.col_4131::JSONB)::JSONB AS col_4132
FROM
	with_583 AS cte_ref_183
WHERE
	true
GROUP BY
	cte_ref_183.col_4131
HAVING
	inet_contained_by_or_equals(netmask('0.0.0.0/0':::INET::INET)::INET::INET, '16.107.80.230/14':::INET::INET)::BOOL;

SELECT
	tab_1647._bool AS col_4133,
	tab_1647._float8 AS col_4134,
	9136240372705889768:::INT8 AS col_4135,
	tab_1647._timestamp AS col_4136,
	2147483647:::INT8 AS col_4137,
	tab_1647._string AS col_4138,
	NULL AS col_4139,
	'\x5661a46de8':::BYTES AS col_4140,
	tab_1647._jsonb AS col_4141,
	(-9.004486267930153900E+37):::DECIMAL AS col_4142,
	'c73d9b41-2679-427b-b807-5f0136a1d9cf':::UUID AS col_4143,
	tab_1647._inet AS col_4144,
	28226:::INT8 AS col_4145,
	tab_1647._interval AS col_4146,
	'1975-06-08':::DATE AS col_4147,
	tab_1647._float4 AS col_4148
FROM
	defaultdb.public.seed@[0] AS tab_1647
LIMIT
	51:::INT8;

WITH
	with_584 (col_4149)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						('\x5e128e11':::BYTES),
						(NULL),
						('\xb8':::BYTES),
						('\xf6d1b4a1e2732fb0d3':::BYTES),
						('\x54b2d2fe9b':::BYTES)
				)
					AS tab_1648 (col_4149)
		),
	with_585 (col_4150, col_4151)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							1147945084:::OID,
							e'{"S[z[D8^*Uy.": [[], true], "a": [], "bar": {"&N`nZkE]": {}, "baz": [], "ypjHy\\\\": [false, {"^BtS$6Hh?7N": []}, [], {}]}, "c": true}':::JSONB
						),
						(0:::OID, (NULL::JSONB - 2147483647:::INT8::INT8)::JSONB),
						(3988091903:::OID, jsonb_object(ARRAY[]:::STRING[]::STRING[])::JSONB),
						(
							NULL,
							e'{"%7>#": {"=2>AqM6R~ep+": {"a": true, "vP)Mt0m}l": {":RBUP4-!mb=m": {}, "b": {"fJn": false}, "vmK=ZHz&f2r": {}}}, "a": [], "aA#1*4": "a", "baz": false}, "bar": [], "baz": {"6/[m6u9\\\\D~\\\\s": {}, "^|aMSb{{": {}}}':::JSONB
						),
						(
							NULL,
							e'{"Y8_Cx": [], "a": [{"Q>}Cy:&[#[": [[[]], {}, "foobar"]}, {"7*-t4": false, "@rnIu": [{}], "c": {}, "}oUj[": {"y_`ec1C\\"U):": null}}, [false, null]], "foo": 0.4242636623918806}':::JSONB
						)
				)
					AS tab_1649 (col_4150, col_4151)
		)
SELECT
	523891259981417734:::INT8 AS col_4152,
	tab_1650._bool AS col_4153,
	tab_1650._date AS col_4154,
	tab_1650._float4 AS col_4155,
	(-0.2340307605036520022):::DECIMAL AS col_4156,
	tab_1650._timestamp AS col_4157,
	NULL AS col_4158
FROM
	defaultdb.public.seed@[0] AS tab_1650
ORDER BY
	tab_1650._bool DESC
LIMIT
	15:::INT8;

SELECT
	('\x0c9c':::BYTES::BYTES || tab_1651._bytes::BYTES)::BYTES AS col_4159,
	(SELECT tab_1653._date AS col_4160 LIMIT 1:::INT8) AS col_4161,
	tab_1651._uuid AS col_4162,
	ln(((-5366113293479044774):::INT8::INT8 * NULL::DECIMAL)::DECIMAL::DECIMAL)::DECIMAL AS col_4163,
	tab_1653._date AS col_4164,
	tab_1651._interval AS col_4165,
	tab_1651._timestamptz AS col_4166
FROM
	defaultdb.public.seed@[0] AS tab_1651,
	defaultdb.public.seed AS tab_1652
	JOIN defaultdb.public.seed AS tab_1653 ON
			(tab_1652._int8) = (tab_1653._int8)
			AND (tab_1652._float8) = (tab_1653._float8)
			AND (tab_1652._date) = (tab_1653._date)
WHERE
	false
ORDER BY
	tab_1651._int4 DESC, tab_1651._timestamptz ASC
LIMIT
	85:::INT8;

SELECT
	tab_1656._interval AS col_4167,
	tab_1656._timestamp AS col_4168,
	tab_1656._decimal AS col_4169,
	tab_1656._int8 AS col_4170,
	tab_1656._bool AS col_4171,
	0.8506492376327515:::FLOAT8 AS col_4172,
	tab_1656._string AS col_4173,
	tab_1654._date AS col_4174,
	tab_1656._int4 AS col_4175,
	tab_1656._timestamptz AS col_4176,
	tab_1655._date AS col_4177,
	CASE WHEN tab_1656._bool THEN '1974-03-17':::DATE ELSE tab_1654._date END AS col_4178,
	tab_1656._inet AS col_4179,
	tab_1655._date AS col_4180,
	tab_1654._date AS col_4181,
	'\x1bfbe6216f':::BYTES AS col_4182,
	tab_1654._date AS col_4183
FROM
	defaultdb.public.seed AS tab_1654
	JOIN defaultdb.public.seed AS tab_1655 ON (tab_1654._int8) = (tab_1655._int8),
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1656
WHERE
	(false AND false);

WITH
	with_586 (col_4184)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-09 17:29:10.000807+00:00':::TIMESTAMPTZ),
						(NULL),
						('1970-01-10 20:34:18.000541+00:00':::TIMESTAMPTZ),
						(('08:07:16.014894+02:56:00':::TIMETZ::TIMETZ + '1977-04-09':::DATE::DATE)::TIMESTAMPTZ),
						('1970-01-06 04:06:38.000326+00:00':::TIMESTAMPTZ)
				)
					AS tab_1657 (col_4184)
		),
	with_587 (col_4186)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(e'\x05\x14( O':::STRING),
						(
							(
								SELECT
									tab_1658._string AS col_4185
								FROM
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1658
								LIMIT
									1:::INT8
							)
						),
						(e'?q\x19-Df':::STRING),
						(COALESCE(NULL, '':::STRING))
				)
					AS tab_1659 (col_4186)
		)
SELECT
	clock_timestamp():::TIMESTAMPTZ::TIMESTAMPTZ AS col_4187
FROM
	with_586 AS cte_ref_184;

UPDATE
	defaultdb.public.seed AS tab_1660
SET
	_timestamptz = '1970-01-09 03:46:17.000903+00:00':::TIMESTAMPTZ,
	_float8 = tab_1660._float8,
	_uuid = tab_1660._uuid,
	_bool = tab_1660._bool,
	_inet = NULL
WHERE
	tab_1660._bool
LIMIT
	34:::INT8;

SELECT ARRAY[2885797860:::OID,330302802:::OID,1947404250:::OID,0:::OID] AS col_4188;

UPDATE defaultdb.public.seed AS tab_1661 SET _interval = tab_1661._interval WHERE false LIMIT 62:::INT8;

SELECT
	'181.23.12.107/16':::INET AS col_4189, tab_1662._int4 AS col_4190, (-2153926843907662745):::DECIMAL AS col_4191
FROM
	defaultdb.public.seed@[0] AS tab_1662
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1663 ON (tab_1662._int2) = (tab_1663._int8)
WHERE
	tab_1663._bool;

SELECT
	count(*) AS col_4192
FROM
	defaultdb.public.seed@[0] AS tab_1664
GROUP BY
	tab_1664._jsonb
HAVING
	not_like_escape('g5&':::STRING::STRING, e'\x0e\rTshOaDF':::STRING::STRING, '':::STRING::STRING)::BOOL;

SELECT
	'{"test": "json"}':::JSONB AS col_4193,
	'{"b": {"bar": {")MxRTizRe": null}, "r2[}9,-J4VL.": [0.2635926080879145], "uyn.X": []}, "c": [{"baz": {}}, null]}':::JSONB
		AS col_4194
FROM
	defaultdb.public.seed AS tab_1665 JOIN defaultdb.public.seed AS tab_1666 ON (tab_1665._jsonb) = (tab_1666._jsonb)
LIMIT
	75:::INT8;

SELECT
	tab_1667._inet AS col_4195,
	'1990-06-25':::DATE AS col_4196,
	'39 years 3 mons 45 days 04:04:45.156119':::INTERVAL AS col_4197
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1667
WHERE
	tab_1667._bool
LIMIT
	4:::INT8;

SELECT
	'':::STRING AS col_4198
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1668
WHERE
	(NULL AND tab_1668._bool);

WITH
	with_588 (col_4199)
		AS (SELECT * FROM (VALUES (statement_timestamp():::TIMESTAMPTZ::TIMESTAMPTZ)) AS tab_1669 (col_4199))
SELECT
	'1970-01-08 21:08:15.000765+00:00':::TIMESTAMPTZ AS col_4200
FROM
	with_588 AS cte_ref_185;

DELETE FROM defaultdb.public.seed AS tab_1670 WHERE true;

INSERT
INTO
	defaultdb.public.seed AS tab_1671 (_int4, _int8, _float4, _date, _timestamp, _timestamptz, _string, _uuid, _inet)
SELECT
	(-712065208):::INT8 AS col_4201,
	xor_agg(tab_1672._int4::INT8)::INT8 AS col_4202,
	tab_1672._float4 AS col_4203,
	current_timestamp():::DATE::DATE AS col_4204,
	now():::TIMESTAMP::TIMESTAMP AS col_4205,
	date_trunc(e'\\Ag':::STRING::STRING, (127:::INT8::INT8 + '1982-04-05':::DATE::DATE)::DATE::DATE)::TIMESTAMPTZ
		AS col_4206,
	crdb_internal.cluster_name()::STRING AS col_4207,
	gen_random_uuid()::UUID AS col_4208,
	min(tab_1672._inet::INET)::INET AS col_4209
FROM
	defaultdb.public.seed@[0] AS tab_1672
WHERE
	tab_1672._bool
GROUP BY
	tab_1672._inet, tab_1672._float4, tab_1672._int4
ORDER BY
	tab_1672._inet DESC,
	tab_1672._int4 DESC,
	tab_1672._float4 DESC,
	tab_1672._int4 ASC,
	tab_1672._int4 ASC,
	tab_1672._inet
LIMIT
	74:::INT8;

SELECT ARRAY[649876905:::OID,368914402:::OID] AS col_4210 LIMIT 57:::INT8;

WITH
	with_589 (col_4211)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e' \f5i':::STRING),
						('':::STRING),
						(e'\x0fb\x1c\x1cF\tb\x10\x14':::STRING),
						('Vg$8g,z|=':::STRING)
				)
					AS tab_1673 (col_4211)
		)
SELECT
	tab_1674._int4 AS col_4212
FROM
	defaultdb.public.seed@[0] AS tab_1674
WHERE
	tab_1674._bool
LIMIT
	56:::INT8;

SELECT
	count(*) AS col_4217
FROM
	defaultdb.public.seed@[0] AS tab_1677
GROUP BY
	tab_1677._jsonb
HAVING
	isnan(8284683.283840658643:::DECIMAL::DECIMAL)::BOOL
LIMIT
	30:::INT8;

SELECT 35988281340.28663872:::DECIMAL AS col_4218;

WITH
	with_592 (col_4219) AS (SELECT * FROM (VALUES ('22:42:17.988495':::TIME), (NULL), (NULL)) AS tab_1678 (col_4219)),
	with_593 (col_4221)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1.2933663129806519:::FLOAT8),
						((-0.0866352990269661):::FLOAT8),
						('+Inf':::FLOAT8),
						((-1.0):::FLOAT8),
						(
							(
								SELECT
									0.8303830623626709:::FLOAT8 AS col_4220
								FROM
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1679
								WHERE
									tab_1679._bool
								ORDER BY
									tab_1679._inet DESC
								LIMIT
									1:::INT8
							)
						)
				)
					AS tab_1680 (col_4221)
		)
SELECT
	3097613335:::OID AS col_4222;

UPDATE
	defaultdb.public.seed AS tab_1681
SET
	_bytes = '\xdb1d0793be9125':::BYTES, _date = tab_1681._date, _float4 = 1.8505470752716064:::FLOAT8
ORDER BY
	tab_1681._timestamp ASC
LIMIT
	50:::INT8;

WITH
	with_594 (col_4223)
		AS (SELECT * FROM (VALUES (B'1100011'), (NULL), (B'1011000'), (B'0111101')) AS tab_1682 (col_4223)),
	with_595 (col_4224)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY['"':::STRING]),
						(ARRAY['':::STRING,e'\r':::STRING:::NAME,e'0\x10f2j\x0f%,':::STRING:::NAME]),
						(ARRAY['':::STRING:::NAME]),
						(NULL),
						(ARRAY['E':::STRING:::NAME,e'/\x14\x1by^&q':::STRING:::NAME])
				)
					AS tab_1683 (col_4224)
		)
SELECT
	tab_1684._jsonb AS col_4225, tab_1685._jsonb AS col_4226
FROM
	defaultdb.public.seed AS tab_1684 JOIN defaultdb.public.seed AS tab_1685 ON (tab_1684._jsonb) = (tab_1685._jsonb)
LIMIT
	63:::INT8;

WITH
	with_596 (col_4227)
		AS (SELECT B'000001' AS col_4227 FROM defaultdb.public.seed@[0] AS tab_1686 WHERE tab_1686._bool)
SELECT
	cte_ref_188.col_4227 AS col_4228
FROM
	with_596 AS cte_ref_188
WHERE
	true
ORDER BY
	cte_ref_188.col_4227, cte_ref_188.col_4227 ASC, cte_ref_188.col_4227 ASC;

SELECT
	tab_1687._timestamptz AS col_4229,
	NULL AS col_4230,
	'66.137.114.244/19':::INET AS col_4231,
	tab_1687._float4 AS col_4232,
	NULL AS col_4233,
	tab_1687._int8 AS col_4234
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1687,
	defaultdb.public.seed AS tab_1688
	JOIN defaultdb.public.seed AS tab_1689 ON (tab_1688._jsonb) = (tab_1689._jsonb)
WHERE
	tab_1687._bool;

UPDATE defaultdb.public.seed AS tab_1690 SET _float8 = tab_1690._float8 LIMIT 3:::INT8;

SELECT
	0.14322127401828766:::FLOAT8 AS col_4235, NULL AS col_4236
FROM
	defaultdb.public.seed@[0] AS tab_1691
ORDER BY
	tab_1691._int4
LIMIT
	61:::INT8;

UPDATE defaultdb.public.seed AS tab_1692 SET _interval = '-62 years -9 mons -416 days -17:57:14.023905':::INTERVAL;

UPDATE defaultdb.public.seed AS tab_1693 SET _int4 = NULL WHERE false;

INSERT
INTO
	defaultdb.public.seed AS tab_1694
WITH
	with_597 (col_4237)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-08 17:08:44.000498+00:00':::TIMESTAMP),
						('1970-01-06 20:06:36.000063+00:00':::TIMESTAMP),
						('1970-01-11 13:47:40.000212+00:00':::TIMESTAMP),
						('1970-01-07 07:19:57.000389+00:00':::TIMESTAMP),
						('1970-01-06 20:01:24.000729+00:00':::TIMESTAMP)
				)
					AS tab_1695 (col_4237)
		),
	with_598 (col_4239)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(
								SELECT
									4146164942:::OID AS col_4238
								FROM
									defaultdb.public.seed@[0] AS tab_1696,
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1697
								WHERE
									tab_1696._bool
								GROUP BY
									tab_1697._bool, tab_1696._string
								ORDER BY
									tab_1697._bool ASC
								LIMIT
									1:::INT8
							)
						),
						(NULL),
						(2041101355:::OID)
				)
					AS tab_1698 (col_4239)
		)
SELECT
	(-9025):::INT8 AS col_4240,
	2147483647:::INT8 AS col_4241,
	6169810009641183772:::INT8 AS col_4242,
	NULL AS col_4243,
	0.6183946182093882:::FLOAT8 AS col_4244,
	'1984-06-09':::DATE AS col_4245,
	'1970-01-04 08:51:03.000446+00:00':::TIMESTAMP AS col_4246,
	'1970-01-11 18:37:56.000568+00:00':::TIMESTAMPTZ AS col_4247,
	'00:00:00':::INTERVAL AS col_4248,
	false AS col_4249,
	(-1.234E+401):::DECIMAL AS col_4250,
	e'xOY>8e\x106R':::STRING AS col_4251,
	NULL AS col_4252,
	'6e62540b-779c-46ea-992f-9d377325b548':::UUID AS col_4253,
	'8904:3684:90ba:6638:42d3:6e34:8b61:7824/123':::INET AS col_4254,
	e'[[[[false], {"c": true}], [{"f\\"O,3OjFen8": 0.47351859515387984}], null, []], {"XrW]|J|S>8t(": {"foo": []}}, {}, []]':::JSONB
		AS col_4255
LIMIT
	22:::INT8;

SELECT 6.648033159757998451E+24:::DECIMAL AS col_4256 LIMIT 99:::INT8;

WITH
	with_599 (col_4257) AS (SELECT * FROM (VALUES ((-0.15226944196875714):::FLOAT8)) AS tab_1699 (col_4257)),
	with_600 (col_4258) AS (SELECT * FROM (VALUES ('1975-11-05':::DATE), (current_date()::DATE)) AS tab_1700 (col_4258))
SELECT
	NULL AS col_4259, 0.05738384276628494:::FLOAT8 AS col_4260, tab_1701._string AS col_4261
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1701
WHERE
	false
ORDER BY
	tab_1701._int8 DESC, tab_1701._int8 ASC, tab_1701._uuid ASC
LIMIT
	5:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1704
SET
	_int2 = tab_1704._int2, _jsonb = NULL, _string = e'?dq]]~\x163':::STRING
WHERE
	tab_1704._bool
LIMIT
	95:::INT8;

WITH
	with_601 (col_4278) AS (SELECT * FROM (VALUES (e'\U00002603':::STRING), (NULL)) AS tab_1705 (col_4278)),
	with_602 (col_4279) AS (SELECT * FROM (VALUES ('07:43:57.059411':::TIME)) AS tab_1706 (col_4279)),
	with_603 (col_4280, col_4281) AS (SELECT * FROM (VALUES ('':::STRING, NULL)) AS tab_1707 (col_4280, col_4281))
SELECT
	cte_ref_189.col_4280 AS col_4282, cte_ref_189.col_4281 AS col_4283
FROM
	with_603 AS cte_ref_189
WHERE
	false
ORDER BY
	cte_ref_189.col_4280 DESC, cte_ref_189.col_4281 ASC;

SELECT
	tab_1713._float4 AS col_4302
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1712, defaultdb.public.seed@[0] AS tab_1713
WHERE
	like_escape(NULL::STRING, tab_1712._string::STRING, tab_1713._string::STRING)::BOOL
ORDER BY
	tab_1713._bool, tab_1712._inet
LIMIT
	15:::INT8;

WITH
	with_605 (col_4303) AS (SELECT * FROM (VALUES (NULL)) AS tab_1714 (col_4303)),
	with_606 (col_4304)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('7ec61ec8-9657-4076-b31d-f603737256e1':::UUID), ('6a4df9fe-2fb9-4cc5-b0b6-bd68dffbfda0':::UUID)
				)
					AS tab_1715 (col_4304)
		)
SELECT
	NULL AS col_4305
FROM
	with_606 AS cte_ref_190
WHERE
	false
ORDER BY
	cte_ref_190.col_4304 DESC;

WITH
	with_607 (col_4306, col_4307) AS (SELECT * FROM (VALUES ((-1):::INT8, NULL)) AS tab_1716 (col_4306, col_4307))
SELECT
	count(*) AS col_4308
FROM
	defaultdb.public.seed@[0] AS tab_1717
WHERE
	tab_1717._bool
GROUP BY
	tab_1717._jsonb
HAVING
	isnan((-5.62712620041689660):::DECIMAL::DECIMAL)::BOOL;

SELECT
	'1989-07-23':::DATE AS col_4309
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1718
WHERE
	false
LIMIT
	94:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1719
SELECT
	29247:::INT8 AS col_4310,
	NULL AS col_4311,
	(-1):::INT8 AS col_4312,
	1.3216960430145264:::FLOAT8 AS col_4313,
	1.2571252700933349:::FLOAT8 AS col_4314,
	NULL AS col_4315,
	'1970-01-09 08:20:28.000971+00:00':::TIMESTAMP AS col_4316,
	'1970-01-09 23:14:13.00009+00:00':::TIMESTAMPTZ AS col_4317,
	'-31 years -4 mons -16 days -07:38:55.866596':::INTERVAL AS col_4318,
	false AS col_4319,
	((-61836534460451.61561):::DECIMAL::DECIMAL * (-6.842816399981762149E+19):::DECIMAL::DECIMAL)::DECIMAL AS col_4320,
	e'\x135t':::STRING AS col_4321,
	'\x22':::BYTES AS col_4322,
	'2b4b9f88-7dba-4dad-af1c-2856d297aca0':::UUID AS col_4323,
	'49.238.183.89/16':::INET AS col_4324,
	NULL AS col_4325
LIMIT
	43:::INT8;

WITH
	with_608 (col_4326) AS (SELECT * FROM (VALUES ('X':::STRING), (e'\r~\x13':::STRING)) AS tab_1720 (col_4326)),
	with_609 (col_4327)
		AS (
			SELECT * FROM (VALUES (2714145371:::OID), (2530137372:::OID), (2238334386:::OID)) AS tab_1721 (col_4327)
			UNION ALL SELECT * FROM (VALUES (3207380027:::OID), (1572954407:::OID)) AS tab_1722 (col_4328)
		),
	with_610 (col_4329)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[3460274630:::OID,1881793157:::OID,1703179961:::OID,2060948252:::OID,4195982270:::OID]),
						(ARRAY[1783527999:::OID])
				)
					AS tab_1723 (col_4329)
		)
SELECT
	cte_ref_191.col_4327 AS col_4330
FROM
	with_609 AS cte_ref_191, defaultdb.public.seed@[0] AS tab_1724
ORDER BY
	tab_1724._bytes DESC;

UPDATE
	defaultdb.public.seed AS tab_1725
SET
	_bool = tab_1725._bool,
	_timestamp = '1970-01-10 16:06:55.000051+00:00':::TIMESTAMP,
	_inet = tab_1725._inet,
	_string = e'\x1dF&^\x7f=..':::STRING,
	_float4 = tab_1725._float4
ORDER BY
	tab_1725._interval ASC
LIMIT
	98:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1744
SET
	_bool = true, _interval = '6 years 4 mons 540 days 14:37:00.999889':::INTERVAL
ORDER BY
	tab_1744._bytes
LIMIT
	6:::INT8;

SELECT
	max(tab_1745._decimal::DECIMAL) OVER (PARTITION BY tab_1746._timestamp, tab_1745._decimal)::DECIMAL AS col_4356
FROM
	defaultdb.public.seed@[0] AS tab_1745,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1746,
	defaultdb.public.seed@[0] AS tab_1747
GROUP BY
	tab_1746._timestamp, tab_1745._decimal
LIMIT
	83:::INT8;

SELECT
	tab_1749._date AS col_4357,
	tab_1750._bytes AS col_4358,
	tab_1749._interval AS col_4359,
	(
		SELECT
			'19dc5bd2-c42c-4306-97fd-666bc58a08ab':::UUID AS col_4360
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1751,
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1752
		WHERE
			tab_1752._bool
		LIMIT
			1:::INT8
	)
		AS col_4361,
	'253.41.223.238/31':::INET AS col_4362,
	tab_1748._bytes AS col_4363,
	tab_1748._float4 AS col_4364,
	(-24479):::INT8 AS col_4365,
	tab_1748._bool AS col_4366,
	'a3f92324-6b7a-48e9-b326-5381ae8a5548':::UUID AS col_4367,
	tab_1749._timestamp AS col_4368
FROM
	defaultdb.public.seed@[0] AS tab_1748,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1749
	JOIN defaultdb.public.seed@[0] AS tab_1750 ON (tab_1749._float4) = (tab_1750._float4)
WHERE
	like_escape('x':::STRING::STRING, tab_1748._string::STRING, (e'[[{"\\"(1": {}, "1fQT!d$qC/": null, "dBiVS3": []}], {"foobar": {}}, [[], {}], [{}]]':::JSONB::JSONB#>>ARRAY['3':::STRING,e'k\x0eHo\x1c=':::STRING,e'\x18YY&_#\x02':::STRING,e'\x17\x16GR|':::STRING,e'\x15:[\x1ag~\t\x1f\f':::STRING]::STRING[])::STRING::STRING)::BOOL
ORDER BY
	tab_1749._float4 DESC, tab_1750._bytes, tab_1749._bytes DESC
LIMIT
	49:::INT8;

SELECT
	tab_1753._float4 AS col_4369,
	NULL AS col_4370,
	'00000000-0000-0000-0000-000000000000':::UUID AS col_4371,
	(-3436559979113185871):::INT8 AS col_4372,
	tab_1753._timestamptz AS col_4373
FROM
	defaultdb.public.seed@[0] AS tab_1753
WHERE
	true
LIMIT
	10:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1754
SET
	_float4 = tab_1754._float8,
	_timestamp = '1970-01-03 10:18:20.000817+00:00':::TIMESTAMP,
	_jsonb = '0.8426183099952957':::JSONB,
	_int8 = NULL,
	_bool = false
WHERE
	tab_1754._bool
LIMIT
	97:::INT8;

UPDATE defaultdb.public.seed AS tab_1755 SET _int8 = tab_1755._int4 WHERE tab_1755._bool LIMIT 41:::INT8;

WITH
	with_624 (col_4374) AS (SELECT * FROM (VALUES (e'\x06!FR6z*\x15Z':::STRING)) AS tab_1756 (col_4374)),
	with_625 (col_4375, col_4376)
		AS (
			SELECT
				*
			FROM
				(VALUES (B'111010001011101110010000011011101', '23:49:59.096301-05:00:00':::TIMETZ))
					AS tab_1757 (col_4375, col_4376)
		),
	with_626 (col_4377)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-01 13:47:05.000327+00:00':::TIMESTAMP),
						('1970-01-04 23:42:20.00042+00:00':::TIMESTAMP),
						('1970-01-07 15:34:48.000295+00:00':::TIMESTAMP),
						('1970-01-03 11:34:19.000075+00:00':::TIMESTAMP)
				)
					AS tab_1758 (col_4377)
		)
SELECT
	2151966213:::OID AS col_4378
LIMIT
	56:::INT8;

SELECT
	942218336:::INT8 AS col_4379,
	tab_1759._inet AS col_4380,
	tab_1759._jsonb AS col_4381,
	tab_1759._timestamp AS col_4382,
	'bk':::STRING AS col_4383,
	tab_1759._bytes AS col_4384,
	'6e3c5c3c-6aa6-42f6-9112-4c801a8f85ea':::UUID AS col_4385
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1759
WHERE
	true
ORDER BY
	tab_1759._date
LIMIT
	35:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1760
SET
	_int4 = 425411309:::INT8, _bytes = '\x8da4e83ce519ce66b8':::BYTES
WHERE
	tab_1760._bool
ORDER BY
	tab_1760._float4 DESC
LIMIT
	48:::INT8;

SELECT
	tab_1761._int2 AS col_4386, '1975-10-07':::DATE AS col_4387
FROM
	defaultdb.public.seed@[0] AS tab_1761
LIMIT
	67:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1762
SET
	_inet = tab_1762._inet
WHERE
	false
ORDER BY
	tab_1762._decimal DESC
LIMIT
	53:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1763 (_float4, _date, _timestamp, _interval, _string, _bytes, _inet, _jsonb)
SELECT
	NULL AS col_4388,
	'1987-05-07':::DATE AS col_4389,
	'1970-01-06 13:36:13.000077+00:00':::TIMESTAMP AS col_4390,
	'63 years 8 mons 777 days 02:18:18.063131':::INTERVAL AS col_4391,
	'"iMAu':::STRING AS col_4392,
	'\xe738e3eba03f9a':::BYTES AS col_4393,
	broadcast('ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET::INET)::INET AS col_4394,
	(e'[{"a": 0.9645992591626378, "s2\\\\": {}}, {"1-IUdH*bt4": [{"]Tj}uC": true, "b": null, "c": false}]}, false, []]':::JSONB::JSONB - (e'{"+]5I.>Z;J": {"a": [{"*BMIzY{": [], "foo": {" jacj": []}}, {"I\\\\o": 0.7087801566145904}, [[]], {"foo": {}}]}, "6KJIFMf$": 3.804308018497009, "RtZ`jv=!JfWy": [], "VjQ)CNuDy9@": {"bar": {"a": true}}, "foobar": 0.9064716387391458}':::JSONB::JSONB#>>(NULL::STRING || NULL::STRING[])::STRING[]::STRING[])::STRING::STRING)::JSONB
		AS col_4395;

SELECT
	tab_1764._jsonb AS col_4396
FROM
	defaultdb.public.seed@[0] AS tab_1764
ORDER BY
	tab_1764._uuid DESC
LIMIT
	29:::INT8;

WITH
	with_627 (col_4397)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-7450209054018336642):::INT8),
						((-4982428091640782120):::INT8),
						((-2625274263279603540):::INT8)
				)
					AS tab_1765 (col_4397)
		)
SELECT
	'\xac9ccb30ba6cbfd771':::BYTES AS col_4398,
	'82 years 1 mon 292 days 24:20:20.952917':::INTERVAL AS col_4399,
	'c057:ba78:7cfd:c22a:bdc0:a8ae:d929:3052/112':::INET AS col_4400,
	tab_1766._bool AS col_4401,
	0.04094664752483368:::FLOAT8 AS col_4402,
	'00000000-0000-0000-0000-000000000000':::UUID AS col_4403,
	0.2852377194238894:::FLOAT8 AS col_4404,
	tab_1766._timestamptz AS col_4405,
	7989:::INT8 AS col_4406,
	tab_1766._timestamp AS col_4407,
	tab_1766._int2 AS col_4408,
	6377543162096437563:::INT8 AS col_4409,
	'[{"foo": [], "tNdg;V7BC~R.": [{}]}, {"a": {"a": {"vCB": {"8*e^6^%": {}}}, "o521<oe7#:": 0.8709077861135015}, "b`ndA": {"bar": true}, "suz<:!|*c[Tn": {"a": [], "b": {"c": {}}}}, []]':::JSONB
		AS col_4410,
	e'V=\x018':::STRING AS col_4411
FROM
	defaultdb.public.seed@[0] AS tab_1766
LIMIT
	28:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1767
SET
	_jsonb
		= '{"+!NC": true, "62+EhE?4": [null, []], "B2J4": [[{"foobar": []}, []], []], "I)/N%Gq": {"%MR{bk,x8[NI": {}, "bar": {}}, "bar": {}}':::JSONB,
	_timestamp = tab_1767._timestamp
ORDER BY
	tab_1767._int4 ASC, tab_1767._bytes DESC, tab_1767._timestamp ASC
LIMIT
	73:::INT8;

WITH
	with_628 (col_4412)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-0.07848313450813293):::FLOAT8),
						('+Inf':::FLOAT8),
						((-1.6067438125610352):::FLOAT8),
						((-2.6622776985168457):::FLOAT8)
				)
					AS tab_1768 (col_4412)
		)
SELECT
	cte_ref_195.col_4412 AS col_4413
FROM
	with_628 AS cte_ref_195
ORDER BY
	cte_ref_195.col_4412 ASC, cte_ref_195.col_4412 DESC
LIMIT
	40:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1769
SET
	_interval = tab_1769._interval, _inet = tab_1769._inet
WHERE
	tab_1769._bool
LIMIT
	42:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1770
SET
	_uuid = '6769cfa6-67a7-4346-a50b-bdbfb3b16dcf':::UUID
ORDER BY
	tab_1770._decimal, tab_1770._timestamptz ASC, tab_1770._float8 ASC, tab_1770._bytes DESC, tab_1770._uuid ASC
LIMIT
	22:::INT8;

WITH
	with_629 (col_4414)
		AS (
			SELECT
				*
			FROM
				(VALUES ('1988-11-01':::DATE), (NULL), (NULL), (localtimestamp():::DATE::DATE)) AS tab_1772 (col_4414)
			EXCEPT SELECT '1989-12-14':::DATE AS col_4415
		)
SELECT
	cte_ref_196.col_4414 AS col_4416
FROM
	with_629 AS cte_ref_196
LIMIT
	76:::INT8;

SELECT
	tab_1773._int8 AS col_4417, tab_1773._date AS col_4418, tab_1773._interval AS col_4419
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1773
WHERE
	isnan(1.0092976410741268:::FLOAT8::FLOAT8)::BOOL
LIMIT
	37:::INT8;

WITH
	with_630 (col_4420) AS (SELECT * FROM (VALUES (true)) AS tab_1774 (col_4420))
SELECT
	cte_ref_197.col_4420 AS col_4421
FROM
	with_630 AS cte_ref_197
ORDER BY
	cte_ref_197.col_4420 DESC, cte_ref_197.col_4420 ASC, cte_ref_197.col_4420
LIMIT
	92:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1778
SELECT
	28099:::INT8 AS col_4425,
	(-1067324115):::INT8 AS col_4426,
	tab_1779._int4 AS col_4427,
	'+Inf':::FLOAT8 AS col_4428,
	3.4028234663852886e+38:::FLOAT8 AS col_4429,
	tab_1779._date AS col_4430,
	'1970-01-01 08:44:29.000858+00:00':::TIMESTAMP AS col_4431,
	tab_1779._timestamptz AS col_4432,
	'00:00:00':::INTERVAL AS col_4433,
	tab_1779._bool AS col_4434,
	tab_1779._decimal AS col_4435,
	e'\x0f':::STRING AS col_4436,
	'\x':::BYTES AS col_4437,
	tab_1779._uuid AS col_4438,
	'c276:60bc:633a:5ae9:bf1a:a0bc:47f5:e22/90':::INET AS col_4439,
	tab_1779._jsonb AS col_4440
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1779
WHERE
	tab_1779._bool
LIMIT
	47:::INT8;

WITH
	with_632 (col_4441, col_4442)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-6731184003406927699):::INT8, 3095874880:::OID),
						((-5216508231321790906):::INT8, 608674282:::OID),
						((-558996856324977021):::INT8, 1729987017:::OID)
				)
					AS tab_1780 (col_4441, col_4442)
		),
	with_633 (col_4443)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1798253369:::OID),
						(1327576555:::OID),
						(0:::OID),
						(NULL),
						(1124642020:::OID),
						(2446966282:::OID)
				)
					AS tab_1781 (col_4443)
		)
SELECT
	tab_1782._int4 AS col_4444,
	tab_1782._decimal AS col_4445,
	'1970-01-03 09:49:56.000235+00:00':::TIMESTAMPTZ AS col_4446
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1782
ORDER BY
	tab_1782._int4 ASC
LIMIT
	7:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1783
SET
	_float4 = tab_1783._float4
ORDER BY
	tab_1783._date DESC, tab_1783._float8 ASC
LIMIT
	24:::INT8;

SELECT 'fb91:60b2:f291:bd31:5a24:68a8:b769:299d/74':::INET AS col_4447 LIMIT 8:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1784
SET
	_jsonb = tab_1784._jsonb,
	_timestamp = tab_1784._timestamp,
	_interval = (tab_1784._interval::INTERVAL * tab_1784._int2::INT8)::INTERVAL
WHERE
	(tab_1784._bool OR false)
LIMIT
	19:::INT8;

WITH
	with_634 (col_4448) AS (SELECT * FROM (VALUES ((-16008151.95765106131):::DECIMAL)) AS tab_1785 (col_4448)),
	with_635 (col_4449) AS (SELECT * FROM (VALUES (NULL)) AS tab_1786 (col_4449))
SELECT
	NULL AS col_4450,
	tab_1787._inet AS col_4451,
	tab_1787._int8 AS col_4452,
	tab_1787._float4 AS col_4453,
	tab_1787._uuid AS col_4454,
	tab_1787._decimal AS col_4455
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1787
LIMIT
	24:::INT8;

INSERT INTO defaultdb.public.seed AS tab_1788 DEFAULT VALUES;

SELECT
	tab_1789._float4 AS col_4456, min(tab_1790._int8::INT8)::INT8 AS col_4457
FROM
	defaultdb.public.seed@[0] AS tab_1789, defaultdb.public.seed@[0] AS tab_1790
GROUP BY
	tab_1790._uuid, tab_1790._int8, tab_1789._float4
ORDER BY
	tab_1790._uuid DESC;

WITH
	with_636 (col_4458)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(2285487682:::OID),
						(194563615:::OID),
						(CASE WHEN false THEN NULL ELSE NULL END),
						(791406575:::OID),
						(NULL)
				)
					AS tab_1791 (col_4458)
		),
	with_637 (col_4459)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						('23:01:02.624579':::TIME),
						('09:20:39.258724':::TIME),
						('11:31:58.545142':::TIME),
						('11:23:22.270916':::TIME),
						('11:53:21.069448':::TIME)
				)
					AS tab_1792 (col_4459)
		)
SELECT
	cte_ref_198.col_4459 AS col_4460
FROM
	with_637 AS cte_ref_198
WHERE
	false
ORDER BY
	cte_ref_198.col_4459 DESC
LIMIT
	78:::INT8;

SELECT count(*) AS col_4469 FROM defaultdb.public.seed@[0] AS tab_1798 GROUP BY tab_1798._int8, tab_1798._float8;

UPDATE defaultdb.public.seed AS tab_1799 SET _timestamptz = NULL ORDER BY tab_1799._interval ASC LIMIT 16:::INT8;

SELECT
	tab_1800._timestamp AS col_4470, '1970-01-06 19:17:03.000028+00:00':::TIMESTAMPTZ AS col_4471
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1800
LIMIT
	15:::INT8;

WITH
	with_642 (col_4472)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('08:12:26.202157-05:44:00':::TIMETZ),
						('10:50:17.21366+13:02:00':::TIMETZ),
						(
							('01:29:26.404175+12:59:00':::TIMETZ::TIMETZ - '-45 years -9 mons -591 days -00:19:51.272377':::INTERVAL::INTERVAL)::TIMETZ
						),
						('00:00:00+15:59:00':::TIMETZ),
						('22:18:13.975357-06:35:00':::TIMETZ)
				)
					AS tab_1801 (col_4472)
		)
SELECT
	30065:::INT8 AS col_4473,
	tab_1802._string AS col_4474,
	tab_1802._bytes AS col_4475,
	tab_1802._jsonb AS col_4476,
	NULL AS col_4477
FROM
	defaultdb.public.seed@[0] AS tab_1802
WHERE
	false
ORDER BY
	tab_1802._float8 DESC, tab_1802._uuid, tab_1802._string ASC;

SELECT
	NULL AS col_4479, '1970-01-06 05:03:07.000082+00:00':::TIMESTAMPTZ AS col_4480
FROM
	defaultdb.public.seed@[0] AS tab_1804, defaultdb.public.seed@[0] AS tab_1805
WHERE
	e'sX\x1a':::STRING NOT ILIKE tab_1805._string
LIMIT
	42:::INT8;

WITH
	with_643 (col_4481)
		AS (
			SELECT
				*
			FROM
				(VALUES ((-1.121212935457736):::FLOAT8), (2.2012649562844553:::FLOAT8), (1.4124937719057407:::FLOAT8))
					AS tab_1806 (col_4481)
		)
SELECT
	count(*) AS col_4482
FROM
	defaultdb.public.seed@[0] AS tab_1807
GROUP BY
	tab_1807._int8, tab_1807._float8
ORDER BY
	tab_1807._float8 ASC, tab_1807._int8 ASC;

SELECT
	tab_1808._jsonb AS col_4483,
	tab_1809._interval AS col_4484,
	'{"b": true, "bar": {}, "foobar": {" }VC$YYr": [null], "b": {"a": [{}], "foo": {}}, "baz": "&U92^XD0^y", "xk&": [1.1709738773627105, [[[[0.02569289740164593], {}]]]]}}':::JSONB
		AS col_4485,
	tab_1809._timestamptz AS col_4486,
	true AS col_4487,
	tab_1809._int2 AS col_4488,
	(-1.0):::FLOAT8 AS col_4489,
	'72a2fbbe-b36a-4c20-bc6e-c7bdd20ad4e3':::UUID AS col_4490,
	'116.142.125.139/24':::INET AS col_4491,
	tab_1808._timestamp AS col_4492
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1808,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1809
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1810 ON (tab_1809._interval) = (tab_1810._interval)
WHERE
	tab_1808._bool;

SELECT
	NULL AS col_4493
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1811
WHERE
	tab_1811._bool
LIMIT
	86:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1812
SET
	_string = tab_1812._string, _interval = '-60 years -1 mons -91 days -16:31:46.520273':::INTERVAL, _int2 = NULL
WHERE
	'8cc:5d44:73b9:5e90:2fc9:501e:f9c7:9806/63':::INET::INET
	IN (SELECT '190.166.77.11/1':::INET::INET AS col_4494 LIMIT 15:::INT8);

WITH
	with_647 (col_4501, col_4502)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(sign(1.0:::FLOAT8::FLOAT8)::FLOAT8::FLOAT8 % 0.16955888587809032:::FLOAT8::FLOAT8)::FLOAT8,
							1205930296:::INT8
						),
						(
							0.6419834808749911:::FLOAT8,
							(
								WITH
									with_644 (col_4495, col_4496)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(1554142995:::OID, fnv64a(NULL::STRING)::INT8),
														(2493922856:::OID, 7403218433936915782:::INT8)
												)
													AS tab_1813 (col_4495, col_4496)
										),
									with_645 (col_4497)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(e'\x14\\:VU':::STRING),
														(e'&k\x1e}][\x1b!':::STRING),
														(e'1\x19ylXf':::STRING)
												)
													AS tab_1814 (col_4497)
										),
									with_646 (col_4498, col_4499)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														('23:47:22.274223':::TIME, NULL),
														('19:31:21.516882':::TIME, 3564142832:::OID)
												)
													AS tab_1815 (col_4498, col_4499)
										)
								SELECT
									tab_1816._int4 AS col_4500
								FROM
									defaultdb.public.seed@[0] AS tab_1816
								WHERE
									tab_1816._bool
								LIMIT
									1:::INT8
							)
						),
						((-0.14867954192198596):::FLOAT8, 1:::INT8),
						(log(NULL::FLOAT8, 0.11115227848521647:::FLOAT8::FLOAT8)::FLOAT8, NULL),
						(NULL, 736495271:::INT8)
				)
					AS tab_1817 (col_4501, col_4502)
		),
	with_648 (col_4503) AS (SELECT * FROM (VALUES (e'\x00':::STRING), (e'\'':::STRING)) AS tab_1818 (col_4503)),
	with_649 (col_4504)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('false':::JSONB),
						(
							'[{"a": [{}, {"a": false, "baz": true}, [{"nz0)3/f_{W": {}}], true, false], "baz": {"=YB&3+AC": {"bar": {}}}, "n,/s": 1.298119205107301, "nT3P~D*N-d": []}]':::JSONB
						),
						(
							e'{";ver": {"b": null}, "B`\'c4!/cc": {"*Cw\\"": [], ":k&": {"baz": [[]]}, "`VL4": [{}], "b": []}, "NBP?kr/": false, "a": [], "bar": false, "foobar": "a"}':::JSONB
						),
						(jsonb_build_object('22:33:26.039952':::TIME)::JSONB),
						(NULL)
				)
					AS tab_1819 (col_4504)
		)
SELECT
	(-2.366758281576562735E+21):::DECIMAL AS col_4505,
	tab_1820._inet AS col_4506,
	tab_1820._uuid AS col_4507,
	tab_1820._float8 AS col_4508,
	tab_1820._date AS col_4509,
	tab_1820._timestamp AS col_4510,
	tab_1820._bytes AS col_4511,
	tab_1820._interval AS col_4512
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1820
ORDER BY
	tab_1820._int2 DESC
LIMIT
	45:::INT8;

WITH
	with_650 (col_4513)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-0.6084972840803782):::FLOAT8),
						(
							(NULL::FLOAT8 // pow(NULL::FLOAT8, sin(abs((-0.1526647593127778):::FLOAT8::FLOAT8)::FLOAT8::FLOAT8)::FLOAT8::FLOAT8)::FLOAT8::FLOAT8)::FLOAT8
						),
						(1.2962951816745665:::FLOAT8),
						(1.0:::FLOAT8),
						((-1.8213361390833551):::FLOAT8),
						((-1.5422651884824061):::FLOAT8)
				)
					AS tab_1821 (col_4513)
			EXCEPT ALL
				SELECT * FROM (VALUES ((-1.9908187855895385):::FLOAT8)) AS tab_1822 (col_4514)
				INTERSECT SELECT * FROM (VALUES (1.1485518284264586:::FLOAT8), (NULL)) AS tab_1823 (col_4515)
		)
SELECT
	xor_agg(tab_1824._int8::INT8)::INT8 AS col_4516,
	min(tab_1824._uuid::UUID) OVER (PARTITION BY tab_1824._uuid ORDER BY tab_1824._interval DESC, tab_1824._int8 DESC ROWS BETWEEN 2991782471052392631:::INT8 PRECEDING AND UNBOUNDED FOLLOWING)::UUID
		AS col_4517,
	min(tab_1824._interval::INTERVAL)::INTERVAL AS col_4518
FROM
	defaultdb.public.seed@[0] AS tab_1824
GROUP BY
	tab_1824._uuid, tab_1824._int8, tab_1824._interval
HAVING
	bool_or(tab_1824._bool::BOOL)::BOOL
ORDER BY
	tab_1824._int8 DESC
LIMIT
	85:::INT8;

SELECT
	count(*) AS col_4519
FROM
	defaultdb.public.seed@[0] AS tab_1825
WHERE
	tab_1825._bool
GROUP BY
	tab_1825._jsonb
HAVING
	inet_same_family('75.52.45.246/4':::INET::INET, NULL::INET)::BOOL;

WITH
	with_651 (col_4520)
		AS (
			SELECT
				*
			FROM
				(VALUES (ARRAY[1240273577:::OID,1516472033:::OID,988473056:::OID,3000353927:::OID]))
					AS tab_1826 (col_4520)
		)
SELECT
	tab_1829._int8 AS col_4521,
	tab_1828._bytes AS col_4522,
	tab_1829._decimal AS col_4523,
	'1970-01-04 22:41:46.000648+00:00':::TIMESTAMP AS col_4524,
	hostmask('44cc:e34b:50b0:443:3e84:dd74:c39b:4657/74':::INET::INET)::INET AS col_4525,
	tab_1829._decimal AS col_4526,
	tab_1827._float8 AS col_4527
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1827,
	defaultdb.public.seed@[0] AS tab_1828
	CROSS JOIN defaultdb.public.seed@[0] AS tab_1829
WHERE
	true
ORDER BY
	tab_1828._int8;

WITH
	with_652 (col_4528)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							COALESCE(
								ARRAY[e'I\x0be':::STRING,e'w \rRKjt':::STRING,'P':::STRING,e'\U00002603':::STRING,e'g\x1a':::STRING],
								ARRAY[e'\x00':::STRING,e't\x16@\n\x07':::STRING]
							)
						),
						(ARRAY['V26W1^];t':::STRING,e'\x05':::STRING,e'\x00':::STRING]),
						(ARRAY[e'\x19A':::STRING])
				)
					AS tab_1830 (col_4528)
		),
	with_653 (col_4529)
		AS (SELECT * FROM (VALUES (1138237749:::OID), (1790936957:::OID), (2985643141:::OID)) AS tab_1831 (col_4529)),
	with_654 (col_4530)
		AS (SELECT * FROM (VALUES (false), ((NOT false)), (true), (false), (false)) AS tab_1832 (col_4530))
SELECT
	true AS col_4531
FROM
	with_654 AS cte_ref_202
ORDER BY
	cte_ref_202.col_4530
LIMIT
	63:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1833
		(_int2, _int4, _int8, _timestamp, _timestamptz, _interval, _bool, _string, _bytes, _jsonb)
SELECT
	(-13340):::INT8 AS col_4532,
	tab_1834._int4 AS col_4533,
	tab_1834._int4 AS col_4534,
	NULL AS col_4535,
	tab_1834._timestamptz AS col_4536,
	tab_1834._interval AS col_4537,
	tab_1834._bool AS col_4538,
	tab_1834._string AS col_4539,
	'\xddba2804fee78a':::BYTES AS col_4540,
	(SELECT tab_1834._jsonb AS col_4541 LIMIT 1:::INT8) AS col_4542
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1834
WHERE
	tab_1834._bool
LIMIT
	44:::INT8;

SELECT
	tab_1835._jsonb AS col_4543, '1.2762272892399043':::JSONB AS col_4544
FROM
	defaultdb.public.seed AS tab_1835 JOIN defaultdb.public.seed AS tab_1836 ON (tab_1835._jsonb) = (tab_1836._jsonb)
LIMIT
	91:::INT8;

UPDATE defaultdb.public.seed AS tab_1837 SET _inet = tab_1837._inet LIMIT 26:::INT8;

WITH
	with_655 (col_4545)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-10 21:24:21.000933+00:00':::TIMESTAMPTZ),
						(NULL),
						('1970-01-09 16:37:44.000426+00:00':::TIMESTAMPTZ)
				)
					AS tab_1838 (col_4545)
		)
SELECT
	cte_ref_203.col_4545 AS col_4546
FROM
	with_655 AS cte_ref_203
WHERE
	false;

INSERT
INTO
	defaultdb.public.seed AS tab_1839
		(_int4, _int8, _date, _timestamptz, _interval, _bool, _decimal, _bytes, _uuid, _inet)
WITH
	with_656 (col_4547)
		AS (
			SELECT
				tab_1840._date AS col_4547
			FROM
				defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1840
			WHERE
				NULL
		),
	with_657 (col_4548, col_4549)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('V$':::STRING, NULL),
						(
							'"':::STRING,
							age('1970-01-03 03:34:07.000649+00:00':::TIMESTAMPTZ::TIMESTAMPTZ, '1970-01-05 17:19:37.000006+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL
						),
						(e'\x14':::STRING, '00:00:00':::INTERVAL),
						(e'\f\x189\x16wD\x7f\x01~':::STRING, '18 years 5 mons 228 days 07:13:14.365965':::INTERVAL)
				)
					AS tab_1841 (col_4548, col_4549)
		)
SELECT
	(-812495396):::INT8 AS col_4550,
	(-3472299168734006197):::INT8 AS col_4551,
	'1982-05-30':::DATE AS col_4552,
	'1970-01-01 07:46:20.00069+00:00':::TIMESTAMPTZ AS col_4553,
	'-52 years -3 mons -757 days -18:31:35.5757':::INTERVAL AS col_4554,
	false AS col_4555,
	(-5.61437489946915140E+25):::DECIMAL AS col_4556,
	'\x72a9cb95060b5b83ab':::BYTES AS col_4557,
	'c6cd3c6c-330f-4a10-b36b-ea0f2ae684d2':::UUID AS col_4558,
	'3458:c864:1d97:7cad:bc6b:23da:e6da:836e/0':::INET AS col_4559
LIMIT
	99:::INT8;

WITH
	with_658 (col_4560)
		AS (SELECT * FROM (VALUES (NULL), ('9559d102-a80c-436f-b9ac-4dca134eb6b0':::UUID)) AS tab_1842 (col_4560))
SELECT
	cte_ref_205.col_4560 AS col_4561, '498122e3-f488-4e0f-82c4-e837d510cfaa':::UUID AS col_4562
FROM
	with_658 AS cte_ref_204, with_658 AS cte_ref_205
WHERE
	true
LIMIT
	48:::INT8;

DELETE FROM defaultdb.public.seed AS tab_1843 WHERE false LIMIT 1:::INT8;

SELECT (-8700898877285832638):::INT8 AS col_4563 FROM defaultdb.public.seed@[0] AS tab_1844;

SELECT
	tab_1845._bytes AS col_4564, 1674592164:::INT8 AS col_4565
FROM
	defaultdb.public.seed@[0] AS tab_1845
WHERE
	true
ORDER BY
	tab_1845._bytes ASC, tab_1845._uuid ASC;

SELECT
	(inet_same_family('c7b6:6ab8:74da:cd2b:88d9:2776:57d1:f134/70':::INET::INET, NULL::INET)::BOOL AND false)
		AS col_4566
LIMIT
	42:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1846 (_int4, _int8, _float8, _date, _timestamptz, _decimal, _string, _uuid, _inet)
SELECT
	(-1403179403):::INT8 AS col_4567,
	(-2903974636945502367):::INT8 AS col_4568,
	ceiling((0.14483505420952114:::FLOAT8::FLOAT8 % 1.2456998975535802:::FLOAT8::FLOAT8)::FLOAT8::FLOAT8)::FLOAT8
		AS col_4569,
	'1974-12-04':::DATE AS col_4570,
	'1970-01-04 14:30:42.000422+00:00':::TIMESTAMPTZ AS col_4571,
	5.40381444876653822E+35:::DECIMAL AS col_4572,
	NULL AS col_4573,
	'4513a68c-ee0e-4fba-aa5e-dac18622c5ce':::UUID AS col_4574,
	'246.160.176.222/20':::INET AS col_4575;

SELECT
	power(NULL::DECIMAL, tab_1847._decimal::DECIMAL)::DECIMAL AS col_4576
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1847
WHERE
	tab_1847._bool
GROUP BY
	tab_1847._decimal;

UPDATE
	defaultdb.public.seed AS tab_1848
SET
	_float4 = (-0.5826131105422974):::FLOAT8, _date = '1987-11-15':::DATE
WHERE
	NULL
LIMIT
	2:::INT8;

WITH
	with_659 (col_4577)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1562229868:::OID),
						(903758879:::OID),
						(3237459093:::OID),
						(3673840826:::OID),
						(2487746783:::OID)
				)
					AS tab_1849 (col_4577)
		),
	with_660 (col_4579)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(0:::INT8),
						(NULL),
						(175321718:::INT8),
						(
							(
								SELECT
									tab_1850._int8 AS col_4578
								FROM
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1850
								WHERE
									(NOT tab_1850._bool)
								ORDER BY
									tab_1850._bytes, tab_1850._interval ASC, tab_1850._timestamptz DESC
								LIMIT
									1:::INT8
							)
						)
				)
					AS tab_1851 (col_4579)
		),
	with_661 (col_4580, col_4581) AS (SELECT * FROM (VALUES (NULL, 1817780376:::OID)) AS tab_1852 (col_4580, col_4581))
SELECT
	cte_ref_206.col_4581 AS col_4582
FROM
	with_661 AS cte_ref_206
WHERE
	false
GROUP BY
	cte_ref_206.col_4581
LIMIT
	21:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1853
		(
			_int2,
			_int4,
			_int8,
			_float4,
			_float8,
			_date,
			_timestamp,
			_timestamptz,
			_interval,
			_decimal,
			_string,
			_uuid,
			_inet
		)
SELECT
	1429:::INT8 AS col_4583,
	(-1311700288):::INT8 AS col_4584,
	NULL AS col_4585,
	CASE WHEN false THEN 0.0:::FLOAT8 ELSE 1.0:::FLOAT8 END AS col_4586,
	(-1.5791667334327357):::FLOAT8 AS col_4587,
	tab_1855._date AS col_4588,
	'1970-01-11 11:20:08.000578+00:00':::TIMESTAMP AS col_4589,
	'1970-01-08 03:35:14.000535+00:00':::TIMESTAMPTZ AS col_4590,
	'33 years 2 mons 875 days 08:02:04.560894':::INTERVAL AS col_4591,
	(-0.07203865992532387940):::DECIMAL AS col_4592,
	NULL AS col_4593,
	'b20652a1-8c07-4b41-8293-a70822ba2f70':::UUID AS col_4594,
	'2bd7:3dc4:7389:ef2f:754b:1aa:21c8:1f2e/21':::INET AS col_4595
FROM
	defaultdb.public.seed AS tab_1854 JOIN defaultdb.public.seed AS tab_1855 ON (tab_1854._int8) = (tab_1855._int8)
ORDER BY
	tab_1854._date DESC, tab_1855._date ASC
LIMIT
	86:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1856
SET
	_interval = tab_1856._interval
WHERE
	true
ORDER BY
	tab_1856._int2
LIMIT
	3:::INT8;

SELECT
	'\x859564':::BYTES AS col_4596,
	NULL AS col_4597,
	tab_1857._int4 AS col_4598,
	tab_1857._uuid AS col_4599,
	tab_1857._string AS col_4600,
	tab_1857._int8 AS col_4601,
	tab_1857._timestamptz AS col_4602,
	tab_1857._interval AS col_4603,
	(-0.6179241830091584):::FLOAT8 AS col_4604
FROM
	defaultdb.public.seed@[0] AS tab_1857
LIMIT
	33:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1858
SELECT
	tab_1859._int2 AS col_4605,
	tab_1859._int2 AS col_4606,
	tab_1860._int8 AS col_4607,
	tab_1859._float8 AS col_4608,
	0.6586888409379786:::FLOAT8 AS col_4609,
	'1978-03-04':::DATE AS col_4610,
	tab_1859._timestamp AS col_4611,
	(NULL::TIMESTAMPTZ + NULL::INTERVAL)::TIMESTAMPTZ AS col_4612,
	tab_1860._interval AS col_4613,
	tab_1859._bool AS col_4614,
	5.921875700168092820E+31:::DECIMAL AS col_4615,
	e'\t':::STRING AS col_4616,
	tab_1859._bytes AS col_4617,
	'f2d48f9b-ade6-4419-a2d5-e7f39dd8e05f':::UUID AS col_4618,
	tab_1859._inet AS col_4619,
	e'[[false, [[]]], ["baz"], {"c": {}, "ver": true}, {"/|TghS": {}, "c": {}, "x\\"0~-7G": null}, []]':::JSONB
		AS col_4620
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1859,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1860
WHERE
	tab_1860._bool
LIMIT
	7:::INT8;

SELECT
	count(*) AS col_4621
FROM
	defaultdb.public.seed@[0] AS tab_1861
WHERE
	false
GROUP BY
	tab_1861._int8, tab_1861._float8
ORDER BY
	tab_1861._int8 ASC, tab_1861._int8 DESC, tab_1861._int8 ASC, tab_1861._float8 ASC
LIMIT
	52:::INT8;

WITH
	with_662 (col_4622) AS (SELECT * FROM (VALUES ('':::STRING:::NAME)) AS tab_1862 (col_4622))
SELECT
	tab_1863._timestamptz AS col_4623
FROM
	with_662 AS cte_ref_207,
	defaultdb.public.seed@[0] AS tab_1863
	FULL JOIN defaultdb.public.seed@[0] AS tab_1864 ON false
ORDER BY
	tab_1863._inet ASC, tab_1864._inet;

DELETE FROM defaultdb.public.seed AS tab_1865 WHERE tab_1865._bool LIMIT 90:::INT8;

WITH
	with_663 (col_4624)
		AS (SELECT * FROM (VALUES (0:::OID), (4228342764:::OID), (2918137125:::OID)) AS tab_1866 (col_4624)),
	with_664 (col_4625)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), ('-73 years -10 mons -783 days -21:51:13.701795':::INTERVAL)) AS tab_1867 (col_4625)
		)
SELECT
	count(*) AS col_4626
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1868
WHERE
	true
GROUP BY
	tab_1868._int8, tab_1868._float8, tab_1868._date
HAVING
	not_similar_to_escape('VC':::STRING::STRING, '':::STRING::STRING, '':::STRING::STRING)::BOOL
ORDER BY
	tab_1868._int8
LIMIT
	25:::INT8;

SELECT
	tab_1870._interval AS col_4627,
	tab_1870._timestamptz AS col_4628,
	tab_1869._string AS col_4629,
	'1985-09-27':::DATE AS col_4630,
	tab_1870._interval AS col_4631,
	0.2739046317384718:::FLOAT8 AS col_4632,
	tab_1869._float4 AS col_4633,
	tab_1870._int2 AS col_4634,
	tab_1869._inet AS col_4635,
	tab_1870._decimal AS col_4636,
	tab_1870._string AS col_4637,
	(-0.9836896061897278):::FLOAT8 AS col_4638
FROM
	defaultdb.public.seed@[0] AS tab_1869, defaultdb.public.seed@[0] AS tab_1870
WHERE
	tab_1870._bool
LIMIT
	59:::INT8;

WITH
	with_665 (col_4639)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(3007169718:::OID),
						(1407590212:::OID),
						(NULL),
						(386558044:::OID),
						(3847001948:::OID),
						(CASE WHEN NULL THEN NULL ELSE 2203093171:::OID END)
				)
					AS tab_1871 (col_4639)
		)
SELECT
	cte_ref_208.col_4639 AS col_4640
FROM
	with_665 AS cte_ref_208
WHERE
	true
GROUP BY
	cte_ref_208.col_4639;

WITH
	with_666 (col_4641)
		AS (
			SELECT
				*
			FROM
				(VALUES (2537158223:::OID), (723146902:::OID), (NULL), (0:::OID), (832480351:::OID), (1171763005:::OID))
					AS tab_1872 (col_4641)
		),
	with_667 (col_4642)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), (e'`\x1e,*I':::STRING), (e'\x1e`PcdP':::STRING), (NULL), (NULL)) AS tab_1873 (col_4642)
		),
	with_668 (col_4643) AS (SELECT * FROM (VALUES (3483082316:::OID)) AS tab_1874 (col_4643))
SELECT
	CASE WHEN false THEN NULL ELSE ARRAY[509356959:::OID,2757613212:::OID,2422259471:::OID] END AS col_4644,
	585256194:::OID AS col_4645,
	'\x75806dcb':::BYTES AS col_4646,
	'"baz"':::JSONB AS col_4647
LIMIT
	68:::INT8;

SELECT
	tab_1875._jsonb AS col_4648, netmask('652a:7f88:995b:b3aa:a341:9411:d8a6:13ed/73':::INET::INET)::INET AS col_4649
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1875
WHERE
	true
ORDER BY
	tab_1875._timestamp
LIMIT
	62:::INT8;

WITH
	with_669 (col_4650)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-1.9962738752365112):::FLOAT8),
						(NULL),
						(0.5924224257469177:::FLOAT8),
						((-0.5407918691635132):::FLOAT8)
				)
					AS tab_1876 (col_4650)
		),
	with_670 (col_4651) AS (SELECT * FROM (VALUES (true), ((false AND NULL))) AS tab_1877 (col_4651))
SELECT
	(-475606527):::INT8 AS col_4652, NULL AS col_4653
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1878
ORDER BY
	tab_1878._int2 DESC
LIMIT
	68:::INT8;

UPDATE defaultdb.public.seed AS tab_1879 SET _float4 = tab_1879._float8, _bool = true LIMIT 39:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1880
SET
	_float4 = tab_1880._float4,
	_timestamp = (tab_1880._date::DATE + '18:12:33.388855':::TIME::TIME)::TIMESTAMP,
	_decimal = NULL
LIMIT
	89:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1881 (_int2, _timestamp, _interval, _string, _bytes, _uuid)
SELECT
	(-22125):::INT8 AS col_4654,
	'1970-01-04 17:02:03.000562+00:00':::TIMESTAMP AS col_4655,
	'45 years 2 mons 565 days 08:00:54.009712':::INTERVAL AS col_4656,
	(ltrim('*#':::STRING::STRING)::STRING::STRING || '':::STRING::STRING)::STRING AS col_4657,
	(convert_to(e'\x14@-\x1d6\x03j\x07O':::STRING::STRING, NULL::STRING)::BYTES::BYTES || '\x10':::BYTES::BYTES)::BYTES
		AS col_4658,
	'ddeec318-7f26-496a-828d-caafe4cf6f9e':::UUID AS col_4659
FROM
	defaultdb.public.seed AS tab_1882 JOIN defaultdb.public.seed AS tab_1883 ON (tab_1882._int8) = (tab_1883._int8)
WHERE
	true
LIMIT
	62:::INT8;

SELECT
	count(*) AS col_4660
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1884
WHERE
	false
GROUP BY
	tab_1884._int8
ORDER BY
	tab_1884._int8 ASC;

INSERT
INTO
	defaultdb.public.seed AS tab_1885
WITH
	with_671 (col_4661) AS (SELECT * FROM (VALUES ('\x22c7bfabe2a6b65683':::BYTES)) AS tab_1886 (col_4661)),
	with_672 (col_4662)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((7.511864882253153497E+21:::DECIMAL::DECIMAL % 8008049176657526680:::INT8::INT8)::DECIMAL),
						(5473793587334.276887:::DECIMAL),
						((-7849.034642576350443):::DECIMAL),
						(cluster_logical_timestamp()::DECIMAL),
						(NULL)
				)
					AS tab_1887 (col_4662)
		)
SELECT
	10078:::INT8 AS col_4663,
	tab_1888._int4 AS col_4664,
	tab_1888._int8 AS col_4665,
	(-0.49032989144325256):::FLOAT8 AS col_4666,
	0.032818646587198935:::FLOAT8 AS col_4667,
	'1991-11-26':::DATE AS col_4668,
	NULL AS col_4669,
	'1970-01-05 07:58:54.000918+00:00':::TIMESTAMPTZ AS col_4670,
	tab_1888._interval AS col_4671,
	(tab_1888._bool AND true) AS col_4672,
	tab_1888._decimal AS col_4673,
	tab_1888._string AS col_4674,
	tab_1888._bytes AS col_4675,
	'00000000-0000-0000-0000-000000000000':::UUID AS col_4676,
	'8e62:ca31:7cf6:784b:fe4:2dea:565f:79bd/92':::INET AS col_4677,
	tab_1888._jsonb AS col_4678
FROM
	defaultdb.public.seed@[0] AS tab_1888
ORDER BY
	tab_1888._string ASC
LIMIT
	72:::INT8;

SELECT e'\U00002603':::STRING AS col_4679 LIMIT 50:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1889 (_float4, _float8, _date, _timestamp, _bool, _string, _bytes, _uuid, _inet)
WITH
	with_673 (col_4680, col_4681)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(B'11111100001011110', '1985-02-24':::DATE),
						(B'10101100100101111', localtimestamp():::DATE::DATE),
						(B'00011000001010111', '1991-05-30':::DATE),
						(NULL, '1978-08-01':::DATE),
						(B'01000101000000110', '1980-06-09':::DATE),
						(B'00001000110000000', NULL)
				)
					AS tab_1890 (col_4680, col_4681)
		),
	with_674 (col_4683)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							COALESCE(
								COALESCE(NULL, (-543063046):::INT8),
								(
									SELECT
										tab_1891._int4 AS col_4682
									FROM
										defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1891
									WHERE
										false
									ORDER BY
										tab_1891._int8
									LIMIT
										1:::INT8
								)
							)
						),
						((-1530353190):::INT8),
						(NULL)
				)
					AS tab_1892 (col_4683)
		)
SELECT
	1.5974308252334595:::FLOAT8 AS col_4684,
	tab_1893._float8 AS col_4685,
	tab_1893._date AS col_4686,
	'1970-01-07 14:18:23.000422+00:00':::TIMESTAMP AS col_4687,
	true AS col_4688,
	tab_1893._string AS col_4689,
	'\xc555':::BYTES AS col_4690,
	'c4b3e941-5c5a-48bc-97c0-994621616087':::UUID AS col_4691,
	tab_1893._inet AS col_4692
FROM
	defaultdb.public.seed@[0] AS tab_1893
ORDER BY
	tab_1893._timestamptz DESC
LIMIT
	14:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1894 (_int4, _timestamp, _interval, _decimal, _string, _bytes, _uuid)
WITH
	with_675 (col_4693)
		AS (SELECT * FROM (VALUES (e'"W\x02xZ-\x16':::STRING), (e'\U00002603':::STRING)) AS tab_1895 (col_4693))
SELECT
	(-2023894686):::INT8 AS col_4694,
	NULL AS col_4695,
	'20 years 11 mons 593 days 20:47:36.979655':::INTERVAL AS col_4696,
	425160570178258769.3:::DECIMAL AS col_4697,
	('[[{"foo": [], "zZSk{0ua|`v": []}, []], "bar", [[[{"a": true, "f;R": null}]], {}], [null], true]':::JSONB::JSONB->>cte_ref_209.col_4693::STRING)::STRING
		AS col_4698,
	'\x21508c82bb':::BYTES AS col_4699,
	'ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID AS col_4700
FROM
	with_675 AS cte_ref_209
LIMIT
	37:::INT8;

SELECT ARRAY[(-4261):::INT8,10760:::INT8,(-1):::INT8,(-3014):::INT8] AS col_4701;

SELECT 1.864449813494555:::FLOAT8 AS col_4702;

SELECT count(*) AS col_4703 FROM defaultdb.public.seed@[0] AS tab_1896 WHERE tab_1896._bool GROUP BY tab_1896._jsonb;

SELECT ceiling(NULL::FLOAT8)::FLOAT8 AS col_4704 FROM defaultdb.public.seed@[0] AS tab_1897 WHERE true LIMIT 86:::INT8;

INSERT INTO defaultdb.public.seed AS tab_1898 DEFAULT VALUES;

WITH
	with_676 (col_4705) AS (SELECT * FROM (VALUES (B'101001110101000010001011101001100011111')) AS tab_1899 (col_4705)),
	with_677 (col_4706, col_4707)
		AS (
			SELECT
				*
			FROM
				(VALUES (e'/?N\x06$\x1a':::STRING:::NAME, 0:::INT8), ('"':::STRING, NULL))
					AS tab_1900 (col_4706, col_4707)
		)
SELECT
	2172664418:::OID AS col_4708
LIMIT
	45:::INT8;

WITH
	with_678 (col_4712)
		AS (SELECT NULL AS col_4712 FROM defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1902),
	with_679 (col_4713)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('Rk5X':::STRING),
						(e'\x0fH?P\x135.':::STRING),
						(NULL),
						('=':::STRING),
						(e'\x0eG#\x02Q0S':::STRING),
						(e'O\x06T:~|':::STRING)
				)
					AS tab_1903 (col_4713)
		)
SELECT
	tab_1904._int4 AS col_4714
FROM
	defaultdb.public.seed@[0] AS tab_1904
LIMIT
	87:::INT8;

WITH
	with_684 (col_4731, col_4732)
		AS (SELECT * FROM (VALUES (NULL, e'AFC\x1cU':::STRING)) AS tab_1913 (col_4731, col_4732)),
	with_685 (col_4733, col_4734, col_4735)
		AS (
			SELECT
				*
			FROM
				(VALUES ('':::STRING, '1971-06-29':::DATE, '22:01:10.462775+13:16:00':::TIMETZ))
					AS tab_1914 (col_4733, col_4734, col_4735)
		)
SELECT
	false AS col_4736, cte_ref_212.col_4732 AS col_4737
FROM
	with_684 AS cte_ref_212
WHERE
	cte_ref_212.col_4731
ORDER BY
	cte_ref_212.col_4732;

WITH
	with_686 (col_4738)
		AS (SELECT * FROM (VALUES (2083265600:::OID), (2754002129:::OID), (NULL), (NULL)) AS tab_1915 (col_4738)),
	with_687 (col_4739)
		AS (
			SELECT
				2210298444:::OID AS col_4739
			FROM
				defaultdb.public.seed AS tab_1916
				JOIN defaultdb.public.seed AS tab_1917 ON (tab_1916._jsonb) = (tab_1917._jsonb)
			WHERE
				false
		)
SELECT
	tab_1918._uuid AS col_4740, tab_1918._inet AS col_4741, tab_1918._int2 AS col_4742
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1918, with_686 AS cte_ref_213;

WITH
	with_688 (col_4743)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), ((-1322075684):::INT8), ((-161884315):::INT8), ((-289389148):::INT8))
					AS tab_1919 (col_4743)
		)
SELECT
	342863429:::INT8 AS col_4744
FROM
	with_688 AS cte_ref_214
ORDER BY
	cte_ref_214.col_4743 ASC, cte_ref_214.col_4743 DESC, cte_ref_214.col_4743;

SELECT
	count(*) AS col_4745
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1920
WHERE
	tab_1920._bool
GROUP BY
	tab_1920._int8
LIMIT
	12:::INT8;

SELECT
	count(*) AS col_4746
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1921
GROUP BY
	tab_1921._int8, tab_1921._float8, tab_1921._date
LIMIT
	81:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1922 (_int2, _int4, _int8, _float8, _date, _timestamp, _interval, _decimal, _inet)
WITH
	with_690 (col_4749)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							set_masklen((WITH with_689 (col_4747) AS (SELECT * FROM (VALUES ('1987-01-28':::DATE), ('1988-01-03':::DATE), ('1988-05-17':::DATE)) AS tab_1923 (col_4747)) SELECT (tab_1924._inet::INET & tab_1924._inet::INET)::INET AS col_4748 FROM defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1924 LIMIT 1:::INT8)::INET, 1375969464087402732:::INT8::INT8)::INET
						),
						(NULL),
						(('174.38.67.222/26':::INET::INET | '249.97.61.175':::INET::INET)::INET)
				)
					AS tab_1925 (col_4749)
		)
SELECT
	16642:::INT8 AS col_4750,
	COALESCE(525267158:::INT8, (-403594124):::INT8) AS col_4751,
	5720994908760080378:::INT8 AS col_4752,
	0.8305940616014349:::FLOAT8 AS col_4753,
	'1987-01-29':::DATE AS col_4754,
	'3000-01-01 00:00:00+00:00':::TIMESTAMP AS col_4755,
	'-58 years -9 mons -789 days -14:56:48.240824':::INTERVAL AS col_4756,
	mod((-1.234E+401):::DECIMAL::DECIMAL, (-672973272.8963058828):::DECIMAL::DECIMAL)::DECIMAL AS col_4757,
	cte_ref_215.col_4749 AS col_4758
FROM
	with_690 AS cte_ref_215
WHERE
	NULL;

SELECT
	(-1629998992):::INT8 AS col_4760
FROM
	(VALUES ((-1718717777):::INT8), (2147483647:::INT8)) AS tab_1926 (col_4759)
ORDER BY
	tab_1926.col_4759;

INSERT
INTO
	defaultdb.public.seed AS tab_1927
WITH
	with_691 (col_4761, col_4762)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((NULL::DATE - '08:45:54.811536':::TIME::TIME)::TIMESTAMP, 17422:::INT8),
						('1970-01-06 00:26:48.000462+00:00':::TIMESTAMP, 27630:::INT8)
				)
					AS tab_1928 (col_4761, col_4762)
		)
SELECT
	0:::INT8 AS col_4763,
	cte_ref_216.col_4762 AS col_4764,
	(-6466532477702958673):::INT8 AS col_4765,
	NULL AS col_4766,
	'-Inf':::FLOAT8 AS col_4767,
	(COALESCE('-infinity':::DATE, '1980-10-29':::DATE)::DATE - 3877088398398466040:::INT8::INT8)::DATE AS col_4768,
	'3000-01-01 00:00:00+00:00':::TIMESTAMP AS col_4769,
	'1970-01-02 23:20:42.000123+00:00':::TIMESTAMPTZ AS col_4770,
	'-61 years -1 mons -364 days -15:46:29.241238':::INTERVAL AS col_4771,
	false AS col_4772,
	'NaN':::DECIMAL AS col_4773,
	NULL AS col_4774,
	'\x84f07f2bb4c7108a':::BYTES AS col_4775,
	'ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID AS col_4776,
	NULL AS col_4777,
	e'[{"\\"79": [true], "xx`xRO6pS": [false]}, 0.6425819286481945, false, "a"]':::JSONB AS col_4778
FROM
	with_691 AS cte_ref_216
ORDER BY
	cte_ref_216.col_4761 ASC
LIMIT
	69:::INT8;

SELECT
	tab_1929._bytes AS col_4779,
	tab_1929._date AS col_4780,
	1086531170:::INT8 AS col_4781,
	cluster_logical_timestamp()::DECIMAL AS col_4782,
	tab_1929._timestamp AS col_4783,
	e'{"2D>E": {"c": {}}, "HJeskoT/L": {}, "bar": [2.5035053827743847], "ld.M": false, "m\\"xN1g": {"c": {"a": true, "b(h;/}N:": null}}, "~0FA2>Uw": [[{"b": []}], true, []]}':::JSONB
		AS col_4784,
	tab_1929._float4 AS col_4785,
	'6e03425a-d419-4ed3-a8eb-63831561bed1':::UUID AS col_4786,
	tab_1929._bool AS col_4787,
	tab_1929._float8 AS col_4788
FROM
	defaultdb.public.seed@[0] AS tab_1929
LIMIT
	39:::INT8;

SELECT
	count(*) AS col_4789
FROM
	defaultdb.public.seed@[0] AS tab_1930
WHERE
	(NOT tab_1930._bool)
GROUP BY
	tab_1930._jsonb
LIMIT
	91:::INT8;

SELECT
	'f5ae:d04e:a561:5679:ef20:9856:98fa:b42b/83':::INET AS col_4790, NULL AS col_4791
FROM
	defaultdb.public.seed@[0] AS tab_1931
ORDER BY
	tab_1931._timestamptz DESC
LIMIT
	38:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1932
SELECT
	1:::INT8 AS col_4792,
	tab_1933._int2 AS col_4793,
	NULL AS col_4794,
	(-0.3386404812335968):::FLOAT8 AS col_4795,
	tab_1933._float4 AS col_4796,
	tab_1933._date AS col_4797,
	tab_1933._timestamp AS col_4798,
	tab_1933._timestamptz AS col_4799,
	tab_1933._interval AS col_4800,
	tab_1933._bool AS col_4801,
	tab_1933._decimal AS col_4802,
	tab_1933._string AS col_4803,
	tab_1933._bytes AS col_4804,
	tab_1933._uuid AS col_4805,
	tab_1933._inet AS col_4806,
	tab_1933._jsonb AS col_4807
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1933
LIMIT
	56:::INT8;

WITH
	with_692 (col_4808)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1367806289:::INT8),
						(COALESCE((-1445930001):::INT8, (-516897486):::INT8)),
						(2067097188:::INT8),
						(127:::INT8)
				)
					AS tab_1934 (col_4808)
		)
SELECT
	NULL AS col_4809,
	tab_1935._float4 AS col_4810,
	NULL AS col_4811,
	tab_1935._float4 AS col_4812,
	cte_ref_217.col_4808 AS col_4813,
	'1970-01-01 17:07:21.000467+00:00':::TIMESTAMPTZ AS col_4814,
	e'\'':::STRING AS col_4815,
	(
		SELECT
			tab_1936._int2 AS col_4816
		FROM
			defaultdb.public.seed@[0] AS tab_1936
		ORDER BY
			tab_1936._string ASC, tab_1936._int8 DESC
		LIMIT
			1:::INT8
	)
		AS col_4817,
	'1970-01-05 20:41:10.000203+00:00':::TIMESTAMP AS col_4818,
	tab_1935._int2 AS col_4819
FROM
	with_692 AS cte_ref_217, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1935
ORDER BY
	tab_1935._int8 DESC, tab_1935._int2, tab_1935._bool;

SELECT
	tab_1937._string AS col_4820,
	9.216942954952808995E+27:::DECIMAL AS col_4821,
	tab_1937._inet AS col_4822,
	(NULL::JSONB->>tab_1940._string::STRING)::STRING AS col_4823,
	tab_1937._bytes AS col_4824,
	tab_1939._inet AS col_4825
FROM
	defaultdb.public.seed@[0] AS tab_1937,
	defaultdb.public.seed@[0] AS tab_1938,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1939,
	defaultdb.public.seed@[0] AS tab_1940
WHERE
	NULL
LIMIT
	61:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1941
		(_int2, _int4, _int8, _float4, _float8, _date, _timestamptz, _interval, _string, _bytes, _inet)
SELECT
	NULL AS col_4826,
	1332199960:::INT8 AS col_4827,
	(-4240833329401088768):::INT8 AS col_4828,
	NULL AS col_4829,
	NULL AS col_4830,
	'1990-10-14':::DATE AS col_4831,
	'0001-01-01 00:00:00+00:00':::TIMESTAMPTZ AS col_4832,
	NULL AS col_4833,
	e'W]\x13FW4L':::STRING AS col_4834,
	'\x9623e3320caa9bb4d0':::BYTES AS col_4835,
	NULL AS col_4836
LIMIT
	85:::INT8;

WITH
	with_693 (col_4837)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(ARRAY['9a6b4fb1-bfcd-4ba1-8167-18d8add844ae':::UUID,'4021abe4-e1b7-4454-8c33-f69e6bbdd325':::UUID,'fb0c67db-bdb6-45f3-a892-cec48fac15ba':::UUID,'a2d067c2-814b-45c1-8770-d8b808964d57':::UUID], NULL, NULL, NULL)
						),
						(NULL)
				)
					AS tab_1942 (col_4837)
		),
	with_694 (col_4838)
		AS (SELECT * FROM (VALUES (3496376610:::OID), (1891887086:::OID), (982240567:::OID)) AS tab_1943 (col_4838))
SELECT
	count(*) AS col_4839
FROM
	defaultdb.public.seed@[0] AS tab_1944
WHERE
	(tab_1944._bool OR tab_1944._bool)
GROUP BY
	tab_1944._int8, tab_1944._float8
HAVING
	not_like_escape(e'5\x18\x05\x14':::STRING::STRING, NULL::STRING, NULL::STRING)::BOOL
LIMIT
	84:::INT8;

SELECT
	tab_1946._decimal AS col_4855, tab_1946._timestamp AS col_4856, tab_1946._int8 AS col_4857, NULL AS col_4858
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1946
ORDER BY
	tab_1946._decimal ASC, tab_1946._int8, tab_1946._float4, tab_1946._int8
LIMIT
	74:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1952
SET
	_string = tab_1952._string, _float4 = 1.1365936994552612:::FLOAT8
ORDER BY
	tab_1952._decimal, tab_1952._bool, tab_1952._float4 DESC, tab_1952._timestamp ASC
LIMIT
	73:::INT8;

SELECT
	tab_1953._bool AS col_4863,
	tab_1953._inet AS col_4864,
	tab_1953._int4 AS col_4865,
	1.2973108727927178:::FLOAT8 AS col_4866,
	tab_1953._string AS col_4867
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1953
ORDER BY
	tab_1953._inet, tab_1953._float4, tab_1953._timestamptz ASC;

INSERT
INTO
	defaultdb.public.seed AS tab_1954 (_int2, _int8, _timestamp, _timestamptz, _interval, _bool, _jsonb)
WITH
	with_697 (col_4868, col_4869)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(3826123067:::OID, 2.3688979148864746:::FLOAT8),
						(530686990:::OID, (-1.3690614700317383):::FLOAT8),
						(1516413230:::OID, 0.03510560467839241:::FLOAT8)
				)
					AS tab_1955 (col_4868, col_4869)
		)
SELECT
	tab_1956._int8 AS col_4870,
	NULL AS col_4871,
	tab_1956._timestamp AS col_4872,
	tab_1956._timestamptz AS col_4873,
	'-16 years -2 mons -54 days -24:34:57.934491':::INTERVAL AS col_4874,
	false AS col_4875,
	tab_1956._jsonb AS col_4876
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1956
WHERE
	false
ORDER BY
	tab_1956._interval DESC
LIMIT
	54:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_1957
SELECT
	tab_1958._int8 AS col_4877,
	1483581771:::INT8 AS col_4878,
	tab_1958._int8 AS col_4879,
	(-0.9220584630966187):::FLOAT8 AS col_4880,
	0.26521367402402074:::FLOAT8 AS col_4881,
	tab_1958._date AS col_4882,
	NULL AS col_4883,
	'1970-01-05 22:00:13.000483+00:00':::TIMESTAMPTZ AS col_4884,
	'50 years 8 mons 31 days 08:18:41.206999':::INTERVAL AS col_4885,
	tab_1958._bool AS col_4886,
	NULL AS col_4887,
	tab_1958._string AS col_4888,
	'\x462c':::BYTES AS col_4889,
	tab_1958._uuid AS col_4890,
	tab_1958._inet AS col_4891,
	tab_1958._jsonb AS col_4892
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1958
WHERE
	false
ORDER BY
	tab_1958._bytes DESC, tab_1958._timestamp DESC, tab_1958._int4 ASC, tab_1958._bytes
LIMIT
	8:::INT8;

WITH
	with_698 (col_4893)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(2566394682:::OID),
						(NULL),
						(3344834079:::OID),
						(COALESCE(1003416978:::OID, NULL)),
						(4255739949:::OID)
				)
					AS tab_1959 (col_4893)
			INTERSECT ALL SELECT * FROM (VALUES (2222578064:::OID)) AS tab_1960 (col_4894)
		),
	with_699 (col_4895)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(NULL),
						('\x39':::BYTES),
						('\x5ddd167b9b':::BYTES),
						(
							convert_to(NULL::STRING, CASE WHEN false THEN NULL ELSE e'\x1c]\x18iR':::STRING END::STRING)::BYTES
						)
				)
					AS tab_1961 (col_4895)
		)
SELECT
	cte_ref_219.col_4893 AS col_4896
FROM
	with_698 AS cte_ref_219;

INSERT INTO defaultdb.public.seed AS tab_1962 DEFAULT VALUES;

WITH
	with_700 (col_4897) AS (SELECT * FROM (VALUES (e'\U00002603':::STRING)) AS tab_1963 (col_4897))
SELECT
	NULL AS col_4898
FROM
	with_700 AS cte_ref_220;

UPDATE
	defaultdb.public.seed AS tab_1964
SET
	_decimal = tab_1964._decimal, _int2 = 5945:::INT8, _date = tab_1964._date
WHERE
	tab_1964._bool
LIMIT
	21:::INT8;

WITH
	with_701 (col_4899)
		AS (
			SELECT
				*
			FROM
				(VALUES (CASE WHEN true THEN 2928060924:::OID ELSE 1907176359:::OID END), (NULL), (135006353:::OID))
					AS tab_1965 (col_4899)
		),
	with_702 (col_4900)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(B'111100110010000100110000100100011000101011'),
						(B'111101111100010111100111100110110011100011'),
						(B'001000100101100111101110011001010001101001')
				)
					AS tab_1966 (col_4900)
		)
SELECT
	tab_1967._float4 AS col_4901,
	tab_1967._jsonb AS col_4902,
	tab_1967._date AS col_4903,
	(tab_1967._decimal::DECIMAL - (-55797000542752855.15):::DECIMAL::DECIMAL)::DECIMAL AS col_4904
FROM
	defaultdb.public.seed@[0] AS tab_1967
WHERE
	true
LIMIT
	44:::INT8;

SELECT
	(
		SELECT
			tab_1968._bool AS col_4906
		FROM
			defaultdb.public.seed@[0] AS tab_1970, defaultdb.public.seed@[0] AS tab_1971
		WHERE
			EXISTS(
				SELECT
					tab_1970._timestamp AS col_4905
				FROM
					defaultdb.public.seed@[0] AS tab_1972
				ORDER BY
					tab_1972._float4 DESC, tab_1972._float8 DESC, tab_1972._interval
				LIMIT
					89:::INT8
			)
		ORDER BY
			tab_1970._bytes, tab_1970._float8 DESC
		LIMIT
			1:::INT8
	)
		AS col_4907,
	tab_1969._float4 AS col_4908,
	'-2000-01-01 00:00:00+00:00':::TIMESTAMP AS col_4909,
	(-15904):::INT8 AS col_4910,
	tab_1968._bytes AS col_4911,
	tab_1969._float8 AS col_4912,
	NULL AS col_4913,
	NULL AS col_4914,
	'\x225e0c':::BYTES AS col_4915,
	'1975-08-21':::DATE AS col_4916,
	tab_1968._int4 AS col_4917,
	tab_1968._float4 AS col_4918,
	tab_1968._date AS col_4919,
	tab_1968._timestamptz AS col_4920,
	(-5495):::INT8 AS col_4921
FROM
	defaultdb.public.seed@[0] AS tab_1968
	JOIN defaultdb.public.seed@[0] AS tab_1969 ON (tab_1968._float4) = (tab_1969._float8)
ORDER BY
	tab_1969._uuid DESC;

SELECT
	NULL AS col_4939, tab_1976._inet AS col_4940, tab_1976._date AS col_4941
FROM
	defaultdb.public.seed@[0] AS tab_1976
ORDER BY
	tab_1976._inet DESC, tab_1976._bytes DESC, tab_1976._decimal DESC
LIMIT
	43:::INT8;

UPDATE
	defaultdb.public.seed AS tab_1977
SET
	_int8 = tab_1977._int4
WHERE
	false
ORDER BY
	tab_1977._int8 ASC, tab_1977._string ASC
LIMIT
	35:::INT8;

WITH
	with_705 (col_4947)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY['01:14:12.343307':::TIME,'00:30:43.231673':::TIME,'21:57:13.582772':::TIME]),
						(
							(ARRAY['14:17:18.231305':::TIME,'18:13:14.343841':::TIME,'14:52:05.053287':::TIME,'23:59:59.999999':::TIME]::TIME[] || '21:52:43.741848':::TIME::TIME)::TIME[]
						),
						(NULL),
						(ARRAY['18:14:15.455452':::TIME,'13:52:57.159247':::TIME]),
						(
							(
								WITH
									with_703 (col_4942, col_4943)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(
															NULL,
															ARRAY[1575933833:::OID,3139873118:::OID,977483514:::OID,2188187514:::OID]
														),
														(
															gen_random_uuid()::UUID,
															ARRAY[2819817761:::OID,576864465:::OID,3449430400:::OID,3695707498:::OID,3226223453:::OID,1021864615:::OID,3650591690:::OID]
														),
														(
															'4983907b-534f-41c8-8cac-87085a207daf':::UUID,
															ARRAY[2713783420:::OID,1139677051:::OID,0:::OID]
														),
														('1c9ebd91-9ff2-48a8-9614-560c239223f0':::UUID, NULL),
														(
															'd70eda51-067a-4349-b4f0-2d5220a8fecd':::UUID,
															ARRAY[851021971:::OID,1635236860:::OID,4137366632:::OID,3722961989:::OID]
														),
														(
															NULL,
															ARRAY[1451016663:::OID,2902129775:::OID,3830022778:::OID,1698046944:::OID,0:::OID,3543792245:::OID,1866774324:::OID,2319735653:::OID]
														)
												)
													AS tab_1978 (col_4942, col_4943)
										),
									with_704 (col_4944, col_4945)
										AS (
											SELECT
												*
											FROM
												(VALUES (NULL, B'0000010101011111001111010110'))
													AS tab_1979 (col_4944, col_4945)
										)
								SELECT
									ARRAY['22:55:22.737056':::TIME,'19:32:20.563427':::TIME] AS col_4946
								FROM
									with_704 AS cte_ref_221
								ORDER BY
									cte_ref_221.col_4945, cte_ref_221.col_4945 ASC
								LIMIT
									1:::INT8
							)
						),
						(ARRAY['21:17:55.308919':::TIME,'04:38:33.600617':::TIME])
				)
					AS tab_1980 (col_4947)
		)
SELECT
	1355836307:::OID AS col_4948
LIMIT
	41:::INT8;

SELECT
	tab_1981._timestamptz AS col_4949,
	(-661852173):::INT8 AS col_4950,
	tab_1981._timestamp AS col_4951,
	3153246487331454362:::DECIMAL AS col_4952,
	tab_1981._int4 AS col_4953,
	tab_1981._float8 AS col_4954,
	NULL AS col_4955
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1981
ORDER BY
	tab_1981._bool, tab_1981._float8
LIMIT
	36:::INT8;

WITH
	with_706 (col_4956)
		AS (
			SELECT
				*
			FROM
				(VALUES (1699546456:::OID), (2148714450:::OID), (1119293380:::OID), (NULL), (2216457017:::OID))
					AS tab_1982 (col_4956)
		)
SELECT
	tab_1983._float4 AS col_4957, tab_1983._int2 AS col_4958, tab_1983._int2 AS col_4959, tab_1983._int4 AS col_4960
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1983
ORDER BY
	tab_1983._float4;

WITH
	with_707 (col_4961)
		AS (
			SELECT
				*
			FROM
				(VALUES (B'0000000000000000000000000000000000000000000000000000000000000000')) AS tab_1984 (col_4961)
		)
SELECT
	24002:::INT8 AS col_4962,
	'1970-01-09 05:58:35.000489+00:00':::TIMESTAMPTZ AS col_4963,
	tab_1985._float8 AS col_4964,
	(-8655750545.741330863):::DECIMAL AS col_4965
FROM
	defaultdb.public.seed@[0] AS tab_1985;

WITH
	with_708 (col_4966) AS (SELECT * FROM (VALUES (NULL)) AS tab_1986 (col_4966)),
	with_709 (col_4967)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(B'0001000111001100010101'),
						(B'1000011111010111100011'),
						(B'0111111111111111111111111111111111111111111111111111111111111111'),
						(NULL)
				)
					AS tab_1987 (col_4967)
		)
SELECT
	tab_1988._timestamp AS col_4968
FROM
	with_708 AS cte_ref_222, defaultdb.public.seed@[0] AS tab_1988
LIMIT
	78:::INT8;

SELECT
	'\x':::BYTES AS col_4969,
	false AS col_4970,
	(-0.9785104433754661):::FLOAT8 AS col_4971,
	e'pS\\a\x1a%':::STRING AS col_4972,
	tab_1989._int8 AS col_4973,
	tab_1989._int2 AS col_4974
FROM
	defaultdb.public.seed@[0] AS tab_1989
LIMIT
	72:::INT8;

SELECT
	tab_1991._jsonb AS col_4975,
	tab_1991._int8 AS col_4976,
	NULL AS col_4977,
	11375:::INT8 AS col_4978,
	tab_1991._float8 AS col_4979,
	tab_1991._timestamptz AS col_4980,
	tab_1990._interval AS col_4981,
	tab_1990._uuid AS col_4982
FROM
	defaultdb.public.seed@[0] AS tab_1990, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1991
WHERE
	tab_1991._bool
ORDER BY
	tab_1991._interval ASC;

SELECT
	tab_1992._bool AS col_4983, tab_1992._timestamp AS col_4984
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1992
WHERE
	(NOT false)
ORDER BY
	tab_1992._string ASC;

SELECT
	'-52 years -1 mons -737 days -08:38:32.935553':::INTERVAL AS col_4985
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1993, defaultdb.public.seed@[0] AS tab_1994
WHERE
	tab_1994._bool
LIMIT
	51:::INT8;

SELECT tab_1995._float4 AS col_4986 FROM defaultdb.public.seed@[0] AS tab_1995;

SELECT tab_1998._bytes AS col_5003, NULL AS col_5004 FROM defaultdb.public.seed@seed__int8__float8__date_idx AS tab_1998;

UPDATE
	defaultdb.public.seed AS tab_1999
SET
	_int8 = (-7904050037560055416):::INT8, _bool = true
WHERE
	tab_1999._bool
ORDER BY
	tab_1999._uuid DESC, tab_1999._bool ASC, tab_1999._timestamp ASC, tab_1999._interval
LIMIT
	59:::INT8;

SELECT
	tab_2000._jsonb AS col_5005
FROM
	defaultdb.public.seed@[0] AS tab_2000,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2001,
	defaultdb.public.seed AS tab_2002
	JOIN defaultdb.public.seed AS tab_2003 ON (tab_2002._jsonb) = (tab_2003._jsonb);

UPDATE
	defaultdb.public.seed AS tab_2004
SET
	_timestamp = NULL, _inet = tab_2004._inet
WHERE
	true
ORDER BY
	tab_2004._date, tab_2004._interval
LIMIT
	23:::INT8;

SELECT true AS col_5006 LIMIT 33:::INT8;

SELECT (SELECT NULL AS col_5007 FROM defaultdb.public.seed@[0] AS tab_2005 LIMIT 1:::INT8) AS col_5008 LIMIT 36:::INT8;

SELECT 4130554700:::OID AS col_5009;

SELECT
	tab_2007._timestamp AS col_5010,
	e'nL*P=\x1a\x18\x01':::STRING AS col_5011,
	tab_2008._decimal AS col_5012,
	NULL AS col_5013,
	'1970-01-10 22:08:50.000724+00:00':::TIMESTAMPTZ AS col_5014,
	tab_2008._inet AS col_5015,
	tab_2006._float4 AS col_5016,
	tab_2006._interval AS col_5017,
	tab_2006._date AS col_5018,
	'a632db67-325e-4f9b-962c-7d9dc050094b':::UUID AS col_5019,
	now():::TIMESTAMPTZ::TIMESTAMPTZ AS col_5020
FROM
	defaultdb.public.seed@[0] AS tab_2006,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2007,
	defaultdb.public.seed@[0] AS tab_2008
WHERE
	tab_2008._bool
ORDER BY
	tab_2008._string
LIMIT
	55:::INT8;

WITH
	with_713 (col_5032)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'\x14gV\x13yI)':::STRING),
						(NULL),
						(e'(yFG4\\v':::STRING),
						(e'\nZ\x0bH`-\x1aK5':::STRING),
						(e'\x1d^D\x17@K':::STRING)
				)
					AS tab_2012 (col_5032)
		),
	with_714 (col_5033) AS (SELECT * FROM (VALUES (false), (true), (false)) AS tab_2013 (col_5033))
SELECT
	tab_2014._jsonb AS col_5034, tab_2014._int2 AS col_5035, tab_2014._bytes AS col_5036, tab_2014._date AS col_5037
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2014
WHERE
	NULL
ORDER BY
	tab_2014._float8 ASC
LIMIT
	47:::INT8;

SELECT
	tab_2015._decimal AS col_5038,
	tab_2015._inet AS col_5039,
	1.7889013290405273:::FLOAT8 AS col_5040,
	row_to_json(NULL)::JSONB AS col_5041,
	tab_2015._string AS col_5042,
	'8d3e4047-7625-4c37-895a-99f1b5166c9a':::UUID AS col_5043,
	tab_2015._int4 AS col_5044,
	tab_2015._timestamp AS col_5045,
	false AS col_5046,
	(-23811):::INT8 AS col_5047,
	0.6395897780017868:::FLOAT8 AS col_5048,
	NULL AS col_5049,
	3339475341612488776:::INT8 AS col_5050,
	'\x22':::BYTES AS col_5051,
	'50 years 1 mon 539 days 04:36:02.603772':::INTERVAL AS col_5052,
	tab_2015._timestamptz AS col_5053
FROM
	defaultdb.public.seed@[0] AS tab_2015
LIMIT
	46:::INT8;

UPDATE defaultdb.public.seed AS tab_2016 SET _decimal = tab_2016._decimal, _inet = tab_2016._inet WHERE tab_2016._bool;

SELECT e'\x0ej,$,':::STRING AS col_5054;

SELECT
	min(tab_2017._timestamptz::TIMESTAMPTZ)::TIMESTAMPTZ AS col_5055
FROM
	defaultdb.public.seed@[0] AS tab_2017
WHERE
	tab_2017._bool
GROUP BY
	tab_2017._int8, tab_2017._timestamptz, tab_2017._uuid, tab_2017._interval, tab_2017._date
HAVING
	min(tab_2017._bool::BOOL)::BOOL
ORDER BY
	tab_2017._int8, tab_2017._uuid DESC, tab_2017._date;

INSERT
INTO
	defaultdb.public.seed AS tab_2018
WITH
	with_718 (col_5063)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('AZNS':::STRING),
						('Z?1':::STRING),
						('':::STRING),
						(
							(
								WITH
									with_715 (col_5056) AS (SELECT * FROM (VALUES (true)) AS tab_2019 (col_5056)),
									with_717 (col_5059, col_5060, col_5061)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(
															206:::INT8,
															e'[[{"foobar": {}}, [1.4744142185192397, {"foo": {}}, []], {"b": false, "f=k]mlIl\\"O": {}}, {"b": []}, "bar"], {}]':::JSONB,
															e'\'':::STRING
														),
														(
															NULL,
															'[{"Vn#0+n": {}}, {"c": 0.1404740730276216}, {"_T4nNI=C": [true]}, []]':::JSONB,
															'"':::STRING
														),
														(
															(
																WITH
																	with_716 (col_5057)
																		AS (
																			SELECT
																				*
																			FROM
																				(VALUES (NULL)) AS tab_2020 (col_5057)
																		)
																SELECT
																	(-32768):::INT8 AS col_5058
																FROM
																	defaultdb.public.seed@[0] AS tab_2021
																WHERE
																	tab_2021._bool
																LIMIT
																	1:::INT8
															),
															e'{"jBCX%3=<RL": [[{}], [[null, []]], {}, false], "oOU": [{}], "|RoL#n\\\\_s:": []}':::JSONB,
															e'B\x15\x17v8G&#':::STRING
														),
														(
															32249:::INT8,
															e'{"HfK\'z0c:YD": true, "_Pj": [true, [null], true], "a": [true, {}], "bar": {"bar": {}}}':::JSONB,
															NULL
														),
														((-25424):::INT8, 'null':::JSONB, '':::STRING)
												)
													AS tab_2022 (col_5059, col_5060, col_5061)
										)
								SELECT
									e'\x1a\x17':::STRING AS col_5062
								LIMIT
									1:::INT8
							)
						)
				)
					AS tab_2023 (col_5063)
		),
	with_719 (col_5064, col_5065)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL, (-0.3647114932537079):::FLOAT8),
						(3595119006:::OID, (-0.370565801858902):::FLOAT8),
						(1582164417:::OID, (-0.22692660987377167):::FLOAT8),
						(NULL, 0.37689125537872314:::FLOAT8),
						(629625652:::OID, 1.0950183868408203:::FLOAT8),
						(2797532665:::OID, 0.4220739006996155:::FLOAT8)
				)
					AS tab_2024 (col_5064, col_5065)
		)
SELECT
	29268:::INT8 AS col_5066,
	(-137225739):::INT8 AS col_5067,
	951542295491302751:::INT8 AS col_5068,
	0.985120952129364:::FLOAT8 AS col_5069,
	NULL AS col_5070,
	NULL AS col_5071,
	'1970-01-06 09:57:20.000172+00:00':::TIMESTAMP AS col_5072,
	(
		SELECT
			tab_2026._timestamptz AS col_5073
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2025, defaultdb.public.seed@[0] AS tab_2026
		ORDER BY
			tab_2025._interval, tab_2026._date DESC, tab_2026._float4 ASC
		LIMIT
			1:::INT8
	)
		AS col_5074,
	'65 years 8 mons 828 days 07:54:38.126057':::INTERVAL AS col_5075,
	(false OR NULL) AS col_5076,
	ceil(abs(1:::DECIMAL::DECIMAL)::DECIMAL::DECIMAL)::DECIMAL AS col_5077,
	e'\'':::STRING AS col_5078,
	'\x27':::BYTES AS col_5079,
	'b40d657f-cb49-4cd8-acae-8d34913086a7':::UUID AS col_5080,
	'103.129.29.196/13':::INET AS col_5081,
	NULL AS col_5082
LIMIT
	95:::INT8;

SELECT
	'\x0996af13b4':::BYTES AS col_5083,
	tab_2028._float8 AS col_5084,
	(-0.06757484359934812):::FLOAT8 AS col_5085,
	tab_2028._int2 AS col_5086,
	tab_2028._decimal AS col_5087,
	tab_2028._uuid AS col_5088,
	tab_2028._jsonb AS col_5089,
	'1970-01-09 01:02:04.000467+00:00':::TIMESTAMPTZ AS col_5090,
	tab_2028._timestamp AS col_5091,
	'1990-04-25':::DATE AS col_5092,
	tab_2028._string AS col_5093
FROM
	defaultdb.public.seed@[0] AS tab_2028;

SELECT NULL AS col_5094 LIMIT 22:::INT8;

SELECT
	tab_2029._uuid AS col_5095,
	tab_2029._timestamptz AS col_5096,
	(-900844163):::INT8 AS col_5097,
	'{"a": [], "bar": {"c": {"PxsI561<Nd`": {"b": {}}}, "cDB>5o~|V@/0": {}}, "c": [{}, {}, {" A[": [], "foobar": {}}, true], "hP_Dd+#N>": [[]]}':::JSONB
		AS col_5098,
	tab_2029._interval AS col_5099,
	false AS col_5100,
	(-2.038869468783880003E+35):::DECIMAL AS col_5101,
	left('\x4604305ad6e750be93':::BYTES::BYTES, NULL::INT8)::BYTES AS col_5102,
	tab_2029._timestamp AS col_5103
FROM
	defaultdb.public.seed@[0] AS tab_2029
WHERE
	tab_2029._bool;

SELECT
	0.3964235142076993:::FLOAT8 AS col_5104,
	'58 years 3 mons 884 days 12:23:23.353804':::INTERVAL AS col_5105,
	tab_2030._float4 AS col_5106,
	18835:::INT8 AS col_5107,
	'cff1:5d71:26d7:61b4:7680:5013:6926:1617/35':::INET AS col_5108,
	tab_2030._int8 AS col_5109,
	tab_2030._int4 AS col_5110,
	tab_2030._timestamp AS col_5111,
	(tab_2030._string::STRING || e'3b\x1fp0?Ni':::STRING::STRING)::STRING AS col_5112,
	'1982-02-18':::DATE AS col_5113
FROM
	defaultdb.public.seed@[0] AS tab_2030
WHERE
	tab_2030._bool
ORDER BY
	tab_2030._float4
LIMIT
	73:::INT8;

UPDATE defaultdb.public.seed AS tab_2041 SET _interval = tab_2041._interval WHERE tab_2041._bool;

SELECT
	count(*) AS col_5141
FROM
	defaultdb.public.seed@[0] AS tab_2042
WHERE
	tab_2042._bool
GROUP BY
	tab_2042._int8
HAVING
	isnan(1.2099391246512547:::FLOAT8::FLOAT8)::BOOL;

SELECT
	count(*) AS col_5142
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2043
GROUP BY
	tab_2043._jsonb
HAVING
	inet_contains_or_equals('ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET::INET, '0.0.0.0/0':::INET::INET)::BOOL;

SELECT
	tab_2044._interval AS col_5143,
	tab_2044._float4 AS col_5144,
	8118493569294.595146:::DECIMAL AS col_5145,
	(false AND tab_2045._bool) AS col_5146,
	tab_2045._uuid AS col_5147,
	tab_2044._jsonb AS col_5148,
	tab_2044._date AS col_5149,
	tab_2044._bytes AS col_5150,
	'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET AS col_5151,
	'1970-01-05 12:00:53.000026+00:00':::TIMESTAMP AS col_5152,
	'164.31.235.0/2':::INET AS col_5153,
	tab_2044._uuid AS col_5154,
	9220259028713238983:::INT8 AS col_5155,
	'\x40f0f29cfc4ed3':::BYTES AS col_5156
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2044, defaultdb.public.seed@[0] AS tab_2045
WHERE
	tab_2045._bool
LIMIT
	61:::INT8;

SELECT
	tab_2047._date AS col_5157
FROM
	defaultdb.public.seed AS tab_2046
	JOIN defaultdb.public.seed AS tab_2047 ON
			(tab_2046._int8) = (tab_2047._int8) AND (tab_2046._float8) = (tab_2047._float8)
ORDER BY
	tab_2047._date ASC
LIMIT
	92:::INT8;

SELECT
	NULL AS col_5158,
	tab_2048._timestamptz AS col_5159,
	tab_2048._float8 AS col_5160,
	tab_2048._date AS col_5161,
	'\x58ac2aaa':::BYTES AS col_5162,
	(-17052):::INT8 AS col_5163,
	tab_2048._inet AS col_5164,
	'<T':::STRING AS col_5165,
	(-9223372036854775807):::INT8 AS col_5166,
	tab_2048._float4 AS col_5167,
	NULL AS col_5168
FROM
	defaultdb.public.seed@[0] AS tab_2048
ORDER BY
	tab_2048._float8
LIMIT
	72:::INT8;

SELECT
	tab_2049._int4 AS col_5169,
	NULL AS col_5170,
	tab_2049._timestamptz AS col_5171,
	tab_2049._int4 AS col_5172,
	not_ilike_escape(NULL::STRING, e'\x1c\x04':::STRING::STRING, 'E':::STRING::STRING)::BOOL AS col_5173,
	tab_2049._inet AS col_5174,
	tab_2049._timestamp AS col_5175
FROM
	defaultdb.public.seed@[0] AS tab_2049
WHERE
	(tab_2049._bool OR tab_2049._bool)
ORDER BY
	tab_2049._decimal DESC, tab_2049._string ASC, tab_2049._bool
LIMIT
	3:::INT8;

WITH
	with_725 (col_5176) AS (SELECT * FROM (VALUES (B'10000101100'), (B'01001011001')) AS tab_2050 (col_5176)),
	with_726 (col_5177)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(3309722842:::OID),
						(3427916738:::OID),
						(3689330134:::OID),
						(1068542151:::OID),
						(1759628809:::OID),
						(NULL)
				)
					AS tab_2051 (col_5177)
		)
SELECT
	(
		SELECT
			cte_ref_228.col_5177 AS col_5178
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2052
		ORDER BY
			tab_2052._inet DESC
		LIMIT
			1:::INT8
	)
		AS col_5179
FROM
	with_726 AS cte_ref_228
LIMIT
	94:::INT8;

SELECT
	NULL AS col_5180
FROM
	defaultdb.public.seed AS tab_2053
	JOIN defaultdb.public.seed AS tab_2054 ON
			(tab_2053._int8) = (tab_2054._int8)
			AND (tab_2053._float8) = (tab_2054._float8)
			AND (tab_2053._date) = (tab_2054._date)
LIMIT
	38:::INT8;

SELECT
	tab_2055._date AS col_5181, tab_2055._bool AS col_5182
FROM
	defaultdb.public.seed@[0] AS tab_2055
WHERE
	tab_2055._bool;

SELECT
	ret_8 AS col_5183, B'1010' AS col_5184
FROM
	[
		DELETE FROM
			defaultdb.public.seed AS tab_2056
		RETURNING
			B'01010110011110000101001101010101001100101' AS ret_8, NULL AS ret_9
	]
ORDER BY
	ret_8 ASC
LIMIT
	95:::INT8;

WITH
	with_728 (col_5187)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(2285553479:::OID),
						(1557995858:::OID),
						(
							(
								WITH
									with_727 (col_5185)
										AS (
											SELECT
												*
											FROM
												(VALUES (0:::INT8), (1728046295:::INT8), ((-32768):::INT8))
													AS tab_2057 (col_5185)
										)
								SELECT
									1309908716:::OID AS col_5186
								FROM
									with_727 AS cte_ref_229
								LIMIT
									1:::INT8
							)
						)
				)
					AS tab_2058 (col_5187)
		),
	with_729 (col_5188) AS (SELECT * FROM (VALUES (NULL), (B'0000')) AS tab_2059 (col_5188)),
	with_730 (col_5189, col_5190)
		AS (SELECT * FROM (VALUES (0:::OID, (-14639):::INT8)) AS tab_2060 (col_5189, col_5190))
SELECT
	'1970-01-03 22:16:30.000048+00:00':::TIMESTAMP AS col_5192,
	false AS col_5193,
	tab_2061._decimal AS col_5194,
	tab_2061._string AS col_5195,
	'29 years 1 mon 676 days 05:53:30.102763':::INTERVAL AS col_5196,
	tab_2061._inet AS col_5197,
	'\xf552ba125928b7e9ff':::BYTES AS col_5198,
	'5874897-12-31':::DATE AS col_5199,
	tab_2061._int2 AS col_5200,
	7511503571539736744:::INT8 AS col_5201,
	tab_2061._float4 AS col_5202,
	localtimestamp():::TIMESTAMPTZ::TIMESTAMPTZ AS col_5203
FROM
	defaultdb.public.seed@[0] AS tab_2061
WHERE
	EXISTS(SELECT tab_2061._timestamp AS col_5191);

DELETE FROM defaultdb.public.seed AS tab_2062 LIMIT 22:::INT8;

INSERT INTO defaultdb.public.seed AS tab_2063 DEFAULT VALUES;

WITH
	with_731 (col_5204)
		AS (SELECT * FROM (VALUES (NULL), (NULL), (e'\x18k\x06P0\x07s.':::STRING:::NAME)) AS tab_2064 (col_5204)),
	with_732 (col_5205)
		AS (
			SELECT
				*
			FROM
				(VALUES ('0.97.185.95/12':::INET), (NULL), ('f18b:de50:a411:e5f:d96a:ed91:a6b8:59e0/90':::INET))
					AS tab_2065 (col_5205)
		)
SELECT
	NULL AS col_5206
FROM
	defaultdb.public.seed@[0] AS tab_2066
GROUP BY
	tab_2066._int2
HAVING
	max(tab_2066._bool::BOOL)::BOOL
ORDER BY
	tab_2066._int2 ASC;

INSERT
INTO
	defaultdb.public.seed AS tab_2067
WITH
	with_733 (col_5207)
		AS (
			SELECT
				tab_2068._uuid AS col_5207
			FROM
				defaultdb.public.seed@[0] AS tab_2068
				JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2069 ON
						(tab_2068._int8) = (tab_2069._int8) AND (tab_2068._int2) = (tab_2069._int8)
			WHERE
				true
		),
	with_734 (col_5209, col_5210)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(3822569071:::OID, '':::STRING),
						(703354838:::OID, '$P0Q':::STRING),
						(1042485558:::OID, e'\x01,mt':::STRING),
						(1508971:::OID, CASE WHEN false THEN e'\x1dH\x03':::STRING ELSE NULL END),
						(0:::OID, '':::STRING),
						(
							2129132126:::OID,
							(
								SELECT
									tab_2070._string AS col_5208
								FROM
									defaultdb.public.seed@[0] AS tab_2070
								ORDER BY
									tab_2070._int8 ASC, tab_2070._int2
								LIMIT
									1:::INT8
							)
						)
				)
					AS tab_2071 (col_5209, col_5210)
		),
	with_735 (col_5211)
		AS (SELECT * FROM (VALUES ((-276212224):::INT8), (NULL), (1949552401:::INT8)) AS tab_2072 (col_5211))
SELECT
	tab_2073._int4 AS col_5212,
	(-446105242):::INT8 AS col_5213,
	(SELECT tab_2074._int2 AS col_5214 FROM defaultdb.public.seed@[0] AS tab_2074 WHERE false LIMIT 1:::INT8)
		AS col_5215,
	(-0.8836524486541748):::FLOAT8 AS col_5216,
	NULL AS col_5217,
	tab_2073._date AS col_5218,
	'1970-01-11 03:17:47.000869+00:00':::TIMESTAMP AS col_5219,
	tab_2073._timestamptz AS col_5220,
	NULL AS col_5221,
	(not_like_escape(e'\\J\x0e\x17\'$SH\x1c':::STRING::STRING, NULL::STRING, tab_2073._string::STRING)::BOOL OR tab_2073._bool)
		AS col_5222,
	NULL AS col_5223,
	tab_2073._string AS col_5224,
	'\xf710e8':::BYTES AS col_5225,
	tab_2073._uuid AS col_5226,
	tab_2073._inet AS col_5227,
	tab_2073._jsonb AS col_5228
FROM
	defaultdb.public.seed@[0] AS tab_2073
ORDER BY
	tab_2073._inet ASC, tab_2073._interval ASC;

SELECT
	tab_2075._decimal AS col_5229
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2075
WHERE
	tab_2075._bool
ORDER BY
	tab_2075._inet DESC;

SELECT
	count(*) AS col_5230
FROM
	defaultdb.public.seed@[0] AS tab_2076
WHERE
	NULL
GROUP BY
	tab_2076._int8
ORDER BY
	tab_2076._int8 DESC
LIMIT
	12:::INT8;

SELECT
	tab_2080._timestamptz AS col_5249,
	'1991-06-02':::DATE AS col_5250,
	'27 years 9 mons 934 days 12:58:14.446131':::INTERVAL AS col_5251,
	'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET AS col_5252,
	tab_2081._string AS col_5253,
	32413:::INT8 AS col_5254
FROM
	defaultdb.public.seed@[0] AS tab_2080, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2081
LIMIT
	39:::INT8;

SELECT
	tab_2082._uuid AS col_5255,
	'178.156.125.7/0':::INET AS col_5256,
	tab_2082._timestamptz AS col_5257,
	e'\f?':::STRING AS col_5258
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2082
WHERE
	NULL
ORDER BY
	tab_2082._timestamp;

SELECT
	'\x52':::BYTES AS col_5259,
	tab_2086._timestamptz AS col_5260,
	'74.254.18.111/11':::INET AS col_5261,
	tab_2086._string AS col_5262
FROM
	defaultdb.public.seed AS tab_2084
	JOIN defaultdb.public.seed AS tab_2085 ON (tab_2084._jsonb) = (tab_2085._jsonb),
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2086
WHERE
	tab_2086._bool
ORDER BY
	tab_2086._int2 DESC, tab_2086._interval ASC
LIMIT
	31:::INT8;

SELECT
	tab_2089._bytes AS col_5263,
	NULL AS col_5264,
	(-0.9486923095437936):::FLOAT8 AS col_5265,
	NULL AS col_5266,
	NULL AS col_5267,
	0.5570028424263:::FLOAT8 AS col_5268,
	tab_2087._jsonb AS col_5269,
	tab_2089._uuid AS col_5270,
	tab_2089._timestamptz AS col_5271,
	tab_2089._decimal AS col_5272
FROM
	defaultdb.public.seed AS tab_2087
	JOIN defaultdb.public.seed AS tab_2088 ON (tab_2087._jsonb) = (tab_2088._jsonb),
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2089
WHERE
	ilike_escape(e'\\\r3J@Q-':::STRING::STRING, tab_2089._string::STRING, e'\x19\x0bA_6\x172b':::STRING::STRING)::BOOL
ORDER BY
	tab_2089._int2 ASC, tab_2089._decimal DESC;

UPDATE
	defaultdb.public.seed AS tab_2091
SET
	_inet = 'ff82:4485:5528:c03a:d293:8be9:1b5f:95a/123':::INET
WHERE
	7852927686357826320:::INT8::INT8 NOT IN ()
LIMIT
	15:::INT8;

WITH
	with_738 (col_5276)
		AS (
			SELECT
				2834452363:::OID AS col_5276
			FROM
				defaultdb.public.seed@[0] AS tab_2092, defaultdb.public.seed@[0] AS tab_2093
			WHERE
				tab_2092._bool
		)
SELECT
	'Infinity':::DECIMAL AS col_5277,
	tab_2094._int8 AS col_5278,
	0.28212425112724304:::FLOAT8 AS col_5279,
	900428934:::INT8 AS col_5280,
	tab_2094._bytes AS col_5281,
	tab_2094._interval AS col_5282,
	cte_ref_230.col_5276 AS col_5283,
	NULL AS col_5284,
	'/:':::STRING AS col_5285,
	tab_2094._float4 AS col_5286,
	'00000000-0000-0000-0000-000000000000':::UUID AS col_5287,
	tab_2094._jsonb AS col_5288,
	tab_2094._timestamp AS col_5289,
	'1996-11-27':::DATE AS col_5290,
	tab_2094._timestamptz AS col_5291
FROM
	defaultdb.public.seed@[0] AS tab_2094, with_738 AS cte_ref_230
WHERE
	tab_2094._bool
ORDER BY
	tab_2094._string DESC;

SELECT
	'\x1fe3816625':::BYTES AS col_5292,
	tab_2095._float4 AS col_5293,
	tab_2095._decimal AS col_5294,
	tab_2096._float8 AS col_5295,
	tab_2095._bool AS col_5296,
	(e'{"t{jK`#07ua": "bar", "yCq#6E": {"baz": [], "i6|Cs07&6@{": null, "md@\'K^": {}}}':::JSONB::JSONB->>tab_2096._string::STRING)::STRING
		AS col_5297,
	tab_2097._decimal AS col_5298,
	(-1640292909):::INT8 AS col_5299,
	false AS col_5300
FROM
	defaultdb.public.seed@[0] AS tab_2095
	JOIN defaultdb.public.seed@[0] AS tab_2096 ON
			(tab_2095._timestamp) = (tab_2096._timestamp) AND (tab_2095._bytes) = (tab_2096._bytes)
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2097 ON (tab_2095._float4) = (tab_2097._float4);

DELETE FROM defaultdb.public.seed AS tab_2098 LIMIT 4:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2099
SET
	_date = '4714-11-24 BC':::DATE, _inet = tab_2099._inet
WHERE
	false
ORDER BY
	tab_2099._bool DESC
LIMIT
	52:::INT8;

SELECT
	'1970-01-08 01:49:21.000628+00:00':::TIMESTAMPTZ AS col_5301,
	tab_2100._float8 AS col_5302,
	e'{"78\'nqu": [{"baz": null}, 0.4724944728773245], "MvKo``#]d}:\'": "X)K-<Z", "a": 0.9887486120649269}':::JSONB
		AS col_5303
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2100
LIMIT
	18:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2101
SELECT
	(-1):::INT8 AS col_5304,
	NULL AS col_5305,
	tab_2102._int2 AS col_5306,
	tab_2102._float4 AS col_5307,
	tab_2102._float4 AS col_5308,
	tab_2102._date AS col_5309,
	'1970-01-11 03:17:21.000762+00:00':::TIMESTAMP AS col_5310,
	'1970-01-03 22:58:10.000914+00:00':::TIMESTAMPTZ AS col_5311,
	NULL AS col_5312,
	tab_2102._bool AS col_5313,
	7.149830264099638933E+30:::DECIMAL AS col_5314,
	e'\x11\x1d\x06\n\x1b\x17':::STRING AS col_5315,
	tab_2102._bytes AS col_5316,
	'a8e6ebf0-53b6-4a45-bdd2-6f62028f19b8':::UUID AS col_5317,
	tab_2102._inet AS col_5318,
	tab_2102._jsonb AS col_5319
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2102
WHERE
	true
ORDER BY
	tab_2102._int8 DESC, tab_2102._interval DESC, tab_2102._int2 ASC, tab_2102._string ASC, tab_2102._bool ASC;

SELECT
	'6ee7:3a63:27db:376c:7b0c:aeca:e8de:fa6a/72':::INET AS col_5320,
	(-0.4821284463500468):::FLOAT8 AS col_5321,
	'1970-01-11 10:58:26.000785+00:00':::TIMESTAMP AS col_5322,
	'f1edf454-ca9c-4e6b-8780-72a04f8a23ca':::UUID AS col_5323
FROM
	defaultdb.public.seed@[0] AS tab_2103
WHERE
	tab_2103._bool
LIMIT
	23:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2104
SET
	_timestamp = NULL, _int2 = tab_2104._int4
WHERE
	tab_2104._bool
ORDER BY
	tab_2104._bool ASC
LIMIT
	15:::INT8;

SELECT
	concat_agg(tab_2105._string::STRING)::STRING AS col_5324,
	(-3519):::INT8 AS col_5325,
	min(tab_2105._timestamp::TIMESTAMP)::TIMESTAMP AS col_5326,
	min(tab_2105._interval::INTERVAL)::INTERVAL AS col_5327
FROM
	defaultdb.public.seed@[0] AS tab_2105
GROUP BY
	tab_2105._int2, tab_2105._timestamp, tab_2105._interval, tab_2105._string
ORDER BY
	tab_2105._timestamp DESC
LIMIT
	55:::INT8;

SELECT
	1.4833791669554603:::FLOAT8 AS col_5328,
	tab_2106._string AS col_5329,
	tab_2106._interval AS col_5330,
	tab_2106._int2 AS col_5331,
	tab_2106._date AS col_5332,
	tab_2106._int2 AS col_5333,
	'1970-01-12 08:33:26.000525+00:00':::TIMESTAMPTZ AS col_5334
FROM
	defaultdb.public.seed@[0] AS tab_2106
LIMIT
	98:::INT8;

SELECT
	tab_2108._int2 AS col_5335,
	0.8129220870118544735:::DECIMAL AS col_5336,
	tab_2108._bytes AS col_5337,
	tab_2109._float4 AS col_5338,
	(-0.3529090736929624):::FLOAT8 AS col_5339,
	tab_2107._timestamp AS col_5340
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2107
	JOIN defaultdb.public.seed@[0] AS tab_2108 ON
			(tab_2107._decimal) = (tab_2108._decimal) AND (tab_2107._int8) = (tab_2108._int4),
	defaultdb.public.seed@[0] AS tab_2109
WHERE
	true
ORDER BY
	tab_2109._decimal DESC, tab_2108._float8 ASC;

UPDATE
	defaultdb.public.seed AS tab_2110
SET
	_interval = tab_2110._interval, _bool = tab_2110._bool
WHERE
	(false OR tab_2110._bool)
ORDER BY
	tab_2110._bytes DESC, tab_2110._timestamptz DESC
LIMIT
	95:::INT8;

SELECT
	tab_2113._float4 AS col_5341, tab_2113._inet AS col_5342, tab_2113._string AS col_5343
FROM
	defaultdb.public.seed AS tab_2111
	JOIN defaultdb.public.seed AS tab_2112 ON (tab_2111._jsonb) = (tab_2112._jsonb)
	LEFT JOIN defaultdb.public.seed@[0] AS tab_2113 ON false
LIMIT
	73:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2114
SET
	_int8 = tab_2114._int4
WHERE
	tab_2114._bool
ORDER BY
	tab_2114._decimal ASC, tab_2114._int8, tab_2114._string DESC
LIMIT
	42:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2115 (_int2, _int4, _int8, _float4, _bool, _bytes, _uuid)
WITH
	with_739 (col_5344)
		AS (SELECT * FROM (VALUES ('1970-01-03 05:45:40.000195+00:00':::TIMESTAMP), (NULL)) AS tab_2116 (col_5344))
SELECT
	NULL AS col_5345,
	(-901356345):::INT8 AS col_5346,
	NULL AS col_5347,
	NULL AS col_5348,
	false AS col_5349,
	'\xe2028e1711fdf9':::BYTES AS col_5350,
	'00000000-0000-0000-0000-000000000000':::UUID AS col_5351
FROM
	with_739 AS cte_ref_231
LIMIT
	71:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2117
SET
	_string = tab_2117._string, _uuid = tab_2117._uuid
WHERE
	tab_2117._bool
LIMIT
	60:::INT8;

WITH
	with_740 (col_5352) AS (SELECT * FROM (VALUES ('10:00:06.30844-07:55:00':::TIMETZ)) AS tab_2118 (col_5352))
SELECT
	'zE!':::STRING AS col_5353;

INSERT
INTO
	defaultdb.public.seed AS tab_2119
SELECT
	tab_2120._int8 AS col_5354,
	tab_2120._int8 AS col_5355,
	tab_2120._int8 AS col_5356,
	tab_2120._float4 AS col_5357,
	NULL AS col_5358,
	NULL AS col_5359,
	tab_2120._timestamp AS col_5360,
	tab_2120._timestamptz AS col_5361,
	'23 years 5 mons 92 days 03:42:37.526688':::INTERVAL AS col_5362,
	true AS col_5363,
	(-529560.8078014762689):::DECIMAL AS col_5364,
	e'm*hD0\x13<|':::STRING AS col_5365,
	'\xff':::BYTES AS col_5366,
	tab_2120._uuid AS col_5367,
	'6893:e1bc:948e:cd08:d621:994f:7f9d:40e1/51':::INET AS col_5368,
	tab_2120._jsonb AS col_5369
FROM
	defaultdb.public.seed@[0] AS tab_2120;

INSERT
INTO
	defaultdb.public.seed AS tab_2121
WITH
	with_741 (col_5370)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1465075216:::OID),
						(4117462522:::OID),
						(2743589947:::OID),
						(523246728:::OID),
						(NULL),
						(1574018729:::OID)
				)
					AS tab_2122 (col_5370)
		)
SELECT
	tab_2123._int4 AS col_5371,
	tab_2123._int8 AS col_5372,
	tab_2123._int8 AS col_5373,
	0.35242292284965515:::FLOAT8 AS col_5374,
	(-0.9914964998044296):::FLOAT8 AS col_5375,
	'1994-02-09':::DATE AS col_5376,
	'1970-01-07 20:29:34.000262+00:00':::TIMESTAMP AS col_5377,
	tab_2123._timestamptz AS col_5378,
	tab_2123._interval AS col_5379,
	false AS col_5380,
	(-70508545718.15948599):::DECIMAL AS col_5381,
	tab_2123._string AS col_5382,
	tab_2123._bytes AS col_5383,
	tab_2123._uuid AS col_5384,
	'129.32.149.155/8':::INET AS col_5385,
	(NULL::JSONB - tab_2123._int8::INT8)::JSONB AS col_5386
FROM
	defaultdb.public.seed@[0] AS tab_2123
WHERE
	tab_2123._bool
LIMIT
	50:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2124
SET
	_bytes = tab_2124._bytes, _timestamp = statement_timestamp():::TIMESTAMP::TIMESTAMP
ORDER BY
	tab_2124._bytes ASC, tab_2124._timestamp ASC, tab_2124._timestamp
LIMIT
	99:::INT8;

WITH
	with_742 (col_5388, col_5389)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('48.150.117.222/7':::INET, '1970-01-11 03:29:58.000467+00:00':::TIMESTAMP),
						('47a8:47ae:bc5c:5696:546f:c17c:d69d:d5e3/88':::INET, '0001-01-01 00:00:00+00:00':::TIMESTAMP),
						(
							'101.238.165.189/11':::INET,
							('00:00:00':::TIME::TIME + (SELECT '1978-06-20':::DATE AS col_5387 FROM defaultdb.public.seed@[0] AS tab_2125, defaultdb.public.seed AS tab_2126 JOIN defaultdb.public.seed AS tab_2127 ON (tab_2126._jsonb) = (tab_2127._jsonb) LIMIT 1:::INT8)::DATE)::TIMESTAMP
						),
						('7269:6e19:28a5:1b4c:c1f5:2b22:9478:1d30/115':::INET, NULL),
						(
							'86fe:fdd4:63a5:3567:969a:2b76:e6d1:e779/29':::INET,
							'1970-01-06 20:04:17.000826+00:00':::TIMESTAMP
						)
				)
					AS tab_2128 (col_5388, col_5389)
		)
SELECT
	'1970-01-05 22:37:09.00093+00:00':::TIMESTAMP AS col_5390, cte_ref_232.col_5388 AS col_5391
FROM
	with_742 AS cte_ref_232;

WITH
	with_743 (col_5392)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'J e|gR\ff':::STRING),
						(e'\'':::STRING),
						(e'\x03z\x14kb?"':::STRING),
						(e'\x06UV^S.\x14':::STRING)
				)
					AS tab_2129 (col_5392)
		),
	with_744 (col_5393)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[1:::INT8,(-17219):::INT8]),
						(ARRAY[21171:::INT8,(-128):::INT8,18045:::INT8,4161:::INT8,(-32574):::INT8]),
						(NULL),
						(ARRAY[(-23355):::INT8,(-5506):::INT8])
				)
					AS tab_2130 (col_5393)
		),
	with_745 (col_5394)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1.0:::FLOAT8),
						((-0.02253708243370056):::FLOAT8),
						((-0.5450215935707092):::FLOAT8),
						((-0.18849703669548035):::FLOAT8),
						(3.4028234663852886e+38:::FLOAT8)
				)
					AS tab_2131 (col_5394)
		)
SELECT
	ARRAY[1409:::INT8,23799:::INT8,16740:::INT8] AS col_5395
FROM
	with_744 AS cte_ref_233;

WITH
	with_746 (col_5396)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[17670:::INT8,(-20790):::INT8]),
						(ARRAY[(-20636):::INT8,31912:::INT8,12981:::INT8]),
						(ARRAY[12409:::INT8,(-3502):::INT8]),
						(ARRAY[16641:::INT8]),
						(ARRAY[6015:::INT8,(-1):::INT8,16362:::INT8]),
						(ARRAY[(-12779):::INT8,(-29228):::INT8])
				)
					AS tab_2132 (col_5396)
		),
	with_747 (col_5397)
		AS (
			SELECT
				ARRAY[1773974035:::OID,739529904:::OID] AS col_5397
			FROM
				defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2133
				FULL JOIN defaultdb.public.seed@[0] AS tab_2134 ON true
		)
SELECT
	NULL AS col_5398,
	(-3969657.291345085553):::DECIMAL AS col_5399,
	ARRAY[3929036455:::OID] AS col_5400,
	tab_2135._int8 AS col_5401,
	tab_2135._timestamp AS col_5402
FROM
	with_747 AS cte_ref_234, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2135
ORDER BY
	tab_2135._float4 DESC
LIMIT
	46:::INT8;

SELECT NULL AS col_5403;

WITH
	with_748 (col_5404) AS (SELECT * FROM (VALUES ('18:47:10.161275':::TIME), (NULL)) AS tab_2136 (col_5404)),
	with_749 (col_5405)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							timezone('':::STRING::STRING, '1970-01-02 05:30:51.000842+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::TIMESTAMP
						),
						(
							('1970-01-01':::DATE::DATE + '-57 years -3 mons -922 days -16:30:28.081216':::INTERVAL::INTERVAL)::TIMESTAMP
						)
				)
					AS tab_2137 (col_5405)
		),
	with_750 (col_5406) AS (SELECT * FROM (VALUES (3171729032:::OID)) AS tab_2138 (col_5406))
SELECT
	e'E\'y3':::STRING AS col_5407,
	tab_2139._int4 AS col_5408,
	tab_2139._interval AS col_5409,
	tab_2139._jsonb AS col_5410,
	tab_2139._float8 AS col_5411,
	'\xa6f20f600a3b6d':::BYTES AS col_5412,
	tab_2139._timestamptz AS col_5413
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2139
WHERE
	false;

WITH
	with_751 (col_5414)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('77ac1b46-f2f3-4534-9ed9-b5d4d88aad66':::UUID),
						(gen_random_uuid()::UUID),
						('23b064bb-a8a5-4ef8-9d9a-fb8fc56ba1f7':::UUID),
						('9a7e82bf-b7cf-45c0-b4f9-9b7660772907':::UUID)
				)
					AS tab_2140 (col_5414)
		),
	with_752 (col_5415)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'd\x19':::STRING),
						(e'9UZ\x16R':::STRING),
						(e'\n':::STRING),
						(e'\\\f\x1d\x7f\x065NS':::STRING),
						(NULL),
						('3M!a}':::STRING)
				)
					AS tab_2141 (col_5415)
		)
SELECT
	(-1.3152519464492798):::FLOAT8 AS col_5416;

WITH
	with_753 (col_5417)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-1996741472):::INT8),
						(1732547004:::INT8),
						(1052903927:::INT8),
						((-381755098):::INT8),
						(1206466159:::INT8)
				)
					AS tab_2142 (col_5417)
		)
SELECT
	cte_ref_235.col_5417 AS col_5418
FROM
	with_753 AS cte_ref_235
WHERE
	NULL
LIMIT
	81:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2143
SELECT
	(-18119):::INT8 AS col_5419,
	tab_2144._int2 AS col_5420,
	tab_2144._int8 AS col_5421,
	NULL AS col_5422,
	tab_2144._float4 AS col_5423,
	tab_2144._date AS col_5424,
	tab_2144._timestamp AS col_5425,
	tab_2144._timestamptz AS col_5426,
	'-16 years -6 mons -187 days -24:48:53.936369':::INTERVAL AS col_5427,
	tab_2144._bool AS col_5428,
	tab_2144._decimal AS col_5429,
	NULL AS col_5430,
	'\xc12601cb0f':::BYTES AS col_5431,
	NULL AS col_5432,
	('8807:b98e:f136:a4a8:b60d:70f3:1cb4:a527/39':::INET::INET + 2980196917108854056:::INT8::INT8)::INET AS col_5433,
	tab_2144._jsonb AS col_5434
FROM
	defaultdb.public.seed@[0] AS tab_2144
WHERE
	tab_2144._bool
LIMIT
	49:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2145
SET
	_string = tab_2145._string, _date = tab_2145._date
WHERE
	false
ORDER BY
	tab_2145._string DESC, tab_2145._timestamptz DESC
LIMIT
	86:::INT8;

SELECT
	tab_2146._timestamp AS col_5435,
	tab_2146._string AS col_5436,
	1:::INT8 AS col_5437,
	(tab_2146._bool AND tab_2146._bool) AS col_5438,
	'-59 years -2 mons -148 days -15:21:26.524137':::INTERVAL AS col_5439,
	tab_2146._bytes AS col_5440,
	tab_2146._date AS col_5441,
	tab_2146._int8 AS col_5442,
	(-3547678157196652901):::INT8 AS col_5443
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2146
ORDER BY
	tab_2146._bytes DESC
LIMIT
	35:::INT8;

SELECT
	tab_2147._inet AS col_5444, tab_2147._timestamp AS col_5445, true AS col_5446, tab_2147._bytes AS col_5447
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2147
LIMIT
	61:::INT8;

WITH
	with_754 (col_5448)
		AS (
			SELECT
				*
			FROM
				(VALUES (1534157794:::OID), (COALESCE(1900069708:::OID, 2650354798:::OID))) AS tab_2148 (col_5448)
		),
	with_755 (col_5449)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), (99043668:::OID), (2659938964:::OID), (707219467:::OID), (2893146421:::OID))
					AS tab_2149 (col_5449)
			UNION SELECT 3748770419:::OID AS col_5450 FROM defaultdb.public.seed@[0] AS tab_2150 WHERE true
		),
	with_756 (col_5451)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'\x0b\x1f\x10F':::STRING),
						(NULL),
						(COALESCE(e'\x10z':::STRING, e'\x05?':::STRING)),
						('':::STRING),
						(COALESCE(e'w$:\x0f\x14':::STRING, e'\'':::STRING)),
						('"v':::STRING)
				)
					AS tab_2151 (col_5451)
		)
SELECT
	126304788:::OID AS col_5452
LIMIT
	74:::INT8;

SELECT
	tab_2152._decimal AS col_5453,
	e'{"IMmCU#\\"rj~I\\\\": [], "foo": [0.9107850911841697], "foobar": [{"foobar": []}]}':::JSONB AS col_5454,
	tab_2152._float4 AS col_5455,
	tab_2152._int4 AS col_5456,
	tab_2152._timestamp AS col_5457,
	tab_2152._timestamptz AS col_5458
FROM
	defaultdb.public.seed@[0] AS tab_2152,
	defaultdb.public.seed AS tab_2153
	JOIN defaultdb.public.seed AS tab_2154 ON (tab_2153._jsonb) = (tab_2154._jsonb)
WHERE
	false;

UPDATE
	defaultdb.public.seed AS tab_2155
SET
	_uuid = 'fdb4573c-b5de-4917-8e0c-37fae59aa1da':::UUID,
	_int4 = 1260037970:::INT8,
	_decimal = tab_2155._decimal,
	_date = '1981-04-02':::DATE,
	_interval = (NULL::INTERVAL + tab_2155._interval::INTERVAL)::INTERVAL;

UPDATE defaultdb.public.seed AS tab_2156 SET _int8 = tab_2156._int4 LIMIT 78:::INT8;

WITH
	with_759 (col_5462) AS (SELECT * FROM (VALUES (B'001010001100111111000')) AS tab_2159 (col_5462)),
	with_760 (col_5463)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(0.0:::FLOAT8),
						(NULL),
						((-1.1451515819913487):::FLOAT8),
						(NULL),
						(0.5096516091761005:::FLOAT8),
						((-0.8099325337612988):::FLOAT8)
				)
					AS tab_2160 (col_5463)
		)
SELECT
	NULL AS col_5464
LIMIT
	89:::INT8;

SELECT
	netmask(tab_2161._inet::INET)::INET AS col_5465,
	'254f9b08-5f85-4d4d-be2b-321e762e87ad':::UUID AS col_5466,
	tab_2161._decimal AS col_5467,
	tab_2161._int4 AS col_5468,
	(-3177):::INT8 AS col_5469,
	tab_2161._string AS col_5470
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2161
ORDER BY
	tab_2161._inet DESC, tab_2161._timestamptz ASC, tab_2161._date ASC, tab_2161._bytes DESC
LIMIT
	8:::INT8;

SELECT 1549696680:::OID AS col_5471 LIMIT 68:::INT8;

WITH
	with_761 (col_5472)
		AS (
			SELECT
				*
			FROM
				(VALUES ((-9237):::INT8), (1:::INT8), ((-3114):::INT8), (NULL), ((-9952):::INT8), (30740:::INT8))
					AS tab_2162 (col_5472)
		)
SELECT
	2175192768:::OID AS col_5473;

WITH
	with_762 (col_5474)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('':::STRING),
						(e'\'':::STRING),
						(e'g\x05I\x0fWk:':::STRING),
						(('false':::JSONB::JSONB->>e'l\x10j\x12 ':::STRING::STRING)::STRING),
						(e'\'':::STRING),
						('y@OLc':::STRING)
				)
					AS tab_2163 (col_5474)
		),
	with_763 (col_5475) AS (SELECT * FROM (VALUES (0.41487935185432434:::FLOAT8)) AS tab_2164 (col_5475)),
	with_764 (col_5476, col_5477)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((NULL::INT8 % NULL::INT8)::INT8, NULL),
						((-8746632219924693466):::INT8, 302331349:::OID),
						(8206429128241009738:::INT8, 2023663233:::OID),
						((-5097542431188791262):::INT8, 0:::OID),
						(masklen('61.133.112.32/12':::INET::INET)::INT8, NULL),
						((-1):::INT8, 0:::OID)
				)
					AS tab_2165 (col_5476, col_5477)
		)
SELECT
	tab_2166._int4 AS col_5478
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2166
WHERE
	tab_2166._bool
ORDER BY
	tab_2166._bytes ASC, tab_2166._timestamptz ASC
LIMIT
	54:::INT8;

SELECT
	(tab_2167._jsonb::JSONB->>e'!^vw&\x7fg':::STRING::STRING)::STRING AS col_5479
FROM
	defaultdb.public.seed@[0] AS tab_2167
LIMIT
	97:::INT8;

SELECT tab_2169._interval AS col_5480, '15.75.241.162':::INET AS col_5481 FROM defaultdb.public.seed@[0] AS tab_2169;

UPDATE defaultdb.public.seed AS tab_2170 SET _bytes = tab_2170._bytes LIMIT 57:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2171
SELECT
	22995:::INT8 AS col_5482,
	(-156187076):::INT8 AS col_5483,
	(-916580001812118103):::INT8 AS col_5484,
	tab_2172._float4 AS col_5485,
	0.7844150672049168:::FLOAT8 AS col_5486,
	NULL AS col_5487,
	tab_2172._timestamp AS col_5488,
	(NULL::TIMETZ + '1997-03-22':::DATE::DATE)::TIMESTAMPTZ AS col_5489,
	'-14 years -4 mons -409 days -21:55:30.954106':::INTERVAL AS col_5490,
	true AS col_5491,
	tab_2172._decimal AS col_5492,
	tab_2172._string AS col_5493,
	tab_2172._bytes AS col_5494,
	'78676879-78e8-4a9f-9e25-26fbfff2f10b':::UUID AS col_5495,
	'66.145.186.131/10':::INET AS col_5496,
	tab_2172._jsonb AS col_5497
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2172
ORDER BY
	tab_2172._inet ASC
LIMIT
	73:::INT8;

UPDATE defaultdb.public.seed AS tab_2180 SET _float4 = (-0.9296439290046692):::FLOAT8, _bool = false LIMIT 49:::INT8;

WITH
	with_768 (col_5535) AS (SELECT * FROM (VALUES (false), (false), (false)) AS tab_2181 (col_5535)),
	with_769 (col_5536)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1992-12-13':::DATE),
						(NULL),
						('4714-11-24 BC':::DATE),
						('1989-01-24':::DATE),
						('1980-01-23':::DATE),
						(NULL)
				)
					AS tab_2182 (col_5536)
		)
SELECT
	tab_2183._decimal AS col_5537
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2183
WHERE
	NULL
ORDER BY
	tab_2183._bool, tab_2183._int4, tab_2183._inet, tab_2183._inet DESC
LIMIT
	93:::INT8;

WITH
	with_770 (col_5538)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(2566008802:::OID),
						(2428499339:::OID),
						(2094823113:::OID),
						(3531042106:::OID),
						(3736567590:::OID)
				)
					AS tab_2184 (col_5538)
		),
	with_771 (col_5539)
		AS (
			SELECT
				*
			FROM
				(VALUES (e'6\x142':::STRING), ('g':::STRING), (e'h7\x19':::STRING), (e'\'':::STRING), (NULL))
					AS tab_2185 (col_5539)
		)
SELECT
	cte_ref_237.col_5538 AS col_5540
FROM
	with_770 AS cte_ref_237
ORDER BY
	cte_ref_237.col_5538 ASC, cte_ref_237.col_5538 ASC, cte_ref_237.col_5538 DESC
LIMIT
	73:::INT8;

WITH
	with_772 (col_5541)
		AS (SELECT * FROM (VALUES (ARRAY[14573:::INT8,(-6999):::INT8,5833:::INT8])) AS tab_2186 (col_5541))
SELECT
	tab_2187._date AS col_5542,
	(-7320510510976226478):::INT8 AS col_5543,
	tab_2187._bytes AS col_5544,
	'1a4e6854-ae63-4b79-bc38-cca4cb772531':::UUID AS col_5545,
	'22 years 3 mons 40 days 07:51:42.785282':::INTERVAL AS col_5546,
	tab_2187._float4 AS col_5547
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2187
ORDER BY
	tab_2187._timestamptz, tab_2187._timestamptz ASC;

INSERT
INTO
	defaultdb.public.seed AS tab_2188
WITH
	with_773 (col_5548) AS (SELECT * FROM (VALUES (())) AS tab_2189 (col_5548)),
	with_774 (col_5549)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-04 01:11:15.000577+00:00':::TIMESTAMPTZ),
						('1970-01-05 03:41:17.00091+00:00':::TIMESTAMPTZ),
						('1970-01-05 13:48:13.000285+00:00':::TIMESTAMPTZ),
						(NULL)
				)
					AS tab_2190 (col_5549)
		)
SELECT
	NULL AS col_5550,
	2147483647:::INT8 AS col_5551,
	(-2770392347807225436):::INT8 AS col_5552,
	1.2232130765914917:::FLOAT8 AS col_5553,
	div((SELECT NULL AS col_5554 FROM defaultdb.public.seed@[0] AS tab_2191 ORDER BY tab_2191._float8 ASC, tab_2191._interval DESC LIMIT 1:::INT8)::FLOAT8, (-2.1854221670941305):::FLOAT8::FLOAT8)::FLOAT8
		AS col_5555,
	'1973-09-16':::DATE AS col_5556,
	'1970-01-02 11:34:54.000939+00:00':::TIMESTAMP AS col_5557,
	'0001-01-01 00:00:00+00:00':::TIMESTAMPTZ AS col_5558,
	'-1 years -9 mons -816 days -10:18:09.874326':::INTERVAL AS col_5559,
	false AS col_5560,
	NULL AS col_5561,
	'Og':::STRING AS col_5562,
	NULL AS col_5563,
	(
		WITH
			with_775 (col_5564)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(e'\x1e+t_~1\x06_\x13':::STRING),
								(e'\x00':::STRING),
								('X':::STRING),
								(NULL),
								('U|-':::STRING)
						)
							AS tab_2192 (col_5564)
				),
			with_776 (col_5565, col_5566)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(NULL, ARRAY[6239:::INT8,(-22448):::INT8]),
								(NULL, ARRAY[(-15727):::INT8,16111:::INT8]),
								('1970-01-01 19:43:21.000313+00:00':::TIMESTAMPTZ, ARRAY[(-1):::INT8,30949:::INT8]),
								('1970-01-04 18:34:13.000043+00:00':::TIMESTAMPTZ, ARRAY[(-15083):::INT8,19333:::INT8]),
								('1970-01-07 10:15:15.000815+00:00':::TIMESTAMPTZ, NULL)
						)
							AS tab_2193 (col_5565, col_5566)
				)
		SELECT
			'e65bfd82-0328-4ed2-944e-210075c09cf2':::UUID AS col_5567
		FROM
			with_776 AS cte_ref_239
		WHERE
			true
		LIMIT
			1:::INT8
	)
		AS col_5568,
	'160.0.138.77/22':::INET AS col_5569,
	'{"foobar": [{"a": {"G9M)Vhqh": []}, "bar": true}], "voiK": {"PG+[}t": true, "bar": true, "e@f": {}, "w:D": [false]}}':::JSONB
		AS col_5570
FROM
	with_773 AS cte_ref_238
ORDER BY
	cte_ref_238.col_5548 ASC, cte_ref_238.col_5548
LIMIT
	40:::INT8;

SELECT
	not_like_escape(NULL::STRING, tab_2194._string::STRING, '':::STRING::STRING)::BOOL AS col_5571
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2194
ORDER BY
	tab_2194._timestamp, tab_2194._timestamp;

SELECT
	'1974-04-20':::DATE AS col_5572,
	experimental_uuid_v4()::BYTES AS col_5573,
	(-0.8086233735084534):::FLOAT8 AS col_5574,
	NULL AS col_5575,
	(-237215138):::INT8 AS col_5576
FROM
	defaultdb.public.seed@[0] AS tab_2195
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2196 ON (tab_2195._int4) = (tab_2196._int4)
ORDER BY
	tab_2196._bytes DESC, tab_2196._float8 ASC, tab_2196._timestamptz;

UPDATE defaultdb.public.seed AS tab_2197 SET _bool = tab_2197._bool, _inet = tab_2197._inet;

SELECT
	tab_2198._int4 AS col_5577
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2198
WHERE
	NULL
LIMIT
	29:::INT8;

INSERT INTO defaultdb.public.seed AS tab_2205 DEFAULT VALUES;

WITH
	with_779 (col_5591, col_5592)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1195726697:::OID, 8295954672593730749:::INT8),
						(2363432081:::OID, (-8252419115736725997):::INT8),
						(3299942268:::OID, (-967905314790134619):::INT8)
				)
					AS tab_2206 (col_5591, col_5592)
		),
	with_780 (col_5593)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('6 years 11 mons 165 days 24:11:27.613789':::INTERVAL),
						(NULL),
						(NULL),
						('-22 years -2 mons -314 days -13:59:50.221484':::INTERVAL)
				)
					AS tab_2207 (col_5593)
		)
SELECT
	count(*) AS col_5594
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2208
GROUP BY
	tab_2208._int8
ORDER BY
	tab_2208._int8, tab_2208._int8 DESC
LIMIT
	65:::INT8;

INSERT INTO defaultdb.public.seed AS tab_2209 DEFAULT VALUES;

SELECT
	'-18 years -7 mons -810 days -12:45:16.376505':::INTERVAL AS col_5595,
	'335c:1f7d:bc7e:93b2:8d09:af6d:c785:bc16/92':::INET AS col_5596,
	tab_2210._date AS col_5597
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2210
ORDER BY
	tab_2210._int4 DESC, tab_2210._timestamp
LIMIT
	32:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2211
SET
	_bytes = tab_2211._bytes
WHERE
	false
ORDER BY
	tab_2211._uuid
LIMIT
	78:::INT8;

SELECT
	(
		WITH
			with_781 (col_5598)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(2898582283:::OID),
								(0:::OID),
								(3541468302:::OID),
								(2020981393:::OID),
								(826580823:::OID),
								(830814607:::OID)
						)
							AS tab_2213 (col_5598)
				)
		SELECT
			(-1177986101):::INT8 AS col_5599
		FROM
			with_781 AS cte_ref_241, defaultdb.public.seed@[0] AS tab_2214
		WHERE
			false
		LIMIT
			1:::INT8
	)
		AS col_5600,
	tab_2212._timestamptz AS col_5601,
	tab_2212._float8 AS col_5602,
	false AS col_5603,
	'1989-05-07':::DATE AS col_5604,
	tab_2212._int2 AS col_5605,
	NULL AS col_5606,
	tab_2212._bytes AS col_5607,
	NULL AS col_5608,
	NULL AS col_5609
FROM
	defaultdb.public.seed@[0] AS tab_2212
WHERE
	true
ORDER BY
	tab_2212._inet
LIMIT
	53:::INT8;

SELECT
	e'hnq2E\x146\b':::STRING AS col_5610, tab_2215._decimal AS col_5611
FROM
	defaultdb.public.seed@[0] AS tab_2215
ORDER BY
	tab_2215._float8;

SELECT
	tab_2216._date AS col_5612, tab_2216._string AS col_5613
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2216
WHERE
	tab_2216._bool
LIMIT
	63:::INT8;

SELECT
	tab_2217._timestamptz AS col_5614
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2217
LIMIT
	45:::INT8;

WITH
	with_782 (col_5615)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(3222284439:::OID),
						(3529973343:::OID),
						(3843828232:::OID),
						(4097821137:::OID),
						(2704592609:::OID),
						(
							CASE
							WHEN false THEN 0:::OID
							ELSE CASE WHEN false THEN 3837270807:::OID ELSE 3760390582:::OID END
							END
						)
				)
					AS tab_2218 (col_5615)
		)
SELECT
	1362717705:::OID AS col_5616
FROM
	with_782 AS cte_ref_242
WHERE
	(false OR true)
LIMIT
	17:::INT8;

SELECT
	tab_2219._jsonb AS col_5617,
	tab_2219._string AS col_5618,
	tab_2219._bool AS col_5619,
	'9820c55e-1e1f-46d2-9c86-bde81c1df473':::UUID AS col_5620,
	(tab_2219._int2::INT8 * tab_2219._int2::INT8)::INT8 AS col_5621,
	(-0.40188772477645274):::FLOAT8 AS col_5622,
	tab_2219._int2 AS col_5623,
	0:::INT8 AS col_5624,
	(
		WITH
			with_783 (col_5626)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(('10:03:43.050618':::TIME::TIME + '1986-10-16':::DATE::DATE)::TIMESTAMP),
								(
									((SELECT '1975-10-25':::DATE AS col_5625 FROM defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2220, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2221 ORDER BY tab_2221._int2 LIMIT 1:::INT8)::DATE - '75 years 8 mons 753 days 06:57:17.070751':::INTERVAL::INTERVAL)::TIMESTAMP
								),
								('3000-01-01 00:00:00+00:00':::TIMESTAMP),
								('1970-01-07 13:11:18.000859+00:00':::TIMESTAMP),
								(
									timezone(NULL::STRING, '1970-01-05 23:34:27.00081+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::TIMESTAMP
								)
						)
							AS tab_2222 (col_5626)
					UNION ALL
						SELECT
							*
						FROM
							(
								VALUES
									(NULL),
									('1970-01-12 07:43:25.000074+00:00':::TIMESTAMP),
									('1970-01-04 18:35:44.000767+00:00':::TIMESTAMP),
									('1970-01-01 13:34:30.000599+00:00':::TIMESTAMP)
							)
								AS tab_2223 (col_5627)
				),
			with_784 (col_5628, col_5629)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								((-1983817548):::INT8, 'X':::STRING),
								(NULL, e'.8\x16v,':::STRING),
								(913955267:::INT8, e'\x00':::STRING),
								((-258504223):::INT8, e'; z"\x0f':::STRING),
								(1519601010:::INT8, NULL)
						)
							AS tab_2224 (col_5628, col_5629)
					INTERSECT SELECT NULL AS col_5630, 'k':::STRING AS col_5631 FROM with_783 AS cte_ref_243 WHERE false
				),
			with_785 (col_5632) AS (SELECT * FROM (VALUES ('1979-11-21':::DATE)) AS tab_2225 (col_5632))
		SELECT
			'\x9aeb7bbcd4b8cbd1':::BYTES AS col_5633
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2226
			JOIN defaultdb.public.seed@[0] AS tab_2227 ON
					(tab_2226._int4) = (tab_2227._int8) AND (tab_2226._float8) = (tab_2227._float8)
			JOIN defaultdb.public.seed@[0] AS tab_2228 ON true,
			defaultdb.public.seed@[0] AS tab_2229
		WHERE
			true
		ORDER BY
			tab_2228._float4 DESC
		LIMIT
			1:::INT8
	)
		AS col_5634
FROM
	defaultdb.public.seed@[0] AS tab_2219
ORDER BY
	tab_2219._inet
LIMIT
	14:::INT8;

WITH
	with_786 (col_5635) AS (SELECT * FROM (VALUES (NULL)) AS tab_2230 (col_5635))
SELECT
	min(tab_2232._date::DATE)::DATE AS col_5636
FROM
	defaultdb.public.seed AS tab_2231 JOIN defaultdb.public.seed AS tab_2232 ON (tab_2231._int8) = (tab_2232._int8)
WHERE
	NULL
GROUP BY
	tab_2232._date
LIMIT
	87:::INT8;

SELECT
	tab_2233._date AS col_5637,
	'1993-05-29':::DATE AS col_5638,
	'5874897-12-31':::DATE AS col_5639,
	tab_2234._date AS col_5640
FROM
	defaultdb.public.seed AS tab_2233 JOIN defaultdb.public.seed AS tab_2234 ON (tab_2233._int8) = (tab_2234._int8)
WHERE
	false
LIMIT
	18:::INT8;

SELECT
	tab_2235._date AS col_5641,
	tab_2235._int4 AS col_5642,
	(-0.5578036904335022):::FLOAT8 AS col_5643,
	tab_2235._bytes AS col_5644
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2235
ORDER BY
	tab_2235._bytes DESC
LIMIT
	97:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2236
SET
	_float4 = tab_2236._float4, _jsonb = tab_2236._jsonb, _timestamp = tab_2236._timestamp
WHERE
	tab_2236._bool;

SELECT
	count(*) AS col_5645
FROM
	defaultdb.public.seed@[0] AS tab_2237
GROUP BY
	tab_2237._int8, tab_2237._float8
HAVING
	not_ilike_escape(':MK':::STRING::STRING, e'TEY\x1d\x18,':::STRING::STRING, e'\U00002603':::STRING::STRING)::BOOL
ORDER BY
	tab_2237._int8 ASC
LIMIT
	84:::INT8;

SELECT
	NULL AS col_5646,
	crdb_internal.get_zone_config((-5265092238043896262):::INT8::INT8)::BYTES AS col_5647,
	'11 years 3 mons 161 days 11:44:08.970814':::INTERVAL AS col_5648,
	tab_2238._int4 AS col_5649,
	tab_2238._float8 AS col_5650,
	tab_2241._uuid AS col_5651,
	375665620374490914:::INT8 AS col_5652,
	'1982-06-01':::DATE AS col_5653,
	tab_2238._inet AS col_5654,
	0.2074850835964473:::FLOAT8 AS col_5655,
	tab_2241._timestamptz AS col_5656,
	tab_2238._float4 AS col_5657
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2238
	JOIN defaultdb.public.seed AS tab_2239
		JOIN defaultdb.public.seed AS tab_2240 ON (tab_2239._jsonb) = (tab_2240._jsonb) ON
			(tab_2238._jsonb) = (tab_2239._jsonb),
	defaultdb.public.seed@[0] AS tab_2241
WHERE
	tab_2238._bool
ORDER BY
	tab_2238._string ASC, tab_2238._bytes ASC;

SELECT '\xe9beef94':::BYTES AS col_5658 FROM defaultdb.public.seed@[0] AS tab_2242 LIMIT 65:::INT8;

SELECT
	'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET AS col_5674,
	tab_2244._decimal AS col_5675,
	(-5152):::INT8 AS col_5676,
	tab_2244._int2 AS col_5677,
	tab_2244._float8 AS col_5678,
	'\x17':::BYTES AS col_5679,
	tab_2244._float8 AS col_5680
FROM
	defaultdb.public.seed@[0] AS tab_2244
WHERE
	false
LIMIT
	70:::INT8;

WITH
	with_787 (col_5681, col_5682)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(B'01101100110010011000000010111', '55e4a4d1-31ed-455f-9c6d-87a243ed2a9a':::UUID),
						(B'00001010100000100010100110101', 'd9d738a5-4525-47f8-9956-7698bdc479fe':::UUID),
						(B'11000111011100001000010110000', '96699879-c856-424a-b6a6-55b8645d176b':::UUID),
						(B'00111110000110001100100111000', '55edb943-c2b4-4b35-a90a-9d65b3f02f03':::UUID),
						(B'11111100100111011100100011010', 'a73d0780-a91f-4171-ba2c-474a6774c263':::UUID),
						(B'00101011111111101111010010011', '6bc6d66b-cc34-484d-b3c7-9899aae799ce':::UUID)
				)
					AS tab_2245 (col_5681, col_5682)
		)
SELECT
	B'01000101011110001110100101011' AS col_5688, 'ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID AS col_5689
FROM
	with_787 AS cte_ref_244
WHERE
	EXISTS(
		WITH
			with_788 (col_5684)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(B'00011000'),
								(B'10010011'),
								(B'10011110'),
								(
									(
										SELECT
											B'11000010' AS col_5683
										FROM
											defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2246
										WHERE
											NULL
										ORDER BY
											tab_2246._int8 ASC
										LIMIT
											1:::INT8
									)
								)
						)
							AS tab_2247 (col_5684)
				),
			with_789 (col_5685)
				AS (
					SELECT
						*
					FROM
						(VALUES (0.0:::FLOAT8), (1.1734226942062378:::FLOAT8), ((-0.3129955232143402):::FLOAT8))
							AS tab_2248 (col_5685)
				)
		SELECT
			cte_ref_244.col_5681 AS col_5686, 876049468.790981057:::DECIMAL AS col_5687
		FROM
			with_789 AS cte_ref_245
	);

SELECT
	NULL AS col_5690,
	tab_2249._inet AS col_5691,
	tab_2249._int2 AS col_5692,
	tab_2249._float4 AS col_5693,
	tab_2249._uuid AS col_5694,
	'1970-01-08 19:04:06.000466+00:00':::TIMESTAMP AS col_5695
FROM
	defaultdb.public.seed@[0] AS tab_2249
WHERE
	true
ORDER BY
	tab_2249._inet ASC, tab_2249._decimal ASC, tab_2249._uuid ASC, tab_2249._int2 DESC, tab_2249._decimal
LIMIT
	36:::INT8;

WITH
	with_790 (col_5696)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(0.2350344334561691:::FLOAT8),
						(1.585241950647891:::FLOAT8),
						(1.2218318168721263:::FLOAT8),
						(1.7542337097364635:::FLOAT8),
						(0.160951164413356:::FLOAT8),
						(NULL)
				)
					AS tab_2250 (col_5696)
		)
SELECT
	3739931172:::OID AS col_5697
FROM
	[
		UPDATE
			defaultdb.public.seed AS tab_2251
		SET
			_date = 'infinity':::DATE,
			_timestamptz = '3000-01-01 00:00:00+00:00':::TIMESTAMPTZ,
			_inet = 'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET
		WHERE
			tab_2251._bool
		RETURNING
			NULL AS ret_10
	]
ORDER BY
	ret_10 ASC
LIMIT
	7:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2252
SET
	_decimal = ((-17646289.02973429105):::DECIMAL::DECIMAL ^ 6972450180629114689:::INT8::INT8)::DECIMAL
WHERE
	tab_2252._bool;

INSERT
INTO
	defaultdb.public.seed AS tab_2253
WITH
	with_791 (col_5698)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('202.97.136.169/22':::INET),
						('549d:8f4f:2df:e348:4d4:9a5b:be13:4e00/47':::INET),
						('9eff:da67:f9e7:f0d5:7c12:fd9f:ebd2:8b29/95':::INET),
						('37.193.111.63/30':::INET)
				)
					AS tab_2254 (col_5698)
			EXCEPT ALL
				SELECT
					*
				FROM
					(
						VALUES
							('3.4.218.26/21':::INET),
							('0.0.0.0/0':::INET),
							('4a0b:744e:564a:709d:c0a9:a3b7:74c9:90b2/72':::INET),
							(broadcast('135.211.133.211/2':::INET::INET)::INET),
							('107.140.229.34/6':::INET),
							(broadcast('cee4:2c88:e94b:514c:8a4e:77f9:5845:28c4/78':::INET::INET)::INET)
					)
						AS tab_2255 (col_5699)
		)
SELECT
	tab_2256._int4 AS col_5700,
	tab_2256._int8 AS col_5701,
	tab_2256._int4 AS col_5702,
	tab_2256._float4 AS col_5703,
	ln(tab_2256._float4::FLOAT8)::FLOAT8 AS col_5704,
	tab_2256._date AS col_5705,
	tab_2256._timestamp AS col_5706,
	tab_2256._timestamptz AS col_5707,
	tab_2256._interval AS col_5708,
	tab_2256._bool AS col_5709,
	tab_2256._decimal AS col_5710,
	e'\x072\x12':::STRING AS col_5711,
	tab_2256._bytes AS col_5712,
	tab_2256._uuid AS col_5713,
	tab_2256._inet AS col_5714,
	tab_2256._jsonb AS col_5715
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2256
WHERE
	false
ORDER BY
	tab_2256._bytes, tab_2256._decimal
LIMIT
	87:::INT8;

SELECT '':::STRING AS col_5716 LIMIT 23:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2257 (_int2, _float4, _float8, _timestamp, _timestamptz, _string, _bytes, _jsonb)
WITH
	with_792 (col_5717) AS (SELECT * FROM (VALUES ('\x5b3c':::BYTES)) AS tab_2258 (col_5717))
SELECT
	(-10757):::INT8 AS col_5718,
	0.13661505281925201:::FLOAT8 AS col_5719,
	(-1.3781464492228985):::FLOAT8 AS col_5720,
	now():::TIMESTAMP::TIMESTAMP AS col_5721,
	'1970-01-11 04:55:32.000448+00:00':::TIMESTAMPTZ AS col_5722,
	e'dC mOa\x01':::STRING AS col_5723,
	cte_ref_246.col_5717 AS col_5724,
	json_build_array(cte_ref_246.col_5717)::JSONB AS col_5725
FROM
	with_792 AS cte_ref_246
ORDER BY
	cte_ref_246.col_5717 ASC, cte_ref_246.col_5717 ASC
LIMIT
	13:::INT8;

SELECT
	min(tab_2259._uuid::UUID)::UUID AS col_5726
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2259
WHERE
	tab_2259._bool
GROUP BY
	tab_2259._uuid;

UPDATE
	defaultdb.public.seed AS tab_2260
SET
	_int4 = (-716961036):::INT8
WHERE
	tab_2260._string
	NOT LIKE experimental_strftime(tab_2260._date::DATE, (tab_2260._jsonb::JSONB->>tab_2260._int4::INT8)::STRING::STRING)::STRING;

SELECT
	NULL AS col_5727,
	'c3aabee0-afe5-4f3c-892a-7d42825b1a59':::UUID AS col_5728,
	'233.119.113.81/0':::INET AS col_5729,
	tab_2261._string AS col_5730,
	tab_2261._int2 AS col_5731,
	tab_2261._int8 AS col_5732,
	tab_2261._bool AS col_5733,
	NULL AS col_5734,
	(-0.35659362880236567):::FLOAT8 AS col_5735,
	uuid_v4()::BYTES AS col_5736,
	tab_2261._date AS col_5737,
	tab_2261._decimal AS col_5738,
	NULL AS col_5739,
	'{"a": {"c": {}}, "bar": {"EsUF{2APtd_": true, "P,p-{1I,TI": {}, "a": {"<[Kg8*=": [[{}]]}, "b": {"=H_[iJ{L@n": [], "a": []}, "foo": []}, "c": {}}':::JSONB
		AS col_5740,
	tab_2261._int4 AS col_5741,
	tab_2261._interval AS col_5742
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2261
ORDER BY
	tab_2261._float8;

SELECT 'adcf50b6-7ea0-4a3c-8080-7da8e816790b':::UUID AS col_5743 LIMIT 90:::INT8;

WITH
	with_793 (col_5760)
		AS (
			SELECT
				*
			FROM
				(VALUES ('1991-11-10':::DATE), ('infinity':::DATE), (NULL), (NULL), (NULL)) AS tab_2264 (col_5760)
		),
	with_794 (col_5761) AS (SELECT * FROM (VALUES ('-Inf':::FLOAT8)) AS tab_2265 (col_5761))
SELECT
	tab_2266._decimal AS col_5762, tab_2266._int4 AS col_5763, tab_2266._bool AS col_5764, tab_2266._string AS col_5765
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2266
LIMIT
	36:::INT8;

SELECT
	tab_2267._bytes AS col_5766,
	tab_2267._decimal AS col_5767,
	tab_2267._bool AS col_5768,
	tab_2267._int4 AS col_5769,
	tab_2267._interval AS col_5770,
	tab_2267._int8 AS col_5771,
	tab_2267._timestamptz AS col_5772,
	'1972-03-12':::DATE AS col_5773
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2267;

SELECT
	string_agg(tab_2268._bytes::BYTES, tab_2268._bytes::BYTES)::BYTES AS col_5774
FROM
	defaultdb.public.seed@[0] AS tab_2268
WHERE
	true
GROUP BY
	tab_2268._bytes
HAVING
	bool_and(tab_2268._bool::BOOL)::BOOL
ORDER BY
	tab_2268._bytes DESC, tab_2268._bytes, tab_2268._bytes ASC, tab_2268._bytes, tab_2268._bytes ASC
LIMIT
	36:::INT8;

SELECT
	(-390082334463540994):::INT8 AS col_5775,
	NULL AS col_5776,
	tab_2269._date AS col_5777,
	tab_2269._inet AS col_5778,
	e']z\rPb\x13B':::STRING AS col_5779,
	'-76 years -6 mons -557 days -04:40:09.04043':::INTERVAL AS col_5780,
	tab_2269._bytes AS col_5781
FROM
	defaultdb.public.seed@[0] AS tab_2269
ORDER BY
	tab_2269._float4 DESC, tab_2269._int8 DESC
LIMIT
	14:::INT8;

WITH
	with_795 (col_5782)
		AS (
			SELECT
				*
			FROM
				(VALUES ((-7930836209973885919):::INT8), (NULL), ((-1297890613525187832):::INT8)) AS tab_2270 (col_5782)
		),
	with_796 (col_5783)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('115.166.208.67/30':::INET),
						(NULL),
						('5e0f:1804:89c6:8719:d23f:a7c2:c6fb:1c11/4':::INET),
						(
							((-4912150316228391147):::INT8::INT8 + 'a8ea:308a:ad96:ed5:6072:a085:72a1:34bc/40':::INET::INET)::INET
						)
				)
					AS tab_2271 (col_5783)
		)
SELECT
	'128.76.111.47/20':::INET AS col_5784
FROM
	with_796 AS cte_ref_247
LIMIT
	20:::INT8;

SELECT
	(-6152932168780370101):::INT8 AS col_5787
FROM
	defaultdb.public.seed@[0] AS tab_2272
WHERE
	EXISTS(
		WITH
			with_797 (col_5785)
				AS (
					SELECT
						*
					FROM
						(VALUES (743302411:::OID), (2010720016:::OID), (2653403251:::OID), (NULL), (1966604956:::OID))
							AS tab_2273 (col_5785)
				)
		SELECT
			'1970-01-03 11:37:29.000635+00:00':::TIMESTAMPTZ AS col_5786
		FROM
			with_797 AS cte_ref_248, with_797 AS cte_ref_249
		ORDER BY
			cte_ref_248.col_5785 DESC, cte_ref_248.col_5785, cte_ref_249.col_5785 DESC
		LIMIT
			94:::INT8
	)
ORDER BY
	tab_2272._date, tab_2272._uuid;

WITH
	with_798 (col_5788)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), (e'+0\x06\x1f\x01A44':::STRING), ('':::STRING), ('':::STRING)) AS tab_2274 (col_5788)
		)
SELECT
	cte_ref_250.col_5788 AS col_5789
FROM
	with_798 AS cte_ref_250
WHERE
	NULL;

UPDATE
	defaultdb.public.seed AS tab_2275
SET
	_bool = tab_2275._bool
WHERE
	(-37347.21445124218239):::DECIMAL::DECIMAL IN ()
ORDER BY
	tab_2275._uuid, tab_2275._decimal ASC, tab_2275._int2 DESC
LIMIT
	15:::INT8;

SELECT
	(SELECT e'>a;>\x04YgC,':::STRING AS col_5790 LIMIT 1:::INT8) AS col_5791,
	tab_2276._int4 AS col_5792,
	CASE WHEN false THEN tab_2276._float4 ELSE tab_2276._float8 END AS col_5793,
	tab_2276._jsonb AS col_5794
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2276,
	defaultdb.public.seed AS tab_2277
	JOIN defaultdb.public.seed AS tab_2278 ON (tab_2277._jsonb) = (tab_2278._jsonb)
LIMIT
	55:::INT8;

SELECT
	(-3377848622219517225):::INT8 AS col_5795, tab_2279._int4 AS col_5796
FROM
	defaultdb.public.seed@[0] AS tab_2279
ORDER BY
	tab_2279._date
LIMIT
	76:::INT8;

SELECT
	count(*) AS col_5797
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2280
WHERE
	NULL
GROUP BY
	tab_2280._int8;

WITH
	with_799 (col_5798, col_5799)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL, '':::STRING),
						(e'N:a~\x07<;_':::STRING, '':::STRING),
						(e'K%>5Z[&*\x0b':::STRING, e'\x15;\x1d(':::STRING)
				)
					AS tab_2281 (col_5798, col_5799)
		),
	with_800 (col_5800)
		AS (SELECT * FROM (VALUES (true), (true), (true), (false), (true), (false)) AS tab_2282 (col_5800)),
	with_801 (col_5801, col_5802)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							ARRAY[4023740594:::OID,3587926904:::OID,607998086:::OID,1915194823:::OID],
							'1970-01-05 13:33:53.000617+00:00':::TIMESTAMPTZ
						),
						(
							ARRAY[4057680978:::OID,3179470444:::OID,859520728:::OID,2896160880:::OID,2747334979:::OID,1060622382:::OID],
							'1970-01-09 14:43:18.000488+00:00':::TIMESTAMPTZ
						)
				)
					AS tab_2283 (col_5801, col_5802)
		)
SELECT
	tab_2284._float8 AS col_5803,
	age(tab_2284._timestamptz::TIMESTAMPTZ, '1970-01-09 07:31:36.000258+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::INTERVAL
		AS col_5804,
	'1993-11-09':::DATE AS col_5805,
	tab_2284._float4 AS col_5806
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2284, with_800 AS cte_ref_251
ORDER BY
	tab_2284._float8 DESC
LIMIT
	31:::INT8;

WITH
	with_802 (col_5807)
		AS (
			SELECT
				*
			FROM
				(VALUES (2700912261:::OID), (NULL), (648851475:::OID), (2398069521:::OID), (2294825956:::OID))
					AS tab_2285 (col_5807)
		),
	with_803 (col_5808, col_5809)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							CASE
							WHEN NULL
							THEN ((-1.1098785526400423):::FLOAT8::FLOAT8 - 0.6104062742025642:::FLOAT8::FLOAT8)::FLOAT8
							ELSE 1.1639935397147463:::FLOAT8
							END,
							e'#\x1a\x03j\b':::STRING
						),
						(NULL, e'u-\x10\x10\x19':::STRING),
						(0.30714453626599525:::FLOAT8, 'zqJ':::STRING),
						(
							extract(')':::STRING::STRING, '1970-01-11 10:30:51.000445+00:00':::TIMESTAMP::TIMESTAMP)::FLOAT8,
							'v"':::STRING
						),
						((-0.39957448311141575):::FLOAT8, 'X':::STRING),
						(0.5383879770595367:::FLOAT8, e'sbW\x17S:%<':::STRING)
				)
					AS tab_2286 (col_5808, col_5809)
		)
SELECT
	'b76a8096-ff4e-4753-8e78-936cbc538338':::UUID AS col_5810, '172.137.4.139/21':::INET AS col_5811
FROM
	defaultdb.public.seed@[0] AS tab_2287
ORDER BY
	tab_2287._int8 ASC
LIMIT
	88:::INT8;

SELECT '15:04:26.98888':::TIME AS col_5812 LIMIT 62:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2288
SET
	_decimal = tab_2288._decimal
ORDER BY
	tab_2288._bytes, tab_2288._float8
LIMIT
	72:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2289
SET
	_string = e'yRY1\x02a':::STRING, _date = '1996-04-21':::DATE, _timestamptz = tab_2289._timestamptz, _bool = NULL
WHERE
	tab_2289._bool;

UPDATE
	defaultdb.public.seed AS tab_2290
SET
	_bool = true, _interval = '-11 years -4 mons -575 days -14:34:01.037856':::INTERVAL, _inet = tab_2290._inet
WHERE
	true;

SELECT
	tab_2291._bytes AS col_5813,
	tab_2291._decimal AS col_5814,
	(-4348625786896560012):::INT8 AS col_5815,
	tab_2291._timestamptz AS col_5816,
	tab_2291._int2 AS col_5817,
	'55 years 11 mons 814 days 21:33:01.545418':::INTERVAL AS col_5818,
	'31f5ee73-19d0-434e-8376-573fce572cc4':::UUID AS col_5819,
	tab_2291._float4 AS col_5820,
	tab_2291._bool AS col_5821,
	'1982-11-01':::DATE AS col_5822
FROM
	defaultdb.public.seed@[0] AS tab_2291
WHERE
	false
LIMIT
	88:::INT8;

SELECT
	count(*) AS col_5823
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2292
GROUP BY
	tab_2292._int8, tab_2292._float8
HAVING
	not_like_escape(e'jrRX\x0b':::STRING::STRING, e'/=`\x7fW\x1d>e\x18':::STRING::STRING, NULL::STRING)::BOOL
ORDER BY
	tab_2292._float8;

INSERT
INTO
	defaultdb.public.seed AS tab_2293 (_int2, _int4, _decimal, _string, _bytes, _jsonb)
SELECT
	tab_2294._int4 AS col_5824,
	tab_2294._int8 AS col_5825,
	NULL AS col_5826,
	e'(O\'':::STRING AS col_5827,
	tab_2294._bytes AS col_5828,
	e'{"Y8Z6y\\"kq|": {" ^X*&6S!D5PM": [[["?9ZR "], 0.10901928394693061], {"^9N:": 1.3575601170503475}]}, "a": [{}], "o)D8": {"s|\\"4": {}}, "q=6D": [{"q VY2": []}, "H>FIP"]}':::JSONB
		AS col_5829
FROM
	defaultdb.public.seed@[0] AS tab_2294
WHERE
	false
LIMIT
	53:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2295 (_int2, _int4, _float8, _timestamp, _interval, _bool, _decimal, _string, _inet)
SELECT
	3775:::INT8 AS col_5830,
	(-857398100):::INT8 AS col_5831,
	(-1.833727451798696):::FLOAT8 AS col_5832,
	'1970-01-12 04:55:39.000652+00:00':::TIMESTAMP AS col_5833,
	'-79 years -155 days -06:54:10.990973':::INTERVAL AS col_5834,
	tab_2296._bool AS col_5835,
	tab_2296._decimal AS col_5836,
	tab_2296._string AS col_5837,
	tab_2296._inet AS col_5838
FROM
	defaultdb.public.seed@[0] AS tab_2296
ORDER BY
	tab_2296._int2 ASC, tab_2296._timestamptz ASC;

WITH
	with_804 (col_5839)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(timezone('':::STRING::STRING, '09:00:41.368458+01:02:00':::TIMETZ::TIMETZ)::TIMETZ),
						('04:15:19.630049-02:17:00':::TIMETZ),
						('01:00:55.237186-12:10:00':::TIMETZ),
						('00:03:00.7546-12:19:00':::TIMETZ),
						(NULL),
						('13:06:19.180077+03:52:00':::TIMETZ)
				)
					AS tab_2297 (col_5839)
		),
	with_805 (col_5840)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(false, B'0000000000000000000000000000000000000000000000000000000000000000', e']\x0b\x01FH\x14D':::STRING, NULL)
						),
						((false, B'101101110101110011100110001011110010111100100', e'\'':::STRING, NULL))
				)
					AS tab_2298 (col_5840)
		)
SELECT
	cte_ref_252.col_5840 AS col_5841
FROM
	with_805 AS cte_ref_252
LIMIT
	16:::INT8;

SELECT
	'1c20:4758:a38f:7691:2df:93b8:1e8f:c59f/66':::INET AS col_5842,
	tab_2299._jsonb AS col_5843,
	'\x':::BYTES AS col_5844,
	'-44 years -1 mons -216 days -20:59:05.729851':::INTERVAL AS col_5845,
	NULL AS col_5846,
	'0001-01-01 00:00:00+00:00':::TIMESTAMP AS col_5847,
	tab_2299._int8 AS col_5848,
	tab_2299._bool AS col_5849,
	3573864618667612957:::INT8 AS col_5850,
	tab_2299._float4 AS col_5851,
	tab_2299._date AS col_5852,
	(-0.5666380360640282):::FLOAT8 AS col_5853,
	tab_2299._timestamptz AS col_5854,
	tab_2299._string AS col_5855,
	tab_2299._decimal AS col_5856,
	tab_2299._int4 AS col_5857
FROM
	defaultdb.public.seed@[0] AS tab_2299
WHERE
	tab_2299._bool
ORDER BY
	tab_2299._timestamptz, tab_2299._bool
LIMIT
	5:::INT8;

SELECT
	max(tab_2302._timestamptz::TIMESTAMPTZ)::TIMESTAMPTZ AS col_5874
FROM
	defaultdb.public.seed@[0] AS tab_2302
GROUP BY
	tab_2302._timestamptz
ORDER BY
	tab_2302._timestamptz
LIMIT
	61:::INT8;

WITH
	with_806 (col_5888, col_5889)
		AS (SELECT * FROM (VALUES (ARRAY[0:::OID], 0:::OID)) AS tab_2306 (col_5888, col_5889)),
	with_807 (col_5890)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1209780302:::OID),
						(524544095:::OID),
						(NULL),
						(COALESCE(CASE WHEN false THEN NULL ELSE 1525311761:::OID END, NULL)),
						(1007473153:::OID),
						(3293151582:::OID)
				)
					AS tab_2307 (col_5890)
			INTERSECT SELECT * FROM (VALUES (613534204:::OID)) AS tab_2308 (col_5891)
		),
	with_808 (col_5892)
		AS (
			SELECT
				*
			FROM
				(VALUES (concat_ws(e'\x0f?B':::STRING::STRING)::STRING), (NULL), (NULL), ('/C':::STRING))
					AS tab_2309 (col_5892)
		)
SELECT
	tab_2311._date AS col_5893, tab_2310._date AS col_5894, tab_2311._date AS col_5895, '1986-05-14':::DATE AS col_5896
FROM
	defaultdb.public.seed AS tab_2310
	JOIN defaultdb.public.seed AS tab_2311 ON
			(tab_2310._int8) = (tab_2311._int8) AND (tab_2310._float8) = (tab_2311._float8)
WHERE
	false
ORDER BY
	tab_2310._date DESC;

WITH
	with_809 (col_5897, col_5898)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(313786464:::OID, transaction_timestamp():::DATE::DATE),
						(372909415:::OID, '1985-03-06':::DATE),
						(1704908222:::OID, localtimestamp():::DATE::DATE)
				)
					AS tab_2312 (col_5897, col_5898)
			UNION
				SELECT
					*
				FROM
					(
						VALUES
							(382180165:::OID, '1988-07-17':::DATE),
							(1508586045:::OID, '1992-05-22':::DATE),
							(1320303986:::OID, current_timestamp():::DATE::DATE),
							(229396471:::OID, '1971-01-12':::DATE)
					)
						AS tab_2313 (col_5899, col_5900)
		),
	with_810 (col_5901) AS (SELECT * FROM (VALUES (e'p%\'(tNUY':::STRING:::NAME)) AS tab_2314 (col_5901))
SELECT
	tab_2317._bytes AS col_5902,
	15505:::INT8 AS col_5903,
	tab_2317._int8 AS col_5904,
	tab_2316._jsonb AS col_5905,
	tab_2317._float4 AS col_5906,
	'1970-01-12 13:35:52.000568+00:00':::TIMESTAMP AS col_5907,
	4288862365632893972:::INT8 AS col_5908
FROM
	defaultdb.public.seed AS tab_2315
	JOIN defaultdb.public.seed AS tab_2316 ON (tab_2315._jsonb) = (tab_2316._jsonb)
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2317 ON
			(tab_2316._jsonb) = (tab_2317._jsonb) AND (tab_2315._jsonb) = (tab_2317._jsonb)
ORDER BY
	tab_2317._date ASC, tab_2317._timestamptz
LIMIT
	96:::INT8;

SELECT
	(NULL::INET >> '97.84.94.241/18':::INET::INET)::BOOL AS col_5909, NULL AS col_5910
FROM
	defaultdb.public.seed@[0] AS tab_2318
WHERE
	tab_2318._bool
ORDER BY
	tab_2318._bool DESC, tab_2318._uuid ASC
LIMIT
	96:::INT8;

WITH
	with_811 (col_5911)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(3223806846911448838:::INT8),
						((-7570850393384526273):::INT8),
						(NULL),
						(7321488004679333696:::INT8),
						(3235199973604861693:::INT8)
				)
					AS tab_2319 (col_5911)
		),
	with_812 (col_5912)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(netmask('95.56.169.116/7':::INET::INET)::INET),
						('9bc8:5579:c76c:3c78:a4df:b4c8:1019:1ecc/83':::INET),
						('87.215.94.59/27':::INET)
				)
					AS tab_2320 (col_5912)
		)
SELECT
	'[[[]], [{"+hw&mo": "a", "baz": false, "foobar": 0.5841336133592667, "tm:": [{"foobar": true}, []]}, {}, {}], true, {}]':::JSONB
		AS col_5913;

SELECT
	'\x9edb7e62':::BYTES AS col_5914, tab_2321._string AS col_5915
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2321
WHERE
	tab_2321._bool
ORDER BY
	tab_2321._date DESC, tab_2321._inet
LIMIT
	50:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2322
SELECT
	tab_2323._int2 AS col_5916,
	(-906008954):::INT8 AS col_5917,
	tab_2323._int8 AS col_5918,
	tab_2323._float8 AS col_5919,
	(-0.5295274418454177):::FLOAT8 AS col_5920,
	'1975-08-30':::DATE AS col_5921,
	tab_2323._timestamp AS col_5922,
	tab_2323._timestamptz AS col_5923,
	tab_2323._interval AS col_5924,
	NULL AS col_5925,
	NULL AS col_5926,
	e'\'w':::STRING AS col_5927,
	'\x709d76f91d1993':::BYTES AS col_5928,
	'ed387a9d-9894-40ca-a997-290b6626d88d':::UUID AS col_5929,
	(tab_2323._inet::INET & tab_2323._inet::INET)::INET AS col_5930,
	tab_2323._jsonb AS col_5931
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2323;

SELECT
	tab_2324._inet AS col_5932,
	tab_2324._bool AS col_5933,
	'-2000-01-01 00:00:00+00:00':::TIMESTAMPTZ AS col_5934,
	0.2700066266137129824:::DECIMAL AS col_5935,
	tab_2324._uuid AS col_5936,
	tab_2324._jsonb AS col_5937,
	tab_2324._date AS col_5938,
	'\x0c84e0':::BYTES AS col_5939
FROM
	defaultdb.public.seed@[0] AS tab_2324
WHERE
	true
LIMIT
	3:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2325 (_float8, _timestamp, _timestamptz, _decimal, _string)
SELECT
	COALESCE(0.1674131729535483:::FLOAT8, NULL) AS col_5940,
	NULL AS col_5941,
	tab_2326._timestamptz AS col_5942,
	6.919744733376825873E+28:::DECIMAL AS col_5943,
	NULL AS col_5944
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2326
ORDER BY
	tab_2326._interval;

UPDATE defaultdb.public.seed AS tab_2327 SET _jsonb = NULL, _int2 = tab_2327._int2;

SELECT
	tab_2329._float8 AS col_5945,
	'5cca:e4a7:5028:ab1a:809d:187a:2444:b022/123':::INET AS col_5946,
	tab_2329._int8 AS col_5947,
	tab_2328._inet AS col_5948,
	tab_2329._int8 AS col_5949,
	tab_2328._timestamp AS col_5950,
	tab_2328._decimal AS col_5951,
	(
		WITH
			with_813 (col_5952) AS (SELECT * FROM (VALUES (e'Q\x0e\x1f\x02\x0b':::STRING)) AS tab_2330 (col_5952))
		SELECT
			'1995-09-03':::DATE AS col_5953
		FROM
			with_813 AS cte_ref_253, with_813 AS cte_ref_254
		WHERE
			true
		LIMIT
			1:::INT8
	)
		AS col_5954,
	'\x58':::BYTES AS col_5955,
	ceiling(NULL::FLOAT8)::FLOAT8 AS col_5956,
	tab_2329._int2 AS col_5957,
	tab_2329._int2 AS col_5958,
	'z{':::STRING AS col_5959,
	tab_2329._float8 AS col_5960,
	tab_2328._jsonb AS col_5961,
	tab_2328._bool AS col_5962
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2328, defaultdb.public.seed@[0] AS tab_2329
WHERE
	true;

SELECT count(*) AS col_5963 FROM defaultdb.public.seed@[0] AS tab_2331 GROUP BY tab_2331._jsonb LIMIT 94:::INT8;

SELECT
	count(*) AS col_5964
FROM
	defaultdb.public.seed@[0] AS tab_2332
GROUP BY
	tab_2332._int8, tab_2332._float8
HAVING
	inet_contains_or_equals(NULL::INET, NULL::INET)::BOOL
ORDER BY
	tab_2332._float8
LIMIT
	36:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2333
SET
	_date = tab_2333._date,
	_float4 = tab_2333._float8,
	_bool = tab_2333._bool,
	_timestamp = '1970-01-11 06:45:41.000406+00:00':::TIMESTAMP
ORDER BY
	tab_2333._decimal ASC
LIMIT
	3:::INT8;

WITH
	with_814 (col_5965, col_5966)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-5063174420198084172):::INT8, 'f19d:5c1d:11a9:846b:33be:215b:a5e9:1d1c/90':::INET),
						(NULL, '203.31.52.72/4':::INET),
						((-274585960502323741):::INT8, NULL),
						((-8353780181030071646):::INT8, '42.130.7.250/6':::INET),
						((-2131809069655087923):::INT8, '6b4:1b3b:7d42:7a81:b6dd:ddfd:266b:4878/35':::INET)
				)
					AS tab_2334 (col_5965, col_5966)
		)
SELECT
	4644166460394207961:::INT8 AS col_5967, '28.211.16.41/28':::INET AS col_5968
FROM
	with_814 AS cte_ref_255, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2335
WHERE
	tab_2335._bool
LIMIT
	11:::INT8;

SELECT
	count(*) AS col_5969
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2336
GROUP BY
	tab_2336._int8, tab_2336._float8
LIMIT
	43:::INT8;

SELECT
	'ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID AS col_5970, '\x32cba86aea527b1276':::BYTES AS col_5971
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2337,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2338
ORDER BY
	tab_2338._inet DESC, tab_2338._timestamptz DESC;

INSERT
INTO
	defaultdb.public.seed AS tab_2342
SELECT
	(-5581):::INT8 AS col_5989,
	1252859554:::INT8 AS col_5990,
	(-5668706020881002503):::INT8 AS col_5991,
	2.098745584487915:::FLOAT8 AS col_5992,
	0.6209127733874026:::FLOAT8 AS col_5993,
	tab_2343._date AS col_5994,
	'-2000-01-01 00:00:00+00:00':::TIMESTAMP AS col_5995,
	'1970-01-05 13:43:17.000053+00:00':::TIMESTAMPTZ AS col_5996,
	date_trunc(e'\x17l\x17\x12':::STRING::STRING, '19:01:44.433101':::TIME::TIME)::INTERVAL AS col_5997,
	false AS col_5998,
	(-7.90145981296154354E+29):::DECIMAL AS col_5999,
	e'tW\x1do\x1eK\\':::STRING AS col_6000,
	'\xf97f9905075a2b':::BYTES AS col_6001,
	'1a277a16-4754-4d07-8648-1ae4f2c4529e':::UUID AS col_6002,
	NULL AS col_6003,
	('"foo"':::JSONB::JSONB - '':::STRING::STRING)::JSONB AS col_6004
FROM
	defaultdb.public.seed AS tab_2343
	JOIN defaultdb.public.seed AS tab_2344 ON
			(tab_2343._int8) = (tab_2344._int8)
			AND (tab_2343._float8) = (tab_2344._float8)
			AND (tab_2343._date) = (tab_2344._date)
WHERE
	false
ORDER BY
	tab_2343._date DESC
LIMIT
	35:::INT8;

SELECT
	(-0.3882200946909924):::FLOAT8 AS col_6005,
	18269:::INT8 AS col_6006,
	tab_2345._timestamp AS col_6007,
	tab_2346._timestamptz AS col_6008,
	(-0.24833820760250092):::FLOAT8 AS col_6009,
	tab_2345._date AS col_6010,
	5891681988258556743:::INT8 AS col_6011,
	NULL AS col_6012
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2345
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2346 ON (tab_2345._float4) = (tab_2346._float8)
LIMIT
	61:::INT8;

SELECT
	tab_2347._jsonb AS col_6013, ('{"test": "json"}':::JSONB::JSONB->e'OT:\x12':::STRING::STRING)::JSONB AS col_6014
FROM
	defaultdb.public.seed AS tab_2347 JOIN defaultdb.public.seed AS tab_2348 ON (tab_2347._jsonb) = (tab_2348._jsonb)
LIMIT
	36:::INT8;

SELECT
	count(*) AS col_6015
FROM
	defaultdb.public.seed@[0] AS tab_2349
WHERE
	tab_2349._bool
GROUP BY
	tab_2349._int8
HAVING
	isnan(mod(NULL::FLOAT8, 0.25108385435250924:::FLOAT8::FLOAT8)::FLOAT8::FLOAT8)::BOOL
ORDER BY
	tab_2349._int8 DESC, tab_2349._int8 DESC, tab_2349._int8 ASC, tab_2349._int8
LIMIT
	3:::INT8;

UPDATE defaultdb.public.seed AS tab_2350 SET _bool = tab_2350._bool LIMIT 53:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2351
SET
	_inet = tab_2351._inet, _decimal = (-3.005345582583391526E+28):::DECIMAL, _jsonb = tab_2351._jsonb
WHERE
	true
ORDER BY
	tab_2351._timestamp DESC, tab_2351._uuid ASC, tab_2351._date DESC
LIMIT
	11:::INT8;

WITH
	with_816 (col_6016)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(127:::INT8),
						((0:::INT8::INT8 - 0:::INT8::INT8)::INT8),
						((-3403767201845535459):::INT8),
						(NULL),
						(32767:::INT8)
				)
					AS tab_2352 (col_6016)
		)
SELECT
	bit_and(cte_ref_256.col_6016::INT8)::INT8 AS col_6018
FROM
	with_816 AS cte_ref_256
GROUP BY
	cte_ref_256.col_6016
HAVING
	not_like_escape(e'\x1f\x07z\t\x1a\x02{':::STRING::STRING, ('{"B]vbn": [false, false, {}], "C!?kB0V=i": {}, "bar": [null, "n9{7D/L6jwpZ", [], {}]}':::JSONB::JSONB->>'X':::STRING::STRING)::STRING::STRING, md5((SELECT 'N#':::STRING AS col_6017 FROM defaultdb.public.seed@[0] AS tab_2353, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2354 WHERE inet_same_family(tab_2353._inet::INET, tab_2353._inet::INET)::BOOL LIMIT 1:::INT8)::STRING)::STRING::STRING)::BOOL
ORDER BY
	cte_ref_256.col_6016, cte_ref_256.col_6016, cte_ref_256.col_6016;

SELECT
	((-375437.1187627393333):::DECIMAL::DECIMAL - tab_2355._int8::INT8)::DECIMAL AS col_6019
FROM
	defaultdb.public.seed@[0] AS tab_2355, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2356
ORDER BY
	tab_2355._date, tab_2356._decimal, tab_2356._float8 DESC
LIMIT
	46:::INT8;

WITH
	with_817 (col_6020)
		AS (
			SELECT
				*
			FROM
				(VALUES (3135114047:::OID), (1479214826:::OID), (NULL), (2352863748:::OID), (3820624949:::OID))
					AS tab_2358 (col_6020)
		),
	with_818 (col_6021)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-1513882098):::INT8),
						((-619441905):::INT8),
						(NULL),
						((-453076102):::INT8),
						((-1633688433):::INT8),
						(NULL)
				)
					AS tab_2359 (col_6021)
		)
SELECT
	2364156062:::OID AS col_6022
LIMIT
	77:::INT8;

SELECT
	tab_2361._date AS col_6023,
	'1996-08-22':::DATE AS col_6024,
	tab_2360._date AS col_6025,
	'1987-04-05':::DATE AS col_6026,
	tab_2360._date AS col_6027,
	tab_2361._date AS col_6028
FROM
	defaultdb.public.seed AS tab_2360
	JOIN defaultdb.public.seed AS tab_2361 ON
			(tab_2360._int8) = (tab_2361._int8) AND (tab_2360._float8) = (tab_2361._float8)
ORDER BY
	tab_2361._date ASC;

WITH
	with_819 (col_6029)
		AS (
			SELECT
				tab_2362._int8 AS col_6029
			FROM
				defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2362
			WHERE
				tab_2362._bool
		),
	with_820 (col_6030)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-05 16:32:59.0005+00:00':::TIMESTAMP),
						('1970-01-09 00:02:31.00001+00:00':::TIMESTAMP),
						('1970-01-01 08:17:19.000218+00:00':::TIMESTAMP),
						('1970-01-04 12:56:44.000032+00:00':::TIMESTAMP),
						('1970-01-02 21:05:54.000366+00:00':::TIMESTAMP)
				)
					AS tab_2363 (col_6030)
		)
SELECT
	(-22696):::INT8 AS col_6031, '1970-01-06 15:41:47.000431+00:00':::TIMESTAMP AS col_6032
FROM
	with_819 AS cte_ref_257, with_820 AS cte_ref_258
WHERE
	false
LIMIT
	10:::INT8;

SELECT
	tab_2364._uuid AS col_6033,
	e'\x1fM\x06vu0+hA':::STRING AS col_6034,
	tab_2364._bytes AS col_6035,
	NULL AS col_6036,
	2.711465688293692599E+19:::DECIMAL AS col_6037
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2364
ORDER BY
	tab_2364._int8, tab_2364._interval ASC
LIMIT
	78:::INT8;

INSERT INTO defaultdb.public.seed AS tab_2369 DEFAULT VALUES;

WITH
	with_821 (col_6039)
		AS (
			SELECT * FROM (VALUES (3111442140:::OID), (NULL), (0:::OID)) AS tab_2370 (col_6039)
			INTERSECT SELECT NULL AS col_6040 FROM defaultdb.public.seed@[0] AS tab_2371
		)
SELECT
	'1990-08-07':::DATE AS col_6041,
	'1983-06-08':::DATE AS col_6042,
	tab_2372._date AS col_6043,
	tab_2373._date AS col_6044
FROM
	defaultdb.public.seed AS tab_2372
	JOIN defaultdb.public.seed AS tab_2373 ON
			(tab_2372._int8) = (tab_2373._int8)
			AND (tab_2372._float8) = (tab_2373._float8)
			AND (tab_2372._date) = (tab_2373._date);

UPDATE defaultdb.public.seed AS tab_2374 SET _jsonb = tab_2374._jsonb LIMIT 16:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2375
SET
	_float4 = (-1.3012405633926392):::FLOAT8,
	_timestamp = tab_2375._timestamp,
	_string = e') \x13\x1d\x15_\x0bW':::STRING;

SELECT
	(-560724794):::INT8 AS col_6045,
	1.401298464324817e-45:::FLOAT8 AS col_6046,
	tab_2376._jsonb AS col_6047,
	tab_2376._inet AS col_6048,
	tab_2376._int8 AS col_6049
FROM
	defaultdb.public.seed@[0] AS tab_2376
WHERE
	NULL
ORDER BY
	tab_2376._timestamptz ASC;

SELECT
	tab_2378._int2 AS col_6050
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2377
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2378 ON false
GROUP BY
	tab_2378._int2
LIMIT
	17:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2379
SELECT
	NULL AS col_6051,
	NULL AS col_6052,
	unique_rowid()::INT8 AS col_6053,
	(-1.462561845779419):::FLOAT8 AS col_6054,
	ceiling((-0.36694487733160525):::FLOAT8::FLOAT8)::FLOAT8 AS col_6055,
	now():::DATE::DATE AS col_6056,
	clock_timestamp():::TIMESTAMP::TIMESTAMP AS col_6057,
	localtimestamp():::TIMESTAMPTZ::TIMESTAMPTZ AS col_6058,
	age(NULL::TIMESTAMPTZ)::INTERVAL AS col_6059,
	min(tab_2380._bool::BOOL)::BOOL AS col_6060,
	div((-882588669578220.331):::DECIMAL::DECIMAL, 7095235825707080532:::DECIMAL::DECIMAL)::DECIMAL AS col_6061,
	ltrim(e'E\')':::STRING::STRING, e'bx\x13':::STRING::STRING)::STRING AS col_6062,
	crdb_internal.encode_key(bit_length(('\xd146b052ac':::BYTES::BYTES || (convert_to(' ':::STRING::STRING, (e'{"H_)\\"\\"0Qa Np": {":x\\"PL\\"": {"(LuzL!n": "h3W", "?e\\"#Iwgv-5B": {}, "a": []}}, "baz": {"]pwSf": [[true], 0.8753845939038586]}, "foobar": [null, false, {}, {}]}':::JSONB::JSONB#>>ARRAY['':::STRING,'A>':::STRING,e'\x0e\\K\x1cC\x1bh\x147':::STRING,e'j5\x17Mevj':::STRING]::STRING[])::STRING::STRING)::BYTES::BYTES || NULL::BYTES)::BYTES::BYTES)::BYTES::BYTES)::INT8::INT8, 127:::INT8::INT8, tab_2380._bool)::BYTES
		AS col_6063,
	gen_random_uuid()::UUID AS col_6064,
	netmask('fb83:8d9e:80d2:9393:7769:e28:3b64:b373/91':::INET::INET)::INET AS col_6065,
	json_extract_path('{"test": "json"}':::JSONB::JSONB, 'f':::STRING::STRING)::JSONB AS col_6066
FROM
	defaultdb.public.seed@[0] AS tab_2380
WHERE
	tab_2380._bool
GROUP BY
	tab_2380._bool
HAVING
	bool_or(tab_2380._bool::BOOL)::BOOL
LIMIT
	25:::INT8;

WITH
	with_822 (col_6075)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							ARRAY['a3223d9b-bb1d-4f4b-9bde-704ffd3a83d7':::UUID,'98bea097-c380-41c8-9341-7fa191235876':::UUID,'00000000-0000-0000-0000-000000000000':::UUID,'39ab2a21-79c9-46bd-97cf-1e3ea76ed9cf':::UUID,'a1b2240b-eeba-4f19-b767-3f95dcfbad17':::UUID,'e6f69a14-608c-4e82-997c-d54c22e2abb5':::UUID,'00000000-0000-0000-0000-000000000000':::UUID]
						)
				)
					AS tab_2382 (col_6075)
		),
	with_823 (col_6076) AS (SELECT * FROM (VALUES ((-597703962):::INT8)) AS tab_2383 (col_6076))
SELECT
	NULL AS col_6077
FROM
	with_823 AS cte_ref_259
WHERE
	false
LIMIT
	59:::INT8;

SELECT '10:53:15.51206':::TIME AS col_6078, ARRAY[]:::INT2[] AS col_6079 LIMIT 13:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2384
SET
	_float8 = tab_2384._float4,
	_bytes = ('\x92c48c769e80':::BYTES::BYTES || tab_2384._bytes::BYTES)::BYTES,
	_int8 = (-6880203982726131278):::INT8
WHERE
	tab_2384._bool
ORDER BY
	tab_2384._decimal ASC
LIMIT
	14:::INT8;

WITH
	with_824 (col_6080)
		AS (SELECT * FROM (VALUES ('18:33:24.314891':::TIME), ('23:59:59.999999':::TIME)) AS tab_2385 (col_6080))
SELECT
	'11:50:00.365225':::TIME AS col_6081
FROM
	with_824 AS cte_ref_260
ORDER BY
	cte_ref_260.col_6080 ASC;

SELECT
	tab_2386._inet AS col_6082,
	tab_2386._string AS col_6083,
	NULL AS col_6084,
	tab_2386._float4 AS col_6085,
	CASE WHEN true THEN 111058065:::INT8 ELSE tab_2386._int8 END AS col_6086,
	tab_2386._decimal AS col_6087,
	tab_2386._jsonb AS col_6088,
	'a5950f16-3a1d-412e-86ca-91006dabd7e0':::UUID AS col_6089,
	tab_2386._float8 AS col_6090,
	tab_2386._int8 AS col_6091,
	tab_2386._timestamp AS col_6092,
	tab_2386._date AS col_6093,
	tab_2386._int8 AS col_6094,
	tab_2386._bytes AS col_6095,
	current_timestamp():::TIMESTAMPTZ::TIMESTAMPTZ AS col_6096,
	tab_2386._interval AS col_6097
FROM
	defaultdb.public.seed@[0] AS tab_2386
WHERE
	tab_2386._bool
ORDER BY
	tab_2386._interval DESC
LIMIT
	2:::INT8;

DELETE FROM defaultdb.public.seed AS tab_2387 WHERE true ORDER BY tab_2387._interval ASC LIMIT 100:::INT8;

UPDATE defaultdb.public.seed AS tab_2388 SET _timestamp = tab_2388._timestamp WHERE NULL LIMIT 88:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2389 (_float4, _float8, _date, _timestamp, _timestamptz, _bool, _bytes, _inet)
SELECT
	tab_2390._float8 AS col_6098,
	tab_2390._float8 AS col_6099,
	'1986-07-30':::DATE AS col_6100,
	tab_2390._timestamp AS col_6101,
	tab_2390._timestamptz AS col_6102,
	true AS col_6103,
	tab_2390._bytes AS col_6104,
	NULL AS col_6105
FROM
	defaultdb.public.seed@[0] AS tab_2390
LIMIT
	26:::INT8;

SELECT
	NULL AS col_6106,
	tab_2391._string AS col_6107,
	883685031:::INT8 AS col_6108,
	NULL AS col_6109,
	tab_2391._timestamp AS col_6110,
	'5.7.179.134/7':::INET AS col_6111,
	tab_2391._inet AS col_6112,
	'{")R;*<J5kJlQF": ["foobar"], "ViIPc*+_": [[[], {"T>ye1[": [], "cLV7]qSn2*^#": []}]], "bar": {"M}WX_": [[{}], true, true], "a": true}}':::JSONB
		AS col_6113,
	(tab_2392._bool AND tab_2392._bool) AS col_6114,
	'\x0d99':::BYTES AS col_6115
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2391, defaultdb.public.seed@[0] AS tab_2392
WHERE
	tab_2392._bool
ORDER BY
	tab_2391._interval DESC, tab_2392._interval DESC, tab_2392._decimal DESC
LIMIT
	94:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2396 (_int2, _float4, _timestamp, _timestamptz, _uuid, _jsonb)
SELECT
	17818:::INT8 AS col_6121,
	NULL AS col_6122,
	tab_2397._timestamp AS col_6123,
	'-2000-01-01 00:00:00+00:00':::TIMESTAMPTZ AS col_6124,
	'fd15fbaa-8b35-4ca2-a2ce-3bb9b6433728':::UUID AS col_6125,
	tab_2397._jsonb AS col_6126
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2397
ORDER BY
	tab_2397._float4, tab_2397._timestamptz ASC, tab_2397._timestamptz ASC, tab_2397._int2 ASC;

INSERT
INTO
	defaultdb.public.seed AS tab_2398
		(_int2, _int4, _int8, _float4, _date, _timestamptz, _interval, _bool, _string, _inet)
SELECT
	127:::INT8 AS col_6127,
	1499020901:::INT8 AS col_6128,
	tab_2399._int4 AS col_6129,
	tab_2399._float8 AS col_6130,
	'1971-02-12':::DATE AS col_6131,
	tab_2399._timestamptz AS col_6132,
	tab_2399._interval AS col_6133,
	tab_2399._bool AS col_6134,
	e'\x1deG(':::STRING AS col_6135,
	tab_2399._inet AS col_6136
FROM
	defaultdb.public.seed@[0] AS tab_2399
WHERE
	(tab_2399._bool AND false)
ORDER BY
	tab_2399._decimal ASC;

WITH
	with_826 (col_6137)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-0.0036004746798425913):::FLOAT8),
						(0.596041202545166:::FLOAT8),
						((-0.06615389138460159):::FLOAT8),
						(0.9030757546424866:::FLOAT8)
				)
					AS tab_2400 (col_6137)
		),
	with_827 (col_6138) AS (SELECT * FROM (VALUES ('o':::STRING)) AS tab_2401 (col_6138)),
	with_828 (col_6139)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(3982151489448250.864:::DECIMAL),
						(
							(5.215920066083446296E+19:::DECIMAL::DECIMAL // 2.34417570806713115E+30:::DECIMAL::DECIMAL)::DECIMAL
						)
				)
					AS tab_2402 (col_6139)
		)
SELECT
	tab_2403._jsonb AS col_6140,
	'1970-01-10 17:53:24.000055+00:00':::TIMESTAMP AS col_6141,
	e'\x1cW@\x10\x0ed\x18T':::STRING AS col_6142,
	7733153385853978184:::INT8 AS col_6143,
	(-2912):::INT8 AS col_6144,
	NULL AS col_6145
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2403;

SELECT
	tab_2405._int2 AS col_6146, tab_2405._int4 AS col_6147
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2404, defaultdb.public.seed@[0] AS tab_2405
ORDER BY
	tab_2404._int2;

SELECT 11027:::INT8 AS col_6148, 0:::OID AS col_6149 LIMIT 95:::INT8;

WITH
	with_829 (col_6150)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(0.8389127254486084:::FLOAT8),
						((-1.3359107971191406):::FLOAT8),
						(NULL),
						((-0.48044389486312866):::FLOAT8)
				)
					AS tab_2406 (col_6150)
		),
	with_830 (col_6152)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-585903530):::INT8),
						(
							(
								SELECT
									tab_2407._int2 AS col_6151
								FROM
									defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2407
								ORDER BY
									tab_2407._float8 DESC, tab_2407._int2
								LIMIT
									1:::INT8
							)
						),
						((-615500461):::INT8),
						((-1608287278):::INT8),
						(636305028:::INT8),
						((-1402143938):::INT8)
				)
					AS tab_2408 (col_6152)
		)
SELECT
	tab_2410._date AS col_6153,
	tab_2410._date AS col_6154,
	tab_2410._date AS col_6155,
	'1993-06-30':::DATE AS col_6156,
	'1972-11-10':::DATE AS col_6157,
	'1988-09-05':::DATE AS col_6158
FROM
	defaultdb.public.seed AS tab_2409
	JOIN defaultdb.public.seed AS tab_2410 ON
			(tab_2409._int8) = (tab_2410._int8) AND (tab_2409._float8) = (tab_2410._float8)
WHERE
	false
LIMIT
	70:::INT8;

SELECT
	e'{"foobar": {}, "l3,?zi,UHD0": {"foobar": {}}, "t0d7-9np5": [{"c": {}}, {"&{|z%HW": true, "?aiNR!wc": {"*9:\'W7k9": {"baz": true}}}, "a", {}]}':::JSONB
		AS col_6159
FROM
	defaultdb.public.seed@[0] AS tab_2411,
	defaultdb.public.seed AS tab_2412
	JOIN defaultdb.public.seed AS tab_2413 ON (tab_2412._jsonb) = (tab_2413._jsonb),
	defaultdb.public.seed@[0] AS tab_2414;

SELECT
	tab_2415._timestamp AS col_6160
FROM
	defaultdb.public.seed@[0] AS tab_2415
ORDER BY
	tab_2415._bool DESC
LIMIT
	93:::INT8;

UPDATE defaultdb.public.seed AS tab_2416 SET _float4 = 1.00783371925354:::FLOAT8;

SELECT tab_2420._decimal AS col_6164 FROM defaultdb.public.seed@[0] AS tab_2420 WHERE tab_2420._bool LIMIT 11:::INT8;

UPDATE defaultdb.public.seed AS tab_2421 SET _int2 = tab_2421._int2 WHERE false LIMIT 96:::INT8;

SELECT
	tab_2427._float4 AS col_6165,
	5412.256008811803882:::DECIMAL AS col_6166,
	tab_2426._uuid AS col_6167,
	tab_2427._float8 AS col_6168,
	tab_2427._timestamptz AS col_6169,
	(-2455121538454029963):::INT8 AS col_6170,
	(tab_2426._bool AND tab_2422._bool) AS col_6171
FROM
	defaultdb.public.seed@[0] AS tab_2422
	JOIN defaultdb.public.seed AS tab_2423
		JOIN defaultdb.public.seed AS tab_2424 ON
				(tab_2423._int8) = (tab_2424._int8) AND (tab_2423._float8) = (tab_2424._float8) ON false,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2425,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2426,
	defaultdb.public.seed@[0] AS tab_2427
ORDER BY
	tab_2424._date DESC;

SELECT
	tab_2429._inet AS col_6172,
	tab_2428._jsonb AS col_6173,
	tab_2428._int4 AS col_6174,
	'-28 years -9 mons -413 days -16:58:15.970669':::INTERVAL AS col_6175,
	'1970-01-01 11:22:56.000482+00:00':::TIMESTAMPTZ AS col_6176,
	NULL AS col_6177,
	NULL AS col_6178,
	tab_2430._int4 AS col_6179,
	tab_2428._bool AS col_6180,
	NULL AS col_6181,
	NULL AS col_6182,
	tab_2428._uuid AS col_6183,
	false AS col_6184,
	5.254306761032056713E+29:::DECIMAL AS col_6185,
	tab_2429._decimal AS col_6186,
	tab_2430._int2 AS col_6187
FROM
	defaultdb.public.seed@[0] AS tab_2428,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2429,
	defaultdb.public.seed@[0] AS tab_2430
LIMIT
	21:::INT8;

WITH
	with_833 (col_6188)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(e'[{"DNTL}-u": {}, "[A6O6K\\"+": {}, "bar": {"e<XW": {}}, "baz": [[], {"a": {"zOQUG7W!": 0.7976368104055471}, "baz": [false]}]}, [{}, true]]':::JSONB::JSONB - e'3S68\x02\x1d':::STRING::STRING)::JSONB
						)
				)
					AS tab_2431 (col_6188)
		)
SELECT
	count(*) AS col_6189
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2432
WHERE
	tab_2432._bool
GROUP BY
	tab_2432._jsonb
HAVING
	isnan(0.6749063875248913:::FLOAT8::FLOAT8)::BOOL;

WITH
	with_834 (col_6190) AS (SELECT * FROM (VALUES (1307977091:::OID), (NULL)) AS tab_2433 (col_6190))
SELECT
	3454953241:::OID AS col_6191
FROM
	with_834 AS cte_ref_262;

SELECT
	count(*) AS col_6192
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2434
WHERE
	false
GROUP BY
	tab_2434._int8
HAVING
	crdb_internal.is_admin()::BOOL
ORDER BY
	tab_2434._int8
LIMIT
	21:::INT8;

SELECT
	0.783438123359641:::FLOAT8 AS col_6193
FROM
	defaultdb.public.seed@[0] AS tab_2435
ORDER BY
	tab_2435._int8 ASC, tab_2435._int2
LIMIT
	3:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2436
WITH
	with_835 (col_6194) AS (SELECT * FROM (VALUES (4056637482:::OID), (213626780:::OID)) AS tab_2437 (col_6194)),
	with_836 (col_6195)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							'{"a": [{"*Z99|V%xp;]?": []}], "bar": [], "c": [[[false]], [], true], "foobar": true}':::JSONB
						),
						(
							COALESCE(
								'[[{}], {"c": {"foo": {"a": false, "foo": {}}}, "foobar": {}, "|<8M>-E->": {}, "|J|M ": [[]]}, {"foo": []}, {}]':::JSONB,
								'1':::JSONB
							)
						),
						(
							e'[false, [{":-Wnf%t`&\\\\ab": {"c": "Jz4Ok$:"}, "a": {}, "foo": false}, 0.26307357647507945], {}]':::JSONB
						),
						('1':::JSONB),
						(NULL),
						('{"test": "json"}':::JSONB)
				)
					AS tab_2438 (col_6195)
		),
	with_837 (col_6196)
		AS (SELECT e'\x04^{\x0f2,4/':::STRING:::NAME AS col_6196 FROM with_836 AS cte_ref_263 WHERE false)
SELECT
	20427:::INT8 AS col_6197,
	(-128):::INT8 AS col_6198,
	(-6293920985345768699):::INT8 AS col_6199,
	'+Inf':::FLOAT8 AS col_6200,
	NULL AS col_6201,
	(((-2147483648):::INT8::INT8 + NULL::DATE)::DATE::DATE - NULL::INT8)::DATE AS col_6202,
	'1970-01-05 10:46:26.000005+00:00':::TIMESTAMP AS col_6203,
	'1970-01-10 04:41:59.000092+00:00':::TIMESTAMPTZ AS col_6204,
	'-13 years -1 mons -878 days -15:45:48.237446':::INTERVAL AS col_6205,
	true AS col_6206,
	(-6.167497698137275338E+20):::DECIMAL AS col_6207,
	e'y\x10K|m<k-':::STRING AS col_6208,
	'\xe587ce7a9043e952':::BYTES AS col_6209,
	'1601a9d5-1658-4adf-b604-a9b13677004b':::UUID AS col_6210,
	NULL AS col_6211,
	'{"Y1? o1m6o04": false, "a": [false], "baz": [false, "bar", [false]]}':::JSONB AS col_6212
FROM
	with_835 AS cte_ref_264;

INSERT
INTO
	defaultdb.public.seed AS tab_2439
		(_int2, _date, _timestamp, _timestamptz, _interval, _decimal, _string, _bytes, _uuid, _jsonb)
WITH
	with_838 (col_6213, col_6214)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							'1970-01-11 22:41:22.000398+00:00':::TIMESTAMPTZ,
							B'0000000000000000000000000000000000000000000000000000000000000000'
						),
						(NULL, B'0111111111111111111111111111111111111111111111111111111111111111')
				)
					AS tab_2440 (col_6213, col_6214)
		),
	with_839 (col_6215)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(e'?\x0f+vu\x10r!':::STRING),
						(e'\x18\x04K~':::STRING),
						(e'\x00':::STRING),
						(NULL),
						('"':::STRING)
				)
					AS tab_2441 (col_6215)
		)
SELECT
	25555:::INT8 AS col_6216,
	'1987-05-09':::DATE AS col_6217,
	'1970-01-02 01:11:02.000352+00:00':::TIMESTAMP AS col_6218,
	'3000-01-01 00:00:00+00:00':::TIMESTAMPTZ AS col_6219,
	'-8 years -11 mons -205 days -18:35:43.965852':::INTERVAL AS col_6220,
	(-759.741789671747903):::DECIMAL AS col_6221,
	e'#\x14=Q 3O':::STRING AS col_6222,
	NULL AS col_6223,
	'6333cff7-5f16-4be5-a146-0af99a57f165':::UUID AS col_6224,
	'[{"foo": {"foo": {}}, "t?yCESNtNLP_": [[{"bar": []}, true, {}], null, [[]]]}, [[[], false]]]':::JSONB AS col_6225
FROM
	with_839 AS cte_ref_265
WHERE
	false
ORDER BY
	cte_ref_265.col_6215 DESC, cte_ref_265.col_6215 DESC, cte_ref_265.col_6215;

SELECT
	NULL AS col_6226,
	tab_2442._float4 AS col_6227,
	tab_2442._int8 AS col_6228,
	'\xc232eb0ec6':::BYTES AS col_6229,
	tab_2442._date AS col_6230,
	NULL AS col_6231,
	NULL AS col_6232,
	'f40a741e-d7aa-4ef8-bf03-ab4ca51f639c':::UUID AS col_6233,
	(-8564863041572550713):::DECIMAL AS col_6234,
	'3000-01-01 00:00:00+00:00':::TIMESTAMPTZ AS col_6235,
	7436300058299252839:::INT8 AS col_6236,
	'00:00:00':::INTERVAL AS col_6237,
	e'Z69_epc\x1d\x18':::STRING AS col_6238,
	tab_2442._bool AS col_6239,
	1:::INT8 AS col_6240,
	'1970-01-11 04:38:38.000165+00:00':::TIMESTAMP AS col_6241
FROM
	defaultdb.public.seed@[0] AS tab_2442;

SELECT
	29975:::INT8 AS col_6242,
	1835812792170884.780:::DECIMAL AS col_6243,
	tab_2443._bytes AS col_6244,
	'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET AS col_6245,
	tab_2443._uuid AS col_6246,
	NULL AS col_6247,
	tab_2443._float4 AS col_6248
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2443
LIMIT
	9:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2444
SET
	_interval = tab_2444._interval
WHERE
	false
ORDER BY
	tab_2444._float8
LIMIT
	98:::INT8;

WITH
	with_840 (col_6249)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('cb24d165-383e-460f-afaf-5cc782111354':::UUID),
						(crdb_internal.cluster_id()::UUID),
						(NULL),
						('0f0cce4f-d818-49b1-81f5-5e40da8327a6':::UUID)
				)
					AS tab_2445 (col_6249)
		),
	with_841 (col_6250)
		AS (SELECT * FROM (VALUES ('Pc$':::STRING), (e'J\x167\\J\rZ{\x15':::STRING)) AS tab_2446 (col_6250)),
	with_842 (col_6251)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'.POm\r,':::STRING),
						(e'\x1fx':::STRING),
						(e'\\U*E\x02':::STRING),
						(e'D\\DX':::STRING),
						(e'\x1c0.\x10':::STRING)
				)
					AS tab_2447 (col_6251)
		)
SELECT
	CASE WHEN false THEN NULL ELSE cte_ref_266.col_6249 END AS col_6252, cte_ref_267.col_6251 AS col_6253
FROM
	with_840 AS cte_ref_266, with_842 AS cte_ref_267
ORDER BY
	cte_ref_266.col_6249,
	cte_ref_267.col_6251 ASC,
	cte_ref_267.col_6251 DESC,
	cte_ref_266.col_6249 ASC,
	cte_ref_267.col_6251 DESC,
	cte_ref_267.col_6251 ASC,
	cte_ref_267.col_6251 DESC,
	cte_ref_266.col_6249 ASC
LIMIT
	52:::INT8;

WITH
	with_843 (col_6254)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(B'1'),
						(B'1'),
						(B'0111111111111111111111111111111111111111111111111111111111111111'),
						(NULL)
				)
					AS tab_2448 (col_6254)
		),
	with_844 (col_6255, col_6256)
		AS (
			SELECT
				CASE
				WHEN (((true AND false) AND false) AND false) THEN '10:47:03.306542+14:40:00':::TIMETZ
				ELSE '14:15:37.797126-06:04:00':::TIMETZ
				END
					AS col_6255,
				NULL AS col_6256
			FROM
				with_843 AS cte_ref_268
			WHERE
				false
		),
	with_847 (col_6257)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-0.0952572360586934):::FLOAT8),
						(((-0.1317006541322846):::FLOAT8::FLOAT8 % (-0.7250357201213421):::FLOAT8::FLOAT8)::FLOAT8)
				)
					AS tab_2449 (col_6257)
			UNION ALL
				SELECT
					*
				FROM
					(
						VALUES
							(
								(0.43444888791296626:::FLOAT8::FLOAT8 // CASE WHEN EXISTS (WITH with_845 (col_6258) AS (SELECT * FROM (VALUES (NULL), (B'000000010100110110001011010111001111'), (NULL), (NULL), (B'0000000000000000000000000000000000000000000000000000000000000000'), (CASE WHEN NULL THEN B'001100101010100111001010001100011010' ELSE B'001111101111100100011010001000101011' END)) AS tab_2450 (col_6258)), with_846 (col_6259) AS (SELECT * FROM (VALUES (()), (NULL), (NULL), (())) AS tab_2451 (col_6259)) SELECT tab_2453._string AS col_6260 FROM defaultdb.public.seed@[0] AS tab_2452 CROSS JOIN defaultdb.public.seed@[0] AS tab_2453 LIMIT 97:::INT8) THEN 0.7773391400207378:::FLOAT8 ELSE NULL END::FLOAT8)::FLOAT8
							),
							(0.8945416833560591:::FLOAT8),
							((-0.041221333405729865):::FLOAT8),
							(NULL),
							(1.126842228033865:::FLOAT8)
					)
						AS tab_2454 (col_6261)
		)
SELECT
	tab_2455._int2 AS col_6262, tab_2455._jsonb AS col_6263, tab_2455._string AS col_6264
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2455
LIMIT
	96:::INT8;

SELECT
	NULL AS col_6265, 117489810:::INT8 AS col_6266
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2456
ORDER BY
	tab_2456._timestamptz, tab_2456._int2 DESC
LIMIT
	82:::INT8;

SELECT
	tab_2457._int2 AS col_6267,
	2058765988:::INT8 AS col_6268,
	tab_2457._interval AS col_6269,
	tab_2457._date AS col_6270,
	NULL AS col_6271,
	tab_2457._decimal AS col_6272,
	tab_2457._timestamptz AS col_6273,
	'\xc78d61dd':::BYTES AS col_6274,
	'1970-01-06 04:11:55.000775+00:00':::TIMESTAMP AS col_6275,
	tab_2457._uuid AS col_6276,
	tab_2457._string AS col_6277,
	tab_2457._jsonb AS col_6278,
	tab_2457._int8 AS col_6279
FROM
	defaultdb.public.seed@[0] AS tab_2457
LIMIT
	6:::INT8;

WITH
	with_848 (col_6280)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							('57 years 3 mons 15 days 21:10:00.925194':::INTERVAL::INTERVAL + '12:23:50.792252':::TIME::TIME)::TIME
						),
						('10:10:32.929551':::TIME),
						('22:28:35.509635':::TIME),
						('00:00:00':::TIME),
						('22:38:15.936318':::TIME),
						('18:16:37.968332':::TIME)
				)
					AS tab_2458 (col_6280)
		)
SELECT
	'11:50:44.756699':::TIME AS col_6281
FROM
	with_848 AS cte_ref_269
WHERE
	false
ORDER BY
	cte_ref_269.col_6280 DESC, cte_ref_269.col_6280 ASC;

SELECT
	tab_2460._bytes AS col_6282,
	NULL AS col_6283,
	tab_2459._decimal AS col_6284,
	tab_2459._date AS col_6285,
	tab_2459._jsonb AS col_6286,
	'85.0.24.157/29':::INET AS col_6287,
	tab_2459._float4 AS col_6288,
	tab_2460._timestamptz AS col_6289
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2459
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2460 ON
			(tab_2459._bytes) = (tab_2460._bytes)
			AND (tab_2459._float8) = (tab_2460._float4)
			AND (tab_2459._date) = (tab_2460._date)
			AND (tab_2459._string) = (tab_2460._string)
			AND (tab_2459._jsonb) = (tab_2460._jsonb)
LIMIT
	94:::INT8;

UPDATE defaultdb.public.seed AS tab_2461 SET _float8 = NULL ORDER BY tab_2461._date LIMIT 68:::INT8;

WITH
	with_849 (col_6290)
		AS (
			SELECT
				*
			FROM
				(VALUES ((-741915348):::INT8), ((-1954665048):::INT8), (1716842105:::INT8)) AS tab_2462 (col_6290)
		),
	with_850 (col_6291)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[1550569600:::OID,4242150705:::OID,1177965171:::OID]),
						(ARRAY[2624493375:::OID,3268575380:::OID]),
						(ARRAY[3520130709:::OID,1874353884:::OID,0:::OID])
				)
					AS tab_2463 (col_6291)
		),
	with_851 (col_6292)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'\x01Or\x05z\x11Ge':::STRING),
						(e'\x00':::STRING),
						('v$a(':::STRING),
						(e'[@\x12!9\'M':::STRING),
						(e'\x1blH\x11^':::STRING),
						('S>d>':::STRING)
				)
					AS tab_2464 (col_6292)
		)
SELECT
	'1970-01-09 23:25:09.000682+00:00':::TIMESTAMPTZ AS col_6293,
	1:::DECIMAL AS col_6294,
	false AS col_6295,
	tab_2465._int8 AS col_6296,
	(-8093):::INT8 AS col_6297,
	tab_2465._uuid AS col_6298
FROM
	defaultdb.public.seed@[0] AS tab_2465
WHERE
	true
LIMIT
	88:::INT8;

SELECT count(*) AS col_6299 FROM defaultdb.public.seed@[0] AS tab_2466 WHERE tab_2466._bool GROUP BY tab_2466._jsonb;

WITH
	with_852 (col_6316) AS (SELECT * FROM (VALUES ((-2441):::INT8)) AS tab_2469 (col_6316)),
	with_853 (col_6317) AS (SELECT * FROM (VALUES (243311945:::OID), (2624780462:::OID)) AS tab_2470 (col_6317))
SELECT
	tab_2471._timestamptz AS col_6319,
	tab_2471._uuid AS col_6320,
	NULL AS col_6321,
	'L':::STRING AS col_6322,
	tab_2471._decimal AS col_6323,
	(-2147483648):::INT8 AS col_6324,
	22947:::INT8 AS col_6325,
	tab_2471._interval AS col_6326,
	tab_2471._bytes AS col_6327
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2471
WHERE
	(EXISTS (SELECT '00:00:00':::TIME AS col_6318 FROM defaultdb.public.seed@[0] AS tab_2472 ORDER BY tab_2472._date DESC, tab_2472._string, tab_2472._date ASC LIMIT 82:::INT8) AND NULL);

SELECT
	8615:::INT8 AS col_6328, tab_2473._string AS col_6329, NULL AS col_6330
FROM
	defaultdb.public.seed@[0] AS tab_2473
WHERE
	(NOT tab_2473._bool)
LIMIT
	48:::INT8;

WITH
	with_856 (col_6335, col_6336, col_6337, col_6338, col_6339)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							'5c31:524b:eaf7:e0c3:1b43:212:a253:a8c2/104':::INET,
							false,
							(
								WITH
									with_854 (col_6331)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(1573777287:::OID),
														(2111945592:::OID),
														(0:::OID),
														(3078806613:::OID)
												)
													AS tab_2474 (col_6331)
										),
									with_855 (col_6332, col_6333)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(
															ARRAY[(-5366):::INT8,30758:::INT8],
															'19:57:38.201172-00:17:00':::TIMETZ
														),
														(
															ARRAY[32767:::INT8,21439:::INT8,(-1394):::INT8,(-24739):::INT8],
															'20:39:30.615096+02:48:00':::TIMETZ
														),
														(
															ARRAY[(-1542):::INT8,(-5512):::INT8],
															'13:16:04.272104+10:42:00':::TIMETZ
														),
														(ARRAY[]:::INT2[], NULL),
														(ARRAY[]:::INT2[], '15:05:16.340094-06:35:00':::TIMETZ)
												)
													AS tab_2475 (col_6332, col_6333)
										)
								SELECT
									3171381997:::OID AS col_6334
								FROM
									defaultdb.public.seed AS tab_2476
									JOIN defaultdb.public.seed AS tab_2477 ON (tab_2476._jsonb) = (tab_2477._jsonb)
								LIMIT
									1:::INT8
							),
							e'\U00002603':::STRING,
							'Bd@$61!+':::STRING
						)
				)
					AS tab_2478 (col_6335, col_6336, col_6337, col_6338, col_6339)
		),
	with_857 (col_6340, col_6341, col_6342)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							2251164176:::OID,
							3669394585:::OID,
							ARRAY[(-22732):::INT8,(-17119):::INT8,(-1098):::INT8,(-13077):::INT8,31769:::INT8,(-25097):::INT8]
						),
						(837268167:::OID, 2532473527:::OID, ARRAY[(-8850):::INT8]),
						(0:::OID, 2626782725:::OID, ARRAY[(-22787):::INT8])
				)
					AS tab_2479 (col_6340, col_6341, col_6342)
		)
SELECT
	NULL AS col_6343,
	e'{"^qOS/iR`A4w[": [], "baz": [false], "foobar": {}, "q}i!&EK\'0": [true, {}], "tp;/dz][$g": [true, true]}':::JSONB
		AS col_6344,
	tab_2480._int8 AS col_6345,
	tab_2480._bool AS col_6346,
	false AS col_6347,
	'1978-10-17':::DATE AS col_6348,
	tab_2480._decimal AS col_6349,
	NULL AS col_6350,
	cte_ref_270.col_6338 AS col_6351,
	tab_2480._timestamptz AS col_6352,
	'36.192.70.100/9':::INET AS col_6353,
	tab_2480._int8 AS col_6354
FROM
	with_856 AS cte_ref_270, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2480
LIMIT
	89:::INT8;

SELECT '14:29:44.749086':::TIME AS col_6355 LIMIT 36:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2481
SET
	_timestamp = '1970-01-06 21:58:05.000313+00:00':::TIMESTAMP,
	_decimal = tab_2481._decimal,
	_timestamptz = '1970-01-02 08:37:19.000999+00:00':::TIMESTAMPTZ,
	_date = tab_2481._date;

INSERT
INTO
	defaultdb.public.seed AS tab_2482
		(_int2, _timestamp, _timestamptz, _interval, _bool, _decimal, _bytes, _uuid, _inet)
SELECT
	(
		WITH
			with_858 (col_6356)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								('1995-03-29':::DATE),
								(('1974-01-06':::DATE::DATE - (-3898296420031077209):::INT8::INT8)::DATE)
						)
							AS tab_2485 (col_6356)
				)
		SELECT
			15011:::INT8 AS col_6357
		FROM
			with_858 AS cte_ref_271
		LIMIT
			1:::INT8
	)
		AS col_6358,
	'0001-01-01 00:00:00+00:00':::TIMESTAMP AS col_6359,
	NULL AS col_6360,
	'-75 years -3 mons -960 days -05:37:15.522499':::INTERVAL AS col_6361,
	false AS col_6362,
	(-1.494868666487847782E+33):::DECIMAL AS col_6363,
	'\x8740':::BYTES AS col_6364,
	'ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID AS col_6365,
	'3941:3bbb:eaa6:bd61:f51d:d9ee:2d6:4ef2/61':::INET AS col_6366
FROM
	defaultdb.public.seed AS tab_2483 JOIN defaultdb.public.seed AS tab_2484 ON (tab_2483._int8) = (tab_2484._int8)
ORDER BY
	tab_2483._date ASC
LIMIT
	45:::INT8;

WITH
	with_859 (col_6367)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), ('251.87.42.20/29':::INET), ('7164:1b44:3c9b:27f4:421e:f672:15ec:e44c/24':::INET))
					AS tab_2486 (col_6367)
		),
	with_860 (col_6368, col_6369, col_6370)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'd\x19':::STRING, '19:51:31.106875-01:03:00':::TIMETZ, NULL),
						('Wh(':::STRING, '22:52:23.629249-01:59:00':::TIMETZ, 1809933544:::OID),
						(
							e'(\x143K\x1a':::STRING,
							(NULL::INTERVAL + timezone(NULL::TIME, substring(NULL::STRING, (-4000482815388221474):::INT8::INT8)::STRING::STRING)::TIMETZ::TIMETZ)::TIMETZ,
							3636569575:::OID
						),
						(e'\tp\x1b1n>T!':::STRING, '00:00:00+15:59:00':::TIMETZ, 809474321:::OID)
				)
					AS tab_2487 (col_6368, col_6369, col_6370)
		)
SELECT
	tab_2488._timestamp AS col_6371, '1992-11-06':::DATE AS col_6372
FROM
	with_860 AS cte_ref_272, with_859 AS cte_ref_273, defaultdb.public.seed@[0] AS tab_2488
LIMIT
	38:::INT8;

SELECT
	count(*) AS col_6373
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2489
WHERE
	tab_2489._bool
GROUP BY
	tab_2489._jsonb
LIMIT
	81:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2490 (_int2, _int8, _date, _timestamptz, _decimal, _bytes)
SELECT
	(
		WITH
			with_861 (col_6374)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(266398973:::OID),
								(NULL),
								(NULL),
								(1545148210:::OID),
								(CASE WHEN false THEN 3639554747:::OID ELSE 3322990299:::OID END),
								(0:::OID)
						)
							AS tab_2492 (col_6374)
				)
		SELECT
			(-31211):::INT8 AS col_6375
		FROM
			with_861 AS cte_ref_274
		LIMIT
			1:::INT8
	)
		AS col_6376,
	array_position((ARRAY['1973-05-02':::DATE,'-infinity':::DATE,'1970-01-01':::DATE,'1975-11-18':::DATE,'1985-01-11':::DATE,'1984-12-22':::DATE,'1989-03-21':::DATE,'1979-04-16':::DATE]::DATE[] || ARRAY['1992-01-13':::DATE,'1992-06-11':::DATE,'1992-10-31':::DATE,'1970-01-01':::DATE,'1996-05-30':::DATE]::DATE[])::DATE[]::DATE[], '4714-11-24 BC':::DATE::DATE)::INT8
		AS col_6377,
	tab_2491._date AS col_6378,
	tab_2491._timestamptz AS col_6379,
	tab_2491._decimal AS col_6380,
	'\x9f4f7552a52b':::BYTES AS col_6381
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2491
ORDER BY
	tab_2491._bytes, tab_2491._float4;

WITH
	with_862 (col_6382)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('\xa00d3bb4bf':::BYTES),
						('\xbdadd9df698c5cda':::BYTES),
						('\x394b':::BYTES),
						(NULL),
						('\x8c81e94083ae3a758a':::BYTES)
				)
					AS tab_2493 (col_6382)
		)
SELECT
	count(*) AS col_6383
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2494
WHERE
	false
GROUP BY
	tab_2494._jsonb
HAVING
	inet_contains_or_equals('c123:c353:fee5:f078:49fe:c53f:4be0:2656/30':::INET::INET, '197.227.170.219/12':::INET::INET)::BOOL
LIMIT
	54:::INT8;

UPDATE defaultdb.public.seed AS tab_2499 SET _jsonb = tab_2499._jsonb, _int4 = tab_2499._int2 LIMIT 82:::INT8;

SELECT
	(-22009):::INT8 AS col_6400, true AS col_6401, 'fde6bf1a-b78b-4d81-9c51-d92ff5c80300':::UUID AS col_6402
FROM
	defaultdb.public.seed@[0] AS tab_2500
LIMIT
	31:::INT8;

UPDATE defaultdb.public.seed AS tab_2501 SET _int8 = tab_2501._int4;

SELECT
	'1994-08-08':::DATE AS col_6403,
	(
		WITH
			with_863 (col_6404, col_6405)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								('1984-06-30':::DATE, '8&7xDx':::STRING),
								('1972-11-05':::DATE, e'(Ld\x07r':::STRING),
								('1975-04-23':::DATE, NULL),
								('1983-05-27':::DATE, 'h0p^':::STRING),
								('5874897-12-31':::DATE, e't~X\x1f':::STRING),
								('-infinity':::DATE, e'\x10':::STRING)
						)
							AS tab_2503 (col_6404, col_6405)
				),
			with_864 (col_6406) AS (SELECT * FROM (VALUES (205600283:::OID), (0:::OID)) AS tab_2504 (col_6406)),
			with_865 (col_6407)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								('\x':::BYTES),
								('\xc08e729243d4fa3d':::BYTES),
								(NULL),
								(('\xefe598':::BYTES::BYTES || '\x61198dfa':::BYTES::BYTES)::BYTES),
								('\x61':::BYTES)
						)
							AS tab_2505 (col_6407)
				)
		SELECT
			quote_literal('':::STRING::STRING):::STRING::STRING AS col_6408
		FROM
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2506
		WHERE
			true
		GROUP BY
			tab_2506._float8
		LIMIT
			1:::INT8
	)
		AS col_6409,
	tab_2502._uuid AS col_6410,
	tab_2502._timestamp AS col_6411,
	tab_2502._bytes AS col_6412,
	tab_2502._float8 AS col_6413,
	tab_2502._int8 AS col_6414,
	tab_2502._int2 AS col_6415,
	true AS col_6416,
	NULL AS col_6417,
	NULL AS col_6418,
	'219.0.206.239/28':::INET AS col_6419,
	tab_2502._jsonb AS col_6420,
	tab_2502._decimal AS col_6421,
	NULL AS col_6422,
	tab_2502._float8 AS col_6423
FROM
	defaultdb.public.seed@[0] AS tab_2502
ORDER BY
	tab_2502._uuid DESC
LIMIT
	62:::INT8;

SELECT
	count(*) AS col_6424
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2507
WHERE
	isnan(tab_2507._decimal::DECIMAL)::BOOL
GROUP BY
	tab_2507._int8, tab_2507._float8
ORDER BY
	tab_2507._float8 ASC, tab_2507._int8
LIMIT
	41:::INT8;

SELECT
	tab_2508._timestamptz AS col_6425,
	'192.244.163.101/24':::INET AS col_6426,
	18053:::INT8 AS col_6427,
	'19 years 6 mons 102 days 07:47:50.473871':::INTERVAL AS col_6428,
	json_extract_path(e'[{"%34W]x7]%6Gp": [], "bar": {"b": [], "bar": {"HuA5Z": [], "bar": {"a": 2.256973560921268}}}, "bf2W7xco?h#{": {"I@\'B(M@Y)": 0.08261220804188274, "b": {}}}, {".:6fH,": null, "IE\\\\&": []}, []]':::JSONB::JSONB, e'\U00002603':::STRING::STRING)::JSONB
		AS col_6429
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2508
WHERE
	false
ORDER BY
	tab_2508._inet ASC, tab_2508._timestamptz ASC, tab_2508._inet ASC
LIMIT
	48:::INT8;

SELECT
	tab_2510._date AS col_6430,
	'1974-06-24':::DATE AS col_6431,
	tab_2509._date AS col_6432,
	tab_2510._date AS col_6433,
	tab_2509._date AS col_6434,
	'1977-11-21':::DATE AS col_6435
FROM
	defaultdb.public.seed AS tab_2509 JOIN defaultdb.public.seed AS tab_2510 ON (tab_2509._int8) = (tab_2510._int8)
WHERE
	true
ORDER BY
	tab_2510._date
LIMIT
	56:::INT8;

DELETE FROM defaultdb.public.seed AS tab_2511 WHERE tab_2511._bool LIMIT 70:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2512 (_int2, _interval, _decimal, _bytes, _inet)
SELECT
	(SELECT 11654:::INT8 AS col_6436 LIMIT 1:::INT8) AS col_6437,
	('5 years 6 mons 511 days 15:32:21.900991':::INTERVAL::INTERVAL / currval(NULL::STRING)::INT8::INT8)::INTERVAL
		AS col_6438,
	7155890.864711306990:::DECIMAL AS col_6439,
	'\x':::BYTES AS col_6440,
	'199.192.177.233/9':::INET AS col_6441
LIMIT
	11:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2513
SET
	_int8 = crc32c('\x414639172a275c1f':::BYTES::BYTES)::INT8, _inet = netmask(tab_2513._inet::INET)::INET;

SELECT
	tab_2515._bool AS col_6442,
	tab_2514._decimal AS col_6443,
	tab_2514._int4 AS col_6444,
	'[[{"foobar": true, "yY$IfvDlT": [{}, []]}, {}, {"=4o]H": {":7to": []}, "a": [[]]}], false, {"gUMgO[": []}, {}]':::JSONB
		AS col_6445,
	tab_2514._timestamptz AS col_6446,
	'16 years 4 mons 335 days 06:18:39.071351':::INTERVAL AS col_6447,
	(-28700):::INT8 AS col_6448,
	tab_2514._float8 AS col_6449
FROM
	defaultdb.public.seed@[0] AS tab_2514, defaultdb.public.seed@[0] AS tab_2515
ORDER BY
	tab_2514._float8;

INSERT
INTO
	defaultdb.public.seed AS tab_2516
WITH
	with_866 (col_6450)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID),
						('5872259f-bd36-491e-b079-15384e6284a9':::UUID),
						(gen_random_uuid()::UUID),
						(NULL),
						('0792ef0f-a93b-4872-9745-7fb14d742831':::UUID),
						('abbfe3fc-65ad-4e96-9a4c-4a0102794f21':::UUID)
				)
					AS tab_2517 (col_6450)
		),
	with_867 (col_6451) AS (SELECT * FROM (VALUES ('=5':::STRING:::NAME)) AS tab_2518 (col_6451))
SELECT
	(-15241):::INT8 AS col_6452,
	950598998:::INT8 AS col_6453,
	NULL AS col_6454,
	NULL AS col_6455,
	1.3415612253744418:::FLOAT8 AS col_6456,
	('infinity':::DATE::DATE - 7853780106164368138:::INT8::INT8)::DATE AS col_6457,
	'1970-01-04 05:12:52.00063+00:00':::TIMESTAMP AS col_6458,
	'3000-01-01 00:00:00+00:00':::TIMESTAMPTZ AS col_6459,
	'00:00:00':::INTERVAL AS col_6460,
	isnan((-1.447093992754406350E+30):::DECIMAL::DECIMAL)::BOOL AS col_6461,
	(9.80340940755206906E+26:::DECIMAL::DECIMAL * (-5.736661657556768901E+37):::DECIMAL::DECIMAL)::DECIMAL AS col_6462,
	e'(\x07<7y\x0eh\x18':::STRING AS col_6463,
	'\x03947aa7cb3d4f76':::BYTES AS col_6464,
	'3686f732-63e3-4189-a2c2-893bb4d8d663':::UUID AS col_6465,
	'179.12.55.139/2':::INET AS col_6466,
	'{":ZhP0oAn)N": [], "b": {"57KAj]PV~": {}, "b": {}}, "c": [{}], "dxq-BzB": {}, "foo": [{}, {}], "joxoPa$uq?A": {}, "m@ O7<": {"b": [[null, "Xs=wF;u"]]}}':::JSONB
		AS col_6467
FROM
	with_867 AS cte_ref_275
ORDER BY
	cte_ref_275.col_6451 ASC, cte_ref_275.col_6451 DESC
LIMIT
	79:::INT8;

SELECT
	tab_2519._inet AS col_6468,
	tab_2520._string AS col_6469,
	tab_2519._jsonb AS col_6470,
	(NULL::INT8 << tab_2519._int8::INT8)::INT8 AS col_6471,
	tab_2519._int4 AS col_6472
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2519, defaultdb.public.seed@[0] AS tab_2520
WHERE
	tab_2519._bool;

SELECT B'011' AS col_6473 LIMIT 42:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2521
SET
	_int2 = tab_2521._int2, _timestamptz = '1970-01-12 11:05:32.000739+00:00':::TIMESTAMPTZ
WHERE
	tab_2521._bool
LIMIT
	74:::INT8;

SELECT
	count(*) AS col_6474
FROM
	defaultdb.public.seed@[0] AS tab_2522
WHERE
	false
GROUP BY
	tab_2522._jsonb
LIMIT
	6:::INT8;

SELECT sign(NULL::FLOAT8)::FLOAT8 AS col_6475 LIMIT 74:::INT8;

SELECT
	count(*) AS col_6476
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2524
WHERE
	tab_2524._bool
GROUP BY
	tab_2524._jsonb
LIMIT
	63:::INT8;

SELECT
	NULL AS col_6477, tab_2525._bool AS col_6478, (-35626932):::INT8 AS col_6479
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2525
WHERE
	false
LIMIT
	81:::INT8;

DELETE FROM defaultdb.public.seed AS tab_2526 LIMIT 13:::INT8;

INSERT INTO defaultdb.public.seed AS tab_2527 DEFAULT VALUES;

WITH
	with_868 (col_6480)
		AS (
			SELECT * FROM (VALUES ('':::STRING), ('':::STRING), (e'&\x18':::STRING)) AS tab_2528 (col_6480)
			EXCEPT
				SELECT
					*
				FROM
					(
						VALUES
							(NULL),
							(e'[%j\x13^]}\x05':::STRING),
							(e'TC\x0e':::STRING),
							('e_':::STRING),
							(e'kYos-\x1d\x14':::STRING),
							(NULL)
					)
						AS tab_2529 (col_6481)
		)
SELECT
	'"?=vS"':::JSONB AS col_6482
LIMIT
	100:::INT8;

UPDATE defaultdb.public.seed AS tab_2530 SET _interval = NULL WHERE true ORDER BY tab_2530._int8 ASC LIMIT 36:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2531
WITH
	with_869 (col_6484)
		AS (
			SELECT
				(SELECT 2502242980:::OID AS col_6483 LIMIT 1:::INT8) AS col_6484
			FROM
				defaultdb.public.seed@[0] AS tab_2532,
				defaultdb.public.seed@[0] AS tab_2533,
				defaultdb.public.seed@[0] AS tab_2534
			GROUP BY
				tab_2533._uuid
		)
SELECT
	NULL AS col_6485,
	1847646945:::INT8 AS col_6486,
	(-5510352510871075039):::INT8 AS col_6487,
	(-0.20029382407665253):::FLOAT8 AS col_6488,
	(-0.7116317713157205):::FLOAT8 AS col_6489,
	'1987-01-21':::DATE AS col_6490,
	'1970-01-12 07:22:37.000989+00:00':::TIMESTAMP AS col_6491,
	'1970-01-09 13:53:55.000883+00:00':::TIMESTAMPTZ AS col_6492,
	'-15 years -4 mons -771 days -10:11:25.067776':::INTERVAL AS col_6493,
	false AS col_6494,
	abs(50591823.51080314878:::DECIMAL::DECIMAL)::DECIMAL AS col_6495,
	e'0\x02\x1d':::STRING AS col_6496,
	NULL AS col_6497,
	crdb_internal.cluster_id()::UUID AS col_6498,
	(NULL::INET - (5430359557297248810:::INT8::INT8 // (-1617309157753877303):::INT8::INT8)::INT8::INT8)::INET
		AS col_6499,
	NULL AS col_6500
FROM
	with_869 AS cte_ref_276
ORDER BY
	cte_ref_276.col_6484 DESC, cte_ref_276.col_6484;

SELECT
	tab_2535._timestamptz AS col_6501,
	'42.61.232.211/21':::INET AS col_6502,
	'1 day':::INTERVAL AS col_6503,
	NULL AS col_6504,
	'\x58b5e2761b68dd':::BYTES AS col_6505,
	'3b2fae13-23db-430b-979a-2d499ae03664':::UUID AS col_6506,
	tab_2535._string AS col_6507,
	true AS col_6508,
	NULL AS col_6509,
	tab_2535._decimal AS col_6510,
	tab_2535._int4 AS col_6511,
	tab_2535._float8 AS col_6512,
	tab_2535._int8 AS col_6513,
	tab_2535._float4 AS col_6514,
	'1970-01-12 07:50:55.000982+00:00':::TIMESTAMP AS col_6515,
	NULL AS col_6516
FROM
	defaultdb.public.seed@[0] AS tab_2535
ORDER BY
	tab_2535._inet DESC, tab_2535._uuid ASC
LIMIT
	34:::INT8;

SELECT
	e'\x03':::STRING AS col_6517,
	false AS col_6518,
	'1970-01-11 22:02:15.000832+00:00':::TIMESTAMP AS col_6519,
	tab_2537._bytes AS col_6520,
	tab_2537._date AS col_6521,
	tab_2536._inet AS col_6522,
	e'{".4|2zcxvB]ls": [], "7v2+QUx": [1.9528606673746465], "U\\\\xb&\\"p": [], "b": {"ln|;RgG\\\\": true}, "foobar": {}, "zAu u2T+(N": [{"foo": {"c": {}}}, {"b": 0.21615097377735193, "foobar": {}}, {}]}':::JSONB
		AS col_6523,
	tab_2536._date AS col_6524,
	tab_2536._bytes AS col_6525
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2536
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2537 ON (tab_2536._string) = (tab_2537._string)
ORDER BY
	tab_2537._bool DESC, tab_2537._inet ASC;

SELECT
	NULL AS col_6526,
	tab_2538._decimal AS col_6527,
	'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff':::INET AS col_6528,
	'1970-01-07 14:04:32.000643+00:00':::TIMESTAMPTZ AS col_6529,
	'lR':::STRING AS col_6530,
	tab_2538._interval AS col_6531,
	NULL AS col_6532,
	'1970-01-05 10:51:34.000966+00:00':::TIMESTAMP AS col_6533,
	CASE WHEN tab_2538._bool THEN tab_2538._uuid ELSE tab_2538._uuid END AS col_6534,
	NULL AS col_6535,
	28149:::INT8 AS col_6536,
	'\x2a':::BYTES AS col_6537,
	1661924356:::INT8 AS col_6538,
	tab_2538._jsonb AS col_6539,
	NULL AS col_6540,
	0.08022102296295103:::FLOAT8 AS col_6541
FROM
	defaultdb.public.seed@[0] AS tab_2538
ORDER BY
	tab_2538._float8 ASC
LIMIT
	62:::INT8;

SELECT
	tab_2539._int2 AS col_6542
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2539
WHERE
	false
LIMIT
	26:::INT8;

SELECT
	'1972-08-05':::DATE AS col_6543, tab_2540._inet AS col_6544, NULL AS col_6545
FROM
	defaultdb.public.seed@[0] AS tab_2540
WHERE
	true
ORDER BY
	tab_2540._int8 DESC,
	tab_2540._interval DESC,
	tab_2540._uuid,
	tab_2540._uuid DESC,
	tab_2540._timestamp ASC,
	tab_2540._bool DESC
LIMIT
	5:::INT8;

SELECT
	tab_2541._float8 AS col_6546,
	'11 years 5 mons 148 days 13:58:42.571174':::INTERVAL AS col_6547,
	NULL AS col_6548,
	'\x09cb87c019e2':::BYTES AS col_6549,
	tab_2541._int8 AS col_6550,
	tab_2541._date AS col_6551,
	tab_2541._inet AS col_6552,
	tab_2541._float8 AS col_6553,
	e'\x1c\'':::STRING AS col_6554,
	tab_2541._int2 AS col_6555
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2541
ORDER BY
	tab_2541._string
LIMIT
	6:::INT8;

WITH
	with_870 (col_6556)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), (ARRAY[(-2058):::INT8]), (ARRAY[]:::INT2[]), (ARRAY[]:::INT2[])) AS tab_2542 (col_6556)
		),
	with_871 (col_6557)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(ARRAY['1973-08-28':::DATE,'1970-03-06':::DATE,'1989-07-25':::DATE,'1976-08-31':::DATE,'1996-12-09':::DATE]::DATE[] || ARRAY['1987-08-16':::DATE,'1974-10-30':::DATE,'1971-05-09':::DATE,'1992-04-23':::DATE]::DATE[])::DATE[]
						),
						(ARRAY['1979-02-12':::DATE,'1988-03-21':::DATE,'1984-08-02':::DATE]),
						(
							ARRAY['-infinity':::DATE,'1996-08-29':::DATE,'1987-04-13':::DATE,'4714-11-24 BC':::DATE,'1995-08-11':::DATE]
						),
						(ARRAY['1990-12-02':::DATE,'1991-09-07':::DATE,'1991-05-06':::DATE,'1978-01-20':::DATE])
				)
					AS tab_2543 (col_6557)
		),
	with_872 (col_6558) AS (SELECT * FROM (VALUES ('X':::STRING), (e'\x01N\x1c':::STRING)) AS tab_2544 (col_6558))
SELECT
	cte_ref_277.col_6557 AS col_6559
FROM
	with_871 AS cte_ref_277
WHERE
	true;

DELETE FROM defaultdb.public.seed AS tab_2545 WHERE tab_2545._bool;

INSERT
INTO
	defaultdb.public.seed AS tab_2546 (_int4, _int8, _float8, _date, _timestamptz, _bool, _bytes)
SELECT
	tab_2547._int2 AS col_6560,
	tab_2547._int4 AS col_6561,
	0.4392055139999887:::FLOAT8 AS col_6562,
	tab_2547._date AS col_6563,
	tab_2547._timestamptz AS col_6564,
	false AS col_6565,
	tab_2547._bytes AS col_6566
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2547
LIMIT
	76:::INT8;

WITH
	with_873 (col_6567, col_6568)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'\x15A\b':::STRING, (-12766):::INT8),
						(e'r\r:Z.s`':::STRING, (-32768):::INT8),
						(NULL, 27210:::INT8),
						(e'\x19^+\x01k\x0fZ_\x02':::STRING, NULL),
						(e'aF\x1fv\x1ax':::STRING, (-8322):::INT8)
				)
					AS tab_2548 (col_6567, col_6568)
		),
	with_874 (col_6569)
		AS (
			SELECT * FROM (VALUES (137252861:::OID), (21606177:::OID)) AS tab_2549 (col_6569)
			INTERSECT SELECT * FROM (VALUES (NULL), (948822913:::OID), (NULL), (0:::OID)) AS tab_2550 (col_6570)
		),
	with_875 (col_6571, col_6572)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('A':::STRING, 3730890297379579730:::INT8),
						(
							e'N*9)\x14FX':::STRING,
							array_position(ARRAY[]:::TIMETZ[]::TIMETZ[], '22:43:23.417746-07:55:00':::TIMETZ::TIMETZ)::INT8
						),
						(e'j\x0b&J\\!$q':::STRING, NULL)
				)
					AS tab_2551 (col_6571, col_6572)
		)
SELECT
	e'9\x02\x19}\x0e\x04':::STRING AS col_6573, (-2574128735542467303):::INT8 AS col_6574
FROM
	with_875 AS cte_ref_278
WHERE
	NULL
ORDER BY
	cte_ref_278.col_6572 ASC
LIMIT
	40:::INT8;

SELECT tab_2552._int4 AS col_6575 FROM defaultdb.public.seed@[0] AS tab_2552;

INSERT INTO defaultdb.public.seed AS tab_2553 DEFAULT VALUES;

UPDATE defaultdb.public.seed AS tab_2554 SET _int4 = tab_2554._int8 LIMIT 34:::INT8;

SELECT
	'cba0435b-1d67-4bbb-b1ba-c7c770e5d7b2':::UUID AS col_6576,
	tab_2555._inet AS col_6577,
	'\x5f5d':::BYTES AS col_6578,
	'1978-08-11':::DATE AS col_6579,
	tab_2555._int4 AS col_6580,
	'1970-01-09 01:14:32.000202+00:00':::TIMESTAMPTZ AS col_6581
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2555
ORDER BY
	tab_2555._uuid ASC;

INSERT
INTO
	defaultdb.public.seed AS tab_2556 (_interval, _decimal, _bytes, _jsonb)
SELECT
	'-35 years -4 mons -255 days -19:10:50.471834':::INTERVAL AS col_6582,
	tab_2557._decimal AS col_6583,
	'\xc1949de0':::BYTES AS col_6584,
	(tab_2558._jsonb::JSONB - (-5744798654765585648):::INT8::INT8)::JSONB AS col_6585
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2557
	JOIN defaultdb.public.seed@[0] AS tab_2558 ON (tab_2557._int8) = (tab_2558._int8)
WHERE
	tab_2558._bool
ORDER BY
	tab_2558._bool DESC, tab_2557._bool
LIMIT
	71:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2559 (_int2, _int4, _float8, _string, _bytes, _uuid, _inet, _jsonb)
SELECT
	(-14587):::INT8 AS col_6586,
	1920639606:::INT8 AS col_6587,
	0.30657995432770146:::FLOAT8 AS col_6588,
	NULL AS col_6589,
	NULL AS col_6590,
	'dcdcbcdb-10d4-4657-a4e5-a783b357034e':::UUID AS col_6591,
	(
		WITH
			with_876 (col_6592)
				AS (
					SELECT
						*
					FROM
						(VALUES (0:::OID), (1383673334:::OID), (3936179605:::OID), (NULL)) AS tab_2560 (col_6592)
				),
			with_877 (col_6593)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(((-32768):::INT8::INT8 << 2201219437827830789:::INT8::INT8)::INT8),
								(1689491195266469893:::INT8),
								(((-206752807844399975):::INT8::INT8 << 1202720195707541050:::INT8::INT8)::INT8),
								((-6906466374188413143):::INT8),
								((-7663589377850971956):::INT8)
						)
							AS tab_2561 (col_6593)
				),
			with_878 (col_6594)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								('92.149.96.23/18':::INET), (NULL), ('c3e7:9df3:fed8:6b7f:9c1e:474e:5822:7c7/72':::INET)
						)
							AS tab_2562 (col_6594)
				)
		SELECT
			'55da:b633:8d1d:94d2:11cb:851a:96b6:e844/104':::INET AS col_6595
		FROM
			with_877 AS cte_ref_279
		LIMIT
			1:::INT8
	)
		AS col_6596,
	'null':::JSONB AS col_6597
LIMIT
	69:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2563
SELECT
	14884:::INT8 AS col_6599,
	tab_2564._int8 AS col_6600,
	(-1016589961170749695):::INT8 AS col_6601,
	tab_2564._float4 AS col_6602,
	tab_2564._float8 AS col_6603,
	tab_2564._date AS col_6604,
	'1970-01-03 19:42:04.000613+00:00':::TIMESTAMP AS col_6605,
	'1970-01-11 22:35:39.000872+00:00':::TIMESTAMPTZ AS col_6606,
	'-18 years -2 mons -960 days -15:47:34.475639':::INTERVAL AS col_6607,
	tab_2564._bool AS col_6608,
	0:::DECIMAL AS col_6609,
	e'!26\x15 M\'':::STRING AS col_6610,
	tab_2564._bytes AS col_6611,
	NULL AS col_6612,
	tab_2564._inet AS col_6613,
	'false':::JSONB AS col_6614
FROM
	defaultdb.public.seed@[0] AS tab_2564
WHERE
	'1970-01-11 23:12:07.000832+00:00':::TIMESTAMPTZ::TIMESTAMPTZ
	IN (
			SELECT
				transaction_timestamp():::TIMESTAMPTZ::TIMESTAMPTZ::TIMESTAMPTZ AS col_6598
			FROM
				defaultdb.public.seed@[0] AS tab_2565, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2566
			GROUP BY
				tab_2565._date
			HAVING
				bool_or(tab_2565._bool::BOOL)::BOOL
			LIMIT
				60:::INT8
		)
ORDER BY
	tab_2564._int2 ASC, tab_2564._decimal ASC;

SELECT
	tab_2567._float4 AS col_6616
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2567
WHERE
	'()Mk':::STRING::STRING
	IN (
			SELECT
				tab_2568._string::STRING AS col_6615
			FROM
				defaultdb.public.seed@[0] AS tab_2568, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2569
			WHERE
				(NOT false)
			LIMIT
				43:::INT8
		)
ORDER BY
	tab_2567._inet ASC, tab_2567._date ASC, tab_2567._bool DESC, tab_2567._uuid DESC;

WITH
	with_883 (col_6642)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(e'j\x01\x18{hgi':::STRING),
						(CASE WHEN false THEN 'Ea;':::STRING ELSE COALESCE(e'*!\x11':::STRING, 'UK':::STRING) END)
				)
					AS tab_2578 (col_6642)
		),
	with_884 (col_6643)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('56.243.195.243/3':::INET),
						('a831:8e60:3ae0:68d5:6ba:b887:f6eb:c1d3/116':::INET),
						(broadcast('34.97.106.108/17':::INET::INET)::INET),
						(NULL),
						('c184:1213:cc7d:1390:3ed3:6:188e:b339/31':::INET)
				)
					AS tab_2579 (col_6643)
		)
SELECT
	tab_2580._timestamp AS col_6644,
	tab_2581._uuid AS col_6645,
	tab_2581._timestamptz AS col_6646,
	'\x1027':::BYTES AS col_6647,
	tab_2582._int8 AS col_6648,
	tab_2581._date AS col_6649,
	tab_2582._interval AS col_6650,
	'0001-01-01 00:00:00+00:00':::TIMESTAMP AS col_6651,
	tab_2580._bytes AS col_6652,
	'1970-01-09 12:32:54.000269+00:00':::TIMESTAMPTZ AS col_6653,
	tab_2580._float4 AS col_6654,
	'e6e9cb38-b5d3-466d-b8bc-cd35345232b8':::UUID AS col_6655
FROM
	defaultdb.public.seed@[0] AS tab_2580,
	defaultdb.public.seed@[0] AS tab_2581
	JOIN defaultdb.public.seed@[0] AS tab_2582 ON (tab_2581._interval) = (tab_2582._interval),
	defaultdb.public.seed@[0] AS tab_2583
LIMIT
	54:::INT8;

SELECT '154.92.228.111/30':::INET AS col_6656;

SELECT
	ret_13 AS col_6657
FROM
	[
		DELETE FROM
			defaultdb.public.seed AS tab_2584
		WHERE
			tab_2584._bool
		LIMIT
			19:::INT8
		RETURNING
			'14:22:08.011782+04:25:00':::TIMETZ AS ret_13
	]
WHERE
	false
LIMIT
	72:::INT8;

SELECT
	tab_2585._inet AS col_6658, tab_2585._bool AS col_6659, (-14579):::INT8 AS col_6660
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2585
ORDER BY
	tab_2585._timestamptz
LIMIT
	42:::INT8;

WITH
	with_885 (col_6661)
		AS (
			SELECT
				*
			FROM
				(VALUES (NULL), (3922057818:::OID), (2767490021:::OID), (385407491:::OID)) AS tab_2586 (col_6661)
		),
	with_886 (col_6662) AS (SELECT * FROM (VALUES ('03:28:03.883124':::TIME), (NULL)) AS tab_2587 (col_6662))
SELECT
	min(cte_ref_281.col_6662::TIME)::TIME AS col_6663
FROM
	with_886 AS cte_ref_281
GROUP BY
	cte_ref_281.col_6662
HAVING
	like_escape(to_hex((-7625821344458575799):::INT8::INT8)::STRING::STRING, NULL::STRING, '*7':::STRING::STRING)::BOOL
LIMIT
	76:::INT8;

SELECT true AS col_6664 FROM defaultdb.public.seed@[0] AS tab_2588 WHERE false LIMIT 31:::INT8;

WITH
	with_887 (col_6665, col_6666)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(2013939992:::OID, 2950:::INT8),
						(COALESCE(1048150422:::OID, 0:::OID), NULL),
						(3843140633:::OID, (-1212):::INT8)
				)
					AS tab_2589 (col_6665, col_6666)
			EXCEPT ALL SELECT * FROM (VALUES (1122311348:::OID, 852:::INT8)) AS tab_2590 (col_6667, col_6668)
		)
SELECT
	2065404435:::OID AS col_6669
FROM
	with_887 AS cte_ref_282
ORDER BY
	cte_ref_282.col_6666
LIMIT
	86:::INT8;

INSERT INTO defaultdb.public.seed AS tab_2591 DEFAULT VALUES;

SELECT
	NULL AS col_6670,
	tab_2592._timestamptz AS col_6671,
	tab_2592._timestamp AS col_6672,
	tab_2592._jsonb AS col_6673,
	tab_2592._float8 AS col_6674,
	tab_2592._int8 AS col_6675
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2592
WHERE
	tab_2592._bool
ORDER BY
	tab_2592._bytes ASC, tab_2592._bool DESC, tab_2592._uuid, tab_2592._timestamptz;

WITH
	with_888 (col_6676, col_6677)
		AS (SELECT * FROM (VALUES (e'\x1fsr?Sz@':::STRING:::NAME, NULL)) AS tab_2593 (col_6676, col_6677)),
	with_889 (col_6678)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('-50 years -6 mons -136 days -02:02:21.692826':::INTERVAL),
						('-81 years -2 mons -970 days -20:42:26.856899':::INTERVAL),
						(NULL),
						('34 years 2 mons 390 days 01:13:37.150995':::INTERVAL)
				)
					AS tab_2594 (col_6678)
		)
SELECT
	(-12102):::INT8 AS col_6679,
	(
		WITH
			with_893 (col_6688)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(2068391307:::OID),
								(NULL),
								(2095846271:::OID),
								((SELECT NULL AS col_6680 FROM defaultdb.public.seed@[0] AS tab_2596 LIMIT 1:::INT8)),
								(
									(
										WITH
											with_890 (col_6681, col_6682)
												AS (
													SELECT
														*
													FROM
														(
															VALUES
																(
																	'007973f9-c5ab-48d4-9136-4e9055100839':::UUID,
																	'34ba6e11-9d63-4174-a755-fd2a8332a7e4':::UUID
																),
																(
																	'cc47e043-4c6b-4647-83a2-9907eaa9e3bd':::UUID,
																	'8744104c-d3bc-45e1-805e-0f0e5bf6f3dc':::UUID
																),
																(
																	'b3ab7378-2406-4fb9-bc8b-2fcc6bb53025':::UUID,
																	'dfb95416-f312-498c-b21a-2a04b374acc8':::UUID
																),
																(
																	'6b322701-7528-43d8-aa87-3296c59063b6':::UUID,
																	'33d9852c-c869-444a-8614-03041fb9afd1':::UUID
																)
														)
															AS tab_2597 (col_6681, col_6682)
												),
											with_891 (col_6684)
												AS (
													SELECT
														*
													FROM
														(
															VALUES
																(20016529:::INT8),
																(812565806:::INT8),
																(NULL),
																(NULL),
																(
																	(
																		SELECT
																			(-1278018938):::INT8 AS col_6683
																		LIMIT
																			1:::INT8
																	)
																)
														)
															AS tab_2598 (col_6684)
												),
											with_892 (col_6685)
												AS (
													SELECT
														*
													FROM
														(VALUES ((-14104):::INT8), (NULL), (10569:::INT8))
															AS tab_2599 (col_6685)
												)
										SELECT
											2033547745:::OID AS col_6686
										FROM
											defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2600
										WHERE
											tab_2600._bool
										ORDER BY
											tab_2600._int4, tab_2600._float8 ASC
										LIMIT
											1:::INT8
									)
								),
								(
									(
										SELECT
											1892830117:::OID AS col_6687
										FROM
											defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2601
										WHERE
											tab_2601._bool
										LIMIT
											1:::INT8
									)
								)
						)
							AS tab_2602 (col_6688)
				),
			with_894 (col_6689)
				AS (SELECT * FROM (VALUES (1464268415:::OID), (692447621:::OID), (NULL), (NULL)) AS tab_2603 (col_6689))
		SELECT
			(-0.49623045321479287):::FLOAT8 AS col_6690
		FROM
			with_893 AS cte_ref_283
		WHERE
			NULL
		ORDER BY
			cte_ref_283.col_6688 ASC
		LIMIT
			1:::INT8
	)
		AS col_6691
FROM
	defaultdb.public.seed@[0] AS tab_2595
LIMIT
	90:::INT8;

WITH
	with_895 (col_6692)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							ARRAY['1970-01-06 05:50:46.000254+00:00':::TIMESTAMP,'1970-01-04 19:37:19.000286+00:00':::TIMESTAMP,'1970-01-05 10:07:07.000679+00:00':::TIMESTAMP]
						),
						(ARRAY['1970-01-03 09:21:46.000978+00:00':::TIMESTAMP,'3000-01-01 00:00:00+00:00':::TIMESTAMP])
				)
					AS tab_2604 (col_6692)
		),
	with_896 (col_6693)
		AS (
			SELECT
				*
			FROM
				(VALUES ('1970-01-07 22:11:22.00031+00:00':::TIMESTAMP), ('3000-01-01 00:00:00+00:00':::TIMESTAMP))
					AS tab_2605 (col_6693)
		)
SELECT
	min(tab_2606._date::DATE)::DATE AS col_6694
FROM
	defaultdb.public.seed AS tab_2606 JOIN defaultdb.public.seed AS tab_2607 ON (tab_2606._int8) = (tab_2607._int8)
GROUP BY
	tab_2606._date;

INSERT
INTO
	defaultdb.public.seed AS tab_2611
WITH
	with_898 (col_6712)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('00:00:00+15:59:00':::TIMETZ),
						('16:44:07.431115+09:23:00':::TIMETZ),
						('21:19:22.409745-00:57:00':::TIMETZ),
						('00:00:00+15:59:00':::TIMETZ)
				)
					AS tab_2612 (col_6712)
		)
SELECT
	tab_2613._int4 AS col_6713,
	tab_2613._int8 AS col_6714,
	tab_2613._int4 AS col_6715,
	tab_2613._float8 AS col_6716,
	'NaN':::FLOAT8 AS col_6717,
	tab_2613._date AS col_6718,
	tab_2613._timestamp AS col_6719,
	tab_2613._timestamptz AS col_6720,
	tab_2613._interval AS col_6721,
	NULL AS col_6722,
	(-770838940821746.36):::DECIMAL AS col_6723,
	NULL AS col_6724,
	tab_2613._bytes AS col_6725,
	tab_2613._uuid AS col_6726,
	'94e9:7882:702c:1926:c984:8445:cab4:bf12/104':::INET AS col_6727,
	tab_2613._jsonb AS col_6728
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2613, with_898 AS cte_ref_284
WHERE
	tab_2613._bool
LIMIT
	16:::INT8;

WITH
	with_899 (col_6729)
		AS (
			SELECT
				*
			FROM
				(VALUES (3539179401:::OID), (NULL), (1955763871:::OID), (1540939792:::OID)) AS tab_2614 (col_6729)
		)
SELECT
	cte_ref_285.col_6729 AS col_6730, 3605562511:::OID AS col_6731
FROM
	with_899 AS cte_ref_285, with_899 AS cte_ref_286
WHERE
	true
GROUP BY
	cte_ref_285.col_6729, cte_ref_286.col_6729
ORDER BY
	cte_ref_286.col_6729 ASC
LIMIT
	33:::INT8;

SELECT
	count(*) AS col_6732
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2615
GROUP BY
	tab_2615._jsonb
LIMIT
	40:::INT8;

SELECT
	tab_2617._string AS col_6733,
	'\xf5':::BYTES AS col_6734,
	tab_2617._bool AS col_6735,
	'-11 years -3 mons -537 days -03:46:36.866918':::INTERVAL AS col_6736,
	EXISTS(
		SELECT
			tab_2618._string AS col_6737
		FROM
			defaultdb.public.seed@[0] AS tab_2618,
			defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2619,
			defaultdb.public.seed@[0] AS tab_2620
			JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2621 ON (tab_2620._bool) = (tab_2621._bool)
		LIMIT
			57:::INT8
	)
		AS col_6738
FROM
	defaultdb.public.seed@[0] AS tab_2616, defaultdb.public.seed@[0] AS tab_2617
WHERE
	tab_2616._bool
ORDER BY
	tab_2616._uuid, tab_2616._int4 ASC, tab_2616._interval ASC
LIMIT
	40:::INT8;

WITH
	with_900 (col_6739)
		AS (
			SELECT
				*
			FROM
				(VALUES (3417656396:::OID), (NULL), (2540066625:::OID), (3059222612:::OID)) AS tab_2622 (col_6739)
		),
	with_901 (col_6740)
		AS (
			SELECT * FROM (VALUES ((-3420963781439233117):::INT8), (1694139748046528874:::INT8)) AS tab_2623 (col_6740)
		),
	with_902 (col_6741)
		AS (SELECT * FROM (VALUES (B'1111100001000'), (NULL), (B'0000110010100'), (NULL)) AS tab_2624 (col_6741))
SELECT
	NULL AS col_6742, 0:::OID AS col_6743
LIMIT
	2:::INT8;

WITH
	with_903 (col_6744)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(rtrim('~,':::STRING::STRING, e'hL0;+M\x14':::STRING::STRING)::STRING),
						(e'\x192Q2.f':::STRING),
						(e'5(\\Y\x7fPK':::STRING),
						(NULL)
				)
					AS tab_2625 (col_6744)
		),
	with_904 (col_6745)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-1676052964330699692):::INT8),
						(1944431980111724206:::INT8),
						((-6250601242981939930):::INT8),
						(
							(NULL::INT8 << array_position((B'10011010100001000101'::VARBIT || ARRAY[B'10001010001100010101011111100101101010111101100011100001110110000001011111',B'0011101100100111111',B'01000000001101110011111111100110110001101001000',B'',B'101000110001010000001100101011111011111010000010111001001011110010000111100010101000010001110001']::VARBIT[])::VARBIT[]::VARBIT[], B'1100100000101100001111010111010110110100010011111010010010111'::VARBIT)::INT8::INT8)::INT8
						),
						(
							array_position(ARRAY['\x27':::BYTES,'\xa6671a40158c04':::BYTES,'\x83':::BYTES]::BYTES[], '\x00':::BYTES::BYTES)::INT8
						),
						((-3343373915984545486):::INT8)
				)
					AS tab_2626 (col_6745)
		)
SELECT
	tab_2627._decimal AS col_6746, e'4\x1b':::STRING AS col_6747, tab_2627._int8 AS col_6748
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2627;

SELECT
	'19 years 6 mons 611 days 24:21:06.862361':::INTERVAL AS col_6749,
	7.756815180042529508E+33:::DECIMAL AS col_6750,
	tab_2628._jsonb AS col_6751
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2628
LIMIT
	100:::INT8;

SELECT 2588454918:::OID AS col_6752 LIMIT 89:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2629
SELECT
	NULL AS col_6753,
	872486919:::INT8 AS col_6754,
	tab_2630._int4 AS col_6755,
	tab_2630._float4 AS col_6756,
	tab_2630._float4 AS col_6757,
	tab_2630._date AS col_6758,
	tab_2630._timestamp AS col_6759,
	'1970-01-06 07:32:15.000276+00:00':::TIMESTAMPTZ AS col_6760,
	'-46 years -6 mons -684 days -18:05:03.596891':::INTERVAL AS col_6761,
	tab_2630._bool AS col_6762,
	10172778.09572653405:::DECIMAL AS col_6763,
	(NULL::JSONB->>('[null, [[], ["b", [], {}], {}, {}, {}], [], {"bar": 0.9921033988724798}]':::JSONB::JSONB#>>NULL::STRING[])::STRING::STRING)::STRING
		AS col_6764,
	'\x98bb181c855d86c6':::BYTES AS col_6765,
	tab_2630._uuid AS col_6766,
	tab_2630._inet AS col_6767,
	tab_2630._jsonb AS col_6768
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2630
WHERE
	false
ORDER BY
	tab_2630._date
LIMIT
	75:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2631
SELECT
	(-7303):::INT8 AS col_6769,
	324082829:::INT8 AS col_6770,
	tab_2632._int4 AS col_6771,
	tab_2632._float8 AS col_6772,
	tab_2632._float4 AS col_6773,
	'1988-07-26':::DATE AS col_6774,
	tab_2632._timestamp AS col_6775,
	'1970-01-05 22:26:25.000084+00:00':::TIMESTAMPTZ AS col_6776,
	tab_2632._interval AS col_6777,
	tab_2632._bool AS col_6778,
	tab_2632._decimal AS col_6779,
	';N8nl':::STRING AS col_6780,
	tab_2632._bytes AS col_6781,
	'ded96021-d8d9-47e2-b71f-4ee351d6700e':::UUID AS col_6782,
	tab_2632._inet AS col_6783,
	tab_2632._jsonb AS col_6784
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2632
LIMIT
	80:::INT8;

WITH
	with_905 (col_6785) AS (SELECT * FROM (VALUES ('1989-09-21':::DATE), (NULL), (NULL)) AS tab_2633 (col_6785)),
	with_906 (col_6786)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-10 00:04:38.000976+00:00':::TIMESTAMP),
						('1970-01-11 16:12:29.000559+00:00':::TIMESTAMP),
						('1970-01-07 06:30:28.000039+00:00':::TIMESTAMP),
						('3000-01-01 00:00:00+00:00':::TIMESTAMP),
						(NULL)
				)
					AS tab_2634 (col_6786)
		)
SELECT
	'1c97a530-b72a-46f0-897b-497f73b6ed94':::UUID AS col_6787,
	NULL AS col_6788,
	(tab_2635._date::DATE + '23 years 1 mon 843 days 22:44:38.723711':::INTERVAL::INTERVAL)::TIMESTAMP AS col_6789,
	'6 years 7 mons 20 days 07:38:33.062093':::INTERVAL AS col_6790,
	'\x58':::BYTES AS col_6791,
	'-Inf':::FLOAT8 AS col_6792,
	tab_2635._timestamptz AS col_6793,
	'1983-12-05':::DATE AS col_6794,
	tab_2635._int2 AS col_6795,
	'630c:1d9a:a5f6:b06d:2241:4b5d:3d83:e822/1':::INET AS col_6796,
	tab_2635._int4 AS col_6797,
	tab_2635._float4 AS col_6798,
	tab_2635._jsonb AS col_6799,
	tab_2635._bool AS col_6800
FROM
	with_905 AS cte_ref_287, defaultdb.public.seed@[0] AS tab_2635
LIMIT
	42:::INT8;

SELECT 2183895045:::OID AS col_6801 LIMIT 49:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2637
SET
	_string = '5':::STRING,
	_jsonb
		= '{"?G&": [[], false], "foobar": {"<P=`O~ioSYU5": {"1Y}5sO5gxw": [{}], "foo": {"Fv/k": [null], "foobar": [true, {}]}}}, "yZ ": []}':::JSONB
ORDER BY
	tab_2637._uuid DESC, tab_2637._timestamptz
LIMIT
	43:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2638
SELECT
	(-30406):::INT8 AS col_6802,
	NULL AS col_6803,
	(-54385726351425504):::INT8 AS col_6804,
	(-0.09202495962381363):::FLOAT8 AS col_6805,
	(-1.949609680096412):::FLOAT8 AS col_6806,
	'1970-12-17':::DATE AS col_6807,
	tab_2639._timestamp AS col_6808,
	'1970-01-07 13:39:15.000741+00:00':::TIMESTAMPTZ AS col_6809,
	'-31 years -1 mons -357 days -24:04:46.657977':::INTERVAL AS col_6810,
	(NOT false) AS col_6811,
	tab_2639._decimal AS col_6812,
	tab_2639._string AS col_6813,
	tab_2639._bytes AS col_6814,
	tab_2639._uuid AS col_6815,
	tab_2639._inet AS col_6816,
	tab_2639._jsonb AS col_6817
FROM
	defaultdb.public.seed@[0] AS tab_2639
WHERE
	true
ORDER BY
	tab_2639._timestamptz DESC, tab_2639._uuid ASC, tab_2639._int8 DESC
LIMIT
	42:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2640
WITH
	with_907 (col_6818)
		AS (
			SELECT
				*
			FROM
				(VALUES (CASE WHEN NULL THEN '_':::STRING ELSE '[':::STRING END), (e'\\':::STRING), ('5':::STRING))
					AS tab_2641 (col_6818)
		)
SELECT
	(-1):::INT8 AS col_6819,
	(
		WITH
			with_908 (col_6820)
				AS (
					SELECT
						*
					FROM
						(
							VALUES
								(0:::OID),
								(815346626:::OID),
								(2113105807:::OID),
								(0:::OID),
								(4129702669:::OID),
								(1590275784:::OID)
						)
							AS tab_2642 (col_6820)
				)
		SELECT
			2098193837:::INT8 AS col_6821
		FROM
			with_908 AS cte_ref_289
		ORDER BY
			cte_ref_289.col_6820, cte_ref_289.col_6820 DESC, cte_ref_289.col_6820 DESC
		LIMIT
			1:::INT8
	)
		AS col_6822,
	(-4309773244190047401):::INT8 AS col_6823,
	(-0.2993606925010681):::FLOAT8 AS col_6824,
	(-0.0821543546575565):::FLOAT8 AS col_6825,
	'1979-01-29':::DATE AS col_6826,
	(NULL::TIMESTAMP - '-37 years -11 mons -39 days -11:20:23.105202':::INTERVAL::INTERVAL)::TIMESTAMP AS col_6827,
	(NULL::TIMETZ + '1977-01-05':::DATE::DATE)::TIMESTAMPTZ AS col_6828,
	'-21 years -6 mons -417 days -14:48:01.467086':::INTERVAL AS col_6829,
	false AS col_6830,
	NULL AS col_6831,
	cte_ref_288.col_6818 AS col_6832,
	'\x698be5892ec4':::BYTES AS col_6833,
	gen_random_uuid()::UUID AS col_6834,
	'77.29.141.23/13':::INET AS col_6835,
	'[[null], "b6p", "b"]':::JSONB AS col_6836
FROM
	with_907 AS cte_ref_288
WHERE
	true
ORDER BY
	cte_ref_288.col_6818;

SELECT
	tab_2646._date AS col_6843, 2858306512793772723:::INT8 AS col_6844, tab_2646._interval AS col_6845
FROM
	defaultdb.public.seed@[0] AS tab_2646
ORDER BY
	tab_2646._bool, tab_2646._uuid DESC
LIMIT
	77:::INT8;

WITH
	with_910 (col_6847, col_6848)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('1970-01-12 01:08:25.000538+00:00':::TIMESTAMP, e'(\x07\x02D%':::STRING:::NAME),
						(
							'1970-01-08 06:40:51.000214+00:00':::TIMESTAMP,
							(SELECT e'i\x13?q>U[>':::STRING:::NAME AS col_6846 LIMIT 1:::INT8)
						),
						('1970-01-06 20:54:04.000464+00:00':::TIMESTAMP, e'\x1fbS':::STRING:::NAME),
						('1970-01-11 08:35:50.000812+00:00':::TIMESTAMP, '':::STRING:::NAME)
				)
					AS tab_2647 (col_6847, col_6848)
		),
	with_911 (col_6849, col_6850)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[392349606:::OID,3412106919:::OID,2377380814:::OID,3231769375:::OID], 2012887363:::OID),
						(ARRAY[2560161264:::OID,2709530565:::OID,506907883:::OID,962802959:::OID], 2559085011:::OID),
						(ARRAY[1918732500:::OID,3836200744:::OID,352779603:::OID], 3396566936:::OID),
						(
							ARRAY[41204482:::OID,1535315019:::OID,1890844331:::OID,2815668667:::OID,3982027478:::OID,574562078:::OID,3398288044:::OID],
							23845609:::OID
						),
						(ARRAY[423355646:::OID,1273213778:::OID,2236217270:::OID,803447261:::OID,408506450:::OID], NULL)
				)
					AS tab_2648 (col_6849, col_6850)
		)
SELECT
	'{"?^*kllCL)VtZ": {"`cY68/2#mPj": {}}, "bar": [[], {}], "foo": [[{"MDEy7C4J eIe": {}, "nh[$]ZE": [], "x,^w@3)": true}, 0.14781825183372385], {"2wk": {}}, [[{}], {}]]}':::JSONB
		AS col_6851,
	1639240252:::OID AS col_6852;

SELECT
	'Sk':::STRING AS col_6853, '\x744b817169':::BYTES AS col_6854
FROM
	defaultdb.public.seed@[0] AS tab_2649
WHERE
	(tab_2649._bool OR true)
ORDER BY
	tab_2649._bool DESC
LIMIT
	9:::INT8;

INSERT INTO defaultdb.public.seed AS tab_2650 DEFAULT VALUES;

DELETE FROM defaultdb.public.seed AS tab_2653 ORDER BY tab_2653._interval DESC LIMIT 13:::INT8;

WITH
	with_915 (col_6896)
		AS (
			SELECT
				*
			FROM
				(VALUES (16396:::INT8), (14810:::INT8), ((-31114):::INT8), ((-17347):::INT8), (15477:::INT8))
					AS tab_2662 (col_6896)
		)
SELECT
	tab_2664._timestamp AS col_6897,
	tab_2664._jsonb AS col_6898,
	tab_2663._float4 AS col_6899,
	tab_2663._string AS col_6900,
	'e2a062c1-046e-46fa-a147-a8af762b1326':::UUID AS col_6901,
	NULL AS col_6902,
	(-10637):::INT8 AS col_6903
FROM
	defaultdb.public.seed@[0] AS tab_2663, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2664;

DELETE FROM defaultdb.public.seed AS tab_2665 ORDER BY tab_2665._decimal ASC, tab_2665._uuid LIMIT 94:::INT8;

UPDATE defaultdb.public.seed AS tab_2666 SET _date = tab_2666._date;

UPDATE defaultdb.public.seed AS tab_2667 SET _float8 = (-0.33981680714280316):::FLOAT8;

UPDATE defaultdb.public.seed AS tab_2668 SET _date = tab_2668._date LIMIT 5:::INT8;

SELECT
	(-760572204):::INT8 AS col_6904, tab_2669._jsonb AS col_6905
FROM
	defaultdb.public.seed@[0] AS tab_2669
LIMIT
	31:::INT8;

WITH
	with_917 (col_6908, col_6909, col_6910)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(ARRAY[]:::OID[], e'P\x12T\x15m&':::STRING, false),
						(
							ARRAY[0:::OID,2941999644:::OID,340462796:::OID,3772238338:::OID,2538123772:::OID],
							e'K\x10':::STRING,
							crdb_internal.is_admin()::BOOL
						),
						(
							ARRAY[3297346683:::OID,4258723770:::OID,0:::OID],
							e'*\'':::STRING,
							EXISTS(
								WITH
									with_916 (col_6906)
										AS (
											SELECT
												*
											FROM
												(VALUES ((-591681084):::INT8), (NULL), (NULL), ((-1110517382):::INT8))
													AS tab_2670 (col_6906)
										)
								SELECT
									tab_2671._string AS col_6907
								FROM
									defaultdb.public.seed@[0] AS tab_2671
								ORDER BY
									tab_2671._float4
								LIMIT
									15:::INT8
							)
						),
						(ARRAY[]:::OID[], '&^P"~9G':::STRING, false),
						(ARRAY[]:::OID[], e'A\rqfdyg':::STRING, NULL),
						(ARRAY[2372477974:::OID,1887714394:::OID,3409526481:::OID,1225696762:::OID], '':::STRING, true)
				)
					AS tab_2672 (col_6908, col_6909, col_6910)
		)
SELECT
	cte_ref_292.col_6909 AS col_6911,
	tab_2673._jsonb AS col_6912,
	tab_2673._timestamptz AS col_6913,
	false AS col_6914,
	'1970-01-11 07:54:42.000046+00:00':::TIMESTAMP AS col_6915,
	ARRAY[796535439:::OID,0:::OID,1219144734:::OID,231928432:::OID,0:::OID,1715008657:::OID,4114753646:::OID,3532873149:::OID]
		AS col_6916,
	tab_2673._decimal AS col_6917,
	tab_2673._date AS col_6918,
	'45.59.254.173/12':::INET AS col_6919,
	tab_2673._int8 AS col_6920,
	tab_2673._interval AS col_6921,
	tab_2673._float4 AS col_6922,
	tab_2673._string AS col_6923,
	0.9626582345265582:::FLOAT8 AS col_6924,
	tab_2673._bytes AS col_6925,
	127:::INT8 AS col_6926,
	'a591ff04-8627-4c99-be1f-dd7f2c02ca88':::UUID AS col_6927,
	NULL AS col_6928,
	tab_2673._int2 AS col_6929
FROM
	with_917 AS cte_ref_292, defaultdb.public.seed@[0] AS tab_2673
LIMIT
	47:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2674 (_int4, _int8, _float4, _float8, _timestamp, _timestamptz, _string, _bytes)
SELECT
	tab_2675._int8 AS col_6930,
	tab_2675._int2 AS col_6931,
	tab_2675._float4 AS col_6932,
	0.28664815334034005:::FLOAT8 AS col_6933,
	NULL AS col_6934,
	'1970-01-08 14:57:49.00027+00:00':::TIMESTAMPTZ AS col_6935,
	'':::STRING AS col_6936,
	'\x44b8':::BYTES AS col_6937
FROM
	defaultdb.public.seed@[0] AS tab_2675
LIMIT
	5:::INT8;

SELECT
	tab_2676._float8 AS col_6938,
	'00000000-0000-0000-0000-000000000000':::UUID AS col_6939,
	tab_2676._inet AS col_6940,
	tab_2676._bytes AS col_6941,
	tab_2676._timestamp AS col_6942,
	NULL AS col_6943,
	(-0.6046303218509521):::FLOAT8 AS col_6944
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2676
LIMIT
	87:::INT8;

SELECT
	tab_2677._jsonb AS col_6945
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2677,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2678
ORDER BY
	tab_2678._float8 DESC
LIMIT
	60:::INT8;

SELECT
	tab_2680._float4 AS col_6946,
	tab_2680._timestamptz AS col_6947,
	'f3c91251-04ec-4f15-ba7b-1743ef0d2fbd':::UUID AS col_6948,
	tab_2679._timestamp AS col_6949,
	(-11067):::INT8 AS col_6950
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2679, defaultdb.public.seed@[0] AS tab_2680
ORDER BY
	tab_2680._bool DESC
LIMIT
	19:::INT8;

WITH
	with_918 (col_6951, col_6952)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(1589239008:::OID, e'\x1c4\x1a':::STRING:::NAME),
						(236914591:::OID, NULL),
						(3778069619:::OID, e'{zC\x1bvh':::STRING:::NAME),
						(0:::OID, NULL),
						(1557513689:::OID, e'\nb0jH':::STRING:::NAME)
				)
					AS tab_2681 (col_6951, col_6952)
		)
SELECT
	count(*) AS col_6953
FROM
	defaultdb.public.seed@[0] AS tab_2682
WHERE
	tab_2682._bool
GROUP BY
	tab_2682._jsonb
HAVING
	inet_contains_or_equals('15.18.151.201':::INET::INET, '1efb:5557:48ba:bc89:c3e5:e3b4:27d9:82db/11':::INET::INET)::BOOL
LIMIT
	91:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2683
SET
	_float4 = (-1.3006808757781982):::FLOAT8,
	_timestamptz
		= CASE WHEN tab_2683._bool THEN tab_2683._timestamptz ELSE '1970-01-09 06:14:14.000916+00:00':::TIMESTAMPTZ END
WHERE
	tab_2683._bool
ORDER BY
	tab_2683._decimal DESC
LIMIT
	77:::INT8;

SELECT
	'null':::JSONB AS col_6954, tab_2684._timestamp AS col_6955
FROM
	defaultdb.public.seed@[0] AS tab_2684
WHERE
	tab_2684._bool
ORDER BY
	tab_2684._bytes ASC, tab_2684._timestamptz ASC, tab_2684._date DESC, tab_2684._bytes DESC, tab_2684._bytes ASC
LIMIT
	14:::INT8;

INSERT INTO defaultdb.public.seed AS tab_2685 DEFAULT VALUES;

INSERT
INTO
	defaultdb.public.seed AS tab_2686
		(_int4, _int8, _float4, _float8, _date, _timestamp, _interval, _bool, _decimal, _string, _bytes, _uuid, _jsonb)
SELECT
	(-154099307):::INT8 AS col_6956,
	2219552827545444817:::INT8 AS col_6957,
	tab_2687._float4 AS col_6958,
	NULL AS col_6959,
	tab_2687._date AS col_6960,
	tab_2687._timestamp AS col_6961,
	'-11 years -4 mons -469 days -12:17:48.169262':::INTERVAL AS col_6962,
	tab_2687._bool AS col_6963,
	tab_2687._decimal AS col_6964,
	tab_2687._string AS col_6965,
	tab_2687._bytes AS col_6966,
	'e8e1d298-a15d-4d82-b7d3-49c2ac72cf0d':::UUID AS col_6967,
	tab_2687._jsonb AS col_6968
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2687
WHERE
	false
LIMIT
	80:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2688
SELECT
	tab_2689._int4 AS col_6969,
	tab_2689._int2 AS col_6970,
	tab_2689._int8 AS col_6971,
	NULL AS col_6972,
	tab_2689._float8 AS col_6973,
	tab_2689._date AS col_6974,
	tab_2689._timestamp AS col_6975,
	'1970-01-11 12:34:31.00027+00:00':::TIMESTAMPTZ AS col_6976,
	tab_2689._interval AS col_6977,
	true AS col_6978,
	(-247639236.9159837500):::DECIMAL AS col_6979,
	tab_2689._string AS col_6980,
	tab_2689._bytes AS col_6981,
	'c130cf3e-c440-44bb-b3df-7d343d986213':::UUID AS col_6982,
	'7cac:a56c:8c98:beec:9eb:6805:6114:283c/115':::INET AS col_6983,
	e'{"foo": {"T*Vd}eGK": {"HF(Aop": {"?,K.ss": {"foo": [], "foobar": true}, "Q\\"}~gF": [], "c-]@&": [{}]}}, "baz": [{"foobar": [{}, [[]]]}]}, "foobar": 0.2143789465766134}':::JSONB
		AS col_6984
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2689
WHERE
	false
LIMIT
	82:::INT8;

SELECT
	tab_2690._int4 AS col_6985,
	convert_from(tab_2691._bytes::BYTES, tab_2691._string::STRING)::STRING AS col_6986,
	(-0.8609171780369935232):::DECIMAL AS col_6987,
	'1970-01-04 19:46:50.000813+00:00':::TIMESTAMPTZ AS col_6988
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2690,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2691
WHERE
	false;

UPDATE defaultdb.public.seed AS tab_2692 SET _interval = tab_2692._interval WHERE true;

UPDATE defaultdb.public.seed AS tab_2694 SET _int4 = tab_2694._int8, _bytes = tab_2694._bytes LIMIT 48:::INT8;

SELECT
	count(*) AS col_6989
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2695
WHERE
	false
GROUP BY
	tab_2695._int8, tab_2695._float8, tab_2695._date
HAVING
	isnan(tab_2695._float8::FLOAT8)::BOOL
LIMIT
	30:::INT8;

SELECT
	count(*) AS col_6990
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2696
GROUP BY
	tab_2696._int8, tab_2696._float8
LIMIT
	18:::INT8;

SELECT
	tab_2697._date AS col_6991, tab_2697._bool AS col_6992
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2697
LIMIT
	25:::INT8;

WITH
	with_919 (col_6993)
		AS (SELECT * FROM (VALUES ('1970-01-02 08:44:15.000046+00:00':::TIMESTAMPTZ)) AS tab_2698 (col_6993)),
	with_920 (col_6994, col_6995, col_6996)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							e'\x1d\x1e,p\f\x14(S':::STRING,
							'{"foobar": [[[[null], [true], {"EX.|9{(=Erv#": {}}, null], {"I+5L<tQ{$MJM": {"xX{#{%F#x#A": []}}, {}, {}]]}':::JSONB,
							'fe1b:df35:c517:5cd7:39b:568:6e20:35dd/124':::INET
						),
						(
							e')\x1b':::STRING,
							'[[null, "foobar", 1.782994414519909, true, "bar", null]]':::JSONB,
							'197.6.15.181/4':::INET
						),
						(
							e'\x17*uh."V-':::STRING,
							e'{"!83S": false, ".H[WPZ%h\'": 0.17867988477777969, "Z3\\"Cg)V8$V=_": true, "b": true}':::JSONB,
							'76.240.109.135/30':::INET
						),
						(
							(json_remove_path(e'{"*ijuT~68R~,": "6\\\\fi", "9xk^}": [], "`m&:iMB": [[], 0.3838487202515703, []], "b": [[[[]], "bar"], ["c"], [], false, {}]}':::JSONB::JSONB, ARRAY[e'W\n\n\x0f<a\x1av':::STRING,e'\x13&\x18#\x7f':::STRING,'_@':::STRING,e'\x00':::STRING]::STRING[])::JSONB::JSONB#>>ARRAY[]:::STRING[]::STRING[])::STRING,
							e'{"DQcNHqIGX": [], "E<k#LBP|t)A": {"a9zJm/": {"\\"p.mg*t/z~+": {"a": {}, "b": true, "c": [2.1547893357815626]}, "c": 0.018327085426361325}}, "T9KC": 1.163216046870147, "baz": {"bar": {}, "foobar": 0.07844679794734066}, "ysL": false}':::JSONB,
							NULL
						)
				)
					AS tab_2699 (col_6994, col_6995, col_6996)
		)
SELECT
	e'{" \'^>NZ;X": {"ULe}": {"4x,:-": {}}, "baz": null, "c": null}, ":|vDmZo(^1": []}':::JSONB AS col_6997,
	'{}':::JSONB AS col_6998
FROM
	defaultdb.public.seed AS tab_2700 JOIN defaultdb.public.seed AS tab_2701 ON (tab_2700._jsonb) = (tab_2701._jsonb)
WHERE
	true
LIMIT
	33:::INT8;

WITH
	with_921 (col_6999) AS (SELECT * FROM (VALUES (3030430107:::OID), (116314980:::OID)) AS tab_2702 (col_6999)),
	with_922 (col_7000)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						((-2441.748789459824460):::DECIMAL), ((-1.234E+401):::DECIMAL), (45468.51715664481809:::DECIMAL)
				)
					AS tab_2703 (col_7000)
		),
	with_923 (col_7001)
		AS (
			SELECT
				*
			FROM
				(VALUES (1506260217:::OID), (1544240792:::OID), (1522172677:::OID), (3197184675:::OID))
					AS tab_2704 (col_7001)
		)
SELECT
	cte_ref_293.col_7001 AS col_7002
FROM
	with_923 AS cte_ref_293
WHERE
	true
LIMIT
	12:::INT8;

UPDATE defaultdb.public.seed AS tab_2705 SET _string = tab_2705._string LIMIT 43:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2706
SET
	_int8 = tab_2706._int2
WHERE
	EXISTS(
		SELECT
			'':::STRING AS col_7003
		FROM
			defaultdb.public.seed AS tab_2707
			JOIN defaultdb.public.seed AS tab_2708 ON (tab_2707._jsonb) = (tab_2708._jsonb)
		WHERE
			true
		LIMIT
			34:::INT8
	)
LIMIT
	32:::INT8;

SELECT
	tab_2709._timestamptz AS col_7004,
	tab_2709._int4 AS col_7005,
	tab_2709._inet AS col_7006,
	0.8347327723708841:::FLOAT8 AS col_7007,
	'\x99':::BYTES AS col_7008,
	(-1.7842152118682861):::FLOAT8 AS col_7009,
	tab_2709._int8 AS col_7010,
	'10 years 11 mons 514 days 03:20:01.428507':::INTERVAL AS col_7011,
	tab_2709._date AS col_7012
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2709
WHERE
	tab_2709._bool
ORDER BY
	tab_2709._bytes ASC
LIMIT
	78:::INT8;

WITH
	with_924 (col_7013, col_7014, col_7015)
		AS (
			SELECT
				*
			FROM
				(VALUES (534082415:::OID, (-0.05875280298789298):::FLOAT8, '\x5353':::BYTES))
					AS tab_2710 (col_7013, col_7014, col_7015)
		),
	with_925 (col_7016, col_7017)
		AS (SELECT * FROM (VALUES (3769819563:::OID, e'\U00002603':::STRING)) AS tab_2711 (col_7016, col_7017))
SELECT
	count(*) AS col_7018
FROM
	defaultdb.public.seed@[0] AS tab_2712
GROUP BY
	tab_2712._jsonb;

SELECT
	tab_2713._date AS col_7019,
	NULL AS col_7020,
	tab_2713._date AS col_7021,
	tab_2714._date AS col_7022,
	'1973-06-12':::DATE AS col_7023,
	tab_2713._date AS col_7024
FROM
	defaultdb.public.seed AS tab_2713 JOIN defaultdb.public.seed AS tab_2714 ON (tab_2713._int8) = (tab_2714._int8)
WHERE
	false
ORDER BY
	tab_2714._date ASC
LIMIT
	95:::INT8;

SELECT
	'-infinity':::DATE AS col_7025,
	tab_2716._date AS col_7026,
	NULL AS col_7027,
	'1980-01-20':::DATE AS col_7028,
	tab_2716._date AS col_7029,
	tab_2716._date AS col_7030
FROM
	defaultdb.public.seed AS tab_2715
	JOIN defaultdb.public.seed AS tab_2716 ON
			(tab_2715._int8) = (tab_2716._int8) AND (tab_2715._float8) = (tab_2716._float8)
LIMIT
	98:::INT8;

SELECT
	'\x2e592479':::BYTES AS col_7031, tab_2718._bool AS col_7032, tab_2717._inet AS col_7033
FROM
	defaultdb.public.seed@[0] AS tab_2717, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2718;

UPDATE defaultdb.public.seed AS tab_2719 SET _bool = tab_2719._bool;

DELETE FROM defaultdb.public.seed AS tab_2720;

UPDATE
	defaultdb.public.seed AS tab_2721
SET
	_uuid = tab_2721._uuid
WHERE
	(false OR tab_2721._bool)
ORDER BY
	tab_2721._uuid ASC, tab_2721._date ASC
LIMIT
	55:::INT8;

WITH
	with_926 (col_7034) AS (SELECT * FROM (VALUES (('p':::STRING,)), (('X;cF3WcM;':::STRING,))) AS tab_2722 (col_7034)),
	with_927 (col_7036)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(792327332:::OID),
						(930400304:::OID),
						(1510465593:::OID),
						((SELECT 2068430310:::OID AS col_7035 LIMIT 1:::INT8))
				)
					AS tab_2723 (col_7036)
		)
SELECT
	tab_2724._string AS col_7037,
	e'[true, null, {"b": [{}], "bar": [{"a": {"P$Xc6N\\"": null}}]}, null, []]':::JSONB AS col_7038,
	tab_2724._timestamp AS col_7039
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2724
WHERE
	true
ORDER BY
	tab_2724._string ASC
LIMIT
	13:::INT8;

SELECT
	'\xdc':::BYTES AS col_7040,
	6.731202170549402735E+23:::DECIMAL AS col_7041,
	tab_2725._uuid AS col_7042,
	tab_2725._date AS col_7043,
	tab_2725._int4 AS col_7044
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2725
WHERE
	tab_2725._bool;

WITH
	with_928 (col_7045) AS (SELECT * FROM (VALUES (ARRAY[9509:::INT8])) AS tab_2726 (col_7045)),
	with_929 (col_7046)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(3873644647:::OID),
						(2240761130:::OID),
						(COALESCE(1182215202:::OID, 0:::OID)),
						(NULL),
						(3942712272:::OID)
				)
					AS tab_2727 (col_7046)
			EXCEPT ALL SELECT * FROM (VALUES (NULL), (2664843985:::OID), (3627726141:::OID)) AS tab_2728 (col_7047)
		),
	with_930 (col_7048)
		AS (
			SELECT
				*
			FROM
				(VALUES ((-2.026530636394368469E+36):::DECIMAL), (1.170944502593782519E+31:::DECIMAL))
					AS tab_2729 (col_7048)
		)
SELECT
	(-556324649967525046.9):::DECIMAL AS col_7049
FROM
	with_930 AS cte_ref_294
LIMIT
	7:::INT8;

SELECT
	current_timestamp():::TIMESTAMP::TIMESTAMP AS col_7050,
	1.8567901900191164:::FLOAT8 AS col_7051,
	tab_2730._bool AS col_7052,
	'\xf6290ce048489c':::BYTES AS col_7053,
	'1970-01-03 00:28:49.000981+00:00':::TIMESTAMP AS col_7054,
	'\x27':::BYTES AS col_7055,
	tab_2731._int8 AS col_7056
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2730, defaultdb.public.seed@[0] AS tab_2731
WHERE
	true
LIMIT
	77:::INT8;

SELECT
	1.1712072279356103:::FLOAT8 AS col_7057,
	3698825059641703854:::INT8 AS col_7058,
	'2ba786d3-9b92-44f5-93b0-5bfa35066439':::UUID AS col_7059,
	'\x28642d':::BYTES AS col_7060,
	tab_2732._float8 AS col_7061,
	tab_2732._string AS col_7062,
	tab_2732._decimal AS col_7063,
	tab_2732._int8 AS col_7064,
	tab_2732._inet AS col_7065,
	'1992-12-13':::DATE AS col_7066,
	tab_2732._interval AS col_7067
FROM
	defaultdb.public.seed@[0] AS tab_2732
WHERE
	(tab_2732._bool OR tab_2732._bool)
LIMIT
	43:::INT8;

SELECT
	'37 years 6 mons 264 days 07:34:22.046116':::INTERVAL AS col_7068,
	'dc814d7f-e0b2-4886-8392-060d8ce028c8':::UUID AS col_7069,
	'9190:370e:3931:ba3f:a92:326a:2d2f:9953/59':::INET AS col_7070
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2733
ORDER BY
	tab_2733._timestamp DESC
LIMIT
	34:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2734
WITH
	with_931 (col_7071)
		AS (
			SELECT
				*
			FROM
				(VALUES ((-81232201):::INT8), (NULL), (1575096949:::INT8), (746732814:::INT8), ((-1277968001):::INT8))
					AS tab_2735 (col_7071)
		)
SELECT
	(-13901):::INT8 AS col_7072,
	967685690:::INT8 AS col_7073,
	tab_2736._int8 AS col_7074,
	tab_2736._float8 AS col_7075,
	extract(tab_2736._string::STRING, tab_2736._date::DATE)::FLOAT8 AS col_7076,
	NULL AS col_7077,
	tab_2736._timestamp AS col_7078,
	tab_2736._timestamptz AS col_7079,
	'00:00:00':::INTERVAL AS col_7080,
	NULL AS col_7081,
	NULL AS col_7082,
	e'\x00':::STRING AS col_7083,
	CASE WHEN tab_2736._bool THEN tab_2736._bytes ELSE '\x499c8b5dfc44138b':::BYTES END AS col_7084,
	NULL AS col_7085,
	tab_2736._inet AS col_7086,
	tab_2736._jsonb AS col_7087
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2736
ORDER BY
	tab_2736._float8 ASC
LIMIT
	98:::INT8;

SELECT
	'1970-01-05 23:01:08.000029+00:00':::TIMESTAMP AS col_7088,
	'{":TwrUgR": {"a": false}, "IKag": false, "a": [{}, []], "foo": [{"b": 0.006336646605621617, "bar": 0.23397377419375354}, [], false]}':::JSONB
		AS col_7089,
	tab_2738._bytes AS col_7090,
	3175909315142518107:::INT8 AS col_7091,
	tab_2737._uuid AS col_7092,
	tab_2737._interval AS col_7093,
	'-6 years -9 mons -922 days -18:36:31.748085':::INTERVAL AS col_7094,
	tab_2737._decimal AS col_7095,
	0.19317741692066193:::FLOAT8 AS col_7096,
	tab_2738._timestamptz AS col_7097,
	tab_2738._bool AS col_7098,
	e'\x1f%\x18IjV':::STRING AS col_7099,
	'11.98.113.30/9':::INET AS col_7100,
	'g':::STRING AS col_7101,
	'8756:ef79:b7cf:f496:720d:177:8417:1524/81':::INET AS col_7102,
	'1970-01-02 13:33:36.000562+00:00':::TIMESTAMP AS col_7103,
	tab_2737._int4 AS col_7104,
	(-18917):::INT8 AS col_7105
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2737
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2738 ON (tab_2737._bool) = (tab_2738._bool)
ORDER BY
	tab_2738._decimal DESC;

WITH
	with_932 (col_7106, col_7107)
		AS (SELECT '04:02:38.379477+12:27:00':::TIMETZ AS col_7106, ARRAY[96404196:::OID,87049182:::OID] AS col_7107),
	with_933 (col_7108) AS (SELECT * FROM (VALUES (NULL), ((-8500007.633437177130):::DECIMAL)) AS tab_2739 (col_7108))
SELECT
	tab_2742._int4 AS col_7109, tab_2742._string AS col_7110
FROM
	defaultdb.public.seed AS tab_2740
	JOIN defaultdb.public.seed AS tab_2741 ON (tab_2740._jsonb) = (tab_2741._jsonb)
	JOIN defaultdb.public.seed@[0] AS tab_2742 ON (tab_2741._jsonb) = (tab_2742._jsonb)
LIMIT
	13:::INT8;

WITH
	with_934 (col_7111)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('-23 years -11 mons -429 days -18:21:32.433003':::INTERVAL),
						('-26 years -5 mons -70 days -10:07:49.620277':::INTERVAL),
						('60 years 11 mons 566 days 04:39:07.604301':::INTERVAL),
						('-37 years -9 mons -349 days -09:01:27.454086':::INTERVAL),
						('-51 years -5 mons -594 days -01:24:20.986795':::INTERVAL),
						('30 years 4 mons 427 days 14:23:45.415296':::INTERVAL)
				)
					AS tab_2743 (col_7111)
			UNION ALL
				SELECT
					*
				FROM
					(
						VALUES
							('16 years 6 mons 931 days 22:11:56.310393':::INTERVAL),
							('-7 years -10 mons -308 days -19:59:48.044488':::INTERVAL),
							('-12 years -9 mons -606 days -24:08:03.988129':::INTERVAL),
							(NULL),
							('00:00:00':::INTERVAL),
							('-53 years -2 mons -981 days -07:00:41.787264':::INTERVAL)
					)
						AS tab_2744 (col_7112)
		),
	with_935 (col_7113)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('".)8w4s2h%2"':::JSONB),
						('{",HA!": [[[]]], "Z2l$1}Ac.dC": {}, "foobar": [[{}], [], [{}], false]}':::JSONB)
				)
					AS tab_2745 (col_7113)
		),
	with_936 (col_7114) AS (SELECT DISTINCT B'101000' AS col_7114 FROM defaultdb.public.seed@[0] AS tab_2746)
SELECT
	tab_2747._date AS col_7115,
	abs(tab_2747._decimal::DECIMAL)::DECIMAL AS col_7116,
	tab_2747._string AS col_7117,
	'1970-01-02 04:52:12.000825+00:00':::TIMESTAMPTZ AS col_7118,
	tab_2747._float8 AS col_7119
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2747,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2748
WHERE
	true
LIMIT
	87:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2749
SELECT
	tab_2752._int8 AS col_7120,
	tab_2752._int2 AS col_7121,
	tab_2752._int2 AS col_7122,
	tab_2751._float8 AS col_7123,
	tab_2752._float4 AS col_7124,
	NULL AS col_7125,
	tab_2750._timestamp AS col_7126,
	tab_2750._timestamptz AS col_7127,
	tab_2750._interval AS col_7128,
	tab_2752._bool AS col_7129,
	5.930911800467026010E+22:::DECIMAL AS col_7130,
	(tab_2752._jsonb::JSONB->>tab_2751._int2::INT8)::STRING AS col_7131,
	tab_2752._bytes AS col_7132,
	NULL AS col_7133,
	'6f35:ed4:69c4:8bec:b5fa:7003:ba1:4a3f/49':::INET AS col_7134,
	'[[{"E_l": [], "bar": {"bar": "xB2>5)_+", "foo": [1.8717975420508415]}, "foobar": [{}, "#3NjB<]Sq+xP"]}, [false, 2.866511075341183], {}, []], []]':::JSONB
		AS col_7135
FROM
	defaultdb.public.seed@[0] AS tab_2750
	JOIN defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2751
		JOIN defaultdb.public.seed@[0] AS tab_2752 ON (tab_2751._int4) = (tab_2752._int8) ON
			(tab_2750._int4) = (tab_2752._int8)
WHERE
	tab_2752._bool
ORDER BY
	tab_2751._interval ASC, tab_2752._float8 ASC, tab_2752._int2
LIMIT
	63:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2753
WITH
	with_937 (col_7136, col_7137)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('21:31:19.630007':::TIME, ARRAY[1:::INT8,30571:::INT8,(-20901):::INT8,(-26948):::INT8]),
						('18:04:47.923325':::TIME, ARRAY[]:::INT2[]),
						('18:32:17.516461':::TIME, COALESCE(ARRAY[(-19196):::INT8,2635:::INT8], NULL))
				)
					AS tab_2754 (col_7136, col_7137)
		),
	with_938 (col_7139)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(NOT ('48 years 4 mons 517 days 17:53:45.46413':::INTERVAL::INTERVAL NOT IN (SELECT tab_2755._interval::INTERVAL AS col_7138 FROM defaultdb.public.seed@[0] AS tab_2755 WHERE false LIMIT 70:::INT8)))
						),
						(NULL)
				)
					AS tab_2756 (col_7139)
		)
SELECT
	(-1):::INT8 AS col_7140,
	(-509820904):::INT8 AS col_7141,
	tab_2757._int8 AS col_7142,
	(-0.949954628944397):::FLOAT8 AS col_7143,
	0.3993989591384889:::FLOAT8 AS col_7144,
	tab_2757._date AS col_7145,
	tab_2757._timestamp AS col_7146,
	tab_2757._timestamptz AS col_7147,
	tab_2757._interval AS col_7148,
	true AS col_7149,
	(-21610471023595.71404):::DECIMAL AS col_7150,
	e't]@H+\x12\x12':::STRING AS col_7151,
	tab_2757._bytes AS col_7152,
	tab_2757._uuid AS col_7153,
	NULL AS col_7154,
	tab_2757._jsonb AS col_7155
FROM
	defaultdb.public.seed@[0] AS tab_2757
LIMIT
	68:::INT8;

INSERT INTO defaultdb.public.seed AS tab_2758 DEFAULT VALUES;

SELECT
	(-0.47850821149639344):::FLOAT8 AS col_7156,
	exp(0:::DECIMAL::DECIMAL)::DECIMAL AS col_7157,
	tab_2759._bytes AS col_7158,
	0:::INT8 AS col_7159,
	tab_2759._int8 AS col_7160,
	(-0.9362964630126953):::FLOAT8 AS col_7161,
	tab_2759._date AS col_7162,
	'bec4:6b1d:c9f0:c21a:8594:1474:cee9:806b/59':::INET AS col_7163,
	'e562155f-98b1-47bf-9883-0c7570b2ea7f':::UUID AS col_7164,
	'-69 years -6 mons -72 days -20:11:45.092628':::INTERVAL AS col_7165
FROM
	defaultdb.public.seed@[0] AS tab_2759
WHERE
	false
LIMIT
	41:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2760
SET
	_inet = '45f7:4913:6372:7596:fd1f:30dc:8c4c:5943/48':::INET
ORDER BY
	tab_2760._uuid ASC
LIMIT
	65:::INT8;

WITH
	with_939 (col_7166)
		AS (SELECT * FROM (VALUES (e'\x02aTD':::STRING), (e'%5B\x03}':::STRING)) AS tab_2761 (col_7166)),
	with_941 (col_7169)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(NULL),
						(3155586527:::OID),
						(
							(
								WITH
									with_940 (col_7167)
										AS (
											SELECT
												*
											FROM
												(
													VALUES
														(
															ARRAY[1600248315:::OID,880910287:::OID,3898081395:::OID,0:::OID]
														),
														(ARRAY[3453694871:::OID,2224768066:::OID,614166067:::OID]),
														(ARRAY[1488626084:::OID,2639093618:::OID]),
														(ARRAY[146305354:::OID,2684911997:::OID,3899621026:::OID])
												)
													AS tab_2762 (col_7167)
										)
								SELECT
									183331883:::OID AS col_7168
								LIMIT
									1:::INT8
							)
						),
						(2975344830:::OID)
				)
					AS tab_2763 (col_7169)
		),
	with_942 (col_7170)
		AS (
			SELECT
				*
			FROM
				(VALUES (B'0000000010000010011100110001001'), (B'1111000111101110110011110110101'))
					AS tab_2764 (col_7170)
		)
SELECT
	B'1000101100000111110100100100010' AS col_7171
FROM
	with_942 AS cte_ref_295
LIMIT
	92:::INT8;

WITH
	with_943 (col_7172, col_7173)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('O>':::STRING, 'r&':::STRING),
						(e'\x00':::STRING, e'5uv\x02O\f':::STRING),
						(e'q\x15':::STRING, 'yT':::STRING),
						(NULL, COALESCE(NULL, e'[1\'RM':::STRING)),
						(e'[\x1de~':::STRING, e'\x04[L\f':::STRING),
						(e'\fC.\\h\x13h\x03':::STRING, e'^:\x0eJvw':::STRING)
				)
					AS tab_2765 (col_7172, col_7173)
		)
SELECT
	cte_ref_296.col_7173 AS col_7174, e'\x1bW:S\x13':::STRING AS col_7175
FROM
	with_943 AS cte_ref_296
WHERE
	true
ORDER BY
	cte_ref_296.col_7172 ASC, cte_ref_296.col_7172 DESC, cte_ref_296.col_7173 DESC
LIMIT
	41:::INT8;

WITH
	with_944 (col_7176)
		AS (SELECT * FROM (VALUES ('eo':::STRING), (NULL), (NULL), ('v7e':::STRING)) AS tab_2766 (col_7176)),
	with_945 (col_7177)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(((-6970456819686740417):::INT8::INT8 - (-2941678680721610271):::INT8::INT8)::INT8),
						(NULL),
						(NULL),
						(NULL),
						(NULL)
				)
					AS tab_2767 (col_7177)
		)
SELECT
	'1970-01-11 20:42:06.00097+00:00':::TIMESTAMPTZ AS col_7178,
	tab_2768._string AS col_7179,
	tab_2768._decimal AS col_7180,
	tab_2768._uuid AS col_7181,
	NULL AS col_7182,
	'28 years 11 mons 79 days 05:49:51.501473':::INTERVAL AS col_7183,
	NULL AS col_7184
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2768
WHERE
	tab_2768._bool
LIMIT
	11:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2769
SELECT
	20184:::INT8 AS col_7185,
	NULL AS col_7186,
	tab_2770._int8 AS col_7187,
	tab_2770._float8 AS col_7188,
	tab_2770._float4 AS col_7189,
	'1981-02-17':::DATE AS col_7190,
	'1970-01-07 15:35:32.000622+00:00':::TIMESTAMP AS col_7191,
	('75 years 6 mons 205 days 12:44:56.273707':::INTERVAL::INTERVAL + '3000-01-01 00:00:00+00:00':::TIMESTAMPTZ::TIMESTAMPTZ)::TIMESTAMPTZ
		AS col_7192,
	'-31 years -8 mons -813 days -20:08:11.047302':::INTERVAL AS col_7193,
	tab_2770._bool AS col_7194,
	450.3853967552652476:::DECIMAL AS col_7195,
	tab_2770._string AS col_7196,
	tab_2770._bytes AS col_7197,
	tab_2770._uuid AS col_7198,
	tab_2770._inet AS col_7199,
	tab_2770._jsonb AS col_7200
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2770
WHERE
	(true AND tab_2770._bool);

SELECT
	min(tab_2771._date::DATE)::DATE AS col_7201,
	sqrdiff(tab_2771._float8::FLOAT8)::FLOAT8 AS col_7202,
	xor_agg(tab_2771._int8::INT8) OVER (PARTITION BY tab_2771._decimal ORDER BY tab_2771._jsonb ASC)::INT8 AS col_7203,
	json_agg(tab_2771._decimal)::JSONB AS col_7204,
	avg(tab_2771._decimal::DECIMAL)::DECIMAL AS col_7205,
	concat_agg(tab_2771._bytes::BYTES)::BYTES AS col_7206
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2771
GROUP BY
	tab_2771._bytes, tab_2771._int8, tab_2771._decimal, tab_2771._date, tab_2771._jsonb, tab_2771._float8
LIMIT
	98:::INT8;

UPDATE defaultdb.public.seed AS tab_2772 SET _string = e'Pi\n \x10\x1d':::STRING, _uuid = tab_2772._uuid LIMIT 79:::INT8;

SELECT
	'1970-01-03 16:36:44.000538+00:00':::TIMESTAMPTZ AS col_7207,
	tab_2774._bytes AS col_7208,
	NULL AS col_7209,
	tab_2776._float4 AS col_7210,
	tab_2773._float4 AS col_7211,
	NULL AS col_7212,
	tab_2773._interval AS col_7213,
	tab_2776._timestamp AS col_7214,
	'-16 years -11 mons -475 days -08:03:38.514058':::INTERVAL AS col_7215
FROM
	defaultdb.public.seed@[0] AS tab_2773,
	defaultdb.public.seed@[0] AS tab_2774,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2775,
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2776
LIMIT
	37:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2778
WITH
	with_946 (col_7222)
		AS (
			SELECT
				*
			FROM
				(VALUES ((-3787594571608953496):::INT8), ((-7835334567450466731):::INT8)) AS tab_2779 (col_7222)
			EXCEPT SELECT * FROM (VALUES ((-9223372036854775807):::INT8)) AS tab_2780 (col_7223)
		),
	with_947 (col_7224)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(date_trunc('8tap':::STRING::STRING, '02:42:00.0731':::TIME::TIME)::INTERVAL::INTERVAL + '1972-10-31':::DATE::DATE)::TIMESTAMP
						),
						('1970-01-12 02:53:08.000161+00:00':::TIMESTAMP)
				)
					AS tab_2781 (col_7224)
		)
SELECT
	tab_2782._int4 AS col_7225,
	tab_2782._int2 AS col_7226,
	tab_2782._int4 AS col_7227,
	tab_2783._float8 AS col_7228,
	tab_2782._float4 AS col_7229,
	tab_2783._date AS col_7230,
	tab_2783._timestamp AS col_7231,
	'1970-01-06 10:17:50.000202+00:00':::TIMESTAMPTZ AS col_7232,
	date_trunc(tab_2782._string::STRING, '02:40:01.282627':::TIME::TIME)::INTERVAL AS col_7233,
	false AS col_7234,
	6.620440430344066199E+30:::DECIMAL AS col_7235,
	'"':::STRING AS col_7236,
	tab_2782._bytes AS col_7237,
	NULL AS col_7238,
	hostmask(('8.85.213.231/3':::INET::INET & tab_2782._inet::INET)::INET::INET)::INET AS col_7239,
	tab_2782._jsonb AS col_7240
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2782
	JOIN defaultdb.public.seed@[0] AS tab_2783 ON (tab_2782._int8) = (tab_2783._int8)
LIMIT
	23:::INT8;

WITH
	with_948 (col_7241)
		AS (
			SELECT * FROM (VALUES (e'\x02\x7f!\x0eo,2)d':::STRING), (e'\x18\x02z~Q9':::STRING)) AS tab_2784 (col_7241)
			INTERSECT ALL
				SELECT * FROM (VALUES (NULL)) AS tab_2785 (col_7242)
				UNION ALL
					SELECT
						tab_2786._string AS col_7243
					FROM
						defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2786,
						[
							UPDATE
								defaultdb.public.seed AS tab_2787
							SET
								_int8 = (-8284484535715925764):::INT8
							RETURNING
								NULL AS ret_14
						]
		),
	with_949 (col_7244) AS (SELECT * FROM (VALUES ((-18532):::INT8), (NULL)) AS tab_2788 (col_7244)),
	with_950 (col_7245)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						('10bbd4a6-e3c6-4596-a872-5fe9c1e72dd5':::UUID), ('6d3e57e7-df0d-499b-89b7-717f4d0fb99f':::UUID)
				)
					AS tab_2789 (col_7245)
		)
SELECT
	count(*) AS col_7246
FROM
	defaultdb.public.seed@[0] AS tab_2790
GROUP BY
	tab_2790._jsonb
HAVING
	isnan((-1.762918681946930135E+25):::DECIMAL::DECIMAL)::BOOL
LIMIT
	51:::INT8;

WITH
	with_951 (col_7247)
		AS (SELECT * FROM (VALUES ('37c56c36-cf74-4fc9-ae9a-ad2e4198e149':::UUID)) AS tab_2791 (col_7247)),
	with_952 (col_7248)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(COALESCE('16:44:57.512728':::TIME, '23:59:59.999999':::TIME)),
						('07:36:49.312481':::TIME),
						('00:23:59.187873':::TIME),
						(NULL),
						(NULL),
						('13:18:30.196857':::TIME)
				)
					AS tab_2792 (col_7248)
		)
SELECT
	count(*) AS col_7249
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2793
GROUP BY
	tab_2793._int8, tab_2793._float8
HAVING
	isnan((-0.42843698316183376):::FLOAT8::FLOAT8)::BOOL
LIMIT
	12:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2794
SELECT
	20:::INT8 AS col_7250,
	(-1408290533):::INT8 AS col_7251,
	(-7197372095291498373):::INT8 AS col_7252,
	0.5146108269691467:::FLOAT8 AS col_7253,
	CASE
	WHEN true THEN 0.3774179794137167:::FLOAT8
	ELSE extract('X':::STRING::STRING, CASE WHEN true THEN '1970-01-12 13:04:20.000273+00:00':::TIMESTAMP ELSE '1970-01-10 21:58:25.000419+00:00':::TIMESTAMP END::TIMESTAMP)::FLOAT8
	END
		AS col_7254,
	NULL AS col_7255,
	NULL AS col_7256,
	NULL AS col_7257,
	(NULL::TIME - '16:22:21.038478':::TIME::TIME)::INTERVAL AS col_7258,
	(('d54b:90c4:cb24:8742:d9df:aad1:f885:6a58':::INET::INET NOT IN (NULL, NULL)) AND true) AS col_7259,
	7.72736777083254648E+25:::DECIMAL AS col_7260,
	e'\x1c':::STRING AS col_7261,
	'\xd032950d6ed701':::BYTES AS col_7262,
	'a7fd259c-83ef-4a6f-bdea-ee94aa4eecce':::UUID AS col_7263,
	CASE
	WHEN true THEN '764b:e54b:d4a3:d40d:c76:c251:36c3:9336/117':::INET
	ELSE 'd31c:50cb:a769:faef:7db8:2e60:787c:fc90/97':::INET
	END
		AS col_7264,
	'false':::JSONB AS col_7265
LIMIT
	93:::INT8;

SELECT 1408443537:::OID AS col_7266 LIMIT 86:::INT8;

SELECT
	count(*) AS col_7267
FROM
	defaultdb.public.seed@[0] AS tab_2795
WHERE
	NULL::OID NOT IN (2104305005:::OID, 1980655453:::OID, 2599722633:::OID)
GROUP BY
	tab_2795._int8
HAVING
	isnan((-4.649291583170211249E+30):::DECIMAL::DECIMAL)::BOOL
ORDER BY
	tab_2795._int8 DESC
LIMIT
	31:::INT8;

UPDATE
	defaultdb.public.seed AS tab_2796
SET
	_decimal = tab_2796._decimal, _inet = tab_2796._inet
WHERE
	false
ORDER BY
	tab_2796._interval ASC
LIMIT
	61:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2797 (_int4, _float4, _float8, _date, _timestamptz, _interval, _decimal)
SELECT
	tab_2798._int8 AS col_7268,
	tab_2798._float8 AS col_7269,
	NULL AS col_7270,
	tab_2798._date AS col_7271,
	NULL AS col_7272,
	tab_2798._interval AS col_7273,
	tab_2798._decimal AS col_7274
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2798
WHERE
	false
ORDER BY
	tab_2798._int8 DESC, tab_2798._int8 DESC
LIMIT
	11:::INT8;

INSERT
INTO
	defaultdb.public.seed AS tab_2800 (_int2, _float4, _float8, _date, _string, _jsonb)
SELECT
	1717:::INT8 AS col_7277,
	tab_2803._float4 AS col_7278,
	tab_2801._float8 AS col_7279,
	tab_2802._date AS col_7280,
	tab_2803._string AS col_7281,
	tab_2803._jsonb AS col_7282
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2801,
	defaultdb.public.seed@[0] AS tab_2802,
	defaultdb.public.seed@[0] AS tab_2803
LIMIT
	22:::INT8;

WITH
	with_953 (col_7283) AS (SELECT * FROM (VALUES (4108507440:::OID)) AS tab_2804 (col_7283)),
	with_954 (col_7284, col_7285)
		AS (
			SELECT
				*
			FROM
				(
					VALUES
						(
							(ARRAY[B'01110000'], B'0010000101001110011', '09:48:43.147506+05:07:00':::TIMETZ),
							'\x9c83c5c36682826b04':::BYTES
						)
				)
					AS tab_2805 (col_7284, col_7285)
		)
SELECT
	string_agg(cte_ref_297.col_7285::BYTES, cte_ref_297.col_7285::BYTES)::BYTES AS col_7286,
	cte_ref_297.col_7284 AS col_7287
FROM
	with_954 AS cte_ref_297
WHERE
	true
GROUP BY
	cte_ref_297.col_7285, cte_ref_297.col_7284
HAVING
	inet_same_family(NULL::INET, '136.6.0.75/20':::INET::INET)::BOOL
ORDER BY
	cte_ref_297.col_7285 ASC, cte_ref_297.col_7284 DESC
LIMIT
	26:::INT8;

SELECT
	'\xe4de3f7be5618b46':::BYTES AS col_7288,
	'ffffffff-ffff-ffff-ffff-ffffffffffff':::UUID AS col_7289,
	true AS col_7290,
	tab_2806._float4 AS col_7291,
	tab_2806._date AS col_7292
FROM
	defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2806
ORDER BY
	tab_2806._uuid;

SELECT
	0.21491682281945174:::FLOAT8 AS col_7293,
	(tab_2808._int8::INT8 * '51 years 519 days 13:33:35.187142':::INTERVAL::INTERVAL)::INTERVAL AS col_7294,
	'1970-01-01 17:16:20.000579+00:00':::TIMESTAMP AS col_7295,
	3392192127728720.484:::DECIMAL AS col_7296,
	tab_2807._timestamptz AS col_7297,
	tab_2808._bool AS col_7298,
	tab_2807._int4 AS col_7299
FROM
	defaultdb.public.seed@[0] AS tab_2807, defaultdb.public.seed@seed__int8__float8__date_idx AS tab_2808
WHERE
	true
LIMIT
	76:::INT8;

