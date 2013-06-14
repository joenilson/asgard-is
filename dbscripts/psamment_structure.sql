--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: accounting; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA accounting;


--
-- Name: bi; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA bi;


--
-- Name: distribution; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA distribution;


--
-- Name: facturation; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA facturation;


--
-- Name: ims; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ims;


--
-- Name: sales; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA sales;


--
-- Name: system; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA system;


--
-- Name: warehouse; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA warehouse;


SET search_path = system, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
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
-- Name: locations; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE locations (
    id character varying(4) NOT NULL,
    country_id character varying(4) NOT NULL,
    location_name text
);


--
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
-- Name: log_audit_event_id_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE log_audit_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: log_audit_event_id_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE log_audit_event_id_seq OWNED BY log_audit.event_id;


--
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
-- Name: log_logins_id_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE log_logins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: log_logins_id_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE log_logins_id_seq OWNED BY log_logins.id;


--
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
-- Name: log_updates_id_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE log_updates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: log_updates_id_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE log_updates_id_seq OWNED BY log_updates.id;


--
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
    dateactivation timestamp without time zone
);


--
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
-- Name: modules_mid_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE modules_mid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: modules_mid_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE modules_mid_seq OWNED BY modules.mid;


--
-- Name: modules_users; Type: TABLE; Schema: system; Owner: -; Tablespace: 
--

CREATE TABLE modules_users (
    user_id integer NOT NULL,
    mid integer NOT NULL
);


--
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
-- Name: submodules_smid_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE submodules_smid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: submodules_smid_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE submodules_smid_seq OWNED BY submodules.smid;


--
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
-- Name: users_id_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
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
-- Name: view_modules_users; Type: VIEW; Schema: system; Owner: -
--

CREATE VIEW view_modules_users AS
    SELECT DISTINCT su.id, smu.mid, smi18n.lang, smi18n.value AS mshortdesc, sm.icon, sm.helpurl, sm.ordering, sm.typeof, sm.status FROM (((submodules_users smu LEFT JOIN users su ON ((su.id = smu.user_id))) LEFT JOIN modules sm ON ((sm.mid = smu.mid))) LEFT JOIN modules_i18n smi18n ON ((smi18n.id_module = sm.mid))) WHERE ((sm.mshortdesc)::text = (smi18n.key)::text) ORDER BY sm.ordering;


--
-- Name: view_submodules_users; Type: VIEW; Schema: system; Owner: -
--

CREATE VIEW view_submodules_users AS
    SELECT smo.user_id, sm.mid, ssmi18n.lang, sm.mshortdesc, ss.parent_smid, ss.smid, ssmi18n.value AS smshortdesc, sm.helpurl, sm.loadurl AS mloadurl, ss.loadurl AS smloadurl, sm.icon AS micon, ss.icon AS smicon, sm.typeof AS mtypeof, ss.typeof AS smtypeof, sm.ordering AS mordering, ss.ordering AS smordering, smu.view, smu.edit, smu.add, smu.admin, ss.content_header, ss.content_body FROM (((((modules sm LEFT JOIN modules_users smo ON ((sm.mid = smo.mid))) LEFT JOIN submodules_users smu ON ((sm.mid = smu.mid))) LEFT JOIN submodules ss ON ((ss.smid = smu.smid))) LEFT JOIN submodules_i18n ssmi18n ON ((ssmi18n.id_submodule = smu.smid))) JOIN users su ON (((su.id = smo.user_id) AND (su.id = smu.user_id)))) WHERE ((ssmi18n.key)::text = (ss.smshortdesc)::text) ORDER BY sm.ordering, ss.ordering;


