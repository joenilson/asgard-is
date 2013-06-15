--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-06-15 11:37:01 AST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 6 (class 2615 OID 16552)
-- Name: accounting; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA accounting;


--
-- TOC entry 7 (class 2615 OID 16553)
-- Name: bi; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA bi;


--
-- TOC entry 8 (class 2615 OID 16554)
-- Name: distribution; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA distribution;


--
-- TOC entry 9 (class 2615 OID 16555)
-- Name: facturation; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA facturation;


--
-- TOC entry 15 (class 2615 OID 17249)
-- Name: ims; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ims;


--
-- TOC entry 11 (class 2615 OID 16557)
-- Name: sales; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA sales;


--
-- TOC entry 12 (class 2615 OID 16558)
-- Name: system; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA system;


--
-- TOC entry 13 (class 2615 OID 16559)
-- Name: warehouse; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA warehouse;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 17377)
-- Dependencies: 14
-- Name: application_content; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE application_content (
    screen character varying(60) NOT NULL,
    lang character varying(4) NOT NULL,
    content_header text,
    content_body text,
    content_footer text,
    template text
);


SET search_path = system, pg_catalog;

--
-- TOC entry 198 (class 1259 OID 17398)
-- Dependencies: 12
-- Name: application; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE application (
    app_id integer NOT NULL,
    app_name text,
    app_codename text,
    app_majorversion integer,
    app_minorversion integer,
    app_patch integer,
    app_build integer,
    app_date_begin timestamp without time zone,
    app_timezone text,
    app_status character varying(4),
    app_module_default integer
);


--
-- TOC entry 197 (class 1259 OID 17396)
-- Dependencies: 12 198
-- Name: application_app_id_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE application_app_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 197
-- Name: application_app_id_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE application_app_id_seq OWNED BY application.app_id;


--
-- TOC entry 194 (class 1259 OID 17326)
-- Dependencies: 12
-- Name: companies; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE companies (
    id character varying(4) NOT NULL,
    legal_name text,
    comercial_name text,
    fiscal_id text,
    legal_address text,
    comercial_address text,
    phone_number text,
    country character varying(4),
    domain_name text,
    primary_lang character varying(10),
    status character varying(4),
    is_cluster boolean,
    is_header boolean,
    cluster_id integer
);


--
-- TOC entry 193 (class 1259 OID 17292)
-- Dependencies: 12
-- Name: countries; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE countries (
    id character varying(4) NOT NULL,
    abrev character varying(6),
    name text,
    locale character varying(10),
    currency_symbol character varying(10),
    currency_description text,
    timezone text
);


--
-- TOC entry 195 (class 1259 OID 17348)
-- Dependencies: 12
-- Name: locations; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE locations (
    id character varying(4) NOT NULL,
    country_id character varying(4) NOT NULL,
    location_name text
);


--
-- TOC entry 172 (class 1259 OID 16571)
-- Dependencies: 12
-- Name: log_audit; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE log_audit (
    event_id integer NOT NULL,
    event_date timestamp without time zone,
    event_type integer,
    event_level character varying(6),
    user_id integer,
    description text,
    object_type character varying(50),
    object_id character varying(6),
    app_module character varying(20)
);


--
-- TOC entry 173 (class 1259 OID 16577)
-- Dependencies: 172 12
-- Name: log_audit_event_id_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE log_audit_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 173
-- Name: log_audit_event_id_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE log_audit_event_id_seq OWNED BY log_audit.event_id;


--
-- TOC entry 174 (class 1259 OID 16579)
-- Dependencies: 12
-- Name: log_logins; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE log_logins (
    id integer NOT NULL,
    user_id integer NOT NULL,
    login_date timestamp without time zone NOT NULL,
    login_status character varying(50) NOT NULL,
    ipext_address character varying(20),
    ipint_address character varying(20),
    comp_hostname character varying(50),
    browser character varying(120),
    event_type integer,
    event_level character varying(6),
    description text
);


--
-- TOC entry 175 (class 1259 OID 16585)
-- Dependencies: 12 174
-- Name: log_logins_id_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE log_logins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 175
-- Name: log_logins_id_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE log_logins_id_seq OWNED BY log_logins.id;


--
-- TOC entry 176 (class 1259 OID 16587)
-- Dependencies: 12
-- Name: log_updates; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE log_updates (
    id integer NOT NULL,
    user_id integer NOT NULL,
    event_date timestamp without time zone NOT NULL,
    table_name character varying(50) NOT NULL,
    record_id character varying(20) NOT NULL,
    fieldname character varying(50),
    oldvalue character varying(5000),
    new_value character varying(5000),
    event_type integer,
    event_level character varying(6)
);


