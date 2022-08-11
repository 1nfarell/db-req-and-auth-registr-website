--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    groups_id integer NOT NULL,
    name_group character varying(128) NOT NULL,
    amount_alpinist integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    location_id integer NOT NULL,
    counry character varying(128) NOT NULL,
    region character varying(128) NOT NULL
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member (
    member_id integer NOT NULL,
    alpinist_name character varying(128) NOT NULL,
    home_address character varying(128) NOT NULL,
    fk_groups_id integer
);


ALTER TABLE public.member OWNER TO postgres;

--
-- Name: mountai_climbing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mountai_climbing (
    mountain_climbing_id integer NOT NULL,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone,
    fk_groups_id integer NOT NULL,
    fk_mountains_id integer NOT NULL
);


ALTER TABLE public.mountai_climbing OWNER TO postgres;

--
-- Name: mountains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mountains (
    mountains_id integer NOT NULL,
    mountain character varying(128) NOT NULL,
    heist integer NOT NULL,
    fk_location_id integer DEFAULT 0
);


ALTER TABLE public.mountains OWNER TO postgres;

--
-- Name: tablename_colname_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tablename_colname_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tablename_colname_seq OWNER TO postgres;

--
-- Name: tablename_colname_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tablename_colname_seq OWNED BY public.mountains.mountains_id;


--
-- Name: tablename_colname_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tablename_colname_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tablename_colname_seq1 OWNER TO postgres;

--
-- Name: tablename_colname_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tablename_colname_seq1 OWNED BY public.member.member_id;


--
-- Name: tablename_colname_seq2; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tablename_colname_seq2
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tablename_colname_seq2 OWNER TO postgres;

--
-- Name: tablename_colname_seq2; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tablename_colname_seq2 OWNED BY public.groups.groups_id;


--
-- Name: tablename_colname_seq3; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tablename_colname_seq3
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tablename_colname_seq3 OWNER TO postgres;

--
-- Name: tablename_colname_seq3; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tablename_colname_seq3 OWNED BY public.mountai_climbing.mountain_climbing_id;


--
-- Name: groups groups_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN groups_id SET DEFAULT nextval('public.tablename_colname_seq2'::regclass);


--
-- Name: member member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member ALTER COLUMN member_id SET DEFAULT nextval('public.tablename_colname_seq1'::regclass);


--
-- Name: mountai_climbing mountain_climbing_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountai_climbing ALTER COLUMN mountain_climbing_id SET DEFAULT nextval('public.tablename_colname_seq3'::regclass);


--
-- Name: mountains mountains_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountains ALTER COLUMN mountains_id SET DEFAULT nextval('public.tablename_colname_seq'::regclass);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (groups_id, name_group, amount_alpinist) FROM stdin;
1	Вороны	2
3	Медведи	3
5	Стервятники	0
6	Вороны	1
7	Соколы	0
9	Куропатки	1
10	Дятлы	1
2	Кроты	2
8	Соловьи	1
49	Львы	0
4	Ласточки	2
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location (location_id, counry, region) FROM stdin;
1	Суринам	737 Moore Pike North Mike AL1 1SZ
2	Перу	5 Miller Extensions Leeville DE15 9DU
3	Парагвай	0 Ken Point Donnahaven AL5 1SZ
4	Чили	579 Zoe Dale Ellieshire TR19 6DX
5	Венесуэла	Flat 15l Quentin Greens Timville TF4 2JW
6	Колумбия	7 Mitchell Villages Marshallbury TR19 6DX
7	Палестина	989 Lee Forge Lake Charlieview WR2 4HQ
8	Иран	152 Harrison Mill Lewisberg TD8 6PQ
9	Швейцария	4 Philip Walk West Craigland LU7 4SW
10	Швеция	99 Scott Oval Florencemouth DY5 3EH
\.


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.member (member_id, alpinist_name, home_address, fk_groups_id) FROM stdin;
1	Иванов Даниил Викторович	888B Thompson Pocket Neomabury, ACT 7405	2
2	Новиков Аполлон Еремеевич	Level 9 676 Powlowski Entrance New Rigoberto, QLD 2650	4
3	Савельев Аскольд Филатович	73 Colten Junction Bergeborough, WA 2920	1
4	Назаров Парамон Андреевич	Level 8 37 Emard Cross Jaskolskibury, SA 5976	3
5	Туров Валерий Витальевич	5B Ziemann Towers Gradyfort, SA 8559	9
6	Казаков Архип Платонович	Suite 884 71 Clifford Quay New Adelineshire, WA 2637	8
7	Петухов Аверкий Иосифович	Level 4 1 Chaim Riverway Nilsfort, ACT 2795	5
8	Козлов Дональд Егорович	5D Kyla Foreshore Port Yessenia, TAS 2619	7
9	Воронов Иосиф Германнович	4 / 8 Vicente Highway Blandaborough, SA 2425	6
10	Моисеев Агафон Егорович	29D Randi Corso Loganville, QLD 2653	10
13	Козлов Петр	Революции 23	2
14	Кукареков Максим	Садовая 123	8
15	Кука Макс	Садовая 23	4
\.