--
-- Name: event_id; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY log_audit ALTER COLUMN event_id SET DEFAULT nextval('log_audit_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY log_logins ALTER COLUMN id SET DEFAULT nextval('log_logins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY log_updates ALTER COLUMN id SET DEFAULT nextval('log_updates_id_seq'::regclass);


--
-- Name: mid; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY modules ALTER COLUMN mid SET DEFAULT nextval('modules_mid_seq'::regclass);


--
-- Name: smid; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY submodules ALTER COLUMN smid SET DEFAULT nextval('submodules_smid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: companies_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: companies_unique_comercial_name; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_unique_comercial_name UNIQUE (comercial_name);


--
-- Name: companies_unique_legal_name; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_unique_legal_name UNIQUE (legal_name);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: countries_unique_name; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_unique_name UNIQUE (name);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id, country_id);


--
-- Name: locations_unique_country_location; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_unique_country_location UNIQUE (country_id, location_name);


--
-- Name: log_audit_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY log_audit
    ADD CONSTRAINT log_audit_pkey PRIMARY KEY (event_id);


--
-- Name: log_logins_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY log_logins
    ADD CONSTRAINT log_logins_pkey PRIMARY KEY (id);


--
-- Name: log_updates_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY log_updates
    ADD CONSTRAINT log_updates_pkey PRIMARY KEY (id);


--
-- Name: pk_menu_users; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY submodules_users
    ADD CONSTRAINT pk_menu_users PRIMARY KEY (user_id, mid, smid);


--
-- Name: pk_module_i18n; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modules_i18n
    ADD CONSTRAINT pk_module_i18n PRIMARY KEY (lang, id_module, key);


--
-- Name: pk_modules; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modules
    ADD CONSTRAINT pk_modules PRIMARY KEY (mid);


--
-- Name: pk_modules_users; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modules_users
    ADD CONSTRAINT pk_modules_users PRIMARY KEY (user_id, mid);


--
-- Name: pk_submodule_i18n; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY submodules_i18n
    ADD CONSTRAINT pk_submodule_i18n PRIMARY KEY (lang, id_module, id_submodule, key);


--
-- Name: pk_submodules; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY submodules
    ADD CONSTRAINT pk_submodules PRIMARY KEY (mid, smid);


--
-- Name: pk_translation; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY translation
    ADD CONSTRAINT pk_translation PRIMARY KEY (lang, module, key);


--
-- Name: pk_userprefs; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT pk_userprefs PRIMARY KEY (user_id);


--
-- Name: pk_users_sessions; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users_sessions
    ADD CONSTRAINT pk_users_sessions PRIMARY KEY (user_id, session_id);


--
-- Name: uk_modules_mshortdesc; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modules
    ADD CONSTRAINT uk_modules_mshortdesc UNIQUE (mshortdesc);


--
-- Name: user_unique_login_by_country_company; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_unique_login_by_country_company UNIQUE (username, country, company);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: system; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: fki_companies_users; Type: INDEX; Schema: system; Owner: -; Tablespace: 
--

CREATE INDEX fki_companies_users ON users USING btree (company);


--
-- Name: fki_countries_users; Type: INDEX; Schema: system; Owner: -; Tablespace: 
--

CREATE INDEX fki_countries_users ON users USING btree (country);


--
-- Name: fki_locations_users; Type: INDEX; Schema: system; Owner: -; Tablespace: 
--

CREATE INDEX fki_locations_users ON users USING btree (location, country);


--
-- Name: fki_users_users_sessions; Type: INDEX; Schema: system; Owner: -; Tablespace: 
--

CREATE INDEX fki_users_users_sessions ON users_sessions USING btree (user_id);


--
-- Name: fk_companies_users; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_companies_users FOREIGN KEY (company) REFERENCES companies(id);


--
-- Name: fk_countries_users; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_countries_users FOREIGN KEY (country) REFERENCES countries(id);


--
-- Name: fk_locations_users; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_locations_users FOREIGN KEY (location, country) REFERENCES locations(id, country_id);


--
-- Name: fk_modules; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY submodules_users
    ADD CONSTRAINT fk_modules FOREIGN KEY (mid) REFERENCES modules(mid);


--
-- Name: fk_modules_1; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY modules_users
    ADD CONSTRAINT fk_modules_1 FOREIGN KEY (mid) REFERENCES modules(mid);


--
-- Name: fk_submodules; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY submodules_users
    ADD CONSTRAINT fk_submodules FOREIGN KEY (mid, smid) REFERENCES submodules(mid, smid);


--
-- Name: fk_users; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY submodules_users
    ADD CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_users_1; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY modules_users
    ADD CONSTRAINT fk_users_1 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_users_userprefs; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT fk_users_userprefs FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_users_users_sessions; Type: FK CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY users_sessions
    ADD CONSTRAINT fk_users_users_sessions FOREIGN KEY (user_id) REFERENCES rolpro.roles(id);


--
-- PostgreSQL database dump complete
--