--
-- TOC entry 177 (class 1259 OID 16593)
-- Dependencies: 12 176
-- Name: log_updates_id_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE log_updates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 177
-- Name: log_updates_id_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE log_updates_id_seq OWNED BY log_updates.id;


--
-- TOC entry 179 (class 1259 OID 16598)
-- Dependencies: 12
-- Name: modules; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE modules (
    mid integer NOT NULL,
    mshortdesc character varying(20) NOT NULL,
    mlongdesc character varying(80),
    loadurl character varying(30),
    helpurl character varying(30),
    icon character varying(30),
    status boolean,
    typeof character varying(10),
    ordering integer,
    datecreation timestamp without time zone,
    dateactivation timestamp without time zone,
    majorversion integer,
    minorversion integer,
    patch integer,
    build integer,
    date_revision timestamp without time zone
);


--
-- TOC entry 188 (class 1259 OID 17130)
-- Dependencies: 12
-- Name: modules_i18n; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE modules_i18n (
    lang character varying(10) NOT NULL,
    id_module integer NOT NULL,
    key character varying(35) NOT NULL,
    value text,
    active boolean,
    date_create timestamp with time zone,
    date_modify timestamp with time zone
);


--
-- TOC entry 180 (class 1259 OID 16601)
-- Dependencies: 12 179
-- Name: modules_mid_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE modules_mid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 180
-- Name: modules_mid_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE modules_mid_seq OWNED BY modules.mid;


--
-- TOC entry 181 (class 1259 OID 16603)
-- Dependencies: 12
-- Name: modules_users; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE modules_users (
    user_id integer NOT NULL,
    mid integer NOT NULL
);


--
-- TOC entry 182 (class 1259 OID 16606)
-- Dependencies: 12
-- Name: submodules; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE submodules (
    mid integer NOT NULL,
    smid integer NOT NULL,
    parent_smid integer,
    smshortdesc character varying(30) NOT NULL,
    smlongdesc character varying(80),
    loadurl character varying(30),
    icon character varying(30),
    status boolean NOT NULL,
    typeof character varying(10) NOT NULL,
    ordering integer NOT NULL,
    datecreation timestamp without time zone,
    dateactivation timestamp without time zone,
    content_header text,
    content_body text
);


--
-- TOC entry 189 (class 1259 OID 17138)
-- Dependencies: 12
-- Name: submodules_i18n; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE submodules_i18n (
    lang character varying(10) NOT NULL,
    id_module integer NOT NULL,
    id_submodule integer NOT NULL,
    key character varying(35) NOT NULL,
    value text,
    active boolean,
    date_create timestamp with time zone,
    date_modify timestamp with time zone
);


--
-- TOC entry 183 (class 1259 OID 16609)
-- Dependencies: 12 182
-- Name: submodules_smid_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE submodules_smid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 183
-- Name: submodules_smid_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE submodules_smid_seq OWNED BY submodules.smid;


--
-- TOC entry 178 (class 1259 OID 16595)
-- Dependencies: 2045 2046 2047 2048 12
-- Name: submodules_users; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE submodules_users (
    user_id integer NOT NULL,
    mid integer NOT NULL,
    smid integer NOT NULL,
    view boolean DEFAULT true NOT NULL,
    edit boolean DEFAULT false NOT NULL,
    add boolean DEFAULT false NOT NULL,
    admin boolean DEFAULT false NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 16692)
-- Dependencies: 12
-- Name: translation; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE translation (
    lang character varying(10) NOT NULL,
    module character varying(20) NOT NULL,
    key character varying(32) NOT NULL,
    value text,
    active boolean,
    date_create timestamp with time zone,
    date_modify timestamp with time zone
);


--
-- TOC entry 190 (class 1259 OID 17159)
-- Dependencies: 12
-- Name: user_preferences; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE user_preferences (
    user_id integer NOT NULL,
    lang character varying(10),
    email character varying(80),
    alias character varying(120),
    avatar bytea,
    regional text,
    vacation_from date,
    vacation_to date,
    vacation_status boolean,
    office_phone bigint,
    cell_phone bigint,
    home_phone bigint,
    other_phone bigint,
    fax_phone bigint,
    office_ext integer
);


