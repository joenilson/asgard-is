--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.11
-- Dumped by pg_dump version 9.1.11
-- Started on 2014-02-18 16:56:37 AST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 10 (class 2615 OID 16390)
-- Name: hcm; Type: SCHEMA; Schema: -; Owner: stilgar
--

DROP SCHEMA hcm;

CREATE SCHEMA hcm;


ALTER SCHEMA hcm OWNER TO stilgar;

--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 10
-- Name: SCHEMA hcm; Type: COMMENT; Schema: -; Owner: stilgar
--

COMMENT ON SCHEMA hcm IS 'Human Capital Management';


SET search_path = hcm, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 171 (class 1259 OID 16396)
-- Dependencies: 10
-- Name: employees; Type: TABLE; Schema: hcm; Owner: stilgar; Tablespace: 
--

CREATE TABLE employees (
    id_employee integer NOT NULL,
    last_name character varying(80) NOT NULL,
    first_name character varying(80) NOT NULL,
    full_name text NOT NULL,
    id_company integer NOT NULL,
    id_location integer NOT NULL,
    id_bureau integer NOT NULL,
    id_division integer NOT NULL,
    id_position integer NOT NULL,
    status character(1) NOT NULL,
    date_begin date NOT NULL
);


ALTER TABLE hcm.employees OWNER TO stilgar;

--
-- TOC entry 172 (class 1259 OID 16402)
-- Dependencies: 10 171
-- Name: employees_id_employee_seq; Type: SEQUENCE; Schema: hcm; Owner: stilgar
--

CREATE SEQUENCE employees_id_employee_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hcm.employees_id_employee_seq OWNER TO stilgar;

--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 172
-- Name: employees_id_employee_seq; Type: SEQUENCE OWNED BY; Schema: hcm; Owner: stilgar
--

ALTER SEQUENCE employees_id_employee_seq OWNED BY employees.id_employee;


--
-- TOC entry 173 (class 1259 OID 16404)
-- Dependencies: 10
-- Name: survey_categories; Type: TABLE; Schema: hcm; Owner: stilgar; Tablespace: 
--

CREATE TABLE survey_categories (
    id_survey_category integer NOT NULL,
    category_name character varying(50) NOT NULL,
    status character(1) NOT NULL
);


ALTER TABLE hcm.survey_categories OWNER TO stilgar;

--
-- TOC entry 174 (class 1259 OID 16407)
-- Dependencies: 10 173
-- Name: survey_categories_id_survey_category_seq; Type: SEQUENCE; Schema: hcm; Owner: stilgar
--

CREATE SEQUENCE survey_categories_id_survey_category_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hcm.survey_categories_id_survey_category_seq OWNER TO stilgar;

--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 174
-- Name: survey_categories_id_survey_category_seq; Type: SEQUENCE OWNED BY; Schema: hcm; Owner: stilgar
--

ALTER SEQUENCE survey_categories_id_survey_category_seq OWNED BY survey_categories.id_survey_category;


--
-- TOC entry 175 (class 1259 OID 16409)
-- Dependencies: 10
-- Name: survey_questions_detail; Type: TABLE; Schema: hcm; Owner: stilgar; Tablespace: 
--

CREATE TABLE survey_questions_detail (
    id_survey_category integer NOT NULL,
    id_survey_question integer NOT NULL,
    lang character varying(4) NOT NULL,
    key_answer text NOT NULL,
    key_score numeric(8,2) NOT NULL,
    key_score_type character varying(4) NOT NULL
);


ALTER TABLE hcm.survey_questions_detail OWNER TO stilgar;

--
-- TOC entry 176 (class 1259 OID 16415)
-- Dependencies: 10
-- Name: survey_questions_header; Type: TABLE; Schema: hcm; Owner: stilgar; Tablespace: 
--

CREATE TABLE survey_questions_header (
    id_survey_category integer NOT NULL,
    id_survey_question integer NOT NULL,
    lang character varying(4) NOT NULL,
    question_text text NOT NULL,
    question_type character varying(4) NOT NULL,
    status character(1) NOT NULL
);


ALTER TABLE hcm.survey_questions_header OWNER TO stilgar;

--
-- TOC entry 177 (class 1259 OID 16421)
-- Dependencies: 176 10
-- Name: survey_questions_header_id_survey_question_seq; Type: SEQUENCE; Schema: hcm; Owner: stilgar
--

CREATE SEQUENCE survey_questions_header_id_survey_question_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hcm.survey_questions_header_id_survey_question_seq OWNER TO stilgar;

--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 177
-- Name: survey_questions_header_id_survey_question_seq; Type: SEQUENCE OWNED BY; Schema: hcm; Owner: stilgar
--

ALTER SEQUENCE survey_questions_header_id_survey_question_seq OWNED BY survey_questions_header.id_survey_question;


--
-- TOC entry 252 (class 1259 OID 17023)
-- Dependencies: 10
-- Name: survey_results_detail; Type: TABLE; Schema: hcm; Owner: stilgar; Tablespace: 
--

CREATE TABLE survey_results_detail (
    id_survey integer NOT NULL,
    id_survey_result integer NOT NULL,
    id_company integer NOT NULL,
    id_employee integer NOT NULL,
    id_survey_category character varying(3) NOT NULL,
    id_survey_question character varying(3) NOT NULL,
    score numeric(8,2) NOT NULL
);


ALTER TABLE hcm.survey_results_detail OWNER TO stilgar;

--
-- TOC entry 178 (class 1259 OID 16426)
-- Dependencies: 10
-- Name: survey_results_header; Type: TABLE; Schema: hcm; Owner: stilgar; Tablespace: 
--

CREATE TABLE survey_results_header (
    id_survey_result integer NOT NULL,
    id_survey integer NOT NULL,
    id_company integer NOT NULL,
    id_employee integer NOT NULL,
    id_bureau_employee integer NOT NULL,
    date_survey date NOT NULL,
    date_period character varying(7) NOT NULL,
    final_result numeric(8,2),
    status character(1) NOT NULL,
    id_surveyor integer
);


ALTER TABLE hcm.survey_results_header OWNER TO stilgar;

--
-- TOC entry 179 (class 1259 OID 16429)
-- Dependencies: 10 178
-- Name: survey_results_header_id_survey_result_seq; Type: SEQUENCE; Schema: hcm; Owner: stilgar
--

CREATE SEQUENCE survey_results_header_id_survey_result_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hcm.survey_results_header_id_survey_result_seq OWNER TO stilgar;

--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 179
-- Name: survey_results_header_id_survey_result_seq; Type: SEQUENCE OWNED BY; Schema: hcm; Owner: stilgar
--

ALTER SEQUENCE survey_results_header_id_survey_result_seq OWNED BY survey_results_header.id_survey_result;


--
-- TOC entry 180 (class 1259 OID 16431)
-- Dependencies: 10
-- Name: surveyed; Type: TABLE; Schema: hcm; Owner: stilgar; Tablespace: 
--

CREATE TABLE surveyed (
    company character varying(4) NOT NULL,
    id integer NOT NULL,
    fullname text,
    "in" character varying(16),
    email character varying(180),
    "position" character varying(256),
    location character varying(180),
    ou character varying(180),
    cost_center integer,
    surveyor text,
    status character(1),
    location_id integer
);


ALTER TABLE hcm.surveyed OWNER TO stilgar;

--
-- TOC entry 181 (class 1259 OID 16437)
-- Dependencies: 10
-- Name: surveys_detail; Type: TABLE; Schema: hcm; Owner: stilgar; Tablespace: 
--

CREATE TABLE surveys_detail (
    id_survey integer NOT NULL,
    survey_innername character varying(30) NOT NULL,
    id_survey_category integer NOT NULL,
    id_survey_question integer NOT NULL,
    question_order smallint NOT NULL
);


ALTER TABLE hcm.surveys_detail OWNER TO stilgar;

--
-- TOC entry 182 (class 1259 OID 16440)
-- Dependencies: 10
-- Name: surveys_header; Type: TABLE; Schema: hcm; Owner: stilgar; Tablespace: 
--

CREATE TABLE surveys_header (
    id_survey integer NOT NULL,
    survey_name_key character varying(30),
    id_survey_type character varying(4),
    id_survey_scope character varying(3),
    status character(1)
);


ALTER TABLE hcm.surveys_header OWNER TO stilgar;

--
-- TOC entry 183 (class 1259 OID 16443)
-- Dependencies: 182 10
-- Name: surveys_header_id_survey_seq; Type: SEQUENCE; Schema: hcm; Owner: stilgar
--

CREATE SEQUENCE surveys_header_id_survey_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hcm.surveys_header_id_survey_seq OWNER TO stilgar;

--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 183
-- Name: surveys_header_id_survey_seq; Type: SEQUENCE OWNED BY; Schema: hcm; Owner: stilgar
--

ALTER SEQUENCE surveys_header_id_survey_seq OWNED BY surveys_header.id_survey;


--
-- TOC entry 2104 (class 2604 OID 16724)
-- Dependencies: 172 171
-- Name: id_employee; Type: DEFAULT; Schema: hcm; Owner: stilgar
--

ALTER TABLE ONLY employees ALTER COLUMN id_employee SET DEFAULT nextval('employees_id_employee_seq'::regclass);


--
-- TOC entry 2105 (class 2604 OID 16725)
-- Dependencies: 174 173
-- Name: id_survey_category; Type: DEFAULT; Schema: hcm; Owner: stilgar
--

ALTER TABLE ONLY survey_categories ALTER COLUMN id_survey_category SET DEFAULT nextval('survey_categories_id_survey_category_seq'::regclass);


--
-- TOC entry 2106 (class 2604 OID 16726)
-- Dependencies: 177 176
-- Name: id_survey_question; Type: DEFAULT; Schema: hcm; Owner: stilgar
--

ALTER TABLE ONLY survey_questions_header ALTER COLUMN id_survey_question SET DEFAULT nextval('survey_questions_header_id_survey_question_seq'::regclass);


--
-- TOC entry 2107 (class 2604 OID 16727)
-- Dependencies: 179 178
-- Name: id_survey_result; Type: DEFAULT; Schema: hcm; Owner: stilgar
--

ALTER TABLE ONLY survey_results_header ALTER COLUMN id_survey_result SET DEFAULT nextval('survey_results_header_id_survey_result_seq'::regclass);


--
-- TOC entry 2108 (class 2604 OID 16728)
-- Dependencies: 183 182
-- Name: id_survey; Type: DEFAULT; Schema: hcm; Owner: stilgar
--

ALTER TABLE ONLY surveys_header ALTER COLUMN id_survey SET DEFAULT nextval('surveys_header_id_survey_seq'::regclass);


--
-- TOC entry 2241 (class 0 OID 16396)
-- Dependencies: 171 2255
-- Data for Name: employees; Type: TABLE DATA; Schema: hcm; Owner: stilgar
--

COPY employees (id_employee, last_name, first_name, full_name, id_company, id_location, id_bureau, id_division, id_position, status, date_begin) FROM stdin;
\.


--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 172
-- Name: employees_id_employee_seq; Type: SEQUENCE SET; Schema: hcm; Owner: stilgar
--

SELECT pg_catalog.setval('employees_id_employee_seq', 1, false);


--
-- TOC entry 2243 (class 0 OID 16404)
-- Dependencies: 173 2255
-- Data for Name: survey_categories; Type: TABLE DATA; Schema: hcm; Owner: stilgar
--

COPY survey_categories (id_survey_category, category_name, status) FROM stdin;
\.


--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 174
-- Name: survey_categories_id_survey_category_seq; Type: SEQUENCE SET; Schema: hcm; Owner: stilgar
--

SELECT pg_catalog.setval('survey_categories_id_survey_category_seq', 1, false);


--
-- TOC entry 2245 (class 0 OID 16409)
-- Dependencies: 175 2255
-- Data for Name: survey_questions_detail; Type: TABLE DATA; Schema: hcm; Owner: stilgar
--

COPY survey_questions_detail (id_survey_category, id_survey_question, lang, key_answer, key_score, key_score_type) FROM stdin;
\.


--
-- TOC entry 2246 (class 0 OID 16415)
-- Dependencies: 176 2255
-- Data for Name: survey_questions_header; Type: TABLE DATA; Schema: hcm; Owner: stilgar
--

COPY survey_questions_header (id_survey_category, id_survey_question, lang, question_text, question_type, status) FROM stdin;
\.


--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 177
-- Name: survey_questions_header_id_survey_question_seq; Type: SEQUENCE SET; Schema: hcm; Owner: stilgar
--

SELECT pg_catalog.setval('survey_questions_header_id_survey_question_seq', 1, false);


--
-- TOC entry 2254 (class 0 OID 17023)
-- Dependencies: 252 2255
-- Data for Name: survey_results_detail; Type: TABLE DATA; Schema: hcm; Owner: stilgar
--

COPY survey_results_detail (id_survey, id_survey_result, id_company, id_employee, id_survey_category, id_survey_question, score) FROM stdin;
1	19	1000	10001018	A	A1	4.00
1	19	1000	10001018	A	A2	5.00
1	19	1000	10001018	A	A3	4.00
1	19	1000	10001018	B	B1	5.00
1	19	1000	10001018	B	B2	5.00
1	19	1000	10001018	B	B3	4.00
1	19	1000	10001018	C	C1	4.00
1	19	1000	10001018	C	C2	3.00
1	20	1000	10001777	A	A1	3.00
1	20	1000	10001777	A	A2	3.00
1	20	1000	10001777	A	A3	3.00
1	20	1000	10001777	B	B1	3.00
1	20	1000	10001777	B	B2	3.00
1	20	1000	10001777	B	B3	3.00
1	20	1000	10001777	C	C1	3.00
1	20	1000	10001777	C	C2	3.00
\.


--
-- TOC entry 2248 (class 0 OID 16426)
-- Dependencies: 178 2255
-- Data for Name: survey_results_header; Type: TABLE DATA; Schema: hcm; Owner: stilgar
--

COPY survey_results_header (id_survey_result, id_survey, id_company, id_employee, id_bureau_employee, date_survey, date_period, final_result, status, id_surveyor) FROM stdin;
19	1	1000	10001018	1001	2014-02-15	2013	34.00	A	10002319
20	1	1000	10001777	1001	2014-02-18	2013	24.00	A	10002549
\.


--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 179
-- Name: survey_results_header_id_survey_result_seq; Type: SEQUENCE SET; Schema: hcm; Owner: stilgar
--

SELECT pg_catalog.setval('survey_results_header_id_survey_result_seq', 20, true);


--
-- TOC entry 2250 (class 0 OID 16431)
-- Dependencies: 180 2255
-- Data for Name: surveyed; Type: TABLE DATA; Schema: hcm; Owner: stilgar
--

