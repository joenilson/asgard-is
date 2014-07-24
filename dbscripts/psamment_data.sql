--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.11
-- Dumped by pg_dump version 9.1.11
-- Started on 2014-02-08 09:55:47 AST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = ims, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 251 (class 1259 OID 16973)
-- Dependencies: 11
-- Name: hira_danger; Type: TABLE; Schema: ims; Owner: stilgar; Tablespace: 
--

CREATE TABLE hira_danger (
    lang character varying(10) NOT NULL,
    id_danger integer NOT NULL,
    desc_danger text,
    date_creation timestamp without time zone,
    user_creation character varying(30),
    date_modification timestamp without time zone,
    user_modification character varying(30),
    status integer
);


ALTER TABLE ims.hira_danger OWNER TO stilgar;

--
-- TOC entry 249 (class 1259 OID 16957)
-- Dependencies: 11
-- Name: hira_documents; Type: TABLE; Schema: ims; Owner: stilgar; Tablespace: 
--

CREATE TABLE hira_documents (
    id_danger_risk integer NOT NULL,
    id_danger integer NOT NULL,
    id_risk integer NOT NULL,
    id_process_main integer,
    eval_iper_h integer,
    eval_iper_m integer,
    eval_iper_l integer,
    control_measures text,
    eval_risk_h integer,
    eval_risk_m integer,
    eval_risk_l integer,
    date_creation timestamp without time zone,
    user_creation character varying(30),
    date_modification timestamp without time zone,
    user_modification character varying(30),
    status integer,
    company character varying(4),
    country character varying(4),
    location character varying(4),
    id_machine integer
);


ALTER TABLE ims.hira_documents OWNER TO stilgar;

--
-- TOC entry 247 (class 1259 OID 16934)
-- Dependencies: 11
-- Name: hira_incidents; Type: TABLE; Schema: ims; Owner: stilgar; Tablespace: 
--

CREATE TABLE hira_incidents (
    id_incident integer NOT NULL,
    id_type character varying(3),
    value_incident integer,
    date_incident timestamp without time zone,
    company character varying(4),
    country character varying(4),
    location character varying(4),
    id_process integer,
    desc_user_crea character varying(50),
    date_creation timestamp without time zone,
    desc_user_mod character varying(50),
    date_modification timestamp without time zone,
    status integer
);


ALTER TABLE ims.hira_incidents OWNER TO stilgar;

--
-- TOC entry 248 (class 1259 OID 16939)
-- Dependencies: 11
-- Name: hira_incidents_details; Type: TABLE; Schema: ims; Owner: stilgar; Tablespace: 
--

CREATE TABLE hira_incidents_details (
    id_incident integer NOT NULL,
    nonconformity_type integer NOT NULL,
    status integer,
    id_type character varying(3),
    company character varying(4),
    country character varying(4),
    location character varying(4),
    description text,
    owner_fullname character varying(180),
    owner_email character varying(180),
    user_create character varying(30),
    date_create timestamp without time zone,
    general_status integer
);


ALTER TABLE ims.hira_incidents_details OWNER TO stilgar;

--
-- TOC entry 192 (class 1259 OID 16490)
-- Dependencies: 11
-- Name: hira_incidents_type; Type: TABLE; Schema: ims; Owner: stilgar; Tablespace: 
--

CREATE TABLE hira_incidents_type (
    lang character varying(10) NOT NULL,
    id_incident integer NOT NULL,
    val_incident text NOT NULL,
    status boolean,
    date_creation timestamp without time zone,
    date_modification timestamp without time zone,
    old_idincident character varying(6)
);


ALTER TABLE ims.hira_incidents_type OWNER TO stilgar;

--
-- TOC entry 250 (class 1259 OID 16965)
-- Dependencies: 11
-- Name: hira_risk; Type: TABLE; Schema: ims; Owner: stilgar; Tablespace: 
--

CREATE TABLE hira_risk (
    lang character varying(10) NOT NULL,
    id_risk integer NOT NULL,
    desc_risk text,
    date_creation timestamp without time zone,
    user_creation character varying(30),
    date_modification timestamp without time zone,
    user_modification character varying(30),
    status integer
);


ALTER TABLE ims.hira_risk OWNER TO stilgar;

--
-- TOC entry 204 (class 1259 OID 16541)
-- Dependencies: 11
-- Name: process_relations; Type: TABLE; Schema: ims; Owner: stilgar; Tablespace: 
--
DROP TABLE process_relations;
CREATE TABLE process_relations (
    type character(1) NOT NULL,
    id integer NOT NULL,
    parent_id integer NOT NULL,
    date_creation timestamp without time zone NOT NULL,
    user_id integer,
    country character varying(4) NOT NULL,
    company character varying(4) NOT NULL,
    location character varying(4) NOT NULL
);


ALTER TABLE ims.process_relations OWNER TO stilgar;

--
-- TOC entry 2227 (class 0 OID 16973)
-- Dependencies: 251 2228
-- Data for Name: hira_danger; Type: TABLE DATA; Schema: ims; Owner: stilgar
--

COPY hira_danger (lang, id_danger, desc_danger, date_creation, user_creation, date_modification, user_modification, status) FROM stdin;
es	12	Ruido	2011-11-16 22:37:09	SGIHUAURA	\N	\N	1
es	13	Iluminación Inadecuada	2011-11-16 23:04:52	SGIHUAURA	\N	\N	1
es	14	Presiones	2011-11-16 23:05:08	SGIHUAURA	\N	\N	1
es	15	Temperatura Térmica	2011-11-16 23:05:23	SGIHUAURA	2011-11-16 23:07:59	SGIHUAURA	0
es	16	Altas Temperaturas	2011-11-16 23:08:08	SGIHUAURA	\N	\N	1
es	17	Bajas Temperaturas	2011-11-16 23:08:19	SGIHUAURA	\N	\N	1
es	18	Húmedad	2011-11-16 23:08:38	SGIHUAURA	\N	\N	1
es	19	Vibraciones	2011-11-16 23:09:00	SGIHUAURA	\N	\N	1
es	20	Radiaciones No Ionizantes	2011-11-16 23:09:18	SGIHUAURA	\N	\N	1
es	21	Radiaciones Ionizantes	2011-11-16 23:09:27	SGIHUAURA	\N	\N	1
es	22	Contacto con Animales	2011-11-16 23:10:13	SGIHUAURA	\N	\N	1
es	23	Virus	2011-11-16 23:10:18	SGIHUAURA	\N	\N	1
es	24	Hongos	2011-11-16 23:10:21	SGIHUAURA	\N	\N	1
es	25	Hongos	2011-11-16 23:10:21	SGIHUAURA	2011-12-30 20:14:16	SGIHUAURA	0
es	26	Bacterias	2011-11-16 23:10:34	SGIHUAURA	\N	\N	1
es	27	Ergonómicos	2011-11-16 23:11:05	SGIHUAURA	2011-11-17 16:30:23	SGIHUAURA	0
es	28	Posturas Inadecuadas	2011-11-17 16:30:35	SGIHUAURA	\N	\N	1
es	29	Sobre Esfuerzo Físico	2011-11-17 16:30:51	SGIHUAURA	\N	\N	1
es	30	Diseño del Puesto de Trabajo	2011-11-17 16:31:05	SGIHUAURA	\N	\N	1
es	31	Alta Tensión	2011-11-17 16:31:19	SGIHUAURA	\N	\N	1
es	32	Media Tensión	2011-11-17 16:31:26	SGIHUAURA	\N	\N	1
es	33	Baja Tensión	2011-11-17 16:31:41	SGIHUAURA	\N	\N	1
es	34	Electricidad Estática	2011-11-17 16:31:52	SGIHUAURA	\N	\N	1
es	35	Redes e Instalaciones	2011-11-17 16:32:01	SGIHUAURA	\N	\N	1
es	36	Vapores	2011-11-17 16:32:07	SGIHUAURA	\N	\N	1
es	37	Olores	2011-11-17 16:32:11	SGIHUAURA	\N	\N	1
es	38	Gases	2011-11-17 16:32:17	SGIHUAURA	\N	\N	1
es	39	Humos Metálicos	2011-11-17 16:32:25	SGIHUAURA	\N	\N	1
es	40	Derrame de Líquidos	2011-11-17 16:32:40	SGIHUAURA	\N	\N	1
es	41	Trabajo Monótomo	2011-11-17 16:32:59	SGIHUAURA	\N	\N	1
es	42	Jornada Laboral Extensa	2011-11-17 16:33:07	SGIHUAURA	\N	\N	1
es	43	Sobre Carga Laboral	2011-11-17 16:33:18	SGIHUAURA	\N	\N	1
es	44	Mecánicos en Movimiento	2011-11-17 16:33:35	SGIHUAURA	\N	\N	1
es	45	Trabajo en Altura	2011-11-17 16:33:48	SGIHUAURA	\N	\N	1
es	46	Manejo de Herramientas manuales	2011-11-17 16:34:01	SGIHUAURA	\N	\N	1
es	47	Equipos o elementos a presión	2011-11-17 16:34:13	SGIHUAURA	\N	\N	1
es	48	Manipulación de Materiales	2011-11-17 16:34:24	SGIHUAURA	\N	\N	1
es	49	Tranpsorte de Vehículos	2011-11-17 16:34:35	SGIHUAURA	\N	\N	1
es	50	Falta de Señalización	2011-11-17 16:34:50	SGIHUAURA	\N	\N	1
es	51	Falta de Orden y Limpieza	2011-11-17 16:35:01	SGIHUAURA	\N	\N	1
es	52	Falta de Orden y Limpieza	2011-11-17 16:35:02	SGIHUAURA	2011-11-18 22:41:17	SGIHUAURA	0
es	53	Falta de Orden y Limpieza	2011-11-17 16:35:06	SGIHUAURA	2011-11-18 22:41:22	SGIHUAURA	0
es	54	Espacio de trabajo reducido	2011-11-17 16:35:16	SGIHUAURA	\N	\N	1
es	55	Estructura e instalaciones inadecuadas	2011-11-17 16:35:29	SGIHUAURA	\N	\N	1
es	56	Sistema de almacenamiento inadecuado	2011-11-17 16:35:44	SGIHUAURA	\N	\N	1
es	57	Estructuras de baja/alta	2011-11-17 16:36:01	SGIHUAURA	\N	\N	1
es	58	Objetos punzocortantes	2011-11-17 16:40:47	SGIHUAURA	\N	\N	1
es	59	Cargas Suspendidas	2011-11-17 17:00:42	SGIHUAURA	\N	\N	1
es	60	Temperaturas extremas	2011-12-30 21:01:47	SGIHUAURA	\N	\N	1
es	61	Transporte de materiales	2011-12-30 22:19:12	SGIHUAURA	\N	\N	1
es	62	Piso Resbaloso	2012-04-09 17:01:33	ADMDOMINICANA	\N	\N	1
es	63	Álcalis	2012-04-09 17:09:29	ADMDOMINICANA	\N	\N	1
es	64	Ácido	2012-04-09 17:19:49	ADMDOMINICANA	\N	\N	1
es	65	Desmontaje de piezas	2012-04-09 17:51:58	ADMDOMINICANA	\N	\N	1
es	66	Espacios estrechos	2012-04-10 00:06:43	ADMDOMINICANA	\N	\N	1
es	67	Elementos en movimiento	2012-04-10 00:45:45	ADMDOMINICANA	\N	\N	1
es	68	Polvos	2012-04-13 17:38:48	ADMDOMINICANA	\N	\N	1
es	69	Oxidante	2012-04-13 17:51:03	ADMDOMINICANA	\N	\N	1
es	70	Manipulación de reactivos químicos	2012-04-14 12:24:40	ADMDOMINICANA	\N	\N	1
es	71	Iluminación	2012-04-14 12:43:16	ADMDOMINICANA	\N	\N	1
es	72	Fuego	2012-04-17 23:05:40	ADMDOMINICANA	\N	\N	1
es	73	Superficie caliente	2012-04-17 23:28:53	ADMDOMINICANA	\N	\N	1
es	74	Vapor caliente	2012-04-17 23:29:09	ADMDOMINICANA	\N	\N	1
es	75	Explosión de material de vidrio	2012-04-17 23:29:28	ADMDOMINICANA	\N	\N	1
es	76	Movimiento repetitivo	2012-04-17 23:29:42	ADMDOMINICANA	\N	\N	1
es	77	Mangueras en el suelo	2012-04-17 23:29:56	ADMDOMINICANA	\N	\N	1
es	78	Líquido caliente	2012-04-17 23:34:45	ADMDOMINICANA	\N	\N	1
es	79	Superficie contaminada	2012-04-17 23:35:08	ADMDOMINICANA	\N	\N	1
es	80	Tránsito de montacargas	2012-04-20 15:43:07	ADMDOMINICANA	\N	\N	1
es	81	Exceso de velocidad	2012-04-21 02:41:44	ADMDOMINICANA	\N	\N	1
es	82	Alcohol	2012-04-21 02:57:10	ADMDOMINICANA	\N	\N	1
es	83	Curvas angostas	2012-04-21 12:09:59	ADMDOMINICANA	\N	\N	1
es	84	Transporte de gas natural	2012-04-21 12:15:00	ADMDOMINICANA	\N	\N	1
es	85	Uso de tanque con gas comprimido	2012-04-21 17:41:01	ADMDOMINICANA	\N	\N	1
es	86	Tránsito de vehículos	2012-05-01 12:52:02	ADMDOMINICANA	\N	\N	1
es	87	Movimientos repetitivos	2012-05-11 16:06:05	ADMDOMINICANA	\N	\N	1
es	88	Equipo Energizado	2012-05-11 17:51:27	ADMDOMINICANA	2012-05-11 22:42:21	ADMDOMINICANA	0
es	89	Manipulacion de Material Filoso (Objeto Punzocortante)	2012-05-11 21:17:22	ADMDOMINICANA	\N	\N	1
es	90	Manipulacion de Material	2012-05-11 21:50:55	ADMDOMINICANA	2012-05-11 21:53:46	ADMDOMINICANA	0
es	91	Manipulación de Material	2012-05-11 21:52:13	ADMDOMINICANA	\N	\N	1
es	92	Manipulación de Material	2012-05-11 21:52:56	ADMDOMINICANA	2012-05-11 21:54:47	ADMDOMINICANA	0
es	93	Manipulación de Material	2012-05-11 22:31:25	ADMDOMINICANA	2012-05-11 22:32:51	ADMDOMINICANA	0
es	94	Equipo Energizado	2012-05-11 22:40:56	ADMDOMINICANA	2012-05-11 22:42:40	ADMDOMINICANA	0
es	95	Equipo Energizado	2012-05-11 22:41:42	ADMDOMINICANA	2012-05-12 13:36:23	ADMDOMINICANA	0
es	96	Equipo Energizado	2012-05-11 22:43:04	ADMDOMINICANA	\N	\N	1
es	97	Tendido de Tuberias A Nivel del Piso	2012-05-14 14:05:12	ADMDOMINICANA	\N	\N	1
es	98	Altas Temperatura	2012-05-14 14:15:39	ADMDOMINICANA	2012-05-14 14:17:06	ADMDOMINICANA	0
es	99	Altas Temperatura	2012-05-14 14:17:21	ADMDOMINICANA	\N	\N	1
es	100	Objetos en el Suelo	2012-05-14 15:32:45	ADMDOMINICANA	\N	\N	1
es	101	Agentes Biologicos	2012-05-14 16:06:15	ADMDOMINICANA	\N	\N	1
es	102	Liquidos	2012-05-14 21:33:08	ADMDOMINICANA	\N	\N	1
es	103	Calor	2012-05-14 22:00:30	ADMDOMINICANA	\N	\N	1
es	104	Manipilacion de Herramientas	2012-05-14 23:01:40	ADMDOMINICANA	2012-05-14 23:03:12	ADMDOMINICANA	0
es	105	Manipulacion de Herramientas	2012-05-14 23:01:52	ADMDOMINICANA	\N	\N	1
es	106	Luz Intensa	2012-05-15 13:31:36	ADMDOMINICANA	\N	\N	1
es	107	Uso de Equipos de Mantenimiento	2012-05-15 13:38:28	ADMDOMINICANA	\N	\N	1
es	108	Maquina en Funcionamiento (elementos en movimiento)	2012-05-15 13:59:54	ADMDOMINICANA	\N	\N	1
es	109	Manipulacion de Piezas	2012-05-15 14:06:22	ADMDOMINICANA	\N	\N	1
es	110	Tendido de Tuberias A Nivel del Piso	2012-05-15 14:11:02	ADMDOMINICANA	\N	\N	1
es	111	Operacion En Altura	2012-05-15 14:16:22	ADMDOMINICANA	\N	\N	1
es	112	Transito de Vehiculos	2012-05-15 14:44:57	ADMDOMINICANA	\N	\N	1
es	113	Puertas Y Ventanas De Cristal	2012-05-15 15:04:44	ADMDOMINICANA	\N	\N	1
es	114	Curvas Angostas	2012-05-15 15:20:12	ADMDOMINICANA	\N	\N	1
es	115	Uso de Equipos de Mantenimiento	2012-05-15 17:23:56	ADMDOMINICANA	\N	\N	1
es	116	Carga en Movimiento	2013-04-05 14:18:48	SGIHUAURA	\N	\N	1
es	117	Exposición a Ruido	2013-04-05 14:33:03	SGIHUAURA	\N	\N	1
es	118	Postura Inadecuada	2013-04-05 14:40:19	SGIHUAURA	\N	\N	1
es	119	Transporte de Personal	2013-04-05 14:51:33	SGIHUAURA	\N	\N	1
es	120	Transporte de Personal	2013-04-05 14:52:05	SGIHUAURA	\N	\N	1
es	121	Vehículo Motorizado	2013-04-05 15:01:36	SGIHUAURA	\N	\N	1
es	122	Caída al mismo nivel	2013-04-05 15:12:07	SGIHUAURA	\N	\N	1
\.


--
-- TOC entry 2225 (class 0 OID 16957)
-- Dependencies: 249 2228
-- Data for Name: hira_documents; Type: TABLE DATA; Schema: ims; Owner: stilgar
--

COPY hira_documents (id_danger_risk, id_danger, id_risk, id_process_main, eval_iper_h, eval_iper_m, eval_iper_l, control_measures, eval_risk_h, eval_risk_m, eval_risk_l, date_creation, user_creation, date_modification, user_modification, status, company, country, location, id_machine) FROM stdin;
276	71	69	7	0	0	18	<null>	0	0	21	2012-05-15 14:54:54	admdominicana	\N	\N	1	\N	\N	\N	\N
311	68	89	550	0	0	18	<null>	0	0	25	2012-05-15 20:42:51	admdominicana	\N	\N	1	\N	\N	\N	\N
220	71	88	519	0	0	18	<null>	0	0	25	2012-05-14 16:37:55	admdominicana	\N	\N	1	\N	\N	\N	\N
410	71	69	7	0	0	18	MONITOREO. ENCENDIDO DE LAMPARAS DURANTE LA REALIZACION DE ACTIVIDADES.	0	0	21	2012-05-18 00:08:20	sgidominicana	\N	\N	1	\N	\N	\N	\N
335	71	69	8	0	0	18	\N	0	0	21	2012-05-16 13:38:25	admdominicana	\N	\N	1	\N	\N	\N	\N
407	71	69	8	0	0	18	MONITOREO. ENCENDIDO DE LAMPARAS DURANTE LA REALIZACION DE ACTIVIDADES.	0	0	21	2012-05-18 00:02:46	sgidominicana	\N	\N	1	\N	\N	\N	\N
351	71	69	22	0	0	18	MONITOREO. INSPECCIÓN.	0	0	23	2012-05-16 16:20:34	sgidominicana	\N	\N	1	\N	\N	\N	\N
352	71	69	22	0	0	18	MONITOREO. INSPECCIÓN.	0	0	23	2012-05-16 16:20:35	sgidominicana	\N	\N	1	\N	\N	\N	\N
363	71	69	23	0	0	18	MONITOREO. INSPECCIÓN.	0	0	23	2012-05-16 16:43:51	sgidominicana	\N	\N	1	\N	\N	\N	\N
223	71	88	67	0	0	18	<null>	0	0	25	2012-05-14 17:06:15	admdominicana	\N	\N	1	\N	\N	\N	\N
1	12	12	\N	0	10	0	Uso de EPP´s Capacitación al personal  expuesto	0	0	22	2011-11-16 23:16:34	SGIHuaura	\N	\N	1	\N	\N	\N	\N
277	28	65	7	0	0	18	<null>	0	0	21	2012-05-15 15:03:31	admdominicana	\N	\N	1	\N	\N	\N	\N
388	28	65	7	0	0	18	CAPACITACIONES EN ERGONOMÍA.	0	0	21	2012-05-17 23:01:10	sgidominicana	\N	\N	1	\N	\N	\N	\N
332	28	65	8	0	0	18	<null>	0	0	21	2012-05-15 22:48:48	admdominicana	\N	\N	1	\N	\N	\N	\N
379	28	65	8	0	0	18	CAPACITACIONES EN ERGONOMÍA	0	0	21	2012-05-17 22:32:18	sgidominicana	\N	\N	1	\N	\N	\N	\N
334	80	36	8	0	0	18	\N	0	0	23	2012-05-16 13:33:06	admdominicana	\N	\N	1	\N	\N	\N	\N
29	12	12	13	0	13	0	Uso y mantenimiento correcto de los EPP´s. Capacitación y Sensibilización en temas de ruido.	0	0	20	2011-12-30 17:16:40	SGIHuaura	\N	SGIArequipa	1	\N	\N	\N	\N
161	12	12	13	0	13	0	USO DE PROTECTOR AUDITIVO. CAPACITACION Y SENSIBILIZACION EN TEMAS DE RUIDO.	0	0	25	2012-05-11 20:53:24	admdominicana	\N	\N	1	\N	\N	\N	\N
30	14	38	13	0	0	21	Mantenimiento preventivo a las maquinarías y equipos. Programa de calibración de equipos de presión. Capacitació y sensibilización.	0	0	25	2011-12-30 17:24:48	SGIHuaura	\N	\N	1	\N	\N	\N	\N
31	18	49	13	0	0	22	Correcta limpieza de la zona. Uso adecuado de los EPP´s. Capacitación y Sensibilización del personal.	0	0	25	2011-12-30 17:48:22	SGIHuaura	\N	\N	1	\N	\N	\N	\N
32	18	49	13	0	0	22	Correcta limpieza de la zona. Uso adecuado de los EPP´s. Capacitación y Sensibilización del personal.	0	0	25	2011-12-30 17:48:26	SGIHuaura	\N	\N	1	\N	\N	\N	\N
162	38	76	13	0	0	18	MONITOREO	0	0	23	2012-05-11 21:00:59	admdominicana	\N	\N	1	\N	\N	\N	\N
163	38	76	13	0	0	18	MONITOREO	0	0	23	2012-05-11 21:01:27	admdominicana	\N	\N	1	\N	\N	\N	\N
33	44	31	13	0	0	17	Señalizacion de los equipos. Mantenimiento preventivo de las maquinarías. Capacitación y Sensibilización del personal operador.	0	0	23	2011-12-30 20:19:09	SGIHuaura	\N	\N	1	\N	\N	\N	\N
44	44	55	13	0	0	17	Señalización de las maquinárias. Mantenimiento preventivo y correctivo de las maquinárias. Uso de candados loockout. Uso adecuado de los EPP´s. Capacitación y sensibilización del personal involucrado.	0	0	20	2011-12-30 22:11:10	SGIHuaura	\N	\N	1	\N	\N	\N	\N
34	46	38	13	0	0	18	Mantenimiento preventivo de herramientas manuales. Programa de control de herramientas. Capacitación y Sensibilización del personal.	0	0	25	2011-12-30 20:24:18	SGIHuaura	\N	\N	1	\N	\N	\N	\N
423	46	38	13	0	14	0	USO DE BOTAS.	0	0	25	2012-05-18 14:49:55	admdominicana	\N	\N	1	\N	\N	\N	\N
62	46	53	13	0	14	0	Uso de guantes. Capacitación al personal involucrado.	0	0	22	2012-04-09 20:20:06	admdominicana	\N	admdominicana	1	\N	\N	\N	\N
144	47	38	13	0	0	24	Mantenimiento preventivo de las maquinarias. Inspección de equipos.	0	0	25	2012-05-05 22:47:39	admdominicana	\N	\N	1	\N	\N	\N	\N
167	47	84	13	0	0	24	MANTENIMIENTO PREVENTIVO DE LAS MAQUINARIAS. INSPECCION DE EQUIPOS.	0	0	25	2012-05-11 21:46:22	admdominicana	\N	\N	1	\N	\N	\N	\N
35	48	38	13	0	0	18	Correcto uso de los EPP´s. Conocimiento absoluto de los materiales a manipular. Capacitación y sensibilización al personal	0	0	25	2011-12-30 20:26:09	SGIHuaura	\N	\N	1	\N	\N	\N	\N
36	58	38	13	0	0	18	Correcta disposición de los objetos punzocortantes. Señalización de la zona donde hay presencia de los objetos punzocortantes. Capacitación y sensibilización.	0	0	23	2011-12-30 20:28:09	SGIHuaura	\N	\N	1	\N	\N	\N	\N
60	62	59	13	0	14	0	Uso de bota antideslizante	0	0	23	2012-04-09 17:08:17	admdominicana	\N	\N	1	\N	\N	\N	\N
61	63	60	13	0	0	18	&nbsp;Uso de guantes	0	0	25	2012-04-09 17:17:27	admdominicana	\N	\N	1	\N	\N	\N	\N
164	63	60	13	0	0	18	USO DE GUANTES.	0	0	25	2012-05-11 21:08:48	admdominicana	\N	\N	1	\N	\N	\N	\N
165	64	61	13	0	0	18	USO DE GUANTES.	0	0	25	2012-05-11 21:13:59	admdominicana	\N	\N	1	\N	\N	\N	\N
63	65	53	13	0	0	18	Uso de botas. Capacitación al personal involucrado.	0	0	24	2012-04-09 20:31:53	admdominicana	\N	admdominicana	1	\N	\N	\N	\N
169	88	44	13	0	0	18	ATERRIZAJE DE EQUIPOS. INSPECción DE EQUIPOS.	0	0	25	2012-05-11 22:10:54	admdominicana	\N	\N	1	\N	\N	\N	\N
166	89	75	13	0	0	18	USO DE GUANTES ANTICORTE.	0	0	25	2012-05-11 21:36:17	admdominicana	\N	\N	1	\N	\N	\N	\N
168	91	53	13	0	0	18	USO DE BOTAS.	0	0	25	2012-05-11 22:00:37	admdominicana	\N	\N	1	\N	\N	\N	\N
307	12	88	550	0	13	0	<null>	0	0	25	2012-05-15 20:16:29	admdominicana	\N	\N	1	\N	\N	\N	\N
367	12	88	550	0	13	0	USO DE PROTECTOR AUDITIVO.	0	0	25	2012-05-17 21:43:40	sgidominicana	\N	\N	1	\N	\N	\N	\N
308	16	88	550	0	0	18	<null>	0	0	24	2012-05-15 20:23:16	admdominicana	\N	\N	1	\N	\N	\N	\N
2	18	49	\N	0	0	22	Reingeniería del ambiente  Metodología de trabajo apropiada	0	0	24	2011-11-18 21:45:26	SGIHuaura	\N	\N	1	\N	\N	\N	\N
3	19	15	\N	0	0	18	Reingeniería del ambiente de trabajo. Metodología del trabajo apropiado.	0	0	25	2011-11-18 22:02:12	SGIHuaura	\N	\N	1	\N	\N	\N	\N
4	19	38	\N	0	0	18	Reingeniería del ambiente  Metodología de trabajo apropiada	0	0	25	2011-11-18 21:37:56	SGIHuaura	\N	\N	1	\N	\N	\N	\N
221	28	65	519	0	0	21	<null>	0	0	23	2012-05-14 16:55:12	admdominicana	\N	\N	1	\N	\N	\N	\N
300	28	65	550	0	0	18	<null>	0	0	21	2012-05-15 17:21:32	admdominicana	\N	\N	1	\N	\N	\N	\N
301	28	65	550	0	0	18	<null>	0	0	21	2012-05-15 17:21:38	admdominicana	\N	\N	1	\N	\N	\N	\N
5	29	21	\N	0	14	0	Re ingenieria de zonas de trabajo Uso correcto de EPP´s Charlas de sensibilización para las correctas posiciones.	0	0	18	2011-11-17 22:03:44	SGIHuaura	\N	\N	1	\N	\N	\N	\N
299	29	65	550	0	0	18	<null>	0	0	21	2012-05-15 17:16:36	admdominicana	\N	\N	1	\N	\N	\N	\N
6	33	28	\N	0	0	22	Correcta canalización de ductos de electricidad. Capacitación para el adecuado uso de energía.	0	0	25	2011-11-18 22:23:56	SGIHuaura	\N	\N	1	\N	\N	\N	\N
7	38	27	\N	0	0	25	Correcto uso de EPP´s. Conocimiento adecuado del trabajo a realizar	0	0	25	2011-11-18 22:27:52	SGIHuaura	\N	\N	1	\N	\N	\N	\N
310	39	82	550	0	0	18	<null>	0	0	25	2012-05-15 20:36:49	admdominicana	\N	\N	1	\N	\N	\N	\N
8	40	46	\N	0	0	19	Uso correcto de Epp´s Capacitación en uso de sustancias Químicas	0	0	22	2011-11-18 17:23:49	SGIHuaura	\N	\N	1	\N	\N	\N	\N
9	44	30	\N	0	0	18	Conocimiento adecuado del trabajo a realizar	0	0	21	2011-11-18 22:31:13	SGIHuaura	\N	\N	1	\N	\N	\N	\N
309	45	52	550	0	0	18	<null>	0	0	23	2012-05-15 20:30:26	admdominicana	\N	\N	1	\N	\N	\N	\N
10	48	45	\N	0	0	19	Uso correcto de EPP´s.	0	0	24	2011-11-18 22:39:32	SGIHuaura	\N	\N	1	\N	\N	\N	\N
11	57	42	\N	0	0	18	Reingeniería de la zona de trabajo. Acondicionamiento en el área de trabajo	0	0	22	2011-11-18 22:43:34	SGIHuaura	\N	\N	1	\N	\N	\N	\N
313	59	53	550	0	0	18	<null>	0	0	23	2012-05-15 21:10:08	admdominicana	\N	\N	1	\N	\N	\N	\N
312	66	41	550	0	0	18	<null>	0	0	21	2012-05-15 20:56:55	admdominicana	\N	\N	1	\N	\N	\N	\N
303	96	86	550	0	0	18	<null>	0	0	25	2012-05-15 17:39:03	admdominicana	\N	\N	1	\N	\N	\N	\N
219	100	41	519	0	0	18	<null>	0	0	23	2012-05-14 16:32:07	admdominicana	\N	\N	1	\N	\N	\N	\N
314	100	41	550	0	0	18	<null>	0	0	21	2012-05-15 21:16:28	admdominicana	\N	\N	1	\N	\N	\N	\N
218	101	88	519	0	0	18	<null>	0	0	25	2012-05-14 16:25:57	admdominicana	\N	\N	1	\N	\N	\N	\N
306	105	53	550	0	0	18	<null>	0	0	24	2012-05-15 17:53:50	admdominicana	\N	\N	1	\N	\N	\N	\N
304	105	92	550	0	0	18	<null>	0	0	25	2012-05-15 17:44:34	admdominicana	\N	\N	1	\N	\N	\N	\N
305	105	93	550	0	0	18	<null>	0	0	24	2012-05-15 17:48:46	admdominicana	\N	\N	1	\N	\N	\N	\N
302	107	74	550	0	0	18	<null>	0	0	25	2012-05-15 17:30:34	admdominicana	\N	\N	1	\N	\N	\N	\N
278	113	74	7	0	0	18	<null>	0	0	23	2012-05-15 15:07:57	admdominicana	\N	\N	1	\N	\N	\N	\N
336	100	59	8	0	0	18	\N	0	0	23	2012-05-16 13:42:08	admdominicana	\N	\N	1	\N	\N	\N	\N
333	113	74	8	0	0	18	\N	0	0	23	2012-05-16 13:28:25	admdominicana	\N	\N	1	\N	\N	\N	\N
338	100	59	22	0	0	21	\N	0	0	23	2012-05-16 13:48:53	admdominicana	\N	\N	1	\N	\N	\N	\N
344	113	74	22	0	0	18	\N	0	0	23	2012-05-16 14:09:46	admdominicana	\N	\N	1	\N	\N	\N	\N
364	100	59	23	0	0	21	INSPECCIONES.	0	0	23	2012-05-16 16:46:30	sgidominicana	\N	\N	1	\N	\N	\N	\N
241	101	91	36	0	0	18	<null>	0	0	25	2012-05-14 21:09:45	admdominicana	\N	\N	1	\N	\N	\N	\N
215	100	41	42	0	0	18	<null>	0	0	23	2012-05-14 15:37:54	admdominicana	\N	\N	1	\N	\N	\N	\N
432	116	97	43	8	0	0	Cursos, Capacitaciones, Charlas Uso de EPPs PET transito de vehículos PET señalización y código de colores	0	0	16	2013-04-05 14:25:11	SGIHuaura	\N	\N	1	\N	\N	\N	\N
37	12	12	16	0	13	0	Rediseño de la zona de trabajo. Correcto uso de EPP´s. Capacitación y Sensibilización del personal involucrado	0	0	17	2011-12-30 20:43:42	SGIHuaura	\N	\N	1	\N	\N	\N	\N
177	12	12	16	0	13	0	USO DE PROTECTOR AUDITIVO.	0	0	25	2012-05-12 13:54:01	admdominicana	\N	\N	1	\N	\N	\N	\N
39	28	65	16	0	13	21	Capacitaciones en Ergonomía durante el levantamiento de cargas.	0	0	23	2011-12-30 21:18:17	SGIHuaura	\N	admdominicana	1	\N	\N	\N	\N
179	28	65	16	0	0	21	CAPACITACIONES DE ERGONOMIA DURANTE EL LEVANTAMIENTO DE CARGAS.	0	0	23	2012-05-12 14:05:06	admdominicana	\N	\N	1	\N	\N	\N	\N
69	29	65	16	0	0	21	Capacitación en ergonomía durante el levantamiento de cargas.	0	0	23	2012-04-09 23:49:43	admdominicana	\N	admdominicana	1	\N	\N	\N	\N
40	37	27	16	0	0	24	Correcto uso de Epp´s. Programa de limpieza preventtiva. Metodologías de limpieza adecuadas. Capacitación y Sensibilización.	0	0	25	2011-12-30 21:28:47	SGIHuaura	\N	\N	1	\N	\N	\N	\N
41	40	28	16	0	0	18	Control de la salida de insumos utilizados en los procesos. Programa de Limpieza preventivo y correctivo. Uso adecuado de EPP´s. Capacitación y Sensibilización.	0	0	23	2011-12-30 21:50:54	SGIHuaura	\N	\N	1	\N	\N	\N	\N
45	44	55	16	0	0	17	Señalización de las maquinárias. Mantenimiento preventivo y correctivo de las maquinárias. Uso de candados loockout. Uso adecuado de los EPP´s. Capacitación y sensibilización del personal involucrado.	0	0	20	2011-12-30 22:12:13	SGIHuaura	\N	\N	1	\N	\N	\N	\N
46	46	38	16	0	0	18	Programa de inspección de herramientas manuales. Uso adecuado de EPP´s. Capacitación y Sensibilización del personal involucrado	0	0	23	2011-12-30 22:17:47	SGIHuaura	\N	\N	1	\N	\N	\N	\N
38	60	48	16	0	0	18	Utilizar los EPP´s correctamente. Capacitación y Sensibilización	0	0	25	2011-12-30 21:12:08	SGIHuaura	\N	\N	1	\N	\N	\N	\N
47	61	36	16	0	0	17	Correctas señalizaciones del transito peatonal. Autorización exclusiva para el personal involucrado. Uso adecuado de EPP´s. Capacitación y Sensiblización del personal involucrado	0	0	20	2011-12-30 22:21:32	SGIHuaura	\N	\N	1	\N	\N	\N	\N
71	62	59	16	0	14	0	Uso de bota antideslizante	0	0	21	2012-04-10 00:27:04	admdominicana	\N	\N	1	\N	\N	\N	\N
70	66	45	16	0	14	0	Uso de casco de seguridad. Señalización del área de trabajo.	0	0	24	2012-04-10 00:18:50	admdominicana	\N	\N	1	\N	\N	\N	\N
178	96	86	16	0	0	21	ATERRIZAJE DE EQUIPOS. INSPECCI	0	0	25	2012-05-12 13:59:33	admdominicana	\N	\N	1	\N	\N	\N	\N
357	28	65	22	0	0	21	CAPACITACIÓN EN ERGONOMÍA	0	0	21	2012-05-16 16:31:31	sgidominicana	\N	\N	1	\N	\N	\N	\N
361	12	88	23	0	13	0	USO DE PROTECTOR AUDITIVO.	0	0	25	2012-05-16 16:38:04	sgidominicana	\N	\N	1	\N	\N	\N	\N
362	16	71	23	0	0	18	INMUNDIZACIÓN (VACUNA DT)- HIDRATACIÓN- PERIODO DE DESCANSO DE 5 MIN DE CADA HORA.	0	0	25	2012-05-16 16:40:44	sgidominicana	\N	\N	1	\N	\N	\N	\N
360	28	65	23	0	0	21	CAPACITACIÓN EN ERGONOMÍA	0	0	21	2012-05-16 16:35:48	sgidominicana	\N	\N	1	\N	\N	\N	\N
22	12	12	26	0	0	18	Correcto Uso de los EPP´s Capacitación y Sensibilización al personal. Monitoreos según los resultados	0	0	24	2011-12-29 17:48:39	SGIHuaura	\N	\N	1	\N	\N	\N	\N
176	12	12	26	0	13	0	USO DE PROTECTOR AUDITIVO.CAPACITACION	0	0	25	2012-05-12 13:48:15	admdominicana	\N	\N	1	\N	\N	\N	\N
23	18	49	26	0	0	18	Realizar el orden y la limpieza correcta. Uso de la indumentaria correcta. Capacitación y Sensibilización sobre los puntos anteriores.	0	0	24	2011-12-29 18:01:57	SGIHuaura	\N	\N	1	\N	\N	\N	\N
24	30	29	26	0	0	22	Rediseño de la ingeniería del área. Capacitación y Sensibilización.	0	0	25	2011-12-29 18:06:54	SGIHuaura	\N	\N	1	\N	\N	\N	\N
25	44	30	26	0	13	0	Señalización de maquinarías en movimientos. Capacitación y sensibilización de las operaciones y uso de las maquinarías.	0	0	24	2011-12-29 21:14:49	SGIHuaura	\N	\N	1	\N	\N	\N	\N
43	44	55	26	0	13	0	Señalización de las maquinárias. Mantenimiento preventivo y correctivo de las maquinárias. Uso de candados loockout. Uso adecuado de los EPP´s. Capacitación y sensibilización del personal involucrado.	0	0	20	2011-12-30 22:07:42	SGIHuaura	\N	\N	1	\N	\N	\N	\N
27	46	33	26	0	14	0	Uso correcto de las herramientas manuales. Operación según procedimientos de las maquinarías en las cuales se usaran las herramientas manuales. Capacitación y Sensibilización a todo el personal que realice actividades con las herramientas manuales.	0	0	24	2011-12-29 21:32:11	SGIHuaura	\N	\N	1	\N	\N	\N	\N
67	46	53	26	0	14	0	Uso de guantes. Capacitación al personal involucrado.	0	0	22	2012-04-09 21:41:21	admdominicana	\N	\N	1	\N	\N	\N	\N
26	47	38	26	0	0	24	Mantenimiento preventivo de las maquinarías. Capacitación y sensibilización de los operadores. Utilizar los elementos de seguridad correctos para el bloqueo de los equipos.	0	0	25	2011-12-29 21:21:06	SGIHuaura	\N	\N	1	\N	\N	\N	\N
142	47	38	26	0	0	24	Mantenimiento preventivo de las maquinarias. Inspección de equipos.	0	0	25	2012-05-05 22:38:26	admdominicana	\N	\N	1	\N	\N	\N	\N
143	47	38	26	0	0	24	Mantenimiento preventivo de las maquinarias. Inspección de equipos.	0	0	25	2012-05-05 22:38:38	admdominicana	\N	\N	1	\N	\N	\N	\N
28	58	38	26	0	0	19	Correcta ubicación de los objetos punzocortantes. Uso de los EPP´s adecuados. Capacitación y Sensibilización del personal que labora expuesto a los objetos punzocortantes.	0	0	24	2011-12-29 22:02:49	SGIHuaura	\N	\N	1	\N	\N	\N	\N
64	62	59	26	0	14	0	Uso de bota antideslizante.	0	0	23	2012-04-09 21:04:32	admdominicana	\N	\N	1	\N	\N	\N	\N
65	63	60	26	0	0	18	Uso de guantes. Capacitación al personal involucrado.	0	0	25	2012-04-09 21:17:46	admdominicana	\N	\N	1	\N	\N	\N	\N
66	64	61	26	0	0	18	Uso de guantes. Capacitación al personal involucrado.	0	0	25	2012-04-09 21:23:27	admdominicana	\N	\N	1	\N	\N	\N	\N
68	65	53	26	0	0	18	Uso de guantes y botas. Capacitación al personal involucrado.	0	0	24	2012-04-09 21:47:40	admdominicana	\N	\N	1	\N	\N	\N	\N
175	96	86	26	0	0	18	USO DE BORTA DIELECTRICA. INSPECCI	0	0	25	2012-05-12 13:41:27	admdominicana	\N	\N	1	\N	\N	\N	\N
48	12	12	27	0	13	0	Uso adecuado de EPP´s. Monitoreos temporales de acuerdo a los resultados. Capacitación y Sensibilización al personal involucrado.	0	0	17	2011-12-30 22:26:12	SGIHuaura	\N	\N	1	\N	\N	\N	\N
180	12	12	27	0	13	0	USO DEL PROTECTOR AUDITIVO. CAPACITACION	0	0	25	2012-05-12 14:13:39	admdominicana	\N	\N	1	\N	\N	\N	\N
49	16	48	27	0	0	24	Programa de inspección de condiciones ambientales. Uso adeacudo de EPP´s Capacitación y Sensibilización del personal involucrado.	0	0	25	2011-12-30 22:30:41	SGIHuaura	\N	\N	1	\N	\N	\N	\N
181	16	48	27	0	0	18	INMUNIZACI	0	0	23	2012-05-12 14:21:43	admdominicana	\N	\N	1	\N	\N	\N	\N
414	16	48	27	0	0	18	INMUNDIZACIÓN (VACUNA DT)- HIDRATACIÓN- PERIODO DE DESCANSO DE 5 MIN DE CADA HORA.	0	0	23	2012-05-18 00:20:31	sgidominicana	\N	\N	1	\N	\N	\N	\N
421	63	60	50	0	14	0	USO DE GUANTES.	0	0	25	2012-05-18 14:23:14	admdominicana	\N	\N	1	\N	\N	\N	\N
50	19	15	27	0	0	21	Reingeniería del proceso. Capacitación y Sensibilización al personal involucrado	0	0	25	2011-12-30 22:33:06	SGIHuaura	\N	\N	1	\N	\N	\N	\N
51	28	21	27	0	0	21	Acondicionar ergonómicamente el lugar de trabajo. Capacitación y Sensibilización del personal involucrado	0	0	25	2012-01-10 15:55:59	SGIHuaura	\N	\N	1	\N	\N	\N	\N
52	36	27	27	0	0	24	Correcto uso de EPP´s al momento de la actividad. Capacitación y sensibilización al personal involucrado	0	0	25	2012-01-10 16:00:58	SGIHuaura	\N	\N	1	\N	\N	\N	\N
53	44	38	27	0	0	18	Señalización de las maquinarías en movimiento. Correcto uso de los EPP´s. Capacitación y sensibilización a todos los involucrados	0	0	23	2012-01-10 16:10:46	SGIHuaura	\N	\N	1	\N	\N	\N	\N
54	48	38	27	0	0	21	Correcto uso de los EPP´s Capacitación y Sensibilización al personal involucrado.	0	0	25	2012-01-10 17:00:22	SGIHuaura	\N	\N	1	\N	\N	\N	\N
427	55	38	27	0	14	0	Señalización del paso peatonal e inspección de la protección de los transportadores neumáticos.	0	0	24	2012-05-21 17:38:09	administrador	\N	\N	1	\N	\N	\N	\N
72	67	55	27	0	0	18	Señalización de la maquinaria. Capacitación informativa de los peligros en el ambiente de trabajo.	0	0	21	2012-04-13 17:24:37	admdominicana	\N	\N	1	\N	\N	\N	\N
183	67	87	27	0	0	18	SEÑALIZACION	0	0	21	2012-05-12 14:42:27	admdominicana	\N	\N	1	\N	\N	\N	\N
182	96	44	27	0	0	18	ATERRIZAJE DE EQUIPOS. INSPECCI	0	0	25	2012-05-12 14:27:47	admdominicana	\N	\N	1	\N	\N	\N	\N
78	70	68	36	0	0	18	Uso de guantes.	0	0	25	2012-04-17 23:04:46	admdominicana	\N	\N	1	\N	\N	\N	\N
240	71	69	36	0	0	18	<null>	0	0	23	2012-05-14 21:01:28	admdominicana	\N	\N	1	\N	\N	\N	\N
413	71	69	36	0	0	18	MONITOREO. ENCENDIDO DE LAMPARAS DURANTE LA REALIZACION DE ACTIVIDADES.	0	0	23	2012-05-18 00:13:15	sgidominicana	\N	\N	1	\N	\N	\N	\N
231	12	12	36	0	13	0	USO DE PROTECTOR AUDITIVO. CAPACITACIÓN Y SENSIBILIZACIÓN DE PERSONAL INVOLUCRADO	0	0	25	2012-05-14 17:53:46	admdominicana	\N	sgidominicana	1	\N	\N	\N	\N
365	12	12	36	0	13	0	USO DE PROTECTOR AUDITIVO. CAPACITACIÓN Y SENSIBILIZACIÓN DE PERSONAL INVOLUCRADO.	0	0	25	2012-05-17 21:37:28	sgidominicana	\N	\N	1	\N	\N	\N	\N
232	16	71	36	0	0	18	<null>	0	0	25	2012-05-14 17:57:51	admdominicana	\N	\N	1	\N	\N	\N	\N
372	16	71	36	0	0	18	INMUNDIZACIÓN (VACUNA DT)- HIDRATACIÓN- PERIODO DE DESCANSO DE 5 MIN DE CADA HORA.	0	0	23	2012-05-17 22:01:30	sgidominicana	\N	\N	1	\N	\N	\N	\N
236	38	88	36	0	0	18	<null>	0	0	25	2012-05-14 20:28:24	admdominicana	\N	\N	1	\N	\N	\N	\N
383	38	88	36	0	0	18	USO DE MASCARILLA.	0	0	25	2012-05-17 22:49:02	sgidominicana	\N	\N	1	\N	\N	\N	\N
80	58	75	36	0	0	18	Uso de guantes	0	0	25	2012-04-17 23:26:57	admdominicana	\N	\N	1	\N	\N	\N	\N
230	62	41	36	0	0	18	<null>	0	0	23	2012-05-14 17:49:25	admdominicana	\N	\N	1	\N	\N	\N	\N
238	62	41	36	0	0	18	<null>	0	0	23	2012-05-14 20:38:39	admdominicana	\N	\N	1	\N	\N	\N	\N
398	62	59	36	0	0	18	USO DE BOTA ANTIDESLIZANTE.	0	0	23	2012-05-17 23:41:54	sgidominicana	\N	\N	1	\N	\N	\N	\N
237	66	53	36	0	0	18	<null>	0	0	21	2012-05-14 20:33:30	admdominicana	\N	\N	1	\N	\N	\N	\N
393	66	53	36	0	0	18	INSPECCIONAR ANTES DE INGRESAR A ESPACIOS ESTRECHOS.	0	0	21	2012-05-17 23:27:24	sgidominicana	\N	\N	1	\N	\N	\N	\N
79	72	70	36	0	0	18	Uso de guantes	0	0	23	2012-04-17 23:11:15	admdominicana	\N	\N	1	\N	\N	\N	\N
81	73	79	36	0	0	18	Uso de guantes	0	0	25	2012-04-17 23:40:58	admdominicana	\N	\N	1	\N	\N	\N	\N
233	77	41	36	0	0	18	<null>	0	0	23	2012-05-14 20:12:23	admdominicana	\N	\N	1	\N	\N	\N	\N
234	78	90	36	0	0	18	<null>	0	0	25	2012-05-14 20:19:15	admdominicana	\N	\N	1	\N	\N	\N	\N
235	78	90	36	0	0	18	<null>	0	0	25	2012-05-14 20:22:09	admdominicana	\N	\N	1	\N	\N	\N	\N
239	79	79	36	0	0	18	<null>	0	0	25	2012-05-14 20:55:05	admdominicana	\N	\N	1	\N	\N	\N	\N
242	96	44	36	0	0	18	<null>	0	0	25	2012-05-14 21:14:47	admdominicana	\N	\N	1	\N	\N	\N	\N
216	68	89	42	0	0	18	<null>	0	0	25	2012-05-14 15:55:32	admdominicana	\N	\N	1	\N	\N	\N	\N
212	12	89	42	0	13	0	<null>	0	0	25	2012-05-14 15:15:56	admdominicana	\N	\N	1	\N	\N	\N	\N
368	12	89	42	0	13	0	USO DE PROTECTOR AUDITIVO. CAPACITACIÓN Y SENSIBILIZACIÓN EN TEMAS DE RUIDO.	0	0	25	2012-05-17 21:48:59	sgidominicana	\N	\N	1	\N	\N	\N	\N
213	16	48	42	0	0	18	<null>	0	0	23	2012-05-14 15:23:23	admdominicana	\N	\N	1	\N	\N	\N	\N
370	16	48	42	0	0	18	INMUNDIZACIÓN (VACUNA DT)- HIDRATACIÓN- PERIODO DE DESCANSO DE 5 MIN DE CADA HORA.	0	0	23	2012-05-17 21:56:01	sgidominicana	\N	\N	1	\N	\N	\N	\N
425	68	66	42	0	0	18	USO DE MASCARILLA.	0	0	25	2012-05-18 16:07:47	admdominicana	\N	\N	1	\N	\N	\N	\N
214	62	41	42	0	0	18	<null>	0	0	23	2012-05-14 15:29:38	admdominicana	\N	\N	1	\N	\N	\N	\N
395	62	59	42	0	0	18	USO DE BOTA ANTIDESLIZANTE.	0	0	23	2012-05-17 23:37:01	sgidominicana	\N	\N	1	\N	\N	\N	\N
396	62	59	42	0	0	18	USO DE BOTA ANTIDESLIZANTE.	0	0	23	2012-05-17 23:37:05	sgidominicana	\N	\N	1	\N	\N	\N	\N
397	62	59	42	0	0	18	USO DE BOTA ANTIDESLIZANTE.	0	0	23	2012-05-17 23:37:06	sgidominicana	\N	\N	1	\N	\N	\N	\N
217	80	36	42	0	0	18	<null>	0	0	23	2012-05-14 16:02:12	admdominicana	\N	\N	1	\N	\N	\N	\N
194	12	12	43	0	13	0	USO DE PROTECTOR AUDITIVO. CAPACITACI	0	0	25	2012-05-12 15:48:52	admdominicana	\N	\N	1	\N	\N	\N	\N
195	16	71	43	0	0	18	INMUNDACI	0	0	25	2012-05-12 15:53:10	admdominicana	\N	\N	1	\N	\N	\N	\N
416	16	71	43	0	0	18	INMUNDIZACIÓN (VACUNA DT)- HIDRATACIÓN- PERIODO DE DESCANSO DE 5 MIN DE CADA HORA.	0	0	25	2012-05-18 00:24:05	sgidominicana	\N	\N	1	\N	\N	\N	\N
197	29	65	43	0	0	18	CAPACITACIONES EN ERGONOMIA DURANTE LA EJECUCI	0	0	23	2012-05-12 16:04:41	admdominicana	\N	\N	1	\N	\N	\N	\N
418	29	65	43	0	0	18	CAPACITACIONES EN ERGONOMÍA DURANTE LA EJECUCION DE CARGAS.	0	0	23	2012-05-18 00:29:29	sgidominicana	\N	\N	1	\N	\N	\N	\N
196	63	83	43	0	14	0	USO DE GUANTES- USO DE LENTES.	0	0	25	2012-05-12 15:56:17	admdominicana	\N	\N	1	\N	\N	\N	\N
190	73	83	43	0	0	18	USO&nbsp; DE GUANTES PARA TEMPERATURA. SE	0	0	25	2012-05-12 15:23:43	admdominicana	\N	\N	1	\N	\N	\N	\N
191	74	83	43	0	0	18	USO DE GUANTES PARA TEMPERATURA. SE	0	0	25	2012-05-12 15:27:10	admdominicana	\N	\N	1	\N	\N	\N	\N
192	75	74	43	0	0	18	USO DE LENTES- USO DE GUANTES ANTICORTE.	0	0	25	2012-05-12 15:39:48	admdominicana	\N	\N	1	\N	\N	\N	\N
193	89	75	43	0	0	18	USO DE GUANTES ANTICORTE.	0	0	25	2012-05-12 15:43:22	admdominicana	\N	\N	1	\N	\N	\N	\N
189	96	44	43	0	0	18	ATERRIZAJE DE EQUIPOS. INSPECCI	0	0	25	2012-05-12 15:17:41	admdominicana	\N	\N	1	\N	\N	\N	\N
433	117	98	43	0	9	0	Tapones auditivos, protector auditivo Capacitaciones, Charlas PET uso de EPP	0	0	17	2013-04-05 14:39:08	SGIHuaura	\N	\N	1	\N	\N	\N	\N
434	118	100	43	0	13	0	Capacitaciones, Charlas Sensibilización	0	0	20	2013-04-05 14:48:06	SGIHuaura	\N	\N	1	\N	\N	\N	\N
435	119	102	43	8	0	0	Concientizar, uso de accesorios adecuados, Uso de EPPs Capacitación, charlas	0	0	16	2013-04-05 14:57:15	SGIHuaura	\N	\N	1	\N	\N	\N	\N
436	121	102	43	8	0	0	PET transito de vehículos Señalización, Uso de EPPs Concientización Capacitaciones, Charlas	0	0	16	2013-04-05 15:08:04	SGIHuaura	\N	\N	1	\N	\N	\N	\N
437	122	103	43	0	0	18	Uso de EPPs PET señalización y código de colores Capacitación, Charlas 5min	0	0	23	2013-04-05 15:20:23	SGIHuaura	\N	\N	1	\N	\N	\N	\N
353	71	69	44	0	0	18	MONITOREO. INSPECCIÓN.	0	0	23	2012-05-16 16:22:34	sgidominicana	\N	\N	1	\N	\N	\N	\N
358	28	65	44	0	0	21	CAPACITACIÓN EN ERGONOMÍA	0	0	21	2012-05-16 16:32:57	sgidominicana	\N	\N	1	\N	\N	\N	\N
339	100	59	44	0	0	21	\N	0	0	23	2012-05-16 13:51:53	admdominicana	\N	\N	1	\N	\N	\N	\N
345	113	74	44	0	0	18	\N	0	0	23	2012-05-16 14:20:14	admdominicana	\N	\N	1	\N	\N	\N	\N
108	12	12	46	0	13	0	Uso de protector auditivo	0	0	25	2012-04-21 12:29:11	admdominicana	\N	\N	1	\N	\N	\N	\N
403	68	66	46	0	0	18	USO DE MASCARILLA.	0	0	25	2012-05-17 23:52:41	sgidominicana	\N	\N	1	\N	\N	\N	\N
260	16	88	46	0	0	18	<null>	0	0	24	2012-05-15 13:29:46	admdominicana	\N	\N	1	\N	\N	\N	\N
373	16	88	46	0	0	18	INMUNDIZACIÓN (VACUNA DT)- HIDRATACIÓN- PERIODO DE DESCANSO DE 5 MIN DE CADA HORA.	0	0	24	2012-05-17 22:05:00	sgidominicana	\N	\N	1	\N	\N	\N	\N
118	19	15	46	0	0	18	Tiempo de descanso después de cada actividad.	0	0	21	2012-04-30 17:28:06	admdominicana	\N	\N	1	\N	\N	\N	\N
263	20	88	46	0	0	18	<null>	0	0	25	2012-05-15 13:49:46	admdominicana	\N	\N	1	\N	\N	\N	\N
376	20	88	46	0	0	18	USO DE LENTES.	0	0	25	2012-05-17 22:25:05	sgidominicana	\N	\N	1	\N	\N	\N	\N
110	28	65	46	0	0	18	Capacitación en ergonomía	0	0	21	2012-04-21 12:38:41	admdominicana	\N	\N	1	\N	\N	\N	\N
114	28	65	46	0	0	18	Capacitación en ergonomía	0	0	21	2012-04-21 17:39:32	admdominicana	\N	\N	1	\N	\N	\N	\N
109	29	65	46	0	0	18	Capacitación en ergonomía	0	0	21	2012-04-21 12:34:28	admdominicana	\N	\N	1	\N	\N	\N	\N
258	38	88	46	0	0	18	<null>	0	0	25	2012-05-15 13:17:08	admdominicana	\N	\N	1	\N	\N	\N	\N
384	38	88	46	0	0	18	USO DE MASCARILLA.	0	0	25	2012-05-17 22:50:42	sgidominicana	\N	\N	1	\N	\N	\N	\N
257	39	82	46	0	0	18	<null>	0	0	25	2012-05-15 13:12:13	admdominicana	\N	\N	1	\N	\N	\N	\N
385	39	82	46	0	0	18	USO DE MASCARILLA.	0	0	25	2012-05-17 22:54:07	sgidominicana	\N	\N	1	\N	\N	\N	\N
113	45	52	46	0	0	18	Uso de equipo anticaída. Uso de EPPs.	0	0	23	2012-04-21 13:00:47	admdominicana	\N	\N	1	\N	\N	\N	\N
112	46	53	46	0	0	22	Uso de botas	0	0	24	2012-04-21 12:55:12	admdominicana	\N	\N	1	\N	\N	\N	\N
111	46	75	46	0	0	18	Uso de guantes	0	0	24	2012-04-21 12:50:40	admdominicana	\N	\N	1	\N	\N	\N	\N
429	48	38	46	0	14	0	Uso de guantes de protección.	0	0	25	2012-05-21 17:59:25	administrador	\N	\N	1	\N	\N	\N	\N
264	65	53	46	0	0	18	<null>	0	0	21	2012-05-15 13:54:11	admdominicana	\N	\N	1	\N	\N	\N	\N
394	65	53	46	0	0	18	USO DE BOTAS.	0	0	21	2012-05-17 23:30:20	sgidominicana	\N	\N	1	\N	\N	\N	\N
255	68	66	46	0	0	18	<null>	0	0	25	2012-05-14 23:00:15	admdominicana	\N	\N	1	\N	\N	\N	\N
256	68	66	46	0	0	18	<null>	0	0	25	2012-05-14 23:00:18	admdominicana	\N	\N	1	\N	\N	\N	\N
254	71	88	46	0	0	18	<null>	0	0	23	2012-05-14 22:53:39	admdominicana	\N	\N	1	\N	\N	\N	\N
116	73	72	46	0	0	18	Uso de guantes. Señalización.	0	0	25	2012-04-21 17:54:00	admdominicana	\N	\N	1	\N	\N	\N	\N
117	73	72	46	0	0	18	Uso de guantes. Señalización.	0	0	25	2012-04-21 17:54:05	admdominicana	\N	\N	1	\N	\N	\N	\N
252	73	83	46	0	0	18	USO DE GUANTES PARA TEMPERATURA	0	0	24	2012-05-14 22:36:53	admdominicana	\N	\N	1	\N	\N	\N	\N
115	85	34	46	0	13	0	Inspecciones antes de su uso. Capacitación del uso adecuado de los equipos de soldadura. Uso de EPPs.	0	0	23	2012-04-21 17:48:53	admdominicana	\N	andres	1	\N	\N	\N	\N
253	96	44	46	0	0	18	<null>	0	0	25	2012-05-14 22:42:16	admdominicana	\N	\N	1	\N	\N	\N	\N
270	100	59	46	0	0	18	<null>	0	0	21	2012-05-15 14:24:53	admdominicana	\N	\N	1	\N	\N	\N	\N
259	105	92	46	0	0	18	<null>	0	0	24	2012-05-15 13:24:02	admdominicana	\N	\N	1	\N	\N	\N	\N
261	106	88	46	0	0	18	USO DE LENTES.	0	0	25	2012-05-15 13:35:46	admdominicana	\N	\N	1	\N	\N	\N	\N
262	107	74	46	0	0	18	<null>	0	0	25	2012-05-15 13:44:30	admdominicana	\N	\N	1	\N	\N	\N	\N
265	108	55	46	0	0	18	<null>	0	0	21	2012-05-15 14:05:07	admdominicana	\N	\N	1	\N	\N	\N	\N
266	109	53	46	0	0	18	<null>	0	0	24	2012-05-15 14:09:31	admdominicana	\N	\N	1	\N	\N	\N	\N
267	110	59	46	0	0	18	<null>	0	0	21	2012-05-15 14:15:07	admdominicana	\N	\N	1	\N	\N	\N	\N
268	110	59	46	0	0	18	<null>	0	0	21	2012-05-15 14:15:12	admdominicana	\N	\N	1	\N	\N	\N	\N
269	111	52	46	0	0	18	<null>	0	0	23	2012-05-15 14:19:51	admdominicana	\N	\N	1	\N	\N	\N	\N
140	12	12	48	0	0	18	Capacitación sobre el uso adecuado de la bocina. Periodos de descanso.	0	0	24	2012-05-01 14:01:04	admdominicana	\N	\N	1	\N	\N	\N	\N
272	19	88	48	0	0	18	<null>	0	0	23	2012-05-15 14:37:03	admdominicana	\N	\N	1	\N	\N	\N	\N
273	19	88	48	0	0	18	<null>	0	0	23	2012-05-15 14:37:10	admdominicana	\N	\N	1	\N	\N	\N	\N
374	19	88	48	0	0	18	INMUNDIZACIÓN (VACUNA DT)- HIDRATACIÓN- PERIODO DE DESCANSO DE 5 MIN DE CADA HORA.	0	0	23	2012-05-17 22:13:52	sgidominicana	\N	\N	1	\N	\N	\N	\N
375	19	88	48	0	0	18	TIEMPO DE DESCANSO DESPUES DE CADA ACTIVIDAD.	0	0	23	2012-05-17 22:20:57	sgidominicana	\N	\N	1	\N	\N	\N	\N
274	28	65	48	0	0	18	<null>	0	0	21	2012-05-15 14:41:51	admdominicana	\N	\N	1	\N	\N	\N	\N
387	28	65	48	0	0	18	CAPACITACIONES EN ERGONOMÍA.	0	0	21	2012-05-17 22:58:43	sgidominicana	\N	\N	1	\N	\N	\N	\N
275	112	36	48	0	0	18	<null>	0	0	21	2012-05-15 14:50:46	admdominicana	\N	\N	1	\N	\N	\N	\N
201	70	83	50	0	0	18	USO DE GUANTES.	0	0	25	2012-05-12 16:24:48	admdominicana	\N	\N	1	\N	\N	\N	\N
202	71	88	50	0	0	18	MONITOREO. ENCENDIDO DE lámparas DURANTE TODA LA PRODUCCI	0	0	25	2012-05-12 16:40:48	admdominicana	\N	\N	1	\N	\N	\N	\N
146	12	12	50	0	13	0	Uso de protector auditivo. Capacitación y sensibilización de personal involucrado.	0	0	25	2012-05-05 23:37:15	admdominicana	\N	\N	1	\N	\N	\N	\N
198	38	88	50	0	14	0	MONITOREO- USO DE PROTECCI	0	0	25	2012-05-12 16:11:06	admdominicana	\N	\N	1	\N	\N	\N	\N
200	62	41	50	0	0	18	USO DE BOTA ANTIDESLIZANTE.	0	0	23	2012-05-12 16:20:43	admdominicana	\N	\N	1	\N	\N	\N	\N
147	63	60	50	0	0	18	Uso de guantes.	0	0	25	2012-05-05 23:41:55	admdominicana	\N	\N	1	\N	\N	\N	\N
199	96	44	50	0	0	18	ATERRIZAJE DE EQUIPOS. INSPECCI	0	0	25	2012-05-12 16:16:33	admdominicana	\N	\N	1	\N	\N	\N	\N
55	12	12	52	0	0	17	Uso correcto de EPP´s. Monitoreos periódicos de ruido ocupacional. Capacitación y sensibilización al personal involucrado	0	0	20	2012-01-10 21:45:28	SGIHuaura	\N	\N	1	\N	\N	\N	\N
56	14	34	52	0	0	17	Señalización preventivas adecuadas. Uso correcto de EPP´s. Programa de Mantenimiento de equipos. Capacitación y Sensibilización del personal involucrado	0	0	23	2012-01-11 23:39:44	SGIHuaura	\N	\N	1	\N	\N	\N	\N
57	16	56	52	0	0	22	Correcto funcionamiento de la filtración del aire. Uso correcto de EPP´s Capactación y sensibilización al personal involucrado.	0	0	24	2012-01-18 14:09:08	SGIHuaura	\N	\N	1	\N	\N	\N	\N
58	18	49	52	0	0	18	Programa de limpieza y adecuación de zonas. Uso correcto de EPP´s Correcta señalización en las zonas expuestas Capacitación y Sensibilización a las personas involucradas	0	0	23	2012-01-18 14:14:38	SGIHuaura	\N	\N	1	\N	\N	\N	\N
59	19	15	52	0	0	21	Monitoreo de vibraciones en la zona de trabajo. Uso adecuado de EPP´s. Capacitación y Sensibilización del personal adecuado	0	0	23	2012-01-18 14:49:54	SGIHuaura	\N	\N	1	\N	\N	\N	\N
126	28	65	65	0	0	21	Capacitación en ergonomía durante el levantamiento de cargas.	0	0	23	2012-04-30 22:39:55	admdominicana	\N	\N	1	\N	\N	\N	\N
125	29	65	65	0	0	21	Capacitación en ergonomía durante el levantamiento de cargas.	0	0	23	2012-04-30 22:17:02	admdominicana	\N	\N	1	\N	\N	\N	\N
428	48	38	65	0	14	0	Uso de equipos de protección personal.	0	0	25	2012-05-21 17:48:36	administrador	\N	\N	1	\N	\N	\N	\N
121	58	75	65	0	0	18	Uso de guantes anticorte.	0	0	25	2012-04-30 21:39:39	admdominicana	\N	\N	1	\N	\N	\N	\N
128	66	45	65	0	0	18	Señalización.	0	0	21	2012-05-01 00:26:04	admdominicana	\N	\N	1	\N	\N	\N	\N
122	75	74	65	0	0	18	Uso de lentes. Uso de guantes anticorte.	0	0	25	2012-04-30 22:02:38	admdominicana	\N	\N	1	\N	\N	\N	\N
123	75	74	65	0	0	18	Uso de lentes. Uso de guantes anticorte.	0	0	25	2012-04-30 22:02:50	admdominicana	\N	\N	1	\N	\N	\N	\N
124	75	74	65	0	0	18	Uso de lentes. Uso de guantes anticorte.	0	0	25	2012-04-30 22:03:05	admdominicana	\N	\N	1	\N	\N	\N	\N
203	75	74	65	0	14	0	USO DE LENTES- USO DE GUANTES ANTICORTE.	0	0	25	2012-05-12 16:46:24	admdominicana	\N	\N	1	\N	\N	\N	\N
127	76	77	65	0	0	18	Periodos de descanso después de cada actividad.	0	0	24	2012-05-01 00:19:00	admdominicana	\N	\N	1	\N	\N	\N	\N
120	80	36	65	0	0	18	Señalización.	0	0	23	2012-04-30 21:31:37	admdominicana	\N	\N	1	\N	\N	\N	\N
204	89	75	65	0	0	18	USO DE GUANTES ANTICORTE.	0	0	25	2012-05-12 16:51:27	admdominicana	\N	\N	1	\N	\N	\N	\N
226	12	89	67	0	13	0	<null>	0	0	25	2012-05-14 17:22:14	admdominicana	\N	\N	1	\N	\N	\N	\N
369	12	89	67	0	13	0	USO DE PROTECTOR AUDITIVO. CAPACITACIÓN Y SENSIBILIZACIÓN EN TEMAS DE RUIDO.	0	0	25	2012-05-17 21:51:37	sgidominicana	\N	\N	1	\N	\N	\N	\N
225	16	48	67	0	0	18	<null>	0	0	23	2012-05-14 17:17:44	admdominicana	\N	\N	1	\N	\N	\N	\N
371	16	48	67	0	0	18	INMUNDIZACIÓN (VACUNA DT)- HIDRATACIÓN- PERIODO DE DESCANSO DE 5 MIN DE CADA HORA.	0	0	23	2012-05-17 21:58:26	sgidominicana	\N	\N	1	\N	\N	\N	\N
229	38	88	67	0	0	18	<null>	0	0	25	2012-05-14 17:37:16	admdominicana	\N	\N	1	\N	\N	\N	\N
382	38	88	67	0	0	18	USO DE MASCARILLA.	0	0	25	2012-05-17 22:47:09	sgidominicana	\N	\N	1	\N	\N	\N	\N
224	62	41	67	0	0	18	<null>	0	0	23	2012-05-14 17:13:14	admdominicana	\N	\N	1	\N	\N	\N	\N
399	62	59	67	0	0	18	USO DE BOTA ANTIDESLIZANTE.	0	0	23	2012-05-17 23:43:22	sgidominicana	\N	\N	1	\N	\N	\N	\N
228	66	53	67	0	0	18	<null>	0	0	21	2012-05-14 17:33:27	admdominicana	\N	\N	1	\N	\N	\N	\N
392	66	53	67	0	0	18	INSPECCIONAR ANTES DE INGRESAR A ESPACIOS ESTRECHOS.	0	0	21	2012-05-17 23:25:07	sgidominicana	\N	\N	1	\N	\N	\N	\N
227	72	83	67	0	0	18	<null>	0	0	25	2012-05-14 17:27:46	admdominicana	\N	\N	1	\N	\N	\N	\N
222	100	41	67	0	0	18	<null>	0	0	23	2012-05-14 17:01:23	admdominicana	\N	\N	1	\N	\N	\N	\N
99	12	12	75	0	13	0	Capacitación de uso de bocina. Descanco	0	0	23	2012-04-21 02:32:50	admdominicana	\N	\N	1	\N	\N	\N	\N
100	12	12	75	0	13	0	Capacitación de uso de bocina. Descanco	0	0	23	2012-04-21 02:33:00	admdominicana	\N	\N	1	\N	\N	\N	\N
205	12	88	75	0	13	0	CAPACITACI	0	0	23	2012-05-12 16:56:59	admdominicana	\N	\N	1	\N	\N	\N	\N
119	19	15	75	0	0	18	Tiempo de descanso después de cada actividad.	0	0	21	2012-04-30 21:04:45	admdominicana	\N	\N	1	\N	\N	\N	\N
101	28	65	75	0	0	18	Capacitacion de ergonomia	0	0	23	2012-04-21 02:40:29	admdominicana	\N	andres	1	\N	\N	\N	\N
105	46	53	75	0	0	18	Uso de botas	0	0	24	2012-04-21 03:56:23	admdominicana	\N	\N	1	\N	\N	\N	\N
422	46	53	75	0	14	0	USO DE BOTAS.	0	0	24	2012-05-18 14:46:56	admdominicana	\N	\N	1	\N	\N	\N	\N
104	46	75	75	0	0	18	Uso de guantes	0	0	24	2012-04-21 03:47:50	admdominicana	\N	\N	1	\N	\N	\N	\N
102	81	80	75	0	0	18	Capacitación en manejo defensivo	0	0	21	2012-04-21 02:55:14	admdominicana	\N	\N	1	\N	\N	\N	\N
103	82	80	75	0	0	18	Evaluación de alcoholimetría	0	0	21	2012-04-21 03:35:58	admdominicana	\N	\N	1	\N	\N	\N	\N
106	83	81	75	0	0	18	Capacitación de manejo defensivo	0	0	21	2012-04-21 12:14:21	admdominicana	\N	\N	1	\N	\N	\N	\N
107	84	81	75	0	0	18	Capacitación de manejo defensivo	0	0	21	2012-04-21 12:17:36	admdominicana	\N	\N	1	\N	\N	\N	\N
75	69	67	76	0	0	18	Uso de guantes. Uso de protección respiratoria. Capacitación del correcto uso de EPPs.	0	0	25	2012-04-13 17:56:57	admdominicana	\N	\N	1	\N	\N	\N	\N
77	70	68	76	0	0	18	Uso de guantes.	0	0	25	2012-04-14 12:38:34	admdominicana	\N	\N	1	\N	\N	\N	\N
171	70	83	76	0	0	18	USO DE GUANTES.	0	0	25	2012-05-11 22:30:00	admdominicana	\N	\N	1	\N	\N	\N	\N
12	12	12	76	0	14	0	Reingenieria de procesos Capacitación y sensibilización al personal Uso correcto de EPP´s	0	0	24	2011-12-05 22:12:16	SGIHuaura	\N	\N	1	\N	\N	\N	\N
14	18	49	76	0	0	21	Capacitación y Sensibilización. Uso correcto de los EPP´s	0	0	25	2011-12-09 22:56:22	SGIHuaura	\N	\N	1	\N	\N	\N	\N
13	19	15	76	0	0	22	Reingeniería del Proceso Capacitación y Sensibilización. Programas de exposición al puesto de trabajo	0	0	24	2011-12-07 23:57:36	SGIHuaura	\N	\N	1	\N	\N	\N	\N
15	28	20	76	0	0	18	Capacitación y Sensibilización.	0	0	22	2011-12-16 16:15:45	SGIHuaura	\N	\N	1	\N	\N	\N	\N
174	29	65	76	0	0	18	CAPACITACIONES EN ERGONOMIA DURANTE LA EJECUCION DE CARGAS.	0	0	23	2012-05-12 13:34:52	admdominicana	\N	\N	1	\N	\N	\N	\N
420	29	65	76	0	0	21	CAPACITACIONES EN ERGONOMÍA DURANTE EL LEVANTAMIENTO DE CARGAS.	0	0	23	2012-05-18 14:14:26	admdominicana	\N	\N	1	\N	\N	\N	\N
208	16	48	39	0	0	18	INMUNIZACI	0	0	23	2012-05-14 14:24:00	admdominicana	\N	\N	1	\N	\N	\N	\N
16	34	44	76	0	0	24	Uso adecuado de Guantes Aislantes Control y monitoreo de los tableros Eléctricos. Capacitación y sensibilización	0	0	25	2011-12-16 16:24:24	SGIHuaura	\N	andres	1	\N	\N	\N	\N
17	38	27	76	0	0	24	Uso correcto de las mascarillas faciales. Uso correctos de los filtros. Capacitación y Sensibilización	0	0	25	2011-12-16 16:29:13	SGIHuaura	\N	\N	1	\N	\N	\N	\N
18	44	30	76	0	13	0	Señalizar las maquinarías en movimiento Capacitación y Sensibilización al personal	0	0	21	2011-12-29 16:04:22	SGIHuaura	\N	\N	1	\N	\N	\N	\N
42	44	55	76	0	0	17	Señalación de las maquinárias. Mantenimiento preventivo y correctivo de las maquinárias. Uso adecuado de EPP´s. Capacitación y Sensibilización al personal involucrado.	0	0	20	2011-12-30 22:02:16	SGIHuaura	\N	\N	1	\N	\N	\N	\N
19	45	52	76	0	0	24	Capacitación al personal y uso correcto de equipos de protección personal.	0	0	25	2011-12-29 16:36:32	willy	\N	\N	1	\N	\N	\N	\N
20	48	38	76	0	0	18	Uso correcto de los EEP´s asignados a ese tipo de trabajos. Capacitación y Sensibilización. Cumplir los procedimientos establecidos	0	0	25	2011-12-29 16:55:16	SGIHuaura	\N	\N	1	\N	\N	\N	\N
141	48	53	76	0	0	18	Uso de botas.	0	0	25	2012-05-05 22:18:11	admdominicana	\N	\N	1	\N	\N	\N	\N
21	55	29	76	0	0	21	Rediseño del área  Capacitación y Sensibilización Señalización y Orden en la zona laborable.	0	0	25	2011-12-29 17:14:07	SGIHuaura	\N	\N	1	\N	\N	\N	\N
73	63	60	76	0	0	18	Uso de guantes.	0	0	25	2012-04-13 17:37:24	admdominicana	\N	\N	1	\N	\N	\N	\N
170	63	83	76	0	0	18	USO DE GUANTES.	0	0	25	2012-05-11 22:19:52	admdominicana	\N	\N	1	\N	\N	\N	\N
76	64	61	76	0	0	18	Uso de guantes. Uso de protección respiratoria. Capacitación del correcto uso de EPPs.	0	0	25	2012-04-14 12:22:50	admdominicana	\N	\N	1	\N	\N	\N	\N
74	68	66	76	0	0	18	Uso de filtro para partículas. Capacitación sobre el correcto uso del equipos de protección respiratoria.	0	0	25	2012-04-13 17:50:03	admdominicana	\N	\N	1	\N	\N	\N	\N
172	91	53	76	0	0	18	USO DE BOTAS.	0	0	25	2012-05-11 22:37:45	admdominicana	\N	\N	1	\N	\N	\N	\N
173	95	44	76	0	0	18	USO DE BOTA DIELECTRICA.	0	0	25	2012-05-11 22:50:43	admdominicana	\N	\N	1	\N	\N	\N	\N
132	12	12	79	0	0	18	Capacitación en uso de bocina.	0	0	24	2012-05-01 12:41:11	admdominicana	\N	\N	1	\N	\N	\N	\N
271	12	88	79	0	0	18	USO ADECUADO DE BOCINA. PERIODO DE DESCANSO.	0	0	24	2012-05-15 14:32:12	admdominicana	\N	\N	1	\N	\N	\N	\N
133	19	15	79	0	0	18	Periodos de descanso después de cada actividad.	0	0	23	2012-05-01 12:45:50	admdominicana	\N	\N	1	\N	\N	\N	\N
134	28	65	79	0	0	18	Capacitación en ergonomía.	0	0	21	2012-05-01 12:50:23	admdominicana	\N	\N	1	\N	\N	\N	\N
136	29	65	79	0	0	18	Capacitación en ergonomía.	0	0	21	2012-05-01 13:33:33	admdominicana	\N	\N	1	\N	\N	\N	\N
137	48	53	79	0	0	18	Uso de botas.	0	0	25	2012-05-01 13:39:11	admdominicana	\N	\N	1	\N	\N	\N	\N
138	75	74	79	0	0	18	Uso de lentes. Uso de guantes anticorte.	0	0	25	2012-05-01 13:44:15	admdominicana	\N	\N	1	\N	\N	\N	\N
139	76	77	79	0	0	18	Periodos de descanso después de cada actividad.	0	0	24	2012-05-01 13:49:12	admdominicana	\N	\N	1	\N	\N	\N	\N
135	86	36	79	0	0	18	Señalización.	0	0	21	2012-05-01 13:17:34	admdominicana	\N	\N	1	\N	\N	\N	\N
97	70	68	4	0	0	18	Uso de guantes	0	0	25	2012-04-20 16:28:43	admdominicana	\N	\N	1	\N	\N	\N	\N
98	71	69	4	0	0	18	Monitoreo. Encendido de lámparas durante la ejecución de las actividades.	0	0	23	2012-04-20 16:34:58	admdominicana	\N	\N	1	\N	\N	\N	\N
96	66	53	4	0	0	18	Inspeccionar antes de ingresar a espacios estrechos	0	0	23	2012-04-20 16:15:05	admdominicana	\N	\N	1	\N	\N	\N	\N
94	80	36	4	0	0	18	Señalización	0	0	23	2012-04-20 16:03:53	admdominicana	\N	\N	1	\N	\N	\N	\N
95	80	36	4	0	0	18	Señalización	0	0	23	2012-04-20 16:04:16	admdominicana	\N	\N	1	\N	\N	\N	\N
89	70	68	6	0	0	18	Uso de guantes	0	0	25	2012-04-18 13:43:10	admdominicana	\N	\N	1	\N	\N	\N	\N
93	71	69	6	0	0	18	Monitoreo. Encendido de lámparas durante la realización de las actividades.	0	0	21	2012-04-20 15:41:49	admdominicana	\N	\N	1	\N	\N	\N	\N
244	71	69	6	0	0	18	<null>	0	0	23	2012-05-14 21:28:25	admdominicana	\N	\N	1	\N	\N	\N	\N
409	71	69	6	0	0	18	MONITOREO. ENCENDIDO DE LAMPARAS DURANTE LA REALIZACION DE ACTIVIDADES.	0	0	23	2012-05-18 00:06:45	sgidominicana	\N	\N	1	\N	\N	\N	\N
90	12	12	6	0	13	0	Uso de protector auditivo. Capacitación y sensibilización de personal involucrado.	0	0	25	2012-04-20 15:26:39	admdominicana	\N	\N	1	\N	\N	\N	\N
91	62	59	6	0	0	18	Uso de botas antideslizante.	0	0	23	2012-04-20 15:32:36	admdominicana	\N	\N	1	\N	\N	\N	\N
92	62	59	6	0	0	18	Uso de botas antideslizante.	0	0	23	2012-04-20 15:32:53	admdominicana	\N	\N	1	\N	\N	\N	\N
83	70	68	5	0	0	18	Uso de guantes.	0	0	25	2012-04-18 12:27:10	admdominicana	\N	admdominicana	1	\N	\N	\N	\N
88	71	69	5	0	0	18	Monitoreo. Encendido de lámparas durante la ejecución de las actividades.	0	0	23	2012-04-18 13:32:30	admdominicana	\N	\N	1	\N	\N	\N	\N
85	12	12	5	0	13	0	Uso de protector auditivo. Capacitación y sensibilización de personal involucrado.	0	0	25	2012-04-18 13:00:32	admdominicana	\N	admdominicana	1	\N	\N	\N	\N
86	62	59	5	0	0	18	Uso de bota antideslizante	0	0	23	2012-04-18 13:14:00	admdominicana	\N	admdominicana	1	\N	\N	\N	\N
87	62	59	5	0	0	18	Uso de bota antideslizante	0	0	23	2012-04-18 13:14:27	admdominicana	\N	\N	1	\N	\N	\N	\N
184	12	12	73	0	13	0	USO DE PROTECTOR AUDITIVO. CAPACITACION	0	0	25	2012-05-12 14:49:16	admdominicana	\N	\N	1	\N	\N	\N	\N
187	16	71	73	0	0	18	INMUNDACI	0	0	25	2012-05-12 15:08:40	admdominicana	\N	\N	1	\N	\N	\N	\N
417	16	71	73	0	0	18	INMUNDIZACIÓN (VACUNA DT)- HIDRATACIÓN- PERIODO DE DESCANSO DE 5 MIN DE CADA HORA.	0	0	25	2012-05-18 00:25:26	sgidominicana	\N	\N	1	\N	\N	\N	\N
145	47	38	73	0	0	24	Mantenimiento preventivo de maquinarias. Inspección de equipos.	0	0	25	2012-05-05 23:16:44	admdominicana	\N	\N	1	\N	\N	\N	\N
186	47	84	73	0	0	24	&nbsp;MANTENIMIENTO PREVENTIVO DE LAS MAQUINARIAS. INSPECCI	0	0	25	2012-05-12 15:02:10	admdominicana	\N	\N	1	\N	\N	\N	\N
426	67	55	73	0	14	0	SEÑALIZACION DE LA MAQUINARIA. CAPACITACION INFORMATIVA DE PELIGROS EN EL AMBIENTE DE TRABAJO.	0	0	21	2012-05-18 16:26:39	admdominicana	\N	\N	1	\N	\N	\N	\N
188	67	87	73	0	14	0	SE	0	0	21	2012-05-12 15:14:00	admdominicana	\N	\N	1	\N	\N	\N	\N
185	96	44	73	0	0	18	ATERRIZAJE DE EQUIPOS. INSPECCI	0	0	25	2012-05-12 14:55:13	admdominicana	\N	\N	1	\N	\N	\N	\N
431	12	17	56	2	0	0	demo	0	0	21	2012-11-17 23:20:32	andres	\N	andres	0	\N	\N	\N	\N
206	12	88	39	0	13	0	USO DE PROTECTOR AUDITIVO. CAPACITACI	0	0	23	2012-05-14 14:00:02	admdominicana	\N	\N	1	\N	\N	\N	\N
415	16	48	39	0	0	18	INMUNDIZACIÓN (VACUNA DT)- HIDRATACIÓN- PERIODO DE DESCANSO DE 5 MIN DE CADA HORA.	0	0	23	2012-05-18 00:22:13	sgidominicana	\N	\N	1	\N	\N	\N	\N
424	16	48	39	0	0	18	INMUNDIZACIÓN (VACUNA DT)- HIDRATACIÓN- PERIODO DE DESCANSO DE 5 MIN DE CADA HORA.	0	0	23	2012-05-18 15:14:43	admdominicana	\N	\N	1	\N	\N	\N	\N
211	68	66	39	0	0	18	<null>	0	0	25	2012-05-14 15:06:54	admdominicana	\N	\N	1	\N	\N	\N	\N
402	68	66	39	0	0	18	USO DE MASCARILLA.	0	0	25	2012-05-17 23:49:47	sgidominicana	\N	\N	1	\N	\N	\N	\N
209	80	36	39	0	0	18	<null>	0	0	23	2012-05-14 14:30:40	admdominicana	\N	\N	1	\N	\N	\N	\N
210	80	36	39	0	0	18	<null>	0	0	23	2012-05-14 15:00:45	admdominicana	\N	\N	1	\N	\N	\N	\N
207	97	41	39	0	0	18	<null>	0	0	23	2012-05-14 14:12:58	admdominicana	\N	\N	1	\N	\N	\N	\N
247	12	88	31	0	13	0	<null>	0	0	25	2012-05-14 21:55:06	admdominicana	\N	\N	1	\N	\N	\N	\N
366	12	88	31	0	13	0	USO DE PROTECTOR AUDITIVO.	0	0	25	2012-05-17 21:40:56	sgidominicana	\N	\N	1	\N	\N	\N	\N
248	96	86	31	0	0	18	<null>	0	0	25	2012-05-14 21:59:15	admdominicana	\N	\N	1	\N	\N	\N	\N
246	100	41	31	0	0	18	<null>	0	0	23	2012-05-14 21:40:57	admdominicana	\N	\N	1	\N	\N	\N	\N
245	102	83	31	0	0	18	<null>	0	0	25	2012-05-14 21:36:31	admdominicana	\N	\N	1	\N	\N	\N	\N
249	103	88	31	0	0	18	<null>	0	0	25	2012-05-14 22:04:18	admdominicana	\N	\N	1	\N	\N	\N	\N
284	68	89	34	0	0	18	<null>	0	0	25	2012-05-15 15:34:16	admdominicana	\N	\N	1	\N	\N	\N	\N
285	68	89	34	0	0	18	<null>	0	0	25	2012-05-15 15:34:21	admdominicana	\N	\N	1	\N	\N	\N	\N
286	68	89	34	0	0	18	<null>	0	0	25	2012-05-15 15:38:57	admdominicana	\N	\N	1	\N	\N	\N	\N
404	68	89	34	0	0	18	USO DE FILTROS PARA PARTICULAS. CAPACITACION SOBRE EL CORRECTO USO DE PROTECCION RESPIRATORIA.	0	0	25	2012-05-17 23:55:10	sgidominicana	\N	\N	1	\N	\N	\N	\N
279	12	88	34	0	0	17	CAPACITACION DE USO DE BOCINA- DESCANSO.	0	0	23	2012-05-15 15:14:27	admdominicana	\N	\N	1	\N	\N	\N	\N
280	28	65	34	0	0	18	<null>	0	0	23	2012-05-15 15:18:57	admdominicana	\N	\N	1	\N	\N	\N	\N
389	28	65	34	0	0	18	CAPACITACIONES EN ERGONOMÍA.	0	0	23	2012-05-17 23:15:36	sgidominicana	\N	\N	1	\N	\N	\N	\N
288	29	65	34	0	0	18	<null>	0	0	21	2012-05-15 15:51:02	admdominicana	\N	\N	1	\N	\N	\N	\N
390	29	65	34	0	0	18	CAPACITACIONES EN ERGONOMÍA.	0	0	21	2012-05-17 23:18:39	sgidominicana	\N	\N	1	\N	\N	\N	\N
290	48	53	34	0	0	18	<null>	0	0	25	2012-05-15 16:16:38	admdominicana	\N	\N	1	\N	\N	\N	\N
380	48	53	34	0	0	18	USO DE BOTAS.	0	0	25	2012-05-17 22:41:35	sgidominicana	\N	\N	1	\N	\N	\N	\N
291	48	93	34	0	0	18	<null>	0	0	24	2012-05-15 16:24:45	admdominicana	\N	\N	1	\N	\N	\N	\N
381	48	93	34	0	0	18	USO DE GUANTES.	0	0	24	2012-05-17 22:44:19	sgidominicana	\N	\N	1	\N	\N	\N	\N
289	80	36	34	0	0	18	<null>	0	0	23	2012-05-15 16:08:41	admdominicana	\N	\N	1	\N	\N	\N	\N
283	81	80	34	0	0	18	<null>	0	0	21	2012-05-15 15:28:59	admdominicana	\N	\N	1	\N	\N	\N	\N
287	100	59	34	0	0	18	<null>	0	0	23	2012-05-15 15:44:02	admdominicana	\N	\N	1	\N	\N	\N	\N
281	114	81	34	0	0	18	<null>	0	0	21	2012-05-15 15:24:51	admdominicana	\N	\N	1	\N	\N	\N	\N
282	114	81	34	0	0	18	<null>	0	0	21	2012-05-15 15:25:00	admdominicana	\N	\N	1	\N	\N	\N	\N
156	70	83	25	0	0	18	USO DE GUANTES.	0	0	25	2012-05-11 17:32:10	admdominicana	\N	\N	1	\N	\N	\N	\N
157	16	71	25	0	0	18	INMUNIZACION (VACUNA DT) - HIDRATACION- PERIODO DE DESCANSO DE 5 MIN CADA HORA.	0	0	23	2012-05-11 17:39:49	admdominicana	\N	\N	1	\N	\N	\N	\N
153	28	65	25	0	0	18	CAPACITACIONES EN ERGONOMIA DURANTE LA EJECUCION DE CARGAS.	0	0	23	2012-05-11 16:56:31	admdominicana	\N	\N	1	\N	\N	\N	\N
419	28	65	25	0	10	0	CAPACITACIONES EN ERGONOMÍA DURANTE EL LEVANTAMIENTO DE CARGAS.	0	0	23	2012-05-18 14:06:49	admdominicana	\N	andres	1	\N	\N	\N	\N
148	28	77	25	0	10	0	capacitaciones en ergonomia durante la ejecucion de cargas.	0	0	18	2012-05-11 16:03:29	admdominicana	\N	\N	1	\N	\N	\N	\N
150	29	77	25	0	10	0	CAPACITACIONES EN ERGONOMIA DURANTE LA EJECUCION DE CARGAS	0	0	18	2012-05-11 16:29:02	admdominicana	\N	\N	1	\N	\N	\N	\N
160	45	52	25	0	13	0	REDISEÑO DE LAS TOMAS DE CONEXION DE JARABE Y AGUA.	0	0	20	2012-05-11 20:43:07	admdominicana	\N	\N	1	\N	\N	\N	\N
151	62	41	25	0	14	0	USO DE BOTA ANTIDESLIZANTE.	0	0	21	2012-05-11 16:38:24	admdominicana	\N	\N	1	\N	\N	\N	\N
154	63	60	25	0	0	18	USO DE GUANTES	0	0	25	2012-05-11 17:04:54	admdominicana	\N	\N	1	\N	\N	\N	\N
155	64	61	25	0	0	18	USO DE GUANTES	0	0	25	2012-05-11 17:11:57	admdominicana	\N	\N	1	\N	\N	\N	\N
158	68	66	25	0	0	18	USO DE FILTRO PARA PARTICULAS-CAPACITACION SOBRE EL  CORRECTO USO DE PROTECCION RESPIRATORIA.	0	0	25	2012-05-11 17:48:00	admdominicana	\N	\N	1	\N	\N	\N	\N
149	76	77	25	0	10	0	Periodo De Descanso De 10 Minutos Despues De Cada Actividad	0	0	18	2012-05-11 16:15:01	admdominicana	\N	\N	1	\N	\N	\N	\N
152	77	41	25	0	0	18	SeñaliZACION- CAPACITACION INFORMATIVA DE PELIGROS EN EL AMBIENTE DE TRABAJO	0	0	23	2012-05-11 16:46:40	admdominicana	\N	\N	1	\N	\N	\N	\N
159	88	44	25	0	0	18	ATERRIZAJE DE EQUIPOS. INSPECCION DE EQUIPOS.	0	0	25	2012-05-11 20:31:22	admdominicana	\N	\N	1	\N	\N	\N	\N
430	96	44	25	0	14	0	Instalación de puesta tierra de los equipos.	0	0	23	2012-05-21 20:32:27	administrador	\N	\N	1	\N	\N	\N	\N
250	71	69	71	0	0	18	<null>	0	0	21	2012-05-14 22:18:37	admdominicana	\N	\N	1	\N	\N	\N	\N
411	71	69	71	0	0	18	MONITOREO. ENCENDIDO DE LAMPARAS DURANTE LA REALIZACION DE ACTIVIDADES.	0	0	21	2012-05-18 00:10:06	sgidominicana	\N	\N	1	\N	\N	\N	\N
251	28	65	71	0	0	18	<null>	0	0	21	2012-05-14 22:23:09	admdominicana	\N	\N	1	\N	\N	\N	\N
386	28	65	71	0	0	18	CAPACITACIONES EN ERGONOMÍA.	0	0	21	2012-05-17 22:57:00	sgidominicana	\N	\N	1	\N	\N	\N	\N
294	71	69	66	0	0	18	<null>	0	0	23	2012-05-15 16:43:26	admdominicana	\N	\N	1	\N	\N	\N	\N
408	71	69	66	0	0	18	MONITOREO. ENCENDIDO DE LAMPARAS DURANTE LA REALIZACION DE ACTIVIDADES.	0	0	23	2012-05-18 00:04:35	sgidominicana	\N	\N	1	\N	\N	\N	\N
292	28	65	66	0	0	21	<null>	0	0	23	2012-05-15 16:32:49	admdominicana	\N	\N	1	\N	\N	\N	\N
295	100	41	66	0	0	21	<null>	0	0	23	2012-05-15 16:48:22	admdominicana	\N	\N	1	\N	\N	\N	\N
293	113	74	66	0	0	21	<null>	0	0	23	2012-05-15 16:38:43	admdominicana	\N	\N	1	\N	\N	\N	\N
348	71	69	41	0	0	18	\N	0	0	23	2012-05-16 14:32:29	admdominicana	\N	\N	1	\N	\N	\N	\N
297	28	65	41	0	0	21	<null>	0	0	21	2012-05-15 16:57:55	admdominicana	\N	\N	1	\N	\N	\N	\N
298	28	65	41	0	0	21	<null>	0	0	21	2012-05-15 16:58:09	admdominicana	\N	\N	1	\N	\N	\N	\N
296	100	41	41	0	0	21	<null>	0	0	23	2012-05-15 16:53:18	admdominicana	\N	\N	1	\N	\N	\N	\N
342	113	74	41	0	0	18	\N	0	0	23	2012-05-16 14:03:51	admdominicana	\N	\N	1	\N	\N	\N	\N
328	68	89	38	0	0	18	<null>	0	0	25	2012-05-15 22:27:59	admdominicana	\N	\N	1	\N	\N	\N	\N
405	68	89	38	0	0	18	USO DE FILTROS PARA PARTICULAS. CAPACITACION SOBRE EL CORRECTO USO DE PROTECCION RESPIRATORIA.	0	0	25	2012-05-17 23:56:55	sgidominicana	\N	\N	1	\N	\N	\N	\N
324	28	65	38	0	0	18	<null>	0	0	21	2012-05-15 22:11:15	admdominicana	\N	\N	1	\N	\N	\N	\N
325	28	65	38	0	0	18	<null>	0	0	21	2012-05-15 22:11:18	admdominicana	\N	\N	1	\N	\N	\N	\N
377	28	65	38	0	0	18	CAPACITACIONES EN ERGONOMÍA	0	0	21	2012-05-17 22:28:45	sgidominicana	\N	\N	1	\N	\N	\N	\N
327	29	65	38	0	0	18	<null>	0	0	21	2012-05-15 22:20:58	admdominicana	\N	\N	1	\N	\N	\N	\N
391	29	65	38	0	0	18	CAPACITACIONES EN ERGONOMÍA.	0	0	21	2012-05-17 23:22:01	sgidominicana	\N	\N	1	\N	\N	\N	\N
331	58	83	38	0	0	18	<null>	0	0	24	2012-05-15 22:41:52	admdominicana	\N	\N	1	\N	\N	\N	\N
400	58	83	38	0	0	18	USO DE GUANTES.	0	0	24	2012-05-17 23:46:47	sgidominicana	\N	\N	1	\N	\N	\N	\N
401	58	83	38	0	0	18	USO DE GUANTES.	0	0	24	2012-05-17 23:46:53	sgidominicana	\N	\N	1	\N	\N	\N	\N
321	80	36	38	0	0	18	<null>	0	0	23	2012-05-15 21:55:40	admdominicana	\N	\N	1	\N	\N	\N	\N
315	99	88	38	0	0	18	<null>	0	0	24	2012-05-15 21:24:08	admdominicana	\N	\N	1	\N	\N	\N	\N
316	100	59	38	0	0	18	<null>	0	0	21	2012-05-15 21:32:14	admdominicana	\N	\N	1	\N	\N	\N	\N
317	101	88	38	0	0	18	<null>	0	0	24	2012-05-15 21:38:24	admdominicana	\N	\N	1	\N	\N	\N	\N
329	70	83	49	0	0	18	<null>	0	0	25	2012-05-15 22:32:48	admdominicana	\N	\N	1	\N	\N	\N	\N
330	70	83	49	0	0	18	<null>	0	0	25	2012-05-15 22:32:52	admdominicana	\N	\N	1	\N	\N	\N	\N
406	70	83	49	0	0	18	USO DE GUANTES.	0	0	25	2012-05-17 23:59:23	sgidominicana	\N	\N	1	\N	\N	\N	\N
326	28	65	49	0	0	18	<null>	0	0	23	2012-05-15 22:15:54	admdominicana	\N	\N	1	\N	\N	\N	\N
378	28	65	49	0	0	18	CAPACITACIONES EN ERGONOMÍA	0	0	23	2012-05-17 22:30:37	sgidominicana	\N	\N	1	\N	\N	\N	\N
322	80	36	49	0	0	18	<null>	0	0	23	2012-05-15 22:01:49	admdominicana	\N	\N	1	\N	\N	\N	\N
323	80	36	49	0	0	18	<null>	0	0	23	2012-05-15 22:01:53	admdominicana	\N	\N	1	\N	\N	\N	\N
320	99	88	49	0	0	18	<null>	0	0	24	2012-05-15 21:49:14	admdominicana	\N	\N	1	\N	\N	\N	\N
318	101	88	49	0	0	18	<null>	0	0	24	2012-05-15 21:43:33	admdominicana	\N	\N	1	\N	\N	\N	\N
319	101	88	49	0	0	18	<null>	0	0	24	2012-05-15 21:43:38	admdominicana	\N	\N	1	\N	\N	\N	\N
349	71	69	12	0	0	18	INSTALAR PROTECTORES DE VIDRIO.	0	0	23	2012-05-16 16:11:51	admdominicana	\N	\N	1	\N	\N	\N	\N
350	71	69	12	0	0	18	MONITOREO. INSPECCIÓN.	0	0	23	2012-05-16 16:18:53	sgidominicana	\N	\N	1	\N	\N	\N	\N
356	28	65	12	0	0	21	CAPACITACIÓN EN ERGONOMÍA	0	0	21	2012-05-16 16:29:45	sgidominicana	\N	\N	1	\N	\N	\N	\N
337	100	59	12	0	0	21	\N	0	0	23	2012-05-16 13:45:13	admdominicana	\N	\N	1	\N	\N	\N	\N
343	113	74	12	0	0	18	\N	0	0	23	2012-05-16 14:07:11	admdominicana	\N	\N	1	\N	\N	\N	\N
354	71	69	28	0	0	18	MONITOREO. INSPECCIÓN.	0	0	23	2012-05-16 16:24:25	sgidominicana	\N	\N	1	\N	\N	\N	\N
359	28	65	28	0	0	21	CAPACITACIÓN EN ERGONOMÍA	0	0	21	2012-05-16 16:34:14	sgidominicana	\N	\N	1	\N	\N	\N	\N
340	100	59	28	0	0	21	\N	0	0	23	2012-05-16 13:54:42	admdominicana	\N	\N	1	\N	\N	\N	\N
346	113	74	28	0	0	18	\N	0	0	23	2012-05-16 14:25:14	admdominicana	\N	\N	1	\N	\N	\N	\N
131	48	53	33	0	0	18	Uso de botas. Inspección de almacenes.	0	0	25	2012-05-01 01:05:16	admdominicana	\N	\N	1	\N	\N	\N	\N
130	48	75	33	0	0	18	Uso de guantes.	0	0	25	2012-05-01 00:45:14	admdominicana	\N	\N	1	\N	\N	\N	\N
129	68	66	33	0	0	18	Uso de mascarilla.	0	0	25	2012-05-01 00:37:17	admdominicana	\N	\N	1	\N	\N	\N	\N
82	70	68	37	0	0	18	Uso de guantes.	0	0	25	2012-04-18 12:26:56	admdominicana	\N	\N	1	\N	\N	\N	\N
243	71	69	37	0	0	18	<null>	0	0	23	2012-05-14 21:22:35	admdominicana	\N	\N	1	\N	\N	\N	\N
412	71	69	37	0	0	18	MONITOREO. ENCENDIDO DE LAMPARAS DURANTE LA REALIZACION DE ACTIVIDADES.	0	0	23	2012-05-18 00:11:37	sgidominicana	\N	\N	1	\N	\N	\N	\N
84	62	59	37	0	0	18	Uso de bota antideslizante.	0	0	23	2012-04-18 12:35:30	admdominicana	\N	\N	1	\N	\N	\N	\N
355	71	69	55	0	0	18	MONITOREO. INSPECCIÓN.	0	0	18	2012-05-16 16:26:07	sgidominicana	\N	\N	1	\N	\N	\N	\N
341	100	59	55	0	0	21	\N	0	0	23	2012-05-16 13:58:31	admdominicana	\N	\N	1	\N	\N	\N	\N
347	113	74	55	0	0	18	\N	0	0	23	2012-05-16 14:28:11	admdominicana	\N	\N	1	\N	\N	\N	\N
\.


--
-- TOC entry 2223 (class 0 OID 16934)
-- Dependencies: 247 2228
-- Data for Name: hira_incidents; Type: TABLE DATA; Schema: ims; Owner: stilgar
--

COPY hira_incidents (id_incident, id_type, value_incident, date_incident, company, country, location, id_process, desc_user_crea, date_creation, desc_user_mod, date_modification, status) FROM stdin;
2	T1	1	2012-01-18 00:00:00	0001	0002	0002	1	SGIArequipa	2012-01-18 16:02:30	\N	\N	1
3	T7	1	2012-01-18 00:00:00	0001	0002	0003	4	SGIArequipa	2012-01-19 13:56:26	\N	\N	1
4	T7	1	2012-01-19 00:00:00	0001	0002	0002	4	SGIArequipa	2012-01-19 16:13:55	\N	\N	1
7	T2	37	2012-02-07 00:00:00	0001	0002	0002	7	VISITA	2012-02-07 22:45:41	sgiarequipa2	2012-05-11 14:34:59	1
8	T7	4	2012-02-07 00:00:00	0001	0002	0002	1	SGIArequipa	2012-02-07 22:53:17	SGIArequipa	2012-02-07 22:54:17	1
9	T1	2	2012-02-08 00:00:00	0001	0002	0002	1	SGIArequipa	2012-02-08 16:53:04	sgiarequipa2	2012-05-11 14:42:58	1
10	T3	1	2012-02-13 00:00:00	0001	0002	0003	14	SGIHuaura	2012-02-15 23:14:23	\N	\N	1
89	T2	11	2012-02-27 00:00:00	0001	0002	0002	1	andres	2012-03-27 15:31:08	\N	\N	1
90	T1	12	2012-03-27 00:00:00	0001	0002	0002	1	andres	2012-03-27 15:32:33	\N	\N	1
91	T1	3	2012-03-13 00:00:00	0001	0002	0003	28	SGIHuaura	2012-03-27 18:03:22	\N	\N	1
92	T11	2	2012-03-09 00:00:00	0001	0002	0003	30	SGIHuaura	2012-03-27 18:31:44	\N	\N	1
93	T11	1	2012-04-11 00:00:00	0001	0002	0003	30	SGIHuaura	2012-04-12 00:56:44	\N	\N	1
94	T11	1	2012-04-16 00:00:00	0001	0002	0003	1	SGIHuaura	2012-04-16 22:12:27	\N	\N	1
113	T11	1	2012-04-27 00:00:00	0001	0002	0003	4	Visita	2012-04-27 14:10:28	\N	\N	1
114	T1	2	2012-04-30 00:00:00	0001	0002	0003	4	SGIHuaura	2012-04-30 22:30:29	SGIHuaura	2012-04-30 22:34:13	1
115	T7	2	2012-04-30 00:00:00	0001	0002	0003	4	SGIHuaura	2012-04-30 22:33:49	SGIHuaura	2012-04-30 22:34:34	1
116	T2	2	2012-04-28 00:00:00	0001	0002	0003	1	SGIHuaura	2012-05-03 00:43:32	SGIHuaura	2012-05-03 00:45:53	1
117	T7	1	2011-05-07 00:00:00	0001	0002	0003	5	SGIHuaura	2012-05-08 02:37:14	\N	\N	1
119	T11	1	2012-05-09 00:00:00	0001	0002	0003	\N	Visita	2012-05-09 14:47:22	\N	\N	1
120	T6	1	2012-05-09 00:00:00	0001	0002	0003	4	SGIHuaura	2012-05-09 18:05:35	\N	\N	1
121	T8	1	2012-01-02 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-10 02:41:25	\N	\N	1
122	T1	1	2012-01-04 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-10 02:48:59	\N	\N	1
123	T6	1	2012-01-05 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-10 02:49:54	\N	\N	1
124	T1	1	2012-05-01 00:00:00	0001	0001	0008	1	ssdominicana	2012-05-10 16:21:22	\N	\N	1
125	T1	1	2012-05-04 00:00:00	0001	0001	0008	1	ssdominicana	2012-05-10 16:29:31	\N	\N	1
126	T3	1	2012-05-05 00:00:00	0001	0001	0008	1	ssdominicana	2012-05-10 16:32:31	\N	\N	1
127	T1	1	2012-05-08 00:00:00	0001	0001	0008	1	ssdominicana	2012-05-10 16:44:02	\N	\N	1
128	T7	1	2012-05-08 00:00:00	0001	0001	0008	2	ssdominicana	2012-05-10 16:52:08	\N	\N	1
129	T1	2	2012-05-10 00:00:00	0001	0002	0003	\N	Visita	2012-05-10 20:51:30	Visita	2012-05-10 20:51:34	1
155	T4	1	2012-03-02 00:00:00	0001	0002	0002	7	visita	2012-05-11 03:49:20	\N	\N	1
156	T8	2	2012-03-04 00:00:00	0001	0002	0002	1	visita	2012-05-11 03:53:48	\N	\N	1
157	T8	3	2012-03-04 00:00:00	0001	0002	0002	7	visita	2012-05-11 03:56:56	\N	\N	1
158	T1	2	2012-03-08 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 05:07:35	\N	\N	1
159	T7	4	2012-03-13 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 05:32:44	\N	\N	1
160	T1	2	2012-03-26 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 05:40:50	\N	\N	1
161	T1	1	2012-03-07 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 05:47:29	\N	\N	1
162	T9	1	2012-03-08 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 05:50:05	\N	\N	1
163	T7	1	2012-03-12 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 13:34:24	\N	\N	1
164	T11	1	2012-03-12 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 13:36:55	\N	\N	1
165	T6	1	2012-03-14 00:00:00	0001	0002	0002	28	sgiarequipa2	2012-05-11 13:47:23	\N	\N	1
166	T1	1	2012-03-15 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 13:50:36	\N	\N	1
167	T7	1	2012-03-31 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 13:52:42	\N	\N	1
168	T7	4	2012-02-03 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 14:27:50	\N	\N	1
169	T4	1	2012-02-04 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 14:39:17	\N	\N	1
170	T4	1	2012-02-09 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 14:49:38	\N	\N	1
171	T11	1	2012-02-10 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 14:51:47	\N	\N	1
172	T7	1	2012-01-06 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 14:51:49	\N	\N	1
173	T6	1	2012-02-11 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 14:53:41	\N	\N	1
174	T1	1	2012-01-11 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 14:54:44	\N	\N	1
175	T4	1	2012-02-13 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 14:57:36	\N	\N	1
176	T6	1	2012-01-13 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 15:00:34	\N	\N	1
177	T1	1	2012-02-14 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 15:04:08	\N	\N	1
178	T8	1	2012-01-20 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 15:07:16	\N	\N	1
179	T7	1	2012-02-15 00:00:00	0001	0002	0002	6	sgiarequipa2	2012-05-11 15:09:13	\N	\N	1
180	T7	1	2012-02-08 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 15:11:49	\N	\N	1
181	T1	1	2012-01-19 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 15:11:49	\N	\N	1
182	T4	1	2012-02-18 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 15:13:50	\N	\N	1
183	T9	1	2012-01-25 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 15:19:55	\N	\N	1
184	T11	1	2012-01-26 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 15:23:18	\N	\N	1
185	T7	1	2012-02-22 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 15:23:40	\N	\N	1
186	T7	1	2012-02-29 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 15:25:59	\N	\N	1
187	T7	1	2012-03-01 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 15:33:30	\N	\N	1
188	T1	1	2012-03-05 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 15:37:03	\N	\N	1
189	T8	2	2012-03-05 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 15:40:31	SGIHuaura	2012-05-11 15:41:05	1
190	T6	2	2012-03-05 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 15:43:07	SGIHuaura	2012-05-11 15:44:53	1
191	T7	2	2012-03-05 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 15:47:20	SGIHuaura	2012-05-11 15:54:09	1
192	T4	1	2012-01-02 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 15:50:49	\N	\N	1
193	T11	1	2012-03-05 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 15:52:37	\N	\N	1
194	T2	4	2012-01-04 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 15:54:33	sgiarequipa2	2012-05-11 15:56:07	1
195	T9	1	2012-03-07 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 15:57:28	\N	\N	1
196	T1	1	2012-01-05 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 15:58:33	\N	\N	1
197	T1	1	2012-03-08 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 16:00:00	\N	\N	1
198	T7	1	2012-01-05 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 16:00:07	\N	\N	1
199	T6	2	2012-01-09 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 16:02:47	\N	\N	1
200	T9	1	2012-03-08 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 16:03:31	\N	\N	1
201	T6	1	2012-01-10 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-11 16:04:02	\N	\N	1
202	T7	1	2012-03-08 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 16:05:48	\N	\N	1
203	T7	1	2012-01-10 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 16:07:43	\N	\N	1
204	T3	2	2012-03-09 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 16:10:00	SGIHuaura	2012-05-11 17:19:34	1
205	T5	1	2012-03-09 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 16:12:09	\N	\N	1
206	T7	2	2012-01-16 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 16:14:37	\N	\N	1
207	T8	2	2012-01-18 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 16:22:42	\N	\N	1
208	T1	1	2012-01-26 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 16:25:00	\N	\N	1
209	T1	1	2012-01-23 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-11 16:26:22	\N	\N	1
210	T1	2	2012-03-13 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 16:31:39	SGIHuaura	2012-05-11 17:23:05	1
211	T9	2	2012-03-13 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 16:38:49	SGIHuaura	2012-05-11 16:42:27	1
212	T1	2	2012-03-15 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 16:45:39	SGIHuaura	2012-05-11 16:52:17	1
213	T1	1	2012-03-17 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 16:54:24	\N	\N	1
214	T1	1	2012-03-01 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 16:58:59	\N	\N	1
215	T9	1	2012-03-27 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 17:01:12	\N	\N	1
216	T1	1	2012-03-28 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 17:03:22	\N	\N	1
217	T3	1	2012-03-29 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 17:06:14	\N	\N	1
218	T11	1	2012-03-09 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 17:21:55	\N	\N	1
219	T11	1	2012-03-19 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 17:27:36	\N	\N	1
220	T4	1	2012-03-20 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 17:29:00	\N	\N	1
221	T1	1	2012-03-22 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 17:30:32	\N	\N	1
222	T11	1	2012-01-11 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 17:37:22	\N	\N	1
223	T11	1	2012-05-03 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 17:39:27	\N	\N	1
224	T7	1	2012-05-07 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 17:42:29	\N	\N	1
225	T1	1	2012-05-08 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 17:45:40	\N	\N	1
226	T7	1	2012-05-08 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 17:48:17	\N	\N	1
227	T9	1	2012-05-09 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 17:50:50	\N	\N	1
228	T6	1	2012-05-09 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 17:58:07	\N	\N	1
229	T1	1	2010-12-01 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 18:33:04	\N	\N	1
230	T11	1	2011-12-01 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 18:34:32	\N	\N	1
231	T1	1	2011-12-02 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 18:35:47	\N	\N	1
232	T7	1	2011-12-02 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 18:39:31	\N	\N	1
233	T1	1	2011-12-03 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 18:42:28	\N	\N	1
234	T7	2	2011-12-03 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 18:44:15	SGIHuaura	2012-05-11 18:46:05	1
235	T1	1	2011-12-12 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 18:48:33	\N	\N	1
236	T11	1	2011-12-12 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 18:50:07	\N	\N	1
237	T1	1	2011-12-13 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 18:52:46	\N	\N	1
238	T6	1	2011-12-13 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 18:55:02	\N	\N	1
239	T1	1	2011-12-14 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 18:57:36	\N	\N	1
240	T4	1	2011-12-14 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 19:01:51	\N	\N	1
241	T4	1	2011-12-15 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 19:03:22	\N	\N	1
242	T6	1	2011-12-15 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 19:04:46	\N	\N	1
243	T4	1	2011-11-02 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 19:08:34	\N	\N	1
244	T3	1	2011-11-03 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 19:10:05	\N	\N	1
245	T7	1	2011-11-04 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 19:12:32	\N	\N	1
246	T7	1	2011-11-05 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 19:13:50	\N	\N	1
247	T2	1	2011-11-07 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 20:39:15	\N	\N	1
248	T6	1	2011-11-08 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 20:41:20	\N	\N	1
249	T8	1	2011-11-10 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 20:43:53	\N	\N	1
250	T8	2	2011-11-11 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 20:55:56	SGIHuaura	2012-05-11 21:00:29	1
251	T8	1	2011-10-11 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 20:58:28	\N	\N	1
252	T4	1	2011-11-14 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 21:04:53	\N	\N	1
253	T1	1	2011-11-16 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 21:09:09	\N	\N	1
254	T1	2	2011-11-17 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 21:11:00	SGIHuaura	2012-05-11 21:17:11	1
255	T9	1	2011-11-18 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 21:18:57	\N	\N	1
256	T3	1	2011-11-18 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 21:22:59	\N	\N	1
257	T6	1	2011-11-18 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-11 21:24:47	\N	\N	1
258	T11	2	2012-05-05 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-11 23:51:18	ssdominicana	2012-05-14 21:38:35	1
259	T1	1	2012-05-02 00:00:00	0001	0002	0002	1	visita	2012-05-12 02:40:11	\N	\N	1
260	T7	1	2012-05-08 00:00:00	0001	0002	0002	7	visita	2012-05-12 02:58:47	\N	\N	1
261	T1	1	2012-05-05 00:00:00	0001	0002	0002	1	visita	2012-05-12 03:09:13	\N	\N	1
262	T7	1	2012-05-10 00:00:00	0001	0002	0002	7	visita	2012-05-12 04:06:18	\N	\N	1
263	T7	1	2012-05-11 00:00:00	0001	0002	0002	6	visita	2012-05-12 04:10:07	\N	\N	1
264	T3	1	2012-05-11 00:00:00	0001	0002	0002	7	visita	2012-05-12 04:13:45	\N	\N	1
265	T11	1	2012-05-08 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 15:27:18	\N	\N	1
266	T11	1	2012-01-19 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 15:33:10	\N	\N	1
267	T7	1	2012-05-03 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 15:55:43	\N	\N	1
268	T1	1	2012-05-04 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 15:59:48	\N	\N	1
269	T2	1	2012-02-01 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 16:10:10	\N	\N	1
270	T11	1	2012-02-01 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 16:12:13	\N	\N	1
271	T10	1	2012-02-02 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 16:14:53	\N	\N	1
277	T1	1	2012-02-03 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 16:34:32	\N	\N	1
279	T4	1	2012-01-28 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 16:36:35	\N	\N	1
280	T10	1	2012-02-04 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 16:37:05	\N	\N	1
283	T4	1	2012-01-30 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 16:41:20	\N	\N	1
284	T3	2	2012-02-07 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 16:42:23	SGIHuaura	2012-05-12 16:45:28	1
290	T7	1	2012-02-07 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 16:54:52	\N	\N	1
293	T9	1	2012-01-09 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 17:00:05	\N	\N	1
296	T11	1	2012-02-09 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 17:03:04	\N	\N	1
299	T10	1	2012-02-14 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 17:06:29	\N	\N	1
301	T11	1	2012-02-14 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 17:10:15	\N	\N	1
302	T1	1	2012-02-15 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 17:13:09	\N	\N	1
303	T9	1	2012-02-15 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 17:15:10	\N	\N	1
304	T8	1	2012-02-16 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 17:18:42	\N	\N	1
305	T11	1	2012-02-17 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 17:20:35	\N	\N	1
306	T3	1	2012-02-23 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 17:25:45	\N	\N	1
307	T11	1	2012-02-23 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 17:27:32	\N	\N	1
308	T3	1	2012-02-28 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 17:31:52	\N	\N	1
309	T7	2	2012-02-29 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 17:34:02	SGIHuaura	2012-05-18 04:03:20	1
310	T3	1	2012-02-03 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 18:44:22	\N	\N	1
311	T4	1	2012-04-05 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 18:50:05	\N	\N	1
312	T1	1	2012-04-11 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 18:51:22	\N	\N	1
313	T8	1	2012-04-13 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 18:54:21	\N	\N	1
314	T6	1	2012-02-04 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 18:55:54	\N	\N	1
315	T1	1	2012-04-18 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 18:58:31	\N	\N	1
316	T7	1	2012-04-12 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 19:00:30	\N	\N	1
317	T4	2	2012-02-06 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 19:01:34	ssdominicana	2012-05-12 19:02:11	1
318	T1	1	2012-04-24 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 19:05:54	\N	\N	1
319	T1	1	2012-04-27 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 19:06:58	\N	\N	1
320	T1	1	2012-04-30 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 19:08:43	\N	\N	1
321	T1	1	2012-02-14 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 19:44:15	\N	\N	1
322	T11	1	2012-02-14 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 19:50:24	\N	\N	1
323	T3	2	2012-02-14 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 19:56:52	ssdominicana	2012-05-12 20:00:27	1
324	T7	1	2012-02-17 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 20:04:33	\N	\N	1
325	T11	1	2011-09-01 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 20:35:56	\N	\N	1
326	T8	1	2010-09-02 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 20:37:56	\N	\N	1
327	T3	1	2011-09-03 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 20:40:26	\N	\N	1
328	T4	1	2012-02-17 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 20:41:26	\N	\N	1
329	T1	1	2011-09-06 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 20:43:33	\N	\N	1
330	T9	1	2011-09-06 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 20:45:27	\N	\N	1
331	T11	3	2012-02-17 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 20:46:20	ssdominicana	2012-05-12 21:47:28	1
332	T9	1	2011-09-07 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 20:58:59	\N	\N	1
333	T11	1	2011-09-07 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 21:00:22	\N	\N	1
334	T1	2	2011-09-14 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 21:02:08	SGIHuaura	2012-05-12 21:03:25	1
335	T3	4	2012-02-17 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 21:04:24	ssdominicana	2012-05-12 21:38:26	1
336	T1	2	2011-09-15 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 21:04:34	SGIHuaura	2012-05-12 21:05:55	1
337	T8	1	2011-09-16 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-12 21:39:52	\N	\N	1
338	T4	1	2012-02-18 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 21:54:50	\N	\N	1
339	T11	1	2012-02-19 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 22:01:23	\N	\N	1
340	T9	1	2012-02-23 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 22:05:55	\N	\N	1
341	T4	1	2012-02-23 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 22:15:46	\N	\N	1
342	T2	1	2012-02-23 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 22:18:46	\N	\N	1
343	T3	2	2012-02-24 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 22:21:47	ssdominicana	2012-05-12 22:23:14	1
344	T4	1	2012-02-25 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 22:29:23	\N	\N	1
345	T2	1	2012-02-25 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 22:41:57	\N	\N	1
346	T7	1	2012-02-25 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 22:46:36	\N	\N	1
347	T11	1	2012-02-29 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 22:48:31	\N	\N	1
348	T3	1	2012-02-29 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-12 22:50:40	\N	\N	1
349	T1	1	2012-03-02 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 13:43:58	\N	\N	1
350	T3	1	2012-03-02 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 13:46:01	\N	\N	1
351	T4	1	2012-03-02 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 13:48:24	\N	\N	1
352	T7	1	2012-03-03 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 13:56:54	\N	\N	1
353	T4	2	2012-03-03 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 14:02:45	ssdominicana	2012-05-13 14:05:15	1
354	T3	1	2012-03-03 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 14:08:09	\N	\N	1
355	T1	1	2012-03-04 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 14:15:06	\N	\N	1
356	T1	1	2012-03-05 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 14:19:32	\N	\N	1
357	T7	1	2012-03-06 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 14:22:25	\N	\N	1
358	T7	1	2012-03-08 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 14:25:06	\N	\N	1
359	T12	1	2012-03-19 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 14:30:33	\N	\N	1
360	T7	1	2012-03-19 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 14:32:48	\N	\N	1
361	T3	1	2012-03-21 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 14:36:25	\N	\N	1
362	T11	1	2012-03-21 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 14:38:38	\N	\N	1
363	T1	1	2012-03-22 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 15:45:01	\N	\N	1
364	T3	1	2012-03-27 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 15:47:59	\N	\N	1
365	T3	1	2012-03-28 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 15:48:27	\N	\N	1
366	T1	2	2012-03-29 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 15:53:26	ssdominicana	2012-05-13 15:57:36	1
367	T11	1	2012-03-29 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 16:01:02	\N	\N	1
368	T9	1	2012-03-29 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 16:04:27	\N	\N	1
369	T3	1	2012-03-29 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 16:06:27	\N	\N	1
370	T11	2	2012-03-30 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-13 16:08:09	ssdominicana	2012-05-13 16:11:14	1
371	T7	3	2012-04-02 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-13 23:06:38	\N	\N	1
372	T7	1	2012-04-03 00:00:00	0001	0002	0002	28	sgiarequipa2	2012-05-13 23:10:00	\N	\N	1
373	T2	1	2012-04-05 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-13 23:15:50	\N	\N	1
374	T3	1	2012-04-09 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-13 23:17:10	\N	\N	1
375	T4	1	2012-04-09 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-13 23:19:51	\N	\N	1
376	T7	1	2012-04-11 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-13 23:22:11	\N	\N	1
377	T7	1	2012-04-12 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-13 23:23:45	\N	\N	1
378	T7	2	2012-04-18 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-13 23:27:22	\N	\N	1
379	T11	1	2012-04-14 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-13 23:29:03	\N	\N	1
380	T8	1	2012-04-15 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-13 23:30:13	\N	\N	1
381	T1	1	2012-04-20 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-13 23:37:47	\N	\N	1
382	T4	1	2012-04-20 00:00:00	0001	0002	0002	2	sgiarequipa2	2012-05-13 23:39:24	\N	\N	1
383	T4	2	2012-04-24 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-13 23:42:03	\N	\N	1
384	T4	1	2012-04-26 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-13 23:43:22	\N	\N	1
385	T7	1	2012-04-27 00:00:00	0001	0002	0002	7	sgiarequipa2	2012-05-13 23:45:20	\N	\N	1
386	T7	1	2012-04-26 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-13 23:46:33	\N	\N	1
387	T4	1	2012-04-30 00:00:00	0001	0002	0002	1	sgiarequipa2	2012-05-13 23:47:52	\N	\N	1
388	T1	1	2012-03-30 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 13:07:40	\N	\N	1
389	T9	1	2012-03-30 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 13:10:57	\N	\N	1
390	T3	3	2012-03-30 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 13:12:34	ssdominicana	2012-05-14 13:13:44	1
391	T11	2	2012-03-31 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 13:15:28	ssdominicana	2012-05-14 13:17:26	1
392	T3	3	2012-03-31 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 13:20:47	ssdominicana	2012-05-14 13:23:50	1
393	T9	1	2012-03-31 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 13:25:43	\N	\N	1
394	T11	1	2012-04-01 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 13:30:16	\N	\N	1
395	T1	1	2012-04-01 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 13:34:20	\N	\N	1
396	T9	2	2012-04-01 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 13:44:19	ssdominicana	2012-05-14 13:48:10	1
397	T7	1	2012-04-02 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 13:52:31	\N	\N	1
398	T3	3	2012-04-02 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 13:58:25	ssdominicana	2012-05-14 14:14:22	1
399	T11	1	2012-04-04 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 14:33:54	\N	\N	1
400	T3	4	2012-04-04 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 14:36:43	ssdominicana	2012-05-14 14:49:25	1
401	T8	1	2012-04-04 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 14:43:57	\N	\N	1
402	T7	1	2012-04-04 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 16:07:07	\N	\N	1
403	T12	1	2012-04-07 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 16:11:50	\N	\N	1
404	T3	4	2012-04-09 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 16:14:36	ssdominicana	2012-05-14 16:19:49	1
405	T7	1	2012-04-14 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 16:22:02	\N	\N	1
406	T1	2	2012-04-14 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 16:26:19	ssdominicana	2012-05-14 16:29:15	1
407	T3	1	2012-04-16 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 16:31:18	\N	\N	1
408	T11	2	2012-04-16 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 16:32:58	ssdominicana	2012-05-14 16:34:07	1
409	T6	1	2012-04-16 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 16:38:04	\N	\N	1
410	T4	1	2012-04-16 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 16:40:46	\N	\N	1
411	T11	1	2012-04-17 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 16:51:38	\N	\N	1
412	T1	2	2012-05-01 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 17:00:48	ssdominicana	2012-05-14 17:00:57	1
413	T1	1	2012-05-04 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 17:04:21	\N	\N	1
414	T3	1	2012-05-04 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 17:05:52	\N	\N	1
415	T1	1	2012-05-08 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 17:12:31	\N	\N	1
416	T7	1	2012-05-08 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 17:16:59	\N	\N	1
417	T6	1	2012-01-02 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 19:21:29	\N	\N	1
418	T3	1	2012-01-02 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 19:24:16	\N	\N	1
419	T7	1	2012-01-02 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 19:29:01	\N	\N	1
420	T9	1	2012-01-02 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 19:33:09	\N	\N	1
421	T11	1	2012-01-02 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 19:35:02	\N	\N	1
422	T11	1	2012-01-03 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-14 19:37:21	\N	\N	1
423	T5	1	2012-05-17 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-17 23:50:32	\N	\N	1
424	T8	1	2012-02-20 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-18 03:56:11	\N	\N	1
425	T7	1	2012-02-21 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-18 03:58:30	\N	\N	1
426	T2	1	2012-02-22 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-18 03:59:51	\N	\N	1
427	T1	1	2012-02-24 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-18 04:01:33	\N	\N	1
428	T8	1	2011-02-09 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-18 04:04:30	\N	\N	1
429	T11	1	2012-05-11 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-18 04:26:04	\N	\N	1
430	T6	1	2012-05-14 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-18 04:29:28	\N	\N	1
431	T6	1	2012-05-17 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-18 04:29:51	\N	\N	1
432	T1	2	2012-05-15 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-18 04:31:41	SGIHuaura	2012-05-18 04:33:17	1
433	T8	1	2012-05-16 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-18 04:34:33	\N	\N	1
434	T1	1	2012-05-16 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-18 04:37:08	\N	\N	1
435	T1	1	2012-05-18 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-19 14:07:42	\N	\N	1
436	T11	1	2012-05-12 00:00:00	0001	0001	0008	\N	ssdominicana	2012-05-22 20:13:16	\N	\N	1
437	T7	1	2012-05-19 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-23 16:10:58	\N	\N	1
438	T7	1	2012-05-01 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-23 16:18:33	\N	\N	1
439	T7	1	2012-05-21 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-23 16:22:36	\N	\N	1
440	T1	2	2012-05-22 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-23 16:25:15	SGIHuaura	2012-05-23 16:27:14	1
441	T11	1	2012-05-24 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-31 14:36:27	\N	\N	1
442	T4	1	2012-05-26 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-31 14:39:09	\N	\N	1
443	T4	1	2012-05-29 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-31 14:41:09	\N	\N	1
444	T1	1	2012-05-29 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-31 14:43:05	\N	\N	1
445	T6	2	2012-05-30 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-31 14:45:02	SGIHuaura	2012-05-31 14:46:35	1
446	T1	1	2012-05-30 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-05-31 14:48:19	\N	\N	1
447	T9	1	2012-06-01 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-04 18:22:38	\N	\N	1
448	T11	2	2012-06-04 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-04 18:25:33	SGIHuaura	2012-06-04 18:28:39	1
449	T6	1	2012-06-06 00:00:00	0001	0002	0003	\N	SSOHuaura	2012-06-06 17:18:43	\N	\N	1
450	T1	5	2012-06-08 00:00:00	0001	0002	0003	\N	Visita	2012-06-08 21:49:33	SGIHuaura	2012-06-12 00:54:56	1
451	T8	1	2012-06-07 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-11 14:15:15	\N	\N	1
452	T1	3	2012-06-04 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-11 14:27:42	SGIHuaura	2012-06-12 00:44:48	1
453	T1	2	2012-06-05 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-11 14:30:12	SGIHuaura	2012-06-11 14:32:19	1
454	T7	1	2012-06-04 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-12 00:41:28	\N	\N	1
455	T1	1	2012-05-06 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-12 00:47:13	\N	\N	1
456	T1	1	2012-06-07 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-12 00:49:02	\N	\N	1
457	T7	1	2012-06-08 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-12 00:53:30	\N	\N	1
458	T6	1	2012-06-09 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-12 00:56:29	\N	\N	1
459	T6	1	2012-06-11 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-15 14:25:23	\N	\N	1
460	T9	2	2012-06-13 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-15 14:27:10	SGIHuaura	2012-06-15 14:28:20	1
461	T8	1	2012-06-14 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-15 15:01:11	\N	\N	1
462	T1	1	2012-06-14 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-15 20:19:08	\N	\N	1
463	T7	3	2012-06-05 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-15 21:25:38	SGIHuaura	2012-06-15 21:28:40	1
464	T7	2	2012-06-06 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-15 21:30:11	SGIHuaura	2012-06-15 21:31:46	1
465	T11	1	2012-06-15 00:00:00	0001	0002	0003	28	SGIHuaura	2012-06-18 18:24:35	\N	\N	1
466	T11	1	2012-06-17 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-18 18:33:20	\N	\N	1
467	T1	1	2012-06-19 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-19 21:28:55	\N	\N	1
468	T6	1	2012-06-20 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-20 20:39:32	\N	\N	1
469	T8	1	2012-06-21 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-21 16:45:41	\N	\N	1
470	T7	1	2012-06-22 00:00:00	0001	0002	0003	\N	SGIHuaura	2012-06-22 16:17:17	\N	\N	1
\.


--
-- TOC entry 2224 (class 0 OID 16939)
-- Dependencies: 248 2228
-- Data for Name: hira_incidents_details; Type: TABLE DATA; Schema: ims; Owner: stilgar
--

COPY hira_incidents_details (id_incident, nonconformity_type, status, id_type, company, country, location, description, owner_fullname, owner_email, user_create, date_create, general_status) FROM stdin;
477	3	1	1	0001	0002	0003	En la limpieza de los baños de producción se detectaron que el personal de planta continua tirando los papeles al piso y no hacen uso de los dispositivos que se les ha colocado.	Gamarra Torres, Shila	luis.meza@kr.com.pe	SGIHUAURA	2012-06-25 22:26:19	1
481	3	1	1	0001	0002	0003	El Sr. Flores Galvez se cayo en el patio de planta, lastimandose la pierna.	,	\N	SGIHUAURA	2012-07-04 17:41:40	1
484	3	1	1	0001	0002	0003	El Sr Cajas Garcia presenta quemadura en su dedo incide derecho en la etiquetadora de la linea isotonica al empujar un botella.	,	\N	SGIHUAURA	2012-07-04 17:46:04	1
488	3	1	1	0001	0002	0003	El Sr Luis  Guadalupe Hijar    presento un ligero rasguño debido a que su compañero realizo una mala maniobra en paletizado.	,	\N	SGIHUAURA	2012-07-04 17:53:37	1
490	3	1	1	0001	0002	0003	En la sala de jarabe terminado el Sr Oscar Torres Alor se cayo de la escalera subiendo al tanque de jarabe para realizar el saneamiento, golepandose la pierna.	Torres Alor, Oscar	luis.meza@kr.com.pe	SGIHUAURA	2012-07-04 18:04:14	1
497	3	1	1	0001	0002	0003	El Sr Villanueva Berrospi presento un pequeño corte en su dedo al cerrar la valvula de aire de la maquina FLOMIX en la linea 1 de produccion.	Meza Toribio, Luis	luis.meza@kr.com.pe	SGIHUAURA	2012-07-06 21:08:30	1
499	3	1	1	0001	0002	0003	Se evidencia que el vehiculo con placa Wi 9231, conducido por el Sr Lopez acompañado por el Sr Eliseo Gelvet, se encontraba estacionado internamente y al salir en forma de curva y por una mala maniobra del conductor iba a chocar con el muro parte delantera pero impacto con la otra hoja de la puerta, raspando y a la vez doblando el pin que va al suelo.	Marquez , Fernando	luis.meza@kr.com.pe	SGIHUAURA	2012-07-09 17:07:54	1
502	3	1	1	0001	0002	0003	El Sr Edgar Jamanca se resbalo en la sala de embotellado golpeandose la zona del braso y la mano.	Lopez Rosell, Edgar	luis.meza@kr.com.pe	SGIHUAURA	2012-07-12 17:35:44	1
503	3	1	1	0001	0002	0003	Se evidencia que al Sr Fernando Marquez Yataco se le escapo un tiro (disparo) de retrocarga en los vestuarios de los agentes suviser perforando un casillero y una casaca.	Portilla Quiroz, Rober	luis.meza@kr.com.pe	SGIHUAURA	2012-07-16 16:35:24	1
508	3	1	1	0001	0002	0003	El Sr Luis Lopez se lastimo su dedo con un corte pequeño al manipular unos fierros en el taller de mantenimiento.	Lopez , Luis	luis.meza@kr.com.pe	SGIHUAURA	2012-07-23 16:10:53	1
509	3	1	1	0001	0002	0003	El vehiculo YG 9777 conducido por el Sr. Manuel Oliva del transporte RYVASER choco con el pasamanos del ingreso del personal, ocasionando uque se doblara.	Azañero  Guardales, Jheison	luis.meza@kr.com.pe	SGIHUAURA	2012-07-23 16:13:05	1
510	3	1	1	0001	0002	0003	Presento un corte en el dedo de la mano derecha al coger un producto Generade, la cual habia una botella rota en dicha zona.	Muñoz Vilela, Omar	omar.munoz@kr.com.pe	SGIHUAURA	2012-07-27 14:41:40	1
517	3	1	1	0001	0002	0003	Golpe en la cabeza con el transportador en el bypass de la linea 2 y 3 de Soplado.	Pacora Vargas, Junior	luis.meza@kr.com.pe	SGIHUAURA	2012-08-03 16:33:07	1
522	3	2	1	0001	0002	0003	El Sr. Fernandez Velarde presenta un corte pequeño en el dedo al manipular materiales con vidrio.	Gamarra Torres, Shila	luis.meza@kr.com.pe	SGIHUAURA	2012-08-07 00:52:20	1
544	3	4	1	0001	0002	0003	El Sr. Muro Yauce al momento del retroceso con el montacarga, saliendo de la sala de jarabe simple, el corta viento (la cortina de plastico) se engancho con la rueda trasera del montacarga ocasionando un desvio del riel que lo sostiene.	Muñoz Vilela, Omar	omar.munoz@kr.com.pe	SGIHUAURA	2012-08-08 00:07:52	1
549	3	2	1	0001	0002	0003	Golpe con herida en el el galpon de gallos con la sierra electrica, en la construccion de jaula de gallos.	Laredo Rojas, Hector	luis.meza@kr.com.pe	SGIHUAURA	2012-08-13 16:37:40	1
555	3	2	1	0001	0002	0003	Al detectar la pantalla de isnpeccion una botella rota en el area de Produccion, el Sr Dionicio Mendoza se lastimo su mano en la zona del pulgar con un pequeño corte.	Dionicio Mendoza, Jose Orlando	luis.meza@kr.com.pe	SGIHUAURA	2012-08-16 15:08:01	1
556	3	4	1	0001	0001	0008	Personal esta realizando trabajos en el patio de maniobras de Almacén Central sin señalizacion, con riesgo de ser atropellados.	Lugo Almanzar, Faury	flugo@kolareal.com.do	ADMINISTRADOR	2012-08-20 14:16:11	1
557	3	4	1	0001	0001	0008	Se encuentra cable elétrico en mal estado debajo de Holno Temi	Lugo Almanzar, Faury	flugo@kolareal.con.do	ADMINISTRADOR	2012-08-20 16:17:34	1
558	3	2	1	0001	0002	0003	Sr. Garcia Espinoza se golpeo la pierna izquierda al pisar una canaleta sin proteccion.	Bravo Meza, Sheril	sheril.bravo	SGIHUAURA	2012-08-20 18:24:16	1
559	3	2	1	0001	0002	0003	Golpe y herida en el dedo de la mano derecha al ajustar un plastico de un trasnsportador, la cual el plastico se rompio ocasionandole la lesion en el taller de mantenimiento.	Lopez Quichiz, Luis	luis.meza@kr.com.pe	SGIHUAURA	2012-08-27 18:44:14	1
561	3	1	1	0001	0002	0003	El acercamiento al area de tratamiento de agua para la consulta al operador, al bajar las escaleras y coger el pasamos con ambas manos se produjo un resbalo de 6 gradas.	Pacherres Salinas, Freddy	freddy.pacherres@kr.com.pe	SGIHUAURA	2012-08-27 18:48:50	1
564	3	2	1	0001	0002	0003	Lesion en la mano al manipular un martillo, en la cual el martillo reboto y golpeo la mano.	Esteves Moreno, Gonsalo	luis.meza@kr.com.pe	SGIHUAURA	2012-08-28 23:38:11	1
567	3	1	1	0001	0002	0003	El Sr. Leon Romero al regreso de su descanso medico, reporta la perdida de sus implementos de trabajo que se encontraba en su casillero durante su ausencia en vacaciones.	Farro Romero, Ruben	luis.meza@kr.com.pe	SGIHUAURA	2012-09-04 22:50:48	1
577	3	4	1	0001	0001	0008	En el área de preparación de jarabe terminado se encontró que la puerta de cristal de acceso habia un extintor sosteniendo la puerta para que no se cerrara.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-07 17:43:09	1
578	3	1	1	0001	0001	0008	Personal sufre golpe en el brazo al salirse de su posición el gato que usó para el llenado con aire de la llanta delantera de la Patana.	Salvatierra Romero, Carlos	csalvatierra@kolareal.com.do	SSDOMINICANA	2012-09-07 17:53:32	1
579	3	2	1	0001	0002	0003	Se observa la presencia de cajas de preformas frente a la entrada de sala de jarabe simple.	Pashanasi del Aguila , Roller	luis.meza@kr.com.pe	SGIHUAURA	2012-09-07 20:07:22	1
580	3	2	1	0001	0002	0003	Se observa obstáculo en transito del personal hacia los servicios higienicos de produccion.	Choque Cardenas, Cledo	cledo.choque@kr,com.pe	SGIHUAURA	2012-09-07 20:11:41	1
582	3	4	1	0001	0001	0008	Durante el encofrado de las bases de las vigas del nuevo almacén de Producto Terminado, personal tercero se golpea en el hombro  con un tubo el cual era utlilizado para encajar el cuadro de varillas.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-08 12:13:32	1
670	3	2	1	0001	0002	0003	Se econtró la puerta de la oficina de Seguridad Industrial abierta y el tópico totalmente desordenado.	Roque Soto, Claudia	enfermera.huaura@kr.com.pe	SGIHUAURA	2012-10-20 16:00:10	1
585	3	4	1	0001	0001	0008	En el area de taller de carpinteria se detecto que el extintor 029(PQS)tenia el acceso obstruido,ya que apoyado sobre dicho extintor habian 4 tablas de madera y un tubo de metal.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-09 19:33:51	1
586	3	4	1	0001	0001	0008	Se encuentra operador de soplado sin hacer uso de los protectores auditivos.	Salvatierra Romero, Carlos	csalvatierra@kolareal.com.do	SSDOMINICANA	2012-09-10 13:58:14	1
588	3	4	1	0001	0001	0008	Las luces de la oficina de contabilidad y finanzas fueron detectadas encendidas en horas de la noche a las 9:40 pm,ya que al personal que labora en dicha area al parecer se les olvido apagarlas al salir de su jornada de trabajo.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-11 08:57:31	1
589	3	4	1	0001	0001	0008	En la oficina de auditoria interna estaban las luces y los aires acondicionados encendidos en horas de la noche a las 9:00 pm.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-11 09:20:09	1
601	3	1	1	0001	0002	0003	La Srta Giuliana Nuñez se lastimo su dedo indice de la mano con un pequeño corte al manipular un cutex.	Bravo Meza, Sheril	sheril.bravo@kr.com.pe	SGIHUAURA	2012-09-12 18:33:56	1
602	3	4	1	0001	0001	0008	El chofer de montacarga cesar estevez al transportar una paleta de huacal de refresco de vidrio se le cayeron  dos huacale y al recoger se acasiono uu leve rasguño en el dedo mayor de la mano izquierda .	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-13 10:04:10	1
603	3	4	1	0001	0001	0008	El trabajador de taller de transporte Nicolas Bello paso por el lado de un bonete de un vehiculo y se ocasiono una herida en el dedo mayor de la mano izquierdsa.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-13 10:51:30	1
604	3	4	1	0001	0001	0008	Se encontraron luces encendidas en el area de oficina de contabilidad y finanzas a las 10:00 pm de la noche.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-14 04:06:28	1
605	3	4	1	0001	0001	0008	Se encontraron luces encendidas en el area de la impresora ubicada en las oficinas administrativas.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-14 04:25:46	1
608	3	4	1	0001	0001	0008	El montacargista Aldo Cabreja mientras cubria un turno en la maquina sopladora de linea 3,procedio abrir una caja de preformas y se causo una pequeña herida en el dedo pulgar de la mano izquierda.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-14 04:58:10	1
609	3	1	1	0001	0002	0003	Se observo la caida de 2 paletas sobre la  oficina de Alamacen de Producto Terminado, ocasionado por el montacarga LINDE 2.	Rojar Cruces, Alfonso	alfonso.rojas@hotmail.com.pe	SGIHUAURA	2012-09-14 20:19:35	1
611	3	4	1	0001	0001	0008	El TRABAJADOR BLAS ANTONIO DE LA CRUZ CAPELLAN AL SACAR UNA BOTELLA DE VIDRIO DEL HUACAL SE OCASIONO UNA HERIDA EN EL DEDO INDICE DE LA MANO DERECHA.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-15 03:17:50	1
617	3	4	1	0001	0001	0008	A EL JOVEN ERICK LE PICO UNA ABEJA EN LA OREJA DERECHA.	Reynoso , Filiberto	freynoso@kolareal.com.do	SSDOMINICANA	2012-09-17 05:13:16	1
618	3	4	1	0001	0001	0008	En la llenadora de linea 5 el operador Javier Bueno al manipular una llave y opretar una de las rocas dicha llave le falceo ocasionandole una herida leve en el dedo indice de la mano derecha.	Reynoso , Filiberto	freynoso@kolareal.com.do	SSDOMINICANA	2012-09-17 05:28:32	1
622	3	4	1	0001	0001	0008	El empleado Charle Javier Gerez(operador de flomix calidad)se entia mareado y no sabia el verdadero motivo del malestar.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-18 03:24:02	1
627	3	4	1	0001	0001	0008	El sr Domingo Thomas reporto que el dia de hoy 19/09/2012.mientras realizaba la activacion de una llave en el tablero de la encajonadora este sintio una pequeña descarga electrica.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-20 04:11:48	1
628	3	1	1	0001	0002	0003	El Sr. Dionicio Mendoza presento un roce en la parte posterior del torax lado izquierdo, superficial, no sangrante.	Freyre Solano, Augusto	medico.ocupacional@kr.com.pe	SGIHUAURA	2012-09-20 18:37:22	1
629	3	1	1	0001	0002	0003	La Srta Katherine Caceres presento contusion superficial no sangrante por compresion contra la puerta de ingreso al laboratorio de Investigacion y  Desarrollo.	Freyre Solano, Augusto	medico.ocupacional@kr.com.pe	SGIHUAURA	2012-09-20 18:38:20	1
633	3	1	1	0001	0002	0003	El Sr. Neil Giron Espinoza sufrio contusion en el 2º y el 3º dedo de la mano izquierda por compresion al manipular un rollo de etiquetas.	Freyre Solano, Augusto	medico.ocupacional@kr.com.pe	SGIHUAURA	2012-09-21 14:28:05	1
639	3	1	1	0001	0002	0003	Se evidencia goteo del techo de Almacen de Azucar al manipular una tuberia por error.	Arellano Leon, Andre	andre.arellano@kr.com.pe	SGIHUAURA	2012-09-27 19:10:13	0
641	3	2	1	0001	0002	0003	El Sr. Higilio Leiva Diaz presenta un corte en la zona del pulgar de la mano derecha al manipular una botella en la lavadora.	Chavez  Cervantes, Karla	medico.ocupacional@kr.com.pe	SGIHUAURA	2012-09-28 14:31:05	1
652	3	4	1	0001	0001	0008	Personal chofer de patana es detectado subido arriba de la cola de la patana buscando señal en su celular.	Reynoso Núñez, Filiberto	freynoso@kolareal.com.do	SSDOMINICANA	2012-10-05 00:47:56	1
655	3	4	1	0001	0001	0008	EL SEÑOR ANTONY ESPINAL AL MOMENTO DE PASAR POR DEBAJO DE LA LINEA DE VIDRIO EN AREA DE LLANADO PUSO LA MANO EN EL SUELO Y SE PROBOCO UNA LEVE HERIDA EN EL DEDO INDICE DE LA MANO IZQUIERDA.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-10-05 18:16:33	1
657	3	4	1	0001	0001	0008	EL SR VICTOR PERALTA SE OCASIONO UNA LEVE HERIDA EN EL DEDO MAYOR DE LA MANO DERECHA AL EXTRAER UNA BOTELLA ROTA DE LA LINEA DE VIDRIO.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-10-12 02:29:25	1
658	3	4	1	0001	0001	0008	EL SR MAXIMO ANTONIO REYES CHOFER DE MONTACARGA SE SENTIA MAREADO Y CON DOLOR DE CABEZA.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-10-12 02:40:58	1
659	3	4	1	0001	0001	0008	EL S.R ROBERTO DE JESUS JAQUEZ PIMENTEL FUE DETECTADO CONDUCIENDO UN MONTACARGA SI EL USO DE CINTURON DE SEGURIDAD,MOTIVO POR EL CUAL FUE AMONESTADO.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-10-14 06:08:53	1
666	3	1	1	0001	0002	0003	Al promedia las 10:00 horas, se realizaba la inspección inopinada al personal operador del proceso de etiquetado, en donde se evidenció al Sr.Cajas Garcia DORMITANDO en su silla asignada, haciendo incumplimiento así con el Reglamento Interno de Trabajo.	Meza  Toribio, Luis	luis.meza@kr.com.pe	SSOHUAURA	2012-10-19 23:30:34	0
667	3	1	1	0001	0002	0003	Al promediar las 10:00 hrs. se procedía a realizar la inspección inopinada a los operadores del proceso de etiquetado,evidenciando al Sr. Cajas Garcia DORMITANDO en su silla asignada, durante la  jornada laboral, incumpliendo asì con el RIT.	Meza Toribio, Luis	luis.meza@kr.com.pe	SSOHUAURA	2012-10-19 23:37:47	0
672	3	4	1	0001	0001	0008	la persona al momento de mover una bobina se machaco el dedo miñique de la mano derecha.	mercado Núñez, miguel	mmercardo@kolareal.com.do	SSDOMINICANA	2012-10-21 03:14:53	1
675	3	4	1	0001	0001	0008	El trabajador José de Jesus Peña estaba operando la llenadora de linea 5 cuando fue a hechar las tapas uno de los transportadores le ocacionó un rasguño en su espalda.	Reynoso Núñez, Filiberto	freynoso@kolareal.com.do	VISITAS	2012-10-24 20:12:27	1
677	3	1	1	0001	0001	0008	DURANTE LA INSPECCION DE UN TRABAJO QUE SE ESTABA REALIZANDO SE AMONESTO AL SR.GREGORIO COTALMA POR NO USAR EL CASCO DE SEGURIDAD.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-10-27 19:59:05	1
678	3	4	1	0001	0001	0008	DURANTE LAS INSTALACIONES DE LAS TUBERIAS PARA CONDUCIR EL GAS DE LA CISTERNA ANAEROBIO.EL SR JUAN PABLO RAMOS PISO EN FALSO ENTRE DOS BOLLAS Y ESTUVO A PUNTO DE CAER AL AGUA.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-10-28 22:31:19	1
685	3	1	1	0001	0001	0008	EL SR. RAMON E. ESPINAL SE OCASIONO UNA LEVE HERIDA EN EL DEDO MAYOR DE LA MANO DERECHA AL MANIPULAR UNA PIEZA DE LA LLENADORA LINEA 1,CUANDO SE LE ESTABA DANDO MANTENIMIENTO.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-11-04 17:01:08	1
686	3	4	1	0001	0001	0008	EL SR SANTO ORTEGA,SE ACASIONO UNA LEVE HERIDA EN EL DEDO ANULAR DE LA MANO IZQUIERDA.AL CERRAR LA PUERTA DE  LA PATANA QUE DICHA PERSONA CONDUCE.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-11-07 10:33:13	1
695	3	2	1	0001	0002	0003	En dirección a las oficinas de Comunicaciones, en las escaleras sufri un resbalon a consecuencia de exceso de cera.	Torres Alegría, Karen	comunicaciones.huaura@kr.com.pe	SGIHUAURA	2012-11-07 14:58:16	1
702	3	2	1	0001	0002	0003	El tecnico informa que se golpio la pierna  con la tuberia al momento de estar realizando trabajo en la lavadora de botellas de la linea 1.	Medina Palma, Paulo	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-09 21:58:02	1
703	3	2	1	0001	0002	0003	El personal indica que durante el trabajo de verificacion en la sala de fuerza, procedio a levantar una tapa la cual se resvalo y cayo produciendole al operario un pequeño raspon en el antebrazo.	Esteves Moreno, Juan Gonzalo	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-10 18:00:35	1
705	3	2	1	0001	0002	0003	El personal de la línea de producción 1, se encontraba manipulando botellas de vidrio de la parihuela hacia el transportador neumático, cayendo varias botellas al piso.	Parientes Sánchez, Deyvi Alan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-12 15:34:53	1
709	3	1	1	0001	0001	0008	El trabajador Carlos Brito que trabaja en el área de preselección al sujetar una botella de vidrio siendo esta botella una merma de linea 4 (Vidrio) se ocacionó una herida leve en el dedo mayor de su mano derecha.	Reynoso Núñez, Filiberto	freynoso@kolareal.com.do	VISITAS	2012-11-15 13:14:43	1
710	3	4	1	0001	0001	0008	El trabajador Carlos Brito que trabaja en el área de preselección al sujetar una botella de vidrio siendo esta botella una merma de linea 4 (Vidrio) se ocacionó una herida leve en el dedo mayor de su mano derecha.	Reynoso Núñez, Filiberto	freynoso@kolareal.com.do	VISITAS	2012-11-15 13:14:48	1
719	3	2	1	0001	0002	0003	El personal menciona que se encontraba realizando trabajo de mantenimiento en el taller, descascarando la pintura de la carcasa de un motor con la espátula, cuando se golpeo el dedo pulgar de la mano izquierda provocándose un pequeño corte.	Civico Rosales, Joel	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-21 00:22:26	1
724	3	2	1	0001	0002	0003	El Sr. indica que se encontraba por el acceso de planta a la línea 3 (persianas de ingreso), un montacargas paso rápidamente.	Gurgura Pichilingue, Hernan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-22 23:07:30	1
725	3	2	1	0001	0002	0003	El Sr. se encuentra operando la etiquetadora.	Moreno Tuanama, Fidel	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-22 23:11:34	1
727	3	2	1	0001	0002	0003	EL operador comunico que se encontraba, realizando limpieza de la línea 1 cuando se golpeo la mano en  un lado del transportador provocándose una pequeña herida en el dedo pulgar de la mano izquierda.	Villalobos Ibañez, Cesar	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-23 00:47:19	1
736	3	2	1	0001	0002	0003	El personal se encontraba realizando trabajo de mantenimiento cuando se provoco una pequeña herida el dedo pulgar   .	Castillo Padilla, Martin	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-27 00:41:20	1
737	3	2	1	0001	0002	0003	Se observo a la hora de refrigerio en el taller de mantenimiento, 4 amoladoras conectadas al tomacorriente.	Medrano Vega , Fernando	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-28 22:05:14	1
745	3	2	1	0001	0002	0003	El personal se raspo la espalda.	Salvador Grados, Alejandro	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-30 23:46:29	1
760	3	4	1	0001	0001	0008	SE ENCUENTRA PERSONAL TERCERO ENCIMA DE TECHO DE PREFORMAS REALIZANDO TRABAJO SIN AUTORIZACION DEL DEPARTAMENTO DE SEGURIDAD INDUSTRIAL/n	mercado nuñez, miguel	mmercado@kolareal.com.do	SSDOMINICANA	2012-12-08 18:34:41	1
765	3	4	1	0001	0001	0008	SE ENCUENTRA PERSONAL TERCERO SOBRE MOTOR AIRADOR NO. 7 SIN EL USO DE CHALECO SALVAVIDAS/n	Mercado Nuñez, Miguel	mmercado@kolareal.com	SSDOMINICANA	2012-12-09 16:05:40	1
767	3	4	1	0001	0002	0003	El colaborador indico que se perdio un ciento de bolsas de basura del area de almacen, a la hora que se retiro a su almuerzo.	Torres Grados, Jose Antonio	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-11 22:38:18	1
779	3	4	1	0001	0002	0003	Se observa estructura que protege el almix en sala de jarabe que es inestable.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-18 20:19:29	1
781	3	4	1	0001	0002	0003	El operador informa que se estravio la llave del montacarga toyota 3.	De La Cruz Cierto, Wiliam	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-18 20:42:05	1
782	3	2	1	0001	0002	0003	Se observo que una paleta de agua 2.5 Lt. estaba tirada en el el area d ealmacen	,	\N	SSOHUAURA	2012-12-24 21:40:14	0
783	3	4	1	0001	0002	0003	Se observo que una paleta de agua 2.5 Lt. estaba tirada en el el area d ealmacen	Ingol Tarazona, Alex	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-24 21:40:53	1
784	3	4	1	0001	0002	0003	El operador se encontraba echando lubricante al transportador de botellas de la línea 1, salpicándole lubricante en los ojos.	Marcos Azabache, Miguel	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-26 14:04:26	1
785	3	1	1	0001	0001	0008	EL SR.KENNY RODRIGUEZ SE ACASIONO UNA LEVE HERIDA EN EL DEDO MAYOR DE LA MANO DERECHA AL MOMENTO DE SACAR UNA BOTELLA ROTA DE LA LINEA DE VIDRIO.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-12-27 17:40:39	1
786	3	1	1	0001	0001	0008	El Sr.Rey Osoria al momento de pasar por debajo de un transportador en linea de vidrio se causo una una leve herida en la espalda	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-12-27 17:43:15	1
790	3	4	1	0001	0002	0003	El Sr. informa que se resvalo al recoger una botella y se golpeo el dedo pulgar de la mano izquierda, en la pantalla de LP3./n	Prada Collantes, Yonathan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-28 21:36:36	1
791	3	4	1	0001	0002	0003	EL personal de SSO, se enconttraba lavado botellas de 250ml manualkmente y se raspo el dedo medio de la mano derecha.	Grados Echegaray, Hertor	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-28 22:48:58	1
794	3	4	1	0001	0002	0003	El operador indica que se golpeo el antebrazo, en LP1 al momento de relizar trabajo de encajonado.	Dionicio Mendoza, Jose	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-05 13:55:13	1
795	3	4	1	0001	0001	0008	Durante el proceso de soldadura de la malla de la escalera de la oficina de producción se produjo un conato de incendio debido a que las chispas generadas cayeron en una lata que contenía thiner, dejada un día antes por el personal que había pintado la escalera./nÉsta actividad tenía su permiso de trabajo en caliente (soldadura).	Reynoso Núñez, Filiberto	freynoso@kolareal.com.do	SSDOMINICANA	2013-01-07 22:56:06	1
815	3	4	1	0001	0001	0008	EL S.R EDUARDO LECLER AL MOMENTO DE LEVANTAR UN PAQUETE DE REFRESCO PROXIMO A PALETIZADORA LINEA-3 RESBALO Y SE LE ACASIONO UN LEVE DOLOR EN LA MUÑECA DERECHA.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2013-01-10 00:44:35	1
816	3	4	1	0001	0001	0008	DURANTE LA LIMPIEZA DEL AMBIENTE DE VOLTEO DE AZUCAR,SE DETECTO QUE EL PERSONAL LE HECHA AGUA A DISPOSITIVO ELECTRICO(ABANICO).	Salvatierra Romero, Carlos	csalvatierra@kolareal.com.do	SSDOMINICANA	2013-01-10 00:59:03	1
819	3	4	1	0001	0001	0008	EL OPERADOR DE EMPACADORA LINE -5 PEDRO CHAVEZ PARA QUE NO SE LE TRANCARA LA MAQUNA FUE A SACAR UNA BOTELLA QUE ESTABA ATASCADA Y AL REUBICARLA  SE DIO UN GOLPE OCASIONANDOSE UNA LEVE HERIDA EN DEDO INDICE DE LA MANO IZQUIERDA.	Reynoso Nuñez, Filiberto	freynoso@kolareal.com.do	SSDOMINICANA	2013-01-10 01:38:18	1
825	3	2	1	0001	0002	0003	El Sr. presento problemas de repiracion al estar realizando trabajo de paletizado	Berrospi Delgado, Freddy	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-11 00:05:01	0
833	3	4	1	0001	0002	0003	Se siente precencia de ozono en sala de pruccion cion en la fabricacion de agua cielo de 7 litros.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-13 12:18:00	1
834	3	4	1	0001	0001	0008	El S.R SANDY BAEZ AL MOMENTO DE EXTRAER UNA BOTELLA QUE SE ATASCO EN LA ETIQUIETADORA DE LINEA 1,SE OCASIONO UNA LEVE HERIDA EN EL DEDO INDICE DE LA MANO IZQUIERDA.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2013-01-14 18:58:29	1
840	3	4	1	0001	0002	0003	El Op. indica que le solicitaron realizar una práctica que no esta contemplada dentro de los procedimientos operacionales y no cumple con los lineamientos de seguridad negándose a realizarla. (Lavado con soda caliente la llenadora de la línea isotónica)	Camones Cueva, Edson	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-16 20:54:55	1
841	3	4	1	0001	0002	0002	El día 16/01/2013 a las 10:00 hrs. el Sr. Julio Chino se encontraba acumulando botellas vacías de vidrio en la zona de entrada de botellas a la lavadora, cuando al manipular las botellas sintió un hincón, sintiendo dolor y saliéndole sangre.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-01-16 22:25:14	1
842	3	4	1	0001	0001	0008	El señor Antony Espinal se ocasionó una leve herida en la parte frontal de la pierna izquierda con una pata defectuosa de la silla donde pantallaba en el momento que fue a pararse de esta.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2013-01-16 23:30:37	1
843	3	4	1	0001	0001	0008	El señor Elvis Peña se ocasionó una leve herida con la faja metálica transportadora, cuando procedió a parar o levantar una botella en la empacadora de línea No.3.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2013-01-16 23:41:00	1
844	3	4	1	0001	0002	0002	El día 16/01/2013 a las 20:40 horas el montacarguista Eulogio Locumber posicionó mal el tote de botellas al elevador de totes, ocasionando la mala caída del tote a la tolva de botellas.	Noa Santander, Eduardo	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-01-18 02:48:59	1
845	3	4	1	0001	0002	0002	A las 05:45 hrs el Sr. Ángel Huamani comunicó al Sr. Rodrigo Potosino que se habían caído 3 palets de Sabor de Oro 2650 mL, que se había caído minutos antes.	Potosino Romin, Rodrigo	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-01-18 02:54:35	1
848	3	4	1	0001	0001	0008	EL SR.MIGUEL RODRIGUEZ SE OCASIONO UNA LEVE HERIDA EN EL DEDO PULGAR DE LA MANO DERECHA CUANDO PROCEDIO A SACAR UNA BOTELLA ROTA DEL TRANSPORTADOR EN LINEA DE VIDRIO.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2013-01-18 17:57:27	1
849	3	4	1	0001	0001	0008	SE DETECTO AL OPERADOR ROBERT LUCIANO REALIZANDO UNA SOLDADURA SIN EL USO DE MASCARILLA DE PROTECCION NASAL.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2013-01-18 17:59:29	1
850	3	4	1	0001	0001	0008	EL SR FELIX CANDELARIO PERSONAL TERCERO DE LA COMPAÑÍA LINEA CLAVE FUE DETECTADO DURMIENDO MIENTRAS SE REALIZABA EL PROCESO DE DESCARGA DE GAS NATURAL LIQUIDO.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2013-01-18 18:01:06	1
852	3	4	1	0001	0002	0003	El Sr. se encontraba realizando trabajo de mantenimiento en la RINSER (MESAL ER 50), colocando los soportes del sujetadro de botellas golpiandoce la mano y	Espinoza Bravo, Javier	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-19 14:07:13	1
853	3	4	1	0001	0002	0003	El Sr. se encontraba cortando cinta con una navaja (Herramienta hechiza) cortandose ligeramente el dedo ligeramente.	Guadalupe Hijar, Luis	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-19 14:10:32	1
854	3	4	1	0001	0001	0008	Mientras descargaban gasoil del camión al tanque de almacenamiento la manguera en la conexión que está en el camión se desconectó lo que ocasionón un leve derramamiento de combustible, aproximadamente se derramó 4 galones.	Reynoso Núñez, Filiberto Antonio	freynoso@kolareal.com.do	SSDOMINICANA	2013-01-20 02:11:49	1
857	3	4	1	0001	0001	0008	EL SR.GREGORIO COTARMA AL MOMENTO DE CORTAR UN TUBO SE LE RESBALO LA MAQUINA MOLADORA CAUSANDOLE UNA LEVE LACERACION EN EL DEDO PULGAR DE LA MANO IZQUIERDA.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2013-01-23 22:48:15	1
858	3	4	1	0001	0002	0003	Estaba realizando la operacion de paletizado en la Linea 1 (encaje), cuando jala la paleta cayendo esta sobre su pie izquierdo (especificamente en su dedo pulgar) generandole hinchazon y amoratamiento de la parte afectada.	Berrospi Delgado, Freddy Jesús	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-24 01:06:21	1
860	3	4	1	0001	0002	0003	Manipulando la llave 1/2" para regular el transportador de la linea 3 se realizó un pequeño corte en el dedo índice de la mano izquierda.	Fernandez Velarde, José	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-24 01:14:29	1
863	3	4	1	0001	0002	0003	El personal de línea cruzó debajo del transportador de manera impudente al momento que cruzaba el montacarga, pudiendo ocasionar un accidente.	CORONEL SANCHEZ, JOSE	sheril.bravo@kr.com.pe	SGIHUAURA	2013-01-24 22:21:13	1
864	3	4	1	0001	0001	0008	SE DETECTÓ UN CRISTAL CON PRESENCIA DE VIBRACIÓN EN LA UNION EN LA OFICINA DEL ENCARGADO DE NOMINA EL SR. KELVIN ESPINAL.	Espinal  Generes, Idelfonso	iespinal@kolareal.com.do	SSDOMINICANA	2013-01-25 02:25:26	1
867	3	4	1	0001	0001	0008	EL SEÑOR CHARLE JEREZ, AL SACAR BOTELLAS DE LOS TRANSPORTADORES  DE LA LLENADORA DE LINEA 5 PARA HACERLE LA PRUEBA DE TORQUE SE OCACIÓ UN LEVE RESGUÑO EN EL DEDO MIÑIQUI DE LA MANO DERECHA.	Reynoso Núñez, Filiberto Antonio	freynoso@hotmail.com	SSDOMINICANA	2013-01-26 06:55:03	1
868	3	4	1	0001	0001	0008	EL SEÑOR AMADO FERNANDEZ EN MOMENTOS QUE SE DEDICABA A FLEJAR UNA PALETA DE REFRESCO UN COMPAÑERO LE OCACIONÓ UNA LEVE LACERACION EN LA FRENTE CUANDO ESTE FUE A COLOCAR UN SEPARADOR.	ESPINAL  GENERE, IDELFONZO	IESPINAL@KOLAREAL.COM	SSDOMINICANA	2013-01-26 06:58:28	1
871	3	4	1	0001	0002	0003	Linea 1 - Operacion Encajonado:/nSe percata de una botella rota, procede a retirarla sin darse cuenta de un fragmento punzocortante en la parte interna (de la botella rota) que le origina un corte en el dedo medio de la mano izquierda.	Ramos Silva, Javier	sheril.bravo@kr.com.pe	SSOHUAURA	2013-01-29 00:51:01	1
873	3	4	1	0001	0002	0003	AL MOMENTO DE COGER UNA ESCOBA PARA HACER LIMPIEZA DEL AREA DE TRABAJO, NO SE PERCATÓ QUE HABÍA UN FRAGMENTO DE VIDRIO IMPREGNADO EN EL MANGO DE LA ESCOBA QUE LE OCASIONÓ UN PEQUEÑO CORTE EN EL DEDO MEDIO DE LA MANO DERECHA.	Alor Anselmo, Luis Alberto	sheril.bravo@kr.com.pe	SSOHUAURA	2013-01-29 21:26:17	1
878	3	4	1	0001	0001	0008	EL SEÑOR EUDYS TORRES, MIENTRAS REALIZABA UNA OPERACIÓN DE MANTENIMIENTO SE RASGUÑÓ EL DEDO INDICE DE LA MANO DERECHA .	Reynoso Nuñez, Filiberto	freynoso@kolareal.com.do	SSDOMINICANA	2013-02-02 23:44:03	1
879	3	4	1	0001	0001	0008	EL.S.R. RUBEN ORTIZ SE OCASIONO UNA LEVE HERIDA EN EL DEDO MAYOR DE LA MANO IZQUIERDA  EN EL MOMENTO QUE FUE A MOVER EL ABANICO DEL HORNO EN LA EMPACADORA DE LINEA-5	Espinal Genere., Idelfonzo	iespinal@kolareal.com	SSDOMINICANA	2013-02-04 04:37:43	1
880	3	4	1	0001	0001	0008	EL.SR.CARLOS ALMONTE SE OCASIONO UNA LEVE HERIDA EN EL DEDO PULGAR DE LA MANO IZQUIERDA CUANDO PROCEDIO A EXTRAER UN PEDAZO DE VIDRIO DEL TRANSPORTADOR DE LINEA -4	Espinal Genere, Idelfonzo	iespinal@kolareal.com	SSDOMINICANA	2013-02-05 06:33:55	1
883	3	4	1	0001	0002	0003	El Sr. Max Martinez Sanchez, se realizó un pequeño corte en el dedo pulgar (mano izquierda) al rozar accidentalmente con una botella rota, cuando se encontraban acomodando las cajas con botellas vacías.	Martinez Sanchez, Max Rodrigo	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-02-05 16:03:47	1
886	3	1	1	0001	0002	0003	Mientras realizaba la inspección de condiciones inseguras en la casa de fuerza, tropecé y me golpeé la parte superior de la cabeza con una tubería, sin embargo el casco amortiguó el golpe y no me paso nada.	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-02-08 00:00:00	0
893	3	4	1	0001	0002	0003	Se realizaba labores de saneamiento de linea 1, cuando el personal de limpieza de lavadora san martín vierte agua con soda caustica que entró por los zapatos ocasionándole irritación (quemadura leve) en los pies	Martinez Sanchez, Max	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-02-13 04:25:01	1
924	3	4	1	0001	0002	0003	Se observa personal de la empresa de transporte el dorado fumando dentro de planta.	Parientes Sanchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-02 23:37:22	1
925	3	4	1	0001	0001	0008	CUANDO EL S.R JAIRO OSORIA SE DEDICABA HACER UNA MEZCLA DE CEMENTO AL LEVANTAR UNA FUNDA ESTA SE ROMPIO,LO QUE PROVOCO QUE AL SEÑOR LE SALPICADA DE DICHO CEMENTO EN LOS OJOS.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2013-03-03 00:58:34	1
930	3	4	1	0001	0001	0008	RAFAEL PEREZ SE OCASIONO UNA LEVE HERIDA EN EL DEDO PULGAR DE LA MANO IZQUIERDA CON LA PARTE FILOSA DE LA CANALETA DEL CABLEADO ELECTRICO CUANDO FUE A SACAR UNA BOTELLA EN LA PALETIZADORA DE LINEA-1.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2013-03-06 01:58:33	1
932	3	4	1	0001	0002	0003	Se encontró a el chofer de la empresa EL DORADO, fumando un cigarrillo, dentro de su cabina del trailer de carga.	guerrero peralta, janssen	janssen.guerrero@kr.com.pe	SSOHUAURA	2013-03-06 14:03:12	1
934	3	1	1	0001	0002	0003	Mientras realizaba lavado de válvulas en la Llenadora L5, un compañero cerro accidentalmente la puerta golpeando mi dedo meñique derecho.	Sal G, Alejandro	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-03-08 00:49:41	0
935	3	4	1	0001	0002	0003	Fuga de amoniaco por mala operación del sistema de refrigeración del flomix de la linea Nº3	Parientes Sanchez, Deyvi	janssen.guerrero@kr.com.pe	SSOHUAURA	2013-03-08 13:49:50	1
938	3	4	1	0001	0002	0003	Pase por debajo de la linea transportadora de botella PET sin darme cuenta mi polo se engancho y se rompió originándome un raspadura en la espalda.	Dionicio Mendoza, Jose	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-03-08 18:40:36	1
939	3	4	1	0001	0002	0003	Fui a verter la caja con botellas rotas al deposito de basura, sin darme cuenta que en la base de la caja había un pedazo de vidrio roto la cogí y termino cortándome el dedo.	Cabanillas Urbano, Sandro	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-03-08 18:42:22	1
941	3	4	1	0001	0002	0003	El personal al manipular una botellas que se encontraba trabada en el transportador neumático se provoco un pequeño corte en el dedo.	Garcia Requena, Pedro	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-12 00:47:50	1
1050	3	4	1	0001	0001	0008	DURANTE LA INSPECCIÓN SE DETECTA A PERSONAL DE MANTENIMIENTO EN LA SALA DE CLARIFICADO SIN HACER USO DE PROTECCIÓN AUDITIVA./n	Salvatierra Romero, Carlos	csalvatierra@kolareal.com.do	ADMINISTRADOR	2013-03-19 00:00:00	1
1051	3	4	1	0001	0001	0008	DURANTE LA INSPECCIÓN SE DETECTA PERSONAL OPERADOR   DE CLARIFICADO SIN HACER USO DE PROTECCIÓN AUDITIVA./n	Salvatierra Romero, Carlos	csalvatierra@kolareal.com.do	ADMINISTRADOR	2013-03-19 00:00:00	1
946	3	4	1	0001	0002	0002	El día de hoy se observo que el personal operador de montacargas de producción al momento de apilar los totes, han dañado una de las canaletas aéreas, por dónde pasa el cableado de alta tensión de la planta de jugos.	Llave Pinto, César	cesar.llave@kr.com.pe	SGIAREQUIPA2	2013-03-19 19:18:27	1
949	3	1	1	0001	0001	0008	Se detecta que el operador de soplado de la LP06 realiza la limpieza (recoger preformas) debajo de la tolva de carga de preformas, con la tolva suspendida (posición de descarga).	Salvatierra Romero, Carlos	csalvatierra@kolareal.com.do	SSDOMINICANA	2013-03-20 11:24:19	0
1057	3	4	1	0001	0001	0008	Se detecto operador de montontacarga sobre pasando el nivel máximo permitido./nLa operación es carga del producto en el almacén./n	Espinal Generes, Idelfonso	iespinal@kolareal.com.do	ADMINISTRADOR	2013-04-02 00:00:00	1
961	3	4	1	0001	0002	\N	Mientras estaba encajonando en la Linea 01, a uno de mis compañeros se le rompe la botella proyectando vidrio y gaseosa que me cae en el ojo izquierdo provocandome fastidio.	Civico Eder, Espinoza	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-04-02 23:58:29	1
1003	3	4	1	0001	0002	0003	Aprox. 16:15 se encuentra al personal de C&F laborando dentro de las instalaciones sin su respectivo permiso de trabajo. Dicho evento se presenta en el área del Ex-Taller de Soldadura. AI: Se paralizan los trabajos y se da reporte al área de Mtto mediante informe SGI N°61	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-04-04 00:00:00	1
963	3	1	1	0001	0002	0003	Al estar acomodando la botellas del transportador, paradao en la plataforma piso en falso al estirarme y me raspo el pecho y rompo mi polo.	,	\N	SSOHUAURA	2013-04-05 13:36:53	0
964	3	4	1	0001	0002	0003	Al estar acomodando la botellas del transportador, paradao en la plataforma piso en falso al estirarme y me raspo el pecho y rompo mi polo.	Espinoza Salvador, Leonel	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-04-05 13:37:26	1
996	3	4	1	0001	0002	0003	Realizando limpieza en sala de jarabe terminado, le salpico liquido en el ojo.	Oscate Inocente, Roberto	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-04-13 00:00:00	1
1006	3	4	1	0001	0002	0003	Realizando el abastecimiento de botellas en LP01 (botellas nuevas) no me percate que se habían roto unas botellas que terminaron haciéndome un pequeño corte en la mano izquierda.	Rocano Cruz, Ronald Benji	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-04-15 00:00:00	1
999	3	4	1	0001	0002	0003	Se observa que el personal de la linea de vidrio, no cuenta con lentes de seguridad.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-04-18 00:00:00	1
977	3	4	1	0001	0002	0002	Al momento de hacer mi primera inspección del día al promediar las 07:15 encontré al montacarga Linde 3 estacionado en la zona de almacén de azúcar obstaculizando la vía de transito de los montacargas, viéndose obligados los operadores de montacargas a invadir por completo la vía peatonal para que puedan transitar.	Llave Pinto, César	cesar.llave@kr.com.pe	SGIAREQUIPA2	2013-04-19 18:20:07.39	1
979	3	4	1	0001	0002	0002	Al promediar las 14:35 horas hubo un movimiento sísmico en la cual el personal tubo que acudir a la zona segura del patio de Planta de Jugos, encontrándola obstaculizada con totes almacenados en plena zona segura./nEn el patio Principal parte superior también  se encontró exceso de pallets con producto invadiendo casi toda la zona segura, además en la parte inferior del patio se encontraba un camión descargando productos en las únicas zonas seguras que habían libres.	Llave Pinto, César	cesar.llave@kr.com.pe	SGIAREQUIPA2	2013-04-19 19:00:42.513	1
990	3	4	1	0001	0002	0002	El Sr. Emilio Pacompia Parillo al iniciar sus labores de limpieza en los servicios higiénicos, ubicados al costado de la Of. de Bienestar Social, encontró un gancho de una carpeta acrílica dentro del water.	Llave Pinto, César	cesar.llave@kr.com.pe	SGIAREQUIPA2	2013-04-27 00:00:00	1
1094	3	4	1	0001	0001	0008	El señor Franklin estevez al momento de sacar el sello rascador del pistón,este se ocasiono una leve laceracion en el dedo pulgar derecho al hacer contacto con una parte filosa de dicho piston	Estevez , Franklin	\N	ADMINISTRADOR	2013-05-02 00:00:00	1
1085	3	4	1	0001	0001	0008	Se detecto a operador de paletizador automático con herramienta artesanal.	Salvatierra Romero, Carlos	Rsalvatierra@kolareal.com.do	ADMINISTRADOR	2013-05-05 00:00:00	1
1086	3	4	1	0001	0001	0008	Se detecta cilindro de acetileno fuera de la jaula de almacenamiento de cilindro.	Salvatierra , Carlos	csalvatierra@kolareal.com.do	ADMINISTRADOR	2013-05-05 00:00:00	1
1087	3	4	1	0001	0001	0008	Se detectaron cilindro de GLP dejados en la rampa de carga de producto terminado.	Salvatierra , Carlos	csalvatierra@kolareal.com.do	ADMINISTRADOR	2013-05-05 00:00:00	1
1083	3	4	1	0001	0001	0008	El señor fulvio quiñones se ocaionó una herida en el dedo mayor de la mano derecha cuando procedió a cambiar un molde en la sopladora linea 2, la llave se les rebaló ocasionando que la mano hiciera contacto con la parte filosa del molde.	Espinal , Idelfonzo	Iespinal@kolareal.com.do	ADMINISTRADOR	2013-05-06 00:00:00	1
1084	3	4	1	0001	0001	0008	Juan carlos Encarnación al momento de encender el selector de amoniaco, esté inhalo dicho producto quimico al presentar una leve en equipo (flomix).	Espinal , Idelfonzo	Iespinal@kolareal.com.do	ADMINISTRADOR	2013-05-06 00:00:00	1
1037	3	4	1	0001	0002	0003	En el patio frente APT se observa desordenano.	Parientes , Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-06 00:00:00	1
1036	3	4	1	0001	0002	0003	El Sr. comunica que se resbalo y segolpio el brazoal momento de bajar las escaleras.	Purizaga , Erick	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-08 00:00:00	1
1042	3	1	1	0001	0002	0003	Se reporta que el espejo del LINDE 1 esta roto.	,	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-09 00:00:00	1
1040	3	1	1	0001	0002	0002	A horas 1:10am se cayeron y se rompieron 4 cajas de KR negra en formato de vidrio 300ml cuando el Sr. Sandro Vilca colocaba un pallet de gaseosa en la ventana de produccion y almacen APT.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-05-10 00:00:00	1
1081	3	4	1	0001	0001	0008	El señor Jancel Rosario al momento de quitar el seguro a la pinza de botella, sufrio un rasguño en el dedo pulgar de la mano derecha.	Mercado , Miguel	Mmercado@kolareal.com.do	ADMINISTRADOR	2013-05-10 00:00:00	1
1103	3	1	1	0001	0002	0003	Golpe en la mano derecha, fue durante el paletizado en la LP03	Camones Reyes, Jersson	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-14 00:00:00	1
1095	3	1	1	0001	0002	0003	La Srta. Erika Roca se resbaló en el auditorio.	Parientes Sanchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-20 00:00:00	1
1102	3	1	1	0001	0002	0003	Siedo las 09:40 hrs el Sr. Bernal Vallejos se le manifesó que no debe llevar alimentos a planta y me contesto de la sgte manera: "Quien es el Ing. Max, es mas que venga el ing. Fabio y el dueño a decirme a mi mismo" y se dirigió con el alimento a planta.	Montesinos Román, Kelen	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-20 00:00:00	1
1105	3	1	1	0001	0002	0003	Haciendo limpieza de su área de trabajo visualizó un vidrio roto el cual proseguí a extraerlo, fue en ese momento que me produje un corte leve. LP05	García  Requena, Pedro	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-05-23 00:00:00	1
1056	3	4	1	0001	0001	0008	EN EL MOMENTO EN QUE EL SR. DELMY TORRES PROCEDIÓ A TIRAR DE LA SOGA PARA ENCENDER EL MEZCLADOR DE CONCRETO, SE LE RESBALÓ LA SOGA OCASIONANDOLE UNA LACERACIÓN EN EL DEDO.	Espinal Generes, Idelfonso	espinal@kolareal.com.do	ADMINISTRADOR	2013-05-26 00:00:00	1
1123	3	1	1	0001	0002	0003	El Sr. Gonzalo Rodriguez Romero sufre un golpe en el dedo medio de la mano derecha, que se hizo contra el filo de la faja transportadora en la LP05. Lugar: Zona de Paletizado.	Osorio Atao, Jhon	jhon.osorio@kr.com.pe	SGIHUAURA	2013-05-30 00:00:00	1
1152	3	4	1	0001	0001	0008	CARLOS TORRES CUANDO AFILABA UNA VARILLA DE SOLDADURA EN LA PIEDRA DE ESMERIL DE BANCO,ESTE FUE A VOLTEARSE Y EL BRAZO IZQUIERDO LOGRO HACER CONTACTO CON LA PIEDRA DE ESMERIL Y LO QUE LE OCASIONO UNA LEVE LACERACION EL EL CODO IZQUIERDO./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-06-05 00:00:00	1
1153	3	4	1	0001	0001	0008	MANUEL TEJADA CUANDO ESTABA PANTALLANDO FUE A LEVANTAR UNA BOTELLA Y AL ENTRAR LA MANO ESTE SE OCASIONO UNA LEVE HERIDA EN  EL DEDO MAYOR CON UN PEDAZO DE VIDRIO QUE TENIA LA CORREA TRANSPORTADORA./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-06-06 00:00:00	1
1125	3	1	1	0001	0002	0003	El Sr. Gonzalo Rodriguez Romero, manifiesta que al momento de pasar cajas vacías su rodilla choca con parte de la estructura de fierro de la faja transportadora, causándole una contusión leve.	Muñoz Vilela, Omar	omar.munoz@kr.com.pe	SGIHUAURA	2013-06-06 00:00:00	1
1127	3	2	1	0001	0002	0003	El Sr. Cristian Curo Huertas se tropezó al salir de la puerta de SGI, sin embargo no se genero daño alguno./nFecha: 08.06.13 Hora: 08:20 Lugar: Puerta SGI	Giron Farro, Omar	omar.giron@kr.com.pe	SSOHUAURA	2013-06-08 00:00:00	1
1128	3	2	1	0001	0002	0003	El Sr. Jorge Contreras Cordoba estaba acomodando las cajas con botellas vacias en la faja cuando es prendida por el Sr. Eliver Castro Carquin, quedando atrapada la muñeca del Sr. Jorge Contreras entre las cajas ocasionandole contusiones leves./nFecha: 07/06/13	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-06-08 00:00:00	1
1154	3	4	1	0001	0001	0008	PEDRO CHAVEZ CUANDO FUE A COLOCAR UNA LAMINA TERMOCONTRAIBLE EN LA EMPACADORA LINEA-3 SE OCASIONO UN GOLPE EN EL DEDO PULGAR DE LA MANO DERECHA YA QUE LA MANIGUETA QUE UTILIZA PARA COLOCAR DICHA LAMINA SE SAFO DEL GANCHO HACIENDO CONTACTO CON UNA PARTE DE DICHA EMPACADORA./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-06-09 00:00:00	1
1142	3	1	1	0001	0002	0002	El día 11-06-2013 aproximadamente 9:50pm el señor Washington Chambi, conductor del montacargas Toyota Nº 2, chocó con el señor Edwin Barriga, conductor del montacargas Toyota Nº 3, al transportar producto ambos conductores  chocan la parte trasera de los vehículos.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-06-11 00:00:00	1
1143	3	1	1	0001	0002	\N	El día 12-06-2013 aproximadamente 20:00pm cuando me encontraba realizando la inspección rutinaria por el área de APT, observe que un pallet con botellas de vidrio de 250ml, vacio, se encontraba sobre puesto a las cajas de otro pallet de botellas de vidrio sabor naranja que estaba desordenadas e inclinadas, este tenia la base rota y la cajás inclinadas a punto de caerse.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Huertas  Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-06-12 00:00:00	1
1145	3	1	1	0001	0002	0002	El día de hoy  a las 17:20 horas aproximadamente, se cayó producto agua cielo sin gas formato 2500 ml. Un total de 10 parihuelas \t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Llave Pinto, Cesar	cesar.llave@kr.com.pe	SGI 310	2013-06-13 00:00:00	1
1156	3	4	1	0001	0001	0008	ALEXIS TORRES EN MOMENTOS QUE ESTABA PALETIZANDO EN LINEA DE VIDRIO UNA BOTELLA EXPLOTO Y UN VIDRIO SALTO OCASIONANDOLE UNA LEVE LACERACION EN LA MEJILLA IZQUIERDA./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-06-13 00:00:00	1
1157	3	4	1	0001	0001	0008	LUIS ROJAS CUANDO ESTABA LIMPIANDO CON DESGRASANTE  EN EL AREA DEL PISO EN SOPLADORA LINEA-1,ESTE RESBALO OCASIONANDOSE UNA LEVE HERIDA EN LA CABEZA AL HACER CONTACTO CON UN SOPORTE DE HIERRO DE DICHA SOPLADORA./n/n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-06-17 00:00:00	1
1146	3	1	1	0001	0002	0002	El día de hoy al promediar las 22:10 horas se cayó producto del camión rompiéndose 10 cajas de botellas de vidrio llenas de producto formato 250 ml. \t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Llave Pinto, César	cesar.llave@kr.com.pe	SGI 310	2013-06-18 00:00:00	1
1130	3	1	1	0001	0002	0003	Al tratar de colocar la bobina en la etiquetadora de la linea de producción n° 2, mi dedo pulgar choca con la bobina y la pantalla de la máquina etiquetadora./nHora - 11:30 am	Ramos Gutierrez, Leonardo	erick.giron@kr.com.pe	SSOHUAURA	2013-06-18 00:00:00	1
1147	3	1	1	0001	0002	0002	Aproximadamente 8:10am del dia 19-06-2013, fui  a levantar un pallet roto para que se lo lleve el montacarga, cuando sin darme cuenta se desprende una de las maderas, la cual tenia una punta de clavo expuesta, esta me cayó en la pantorrilla de la pierna isquierda ocacionandome una  herida.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	León Paredes, Hilmar	victor.huertas@kr.com.pe	SGI 310	2013-06-19 00:00:00	1
1149	3	1	1	0001	0002	\N	El día de hoy al promediar las 02:30 horas, se cayó 04 cajas de botellas de vidrio llenas de producto formato 250 ml.KR/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Llave Pinto, César	cesar.llave@kr.com.pe	SGI 310	2013-06-19 00:00:00	1
1133	3	1	1	0001	0002	0003	En la inspección de rutina se encontró a personal tercero sin el debido implemento de seguridad, por lo que se paralizaron los trabajos./nFecha / Hora: 21.06.13 / 12:30 /nLugar: Sala de Fuerza/nEquipo: Compresor Bellis Morcom WH50BS	Medrano Vega, Fernando	fernando.medrano@kr.com.pe	SGIHUAURA	2013-06-21 00:00:00	1
1158	3	4	1	0001	0001	0008	MARTIN DILONE CUANDO ESTABA FLOJANDO UN TORNILLO EN LA CORREA TRANSPORTADORA DE LINEA-2,EL DESTRONILLADOR LE RESBALO LO QUE LE CAUSO QUE HICIERA CONTACTO CON UNA PARTE DE METAL DE DICHA CORREA Y OCASIONANDOCE UNA LACERACION EN LA MUÑECA IZQUIERDA./n/n/n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-06-24 00:00:00	1
1159	3	4	1	0001	0001	0008	ADONY JAQUEZ AL SUJETAR UN HUACAL DE BOTELLAS DE VIDRIO SE OCASIONO UNA LEVE HERIDA EN EL DEDO PULGAR DE LA MANO IZQUIERDA AL HACER CONTACTO CON LA CABEZA ROTA DE UNA BOTELLA./n/n/n/n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-06-25 00:00:00	1
1160	3	4	1	0001	0001	0008	ALEXIS RODRIGUEZ CUANDO ESTABA PALETIZANDO FUE A SUJETAR UNA BOTELLA  DE VIDRIO ROTA Y SE OCASIONO UNA LEVE HERIDA EL EL DEDO PULGAR DE LA MANO IZQUIERDA./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-06-26 00:00:00	1
1178	3	4	1	0001	0001	0008	GUILLERMO ROSA ESTABA SACANDO UNOS CLAVOS CON UN MARTILLO A UNA MADERA Y EN ESE MOMENTO LE SALPICO UNA VIRUTA DE DICHA MADERA EN EL OJO IZQUIERDO./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-07-03 00:00:00	1
1169	3	1	1	0001	0002	0003	Siendo las 16:00 hrs aprox. en la LP01 el Sr. Curo se procedía a levantar y pasar al otro lado de la faja unas cajas vacías, cuando de pronto al apurarlo no se fija la distancia de estas con su cuerpo por lo que al momento de levantarlas se golpe la quijada y se muerde la lengua ocasionando una pequeña fisura en esta última.	Curo Huerta, Chirstian	erick.giron@kr.com.pe	SSOHUAURA	2013-07-04 00:00:00	1
1180	3	4	1	0001	0001	0008	El señor Rafael Hidalgo Reyes en el momento de colocar en su lugar la faja de la salida de botellas de la sopladora no.1, el piñón que ensambla la faja, cuando le fue a mover  con el martillo recibió un golpe en el dedo pulgar de la mano derecha.	Mercado Nuñez, Miguel	mmercado@kolareal.com.do	VISITAS	2013-07-05 00:00:00	1
621	3	4	7	0001	0001	0008	La bombita de cloro esta dando corriente al operador Gregorio Perez informo sobre el incidente.	Reynoso , Filiberto	freynoso@kolareal.com.do	SSDOMINICANA	2012-09-18 01:42:59	1
1179	3	4	1	0001	0001	0008	ELVIS MENDOZA ESTABA ESTIVANDO HUACALES DE REFRESCO EN LINEA DE VIDRIO Y UNA BOTELLA EXPLOTO CAUSANDOLE UNA LEVE HERIDA EN EL BRAZO IZQUIERDO./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-07-06 00:00:00	1
1186	3	1	1	0001	0002	0003	El Sr. Higilio Leyva se realiza un pequeño corte en el dedo anular (mano izquierda) cuando procedía a retirar la estrella de la Llenadora Mesal LP02 durante el mantenimiento integral./nLugar: Llenadora Mesal - LP02/nFecha / Hora: 08.07.13 - 10:00 Hrs/n	Rosales Espinoza, Ricardo	ricardo.rosales@kr.com.pe	SGIHUAURA	2013-07-08 00:00:00	1
1200	3	1	1	0001	0002	0002	Me encontraba realizando mis labores de saneamiento cuando se acerco el auxiliar de linea Cesar Cuba Begazo y empezó a jugar, al responder me doblo el dedo de la mano izquierda. \t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Quinto Laimes, Luis	claudia.coaquira@kr.com.pe	SGI 310	2013-07-08 00:00:00	1
1202	3	1	1	0001	0002	0002	Cuando procedia a retirar un pallet de vasos de vidrio para cargarlos a un camión, la columna de vasos que se contraba atrás se cayo encima del techo  del montacarga.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Gonzales Larico, Alexander	claudia.coaquira@kr.com.pe	SGI 310	2013-07-10 00:00:00	1
1215	3	1	1	0001	0002	0003	El operario Otoniel Panana Alvarado se realiza un corte en el dedo pulgar de la mano derecha cuando intento ordenar las botellas que llegaban encajonadas. No se percato que una de ellas estaba rota	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-07-12 00:00:00	1
1193	3	1	1	0001	0002	0003	La Sra. Carmen Alcazar ingreso a planta sin contar con sus implementos de seguridad (casco y zapatos pun ta de acero), a vista de todo el personal operario. Esto sucedio a las 10:30 am, reportado por el colaborador el Sr. Gonzalo Esteves	Alcazar Casaico, Carmen	erick.giron@kr.com.pe	SSOHUAURA	2013-07-16 00:00:00	1
1192	3	4	1	0001	0001	0008	El señor Carlos Reyes, en el momento de realizar un cambio de rodillo en la entreda de la paletizadora, al momento de colocarlo tenia una rebaba, lo cual le provocó una pequeña laceración en el brazo derecho, lo cual se le procedió a colocar curitas.	Mercado Nuñez, Miguel	mmercado@kolareal.com.do	VISITAS	2013-07-20 00:00:00	1
1195	3	1	1	0001	0002	0003	El Sr. Carlos Ramirez, se pretendía ha abrir el cilindro de pulpa de durazno con el cuchillo cuando de pronto sin darse cuenta se había cortado un poco el dedo pulgar de la mano izquierda. Hora 05:45 am en la Sala de Jarabe Simple	Ramirez Palma, Carlos Freddy	erick.giron@kr.com.pe	SSOHUAURA	2013-07-25 00:00:00	1
1212	3	1	1	0001	0002	0003	Cuando procedía a cortar el precinto de seguridad del Cilindro de Pulpa Durazno no se percata y se realiza un corte en el dedo pulgar de la mano izquierda.	Ramirez Palma, Carlos	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-07-25 00:00:00	1
1211	3	1	1	0001	0002	0003	Aprox. 22:00 Hrs el Sr. Fernando Cotrina realizaba maniobras con un trailer aún no estando autorizado para tales fines, generando un golpe a la baranda de la escalera a Of. Contables	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-08-02 00:00:00	1
1219	3	1	1	0001	0002	0003	Según el comentario del Sr. Luis Urtiaga (estibador), siendo las 00:20 hrs en el patio de maniobras se estaba descargando cajas con botellas vacías, cuando de pronto se caen tres cajas esto debido a que al colocarlas en el camión chocan con una baranda perdiendo la forma de paletizado.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-08-06 00:00:00	1
1220	3	1	1	0001	0002	0003	Siendo las 19:45 hrs, estaba apoyando recogiendo producto terminado de la línea N°3 y llevándolos al almacén de producto terminado, cuando de pronto después de dejar la paleta encima de otra, el montacargas (linde N°2) se apaga y se baja un poco la uña por lo que al momento de prenderla y retroceder jala la paleta antes colocado, ocasionando que se caiga y este a su vez derribe a 3 paletas contiguas.	Nazario Wenceslao, Marcelo Millan	erick.giron@kr.com.pe	SSOHUAURA	2013-08-14 00:00:00	1
1222	3	4	1	0001	0001	0008	NICOLAS BELLO ESTABA RETIRANDO LA TAPA DEL CRAN  DE UN MONTACARGA Y AL MARTILLO QUE UTILIZABA SE LE  ROMPIO EL CABO DE MADERA,LO QUE LE OCASIONO UN LEVE GOLPE EN LA CEJA DERECHA.	ESPINAL GENERE, IDELFONZO	iespinal@kolareal.com.do	VISITAS	2013-08-23 00:00:00	1
1235	3	1	1	0001	0002	0003	Siendo las 17:45 pm el Sr. Ore Leiva se proponía a desatorar el buzón que esta por la Línea Isotónica (LP5), cuando al momento de jalar el fierro metido en el buzón este le provoca un corte en el dedo anular.	Ore Leiva, Isaac	erick.giron@kr.com.pe	SSOHUAURA	2013-08-24 00:00:00	1
1236	3	1	1	0001	0002	0003	Siendo aproximadamente las 04:00 am el Sr. Yonathan Prada Collantes, estaba manejando el montacargas - Linde2 cuando al momento de retroceder saliendo de planta llevando mercadería, este dobla mucho chocando el lado izquierdo del montacargas rompiendo su espejo lateral y rayando ese lado.	Prada Collantes, Yonathan Jairo	erick.giron@kr.com.pe	SSOHUAURA	2013-08-29 00:00:00	1
1228	3	4	1	0001	0001	0008	MAXIMO ESTEVEZ ESTABA SACANDO LOS CARTUCHOS DE UN FILTRO DE CARBON Y RESBALO LO QUE PROVOCO QUE PROCEDIERA A SUJETARCE PARA EVITAR CAER HACIENDO CONTACTO SU MANO IZQUIERDA  CON UNA PARTE FILOSA DE DICHO FILTRO LO QUE LE CAUSO UNA LEVE HERIDA EN DICHA MANO.	Espinal Genere, Idelfonzo	iespinal@hotmail.com	VISITAS	2013-08-31 00:00:00	1
1238	3	2	1	0001	0001	0008	WILSON RODRIGUEZ ESTABA ESTIVANDO HUACALES DE BOTELLAS DE VIDRIO Y AL MOVER UNO DE LOS HUACALES UNA DE DICHAS BOTELLAS EXPLOTO PROVOCANDO QUE UN PEDAZO DE VIDRIO SALTARA Y LE CAUSARA UNA LEVE HERIDA EN LA NARIZ.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-09-06 00:00:00	0
1239	3	4	1	0001	0001	0008	EL SEÑOR RADALBERTO JAQUEZ SE ENCONTRABA AMARRANDO UNA CARGA CON UNA ESLINGA Y AL MOMENTO DE PONERLE EL SEGURO SE SOLTO Y LO GOLPIO PROVOCANDOLE UNA PEQUEÑA HERIDA EN LA CARA.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-09-06 00:00:00	1
1372	3	4	1	0001	0001	0008	Wilson Estévez Gómez estaba estivando huacales de botellas de vidrio y al mover uno de los huacales una de dichas botellas exploto provocando que un pedazo de vidrio saltara y le causara una leve herida en la nariz.	Espinal Generes, Idelfonso	iespinal@kolareal.com.do	ADMINISTRADOR	2013-09-06 00:00:00	1
1243	3	1	1	0001	0002	0003	Siendo las 14:50 hrs aprox. el Sr. Mejía estaba recogiendo botellas que estaban en el suelo, cerca a la Línea de producción N° 1, sin embargo no se percato que en una de ellas estaba rota, haciéndose un corte en el dedo.	Mejia Osorno, Humbert	erick.giron@kr.com.pe	SSOHUAURA	2013-09-07 00:00:00	1
1255	3	4	1	0001	0001	0008	EL SEÑOR ESMAILIN COLON SE ENCONTRABA SANEANDO LOS TANQUES DE JARABE TERMINADO, Y CUANDO HECHO LA SODA CAUTICA AL TANQUE SUBIO EL VAPOR HACIENDO CONTANTO CON LOS OJOS Y CAUSANDOLE UNA PEQUEÑA IRRITACION.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-09-09 00:00:00	1
1490	3	1	1	0001	0002	0003	Aproximadamente 17:40 hrs se evidencia al personal de mantenimiento haciendo uso de montacargas sin tener la autorización y/o coordinación respectiva	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-12-03 00:00:00	1
1256	3	4	1	0001	0001	0008	WANDY GOMEZ CUANDO FUE  A  SUJETAR EL CARRO DE  HECHAR LOS REFRESCOS MAL  EMPACADOS EN LINEA-2,ESTE SE OCASIONO UNA HERIDA EN LA MANO DERECHA AL HACER CONTACTO CON UNA PARTE  FILOSA DE ACERO INOXIDABLE EN DICHO CARRO.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-09-10 00:00:00	1
1317	3	1	1	0001	0002	0002	A las 9:00 aprox el Sr. Dany Condori se dipsonia subir las gradas hacia la zona de jarabe cuando su pierna izquierda se deslizo por medio de los peldaños golpeandose la rodilla.	Coaquira Paz, Claudia	claudia.coaquira@kr.com.pe	SGI 310	2013-09-10 00:00:00	1
1282	3	4	1	0001	0001	0008	WANDY GOMEZ ESTABA ESTIVANDO EL LINEA -6 Y AL MANIPULAR UN PAQUETE DE AGUA ESTE SE LASTIMO UNA HERIDA QUE SE HABIA OCASIONADO  EN LA MANO DERECHA EL DIA 10-09-2013 CON UNA PARTE FILOSA DE ACERO INOXIDABLE DEL CARRO DE HECHAR PRODUCTO MAL EMPACADO EN LINEA-2.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-09-13 00:00:00	1
1295	3	4	1	0001	0001	0008	EL SEÑOR ANTHONY HERRERA SE ENCONTRABA CAMINANDO EN LA LINEA DE PRODUCCION-4 Y NO SE PERCATO DE QUE HABIA UNA CANALETA ABIERTA Y PISO EN FALSO Y SE CAYO./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-09-13 00:00:00	1
1296	3	4	1	0001	0001	0008	EL SEÑOR FERNANDO SALINAS SE ENCONTRABA SANEANDO EN LA LINEA KRONES Y DE REPENTE UNA VALVULA SE DISPARO Y LE CAYO LIQUIDO EN LA PIERNA DERECHA CAUSANDOLE ENRROJAMIENTO Y ARDOR./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-09-14 00:00:00	1
1297	3	4	1	0001	0001	0008	JULIO CHALCO ESTABA SANEANDO EN LA LINEA KRONES CUANDO UNA VALVULA SE DISPARO Y LE CAYO LIQUIDO EN LA CARA Y EL CUERPO CAUSANDOLE ENRROJAMIENTO Y ARDOR./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-09-14 00:00:00	1
1298	3	4	1	0001	0001	0008	DOMINGO MATIAS SE ENCONTRABA INSTALANDO UN TUBO EN AGUAS RESIDUALES Y CUANDO ESTE IVA A FIJARLO CON LAS TUERCAS EL TUBO SE SAFO Y LO GOLPIO EN LA CARA CAUSANDOLE UNA PEQUEÑA HERIDA./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-09-14 00:00:00	1
1325	3	1	1	0001	0002	0002	El día 14 de setiembre a las 3:00 aprox. en el área de almacen hubo un choque de montacargas, los que eran conducidos por el Sr. Edwin Barriga y Gabriel Mamani.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-09-14 00:00:00	1
1301	3	1	1	0001	0002	0003	Me proponía a limpiar el rodillo de goma de la máquina etiquetadora de la Línea de Producción N° 5, cuando estoy cerca de la varilla me doy cuenta de la cuchilla del rodillo y cuando me apresuro a sacar mi mano, pero ya me había cortado parte del dedo.	Alor Anselmo, Luis Alberto	erick.giron@kr.com.pe	SSOHUAURA	2013-09-18 00:00:00	1
1302	3	4	1	0001	0001	0008	JHONATAN ROMERO ESTABA DESEMPACANDO UN PAQUETE DE REFRESCOS PARA CODIFICARLO PORQUE SALIERON SIN CODIGO Y AL ROMPER LA LAMINA TERMOCONTRAIBLE SE OCASIONO UNA HERIDA EN EL DEDO INDICE DE LA MANO IZQUIERDA AL HACER CONTACTO CON LA PATE FILOSA DE LA CUCHILLA QUE UTILIZABA PARA REALIZAR DICHA TAREA.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-09-19 00:00:00	1
1359	3	1	1	0001	0002	0002	el día 19/09/13 a las 10:45am, la Srta Santander estaba preparando el material para realizar analisis de agua. Dejando encendido el mechero, mientras manipulaba alcohol, por esta razón sufrio quemaduras en los dedos y en el abdomen.	Coaquira Paz, Claudia	claudia.cuaquira@kr.com.pe	SGI 310	2013-09-19 00:00:00	1
1360	3	1	1	0001	0002	0002	El Dáa 19/09/13 a las 2:50pm, El Sr. Luis Vargas se encontraba cruzando hacia la zona de alimentación de cajas, en la linea 1, El montacarga conducido por el Sr. Sandro Vilca al empujar los pallet de cajas le apresiono el pie izquierdo.	Coaquira Paz, Claudia	claudia.coaquira@kr.com.pe	SGI 310	2013-09-19 00:00:00	1
1304	3	1	1	0001	0002	0003	El Sr. Carlos Llantoy cometa que fue agredido físicamente por el Sr. Higilio De la Cruz Leiva Diaz, a la altura del grifo que se encuentra ubicado en la esquina de la planta, esto por motivo de rencillas que han tenido en el presente día, así como temas de diferencia sindical.	Leiva Diaz, Higilio De la cruz	erick.giron@kr.com.pe	SSOHUAURA	2013-09-20 00:00:00	1
1311	3	1	1	0001	0002	0003	Siendo las 06:15 hrs, me informan que se estaba provocando un corto circuito en la sala de Tratamiento de Agua, cuando me acerco al lugar, lo encuentro al Tec. Luis Guadalupe subido a una viga para tratar de alcanzar el lugar del incidente, sin embargo no contaba con ningún equipo de protección personal (arnés), lo que se le alcanzó de inmediato.	Guadalupe Hijar, Luis	erick.giron@kr.com.pe	SSOHUAURA	2013-09-23 00:00:00	1
1310	3	1	1	0001	0002	0003	Aproximadamente 19:50 hrs, el trabajador Javier Saavedra se apersona al Tópico de SGI para reportar su caída en la máquina empacadora de la LP02, exactamente en la plataforma de acero inoxidable que utiliza el operador; indica un golpe en la pierna derecha con una raspadura al nivel de la canilla.	Javier Saavedra, Luis Enrique	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-09-25 00:00:00	1
1361	3	1	1	0001	0002	0002	el dia 27/09/13 a la 1:30ama aprox. en el Area de almacén nueva de APT se cayeron 16 pallets aproximadamente de agua cielo sin gas formato 2500ml.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-09-27 00:00:00	1
1363	3	1	1	0001	0002	0002	el Diá 27/09/13 a las 8:00 pm, se encontro al Sr. Valeriano Calle Fernando operando el montacarga, responsabilisandose el inspector de turno Cesar Llave Pinto de cualquier acto que puediera cometer. ya que no estaba autorizado de operar el montacarga.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-09-27 00:00:00	1
1327	3	4	1	0001	0001	0008	JOSE RAMON ENCARNACION SE ENCONTRABA EN EL TALLER DE MAESTRANZA CUANDO FUE A MOVER UN HIERRO QUE ESTABA EN LA PRENSA Y NO SE PERCATO DE QUE ESTE ESTABA CALIENTE Y CUANDO LO AGARRO LE PROVOCO PEQUEÑAS AMPOLLAS EN SU MANO IZQUIERDA./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-09-28 00:00:00	1
1333	3	4	1	0001	0001	0008	Joel De Los Santos estaba apretando un tornillo de la válvula en la reja curva y la llave que utilizaba se le zafó ocasionándole una herida en la ceja izquierda.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-01 00:00:00	1
1354	3	1	1	0001	0002	0003	Aprox. 22:00 hrs durante la inspección de Seguridad y Salud en el Trabajo, se evidencia al personal de abastecimiento de botellas - LP5, que no portaba con sus respectivos implementos de seguridad (lentes, guantes) para dicha actividad./nEl personal involucrado son: Espinoza Yoclla, Ramirez Palma, Camones Reyes.	Purizaga Saavedra, Erikc Alberto	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-10-03 00:00:00	1
1388	3	1	1	0001	0002	0002	EL DIA 05-10-13 A LAS 05:00 PM APROXIMADAMENTE. EL SEÑOR RIVAS ARQUE GUSTAVO ESTUBO SACANDO SORVETES DE LAS CAJAS VACIAS DE BOTELLAS DE 500 ML PRODUCIENDO UN CORTE DE UN 1CM EN LA MANO DERECHA.	CARPIO  DAVILA, NELSON	nelson.carpio@kr.com.pe	SGI 310	2013-10-05 00:00:00	1
1366	3	4	1	0001	0001	0008	EL SR.TEOFILO JUMELLEZ SE ENCONTRABA ESTIVANDO SACOS DE SODA CAUTICA FRENTE AL ALMACEN DE TRANSITO CUANDO UNO DE ESTOS EXPLOTO CAYENDOLE EL POLVO EN EL OJO DERECHO CAUSANDOLE UNA LACERACION Y QUEMADURTA EN LA ESCLERA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-10-07 00:00:00	1
1373	3	2	1	0001	0001	0008	EL SEÑOR ADEWIN GARCIA SE ENCONTRABA EN LA PANTALLA DE LINEA-4 (VIDRIO) CUANDO UNA DE LAS BOTELLAS SE  VOLTIO Y CUANDO ESTE FUE A PARARLA NO SE HABIA PERCATADO DE QUE ESTABA ROTA Y LO CORTO EN EL DEDO ANGULAR DE LA MANO DERECHA./n	TORRES , EDWARD	\N	VISITAS	2013-10-10 00:00:00	1
1392	3	1	1	0001	0002	0002	EL DIA 10/10/13 A LAS 9:30 PM APROXIMADAMENTE EL SR. MARCELO MENDOZA PINTO ESTUVO HECHANDO CAL A LOS DOSIFICADORES, LO CUAL EL POLVILLO QUE SE GENERA AL HECHAR LAS BOLSAS DE CAL LE PROVOCO UNA REACCION NO COMUN, GENERANDO ARDOR EN LA CARA, OJOS Y GARGANTA.	HUERTAS , VICTOR	victor.huertas@kr.com.pe	SGI 310	2013-10-10 00:00:00	1
1378	3	1	1	0001	0002	0003	Siendo las 22:15 hrs aproximadamente una de las botellas de vidrio había ingresado a la máquina lavadora en forma horizontal obstruyéndola, por lo que intento sacarla sin darme cuenta que al realizar esta labor mi dedo pulgar se raspa con la guía de la faja generándome una herida en dicha área.	López Quineche, Juan	erick.giron@kr.com.pe	SSOHUAURA	2013-10-11 00:00:00	1
1375	3	4	1	0001	0001	0008	AMADO FERNANDEZ SE ENCONTRABA CARGANDO PALETAS VACIAS EN EL MONTACARGAS CUANDO UNA DE ESTAS SE CALLO Y ESTE FUE A PARARLA LO CORTO EN SU DEDO ANGULAR DE LA MANO DERECHA./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-11 00:00:00	1
1379	3	1	1	0001	0002	0003	Siendo la 01:35 hrs se encontró a los Sres. Oscar Torres y Julio Ypanaque realizando trabajos de carpintería dentro de planta sin autorización del supervisor de planta, y sin considerar los riesgos que esto implicaba.	Ypanaque Pajares, Julio	erick.giron@kr.com.pe	SSOHUAURA	2013-10-12 00:00:00	1
1381	3	4	1	0001	0001	0008	JHANATAN ROMERO ESTABA PANTALLANDO EN LINEA-4 Y PROCEDIO A LEVANTAR UNA BOTELLA QUE ESTABA ROTA LO QUE LE CAUSO UNA LEVE HERIDA EN EL DEDO INDICE DE LA MANO DERECHA AL HACER CONTACTO CON LA PARTE FILOSA DE DICHA BOTELLA DE VIDRIO./n	Espinal Genere, Idelfonso	iespinal@kolareal.com.do	VISITAS	2013-10-14 00:00:00	1
1382	3	4	1	0001	0001	0008	JOSE JUMELLEZ SE ENCONTRABA ESTIVANDO EN LINEA DE VIDRIO Y CUANDO PROCEDIO A MOVER UN HUACAL UNA DE LAS BOTELLAS EXPLOTO LO QUE OCASIONO QUE UN PEDAZO DE VIDRIO SALTARA Y LE CAUSARA UNA LEVE HERIDA EN LA FRENTE ./n	Espinal Genere, Idelfonso	iespinal@kolareal.com.do	VISITAS	2013-10-15 00:00:00	1
1403	3	4	1	0001	0001	0008	LUIS LAMAR ESTABA INCLINADO REALIZANDO UN TRABAJO DE LIMPIEZA Y CUANDO FUE SUBIR ESTE RECIBIO UN GOLPE EN LA PARTE IZQUIERDA DE LA CABEZA CON UN TUBO DE LA CISTERNA DE RECUPERACION AGUA BLANDA DE RINSER./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-19 00:00:00	1
1399	3	4	1	0001	0001	0008	LEONEL RODRIGUEZ SE ENCONTRABA REPARANDO LOS PISTONES DE LA LLENADORA EN LINEA-2 CUANDO EL DETORNILLADOR QUE USABA SE LE RESVALO Y LE PROVOCO UNA LEVE HERIDA EN SU MANO IZQUIERDA./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-22 00:00:00	1
1401	3	1	1	0001	0002	0003	Siendo las 04:40 horas, en el abastecimiento de botellas de vidrio en la línea de producción N° 5, cuando el Sr. Salvador Chagray se disponía a sacar el precinto de la paleta de botellas de vidrio (fruvi), siendo la base de las paletas un peligro por traer botellas rotas, sufrió un pequeño corte en el dedo índice.	Salvador Chagray, José	arturo.janampa@kr.com.pe	SSOHUAURA	2013-10-24 00:00:00	1
1402	3	4	1	0001	0001	0008	En el momento que un cabezote-Romeo se dirigía hasta la puerta de control numero-3 para salir hasta su destino a entregar una carga, una de las piedras de la calle salto a 5 metros de distancia causándole un golpe en el testículo izquierdo al Sr. Diógenes Rodríguez cuando este caminaba por el área del parqueo de almacén local.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-24 00:00:00	1
1405	3	4	1	0001	0001	0008	LUIS LAMAR ESTABA SACANDO UNA LATA DE METAL DE UNA MATA SEMBRADA EN EL JARDIN PROXIMO A PUERTA CONTROL-1 Y SE CAUSO UNA LEVE HERIDA EN EL DEDO PULGAR DE LA MANO DERECHA AL  SUJERTAR UNA PARTE FILOSA DE DICHA LATA./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-25 00:00:00	1
1406	3	4	1	0001	0001	0008	RAMONCITO GOMEZ SE ENCONTRABA EN EL AREA DE RECEPCION PERO AL MOMENTO DE SALIR NO SE PERCATO Y AL CHOCAR CON LA PUERTA DE CRISTAL SE OCASIONO UNA HERIDA EN LA FRENTE./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-25 00:00:00	1
1411	3	1	1	0001	0002	0003	Siendo las 18:43 hrs. el Sr. León se disponía a sacar una pallet de botellas de vidrio (generade) con el montacarga Linde 1, cuando de pronto, desestabilizó la pallet posterior y en consecuencia, la pallet del segundo nivel colapsó, cayendo encima del montacarga.	León Romero, Dick	arturo.janampa@kr.com.pe	SSOHUAURA	2013-10-25 00:00:00	1
1407	3	2	1	0001	0001	0008	ESMEILIN COLON EN EL MOMENTO QUE SUBIA UNA CAJA DE ESENCIA HASTA LOS TANQUES DE JARABE TERMINADO SE OCASIONO UNA LEVE HERIDA EN LA MANO DERECHA AL HACER CONTACTO CON LA MALLA DE METAL  ANTICAIDA QUE TIENE EL ANDAMIO DE DICHA AREA./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-26 00:00:00	1
1408	3	4	1	0001	0001	0008	ANGEL SANTOS ESTABA CORTANDO LA GRAMA CON LA MAQUINA DE CORTE Y EN ESE MOMENTO UN CUERPO EXTRAÑO SALTO HACIENDO CONTACTO CON SU OJO DERECHO Y CAUSANDOLE UNA IRITRACION./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-26 00:00:00	1
1422	3	1	1	0001	0002	0002	El Sr. Javier Campana se percata de que el rollo de papel higiénico que coloco el día anterior se lo habían llevado todo (hecho que se ha venido repitiendo).	Carpio Dávila, Nelson	nelson.carpio@kr.com.pe	SGIAREQUIPA2	2013-10-26 00:00:00	1
1423	3	1	1	0001	0002	0003	El Sr. Villalobos arrancó parte de las cortinas, en la entrada al nuevo hangar (Línea de Producción Nro. 5), cuando transitaba con el montacarga llevando la parrilla a demasiada altura, debido al poco espacio en dicho lugar.	Villalobos  Ibañez, Carlos Godofredo	arturo.janampa@kr.com.pe	SSOHUAURA	2013-10-30 00:00:00	1
1426	3	4	1	0001	0001	0008	GILSON GOMEZ SE ENCONTRABA EN LA SOPLADORA DE LINEA-2 CAMBIANDO LOS MOLDES CUANDO UNO DE ESTOS SE LE RESBALO Y LE PROVOCO UNA HERIDA EN EL DEDO MIÑIQUE DE SU MANO DERECHA./n	TORRES , EDWARD	etorres	VISITAS	2013-10-31 00:00:00	1
1428	3	1	1	0001	0002	0003	Siendo las 15:40 hrs. El Sr. Villalobos se disponía a subir las escaleras que pasan por encima del transportador de cajas, cuando, debido al filo que existe al final de las barandas, sufrió un corte en la mano derecha.	Villalobos  Ibañez, César	arturo.janampa@kr.com.pe	SSOHUAURA	2013-10-31 00:00:00	1
1450	3	1	1	0001	0002	0002	EL DIA 04/11/13 A LAS 11:30 APROX. EL SEÑOR VICENTE TACO OPERADOR DE MONTACARGA LINDE #3 ME COMUNICO QUE EL ESPEJO RETROVISOR EXTERIOR LADO IZQUIERDO DEL CONDUCTOR SE ENCONTRABA RAJADO, SIENDO UN PELIGRO PARA EL PERSONAL QUE OPERA MONTACARGA YA QUE NO SE VISUALIZA CORRECTAMENTE LAS COSAS Y PUEDIENDO PROVOCAR UN ACCIDENTE.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-04 00:00:00	0
1431	3	4	1	0001	0001	0008	KENY RODRIGUEZ SE ENCONTRABA ESTIVANDO WACALES EN LA LINEA DE VIDRIO Y NO SE PERCATO DE QUE EN UNO DE ESTOS HABIA UNA BOTELLA ROTA Y CUANDO LO FUE AGARRAR SE CORTO EN LA PALMA DE SU MANO IZQUIERDA./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-11-05 00:00:00	1
1434	3	1	1	0001	0002	0003	Siendo las 11:10 hrs aprox el Ing. Fernando Gaspar me pide que me acerque al Pozo de Extracción N° 2, indicando que había empalmes eléctricos expuestos a la humedad del medio ambiente, lo cual podría ocasionar que sucediera en cualquier momento un corto circuito y por ende un incendio.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-11-05 00:00:00	1
1452	3	1	1	0001	0002	0002	EL DIA 05/11/13 APROX. EL SEÑOR YUCRA QUILCA FRANKLIN, REPORTO QUE SUS ZAPATOS DE DE SEGURIDAD SE ENCUENTRAN EN MALAS CONDICIONES. EL CUAL FILTRA AGUA POR LOS COSTADOS QUEDANDO HUMEDO SUS PIES PROVOCANDOLE ADORMECIMIENTO Y DOLOR, PIDIENDO EL SEÑOR QUE SE LE CAMBIE POR OTROS ZAPATOS.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-05 00:00:00	1
1437	3	1	1	0001	0002	0003	Siendo las 10:00 hrs aproximadamente, se encontraba en la línea N° 05, regresando a la línea las botellas que salían sin precinto, sin embargo de pronto la máquina se atora y por querer arreglarla su mano choca con la plancha de metal caliente donde se pre-queman los precintos.	Camones Reyes, Jerson	erick.giron@kr.com.pe	SSOHUAURA	2013-11-06 00:00:00	1
1440	3	1	1	0001	0002	0003	El Sr. Orellana se disponía a sacar las cintas de un pallet de botellas de vidrio (fruvi), cuando una de estas le produce un corte en el dedo medio de la mano derecha, debido a la inutilidad de los guantes correspondientes.	Orellana Diaz, Jhon	arturo.janampa@kr.com.pe	SSOHUAURA	2013-11-07 00:00:00	1
1439	3	4	1	0001	0001	0008	EL SEÑOR WINSTON LEDESMA SE ENCONTRABA EN AGUAS RESIDUALES RECOGIENDO ESCOMBROS CUANDO UNO DE ESTOS SE LE RESVALO Y LE CAYO ENCIMA DE SU DEDO INDICE DE LA MANO IZQUIERDA PROVOCANDOLE UNA LEVE HERIDA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-11-08 00:00:00	1
1441	3	4	1	0001	0001	0008	WILLIAN ESPINAL SE ENCONTRABA RECOGIENDO VIDRIOS Y HECHANDOLOS EN CAJAS CUANDO UNO DE ESTOS LO CORTO EN EL DEDO INDICE DE SU MANO IZQUIERDA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-11-09 00:00:00	1
1454	3	1	1	0001	0002	0002	EL DIA 09/11/13 APROX. A LAS 9:00 AM SE REALIZO LAS INSPECCIONES CORRESPONDIENTES, EL CUAL OBSERVE QUE VARIOS DISPENSADORES DE JABON LIQUIDO (PLASTICO), ESTAN DETERIORADOS Y FALLANDO AL MOMENTO DE PRESIONAR PARA QUE SALGA EL JABON, CAUSANDO MALESTAR AL PERSONAL QUE UTILIZA ESTOS SERVICIOS.	CARPIO DAÇ, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-09 00:00:00	0
1455	3	1	1	0001	0002	0002	EL DIA 09/11/13 APROX. A LAS 9:00 AM SE REALIZO LAS INSPECCIONES CORRESPONDIENTES, EL CUAL OBSERVE QUE VARIOS DISPENSADORES DE JABON LIQUIDO (PLASTICO), ESTAN DETERIORADOS Y FALLANDO AL MOMENTO DE PRESIONAR PARA QUE SALGA EL JABON, CAUSANDO MALESTAR AL PERSONAL QUE UTILIZA ESTOS SERVICIOS.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-09 00:00:00	1
1448	3	2	1	0001	0001	0008	DAVID REYES ESTABA SACANDO LOS SELLOS CONICOS EN LLENADORA DE LINEA-2 Y LA HERAMIENTA QUE UTILIZABA SE LE RESBALO CAUSANDOLE UNA HERIDA EN EL DEDO INDICE DE LA MANO IZQUIERDA./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-11-15 00:00:00	1
1446	3	1	1	0001	0002	0003	Siendo las 19:00 aprox. se encontró al Sr. Florencio Muro encargado del Montacarga "Toyota 3" alzando al Sr. Carlos Montoya encima de un palet con dicho vehículo, teniendo para estos casos una canastilla de seguridad, por lo que se les llamo la atención por realizar dicho acto inseguro.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-11-15 00:00:00	1
1478	3	1	1	0001	0002	0002	EL DÍA 16/11/2013 APROX. A LAS 2:30 PM EL SEÑOR RODRIGO POTOSINO (ENCARGADO DE LIMPIEZA) ESTUVO ENCERANDO LAS GRADAS DE SOSTENIBILIDAD EL CUAL SORPRESIVAMENTE SE LE PERDIÓ EL GALON DE CERA LIQUIDA ROJA. ADUCIENDO QUE HABIAN HURTADO LA CERA OCASIONANDO MALESTAR AL PERSONAL.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-16 00:00:00	1
1468	3	1	1	0001	0002	0003	El Sr. Permia, se proponía a abrir la abrir la llave que se encuentra al costado de la parte superior del tanque, sin embargo se resbalo y se quedo colgado unos minutos hasta que le alcanzaron una escalera y pudo bajar.	Pernia Huerta, Erminio	erick.giron@kr.com.pe	SSOHUAURA	2013-11-18 00:00:00	1
1469	3	2	1	0001	0001	0008	EUDYS TORRES SE ENCONTRABA REALIZANDO UN MANTENIMIENTO EN LLENADORA DE LINEA-1 Y EN ESE MOMENTO LE SALPICO DESGRASANTE EN LOS OJOS./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-11-18 00:00:00	1
1470	3	4	1	0001	0001	0008	JAVIER COLLANTES SE ENCONTRABA ENGRASANDO UNA PIEZA DE LA LLENADORA  LINEA-4 Y SE OCASIONO UNA HERIDA EN EL ANTEBRAZO DERECHO AL HACER CONTACTO UN UN PEDAZO DE VIDRIO./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-11-18 00:00:00	1
1472	3	4	1	0001	0001	0008	WILBERT VARGAS SE ENCONTRABA CIPIANDO Y CUANDO FUE A SACAR UNA CUBETA DE UN TANQUE SE LE DERRAMO UN POCO SE SODA CAUSTICA HACIENDO CONTACTO CON EL DEDO MINIQUE DE SU PIE DERECHO Y CAUSANDOLE UNA LEVE IRRITACION./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-11-20 00:00:00	1
1475	3	4	1	0001	0001	0008	EN EL MOMENTO QUE JOSE DE JESUS PEÑA SE ENCONTRABA OPERANDO LA LLENADORA DE LINEA-4 UNA DE LAS BOTELLAS EXPLOTO,LO QUE PROVOCO QUE LOS VIDRIOS SALTARAN OCASIONANDOLE DOS HERIDAS LEVES EN LA CEJA Y LA MUÑECA IZQUIERDA./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-11-21 00:00:00	1
1491	3	1	1	0001	0002	\N	Aproximadamente 16:35 hr, el Sr. Camacho con el Sr. Ramos realizaban los cambios de moldes de la máquina sopladora SBO 10 - S2, cuando al momento de hacer dar vuelta el plato giratorio de los moldes, el Sr.Camacho no se percata de la posición de su mano ni de su ubicación por lo que la máquina le termina cortando parte del 3er falange del 5to dedo de la mano derecha.	Camacho Morí, Marino	erick.giron@kr.com.pe	SSOHUAURA	2013-11-27 00:00:00	1
1476	3	1	1	0001	0002	0003	Siendo las 00:30 aproximadamente, el Sr. Yunior Rojas, estaba encargado de destapar las botellas que pasen, sin embargo al realizar dicha labor no se percato que una botella continua se encontraba rota, lo que le ocasiono un pequeño corte en el tercer dedo a la altura del 2do falange de la mano derecha - Línea de Producción N° 1	Rojas Pino, Yunior Eduardo	arturo.janampa@kr.com.pe	SSOHUAURA	2013-11-28 00:00:00	1
1484	3	1	1	0001	0002	0003	Aproximadamente 17:20 hrs se reporta un pequeño corte en el dedo meñique (01 cm), al realizar el mantenimiento preventivo de ventiladores - Taller Mecánico	Mogollón Carbajal, Segundo	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-12-02 00:00:00	1
1486	3	1	1	0001	0002	0003	Se evidencia que muchas veces durante el Cipeo de la LP05, el personal encargado no coloca la empaquetadura de sellado en el tanque pulmón (manipulación de soda caústica)	Ramos Ventocilla, Carlos	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-12-03 00:00:00	1
1487	3	1	1	0001	0002	0003	Se evidencia durante la inspección de rutina de SST, la inadecuada disposición de un cilindro de gas presurizado de Argón, dejado por el personal contratista ZEFP SAC - Línea Isotónica	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-12-03 00:00:00	1
1494	3	1	1	0001	0002	0003	Se observa al Sr. Ramiro Zambrano realizando labores de pintado Spray sin usar la protección ocular adecuada	Rosales Espinoza, Ricardo	ricardo.rosales@kr.com.pe	SGIHUAURA	2013-12-05 00:00:00	1
1500	3	1	1	0001	0002	0003	Se observa una conexión inadecuada que alimenta de electricidad al dispensador de agua en LP03	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SGIHUAURA	2013-12-07 00:00:00	1
1501	3	1	1	0001	0002	0003	Aprox. 08:50 se encuentra a personal de producción presto a realizar labores de saneamiento sin el EPP adecuado	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SGIHUAURA	2013-12-07 00:00:00	1
1497	3	4	1	0001	0001	0008	JOSE LUIS CABRERA SE ENCONTRABA EN LA ENCAJONADORA DE LINEA-4 (VIDRIO) CUANDO UNA DE LAS BOTELLAS SE QUEDO ATASCADA ESTE FUE A RETIRLARLA Y EN ESE MOMENTO EXPLOTO CAUSANDOLE UNA LEVE HERIDA EN EL DEDO MIÑIQUE DE SU MANO IZQUIERDA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-12-07 00:00:00	1
1498	3	4	1	0001	0001	0008	JULIO CESAR ARIAS SE ENCONTRABA APRETANDO UN FONDO EN LA SOPLADORA DE LINEA-2 CUANDO ESTE SE LE RESVALO Y LE PROVOCO UNA LACERACION EN LA CABEZA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-12-09 00:00:00	1
1510	3	1	1	0001	0002	0003	Se evidencia la instalación de un lavaojos artesanal y la inoperatividad de un lavaojos normado ubicado en Tratamiento de Efluentes	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SGIHUAURA	2013-12-10 00:00:00	1
1512	3	1	1	0001	0002	0003	Se evidencia que el extintor Nº 39 esta señalizado como tipo PQS, siendo este de tipo CO2	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SGIHUAURA	2013-12-10 00:00:00	1
1517	3	2	1	0001	0001	0008	CARLOS JUMELLES SE ENCONTRABA QUITANDOLE UNA TAPA CON UN GANCHO A UNA BOTELLA  QUE QUEDO MAL TAPADA Y ESTE SE LE RESVALO Y LE CAUSO UNA LACERACION EN EL DEDO PULGAR DE SU MANO IZQUIERDA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-12-11 00:00:00	1
1518	3	2	1	0001	0002	\N	Se evidencia la presencia de un palé con sacos de purina frente a los tanques de GLP y CO2.	Janampa Arango, Arturo	arturo.janampa@kr.com.pe	SSOHUAURA	2013-12-12 00:00:00	1
1520	3	2	1	0001	0002	0003	Siendo aproximadamente las 8:40 hrs, en la Línea de Producción Nª 1, el sr. Key Paucar se encargaba de trasladar por la guía las cajas vacías, sin embargo en una de ellas pasó con una botella rota, la misma que no se percató y ocasionándole que se cortara la palma de la mano derecha.	Paucar Robles, Key	erick.giron@kr.com.pe	SSOHUAURA	2013-12-13 00:00:00	1
1521	3	4	1	0001	0001	0008	RADALBERTO JAQUEZ SE ENCONTRABA ESTIVANDO PALETAS CUANDO UNA DE ESTAS SE LE RESVALO Y LO GOLPIO, CAUSANDOLE UNA LEVE LACERACION EN SU RODILLA IZQUIERDA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-12-14 00:00:00	1
1528	3	2	1	0001	0002	\N	Siendo las 15:07 hrs. se evidencia el desplome de una paleta de gaseosas en el Almacén de Productos Terminados.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2013-12-20 00:00:00	1
1529	3	2	1	0001	0001	0008	ADEWIN GARCIA SE ENCONTRABA CAMBIANDO UNOS PIÑONES EN LA ETIQUETADORA DE LINEA-6 CUANDO UNO DE ESTOS SE LES RESVALO Y LE PROVOCO UNA HERIDA EN EL DEDO MAYOR DE SU MANO IZQUIERDA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-12-21 00:00:00	1
1531	3	2	1	0001	0001	0008	JOSE AMBIORIX LECLERC FUE A SACAR UNA BOTELLA QUE NO TENIA ETIQUETA  EN LA LLENADORA DE LINEA-2 CUANDO EL RINSE DE ESTA LO GOLPIO Y LE PROVOCO UNA HERIDA EN EL DEDO INDICE DE SU MANO IZQUIERDA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-12-23 00:00:00	1
1532	3	2	1	0001	0001	0008	HELSON CHAVEZ SE ENCONTRABA FLOJANDO UNA PINZA EN LA SOPLADORA DE LINEA-1 CON UN ALICATER DE PRESION Y ESTE SE LE RESVALO Y LE PROVOCO UNA HERIDA EN EL DEDO MAYOR DE SU MANO IZQUIERDA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-12-23 00:00:00	1
1534	3	4	1	0001	0001	0008	LUCIO SOLINO SE ENCONTRABA REPARANDO PALETAS EN CARPINTERIA CUANDO UNO DE LOS CLAVOS TRASPASO LA MADERA Y LO CORTO EN EL DEDO INDICE DE SU MANO IZQUIERDA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-12-24 00:00:00	1
1535	3	2	1	0001	0002	0003	Siendo las 09:45 hrs aproximadamente  se encontró a los trabajadores de EQUINOX RIVER S.A.C. aun trabajando en el túnel de vapor de la Linea de Producción Nª 5, los mismo que ingresaron un día antes a las 09:00 hrs, indicando que trabajaron más de 24 hrs seguidas poniendo en peligro su integridad física debido a que pudieron sufrir accidentes de trabajo por temas de cansancio o fatiga.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-12-24 00:00:00	1
1539	3	1	1	0001	0002	0003	Siendo las 22:00 hrs. aprox. el Sr. Ríos pasó por encima de una palé cuando conducía el porter hyundai blanco a las afueras del almacén de insumos, dejándolo totalmente quebrado.	Ríos Lucho, Julio Ricardo	julio.rios@kr.com.pe	SSOHUAURA	2013-12-27 00:00:00	1
1546	3	1	1	0001	0002	0003	El Sr. Rituay sufre un pequeño corte al realizar el cambio de aros difusores en una de las válvulas de llenado - LP02.	Rituay Mori, Alfredo	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-03 00:00:00	1
1547	3	1	1	0001	0002	0003	El Sr. Orellana sufre un pequeño corte cuando se disponía a cambiar aros difusores de una de las válvulas de llenado - LP02.	Orellana Diaz, Jhon	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-03 00:00:00	1
1544	3	2	1	0001	0001	0008	prueva S.G.I	Lugo Almanzar, Faury	faelalmanzar@hotmail.com	ADMINISTRADOR	2014-01-03 00:00:00	0
1549	3	1	1	0001	0002	0003	Siendo las 02:00 hrs. aprox., se evidenció la caída de cajas con botellas de vidrio cuando se descargaba una pale de un trailer en el patio de maniobras (adyacente a APT).	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-07 00:00:00	1
1551	3	1	1	0001	0002	0003	Siendo las 00:53 hrs. aprox., el Sr. Zegarra indica que realizando el cambio de moldes en la sopladora SBO16 sufre una torsión en la muñeca derecha al cargar uno de los moldes.	Zegarra Taboada, José Joel	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-08 00:00:00	1
1554	3	2	1	0001	0002	0003	Siendo las 15:00 hrs aprox. el Sr. Soto Gerónimo, se realiza un raspón en el brazo derecho, al realizar el cambio de formato de la guía de la faja transportadora de la Línea de Producción N° 3 - LP03	Soto Gerónimo, Junior	erick.giron@kr.com.pe	SSOHUAURA	2014-01-08 00:00:00	1
1556	3	1	1	0001	0002	0003	Siendo las 20:41 hrs. aprox., el Sr. Marcelo se disponía a retirar una palé de botellas de vidrio (generade), cuando de pronto la palé adyacente se desploma, cayendo sobre el montacarga.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-09 00:00:00	1
1557	3	2	1	0001	0001	0008	JOSE MANUEL JUMELLES SE ENCONTRABA CAMBIANDO EL FORMATO DE LA PALETIZADORA DE LINEA-3 CUANDO ESTA BAJO Y LE MAYUGO EL DEDO ANULAR DE SU MANO IZQUIERDA PROVOCANDOLE UNA LEVE HERIDA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2014-01-09 00:00:00	1
1558	3	2	1	0001	0001	0008	JUAN PORTOLATIN ESTEVEZ SE ENCONTRABA SANEANDO EN LA LINEA-1 CUANDO UNA DE LAS VALVULAS SE BLOQUEO Y  ESTE FUE A TRATAR DE ARREGLARLA Y EN ESE MOMENTO SE DISPARO Y LE CAYO SODA CAUTICA EN SU BRAZO IZQUIERDO PROVOCANDOLE UNA PEQUEÑA IRRITACION./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2014-01-09 00:00:00	1
1341	3	1	7	0001	0001	0008	SE DETECTO SWICHER TIC TAC SIN LA TAPA DE PROTECCION ELECTRICA EN EL ALMACEN DE AZUCAR./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-03 00:00:00	1
1559	3	2	1	0001	0002	0003	Siendo las 14:10 hrs. aprox., el Sr. José Collantes estaba limpiando la faja de botellas del abastecedor de la línea de Producción Nro. 5, cortándose el dedo.	Collantes Palma, José Luis	erick.giron@kr.com.pe	SSOHUAURA	2014-01-09 00:00:00	1
1561	3	2	1	0001	0002	0003	Siendo las 14:10 hrs el Sr. Jefersson Mendoza estaba de pantallero en la LP01 y cuando se proponía a trasladar una caja de botellas rotas, una de ellas se encontraba con el pico hacia arriba lo que le ocasiona un corte en el dedo pulgar.	Mendoza Ruiz, Jefersson	erick.giron@kr.com.pe	SSOHUAURA	2014-01-10 00:00:00	1
1562	3	1	1	0001	0002	0003	Siendo las 14:45 hrs ocurrió una fuga de amoniaco en la sala de fuerza, esto sucedió debido a que la válvula de seguridad del tanque de amoniaco se había levantando por la alta presión generada al reiniciar los compresores.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2014-01-10 00:00:00	1
1563	3	1	1	0001	0002	0003	El Sr. Valdivia sufre un pequeño corte en la mano izquierda cuando se disponía a enrollar una manguera en la LP05.	Valdivia Sanchez, Miguel	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-10 00:00:00	1
1566	3	1	1	0001	0002	0003	Se encuentra cilindros de gas comprimido, que vienen siendo utilizados para trabajos en caliente, que no han sido debidamente asegurados en Tratamiento de Aguas.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-12 00:00:00	1
1567	3	1	1	0001	0001	0008	Tomy Peralta se encontraba colocando huacales de botellas de vidrio y se ocasiono una leve herida en el dedo mayor de la mano derecha al hacer contacto con una botella rota.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2014-01-15 00:00:00	1
1618	3	1	1	0001	0002	0002	Aproximadamente a las 08:40am el señor Frank Canasas operador suplente de montacargas conducia el montacarga toyota Nº 2, por una frenada repentina hizo caer un pallet de gaseosa sabor negra formato 3000ml.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-15 00:00:00	1
1569	3	1	1	0001	0001	0008	JUAN FRANCISCO BAEZ SE ENCONTRABA SANEANDO EN LA SALA DE PASTEURIZADO CUANDO AL HECHAR LA SODA CAUTICA ESTA SUBIO DE REPENTE Y LE CAYO EN AMBOS BRAZOS DEL CUERPO CAUSANDOLE UNA LEVE IRRITACION./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2014-01-16 00:00:00	1
1622	3	1	1	0001	0002	0002	En el área de desmedros el señor Rolando Loayza, chofer del camión de placa V5N-992, trabajador de la empresa Fredimar, haciendo uso de una escalera de aluminio catalogada como chatarra para subir y bajar de la ranfla del camión (realizando un acto inseguro), la escalera resbala  cayéndose el señor Rolando, golpeándose la cabeza en el aro de la llanta trasera derecha del camión.	Apaza Charca, Brando	brando.apaza@kr.com.pe	SGIAREQUIPA2	2014-01-18 00:00:00	1
1623	3	1	1	0001	0002	0002	En instantes en que se realizaba el saneamiento del Flomix, al señor Alejandro Melo Apaza, le cayó en el ojo izquierdo una solución de Neocloran, desinfectante que en ese momento se estaba utilizando.	Apaza Charca, Brando	brando.apaza@kr.com.pe	SGIAREQUIPA2	2014-01-20 00:00:00	1
1572	3	1	1	0001	0002	0003	Siendo las 19:50 hrs el Sr. Dick León reporta que al llegar a planta se dirigió a los vestuarios y encontró que su candado había sido manipulado, a la vez que al abrir su casillero se dio con la sorpresa que se habían llevado también sus zapatos punta de acero.	León Romero, Dick	erick.giron@kr.com.pe	SSOHUAURA	2014-01-20 00:00:00	1
1574	3	2	1	0001	0002	0003	Se reportó una condición insegura en la forma de apilamiento de los palets de botellas de vidrio, los mismos que en la 2da cama se encuentran apoyados en dos palets de la 1ra cama, lo que hace  difícil sacar los palets ubicados en la parte inferior porque se corre el riesgo que los de arriba se caigan.	Millan Nazario, Marcelo	erick.giron@kr.com.pe	SSOHUAURA	2014-01-22 00:00:00	1
1577	3	1	1	0001	0002	0003	Siendo las 10:15 hrs. aprox., el Sr. Marcos indica haberse golpeado el hombro al pasar debajo del transportador de la LP03 - Llenadora Mesal.	Marcos Abnet, Claudio	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-23 00:00:00	1
1578	3	2	1	0001	0002	0003	Siendo las 16:00 hrs aprox., se constata que dejaron encendida una olla arrocera en el Comedor, a raíz del fuerte olor a quemado.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-23 00:00:00	1
1582	3	2	1	0001	0001	0008	FRANCIS PERALTA ESTABA PARADO AL LADO DE UN ABANICO DE PEDESTAL Y EN ESE MOMENTO UNA DE LAS ASPAS SE LE ROMPIO CAUSANDOLE UN LEVE GOLPE EN LA MUÑECA DERECHA./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2014-01-23 00:00:00	1
1579	3	1	1	0001	0001	0008	EL SEÑOR RAFAEL BONILLA SE ENCONTRABA REGULANDO LA ESTRELLA EN LA ENTRADA DEL RINSE EN LA LLENADORA DE LINEA-1 EN EL MOMENTO EN QUE SE DESCUIDO Y ENTRO EL DEDO MEÑIQUE DE SU MANO IZQUIERDA PROVOCANDOLE UNA HERIDA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2014-01-24 00:00:00	0
1580	3	1	1	0001	0002	0003	Que aproximadamente a las 23:50 hrs, se evidencia que una tubería con conexión a Investigación y Desarrollo (ID), se produjo una ruptura del codo de unión, por la presión ejercida  del  agua,  dando aviso al personal en cargado y al corte respectivo para su verificación.	Guerrero Peralta, Janssen Estewar	\N	SSOHUAURA	2014-01-24 00:00:00	1
1581	3	1	1	0001	0002	0003	Siendo las 00:00, dan aviso que hay presencia de salpicadura de soda en el tanque de mezcla y la tapa del pasteurizador mal tapada en la Línea N°5, se evidencian ambos puntos dentro de las cuales se encuentra el operador del Flomix (LEON ROMERO, DICK) y del sistema CIP (PERNIA HUERTA, ERMINIO), que por motivos de una mala coordinación pueden causar accidentes, se evidencio el peligro inminente hacia sus compañeros de trabajo, ellos salieron antes que ocurriera dicho peligro por motivo de su resp	Guerrero Peralta, Janssen Estewar	\N	SSOHUAURA	2014-01-24 00:00:00	1
1584	3	1	1	0001	0001	0008	El señor Rafael Bonilla se encontraba cambiando la estrella de la entrada del rinser de la llenadora de la linea no.01 y resbaló en el momento en que estaba realizando esta labor provocanse una cortadura en el dedo meñique de su mano.	Torres , Edward	etorres@kolareal.com.do	VISITAS	2014-01-24 00:00:00	1
1585	3	1	1	0001	0001	0008	El señor Rafael Bonilla se encontraba cambiando la estrella de la entrada del rinser de la llenadora de la linea no.01 y resbaló en el momento en que estaba realizando esta labor provocanse una cortadura en el dedo meñique de su mano.	Torres , Edward	etorres@kolareal.com.do	VISITAS	2014-01-24 00:00:00	0
1586	3	1	1	0001	0001	0008	Félix Javier Torres se encontraba estivando en linea-2 y en ese momento fue a sujetar un separador lo que le ocasiono una leve herida en el dedo índice de la mano izquierda./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2014-01-27 00:00:00	1
1590	3	1	1	0001	0002	0003	Estaba subiendo el Sr. William La Rosa a realizar unas medidas de la parte posterior de la Sala de Tratamiento de Aguas y al momento de bajar y sacar el brazo del tijeral donde estaba apoyado, se ocasiona un raspón.	La Rosa Villanueva, William Abel	erick.giron@kr.com.pe	SSOHUAURA	2014-01-29 00:00:00	1
1594	3	1	1	0001	0002	0003	Se evidencia que para limpiar la reja curva de separación de sólidos, se viene utilizando una tabla de madera como soporte para aproximarse y realizar las labores de limpieza.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2014-01-29 00:00:00	1
1595	3	1	1	0001	0001	0008	JUAN DE JESUS ESTEVEZ SE ENCONTRABA SOLDANDO LA TUBERIA DE BAJA PRESION DEL MOTOR DE ENFRIAMIENTO DEL TANQUE-1 DE CO2 EN EL MOMENTO EN QUE SE RESVALO Y PEGO SU CUELLO EN DICHA TUBERIA PROVOCANDOLE  UNA QUEMADURA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2014-01-31 00:00:00	1
1631	3	1	1	0001	0002	0002	A horas 07:30am el señor Quispe Paxi José al bajar un pallet de la ruma le cae en la pantorrilla de la pierna derecha, causándole dolor y una pequeña inflamación.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-31 00:00:00	1
1596	3	1	1	0001	0002	0003	El Sr. Trinidad se proponía a realizar el cambio de la electrobomba de la máquina pasteurizadora de la línea isotónica, cuando sin querer se aproxima su brazo al tubo caliente provocándole una quemadura.	Trinidad Ochoa, Reynaldo	erick.giron@kr.com.pe	SSOHUAURA	2014-02-01 00:00:00	1
501	3	1	2	0001	0002	0003	Presento un corte en la mano en la zona del pulgar al manipular la carga y descarga de las cajas de botellas de vidrio.	Romero Portuguez, Luis	luis.meza@kr.com.pe	SGIHUAURA	2012-07-12 15:39:10	1
505	3	1	2	0001	0002	0003	Se evidencia que la Sra. Nilda Marzano Pino se lastimo el pie al pisar una tabla con clavos al seleccionar las botellas de plasticos en la zona de Desmedros.	Marzano Pino, Dinner	luis.meza@kr.com.pe	SGIHUAURA	2012-07-18 15:53:30	1
610	3	4	2	0001	0001	0008	Una paleta de prueba al momento de ser apilada por el montacarguista Francisco Rodriguez  estaba ha punto de caer ya que no soporto el peso de jugos que contenia.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-15 03:10:56	1
668	3	4	2	0001	0001	0008	Durante la instalación de las columnas para el techado de la nueva nave, una columna se desliza al momento de bajarla al piso, ésto ocurrió debido a que la correa de la grúa se sale de su punto.	Mercado  Núñez, Miguel	mmercado@kolareal.com.do	SSDOMINICANA	2012-10-20 13:42:08	1
741	3	1	2	0001	0002	0003	El Sr. se encontraba en el area de soplado realizando pruebas caida libre d elas botellas pet, esta reboto y le golpio el dedo produciendole un leve raspon en el dedo pulgar de la mano izquierda.	Peña Carrillo, Miguel	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-30 23:41:28	0
746	3	2	2	0001	0002	0003	Se produce derrame de concentrado a traves de la tubería que conecta sala de jarabe con el sistema CIP	Civico Gamarra, Humberto	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-04 01:12:39	1
756	3	2	2	0001	0002	0003	El Sr. informa que se encontraba lavando botellas de vidrio manualmente, cuando agarro una botellas y se incrusto una pequeña astilla en el dedo pulgar de la mano derecha.	Grados Torres, Jose	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-06 17:21:08	1
757	3	2	2	0001	0002	0003	El operador se encontraba en el puesto de alimentación de botellas de vidrio a la linea isotónica, preparando las camas de botellas para colocarlas en la linea cuando se produjo un leve corte en el dedo pulgar de la mano izquierda.	Llantoy Quispe, Carlos	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-07 13:28:46	1
771	3	4	2	0001	0002	0003	Se observa en la sala de jarabe simple que sobre sale del piso restos de metal.	Santa Cruz Vasquez, Cristina	cristina.santacruz@kr.com.pe	SSOHUAURA	2012-12-12 15:37:50	1
772	3	4	2	0001	0002	0003	El operador de sala dejarabe informa que no hay botas en stock en almacen.	Puescas Eca, Nilton	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-12 15:40:04	1
798	3	1	2	0001	0002	0003	EL operador informa que se quemo con la tuberia caliente del pasteurizador al realizar la manipulacion de la valvula.	Marcos  Abnet, Claudio	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-08 16:54:21	0
811	3	4	2	0001	0002	\N	El intercominicador de sala de jarabe terminado se encuentra malogrado	Parientes Sanchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-08 22:35:51	1
828	3	4	2	0001	0002	0002	El colaborador Hubert Neyra Tayña estaba paletizando en la línea 1 de vidrio, el día 11/01/2013 a las 06:10 a.m., al levantar la caja se cortó con un vidrio.	Huertas Sueros, Victor	victor.huertas.sgi@gmail.com	SGIAREQUIPA2	2013-01-11 14:44:15	1
838	3	4	2	0001	0002	\N	El Op. se encontraba alimentando cajas de botellas al transportador, cuando le cayendo una botella golpeándole la pierna.	Mallma Silvera, Marco	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-16 20:49:59	1
839	3	2	2	0001	0002	0003	El Op. se encontraba alimentando cajas de botellas al transportador, cuando le cayendo una botella golpeándole la pierna.	Mallma Silvera, Marco	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-16 20:50:07	0
884	3	1	2	0001	0001	0008	EL TRABAJADOR, LUIS JOSÉ VARGAS AL REALIZAR UN TRABAJO DE MANTENIMIENTO DE LIMPIEZA EN LA ETIQUETADORA, AL UTILIZAR GASOIL DIESEL PARA SUSTITUIR EL DISOLVENTE DE LIMPIENZA LE OCACIONÓ UNA IRRITACIÓN EN LOS OJOS .	Reynoso Núñez , Filiberto	freynoso@kolareal.com.do	SSDOMINICANA	2013-02-06 20:15:07	0
894	3	1	2	0001	0001	0008	El trabajador Delio Domingo Zapata al sujetar un huacal que contenia botellas de vidrio llanas del color negro, una de las botellas explotó y le ocacionó una herida leve en la mejilla.	Reynoso Núñez, Filiberto Antonio	freynoso@kolareal.com.do	SSDOMINICANA	2013-02-27 10:08:03	0
895	3	4	2	0001	0001	0008	El trabajador Delio Domingo Zapata al sujetar un huacal que contenia botellas de vidrio llanas del color negro, una de las botellas explotó y le ocacionó una herida leve en la mejilla.	Reynoso Núñez, Filiberto Antonio	freynoso@kolareal.com.do	SSDOMINICANA	2013-02-27 10:08:22	1
897	3	2	2	0001	0002	0003	Estaba sacando insumos del almacén y por sacar el bidón de casualidad se cayo la escalera y rozo con un bidón de emulsión rasgándose y formándose un goteo.	Condor  Sanchez , Johan Victor	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 14:05:46	1
920	3	4	2	0001	0002	0003	El operador le cayo una gota de gaseosa en el ojo, cuando se cayo una botella de gaseosa en el piso y revento.	Reyes Zavaleta, Robin	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-01 22:25:46	1
926	3	4	2	0001	0002	0003	Aproximadamente a las 17:30 del 04.03.13 se reporta sobre el derrame de producto Hypofoam en el almacén de insumos químicos.	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-03-05 00:10:58	1
954	3	4	2	0001	0002	0002	Se sigue resepcionando parihuelas en mal estado rotas, rajadas; con el riesgo  de caerse los sacos o quebrarse en dos los palet, poniendo en riesgo la seguridad de los que laboramos en dicha zona.	Quispe Choque, Mauro	cesar.llave@kr.com.pe	SGIAREQUIPA2	2013-03-26 22:41:45	1
957	3	4	2	0001	0002	0002	A las 07:00 horas de hoy, al momento de recoger una caja de preforma de la rampa de desmedros se observo que en el interior de la caja de preforma había basura mezclada: cajas de tapas, estrech film, sorbetes, barro, y restos de vidrio roto, en gran cantidad y desparramado por todo el interior.	Apaza Zeballos, Jack	cesar.llave@kr.com.pe	SGIAREQUIPA2	2013-03-27 19:55:35	1
1059	3	4	2	0001	0001	0008	EL SR. BALDWIN ANDRES GIL AL MOMENTO DE RETIRAR CON SUS MANOS UN PAQUETE CON DEFECTO DEL TRANSPORTADOR QUE SALE DE LA EMPACADORA, SUFRE UN ATRAPAMIENTO CON EL TRANSPORTADOR PRODUCIENDOLE UNA LACERACIÓN EN EL DEDO DE LA MANO./n	Mercado Nuñez, Miguel	mmercado@kolareal.com.do	ADMINISTRADOR	2013-04-05 00:00:00	1
995	3	4	2	0001	0002	0003	Presenta salpicadura de producto quimico, en la frente.	Curo Huertas, Cristian	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-04-13 00:00:00	1
1000	3	4	2	0001	0002	0003	El Sr. se corto levemente el dedo pulgar de la mano derecha al retirar botellas del detector de vacio de la linea isotonica	Guadalupe Hijar, Luis	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-04-19 00:00:00	1
976	3	4	2	0001	0002	0002	El colaborador Luis Manrrique se encontraba paletizando  en la linea 3,cuando su compañero de linea fue a levantar un separador de color verde para colocar en el pallet golpeandole el ojo derecho	Flores Barriga, Nadieshda	nadieshda.flores@kr.com.pe	SGIAREQUIPA2	2013-04-19 18:14:12.5	1
1068	3	1	2	0001	0002	0003	Aprox. 11:40 al Sr. Eder Espinoza Cívico le salpica al ojo izquierdo mientras limpiaba la solución de soda caustica que se encontraba empozada en su area de trabajo.	Espinoza Civico, Eder	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-05-17 00:00:00	1
1113	3	1	2	0001	0002	0002	Aproximadamente a las 09:00am el operador de montacarga lindel Nº2 Wilson Abado Carvajal fue a mover dos cajas de preformas llenas de vidrio roto y la base de la caja superior se encontraba mojada inclinándose al momento de ser movida cayéndose y rociándose el vidrio roto en el patio de desmedros.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-05-27 00:00:00	1
1114	3	1	2	0001	0002	0002	Aproximadamente a las 09:00am el operador de montacarga lindel Nº2 Wilson Abado Carvajal fue a mover dos cajas de preformas llenas de vidrio roto y la base de la caja superior se encontraba mojada inclinándose al momento de ser movida cayéndose y rociándose el vidrio roto en el patio de desmedros.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-05-27 00:00:00	0
1107	3	1	2	0001	0002	0003	Se reporta que un personal de constructora SSO casi toma accidentalmente Gasolina 84 cuando solicito se le invite una gaseosa (almacén del personal de limpieza)	Villalobos Ibañez, Carlos	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-05-27 00:00:00	1
1148	3	1	2	0001	0002	0002	Al promediar las 06:45 el trabajador Leonel Bejarano chocó el portón de la planta de jugos con el montacarga.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Llave Pinto, César	cesar.llave@kr.com.pe	SGI 310	2013-06-19 00:00:00	1
1151	3	1	2	0001	0002	0002	El trabajador Martin Tagle (operario rotativo de linea) se golpeo con una parihuela el empeine del pie derecho.\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Llave Pinto, César	cesar.llave@kr.com.pe	SGI 310	2013-06-20 00:00:00	1
1162	3	1	2	0001	0002	0003	Siendo las 09:40 am en la Línea 02 el Sr. Cristian Cuno Huertas estaba paletizando cuando bajo una paleta rota (sin darse cuenta) y una de las tablas cae sobre su hombro.	Cuno Huertas, Cristian	\N	SSOHUAURA	2013-06-27 00:00:00	0
1250	3	1	2	0001	0002	0002	El operador de la llenadora línea 2, reporto que la máquina estaba rechazando la botella PET  vacia, ocasionado que esta se trabe y salpique líquido por todo el área.	Coaquira Paz, Claudia	claudia.coaquira@kr.com.pe	SGI 310	2013-08-12 00:00:00	1
1268	3	1	2	0001	0002	0002	El dia 21-08-2013 a horas 12:30pm. en la baranda de la ranfla de APT, fui a jalar un hilo metalico. que se encontraba entre el piso y la baranda, produciendome un corte en el dedo indice de la mano isquierda.	Cucho Vilca, Fred	victor.huertas@kr.com.pe	SGI 310	2013-08-21 00:00:00	1
1270	3	1	2	0001	0002	0002	El dia 23-08-2013 a horas 11:30am, el señor Andres Caceres supervisor de estibadores. fue abrazar el rollo de stretch, para que no se cayera, el cual tubo un pedazo de vidrio. produciendo un corte en el antebrazo isquierdo.	Huertas Sueros, víctor	victor.huertas@kr.com.pe	SGI 310	2013-08-23 00:00:00	1
1276	3	1	2	0001	0002	0002	El día 03 setiembre, encontre en la zona peatonal del patio principal, bidones de hipoclorito de sodio y sacos de cal, almacenados de un lugar inadecuado y obstaculizando el paso.	Coaquira Paz, Claudia	claudia.coaquira@kr.com.pe	SGI 310	2013-09-03 00:00:00	1
1303	3	1	2	0001	0002	0003	Se evidencia una inadecuada disposición de de botellas con CO2 cerca de I&D (almacenamiento inadecuado en posición horizontal).	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SGIHUAURA	2013-09-19 00:00:00	1
1313	3	1	2	0001	0002	0002	El día 07-09-13  a horas 7:00 al momento de pasar la merma la guarda de la etiquetadora de la linea Nº3 cayo y me imapacto en el rostro ocasionandome golpe y herida.	Huanca Mamani, Noe	\N	SGI 310	2013-09-28 00:00:00	1
1370	3	1	2	0001	0001	0008	caída desnivel	Lugo Almanzar, Faury	faelalmanzar@hotmail.com	ADMINISTRADOR	2013-10-09 00:00:00	0
1396	3	1	2	0001	0002	0002	EL DIA 15/10/13 APROXIMADAMENTE 08:AM EN EL AREA DE PRODUCCION LINEA #2 EL CONTENEDOR DE MERMAS SE ENCONTRABA EN MAL ESTADO, PRESENTANDO DOS ESQUINAS DESOLDADAS PROVOCANDO CORTES AL PERSONAL YA QUE TIENE EN LOS BORDES PARTES FILUDAS.	HUERTAS , VICTOR	victor.huertas@kr.com.pe	SGI 310	2013-10-15 00:00:00	1
1404	3	1	2	0001	0002	0003	Siendo las 10:00 hrs aprox. el Sr. Carlos estaba encargado de realizar el lavado de válvulas con el químico 2180Plus, causándole irritación a sus manos aun usando guantes de protección, por lo que se cree que estas estarían en mal estado.	Ramirez Palma, Carlos	erick.giron@kr.com.pe	SSOHUAURA	2013-10-23 00:00:00	1
1444	3	1	2	0001	0002	0003	Para ingresar a la Planta de Tratamiento de Agua para Producción hay una pequeña rampa hechiza formada por retazos de madera, la misma que se mueven debido a que el operario pasa constantemente por ahí trayendo bultos (sacos de sal), por lo que esta situación puede terminar ocasionando un accidente.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-11-13 00:00:00	1
1474	3	1	2	0001	0002	0003	Siendo las 12:20 hrs llega a Tópico el Sr. Andrade viene a atenderse por una hinchazón en su mano izquierda, indicando que aproximadamente a las 10:00 hrs en la LP3, estaba bajando un palet para realizar su trabajo, de este se desprende una madera golpeándole la mano.	Andrade Bustamante, Meier	erick.giron@kr.com.pe	SSOHUAURA	2013-11-20 00:00:00	1
1489	3	1	2	0001	0002	0003	Se evidencia al personal que realizaba saneamiento a la LP05, no contaba con guantes de seguridad ni gafas.	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-12-03 00:00:00	1
1536	3	2	2	0001	0002	0003	Siendo las 09:00 hrs aprox. el Sr. Orellana indica que llevando el cilindro de Oxígeno para el ozonizado de la LP03, realiza la colocación del cilindro sobre el pediluvio - solución de agua y Jon Clean (amonía cuaternaria), salpicándole al ojo derecho causándole irritación.	Orellana Diaz, Jhon Alexander	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-12-26 00:00:00	1
1338	3	1	7	0001	0001	0008	SE DETECTO LUCES DE EMERGENCIA QUEMADAS Y SIN PROTECCION EN EL PASILLO DE ENTRADA A JARABE SIMPLE./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-03 00:00:00	1
1545	3	1	2	0001	0002	0003	Siendo las 11:30 hrs. aprox. se evidencia el desprendimiento de una manguera, instalada provisionalmente para unir el flomix de la LP02 y la llenadora de la LP03, debido a la alta presión de trabajo.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-02 00:00:00	1
1617	3	1	2	0001	0002	0002	En el área de desmedros se encontró una caja de preforma con sacos y un bidón de sanitizante sin tapa, el liquido sin tapa se derramo provocando un  olor afixiante y mareos al personal que labora en dicha área.	Mora Bernal, Yvessy	\N	SGIAREQUIPA2	2014-01-14 00:00:00	0
1634	3	1	2	0001	0002	0002	En el area de desmedros se encontro una caja de preforma con sacos y un bidon de sanitizante sin tapa, el liquido que éste contenia se derramo, provocando un  olor afixiante y mareos al personal que labora en dicha área.	Mora Bernal, Yvessy	\N	SGIAREQUIPA2	2014-01-14 00:00:00	1
1571	3	1	2	0001	0002	0003	Siendo las 10:00 hrs. aprox., el Sr. Cotrina indica que acomodando las paletas en el Almacén de Producto Terminado, sufre un golpe en la mano derecha al intentar jalar una de ellas.	Cotrina Arcos, Fernando Segundo	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-20 00:00:00	1
1575	3	1	2	0001	0002	0003	Paletizando, cogí un separador, en la cual me produje una herida en mi brazo derecho.	De La Cruz Cierto, William	erick.giron@kr.com.pe	SSOHUAURA	2014-01-23 00:00:00	1
574	3	1	3	0001	0002	0003	Se observo la obstruccion de la tuberia de la lavadora.	Moreno Tuanama, Fidel	luis.meza@kr.com.pe	SGIHUAURA	2012-09-06 14:11:38	1
576	3	4	3	0001	0001	0008	Durante la instalación de las mallas en la escalera de reactores se notó que el cable de alimentación eléctrica al equipo de soldar se encontraba en mal estado.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-07 16:39:05	1
583	3	4	3	0001	0001	0008	El cable de corriente electrica que alimenta el taladro manual esta en mal estado ya que esta reparado con funda plastica en el lugar donde esta añadido o pelado.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-09 18:05:18	1
584	3	4	3	0001	0001	0008	El cable de corriente electrica que alimenta el taladro manual esta en mal estado ya que esta reparado con funda plastica en el lugar donde esta añadido o pelado.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-09 18:05:30	1
591	3	4	3	0001	0001	0008	LA BOMBITA QUE ESTA ENTRE EL ABLANDADOR DE AGUA 2 Y EL PURIFICADOR DE CARBON 5 ESTA EN MALAS CONDICIONES PORQUE NO TIENE LA TAPA QUE CUBRE LOS CABLES ELECTRICOS.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-11 11:20:54	1
625	3	4	3	0001	0001	0008	Habia un operario subido en la encajonadora de la linea de vidrio en momento que la maquina estaba operando.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-19 04:47:29	1
660	3	1	3	0001	0001	0008	EN LA SALA DE JARABE TERMINADO LOS MOTORES NO TIENEN PROTECTOR.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-10-14 06:40:22	1
684	3	1	3	0001	0001	0008	EN LA SALA DE JARABE SE NOTO QUE UNO DE LOS TANQUES DE DICHA AREA TIENE UN SOPORTE TORCIDO Y A PUNTO DE SALIR DE SU CENTRO.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-11-02 23:34:00	1
698	3	1	3	0001	0002	0003	El colaborador indica en la zona de PASTEURIZADO Y NITROGENADO se encuentra  descubierta una tuberia que transporta fluidos calientes.	Dionicio Mendoza, Jose	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-07 17:49:19	1
707	3	4	3	0001	0001	0008	LA RESISTENCIA DE UNION DE PLASTICO SE ENCUENTRA CON LAS BOTELLAS DAÑADAS, POR LO QUE AL MOMENTO DE OPERAR NO SE MANTIENE ARRIBA, LO CUAL PUEDE OCASIONAR QUEMADURAS AL OPERADOR AL MOMENTO DE OPERAR.	Mercado Núñez, Miguel	mmercardo@kolareal.com.do	SSDOMINICANA	2012-11-13 18:51:36	1
708	3	4	3	0001	0001	0008	LA RESISTENCIA DE UNION DE PLASTICO SE ENCUENTRA CON LAS BOTELLAS DAÑADAS, POR LO QUE AL MOMENTO DE OPERAR NO SE MANTIENE ARRIBA, LO CUAL PUEDE OCASIONAR QUEMADURAS AL OPERADOR AL MOMENTO DE OPERAR.	Mercado Núñez, Miguel	mmercardo@kolareal.com.do	SSDOMINICANA	2012-11-13 18:51:47	1
712	3	2	3	0001	0002	0003	El personal obrero, retiro parte del transportador  de cajas de botella de vidrio de la linea 1.	Parientes Sánchez, Deyvi Alan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-16 00:03:13	1
749	3	2	3	0001	0002	0003	El operador comunico que el agua del comedor esta turbia/n	Bernal Vallejo, Hector	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-04 23:57:03	1
750	3	2	3	0001	0002	0003	El sr. informo que el montacarga Linde 1, presenta pequeños raspones en la parte posterior	Gurgura , Hernan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-04 23:59:02	1
776	3	4	3	0001	0002	0003	El operador reporto que en la linea isotonica; el empaque de la tuberia de vapor revento.	Galvez Flores, Luis	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-13 21:58:12	1
778	3	4	3	0001	0002	0003	Se evidencio que el desague de la canaleta de la linea isotonica estaba obstruida.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-14 22:43:40	1
820	3	4	3	0001	0002	0003	El operador informa que el tubo de venteo de la llenadora mesal 80-100-25, se salió de la válvula 24.	Fernandez  Velarde, Jose	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-10 23:10:32	1
861	3	2	3	0001	0002	0003	El Op. reporta que los sensores de las puertas de la llenadora 50-60-15 de la línea 2, presenta todos los sensores de las puertas desactivados.	Plasencia Roman, Roger	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-24 21:52:10	0
862	3	4	3	0001	0002	0003	El Op. reporta que el sistema de automatizacion de la llenadora mesal 50-60-15, no funciona correctamente, presentando problemas operativos.	Plasencia Roman, Roger	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-24 21:53:55	1
909	3	4	3	0001	0002	0003	Se presento una pequeña fuga de GLP en el sistema del caldero por los ductos de ingreso de gas. la fuga se da en la válvula reguladora que tiene los pernos interiores rotos.	Purizaga Saavedra, Erikc	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 15:01:50	1
911	3	4	3	0001	0002	0003	Se encontró el montacarga raspado en el lado trasero del vehículo, con evidencias de una pared.	Salvador Salvador, Luis	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 15:15:48	1
913	3	4	3	0001	0002	0003	Se presento un problema en el tunel de enfriamiento de la linea #5, la bomba de retorno sufre desperfecto.	Prizaga Saavedra, Erikc	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 15:22:02	1
919	3	4	3	0001	0002	0003	Aprox. 00:15 Hrs del 01.03.13 se detecta la fuga de CO2 por uno de los filtros de ductos en TQ CO2 del proveedor Tecnogas.	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-03-01 08:03:15	1
921	3	4	3	0001	0002	0003	Mientras realizaba las inspecciones en la linea #5, cerca de la maquina ENCAPSULADORA, me callo gotas de agua caliente de las lineas de vapor, produciéndome quemaduras de menor grado.	Purizaga Saavedra, Erikc	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-02 14:26:26	1
931	3	4	3	0001	0002	0003	La manguera de aire de la colocadora de precintos de la linea isotónica, se soltó y empezó a serpentear.	Parientes Sanchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-06 11:07:24	1
940	3	4	3	0001	0002	0003	El Sr. reporta que la base que soporta el extintor del montacargas toyota 5 se rompió	Giron Espinoza, Niel	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-11 14:41:43	1
942	3	4	3	0001	0002	0003	El Op. de almacén se encontraba manejando el montacargas toyota 5 cuando al ingreso del almacén de preformas la rueda se enreda con la persiana y toda la estructura de sujeta la persiana se cae.	Montoya Collantes, Carlos	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-13 01:03:50	1
951	3	4	3	0001	0002	0003	Se reporta bomba que alimenta tanque de agua de los SS.HH. malograda.	Espinoza Bravo, Javier	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-22 12:08:17	1
953	3	4	3	0001	0002	0003	Fractura de válvula bola en la linea de vapor de LP5.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-26 00:33:07	1
955	3	4	3	0001	0002	0003	Reporto que el montacargas LINDE 01 presenta bajo nivel de aceite, ademas de emisión de fluido negro por el tubo de escape.	Villalobos Ibañez, Carlos	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-03-27 06:25:11	1
994	3	4	3	0001	0002	0003	Caida del tubo de las valvulas de la llenadora 60-80-25 de la linea 3, de la produccion de agua cielo	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-04-13 00:00:00	1
997	3	4	3	0001	0002	0003	Fuga de refrigerante por la valvula de seguridad del chiller de la linea 2.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-04-13 00:00:00	1
1082	3	4	3	0001	0001	0008	Domingo Thomas recibio una leve herida en la pierna izquierda, por que al romperce una botella un vidrio salto y le ocasionó dicha herida, cuando operaba la encajonadora de linea de vidrio.	Mercado , Miguel	mmercado@kolareal.com.do	ADMINISTRADOR	2013-05-07 00:00:00	1
1043	3	1	3	0001	0002	0003	Se reporta que el sensor de inclinacion del LINDE 1 biene presentando fallas.	Inocente Meztansa, Miguel	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-09 00:00:00	0
1044	3	1	3	0001	0002	0003	Se observa que la puerta adyacente a salida de botellas de la lavadora, se encuentra colgando.	Inocente Meztansa, Miguel	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-11 00:00:00	0
1045	3	1	3	0001	0002	0003	Se reporta que el sensor de inclinacion del LINDE 1 biene presentando fallas.	Inocente Meztansa, Miguel	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-11 00:00:00	1
1046	3	4	3	0001	0002	0003	Se observa que la puerta adyacente a salida de botellas de la lavadora, se encuentra colgando.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-11 00:00:00	1
1108	3	1	3	0001	0002	0002	Siendo las 15:30pm se encontro el cinturon de seguridad del lindel Nº 3 travado	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-05-16 00:00:00	1
1112	3	1	3	0001	0002	0002	En nuestra área de trabajo, sala de jarabe terminado y laboratorio fisicoquímico. hay un olor de soda que sale de la lavadora (vapor) ese vapor nos incomoda día y noche.	Mendoza Pinto, Randu	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-05-17 00:00:00	1
1080	3	1	3	0001	0002	0003	La bomba del sistema hidraulico del elvedor de botellas solo cuenta con la mitad de aceite.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-18 00:00:00	1
1053	3	1	3	0001	0001	0008	SE DETECTA FUGA DE VAPOR EN EL INTERCAMBIADOR DE PLACAS DEL PASTEURIZADOR DE LA LÍNEA DE PRODUCCIÓN 06.	Salvatierra Romero, Carlos	csalvatierra@kolareal.com.do	ADMINISTRADOR	2013-05-21 00:00:00	1
1155	3	4	3	0001	0001	0008	CUANDO SE ESTABAN MOVIENDO LAS MAQUINARIAS DE LINEA KRONES A UNO DE LOS MONTACARGAS SE LE SAFO UNO DE LOS CONECTORES DE UNA  MANGUERA HIDRAULICA,YA QUE DICHO CONECTOR NO ESTABA BIEN ASEGURADO./n/n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-06-12 00:00:00	1
1131	3	1	3	0001	0002	0003	Habiendo finalizado el acondicionamiento de la línea de producción N°2, de pronto la manguera del aire se suelta, comenzandose a moverse bruscamente  (parecia latigo), felizmente nadie resulto herido, sin embargo esto se ocasiono porque dicha manguera solo estaba unida a presión y asegurada con cinta aislante./nHora - 00:10 am	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-06-20 00:00:00	1
1181	3	1	3	0001	0001	0008	Se encuentra soporte de transportador en mal estado.	Mercado Nuñez, Miguel	mmercado@kolareal.com.do	VISITAS	2013-07-06 00:00:00	1
1221	3	1	3	0001	0002	0003	Siendo aproximadamente las 16:00 pm, la Lic. Verónica Ubillus  nos pasa la voz indicando que se haba caído la televisión con todo el DVD, felizmente no se encontraba nadie en el sitio, e indica la encargada que ese televisor ya se venia tambaleando.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-08-16 00:00:00	1
1289	3	1	3	0001	0002	0003	Mientras se realizaba las inspecciones de rutina, se encontró que en planta de Tratamiento de Agua había varios motores sin su protección, al alcance del operario.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-09-05 00:00:00	1
1290	3	1	3	0001	0002	0003	Durante la inspección realizada a la planta de Tratamiento de Agua, también se observo el mal estado en que se encontraban las gradas de la escalera, las cuales podrían provocar un accidente.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-09-05 00:00:00	1
1288	3	1	3	0001	0002	0003	Se realizó una inspección al área de embotellado de la Línea N° 1, donde se encontraron varios motores de las fajas sin protección (guardas), lo que podría ocasionar un atrapamiento y por ende un accidente.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-09-10 00:00:00	1
1284	3	1	3	0001	0002	0003	Se hizo una inspección a la Línea de Producción N° 5 encontrándose que los motores de las fajas no tenia su protector de seguridad, así como se encontró una guarda en mal estado debido a que solo se sujetaba con cintillos.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-09-11 00:00:00	1
1260	3	1	3	0001	0002	0003	Estando a cargo del Montacarga Toyota 4, me proponía a subir producto terminando a uno de los camiones cuando de pronto se me para el motor, esto debido a un problema con el sistema de gas, por lo que el vehiculo lo lleve al área de mantenimiento automotriz, y solicite que me prestaran el montacarga Toyota 5 al Almacén de Materia Prima. Hora de suceso 02:45 am	Aguilar Romero, Cesar Fredy	erick.giron@kr.com.pe	SSOHUAURA	2013-09-11 00:00:00	1
1275	3	1	3	0001	0002	0003	Aprox. 15:20 Hrs se reporta que una de las tuberías del Sist. de Lubricación cerca a Pantalla de Producto Terminado LP01 está deteriorada, ocasionando salpicaduras de lubricantes cerca a la Zona. Ubicación: LP01 - Pantalleo de Prod. Terminado	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SGIHUAURA	2013-09-12 00:00:00	1
1326	3	1	3	0001	0002	0002	El día de hoy 16 de setiembre a las 8:30 am se detecto en una de las hornillas de la cocina fuga de gas.	Coaquira  Paz, Claudia	claudia.coaquira@kr.com.pe	SGI 310	2013-09-16 00:00:00	1
1358	3	1	3	0001	0002	0002	el día 18/09/13 a las 6:10pm el Operador se encontraba trabajando el cual sintio una explosión, saliendo disparado el eje accionador por arriba de la cabeza del personal.	Coaquira Paz, Claudia	claudia.coaquira@kr.com.pe	SGI 310	2013-09-18 00:00:00	1
1308	3	1	3	0001	0002	0003	Aprox. 16:20 Hrs se reporta la ruptura de una tubería 1/2" PVC del sistema de Lubricación. Lugar: Sala de Lubricación - Ex Sopladora DB30	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SGIHUAURA	2013-09-22 00:00:00	1
1385	3	1	3	0001	0002	0002	EL DIA 01-10-13 A LA 01:04 PM APROXIMADAMENTE LOS OPERADORES DE LA ENCAJONADORA Y DESENCAJONADORA DE LA LINEA #1 COMUNICARON UNA FUGA DE ACEITE DE DISTRIBUIDOR DE AIRE EL CUAL AFECTA A LA SALUD DE LOS TRABAJADORES.	HUERTAS , VICTOR	victor.huertas@kr.com.pe	SGI 310	2013-10-01 00:00:00	1
1355	3	1	3	0001	0002	0003	Se detecta fuga de aceite por accesorios (mangueras y uniones) del Sistema Hidráulico del elevador en abastecimiento de botellas de la Línea Isotónica (21:30 hrs)	Purizaga Saavedra, Erikc Alberto	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-10-03 00:00:00	1
1350	3	2	3	0001	0001	0008	SE DETECTO LA FALTA DE PINTURA EN COMPRESORES EN LA SALA DE FUERZA./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-03 00:00:00	1
1353	3	1	3	0001	0002	0003	Se reporta caida de agua caliente (gotas) cerca del lavadero de manos frente a la llenadora Mesal - LP5	Purizaga Saavedra, Erikc Alberto	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-10-03 00:00:00	1
1443	3	1	3	0001	0002	0003	Se encontró en la Planta de Tratamiento de Agua para Producción, que algunas gradas de la escalera que lleva a los pozos, se encuentran deformadas o con rajaduras a los extremos, por lo que podría provocar en cualquier momento un accidente.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-11-13 00:00:00	1
1460	3	1	3	0001	0002	0002	EL DIA 12/11/13 A LAS 3:30 PM APROX.OBSERVE QUE EL SOPORTE DEL TRANSPORTADOR DE BOTELLAS DE LA LÍNEA Nº2 QUE VA HACIA LA ETIQUETADORA NO TIENE PERNOS QUE AJUSTEN AL TRANSPORTADOR SIENDO ESTA CONDICON INSEGURA UN PELIGRO. PUDIENDO OCASIONAR UN MAL FUNCIONAMIENTO DEL TRANSPORTADOR O ACCIDENTE AL PERSONAL.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-16 00:00:00	0
1461	3	1	3	0001	0002	0002	EL DIA 12/11/13 A LAS 3:30 PM APROX.OBSERVE QUE EL SOPORTE DEL TRANSPORTADOR DE BOTELLAS DE LA LÍNEA Nº2 QUE VA HACIA LA ETIQUETADORA NO TIENE PERNOS QUE AJUSTEN AL TRANSPORTADOR SIENDO ESTA CONDICON INSEGURA UN PELIGRO. PUDIENDO OCASIONAR UN MAL FUNCIONAMIENTO DEL TRANSPORTADOR O ACCIDENTE AL PERSONAL.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-16 00:00:00	1
1493	3	1	3	0001	0002	0003	Se reporta que el montacargas Linde 02, no presenta el espejo retrovisor del lado izquierdo	Muñoz Vilela, Omar	omar.munoz@kr.com.pe	SGIHUAURA	2013-12-04 00:00:00	1
1602	3	1	3	0001	0002	0002	El dia 09/12/13 a hrs 09.55 am en la maquina encajonadora de la línea 1 se retiro el sensor de seguridad del lado derecho por lo que se puede suscitar algun accidente	Linares Sanchez, Percy	\N	SGIAREQUIPA2	2013-12-09 00:00:00	1
1605	3	1	3	0001	0002	0002	El Sr. Gabriel Mamani Chambi se encontraba conduciendo el Montacarga Toyota Nº 2 aprox. a las 23:00 horas, al traer Agua Cielo formato 625 mL del Patio Principal, es cuando se rompe la llanta internamente (llanta trasera costado derecho).	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-12-14 00:00:00	1
1607	3	1	3	0001	0002	0002	Aproximadamente 11:00 am se observo que la llanta trasera del montacarga Toyota Nº 2 costado derecho, presenta partes rotas y rajadas internamente habiendose cambiado dicha llanta el dia lunes 16/12/13 aproximadamente 07:00 am.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-12-18 00:00:00	1
1611	3	1	3	0001	0002	0002	A las 09:30 hrs. aprox. en Tratamiento de Aguas el empaque de la tapa del dosificador de sal se encuentra desgastado y roto.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-03 00:00:00	1
1613	3	1	3	0001	0002	0002	A las 07:30 a.m. aprox. En el área de Soplado se produjó un derrame de hidrolina provocada por el Montacarga Komatsu Nº 2.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-07 00:00:00	1
1615	3	1	3	0001	0002	0002	A horas 07:15 a.m. el Sr. Mezares Ludeña comunica que la luz de emergencia de su puesto de trabajo no funciona (Llenadora Línea 3).	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-08 00:00:00	1
1555	3	2	3	0001	0001	0008	ELVIS PEÑA DEJO PARQUEADO Y ENCENDIDO SIN COLOCAR EL FRENO DE EMERGENCIA EL MONTACARGAS QUE CONDUCIA LO QUE OCASIONO QUE DICHO MONTACARGA SALIERA CORRIENDO SOLO PROVOCANDO QUE ESTE IMPACTARA CON EL TRANSPORTADOR DE LINEA-5 PROXIMO AL PALETIZADOR.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2014-01-08 00:00:00	1
1576	3	1	3	0001	0002	0003	Siendo las 09:30 hrs. aprox., se produjo una fuga de amoniaco en el compresor de la Sala de Fuerza.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-23 00:00:00	1
1627	3	1	3	0001	0002	0002	Aproximadamente a las 20:30pm fui comunicado por el operador de la llenadora línea Nº4, Julio Ortiz, que su llenadora se encontraba sin guardas de protección fueron retiradas por el mecánico de turno día.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-24 00:00:00	1
1632	3	1	3	0001	0002	0002	A horas 08:00am aprox. en el área de producción (sala de embotellado) se encontró condiciones inseguras que perjudican al personal que labora en esta área:/nLínea 1/n1. Escalera inadecuada para el agregado de tapas hacia la encapsuladora, no cuenta con baranda, ni se encuentra fija./n2. Guarda de protección inadecuada (parte de la llenadora se encuentra sin guarda)./nLínea 2/n3. Escalera inadecuada para ajustes operacionales que se realiza en la maquina; no cuenta con baranda, no está fija y muy pequ	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-31 00:00:00	1
1633	3	1	3	0001	0002	0002	A horas 08:00am aprox. en el área de producción (sala de embotellado) se encontró condiciones inseguras que perjudican al personal que labora en esta área:/nLínea 1/n1. Escalera inadecuada para el agregado de tapas hacia la encapsuladora, no cuenta con baranda, ni se encuentra fija./n2. Guarda de protección inadecuada (parte de la llenadora se encuentra sin guarda)./nLínea 2/n3. Escalera inadecuada para ajustes operacionales que se realiza en la maquina; no cuenta con baranda, no está fija y muy pequ	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-31 00:00:00	0
1635	3	1	3	0001	0001	0008	JOSE RAMON ENCARNACION SE ENCONTRABA EN EL REACTOR DE CARBON-1 EN CLARIFICADO CUANDO EL EJE DE ESTE SE DESPEGO Y LO GOLPIO EN EL BRAZO DERECHO CAUSANDOLE UNA LACERACION./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2014-02-04 00:00:00	1
489	3	1	4	0001	0002	0003	El Sr Cesar Aguilar  Romero, montacargista del area de almacen APT, maniobrando el montacarga se le cae una caja plastica por 24  con envases vacios de KR 250 ml, debido a que no envolvieron bien con strech films rompiendose 19 botellas.	Alcazar Casaico, Cesar	cesar.alcazar@kr.com.pe	SGIHUAURA	2012-07-04 18:03:04	1
495	3	1	4	0001	0002	0003	El Sr Jesus Rojas Jaime, se encontraba manipulando el descarguio de pallets de tapas plasticas cielo, se inclino el pallets y por ende 03 cajas y una parte se tapas se cayo al piso la cual fueron apartadas en otra caja.	Rojas Jaime, Jesus	jesus.jaime@kr.com.pe	SGIHUAURA	2012-07-05 21:38:48	1
674	3	4	4	0001	0001	0008	caida de paletas de refrescos debido a que la paleta no llego a su punto en paletizadora.	mercado Núñez, miguel	mmercardo@kolareal.com.do	SSDOMINICANA	2012-10-21 04:15:10	1
900	3	4	4	0001	0002	0003	Se produjo la caída de una caja de botellas de vidrio.	Cuna Huerta , Cristhian	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 14:22:30	1
901	3	4	4	0001	0002	0003	Siendo las 23:20 de la noche, estuve lavando el tanque #8 para abastecer  de cola negra, cuando quise bajar por la escalera de 3 peldaños, me resbale cayéndome de espalda, golpeándome la cintura fuertemente.	Oscate Inocente , Roberto Carlos	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 14:28:04	1
907	3	4	4	0001	0002	0003	Al promediar las 15:47 horas me encontraba en el montacarga con 01 pallet de strech, hacia el almacén de envases en el trayecto algunas rampas con demasiada altura por la rampa de  APT. Ocasiono que se inclinara la carga  transpasandose al otro evitar  su caída total.	Gino Espinoza, Neil	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 14:54:52	1
936	3	4	4	0001	0002	0003	En el momento del carguío del carro se cayo 2 cajas de vidrio, motivo de que no estaban bien forradas.	cotrina arcos, fernando	janssen.guerrero@kr.com.pe	SSOHUAURA	2013-03-08 13:53:06	1
965	3	1	4	0001	0002	0002	Siendo las 07:10 horas se pudo verificar que la puerta del Almacén Nuevo Producto Terminado, que comunica con el área de Desmedros, se encontraba trancado con unas rumas de parihuelas lo que impedía el libre transito; acto provocado por personal montacarguista Turno "Noche".	Delgadillo Sanchez, Juan Carlos	juan.delgadillo@kr.com.pe	SGIAREQUIPA2	2013-04-05 17:06:12	1
1004	3	4	4	0001	0002	0003	En la manipulación de cajas de Cola, una de estas me cae sobre la mano izquierda golpeando su dedo pulgar.	Civico Gamarra, Humberto	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-04-08 00:00:00	1
1005	3	1	4	0001	0002	0003	En la manipulación de cajas de Cola, una de estas me cae sobre la mano izquierda golpeando su dedo pulgar.	Civico Gamarra, Humberto	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-04-08 00:00:00	0
1001	3	4	4	0001	0002	0003	Se observa 2 pallet de bebida ORO de 2 Lt, caidos en almacen de productos terminhados.	Parientes Sanchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-02 00:00:00	1
1092	3	4	4	0001	0001	0008	Se produce fuga de GLP en un cilindro de 9 gln cuando el personal estaba realizando la conexión de al manguera a al válvula del cilindro	Baez , Moises	\N	ADMINISTRADOR	2013-05-02 00:00:00	1
1093	3	4	4	0001	0001	0008	Cristian Javier Peña al momento de levantar una caja de tapas sintió un leve dolor en las caderas.	Peña , Cristian Javier	\N	ADMINISTRADOR	2013-05-02 00:00:00	1
1002	3	4	4	0001	0002	0003	Al descargar una paleta con botellas de oro de 250ml, esta se engancha en la plataforma del camion y se caen las cajas botellas vacia.	Parientes Sanchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-03 00:00:00	1
1091	3	4	4	0001	0001	0008	Se detecta que personal tercero deja los cilindros de acetileno y oxigeno en al zona de trabajo, sin amarrarlos y expuestos al sol.	Espinal , Idelfonso	iespinal@hotmail.com	ADMINISTRADOR	2013-05-04 00:00:00	1
1089	3	1	4	0001	0001	0008	Se detecto que personal tercero deja los cilindros de acetileno y oxigeno en la Zona de trabajo, sin amarrarlos y expuestos al sol.	Espinal , Idelfonso	\N	ADMINISTRADOR	2013-05-04 00:00:00	0
1088	3	4	4	0001	0001	0008	se detecta que los cilindros almacenados en la jaula de gas no se encuentran sujetados	Mercado , Miguel	Mmercado@kolareal.com.do	ADMINISTRADOR	2013-05-05 00:00:00	1
1273	3	1	4	0001	0002	0002	El camion de la empresa Fredimar, procedente de quillabanba,presenta carga de envase de botellas de vidrio rota.	Coaquira Paz, Claudia	claudia.coaquira@kr.com.pe	SGI 310	2013-08-30 00:00:00	1
1321	3	1	4	0001	0002	0002	Se observó al Sr. Daniel Bejarano operador del montacarga Linde 2 hacer caer cajas de botellas de vidrio del rechazo rompiendose botellas de dos cajas.	Coaquira Paz, Claudia	claudia.coaquira@kr.com.pe	SGI 310	2013-09-13 00:00:00	1
1393	3	1	4	0001	0002	0002	EL DIA 10/10/13 EN EL AREA DE CARGUIO DE CAMIONES (APT) SE HIZO INGRESAR 07 CAMIONES LO CUAL ESTA PROHIBIDO, SOLO HAY INGRESO Y ESPACIO PARA 06 CAMIONES BRINDANDO LAS CONDICIONES SEGURAS AL PERSONAL DE DICHA AREA. POR ORDENES DEL INGENIERO ARANDA Y HACIENDOSE RESPONSABLE DE CUALQUIER INCIDENTE O ACCIDENTE SE DA PASO AL INGRESO DE LOS 07 CAMIONES.	HUERTAS , VICTOR	victor.huertas@kr.com.pe	SGI 310	2013-10-10 00:00:00	1
1453	3	1	4	0001	0002	0002	EL DIA 06/11/13 APROX A LAS 8:30 AM ENCONTRE AL SEÑOR MORA BERNAL YVESI (PERSONAL DE LIMPIEZA) OPRERANDO MONTACARGA, EL CUAL NO TIENE PERMISO PARA DICHA ACION. ARGUMENTANDO EL EL SEÑOR YVESI QUE EL ING. FRANCISCO ARANDA (JEFE DE PLANTA) LE INDICO QUE APOYARA EN EL CARGUIO DE CAMIONES. RESPONSABILIZANDOSE DE CUALQUIER INCIDENTE O ACCIDENTE.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-06 00:00:00	1
1481	3	1	4	0001	0002	0002	EL DÍA 21/11/13 APROX. A LAS 23:30 EN LA LINEA #4 EL SEÑOR REYNALDO GONZALES GUTIERREZ OPERO EL MONTACARGA SIN TENER AUTORIZACIÓN, OCASIONANDO LA CAÍDA DE PALLETS CON PRODUCTOS.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-21 00:00:00	1
1616	3	1	4	0001	0002	0002	A las 10:29 hrs. aprox. El Sr. Juan Carlos Delgado Guerreros conducía el montacargas Linde Nº 2, trasladaba un tote, retrocediendo gira para el costado derecho y golpea una caja de preforma (botella verde), haciéndola caer.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-09 00:00:00	1
1619	3	1	4	0001	0002	0002	Aproximadamente a las 17:13 el señor Frank Canasas operador suplente de montacargas conducia el montacarga toyota Nº 2, cargaba el camion de placa V4Q-975 con producto vidrio oro 300ml, al momento de empujar el pallet hacia la ranfla del camion este choca con el gol del camion rompiendose  02 cajas de oro.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-15 00:00:00	1
1624	3	1	4	0001	0002	0002	A horas 11:30am, en instantes en que el señor Mateo Llasa (chofer del montacargas Nº2) se disponía a colocar el segundo pallet para formar una columna de dos, sin darse cuenta que el pallet de la base estaba en mal estado coloca el segundo y este por el peso y el mal estado de la base se cayeron al suelo formato450ml KR.	Apaza Charca, Brando	brando.apaza@kr.com.pe	SGIAREQUIPA2	2014-01-22 00:00:00	1
769	3	4	5	0001	0002	0003	Se evidencio que el tecle utilizado por el personal de Tecnogas para el trabajo izaje de botellas de gases comprimidos, se encunetra deteriorado y presenta problemas al usarlo.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-11 22:56:12	1
1218	3	2	6	0001	0001	0008	Se encuentra montacargas código 71-11 perteneciente al area de soplado con goma trasera desmontada	Mercado Núñez, Miguel	mmercado@kolareal.com.do	SSDOMINICANA	2013-08-05 00:00:00	1
991	3	1	5	0001	0002	0002	El Sr. Marco Ancori Andia (operador de montacargas) se encontraba llevando parihuelas con azúcar a Jarabe Simple, cuando coloca una parihuela con azúcar en la ventana de recepción de Jarabe Simple, segundo piso, es cuando los sacos se caen al piso.	Llave Pinto, César	cesar.llave@kr.com.pe	SGIAREQUIPA2	2013-04-27 00:00:00	1
1217	3	1	5	0001	0002	0003	Estaba cambiando sello de tubo para agua a sello de gaseosa, cuando se resbala la herramienta (puntilla) e impacta en la frente ocasionandole un raspón, esto sucedio a las 19:20 hrs en el Turno A  de la Línea N° 03	Ore Leiva, Isaac	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-08-07 00:00:00	1
1343	3	1	5	0001	0001	0008	PRESENCIA DE MONTACARGA MANUAL DAÑADO Y DE PIEZAS INSERVIBLES SIN HACER NADA EN VOLTEO DE AZUCAR./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-03 00:00:00	1
1344	3	1	5	0001	0001	0008	SE DETECTO FALTA DE REJILLA EN CANALETA DE VOLTEO DE AZUCAR./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-03 00:00:00	1
492	3	1	6	0001	0002	0003	El vehiculo de Transporte al momento de trasladarse, se desprendió de la carroceria ya que el gancho no se encontraba correctamente sujeto.	Palma Sanchez, Jorge	jorge.palma@kr.com.pe	SGIHUAURA	2012-07-04 18:08:30	1
566	3	1	6	0001	0002	0003	Se observo abolladura en el capot lado izquierdo del montacarga TOYOTA 3.	Gurgura , Hernan	hernan.gurgura@kr.com.pe	SGIHUAURA	2012-09-04 17:19:50	1
642	3	1	6	0001	0001	0007	montacarga falta de pernos en gomas delanteras	luciano francisco, julissa	jluciano@kolareal.com.do	VISITAS	2012-09-29 14:21:31	1
669	3	1	6	0001	0001	0008	Durante el transporte con el montacargas de una paleta con producto, el montacarga al momento de retroceder impacto con la columna de concreto ocasionando la rotura de una parte de la columna.	Mercado Núñez, Miguel	mmercado@kolareal.com.do	SSDOMINICANA	2012-10-20 14:26:08	1
723	3	1	6	0001	0001	0008	Durante el transporte de residuos solidos hacia el almacen de desmedro,el montacarga se quedo atascado debido a la presencia de lodo en almacen.	Salvatierra , carlo	csalvatierra@kolareal.com.do	SSDOMINICANA	2012-11-22 22:19:37	1
730	3	1	6	0001	0001	0008	CHOFER DE PATANAS ARRANCA SIN PERCATARSE DE LA PRESENCIA DE UN MONTACARGUISTA DENTRO DE LA PATANA.	Mercado NÚÑEZ, Miguel	mmercardo@kolareal.com.do	SSDOMINICANA	2012-11-23 03:41:18	1
731	3	1	6	0001	0001	0008	SE DETECTO MONTACARGA CON UN CILINDRO DE GAS QUE ERA MAS GRANDE QUE EL QUE LE CORESPONDIA,EL CUAL ESTABA AMARRADO Y SE PODIA CAER.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-11-26 11:44:05	1
758	3	2	6	0001	0002	0003	El personal reporto que la tapa del pozo a tierra  ubicado en almacén de APT se encuentra rota.	Torres , Juvenal	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-07 15:52:27	1
774	3	4	6	0001	0002	0003	El operador de montacargas se encontraba trasladando cajas de botellas de vidrio vacías, esta no se habían embalado y se cayeron en el patio de planta frente a APT.	Inocente Mestancia, Miguel	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-12 23:52:42	1
780	3	4	6	0001	0002	0003	Al ingresar un camion, golpio una cara del porton principal rompiendo la soldadura.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-18 20:20:57	1
788	3	4	6	0001	0002	0003	El. Sr.dejo estacionado el montacargas en la vereda fuera de almacen de insumos.	Estebes Moreno, Gonzalo	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-28 00:24:54	1
808	3	4	6	0001	0002	0003	Se observo que la persiana ubicada en el ingreso a planta se encontraba tirada en el piso.	Parientes Sanchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-08 22:25:05	1
821	3	4	6	0001	0002	0003	El cargador de excavadora  rompió la tubería de agua que alimenta los SSHH ubicada en el patio frente almacén de APT.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-10 23:15:41	1
832	3	4	6	0001	0002	0003	El Sr. informa que el extintor con su soporte se salio del montacargas Linde 1.	Inocente Mestanza, MIguel	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-13 12:16:50	1
888	3	4	6	0001	0002	0003	El montacargas - toyota 5 queda fuera de servicio por fallas mecanicos.	Alan Parientes, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-08 11:35:54	1
902	3	4	6	0001	0002	0003	Caída de un pallet de cajas con botellas de vidrio de 250 .ml, por rose de la carreta de un trailer	Parientes Sanchez, Deyvis	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 14:30:11	1
912	3	4	6	0001	0002	0003	Al levantar la parihuela con producto Kr negra, el separador se encontraba sucio la cual no dejo visualidad para poder ver el estado de la parihuela. produciendo una caída.	Muro Llauce, Florencio	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 15:19:11	1
923	3	4	6	0001	0002	0003	Se cayeron 2 cajas encima del montacarga conteniendo gaseosa oro de 250 ml.	Cotrina Arcos, Fernando	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-02 23:35:03	1
933	3	4	6	0001	0002	0003	Tapa del buzón del desagüe inestable, ubicado en el patio principal.	Parientes Sanchez, Deyvi Alan	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-07 12:48:42	1
992	3	4	6	0001	0002	0003	Se observa la rejilla de almacen de preformas y tapas rota y doblada	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-04-11 00:00:00	1
993	3	1	6	0001	0002	0003	Caida de pallet con botellas de oro de 300 ml.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-04-11 00:00:00	0
998	3	4	6	0001	0002	0003	Se observa 3 trailer estacionados en el patio principal bloqueando el transito de vehiculos.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-04-17 00:00:00	1
1048	3	1	6	0001	0002	0003	El personal de Praxair reporta que existió demora en el inicio de descarga de CO2 debido a que no hubo personal por parte de ISM que lo supervisara. Fecha y Hora: 15.05.13 - 18:15 Hrs	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-05-15 00:00:00	1
1069	3	1	6	0001	0002	0003	El personal de Praxair reporta que existió demora en el inicio de descarga CO2, además no se evidenció la presencia del personal que supervise el proceso de recepción. Fecha y Hora: 15.05.13 18:15Hrs	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-05-15 00:00:00	1
1109	3	1	6	0001	0002	0002	Siendo las 08:00am se observo que goteaba aceite del filtro del motor del camion de Chanaltin de placa V3L-923.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-05-16 00:00:00	1
1078	3	1	6	0001	0002	0003	El Sr. reporta que el montacargas Linde 1, quedo inoperativo en medio de la planta, por falla electrica.	Salvador , Luis	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-17 00:00:00	1
1124	3	1	6	0001	0002	0003	El Sr. Joel estaba retirando productos terminados del Hangar Nuevo cuando choca el montarcargas contra un palet de preformas PET. Según manifestación se da por la excesiva velocidad y poca visibilidad por las cortinas de plástico en la puerta de ingreso al Hangar Nuevo.	Rojas Cruces, Alfonso	alfonso.rojas@kr.com.pe	SGIHUAURA	2013-06-04 00:00:00	1
1281	3	1	6	0001	0002	0002	El conductor del camión de placa YH 4840, Sr. Elias Panibra, al realizar maniobras de retroceso  para estacionarse y proceder a descargar sacos de azúcar, golpea una columna de pallets almacenados de manera inadecuada lo que ocasiona la caida de cajas de plástico en el patio principal.	Coaquira   Paz, Claudia	claudia.coaquira@kr.com.pe	SGI 310	2013-09-06 00:00:00	1
1292	3	4	6	0001	0001	0008	EL SEÑOR JUAN BERNALD SE ENCONTRABA SALIENDO EN LA ENTRADA PRINCIPAL (PUERTA-1) HACIA SU DESTINO Y CUANDO DOBLO AMBOS DOILYS TUVIERON UN CONTRASTE CAUSANDOLES DAÑOS./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-09-13 00:00:00	1
1300	3	1	6	0001	0001	0008	EN EL MOMENTO QUE EL CHOFER DEL CABEZOTE 31-23 DE ISM ESTABA MOVIENDO DICHO VEHICULO PARA PARQUEARLO ,UNA PIEDRA DE LA CALLE SALTO OCASIONANDOLE UN GOLPE AL CRISTAL O LUNA DELANTERA DEL CABEZOTE DE PERSONAL TERCERO QUE ESTABA PARQUEADO EN EL AREA DE RAMPA ALMACEN CENTRAL.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-09-18 00:00:00	1
1307	3	1	6	0001	0002	0003	Aprox. 17:35 del 21.09.13 el vehículo A2T-925 de Chanaltin SAC, conducido por el Sr. Carlos Velasquez, colisiona contra el portón de ingreso a planta antes de realizarse la verificación vehicular	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SGIHUAURA	2013-09-21 00:00:00	1
1312	3	1	6	0001	0002	0003	Siendo las 04:15 aprox. el Sr. Cesar Aguilar estaba manejando el montacarga Toyota 4, cuando ingresaba a APT doblo y me pego a mi izquierda dejando espacio para que otro montacarga pase por mi costado si fuera necesario, sin embargo me pego mucho por lo que el vehículo con la parte posterior choca el caño rompiéndolo, rápidamente salí del vehículo y cerré la llave central de agua.	Aguilar Romero, Cesar	erick.giron@kr.com.pe	SSOHUAURA	2013-09-28 00:00:00	1
1329	3	1	6	0001	0002	0003	Siendo las 14:10 hrs en el patio de Maniobras, el Sr. Miguel Angel Inocente Mestanza, montacarguista del Linde 1, estaba descargando un camión lleno de cajas con botellas vacías, y al momento de jalar un palet, no se percato que algunas cajas del palet del costado estaban mal posicionadas por lo que se vinieron abajo 7 cajas.	Inocente Mestanza, Miguel Angel	erick.giron@kr.com.pe	SSOHUAURA	2013-09-30 00:00:00	1
1336	3	1	6	0001	0001	0008	MONTACARGA IMPACTA  LA PARED EN LA PUERTA DE SALIDA DE DANANE MIENTRAS OPERADOR RETROCEDIA CON PALETAS VACIAS./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-02 00:00:00	1
1419	3	1	6	0001	0002	0002	El Sr. Mitchel Marquez solicita el ingreso de camión de Sur Carga que traía tapas e insumos para Producción, responsabilizandose del Acto y Condición Insegura.	Carpio Dávila, Nelson	nelson.carpio@kr.com.pe	SGIAREQUIPA2	2013-10-25 00:00:00	1
1421	3	1	6	0001	0002	0002	El Sr. Jaime Talavera hizó ingresar 7 camiones a la zona de carga y descarga de APT, ignorando la especificación de que sólo pueden ingresar 6 (por motivos de seguridad) haciéndose responsable del Acto y Condición Insegura.	Carpio Davila, Nelson	nelson.carpio@kr.com.pe	SGIAREQUIPA2	2013-10-26 00:00:00	1
1420	3	1	6	0001	0002	0002	El Sr. Jaime Talavera hizó ingresar 7 camiones a la zona de carga y descarga de APT, ignorando la especificación de que sólo pueden ingresar 6 (por motivos de seguridad) haciéndose responsable del Acto y Condición Insegura.	Carpio Davila, Nelson	nelson.carpio@kr.com.pe	SGIAREQUIPA2	2013-10-29 00:00:00	0
1427	3	2	6	0001	0001	0008	EL CAMION CON CODIGO 31-32 CORRESPONDIENTE AL CHOFER AGUSTIN JIMENEZ SE ENCUENTRA CON EL TANQUE DE COMBUSTIBLE PICHADO DEBIDO A LA EXPLOSION DE UNA GOMA DE ESTE QUE PROVOCO QUE SE SUMIERA CON EL GOLPE RECIBIDO EL PASADO MIERCOLES 31/10/2013./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-11-02 00:00:00	1
1598	3	4	6	0001	0002	0003	A horas 09:40 am, se encontro en el área de APT un camion furgon de la empresa Austral, la parte interna de la ranfla del camion tenia olor a pescado.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-12-03 00:00:00	1
1496	3	4	6	0001	0001	0008	El S.R IGNACIO CASTILLO ESTABA INGRESANDO POR LA ENTRADA PRINCIPAL DE ISM Y EN ESE MOMENTO EL CABEZOTE FICHA 31-31 LOGRO QUE AL DOBLAR UNA DE LAS DOS COLAS HICIERA CONTACTO CON UN POSTE DE LUZ PROVOCANDO ROMPERLO Y TIRARLO HASTA EL SUELO./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-12-06 00:00:00	1
1606	3	1	6	0001	0002	0002	A hrs 09:30 el Señor Fernando Allande conductor del camión ( ZW8369) choca con el camión de placa YI6155 conducido por el Señor Marcos Anculle chocando también con la columna de concreto de almacén.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-12-16 00:00:00	1
1530	3	2	6	0001	0001	0008	LA PATANA CON CODIGO 31-22 DEL CHOFER DAILYN TORRES CUANDO SE ENCONTRABA SALIENDO DE LA PLANTA ISM, POR LA PUERTA DE CONTROL-3 TUMBO UNOS CABLES DE ELECTRICIDAD QUE SEGÚN EL MISMO ESTABAN MUY BAJOS./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-12-22 00:00:00	1
1538	3	2	6	0001	0001	0008	MONTACARGAS VOLTEA PALETA DE REFRESCOS AL SALIR DE LA LINEA DE PRODUCCION-3./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-12-27 00:00:00	1
1565	3	2	6	0001	0002	0003	Siendo las 11:20 hrs se encuentra que el trailer con placa A2U914, ubicado al frente de la Oficina de SGI, está botando petroleo debido a que se bajo la bolsa de aire de la carga haciendo que se incline los tanques con dirección al pico.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2014-01-12 00:00:00	1
1626	3	1	6	0001	0002	0002	A horas 19:40pm aprox. se observo al camión de placa(Z2R-879)(ZH3291) de la empresa JUSTIN que la escalera de acceso a la ranfla (al costado izquierdo de la ranfla), no brinda condiciones seguras de trabajo al personal que trabaja en esta área.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-23 00:00:00	1
478	3	1	7	0001	0002	0003	Se detecto que en la zona de desmedros hay cables de iluminación que no tienen un adecuado tratamiento para que no se expongan a la superficie.	Meza Toribio, Luis	luis.meza@kr.com.pe	SGIHUAURA	2012-06-28 00:46:33	1
491	3	1	7	0001	0002	0003	El equipo de hidrolavado de la planta de tratamiento de aguas residuales, presentó un cortocircuito interno lo que ocasionó contactos de fuego.	Palma  Sanchez, Jorge	jorge.palma@kr.com.pe	SGIHUAURA	2012-07-04 18:06:07	1
596	3	4	7	0001	0001	0008	En el area de aguas reciduales el panel electrico que esta al lado del compresor de aire esta abierto lo cual representa un alto riesgo.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-12 07:40:59	1
597	3	4	7	0001	0001	0008	Al lado de la empacadora de linea 1 se noto un abanico conectado a un alambre pelado,ya que la extension estaba en mal estado.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-12 07:54:54	1
606	3	4	7	0001	0001	0008	En el cuarto electrico frente a sala de fuerza los tableros electricos estan abiertos y esto es una evidente condicion insegura.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-14 04:36:40	1
615	3	4	7	0001	0001	0008	En el area de soplado de linea 5 se detectaron 2 paneles electricos abierto.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-17 04:50:11	1
631	3	4	7	0001	0001	0008	El tablero electrico que esta en la planta de tratamiento de aguas reciduales esta abierto y no cierra porque tiene cables que impiden que cierre.	Reynoso Núñez, Filiberto	freynoso@kolareal.com.do	SSDOMINICANA	2012-09-21 03:25:59	1
632	3	1	7	0001	0001	0008	En el area de jarabe terminado los motores no tienen protector.	Reynoso Núñez, Filiberto	freynoso@kolareal.com.do	SSDOMINICANA	2012-09-21 03:35:28	1
634	3	1	7	0001	0002	0003	Corto circuito cerca la empacadora, en el toma corriente que se utiliza para conectar el ventilador. El corto circuito llego hasta el tablero general de distribución de la linea 03, derritiendo e inflamando el aislamiento del cable.	Garcia Espinoza, Ericson	luis.meza@kr.com.pe	SGIHUAURA	2012-09-21 19:00:12	1
646	3	4	7	0001	0001	0008	En el area de lamacen de residuos(desmedro)se detecto un cable ellectrico rosando con el puerton de entrada.lo cual implica un riesgo de que el personal de dicha area reciba una descarga electrica.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-10-03 18:33:00	1
647	3	1	7	0001	0001	0003	se encuentra lampara en rampa de descarga parpadeando, provocando tontera al personal	cruz jimenez, joseph kelmen	almcenstgo@kolareal.com.do	VISITAS	2012-10-04 21:58:54	1
648	3	4	7	0001	0001	0008	EN LA LINEA DE VIDRIO SE DETECTÓ UN CABLE ELECTRICO DE 440V, DESCUBIERTO Y EN EL SUELO, LO CUAL IMPLICA UN RIESGO DE QUE EL PERSONAL QUE LABORA EN DICHA AREA RECIBA UNA DESCARGA ELECTRICA.	REYNOSO  NÚÑEZ, FILIBERTO	FREYNOSO@KOLAREAL.COM.DO	SSDOMINICANA	2012-10-05 00:17:29	1
649	3	1	7	0001	0001	0008	SE ENCUENTRA TABLERO ELECTRICO ABIERTO DE SOPLADORA DE LINEA 03 (PRODUCCIÓN).	REYNOSO NÚÑEZ, FILIBERTO	FREYNOSO@KOLAREAL.COM.DO	SSDOMINICANA	2012-10-05 00:31:00	1
650	3	1	7	0001	0001	0008	SE ENCUENTRA TABLERO ELECTRICO ABIERTO DE SOPLADORA DE LINEA 03 (PRODUCCIÓN).	REYNOSO NÚÑEZ, FILIBERTO	FREYNOSO@KOLAREAL.COM.DO	SSDOMINICANA	2012-10-05 00:31:06	1
651	3	1	7	0001	0001	0008	Se detecta cable de alimentación eléctrica de la etiquetadora de la línea 06 (Producción)	Reynoso Núñez, Filiberto	freynoso@kolareal.com.do	SSDOMINICANA	2012-10-05 00:40:03	1
656	3	4	7	0001	0001	0008	EN LA LLENADORA DE LINEA 3 SE DETECTO UN CABLE DE CORRIENTE ELECTRICA MAL UBICADO Y AÑADIDO,LO CUAL IMPLICA UN RIESGO DE UN POSIBLE ACCIDENTE POR EL FUJO DE AGUA QUE EXIXTE EN DICHA AREA.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-10-05 18:32:51	1
673	3	4	7	0001	0001	0008	se encuentra montacarga codigo 71-16 derramando aceite.	mercado NÚÑEZ, miguel	mmercardo@kolareal.com.do	SSDOMINICANA	2012-10-21 03:20:07	1
681	3	1	7	0001	0001	0008	SE DETECTO UN CABLE ELECTRICO SIN ENTUBAR ENTRE DOS TANQUES DE JARABES.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-11-02 23:09:29	1
696	3	2	7	0001	0002	0003	En el ingreso a la línea de producción 1 se observa que el tomacorriente fue retirado y los cables fueron envueltos con cinta aislante.	Parientes Sánchez, Deyvi Alan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-07 17:38:45	1
697	3	2	7	0001	0002	0003	Se observa en la línea de producción 2 el enchufe del ventilador empalmado a  cable con electricidad y forrado con cinta aislante.	Parientes Sánchez, Deyvi Alan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-07 17:43:01	1
704	3	4	7	0001	0001	0008	DOMINGO MATIAS AL MOMENTO DE CONECTAR EL MORTOR UN OPERADOR ABRIO EL TABLERO ELECTRICO Y MANIPULO UN GUARDA MOTOR SIN  AUTORIZACION,LO CUAL PROVOCO UNA DESCARGA ELECTRICA DE 440 VOLTIOS.	mercado Núñez, miguel	mmercardo@kolareal.com.do	SSDOMINICANA	2012-11-11 00:48:08	1
728	3	1	7	0001	0001	0008	SE ENCUENTRA SUFICIENTE CANTIDAD DE AGUAS EN PISO AL LADO DE TABLERO ELECTRICO, CON PRESENCIA DE CABLES EN PISO	Mercado NÚÑEZ, Miguel	mmercardo@kolareal.com.do	SSDOMINICANA	2012-11-23 02:45:45	1
777	3	4	7	0001	0002	0003	Entre las puertas de ingreso se quedo atrapado un visitante, al quedarse la planta sin energia electrica.	Galvez Flores, Luis	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-13 22:01:16	1
835	3	4	7	0001	0002	0002	El día de hoy a las 15:20 hrs aproximadamente se produjó un corto circuito en la línea de 220V del Almacen de Preformas.	Huertas Sueros, Victor	victor.huertas.sgi@gmail.com	VISITA	2013-01-14 22:46:05	1
837	3	1	7	0001	0002	0002	En Almacén de Producto Terminado la línea de alimentación 220V llega con baja de tensión, lo que hace que la empacadora manual no funcione, pudiendo llegar a malograrse.	Huertas Sueros, Victor	victor.huertas.sgi@gmail.com	VISITA	2013-01-15 16:14:50	0
855	3	4	7	0001	0002	0003	Por variacion de la tension electrica el compresor se apago, generando una caida en la presion de aire.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-23 16:40:11	1
950	3	4	7	0001	0002	0003	Se observa un cable pelado en el flomix de la linea isotónica.	Parientes Sanchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-20 13:12:28	1
1060	3	4	7	0001	0001	0008	EL SR. KENI MIGUEL LÓPEZ REPORTA QUE LA VÁLVULA DE DOSIFICACIÓN DE LUBRICANTE DE CADENAS DE LA LÍNEA DE PRODUCCIÓN 06 ESTÁ PASANDO CORRIENTE./n	Mercado Nuñez, Miguel	mmercado@kolareal.com.do	ADMINISTRADOR	2013-04-05 00:00:00	1
1062	3	4	7	0001	0001	0008	EL OPERADOR CHALACO HIDALGO REYES COMUNICA QUE EL TRANSPORTADOR NEUMÁTICO EN EL ÁREA DE SOPLADO ESTÁ PASANDO CORRIENTE./n	Mercado Nuñez, Miguel	mmercado@kolareal.com.do	ADMINISTRADOR	2013-04-10 00:00:00	1
1009	3	4	7	0001	0002	0003	El switch interruptor del dispensador de agua de la oficina Asistencia Social se quemó debido a que se produjo un cortocircuito	Ubillus Castillo, Verónica	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-04-23 00:00:00	1
1090	3	4	7	0001	0001	0008	El montacargas 71-20 presento problemas con al batería al apagarse el vehículo durante su uso.	Salvatierra , Carlos	Csalvatierra@hotmail.com.do	ADMINISTRADOR	2013-05-03 00:00:00	1
1047	3	1	7	0001	0002	0003	El Sr. reporta que se golpio la pierna, al slair de la sala de descanzo, por falta de luz.	Ore Leiva, Isac	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-14 00:00:00	1
1063	3	1	7	0001	0002	0003	Se reporta que salto el termico de la bomba del almix, quemandoce el contactor y crusandoce la bomba.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-16 00:00:00	1
1318	3	1	7	0001	0002	0002	A las 3:00 aprox el tablero eléctrico de la linea 2 empezo a humear esto debido a un corto circuito lo que provoco que se queme le transformador.	Coaquira Paz, Claudia	claudia.coaquira@kr.com.pe	SGI 310	2013-09-11 00:00:00	1
1332	3	1	7	0001	0002	0003	Siendo las 12:20 hrs aprox. se fue la energía electrica en toda la empresa, por lo que me indicaron los técnicos es que uno de los interruptores de la sub estación eléctrica se habia quemado, por lo que de inmediato lo cambiaron, sin embargo cuando levantaron la palanca de la energía eléctrica, suena estrepitosamente saliendo humo del túnel, esto debido a que un cable de 440 había hecho corto circuito con dos de 220, generando q dos cables adicionales quedaran en mal estado, en total se quemaron	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-10-01 00:00:00	1
1345	3	1	7	0001	0001	0008	SE DETECTO LA FALTA DE SOPORTES EN TUBERIAS ELECTRICAS DE VOLTEO DE AZUCAR./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-03 00:00:00	1
1412	3	4	7	0001	0001	0008	SIENDO LAS 5:17 A.M. DEL 25/10/2013 HUBO UN CORTO CIRCUITO EN EL COMEDOR DE EMPLEADOS LO QUE PROVOCO UN INCENDIO EN EL CUAL SE QUEMO UNA DE LAS LUMINARIAS DE DICHA AREA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-10-25 00:00:00	1
1410	3	1	7	0001	0001	0008	SE DETACTA CABLES ELECTRICOS MAL ORGANIZADOS Y FALTA DE TAPA PROTECTORA EN INTALACIONES ELECTRICAS DETRÁS DE NUEVO SALON DE CONFERENCIAS EN EDIFICIO ADMINISTRATIVO./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-26 00:00:00	1
1424	3	4	7	0001	0001	0008	Hoy miércoles 30/10/2013 a las 2:30 pm hubo un corto circuito causado por el contacto directo de dos cables energizados,lo que ocasiono un pequeño incendio en el techo de recepción de personal.	Gutierrez , Belgica	bgutierrez@kolareal.com.do	VISITAS	2013-10-30 00:00:00	1
1430	3	1	7	0001	0002	0002	El día 30-10-1013 a la 1:30 pm aprox. en el área de APT, percibi que tres(3) focos estan quemados, el cual no se visualiza nuy bien. pudiendo provocar accidentes al personal que labora en dicha área.	CARPIO DAVILA, NELSON	nelson.carpio@kr.com.pe	SGI 310	2013-10-30 00:00:00	1
1425	3	1	7	0001	0002	0003	Siendo las 15:03 hrs., la Sra. encargada del comedor comunicó que hubo un cortocircuito en uno de los enchufes de la cocina. Cabe señalar que dicho enchufe no se encontraba en condiciones óptimas.	MONTESINOS ROMÁN, KELLY	arturo.janampa@kr.com.pe	SSOHUAURA	2013-10-31 00:00:00	1
1467	3	1	7	0001	0002	0003	Siendo las 08:00 am la Sra. Carmen Alcazar se percata que en su oficina el toma corriente se habría generado un corto circuito quemando dicho toma corriente y el enchufe del estabilizador, por lo que se dio aviso al área de sistemas y de seguridad industrial.	Alcazar Casaico, Carmen	erick.giron@kr.com.pe	SSOHUAURA	2013-11-18 00:00:00	1
1471	3	1	7	0001	0001	0008	SE DETECTO CABLES ELECTRICOS SIN ENTUBAR DE LOS MOTORES AGITADORES EN LOS REACTORES 1 Y 2 EN PLANTA DE TRATAMIENTO DE AGUA./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-11-19 00:00:00	1
1480	3	1	7	0001	0002	0002	EL DÍA 19/11/13 APROX. A LAS 11:00 AM SE OBSERVO EN LA ENTRADA DE  APT NUEVO, 2 LAMPARAS DE EMERGENCIA INOPERATIVAS, EN LA SEGUNDA QUE ESTA AL FRENTE DE LA ENTRADA APT NUEVO(EN LA COLUMNA)NO ESTA ENCHUFADO A UN TOMA-CORRIENTE QUEDANDO TAMBIÉN INOPERATIVA .	CARPIO DAVILA, NELSON GABRIEL.	nelson.carpio@kr.com.pe	SGI 310	2013-11-19 00:00:00	1
1560	3	1	7	0001	0002	0003	Siendo las 02:20 hrs. aprox., se origina un corte de energía eléctrica debido a una caída de tensión.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-10 00:00:00	1
1583	3	2	7	0001	0001	0008	LOS OPERADORES DE LA SALA DE JARABE TERMINADO REPORTAN QUE DEBAJO DEL ANDAMIO DE ACCESO A LOS TANQUES DE JARABE HAY UNOS CABLES QUE ESTAN HACIENDO CORTO CIRCUITO./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2014-01-25 00:00:00	1
1587	3	1	7	0001	0001	0008	SE DETECTO TOMACORRIENTE SIN PROTECCION FRENTE A PALETIZADORA DE LINEA-3./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2014-01-29 00:00:00	1
1589	3	1	7	0001	0001	0008	SE DETECTO PRESENCIA DE CABLES ELECTRICOS EN EL SUELO DE LOS TANQUES DE LA SALA DE JARABE TERMINADO./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2014-01-29 00:00:00	1
482	3	1	8	0001	0002	0003	Se evidencia calaminas sueltas ocasionado por accion del viento en las zonas de soladadura, residuos solidos, DV30 y pasadizo de produccion.	Bravo Meza, Sheril	sheril.bravo@kr.com.pe	SGIHUAURA	2012-07-04 17:43:37	1
500	3	1	8	0001	0002	0003	Se evidencia aumento del caudal de la acequia, ocasionando que rebalse el agua del canal, en dirección hacia la pared que limita la linea isotónica, empozándose gran cantidad de agua.	Meza Toribio, Luis	luis.meza@kr.com.pe	SGIHUAURA	2012-07-09 18:55:11	1
569	3	1	8	0001	0002	0003	Se observo la presencia de una culebra en la entrada de Almacen de Insumos Quimicos.	,	\N	SGIHUAURA	2012-09-04 22:52:38	0
599	3	4	8	0001	0001	0008	En el area de productos terminado estaban todas las luces encendidas en hora de la tarde.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-12 08:17:11	1
607	3	4	8	0001	0001	0008	El buzon ubicado frente a la caja esta tapado lo que provoca que se desborde el agua.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-14 04:46:10	1
616	3	4	8	0001	0001	0008	Se detecto un escape de amoniaco en los tanques de linea 1 y 2 en el area de produccion.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-17 05:03:01	1
630	3	1	8	0001	0002	0003	Se evidencia que una de las calaminas del techo de  APT se desprendio, originado por el aire.	Rojas Cruces, Alfonso	alfonso.rojas@hotmail.com.pe	SGIHUAURA	2012-09-20 20:39:56	1
643	3	1	8	0001	0001	0007	piso de almacen en condiciones inadecuadas ocasionando dificultades para el transito del montacarga.	luciano francisco, julissa	jluciano@kolareal.com.do	VISITAS	2012-09-29 14:30:09	1
732	3	2	8	0001	0002	0003	Se evidencia que en el auditorio de la empresa las calaminas se estan levantando por acción de un viento excesivo.	Choque Cardenas, Cledo	cledo.choque@kr.com.pe	VISITA	2012-11-26 16:18:17	1
735	3	1	8	0001	0001	0008	SE DETECTA FUGA DE HIPOCLORITO DE SODIO DE LA BOMBA DOSIFICADORA DE AGUA CRUDA,LA FUGA SE DEBE A QUE LA MANGUERA DE DOSIFICACION ESTA ROTA./n	Salvatierra , Carlo	csalvatierra@kolareal.com.do	SSDOMINICANA	2012-11-26 20:32:25	1
747	3	1	8	0001	0001	0008	Una patana perteneciente a los terceros, tiene sus dos tanques de combustibles full de gasoil y pa patana fué parqueada donde la parte de alante quedaba desnivelada lo que ocacionó que por el tapón del tanque cayeran pequeñas gotas de gasoil al piso.	Reynoso Núñez, Filiberto Antonio	freynoso@kolareal.com.do	VISITAS	2012-12-04 13:20:33	1
748	3	4	8	0001	0001	0008	Una patana perteneciente a los terceros, tiene sus dos tanques de combustibles full de gasoil y pa patana fué parqueada donde la parte de alante quedaba desnivelada lo que ocacionó que por el tapón del tanque cayeran pequeñas gotas de gasoil al piso.	Reynoso Núñez, Filiberto Antonio	freynoso@kolareal.com.do	VISITAS	2012-12-04 13:20:38	1
822	3	4	8	0001	0002	0003	Al Sr. en el momento de retirar una paleta de botellas de KR piña dejo caer 3 cajas, rompiendo una caja y media.	Inocente Meztanza, Miguel	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-10 23:48:12	1
823	3	2	8	0001	0002	0003	Al Sr. en el momento de retirar una paleta de botellas de KR piña dejo caer 3 cajas, rompiendo una caja y media.	Inocente Meztanza, Miguel	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-10 23:49:29	0
824	3	4	8	0001	0002	0003	El Sr. presento problemas de repiracion al estar realizando trabajo de paletizado	Berrospi Delgado, Freddy	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-11 00:04:35	1
829	3	4	8	0001	0002	0003	El Sr. se encontraba en el panel de la llenadora cambiando los jamper cunado sintio naucias y problemas al respirar debido a la presencia de ozono.	Galves Flores, Luis	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-12 00:04:54	1
891	3	4	8	0001	0002	0003	Se produjo desprendimiento de material noble del techo en la sala de embotellado (Flomix- Línea 3)	Rivera Espinoza, Wilmer	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-12 00:06:04	1
943	3	4	8	0001	0002	0003	En sala de embotellado se desprendió material noble del techo.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-16 00:10:34	1
1136	3	1	8	0001	0002	0002	Siendo el día 05-06-2013 aproximadamente 10:30am el auxiliar de limpieza Enrique Roca solicitó al auxiliar de jarabe simple, Julio Chambilla, neo cloran para limpiar los baños de APT y este le señalo el lugar donde se encontraba, mas no, cual era el producto que solicitaba. El señor Enrique se confundio, cogió y utilizó el sanitizante Divosan para  limpiar los baños, lo que genero emisión de vapores y contaminación del ambiente, el cual no permitia permanecer en el lugar por el insoportable olor	Huertas  Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-06-05 00:00:00	1
1138	3	1	8	0001	0002	0002	El dia de hoy al promediar las 21:00 hasta las 00:00 horas se presento un fenómeno natural (fuertes corrientes de viento) generando daños en las instalaciones del cuarto de descanso del personal operativo de la planta (produccion) rompiendo algunas calaminas del techo.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Llave Pinto, Cesar	cesar.llave@kr.com.pe	SGI 310	2013-06-06 00:00:00	1
1196	3	1	8	0001	0002	0002	El día viernes 5 de julio aprox 18:00, el señor Jorge Cutipa Ticona,se encontraba en almacen y sintió un malestar en el ojo izquierdo que le produjo  dolor debido a que le ingreso polvo que arrastró el viento , se acercó al tópico y lo refieron al centro de salud.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	,	\N	SGI 310	2013-07-05 00:00:00	0
1198	3	1	8	0001	0002	0002	Me encontraba caminando por los pasillos de APT cuando senti un malestar en el ojo izquierdo produciendome inflamación y dolor.	Cutipa  Ticona , Jorge Luis	victor.huertas@kr.com.pe	SGI 310	2013-07-05 00:00:00	1
1207	3	1	8	0001	0002	0002	La malla raschel que se encontraba rota desde que los fuertes vientos la desprendieron, termino por caerse e invadir la zona de lavado con soda caústica de botellas de vidrio.	Callo Adco, Luis Miguel	claudia.coaquira@kr.com.pe	SGI 310	2013-07-16 00:00:00	1
1208	3	1	8	0001	0002	0002	La malla raschel que se encontraba rota desde que los fuertes vientos la desprendieron, termino por caerse e invadir la zona de lavado con soda caústica de botellas de vidrio.	Callo Adco, Luis Miguel	claudia.coaquira@kr.com.pe	SGI 310	2013-07-16 00:00:00	1
1242	3	1	8	0001	0002	0003	Siendo aproximadamente las 12:40 hrs, el Sr. Andy Rondon se dirigia hacia el comedor de la planta, cuando de pronto en el patio de maniobras se encuentra con una serpiente de aproximadamente 60 cm, a la cual capturan y liberan fuera de la empresa.	Rondon Pimentel, Andy	erick.giron@kr.com.pe	SSOHUAURA	2013-09-07 00:00:00	1
1398	3	1	8	0001	0002	0003	Siendo las 10:05 hrs aprox., el Sr. Cristhian Romero informa que durante la madrugada se levantaron calaminas del techo debido al aire fuerte que hubo durante la noche.	Romero Portuguez, Cristhian Jesús	erick.giron@kr.com.pe	SSOHUAURA	2013-10-21 00:00:00	1
1413	3	1	8	0001	0002	0003	Siendo las 12:45 hrs. se detectó una condición insegura en la zona de las etiquetadoras de las líneas de producción 02 y 03. El techo en dicha zona presenta una calamina suelta debido al fuerte viento en el transcurso de la mañana.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2013-10-28 00:00:00	1
1432	3	1	8	0001	0002	0003	El Sr. Osorio, inspector de turno, reporta la presencia de dos roedores en el almacén de producto terminado a las 23:40 hrs.	Osorio Atao, Jhon	arturo.janampa@kr.com.pe	SSOHUAURA	2013-11-05 00:00:00	1
1433	3	1	8	0001	0002	0003	Siendo las 04:40 hrs. aprox. debido a la garúa incesante, se evidenció el mal estado del techo de la oficina de seguridad industrial. Esto, por el goteo constante cerca a la computadora y a conexiones eléctricas adyacentes.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2013-11-06 00:00:00	1
1462	3	1	8	0001	0002	0002	EL DIA 14/11/13 a las 8:30 AM EN LA PARED DE MANTENIMIENTO DE MONTACARGAS ESTUVO CHORREANDO AGUA DEBIDO A QUE LA PARED TIENE UN HUECO POR DONDE PASA AGUA OCASIONANDO QUE NO SE PUEDA SER EL NORMAL MANTENIMIENTO A LOS MONTACARGAS.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-14 00:00:00	0
1463	3	1	8	0001	0002	0002	EL DIA 14/11/13 a las 8:30 AM EN LA PARED DE MANTENIMIENTO DE MONTACARGAS ESTUVO CHORREANDO AGUA DEBIDO A QUE LA PARED TIENE UN HUECO POR DONDE PASA AGUA OCASIONANDO QUE NO SE PUEDA SER EL NORMAL MANTENIMIENTO A LOS MONTACARGAS.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-14 00:00:00	1
1466	3	1	8	0001	0002	0003	Se observa la presencia de un panal de abejas en una de las cajas que contienen residuos sólidos en los exteriores de la sala de Jarabe Simple. (Hora: 12:45 pm)	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2013-11-16 00:00:00	1
1526	3	2	8	0001	0002	0003	Siendo aprox. 02:06 hrs., el Sr. Armando Echevarria se dirigía al área de desmedro a realizar el relevo a su compañero, cuando encontró a los perros y lo desconocieron atacándolo, sin embargo, solo lo empujaron rasguñándole los codos y un golpe en el hombro.	Echevarria Alva, Armando Gustavo	erick.giron@kr.com.pe	SSOHUAURA	2013-12-17 00:00:00	1
1540	3	2	8	0001	0002	0003	Siendo las 15:10 hrs aprox. el Sr. Gino Saavedra me llama indicando que una calamina del techo del nuevo hangar, al frente del área de soplado se ha levantado, así mismo se encontró una ave muerta en la canaleta de los cables eléctricos que pasa cerca del lugar.	Saavedra Cotrina, Gino	erick.giron@kr.com.pe	SSOHUAURA	2013-12-29 00:00:00	1
1541	3	2	8	0001	0002	0003	Se evidencia que el techo del Almacén de Productos Terminados presenta calaminas rotas y sueltas debido al fuerte viento en el transcurso del día.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2013-12-29 00:00:00	1
1542	3	2	8	0001	0002	0003	Se evidencia el desprendimiento de los tableros de triplay en la Sala de Fuerza, adyacente al caldero de 150 bhp.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2013-12-29 00:00:00	1
1552	3	1	8	0001	0002	0003	Siendo las 02:20 hrs. aprox., se apersona a la oficina de SGI el Sr. Ramirez indicando que un insecto (polilla) se ha introducido en su oído derecho cuando caminaba por las afueras de la sala de Jarabe Simple.	Ramirez Palma, Carlos Fredy	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-08 00:00:00	1
1570	3	1	8	0001	0002	0003	Se evidencia el desprendimiento de los tableros de triplay en Sala de Fuerza, adyacente a los compresores Sullar.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-18 00:00:00	1
1592	3	1	8	0001	0002	0003	Se evidencia que parte del techo del 2do. piso de la Sala Fuerza esta incompleto, dejando así los tableros eléctricos y otros equipos expuestos al ambiente.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2014-01-29 00:00:00	1
793	3	4	9	0001	0002	0003	El personal informa que se encontraba en el laboratorio durante un periodo de 1 hora  aun temperatura de 16ºC, y salio e dicho ambinete para dirigirce al area de soplado para tomar una muestra de botellas (temperatura > 28ºC), presentando problemas de dolor de cabeza, garganta y musculares (escalofrio).	Mejia Osorno, Huber	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-03 00:24:14	1
899	3	4	9	0001	0002	0003	Reporta que no se encuentra con un asiento ergonómico y ventilación adecuada para la operación de maquina.	Camacho Mori, Marino	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 14:15:35	1
1176	3	2	9	0001	0001	0008	SE DETECTO QUE LA  MICA DE LA PANTALLA DE INSPECCIÓN PARA PRODUCTO TERMINADO SE ENCUENTRA ROTA EN LINEA-4/n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-07-01 00:00:00	1
1177	3	2	9	0001	0001	0008	LAS LUMINARIAS DE LA PANTALLA PARA INSPECCIÓN DE PRODUCTO TERMINADO SE ENCUENTRAN QUEMADAS EN LINEA-1/n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-07-02 00:00:00	1
1184	3	1	9	0001	0002	0003	El Sr. Richard Veramendi resbala de la plataforma en Llenadora Mesal LP03, cuando bajaba de la misma luego de verificar el abastecimiento de tapas./nLugar: Llenadora Mesal - LP03/nFecha / Hora: 02/07/13 / 23:00 Hrs	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SGIHUAURA	2013-07-02 00:00:00	1
1163	3	1	9	0001	0002	0003	Aprox. 00:20 hrs del día 02.07.13 en la máquina llenadora Messi - LP03, el Sr. Richard Veramendi Pagan operador de la máquina se procedia a bajar de la misma debido a que estaba fallando, cuando de pronto no calcula bien su punto de apoyo y cae sentado hacia el suelo.	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-07-02 00:00:00	0
1164	3	1	9	0001	0002	0003	El Sr. Richard Veramendu Pagan, se resbaló en la Sala de Embotellado, esto debido a que las cerámicas instaladas hace unos días en dicho punto, proboca que el piso sea resbaladizo más de lo normal - LP03	León Romero, Dick	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-07-02 00:00:00	1
1165	3	1	9	0001	0002	0003	El Sr. Richard Veramendu Pagan, se resbaló en la Sala de Embotellado, esto debido a que las cerámicas instaladas hace unos días en dicho punto, proboca que el piso sea resbaladizo más de lo normal - LP03	León Romero, Dick	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-07-02 00:00:00	0
1187	3	1	9	0001	0002	0003	Resbalo cuando bajaba de la llenadora Meyer - LP01, luego de verificar el abastecimiento de tapas corona, sin ocasionarse daño alguno./nLugar: Llenadora Meyer - LP01/nFecha / Hora: 08.07.13 / 11:00 Hrs	Medrano Vega, Fernando	fernando.medrano@kr.com.pe	SGIHUAURA	2013-07-08 00:00:00	1
1188	3	1	9	0001	0002	0003	El Ing. Max Caro tuvo un amago de resbalon cuando realizabas los controles de calidad cerca a la llenadora Meyer - LP01./nFecha / Hora: 08.07.13 / 11:00 Hrs	Medrano Vega, Fernando	fernando.medrano@kr.com.pe	SGIHUAURA	2013-07-08 00:00:00	1
1279	3	1	9	0001	0002	0002	Las sillas ubicadas en las pantallas de inspección de la linea 2 y 3, se ecnuentran en mal estado, ya que, su sistema de graduación de altura se encuentra malogrado. Esto ocasiona  posiciones ergonómicas inadecuadas.	Pacheco Palomino, Victor	claudia.coaquira@kr.com.pe	SGI 310	2013-09-05 00:00:00	1
1258	3	1	9	0001	0002	0003	el Sr. Roberto Oscate se apersona al tópico para buscar atención médica debido a que presentaba enronchamiento y escozor en diversas partes del cuerpo. Hora Aprox: 11:00 am	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-09-09 00:00:00	1
1261	3	1	9	0001	0002	0003	El señor manifestó que la vía de transito entre la lavadora San Martín y la sala de embotellado a quedado el espacio reducido y que además se ha observado que las personas al retirar botellas se golpean constantemente.	Azaña Quispe, José Alfredo	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-09-11 00:00:00	1
1334	3	2	9	0001	0001	0008	SE DETECTO QUE LA  MICA DE LA PANTALLA DE INSPECCIÓN PARA EL PRODUCTO TERMINADO  SE ENCUENTRA ROTA EN LINEA-4/n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-01 00:00:00	1
1335	3	4	9	0001	0001	0008	LAS LUMINARIAS DE LA PANTALLA PARA LA INSPECCIÓN DEL PRODUCTO TERMINADO SE ENCUENTRAN QUEMADAS EN LINEA-1/n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-01 00:00:00	1
1351	3	4	9	0001	0001	0008	SE DETECTO CANALETAS ABIERTAS EN EL PASILLO QUE ESTA FRENTE A LA SALA DE FUERZA./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-03 00:00:00	1
1473	3	1	9	0001	0002	0003	siendo las 11:20 hrs aproximadamente, el Sr. Cesar Villalobos, estaba en la LP1 encargado de trasladar a través de la faja las cajas vacías, sin embargo se trabaron y al ejercer presión se generó una contra-fuerza, dando como resultado una contusión en la muñeca derecha.	Villalobos  Ibañez, Cesar	erick.giron@kr.com.pe	SSOHUAURA	2013-11-20 00:00:00	1
479	3	1	11	0001	0002	0003	Se evidencia que los lavaderos de los baños de producción presenta goteo en las uniones de las tuberias.	Solano Salinas, Sergio	luis.meza@kr.com.pe	SGIHUAURA	2012-07-04 17:39:14	1
480	3	1	11	0001	0002	\N	Se evidencia mal estado de las chapas de las puertas de las duchas en produccion	,	\N	SGIHUAURA	2012-07-04 17:40:02	1
485	3	1	11	0001	0002	0003	Se evidencia que el escritorio del Sr Ramiro Segama Andrade de Control Interno se encuentra en mal estado(presenta polillas).	Alcantara Damian, Christian	luis.meza@kr.com.pe	SGIHUAURA	2012-07-04 17:47:45	1
486	3	1	11	0001	0002	0003	Se evidencia que en  Caja, el escritorio del Sr Wilmer Becerra se encuentra en mal estado(presenta pillas).	,	\N	SGIHUAURA	2012-07-04 17:51:09	1
493	3	1	11	0001	0002	0003	Se evidencia que la manija del inodoro de los servicios higienicos de vigilancia esta malogrado.	Alcantara Damian, Christian	luis.meza@kr.com.pe	SGIHUAURA	2012-07-04 18:11:32	1
494	3	1	11	0001	0002	0003	Se evidencia goteo en la tuberia del aire acondicionado que se localiza en la oficina de la secretaria.	Alcantara Damian, Christian	luis.meza@kr.com.pe	SGIHUAURA	2012-07-04 18:12:42	1
496	3	1	11	0001	0002	0003	Se evidencia que la tuberia del lavadero que se encuentra en el comedor presenta goteo.	Montesinos , Kelly	luis.meza@kr.com.pe	SGIHUAURA	2012-07-05 23:07:26	1
504	3	1	11	0001	0002	0003	Se evidencia fuga de agua por parte de la taza del inodoro de los servicios higienicos de Contabilidad.	Meza Toribio, Luis	luis.meza@kr.com.pe	SGIHUAURA	2012-07-18 15:52:30	1
507	3	1	11	0001	0002	0003	Se evidencia una desviacion de la puerta del auditorio.	Alcantara Damian, Christian	luis.meza@kr.com.pe	SGIHUAURA	2012-07-19 16:07:43	1
511	3	1	11	0001	0002	0003	Se evidencia filtracion de agua del techo en las oficinas contables.	Alcantara Damian, Christian	luis.meza@kr.com.pe	SGIHUAURA	2012-07-27 14:42:56	1
512	3	1	11	0001	0002	0003	Se evidencia en el area de Proyectos una silla en mal estado; la zona donde se apoya el brazo esta rota.	Alcantara Damian, Christian	luis.meza@kr.com.pe	SGIHUAURA	2012-07-30 15:34:59	1
513	3	1	11	0001	0002	0003	Se evidencia que la ventana de la oficina del Ing. Martin Castillo se encuentra en mal estado, presenta rajaduras.	Gamarra Torres, Shila	luis.meza@kr.com.pe	SGIHUAURA	2012-07-31 16:55:31	1
514	3	1	11	0001	0002	0003	Se evidencia mal estado de la mayolica del piso de la sala de embotellado, presenta rajaduras.	Gamarra Torres, Shila	luis.meza@kr.com.pe	SGIHUAURA	2012-08-01 19:45:34	1
515	3	1	11	0001	0002	0003	Se evidencia que el fluorescente que se encuentra ubicado en la zona de la escalera de ingreso a  tratamiento de agua no enciende.	Gamarra Torres, Shila	luis.meza@kr.com.pe	SGIHUAURA	2012-08-02 16:52:38	1
516	3	1	11	0001	0002	0003	Se observa una tuberia rajada ocasionando fuga de agua en los servicios higienicos que se encuentra ubicado en la sala de fuerza.	Lopez Quichiz, Luis	luis.meza@kr.com.pe	SGIHUAURA	2012-08-02 18:20:47	1
518	3	1	11	0001	0002	0003	Se evidencia fuga de agua de la griferia de los servicios higienicos de Produccion.	Torres  Grados, Jose Antonio	luis.meza@kr.com.pe	SGIHUAURA	2012-08-03 16:37:24	1
519	3	1	11	0001	0002	0003	Caida de un vidrio en las duchas de produccion.	Torres  Grados, Jose Antonio	luis.meza@kr.com.pe	SGIHUAURA	2012-08-06 16:10:08	0
520	3	1	11	0001	0002	0003	Se oberva goteo en la tuberia del aire acondicionado en las oficinas de seguridad civil y vigilancia.	Alcantara Damian, Christian	luis.meza@kr.com.pe	SGIHUAURA	2012-08-06 16:11:03	1
521	3	1	11	0001	0002	0003	Se evidencia tuberia rota en las conexiones de agua que va hacia sostenibilidad - jarabe terminado.	Alcantara Damian, Christian	luis.meza@kr.com.pe	SGIHUAURA	2012-08-06 17:11:12	1
541	3	2	11	0001	0002	0003	Se evidencia mal estado de los tachos de basura en Lavado manual de botellas de vidrio; presentan rajaduras y tapa rota.	Gamarra Torres, Shila	luis.meza@kr.com.pe	SGIHUAURA	2012-08-08 00:04:59	1
550	3	1	11	0001	0002	0003	Se observa la falta de una luna en el auditorio.	Alcantara Damian, Christian	luis.meza@kr.com.pe	SGIHUAURA	2012-08-14 00:42:22	0
552	3	2	11	0001	0002	0003	El boton urinario de los sevicios higienicos de produccion se encuentra malogrado.	Torres  Grados, Jose Antonio	luis.meza@kr.com.pe	SGIHUAURA	2012-08-14 00:43:24	1
553	3	1	11	0001	0002	0003	El caño que se localiza al costado de la oficina de APT presenta goteo.	Torres  Espinoza, Roy	luis.meza@kr.com.pe	SGIHUAURA	2012-08-14 00:43:54	0
554	3	2	11	0001	0002	0003	Se observa que los estibadores colocan las cajas de los rollos que utilizan en cualquier lugar.	Torres  Grados, Jose Antonio	luis.meza@kr.com.pe	SGIHUAURA	2012-08-14 00:44:17	1
560	3	1	11	0001	0002	0003	Se observo que al iniciar el apilamiento de sacos de azucar jumbo, la cortina de mica que se ubica en la entrada de almacen de azucar se desprendio de su soporte.	Arellano Leon, Andre	andre.arellano@kr.com.pe	SGIHUAURA	2012-08-27 18:46:27	1
562	3	1	11	0001	0002	0003	Al momento de ingresar a la oficina de seguridad, se encontro un charco de agua en el pìso, el agua era del aire acondicionado que se encuentra en la oficina, llegando a dañar el monitor, teclado y documentos .	Palma Sanchez, Jorge	jorge.palma@kr.com.pe	SGIHUAURA	2012-08-27 18:49:52	1
563	3	1	11	0001	0002	0003	Se observa la presencia de una calamina en la parte superior  del techo que esta protegido por una malla.	Choque Cardenas, Cledo	cledo.choque@kr.com.pe	SGIHUAURA	2012-08-28 23:36:24	1
565	3	1	11	0001	0002	0003	Se evidencia la ausencia del espejo izquierdo del montacraga LINDE 2.	Ingol Tarazona, Alex	luis.meza@kr.com.pe	SGIHUAURA	2012-08-31 17:39:02	1
568	3	2	11	0001	0002	0003	Se evidencia una ventana rajada en el baño de produccion.	Bueno , Saul	luis.meza@kr.com.pe	SGIHUAURA	2012-09-04 22:51:49	1
570	3	2	11	0001	0002	0003	El agua de la taza del inodoro de los servicios higienico de las oficinas contables se rebalso.	Alcantara Damian, Christian	luis.meza@kr.com.pe	SGIHUAURA	2012-09-05 21:02:33	1
571	3	1	11	0001	0002	0003	Se observa fuga de agua originado por una tuberia rota del caño que se ubica en la oficina de Almacen de Producto Terminado.	Torres  Espinoza, Roy	luis.meza@kr.com.pe	SGIHUAURA	2012-09-05 21:48:32	0
572	3	1	11	0001	0002	0003	Se observa que la luminaria de los servicios higienicos de Recursos Humanos ha cedido y choca con la puerta.	Ubillus Castillo, Veronica	veronica.ubillus@kr.com.pe	SGIHUAURA	2012-09-05 22:13:21	0
573	3	2	11	0001	0002	0003	Se observa que la luminaria de la oficina de bienestar no se encuentra operativa.	Ubillus Castillo, Veronica	veronica.ubillus@kr.com.pe	SGIHUAURA	2012-09-05 22:14:07	1
575	3	2	11	0001	0002	0003	Al ingresar a los servicios higienicos de Recursos Humanos,la proteccion de la luminaria cayo sobre mi persona.	Bravo Meza, Sheril	sheril.bravo@kr.com.pe	SGIHUAURA	2012-09-06 20:08:25	1
581	3	1	11	0001	0002	0003	Se evidencia un tomacorriente dañado en el lado izquierdo de la sala de jarabe simple.	Meza Toribio, Luis	luis.meza@kr.com.pe	SGIHUAURA	2012-09-07 20:12:23	1
587	3	4	11	0001	0001	0008	El letrero del area de planta electrica esta despegado y ha punto de caerce.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-11 08:06:01	1
590	3	4	11	0001	0001	0008	Uno de los cristales que dividen el area de llenado linea de vidrio del area de llenado de las lineas 5 y 6,esta roto y en parte cuarteado.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-11 09:29:25	1
592	3	1	11	0001	0002	0003	Se evidencia que el fluorescente de la oficina de Sistemas presenta parpadeo.	Alcantara Damian, Christian	luis.meza@kr.com.pe	SGIHUAURA	2012-09-11 14:28:44	1
594	3	4	11	0001	0001	0008	Detras de la sopladora de linea 3 proximo ha danane el letrero que indica la salida esta ha punto de caerce.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-12 05:53:01	1
598	3	4	11	0001	0001	0008	La puerta de llenadora linea 1 tiene problema al cerrar ya que el sujetador inferior esta safado.y por dicha razon la puerta no cierra y esta fuera de su centro.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-12 08:08:59	1
612	3	4	11	0001	0001	0008	En la sopladora linea 1 en la parte de atras proximo al almacen de preformas existe una canaleta en el piso en mal estado esto representa un riesgo y puede ocasionar una caida ha nivel.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-15 03:41:57	1
613	3	4	11	0001	0001	0008	En la caldera presencia de fuga de vapor lo que representa un riesgo para el operador de dicha area.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-15 03:48:19	1
614	3	4	11	0001	0001	0008	El extintor numero 48 que esta en el pasillo de acceso entre caldera CO2 y puerta de almacen de preforma ,esta sin colgador ya que este se salio de la pared.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-17 04:03:54	1
619	3	4	11	0001	0002	0003	Se evidencia tachos de basura de APT en mal estado, las tapas presentan rajaduras.	Torres  Espinoza, Roy	luis.meza@kr.com.pe	SGIHUAURA	2012-09-18 00:17:49	1
624	3	4	11	0001	0001	0008	SE DETECTARON MUCHAS BOTELLAS DE VIDRIO ROTAS EN EL SUELO DEBAJO DE LA MAQUINA ENCAJONADORA.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-19 04:44:44	1
626	3	4	11	0001	0001	0008	Se detecto que el momento de un operario manipular la maquina encajonadora este permitia que dicha maquina tirara muchas botellas de vidrio al suelo y que estas se rompieran.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-19 04:52:37	1
636	3	4	11	0001	0001	0008	La puerta de cristal que da acceso desde el pasillo de sostenibilidad hasta produccion,esta averiada y fuera de lugar.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-24 18:17:00	1
637	3	4	11	0001	0001	0008	El letrero de salida del area de llenado de linea 3 hasta produccion,esta fuera de su lugar en el suelo.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-24 18:26:44	1
638	3	4	11	0001	0001	0008	La puerta que da acceso desde llenadora hasta linea de vidrio (produccion),tiene el cristal roto.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-24 18:35:36	1
640	3	2	11	0001	0002	0003	Se observa goteo de la tuberia que se ubica al costado de Mantemiento Vehicular.	Gamarra Torres, Shila	luis.meza@kr.com.pe	SGIHUAURA	2012-09-27 19:11:55	0
661	3	1	11	0001	0001	0008	EL LETRERO DE SALIDA DESDE LLENADORA LINEA TRES HASTA PRODUCCION ESTA EN EL SUELO.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-10-14 06:51:00	1
662	3	4	11	0001	0001	0008	LA PUERTA DE ACCESO DESDE LLENADORA A LINEA DE VIDRIO TINE EL CRISTAL ROTO.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-10-14 06:58:53	1
665	3	1	11	0001	0002	0003	Se evidecia paredes húmedas, debido a una filtración originada por el grifo del lado.	Montoya Collantes, Carlos	ainsumos@kr.com.pe	SGIHUAURA	2012-10-19 23:12:38	1
671	3	1	11	0001	0002	0003	Aproximadamente las 20:10 hrs. salia de las ducha y me dirigía al vestuario, un fuerte ruido alertó a los que nos encontrábamos en el vestidor, al salir observamos que el Sr.Muñoz conduciendo el montacarga impactó con una paleta que tenia sillas apiladas en considerada altura, ocasionando que estas sillas golpearan contra las ventanas de las duchas, rompiendo una de las micas.	Muro  Llauce, Florencio	\N	SSOHUAURA	2012-10-20 18:26:59	1
680	3	1	11	0001	0002	0003	La puerta del auditorio se encuentra malograda, no permitiendo un correcto uso de la misma y podiendo ocasionar accidente.	López , Rafael	rafael.lopez@kr.com.pe	SSOHUAURA	2012-10-29 23:50:12	1
682	3	1	11	0001	0001	0008	PRESENCIA DE REJILLA DE CANALETA EN MALAS CONDICIONES UBICADA POR EL AREA,PLANTA TRATAMIENTO DE AGUA.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-11-02 23:16:32	1
699	3	2	11	0001	0002	0003	El soporte de las persinas ubicado en el ingreso al almacen de preformas y tapas se encuentra roto al igual que la calamina.	Parientes Sánchez, Deyvi Alan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-08 18:09:07	1
700	3	2	11	0001	0002	0003	En el baño del personal obrero, los caños de los lavaderos tienen paso de agua.	Vallejos , Bernal	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-08 23:26:39	1
701	3	2	11	0001	0002	0003	Se evidencio la caída de tres pedazos de calamina en el almacén de suministros	Arellano León, Andre	andre.arellano@kr.com.pe	VISITA	2012-11-09 16:05:43	1
706	3	2	11	0001	0002	0003	El personal informo que los fluorescentes del almacén de azúcar se cayeron.	Arellano Leon, Andres	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-12 15:38:05	1
711	3	2	11	0001	0002	0003	Se observo que la vereda (frente al comedor) esta dañada, presentando una leve rotura en el filo.	Parientes Sánchez, Deyvi Alan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-15 23:59:02	1
720	3	2	11	0001	0002	0003	El personal observo que la cerca que divide el almacén de etiquetas y producto terminado se encontraba inclinado y los pernos del piso sobresalidos.	Torres , Juvenal	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-21 00:24:49	1
721	3	2	11	0001	0002	0003	El personal observo que la cerca que divide el almacén de etiquetas y producto terminado se encontraba inclinado y los pernos del piso sobresalidos.	Torres , Juvenal	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-21 00:29:53	1
722	3	1	11	0001	0001	0008	Durante las inspecciones se detecto que algunas de las columnas que se encuentran en la Rampa de carga del producto terminado,presentan choque de montacarga.	Salvatierra , Carlo	csalvatierra@kolareal.com.do	SSDOMINICANA	2012-11-22 22:16:52	1
726	3	2	11	0001	0002	0003	EL Sr. comunico que la puerta de almacen de azucar no cierra.	Arellano Leon, Andre	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-22 23:32:09	1
734	3	1	11	0001	0001	0008	SE DETECTA ESCALERA DE ACCESO A RAMPA DE CARGA DEL ALMACEN LOCAL,CON UNO DE LOS ANCLAJE FUERA DE LUGAR./n	Salvatierra , Carlo	csalvatierra@kolareal.com.do	SSDOMINICANA	2012-11-26 20:31:13	1
738	3	2	11	0001	0002	0003	La calamina, del techo de planta de produccio se esta desprendiendo.	Parientes Sánchez, Deyvi Alan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-29 00:49:53	1
739	3	2	11	0001	0002	0003	Se observo que la estructura de madera ubicada en la zona del caldero de 150bhp estaba rota.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-30 01:57:28	1
740	3	2	11	0001	0002	0003	Se observo que una calamina del techo de la planta de tratamiento de agua esta rota.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-30 01:59:00	1
742	3	2	11	0001	0002	0003	La pared de madera que proteje las compresoras se salio de su lugar, quedando colgando de un liston d emadera.	Parientes Sánchez, Deyvi Alan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-30 23:43:04	1
743	3	2	11	0001	0002	0003	Seis calaminas del techo de almacen de producto terminado se salieron de su lugar.	Parientes Sánchez, Deyvi Alan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-30 23:43:52	1
744	3	2	11	0001	0002	0003	El personal se raspo la espalda.	Salvador Grados, Alejandro	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-11-30 23:46:10	0
759	3	4	11	0001	0001	0008	Se encuentra columna con choque en la rampa de carga y descarga en almacen local/n	mercado nuñez, miguel	mmercado@kolareal.com.do	SSDOMINICANA	2012-12-07 23:30:26	1
762	3	2	11	0001	0002	0003	Derrame de jarabe generade limón por el desague	Parientes Sánchez, Deyvi Alan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-08 21:51:05	1
763	3	1	11	0001	0001	0008	SE ENCUENTRA COLUMNA CON CHOQUE EN ALMACEN DE PRODUCTO TERMINADO /n	Mercado Nuñez, Miguel	mmercado@kolareal.com	SSDOMINICANA	2012-12-09 15:57:21	1
764	3	1	11	0001	0001	0008	SE ENCUENTRA COLUMNA CON CHOQUE EN PASILLO FRENTE A TRATAMIENTO DE AGUAS/n	Mercado Nuñez, Miguel	mmercado@kolareal.com	SSDOMINICANA	2012-12-09 16:03:16	1
766	3	2	11	0001	0002	0003	La puerta de Sala de jaraba que se retiró para una trabajo de proyecto se colocó en la parte exterior de la mismo, se cayó lo cual originó la ruptura de la puerta.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SGIHUAURA	2012-12-10 23:10:03	0
770	3	1	11	0001	0001	0008	SE ENCUENTRA TUBERIA QUE PROTEGE CABLES ELECTRICOS EN PISO	Mercado Nuñez, Miguel	mmercado@kolareal.com	SSDOMINICANA	2012-12-12 11:54:54	1
787	3	4	11	0001	0002	0003	El. Ing. reporto que la boya del pasteurizador de la linea isotonica presenta una rotura.	Osorio Atao, Jhon	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-28 00:23:20	1
789	3	4	11	0001	0002	0003	En la linea isotonica se cae una paleta conteniendo 13 camas de botellas de fruvi vacias.	Rios Lucho, Julio	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-28 17:04:24	1
796	3	4	11	0001	0002	0003	Se observa la rejilla de la canaleta de almacen de preformas y tapas rota.	Parientes Sanchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-07 23:26:20	1
812	3	4	11	0001	0001	0008	AL MOMENTO DE DEMOSTAR ESCALERA EN LA ANTIGUA OFICINA DE PRODUCCION ,AL USAR EL EQUIPO DE CORTE (OXICORTE) UNA LLAMA DE FUEGO INCENDIO UNA PARTE DE MADERA DE DICHA OFICINA .	Mercado Nuñez, Miguel	mmercado@kolareal.com.do	SSDOMINICANA	2013-01-08 23:57:17	1
813	3	4	11	0001	0001	0008	SE ENCUENTRA CARRO UTILIZADO PARA COLOCAR PRODUCTOS MAL EMPACADOS CON UNA ESQUINA DEFECTUOSA POR LO QUE PUEDE CAUSAR UNA CORTADURA AL PERSONAL DE DICHA AREA.	Mercado Nuñez, Miguel	mmercado@kolareal.com.do	SSDOMINICANA	2013-01-08 23:58:43	1
814	3	4	11	0001	0001	0008	SE DETECTO CAIDA DE TUBOS PVC CONTENIENDO ALAMBRES O CABLES ELECTRICOS DE CAMARAS DE SEGURIDAD.	Mercado Nuñez, Miguel	mmercado@kolareal.com.do	SSDOMINICANA	2013-01-09 00:01:32	1
817	3	4	11	0001	0001	0008	DURANTE LA INSPECCION DE LA INSTALACION DE GLP SE DETECTO QUE EXISTE UNA FUGA EN UNO DE LOS TANQUES DE 1000 GLNS POR LA PARTE DE LA VALVULA DE EXTRACCION DEL GAS.	Salvatierra Romero, Carlos	csalvatierra@kolareal.com.do	SSDOMINICANA	2013-01-10 01:13:17	1
818	3	4	11	0001	0001	0008	EN LAS CANALETAS DE LA RAMPA DE PRODUCTO TERMINADO UNA PATANA SE LE ATASCO UNA DE LAS LLANTAS DELANTERAS Y LA MISMA EXPLOTO ,HORAS MAS TARDE TARDE EL CAMION DE REGAR AGUA PASO POR ENCIMA DE LA CANALETA Y EL MISMO CAYO DENTRO.	Reynoso Nuñez, Filiberto	freynoso@kolareal.com.do	SSDOMINICANA	2013-01-10 01:25:25	1
826	3	4	11	0001	0001	0008	SE DETECTO REJILLA DE CANALETA EN MALAS CONDICIONES ENTRE AREA DE SOPLADORA DE LINES 1 Y 2.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2013-01-11 04:40:12	1
827	3	4	11	0001	0001	0008	PRESENCIA DE CRISTAL CUARTEADO DE LA PUERTA QUE DA ACCESO DESDE SOPLADORA HASTA LLENADORA LINEA 6.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2013-01-11 04:45:07	1
830	3	4	11	0001	0002	0002	El día sábado 12 de enero 2013 siendo las 07:30 a.m. al realizar la inspección rutinaria por planta, se observó que una de las ventanas de los vestuarios de los estibadores estaba rota. Es necesario precisar que el accidente se cometió en el turno de noche turno "B" del día anterior.	Huertas Sueros, Victor	victor.huertas.sgi@gmail.com	SGIAREQUIPA2	2013-01-13 01:56:47	1
836	3	4	11	0001	0002	0002	Siendo las 00:15 horas en el Almacén de Producto Terminado se han caído 2 pallets de KR Limón 2L, los mismos que han empujado a 1 pallet de Sabor de Oro 2,650 L, ocasionando producto para acomodar y volver a empacar.	Mora Bernal, Yvessy	victor.huertas.sgi@gmail.com	VISITA	2013-01-15 16:12:11	1
846	3	4	11	0001	0002	0002	Siendo las 08:05 hrs se detectó fuga de gas en el caldero de la lavadora de botellas.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-01-18 02:59:07	1
847	3	4	11	0001	0002	0002	Siendo las 08:05 hrs se detectó fuga de gas en el caldero de la lavadora de botellas.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-01-18 02:59:15	1
887	3	4	11	0001	0001	0008	EL OPERADOR MARCELO MARIÑEZ  AL  MOMENTO DE MOVER VARIAS PALETAS CON EL MONTACARGA LE DIO UN GOLPE AL LETRERO DE SALIDA EN PRODUCCION (LINEAS 4-5 Y 6),LO QUE PROVOCO LA CAIDA DE DICHO LETRERO.	Espinal Genere, Idelfonzo	iespinal@kolareal.com	SSDOMINICANA	2013-02-08 10:33:46	1
889	3	4	11	0001	0002	0003	Se detecto una fuga de agua en laboratorio de Investigacion y Desarrollo, lo cual inundo dicho ambiente.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-09 11:07:21	1
903	3	4	11	0001	0002	0003	Se detecto la ruptura de una tubería de 1", en el patio del nuevo pavimento a horas de las 09:20 de la noche.	Purizaga Saavedra, Erikc	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 14:38:23	1
929	3	4	11	0001	0002	0003	Se dio reporte de caída de recubrimiento lateral en techo de Auditorio.	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-03-06 01:01:40	1
1052	3	4	11	0001	0001	0008	MONTACARGA IMPACTA CONTRA LA PARED CUANDO EL OPERADOR HACÍA MOVIMIENTO DE PALETAS VACÍAS, EL IMPACTO SE PRODUJO MIENTRAS RETROCEDÍA.	Salvatierra Romero, Carlos	csalvatierra@kolareal.com.do	ADMINISTRADOR	2013-03-19 00:00:00	1
1049	3	4	11	0001	0001	0008	SE DETECTA TUBERÍA DE VAPOR EN CONTACTO DIRECTO CON TECHO DE MATERIAL INFLAMABLE	Mercado , Miguel	\N	ADMINISTRADOR	2013-03-21 00:00:00	1
1054	3	4	11	0001	0001	0008	EL SR. JULIO CÉSAR AREAS SE OCASIONÓ UN ALEVE HERIDA EN EL DEDO ÍNDICE DE LA MANO IZQUIERDA CUANDO SE DEDICÓ A EXTRAER UNA PREFORMA QUE SE ATASCÓ EN LA LEVA, MIENTRAS REALIZABA ESTA OPERACIÓN LA LEVA SE ACTIVO AL BAJAR LA TAPA, ATRAPANDOLE EL DEDO.	Salvatierra Romero, Carlos	csalvatierra@kolareal.com.do	ADMINISTRADOR	2013-03-22 00:00:00	1
1055	3	4	11	0001	0001	0008	EL SR. JOSÉ MANUEL LANTIGUA EN EL MOMENTO DE TRANSPORTAR UN APALETA HACIA EL ALMACÉN FRENÓ DE GOLPE DEBIDO A QUE OTRO MONTACARGUISTA SE LE ATRAVESÓ, PROVOCANDO QUE EL PRODUCTO ESTIVADO SE CAIGA.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	ADMINISTRADOR	2013-03-25 00:00:00	1
959	3	4	11	0001	0002	0003	En la sala de soplado (Frente a las etiquetadoras) se encontro la luna del marco contra incendios roto, esto podria causar daños a personas en caso se utilicen o pasen por esta zona	Rosales Espinoza, Ricardo	ricardo.rosales@kr.com.pe	MTHUAURA	2013-04-01 18:49:04	1
1058	3	4	11	0001	0001	0008	SE DETECTA ESPACIO ABIERTO EN CANALETA QUE SE ENCUENTRA EN EL ÁREA DE LÍNEA DE PRODUCCIÓN 04./n	Mercado Nuñez, Miguel	mmercado@kolareal.com.do	ADMINISTRADOR	2013-04-05 00:00:00	1
1061	3	4	11	0001	0001	0008	AL MOMENTO DE DAR REVERSA CON EL  MONTACARGAS SE PRODUCE EL CHOQUE CONTRA LA PARED./n	Mercado Nuñez, Miguel	mmercado@kolareal.com.do	ADMINISTRADOR	2013-04-10 00:00:00	1
1041	3	1	11	0001	0002	0002	A horas 19:10pm aproximadamente fui comunicado por la inginiera de turno y asistente, que en el area de alimentación de botellas de vidrio entrada linea Nº 1, en la columna de dicha zona, las mayolicas que protegen la columna se encontraban rotas, aparentemente ésto habría ocurrido en el turno anterior.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-05-10 00:00:00	1
1111	3	1	11	0001	0002	0002	Una de las micas de la puerta de los baños de la planta de jugos se ha despegado; al igual que halgunos marcos de las puertas.	Llave Pinto, César	cesar.llave@kr.com.pe	SGIAREQUIPA2	2013-05-16 00:00:00	1
1348	3	1	11	0001	0001	0008	SE DETECTO FALTA DE PROTECCION A LA TUBERIA DE VAPOR QUE SE ENCUENTRA EN LA ENTRADA  A LOS PASILLOS DE PUERTA DE SOPLADO./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-03 00:00:00	1
1135	3	1	11	0001	0002	0002	El día 04-06-2013 a horas 08:00 am aproximadamente al momento de descargar los pallets que contienen botellas vacías del camión de Chanaltin procedí a levantar el pallet de uno de los extremos de la carrocería, cuando de repente sentí que cayeron botellas del otro lado de la carrocería rompiéndose 09 cajas de vidrio de 250ml kr. Cabe mencionar qué los pallet que vienen de Cinkat no vienen asegurados con strech correctamente .\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n/n	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-06-04 00:00:00	1
1139	3	1	11	0001	0002	0002	El dia de hoy al promediar las 21:00 hasta las 00:00 horas se presentó un fenomeno natural (fuertes corrientes de viento) que daño y rompió la malla rachell del almacén de bobinas thermocontraibles \t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Llave Pinto, César	cesar.llave@hotmail.com	SGI 310	2013-06-06 00:00:00	1
1140	3	1	11	0001	0002	0002	El día de hoy al promediar las 21:00 hasta las 00:00 horas, se presentó un fenómeno natural (fuertes corrientes de viento) rompiendo la malla rachell del area de lavado de botellas manual. \t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Llave Pinto, César	cesar.llave@kr.com.pe	SGI 310	2013-06-06 00:00:00	1
1141	3	1	11	0001	0002	0002	El día 11-06-2013 aproximadamente 22:00 pm en el área de APT, almacén nuevo, se cayeron cerca de 8 pallets de agua cielo sin gas  2500ml al piso.\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-06-11 00:00:00	1
1197	3	1	11	0001	0002	0002	El dia 06 de julio aprox. a las 7:20 am en el patio de jugos se cayeron 2 pallets de jugos Kris Green formato 1500 ml, los que estaban apilados en columnas de 2 filas con pallets de preformas.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	,	\N	SGI 310	2013-07-06 00:00:00	0
1182	3	2	11	0001	0001	0008	Se encuentra puerta de cristal rota en sala de jarabe terminado.	Mercado Nuñez, Miguel	mmercado@kolareal.com.do	VISITAS	2013-07-06 00:00:00	1
1201	3	1	11	0001	0002	0002	Estaba pasando las cajas del rechazo (linea Nº 1) a mis compañeros debido al cambio de sabor  cuando se cayeron 3 cajas de botellas vacias de vidrio.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Minaya Torres, Jorge	claudia.coaquira@kr.com.pe	SGI 310	2013-07-08 00:00:00	1
1189	3	1	11	0001	0002	0003	Siendo las 03:30 am aproximadamente, en el área de Flumix de la LP03, cayó de forma inesperada el protector del fluorescente, cerca de la ubicación del Sr. Jose Leiva Diaz, sin embargo  no ocasiono ningún accidente.	Leiva Diaz, Jose	erick.giron@kr.com.pe	SSOHUAURA	2013-07-09 00:00:00	1
1190	3	1	11	0001	0002	0003	Siendo las 03:30 am aproximadamente, en el área de Flumix de la LP03, cayó de forma inesperada el protector del fluorescente, cerca de la ubicación del Sr. Jose Leiva Diaz, sin embargo  no ocasiono ningún accidente.	Leiva Diaz, Jose	erick.giron@kr.com.pe	SSOHUAURA	2013-07-09 00:00:00	1
1206	3	1	11	0001	0002	0002	Cuando procedia a retirar un pallet de envase vacio de KR 250 se cayeron dos cajas  rompiendose botellas.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Chambi , Washington	victor.huertas@kr.com.pe	SGI 310	2013-07-12 00:00:00	1
1241	3	1	11	0001	0002	0002	El día 01 de agosto aprox. a las 23:30, el Sr. Quispe Layme Manuel, se encontraba alimentando de cajas con botellas de vidrio a la linea 1 cuando un pallet se inclino y cayó rompiéndose las botellas contenidas en una caja.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-08-01 00:00:00	1
1244	3	1	11	0001	0002	0002	El día 2 de agosto aprox. a las 4:10 am, el Sr Eulogio Locumber Huayllapuma, operador suplente de montacarga, se encontraba realzianado su trabajo en la linea de vidrio, llevando KR negra de 300 ml, cuando empujo el pallet de adelante este se atraco, cayó y rompió 7 cajas x 24 botellas.	Huertas Sueros , Victor	victor.huertas@kr.com.pe	SGI 310	2013-08-02 00:00:00	1
1245	3	1	11	0001	0002	0002	El día 2 de agosto aprx. a las 4:00 pm en la zona de carga y descarga de camiones encontre 6 cajas de botellas de vidrio rotas.	Coaquira Paz, Claudia	claudia.coaquira@kr.com.pe	SGI 310	2013-08-02 00:00:00	1
1251	3	1	11	0001	0002	0002	El día 12 de agosto el Sr. Eulogio Locumber, conducía el montacarga Linde 2, cuando al llevar botellas del rechazo  hacia el almacém de envases vacios, hizo caer 4 cajas, rompiendose 4 botellas de formato oro 300 ml.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-08-12 00:00:00	1
1272	3	1	11	0001	0002	0002	Debido a la fuerte corriente de vientos, se encontro que una calamina del techo del cuarto de descanso, se desprendiera.	Coaquira Paz, Claudia	claudia.coaquira@kr.com.pe	SGI 310	2013-08-28 00:00:00	1
1299	3	1	11	0001	0002	0003	Se había planificado realizar la re-configuración de la central telefónica, para realizar dicha labor se tenia que ingresar a la Oficina de Secretaria General, sin embargo ya encargada ya no se encontraba y Vigilancia no tenía su llave, viendo esto procedí a ingresar por la ventana rompiendo una de estas, lo cual no informe, por lo que la Secretaria al día siguiente viene e informa a RR.HH. y SGI de lo sucedido.	López Andrade, Carlomagno	erick.giron@kr.com.pe	SSOHUAURA	2013-09-17 00:00:00	1
1305	3	1	11	0001	0002	0003	La plataforma de acceso a los Tanques de almacenamiento de la Línea Isotónica (LP5), se encuentran con desgaste esto debido a que la soda caustica las esta carcomiendo, siendo una condición insegura para los operadores.	Ramos Ventocilla, Carlos Alberto	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-09-21 00:00:00	1
1306	3	1	11	0001	0002	0003	Reporta condiciones desfavorables en la escalera de acceso a los tanques pues se encuentra muy resbalosa y no tiene fricción o agarre al subir y bajar. Informa que ya ha sufrido resbalones. /nHora de reporte 04:30 Hrs	Ramos Ventocilla, Luis Alberto	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-09-21 00:00:00	1
1362	3	1	11	0001	0002	\N	el Día 27/09/13 a la 1:50am aprox. en el Area de almacén de envases vacios el operador de montacarga Sandro Vilca hizo caer un  pallet de envases vacios K.R. 250 ml Rompiendose un promedio de 6 cajas.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-09-27 00:00:00	1
1328	3	4	11	0001	0001	0008	LA PUERTA DE ENTRADA A LA LINEA KRONES SE CAYO PORQUE NO TENIA LOS SOPORTES DE AGARRE NI ESTABA PEGADA CON NADA EN LA PARED./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-09-30 00:00:00	1
1331	3	1	11	0001	0001	0008	Se detecto que la puerta de malla ciclónica ubicada en la parte central de almacén  de azúcar está a punto de caer al suelo.	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-01 00:00:00	1
1346	3	1	11	0001	0001	0008	SE DETECTO PAREDES PICADAS EN EL AREA DE VOLTEO DE AZUCAR./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-03 00:00:00	1
1347	3	1	11	0001	0001	0008	SE DETECTO TUBERIAS CON PRESENCIA DE OXIDO Y EN MALAS CONDICIONES EN LA ENTRADA DE LA PUERTA DE CLARIFICADO./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-03 00:00:00	1
1349	3	4	11	0001	0001	0008	PRESENCIA DE LOCETAS PICADAS EN LA PARED Y DAÑADAS EN EL PISO DE LA SALA DE JARABE TERMINADO./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-03 00:00:00	1
1339	3	1	11	0001	0001	0008	SE DETECTO LA PRESENCIA DE MALLAS ROTAS Y DESPEGADAS EN EL AREA DE VOLTEO DE AZUCAR./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-03 00:00:00	1
1340	3	1	11	0001	0001	0008	SE DETECTO CRISTAL ROTO EN MAMPARA DE TANQUES DE SALA DE JARABE SIMPLE./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-03 00:00:00	1
1342	3	1	11	0001	0001	0008	SE DETECTO CRISTAL ROTO EN VENTANALES DE VOLTEO DE AZUCAR./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-03 00:00:00	1
1356	3	1	11	0001	0002	0003	Aproximadamente a las 08:00 hrs, se reporta que en el Almacén de Lubricantes se había salido la tubería de agua desde un codo, inundando dicha área.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-10-04 00:00:00	1
1387	3	1	11	0001	0002	0002	EL DIA 04-10-13 APROX. 06:30 AM FUI COMUNICADO POR EL SEÑOR LAZARO MAMANI AUXILIAR DE LIMPIEZA, QUE EL BAÑO DE PLANTA JUGOS PORTON #4, EN LA BASE DEL DISPENSADOOR QUE ATAJA AL PAPEL LA PARTE INTERIOR SE ENCONTRABA ROTO.	HUERTAS , VICTOR	victor.huertas@kr.com.pe	SGI 310	2013-10-04 00:00:00	1
1365	3	4	11	0001	0001	0008	EL DEPOSITO DE MANGUERA CONTRA INCENDIO QUE ESTA UBICADO EN LOS PASILLOS DE ALMACEN CENTRAL PROXIMO A LA OFICINA SE ENCUENTRA EN MALAS CONDICIONES./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-07 00:00:00	1
1367	3	1	11	0001	0001	0008	SE DETECTO LA PRESENCIA DE PARED Y VIGAS DETERIORADAS AL SER GOLPEADAS POR MONTACARGAS EN MOMENTO DE UBICAR LAS PALETAS CON EL PRODUCTO TERMINADO EN ALMACEN CENTRAL. /n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-08 00:00:00	1
1368	3	4	11	0001	0001	0008	PRESENCIA DE CRISTAL ROTO EN EL AREA DE PRODUCCION DETRÁS DEL FLOMIX EN LINEA DE VIDRIO./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-08 00:00:00	1
1369	3	4	11	0001	0001	0008	SE DETECTO UN  CRISTAL ROTO EN EL AREA DE PRODUCCION ESPECIFICAMENTE EN SALA DE PASTEURIZADO DE JUGOS./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-09 00:00:00	1
1391	3	1	11	0001	0002	0002	EL DIA 09/10/13 A LAS 05:00 PM APROXIMADAMENTE EL SR. FRANK CANASAS TORTRES ESTUVO OPERANDO EL MONTACARGA LINDEL #4, EL CUAL FUE CHOCADO POR EL SEÑOR ROMPIENDO EL FARO POSTERIOR DEL MONTACARGA.	CARPIO DAVILA, NELSON	nelson.carpio@kr.com.pe	SGI 310	2013-10-09 00:00:00	1
1371	3	4	11	0001	0001	0008	EN HORAS DE LAS 10:50A.M. APROXIMADAMENTE EXPLOTA CRISTAL DE LA LLENADORA DE LINEA-5./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-10 00:00:00	1
1374	3	1	11	0001	0002	0003	Siendo las 23:45 hrs aproximadamente, me pasa la voz el Sr. Azañero indicando que hace ya 25 minutos se percato que la tubería del agua se había roto, esta se encuentra al costado de la Rampa N° 4 del Almacén de Productos Terminados, posiblemente causado por un montacarga debido a que habían paletas vacías cerca de la zona y actualmente ya no están.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-10-10 00:00:00	1
1380	3	4	11	0001	0001	0008	EL TAMQUE PEQUEÑO DE COMBUSTIBLE QUE UTILIZAN LOS ELECTRICISTA PARA EL USO DE GENERADORES LO ESTABAN LLENANDO DE COMBUSTIBLE Y A ESTOS SE LES OLVIDO QUE DEJARON LA LLAVE ABIERTA POR LO QUE OCURRIO UN DERRAME DEL MISMO./n	TORRES , EDWARD	etorres@kolareal.com.do	VISITAS	2013-10-12 00:00:00	1
1394	3	1	11	0001	0002	0002	EL DIA 12-10-13 A LAS 5:20 PM APROXIMADAMENTE EL SEÑOR YVESY MORA PERSONAL DE LIMPIEZA, SE DISPONIA A RETIRAR EL FRASCO AMBIENTADOR DEL BAÑO QUE ESTA A LADO DEL COMEDOR, DANDOSE CUENTA QUE NO ESTABA DICHO FRASCO.	CARPIO DAVILA, NELSON	nelson.carpio@kr.com.pe	SGI 310	2013-10-12 00:00:00	1
1395	3	1	11	0001	0002	0002	EL DIA 14/10/13 A LAS 8:30 AM EL SEÑOR FRANCISCO VILCA HIPANA OPERADOR DE MONTACARGA SE ENCONTRABA DESCARGANDO PRODUCTO T. DRINK 475 ML. EL CUAL NO SE PERCATO QUE HABIA MADERA SOBRE LOS PALLETS Y AL MOMENTO DE RETIRAR EL PALLETS SE ATRACO CON PLASTICO ROMPIENDOSE 5 PAQUETES DE T. DRINK.	HUERTAS , VICTOR	victor.huertas@kr.com.pe	SGI 310	2013-10-14 00:00:00	1
1383	3	1	11	0001	0002	0003	Siendo las 03:45 aprox. el Sr. Luis Salvador encargado del montacarga Linde 1, se pretendía a retirar un palet terminado de botellas presentación de 3 lt, cuando este se cae de pronto debido a que la base estaba mal armada. LP2	Salvador Salvador, Luis	erick.giron@kr.com.pe	SSOHUAURA	2013-10-16 00:00:00	1
1400	3	1	11	0001	0002	0003	Siendo las 04:00 hrs aprox. me percato que en el Almacén de Preformas se encontraron palet´s de cajas de tapas derrumbadas, esto se supone a la mal apilamiento que tuvieron.	Janampa Arango, Arturo	arturo.janampa@kr.com.pe	SSOHUAURA	2013-10-22 00:00:00	1
1409	3	2	11	0001	0001	0008	SE DETECTA CRISTAL ROTO DE LA PUERTA COMERCIAL QUE DA ENTRADA HASTA EL PASILLO FRENTE A OFICINA DE VENTAS./n	Espinal Genere, Idelfonzo	iespinal@kolareal.com.do	VISITAS	2013-10-26 00:00:00	1
1429	3	1	11	0001	0002	0002	El dia 28/10/13 aprox. a las 17:15 el Señor Jorge Garcia Neza Encargado de Almacén de Preformas, Operando el montacarga levanto con la uña las  tres (03) cajas de preformas al mismo tiempo, inclinandose y cayendo.	CARPIO  DAVILA, NELSON	nelson.carpio@kr.com.pe	SGI 310	2013-10-28 00:00:00	1
1436	3	1	11	0001	0002	0003	Siendo las 17:00 hrs se encontraba en la Línea N° 02 paletizando, cuando paso cerca a la columna de palet´s, uno de estos tenia un clavo sobresalido, donde se engancho y le rompió el polo manga larga.	Camones Reyes, Jerson	erick.giron@kr.com.pe	SSOHUAURA	2013-10-29 00:00:00	1
1451	3	1	11	0001	0002	0002	EL DIA 04/11/13 A LAS 11:30 APROX EL SEÑOR VICENTE TACO OPERADOR DEL MONTACARGA LINDE #3 ME COMUNICO QUE EL ESPEJO REROVISOR EXTERIOR LADO IZQUIERDO DEL CONDUCTOR SE ENCONTRABA RAJADO SIENDO UN PELIGRO Y  PUDIENDO PROVOCAR UN ACCIDENTE.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-04 00:00:00	1
1435	3	1	11	0001	0002	0003	Siendo las 11:30 hrs aprox. estando en el Pozo de Extracción N° 2, se percata que la tubería por donde pasa en agua extraída, en uno de sus uniones  tenía rastros de tener hongos en la parte exterior, por lo que se le informa al área de Sostenibilidad que vea el tema.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-11-05 00:00:00	1
1456	3	1	11	0001	0002	0002	EL DIA 09/11/13 APROX. A LAS 11:00 AM ME COMUNICO EL SR. OSCAR NOE QUE LA BARANDA DE LAS ESCALERAS QUE SE ENCUENTRAN A LA DERECHA DE LA ENTRADA DE LA LINEA #3 SE ENCUENTRAN ABOYADAS Y DAÑADAS POR EL CHOQUE DE MONTACARGA PUDIENDO PROVOCAR CORTES O LESIONES AL PERSONAL QUE SUBE DICHAS ESCALERAS.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-09 00:00:00	1
1445	3	1	11	0001	0002	0003	Se encontró que en la plataforma para el acceso a los tanques de bebida, existe una abertura debido a la corrosión originada por la soda caustica (NaOH), lo que puede provocar torceduras y en el peor de los casos caídas, golpes y contusiones para el operador.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2013-11-13 00:00:00	1
1447	3	1	11	0001	0002	0003	Siendo las 10:00 hrs aproximadamente, se desprende una de las abrazaderas que sirve como soporte de tuberías, cerca a la etiquetadora de la línea de Producción N° 2	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2013-11-15 00:00:00	1
1479	3	1	11	0001	0002	0002	EL DÍA 18/11/13 A LAS 10:00 AM SE OBSERVO ROTA Y DETERIORADA LA TAPA METÁLICA EN EL PATIO DE LA LINEA 4 PUDIENDO PROVOCAR ACCIDENTES A LOS MONTACARGAS YA QUE CIRCULAN CON NORMALIDAD POR ESTA ZONA.	CARPIO ACCIES DENT DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-18 00:00:00	1
1482	3	1	11	0001	0002	0002	EL DÍA 22/11/13 A LAS 15:15 EN ZONA DE DESMEDROS EL SEÑOR IVESSY MORA BERNAL SE ENCONTRABA EN EL MONTACARGA ABASTECIENDO AL CAMIÓN DE CHANALTIN CON ENVASES VACÍOS Y AL MOMENTO DE SUBIR HACIA LA RANFLA DEL CAMIÓN SE ATASCA HACIENDO CAER UNA CAJA DE ENVASES VACIOS.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-22 00:00:00	1
1485	3	1	11	0001	0001	0008	EL TECHO DE LA OFICINA DE LA SECRETARIA SE ENCUENTRA AGRIETADO./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-12-03 00:00:00	1
1597	3	4	11	0001	0002	0002	Aproximadamente 09:00 a.m. en el área de APT se observa que una de las esquinas de la biga de la puerta de almacén antiguo que da acceso al almacén nuevo de APT, el estuque se encuentra dañado y rajado.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-12-03 00:00:00	1
1599	3	1	11	0001	0002	0002	Aproximadamente 07.10 am en el área de almacen nuevo de APT se cayeron  cerca de 20 pallet entre agua cielo sin gas format 2500 ml y kris formato 1500 ml.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-12-05 00:00:00	1
1600	3	1	11	0001	0002	0002	Aproximadamente 07.10 am en el área de almacen nuevo de APT se cayeron  cerca de 20 pallet entre agua cielo sin gas format 2500 ml y kris formato 1500 ml.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-12-05 00:00:00	0
1601	3	1	11	0001	0002	0002	Aproximadamente 01.30 am me encontraba realizando mi trabajo con normalidad, cuando fui a recoger un pallet que estaba apoyado al muro de mayolica y al momento de retirar dicho pallet con las manos las mayolicas del muro se cayeron y otras quedaron desprendidas.	Minaya Torres, Jorge	\N	SGIAREQUIPA2	2013-12-06 00:00:00	1
1516	3	1	11	0001	0001	0008	SE DETECTO CRISTAL ROTO EN LA MAMPARA DEL FLOMIX DE LINEA-3./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-12-11 00:00:00	1
1523	3	2	11	0001	0002	0003	Siendo las 11:20 hrs, se encuentra en el Estacionamiento de la empresa, que una de sus vigas de amdera se encuentra apolillada y que su base ha sido removida, por lo que el techo podría venirse en cualquier momento.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-12-14 00:00:00	1
1524	3	2	11	0001	0002	0003	Siendo las 22:10 hrs se encontró en la LP5 a la altura de la máquina encapsuladora que el revestimiento de la tubería de vapor se había salido, lo cual puede causar perdida de vapor y rotura de la tubería, causando así un accidente.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-12-16 00:00:00	1
1525	3	2	11	0001	0002	0003	Siendo las 22:15 hrs se encontró que los fuorescentes que se encuentran en las escaleras que se dirigen del área de sostenibilidad a contabilidad no prenden, por lo que podria provocar un accidente.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-12-16 00:00:00	1
1522	3	4	11	0001	0001	0008	SE DETECTO DERRAME DE GASOIL DESDE PRODUCTO TERMINADO HASTA EL FRENTE DE PUERTA DE CONTROL-3 DEBIDO A QUE EL MONTACARGAS CON CODIGO 71-21 SE ENCUENTRA CON UNA MANGUERA DE COMBUSTIBLE ROTA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-12-16 00:00:00	1
1608	3	1	11	0001	0002	0002	A hrs 21:20  aproximadamente, el Señor Luis Manrique Guzman que se encontraba conduciendo el montacargas Linde Nº 2 hizo caer 32 cajas de envases de botellas de vidrio formato 300 ml exportación caña alta KR.	Carpio Dávila, Nelson	nelson.carpio@kr.com.pe	SGIAREQUIPA2	2013-12-21 00:00:00	1
1533	3	2	11	0001	0002	0003	Siendo las 10:30 hrs aprox. se encontró 2 aberturas en el techo del Almacén de Producto Terminado, haciendo las averiguaciones se halló que este hecho había sucedido el día 21-12-13 en horas de la mañana, así mismo con estas aberturas se incremento el ingreso de aves a dicho almacén siendo un vector potencial en la contaminación del producto y de enfermedades respiratorias.	Rojas Cruces, Alfonso	erick.giron@kr.com.pe	SSOHUAURA	2013-12-23 00:00:00	1
1609	3	1	11	0001	0002	0002	A horas 10:00 a.m. aproximadamente en la cocina del Comedor se observa una serie de condiciones inseguras:/n1. Ventilación general inadecuada ya que por los vapores que se generan, el calor es exagerado a horas punta./n2. Ausencia de mesa o banco para colocar los baldes de refresco que se encuentran ubicados en el piso./n3. La banca  que utilizan para colocar las ollas de almuerzo y segundos, se encuentra rota una prensa de mano (metálica) sujeta una de las esquinas de la banca, lo cual genera ries	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-02 00:00:00	1
1612	3	1	11	0001	0002	0002	A las 11:20 hrs. aprox. el Sr. Marco Ancori al levantar un pallet de envases vacíos KR 300mL con el montacarga, se cayeron las cajas del pallet de atrás, rompiéndose un promedio de 07 cajas de envases vacíos.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-03 00:00:00	1
1553	3	2	11	0001	0001	0008	SE ENCUENTRA TUBERIA DE VAPOR CON ESCAPE DE AGUA FRENTE A LA ENTRADA DE LINEAS DE PRODUCCION./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2014-01-08 00:00:00	1
1564	3	1	11	0001	0002	0003	Siendo las 17:26 hrs el Ing. Max Caro reporta un incidente que influye directamente con uno de nuestros indicadores ambientales: Reducción de Consumo de Agua, esto debido a encontrar fugas en los Baños y Duchas de Producción.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2014-01-11 00:00:00	1
1620	3	1	11	0001	0002	0002	Al promediar las 02:00am personal de producción presentó una queja sobre el cuarto de descanso: por motivo de la lluvia una esquina del cuarto gotea, mojando el colchón lo que les provoca frío.	Mora Bernal, Yvessy	\N	SGIAREQUIPA2	2014-01-16 00:00:00	1
1621	3	1	11	0001	0002	0002	Alas 00:15am en el patio de desmedros, cuando el operador Francisco Vilca estaba cargando el camión volvo con producto, hizo una mala maniobra rompiendo 22 botellas de producto kr 300ml sabor negra.	Mora Bernal, Yvessy	\N	SGIAREQUIPA2	2014-01-17 00:00:00	1
1573	3	1	11	0001	0002	0003	Durante nuestra ronda, aproximadamente a las 22:00 hrs, se encontró que la entrada al nuevo hangar que lleva a la sala de etiquetado, soplado y a la Línea de producción N° 5 esta golpeada, esto se supone que uno de los montacarguista ha tenido la carga levantada sin percatarse la proximidad de la entrada.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2014-01-20 00:00:00	1
856	3	4	12	0001	0002	0003	EL Sr. informa que en su rutina de limpieza en el almacén de producto químico fiscalizado había presencia de hipoclorito en el suelo.	Collantes Garcia, Carlos	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-23 16:43:33	1
1625	3	1	11	0001	0002	0002	El Sr. Juan Carlos Delgado Guerrero, haciendo uso del montacargas conducido por el señor Jorge García Mesa; al momento de subir la uña levantando al señor Juan Carlos para destrabar la botella atorada, el mástil del montacarga golpea la línea transportadora doblando el protector platinado de Inox.	Apaza Charca, Brando	brando.apaza@kr.com.pe	SGIAREQUIPA2	2014-01-23 00:00:00	1
1628	3	1	11	0001	0002	0002	A horas 03:44am en el área de APT (almacén antiguo), se produjo un choque de montacargas Toyota Nº3 conducido por Edwin Barriga con el montacargas Lindel Nº2 conducido por el señor Marco Ancori, abollando el costado derecho del montacargas.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-25 00:00:00	1
1629	3	1	11	0001	0002	0002	Aproximadamente 13:00pm en el patio de jugos, el señor José Alvares Concha operaba el montacargas trasladando un pallet de botellas de vidrio KR 250ml vacio, cuando realiza la maniobra de girar en U en la ranfla el pallet se inclina rompiéndose 06 cajas	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-27 00:00:00	1
1593	3	1	11	0001	0002	0003	Se evidencia que en la Planta de Tratamiento de Agua Residual, adyacente al sistema de flotación DAF, parte de la baranda de protección se encuentra desoldada.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2014-01-29 00:00:00	1
1588	3	1	11	0001	0001	0008	SE DETECTO HUMEDAD EN LA CARRETERA FRENTE A LA RAMPA DE PRODUCTO TERMINADO DEBIDO A QUE UN TANQUE DE JUGO SE DERRAMO AL SER TRASLADADO HACIA LA CANALETA./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2014-01-29 00:00:00	1
483	3	1	12	0001	0002	0003	Se evidencia trapos industriales, papeles, cajas, en los casilleros, bancas y duchas de vestuarios.	Solano Salinas, Sergio	luis.meza@kr.com.pe	SGIHUAURA	2012-07-04 17:44:59	1
487	3	1	12	0001	0002	0003	Se evidencia que en la subestacion se encuentran unas cajas de botellas que obstaculizan el ingreso a esta area.	Tudelano Yanama, Freddy	freddy.tudelano@kr.com.pe	SGIHUAURA	2012-07-04 17:52:44	1
498	3	1	12	0001	0002	0003	Se evidencia prendas de vestir, papeles, trapos industriales en las duchas de los vestuarios de produccion.	Torres  Grados, Jose Antonio	luis.meza@kr.com.pe	SGIHUAURA	2012-07-09 15:24:22	1
506	3	1	12	0001	0002	0003	Se evidencia la caida de paletas en el patio de APT	Alcantara Damian, Christian	luis.meza@kr.com.pe	SGIHUAURA	2012-07-18 16:49:56	1
542	3	1	12	0001	0002	0003	Se observa cascaras de mandarina en la escalera de RRHH.	Gamarra Torres, Shila	luis.meza@kr.com.pe	SGIHUAURA	2012-08-08 00:05:45	0
543	3	1	12	0001	0002	0003	Presencia de lunas de vidrio entre la vereda de Almacen de Insumos Quimicos y Investigacion & Desarrollo.	Gamarra Torres, Shila	luis.meza@kr.com.pe	SGIHUAURA	2012-08-08 00:07:04	0
547	3	1	12	0001	0002	0003	La zona de Arena que se utiliza como medida preventiva para control de incendios, es obstruida por paletas en el area de Soplado.	,	\N	SGIHUAURA	2012-08-13 16:31:43	0
548	3	2	12	0001	0002	0003	Se evidencia derrame de azucar en el patio de planta.	Bravo Meza, Sheril	luis.meza@kr.com.pe	SGIHUAURA	2012-08-13 16:36:02	1
551	3	1	12	0001	0002	0003	Se evidencia objetos como: sacos de etiquetas, botellas, silla, etc en la azotea de las oficinas contables.	Alcantara Damian, Christian	luis.meza@kr.com.pe	SGIHUAURA	2012-08-14 00:42:52	0
620	3	1	12	0001	0002	0003	Se observa un charco de agua en la puerta de entrada de la sala de jarabe terminado.	Gamarra Torres, Shila	luis.meza@kr.com.pe	SGIHUAURA	2012-09-18 00:18:35	0
623	3	1	12	0001	0002	0003	Se observa 4 botellas de vidrio en el pasadizo de Recursos Humanos .	Gamarra Torres, Shila	luis.meza@kr.com.pe	SGIHUAURA	2012-09-18 20:02:11	1
635	3	1	12	0001	0002	0003	Se observa una botella de Oro vacia colocada sobre el extintor Nº 12 que pertenece al área de Mantenimiento.	Gamarra Torres, Shila	luis.meza@kr.com.pe	SGIHUAURA	2012-09-24 15:40:39	0
644	3	1	12	0001	0001	0008	SE DETECTO MUCHA INUNDACION DE AGUA EN MOMENTOS QUE ESTAVA CAYENDO UNA FUERTE LLUVIA.EN PASILLO PROXIMO HA DANANE Y ALMACEN DE PREFORMAS YA QUE LAS TUBERIAS DE DESAGUE ESTAN EN MAL ESTADO.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-29 18:56:53	1
645	3	4	12	0001	0001	0008	EN EL AREA DE SOPLADO LINEA 3 SE DETECTO MUCHA INUNDACION,CUANDO ESTAVA CAYENDO UN FUERTE AGUACERO.YA QUE LAS TUBERIAS DE DESAGUE ESTAN EN MAL ESTADO.	Espinal Generes, Idelfonzo	iespinal@kolareal.com.do	SSDOMINICANA	2012-09-29 19:00:53	1
663	3	1	12	0001	0001	0008	SE DETECTO MUCHA INUNDACION DE AGUA EN MOMENTOS QUE ESTAVA LLOVIENDO,EN EL PASILLO DE ACCESO A DANANE-ALMACEN PREFORMAS Y SOPLADO.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-10-14 07:09:15	1
676	3	4	12	0001	0001	0008	SE DETECTO PRECENSIA DE MUCHAS MOSCAS EN EL AREA DE LA CASETA DONDE SE UBICAN LAS MERMAS DE LOS REFRESCOS.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-10-27 19:55:22	1
679	3	1	12	0001	0002	0003	Se evidencia una manguera de aire que conecta de la línea 02 a la línea 01 pudiendo ocasionar un accidente, debido a que varias personas han tropezado.	Trejos  Herbas, Oliver	oliver.trejo@kr.com.pe	SSOHUAURA	2012-10-29 23:48:32	1
683	3	1	12	0001	0001	0008	SE DETECTO PRESENCIA DE BASURA EN EL PASILLO DE ACCESO A PLANTA TRATAMIENTO DE AGUA.	ESPINAL GENERE, IDELFONZO	IESPINAL@KOLAREA.COM.DO	SSDOMINICANA	2012-11-02 23:20:58	1
729	3	1	12	0001	0001	0008	SE ENCUENTRA SUFICIENTE CANTIDAD DE AGUAS EN PISO DE ESCALERA DE OFICINA DE SEGURIDAD INDUSTRIAL	Mercado NÚÑEZ, Miguel	mmercardo@kolareal.com.do	SSDOMINICANA	2012-11-23 02:47:06	1
733	3	1	12	0001	0001	0008	EN LA ZONA DE DOSIFICACION DE CLORO DEL AGUA CRUDA SE DETECTA PALETA Y SEPARADOR DEJADOS SIN HACER NINGUNA FUNCION./n	Salvatierra , Carlo	csalvatierra@kolareal.com.do	SSDOMINICANA	2012-11-26 20:29:01	1
755	3	2	12	0001	0002	0003	El tanque de agua que alimenta el túnel de enfriamiento de la linea isotónica tiene presencia de moho, y produjo que el agua de drenaje del túnel estuviera abombada.	Parientes Sánchez, Deyvi Alan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-06 17:13:22	1
761	3	4	12	0001	0002	0003	Se observa que el servicio higiénico de produccion se encuentra sucios	Parientes Sánchez, Deyvi Alan	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-08 21:49:30	1
768	3	4	12	0001	0002	0003	Se evidencio en el almacen de producto terminado  donde estan las paletas con bebida gasificada negra, hay presencia de esta bebida en estado de fermentacion en el piso.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2012-12-11 22:42:13	1
773	3	4	12	0001	0002	0003	La Lic. informa que en el exterior de sala de jarabe simple hay parihuelas mal apiladas a punto de caer.	Nuñez  Rodriguez, Giuliana	giuliana.nunez@kr.com.pe	SSOHUAURA	2012-12-12 20:25:57	1
851	3	4	12	0001	0001	0008	MIENTRAS EL PERSONAL CAMINABA FRENTE A LA OFICINA DE PRODUCCION,TROPIEZA CON UN TUBO QUE SE ENCONTRABA EN EL SUELO DICHO MATERIAL FUE DEJADO CUANDO SE REALIZO LA INSTALACION DE LAS NUEVAS OFICINAS.	Salvatierra Romero, Carlos	iespinal@kolareal.com.do	SSDOMINICANA	2013-01-18 18:07:28	1
859	3	4	12	0001	0002	0003	No se recoge la basura (en cajas) que se encuentra fuera de sala de jarabe simple.	Quichiz Bernal, Edwin	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-01-24 01:11:13	1
882	3	4	12	0001	0002	0003	Las persianas de ingreso almacen se encuentran con polvo.	Parientes Sanchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-05 13:17:07	1
898	3	4	12	0001	0002	0003	En el área de almacenamiento de producto de limpieza adyacente linea 1,se encontró sucio por el turno anterior, generándose incomodidad del personal.	Bravo  Valencia, Yordy	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 14:13:52	1
904	3	4	12	0001	0002	0003	Escuche un ruido fuerte, fui a ver y encontré una  paleta volcada en el suelo del mal estado de la paleta (paleta rota) y di aviso al encargado de  APT.	Alvarez Zegarra, Miguel	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 14:42:13	1
905	3	4	12	0001	0002	0003	Aproximadamente las 15:30 .pm cuando realizaba de limpieza en almacén de QPF evidencie que una de los  bidones con producto # 2180 VI B, tenia una fuga y procedí a ponerlo en otra posición para evitar la fuga y realice la limpieza del área	Rondon Pimentel, Andy	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 14:46:43	1
906	3	4	12	0001	0002	0003	En el turno de noche el personal de sostenibilidad del día 16/02/13 fumigo la planta sin ATR, emitido por el área de SGI- Seguridad Industrial.	Osorio Atao, Jhon	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 14:48:57	1
908	3	4	12	0001	0002	0003	se evidencio que el área de APT( frente a sus oficinas) estaba un fuerte olor nauseabundo constante que el olor era proveniente del agua o liquido que se encontraba debajo de los pallet.	Purizaga Saavedra, Erikc	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 14:58:51	1
910	3	4	12	0001	0002	0003	Se encontraba haciendo la limpieza de las canaletas  de las linea 1,2,3 y 4, cuando mete su mano para retirar la suciedad sin darse cuenta que su guante estaba roto y a los días le presenta resecamiento en la piel.	NORMAN  NILTON, CRUZ HIDALGO	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 15:14:29	1
915	3	4	12	0001	0002	0003	Se clausuro el modulo de SS.HH de producción por presentar atoramiento.	Bueno Flamentes, Saul	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 15:45:42	1
916	3	4	12	0001	0002	0003	se observa que en las mañanas en la puerta de acceso al laboratorio de ID, Pallets y productos terminado, obstaculizando el acceso.	AYALA  CISNEROS, NICANOR TEODORO	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 15:51:27	1
917	3	4	12	0001	0002	0003	Se observa un inadecuado almacenamiento de la bebida gasificada sabor de oro, la cual estuvo directamente opuesta a los rayos del sol.	AYALA  CISNEROS, NICANOR TEODORO	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 15:56:09	1
918	3	4	12	0001	0002	0003	Obstrucción de puertas de acceso a la sub-estación #1 y 2, con pallets.	Garcia Espinoza, Ericsson	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-02-28 16:00:11	1
922	3	4	12	0001	0002	0003	Recogiendo una botella en el piso, me hice un corte menor en el dedo medio de la mano derecha.	Jaime Miguel, Sanchez	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-02 14:35:52	1
928	3	1	12	0001	0002	0003	La puerta del ingreso al Auditorio se encuentra fuera del carril. Y no se puede cerrar.	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-03-06 00:56:33	0
937	3	4	12	0001	0002	0003	La tapa de buzón del desagüe inestable ubicada en el patio principal, frente a las escaleras.	parientes sanchez , deyvi	janssen.guerrero@kr.com.pe	SSOHUAURA	2013-03-08 13:55:00	1
944	3	4	12	0001	0002	0003	Se reporta caída de producto químico LINTEK en almacen de IQPF.	Rondon Pimentel, Andy	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-16 00:14:15	1
945	3	4	12	0001	0002	0003	El Sr. reporta presencia de roedores en APT.	Aguilar Romero, Cesar	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-03-19 12:06:48	1
962	3	4	12	0001	0002	0002	Se encuentró un balón de  de GLP vacio en el cambio de turno, en la salida de la línea de vidrio	Rodriguez Valencia, Julio	cesar.llave@kr.com.pe	SGIAREQUIPA2	2013-04-04 19:12:01	1
1007	3	4	12	0001	0002	0003	Se despegó la luna de la ventana en la Of. de Asistencia Social.	Ubillus Castillo, Verónica	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-04-19 00:00:00	1
978	3	4	12	0001	0002	0002	En la actualidad hay varios pallets de envases de vidrios, en columnas de 3 pallets, ubicados en el patio principal; ocasionando desorden ya que no están debidamente apilados, además en el patio principal hay pallets con producto.	Llave Pinto, César	cesar.llave@kr.com.pe	SGIAREQUIPA2	2013-04-19 18:27:40.89	1
1008	3	4	12	0001	0002	0003	Al ingresar a mi centro de trabajo (07:30 hrs) pude observar en el almacén de preformas que parte de la rejilla de canaletas estaba caída.	Granados Chang, Jonathan	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-04-20 00:00:00	1
1038	3	1	12	0001	0002	0003	En el patio frente APT se observa desordenano.	Parientes , Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-06 00:00:00	0
1079	3	1	12	0001	0002	0003	Se observa que la fosa del elevador del abastecimiento de botellas de la linea isotonica se encuntra, lleno de vidrio.	Parientes Sánchez, Deyvi	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-17 00:00:00	1
1096	3	1	12	0001	0002	0003	El Sr. declara que se resbaló en el piso ubicado al ingreso del tunel de enfriamiento.	Trejo Herbas, Oliver	deyvi.parientes@kr.com.pe	SSOHUAURA	2013-05-20 00:00:00	1
1106	3	1	12	0001	0002	0003	Se evidencia que existía una paleta en mal estado en medio de una pila de pallets ubicado cerca de la subestación eléctrica. Hangar Nuevo.	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-05-24 00:00:00	1
1104	3	1	12	0001	0002	0003	Se evidencia un pallet roto al medio de un pila de paletas, encontrándose esta propensa a caer. Condición insegura adyacente a Subestación Eléctrica.	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-05-24 00:00:00	1
1118	3	1	12	0001	0002	0003	Se evidencia que existía una mala disposición de paletas vacías cerca de Sub-Estación Eléctrica. Se considera condición insegura dado que una ellas esta rota y propensa a caer.	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-05-24 00:00:00	1
1134	3	1	12	0001	0002	0002	Siendo las 21:00 pm, se observa que los totes que contienen  botellas sopladas, están almacenados en el patio de la planta de jugos invadiendo la zona segura. \t\t\t\t\t/n\t\t\t\t\t/n	Llave Pinto, Cesar	cesar.llave@kr.com.pe	SGI 310	2013-06-03 00:00:00	0
1117	3	1	12	0001	0002	0002	Se observa que los totes llenos de botellas sopladas estan almacenados en el patio de la planta de jugos invadiendo la zona segura	Llave Pinto, César	cesar.llave@kr.com.pe	SGIAREQUIPA2	2013-06-03 00:00:00	1
1137	3	1	12	0001	0002	0002	Al colocar la ultima parihuela de una ruma,  las ultimas cajas se engancharon con el cable de la malla Rachel y cayeron al piso rompiéndose las botellas.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Alvares Concha, Jose Alonso	jose.alvares@kr.com.pe	SGI 310	2013-06-05 00:00:00	1
1144	3	1	12	0001	0002	0002	El día 12-06-2013 aproximadamente 23:30 me encontraba trabajando en la línea Nº 3 paletizado, cuando sentí un escozor en el cachete izquierdo pasando el tiempo me empezó a doler después de dormir, aproximadamente a la 1:00am desperté con el cachete hinchado y adormecido.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Yucra Quillca, Franklin	victor.huertas@kr.com.pe	SGI 310	2013-06-12 00:00:00	1
1150	3	1	12	0001	0002	0002	El dia de hoy 20-06-2013 a horas 10:00am se observó en las áreas de: producción,almacén de producto terminado, patio principal en un total desorden.\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Huertas Sueros, Víctor	victor.huertas@kr.com.pe	SGI 310	2013-06-20 00:00:00	1
1183	3	1	12	0001	0002	0003	Se observa que las contratistas KRETE y ZEFF dejaron la zona de LP05 con varias condiciones inseguras./nLP05 - Línea Isotónica/nTurno Nocturno - 02/07/13	Osorio Atao, Jhon	jhon.osorio@kr.com.pe	SGIHUAURA	2013-07-02 00:00:00	1
1185	3	1	12	0001	0002	0003	Se verifica que el piso de la zona de paletizado en LP05 se encuentra resbaloso debido a la presencia de residuos de producto Fruvi./nLugar: Paletizado - LP05/nFecha / Hora: 03.07.13 / 21:00	Trejo Herbas, Oliver	oliver.trejo@kr.com.pe	SGIHUAURA	2013-07-03 00:00:00	1
1175	3	1	12	0001	0002	0002	El dia 04/07/2013 a 17:30 hrs. aprox. se observo que en el area de almacen de azúcar habia una ruma de tres pallet inclinados, donde fue sediendo poco a poco cayendose.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2013-07-04 00:00:00	1
1199	3	1	12	0001	0002	0002	El dia 06 de julio aprox. A las 7:20  am en el patio de jugos se cayeron 2 pallets de jugos Kris Green formato 1500 ml.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-07-06 00:00:00	1
1213	3	1	12	0001	0002	0003	El personal sufrío una caída en sala de Lubricantes cuando alistaba las cosas para realizar la limpieza de planta. Esto se dío a inicios de turno	Curo Huertas, Cristian	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-07-08 00:00:00	1
1204	3	1	12	0001	0002	0002	El dia 11 de julio aprox. a las 21:00 mientras realizaba mi inspección rutinaria pude observar en el área de desmedros y almacén de envases una columna de pallets de 3 filas de alto.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-07-11 00:00:00	1
1205	3	1	12	0001	0002	0002	El dia 11 de julio aprox. a las 21:00 mientras realizaba mi inspección rutinaria pude observar en el área de desmedros y almacén de envases una columna de pallets de 3 filas de alto.\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n\t\t\t\t\t/n	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-07-11 00:00:00	1
1191	3	1	12	0001	0002	0003	El Ing. Fernando Gaspar se proponía ha realizar unas mediciones a la faja de la Línea Isotónica, específicamente a la faja de abastecimiento de botellas vacías, donde no se percata que en el borde había quedado restos de vidrio por lo que al pasar su dedo por dicho lugar, se hace un leve corte, esto fue aprox. a las 11:15 am	Gaspar Barrientos, Fernando	erick.giron@kr.com.pe	SSOHUAURA	2013-07-15 00:00:00	1
1194	3	1	12	0001	0002	0003	Se realizó una inspección a la sala de lubricantes (ex sala de sopladora DBBO), encontrándose desordenado y con piezas mecánicas regadas por todos sitios que se desconocen si tienen aún vida útil.	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-07-22 00:00:00	1
1246	3	1	12	0001	0002	0002	El dia 7 aprox. a las 9:am se encontro el área de almacén de bobinas termocontraibles, desordenado y sucio.	Coaquira Paz, Claudia	claudia.coaquira@kr.com.pe	SGI 310	2013-08-07 00:00:00	1
1248	3	1	12	0001	0002	0002	El dia 7 de agosto aprox. a las 11:00 am se observó en el área de almacén de envases vacios de vidrio, una columna de pallet de cajas de botellas de vidrio inclinada a punto de caerse	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-08-07 00:00:00	1
1249	3	1	12	0001	0002	0002	El día 8 de agosto encontré en la entrada de la línea de vidrio, acumulación de pallets genernado desorden en la zona, esto fue dejado por el turno anterior, turno B.	Huertas Sueros, Vioctor	victor.huertas@kr.com.pe	SGI 310	2013-08-08 00:00:00	1
1252	3	1	12	0001	0002	0002	El día 19 de agosto aprox 8:45 am se encontró en el área de desmedoos, el área de carpinteria desordenada, los pallets para reparación se encontraban obstruyendo el acceso a dicha zona.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-08-19 00:00:00	1
1253	3	1	12	0001	0002	0002	El operador de limpieza encontro al ingresar a sus labores, los baños, canaletas y tachos de basura sucios, estos ubicados en el puesto 4.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-08-19 00:00:00	1
1254	3	1	12	0001	0002	0002	El operador de limpieza encontro al ingresar a sus labores, los baños, canaletas y tachos de basura sucios, estos ubicados en el puesto 4.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-08-19 00:00:00	0
1271	3	1	12	0001	0002	0002	El dia 23-08-2013 a horas 17:50pm, en el area de APT, almacén nuevo, se cayeron 06 pallets de agua cielo s/g 2500ml y kris citrus 450ml 02 pallets.	Huertas Sueros, Víctor	victor.huertas@kr.com.pe	SGI 310	2013-08-23 00:00:00	1
1274	3	1	12	0001	0002	0002	En la entrada de almacén de preformas encontre una columna de cajas de plastico inclinadas hacia un costado,con la base de pallet rota.	Coaquira Paz, Claudia	claudia.coaquira@kr.con.pe	SGI 310	2013-09-02 00:00:00	1
1237	3	1	12	0001	0002	0003	El Sr. Galvez se encontraba pasando por el Almacén de Pre formas de botellas, dirigiéndose a la Línea Isotónica (LP5), pero por la poca visibilidad que permiten las cortinas de ese lugar, no ve que el Sr. Niels Girón venia en sentido contrario manejando el montacarga Toyota N°5, cuando le montacarga pasa las cortinas los dos se percatan de la presencia del otro, es ahí donde los dos reaccionan moviéndose a extremos opuestos, sin embargo por el poco espacio que había en esa zona, el montacarga pa	Galvez Flores, Luis Alberto	erick.giron@kr.com.pe	SSOHUAURA	2013-09-03 00:00:00	1
1277	3	1	12	0001	0002	0002	El día 04 a las 20:00 aprox. encontre desorden en el almacén de preformas, ya que hay espacios vacios para colocar las cajas que se encunetran en el patio principal.	Huertas Sueros, Victor	victor.huiertas@kr.com.pe	SGI 310	2013-09-04 00:00:00	1
1278	3	1	12	0001	0002	0002	El día 05/09/13 a las 20:30 aprox. encontre en la sala de jarabe simple presencia de agua debido a la falta de limpieza de los sumideros los que se encuentran atorados.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-09-05 00:00:00	1
1280	3	1	12	0001	0002	0002	El día 05/09/13 me encontraba realizando mis labores, cuando encontre una tina de inox obstruyendo el paso, procedi a empujar y como se quedo atascado ejerci fuerza para moverla, se desprendio la bandeja y me golpie la pierna con la base.	Chino  Arredondo, Julio	claudia.coaquira@kr.com.pe	SGI 310	2013-09-05 00:00:00	1
1240	3	1	12	0001	0002	0003	Siendo las 8:15 am, unos colaboradores me pasan la voz indicando que en el área del hangar de planta, al frente de la nueva área de jarabe, una de sus columnas se estaba inclinando, debido a la mala colocación o al sobre peso, más el poco espacio de transito que había en la zona, daba a lugar a que se genere un accidente.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-09-06 00:00:00	1
1257	3	1	12	0001	0002	0003	Estaba ordenando la manguera ubicada cerca del Almacén de Lubricantes, cuando esta se tensa mucho y termino por romper la tubería de abastecimiento de agua.	Rondon Pimentel, Andy	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-09-09 00:00:00	1
1315	3	1	12	0001	0002	0002	El dia lunes 09/09/13 siendo las 8:00 aprox, se encontro las areas de APT y Desmedros desordenadas y con condiciones inseguras.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-09-09 00:00:00	1
1316	3	1	12	0001	0002	0002	El dia lunes 09/09/13 siendo las 8:00 aprox, se encontro las areas de APT y Desmedros desordenadas y con condiciones inseguras.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-09-09 00:00:00	1
1286	3	1	12	0001	0002	0003	Se estaba realizando la ronda por la planta, cuando me percato que en los tanques de GLP y CO2 habían dejado repuestos de la llenadora y etiquetadora entre otros, es por ese motivo que se solicitó la colocación de un cerco perimétrico y así restringir un poco el acceso a dicha área.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-09-10 00:00:00	1
1287	3	1	12	0001	0002	0003	Se realizaba una inspección de rutina a la línea de producción n° 1, en donde se encontraron por todas partes las herramientas de limpieza (escobas, recogedores), las mismas que pueden ocasionar tropiezos y caídas.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-09-10 00:00:00	1
1259	3	1	12	0001	0002	0003	Siendo las 09:10 am, se pudo observar que el personal de planta esta utilizando la escalera de acceso a la parte superior de la Lavadora San Martín, aun cuando esta no está terminada, debido a que le faltan los pasos de acceso.	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-09-10 00:00:00	1
1285	3	1	12	0001	0002	0003	Durante la inspección a la Línea de Producción N° 5 se encontraron paredes con hongo, debido a la gran concentración de humedad que existe en l ZONA.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-09-11 00:00:00	1
1283	3	1	12	0001	0002	0003	Se encontró una separación entre las paredes de triplay ubicadas por el abastecimiento de botellas de la Línea Isotónica (LP5), por donde pueden pasar animales (abejas, arañas, roedores, serpientes, etc), las mismas que pueden contaminar el producto o en caso contrario a través de su picadura y/o mordida ocasionar una intoxicación a alguno de nuestros colaboradores.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-09-11 00:00:00	1
1319	3	1	12	0001	0002	0002	Siendo las 7:30 aprox se encontro en el patio principal acumulación de pallets, cajas vacias, producto terminado originando desorden.	Huertas  Sureros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-09-11 00:00:00	1
1320	3	1	12	0001	0002	0002	El día de hoy siendo las 09:45 aprox se observó en el área de almacén de envases vacíos 2 pallets inclinados y caídos,formato 300 ml Kr.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-09-12 00:00:00	1
1322	3	1	12	0001	0002	0002	Siendo las 07:30 aprox se encontró la ranfla de planta de jugos con desmedros, acumulación de basura generando desorden.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-09-13 00:00:00	1
1323	3	1	12	0001	0002	0002	Siendo las 07:30 aprox se encontró la ranfla de planta de jugos con desmedros, acumulación de basura generando desorden.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGI 310	2013-09-13 00:00:00	1
1324	3	1	12	0001	0002	0002	Se observa que los camiones procedentes de Tacna co envases tiene la carga apilada de forma inadecuada y desordenada.	Yucra Juarez, Richard	victor.huertas@kr.com.pe	SGI 310	2013-09-13 00:00:00	1
1293	3	1	12	0001	0002	0003	Siendo las 23:00 hrs aproximadamente, me dirigía a avisarle al Sr. Edson Camones que abra la llave para comenzar a sanear, cuando de pronto a la altura del tanque de preparado, me comienzo a resbalar y al no poder mantener el equilibrio, me caigo de barriga.	Galvez Flores, Luis Alberto	erick.giron@kr.com.pe	SSOHUAURA	2013-09-13 00:00:00	1
1294	3	1	12	0001	0002	0003	sufre un resbalón en la LP05 - Inspector de Vacío debido a la presencia de fruvi en el piso. Fecha: 14.09.13 Ubicación: LP05 - Insp. de Vacío	Osorio Atao, Jhon	jhon.osorio@kr.com.pe	SGIHUAURA	2013-09-14 00:00:00	1
1357	3	1	12	0001	0002	0002	El dia de hoy 17-09-2013 a las 8:14am aprox. encontre en el patio de desmedros columnas de pallets inpidiendo el ingreso de camiones de chanaltin y recojo de basura./nobstruyendo las vias de evacuación del area de carpinteria	Coaquira Paz, Claudia	claudia.coaquira@kr.com.pe	SGI 310	2013-09-17 00:00:00	1
1309	3	4	12	0001	0001	0008	El SR.JAVIER COLLANTES ESTABA MANIPULANDO UN TANQUE DE UN COMPRESOR DE AIRE Y AL COLOCARLO ACOSTADO,DICHO TANQUE  DERAMO GRASA EN EL PASILLO UBICADO FRENTE A PLANTA DE CO2 Y PROXIMO A PLANTA DE TRATAMIENTO DE AGUA.	Espinal Genere, Idelfonso	iespinal@kolareal.com.do	VISITAS	2013-09-23 00:00:00	1
1384	3	1	12	0001	0002	0002	EL 27-09-13 A LAS 19:30 SE OBSRVO EN PLANTA DESORDEN EN EL ALMACENADO DE PRODUCTO TERMINADO, EL CUAL EL PRODUCTO ESTA INVADIENDO LAS ZONAS SEGURAS Y EN LUGARES QUE NO SON LOS CORRECTOS PARA SER ALMACENADOS.	HUERTAS SUEROS, VICTOR	victor.huertas@kr.com.pe	SGI 310	2013-09-27 00:00:00	1
1330	3	1	12	0001	0002	0003	Siendo las 15:10 hrs, la Sra. Rocío Gallardo - Jefa de Gestión Humana, se proponía salir de su oficina, cuando de pronto al salir se resbala por lo que se golpea su hombro con la columna y para luego caer sentada, indica que este accidente se produce por la gran cantidad de cera que había en el suelo.	Gallardo Valladares, Rocío	erick.giron@kr.com.pe	SSOHUAURA	2013-09-30 00:00:00	1
1337	3	1	12	0001	0001	0008	PRESENCIA DE BASURA ALMACENADA AL LADO DE CASETA DE ALIMENTOS  FRENTE A ALMACEN DE AZUCAR./n	TORRES , EDWARD	\N	VISITAS	2013-10-03 00:00:00	1
1364	3	1	12	0001	0002	0003	Se evidenció una mala disposición de paleta con etiquetas al ingreso a zona de paletizado LP03. Fecha y Hora: 05.10.13 / 16:45	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-10-05 00:00:00	1
1377	3	1	12	0001	0002	0003	Aprox. 19:15 hrs mientras revisaba las fallas de la máquina llenadora MESAL en la LP05, resbale sin caer debido a la presencia de jarabe Fruvi.	Esteves Moreno, Gonzalo	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-10-07 00:00:00	1
1389	3	1	12	0001	0002	0002	EL DIA 07-10-13 A LAS 8:00 AM APROXIMADAMENTE EN EL ALMACEN DE PRODUCTO TERMINADO NUEVO  SE ENCONTRO PALLETS INVADIENDO LAS ZOÑAS DE SEÑALIZADAS, OBSTRUYENDO EL PASO AL TABLERO ELECTRICO Y EXTINTOR.	CARPIO DAVILA, NELSON	nelson.carpio@kr.com.pe	SGI 310	2013-10-07 00:00:00	1
1390	3	1	12	0001	0002	0002	EL DIA 08/10/13 A LAS 07:00 AM APROXIMADAMENTE EN EL PATIO PRINCIPAL DE LA PLANTA SE ENCONTRO PALLETS CON ENVASES LLENOS DE DIVERSOS PRODUTOS, EL CUAL ESTA PROHIBIDO EL ALMACENAMIENTO EN DICHA ZONA.	CARPIO DAVILA, NELSON	nelson.carpio@kr.com.pe	SGI 310	2013-10-08 00:00:00	1
1397	3	1	12	0001	0002	0002	EL DIA 15/10/13 A LAS 7:30 AM EN EL AREA DE JARABE SIMPLE SE ENCONTRO CAJAS DE PREFORMAS SIN PARIHUELAS Y CON MUCHA BASURA GENERANDO MALESTAR AL PERSONAL.	HUERTAS , VICTOR	victor huertas@kr.com.pe	SGI 310	2013-10-15 00:00:00	1
1414	3	1	12	0001	0002	0002	Invasión de zonas seguras en ambos patios, deficiencia en orden y limpieza en la rampa de Planta de Jugos dejado por el Turno "B" (día).	Carpio Dávila, Nelson	nelson.carpio@kr.com.pe	SGIAREQUIPA2	2013-10-21 00:00:00	1
1416	3	1	12	0001	0002	0002	El Sr. Paredes Sanchez operando el montacarga Linde Nº 4 saca un pallet de Brillante (formato) 2650 mL de adelante y el pallet de atrás se cae.	Carpio Davila, Nelson	nelson.carpio@kr.com.pe	SGIAREQUIPA2	2013-10-21 00:00:00	1
1418	3	1	12	0001	0002	0002	Se encontró pallets de producto terminado enla zona segura del patio principal.	Carpio Dávila, Nelson	nelson.carpio@kr.com.pe	SGIAREQUIPA2	2013-10-24 00:00:00	1
1449	3	1	12	0001	0002	0002	EL DI 02/11/13 A LAS 9:30 APROX. OBSERVE QUE EN LA PUERTA A LA ENTRADA DE SALA DE EMBOTELLADO (ENTRE LA LINEA #2 Y #3) LA MICA O VIDRIO ACRILICO QUE ESTA EN LA PARTE DE ABAJO DE LA PUERTA SE ENCUENTRA A UN LADO,  OCASIONANDO DESORDEN.	CARPIO  DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-02 00:00:00	1
1438	3	4	12	0001	0001	0008	EL REGISTRO DE AGUA QUE ESTA UBICADO AL LADO DE LA PLANTA GAS PROPANO SE ENCUENTRA DERRAMANDO AGUA DEBIDO A QUE LAS CANALETAS TIENEN EL DESAGUE TAPADO./n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-11-07 00:00:00	1
1457	3	1	12	0001	0002	0002	EL DIA 11/11/13 EN LA ZONA DE ALMACÉN DE PT SE ENCUENTRO DESORDEN NO DEJANDO POR MOMENTOS QUE EL OPERADOR DE MONTACARGAS NO PUEDA MANIOBRAR BIEN EL MONTACARGA Y PUDIENDO PROVOCAR ACCIDENTES AL PERSONAL QUE LABORA EN ESTA AREA.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-11 00:00:00	0
1458	3	1	12	0001	0002	0002	EL DIA 11/11/13 EN LA ZONA DE ALMACÉN DE PT SE ENCUENTRO DESORDEN NO DEJANDO POR MOMENTOS QUE EL OPERADOR DE MONTACARGAS NO PUEDA MANIOBRAR BIEN EL MONTACARGA Y PUDIENDO PROVOCAR INCIDENTES O ACCIDENTES.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-11 00:00:00	0
1459	3	1	12	0001	0002	0002	EL DIA 11/11/13 A LAS 3:00  EN LA ZONA DE ALMACÉN DE PT SE ENCONTRO DESORDEN NO DEJANDO POR MOMENTOS QUE EL OPERADOR DE MONTACARGAS NO PUEDA MANIOBRAR BIEN EL MONTACARGA Y PUDIENDO PROVOCAR INCIDENTES O ACCIDENTES.	CARPIO DAVILA, NELSON	nelson.carpio@kr.com.pe	SGI 310	2013-11-11 00:00:00	1
1442	3	1	12	0001	0002	0003	Siendo las 03:02 hrs, en la Línea de Producción N° 03 - LP3, cerca a la faja transportadora, el Sr. Omar Girón se resbalo debido a que el piso se encontraba mojado.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2013-11-12 00:00:00	1
1464	3	1	12	0001	0002	0002	EL DIA 14/11/13 A LAS 4:45 EN LA ZONA DE APT NUEVO SE ENCONTRÓ UN PALLET DE AGUA CIELO 2500 ML. S/G TIRADO EN EL SUELO PROVOCANDO DESORDEN, LO CUAL SE HIZO PALETIZAR EN EL ACTO.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-14 00:00:00	1
1465	3	1	12	0001	0002	\N	EL DIA 16/11/13 A LAS 7:30 AM EL SR. OSCAR NOE ME COMUNICO QUE LOS VENTILADORES DEL COMEDOR SE ENCUENTRAN SUCIOS Y EMPOLVADOS OCASIONANDO MALESTAR AL PERSONAL DE LA PLANTA.	CARPIO DAVILA, NELSON GABRIEL	nelson.carpio@kr.com.pe	SGI 310	2013-11-16 00:00:00	1
1477	3	1	12	0001	0002	0003	El Sr. Orellana sufre un resbalón en la LP05 - Tanques de bebida, debido a la presencia de fruvi en el piso.	Orellana Diaz, Jhon	arturo.janampa@kr.com.pe	SSOHUAURA	2013-11-29 00:00:00	1
1488	3	1	12	0001	0002	0003	Se detecto el atoramiento de las canaletas de drenaje de la LP05	Purizaga Saavedra, Erikc	erikc.purizaga@kr.com.pe	SSOHUAURA	2013-12-03 00:00:00	1
1499	3	1	12	0001	0002	0003	Se evidencia que el Sr. Melchor realiza labores en tratamiento de efluentes con sus EPP en mal estado	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SGIHUAURA	2013-12-06 00:00:00	1
1502	3	1	12	0001	0002	0003	Siendo las 10:50 hrs aproximadamente, se encuentra a fuera de la oficina de APT, un palet todo desordenado que parecía contener materiales de desecho y dar mal aspecto al área, sin embargo cuando se le llama al personal de limpieza, se encuentra que contenía afiches de promociones.	Rojas Cruces, Alfonso	erick.giron@kr.com.pe	SSOHUAURA	2013-12-09 00:00:00	1
1503	3	1	12	0001	0002	0003	Se evidencia la presencia de mermas provenientes de los CO frente a Almacén de Productos Terminados	Rojas Cruces, Alfonso	alfonso.rojas@kr.com.pe	SGIHUAURA	2013-12-09 00:00:00	1
1504	3	1	12	0001	0002	0003	Se evidencia la inclinación de pallets almacenados frente a almacén de etiquetas y tapas	Arellano León, Andre	andre.arellano@kr.com.pe	SGIHUAURA	2013-12-09 00:00:00	1
1505	3	1	12	0001	0002	0003	Se evidencia el desorden de pallets en mal estado y con presencia de elementos punzantes frente a almacén de etiquetas y tapas	Arellano León, Andre	andre.arellano@kr.com.pe	SGIHUAURA	2013-12-09 00:00:00	1
1506	3	1	12	0001	0002	0003	Se evidencia el desorden de pallets en mal estado y con presencia de elementos punzantes frente a almacén de etiquetas y tapas	Arellano León, Andre	andre.arellano@kr.com.pe	SGIHUAURA	2013-12-09 00:00:00	0
1507	3	1	12	0001	0002	0003	Se evidencia que las señales de seguridad para equipos de lucha contra incendio (Extintores 49,50 y 51) se encuentran ilegibles	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SGIHUAURA	2013-12-10 00:00:00	1
1508	3	1	12	0001	0002	0003	Se evidencia el desorden en áreas de almacenes de pallets y botellas de vidrio	Arellano León, Andre	alfonso.rojas@kr.com.pe	SGIHUAURA	2013-12-10 00:00:00	1
1509	3	1	12	0001	0002	\N	Se evidencia la acumulación de mermas provenientes de los centros operativos en la zona de descarte de mermas	Purizaga  Saavedra, Erikc	erikc.purizaga@kr.com.pe	SGIHUAURA	2013-12-10 00:00:00	1
1513	3	2	12	0001	0002	0003	Siendo las 10:30 hrs se evidencia en la Línea Isotónica a la altura de la máquina llenadora una escalera, la cual fue dejada por un personal del área de mantenimiento, cuando realizaba una revisión en dicha área.	Rosales Espinoza, Ricardo	erick.giron@kr.com.pe	SSOHUAURA	2013-12-10 00:00:00	1
1514	3	2	12	0001	0002	0003	Se constata la falta de orden y limpieza en la línea de producción 01 (mangueras desplegadas y bebida en el piso).	Janampa Arango, Arturo	arturo.janampa@kr.com.pe	SSOHUAURA	2013-12-11 00:00:00	1
1515	3	2	12	0001	0002	0003	Se observa el hacinamiento de residuos sólidos en cajas (amcor) frente a la sala de fuerza, cercano al reactor Nro. 2	Janampa Arango, Arturo	arturo.janampa@kr.com.pe	SSOHUAURA	2013-12-11 00:00:00	1
1519	3	2	12	0001	0002	0003	Siendo las 15:30 hrs se evidencia cerca a la Sala de Fuerza un cilindro que contiene más de la mitad de lubricante para motores, esto genera desorden en la zona.	Rosales Espinoza, Ricardo	erick.giron@kr.com.pe	SSOHUAURA	2013-12-12 00:00:00	1
1603	3	1	12	0001	0002	0002	Aproximadamente a horas 17:30 se derrumbo una ruma de 12 pallets provocando que el último pallet golpeára al señor Javier Arias Ocsa	Carpio Dávila, Nelson	nelson.carpio@kr.com.pe	SGIAREQUIPA2	2013-12-12 00:00:00	1
1604	3	1	12	0001	0002	0002	A horas 09.30 am en la entrada de desmedros por la subida de la rampa se observo que hay pallets con botellas de vidrio vacias, por lo  cual el espacio para el pase de los montacargas era inadecuado pudiendo ocasionar choques o derrumbes	Carpio Dávila, Nelson	nelson.carpio@kr.com.pe	SGIAREQUIPA2	2013-12-13 00:00:00	1
1527	3	4	12	0001	0001	0008	SE DETECTO REGISTRO DERRAMANDO AGUA FRENTE A LOS PASILLOS DE LOGISTICA DEBIDO A QUE LAS TUBERIAS DE DESAGUE ESTAN TAPADAS. /n	Torres , Edward	etorres@kolareal.com.do	VISITAS	2013-12-18 00:00:00	1
1537	3	2	12	0001	0002	0003	Se evidencia la presencia de un palé con separadores afuera del comedor, obstaculizando parte de la vía de tránsito.	Janampa Arango, Arturo	arturo.janampa@kr.com.pe	SSOHUAURA	2013-12-27 00:00:00	1
1543	3	1	12	0001	0002	0003	Se evidenció derrame de producto químico (Super Dilac - Diversey) en el Almacén de IQPF.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-02 00:00:00	1
1610	3	1	12	0001	0002	0002	A las 08:00 hrs. aproximadamente en el área de Desmedros se observó condiciones inseguras y falta de Orden y Limpieza, entre la rampa de Planta de Jugos y el área de Desmedros:/n1. Insuficiente espacio de trabajo para el libre desplazamiento de los montacargas, que circulan por esta área, así como para el tránsito de personas. /n2. Riesgo de colocación o emplazamiento de pallets y parihuelas no son los apropiados para el almacenado, ya que se observa un desorden total./n3. Pallet de envases vacíos	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-03 00:00:00	1
1614	3	1	12	0001	0002	0002	A las 08:00 hrs. aprox. Se encontró en APT (almacen nuevo) 03 pallets caidos de agua cielo 2500 mL sin gas aproximadamente.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-07 00:00:00	1
1550	3	2	12	0001	0002	0003	Siendo las 08:15 hrs se apersona a la oficina de SGI los trabajadores de la Sala de Jarabe Simple del Turno Día, indicando que siempre encuentran cajas de pre-formas con material de desecho a fuera de su área de trabajo y ellos son los encargados de llevarlos al área de desmedro, creando malestar e incomodidad.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2014-01-07 00:00:00	1
1568	3	1	12	0001	0002	0003	Se evidencia el desorden y la falta de limpieza en Sala de Fuerza, adyacente a Tratamiento de Aguas.	Janampa Arango, Arturo A.	arturo.janampa@kr.com.pe	SSOHUAURA	2014-01-16 00:00:00	1
1630	3	1	12	0001	0002	0002	A horas 15:30pm aprox. en el área de APT (almacén nuevo) se cayeron 04 pallet de agua cielo S/G formato un litro.	Huertas Sueros, Victor	victor.huertas@kr.com.pe	SGIAREQUIPA2	2014-01-27 00:00:00	1
1591	3	1	12	0001	0002	0003	Presencia de una escalera de mano, adyacente a la lavadora industrial de la LP01, la cual obstaculiza y tienta a que el operario u otro, suba y se pueda lastimar.	Girón Farro, Erick Omar	erick.giron@kr.com.pe	SSOHUAURA	2014-01-29 00:00:00	1
\.


--
-- TOC entry 2221 (class 0 OID 16490)
-- Dependencies: 192 2228
-- Data for Name: hira_incidents_type; Type: TABLE DATA; Schema: ims; Owner: stilgar
--

COPY hira_incidents_type (lang, id_incident, val_incident, status, date_creation, date_modification, old_idincident) FROM stdin;
es	1	Humano	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T1
fr	1	Human	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T1
pt	1	Humano	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T1
es	4	Carga y Descarga	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T2
en	4	Loading and unloading	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T2
fr	4	Chargement et déchargement	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T2
pt	4	Carga e descarga	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T2
es	7	Energía Eléctrica	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T3
en	7	Electric power	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T3
fr	7	Puissance électrique	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T3
pt	7	Energia elétrica	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T3
es	2	Manipulación de Materiales	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T4
en	2	Materials Handling	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T4
fr	2	Manipulation des matériaux	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T4
pt	2	Manuseio de materiais	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T4
es	5	Herramientas	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T5
en	5	Tools	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T5
fr	5	Outils	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T5
pt	5	Ferramentas	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T5
es	8	Ambientales	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T6
en	8	Environmental	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T6
fr	8	L'environnement	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T6
pt	8	Ambiental	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T6
es	11	Daños Materiales	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T7
en	11	Property Damage	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T7
fr	11	Dommages à la propriété	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T7
pt	11	Dano material	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T7
es	3	Maquinaria	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T8
en	3	Machinery	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T8
fr	3	Mécanisme	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T8
pt	3	Maquinaria	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T8
es	6	Transporte	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T9
en	6	Transport	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T9
fr	6	Transports	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T9
pt	6	Transporte	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T9
es	9	Ergonómicos	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T10
en	9	Ergonomic	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T10
fr	9	Ergonomique	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T10
pt	9	Ergonômico	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T10
es	12	Orden y Limpieza	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T11
en	12	Arrangement and Cleaning	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T11
fr	12	Arrangement et nettoyage	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T11
pt	12	Arranjo e limpeza	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T11
es	10	Síntomas de Ebriedad	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T12
en	10	Symptoms of Drunkenness	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T12
fr	10	Les symptômes de l'ivresse	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T12
pt	10	Os sintomas de embriaguez	t	2013-09-25 17:31:00.897018	2013-09-25 17:31:00.897018	T12
\.


--
-- TOC entry 2226 (class 0 OID 16965)
-- Dependencies: 250 2228
-- Data for Name: hira_risk; Type: TABLE DATA; Schema: ims; Owner: stilgar
--

COPY hira_risk (lang, id_risk, desc_risk, date_creation, user_creation, date_modification, user_modification, status) FROM stdin;
es	12	Exposición al ruido	2011-11-16 22:38:06	SGIHUAURA	\N	\N	1
es	13	Fatiga visual	2011-11-17 16:46:03	SGIHUAURA	\N	\N	1
es	14	Exposición a diversas temperaturas	2011-11-17 16:46:23	SGIHUAURA	2011-11-17 17:24:36	SGIHUAURA	0
es	15	Exposición a vibraciones	2011-11-17 16:46:37	SGIHUAURA	\N	\N	1
es	16	Exposición a radiaciones ionizantes	2011-11-17 16:46:51	SGIHUAURA	\N	\N	1
es	17	Exposición a radiaciones no ionizantes	2011-11-17 16:47:08	SGIHUAURA	\N	\N	1
es	18	Infecciones	2011-11-17 16:47:18	SGIHUAURA	\N	\N	1
es	19	Alegrias	2011-11-17 16:47:22	SGIHUAURA	\N	\N	1
es	20	Fatigas musculares	2011-11-17 16:47:35	SGIHUAURA	\N	\N	1
es	21	Lesiones Musculares	2011-11-17 16:47:47	SGIHUAURA	\N	\N	1
es	22	Estrés	2011-11-17 16:47:52	SGIHUAURA	\N	\N	1
es	23	Exposisiciones eléctricas	2011-11-17 16:48:31	SGIHUAURA	2011-11-17 17:04:29	SGIHUAURA	0
es	24	Exposisiciones eléctricas	2011-11-17 16:48:32	SGIHUAURA	2011-11-17 17:04:34	SGIHUAURA	0
es	25	Exposisiciones eléctricas	2011-11-17 16:48:36	SGIHUAURA	2011-11-17 17:04:39	SGIHUAURA	0
es	26	Contacto eléctrico	2011-11-17 16:48:46	SGIHUAURA	2011-11-17 17:03:35	SGIHUAURA	0
es	27	Inhalación	2011-11-17 16:48:53	SGIHUAURA	\N	\N	1
es	28	Contacto Físico	2011-11-17 16:49:12	SGIHUAURA	\N	\N	1
es	29	Condiciones de trabajo	2011-11-17 16:49:36	SGIHUAURA	\N	\N	1
es	30	Atrapamiento	2011-11-17 16:49:43	SGIHUAURA	2011-12-30 21:51:54	SGIHUAURA	0
es	31	Atascamiento	2011-11-17 16:49:50	SGIHUAURA	2011-12-30 21:51:48	SGIHUAURA	0
es	32	Caídas a desnivel	2011-11-17 16:50:02	SGIHUAURA	2011-11-18 21:40:30	SGIHUAURA	0
es	33	Manipulación de herramientas	2011-11-17 16:50:18	SGIHUAURA	\N	\N	1
es	34	Explosión	2011-11-17 16:50:37	SGIHUAURA	\N	\N	1
es	35	Manipulación de materiales	2011-11-17 16:50:47	SGIHUAURA	2012-01-10 16:47:10	SGIHUAURA	0
es	36	Atropello	2011-11-17 16:50:54	SGIHUAURA	\N	\N	1
es	37	Caída de personas	2011-11-17 16:54:22	SGIHUAURA	\N	\N	1
es	38	Daño a personas o equipos	2011-11-17 16:54:40	SGIHUAURA	\N	\N	1
es	39	Daño al medio ambiente	2011-11-17 16:54:49	SGIHUAURA	\N	\N	1
es	40	Caída de obejtos	2011-11-17 17:01:02	SGIHUAURA	2011-12-29 16:35:07	SGIHUAURA	0
es	41	Caída a nivel	2011-11-17 17:02:19	SGIHUAURA	\N	\N	1
es	42	Caída a desnviel	2011-11-17 17:02:29	SGIHUAURA	2011-12-29 16:36:31	SGIHUAURA	0
es	43	Contacto eléctrico directo	2011-11-17 17:03:48	SGIHUAURA	\N	\N	1
es	44	Contacto eléctrico indirecto	2011-11-17 17:04:02	SGIHUAURA	\N	\N	1
es	45	Golpes y choques contra objetos	2011-11-17 17:22:51	SGIHUAURA	\N	\N	1
es	46	Exposición a sustancias	2011-11-17 17:23:35	SGIHUAURA	\N	\N	1
es	47	Incendios	2011-11-17 17:23:50	SGIHUAURA	\N	\N	1
es	48	Exposición a temperaturas ambientales extremas	2011-11-17 17:25:02	SGIHUAURA	\N	\N	1
es	49	Exposición a la húmedad	2011-11-18 21:42:30	SGIHUAURA	\N	\N	1
es	50	Exposición a la húmedad	2011-11-18 21:42:32	SGIHUAURA	2011-11-18 21:42:40	SGIHUAURA	0
es	51	infecciones vía respiratorias	2011-12-08 00:01:49	SGIHUAURA	2011-12-08 00:02:03	SGIHUAURA	0
es	52	Caída a desnivel	2011-12-29 16:34:59	WILLY	\N	\N	1
es	53	Caída de Objetos	2011-12-29 16:35:56	SGIHUAURA	\N	\N	1
es	54	Caída a desnivel	2011-12-29 16:52:55	SGIHUAURA	2011-12-29 21:17:27	SGIHUAURA	0
es	55	Atascamiento y/o atrapamiento	2011-12-30 21:56:25	SGIHUAURA	\N	\N	1
es	56	Exposición a temperaturas extremas	2012-01-11 23:47:21	SGIHUAURA	\N	\N	1
es	57	desviación Lumbar	2012-04-09 15:23:15	ADMDOMINICANA	2012-04-09 15:24:42	ADMDOMINICANA	0
es	58	Desviación Lumbar	2012-04-09 15:23:20	ADMDOMINICANA	\N	\N	1
es	59	Caída a Nivel	2012-04-09 17:02:50	ADMDOMINICANA	\N	\N	1
es	60	Contacto con Alcali	2012-04-09 17:13:00	ADMDOMINICANA	\N	\N	1
es	61	Contacto con ácido	2012-04-09 17:20:44	ADMDOMINICANA	\N	\N	1
es	62	Lesión en las manos	2012-04-09 20:13:13	ADMDOMINICANA	2012-04-09 20:38:01	ADMDOMINICANA	0
es	63	Trauma - herida - aplastamiento	2012-04-09 20:24:40	ADMDOMINICANA	2012-04-09 20:41:13	ADMDOMINICANA	0
es	64	Manipulación de herramientas	2012-04-09 20:38:33	ADMDOMINICANA	\N	\N	1
es	65	Probabilidad de lesión a la columna	2012-04-09 23:46:24	ADMDOMINICANA	\N	\N	1
es	66	Exposición al polvo	2012-04-13 17:40:15	ADMDOMINICANA	\N	\N	1
es	67	Contacto con oxidante	2012-04-13 17:52:18	ADMDOMINICANA	\N	\N	1
es	68	Contacto con reactivo químio	2012-04-14 12:27:02	ADMDOMINICANA	\N	\N	1
es	69	Iluminación inadecuada	2012-04-14 12:48:49	ADMDOMINICANA	\N	\N	1
es	70	Contacto con fuego	2012-04-17 23:06:57	ADMDOMINICANA	\N	\N	1
es	71	Exposición a altas temperaturas	2012-04-17 23:17:18	ADMDOMINICANA	\N	\N	1
es	72	Contacto con superficie caliente	2012-04-17 23:17:44	ADMDOMINICANA	\N	\N	1
es	73	Contacto con vapor caliente	2012-04-17 23:19:16	ADMDOMINICANA	\N	\N	1
es	74	Proyección de partículas	2012-04-17 23:19:39	ADMDOMINICANA	\N	\N	1
es	75	Contacto con objeto punzocortante	2012-04-17 23:21:10	ADMDOMINICANA	\N	\N	1
es	76	Exposición a gases	2012-04-17 23:21:38	ADMDOMINICANA	\N	\N	1
es	77	Probabilidad de lesión a la caja toráxica	2012-04-17 23:22:10	ADMDOMINICANA	\N	\N	1
es	78	Contacto con líquido caliente	2012-04-17 23:22:26	ADMDOMINICANA	\N	\N	1
es	79	Contacto con superficie contaminada	2012-04-17 23:22:59	ADMDOMINICANA	\N	\N	1
es	80	Colisión contra vehículos, vuelcos, salida del camino	2012-04-21 02:45:17	ADMDOMINICANA	\N	\N	1
es	81	Vuelcos	2012-04-21 12:11:18	ADMDOMINICANA	\N	\N	1
es	82	Inhalación de partículas	2012-04-21 13:14:42	ADMDOMINICANA	\N	\N	1
es	83	Contacto	2012-05-11 17:15:02	ADMDOMINICANA	\N	\N	1
es	84	DAÑO A PERSONAS	2012-05-11 21:40:31	ADMDOMINICANA	\N	\N	1
es	85	Contacto	2012-05-11 22:15:45	ADMDOMINICANA	\N	\N	1
es	86	Descarga Electrica	2012-05-12 13:37:22	ADMDOMINICANA	\N	\N	1
es	87	Atrapamiento	2012-05-12 14:35:01	ADMDOMINICANA	\N	\N	1
es	88	Exposición	2012-05-12 16:07:28	ADMDOMINICANA	\N	\N	1
es	89	Sobreexposición	2012-05-14 15:11:48	ADMDOMINICANA	\N	\N	1
es	90	Quemaduras	2012-05-14 20:14:59	ADMDOMINICANA	\N	\N	1
es	91	Contacto con Agente Biologico	2012-05-14 21:06:01	ADMDOMINICANA	\N	\N	1
es	92	Golpes Contra Objetos|Herramientas	2012-05-15 13:21:25	ADMDOMINICANA	\N	\N	1
es	93	Corte Por Superficie Punzocortante	2012-05-15 16:19:40	ADMDOMINICANA	\N	\N	1
es	94	Descarga Electrica	2012-05-15 17:34:37	ADMDOMINICANA	\N	\N	1
es	95	Descarga Electrica	2012-05-15 17:35:49	ADMDOMINICANA	\N	\N	1
es	96	Sobreexposición	2012-05-17 21:46:22	SGIDOMINICANA	\N	\N	1
es	97	muerte	2013-04-05 14:21:11	SGIHUAURA	\N	\N	1
es	98	Pérdida Auditiva Inducida por Ruido, Nerviosismo	2013-04-05 14:34:27	SGIHUAURA	\N	\N	1
es	99	Contusión, Aplastamiento, Traumatismo, Muerte	2013-04-05 14:41:21	SGIHUAURA	\N	\N	1
es	100	Distensión, Torsión, Extensión, Flexión,	2013-04-05 14:43:06	SGIHUAURA	\N	\N	1
es	101	Distensión, Torsión, Extensión, Flexión,	2013-04-05 14:44:05	SGIHUAURA	2013-04-05 14:44:47	SGIHUAURA	0
es	102	Fractura, Contusiones, Lesiones, Muerte	2013-04-05 14:54:26	SGIHUAURA	\N	\N	1
es	103	Escoriaciones, Lesiones Superficial, Fracturas	2013-04-05 15:15:15	SGIHUAURA	\N	\N	1
\.


--
-- TOC entry 2222 (class 0 OID 16541)
-- Dependencies: 204 2228
-- Data for Name: process_relations; Type: TABLE DATA; Schema: ims; Owner: stilgar
--

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


--
-- TOC entry 2099 (class 2606 OID 16773)
-- Dependencies: 192 192 192 2229
-- Name: hira_incidents_type_pkey; Type: CONSTRAINT; Schema: ims; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY hira_incidents_type
    ADD CONSTRAINT hira_incidents_type_pkey PRIMARY KEY (lang, id_incident);


--
-- TOC entry 2112 (class 2606 OID 16980)
-- Dependencies: 251 251 251 2229
-- Name: pk_hira_danger; Type: CONSTRAINT; Schema: ims; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY hira_danger
    ADD CONSTRAINT pk_hira_danger PRIMARY KEY (lang, id_danger);


--
-- TOC entry 2108 (class 2606 OID 16964)
-- Dependencies: 249 249 2229
-- Name: pk_hira_documents; Type: CONSTRAINT; Schema: ims; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY hira_documents
    ADD CONSTRAINT pk_hira_documents PRIMARY KEY (id_danger_risk);


--
-- TOC entry 2106 (class 2606 OID 16946)
-- Dependencies: 248 248 248 2229
-- Name: pk_hira_incidents_details; Type: CONSTRAINT; Schema: ims; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY hira_incidents_details
    ADD CONSTRAINT pk_hira_incidents_details PRIMARY KEY (id_incident, nonconformity_type);


--
-- TOC entry 2110 (class 2606 OID 16972)
-- Dependencies: 250 250 250 2229
-- Name: pk_hira_risk; Type: CONSTRAINT; Schema: ims; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY hira_risk
    ADD CONSTRAINT pk_hira_risk PRIMARY KEY (lang, id_risk);


--
-- TOC entry 2104 (class 2606 OID 16938)
-- Dependencies: 247 247 2229
-- Name: pk_ims_hira_incidents; Type: CONSTRAINT; Schema: ims; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY hira_incidents
    ADD CONSTRAINT pk_ims_hira_incidents PRIMARY KEY (id_incident);


--
-- TOC entry 2101 (class 2606 OID 16785)
-- Dependencies: 204 204 204 204 204 204 204 2229
-- Name: pk_relations_process; Type: CONSTRAINT; Schema: ims; Owner: stilgar; Tablespace: 
--

ALTER TABLE ONLY process_relations
    ADD CONSTRAINT pk_relations_process PRIMARY KEY (type, id, parent_id, country, company, location);


--
-- TOC entry 2102 (class 1259 OID 16863)
-- Dependencies: 204 204 204 204 204 204 2229
-- Name: uk_process_relations; Type: INDEX; Schema: ims; Owner: stilgar; Tablespace: 
--

CREATE UNIQUE INDEX uk_process_relations ON process_relations USING btree (type, id, parent_id, country, company, location);


--
-- TOC entry 2220 (class 2618 OID 16871)
-- Dependencies: 204 204 204 204 207 204 204 204 204 204 204 2229
-- Name: process_relations_control; Type: RULE; Schema: ims; Owner: stilgar
--

CREATE RULE process_relations_control AS ON UPDATE TO process_relations DO INSERT INTO process_relations_history (type, id, parent_id, date_creation, user_id, country, company, location, date_modification, user_mod) VALUES (old.type, old.id, old.parent_id, old.date_creation, old.user_id, old.country, old.company, old.location, new.date_creation, new.user_id);


-- Completed on 2014-02-08 09:55:48 AST

--
-- PostgreSQL database dump complete
--