--
-- TOC entry 184 (class 1259 OID 16611)
-- Dependencies: 2052 12
-- Name: users; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    salt character varying(50) NOT NULL,
    realname text,
    role integer NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_lastlogin timestamp with time zone,
    country character varying(4),
    company character varying(4),
    location character varying(5),
    admin boolean,
    status character(1),
    type character varying(20),
    account_type character varying(12) DEFAULT 'local'::character varying NOT NULL
);


--
-- TOC entry 185 (class 1259 OID 16617)
-- Dependencies: 184 12
-- Name: users_id_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 185
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 186 (class 1259 OID 16619)
-- Dependencies: 12
-- Name: users_sessions; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE users_sessions (
    user_id integer NOT NULL,
    session_id character varying(64) NOT NULL,
    date_login timestamp without time zone NOT NULL,
    ipext_address character varying(20),
    ipint_address character varying(20),
    comp_hostname character varying(50),
    browser character varying(120)
);


--
-- TOC entry 191 (class 1259 OID 17172)
-- Dependencies: 2040 12
-- Name: view_modules_users; Type: VIEW; Schema: system; Owner: -
--

CREATE VIEW view_modules_users AS
    SELECT DISTINCT su.id, smu.mid, smi18n.lang, smi18n.value AS mshortdesc, sm.icon, sm.helpurl, sm.ordering, sm.typeof, sm.status FROM (((submodules_users smu LEFT JOIN users su ON ((su.id = smu.user_id))) LEFT JOIN modules sm ON ((sm.mid = smu.mid))) LEFT JOIN modules_i18n smi18n ON ((smi18n.id_module = sm.mid))) WHERE ((sm.mshortdesc)::text = (smi18n.key)::text) ORDER BY sm.ordering;


--
-- TOC entry 192 (class 1259 OID 17253)
-- Dependencies: 2041 12
-- Name: view_submodules_users; Type: VIEW; Schema: system; Owner: -
--

CREATE VIEW view_submodules_users AS
    SELECT smo.user_id, sm.mid, ssmi18n.lang, sm.mshortdesc, ss.parent_smid, ss.smid, ssmi18n.value AS smshortdesc, sm.helpurl, sm.loadurl AS mloadurl, ss.loadurl AS smloadurl, sm.icon AS micon, ss.icon AS smicon, sm.typeof AS mtypeof, ss.typeof AS smtypeof, sm.ordering AS mordering, ss.ordering AS smordering, smu.view, smu.edit, smu.add, smu.admin, ss.content_header, ss.content_body FROM (((((modules sm LEFT JOIN modules_users smo ON ((sm.mid = smo.mid))) LEFT JOIN submodules_users smu ON ((sm.mid = smu.mid))) LEFT JOIN submodules ss ON ((ss.smid = smu.smid))) LEFT JOIN submodules_i18n ssmi18n ON ((ssmi18n.id_submodule = smu.smid))) JOIN users su ON (((su.id = smo.user_id) AND (su.id = smu.user_id)))) WHERE ((ssmi18n.key)::text = (ss.smshortdesc)::text) ORDER BY sm.ordering, ss.ordering;


--
-- TOC entry 2053 (class 2604 OID 17401)
-- Dependencies: 198 197 198
-- Name: app_id; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY application ALTER COLUMN app_id SET DEFAULT nextval('application_app_id_seq'::regclass);


--
-- TOC entry 2042 (class 2604 OID 16628)
-- Dependencies: 173 172
-- Name: event_id; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY log_audit ALTER COLUMN event_id SET DEFAULT nextval('log_audit_event_id_seq'::regclass);


--
-- TOC entry 2043 (class 2604 OID 16629)
-- Dependencies: 175 174
-- Name: id; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY log_logins ALTER COLUMN id SET DEFAULT nextval('log_logins_id_seq'::regclass);


--
-- TOC entry 2044 (class 2604 OID 16630)
-- Dependencies: 177 176
-- Name: id; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY log_updates ALTER COLUMN id SET DEFAULT nextval('log_updates_id_seq'::regclass);


--
-- TOC entry 2049 (class 2604 OID 16631)
-- Dependencies: 180 179
-- Name: mid; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY modules ALTER COLUMN mid SET DEFAULT nextval('modules_mid_seq'::regclass);


--
-- TOC entry 2050 (class 2604 OID 16632)
-- Dependencies: 183 182
-- Name: smid; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY submodules ALTER COLUMN smid SET DEFAULT nextval('submodules_smid_seq'::regclass);