COPY surveyed (company, id, fullname, "in", email, "position", location, ou, cost_center, surveyor, status, location_id) FROM stdin;
0001	10001027	HERRERA SALA MERCEDES	402-2169422-3	mherrera	Controller	Stgo. Rodriguez	Auditoría Interna	111007	10000986	A	1000
0001	10003478	DISLA PERALTA SOLANNY	22300542341	sdisla	Coordinador De Relaciones Institucionale	Sto. Dgo. Oeste	Comunicaciones	111011	10000986	A	1001
0001	10000987	JANAMPA AÑAÑOS ZISLO	4600376307	zjanampa	Encargado De Responsabilidad Empresarial	Stgo. Rodriguez	Responsabilidad Empresarial	111003	10000986	A	1000
0001	10000992	MEDINA GUTIERREZ MARIO	001-1844386-0	mmedina	Gerente Administrativo Y Financiero	Sto. Dgo. Oeste	Gerencia De Administración Y Finanzas	111002	10000986	A	1001
0001	10003320	ROSAS BERNEDO ENRIQUE ELEUTERIO		erosas	Gerente Comercial	Sto. Dgo. Oeste	Comercialización	121001	10000986	A	1001
0001	10002392	ZAVALAGA LEON LUIS GUILLERMO	402-2492485-8	lzavalaga	Gerente De Marketing	Sto. Dgo. Oeste	Marketing	121002	10000986	A	1001
0001	10001014	TERRONES SILVA WILBERT	001-1897717-2	wterrones	Gerente De Ventas Zona Centro Y Oriente	Sto. Dgo. Oeste	Ventas	122002	10003320	A	1001
0001	10001013	SAENZ SANCHEZ NESTOR	223-0119624-6	nsaenz	Gerente De Ventas Zona Cibao	Santiago	Ventas	122004	10003320	A	1003
0001	10000986	MARROQUIN ALCAZAR ARTURO	40220548396	amarroquin	Gerente General	Sto. Dgo. Oeste	Gerencia	111002	10000986	A	1001
0001	10003022	SEGAMA ANDRADE RAMIRO TULIO		rsegama	Jefe De Auditoría Interna	Sto. Dgo. Oeste	Auditoría Interna	111007	10000986	A	1001
0001	10003471	RODRIGUEZ BORRELLY IVAN RAFAEL	034-0015446-8	irodriguez	Jefe De Distribución	Sto. Dgo. Oeste	Distribución	121004	10003320	A	1001
0001	10002549	DEDIOS ESPINOZA UBALDO EBERTH		udedios	Jefe De Gestion Humana	Sto. Dgo. Oeste	Gestión Humana	111008	10000986	A	1001
0001	10000996	ZEGARRA GALVEZ NILSON	402-2091769-0	joenilson	Jefe De Sistemas	Sto. Dgo. Oeste	Sistemas	112001	10000986	A	1001
0001	10001005	IDONE COLLACHAGUA ANGEL	402-2196489-9	aidone	Jefe De Sostenibilidad	Stgo. Rodriguez	Sostenibilidad	132101	10000986	A	1000
0001	10003406	GONZALEZ LIBREAULT MOISES MIGUEL	001-1019857-9	mgonzalez	Jefe De Trade Marketing	Sto. Dgo. Oeste	Administración De Ventas	122002	10003320	A	1001
0001	10000690	GUTIERREZ TAVAREZ HERY	092-0013540-9	hgutierrez	Jefe De Ventas	Azua	Ventas	122007	10001014	A	1006
0001	10000840	JIMENEZ DE LA ROSA DOMINGO	026-0092742-6	djimenez	Jefe De Ventas	Higuey	Administración De Ventas	122010	10001014	A	1010
0001	10000880	DINO EMILIO AMIN ABEL	026-0017219-7	adino	Jefe De Ventas	La Romana	Ventas	122006	10001014	A	1005
0001	10002382	JAQUEZ BAEZ LUIS RADHAMES	046-0027295-1	ljaquez	Jefe De Ventas	Puerto Plata	Ventas	122008	10001013	A	1007
0001	10000981	MORILLO WANDER MIGUEL	1001032570		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10002431	VICTORIANO PIMENTEL WALDO YADEL	010-0107702-1	wvictoriano	Supervisor De Distribución	Azua	Distribución	122007	10003471	A	1006
0001	10003460	CRUZ VASQUEZ PORFIRIO	027-0035304-4	pcruz	Supervisor De Distribución	Higuey	Distribución	122010	10003471	A	1010
0001	10003463	FOURNIER SANCHEZ DANIEL BARON	026-0027650-1	dfournier	Supervisor De Distribución	La Romana	Distribución	122006	10003471	A	1005
0001	10002168	UREÑA MARGARIN MOISES DANIEL	001-1746930-4	murena	Supervisor De Distribución	Nagua	Distribución	122009	10003471	A	1009
0001	10000899	PEREZ MATEO SOCRATES LEONARDO	037-0041669-0	 sperez	Supervisor De Distribución	Puerto Plata	Distribución	122008	10003471	A	1007
0001	10000787	DE LA CRUZ CASTILLO MIGUEL	5601096810	mcruz	Supervisor De Distribución	San Francisco	Distribución	122005	10003471	A	1004
0001	10000672	RAMIREZ FELIZ ALEXANDRO RAFAEL	010-0094999-8	aramirez	Supervisor De Distribución	Santiago	Distribución	122004	10003471	A	1003
0001	10001988	PEÑA GARCIA RONNY GREGORY	094-0021913-6	rpena	Supervisor De Distribución	Santiago	Distribución	122004	10003471	A	1003
0001	10003254	PERDOMO FELIZ MIGUEL	001-1391938-5	mperdomo	Supervisor De Distribución	Sto. Dgo. Este	Ventas	122003	10003471	A	1002
0001	10003255	SERRANO MARTINEZ MARCOS YANERIS	223-0127426-6	mserrano	Supervisor De Distribución	Sto. Dgo. Este	Ventas	122003	10003471	A	1002
0001	10001694	RAMIREZ RAMIREZ EURIS JOSELIN	010-0107071-1		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10002372	MEJIA NUÑEZ FRANKLIN ANTONIO	028-0087729-8		Digitador	Higuey	Ventas	122010	10000873,10002411	A	1010
0001	10000861	VEDRINE STERLIN	026-0136177-3	almacenhiguey	Encargado De Almacén Centro Operativo	Higuey	Almacén De Centro Operativo	122010	10001031	A	1010
0001	10000869	TAVAREZ JOAN MANUEL	2601376250	almacenromana	Encargado De Almacén Centro Operativo	La Romana	Almacén De Centro Operativo	122006	10001031	A	1005
0001	10002575	SANTOS ACOSTA TOMAS	071-0044884-9	almacenng	Encargado De Almacén Centro Operativo	Nagua	Almacén De Centro Operativo	122009	10001031	A	1009
0001	10001182	FERNANDEZ PAULINO ERINSON	3701009528	almacenpp	Encargado De Almacén Centro Operativo	Puerto Plata	Almacén De Centro Operativo	122008	10001031	A	1007
0001	10002864	ARIAS LUIS ALFREDO	056-0011068-7	almacensfm	Encargado De Almacén Centro Operativo	San Francisco	Almacén De Centro Operativo	122005	10001031	A	1004
0001	10001244	CRUZ JIMENEZ JOSEPH KELMEN	046-0027314-0	almacenstgo	Encargado De Almacén Centro Operativo	Santiago	Almacén De Centro Operativo	122004	10001031	A	1003
0001	10000548	CASTILLO ROSARIO ALEXIS ANTONIO	001-1231420-8	acastillo	Encargado De Almacén Centro Operativo	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10001031	A	1002
0001	10002252	SANTANA RIJO EMMANUEL	226-0007305-4		Pintor	Higuey	Ventas	122010	10000873,10002411	A	1010
0001	10002374	BERAS BERROA EMMANUEL	028-0111707-4		Pintor	Higuey	Publicidad Y Promociones	122010	10000873,10002411	A	1010
0001	10000882	ROSARIO CAMACHO ENRIQUE ALEXIS	026-0108106-6		Pre-Venta	Higuey	Ventas	122010	10000873,10002411	A	1010
0001	10001309	SANTANA VALENTIN	028-0065791-4		Pre-Venta	Higuey	Ventas	122010	10000873,10002411	A	1010
0001	10001542	ESPIRITU ZORRILLA JUAN CARLOS	028-0085690-4		Pre-Venta	Higuey	Ventas	122010	10000873,10002411	A	1010
0001	10001702	MEJIA DE LOS SANTOS SAMUEL	028-0079184-6		Pre-Venta	Higuey	Ventas	122010	10000873,10002411	A	1010
0001	10001994	SANTANA SANTANA DANIEL	026-0035399-5		Pre-Venta	Higuey	Ventas	122010	10000873,10002411	A	1010
0001	10003014	MORLA DE JESUS PEDRO	028-0077642-5		Pre-Venta	Higuey	Ventas	122010	10000873,10002411	A	1010
0001	10000873	ORTIZ ARIAS ROBERTO ENRIQUE	1300091244	rortiz	Supervisor De Ventas	Higuey	Ventas	122010	10000840	A	1010
0001	10002411	CELESTINO FERNANDEZ BREYLIN ALEJANDRO	026-0075622-1	bcelestino	Supervisor De Ventas	Higuey	Ventas	122010	10000840	A	1010
0001	10003526	Hierro Juan Carlos	026-0108491-2		Pre-Venta	Higuey	Ventas	122010	10000873,10002411	A	1010
0001	10002161	SANCHEZ SANCHEZ MIQUIS MIGUEL	027-0041272-5		Auxiliar De Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10002429	RIJO ELISAUL	028-0106521-6		Auxiliar De Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10002767	RAMIREZ HENRY	029-0018518-8		Auxiliar De Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10002990	GARCIA RAMIREZ JOSELITO	223-0129329-0		Auxiliar De Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10003013	CEDANO RICHIEZ RANPHI	028-0108379-7		Auxiliar De Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10003132	ROA ORTIZ LUIS MANUEL	402-2007363-5		Auxiliar De Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10003133	POLANCO ORTIZ ANTONIO	029-0018746-5		Auxiliar De Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10003135	MORALES JUNIOR	025-0047169-9		Auxiliar De Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10003257	INIRIO SANTANA MERPHY ANTONIO	028-0101025-3		Auxiliar De Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10003360	PEREZ ROSARIO JORGE ISIDRO	028-0108538-8		Auxiliar De Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10003373	GERMAN MERCEDES TAMARTIR GREGORIO	025-0040690-1		Auxiliar De Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10002588	MARTINEZ GUERRERO JUAN	028-0082748-3		Chofer Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10002590	CASTILLO CASTILLO ALEJANDRO	028-0024113-1		Chofer Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10002652	RODRIGUEZ FRANGIL	028-0057658-5		Chofer Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10002769	RIJO POLONIA JULIO CESAR	103-0006081-0		Chofer Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10003136	CASTRO REYES FABIO ANTONIO	118-0001153-5		Chofer Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10003316	GUERRERO RUIZ NEYRO	028-0059161-8		Chofer Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10003372	JAQUEZ ACOSTA ARGENIS	224-0039993-1		Chofer Repartidor	Higuey	Distribución	122010	10003460	A	1010
0001	10003134	UBIERA SOSA OSCAR BIENVENIDO	025-0045087-5		Pre-Venta	Higuey	Ventas	122010	10000873,10002411	A	1010
0001	10003219	SURIEL GARCIA ADRIANO	061-0018941-1		Pre-Venta	Higuey	Ventas	122010	10000873,10002411	A	1010
0001	10003465	MELO POUERIT VICTOR MANUEL	028-0093089-9		Pre-Venta	Higuey	Ventas	122010	10000873,10002411	A	1010
0001	10003500	ALDAÑO MEDINA HECTOR RUDDY	025-0033103-4		Pre-Venta	Higuey	Ventas	122010	10000873,10002411	A	1010
0001	10000830	DE LA CRUZ BUENO MARTIN	066-0023612-6		Pre-Venta	Nagua	Ventas	122009	10001649	A	1009
0001	10001655	GARCIA THEN JOSE DE JESUS	402-2161801-6		Pre-Venta	Nagua	Ventas	122009	10001649	A	1009
0001	10001675	ROSARIO MEJIA EZEQUIEL AMADO	023-0145714-5		Pre-Venta	Nagua	Ventas	122009	10001649	A	1009
0001	10002446	MORFE ZORRILLA JOHAN MANUEL	136-0019125-1		Pre-Venta	Nagua	Ventas	122009	10001649	A	1009
0001	10002483	PAREDES LEOMIL EZEQUIEL	071-0050543-2		Pre-Venta	Nagua	Ventas	122009	10001649	A	1009
0001	10003137	BARRERA POLANCO VICTOR ALFONSO	058-0032718-0		Pre-Venta	Nagua	Ventas	122009	10001649	A	1009
0001	10003138	LACHAPELL PEREZ OSCAR MANUEL	002-0154002-8		Pre-Venta	Nagua	Ventas	122009	10001649	A	1009
0001	10003272	QUIROZ ULLOA FRANCK FLEIVI	071-0050533-3		Pre-Venta	Nagua	Ventas	122009	10001649	A	1009
0001	10001649	RAMOS LAUREANO CRISPIN	136-0017049-5		Supervisor De Ventas	Nagua	Ventas	122009	10000767	A	1009
0001	10001595	REYES MOREL CARLIXTO	136-0019394-3		Auxiliar De Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10001651	REYNOSO JOSE DOMINGO	136-0016662-6		Auxiliar De Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10001653	ROSARIO REYES GERONIMO	136-0016339-1		Auxiliar De Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10001654	SANTANA AMPARO JUNIOR	13600183407		Auxiliar De Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10001666	MINAYA SANTOS ALEJANDRO	402-2233651-9		Auxiliar De Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10002482	ACOSTA CAMILO AYENDY	136-0017088-3		Auxiliar De Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10002539	MEJIA QUERO HUMBERTO ANTONIO	071-0050040-9		Auxiliar De Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10002917	VENTURA DE JESUS ALBERTO JOSE	136-0015698-1		Auxiliar De Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10003055	PAULINO DE JESUS ENMANUEL	136-0018916-4		Auxiliar De Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10003122	DE JESUS ALMONTE ANTONIO DE LEON	136-0016844-0		Auxiliar De Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10003125	JIMENEZ SANTOS DERBY	136-0018761-4		Auxiliar De Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10001659	GONZALES ORTIZ CHANEL	071-0002194-3		Chofer Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10001669	DIAZ CAMILO KELVIN	136-0016465-4		Chofer Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10002171	VENTURA MARIA JOSE FRANCISCO	136-0016249-2		Chofer Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10002177	POLANCO CARDERON LUIS FRANCISCO	136-0000790-3		Chofer Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10002221	SANTOS JIMENEZ PABLO	136-0001766-2		Chofer Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10002449	NUÑEZ DE JESUS FABIO EZEQUIEL	136-0011239-8		Chofer Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10003288	RODRIGUEZ MERCEDES HERMOGENES	136-0017516-3		Digitador	Nagua	Ventas	122009	10001649	A	1009
0001	10003513	GARCIA SALVADOR GILBERTO	071-0043890-7		Pintor	Nagua	Marketing	122009	10001649	A	1009
0001	10003289	DIAZ CORDERO JOAN FRANCISCO	066-0025742-9		Pre-Venta	Nagua	Ventas	122009	10001649	A	1009
0001	10003292	MARTINES POLANCO RODOLFO	402-2266830-9		Pre-Venta	Nagua	Ventas	122009	10001649	A	1009
0001	10003365	DIAZ MEDINA CRISTINO BABAS	066-0023890-8		Pre-Venta	Nagua	Ventas	122009	10001649	A	1009
0001	10000926	PEREZ CARRASCO DIONICIO	137-0000179-8		Auxiliar De Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10001592	LOPEZ GARCIA JOHAN MIGUEL	037-0114805-2		Auxiliar De Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10002150	ALMONTE CABRERA ROBERTO CARLOS	037-0109895-0		Auxiliar De Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10002527	CASTILLO ALVAREZ JOSE LUIS	40220537860		Auxiliar De Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10002669	HERNANDEZ CORONADO JOSE ARMANDO	037-0122712-0		Auxiliar De Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10002686	FRANCISCO FRANCISCO BENNY ADRIAN	037-0118612-8		Auxiliar De Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10002707	SILVA MEJIA VICTOR MANUEL	037-0113634-7		Auxiliar De Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10002996	VASQUEZ ROJAS VICTOR OCTAVIO	037-0097073-8		Auxiliar De Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10003077	EUSEBIO MEJIA VICTOR ALFONSO	037-0117299-5		Auxiliar De Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10003397	SANTOS MARTINEZ JOSE CARLOS	038-0017554-3		Auxiliar De Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10003399	RODRIGUEZ ESPINOSA DIONICIO	037-0112228-9		Auxiliar De Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10003090	CERDA ESPINAL ANDRES AVELINO	042-0009292-4		Auxiliar De Repartidor Pool	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10000911	HERNANDEZ MERCADO BLASDIMIRA	037-0086075-6	cajapp	Cajero	Puerto Plata	Finanzas	122008	10000892	A	1007
0001	10000932	DISLA GOMEZ DANY MANUEL	038-0014568-6		Chofer Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10001160	CASTILLO PERALTA JOAN MANUEL	060-0019695-3		Chofer Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10001591	DIAZ PIERROT MIGUEL ANGEL	001-1721733-1		Chofer Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10002653	MARTINEZ SANCHEZ FEDERICO ANTONIO	001-1371762-3		Chofer Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10002681	RAMIREZ OVIEDO LEUDY MANUEL	017-0024158-9		Chofer Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10002857	DE LEON PEÑA WALTER ALBERTO	037-0092966-8		Chofer Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10003301	TAVAREZ RODRIGUEZ JUAN JAVIER	037-0062699-1		Chofer Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10003427	RIVERA GOMEZ ALEXIS EMMANUEL	037-0096938-3		Chofer Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10003533	Diaz Lopez Juan	056-0014809-1		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10000825	TEJADA GONZALES JOSIAS GONZALO	5601140949		Asistente De Almacén Centro Operativo	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10003141	MENA MENA ALFONSO DANI	056-0103991-9		Auxiliar De Almacen	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10003142	NOLASCO RAMIREZ MIGUEL ANGEL	056-0126082-0		Auxiliar De Almacen	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10000790	POLANCO RODRIGUEZ JOSE DEL CARMEN	056-0107538-4		Auxiliar De Almacén	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10000797	MARTINEZ PORTOLATIN VICTOR MANUEL	056-0049411-5		Auxiliar De Almacén	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10000807	MOREL POLANCO JOSE AMADO	056-0094018-2		Auxiliar De Almacén	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10000809	HERNANDEZ NUÑEZ JUAN MARIA	056-0087911-7		Auxiliar De Almacén	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10000819	JIMENEZ REYES VIRGILIO	056-0066312-3		Auxiliar De Almacén	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10002182	RODRIGUEZ PEÑA WILLIAM	5601253015		Auxiliar De Almacén	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10002391	ALBERTO RIVAS RAMON ANTONIO	056-0161415-8		Auxiliar De Almacén	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10003075	POLANCO GARCIA CLAUDIO	087-0017787-9		Auxiliar De Almacén	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10003439	DE LA CRUZ CASTILLO MODESTO	056-0114112-9		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003510	FRIAS GARCIA AMBIORIS ANTONIO	056-0170996-6		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003441	FRANCISCO CELESTINO JUAN ALBERTO	056-0022001-5		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003442	BURGOS DISLA FRANK FELIX	056-0133957-4		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003448	PERALTA RAMIREZ JHOEL STARLIN	056-0118733-8		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003449	ABREU ESTEVEZ RAHUDY ANTONIO	5601407157		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003509	POLANCO DUARTE MILSON ANTONIO	056-0147964-4		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10000818	RODRIGUEZ PERALTA ANDRES RAMADAN	056-0043255-2		Operador De Montacarga	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10000788	RODRIGUEZ DIAZ RAFAEL	064-0023149-1		Parqueador De Flota Liviana	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10000637	BATISTA JULIAN	121-0009838-8	jbatista	Supervisor De Ventas	Santiago	Ventas	122004	10001010	A	1003
0001	10003530	Casado Ovalles Ronald Enmanuel	094-0024020-7		Auxiliar De Almacén	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10000645	LOPEZ RODRIGUEZ WENDY ANTONIO	042-0007417-9		Auxiliar De Almacén	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10000652	APOLINAR CRUZ DANILO ANTONIO	054-0097040-5		Auxiliar De Almacén	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10000653	MIESES SANCHEZ LANDER JOELL	031-0452513-8		Auxiliar De Almacén	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10000654	SUERO MARTINEZ JOSELITO	096-0021867-2		Auxiliar De Almacén	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10000665	NUÑEZ TORIBIO ABRAHAN MARIA	094-0011223-2		Auxiliar De Almacén	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10000677	ALVAREZ CABRERA MAXIMO	3102402264		Auxiliar De Almacén	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10001855	ALVAREZ SANCHEZ PEDRO	12100107171		Auxiliar De Almacén	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10002011	DE LA ROSA GOMEZ DANIEL DE JESUS	3103707315		Auxiliar De Almacén	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10002387	HOLGUIN ALVAREZ JOSE LUIS	046-0035580-6		Auxiliar De Almacén	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10002537	CORDERO MONCION YANCARLO	115-0001363-3		Auxiliar De Almacén	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10002772	NUÑEZ PUNTIEL RAMON	047-0137154-6		Auxiliar De Almacén	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10002868	GARCIA MENDOZA FAUSTO DE JESUS	031-0437625-0		Auxiliar De Almacén	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10003507	ARCANGEL VALENTIN ODALIS RAFAEL	047-0170907-5		Auxiliar De Almacén	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10000771	FRANCISCO DE LA CRUZ YESSENIA DEL CARMEN	031-0457907-7	cajastgo	Cajero	Santiago	Finanzas	122004	10000695	A	1003
0001	10001807	BLANCO JIMENEZ NAHURY MICHEL	031-0499164-5	cajastgo2	Cajero	Santiago	Finanzas	122004	10000695	A	1003
0001	10000661	INFANTE COLON SOCORRO ANTONIA	031-0338846-2		Conserje	Santiago	Mantenimiento De Edificaciones	122004	10000695	A	1003
0001	10000650	ALBERTO FRANCISCO ALBERTO	031-0379186-3		Operador De Montacarga	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10001436	VILLALONA LIMA OMAR EMILIO	031-0504104-4		Operador De Montacarga	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10000671	MEDINA MONTERO FELIX	043-0001367-1		Parqueador De Flota Liviana	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10000681	MARTINEZ PONTIER ALBERTO	031-0065727-3		Parqueador De Flota Liviana	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10003312	TURBI DE LOS SANTOS ROQUEIDY	402-2235244-1		Auxiliar De Repartidor	Sto. Dgo. Este	Ventas	122003	10003254,10003255	A	1002
0001	10003414	ALCANTARA DE OLEO VICTOR ALFONSO	223-0070559-1		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003423	PEREZ RAMIREZ JOSE LUIS	402-2214781-7		Auxiliar De Repartidor	Sto. Dgo. Este	Ventas	122003	10003254,10003255	A	1002
0001	10003247	HERNANDEZ MEJIA OMAR JULIO	001-1814576-2		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003248	RAMIREZ REYES GRIMALDY ERNESTO	223-0059644-6		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003250	MANZANILLO MEJIA ALBERTO	223-0041087-9		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003395	JIMENEZ GEORGE NICOLAS	001-1672413-9		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002781	PEÑALO RAFAEL	119-0004590-4		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000268	CORDERO BAEZ SANTOS ALEXANDRO	115-0000082-0	scordero	Asistente De Auditoría Interna	Stgo. Rodriguez	Auditoría Interna	111007	10003022	A	1000
0001	10000275	VELEZ RODRIGUEZ MILADYS ALTAGRACIA	046-0035524-4	mvelez	Asistente De Auditoría Interna	Stgo. Rodriguez	Auditoría Interna	111007	10003022	A	1000
0001	10000306	PERALTA BAEZ MARLENIS DEL CARMEN	046-0033847-1	mperalta	Asistente De Auditoría Interna	Stgo. Rodriguez	Auditoría Interna	111007	10003022	A	1000
0001	10000291	HOLGUIN ALVAREZ YOHANNY MIGUELINA	4600322566	mholguin	Asistente De Gestion Humana	Stgo. Rodriguez	Gestión Humana	111008	10000269	A	1000
0001	10002129	TAVAREZ ESTEVEZ EVELING ADALGISA	046-0034470-1	etavarez	Asistente De Gestion Humana	Stgo. Rodriguez	Gestión Humana	111008	10001777	A	1000
0001	10003062	TAVERAS ESTRELLA FATIMA MARIA	3104833185	ftaveras	Asistente Del Sgi	Stgo. Rodriguez	Sistema De Gestión Integrado	111013	10001027	A	1000
0001	10003388	FAMILIA DEL ROSARIO JUAN FRANCISCO	001-0686552-0		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003400	DE LA ROSA VICTOR MANUEL	224-0020856-1		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000269	ESPINAL BAEZ KELVI FEDERICO	046-0031163-5	kespinal	Coordinador De Compensación Y Beneficios	Stgo. Rodriguez	Gestión Humana	111008	10002549	A	1000
0001	10002559	LUGO ALMANZAR FAURY ERNESTO	402-2015761-0	flugo	Coordinador Del Sgi	Stgo. Rodriguez	Sistema De Gestión Integrado	111013	10001027	A	1000
0001	10003430	Corletto Oviedo Janna Venecia	225-0018118-9	jcorletto	Coordinadora De Comunicaciones Internas	Sto. Dgo. Oeste	Comunicaciones	122002	10003478	A	1001
0001	10001767	TEJADA MARIA ENEIDA	001-1144223-2	mtejada	Asistente De Gestion Humana	Stgo. Rodriguez	Gestión Humana	111008	10002846	A	1000
0001	10003267	ABREU ORTIZ CLAUDIA ESTEPHANIE	229-0012169-4	cabreu	Asistente De Talento Y Reclutamiento	Sto. Dgo. Oeste	Gestión Humana	122002	10001777	A	1001
0001	10003379	JIMENEZ JIMENEZ DANNY LEONARDO	001-1637440-6	ljimenez	Asistente De Verificación De Facturas	Sto. Dgo. Oeste	Contabilidad	111005	10000989	A	1001
0001	10003100	RUBIO MOSQUEA JORGE LUIS	052-0012317-1	cajasdn	Cajero	Sto. Dgo. Oeste	Finanzas	122002	10000989	A	1001
0001	10001688	REYES CABRERA GERSIS	103695912	greyes	Contador De Centro Operativo	Higuey	Contabilidad	122010	10000989	A	1010
0001	10003484	RODRIGUEZ ALVAREZ ELIZABETH	028-0079392-5	elizabethr	Contador De Centro Operativo	Higuey	Contabilidad	122010	10000989	A	1010
0001	10000870	UBIERA MERCEDES KENIA	026-0117813-6	kubiera	Contador De Centro Operativo	La Romana	Contabilidad	111005	10000989	A	1005
0001	10001656	VENTURA DE JESUS MADELIN	136-0014652-9	mventura	Contador De Centro Operativo	Nagua	Contabilidad	122009	10000989	A	1009
0001	10000892	LUCIANO FRANCISCO JULISSA GERMANIA	037-0066803-5	jluciano	Contador De Centro Operativo	Puerto Plata	Contabilidad	111005	10000989	A	1007
0001	10003286	DE LA CRUZ REGALADO WANDA	001-1734647-8	wdelacruz	Contador De Centro Operativo	Sto. Dgo. Oeste	Contabilidad	111005	10000989	A	1001
0001	10002855	VILLAMIZAR SARETH JOHANNA	40223847464	svillamizar	Coodrinador De Comunicaciones	Sto. Dgo. Oeste	Comunicaciones	111011	10003478	A	1001
0001	10001361	TEJADA HIDALGO FRANCIS LEINIS	046-0001866-9	ftejada	Coordinador De Comunicaciones De Planta	Stgo. Rodriguez	Comunicaciones	111011	10003478	A	1000
0001	10001026	CANCHARI OCHOA SUNY SAIWA		scanchari	Jefe De Mantenimiento	Stgo. Rodriguez	Mantenimiento	132201	10001005	A	1000
0001	10001006	SALVATIERRA ROMERO CARLOS	402-2192173-3	csalvatierra	Jefe De Seguridad Industrial Y Sal Ocup.	Stgo. Rodriguez	Seguridad Industrial Y Salud Ocupacional	132102	10001005	A	1000
0001	10001031	SILIPU VILLEGAS SANTOS SANTIAGO		ssilupu	Responsable De Almacenes C. O.	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10000992	A	1001
0001	10000152	ESPINAL TEJADA DAYLIS DANIEL	4600346169	ddespinal	Soporte Tecnico	Stgo. Rodriguez	Soporte Técnico	112001	10002319	A	1000
0001	10003099	LARA PEÑA LAURA AMELIA	031-0442937-2	llara	Supervisor De Gestion Humana	Santiago	Gestión Humana	122004	10001777	A	1003
0001	10002953	UREÑA KRISMELIS SUSANA	001-1230590-9	kurena	Supervisor De Gestion Humana	Sto. Dgo. Este	Gestión Humana	122003	10001777	A	1002
0001	10000240	CEPEDA ESTEVEZ ROBINSON LEONEL	115-0001260-1		Asistente De Alm. De Suministros Div.	Sto. Dgo. Oeste	Almacén De Logística	122002	10000998	A	1001
0001	10002535	PANIAGUA HERNANDEZ JOAN JOEL	224-0006975-7		Asistente De Alm. De Suministros Div.	Sto. Dgo. Oeste	Logística	132308	10000998	A	1001
0001	10003420	ALCANTARA VEGA DIANA CAROLINA	402-2158395-4	dalcantara	Asistente De Logistica Junior	Sto. Dgo. Oeste	Logística	122002	10001029	A	1001
0001	10000316	RODRIGUEZ RAMIREZ JULIA RAMONA	046-0035351-2	jrodriguez	Asistente De Monitoreo De Sucursales	Stgo. Rodriguez	Contabilidad	111005	10000273	A	1000
0001	10001744	BRITO SANDOVAL EDUARDO	057-0014669-8		Auxiliar De Seguridad Interna	Nagua	Seguridad Interna	122009	10001035	A	1009
0001	10003417	VALDEZ PEÑA RAFAEL	056-0141698-4		Auxiliar De Seguridad Interna	Puerto Plata	Seguridad Interna	122008	10001035	A	1007
0001	10003034	DE LOS SANTOS PAULINO FRANCISCO ANTONIO	136-0013831-0		Auxiliar De Seguridad Interna	San Francisco	Seguridad Interna	122005	10001035	A	1004
0001	10001048	JIMENEZ LECLERC PABLO JOSE	4600334520		Auxiliar De Seguridad Interna	Santiago	Seguridad Interna	122004	10001035	A	1003
0001	10003031	LIBERATA DELGADO PABLO MADEMELO	046-0034400-8		Auxiliar De Seguridad Interna	Santiago	Seguridad Interna	122004	10001035	A	1003
0001	10000300	INFANTE DE LA CRUZ RAMON LISANDER	4600279774	cajaplanta	Cajero	Stgo. Rodriguez	Finanzas	111005	10000274	A	1000
0001	10000998	CCAMA TICONA DAVID		dccama	Encargado De Almacenes De Logistica	Stgo. Rodriguez	Almacén De Logística	132407	10001029	A	1000
0001	10001028	CARRILLO NOVOA HECTOR JOSE	402-2091763-3	jcarrillo	Encargado De Compras	Stgo. Rodriguez	Compras De Logística	111009	10001029	A	1000
0001	10000239	MENDEZ DE LA PAZ BEIBY ANTONIO	1000741809		Auxiliar De Seguridad Interna	Azua	Seguridad Interna	122007	10002172	A	1006
0001	10002506	VALERIO MORAN SEBASTIAN	116-0002278-1		Auxiliar De Seguridad Interna	Higuey	Seguridad Interna	122010	10002172	A	1010
0001	10000430	MORLA HERNANDEZ JULIO CESAR	500410949		Auxiliar De Seguridad Interna	Sto. Dgo. Este	Seguridad Interna	122003	10002172	A	1002
0001	10003424	DE OLEO DE LOS SANTOS LIXANDRO	012-0104892-1		Auxiliar De Seguridad Interna	Sto. Dgo. Este	Seguridad Interna	122003	10002172	A	1002
0001	10003273	ESPINAL FAÑA JAVIER	071-0047924-0		Auxiliar De Seguridad Interna	Sto. Dgo. Oeste	Seguridad Interna	122002	10002172	A	1001
0001	10000156	DISLA ALMONTE JUAN IVAN DE JESUS	3400508903	idisla	Coordinador De Operaciones	Stgo. Rodriguez	Flota	132404	10003293	A	1000
0001	10000198	ECHAVARRIA PERALTA EMMANUEL	4600359642		Mecánico Automotriz	Stgo. Rodriguez	Mantenimiento Automotríz	132204	10000156	A	1000
0001	10002816	GONZALEZ JEAN CARLOS	402-2306024-1		Mecánico Automotríz	Santiago	Mantenimiento Automotríz	122004	10002408	A	1003
0001	10000211	BELLO TEJADA NICOLAS	4600301982		Mecánico Automotríz	Stgo. Rodriguez	Mantenimiento Automotríz	132204	10000156	A	1000
0001	10001873	PERALTA CABRERA ALEXI ALEJANDRO	046-0037250-4		Mecánico Automotríz	Stgo. Rodriguez	Mantenimiento Automotríz	132404	10000156	A	1000
0001	10002674	SHEDROEK ROMERO LUIS ANTONIO	001-0800546-3		Mecánico Automotríz	Sto. Dgo. Oeste	Mantenimiento Automotríz	132404	10002408	A	1001
0001	10003362	AGRAMONTE SUNSKY MANUEL	001-1931619-8		Mecánico Automotríz	Sto. Dgo. Oeste	Mantenimiento Automotríz	132404	10002408	A	1001
0001	10003378	CRUZ FLORENTINO FREDERICH	104-0022596-6		Mecánico Automotríz	Sto. Dgo. Oeste	Mantenimiento Automotríz	132404	10002408	A	1001
0001	10000092	ABREU PERALTA MOISES	4400065878		Parqueador De Flota Pesada	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10001192	BOURDIERD RODRIGUEZ ELPIDIO ENMANUEL	046-0034021-2		Parqueador De Flota Pesada	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10002335	DE JESUS DOMINGUEZ ANGEL	001-0836596-6		Soldador	Sto. Dgo. Oeste	Mantenimiento Automotríz	132404	10002408	A	1001
0001	10001771	COLON ESMAILIN ROELFI	116-0002393-8		AUXILIAR DE JARABE TERMINADO	Stgo. Rodriguez	Calidad	131203	10001708,10002680,10003384	A	1000
0001	10000098	JIMENEZ BAEZ ELADIO SIMON	4600324182		AUXILIAR DE ALM. CENTRAL DE PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000099	JUMELLES FEDERICO	4600048526		AUXILIAR DE ALM. CENTRAL DE PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000176	REYES NUÑEZ RIQUELMI ARSENICO	4600299194		AUXILIAR DE ALM. CENTRAL DE PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000196	GIL NUÑEZ TEOFILO ANTONIO	4500115912		Auxiliar de Carpintería	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000132	ESPINAL ESPINAL WILLIAM	4600227518		Auxiliar de Lavado Manual de Botellas	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000097	TEJADA GIL FRANCISCO ALBERTO	4600370029		Operador de Montacarga	Stgo. Rodriguez	Almacén Central de Producto Terminado	132402	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000131	PEÑA MOREL EXPEDITO DE JESUS	4600128724		Operador de Montacarga	Stgo. Rodriguez	Almacén Central de Producto Terminado	122001	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000174	PEREZ RAMOS JOSE ANTONIO	4600378956		Operador de Montacarga	Stgo. Rodriguez	Almacén Central de Producto Terminado	122001	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000234	SOSA CRUZ HERRY ANTONIO	3105130672		Operador de Montacarga	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10001364	PORTES CONTRERAS MARINO	001-1195867-4	mportes	Encargado De Almacén Centro Operativo	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001031	A	1001
0001	10000381	FELIX BRIGIDO	113869945		Mercaderista	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10001618	LOPEZ PEREZ JUAN ALBERTO	001-1489611-1		Mercaderista	Sto. Dgo. Oeste	Ventas	121001	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10000351	MERCADO FIGUEROA LUIS DEIVIS	117479931		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10000384	BATISTA DE JESUS ALQUIMEDES	136-0016125-4		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10000390	TAPIA ROBERTO	001-0865197-7		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10000400	TAPIA ROSARIO DARISON	229-0007577-5		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10000403	RODRIGUEZ VALDEZ JOSE LUIS	22900025747		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10000459	SANCHEZ FRANCO JUAN ANTONIO	1300366992		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10000469	DE LOS SANTOS DE LA CRUZ JOSE MIGUEL	001-1620565-9		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10000474	GARCIA GUTIERREZ JOSE ADAN	114685506		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10000485	CRUZ PEGUERO CESAR MARCELINO	4500167426		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10001053	CASANOVA PANIAGUA WILLIAM	110-0004789-1		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10001463	GENAO SANCHEZ PABLO MANUEL	031-0231558-1		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10001468	ALMONTE LOPEZ EUDYS RAMON	001-1480870-2		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10000350	FIGUEREO BAEZ ALEXANDER	016-0013199-7	afiguereo	Supervisor De Distribución	Sto. Dgo. Oeste	Distribución	122002	10003471	A	1001
0001	10002840	TORRES DARLIN	031-0477321-7		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10003534	Diaz Liz Joan Miguel	402-2232870-6		Pintor	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003531	Perez Garcia Richard	056-0154214-4		Auxiliar De Almacén	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10003532	Hernandez Camilo Giordany Virgilio	402-2056261-1		Asistente De Almacén Centro Operativo	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10003528	Maldonado Jose Adalberto	054-0086938-3		Auxiliar De Almacén	La Romana	Almacén De Centro Operativo	122006	10000869	A	1005
0001	10003529	Jimenez Medina Jaime Noel	295-0001921-0		Auxiliar De Almacén	La Romana	Almacén De Centro Operativo	122006	10000869	A	1005
0001	10000151	HERNANDEZ TEJADA AMAURY	3400457580	ahernandez	ASISTENTE DE ALM. CENTRAL DIST. Y DESM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10001222	A	1000
0001	10003221	GOMEZ RUMALDO ELVI RAFAEL	046-0037304-9		Asistente De Alm. De Insumos Y Mat. Prim	Stgo. Rodriguez	Logística	132305	10000998	A	1000
0001	10000241	SANTANA VARGAS ISMAEL ANTONIO	4600349221	isantana	Asistente de alm. de Material Retornable	Stgo. Rodriguez	Almacén Retornables	132307	10001222	A	1000
0001	10003330	PEREZ JAQUEZ ESMELDY MANUEL	046-0035792-7	mperez	Asistente de alm. de Material Retornable	Stgo. Rodriguez	Almacén Retornables	132307	10001222	A	1000
0001	10000145	BAEZ BAEZ FRANKLIN ANTONIO	3103980755		Asistente De Alm. De Suministros Div.	Stgo. Rodriguez	Almacén De Logística	132303	10000998	A	1000
0001	10000148	ESTEVEZ DIAZ REYES ANTONIO	4600338802		Asistente De Alm. De Suministros Div.	Stgo. Rodriguez	Almacén De Logística	132305	10000998	A	1000
0001	10000149	REYES INFANTE DOMINGO ANTONIO	4600294781		Asistente De Alm. De Suministros Div.	Stgo. Rodriguez	Almacén De Logística	132302	10000998	A	1000
0001	10000157	TORRES GUZMAN JUNIOR JESUS	11600025305		Asistente De Alm. De Suministros Div.	Stgo. Rodriguez	Almacén De Logística	132305	10000998	A	1000
0001	10000497	JUMELLES ORTIZ TEOFILO ISMAEL	4600383782		Asistente De Alm. De Suministros Div.	Stgo. Rodriguez	Almacén De Logística	132306	10000998	A	1000
0001	10000150	OVALLE OVALLE FRANKLIN MIGUEL	4600269254	fovalle	ASISTENTE DE ALMACEN CENTRAL PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10001222	A	1000
0001	10002764	CASTELLANOS ESTÉVEZ ADRIAM MANUEL	402-2025564-6	acastellanos	ASISTENTE DE ALMACEN CENTRAL PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10001222	A	1000
0001	10000601	TORRES POLANCO JUAN CARLOS	001-1442784-2		Asistente De Almacen Central Prod. Term.	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10000963	PIMENTEL MENDEZ BENJAMIN	010-0086627-5		Asistente De Almacén Centro Operativo	Azua	Almacén De Centro Operativo	122007	10001168	A	1006
0001	10002991	MENAGEN DRULLA ALEXIS	026-0108373-2		Asistente De Almacén Centro Operativo	Higuey	Almacén De Centro Operativo	122010	10000861	A	1010
0001	10003066	ZORRILLA RAMOS FRANCISCO ALBERTO	026-0103776-1		Asistente De Almacén Centro Operativo	La Romana	Almacén De Centro Operativo	122006	10000869	A	1005
0001	10002480	HERNANDEZ HINOJOSA BENITO BLADIMIR	136-0019585-6		Asistente De Almacén Centro Operativo	Nagua	Almacén De Centro Operativo	122009	10002575	A	1009
0001	10001072	CEBALLOS PIMENTEL YERFI FIODILIO	402-2102238-3		Asistente De Almacén Centro Operativo	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10002418	RAMOS JIMENEZ PEDRO ALEJANDRO	115-0000951-6		Asistente De Almacén Centro Operativo	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10000553	PIÑA GARCIA YONAL	011-0038208-2		Asistente De Almacén Centro Operativo	Sto. Dgo. Este	Almacén De Centro Operativo	132303	10000548	A	1002
0001	10000577	GARCIA TAVERAS LUIS ALBERTO	2301248809		Asistente De Almacén Centro Operativo	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10002548	MUÑOZ CONTRERAS FRANCISCO JAVIER	229-0001490-7		Asistente De Almacén Centro Operativo	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10002785	DOMINGUEZ ESTEVEZ NEOLY	402-2044381-2		Asistente De Almacén Centro Operativo	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10002665	CASTILLO ALFREDO	047-0170241-9		Auxiliar De Almacén	Nagua	Almacén De Centro Operativo	122009	10002575	A	1009
0001	10003359	CORONA BETANCES JOSE LUIS	001-1397365-5		Asistente De Almacén Centro Operativo	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003331	JAQUEZ RODRIGUEZ JUAN MANUEL	116-0001647-8		Asistente De Almacen De Desmedros	Stgo. Rodriguez	Almacén De Logística	132306	10000998	A	1000
0001	10002750	BÁEZ PILARTE LUÍS ALEJANDRO	402-2028011-5		Asistente De Almacen De Env. Y Emb.	Stgo. Rodriguez	Logística	132306	10000998	A	1000
0001	10000130	BAEZ VARGAS RAMON ANTONIO	4600288619		Asistente De Almacen De Preformas	Stgo. Rodriguez	Almacén De Logística	132306	10000998	A	1000
0001	10000147	GOMEZ SANCHEZ HAIRON	4600294609		Asistente De Almacen De Preformas	Stgo. Rodriguez	Logística	132303	10000998	A	1000
0001	10001809	YAP GUTIERREZ HECTOR PAOLO			Asistente De Almacen De Preformas	Stgo. Rodriguez	Almacén De Logística	132305	10000998	A	1000
0001	10000463	ALCANTARA DE LOS SANTOS MARILENNY	117571745	malcantara	Asistente De Compras	Sto. Dgo. Oeste	Compras De Logística	111009	10000342	A	1001
0001	10000081	RODRIGUEZ CARRASCO SANTO MIGUEL	4400111326	srodriguez	Asistente De Compras	Stgo. Rodriguez	Logística	111009	10001028	A	1000
0001	10000299	VELEZ RODRIGUEZ YUVERQUI DEL CARMEN	046-0034583-1	yvelez	Asistente De Compras	Stgo. Rodriguez	Compras De Logística	111009	10001028	A	1000
0001	10002453	MIESES MATEO ORFELINA	001-1348794-6	omieses	Asistente De Finanzas	Sto. Dgo. Oeste	Finanzas	111005	10000994	A	1001
0001	10000501	GIL VENTURA MARIA DEL CARMEN	112856315	mgil	Asistente De Gestion Humana	Sto. Dgo. Oeste	Gestión Humana	111008	10000269	A	1001
0001	10002860	VENTURA YOHANA YUSHARA		yventura	Asistente De Logistica	Sto. Dgo. Oeste	Logística	111009	10001029	A	1001
0001	10000225	ROSA DE LA ROSA OVENY DE LOS SANTOS	4600358396	orosa	Asistente De Logistica	Stgo. Rodriguez	Logística	111009	10001029	A	1000
0001	10000270	PERALTA LOPEZ RICHARD MANUEL	046-0028059-0	rperalta	Asistente De Logistica	Stgo. Rodriguez	Logística	132407	10001029	A	1000
0001	10003012	GEREZ OLIVO JAIRO GERMAN	046-0036360-2		Asistente de Mantenimiento	Stgo. Rodriguez	Mantenimiento de Edificaciones	132202	10001026	A	1000
0001	10000159	JIMENEZ ALMONTE JORGE DAVID	4600342531		ASISTENTE DE PRODUCCION	Stgo. Rodriguez	Producción	199992	10000144	A	1000
0001	10002292	LAZO SAYCO MICHAEL ERICK			ASISTENTE DE PRODUCCION	Stgo. Rodriguez	Producción	199992	10000144	A	1000
0001	10000274	CARABALLO BAEZ WILSON ANTONIO	046-0027810-7	wcaraballo	Asistente De Tesorería	Stgo. Rodriguez	Finanzas	111006	10000273	A	1000
0001	10000001	AQUINO MINAYA RAMON ANTONIO	4600344404		ASISTENTE DE TURNO	Stgo. Rodriguez	Producción	199992	10000144	A	1000
0001	10000006	DURAN BELLIARD JOSE LUIS	4600353405		ASISTENTE DE TURNO	Stgo. Rodriguez	Producción	132401	10000144	A	1000
0001	10001173	ORTIZ PERDOMO SAMUEL OSIRIS	073-0015020-3		ASISTENTE DE TURNO	Stgo. Rodriguez	Producción	132401	10000144	A	1000
0001	10000011	GIL TORRES WILSON RAFAEL	3104243245		ASISTENTE DE TURNO OPERATIVO	Stgo. Rodriguez	Producción	132401	10000144	A	1000
0001	10001963	PLATA ADAMES ARABELLYS	6800492016	aplata	Asistente De Verificación De Facturas	Sto. Dgo. Oeste	Contabilidad	111005	10000989	A	1001
0001	10001337	GOMEZ RODRIGUEZ DIOSMERY	046-0037176-1	dgomez	ASISTENTE DE VIGILANCIA MICROBIOLOGICA	Stgo. Rodriguez	Calidad	132101	10001006	A	1000
0001	10003339	PIMENTEL GARCIA ANA NIDELKA	4400196368	apimentel	ASISTENTE DE VIGILANCIA MICROBIOLOGICA	Stgo. Rodriguez	Calidad	132101	10001024	A	1000
0001	10002907	PINEDO REA MARIA DE  PILAR MELANIE		mpinedo	Asistente Senior De Logistica	Sto. Dgo. Oeste	Logística	111009	10001029	A	1001
0001	10000071	RAMOS PEREZ DOMINGO ANTONIO	4600119608		AUXILIAR DE ALM. CENTRAL DE PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000094	ZAPATA DOMINGO ANTONIO	3102188079		AUXILIAR DE ALM. CENTRAL DE PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000235	TORIBIO DURAN JORGE LUIS	4600367702		AUXILIAR DE ALM. CENTRAL DE PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000236	PEREZ RAMOS AURELIO DEL CARMEN	4600340477		AUXILIAR DE ALM. CENTRAL DE PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000266	GARCIA GOMEZ JUAN GABRIEL	11500003626		AUXILIAR DE ALM. CENTRAL DE PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10001504	ROSA DE LA ROSA GUILLERMO DEL CARMEN	046-0024717-7		AUXILIAR DE ALM. CENTRAL DE PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10002197	TORRES TEJADA FREYDY DE JESUS	046-0037492-2		AUXILIAR DE ALM. CENTRAL DE PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10002495	JAQUEZ PIMENTEL RADALBERTO DE JESUS	4600364998		AUXILIAR DE ALM. CENTRAL DE PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10002502	PERALTA RODRIGUEZ MIGUEL ANGEL	046-0038870-8		AUXILIAR DE ALM. CENTRAL DE PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10002621	PERALTA JOSE RAFAEL	046-0004608-2		AUXILIAR DE ALM. CENTRAL DE PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10002818	NUÑEZ JIMENEZ WILLIAM ANTONIO	046-0038739-5		AUXILIAR DE ALM. CENTRAL DE PROD. TERM.	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000935	BELTRE SANCHEZ SERGIDO	1000656452		Auxiliar De Almacén	Azua	Almacén De Centro Operativo	122007	10001168	A	1006
0001	10000943	VARGAS LUCIANO ALBARO	1000467272		Auxiliar De Almacén	Azua	Almacén De Centro Operativo	122007	10001168	A	1006
0001	10001130	ROSADO BATISTA LIMBERT	010-0086675-4		Auxiliar De Almacén	Azua	Almacén De Centro Operativo	122007	10001168	A	1006
0001	10002444	OVANDO CLAUDIO BIENVENIDO	010-0047745-3		Auxiliar De Almacén	Azua	Almacén De Centro Operativo	122007	10001168	A	1006
0001	10002732	LAGARES GRACÍA WILSON	015-0005577-5		Auxiliar De Almacén	Azua	Almacén De Centro Operativo	122007	10001168	A	1006
0001	10002963	MARTINEZ GIL FRANKLIN ALEXIS	010-0088918-6		Auxiliar De Almacén	Azua	Almacén De Centro Operativo	122007	10001168	A	1006
0001	10003124	RAMIREZ BENITO VICTORIANO	010-0063824-5		Auxiliar De Almacén	Azua	Almacén De Centro Operativo	122007	10001168	A	1006
0001	10002714	SANTANA RIJO CRISTIAN	028-0103336-2		Auxiliar De Almacén	Higuey	Almacén De Centro Operativo	122010	10000861	A	1010
0001	10002739	SURIEL ROSARIO FAUSTINO	029-0017279-8		Auxiliar De Almacén	Higuey	Almacén De Centro Operativo	122010	10000861	A	1010
0001	10002909	MARTINEZ FRANCISCO JAVIER	402-2176232-7		Auxiliar De Almacén	Higuey	Almacén De Centro Operativo	122010	10000861	A	1010
0001	10002992	MICHEL DESY ROBERTO	028-0087103-6		Auxiliar De Almacén	Higuey	Almacén De Centro Operativo	122010	10000861	A	1010
0001	10003256	RAPOSO CEBALLOS RAYMUNDO	402-2268857-0		Auxiliar De Almacén	Higuey	Almacén De Centro Operativo	122010	10000861	A	1010
0001	10003260	CHARLES DEMETILICE FELIX	103-0010010-3		Auxiliar De Almacén	Higuey	Almacén De Centro Operativo	122010	10000861	A	1010
0001	10002904	SEGURA JESUS MIGUEL	295-0001115-9		Auxiliar De Almacén	La Romana	Distribución	122006	10000869	A	1005
0001	10003064	NUÑEZ RODRIGUEZ MALVIN ESTIBISON	026-0139660-5		Auxiliar De Almacén	La Romana	Almacén De Centro Operativo	122006	10000869	A	1005
0001	10003165	BIENEME MEDINA CLAUDIO EMILIO	026-0110353-0		Auxiliar De Almacén	La Romana	Ventas	122006	10000869	A	1005
0001	10003183	FELICIANO REYES PATRICIO	295-0000646-4		Auxiliar De Almacén	La Romana	Ventas	122006	10000869	A	1005
0001	10003259	MERCEDES OLIVERO PASTOR MANUEL	026-0131880-7		Auxiliar De Almacén	La Romana	Almacén De Centro Operativo	122006	10000869	A	1005
0001	10003318	BERAS CABRERA DELFIN	026-0125247-7		Auxiliar De Almacén	La Romana	Almacén De Centro Operativo	122006	10000869	A	1005
0001	10003524	SANCHEZ DE LA CRUZ ROBERT ALEXANDER	402-2223235-3		Auxiliar De Almacén	La Romana	Almacén De Centro Operativo	122006	10000869	A	1005
0001	10002668	CANDELARIO PEÑA FRANKLIN	136-0010914-7		Auxiliar De Almacén	Nagua	Almacén De Centro Operativo	122009	10002575	A	1009
0001	10003155	PAULINO FRIAS JULIO CESAR	136-0019948-6		Auxiliar De Almacén	Nagua	Almacén De Centro Operativo	122009	10002575	A	1009
0001	10003343	BENITEZ SANTOS JOSE LUIS	402-2035264-1		Auxiliar De Almacén	Nagua	Almacén De Centro Operativo	122009	10002575	A	1009
0001	10000913	DOMINGUEZ ALVAREZ JUSTINO ANTONIO	041-0007367-7		Auxiliar De Almacén	Puerto Plata	Almacén De Centro Operativo	122008	10001182	A	1007
0001	10000923	SANTANA FELIZ YOHANDI	018-0066780-8		Auxiliar De Almacén	Puerto Plata	Almacén De Centro Operativo	122008	10001182	A	1007
0001	10001491	RODRIGUEZ LIRIANO EDISON	037-0116078-4		Auxiliar De Almacén	Puerto Plata	Almacén De Centro Operativo	122008	10001182	A	1007
0001	10002615	NUESI UREÑA JOSE LUIS	097-0025455-1		Auxiliar De Almacén	Puerto Plata	Almacén De Centro Operativo	122008	10001182	A	1007
0001	10002694	BATISTA ALMONTE VICTOR EDIVEL	120-0001857-7		Auxiliar De Almacén	Puerto Plata	Almacén De Centro Operativo	122008	10001182	A	1007
0001	10003076	VIDAL GONZALEZ FAUSTO IGNACIO	001-1471056-9		Auxiliar De Almacén	Puerto Plata	Almacén De Centro Operativo	122008	10001182	A	1007
0001	10003160	SANTOS MERCEDES RODELIN	402-2116002-7		Auxiliar De Almacén	Puerto Plata	Almacén De Centro Operativo	122008	10001182	A	1007
0001	10003180	MERCEDES DE JESUS ADRIANO	056-0143070-4		Auxiliar De Almacén	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10002988	HIDALGO CABRERA LUIS ALBERTO	046-0031205-4		Auxiliar De Almacén	Stgo. Rodriguez	Logística	132307	10000998	A	1000
0001	10000525	RODRIGUEZ RAMOS JUSTINO MARTIR	112065578		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10000542	ROSADO CONTRERAS MILTON ORLANDO	012-0072611-3		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10000571	CASILLA FELIZ EDWARD ANTONIO	012-0080007-4		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10000593	REYES MATOS ABELITO	010-0028238-2		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10001277	AQUINO WELLINGTON	223-0039923-9		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10001281	CELODONIO CELODONIO AMAURI NEGRO	223-0137858-8		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10001333	DE LA CRUZ VICTORIANO RAMON	109-0007295-9		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10001486	GUZMAN CAPOIS DIEGO ARMANDO	223-0067700-6		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10002214	MARTINEZ RAMIREZ JUNIOR	402-2101952-0		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10002314	CASTRO MERAN PEDRO LUIS	223-0046302-7		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10002889	CASTILLO CLARK FRANK	001-1696020-4		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10002893	MERCEDES ROBLES DENNYS	402-2251020-4		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10002898	CARRASCO MONTAÑO JORGE LUIS	223-0012621-0		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10002903	ENCARNACION MORA HECTOR RAFAEL	22301239046		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10003059	SANDOVAL ALVARO LUIS	223-0011964-5		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10003324	FLORES SANCHEZ ANGEL VICENTE	223-0109679-2		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10003326	CUEVAS PEÑA WILVIN	076-0017283-2		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10003337	CASTILLO MATOS GENIEL ZEQUIEL	402-2387959-0		Auxiliar De Almacén	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10000364	CABRAL FELIPE	001-1055802-0		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10000382	ACOSTA PERCIO ANTONIO	001-0822806-5		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10001471	REYES DE LA CRUZ JERDI RAMON	4900738149		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10001880	PEREZ RAMIREZ NELSON ESTIVEN	40221154442		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10002350	ALCANTARA GEMAN RAFAEL	001-1539865-3		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10002672	GARCIA BOCIO JOAQUIN MANUEL	229-0003860-9		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10002721	LORA UREÑA JUAN	123-0012884-5		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10002784	BENITEZ DAVID NOE	001-1827969-4		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10002799	OGANDO VARGAS HECTOR LUIS	011-0042394-4		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10002922	ALCANTARA SANCHEZ FELIX	012-0086874-1		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003104	ALCALA TORRES PEDRO JULIO	229-0022947-1		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003106	BETANCOURT MARTINEZ EMEHAURY ANTONIO	001-1712358-8		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003128	FRIAS PAULINO WELLINGTON VICENTE	001-1391411-3		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003206	VALDEZ ROSARIO CARLOS MANUEL	001-1341082-3		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003225	GUZMAN GUZMAN OSCAR JOSE	224-0064545-7		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003227	MADE DIAZ YERFIN LEANDRO	229-0008701-0		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003229	BATISTA DIAZ EDDY ANTONIO	001-1385270-1		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003265	SANTOS DIAZ LEONARDO	402-2338458-3		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003266	VICENTE ZABALA JOSE MIGUEL	229-0022445-6		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003276	VICENTE FELIZ LUIS MIGUEL	224-0058181-9		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003333	RAMIREZ DE LA ROSA JORGE LUIS	228-0002636-5		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003334	EVANGELISTA DEL PLATA MIGUEL ANGEL	224-0003176-5		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003419	MATEO REYES REYES	229-0019237-2		Auxiliar De Almacén	Sto. Dgo. Oeste	Almacén De Centro Operativo	122002	10001364	A	1001
0001	10003126	SEPULVEDA HERNANDEZ JEFERSON MANUEL	225-0033339-2		Auxiliar De Auditoria Interna	Sto. Dgo. Oeste	Auditoría Interna	111007	10003022	A	1001
0001	10001185	TORRES ESTEVEZ JUAN DANILO	046-0035150-8		Auxiliar de Carpintería	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10001505	JAQUEZ NUÑEZ KENI ANTONIO	046-0006309-5		Auxiliar de Carpintería	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000125	GOMEZ GARCIA SERAFIN DE JESUS	4600158143		AUXILIAR DE HIGIENE	Stgo. Rodriguez	Calidad	132101	10001036	A	1000
0001	10000181	JUMELLES MANUEL ANTONIO	4600048542		AUXILIAR DE HIGIENE	Stgo. Rodriguez	Calidad	132101	10001036	A	1000
0001	10000263	NUNEZ CECILIO IGNACIO	4600048880		AUXILIAR DE HIGIENE	Stgo. Rodriguez	Calidad	132101	10001036	A	1000
0001	10000276	PERALTA RODRIGUEZ YANERY DEL CARMEN	046-0004928-4		AUXILIAR DE HIGIENE	Stgo. Rodriguez	Calidad	132101	10001036	A	1000
0001	10000323	RODRIGUEZ LUCIA LEONIDA	9400076403		AUXILIAR DE HIGIENE	Stgo. Rodriguez	Calidad	132101	10001036	A	1000
0001	10001410	GOMEZ ESTEVEZ RAMONCITO DEL CARMEN	001-0047733-0		AUXILIAR DE HIGIENE	Stgo. Rodriguez	Calidad	132101	10001036	A	1000
0001	10002323	LAMAR NUÑEZ LUIS MANUEL	046-0034351-3		AUXILIAR DE HIGIENE	Stgo. Rodriguez	Calidad	132101	10001036	A	1000
0001	10002474	SANTOS ESTEVEZ ANGEL DE JESUS	046-0037796-6		AUXILIAR DE HIGIENE	Stgo. Rodriguez	Calidad	132101	10001036	A	1000
0001	10002671	RODRIGUEZ GIL SOLANYI RAMONA	046-0004969-8		AUXILIAR DE HIGIENE	Stgo. Rodriguez	Calidad	132101	10001036	A	1000
0001	10000116	ALMONTE UREÑA VICTOR MANUEL	4600374724		AUXILIAR DE JARABE CLARIFICADO	Stgo. Rodriguez	Calidad	131202	10001708,10002680,10003384	A	1000
0001	10000129	VALERIO RODRIGUEZ WILKIN FRANCISCO	4600387205		AUXILIAR DE JARABE CLARIFICADO	Stgo. Rodriguez	Calidad	131202	10001708,10002680,10003384	A	1000
0001	10002564	TAVAREZ RAMIREZ EUSEBIO	035-0015508-4		AUXILIAR DE JARABE CLARIFICADO	Stgo. Rodriguez	Calidad	131201	10001708,10002680,10003384	A	1000
0001	10001673	MARIA CASTILLO DIOSCORIDES	4600320669		AUXILIAR DE JARABE SIMPLE	Stgo. Rodriguez	Calidad	131201	10001708,10002680,10003384	A	1000
0001	10001768	TORRES BELLIARD RAIMUNDO ANTONIO	046-0036847-8		AUXILIAR DE JARABE SIMPLE	Stgo. Rodriguez	Calidad	131201	10001708,10002680,10003384	A	1000
0001	10001840	ALMANZAR MEDINA ROBERTO SANTIAGO	4600274965		AUXILIAR DE JARABE SIMPLE	Stgo. Rodriguez	Calidad	131201	10001708,10002680,10003384	A	1000
0001	10002873	TEJADA GARCIA ROBERT REYNALDI	402-2109344-2		AUXILIAR DE JARABE SIMPLE	Stgo. Rodriguez	Calidad	131201	10001708,10002680,10003384	A	1000
0001	10000127	ESTEVEZ BEJARAN YSAUDY PORTOLATIN	4600387767		AUXILIAR DE JARABE TERMINADO	Stgo. Rodriguez	Calidad	131203	10001708,10002680,10003384	A	1000
0001	10000019	NUÑEZ NUÑEZ LUIS FERMIN	3102365792		Auxiliar de Lavado Manual de Botellas	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000223	MUÑOZ LUIS MANUEL	4600148714		Auxiliar de Lavado Manual de Botellas	Stgo. Rodriguez	Almacén Central de Producto Terminado	199992	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000089	BAEZ ESTEVEZ ROBERTO ANTONIO	4600099883		Auxiliar de Limpieza	Stgo. Rodriguez	Producción	132402	10000146,10000155	A	1000
0001	10000190	RODRIGUEZ REYES CRISTIAN DE JESUS	046-0033421-5		Auxiliar De Limpieza	Stgo. Rodriguez	Almacén De Logística	132304	10000998	A	1000
0001	10000265	TORRES REYES WILLIAM JOSE	046-0023088-4		Auxiliar de Limpieza	Stgo. Rodriguez	Producción	132402	10000146,10000155	A	1000
0001	10001459	JUMELLEZ ORTIZ DOMINGO ANTONIO	046-0038605-8		Auxiliar De Limpieza	Stgo. Rodriguez	Almacén De Logística	132308	10000998	A	1000
0001	10001501	TORIBIO TORIBIO ELVIS	031-0549223-9		Auxiliar de Limpieza	Stgo. Rodriguez	Mantenimiento de Edificaciones	132202	10001026	A	1000
0001	10001821	TORRES TORRES RAMON ANTONIO	046-0034750-6		Auxiliar De Limpieza	Stgo. Rodriguez	Almacén De Logística	132303	10000998	A	1000
0001	10002087	VARGAS RODRIGUEZ JAIRON ANTONIO	402-2050194-0		Auxiliar De Limpieza	Stgo. Rodriguez	Logística	132304	10000998	A	1000
0001	10002432	PEREZ ZAPATA RAMON ARIEL	046-0039354-2		Auxiliar De Limpieza	Stgo. Rodriguez	Almacén De Logística	132305	10000998	A	1000
0001	10002433	MONCION TEJADA RANFIS OCTAVIO	402-2117831-8		Auxiliar De Limpieza	Stgo. Rodriguez	Almacén De Logística	132304	10000998	A	1000
0001	10003147	RODRIGUEZ TORRES ANEURI MANUEL	026-0145736-5		Auxiliar De Limpieza	Stgo. Rodriguez	Logística	132304	10000998	A	1000
0001	10003150	RODRIGUEZ VIDAL RAMON DE JESUS	046-0031168-4		Auxiliar De Limpieza	Stgo. Rodriguez	Logística	132304	10000998	A	1000
0001	10003345	RODRIGUEZ VARGAS JUAN IGNACIO	402-2419342-1		Auxiliar De Limpieza	Stgo. Rodriguez	Logística	132304	10000998	A	1000
0001	10003367	FLORES REYES RAIFY RAMON	046-0040647-6		Auxiliar De Limpieza	Stgo. Rodriguez	Logística	132304	10000998	A	1000
0001	10000042	BAEZ BAEZ ROMERICO ANT.	4600096418		Auxiliar de Línea	Stgo. Rodriguez	Producción	131406	10000146,10000155	A	1000
0001	10000086	RODRIGUEZ VIDAL ANGEL ANTONIO	4600284998		Auxiliar de Línea	Stgo. Rodriguez	Producción	131404	10000146,10000155	A	1000
0001	10000100	LANTIGUA LUGO JOSE MANUEL	4600110979		Auxiliar de Línea	Stgo. Rodriguez	Producción	131401	10000146,10000155	A	1000
0001	10000160	RODRIGUEZ LOPEZ KENY MIGUEL	4600284907		Auxiliar de Línea	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10000165	NUÑEZ RODRIGUEZ ALBERTO JOSE	4600327797		Auxiliar de Línea	Stgo. Rodriguez	Producción	131306	10000146,10000155	A	1000
0001	10000166	JUMELLE REYES JOSE MANUEL	4600389607		Auxiliar de Línea	Stgo. Rodriguez	Producción	131406	10000146,10000155	A	1000
0001	10000172	RODRIGUEZ TEJADA RICARDO	3103929075		Auxiliar de Línea	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10000191	ESTEVEZ FAUSTO SINENCIO	4600117651		Auxiliar de Línea	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10000210	GOMEZ ALVAREZ PEDRO JUAN	4600292520		Auxiliar de Línea	Stgo. Rodriguez	Producción	131406	10000146,10000155	A	1000
0001	10000217	ALMONTE MARTINEZ FRANCISCO JAVIER	4600392437		Auxiliar de Línea	Stgo. Rodriguez	Producción	131404	10000146,10000155	A	1000
0001	10001105	OSORIA GIL REY CLEMENTE	046-0037182-9		Auxiliar de Línea	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10001153	BAEZ TEJADA FAUSTO DE JESUS	046-0009353-0		Auxiliar de Línea	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10001154	CABRERA ALFONZO JOSE LUIS	046-0032449-7		Auxiliar de Línea	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10001178	CRUZ RODRIGUEZ ELYSAUL	046-0039168-6		Auxiliar de Línea	Stgo. Rodriguez	Producción	131405	10000146,10000155	A	1000
0001	10001298	PEÑA BOURDIERD JOSE ROBERTO DE LOS SANTO	046-0036761-1		Auxiliar de Línea	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10001349	ROSARIO UREÑA VICTOR MANUEL	046-0033972-7		Auxiliar de Línea	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10001350	BAEZ TEJADA SANDY DE JESUS	046-0033794-5		Auxiliar de Línea	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10001354	RODRIGUEZ ECHAVARRIA MIGUEL DE JESUS	046-0038160-4		Auxiliar de Línea	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10001395	RODRIGUEZ NUÑEZ LUIS NICOLAS	046-0033625-1		Auxiliar de Línea	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10001396	GOMEZ BELLO WARNER	046-0034556-7		Auxiliar de Línea	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10001512	PERALTA NUÑEZ TOMI DE JESUS	4600269122		Auxiliar de Línea	Stgo. Rodriguez	Producción	122001	10000146,10000155	A	1000
0001	10001829	TEJADA RODRIGUEZ KELVIN ANTONIO	402-2057096-0		Auxiliar de Línea	Stgo. Rodriguez	Producción	131401	10000146,10000155	A	1000
0001	10001830	PERALTA OVALLE ALEXIS MANUEL	4600337457		Auxiliar de Línea	Stgo. Rodriguez	Producción	131401	10000146,10000155	A	1000
0001	10001888	PERALTA NUÑEZ VICTOR ANDRES	046-0032102-2		Auxiliar de Línea	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10001938	PEREZ BAEZ JOSE MIGUEL	11600027350		Auxiliar de Línea	Stgo. Rodriguez	Producción	131306	10000146,10000155	A	1000
0001	10001939	TAVAREZ CRUZ CALEB	4600269338		Auxiliar de Línea	Stgo. Rodriguez	Producción	131306	10000146,10000155	A	1000
0001	10002619	ARIAS PEREZ JULIO CESAR	031-0566054-6		Auxiliar de Línea	Stgo. Rodriguez	Producción	131401	10000146,10000155	A	1000
0001	10002620	MARIÑEZ RODRIGUEZ PEDRO RAMON	115-0001887-1		Auxiliar de Línea	Stgo. Rodriguez	Producción	131401	10000146,10000155	A	1000
0001	10002646	QUIÑONES BAEZ FULVIO FEDERICO	046-0027595-4		Auxiliar de Línea	Stgo. Rodriguez	Producción	131401	10000146,10000155	A	1000
0001	10002654	GOMEZ LUIS ALEXANDER	046-0039682-6		Auxiliar de Línea	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10002670	TORIBIO TEJADA EDWIN RAFAEL	046-0035599-6		Auxiliar de Línea	Stgo. Rodriguez	Producción	131404	10000146,10000155	A	1000
0001	10002722	TORRES RODRIGUEZ ALEXIS DE JESUS	046-0039042-3		Auxiliar de Línea	Stgo. Rodriguez	Producción	131401	10000146,10000155	A	1000
0001	10002760	GARCÍA PERALTA ADEWIN DE JESÚS	402-2259065-1		Auxiliar de Línea	Stgo. Rodriguez	Producción	131401	10000146,10000155	A	1000
0001	10002762	ORTÍZ REYES RUBEN DARÍO	402-2025431-8		Auxiliar de Línea	Stgo. Rodriguez	Producción	131401	10000146,10000155	A	1000
0001	10002766	BÁEZ BRAYAN JOSSIEL	046-0039549-7		Auxiliar de Línea	Stgo. Rodriguez	Producción	131401	10000146,10000155	A	1000
0001	10002832	NUÑEZ TORIBIO CONSORCIO RAFAEL	116-0001569-4		Auxiliar de Línea	Stgo. Rodriguez	Producción	131406	10000146,10000155	A	1000
0001	10002833	TAVAREZ TINEO YONEL ANTONIO	046-0039116-5		Auxiliar de Línea	Stgo. Rodriguez	Producción	131406	10000146,10000155	A	1000
0001	10002865	ESTEVEZ ALBERTO DE JESUS	046-0039990-3		Auxiliar de Línea	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10002924	TORRES TORRES CARLOS EDWYN	046-0034826-4		Auxiliar de Línea	Stgo. Rodriguez	Producción	131404	10000146,10000155	A	1000
0001	10003004	SANCHEZ VARGAS RAFAEL ALEXANDER	402-2180081-2		Auxiliar de Línea	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10003005	SANTOS VALENZUELA RAMON ALBERTO	046-0037913-7		Auxiliar de Línea	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10003058	TORRES LECLERC FELIX JAVIER	046-0035965-9		Auxiliar de Línea	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10003261	GOMEZ PERALTA GILSON MICHEL	402-2243578-2		Auxiliar de Línea	Stgo. Rodriguez	Producción	131404	10000146,10000155	A	1000
0001	10003469	FERNANDEZ ORTEGA ANDRYS YOEL	046-0040396-0		Auxiliar de Línea	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10003470	TORRES GUTIERREZ RAY MICHEL	046-0039794-9		Auxiliar de Línea	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10000219	ESPINAL TORRES JENSO RAFAEL	40220437343		AUXILIAR DE MERMAS	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10001230	PEÑA FENANDEZ CRISTIAN JAVIER	116-0001719-5		AUXILIAR DE MERMAS	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10001905	VARGAS CASTILLO ELVIN DEL CARMEN	046-0035860-2		AUXILIAR DE MERMAS	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10000958	RAMIREZ MORETA JUAN BAUTISTA	010-0094981-6		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10000967	ROSSO MONTERO ATANAHEL	40223736741		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10001197	MEJIA MENDEZ FREDDY FRANK LUIS	010-0111188-7		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10001557	WANDER GARRIDO ROBERT	107-0001969-7		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10001693	RAMIREZ JIMENEZ GILBERT ERASMO	010-0107320-2		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10002356	JIMENEZ MATOS ANIBAL ANTONIO	010-0079260-4		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10002633	MATOS CIPRIAN ROBERTO	010-0087814-8		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10002634	FABIAN DIAZ HECTOR JULIO	010-0105704-9		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10002910	MELO DOMINGUEZ RENATO JOSE	1001160868		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10002911	SUAZO BARREIRO ANDRWY LIZANDRO	010-0106861-6		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10002987	CUSTODIO PIMENTEL JOLSON DANIEL	010-0105784-1		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10003061	SANCHEZ LEANDRO JOSE	010-0103235-6		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10003123	CUEVAS CIPRIAN LENIN YERMAN	010-0094766-1		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10003202	CUSTODIO REYES FRANCISCO MICHAEL	010-0097070-5		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10003203	DE LA ROSA SANTANA ELPIDIO ANEUDI	010-0098428-4		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10003204	DOMINGUEZ AYBAR PERSIS MARQUEL	107-0002078-6		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10003348	CARABALLO PEÑA RODORFO	010-0113324-6		Auxiliar De Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10001699	GUERRERO MEJIA JAVIER ANDRES	026-0074424-3		Auxiliar De Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002627	MERCEDES MEJIA ELIAS	026-0107372-5		Auxiliar De Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002630	GONZALEZ SOSA ORANGEL DELFIN	026-0122086-2		Auxiliar De Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002716	GUERRERO LISANDRO	026-0074290-8		Auxiliar De Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002736	MERCEDES GRACÍA MARIO ANTONIO	295-0004118-0		Auxiliar De Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002737	FIGUEROA SOLANO SANTIAGO	402-2229594-7		Auxiliar De Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002742	SOLER SEVERINO NICO ALEXANDER	402-2300292-0		Auxiliar De Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002743	JIMÉNEZ CASTRO HENRY ARIEL	026-0142606-3		Auxiliar De Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002905	SOLIBEY SANCHEZ MIGUEL ANTONIO	026-0136899-2		Auxiliar De Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002985	PAULINO JIMENEZ FEN EMELI	026-0075000-0		Auxiliar De Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10003019	CEDANO BELLIARD ISAAC ENRIQUE	402-2268388-6		Auxiliar De Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10003370	GUERRERO PALACIOS RONNY	026-0131490-5		Auxiliar De Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10003514	THEN SILVIO	136-0019522-9		Auxiliar De Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10000908	ESTEVEZ BONILLA JOSE LUIS	3701129896		Auxiliar De Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10000917	GARCIA BONILLA VICTOR ARMANDO	037-0113364-1		Auxiliar De Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10000919	TORRES JORGE JULIO CESAR	9000213257		Auxiliar De Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10000820	CRUZ MEJIA ODALIS	001-0870400-8		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10001986	ESCARFULLER RODINSON FRANCISCO	045-0018587-3		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10002521	VARGAS CABADA JHOAN MANUEL DE JESUS	056-0163613-6		Auxiliar De Repartidor	San Francisco	Ventas	122005	10000787	A	1004
0001	10002728	ESCAÑO HERNÁNDEZ LUÍS MANUEL	056-0143722-0		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10002729	MADERA LORA HOSNAL MISSAEL	056-0173150-7		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10002916	THEN REYNOSO JUAN CARLOS	056-0179111-3		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003208	VARGAS DE LA CRUZ TOMAS	056-0106663-1		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003213	SANTOS REYNOSO STARLIN	402-2006569-8		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003222	CARPIO BUENO JUAN DE JESUS	056-0122635-9		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003262	DE LA ROSA JAVIER ANDY LUIS	402-2214598-5		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003263	GOMEZ GARCIA CARLOS DANIEL	402-2111276-2		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003434	PRADO BETANCES RANDY MANUEL	056-0167785-8		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003435	GARCIA GARCIA ONIEL ALFONSO	056-0094180-0		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003437	FIGUEROA GRULLON EMMANUEL	119-0004831-2		Auxiliar De Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10000679	MARTINEZ ROJAS CARLOS EDUVINIO	037-0050646-6		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000708	RODRIGUEZ UREÑA ISIDRO	143-0000100-6		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000710	LENDOF LUCIANO ANDRES VLADIMIR	031-0478215-0		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000715	DE LA CRUZ SANCHEZ ALBERTO	031-0288397-6		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000718	CASTILLO DE LEON JOSE GABRIEL	402-2116354-2		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000720	SILVERIO POLANCO CARLOS MANUEL	031-0488959-1		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000732	GARCIA LACHAPELLE ELIEZER ANTONIO	047-0195243-6		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000733	MORA PEÑA ELVIN FRANCISCO	402-2080465-8		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000734	RAMOS ROSARIO PEDRO LUIS	3800172201		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000743	ROSADO SALDAÑA JHON KALY	031-0542655-9		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000756	FERNANDEZ PEREZ JOSE LUIS	15100000601		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000757	TAVARES DOMINGUEZ JHONATTAN MANUEL	40220249425		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001129	GARCIA VELOZ EDDY MARTIN	3100565625		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001136	TORIBIO MARCOS	11600000944		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001158	MATOS MENDEZ DAWIN OSCAR	3104761923		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001427	DELGADO DELGADO ERNESTO	017-0020029-6		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001430	AYBAR POLANCO RICHARD MARCIANO	031-0526358-0		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001433	AGUILERA COLLADO YOELY DE JESUS	3600411452		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001952	CORDERO AMPARO JONATHAN	031-0507901-0		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001961	ALVAREZ ALCANTARA ELVIN	3101127037		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001990	TAVAREZ TORRES RAMON EMILIO	4600329959		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002014	RODRIGUEZ CABRERA RICARDO JOSE	9400226263		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002030	SANTOS MARTE DARI FABEL	031-0505636-4		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002381	SANCHEZ MARTINEZ ROBERT OVIELSON	039-0022403-5		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002417	CORDERO BAEZ CARLOS MANUEL	115-0000595-1		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002541	PEREZ VARGAS RODY JOSE	031-0530658-7		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002577	PERDOMO HERRERA JORGE LUIS	045-0023318-6		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002579	RODRIGUEZ POLANCO JUNIOR ANTONIO	031-0421543-3		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002688	ESTRELLA NUÑEZ HENRY	402-2195257-1		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002689	GARCIA FERMIN FRANQUE	121-0009747-1		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002848	VENTURA RAMOS ELVY ANTONIO	034-0055897-3		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002871	MERCADO PEREZ CLAUDIO ALEJANDRO	031-0481987-9		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002876	TORRES GARCIA CARLOS DAVID	402-2307977-9		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002981	PUJOLS FELIZ GREISSEL ELIAS	010-0106602-4		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002982	VARGAS MONCION JOSE LUIS	115-0000080-4		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003214	CONCEPCION HECTOR MIGUEL	031-0501621-0		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003294	MADERA SAUL ESTEBAN	096-0021528-0		Auxiliar De Repartidor	Santiago	Ventas	122004	10000672,10001988	A	1003
0001	10003295	PEREZ NUÑEZ CARLOS MANUEL	031-0496502-9		Auxiliar De Repartidor	Santiago	Ventas	122004	10000672,10001988	A	1003
0001	10003296	MATEO MEDINA JAIRO	043-0005238-0		Auxiliar De Repartidor	Santiago	Ventas	122004	10000672,10001988	A	1003
0001	10003350	UCETA RIVAS DANILO ARMANDO	031-0549395-5		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003351	RODRIGUEZ PERALTA JOSE OSIRIS	036-0041265-8		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003352	ZAPATA VENTURA FRANCISCO JAVIER	092-0014767-7		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003354	COLON PAULINO ALEJANDRO RAFAEL	402-2119106-3		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003375	MENA ACOSTA ALFRED ELEUDY	402-2327679-7		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003482	RODRIGUEZ RODRIGUEZ JOSE FELIX	031-0517137-9		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003485	MARTINEZ SELDA WILDER ELISAUL	031-0536147-5		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003504	DURAN CHAVEZ JULIO ANGEL	034-0054688-7		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003505	DIAZ MOQUETE JEAN CARLOS	402-2265034-9		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003506	MATIAS ESTRELLA STARLYN JOEL	031-0508630-4		Auxiliar De Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000587	GOMEZ PEREZ CARLOS	2100066618		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10001068	DIAZ MENDEZ RAMON	103924023		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10001271	MONTERO MENDEZ JUNIOR ALEXANDER	2200312763		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10001272	MATOS MADRIGAL EDWARD RAMON	223-0091970-5		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10001378	LIRIANO ABAD MODESTO	223-0010018-1		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10001380	FELIZ BASILIO MAXIMO RAMON	229-0015536-1		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10001483	DE LA CRUZ DIAZ MARKYS RAMEL	090-0022864-4		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10001806	HENRIQUEZ HENRIQUEZ OLIVER	223-0125342-7		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002028	VIDAL LAUREANO EMMANUEL	223-0148114-3		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002556	ARIAS MORILLO JUAN BAUTISTA	105-0000441-0		Auxiliar De Repartidor	Sto. Dgo. Este	Ventas	122003	10003254,10003255	A	1002
0001	10002600	GUZMAN DE LA ROSA YOVANNY	223-0090384-0		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002601	MORA OSORIO ENMANUEL	223-0135444-9		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002602	FLORIAN FLORIAN RAMON	223-0096364-6		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002637	REYES REYES JULIO CESAR	402-2144926-3		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002638	CUEVAS MEDINA JUAN MARTIRES	078-0006422-7		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002639	MATOS RIVAS YOVAELY	078-0012307-2		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002640	VIZCAINO CAMINERO MARINO	223-0134865-6		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002643	CASTILLO FELIZ DOMINGO ANTONIO	223-0089516-0		Auxiliar De Repartidor	Sto. Dgo. Este	Ventas	122003	10003254,10003255	A	1002
0001	10002746	CASTILLO MELVIN	223-0069754-1		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002754	MENDEZ BELLO JORGE ALEXANDER	001-1804856-0		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002755	MARMOLEJOS MADRIGAL JUAN MANUEL	223-0124653-8		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002756	DÍAZ GUADARRAMOS MAIKER ANEUDI	001-1794760-6		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002809	CORDERO MOISES	223-0112247-3		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002810	CRUZ BURGOS JOIDI ALEXANDER	223-0042034-0		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002811	FABIAN LOPEZ FRANKLIN	001-1711783-8		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002921	MELI DIAS EIMER MIGUEL			Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002929	VARGAS FERRERAS DEIBI OMAR	018-0071295-0		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002933	FLORES DE LA ROSA CARLOS MANUEL	402-2154860-1		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002937	SANTANA ROSARIO ELVIS DE JESUS	113140073		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002969	DIAZ FELIZ PEDRO ANTONIO	223-0068414-3		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002976	VARGAS FERRERAS JARBI	223-0119880-4		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003036	JIMENEZ ALMANZAR JEAN CARLOS	402-2250842-2		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003049	CUSTODIO IRVIN MIGUEL	008-0035514-1		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003083	MEDINA RODRIGUEZ JEAN ALEXANDER	402-2401220-9		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003084	ACOSTA GARCIA SANDY ARIEL	001-1749185-2		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003232	CARRION EDWIN ENRIQUE	223-0127153-6		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003233	SANCHEZ VALENZUELA FRANDY	223-0138036-0		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003234	ALCANTARA PERDOMO RAFAEL ARGELIS	012-0093515-1		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003235	DE JESUS MIGUEL YORGENI	295-0004128-9		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003236	PIMENTEL POLANCO IVAN ALFONZO	102-0013334-5		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003237	ZABALA YOELVIN	223-0043092-7		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003238	MOREL WANER	223-0147540-0		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003239	CUSTODIO MATOS JOHAN ANDRES	223-0162869-3		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003240	MUÑOZ LUIS ALFREDO	223-0133766-7		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003241	FLORIAN ADAMES JOSE MIGUEL	402-2074788-1		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003242	GUZMAN VOLQUEZ REYSER ANTONIO	402-2171866-7		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003425	BELTRE TEJEDA JOSE ALBERTO	223-0112777-9		Auxiliar De Repartidor	Sto. Dgo. Este	Ventas	122003	10003254,10003255	A	1002
0001	10003426	EUGENIA LARA IDALGO ELECTO	011-0033711-0		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003428	MATEO BENITEZ JOSE GREGORIO	223-0018581-0		Auxiliar De Repartidor	Sto. Dgo. Este	Ventas	122006	10003254,10003255	A	1002
0001	10003503	ALCANTARA BRITO MAXIMO ENRIQUE	223-0169628-6		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003516	CARDERON ARIAS JUNIOR ALEXANDER	402-2116943-2		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003519	PAULINO MARTINEZ GERISON JOSUE	223-0040915-2		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003521	OGANDO ZABALA SERGIO ENMANUEL	223-0104960-1		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003522	CUELLO MORDAN OSVALDO JUNIOR	402-2265583-5		Auxiliar De Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10000391	MENDEZ FERRERAS RAMON LOURDES	110538063		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000412	PEÑA SOTO TETRAIDE	001-1640686-9		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000414	ROSARIO SANCHEZ VICTOR	1200399127		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000436	CUEVAS BIDO DORIS	014-0015246-6		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000437	ADAMES BAEZ CESAR EDILIO	1600136954		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000439	REYNOSO PEREZ JUAN PIO	001-1696097-2		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000455	PIMENTEL RODRIGUEZ JUAN DE JESUS	4400014553		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000471	MARCANO JULIO	001-1147996-0		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000488	JIMENEZ JIMENEZ NARCISO	108432923		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000496	ADAMES SIMON	116722869		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001055	CESPEDES CESPEDES DANIEL	001-1438651-9		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001056	MINAYA SANCHEZ FRANCISCO	016-0016107-7		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001255	MONTERO MONTERO ALBINO	1400142731		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001258	MATOS ESPINOSA ELVIS JOEL	229-0009938-7		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001305	DE LA CRUZ CANDELARIO ROBINSON	224-0063903-9		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001306	FIGUEREO FIGUEROA SANTO	001-1570756-4		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001585	FRANCISCO MORENO YOEDELEN	001-1775817-7		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001612	REINOSO DE LA ROSA CARLOS ALBERTO	001-1733849-1		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001613	RECIO ROSARIO RICARDO JOSE	001-1862993-0		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001755	ENCARNACION RAMIREZ ESTARLIN	012-0079639-7		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001757	URBANO FRIAS AMAURIS	224-0023065-6		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002224	SANTOS CABRERA ARQUIMEDES RAFAEL	224-0008014-3		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002227	MARTE NIVAR DOMINGO ANTONIO	005-0034849-5		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002238	PAULINO PEREZ MAICKOL	224-0009997-8		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002239	LAGOMBRA PEREZ NEFTALI RICARDO	402-2182266-7		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002241	HINOJOSA SANCHEZ MAXIMO ANTONIO	001-0866413-7		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002316	BATISTA VILLAMAN ROBERTO	229-0009687-0		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002317	CONCEPCION FRAGOSO JOSE MANUEL	001-1747620-0		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002330	UREÑA ALMANZAR FREDDY ABELARDO	402-2128708-5		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002471	SILVERIO DE LA CRUZ DAURIS	224-0011725-9		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002544	RODRIGUEZ JIMENEZ JOSE MANUEL	001-1293098-7		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002592	ROSADO MARTINEZ JUAN RAMON	229-0012234-6		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002610	RAMIREZ MONTILLA JUAN GABRIEL	001-1841458-0		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002616	SUAREZ ADOLFO	228-0003432-8		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002711	ROSARIO CANELA JOHAN MANUEL	229-0000018-7		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002776	GONZALEZ FERRERAS EUDOMAR	229-0019495-6		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002777	GALVEZ DE LOS SANTOS LUIS DENYS	402-2032238-8		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002778	PEREZ SORIANO YELBERT EZEQUIER	229-0017008-9		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002779	FERNANDEZ RAMOS FRANCISCO JAVIER	229-0014574-3		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002782	MEJIA MORILLO JUAN CARLOS	001-1737720-0		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002783	FAMILIA RODRIGUEZ DANILO	223-0088061-8		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002787	ALCANTARA MEJIA ERNESTO ANDRES	224-0026447-3		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002801	JOSEPH RAMIREZ ROBERTO ADOLFO	402-2371120-7		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002880	ACOSTA TORREZ BOLIVAR VALENTIN	229-0008804-2		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002881	MONTERO DIAZ NEFRY ANTONIO	001-1910762-1		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002882	MARTE CASTILLO CARLOS	229-0014198-1		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002884	SUAREZ RODRIGUEZ EDWIN ERNESTO	224-0043544-6		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002886	SEPULVEDA PEÑA CARLOS RAFAEL	229-0008998-2		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002923	ACOSTA DE LA ROSA KENNEDY	071-0050940-0		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002927	DE LOS SANTOS SEVERINO CARLOS MANUEL	402-2112575-6		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002938	CALDERON DE JESUS JORGE LUIS	229-0011825-2		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002940	PEÑA RAMIREZ JOSE ANTONIO	229-0012346-8		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002941	MONTERO MORILLO MAIQUEL	224-0027281-5		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002945	SOSA ROSARIO DEYVIS	001-1517420-3		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002960	PEGUERO HEREDIA JOSE LUIS	229-0017387-7		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003089	UBRI LUIS MIGUEL	011-0041929-8		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003096	PINEDA VALDEZ ANDERSON	228-0001991-5		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003105	MOREL ALMONTE LEONARDO	073-0014408-1		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003139	LAURENCIO SEVERINO DOMINGO	229-0025835-5		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003140	PEÑA PEÑA NATANAEL	229-0020650-3		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003207	VASQUEZ DE LA ROSA YENSY RAFAEL	402-2377126-8		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003304	BELTRE DOTEL RAYNER OTILIO	167-0000631-1		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003305	CONCEPCION PRENSA LUIS ALBERTO	224-0030779-3		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003306	MARTINEZ LORENZO RODOLFO	068-0042773-1		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003335	JIMENEZ FLORENTINO GABRIEL	224-0067173-5		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003336	GARCIA GARCIA JEFRY ENMANUEL	402-2078198-9		Auxiliar De Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000289	RODRIGUEZ COLLANTE ANA BEATRIZ	046-0022488-7		AUXILIAR DE SALUD OCUPACIONAL	Stgo. Rodriguez	Salud Ocupacional	132102	10000332	A	1000
0001	10000395	NIVAR PORFIRIO	001-0707002-1		Auxiliar De Seguridad Interna	Sto. Dgo. Oeste	Seguridad Interna	132406	10002172	A	1001
0001	10000167	TAVAREZ BAEZ JUAN CARLOS	3400429324		Auxiliar De Seguridad Interna	Stgo. Rodriguez	Seguridad Interna	132406	10001035	A	1000
0001	10000964	FELIZ CAYO FRANCISCO RAMON	7700054070		Auxiliar De Seguridad Interna	Stgo. Rodriguez	Seguridad Interna	132406	10001035	A	1000
0001	10002831	TAVAREZ CRUZ NATANAEL DE JESUS	116-0002326-8		Auxiliar De Seguridad Interna	Stgo. Rodriguez	Seguridad Interna	132406	10001035	A	1000
0001	10003364	JAQUEZ CRUZ JEURY RAFAEL	046-0040286-3		Auxiliar De Seguridad Interna	Stgo. Rodriguez	Seguridad Interna	132406	10001035	A	1000
0001	10003415	MUÑOZ RODRIGUEZ JUAN PAULINO	031-0421028-5		Auxiliar De Seguridad Interna	Stgo. Rodriguez	Seguridad Interna	132406	10001035	A	1000
0001	10000008	ESTEVEZ JUAN DE JESUS	4600106571		Auxiliar de Servicios Generales	Stgo. Rodriguez	Mantenimiento de Servicios Generales	132203	10001026	A	1000
0001	10000126	RAMOS OVALLE JUAN PABLO	4600384871		Auxiliar de Servicios Generales	Stgo. Rodriguez	Mantenimiento de Servicios Generales	132203	10001026	A	1000
0001	10003053	GOMEZ CARRERAS FRANDY JOEL	402-2269556-7		Auxiliar de Servicios Generales	Stgo. Rodriguez	Mantenimiento de Edificaciones	132203	10001026	A	1000
0001	10003152	ALMONTE JOHATHAN DE JESUS	046-0040439-8		Auxiliar de Servicios Generales	Stgo. Rodriguez	Mantenimiento de Edificaciones	132203	10001026	A	1000
0001	10000229	SANCHEZ TEJADA PEDRO ANTONIO	4600268660		AUXILIAR DE TRAT. DE AGUAS RES.	Stgo. Rodriguez	Calidad	132101	10001708,10002680,10003384	A	1000
0001	10000938	PEÑA MEJIA ESTIVENSON ANTONIO	010-0099471-3	cajaazua	Cajero	Azua	Finanzas	111005	10000962	A	1006
0001	10003389	SANTILLAN SANTILLAN SENIA MARGARITA	028-0058101-5	cajahi	Cajero	Higuey	Finanzas	122010	10001688,10003484	A	1010
0001	10002895	MARTINEZ LUIS ALBERTO	026-0119103-0	cajaromana	Cajero	La Romana	Contabilidad	122006	10000870	A	1005
0001	10001596	RODRIGUEZ BRITO JUAN CARLOS	136-0016387-0	cajanagua	Cajero	Nagua	Finanzas	122009	10001656	A	1009
0001	10000785	ABREU FAJARDO NOEL DE JESUS	056-0149004-7	cajasfm	Cajero	San Francisco	Finanzas	122005	10002169	A	1004
0001	10001976	BAUTISTA RIJO GEORGE MANUEL	001-1775684-1	cajasdo	Cajero	Sto. Dgo. Este	Finanzas	122003	10000544	A	1002
0001	10000377	ALCALA FAUSTO	107080368		Chofer	Sto. Dgo. Oeste	Flota	111009	10000342	A	1001
0001	10000162	RODRIGUEZ ALVAREZ RAFAEL ANTONIO	4600108593		Chofer	Stgo. Rodriguez	Logística	132304	10000998	A	1000
0001	10000202	LOPEZ GIL EDUAR RAMON	4600317624		Chofer	Stgo. Rodriguez	Logística	132304	10001028	A	1000
0001	10000060	TORRES REYES MANUEL AMBIORIS	4600295408		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10000102	ALVAREZ BUENO RAFAEL	15100001328		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10000203	ALMANZAR BAEZ WENDY EUGENIO	4600337903		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10000222	SANTOS NOLBERTO DE JESUS	4600023032		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10000293	ALVAREZ FERNANDEZ MOISES DE JESUS	4600292975		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10001200	JUMELLES JUAN DE JESUS	046-0025813-3		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10001461	CASTILLO NUÑEZ IGNACIO ALEJANDRO	001-1316304-2		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10001520	BERNARD RODRIGUEZ JUAN MANUEL	031-0308809-6		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10001622	MARTINEZ VARGAS JOSE ALBERTO	045-0016578-4		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10001715	VARGAS MORAN FRANCISCO ANTONIO	031-0193260-0		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10001795	CASTRO JOAN MANUEL	031-0394167-4		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10001965	JIMENEZ RODRIGUEZ AGUSTIN	109179341		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10002093	RODRIGUEZ GARCIA JUAN MARCELINO	11600014275		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10002198	RODRIGUEZ MARIO BARTOLO	001-0939020-3		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10002440	JAVIEL KELLY RAFAEL ALBERTO	001-1867002-5		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10002509	CABRERA LUNA FRANCISCO ALBERTO	096-0004430-0		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10002839	RODRIGUEZ TAVERAS DOMINGO ANTONIO	034-0022768-6		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10002862	MARTINEZ VARGAS GREGORIO ANTONIO	034-0005153-2		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10003025	TORIBIO UREÑA CESAR MARTIN	031-0415599-3		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10003026	VARGAS PERALTA JOEL	096-0028288-4		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10003027	DE LA CRUZ OVALLES LUIS MIGUEL	001-1650507-4		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10003112	PILARTE SANTOS LUIS ADALBERTO	046-0030552-0		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10003380	PEREZ NUÑEZ RAMON NOEL	034-0034723-7		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10003381	MUÑOZ MUÑOZ ERLYN DE JESUS	031-0394505-5		Chofer De Patana	Stgo. Rodriguez	Flota	132404	10000156	A	1000
0001	10000948	VICTORIANO CUSTODIO GUARIONEX	010-0016205-5		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10000954	PUJOLS MINYETY JAIME ERNESTO	010-0110349-6		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10000966	DE LA PAZ RAMIREZ MOISES NICOLAS	010-0075082-6		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10000978	RUBIO DE LOS SANTOS MARCOS ARMICAL	010-0096640-6		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10000983	MENDEZ PEREZ LUIS	1000359990		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10001131	BATISTA DE LOS SANTOS DANILO	010-0090232-8		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10001556	DE LEON MONTERO HECTOR ALEXANDER	010-0088699-2		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10001560	ABREU JIMENEZ EMERSON	010-0088153-0		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10001692	AGRAMONTE WILTON	010-0089496-2		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10002246	SANCHEZ ALCANTARA ANGEL NOE	010-0064776-6		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10002366	CIPRIAN RAMIREZ WILKIN ANTONIO	010-0106999-4		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10002426	HERNANDEZ DIAZ ABRAHAN ANTONIO	010-0058393-8		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10003195	FABIAN PEÑA HENRY VLADIMIR	010-0073572-8		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10003199	CIPRIAN FAUSTO MIGUEL	010-0106423-5		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10003200	FELIZ SANTANA ALBERTO	010-0088133-2		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10003349	MATEO FELIX RAMONCITO	010-0116460-5		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10003366	DE LOS SANTOS VIOLA SIBIARDO	010-0078053-4		Chofer Repartidor	Azua	Distribución	122007	10002431	A	1006
0001	10001176	ZORRILLA MEJIA ALFREDO	026-0037599-8		Chofer Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10001389	CORDERO CONCEPCION AMAURY	026-0104686-1		Chofer Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10001632	REYES FLETE LUCIANO	031-0303256-5		Chofer Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10001633	MEDINA REYES GUSTAVO ENRIQUE	018-0046190-5		Chofer Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002119	CHECO SANTANA PEDRO RAMON	2600447441		Chofer Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002492	PAULINO HECTOR LEONIDAS	026-0094863-8		Chofer Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002656	ZORRILLA MERCEDES LUIS RAFAEL	026-0052900-8		Chofer Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002696	CASTRO EUSEBIO CARLOS MANUEL	026-0017125-6		Chofer Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002698	WILSON PACHECO CRISTIAN LIONEL	026-0090349-2		Chofer Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002738	KING MARTE VÍCTOR ARIEL	026-0124104-1		Chofer Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10002902	RAMIREZ PEREZ VICTOR ANEUDY	026-0084743-4		Chofer Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10003063	GUERRERO CASTRO NICKY WASKAR	026-0137880-1		Chofer Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10003357	DEL ROSARIO DE LEON ANGEL ANEURY	026-0110140-1		Chofer Repartidor	La Romana	Distribución	122006	10003463	A	1005
0001	10003157	MARTE MERCEDES FAUSTINO	136-0006075-3		Chofer Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10003158	GARCIA GONZALEZ JEAN CARLOS	071-0056753-1		Chofer Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10003271	ZORRILLA FERNANDEZ EDWIN	071-0050979-8		Chofer Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10003483	RAMOS BATISTA GENARO	136-0018149-2		Chofer Repartidor	Nagua	Distribución	122009	10002168	A	1009
0001	10000915	ALMONTE ALMONTE JUAN	037-0074849-8		Chofer Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10000921	DEL ROSARIO MERCADO EDDY	3700480852		Chofer Repartidor	Puerto Plata	Distribución	122008	10000894	A	1007
0001	10000815	ROSARIO DE LA CRUZ CRISTINO	056-0077335-1		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10000816	TEJADA LOPEZ JUAN ALBERTO	056-0096869-6		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10000822	CORTORREAL VASQUEZ WILTON	056-0102285-7		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10001075	HILARIO GARCIA WILMI ANTONIO	056-0105585-7		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10001600	MERCEDES DUARTE YOEL	5601640161		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10002727	FÉLIX PUJOLS LEONARDO	056-0071895-0		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003043	SUAREZ GALAN EUSTASIO	047-0089313-6		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003162	DURAN DE JESUS RAMON	056-0011319-4		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003163	CAMILIO ESCAÑO CARLOS MANUEL	056-0143558-8		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003408	DE JESUS PERALTA HECTOR RAMON	056-0014316-7		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10003411	ADHAMES BADIA ALBERT	056-0100052-3		Chofer Repartidor	San Francisco	Distribución	122005	10000787	A	1004
0001	10000673	RODRIGUEZ FRIAS ANLE	048-0007821-6		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000678	SANTOS JOSE RAMON	031-0146325-9		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000683	NUÑEZ VEGA VLADIMIR BIENVENIDO	031-0336201-2		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000686	MARMOLEJOS ORTEGA JUAN MANUEL	031-0357988-8		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000689	VASQUEZ GONZALEZ FRANK FELIX	121-0012600-7		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000692	COLLADO VALERIO FAUSTINO	031-0112233-5		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000694	FERNANDEZ FORTUNA FAUSTO	028-0075325-9		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000706	ORTIZ NUÑEZ MANUEL GILBERTO	094-0022295-7		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000737	RODRIGUEZ VARGAS BASILIO ANTONIO	046-0030093-5		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000753	MENDEZ RODRIGUEZ CLENDY ESTEBAN	031-0333056-3		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000763	ARACENA RODRIGUEZ ANDRES AVELINO	036-0008762-5		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000765	GARCIA HERNANDEZ JUAN FRANCISCO	045-0017200-4		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001118	CRUZ VIALET NIDSON GABRIEL	4600272597		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001126	PERALTA TORRES ENEDINO DE JESUS	4600163572		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001142	MARTE VARGAS JUAN PABLO	031-0078457-2		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001145	LOPEZ FRANCISCO JUAN	094-0020574-7		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001147	CONTRERAS CASTRO DIOMEDES	044-0006043-2		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001164	PEREZ DE LA NUEZ MARTIN	134-0001102-2		Chofer Repartidor	Santiago	Distribución	122003	10000672,10001988	A	1003
0001	10001419	SANCHEZ RAMIREZ EDWIN IRAMNY	033-0028845-7		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001722	POLO SOSA REMBERTO	031-0285676-6		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10001723	PERALTA TAVAREZ RAMON ANTONIO	046-0032286-3		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002021	REYES DURAN JOAN NICOLAS	3102864265		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002022	FABIAN VICIOSO NELSON ALEJANDRO	001-1857118-1		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002023	RODRIGUEZ MORROBEL GREGORYN	3103482190		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002402	MENA MARTINEZ JOSE FIDELIO	037-0078839-5		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002403	GARCIA ALMONTE JHONNY DE JESUS	031-0262938-7		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002404	CASTILLO JIMENEZ LEONARDO	3100558323		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002405	BERNARD DE LA ROSA FRAINY FRANCISCO	031-0473291-6		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002458	BRITO DOMINGUEZ ANSELMO	121-0013238-5		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002530	OVALLE ROSSO YOJANNEY	031-0158951-7		Chofer Repartidor	Santiago	Ventas	122004	10000672,10001988	A	1003
0001	10002583	CORONA THEN PEDRO MANUEL	031-0051785-7		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002597	TORRES MEJIA GEOVANNY ANTONIO	001-1108124-6		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002660	ESPINOSA PINALEZ RAFAEL	017-0018677-6		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002829	PEREZ ROQUE ANTONIO	031-0424339-3		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002861	INFANTE AGRAMONTE RAFAEL ENRINQUE	031-0315055-7		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10002914	MARTE REYNOSO JUAN VIANNEY	031-0433589-2		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003216	MEJIA DIAZ JOSE	031-0093656-0		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003217	MORA MORENO WANDY ALBERTO	053-0036900-5		Chofer Repartidor	Santiago	Ventas	122004	10000672,10001988	A	1003
0001	10003218	RODRIGUEZ CRUZ RAMON ANTONIO	116-0002613-9		Chofer Repartidor	Santiago	Ventas	122004	10000672,10001988	A	1003
0001	10003355	OVALLE TORIBIO RUPERTO ANTONIO	094-0019104-6		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003363	BRITO PEREZ MIKEL JOEL	116-0001145-3		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10003374	MENDEZ DISLA JOSE JOAQUIN	031-0005832-4		Chofer Repartidor	Santiago	Distribución	122004	10000672,10001988	A	1003
0001	10000557	GARCIA LEBRON JOSE LUCIA	1700204637		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10000559	CORPORAN DOÑE RUFINO	200598274		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10000572	MOREL MOSQUEA MARINO	059-0015440-1		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10000586	HERNANDEZ JIMENEZ SAMUEL	103993861		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10000589	HERNANDEZ JOSE ROBERTO	22300041542		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10000623	MARTINEZ GARCIA MANUEL ARTURO	102752821		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10001260	FELIZ CARRASCO MAXIMO LORIS	117-0003668-1		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10001263	AQUINO EMILIANO	001-0070354-5		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10001484	MATOS ABAD LUDWING DANIELSSON	223-0039030-3		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10001895	PEREZ PEREZ RICARDO ANTONIO	020-0012345-1		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002071	ROSARIO BELLO RAFAEL	001-0127308-4		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002097	BELTRE JUAN CARLOS	117112516		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002267	BURGOS RAMON ANTONIO	100374586		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002279	MANZANILLO FORTUNATO CARLOS	001-0771189-7		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002452	MENDEZ TAVERAS FRANCISCO EDUARDO	001-0888199-6		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002606	SANTANA SOSA WELINTON	001-1474862-7		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002658	LUNA ENCARNACION MIGUEL ANGEL	001-1472024-6		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002748	PEÑA RUIZ CARLOS JULIO	001-1333658-0		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002749	SANTANA AGRAMONTE JOSÉ LUÍS	010-0101980-9		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002753	NUÑEZ BISONO RIGOBERTO	001-1117607-9		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002931	GONZALEZ BATISTA ANGELO ANTONIO	223-0057442-7		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002934	TERRERO ENCARNACION FRANCISCO HERCIDO	014-0013088-4		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002946	MATEO DEBORAH HECTOR LUIS	001-1736046-1		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002972	GONZALEZ ROSARIO LUIS ALEXANDER	001-1154868-1		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10002980	COCCO SANCHEZ CARLOS MANUEL	111-0000254-9		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003035	PAYANO GARCIA LUIS ALFREDO	224-0026583-5		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003087	GUEVARA CRUZ FREDDY YUNIOR	223-0044501-6		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003170	DE LOS SANTOS RIJO RAULYN VLADIMIR	223-0070441-2		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003175	PACHANO ALEXANDER	226-0004585-4		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003244	DELGADO AGRAMONTE VALENTIN	017-0012157-5		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003245	PEÑA VARGAS JULIO ANGEL	001-1199605-4		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10003246	GUERRERO UBEN MARCOS EUGENIO	223-0046310-0		Chofer Repartidor	Sto. Dgo. Este	Distribución	122003	10003254,10003255	A	1002
0001	10000410	AQUINO FRANCISCO	001-0836490-2		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000435	RODRIGUEZ NUÑEZ FAUSTO EUCLIDES	107769457		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000448	MEDINA PERALTA EUDDYS	011-0028083-1		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000454	FERNANDEZ GENAO RAFAEL	5900178061		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10000516	PEREZ SALAS DOMINGO	001-0979664-9		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001060	MUÑOZ MARTE RAFAEL	001-1333315-7		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001295	GUILLEN MARTIN	001-1283361-1		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001344	HIRALDO MEJIA JUAN CARLOS	112819404		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001587	VENTURA HERRERA BENNI MANUEL	001-1739606-9		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001748	ROJAS HERNANDEZ RAMON ARIEL	047-0200218-1		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001752	BAUTISTA DE LA CRUZ JUAN TOBIA	117220590		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001865	PEREZ POLANCO CRISTHIAN	136-0016484-5		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001948	REYES RAFAEL	001-0864200-0		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002048	MEDINA MONTILLA PABLO	001-1755438-6		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002192	JOSE ELVYN	001-1526622-3		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002193	ALVARADO DURAN JUAN MIGUEL	001-1313140-3		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002217	DEL ROSARIO OSORIA ANDRE	4900802754		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002240	SANCHEZ BELTRE HENRY	012-0083535-1		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002297	MORILLO ABREU JUAN RAMON	402-2078485-0		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002591	CAMPUSANO PAULA FREDDY MANUEL	228-0000024-6		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002648	MUÑOZ POLANCO PEDRO MANUEL	136-0016329-2		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002765	DÍAZ PUJOLS JUAN CARLOS	001-1747057-5		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002791	PERALTA VELEZ DALVIN	22400047092		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002836	ESTEVEZ QUEZADA JUAN JOSE	001-1759657-7		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002867	GUZMAN RODRIGUEZ CRISTHOFHER	001-1662952-8		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002872	DE JESUS URBAEZ JUAN RAFAEL	069-0006928-4		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002888	MEDINA CRUZ RAFAEL	224-0031074-8		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002892	FELIZ MATOS LUIS EMILIO	091-0004506-2		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002894	GERARDO PEÑA ANGELO ANTONIO	224-0026852-4		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002943	BONILLA BATISTA AMBIORIS TOMAS	224-0009725-3		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002948	LOPEZ MATOS RAFAEL	001-1707171-2		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002951	SANTOS ZAPATA MARINO ANTONIO	001-1063079-5		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002954	LUCIANO RABELO MANUEL RAMON	082-0020753-1		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003092	BATISTA HERNANDEZ JUAN DE DIOS	068-0043214-5		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003101	PEÑA ASDRUBAL PABLO	001-1447401-8		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003187	ECHAVARRIA ZAPATA LENIN DAVID	001-1862895-7		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003196	DE LA ROSA FIGUEROA MARCOS GERALDO	402-2081628-0		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003224	GARCIA BALBUENA JUAN LUIS	001-0187126-7		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003275	PEÑA ENCARNACION JOEL	001-1360886-3		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003277	MARCIAL FORTUNATO ADRIAN ESTEBAN	001-1683019-1		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003432	REYES JOSE MIGUEL	093-0052444-5		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003433	MARTE BAEZ MARCOS AURELIO	001-1730830-4		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003456	DE LA CRUZ JUNIOR	001-1666326-1		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003457	MARTINEZ DIROCHE FRANKLYN LUIS	224-0057060-6		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003486	CORPORAN DE LOS SANTOS MICHAEL	026-0097834-6		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003487	ABREU REYNOSO NELSON MIGUEL	001-1503432-4		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003523	RODRIGUEZ CARMONA JONATHAN DE JESUS	001-1867135-3		Chofer Repartidor	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10001827	CUEVAS PANIAGUA ROSA MARIA	010-0081546-2		Conserje	Azua	Mantenimiento De Edificaciones	122007	10000962	A	1006
0001	10002184	PAULINO GORIS YISSEL	028-0080168-6		Conserje	Higuey	Mantenimiento De Edificaciones	122010	10001688,10003484	A	1010
0001	10000848	CEDANO SANTA CRISTINA	026-0070942-8		Conserje	La Romana	Mantenimiento De Edificaciones	122006	10000870	A	1005
0001	10001657	MINAYA VASQUEZ GLEIVANY	13600171329		Conserje	Nagua	Mantenimiento De Edificaciones	122009	10001656	A	1009
0001	10000920	GARCIA ALEIDA	037-0038818-8		Conserje	Puerto Plata	Mantenimiento De Edificaciones	122008	10000892	A	1007
0001	10000805	MENDOZA BONILLA GERTRUDIS	056-0163660-7		Conserje	San Francisco	Mantenimiento De Edificaciones	122005	10002169	A	1004
0001	10002373	SANTANA RIVAS FLOR EMILIA	001-1486477-0		Conserje	Sto. Dgo. Este	Mantenimiento De Edificaciones	122003	10000544	A	1002
0001	10002451	MONTERO MONTERO LUIS ALBERTI	223-0146245-7		Conserje	Sto. Dgo. Este	Mantenimiento De Edificaciones	122003	10000544	A	1002
0001	10000271	RODRIGUEZ TORIBIO CARLOS EDUARDO	046-0027027-8	crodriguez	Contador De Centro Operativo	Stgo. Rodriguez	Contabilidad	122001	10000989	A	1000
0001	10000434	CHACON CAMACHO OSCAR	22301159574	ochacon	Control De Créditos	Sto. Dgo. Oeste	Contabilidad	111005	10000989	A	1001
0001	10000991	RODRIGUEZ ALLASI EDWIN	40221332139	erodriguez	Control De Tesorería	Sto. Dgo. Oeste	Finanzas	111005	10000988	A	1001
0001	10002846	SEBASTIAN ANA ROSALIDA MARIA	008-0030505-4	asebastian	Coordinador De Capacitacion Y Desarro	Sto. Dgo. Oeste	Gestión Humana	111008	10002549	A	1001
0001	10000342	PEREZ FELIZ VICENTE A.	101816338	vperez	Coordinador De Compras	Sto. Dgo. Oeste	Compras De Logística	111009	10001029	A	1001
0001	10000273	UCETA TORIBIO ENMANUEL ANTONIO	4600292298	euceta	Coordinador De Contabilidad Y Costos	Stgo. Rodriguez	Contabilidad	111005	10000988	A	1000
0001	10001036	MORI YATACO EDUARDO	001-1262163-6	emori	COORDINADOR DE HIGIENE	Stgo. Rodriguez	Calidad	132101	10001006	A	1000
0001	10001777	DOMINGUEZ RAMIREZ RUTH ESTHER	108637562	rdominguez	Coordinadora De Talento Y Reclutamiento	Sto. Dgo. Oeste	Gestión Humana	111008	10002549	A	1001
0001	10003477	TUPIÑO ESCURRA REYNALDO JESUS		rtupino	Desarrollador Sap	Sto. Dgo. Oeste	Desarrollo Y Soporte Técnico	112002	10002319	A	1001
0001	10002984	ANDUJAR PEREZ JOAN GERARDO	010-0092384-5		Digitador	Azua	Distribución	122007	10002431	A	1006
0001	10001102	JOSE YSMAEL LESENBIL	2601190925		Digitador	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10000786	DUARTE PAREDES FRANCIS	056-0129048-8		Digitador	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003404	ROSARIO JIMENEZ FRELMIX ALBERTO	5601600165		Digitador	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10000657	FRANCO VASQUEZ ARIDIO MANUEL	031-0320832-2		Digitador	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003377	RODRIGUEZ RODRIGUEZ JUAN ALEIBY	402-2040177-8		Digitador	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10002994	MORILLO VARGAS WELINGTON	402-2080635-6		Digitador	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003243	JIMENEZ RAMIREZ RONNY	223-0047713-4		Digitador	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002625	TORRES HERRERA VICTOR RICK	224-0037161-7		Digitador	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10002709	MORILLO VASQUEZ JOSE ALBERTO	229-0000140-9		Digitador	Sto. Dgo. Oeste	Distribución	122002	10000350,10002786	A	1001
0001	10003480	MARTINEZ FABIAN JOAN GONZALO	40220020479		Electricista Automotriz	Sto. Dgo. Oeste	Mantenimiento Automotríz	132404	10002408	A	1001
0001	10000069	MATIAS GOMEZ DOMINGO SIMEON	4600377404		Electricista de Instalaciones	Stgo. Rodriguez	Mantenimiento Eléctrico	132201	10001195	A	1000
0001	10001002	ARESTEGUI PARISACA HENRY VALENTIN	40221921808		Electricista de Sopladora	Stgo. Rodriguez	Mantenimiento Eléctrico	132203	10001195	A	1000
0001	10000014	HERNANDEZ JUMELLES JOSE MIGUEL	4600349601		Electricista de Turno	Stgo. Rodriguez	Mantenimiento Eléctrico	132201	10001195	A	1000
0001	10000255	RODRIGUEZ SOSA JOSE CALAZAN	4600386819		Electricista de Turno	Stgo. Rodriguez	Mantenimiento Eléctrico	132201	10001195	A	1000
0001	10001032	COLLAZOS CARRASCAL NICK ALVARO	402-2273961-3		Electricista de Turno	Stgo. Rodriguez	Mantenimiento Eléctrico	132201	10001195	A	1000
0001	10001040	MAMANI URRUTIA MIGUEL ANGEL			Electricista de Turno	Stgo. Rodriguez	Mantenimiento Eléctrico	132201	10001195	A	1000
0001	10001945	GOMEZ PERALTA SALVAURI DE JESUS	4600384962		Electricista de Turno	Stgo. Rodriguez	Mantenimiento Eléctrico	132201	10001195	A	1000
0001	10000332	GUTIERREZ PILARTE BELGICA	4600016515	bgutierrez	ENCARGADA DE SALUD OCUPACIONAL	Stgo. Rodriguez	Salud Ocupacional	132102	10001005	A	1000
0001	10001168	FOSTER SUAZO DUANNER OSCAR	010-0098864-0	dfoster	Encargado De Almacén Centro Operativo	Azua	Almacén De Centro Operativo	122007	10001031	A	1006
0001	10001195	CABRERA CABRERA JUAN MARCOS	046-0034017-0	jcabrera	ENCARGADO DE MANTENIMIENTO ELECTRICO	Stgo. Rodriguez	Mantenimiento Eléctrico	132201	10001026	A	1000
0001	10001030	COLLANTES GARCIA JAVIER ALBERTO	402-2189387-4	jcollantes	Encargado de Mantenimiento Mecanico	Stgo. Rodriguez	Mantenimiento Mecánico	132203	10001026	A	1000
0001	10001020	BARRON SANCHEZ JOSE ANTONIO	402-2189784-2	jbarron	Encargado de Obras Civiles	Stgo. Rodriguez	Mantenimiento de Edificaciones	132403	10001026	A	1000
0001	10001007	COTARMA BULEJE GREGORIO	402-2192178-2	gcotarma	Encargado de Servicios Generales	Stgo. Rodriguez	Mantenimiento Industrial	132203	10001026	A	1000
0001	10000993	BENDEZU GAGO MARIA BETSY	402-2169432-2	bbendezu	Encargado De Tesorería	Sto. Dgo. Oeste	Finanzas	111006	10000988	A	1001
0001	10003047	MARIN FLORES PAUL ALEXIS			INGENIERO MECATRONICO	Stgo. Rodriguez	Producción	131407	10000144	A	1000
0001	10001019	SALINAS CHILLET FERNANDO	402-2192181-6	fsalinas	INSPECTOR DE CALIDAD PARA MATERIALES	Stgo. Rodriguez	Calidad	132101	10001006	A	1000
0001	10001708	CASTRO THOMAS JUAN ALFONSO	046-0037227-2	jcastro	INSPECTOR DE CALIDAD PARA PROCESOS	Stgo. Rodriguez	Calidad	132101	10001006	A	1000
0001	10002680	HERRERA GRULLON ANTHONY NOLBERTO	034-0050061-1	aherrera	INSPECTOR DE CALIDAD PARA PROCESOS	Stgo. Rodriguez	Calidad	132101	10001006	A	1000
0001	10003384	HIRALDO ALMONTE JOSE GABRIEL	037-0114615-5	jhiraldo	INSPECTOR DE MEDIO AMBIENTE	Stgo. Rodriguez	Medio Ambiente	132103	10001006	A	1000
0001	10001222	SANCHEZ DE LEON ERICK JOSE	4600374708	esanchez	Jefe De Almacen Central	Stgo. Rodriguez	Almacén Central De Producto Terminado	132307	10001005	A	1000
0001	10000989	CASO CHOQUE PAUL PONCIO	402-2133212-1	pcaso	Jefe De Contabilidad	Sto. Dgo. Oeste	Contabilidad	111005	10000988	A	1001
0001	10000988	RETAMOZO MONTOYA HARDY	402-2092042-1	hretamozo	Jefe De Contabilidad Y Finanzas	Sto. Dgo. Oeste	Contabilidad Y Finanzas	111005	10000992	A	1001
0001	10002319	SALAS PUMACAYO VICTOR CLODOALDO	402-2518528-5	vsalas	Jefe De Desarrollo Y Soporte Técnico	Sto. Dgo. Oeste	Desarrollo Y Soporte	112002	10000996	A	1001
0001	10000994	TALAVERA TORRES ALBERTO	118977180	atalavera	Jefe De Finanzas	Sto. Dgo. Oeste	Finanzas	111005	10000988	A	1001
0001	10001029	LOAYZA QUISPE HUGO		hloayza	Jefe De Logística	Sto. Dgo. Oeste	Logística	132407	10000992	A	1001
0001	10001034	VASQUEZ TENORIO FEDERICO	40222126431	fvasquez	Jefe De Seguridad Interna	Sto. Dgo. Oeste	Seguridad Interna	132406	10000992	A	1001
0001	10002172	CAPIRE HUAMAN JOSE ALBERTO	402-2451709-0	jcapire	Jefe De Seguridad Interna	Sto. Dgo. Oeste	Seguridad Interna	132406	10000992	A	1001
0001	10001035	MENDOZA ROJAS ELVIS ESTEBAN	402-2272022-5	emendoza	Jefe De Seguridad Interna	Stgo. Rodriguez	Seguridad Interna	122001	10000992	A	1000
0001	10003293	PALACIOS ALEGRE JOSE MARTIN		jpalacios	Jefe De Transportes	Sto. Dgo. Oeste	Transportes	132404	10000992	A	1001
0001	10000146	ESPINAL SOLINO JOSE SAMUEL	11600006156	jespinal	Jefe De Turno	Stgo. Rodriguez	Producción	199992	10001005	A	1000
0001	10000155	TAVERAS SILVERIO JOSE SANTIAGO	3400487587	jtaveras	Jefe De Turno	Stgo. Rodriguez	Producción	199992	10001005	A	1000
0001	10000528	OZUNA RODRIGUEZ FELIX ANTONIO	117264051	fozuna	Jefe De Ventas	San Francisco	Ventas	122005	10001013	A	1004
0001	10001010	ARAUJO CORNEJO ALDO	402-2193188-0	aldoa	Jefe De Ventas	Santiago	Ventas	122004	10001013	A	1003
0001	10000965	SANTANA DIAZ MIGUEL ANGEL	1001009313	msantana	Jefe De Ventas	Stgo. Rodriguez	Ventas	122001	10001013	A	1000
0001	10001021	CHACA PAREDES STEWART ALAN	402-2201534-5	schaca	Jefe De Ventas	Sto. Dgo. Este	Ventas	122003	10001014	A	1002
0001	10002199	DE LOS SANTOS ALCANTARA LEONIDAS	012-0088385-6	lsantos	Jefe De Ventas	Sto. Dgo. Oeste	Ventas	122002	10001014	A	1001
0001	10001644	CORNELIO AZOR PEDRO LEONARDO	229-0015090-9		Lavador Automotriz	Sto. Dgo. Oeste	Mantenimiento Automotríz	132404	10002408	A	1001
0001	10001931	BAEZ TORRES MOISES DE LOS SANTOS	046-0033436-3		Lubricador	Stgo. Rodriguez	Mantenimiento Industrial	132201	10001026	A	1000
0001	10000478	SANCHEZ MENDEZ EMILIO	109811117		Mecánico Automotríz	Sto. Dgo. Oeste	Mantenimiento Automotríz	132204	10002408	A	1001
0001	10001810	MATOS GUZMAN HIDEL	224-0022498-0		Mecánico Automotríz	Sto. Dgo. Oeste	Mantenimiento Automotríz	132404	10002408	A	1001
0001	10003512	PEPIN ENCARNACION GLEN DEYVID	093-0057019-0		Mecánico Automotríz	Sto. Dgo. Oeste	Mantenimiento Automotríz	132404	10002408	A	1001
0001	10000025	RODRIGUEZ GIL LEONEL ANTONIO	4600317640		Mecánico de Turno	Stgo. Rodriguez	Mantenimiento Mecánico	132201	10001026	A	1000
0001	10000031	TORRES CASTILLO EUDYS ALBERTO	4600360749		Mecánico de Turno	Stgo. Rodriguez	Mantenimiento Mecánico	132201	10001026	A	1000
0001	10000108	REYES LIMA CARLOS MANUEL	4600376752		Mecánico de Turno	Stgo. Rodriguez	Mantenimiento Mecánico	132201	10001026	A	1000
0001	10001025	OBREGON ALVA ODIMS GIMLER			Mecánico de Turno	Stgo. Rodriguez	Mantenimiento Industrial	132201	10001026	A	1000
0001	10003052	ENCARNACION SOTO JOSE RAMON	001-1362518-0		Mecánico de Turno	Stgo. Rodriguez	Mantenimiento Mecánico	132201	10001026	A	1000
0001	10003467	NOEL ENCARNACION ABANTO EDMUNDO			Mecánico de Turno	Stgo. Rodriguez	Mantenimiento Mecánico	132201	10001026	A	1000
0001	10000877	RAMIREZ SARMIENTO JHONATAN ALEXANDER	026-0118070-2		Mercaderista	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10001179	ROSA PEREZ SAMUEL ELIAS	023-0151839-1		Mercaderista	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10000918	PEREZ TAVAREZ JAIRO ANTONIO	037-0097523-2		Mercaderista	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10000802	ROSARIO GARCIA CARLOS MANUEL	048-0084285-0		Mercaderista	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002104	CASTILLO LIRIANO RAMON ALBERTO	5600189038		Mercaderista	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002105	SUAREZ MENDEZ ARGENIS MISAEL	5700163719		Mercaderista	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002390	JAVIER ALVAREZ JOSE ALBERTO	056-0156236-5		Mercaderista	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10001115	DOMINGUEZ DOMINGUEZ GREGORIO ISAIAS	3105311462		Mercaderista	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10001149	PEREZ FERMIN JOSE  ENRIQUE	054-0126669-6		Mercaderista	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10002006	CORSINO GIL DOMINGO	053-0033985-9		Mercaderista	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003149	JIMENEZ LOPEZ JHONNY NOEL	031-0441145-3		Mercaderista	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003153	PERALTA PEDRO LUIS	031-0562891-5		Mercaderista	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003394	VASQUEZ MERCADO RAMON MODESTO	031-0440691-7		Mercaderista	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003405	BRITO MENDEZ WILSON JOSE	054-0118267-9		Mercaderista	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000541	SANCHEZ ALMONTE JORGE LUIS	22300477985		Mercaderista	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10000567	TRINIDAD NOLASCO FRAISHON MAIRENER	069-0009580-0		Mercaderista	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002599	VERIGUETE OGANDO WILLIAS MICHAEL	014-0019747-9		Mercaderista	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003040	RUIZ OGANDO NESTOR RAMON	225-0060023-8		Mercaderista	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003310	RODRIGUEZ RAMIREZ JOSE ANTONIO	001-1114767-4		Mercaderista	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001871	ARAUJO DE LOS SANTOS FRANKLIN	117048538		Mercaderista	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002320	GUZMAN CESAL	001-1707235-5		Mercaderista	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002321	ESCAÑO DE JESUS LUIS OLGIVI	229-0004143-9		Mercaderista	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002322	LIZARDO VARGAS CARLOS RAMON	001-1270568-6		Mercaderista	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002534	PAULA MARINO JUNIOR	001-1727101-5		Mercaderista	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002596	MERAN DE LA ROSA JUAN	001-1578806-9		Mercaderista	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002723	DE LA ROSA JAQUEZ EDUARDO ANTONIO	001-1296976-1		Mercaderista	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002725	FELIPE UREÑA DIOGENES	001-1280833-2		Mercaderista	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002795	RODRIGUEZ SUSAÑA ALEXANDER	001-1644306-0		Mercaderista	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002918	MINAYA ESTRELLA ANGELES	224-0021067-4		Mercaderista	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003024	MORA ESTEVEZ DENIO RAFAEL	001-1788540-0		Mercaderista	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003041	MORILLO SARANTE EDY JOSE	001-1812372-8		Mercaderista	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002679	REYES MEJIA ARNOL BALDEMAR	046-0034000-6		Operador De Balanza	Stgo. Rodriguez	Seguridad Interna	132406	10001035	A	1000
0001	10000141	RODRIGUEZ SANCHEZ WILSON ANTONIO	4600387841		Operador de Caldero	Stgo. Rodriguez	Producción	132402	10000146,10000155	A	1000
0001	10000110	TAPIA CONTRERAS GELDY OMAR	7300158628		Operador de Desencajonadora	Stgo. Rodriguez	Producción	131306	10000146,10000155	A	1000
0001	10000013	HERNANDEZ JUMELLES FELIX MARIA	4600323655		Operador de Empacadora	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10000032	TEJADA RODRIGUEZ ISIDRO	11600004599		Operador de Empacadora	Stgo. Rodriguez	Producción	131401	10000146,10000155	A	1000
0001	10000085	MARTINEZ BAUTISTA EDUVIGES	11600018425		Operador de Empacadora	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10000091	GIL RODRIGUEZ GERMAN MARIA	4600324166		Operador de Empacadora	Stgo. Rodriguez	Producción	131305	10000146,10000155	A	1000
0001	10000104	ESTEVEZ BLANCO SADY NOEL	046-0037799-0		Operador de Empacadora	Stgo. Rodriguez	Producción	131401	10000146,10000155	A	1000
0001	10000161	MEDRANO REYES EDWIN RAFAEL	4600386611		Operador de Empacadora	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10000178	RODRIGUEZ MARTINEZ LUIS EMILIO	11500010910		Operador de Empacadora	Stgo. Rodriguez	Producción	131405	10000146,10000155	A	1000
0001	10000216	CHAVEZ BAEZ PEDRO ANTONIO	4600310215		Operador de Empacadora	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10001300	PEREZ BAEZ JENSSY ANTONIO	4600334736		Operador de Empacadora	Stgo. Rodriguez	Producción	131407	10000146,10000155	A	1000
0001	10001940	TORRES TORRES ELVIS MATEO	046-0039867-3		Operador de Empacadora	Stgo. Rodriguez	Producción	131405	10000146,10000155	A	1000
0001	10002971	TORIBIO BUENO RICHER RAFAEL	046-0023072-8		Operador de Empacadora	Stgo. Rodriguez	Producción	131407	10000146,10000155	A	1000
0001	10000053	THOMAS VALERIO DOMINGO ARCADIO	4600359808		Operador de Encajonadora	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10000072	PEÑA FERNANDEZ JOSE DE JESUS	4600101333		Operador de Encajonadora	Stgo. Rodriguez	Producción	131404	10000146,10000155	A	1000
0001	10000018	NUÑEZ ALVAREZ RANFIS ANTONIO	4600358354		Operador de Etiquetadora	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10000020	PEREZ ALMONTE DAURYS AQUILES	4600350385		Operador de Etiquetadora	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10000061	VARGAS BEJARAN LUIS JOSE	4600350302		Operador de Etiquetadora	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10000064	FAMILIA SANCHEZ JUAN ANTONIO	4600367793		Operador de Etiquetadora	Stgo. Rodriguez	Producción	131401	10000146,10000155	A	1000
0001	10000077	ALMONTE JUMELLES JOSE DANIEL	4600360640		Operador de Etiquetadora	Stgo. Rodriguez	Producción	131401	10000146,10000155	A	1000
0001	10000164	GOMEZ ALVAREZ ANEUDIS	4600364527		Operador de Etiquetadora	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10000201	CARRASCO NUÑEZ DOMINGO ANTONIO	4600327011		Operador de Etiquetadora	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10000220	VARGAS ESTEVEZ RAFAEL	4600383394		Operador de Etiquetadora	Stgo. Rodriguez	Producción	131305	10000146,10000155	A	1000
0001	10000260	NUNEZ RODRIGUEZ JOSE DEL CARMEN	4600376851		Operador de Etiquetadora	Stgo. Rodriguez	Producción	131305	10000146,10000155	A	1000
0001	10001362	RODRIGUEZ VARGAS JOSE LUIS	031-0464997-9		Operador de Etiquetadora	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10000002	BAEZ PEÑA FRANKLIN DE JESUS	4600279592		Operador de Flomix	Stgo. Rodriguez	Calidad	131405	10001708,10002680,10003384	A	1000
0001	10000007	ENCARNACION VALERIO JUAN CARLOS	4600338828		Operador de Flomix	Stgo. Rodriguez	Calidad	131404	10001708,10002680,10003384	A	1000
0001	10000023	RODRIGUEZ TAVAREZ FRANCISCO ANTONIO	4600343935		Operador de Flomix	Stgo. Rodriguez	Calidad	131403	10001708,10002680,10003384	A	1000
0001	10000073	DIAZ BAEZ ELADIO	4600265773		Operador de Flomix	Stgo. Rodriguez	Calidad	131403	10001708,10002680,10003384	A	1000
0001	10000088	CASTILLO MEDRANO IGNACIO DE JESUS	046-0029946-7		Operador de Flomix	Stgo. Rodriguez	Calidad	131303	10001708,10002680,10003384	A	1000
0001	10000117	GEREZ ALMONTE CHARLE JAVIER	4600374328		Operador de Flomix	Stgo. Rodriguez	Calidad	131405	10001708,10002680,10003384	A	1000
0001	10000186	GARCIA GOMEZ GREGORIO ANDRES	11500009730		Operador de Flomix	Stgo. Rodriguez	Calidad	131402	10001708,10002680,10003384	A	1000
0001	10001231	BAEZ RODRIGUEZ JUAN FRANCISCO	046-0036759-5		Operador de Flomix	Stgo. Rodriguez	Calidad	131401	10001708,10002680,10003384	A	1000
0001	10001409	ESTEVEZ PEÑA JHONNY NOEL	046-0032728-4		Operador de Flomix	Stgo. Rodriguez	Calidad	131401	10001708,10002680,10003384	A	1000
0001	10002325	FERMIN REYES LUIS ALFREDO	046-0039216-3		Operador de Flomix	Stgo. Rodriguez	Calidad	131401	10001708,10002680,10003384	A	1000
0001	10002834	LECLERC RODRIGUEZ JOSE AMBIORIX	046-0031944-8		Operador de Flomix	Stgo. Rodriguez	Calidad	131402	10001708,10002680,10003384	A	1000
0001	10000026	ROMERO ABREU JOHNNATTAN RAFAEL	4600355822		Operador de Inspector Electronico	Stgo. Rodriguez	Producción	131404	10000146,10000155	A	1000
0001	10001348	CERDA MADERA RUBEN ALEXANDER	046-0035159-9		OPERADOR DE JARABE CLARIFICADO	Stgo. Rodriguez	Calidad	131202	10001708,10002680,10003384	A	1000
0001	10000009	ESTEVEZ BEJARAN JUAN PORTOLATIN	4600310405		OPERADOR DE JARABE TERMINADO	Stgo. Rodriguez	Calidad	131203	10001708,10002680,10003384	A	1000
0001	10000075	ESTEVEZ RODRIGUEZ SANTOS EVARISTO	4600318101		OPERADOR DE JARABE TERMINADO	Stgo. Rodriguez	Calidad	131203	10001708,10002680,10003384	A	1000
0001	10000047	PERALTA NUÑEZ CESAR ANTONIO	4600104303		Operador de Lavadora	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10000049	JIMENEZ PEGUERO ELISEO DE JESUS	046-0008812-6		Operador de Lavadora	Stgo. Rodriguez	Producción	131404	10000146,10000155	A	1000
0001	10000106	ESPINAL BAEZ DOMINGO ANTONIO	4600121380		Operador de Lavadora	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10000138	TEJADA JEREZ MANUEL DE JESUS	3300028655		Operador de Lavadora	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10000015	JUMELLES REYES CARLOS MANUEL	4600361440		operador de llenadora	Stgo. Rodriguez	Producción	131406	10000146,10000155	A	1000
0001	10000017	LECLERC PERALTA GENY ALEXANDER	3104841220		Operador de Llenadora	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10000022	REYES SANCHEZ DAVID LEONARDO	5600971112		Operador de Llenadora	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10000043	ESTEVEZ CESPEDES FRANKLIN	11600003658		Operador de Llenadora	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10000044	JIMENEZ PERALTA JOSE ALBERTO	4600357877		Operador de Llenadora	Stgo. Rodriguez	Producción	131406	10000146,10000155	A	1000
0001	10000045	LUGO PERALTA RICARDO ANTONIO	4600341327		Operador de Llenadora	Stgo. Rodriguez	Producción	131305	10000146,10000155	A	1000
0001	10000065	ESPINAL FERNANDEZ RAMON ELIAS	4600355939		Operador de Llenadora	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10000074	BONILLA DIAZ RAFAEL BIENVENIDO	4600364923		Operador de Llenadora	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10000182	TORRES ALMONTE LUIS FAUSTINO	4600326427		Operador de Llenadora	Stgo. Rodriguez	Producción	131305	10000146,10000155	A	1000
0001	10001408	TORRES NUÑEZ CARLOS MANUEL	046-0033808-3		Operador de Llenadora	Stgo. Rodriguez	Producción	131306	10000146,10000155	A	1000
0001	10001933	BUENO ESTEVEZ FRANCISCO JAVIER	4600363677		Operador de Llenadora	Stgo. Rodriguez	Producción	131405	10000146,10000155	A	1000
0001	10000936	DIAZ CALDERON JOSE RAMON	10700007833		Operador De Montacarga	Azua	Almacén De Centro Operativo	122007	10001168	A	1006
0001	10000959	RAMIREZ PORTE ALEXIS MANUEL	106-0002341-9		Operador De Montacarga	Azua	Almacén De Centro Operativo	122007	10001168	A	1006
0001	10000852	ULYSSE EMMANUEL	402-2035992-7		Operador De Montacarga	Higuey	Almacén De Centro Operativo	122010	10000861	A	1010
0001	10000853	DE LUNA JIMENEZ MOISES	2600857136		Operador De Montacarga	La Romana	Almacén De Centro Operativo	122006	10000869	A	1005
0001	10002824	MORLA GUERRERO MAICO	402-2051034-7		Operador De Montacarga	La Romana	Almacén De Centro Operativo	122006	10000869	A	1005
0001	10002850	REGALADO CAMILO FRANCISCO JAVIER	136-0017285-5		Operador De Montacarga	Nagua	Almacén De Centro Operativo	132306	10002575	A	1009
0001	10001957	GOMEZ ULLOA ANGELO	3701041174		Operador De Montacarga	Puerto Plata	Almacén De Centro Operativo	122008	10001182	A	1007
0001	10003298	MORROBEL CONTRERAS JEFFREY DE JESUS	037-0109048-6		Operador De Montacarga	Puerto Plata	Almacén De Centro Operativo	122008	10001182	A	1007
0001	10003190	MORILLO VENTURA SAVIC ENMANUEL	056-0105030-4		Operador De Montacarga	San Francisco	Almacén De Centro Operativo	122005	10002864	A	1004
0001	10000630	RODRIGUEZ PERALTA FELICIANO	046-0024213-7		Operador De Montacarga	Santiago	Almacén De Centro Operativo	122004	10001244	A	1003
0001	10000029	LIMA PEÑA ADALBERTO DE JESUS	4600310363		Operador de Montacarga	Stgo. Rodriguez	Almacén Central de Producto Terminado	132402	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000056	TORRES REYES PABLO JOSELITO	4600307021		Operador de Montacarga	Stgo. Rodriguez	Producción	132402	10000146,10000155	A	1000
0001	10000070	SOLINO HOLGUIN LUCIO DE JESUS	11600010265		Operador de Montacarga	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000078	MARIÑEZ MARCELO ANTONIO	4400107589		Operador de Montacarga	Stgo. Rodriguez	Producción	131306	10000146,10000155	A	1000
0001	10000096	CANELA ORLANDO FABIAN	4600015582		Operador de Montacarga	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10000163	ESTEVEZ PERALTA CESAR GERONIMO	4600350401		Operador de Montacarga	Stgo. Rodriguez	Producción	131404	10000146,10000155	A	1000
0001	10000180	RODRIGUEZ ESTEVEZ FRANCISCO ANTONIO	7300135717		Operador de Montacarga	Stgo. Rodriguez	Producción	131305	10000146,10000155	A	1000
0001	10000193	TAPIA CONTRERAS YACARLO YSRRAEL	15100002789		Operador de Montacarga	Stgo. Rodriguez	Producción	131306	10000146,10000155	A	1000
0001	10001042	FERNANDEZ MARIA AMADO	046-0028733-0		Operador de Montacarga	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10001096	BAEZ GENEREZ JOSE BIENVENIDO	4600136545		Operador de Montacarga	Stgo. Rodriguez	Almacén Central de Producto Terminado	122001	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10001285	SOSA BAEZ VICTOR ALEJANDRO	4600351672		Operador de Montacarga	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10002561	GARCIA ESTEVEZ RAMON DEL CARMEN	046-0031949-7		Operador de Montacarga	Stgo. Rodriguez	Almacén Central de Producto Terminado	132307	10000150,10000151,10000241,10002764,10003330	A	1000
0001	10002566	DE LA CRUZ CAPELLAN BLAS ANTONIO	046-0033827-3		Operador de Montacarga	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10002650	GOMEZ ESTEVEZ JORGE YSMAEL	073-0016395-8		Operador de Montacarga	Stgo. Rodriguez	Producción	132402	10000146,10000155	A	1000
0001	10000526	BELLO CESAR	1200763173		Operador De Montacarga	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10003176	MEJIA DEL JESUS EDDY SANTIAGO	001-1556921-2		Operador De Montacarga	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10000084	PEÑA GARCIA ELVIS	11600019746		Operador de Paletizadora	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10000120	MARIA PEREZ RAFAEL	4600358990		Operador de Paletizadora	Stgo. Rodriguez	Producción	131306	10000146,10000155	A	1000
0001	10000188	DILONE TEJADA MARTIN LEANDRO	4600349783		Operador de Paletizadora	Stgo. Rodriguez	Producción	131305	10000146,10000155	A	1000
0001	10000192	RODRIGUEZ MARTINEZ MIGUEL	7300143364		Operador de Paletizadora	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10000249	LECLERC LORA EDUARDO ARTURO	031-0386556-8		Operador de Paletizadora	Stgo. Rodriguez	Producción	131305	10000146,10000155	A	1000
0001	10001232	PERALTA MORAN ENMANUEL DE JESUS	046-0037767-7		Operador de Paletizadora	Stgo. Rodriguez	Producción	131403	10000146,10000155	A	1000
0001	10001297	ORTEGA HERNANDEZ SANTANA	402-2136297-9		Operador de Paletizadora	Stgo. Rodriguez	Producción	131405	10000146,10000155	A	1000
0001	10000142	ESTEVEZ RODRIGUEZ MAXIMO ANTONIO	4600353116		OPERADOR DE PASTEURIZADOR	Stgo. Rodriguez	Calidad	131406	10001708,10002680,10003384	A	1000
0001	10001839	VARGAS PERALTA WILBERT NATAEL	402-2125315-2		OPERADOR DE PASTEURIZADOR	Stgo. Rodriguez	Calidad	131406	10001708,10002680,10003384	A	1000
0001	10000048	HIDALGO REYES CHALAKO RAFAEL	4600339925		Operador de Sopladora	Stgo. Rodriguez	Producción	131306	10000146,10000155	A	1000
0001	10000067	CAMPO UREÑA BERNARDINO ANTONIO	4600061941		Operador de Sopladora	Stgo. Rodriguez	Producción	131302	10000146,10000155	A	1000
0001	10000107	ROSARIO MARIA JANCEL EURIBE	4600365763		Operador de Sopladora	Stgo. Rodriguez	Producción	131306	10000146,10000155	A	1000
0001	10000177	NUÑEZ CARRERA OSCAR NISAEL	7300171118		Operador de Sopladora	Stgo. Rodriguez	Producción	131306	10000146,10000155	A	1000
0001	10000206	TEJADA THOMAS ARIEL ARISMENDY	4600363321		Operador de Sopladora	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10000207	CHAVEZ DIPRE HELSON ISRAEL	4600393229		Operador de Sopladora	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10001172	ROJAS CASTRO LUIS ENRIQUE	402-2273971-2		Operador de Sopladora	Stgo. Rodriguez	Producción	199992	10000146,10000155	A	1000
0001	10001339	PERALTA BAEZ FRANCIS GABRIEL	046-0036615-9		Operador de Sopladora	Stgo. Rodriguez	Producción	131406	10000146,10000155	A	1000
0001	10001864	RODRIGUEZ PERALTA NOELVIS GABRIEL	22900058425		Operador de Sopladora	Stgo. Rodriguez	Producción	131405	10000146,10000155	A	1000
0001	10001934	GOMEZ RODRIGUEZ JORDYN ANDRES	4600386397		Operador de Sopladora	Stgo. Rodriguez	Producción	131402	10000146,10000155	A	1000
0001	10002817	BAEZ JIMENEZ CRISTIAN LEONARDO	046-0038618-1		Operador de Tratamiento de Aguas	Stgo. Rodriguez	Calidad	131101	10001708,10002680,10003384	A	1000
0001	10000035	ECHAVARRIA PEÑA JORGE LIZARDO	4600330221		Operador de Tratamiento de Aguas Residua	Stgo. Rodriguez	Medio Ambiente	131201	10001708,10002680,10003384	A	1000
0001	10000066	GARCIA PERALTA JOEL DE LOS SANTOS	4600352019		Operador de Tratamiento de Aguas Residua	Stgo. Rodriguez	Medio Ambiente	131102	10001708,10002680,10003384	A	1000
0001	10000114	RODRIGUEZ LIBERATA JOSE APOLINAR	4600370995		Operador de Tratamiento de Aguas Residua	Stgo. Rodriguez	Medio Ambiente	131102	10001708,10002680,10003384	A	1000
0001	10000209	PITA ORTIZ ERADY ANTONIO	4600322459		Operador de Tratamiento de Aguas Residua	Stgo. Rodriguez	Medio Ambiente	131102	10001708,10002680,10003384	A	1000
0001	10001015	SILVA MELENDEZ JHON			Operador de Tratamiento de Aguas Residua	Stgo. Rodriguez	Medio Ambiente	131102	10001708,10002680,10003384	A	1000
0001	10001674	PEREZ RODRIGUEZ GREGORIO MANUEL	116-0002130-4		Operador de Tratamiento de Aguas Residua	Stgo. Rodriguez	Medio Ambiente	131102	10001708,10002680,10003384	A	1000
0001	10003371	RAMIRES REYES MARCOS ORBIS	026-0108420-1		Parqueador De Flota Liviana	La Romana	Almacén De Centro Operativo	122006	10000869	A	1005
0001	10000582	GENAO VALENZUELA FRANCISCO	001-1157114-7		Parqueador De Flota Liviana	Sto. Dgo. Este	Almacén De Centro Operativo	122003	10000548	A	1002
0001	10001087	FILPO DIAZ FRANK LUIS	1001086774		Pintor	Azua	Publicidad Y Promociones	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10002300	CUEVAS MONTERO RONSON STARLIN	010-0104976-4		Pintor	Azua	Publicidad Y Promociones	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10001676	PILIER DE LOS SANTOS JAIRY ESCOL	2601293067		Pintor	La Romana	Publicidad Y Promociones	122006	10000847,10000855,10000876,10002986	A	1005
0001	10003278	CARPIO VARGAS ROBEL MADIEL	402-2032035-8		Pintor	La Romana	Marketing	122006	10000847,10000855,10000876,10002986	A	1005
0001	10002663	LOPEZ RAMOS RICAURY ADALBERTO	038-0019524-4		Pintor	Puerto Plata	Marketing	122008	10000894	A	1007
0001	10002731	GONZÁLEZ ALMONTE QUIRINO	037-0083077-5		Pintor	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10002380	FELIPE SANTOS LEONARDO ALFONSO	031-0386153-4		Pintor	Santiago	Marketing	122004	10000634	A	1003
0001	10003353	RODRIGUEZ ESPINAL ROBINSON	402-2390003-2		Pintor	Santiago	Trade Marketing.	122004	10000634	A	1003
0001	10000562	DURAN ALMANZAR EUSTAQUIO	110203197		Pintor	Sto. Dgo. Este	Publicidad Y Promociones	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003279	VASQUEZ ULLOA GREGORIO ORLANDO	001-1485723-8		Pintor	Sto. Dgo. Este	Marketing	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002338	BAPTISTE RELLINA ISRAEL	224-0034122-2		Pintor Automotriz	Sto. Dgo. Oeste	Mantenimiento Automotríz	132204	10002408	A	1001
0001	10000144	ALMONTE POU CARLOS JOSE	4600305322	calmonte	Planificador De Produccion	Stgo. Rodriguez	Producción	199992	10001005	A	1000
0001	10003474	DE LOS SANTOS VILLAMAN HECTOR ARMANDO	402-2016491-3	hdelossantos	Planner De Mantenimiento	Sto. Dgo. Oeste	Mantenimiento Automotríz	132404	10003293	A	1001
0001	10000937	BLANDINO MEJIA RAMON ANTONIO	010-0088953-3		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10000949	PEÑA PUJOLS ANGEL ESTELIN	010-0092036-1		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10000976	PEREZ MENDEZ JUAN PABLO	022-0023804-2		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10000984	RAMIREZ BERIGUETE MIGUEL ANGEL	010-0102144-1		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10001716	MEJIA PUJOLS SANTO CESARIO	132-0000559-6		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10002051	GARCIA LAPAIX FERNANDO ANTONIO	1201057831		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10002465	CORNIEL CARMONA REYNOL JACINTO	003-0102771-0		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10002469	RIVAS MENDEZ NEYSEL PORFIRIO	078-0013132-3		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10002481	DE LOS SANTOS PIÑA ROSENDO	011-0034859-6		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10002484	RAMIREZ CORNIELLE JHOMALCO	018-0070343-9		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10002664	PEREZ FELIZ PABLO RAFAEL	018-0063043-4		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10002735	LEBRON YAN MARBIN	018-0066807-9		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10002845	GUZMAN LORENZO SANTO BIENVENIDO	001-1648742-2		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10002849	CHONG VIZCAINO EDWIN SMITH	003-0107265-8		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10003117	ENCARNACION MEDINA MAXUEL GUSTAVO	012-0095600-9		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10003118	SOTO ENCARNACION CARLOS GARDO	402-2100049-6		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10003119	PUJOLS DIAZ LUIS CARLOS	402-2168245-9		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10003120	PEREZ PIMENTEL EUDIS AMAURIS	003-0109251-6		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10003193	PEREZ MENDEZ HECTOR MIGUEL	010-0090026-4		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10003194	BIDO ONIEL	012-0097674-2		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10003346	MATEO MATOS LUIS ALBERTO	018-0067465-5		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10003347	TEJADA FELIZ YEISON	018-0080266-0		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10003498	FLORIAN CUEVAS GRABRIEL DIONISIO	022-0036296-6		Pre-Venta	Azua	Ventas	122007	10000940,10000957,10000973,10001719,10002360	A	1006
0001	10000854	VASQUEZ MARTE RAFAEL	026-0115125-7		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10000862	MERCEDES VILLA RAMON ANTONIO	026-0036925-6		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10000878	DE JESUS VALENCIA JOSE ALBERTO	023-0126000-2		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10001315	MARTINEZ REYES OMAR OVIDIO	402-2137447-9		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10001320	SEVERINO VALDEZ JUAN FRANCISCO	026-0090197-5		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10001536	CRUZ MERCEDES WILFRIDO	023-0101024-1		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10001541	SEPULVEDA LEONARDO REYNALDO	026-0033097-7		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10001630	DE LA CRUZ HERRERA EDWARD ENRIQUE	10300112181		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10002179	MARTINEZ PALMERO OVIDIO OMAR	001-0337355-1		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10002437	RIJO MOJICA VIZCANIA	2601071646		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10002632	SOLANO HERNANDEZ GERSON LUIS	023-0142733-8		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10002635	ZORRILLA GREEN JUAN CARLOS	026-0128567-5		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10002636	RODRIGUEZ ESPINAL ROBEL RAFAEL	052-0010435-3		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10002822	REYES PEÑA LEWYS BIENVENIDO	026-0122526-7		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10002890	DE LEON DE LEON KLEYVIS	026-0131140-6		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10003065	PEREZ BREA JOSE ALBERTO	026-0081463-2		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10003143	SANCHEZ PEREZ RAMON ALBERTO	026-0123996-1		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10003154	EUSEBIO RAMIREZ HECTOR LUIS	023-0131209-2		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10003317	ALEXIS MONTERO FRANKLIN	026-0120980-8		Pre-Venta	La Romana	Ventas	122006	10000847,10000855,10000876,10002986	A	1005
0001	10000898	VASQUEZ HURTADO JOSE GUILLERMO	037-0108488-5		Pre-Venta	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10000902	OZORIA OZORIA FREDDY ESTEBAN	033-0018017-5		Pre-Venta	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10001394	ARIAS FURNIEL EMENEJILDO	047-0187999-3		Pre-Venta	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10001837	ALMONTE BURGOS FEDERICO	037-0073611-3		Pre-Venta	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10002445	CASTILLO TAVAREZ JERRY ALEXANDER	6000224342		Pre-Venta	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10002532	ESTRELLA NUÑEZ JOEL JOSE	038-0018206-9		Pre-Venta	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10002704	FAMILIA CASTILLO ESTIBIN	402-2248630-6		Pre-Venta	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10002705	GOMEZ VENTURA REMIS	037-0109722-6		Pre-Venta	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10002730	MORALES ROMÁN CARLOS ARÍSTIDES	120-0001532-6		Pre-Venta	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10002958	HIDALGO ACEVEDO JUAN ADOLFO	037-0103465-8		Pre-Venta	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10002959	MOORE SANTOS JUAN JOSE	097-0020423-4		Pre-Venta	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10003299	RODRIGUEZ VENTURA DARIEL DE JESUS	102-0012883-2		Pre-Venta	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10003302	VENTURA PEREZ PEDRO JOSE	037-0110067-3		Pre-Venta	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10000794	PEÑA LANTIGUA NOLBERTO	048-0089399-4		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10000796	DIAZ DE LA ROSA ORLANDO	056-0094669-2		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10000824	REINOSO DE LA CRUZ JOSE LUIS	056-0156563-2		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10000827	GALAN DORIAN	049-0062269-9		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10000828	MENDOZA HERNANDEZ LUIS RAFAEL	5600858210		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10000829	PEREZ GORIS ANDRES	056-0159598-5		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10000838	DE LA CRUZ PAYANO RAMON JOSE	056-0109557-2		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10001610	RONDON SERRANO GUARLIN	049-0080339-8		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10001996	SUAREZ MEREJILDO PEDRO LUIS	5601372146		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002103	CONCE VASQUEZ FRANCISCO DE JESUS	5601607376		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002109	TAVERAS VILLAR CORNELIO LEONEL	056-0138281-4		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002113	VARGAS DE JESUS XANDER	048-0093786-6		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002463	JIMENEZ PERALTA JUAN FRANCISCO	056-0166875-8		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002514	BELLO AMBIORIS	5601737934		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002518	PEREZ ALVAREZ JUAN CARLOS	056-0134174-5		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002726	FERNÁNDEZ ORTEGA MIGUEL ENRÍQUEZ	056-0171372-9		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002853	DE JESUS BELLO DAGUIBERTO	056-0163869-4		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002858	MARTINEZ CARDENA FREDDY	056-0141751-1		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002930	BAEZ JOSE ALBERTO	048-0034906-2		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002932	GARCIA RODRIGUEZ DARIDEIBY	048-0099008-9		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10002999	DE JESUS FLORES ANDERSON	071-0053871-4		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003045	ACEVEDO GARCIA JUAN CARLOS	402-2031701-6		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003056	ACOSTA REYES JOSE FRANCISCO	049-0073464-3		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003068	FAMILIA FLORENTINO MARINO ARIEL	048-0080292-0		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003094	CANDELARIO CANDELARIO CRISTIAN CLEMENTE	4800753800		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003103	CAMILO PAULINO JOSE LUIS	056-0134315-4		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003114	POLANCO MUÑOZ NOEL RAMON	056-0151633-8		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003184	BURGOS ALBERTO JUAN MANUEL	048-0098236-7		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003188	CAMBERO VILORIO FRANCISCO MICHAEL	049-0083258-7		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003189	CORREA MENA JHONNY GABRIEL	402-2012584-9		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003210	TAVERAS MAYRELES ANDRES	056-0155597-1		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003211	HIDALGO JOEL ANTONIO	056-0135769-1		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003488	PEÑA NUÑEZ JOSE GREGORIO	048-0081521-1		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10003496	SALAZAR CASTILLO ANTONIO MANUEL	056-0125008-6		Pre-Venta	San Francisco	Ventas	122005	10000781,10000783,10001321,10003161,10003361	A	1004
0001	10000629	GOMEZ FERNANDEZ FAUSTO FELIPE	031-0408124-9		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000642	CAPELLAN LAJARA SENDY MARGARITA	047-0144655-3		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000643	ABREU OLIVO SERGIO YUNIOR SEBASTIAN	3102324237		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000656	BORBON RODRIGUEZ DAVID YEUDY	031-0506378-2		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000697	MARTINEZ JUAN DE DIOS	3103344648		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000698	VALENZUELA ESCOTO JOSCAR	031-0439509-4		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000700	MORROBEL SANTANA VIRGILIO ANTONIO	046-0035024-5		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000701	PEÑA ESTEVEZ ARGENYS MARCELINO	046-0032672-4		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000716	ESPINAL LIMA JULIAN ANTONIO	046-0032834-0		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000719	MARTINEZ GARCIA JOSE FRANCISCO	001-1577782-3		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000728	ALVAREZ ALVAREZ ARMANDO JOSE	064-0029635-3		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000729	GOMEZ CABRERA JAVIER	031-0435376-2		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000730	CARABALLO CORNIEL LUIS FERNANDO	3105236677		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000735	CABRERA GENERE WALLY ANTONIO	031-0531868-1		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000739	MERCADO PEREZ SANDY MARTIN	031-0494423-0		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000748	REYES GUZMAN JOSE YGNACIO	031-0413249-7		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000749	GARCIA TORIBIO JOSE ADAMES	4600388856		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10001073	CASTILLO TEJADA CARLOS JULIO	3105349439		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10001134	LOPEZ JEAN CARLOS	3105413540		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10001137	ROSARIO FERREIRA JULIO CESAR	402-2034596-7		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10001150	DILONE MORONTA ELADIO MAGDALENO	3102883273		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10001424	FERNANDEZ BAEZ EBARISTO LUCIANO	046-0032630-2		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10001432	VARGAS PERALTA BENIGNO ANTONIO	034-0048796-7		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10001611	ORTIZ VERAS JUAN FREDY	036-0036187-1		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10001720	MONEGRO MENDEZ JOEL ANTONIO	051-0018665-8		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10001726	SANCHEZ REYES NATANAEL	121-0015056-9		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10001814	MENDEZ ROSARIO PEDRO LUIS	054-0139199-9		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10001856	PEÑA RODRIGUEZ EDDY DIOSMERI	117-0007046-6		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10001951	TORRES VAZQUEZ MIGUEL BIENVENIDO	046-0038251-1		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10001959	PEÑA SOSA JUAN CARLOS	402-2044183-2		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10002005	LOPEZ AYALA ANGEL JOSE	401-2197544-1		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10002057	GERMOSEN CASTILLO EDUARDO EMMANUEL	047-0179002-6		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10002386	MEJIA AMEZQUITA KELVIN EMILIANO	047-0177805-4		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10002584	CABREJA RAMOS ROBERT DE LOS SANTOS	115-0000692-6		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10002659	NUÑEZ GERMOSO TULIO CENEN	12200039456		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10002687	MOREL RODRIGUEZ MAXIMILIANO DE JESUS	054-0152745-1		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10002692	MOTA NUÑEZ JOEL ANTONIO	047-0192392-4		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10002693	RODRIGUEZ JIMENEZ YUNY	047-0193488-9		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10002869	CORPORAN BUENO ANGEL DAVID	115-0000053-1		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10002870	CARRASCO ALCANTARA STARLYN DANIEL	031-0559356-4		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003001	VERAS RUIZ DELVI MANUEL	402-2258781-4		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003003	DOMINGUEZ REYES CARMELO ANTONIO	046-0038898-9		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003081	ESTEVEZ MORONTA LENNY CARLOS	096-0024183-1		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003356	ROMAN JIMENEZ ROBER RADAFIL	101-0008075-2		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003376	PEÑA MARTINEZ JEAN CARLOS	047-0174533-5		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003383	MARTINEZ GARCIA NICAURY	054-0155506-4		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003403	GARCIA GARCIA ARNALDO ANTONIO	047-0182168-0		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003481	VASQUEZ BREA LORENZO ANTONIO	037-0084747-2		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003517	ROSADO DE LEON CECILIO	017-0020270-6		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003518	GARCIA GUTIERREZ JOSE DOLORES	053-0036960-9		Pre-Venta	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10000555	CRUZ DISLA FAUSTINO ANTONIO	001-0506681-5		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10000573	RAMIREZ MENDEZ JEISYS	1400168439		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10000598	VIDAL BONIFACIO MIGUEL	223-0118679-1		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10000619	GONZALEZ MUÑOZ FRANCISCO	113077887		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001314	PEREZ MONTERO OBISPO	001-1752726-7		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001326	RAMIREZ JHONATAN	223-0026086-0		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001327	ORTIZ RIVERA DANYER SILVESTRE	223-0105225-8		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001328	HIDALGO HICHEZ WADY JUNIOR	001-1850233-5		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001332	MERCADO DELGADO EDDY FRANCISCO	123-0015626-7		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001488	RAMIREZ RODRIGUEZ JEFFRY	402-2185230-0		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001489	SANCHEZ CONCEPCION JULIO ANIBAL	223-0062534-4		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001490	SORIANO MENDOZA STALIN VLADIMIR	223-0037293-9		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001545	AQUINO VARGAS EDWIN	008-0026776-7		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001712	VALDEZ ALCANTARA FELIX	016-0014147-5		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001803	ALCANTARA DENISON	223-0042784-0		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001805	VIDAL BONIFACIO ANTONIO	123-0015693-7		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001896	PEGUERO ANGEL RIQUELMI	22300642901		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001897	DE LA ROSA MONTERO LEANYIS	223-0092866-4		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001909	TINEO BELLO FAUSTO	22300947615		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001981	DE LOS SANTOS JIMENEZ ERISON	223-0140179-4		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002209	IRRIZARIO VALDEZ KENFHIL AMBIORIX	223-0094279-8		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002211	MORA CIRIACO VICTOR GABRIEL	402-2061678-9		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002212	MARTINEZ GARCIA SANDY	223-0122796-7		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002213	ZARZUELA MONTERO VICTOR MANUEL	223-0073501-0		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002278	BRITO DEL ROSARIO JUAN JOSE VLADIMIR	008-0028196-6		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002396	AMADOR ROMERO JOSE ANTONIO	223-0038689-7		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002450	FERRERAS ENCARNACION GIORIBER OMAR	223-0103103-9		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002555	BAUTISTA BREA THOMAS	223-0047714-2		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002603	CELEDONIO ANGEL RAMON	22300481227		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002604	GOMEZ MONTERO VICTOR ANDRES	014-0021945-5		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002744	VALENZUELA PANIAGUA MARTIN EDUARDO	223-0153485-9		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002747	JIMÉNEZ DE LOS SANTOS OSCAR ADRIAN	010-0115952-2		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002807	TEJADA DIAZ JONATHAN ABDUL	001-1720293-7		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002879	MARTINEZ MILLER EDWARD MANUEL	001-1327604-2		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002897	CEPEDA TEJEDA JUNIOR	001-1478693-2		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002970	PEREZ CUEVAS JOHAN	223-0035016-6		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003032	ALMONTE FERNANDEZ JOSE MANUEL	116-0001597-5		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003038	DE LA ROSA DELGADO ISAIAS	001-1670127-7		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003039	FLORENTINO SEVERINO JEANCARLOS	223-0162419-7		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003085	PEGUERO CUELLO JUNIOR	001-1542449-1		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003086	FELIZ RIVERA LUIS NATANAEL	090-0023195-2		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003108	ROJAS LANTIGUA JEAN CARLOS	225-0050516-3		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003109	SANCHEZ ALCANTARA CONFESOR	012-0070749-3		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003110	CASTRO VALDEZ JUAN AQUINO	223-0091005-0		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003111	 DAMIAN CONTRERAS ANEUDYS	223-0062511-2		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003251	RODRIGUEZ INOA JOSE ANTONIO	223-0063751-3		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003252	MOTA ALMONTE RUBY	049-0080718-3		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003253	LEOCADIO DE LA ROSA DIOGENES	008-0029882-0		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003314	PERALTA GIL MARTIN DOMINGO	051-0010129-3		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003391	MONTERO DE LOS SANTOS ANTIMO	014-0014458-8		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003392	FULGENCIO CUEVAS JONATHAN ENMANUEL	223-0047844-7		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003393	SANCHEZ LORENZO ENOC ELIAS	001-1915745-1		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003453	RAMIREZ NUÑEZ FRARLIN ANTONIO	001-1393095-2		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003455	BATISTA FELIZ DIONICIO	001-1131592-5		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003464	DE LA CRUZ BELTRAN CONFERSOR	001-1889947-5		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003472	LEBRON FEBRILLE ANEUDY ANDRES	223-0071646-5		Pre-Venta	Sto. Dgo. Este	Industrias San Miguel Del Caribe S.A	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003473	RAMIREZ RAFAEL FERNANDO	001-1749522-6		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003502	GOMEZ RAMIREZ MARIO MELVIN	402-2144496-7		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003508	PEREZ CORDERO STALIN FLORENTINO	223-0053987-5		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10003511	GONZALEZ ESCARRAMAN NEULI ANTONIO	118292416		Pre-Venta	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10001711	LORENZO BAUTISTA JOSE ALBERTO	011-0036683-8		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10001968	PERALTA ABELINO NOEL ARTURO	224-0014293-5		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002207	DOMINGUEZ MEDINA JUAN EDUARDO	001-1660337-4		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002339	SAMBOY FERRERAS RAMON	080-0008018-7		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002367	JIMENEZ MOTA PEDRO	068-0039766-0		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002368	ADAMES MENDEZ CARLOS	001-1467056-5		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002517	RAMIREZ BAEZ RONNY JACKSON	224-0055636-5		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002523	VILLA FAÑA SURIEL GUSTAVO ADOLFO	114962574		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002623	MORENO FLETE JULIO CESAR	224-0000176-8		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002724	ALCÁNTARA SIERRA CORIDIO	012-0099737-5		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002790	BASILIO SEVERINO JOSE JULIAN	001-1864791-6		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002796	GARCIA CACERES JUAN YANQUELI	001-1828075-9		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10002900	TAVERAS DE JESUS ANEURY	001-1679021-3		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003054	SANCHEZ JAIRO ALEJANDRO	001-1429817-7		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003115	VERAS REYES LENIN MICHEL	001-1685615-4		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003116	MEDINA BENITEZ MILOVAN ERNESTO	070-0003876-5		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003130	MORDAN PAULU JUAN	001-1390732-3		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003274	GONZALEZ SANCHEZ JUSTO ADALBERTO	002-0144635-8		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003280	BETANCES TEJADA MIGUEL GREGORIO	224-0038928-8		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003281	DE LA CRUZ LANTIGUA ASIER AGUSTIN	402-2142957-0		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003282	BLANCO VARGAS LEONARDO ALEXANDER	001-1268184-6		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003283	FELIZ RUBIO FRANNY	224-0046840-5		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003284	GONZALEZ DURAN CARLOS MANUEL	229-0003208-1		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003285	MARTINEZ PERALTA WILSON JOSE	224-0016946-6		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003308	MARTINEZ ORTIZ MELVIN	002-0148832-7		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003309	EVANGELISTA JORGE LUIS	001-1803819-9		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003321	PEREZ PEREZ MANUEL ANTONIO	018-0060841-4		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003323	BELTRE RUSBER ANTONIO	010-0116611-3		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003329	DEL ORBE RAMON ALTAGRACIA	001-1846695-2		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003340	ARIAS CAMACHO EDILSON ANTONIO	001-1818188-2		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003341	VALENTIN MOTA JOSE MIGUEL	001-1829289-5		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003385	MENDEZ FELIZ JHONATAN ARGENIS	002-0135465-1		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003386	RODRIGUEZ PIMENTEL CLAUDIO FREDERICK	068-0035073-5		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003387	MANZUETA VIZCAINO CARLOS STARLYN	001-1902664-9		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003398	MENDOZA CEBALLO PEDRO PABLO	049-0076672-8		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003401	REYES THEN JORGE ALBERTO	402-2161142-5		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003438	CONTRERA ROJAS MANUEL	001-1767246-9		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003447	VALDEZ DE LA ROSA EMMANUEL	224-0007272-8		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003458	DIAZ LAUDIS ADALBERTO	001-1658229-7		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003468	FERMIN CABRERA JOSE LUIS	001-1325174-8		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003475	VILLA ENCARNACION JOSE FABRICIO			Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003476	MARTE SEGURA ELIAS ALBERTO	001-1570540-2		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003479	MONTERO RODRIGUEZ JENSEL	002-0147170-3		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003499	VILORIO DE JESUS AMAURIS GERMAN	026-0052165-8		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003515	ABAD CALDERON NIRSON RAFAEL	002-0132375-5		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003525	PEÑA MERCEDES JEUDIS ARIEL	020-0015017-3		Pre-Venta	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10003091	MELO GUZMAN WILLY ANTHONY	037-0091372-0		Pre-Venta Pool	Puerto Plata	Ventas	122008	10000894	A	1007
0001	10001063	MEJIA GARCIA ANOLFO	048-0107397-6		Soldador	Sto. Dgo. Oeste	Mantenimiento Automotríz	132404	10002408	A	1001
0001	10001018	ROJAS SILVESTRE GINO ROLAN	402-2236524-5	grojas	Soporte Tecnico	Sto. Dgo. Oeste	Soporte Técnico	112002	10002319	A	1001
0001	10000347	MALDONADO ESTEVEZ CARLOS MANUEL	001-1246338-5	cmaldonado	Soporte Tecnico Senior	Sto. Dgo. Oeste	Soporte Técnico	112001	10002319	A	1001
0001	10000957	VARGAS SUAZO GUILLERMO ARTURO	010-0098784-0	gvargas	Supervisor	Azua	Ventas	122007	10000690	A	1006
0001	10000547	SEVERINO MIRIAN	001-1711982-6	mseverino	Supervisor Canal Moderno	Sto. Dgo. Este	Ventas	122003	10001021	A	1002
0001	10000402	MARMOL CRUZ YUNIOR ANTONIO	224-0014998-9	ymarmol	Supervisor De Cuentas Claves	Sto. Dgo. Oeste	Canal Especial	122002	10001718	A	1001
0001	10000324	RODRIGUEZ NUÑEZ MIGUEL	046-0038855-9	mapinfo.sr	Supervisor De Distribución	Stgo. Rodriguez	Distribución	122001	10003471	A	1000
0001	10002786	TRONCOSO PERALTA JOSE ALFREDO	001-1382420-5	jtroncoso	Supervisor De Distribución	Sto. Dgo. Oeste	Distribución	121004	10003471	A	1001
0001	10000634	CEBALLO GENAO JOSE DIONISIO	031-0360691-3		Supervisor De Pintados	Santiago	Publicidad Y Promociones	122004	10001010	A	1003
0001	10002720	ESPINAL GENERE IDELFONZO GILBERTO	046-0032103-0		Supervisor de Seguridad Industrial	Stgo. Rodriguez	Seguridad Industrial	132102	10000332	A	1000
0001	10003368	TORRES EDWARD ANTONIO	034-0054608-5		SUPERVISOR DE SEGURIDAD INDUSTRIAL	Stgo. Rodriguez	Seguridad Industrial	132102	10000332	A	1000
0001	10002408	ROMERO RAMIREZ EDWIN RAFAEL	224-0014242-2	eromero	Supervisor De Tranporte	Sto. Dgo. Oeste	Mantenimiento Automotríz	132404	10003293	A	1001
0001	10000940	PATRICIO MENDEZ VICTOR MANUEL	010-0108148-6	vpatricio	Supervisor De Ventas	Azua	Ventas	122007	10000690	A	1006
0001	10000973	CARRASCO MONTAÑO ARISMENDY	010-0099720-3	acarrasco	Supervisor De Ventas	Azua	Ventas	122007	10000690	A	1006
0001	10001719	REYES PIMENTEL FRANCISCO ESMELYN	003-0112930-0	freyes	Supervisor De Ventas	Azua	Ventas	122007	10000690	A	1006
0001	10002360	MATEO DE OLEO FRANKLIN	012-0079136-4	fmateo	Supervisor De Ventas	Azua	Ventas	122007	10000690	A	1006
0001	10000847	SEVERINO JHONSON FRANCISCO HERASMO	026-0123388-1		Supervisor De Ventas	La Romana	Ventas	122006	10000880	A	1005
0001	10000855	QUEZADA BASILIO	023-0138185-7	bquesada	Supervisor De Ventas	La Romana	Ventas	122006	10000880	A	1005
0001	10000876	SANTANA PALACIO VALENTIN DANIEL	026-0106910-3	dsantana	Supervisor De Ventas	La Romana	Ventas	122006	10000880	A	1005
0001	10002986	MEDINA VALERA PEDRO LUIS	026-0025044-9	pmedina	Supervisor De Ventas	La Romana	Ventas	122006	10000880	A	1005
0001	10000894	HERNANDEZ GEOVANNY	3800169215	ghernandez	Supervisor De Ventas	Puerto Plata	Ventas	122008	10002382	A	1007
0001	10000783	MONEGRO RODRIGUEZ JUAN JORGE	056-0131157-3	jmonegro	Supervisor De Ventas	San Francisco	Ventas	122005	10000528	A	1004
0001	10001321	SANTOS GARCIA ODALIS ERNESTO	001-1797227-3	oesantos	Supervisor De Ventas	San Francisco	Ventas	122005	10000528	A	1004
0001	10003161	RESTITUYO RODIRGUEZ FABIO RICARDO	049-0071570-9	frestituyo	Supervisor De Ventas	San Francisco	Ventas	122005	10000528	A	1004
0001	10003361	COMPRES DE LOS SANTOS MELVIN DAVID	056-0147862-0	mcompres	Supervisor De Ventas	San Francisco	Ventas	122005	10000528	A	1004
0001	10000685	SANTOS ALVAREZ ORLANDO MANUEL	094-0021483-0	osantos	Supervisor De Ventas	Santiago	Ventas	122004	10001010	A	1003
0001	10000767	NUÑEZ CABRERA JUAN MIGUEL	039-0017297-8	jnunez	Supervisor De Ventas	Santiago	Ventas	122004	10001013	A	1003
0001	10000770	MENDOZA ENMANUEL HUMBERTO	072-0011190-9	umendoza	Supervisor De Ventas	Santiago	Ventas	122004	10001010	A	1003
0001	10002419	DIAZ GOMEZ EDUIN BIENVENIDO	044-0018435-6	ediaz	Supervisor De Ventas	Santiago	Ventas	122004	10001010	A	1003
0001	10003145	MEJIA COLON VICTOR ENMANUEL	047-0159516-9	vmejia	Supervisor De Ventas	Santiago	Ventas	122004	10001010	A	1003
0001	10003520	CRUZ GARCIA JOSE ORLANDO	031-0334054-7	ocruz	Supervisor De Ventas	Santiago	Ventas	122004	10001010	A	1003
0001	10000357	BAEZ GUICHARDO RAYMUNDO ABAD	110131737	rbaez	Supervisor De Ventas	Sto. Dgo. Este	Ventas	122003	10001021	A	1002
0001	10000533	MELO DIAZ WILKIN ARTURO	106-0005882-9	wilkinm	Supervisor De Ventas	Sto. Dgo. Este	Ventas	122003	10001021	A	1002
0001	10000546	PEREZ VARGAS ELUDIS ELPIDIO	114808587	eperez	Supervisor De Ventas	Sto. Dgo. Este	Ventas	122003	10001021	A	1002
0001	10000563	SEPULVEDA RODRIGUEZ WILKINS JOAN	117543231	wsepulveda	Supervisor De Ventas	Sto. Dgo. Este	Ventas	122003	10001021	A	1002
0001	10000565	LEDESMA ADAMES ALJENDRIS	226-0011842-0	aledesma	Supervisor De Ventas	Sto. Dgo. Este	Ventas	122003	10001021	A	1002
0001	10001797	SUAREZ PEREYRA ALEXIS	114078223	asuarez	Supervisor De Ventas	Sto. Dgo. Este	Ventas	122003	10001021	A	1002
0001	10002376	SURIEL CISNERO LUIS RAMON	001-1247302-0	lsuriel	Supervisor De Ventas	Sto. Dgo. Este	Ventas	122003	10001021	A	1002
0001	10002605	ESPINAL SANTOS HENRY FRANCISCO	001-1816321-1	hespinal	Supervisor De Ventas	Sto. Dgo. Este	Ventas	122003	10001021	A	1002
0001	10002751	ENCARNACIÓN VICENTE DAVID	001-1321701-2	dencarnacion	Supervisor De Ventas	Sto. Dgo. Este	Ventas	122003	10001021	A	1002
0001	10000368	MARTINEZ ESPINAL SANTOS	108360702	smartinez	Supervisor De Ventas	Sto. Dgo. Oeste	Ventas	122002	10002199	A	1001
0001	10001925	MEDINA ALVAREZ JUAN PABLO	060-0016358-1	jmedina	Supervisor De Ventas	Sto. Dgo. Oeste	Ventas	122002	10002199	A	1001
0001	10002797	REYES GOMEZ GENNY BOLIVAR	056-0125956-6	gbreyes	Supervisor De Ventas	Sto. Dgo. Oeste	Ventas	122002	10002199	A	1001
0001	10002956	LABAT REYNOSO JUAN CARLOS	001-0245922-9	jlabat	Supervisor De Ventas	Sto. Dgo. Oeste	Ventas	122002	10002199	A	1001
0001	10003290	RUIZ VARGAS EDDIE JUNIOR ENMANUEL	001-1767607-2	eruiz	Supervisor De Ventas	Sto. Dgo. Oeste	Ventas	122002	10002199	A	1001
0001	10003402	RAMIREZ DE LEON JOSE MIGUEL	001-1347605-5	jmramirez	Supervisor De Ventas	Sto. Dgo. Oeste	Ventas	122002	10002199	A	1001
0001	10003422	PINALES DE LOS SANTOS BARTOLO	001-1248755-8	bpinales	Supervisor De Ventas	Sto. Dgo. Oeste	Ventas	122002	10002199	A	1001
0001	10000781	MENDOZA RIVERA JUNIOR RAFAEL	056-0064780-3	jmendoza	Supervisor Mercaderista	San Francisco	Ventas	122005	10000528	A	1004
0001	10003445	JAVIER ESPINOSA CARLOS MANUEL	223-0063470-0	cjavier	Supervisor Mercaderista	Sto. Dgo. Oeste	Ventas	122002	10002199	A	1001
0001	10001000	ANGELES RISCO GUSTAVO	402-2189390-8		TECNICO DE SOPLADO	Stgo. Rodriguez	Mantenimiento Mecánico	132201	10001026	A	1000
0001	10002528	FERNANDEZ TORRES RUBEN MARTIN	046-0029182-9		Técnico En Refrigeración	Santiago	Ventas	122004	10000637,10000672,10000685,10000767,10000770,10001988,10002419,10003145,10003520	A	1003
0001	10003311	MEJIA SANTANA RICHARD RADHAMES	001-1721360-3		Técnico En Refrigeración	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10002235	PEREZ FELIZ MIGUEL ANGEL	001-1300726-4		Técnico En Refrigeración	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
0001	10000179	ALMONTE BAEZ MAMERTO DE JESUS	3300029760		Tornero	Stgo. Rodriguez	Mantenimiento Mecánico	132203	10001026	A	1000
0001	10000345	ACOSTA PEÑA RAFAEL SANTIAGO	001-0142808-4	racosta	Vendedor De Clientes Claves	Sto. Dgo. Oeste	Ventas	122002	10001718	A	1001
0001	10002908	FELIZ DELGADO LUIS CLEMENTE	224-0020310-9		Vendedor De Clientes Claves	Sto. Dgo. Oeste	Ventas	122002	10001718	A	1001
0001	10003444	MARTINEZ HENRIQUEZ LEUDYS ANTONIO	001-1649633-2		Vendedor De Clientes Claves	Sto. Dgo. Oeste	Ventas	122002	10001718	A	1001
0001	10001460	BELTRE PEREZ HERMOGENES ANTONIO	001-1176176-3		Vendedor De Supermercados	Sto. Dgo. Este	Ventas	122003	10000357,10000533,10000546,10000547,10000563,10000565,10001797,10002376,10002605,10002751	A	1002
0001	10000389	BEATO RAFAEL	108895285		Vendedor De Supermercados	Sto. Dgo. Oeste	Ventas	122002	10000368,10001925,10002797,10002956,10003290,10003402,10003422,10003445	A	1001
\.


