--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.11
-- Dumped by pg_dump version 9.1.11
-- Started on 2014-02-08 10:03:20 AST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = ims, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 204 (class 1259 OID 16541)
-- Dependencies: 11
-- Name: process_relations; Type: TABLE; Schema: ims; Owner: stilgar; Tablespace: 
--

--
-- TOC entry 2209 (class 0 OID 16541)
-- Dependencies: 204 2210
-- Data for Name: process_relations; Type: TABLE DATA; Schema: ims; Owner: stilgar
--
DELETE FROM ims.process_relations;
COPY process_relations (type, id, parent_id, date_creation, user_id, country, company, location) FROM stdin;
p	2	2	2013-11-05 17:57:15	0	0001	0001	0008
p	20	3	2013-11-06 10:08:16	0	0001	0001	0008
p	12	3	2013-11-06 10:09:04	0	0001	0001	0008
p	18	3	2013-11-06 10:11:35	0	0001	0001	0008
p	17	3	2013-11-06 10:40:48	0	0001	0001	0008
p	10	1	2013-11-06 12:47:58	0	0001	0001	0008
p	5	1	2013-11-06 12:47:58	0	0001	0001	0008
p	16	1	2013-11-06 12:48:07	0	0001	0001	0008
p	14	1	2013-11-06 12:48:07	0	0001	0001	0008
p	1	3	2013-11-06 12:49:00	0	0001	0001	0008
p	3	3	2013-11-06 12:49:00	0	0001	0001	0008
p	4	3	2013-11-06 12:49:00	0	0001	0001	0008
p	8	3	2013-11-06 12:49:00	0	0001	0001	0008
p	9	3	2013-11-06 12:49:00	0	0001	0001	0008
p	13	3	2013-11-06 12:49:00	0	0001	0001	0008
p	15	2	2013-11-15 17:42:32	2	0001	0001	0008
p	11	2	2013-11-15 18:07:08	2	0001	0001	0008
p	7	2	2013-11-15 18:08:21	2	0001	0001	0008
p	6	2	2013-11-15 18:12:10	2	0001	0001	0008
p	19	1	2014-01-28 20:42:49	2	0001	0001	0008
p	19	1	2014-01-28 20:45:37	2	0002	0002	0002
p	5	1	2014-01-28 20:45:37	2	0002	0002	0002
p	11	2	2014-01-28 20:45:59	2	0002	0002	0002
p	15	2	2014-01-28 20:45:59	2	0002	0002	0002
p	6	2	2014-01-28 20:45:59	2	0002	0002	0002
p	17	3	2014-01-28 20:46:07	2	0002	0002	0002
p	19	1	2014-01-28 20:46:18	2	0002	0002	0003
p	2	2	2014-01-28 20:46:23	2	0002	0002	0003
p	9	3	2014-01-28 20:46:28	2	0002	0002	0003
s	55	9	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	25	15	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	7	2	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	10	20	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	13	15	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	66	9	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	38	13	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	49	13	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	68	10	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	60	16	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	61	16	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	71	11	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	8	1	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	16	15	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	3	20	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	9	19	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	23	17	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	72	19	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	79	2	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	17	14	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	24	16	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	40	20	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	33	11	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	39	18	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	12	9	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	41	9	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	18	3	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	67	18	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	51	7	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	63	16	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	28	9	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	29	6	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	22	9	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	78	10	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	19	3	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	26	15	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	4	8	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	5	8	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	6	8	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	80	10	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	27	15	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	30	14	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	36	8	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	46	12	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	56	10	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	35	10	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	37	8	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	34	11	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	62	16	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	65	6	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	69	5	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	70	18	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	77	8	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	2	20	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	21	8	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	50	15	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	52	15	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	53	16	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	57	14	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	59	14	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	14	20	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	15	7	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	20	4	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	43	15	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	48	2	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	44	9	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	45	20	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	47	20	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	58	19	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	64	16	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	31	12	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	32	15	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	42	18	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	75	6	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	76	15	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	73	15	2014-02-04 17:15:06.846485	2	0001	0001	0008
s	74	4	2014-02-04 17:15:06.846485	2	0001	0001	0008
\.