--
-- TOC entry 2051 (class 2604 OID 16633)
-- Dependencies: 185 184
-- Name: id; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 2103 (class 2606 OID 17384)
-- Dependencies: 196 196 196 2117
-- Name: pk_application_content; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY application_content
    ADD CONSTRAINT pk_application_content PRIMARY KEY (screen, lang);


SET search_path = system, pg_catalog;

--
-- TOC entry 2105 (class 2606 OID 17406)
-- Dependencies: 198 198 2117
-- Name: application_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY application
    ADD CONSTRAINT application_pkey PRIMARY KEY (app_id);


--
-- TOC entry 2093 (class 2606 OID 17333)
-- Dependencies: 194 194 2117
-- Name: companies_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- TOC entry 2095 (class 2606 OID 17335)
-- Dependencies: 194 194 2117
-- Name: companies_unique_comercial_name; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_unique_comercial_name UNIQUE (comercial_name);


--
-- TOC entry 2097 (class 2606 OID 17337)
-- Dependencies: 194 194 2117
-- Name: companies_unique_legal_name; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_unique_legal_name UNIQUE (legal_name);


--
-- TOC entry 2089 (class 2606 OID 17299)
-- Dependencies: 193 193 2117
-- Name: countries_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 2091 (class 2606 OID 17301)
-- Dependencies: 193 193 2117
-- Name: countries_unique_name; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_unique_name UNIQUE (name);


--
-- TOC entry 2099 (class 2606 OID 17355)
-- Dependencies: 195 195 195 2117
-- Name: locations_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id, country_id);


--
-- TOC entry 2101 (class 2606 OID 17357)
-- Dependencies: 195 195 195 2117
-- Name: locations_unique_country_location; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_unique_country_location UNIQUE (country_id, location_name);


--
-- TOC entry 2055 (class 2606 OID 16637)
-- Dependencies: 172 172 2117
-- Name: log_audit_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY log_audit
    ADD CONSTRAINT log_audit_pkey PRIMARY KEY (event_id);


--
-- TOC entry 2057 (class 2606 OID 16639)
-- Dependencies: 174 174 2117
-- Name: log_logins_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY log_logins
    ADD CONSTRAINT log_logins_pkey PRIMARY KEY (id);


--
-- TOC entry 2059 (class 2606 OID 16641)
-- Dependencies: 176 176 2117
-- Name: log_updates_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY log_updates
    ADD CONSTRAINT log_updates_pkey PRIMARY KEY (id);


--
-- TOC entry 2061 (class 2606 OID 16643)
-- Dependencies: 178 178 178 178 2117
-- Name: pk_menu_users; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY submodules_users
    ADD CONSTRAINT pk_menu_users PRIMARY KEY (user_id, mid, smid);


--
-- TOC entry 2083 (class 2606 OID 17137)
-- Dependencies: 188 188 188 188 2117
-- Name: pk_module_i18n; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modules_i18n
    ADD CONSTRAINT pk_module_i18n PRIMARY KEY (lang, id_module, key);


--
-- TOC entry 2063 (class 2606 OID 16645)
-- Dependencies: 179 179 2117
-- Name: pk_modules; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modules
    ADD CONSTRAINT pk_modules PRIMARY KEY (mid);


--
-- TOC entry 2067 (class 2606 OID 16647)
-- Dependencies: 181 181 181 2117
-- Name: pk_modules_users; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modules_users
    ADD CONSTRAINT pk_modules_users PRIMARY KEY (user_id, mid);


--
-- TOC entry 2085 (class 2606 OID 17145)
-- Dependencies: 189 189 189 189 189 2117
-- Name: pk_submodule_i18n; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY submodules_i18n
    ADD CONSTRAINT pk_submodule_i18n PRIMARY KEY (lang, id_module, id_submodule, key);


--
-- TOC entry 2069 (class 2606 OID 16649)
-- Dependencies: 182 182 182 2117
-- Name: pk_submodules; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY submodules
    ADD CONSTRAINT pk_submodules PRIMARY KEY (mid, smid);


--
-- TOC entry 2081 (class 2606 OID 16699)
-- Dependencies: 187 187 187 187 2117
-- Name: pk_translation; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY translation
    ADD CONSTRAINT pk_translation PRIMARY KEY (lang, module, key);


--
-- TOC entry 2087 (class 2606 OID 17166)
-- Dependencies: 190 190 2117
-- Name: pk_userprefs; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT pk_userprefs PRIMARY KEY (user_id);