--
-- TOC entry 2251 (class 0 OID 16437)
-- Dependencies: 181 2255
-- Data for Name: surveys_detail; Type: TABLE DATA; Schema: hcm; Owner: stilgar
--

COPY surveys_detail (id_survey, survey_innername, id_survey_category, id_survey_question, question_order) FROM stdin;
\.


--
-- TOC entry 2252 (class 0 OID 16440)
-- Dependencies: 182 2255
-- Data for Name: surveys_header; Type: TABLE DATA; Schema: hcm; Owner: stilgar
--

COPY surveys_header (id_survey, survey_name_key, id_survey_type, id_survey_scope, status) FROM stdin;
1	Evaluación de Desempeño 2015	0001	ALL	A
\.


--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 183
-- Name: surveys_header_id_survey_seq; Type: SEQUENCE SET; Schema: hcm; Owner: stilgar
--

SELECT pg_catalog.setval('surveys_header_id_survey_seq', 1, false);


--
-- TOC entry 2110 (class 2606 OID 16743)
-- Dependencies: 171 171 171 2256
-- Name: employees_pkey; Type: CONSTRAINT; Schema: hcm; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id_employee, id_company);


--
-- TOC entry 2122 (class 2606 OID 16745)
-- Dependencies: 180 180 180 2256
-- Name: pk_surveyed; Type: CONSTRAINT; Schema: hcm; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY surveyed
    ADD CONSTRAINT pk_surveyed PRIMARY KEY (company, id);