--
-- Data for Name: mountai_climbing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mountai_climbing (mountain_climbing_id, start_time, finish_time, fk_groups_id, fk_mountains_id) FROM stdin;
11	2011-04-04 19:14:20	2011-05-04 19:14:20	4	4
12	2013-01-04 19:14:20	2013-02-04 19:14:20	2	3
13	2015-10-04 19:14:20	2015-11-04 19:14:20	1	3
14	2010-07-04 19:14:20	2010-08-04 19:14:20	5	2
15	2012-09-04 19:14:20	2012-10-04 19:14:20	6	1
16	2014-12-04 19:14:20	2015-01-04 19:14:20	3	5
17	2017-02-04 19:14:20	2017-03-04 19:14:20	3	6
18	2017-04-04 19:14:20	2017-05-04 19:14:20	2	9
19	2014-08-04 19:14:20	2014-09-04 19:14:20	1	6
20	2008-12-04 19:14:20	2009-01-04 19:14:20	8	5
1	2011-06-04 19:14:20	2011-07-04 19:14:20	3	1
2	2013-07-04 19:14:20	2013-08-04 19:14:20	2	4
3	2015-03-04 19:14:20	2015-04-04 19:14:20	5	3
4	2010-02-04 19:14:20	2010-03-04 19:14:20	6	2
5	2012-01-04 19:14:20	2012-02-04 19:14:20	1	5
6	2014-06-04 19:14:20	2014-07-04 19:14:20	4	6
7	2017-08-04 19:14:20	2017-09-04 19:14:20	7	9
8	2017-11-04 19:14:20	2017-12-04 19:14:20	10	8
9	2014-09-04 19:14:20	2014-10-04 19:14:20	9	7
10	2009-12-04 19:14:20	2010-01-04 19:14:20	8	10
25	2022-08-05 17:36:20	\N	49	3
\.


--
-- Data for Name: mountains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mountains (mountains_id, mountain, heist, fk_location_id) FROM stdin;
4	Нгади-Чули	8034	4
5	Гашербрум I	8051	7
6	Чо-Ойю	7893	6
7	Манаслу	7871	8
8	Дастогхил	7823	10
9	Шишабангма	7703	9
10	Момхиль Шар	7200	5
11	Новая вершина	5780	10
1	Лхоцзе	8485	2
2	Броуд-Пик	8516	3
3	Джомолунгма	8188	1
12	Новая вершина2	5770	10
\.


--
-- Name: tablename_colname_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tablename_colname_seq', 12, true);


--
-- Name: tablename_colname_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tablename_colname_seq1', 15, true);


--
-- Name: tablename_colname_seq2; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tablename_colname_seq2', 49, true);


--
-- Name: tablename_colname_seq3; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tablename_colname_seq3', 25, true);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (groups_id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);


--
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (member_id);


--
-- Name: mountai_climbing mountai_climbing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountai_climbing
    ADD CONSTRAINT mountai_climbing_pkey PRIMARY KEY (mountain_climbing_id);


--
-- Name: mountains mountains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountains
    ADD CONSTRAINT mountains_pkey PRIMARY KEY (mountains_id);


--
-- Name: mountai_climbing fk_groups_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountai_climbing
    ADD CONSTRAINT fk_groups_id FOREIGN KEY (fk_groups_id) REFERENCES public.groups(groups_id) MATCH FULL;


--
-- Name: member fk_groups_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT fk_groups_id FOREIGN KEY (fk_groups_id) REFERENCES public.groups(groups_id);


--
-- Name: mountains fk_location_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountains
    ADD CONSTRAINT fk_location_id FOREIGN KEY (fk_location_id) REFERENCES public.location(location_id);


--
-- Name: mountai_climbing fk_mountains_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountai_climbing
    ADD CONSTRAINT fk_mountains_id FOREIGN KEY (fk_mountains_id) REFERENCES public.mountains(mountains_id) MATCH FULL;


--
-- Name: mountai_climbing mountai_climbing_fk_groups_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountai_climbing
    ADD CONSTRAINT mountai_climbing_fk_groups_id_fkey FOREIGN KEY (fk_groups_id) REFERENCES public.groups(groups_id);


--
-- Name: mountai_climbing mountai_climbing_fk_mountains_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountai_climbing
    ADD CONSTRAINT mountai_climbing_fk_mountains_id_fkey FOREIGN KEY (fk_mountains_id) REFERENCES public.mountains(mountains_id);


--
-- PostgreSQL database dump complete
--