--
-- TOC entry 2079 (class 2606 OID 16651)
-- Dependencies: 186 186 186 2117
-- Name: pk_users_sessions; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users_sessions
    ADD CONSTRAINT pk_users_sessions PRIMARY KEY (user_id, session_id);


--
-- TOC entry 2065 (class 2606 OID 16653)
-- Dependencies: 179 179 2117
-- Name: uk_modules_mshortdesc; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modules
    ADD CONSTRAINT uk_modules_mshortdesc UNIQUE (mshortdesc);


--
-- TOC entry 2074 (class 2606 OID 16655)
-- Dependencies: 184 184 184 184 2117
-- Name: user_unique_login_by_country_company; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_unique_login_by_country_company UNIQUE (username, country, company);


--
-- TOC entry 2076 (class 2606 OID 16657)
-- Dependencies: 184 184 2117
-- Name: users_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2070 (class 1259 OID 17370)
-- Dependencies: 184 2117
-- Name: fki_companies_users; Type: INDEX; Schema: system; Owner: -; Tablespace: 
--

CREATE INDEX fki_companies_users ON users USING btree (company);


--
-- TOC entry 2071 (class 1259 OID 17364)
-- Dependencies: 184 2117
-- Name: fki_countries_users; Type: INDEX; Schema: system; Owner: -; Tablespace: 
--

CREATE INDEX fki_countries_users ON users USING btree (country);


--
-- TOC entry 2072 (class 1259 OID 17376)
-- Dependencies: 184 184 2117
-- Name: fki_locations_users; Type: INDEX; Schema: system; Owner: -; Tablespace: 
--

CREATE INDEX fki_locations_users ON users USING btree (location, country);


--
-- TOC entry 2077 (class 1259 OID 16658)
-- Dependencies: 186 2117
-- Name: fki_users_users_sessions; Type: INDEX; Schema: system; Owner: -; Tablespace: 
--

CREATE INDEX fki_users_users_sessions ON users_sessions USING btree (user_id);


--
-- TOC entry 2112 (class 2606 OID 17365)
-- Dependencies: 194 184 2092 2117
-- Name: fk_companies_users; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_companies_users FOREIGN KEY (company) REFERENCES companies(id);


--
-- TOC entry 2111 (class 2606 OID 17359)
-- Dependencies: 184 2088 193 2117
-- Name: fk_countries_users; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_countries_users FOREIGN KEY (country) REFERENCES countries(id);


--
-- TOC entry 2113 (class 2606 OID 17371)
-- Dependencies: 184 195 195 2098 184 2117
-- Name: fk_locations_users; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_locations_users FOREIGN KEY (location, country) REFERENCES locations(id, country_id);


--
-- TOC entry 2106 (class 2606 OID 17208)
-- Dependencies: 2062 178 179 2117
-- Name: fk_modules; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY submodules_users
    ADD CONSTRAINT fk_modules FOREIGN KEY (mid) REFERENCES modules(mid);


--
-- TOC entry 2109 (class 2606 OID 16664)
-- Dependencies: 181 2062 179 2117
-- Name: fk_modules_1; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY modules_users
    ADD CONSTRAINT fk_modules_1 FOREIGN KEY (mid) REFERENCES modules(mid);


--
-- TOC entry 2107 (class 2606 OID 17213)
-- Dependencies: 178 182 182 178 2068 2117
-- Name: fk_submodules; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY submodules_users
    ADD CONSTRAINT fk_submodules FOREIGN KEY (mid, smid) REFERENCES submodules(mid, smid);


--
-- TOC entry 2108 (class 2606 OID 17218)
-- Dependencies: 178 2075 184 2117
-- Name: fk_users; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY submodules_users
    ADD CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2110 (class 2606 OID 16679)
-- Dependencies: 2075 184 181 2117
-- Name: fk_users_1; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY modules_users
    ADD CONSTRAINT fk_users_1 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2115 (class 2606 OID 17167)
-- Dependencies: 190 184 2075 2117
-- Name: fk_users_userprefs; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT fk_users_userprefs FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2114 (class 2606 OID 16684)
-- Dependencies: 170 186 2117
-- Name: fk_users_users_sessions; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY users_sessions
    ADD CONSTRAINT fk_users_users_sessions FOREIGN KEY (user_id) REFERENCES rolpro.roles(id);


--
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 14
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-06-15 11:37:01 AST

--
-- PostgreSQL database dump complete
--