--
-- TOC entry 2112 (class 2606 OID 16747)
-- Dependencies: 173 173 2256
-- Name: survey_categories_key; Type: CONSTRAINT; Schema: hcm; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY survey_categories
    ADD CONSTRAINT survey_categories_key PRIMARY KEY (id_survey_category);


--
-- TOC entry 2114 (class 2606 OID 16749)
-- Dependencies: 175 175 175 175 175 2256
-- Name: survey_questions_detail_key; Type: CONSTRAINT; Schema: hcm; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY survey_questions_detail
    ADD CONSTRAINT survey_questions_detail_key PRIMARY KEY (id_survey_category, id_survey_question, lang, key_answer);


--
-- TOC entry 2116 (class 2606 OID 16751)
-- Dependencies: 176 176 176 176 176 2256
-- Name: survey_questions_header_key; Type: CONSTRAINT; Schema: hcm; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY survey_questions_header
    ADD CONSTRAINT survey_questions_header_key PRIMARY KEY (id_survey_category, id_survey_question, lang, question_text);


--
-- TOC entry 2130 (class 2606 OID 17027)
-- Dependencies: 252 252 252 252 252 252 2256
-- Name: survey_results_detail_key; Type: CONSTRAINT; Schema: hcm; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY survey_results_detail
    ADD CONSTRAINT survey_results_detail_key PRIMARY KEY (id_survey, id_company, id_employee, id_survey_category, id_survey_question);


--
-- TOC entry 2118 (class 2606 OID 16755)
-- Dependencies: 178 178 178 178 178 2256
-- Name: survey_results_header_key; Type: CONSTRAINT; Schema: hcm; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY survey_results_header
    ADD CONSTRAINT survey_results_header_key PRIMARY KEY (id_survey_result, id_survey, id_company, id_employee);


--
-- TOC entry 2124 (class 2606 OID 16757)
-- Dependencies: 181 181 181 181 181 2256
-- Name: surveys_detail_pk; Type: CONSTRAINT; Schema: hcm; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY surveys_detail
    ADD CONSTRAINT surveys_detail_pk PRIMARY KEY (id_survey, survey_innername, id_survey_category, id_survey_question);


--
-- TOC entry 2126 (class 2606 OID 16759)
-- Dependencies: 182 182 2256
-- Name: surveys_header_pk; Type: CONSTRAINT; Schema: hcm; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY surveys_header
    ADD CONSTRAINT surveys_header_pk PRIMARY KEY (id_survey);


--
-- TOC entry 2120 (class 2606 OID 17036)
-- Dependencies: 178 178 178 178 178 2256
-- Name: uk_survey_header; Type: CONSTRAINT; Schema: hcm; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY survey_results_header
    ADD CONSTRAINT uk_survey_header UNIQUE (id_survey, id_company, id_employee, date_period);


--
-- TOC entry 2127 (class 1259 OID 17033)
-- Dependencies: 252 252 252 252 2256
-- Name: fki_survey_results_detail_fk; Type: INDEX; Schema: hcm; Owner: stilgar; Tablespace: 
--

CREATE INDEX fki_survey_results_detail_fk ON survey_results_detail USING btree (id_survey_result, id_survey, id_company, id_employee);


--
-- TOC entry 2128 (class 1259 OID 17034)
-- Dependencies: 252 252 252 252 2256
-- Name: survey_results_detail_id_survey_id_survey_result_id_company_idx; Type: INDEX; Schema: hcm; Owner: stilgar; Tablespace: 
--

CREATE INDEX survey_results_detail_id_survey_id_survey_result_id_company_idx ON survey_results_detail USING btree (id_survey, id_survey_result, id_company, id_employee);


--
-- TOC entry 2132 (class 2606 OID 17028)
-- Dependencies: 252 2117 178 252 252 252 178 178 178 2256
-- Name: survey_results_detail_fk; Type: FK CONSTRAINT; Schema: hcm; Owner: stilgar
--

ALTER TABLE ONLY survey_results_detail
    ADD CONSTRAINT survey_results_detail_fk FOREIGN KEY (id_survey_result, id_survey, id_company, id_employee) REFERENCES survey_results_header(id_survey_result, id_survey, id_company, id_employee);


--
-- TOC entry 2131 (class 2606 OID 16877)
-- Dependencies: 181 2125 182 2256
-- Name: surveys_detail_id_survey_fkey; Type: FK CONSTRAINT; Schema: hcm; Owner: stilgar
--

ALTER TABLE ONLY surveys_detail
    ADD CONSTRAINT surveys_detail_id_survey_fkey FOREIGN KEY (id_survey) REFERENCES surveys_header(id_survey);


-- Completed on 2014-02-18 16:56:37 AST

--
-- PostgreSQL database dump complete
--

