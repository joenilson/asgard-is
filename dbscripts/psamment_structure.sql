PGDMP     9                    q            psamment    9.1.11    9.1.11    �	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �	           1262    16551    psamment    DATABASE     z   CREATE DATABASE psamment WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_DO.UTF-8' LC_CTYPE = 'es_DO.UTF-8';
    DROP DATABASE psamment;
             stilgar    false                        2615    16552 
   accounting    SCHEMA        CREATE SCHEMA accounting;
    DROP SCHEMA accounting;
             stilgar    false                        2615    16553    bi    SCHEMA        CREATE SCHEMA bi;
    DROP SCHEMA bi;
             stilgar    false                        2615    16554    distribution    SCHEMA        CREATE SCHEMA distribution;
    DROP SCHEMA distribution;
             stilgar    false            	            2615    16555    facturation    SCHEMA        CREATE SCHEMA facturation;
    DROP SCHEMA facturation;
             stilgar    false                        2615    17652    hcm    SCHEMA        CREATE SCHEMA hcm;
    DROP SCHEMA hcm;
             stilgar    false            �	           0    0 
   SCHEMA hcm    COMMENT     5   COMMENT ON SCHEMA hcm IS 'Human Capital Management';
                  stilgar    false    16                        2615    17249    ims    SCHEMA        CREATE SCHEMA ims;
    DROP SCHEMA ims;
             stilgar    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    14            �	           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    14            
            2615    16556    rolpro    SCHEMA        CREATE SCHEMA rolpro;
    DROP SCHEMA rolpro;
             stilgar    false                        2615    16557    sales    SCHEMA        CREATE SCHEMA sales;
    DROP SCHEMA sales;
             stilgar    false                        2615    16558    system    SCHEMA        CREATE SCHEMA system;
    DROP SCHEMA system;
             stilgar    false                        2615    16559 	   warehouse    SCHEMA        CREATE SCHEMA warehouse;
    DROP SCHEMA warehouse;
             stilgar    false            �            3079    11716    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    244            �            1259    17666 	   employees    TABLE     �  CREATE TABLE employees (
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
    DROP TABLE hcm.employees;
       hcm         stilgar    false    16            �            1259    17664    employees_id_employee_seq    SEQUENCE     {   CREATE SEQUENCE employees_id_employee_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE hcm.employees_id_employee_seq;
       hcm       stilgar    false    16    210            �	           0    0    employees_id_employee_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE employees_id_employee_seq OWNED BY employees.id_employee;
            hcm       stilgar    false    209            �            1259    17709    survey_categories    TABLE     �   CREATE TABLE survey_categories (
    id_survey_category integer NOT NULL,
    category_name character varying(50) NOT NULL,
    status character(1) NOT NULL
);
 "   DROP TABLE hcm.survey_categories;
       hcm         stilgar    false    16            �            1259    17707 (   survey_categories_id_survey_category_seq    SEQUENCE     �   CREATE SEQUENCE survey_categories_id_survey_category_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE hcm.survey_categories_id_survey_category_seq;
       hcm       stilgar    false    212    16            �	           0    0 (   survey_categories_id_survey_category_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE survey_categories_id_survey_category_seq OWNED BY survey_categories.id_survey_category;
            hcm       stilgar    false    211            �            1259    17726    survey_questions_detail    TABLE       CREATE TABLE survey_questions_detail (
    id_survey_category integer NOT NULL,
    id_survey_question integer NOT NULL,
    lang character varying(4) NOT NULL,
    key_answer text NOT NULL,
    key_score numeric(8,2) NOT NULL,
    key_score_type character varying(4) NOT NULL
);
 (   DROP TABLE hcm.survey_questions_detail;
       hcm         stilgar    false    16            �            1259    17717    survey_questions_header    TABLE       CREATE TABLE survey_questions_header (
    id_survey_category integer NOT NULL,
    id_survey_question integer NOT NULL,
    lang character varying(4) NOT NULL,
    question_text text NOT NULL,
    question_type character varying(4) NOT NULL,
    status character(1) NOT NULL
);
 (   DROP TABLE hcm.survey_questions_header;
       hcm         stilgar    false    16            �            1259    17715 .   survey_questions_header_id_survey_question_seq    SEQUENCE     �   CREATE SEQUENCE survey_questions_header_id_survey_question_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE hcm.survey_questions_header_id_survey_question_seq;
       hcm       stilgar    false    214    16            �	           0    0 .   survey_questions_header_id_survey_question_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE survey_questions_header_id_survey_question_seq OWNED BY survey_questions_header.id_survey_question;
            hcm       stilgar    false    213            �            1259    17744    survey_results_detail    TABLE     $  CREATE TABLE survey_results_detail (
    id_survey integer NOT NULL,
    id_survey_result integer NOT NULL,
    id_company integer NOT NULL,
    id_employee integer NOT NULL,
    id_survey_category integer NOT NULL,
    id_survey_question integer NOT NULL,
    score numeric(8,2) NOT NULL
);
 &   DROP TABLE hcm.survey_results_detail;
       hcm         stilgar    false    16            �            1259    17738    survey_results_header    TABLE     i  CREATE TABLE survey_results_header (
    id_survey_result integer NOT NULL,
    id_survey integer NOT NULL,
    id_company integer NOT NULL,
    id_employee integer NOT NULL,
    id_bureau_employee integer NOT NULL,
    date_survey date NOT NULL,
    date_period character varying(7) NOT NULL,
    final_result numeric(8,2),
    status character(1) NOT NULL
);
 &   DROP TABLE hcm.survey_results_header;
       hcm         stilgar    false    16            �            1259    17736 *   survey_results_header_id_survey_result_seq    SEQUENCE     �   CREATE SEQUENCE survey_results_header_id_survey_result_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE hcm.survey_results_header_id_survey_result_seq;
       hcm       stilgar    false    16    217            �	           0    0 *   survey_results_header_id_survey_result_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE survey_results_header_id_survey_result_seq OWNED BY survey_results_header.id_survey_result;
            hcm       stilgar    false    216            �            1259    17764    surveys_detail    TABLE     �   CREATE TABLE surveys_detail (
    id_survey integer NOT NULL,
    survey_innername character varying(30) NOT NULL,
    id_survey_category integer NOT NULL,
    id_survey_question integer NOT NULL,
    question_order smallint NOT NULL
);
    DROP TABLE hcm.surveys_detail;
       hcm         stilgar    false    16            �            1259    17758    surveys_header    TABLE     �   CREATE TABLE surveys_header (
    id_survey integer NOT NULL,
    survey_name_key character varying(30),
    id_survey_type character varying(4),
    id_survey_scope character varying(3),
    status character(1)
);
    DROP TABLE hcm.surveys_header;
       hcm         stilgar    false    16            �            1259    17756    surveys_header_id_survey_seq    SEQUENCE     ~   CREATE SEQUENCE surveys_header_id_survey_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE hcm.surveys_header_id_survey_seq;
       hcm       stilgar    false    220    16            �	           0    0    surveys_header_id_survey_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE surveys_header_id_survey_seq OWNED BY surveys_header.id_survey;
            hcm       stilgar    false    219            �            1259    17433    content_text    TABLE     g  CREATE TABLE content_text (
    id_module integer NOT NULL,
    id_submodule integer NOT NULL,
    lang character varying(10) NOT NULL,
    content text NOT NULL,
    majorversion integer,
    minorversion integer,
    correction integer,
    date_creation timestamp with time zone,
    date_lastmodif timestamp with time zone,
    user_id integer NOT NULL,
    country character varying(4) DEFAULT '0000'::character varying NOT NULL,
    company character varying(4) DEFAULT '0000'::character varying NOT NULL,
    location character varying(4) DEFAULT '0000'::character varying NOT NULL,
    ims_registry text
);
    DROP TABLE ims.content_text;
       ims         stilgar    false    2125    2126    2127    15            �            1259    17450    content_text_history    TABLE     �  CREATE TABLE content_text_history (
    id_module integer NOT NULL,
    id_submodule integer NOT NULL,
    lang character varying(10) NOT NULL,
    content text NOT NULL,
    majorversion integer NOT NULL,
    minorversion integer NOT NULL,
    correction integer NOT NULL,
    date_creation timestamp with time zone,
    date_modification timestamp with time zone,
    user_id integer,
    country character varying(4) DEFAULT '0000'::character varying NOT NULL,
    company character varying(4) DEFAULT '0000'::character varying NOT NULL,
    location character varying(4) DEFAULT '0000'::character varying NOT NULL,
    ims_registry text
);
 %   DROP TABLE ims.content_text_history;
       ims         stilgar    false    2128    2129    2130    15            �            1259    75230    docs_helpers    TABLE     T  CREATE TABLE docs_helpers (
    helper character varying(64) NOT NULL,
    id integer NOT NULL,
    lang character varying(10) NOT NULL,
    description character varying(180) NOT NULL,
    status character(1) NOT NULL,
    date_creation timestamp without time zone NOT NULL,
    user_id integer NOT NULL,
    code character varying(10)
);
    DROP TABLE ims.docs_helpers;
       ims         stilgar    false    15            �            1259    75265    docs_library    TABLE     �  CREATE TABLE docs_library (
    doc_id integer NOT NULL,
    lang character varying(10) NOT NULL,
    doc_classification integer NOT NULL,
    doc_desc character varying(180) NOT NULL,
    doc_file character varying(240) NOT NULL,
    doc_type integer NOT NULL,
    doc_review integer NOT NULL,
    doc_protection integer NOT NULL,
    doc_owner integer,
    doc_location integer NOT NULL,
    doc_origin integer NOT NULL,
    doc_retention integer NOT NULL,
    doc_record character varying(20),
    doc_version_number integer,
    doc_version_label character varying(180),
    doc_date_creation timestamp without time zone,
    doc_user_creation integer NOT NULL,
    doc_date_modification timestamp without time zone,
    doc_user_modification integer,
    doc_date_revision_req timestamp without time zone,
    doc_user_revision_req integer,
    doc_date_revision_actual timestamp without time zone,
    doc_date_revision_next timestamp without time zone,
    doc_status_general character(1),
    doc_status_revision character(1),
    doc_reference integer,
    country character varying(4) NOT NULL,
    company character varying(4) NOT NULL,
    location character varying(4) NOT NULL
);
    DROP TABLE ims.docs_library;
       ims         stilgar    false    15            �            1259    17579    hira_frequency    TABLE     �   CREATE TABLE hira_frequency (
    id_frequency character varying(2) NOT NULL,
    lang character varying(10) NOT NULL,
    description text NOT NULL,
    status boolean NOT NULL,
    ordering integer NOT NULL
);
    DROP TABLE ims.hira_frequency;
       ims         stilgar    false    15            �            1259    34158    hira_incidents_type    TABLE     /  CREATE TABLE hira_incidents_type (
    lang character varying(10) NOT NULL,
    id_incident integer NOT NULL,
    val_incident text NOT NULL,
    status boolean,
    date_creation timestamp without time zone,
    date_modification timestamp without time zone,
    old_idincident character varying(6)
);
 $   DROP TABLE ims.hira_incidents_type;
       ims         stilgar    false    15            �            1259    17587    hira_matrix    TABLE     `  CREATE TABLE hira_matrix (
    country character varying(4) DEFAULT '0000'::character varying NOT NULL,
    company character varying(4) DEFAULT '0000'::character varying NOT NULL,
    location character varying(4) DEFAULT '0000'::character varying NOT NULL,
    id_severity integer,
    id_frequency character varying(2),
    risk integer NOT NULL
);
    DROP TABLE ims.hira_matrix;
       ims         stilgar    false    2131    2132    2133    15            �            1259    17595    hira_risk_level    TABLE     �   CREATE TABLE hira_risk_level (
    id_level integer NOT NULL,
    min_risk integer NOT NULL,
    max_risk integer NOT NULL,
    min_fixtime integer,
    max_fixtime integer,
    format_fixtime character varying(12),
    status boolean
);
     DROP TABLE ims.hira_risk_level;
       ims         stilgar    false    15            �            1259    17615    hira_risk_level_i18n    TABLE     �   CREATE TABLE hira_risk_level_i18n (
    id_level integer NOT NULL,
    lang character varying(10),
    key character varying(12),
    description text
);
 %   DROP TABLE ims.hira_risk_level_i18n;
       ims         stilgar    false    15            �            1259    17593    hira_risk_level_id_level_seq    SEQUENCE     ~   CREATE SEQUENCE hira_risk_level_id_level_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE ims.hira_risk_level_id_level_seq;
       ims       stilgar    false    15    207            �	           0    0    hira_risk_level_id_level_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE hira_risk_level_id_level_seq OWNED BY hira_risk_level.id_level;
            ims       stilgar    false    206            �            1259    17557    hira_severity    TABLE     �   CREATE TABLE hira_severity (
    id_severity integer NOT NULL,
    lang character varying(4) NOT NULL,
    description text NOT NULL,
    status boolean,
    ordering integer NOT NULL
);
    DROP TABLE ims.hira_severity;
       ims         stilgar    false    15            �            1259    42400    process_activity    TABLE     |   CREATE TABLE process_activity (
    id integer NOT NULL,
    ordering integer NOT NULL,
    status character(1) NOT NULL
);
 !   DROP TABLE ims.process_activity;
       ims         stilgar    false    15            �            1259    42406    process_activity_i18n    TABLE     �   CREATE TABLE process_activity_i18n (
    lang character varying(10) NOT NULL,
    id integer NOT NULL,
    value text NOT NULL,
    description text,
    rich_content text
);
 &   DROP TABLE ims.process_activity_i18n;
       ims         stilgar    false    15            �            1259    42398    process_activity_id_seq    SEQUENCE     y   CREATE SEQUENCE process_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE ims.process_activity_id_seq;
       ims       stilgar    false    233    15            �	           0    0    process_activity_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE process_activity_id_seq OWNED BY process_activity.id;
            ims       stilgar    false    232            �            1259    42368    process_main    TABLE     x   CREATE TABLE process_main (
    id integer NOT NULL,
    ordering integer NOT NULL,
    status character(1) NOT NULL
);
    DROP TABLE ims.process_main;
       ims         stilgar    false    15            �            1259    42374    process_main_i18n    TABLE     �   CREATE TABLE process_main_i18n (
    lang character varying(10) NOT NULL,
    id integer NOT NULL,
    value text NOT NULL,
    description text
);
 "   DROP TABLE ims.process_main_i18n;
       ims         stilgar    false    15            �            1259    42366    process_main_id_seq    SEQUENCE     u   CREATE SEQUENCE process_main_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE ims.process_main_id_seq;
       ims       stilgar    false    227    15            �	           0    0    process_main_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE process_main_id_seq OWNED BY process_main.id;
            ims       stilgar    false    226            �            1259    66926    process_relations    TABLE     0  CREATE TABLE process_relations (
    type character(1) NOT NULL,
    id integer NOT NULL,
    parent_id integer NOT NULL,
    date_creation timestamp without time zone NOT NULL,
    user_id integer,
    country character varying(4),
    company character varying(4),
    location character varying(4)
);
 "   DROP TABLE ims.process_relations;
       ims         stilgar    false    15            �            1259    66953    process_main_view    VIEW     s  CREATE VIEW process_main_view AS
    SELECT process_main_i18n.lang, process_main.id, process_main_i18n.value, process_main_i18n.description, process_main.ordering, process_main.status, process_relations.type, process_relations.parent_id, process_relations.company, process_relations.country, process_relations.location, CASE WHEN (process_relations.parent_id IS NULL) THEN 'U'::text ELSE 'A'::text END AS assignment FROM ((process_main JOIN process_main_i18n ON ((process_main.id = process_main_i18n.id))) LEFT JOIN process_relations ON (((process_main.id = process_relations.id) AND (process_relations.type = 'p'::bpchar))));
 !   DROP VIEW ims.process_main_view;
       ims       stilgar    false    2378    15            �            1259    75186    process_owner    TABLE     L  CREATE TABLE process_owner (
    id integer NOT NULL,
    lang character varying(10) NOT NULL,
    name character varying(180) NOT NULL,
    status character(1) NOT NULL,
    date_creation timestamp without time zone NOT NULL,
    user_id integer NOT NULL,
    date_modification timestamp without time zone,
    user_mod integer
);
    DROP TABLE ims.process_owner;
       ims         stilgar    false    15            �            1259    66942    process_relations_history    TABLE     �  CREATE TABLE process_relations_history (
    type character(1) NOT NULL,
    id integer NOT NULL,
    parent_id integer NOT NULL,
    date_creation timestamp without time zone NOT NULL,
    user_id integer,
    country character varying(4),
    company character varying(4),
    location character varying(4),
    date_modification timestamp without time zone,
    user_mod integer
);
 *   DROP TABLE ims.process_relations_history;
       ims         stilgar    false    15            �            1259    42384    process_thread    TABLE     z   CREATE TABLE process_thread (
    id integer NOT NULL,
    ordering integer NOT NULL,
    status character(1) NOT NULL
);
    DROP TABLE ims.process_thread;
       ims         stilgar    false    15            �            1259    42390    process_thread_i18n    TABLE     �   CREATE TABLE process_thread_i18n (
    lang character varying(10) NOT NULL,
    id integer NOT NULL,
    value text NOT NULL,
    mission text,
    scope text,
    rich_content text
);
 $   DROP TABLE ims.process_thread_i18n;
       ims         stilgar    false    15            �            1259    42382    process_thread_id_seq    SEQUENCE     w   CREATE SEQUENCE process_thread_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE ims.process_thread_id_seq;
       ims       stilgar    false    15    230            �	           0    0    process_thread_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE process_thread_id_seq OWNED BY process_thread.id;
            ims       stilgar    false    229            �            1259    75183    process_thread_owner    TABLE     )  CREATE TABLE process_thread_owner (
    type character(1) NOT NULL,
    id integer NOT NULL,
    date_creation timestamp without time zone NOT NULL,
    user_id integer,
    country character varying(4),
    company character varying(4),
    location character varying(4),
    id_owner integer
);
 %   DROP TABLE ims.process_thread_owner;
       ims         stilgar    false    15            �            1259    66958    process_thread_view    VIEW     �  CREATE VIEW process_thread_view AS
    SELECT process_thread_i18n.lang, process_thread.id, process_thread_i18n.value, process_thread_i18n.mission, process_thread_i18n.scope, process_thread_i18n.rich_content, process_thread.ordering, process_thread.status, process_relations.type, process_relations.parent_id, process_relations.company, process_relations.country, process_relations.location, CASE WHEN (process_relations.parent_id IS NULL) THEN 'U'::text ELSE 'A'::text END AS assignment FROM ((process_thread JOIN process_thread_i18n ON ((process_thread.id = process_thread_i18n.id))) LEFT JOIN process_relations ON (((process_thread.id = process_relations.id) AND (process_relations.type = 's'::bpchar))));
 #   DROP VIEW ims.process_thread_view;
       ims       stilgar    false    2379    15            �            1259    42352    process_type    TABLE     x   CREATE TABLE process_type (
    id integer NOT NULL,
    ordering integer NOT NULL,
    status character(1) NOT NULL
);
    DROP TABLE ims.process_type;
       ims         stilgar    false    15            �	           0    0    TABLE process_type    COMMENT     2   COMMENT ON TABLE process_type IS 'Process Types';
            ims       stilgar    false    224            �            1259    42358    process_type_i18n    TABLE     �   CREATE TABLE process_type_i18n (
    lang character varying(10) NOT NULL,
    id integer NOT NULL,
    value text NOT NULL,
    description text
);
 "   DROP TABLE ims.process_type_i18n;
       ims         stilgar    false    15            �            1259    42350    process_type_id_seq    SEQUENCE     u   CREATE SEQUENCE process_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE ims.process_type_id_seq;
       ims       stilgar    false    15    224            �	           0    0    process_type_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE process_type_id_seq OWNED BY process_type.id;
            ims       stilgar    false    223            �            1259    17377    application_content    TABLE     �   CREATE TABLE application_content (
    screen character varying(60) NOT NULL,
    lang character varying(4) NOT NULL,
    content_header text,
    content_body text,
    content_footer text,
    template text
);
 '   DROP TABLE public.application_content;
       public         stilgar    false    14            �            1259    16566    roles    TABLE     �   CREATE TABLE roles (
    id integer NOT NULL,
    description character varying(50) NOT NULL,
    date_created timestamp without time zone NOT NULL,
    status boolean
);
    DROP TABLE rolpro.roles;
       rolpro         stilgar    false    10            �            1259    16569    roles_id_seq    SEQUENCE     n   CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE rolpro.roles_id_seq;
       rolpro       stilgar    false    10    171            �	           0    0    roles_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE roles_id_seq OWNED BY roles.id;
            rolpro       stilgar    false    172            �            1259    17398    application    TABLE     Z  CREATE TABLE application (
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
    DROP TABLE system.application;
       system         stilgar    false    12            �            1259    17396    application_app_id_seq    SEQUENCE     x   CREATE SEQUENCE application_app_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE system.application_app_id_seq;
       system       stilgar    false    199    12            �	           0    0    application_app_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE application_app_id_seq OWNED BY application.app_id;
            system       stilgar    false    198            �            1259    17326 	   companies    TABLE     �  CREATE TABLE companies (
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
    DROP TABLE system.companies;
       system         stilgar    false    12            �            1259    66966    companies_geolocation    TABLE     �   CREATE TABLE companies_geolocation (
    company_id character varying(4) NOT NULL,
    country_id character varying(4) NOT NULL,
    location_id character varying(4) NOT NULL
);
 )   DROP TABLE system.companies_geolocation;
       system         stilgar    false    12            �            1259    17292 	   countries    TABLE     �   CREATE TABLE countries (
    id character varying(4) NOT NULL,
    abrev character varying(6),
    name text,
    locale character varying(10),
    currency_symbol character varying(10),
    currency_description text,
    timezone text
);
    DROP TABLE system.countries;
       system         stilgar    false    12            �            1259    17348 	   locations    TABLE     �   CREATE TABLE locations (
    id character varying(4) NOT NULL,
    country_id character varying(4) NOT NULL,
    location_name text
);
    DROP TABLE system.locations;
       system         stilgar    false    12            �            1259    16571 	   log_audit    TABLE     @  CREATE TABLE log_audit (
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
    DROP TABLE system.log_audit;
       system         stilgar    false    12            �            1259    16577    log_audit_event_id_seq    SEQUENCE     x   CREATE SEQUENCE log_audit_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE system.log_audit_event_id_seq;
       system       stilgar    false    12    173            �	           0    0    log_audit_event_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE log_audit_event_id_seq OWNED BY log_audit.event_id;
            system       stilgar    false    174            �            1259    16579 
   log_logins    TABLE     �  CREATE TABLE log_logins (
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
    DROP TABLE system.log_logins;
       system         stilgar    false    12            �            1259    16585    log_logins_id_seq    SEQUENCE     s   CREATE SEQUENCE log_logins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE system.log_logins_id_seq;
       system       stilgar    false    12    175            �	           0    0    log_logins_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE log_logins_id_seq OWNED BY log_logins.id;
            system       stilgar    false    176            �            1259    16587    log_updates    TABLE     �  CREATE TABLE log_updates (
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
    DROP TABLE system.log_updates;
       system         stilgar    false    12            �            1259    16593    log_updates_id_seq    SEQUENCE     t   CREATE SEQUENCE log_updates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE system.log_updates_id_seq;
       system       stilgar    false    12    177            �	           0    0    log_updates_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE log_updates_id_seq OWNED BY log_updates.id;
            system       stilgar    false    178            �            1259    17425    messages    TABLE     �   CREATE TABLE messages (
    lang character varying(10) NOT NULL,
    key text NOT NULL,
    value text NOT NULL,
    type character varying(30),
    severity integer
);
    DROP TABLE system.messages;
       system         stilgar    false    12            �            1259    16598    modules    TABLE        CREATE TABLE modules (
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
    DROP TABLE system.modules;
       system         stilgar    false    12            �            1259    17130    modules_i18n    TABLE       CREATE TABLE modules_i18n (
    lang character varying(10) NOT NULL,
    id_module integer NOT NULL,
    key character varying(35) NOT NULL,
    value text,
    active boolean,
    date_create timestamp with time zone,
    date_modify timestamp with time zone
);
     DROP TABLE system.modules_i18n;
       system         stilgar    false    12            �            1259    16601    modules_mid_seq    SEQUENCE     q   CREATE SEQUENCE modules_mid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE system.modules_mid_seq;
       system       stilgar    false    12    180            �	           0    0    modules_mid_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE modules_mid_seq OWNED BY modules.mid;
            system       stilgar    false    181            �            1259    16603    modules_users    TABLE     W   CREATE TABLE modules_users (
    user_id integer NOT NULL,
    mid integer NOT NULL
);
 !   DROP TABLE system.modules_users;
       system         stilgar    false    12            �            1259    16606 
   submodules    TABLE     �  CREATE TABLE submodules (
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
    DROP TABLE system.submodules;
       system         stilgar    false    12            �            1259    17138    submodules_i18n    TABLE     -  CREATE TABLE submodules_i18n (
    lang character varying(10) NOT NULL,
    id_module integer NOT NULL,
    id_submodule integer NOT NULL,
    key character varying(35) NOT NULL,
    value text,
    active boolean,
    date_create timestamp with time zone,
    date_modify timestamp with time zone
);
 #   DROP TABLE system.submodules_i18n;
       system         stilgar    false    12            �            1259    16609    submodules_smid_seq    SEQUENCE     u   CREATE SEQUENCE submodules_smid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE system.submodules_smid_seq;
       system       stilgar    false    12    183            �	           0    0    submodules_smid_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE submodules_smid_seq OWNED BY submodules.smid;
            system       stilgar    false    184            �            1259    16595    submodules_users    TABLE       CREATE TABLE submodules_users (
    user_id integer NOT NULL,
    mid integer NOT NULL,
    smid integer NOT NULL,
    view boolean DEFAULT true NOT NULL,
    edit boolean DEFAULT false NOT NULL,
    add boolean DEFAULT false NOT NULL,
    admin boolean DEFAULT false NOT NULL
);
 $   DROP TABLE system.submodules_users;
       system         stilgar    false    2116    2117    2118    2119    12            �            1259    16692    translation    TABLE       CREATE TABLE translation (
    lang character varying(10) NOT NULL,
    module character varying(20) NOT NULL,
    key character varying(50) NOT NULL,
    value text,
    active boolean,
    date_create timestamp with time zone,
    date_modify timestamp with time zone
);
    DROP TABLE system.translation;
       system         stilgar    false    12            �            1259    17159    user_preferences    TABLE     �  CREATE TABLE user_preferences (
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
 $   DROP TABLE system.user_preferences;
       system         stilgar    false    12            �            1259    16611    users    TABLE     L  CREATE TABLE users (
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
    location character varying(4),
    admin boolean,
    status character(1),
    type character varying(20),
    account_type character varying(12) DEFAULT 'local'::character varying NOT NULL
);
    DROP TABLE system.users;
       system         stilgar    false    2123    12            �            1259    16617    users_id_seq    SEQUENCE     n   CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE system.users_id_seq;
       system       stilgar    false    12    185            �	           0    0    users_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE users_id_seq OWNED BY users.id;
            system       stilgar    false    186            �            1259    16619    users_sessions    TABLE     A  CREATE TABLE users_sessions (
    user_id integer NOT NULL,
    session_id character varying(64) NOT NULL,
    date_login timestamp without time zone NOT NULL,
    ipext_address character varying(20),
    ipint_address character varying(20),
    comp_hostname character varying(50),
    browser character varying(120)
);
 "   DROP TABLE system.users_sessions;
       system         stilgar    false    12            �            1259    17172    view_modules_users    VIEW     �  CREATE VIEW view_modules_users AS
    SELECT DISTINCT su.id, smu.mid, smi18n.lang, smi18n.value AS mshortdesc, sm.icon, sm.helpurl, sm.ordering, sm.typeof, sm.status FROM (((submodules_users smu LEFT JOIN users su ON ((su.id = smu.user_id))) LEFT JOIN modules sm ON ((sm.mid = smu.mid))) LEFT JOIN modules_i18n smi18n ON ((smi18n.id_module = sm.mid))) WHERE ((sm.mshortdesc)::text = (smi18n.key)::text) ORDER BY sm.ordering;
 %   DROP VIEW system.view_modules_users;
       system       stilgar    false    2374    12            �            1259    17253    view_submodules_users    VIEW     E  CREATE VIEW view_submodules_users AS
    SELECT smo.user_id, sm.mid, ssmi18n.lang, sm.mshortdesc, ss.parent_smid, ss.smid, ssmi18n.value AS smshortdesc, sm.helpurl, sm.loadurl AS mloadurl, ss.loadurl AS smloadurl, sm.icon AS micon, ss.icon AS smicon, sm.typeof AS mtypeof, ss.typeof AS smtypeof, sm.ordering AS mordering, ss.ordering AS smordering, smu.view, smu.edit, smu.add, smu.admin, ss.content_header, ss.content_body FROM (((((modules sm LEFT JOIN modules_users smo ON ((sm.mid = smo.mid))) LEFT JOIN submodules_users smu ON ((sm.mid = smu.mid))) LEFT JOIN submodules ss ON ((ss.smid = smu.smid))) LEFT JOIN submodules_i18n ssmi18n ON ((ssmi18n.id_submodule = smu.smid))) JOIN users su ON (((su.id = smo.user_id) AND (su.id = smu.user_id)))) WHERE ((ssmi18n.key)::text = (ss.smshortdesc)::text) ORDER BY sm.ordering, ss.ordering;
 (   DROP VIEW system.view_submodules_users;
       system       stilgar    false    2375    12            W           2604    17669    id_employee    DEFAULT     p   ALTER TABLE ONLY employees ALTER COLUMN id_employee SET DEFAULT nextval('employees_id_employee_seq'::regclass);
 A   ALTER TABLE hcm.employees ALTER COLUMN id_employee DROP DEFAULT;
       hcm       stilgar    false    209    210    210            X           2604    17712    id_survey_category    DEFAULT     �   ALTER TABLE ONLY survey_categories ALTER COLUMN id_survey_category SET DEFAULT nextval('survey_categories_id_survey_category_seq'::regclass);
 P   ALTER TABLE hcm.survey_categories ALTER COLUMN id_survey_category DROP DEFAULT;
       hcm       stilgar    false    211    212    212            Y           2604    17720    id_survey_question    DEFAULT     �   ALTER TABLE ONLY survey_questions_header ALTER COLUMN id_survey_question SET DEFAULT nextval('survey_questions_header_id_survey_question_seq'::regclass);
 V   ALTER TABLE hcm.survey_questions_header ALTER COLUMN id_survey_question DROP DEFAULT;
       hcm       stilgar    false    214    213    214            Z           2604    17741    id_survey_result    DEFAULT     �   ALTER TABLE ONLY survey_results_header ALTER COLUMN id_survey_result SET DEFAULT nextval('survey_results_header_id_survey_result_seq'::regclass);
 R   ALTER TABLE hcm.survey_results_header ALTER COLUMN id_survey_result DROP DEFAULT;
       hcm       stilgar    false    217    216    217            [           2604    17761 	   id_survey    DEFAULT     v   ALTER TABLE ONLY surveys_header ALTER COLUMN id_survey SET DEFAULT nextval('surveys_header_id_survey_seq'::regclass);
 D   ALTER TABLE hcm.surveys_header ALTER COLUMN id_survey DROP DEFAULT;
       hcm       stilgar    false    219    220    220            V           2604    17598    id_level    DEFAULT     v   ALTER TABLE ONLY hira_risk_level ALTER COLUMN id_level SET DEFAULT nextval('hira_risk_level_id_level_seq'::regclass);
 D   ALTER TABLE ims.hira_risk_level ALTER COLUMN id_level DROP DEFAULT;
       ims       stilgar    false    207    206    207            _           2604    42403    id    DEFAULT     l   ALTER TABLE ONLY process_activity ALTER COLUMN id SET DEFAULT nextval('process_activity_id_seq'::regclass);
 ?   ALTER TABLE ims.process_activity ALTER COLUMN id DROP DEFAULT;
       ims       stilgar    false    232    233    233            ]           2604    42371    id    DEFAULT     d   ALTER TABLE ONLY process_main ALTER COLUMN id SET DEFAULT nextval('process_main_id_seq'::regclass);
 ;   ALTER TABLE ims.process_main ALTER COLUMN id DROP DEFAULT;
       ims       stilgar    false    226    227    227            ^           2604    42387    id    DEFAULT     h   ALTER TABLE ONLY process_thread ALTER COLUMN id SET DEFAULT nextval('process_thread_id_seq'::regclass);
 =   ALTER TABLE ims.process_thread ALTER COLUMN id DROP DEFAULT;
       ims       stilgar    false    229    230    230            \           2604    42355    id    DEFAULT     d   ALTER TABLE ONLY process_type ALTER COLUMN id SET DEFAULT nextval('process_type_id_seq'::regclass);
 ;   ALTER TABLE ims.process_type ALTER COLUMN id DROP DEFAULT;
       ims       stilgar    false    223    224    224            @           2604    16627    id    DEFAULT     V   ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);
 7   ALTER TABLE rolpro.roles ALTER COLUMN id DROP DEFAULT;
       rolpro       stilgar    false    172    171            L           2604    17401    app_id    DEFAULT     j   ALTER TABLE ONLY application ALTER COLUMN app_id SET DEFAULT nextval('application_app_id_seq'::regclass);
 A   ALTER TABLE system.application ALTER COLUMN app_id DROP DEFAULT;
       system       stilgar    false    198    199    199            A           2604    16628    event_id    DEFAULT     j   ALTER TABLE ONLY log_audit ALTER COLUMN event_id SET DEFAULT nextval('log_audit_event_id_seq'::regclass);
 A   ALTER TABLE system.log_audit ALTER COLUMN event_id DROP DEFAULT;
       system       stilgar    false    174    173            B           2604    16629    id    DEFAULT     `   ALTER TABLE ONLY log_logins ALTER COLUMN id SET DEFAULT nextval('log_logins_id_seq'::regclass);
 <   ALTER TABLE system.log_logins ALTER COLUMN id DROP DEFAULT;
       system       stilgar    false    176    175            C           2604    16630    id    DEFAULT     b   ALTER TABLE ONLY log_updates ALTER COLUMN id SET DEFAULT nextval('log_updates_id_seq'::regclass);
 =   ALTER TABLE system.log_updates ALTER COLUMN id DROP DEFAULT;
       system       stilgar    false    178    177            H           2604    16631    mid    DEFAULT     \   ALTER TABLE ONLY modules ALTER COLUMN mid SET DEFAULT nextval('modules_mid_seq'::regclass);
 :   ALTER TABLE system.modules ALTER COLUMN mid DROP DEFAULT;
       system       stilgar    false    181    180            I           2604    16632    smid    DEFAULT     d   ALTER TABLE ONLY submodules ALTER COLUMN smid SET DEFAULT nextval('submodules_smid_seq'::regclass);
 >   ALTER TABLE system.submodules ALTER COLUMN smid DROP DEFAULT;
       system       stilgar    false    184    183            J           2604    16633    id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);
 7   ALTER TABLE system.users ALTER COLUMN id DROP DEFAULT;
       system       stilgar    false    186    185            q	          0    17666 	   employees 
   TABLE DATA               �   COPY employees (id_employee, last_name, first_name, full_name, id_company, id_location, id_bureau, id_division, id_position, status, date_begin) FROM stdin;
    hcm       stilgar    false    210    2449   �h      �	           0    0    employees_id_employee_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('employees_id_employee_seq', 1, false);
            hcm       stilgar    false    209            s	          0    17709    survey_categories 
   TABLE DATA               O   COPY survey_categories (id_survey_category, category_name, status) FROM stdin;
    hcm       stilgar    false    212    2449   �h      �	           0    0 (   survey_categories_id_survey_category_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('survey_categories_id_survey_category_seq', 1, false);
            hcm       stilgar    false    211            v	          0    17726    survey_questions_detail 
   TABLE DATA                  COPY survey_questions_detail (id_survey_category, id_survey_question, lang, key_answer, key_score, key_score_type) FROM stdin;
    hcm       stilgar    false    215    2449   �h      u	          0    17717    survey_questions_header 
   TABLE DATA               ~   COPY survey_questions_header (id_survey_category, id_survey_question, lang, question_text, question_type, status) FROM stdin;
    hcm       stilgar    false    214    2449   i      �	           0    0 .   survey_questions_header_id_survey_question_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('survey_questions_header_id_survey_question_seq', 1, false);
            hcm       stilgar    false    213            y	          0    17744    survey_results_detail 
   TABLE DATA               �   COPY survey_results_detail (id_survey, id_survey_result, id_company, id_employee, id_survey_category, id_survey_question, score) FROM stdin;
    hcm       stilgar    false    218    2449   #i      x	          0    17738    survey_results_header 
   TABLE DATA               �   COPY survey_results_header (id_survey_result, id_survey, id_company, id_employee, id_bureau_employee, date_survey, date_period, final_result, status) FROM stdin;
    hcm       stilgar    false    217    2449   @i      �	           0    0 *   survey_results_header_id_survey_result_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('survey_results_header_id_survey_result_seq', 1, false);
            hcm       stilgar    false    216            |	          0    17764    surveys_detail 
   TABLE DATA               v   COPY surveys_detail (id_survey, survey_innername, id_survey_category, id_survey_question, question_order) FROM stdin;
    hcm       stilgar    false    221    2449   ]i      {	          0    17758    surveys_header 
   TABLE DATA               f   COPY surveys_header (id_survey, survey_name_key, id_survey_type, id_survey_scope, status) FROM stdin;
    hcm       stilgar    false    220    2449   zi      �	           0    0    surveys_header_id_survey_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('surveys_header_id_survey_seq', 1, false);
            hcm       stilgar    false    219            h	          0    17433    content_text 
   TABLE DATA               �   COPY content_text (id_module, id_submodule, lang, content, majorversion, minorversion, correction, date_creation, date_lastmodif, user_id, country, company, location, ims_registry) FROM stdin;
    ims       stilgar    false    201    2449   �i      i	          0    17450    content_text_history 
   TABLE DATA               �   COPY content_text_history (id_module, id_submodule, lang, content, majorversion, minorversion, correction, date_creation, date_modification, user_id, country, company, location, ims_registry) FROM stdin;
    ims       stilgar    false    202    2449   ;m      �	          0    75230    docs_helpers 
   TABLE DATA               d   COPY docs_helpers (helper, id, lang, description, status, date_creation, user_id, code) FROM stdin;
    ims       stilgar    false    242    2449   lr      �	          0    75265    docs_library 
   TABLE DATA               �  COPY docs_library (doc_id, lang, doc_classification, doc_desc, doc_file, doc_type, doc_review, doc_protection, doc_owner, doc_location, doc_origin, doc_retention, doc_record, doc_version_number, doc_version_label, doc_date_creation, doc_user_creation, doc_date_modification, doc_user_modification, doc_date_revision_req, doc_user_revision_req, doc_date_revision_actual, doc_date_revision_next, doc_status_general, doc_status_revision, doc_reference, country, company, location) FROM stdin;
    ims       stilgar    false    243    2449   Hv      k	          0    17579    hira_frequency 
   TABLE DATA               T   COPY hira_frequency (id_frequency, lang, description, status, ordering) FROM stdin;
    ims       stilgar    false    204    2449   ]�      }	          0    34158    hira_incidents_type 
   TABLE DATA               �   COPY hira_incidents_type (lang, id_incident, val_incident, status, date_creation, date_modification, old_idincident) FROM stdin;
    ims       stilgar    false    222    2449   ��      l	          0    17587    hira_matrix 
   TABLE DATA               [   COPY hira_matrix (country, company, location, id_severity, id_frequency, risk) FROM stdin;
    ims       stilgar    false    205    2449   F�      n	          0    17595    hira_risk_level 
   TABLE DATA               r   COPY hira_risk_level (id_level, min_risk, max_risk, min_fixtime, max_fixtime, format_fixtime, status) FROM stdin;
    ims       stilgar    false    207    2449   ��      o	          0    17615    hira_risk_level_i18n 
   TABLE DATA               I   COPY hira_risk_level_i18n (id_level, lang, key, description) FROM stdin;
    ims       stilgar    false    208    2449   )�      �	           0    0    hira_risk_level_id_level_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('hira_risk_level_id_level_seq', 3, true);
            ims       stilgar    false    206            j	          0    17557    hira_severity 
   TABLE DATA               R   COPY hira_severity (id_severity, lang, description, status, ordering) FROM stdin;
    ims       stilgar    false    203    2449   t�      �	          0    42400    process_activity 
   TABLE DATA               9   COPY process_activity (id, ordering, status) FROM stdin;
    ims       stilgar    false    233    2449   B�      �	          0    42406    process_activity_i18n 
   TABLE DATA               T   COPY process_activity_i18n (lang, id, value, description, rich_content) FROM stdin;
    ims       stilgar    false    234    2449   _�      �	           0    0    process_activity_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('process_activity_id_seq', 1, false);
            ims       stilgar    false    232            �	          0    42368    process_main 
   TABLE DATA               5   COPY process_main (id, ordering, status) FROM stdin;
    ims       stilgar    false    227    2449   |�      �	          0    42374    process_main_i18n 
   TABLE DATA               B   COPY process_main_i18n (lang, id, value, description) FROM stdin;
    ims       stilgar    false    228    2449   ��      �	           0    0    process_main_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('process_main_id_seq', 20, true);
            ims       stilgar    false    226            �	          0    75186    process_owner 
   TABLE DATA               m   COPY process_owner (id, lang, name, status, date_creation, user_id, date_modification, user_mod) FROM stdin;
    ims       stilgar    false    241    2449   k�      �	          0    66926    process_relations 
   TABLE DATA               m   COPY process_relations (type, id, parent_id, date_creation, user_id, country, company, location) FROM stdin;
    ims       stilgar    false    235    2449   ��      �	          0    66942    process_relations_history 
   TABLE DATA               �   COPY process_relations_history (type, id, parent_id, date_creation, user_id, country, company, location, date_modification, user_mod) FROM stdin;
    ims       stilgar    false    236    2449   ��      �	          0    42384    process_thread 
   TABLE DATA               7   COPY process_thread (id, ordering, status) FROM stdin;
    ims       stilgar    false    230    2449   ��      �	          0    42390    process_thread_i18n 
   TABLE DATA               U   COPY process_thread_i18n (lang, id, value, mission, scope, rich_content) FROM stdin;
    ims       stilgar    false    231    2449   ��      �	           0    0    process_thread_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('process_thread_id_seq', 80, true);
            ims       stilgar    false    229            �	          0    75183    process_thread_owner 
   TABLE DATA               o   COPY process_thread_owner (type, id, date_creation, user_id, country, company, location, id_owner) FROM stdin;
    ims       stilgar    false    240    2449   �"      	          0    42352    process_type 
   TABLE DATA               5   COPY process_type (id, ordering, status) FROM stdin;
    ims       stilgar    false    224    2449   #      �	          0    42358    process_type_i18n 
   TABLE DATA               B   COPY process_type_i18n (lang, id, value, description) FROM stdin;
    ims       stilgar    false    225    2449   -#      �	           0    0    process_type_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('process_type_id_seq', 3, true);
            ims       stilgar    false    223            d	          0    17377    application_content 
   TABLE DATA               l   COPY application_content (screen, lang, content_header, content_body, content_footer, template) FROM stdin;
    public       stilgar    false    197    2449   �#      L	          0    16566    roles 
   TABLE DATA               ?   COPY roles (id, description, date_created, status) FROM stdin;
    rolpro       stilgar    false    171    2449   �#      �	           0    0    roles_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('roles_id_seq', 1, false);
            rolpro       stilgar    false    172            f	          0    17398    application 
   TABLE DATA               �   COPY application (app_id, app_name, app_codename, app_majorversion, app_minorversion, app_patch, app_build, app_date_begin, app_timezone, app_status, app_module_default) FROM stdin;
    system       stilgar    false    199    2449   $      �	           0    0    application_app_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('application_app_id_seq', 1, true);
            system       stilgar    false    198            b	          0    17326 	   companies 
   TABLE DATA               �   COPY companies (id, legal_name, comercial_name, fiscal_id, legal_address, comercial_address, phone_number, country, domain_name, primary_lang, status, is_cluster, is_header, cluster_id) FROM stdin;
    system       stilgar    false    195    2449   �$      �	          0    66966    companies_geolocation 
   TABLE DATA               M   COPY companies_geolocation (company_id, country_id, location_id) FROM stdin;
    system       stilgar    false    239    2449   �%      a	          0    17292 	   countries 
   TABLE DATA               f   COPY countries (id, abrev, name, locale, currency_symbol, currency_description, timezone) FROM stdin;
    system       stilgar    false    194    2449   &      c	          0    17348 	   locations 
   TABLE DATA               ;   COPY locations (id, country_id, location_name) FROM stdin;
    system       stilgar    false    196    2449   �&      N	          0    16571 	   log_audit 
   TABLE DATA               �   COPY log_audit (event_id, event_date, event_type, event_level, user_id, description, object_type, object_id, app_module) FROM stdin;
    system       stilgar    false    173    2449   �'      �	           0    0    log_audit_event_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('log_audit_event_id_seq', 80, true);
            system       stilgar    false    174            P	          0    16579 
   log_logins 
   TABLE DATA               �   COPY log_logins (id, user_id, login_date, login_status, ipext_address, ipint_address, comp_hostname, browser, event_type, event_level, description) FROM stdin;
    system       stilgar    false    175    2449   4+      �	           0    0    log_logins_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('log_logins_id_seq', 68, true);
            system       stilgar    false    176            R	          0    16587    log_updates 
   TABLE DATA               �   COPY log_updates (id, user_id, event_date, table_name, record_id, fieldname, oldvalue, new_value, event_type, event_level) FROM stdin;
    system       stilgar    false    177    2449   E/      �	           0    0    log_updates_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('log_updates_id_seq', 1, false);
            system       stilgar    false    178            g	          0    17425    messages 
   TABLE DATA               =   COPY messages (lang, key, value, type, severity) FROM stdin;
    system       stilgar    false    200    2449   b/      U	          0    16598    modules 
   TABLE DATA               �   COPY modules (mid, mshortdesc, mlongdesc, loadurl, helpurl, icon, status, typeof, ordering, datecreation, dateactivation, majorversion, minorversion, patch, build, date_revision) FROM stdin;
    system       stilgar    false    180    2449   N1      ^	          0    17130    modules_i18n 
   TABLE DATA               ^   COPY modules_i18n (lang, id_module, key, value, active, date_create, date_modify) FROM stdin;
    system       stilgar    false    189    2449   �2      �	           0    0    modules_mid_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('modules_mid_seq', 10, true);
            system       stilgar    false    181            W	          0    16603    modules_users 
   TABLE DATA               .   COPY modules_users (user_id, mid) FROM stdin;
    system       stilgar    false    182    2449   �4      X	          0    16606 
   submodules 
   TABLE DATA               �   COPY submodules (mid, smid, parent_smid, smshortdesc, smlongdesc, loadurl, icon, status, typeof, ordering, datecreation, dateactivation, content_header, content_body) FROM stdin;
    system       stilgar    false    183    2449   5      _	          0    17138    submodules_i18n 
   TABLE DATA               o   COPY submodules_i18n (lang, id_module, id_submodule, key, value, active, date_create, date_modify) FROM stdin;
    system       stilgar    false    190    2449   �=      �	           0    0    submodules_smid_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('submodules_smid_seq', 70, true);
            system       stilgar    false    184            T	          0    16595    submodules_users 
   TABLE DATA               O   COPY submodules_users (user_id, mid, smid, view, edit, add, admin) FROM stdin;
    system       stilgar    false    179    2449   L      ]	          0    16692    translation 
   TABLE DATA               Z   COPY translation (lang, module, key, value, active, date_create, date_modify) FROM stdin;
    system       stilgar    false    188    2449   
N      `	          0    17159    user_preferences 
   TABLE DATA               �   COPY user_preferences (user_id, lang, email, alias, avatar, regional, vacation_from, vacation_to, vacation_status, office_phone, cell_phone, home_phone, other_phone, fax_phone, office_ext) FROM stdin;
    system       stilgar    false    191    2449   �X      Z	          0    16611    users 
   TABLE DATA               �   COPY users (id, username, password, salt, realname, role, date_created, date_lastlogin, country, company, location, admin, status, type, account_type) FROM stdin;
    system       stilgar    false    185    2449   uY      �	           0    0    users_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('users_id_seq', 9, true);
            system       stilgar    false    186            \	          0    16619    users_sessions 
   TABLE DATA               x   COPY users_sessions (user_id, session_id, date_login, ipext_address, ipint_address, comp_hostname, browser) FROM stdin;
    system       stilgar    false    187    2449   P[      �           2606    17674    employees_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id_employee, id_company);
 ?   ALTER TABLE ONLY hcm.employees DROP CONSTRAINT employees_pkey;
       hcm         stilgar    false    210    210    210    2450            �           2606    17714    survey_categories_key 
   CONSTRAINT     n   ALTER TABLE ONLY survey_categories
    ADD CONSTRAINT survey_categories_key PRIMARY KEY (id_survey_category);
 N   ALTER TABLE ONLY hcm.survey_categories DROP CONSTRAINT survey_categories_key;
       hcm         stilgar    false    212    212    2450            �           2606    17733    survey_questions_detail_key 
   CONSTRAINT     �   ALTER TABLE ONLY survey_questions_detail
    ADD CONSTRAINT survey_questions_detail_key PRIMARY KEY (id_survey_category, id_survey_question, lang, key_answer);
 Z   ALTER TABLE ONLY hcm.survey_questions_detail DROP CONSTRAINT survey_questions_detail_key;
       hcm         stilgar    false    215    215    215    215    215    2450            �           2606    17725    survey_questions_header_key 
   CONSTRAINT     �   ALTER TABLE ONLY survey_questions_header
    ADD CONSTRAINT survey_questions_header_key PRIMARY KEY (id_survey_category, id_survey_question, lang, question_text);
 Z   ALTER TABLE ONLY hcm.survey_questions_header DROP CONSTRAINT survey_questions_header_key;
       hcm         stilgar    false    214    214    214    214    214    2450            �           2606    17748    survey_results_detail_key 
   CONSTRAINT     �   ALTER TABLE ONLY survey_results_detail
    ADD CONSTRAINT survey_results_detail_key PRIMARY KEY (id_survey, id_company, id_employee, id_survey_category, id_survey_question);
 V   ALTER TABLE ONLY hcm.survey_results_detail DROP CONSTRAINT survey_results_detail_key;
       hcm         stilgar    false    218    218    218    218    218    218    2450            �           2606    17743    survey_results_header_key 
   CONSTRAINT     �   ALTER TABLE ONLY survey_results_header
    ADD CONSTRAINT survey_results_header_key PRIMARY KEY (id_survey_result, id_survey, id_company, id_employee);
 V   ALTER TABLE ONLY hcm.survey_results_header DROP CONSTRAINT survey_results_header_key;
       hcm         stilgar    false    217    217    217    217    217    2450            �           2606    17768    surveys_detail_pk 
   CONSTRAINT     �   ALTER TABLE ONLY surveys_detail
    ADD CONSTRAINT surveys_detail_pk PRIMARY KEY (id_survey, survey_innername, id_survey_category, id_survey_question);
 G   ALTER TABLE ONLY hcm.surveys_detail DROP CONSTRAINT surveys_detail_pk;
       hcm         stilgar    false    221    221    221    221    221    2450            �           2606    17763    surveys_header_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY surveys_header
    ADD CONSTRAINT surveys_header_pk PRIMARY KEY (id_survey);
 G   ALTER TABLE ONLY hcm.surveys_header DROP CONSTRAINT surveys_header_pk;
       hcm         stilgar    false    220    220    2450            �           2606    75234    docs_helpers_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY docs_helpers
    ADD CONSTRAINT docs_helpers_pkey PRIMARY KEY (helper, id, lang);
 E   ALTER TABLE ONLY ims.docs_helpers DROP CONSTRAINT docs_helpers_pkey;
       ims         stilgar    false    242    242    242    242    2450            �           2606    75274 ?   docs_library_doc_id_lang_doc_classification_doc_type_countr_key 
   CONSTRAINT     �   ALTER TABLE ONLY docs_library
    ADD CONSTRAINT docs_library_doc_id_lang_doc_classification_doc_type_countr_key UNIQUE (doc_id, lang, doc_classification, doc_type, country, company, location, doc_version_number, doc_status_general);
 s   ALTER TABLE ONLY ims.docs_library DROP CONSTRAINT docs_library_doc_id_lang_doc_classification_doc_type_countr_key;
       ims         stilgar    false    243    243    243    243    243    243    243    243    243    243    2450            �           2606    75272    docs_library_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY docs_library
    ADD CONSTRAINT docs_library_pkey PRIMARY KEY (doc_id);
 E   ALTER TABLE ONLY ims.docs_library DROP CONSTRAINT docs_library_pkey;
       ims         stilgar    false    243    243    2450            �           2606    17586    hira_frequency_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY hira_frequency
    ADD CONSTRAINT hira_frequency_pkey PRIMARY KEY (id_frequency, lang);
 I   ALTER TABLE ONLY ims.hira_frequency DROP CONSTRAINT hira_frequency_pkey;
       ims         stilgar    false    204    204    204    2450            �           2606    34165    hira_incidents_type_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY hira_incidents_type
    ADD CONSTRAINT hira_incidents_type_pkey PRIMARY KEY (lang, id_incident);
 S   ALTER TABLE ONLY ims.hira_incidents_type DROP CONSTRAINT hira_incidents_type_pkey;
       ims         stilgar    false    222    222    222    2450            �           2606    17622 $   hira_risk_level_i18n_id_lang_key_key 
   CONSTRAINT     |   ALTER TABLE ONLY hira_risk_level_i18n
    ADD CONSTRAINT hira_risk_level_i18n_id_lang_key_key UNIQUE (id_level, lang, key);
 `   ALTER TABLE ONLY ims.hira_risk_level_i18n DROP CONSTRAINT hira_risk_level_i18n_id_lang_key_key;
       ims         stilgar    false    208    208    208    208    2450            �           2606    17600    hira_risk_level_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY hira_risk_level
    ADD CONSTRAINT hira_risk_level_pkey PRIMARY KEY (id_level);
 K   ALTER TABLE ONLY ims.hira_risk_level DROP CONSTRAINT hira_risk_level_pkey;
       ims         stilgar    false    207    207    2450            �           2606    17564    hira_severity_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY hira_severity
    ADD CONSTRAINT hira_severity_pkey PRIMARY KEY (id_severity, lang);
 G   ALTER TABLE ONLY ims.hira_severity DROP CONSTRAINT hira_severity_pkey;
       ims         stilgar    false    203    203    203    2450            �           2606    17521    pk_ims_content_text 
   CONSTRAINT     �   ALTER TABLE ONLY content_text
    ADD CONSTRAINT pk_ims_content_text PRIMARY KEY (id_module, id_submodule, lang, country, company, location);
 G   ALTER TABLE ONLY ims.content_text DROP CONSTRAINT pk_ims_content_text;
       ims         stilgar    false    201    201    201    201    201    201    201    2450            �           2606    17463    pk_ims_content_text_history 
   CONSTRAINT     �   ALTER TABLE ONLY content_text_history
    ADD CONSTRAINT pk_ims_content_text_history PRIMARY KEY (id_module, id_submodule, lang, country, company, majorversion, minorversion, correction);
 W   ALTER TABLE ONLY ims.content_text_history DROP CONSTRAINT pk_ims_content_text_history;
       ims         stilgar    false    202    202    202    202    202    202    202    202    202    2450            �           2606    42413    process_activity_i18n_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY process_activity_i18n
    ADD CONSTRAINT process_activity_i18n_pkey PRIMARY KEY (lang, id);
 W   ALTER TABLE ONLY ims.process_activity_i18n DROP CONSTRAINT process_activity_i18n_pkey;
       ims         stilgar    false    234    234    234    2450            �           2606    42405    process_activity_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY process_activity
    ADD CONSTRAINT process_activity_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY ims.process_activity DROP CONSTRAINT process_activity_pkey;
       ims         stilgar    false    233    233    2450            �           2606    42381    process_main_i18n_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY process_main_i18n
    ADD CONSTRAINT process_main_i18n_pkey PRIMARY KEY (lang, id);
 O   ALTER TABLE ONLY ims.process_main_i18n DROP CONSTRAINT process_main_i18n_pkey;
       ims         stilgar    false    228    228    228    2450            �           2606    42373    process_main_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY process_main
    ADD CONSTRAINT process_main_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY ims.process_main DROP CONSTRAINT process_main_pkey;
       ims         stilgar    false    227    227    2450            �           2606    75190    process_owner_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY process_owner
    ADD CONSTRAINT process_owner_pkey PRIMARY KEY (id, lang);
 G   ALTER TABLE ONLY ims.process_owner DROP CONSTRAINT process_owner_pkey;
       ims         stilgar    false    241    241    241    2450            �           2606    66930    process_relations_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY process_relations
    ADD CONSTRAINT process_relations_pkey PRIMARY KEY (type, id, parent_id);

ALTER TABLE process_relations CLUSTER ON process_relations_pkey;
 O   ALTER TABLE ONLY ims.process_relations DROP CONSTRAINT process_relations_pkey;
       ims         stilgar    false    235    235    235    235    2450            �           2606    42397    process_thread_i18n_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY process_thread_i18n
    ADD CONSTRAINT process_thread_i18n_pkey PRIMARY KEY (lang, id);
 S   ALTER TABLE ONLY ims.process_thread_i18n DROP CONSTRAINT process_thread_i18n_pkey;
       ims         stilgar    false    231    231    231    2450            �           2606    42389    process_thread_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY process_thread
    ADD CONSTRAINT process_thread_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY ims.process_thread DROP CONSTRAINT process_thread_pkey;
       ims         stilgar    false    230    230    2450            �           2606    42365    process_type_i18n_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY process_type_i18n
    ADD CONSTRAINT process_type_i18n_pkey PRIMARY KEY (lang, id);
 O   ALTER TABLE ONLY ims.process_type_i18n DROP CONSTRAINT process_type_i18n_pkey;
       ims         stilgar    false    225    225    225    2450            �           2606    42357    process_type_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY process_type
    ADD CONSTRAINT process_type_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY ims.process_type DROP CONSTRAINT process_type_pkey;
       ims         stilgar    false    224    224    2450            �           2606    17384    pk_application_content 
   CONSTRAINT     k   ALTER TABLE ONLY application_content
    ADD CONSTRAINT pk_application_content PRIMARY KEY (screen, lang);
 T   ALTER TABLE ONLY public.application_content DROP CONSTRAINT pk_application_content;
       public         stilgar    false    197    197    197    2450            a           2606    16635 
   roles_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY rolpro.roles DROP CONSTRAINT roles_pkey;
       rolpro         stilgar    false    171    171    2450            �           2606    17406    application_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY application
    ADD CONSTRAINT application_pkey PRIMARY KEY (app_id);
 F   ALTER TABLE ONLY system.application DROP CONSTRAINT application_pkey;
       system         stilgar    false    199    199    2450            �           2606    66970    companies_geolocation_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY companies_geolocation
    ADD CONSTRAINT companies_geolocation_pkey PRIMARY KEY (company_id, country_id, location_id);
 Z   ALTER TABLE ONLY system.companies_geolocation DROP CONSTRAINT companies_geolocation_pkey;
       system         stilgar    false    239    239    239    239    2450            �           2606    17333    companies_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY system.companies DROP CONSTRAINT companies_pkey;
       system         stilgar    false    195    195    2450            �           2606    17335    companies_unique_comercial_name 
   CONSTRAINT     g   ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_unique_comercial_name UNIQUE (comercial_name);
 S   ALTER TABLE ONLY system.companies DROP CONSTRAINT companies_unique_comercial_name;
       system         stilgar    false    195    195    2450            �           2606    17337    companies_unique_legal_name 
   CONSTRAINT     _   ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_unique_legal_name UNIQUE (legal_name);
 O   ALTER TABLE ONLY system.companies DROP CONSTRAINT companies_unique_legal_name;
       system         stilgar    false    195    195    2450            �           2606    17299    countries_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY system.countries DROP CONSTRAINT countries_pkey;
       system         stilgar    false    194    194    2450            �           2606    17301    countries_unique_name 
   CONSTRAINT     S   ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_unique_name UNIQUE (name);
 I   ALTER TABLE ONLY system.countries DROP CONSTRAINT countries_unique_name;
       system         stilgar    false    194    194    2450            �           2606    17355    locations_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id, country_id);
 B   ALTER TABLE ONLY system.locations DROP CONSTRAINT locations_pkey;
       system         stilgar    false    196    196    196    2450            �           2606    17357 !   locations_unique_country_location 
   CONSTRAINT     t   ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_unique_country_location UNIQUE (country_id, location_name);
 U   ALTER TABLE ONLY system.locations DROP CONSTRAINT locations_unique_country_location;
       system         stilgar    false    196    196    196    2450            c           2606    16637    log_audit_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY log_audit
    ADD CONSTRAINT log_audit_pkey PRIMARY KEY (event_id);
 B   ALTER TABLE ONLY system.log_audit DROP CONSTRAINT log_audit_pkey;
       system         stilgar    false    173    173    2450            e           2606    16639    log_logins_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY log_logins
    ADD CONSTRAINT log_logins_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY system.log_logins DROP CONSTRAINT log_logins_pkey;
       system         stilgar    false    175    175    2450            g           2606    16641    log_updates_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY log_updates
    ADD CONSTRAINT log_updates_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY system.log_updates DROP CONSTRAINT log_updates_pkey;
       system         stilgar    false    177    177    2450            i           2606    16643    pk_menu_users 
   CONSTRAINT     e   ALTER TABLE ONLY submodules_users
    ADD CONSTRAINT pk_menu_users PRIMARY KEY (user_id, mid, smid);
 H   ALTER TABLE ONLY system.submodules_users DROP CONSTRAINT pk_menu_users;
       system         stilgar    false    179    179    179    179    2450                       2606    17137    pk_module_i18n 
   CONSTRAINT     d   ALTER TABLE ONLY modules_i18n
    ADD CONSTRAINT pk_module_i18n PRIMARY KEY (lang, id_module, key);
 E   ALTER TABLE ONLY system.modules_i18n DROP CONSTRAINT pk_module_i18n;
       system         stilgar    false    189    189    189    189    2450            k           2606    16645 
   pk_modules 
   CONSTRAINT     J   ALTER TABLE ONLY modules
    ADD CONSTRAINT pk_modules PRIMARY KEY (mid);
 <   ALTER TABLE ONLY system.modules DROP CONSTRAINT pk_modules;
       system         stilgar    false    180    180    2450            o           2606    16647    pk_modules_users 
   CONSTRAINT     _   ALTER TABLE ONLY modules_users
    ADD CONSTRAINT pk_modules_users PRIMARY KEY (user_id, mid);
 H   ALTER TABLE ONLY system.modules_users DROP CONSTRAINT pk_modules_users;
       system         stilgar    false    182    182    182    2450            �           2606    17145    pk_submodule_i18n 
   CONSTRAINT     x   ALTER TABLE ONLY submodules_i18n
    ADD CONSTRAINT pk_submodule_i18n PRIMARY KEY (lang, id_module, id_submodule, key);
 K   ALTER TABLE ONLY system.submodules_i18n DROP CONSTRAINT pk_submodule_i18n;
       system         stilgar    false    190    190    190    190    190    2450            q           2606    16649    pk_submodules 
   CONSTRAINT     V   ALTER TABLE ONLY submodules
    ADD CONSTRAINT pk_submodules PRIMARY KEY (mid, smid);
 B   ALTER TABLE ONLY system.submodules DROP CONSTRAINT pk_submodules;
       system         stilgar    false    183    183    183    2450            �           2606    17432    pk_system_messages 
   CONSTRAINT     Y   ALTER TABLE ONLY messages
    ADD CONSTRAINT pk_system_messages PRIMARY KEY (lang, key);
 E   ALTER TABLE ONLY system.messages DROP CONSTRAINT pk_system_messages;
       system         stilgar    false    200    200    200    2450            }           2606    17638    pk_translation 
   CONSTRAINT     `   ALTER TABLE ONLY translation
    ADD CONSTRAINT pk_translation PRIMARY KEY (lang, module, key);
 D   ALTER TABLE ONLY system.translation DROP CONSTRAINT pk_translation;
       system         stilgar    false    188    188    188    188    2450            �           2606    17166    pk_userprefs 
   CONSTRAINT     Y   ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT pk_userprefs PRIMARY KEY (user_id);
 G   ALTER TABLE ONLY system.user_preferences DROP CONSTRAINT pk_userprefs;
       system         stilgar    false    191    191    2450            {           2606    16651    pk_users_sessions 
   CONSTRAINT     h   ALTER TABLE ONLY users_sessions
    ADD CONSTRAINT pk_users_sessions PRIMARY KEY (user_id, session_id);
 J   ALTER TABLE ONLY system.users_sessions DROP CONSTRAINT pk_users_sessions;
       system         stilgar    false    187    187    187    2450            m           2606    16653    uk_modules_mshortdesc 
   CONSTRAINT     W   ALTER TABLE ONLY modules
    ADD CONSTRAINT uk_modules_mshortdesc UNIQUE (mshortdesc);
 G   ALTER TABLE ONLY system.modules DROP CONSTRAINT uk_modules_mshortdesc;
       system         stilgar    false    180    180    2450            v           2606    16655 $   user_unique_login_by_country_company 
   CONSTRAINT     t   ALTER TABLE ONLY users
    ADD CONSTRAINT user_unique_login_by_country_company UNIQUE (username, country, company);
 T   ALTER TABLE ONLY system.users DROP CONSTRAINT user_unique_login_by_country_company;
       system         stilgar    false    185    185    185    185    2450            x           2606    16657 
   users_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY system.users DROP CONSTRAINT users_pkey;
       system         stilgar    false    185    185    2450            �           1259    17755    fki_survey_results_detail_fk    INDEX     �   CREATE INDEX fki_survey_results_detail_fk ON survey_results_detail USING btree (id_survey_result, id_survey, id_company, id_employee);
 -   DROP INDEX hcm.fki_survey_results_detail_fk;
       hcm         stilgar    false    218    218    218    218    2450            �           1259    17749 ?   survey_results_detail_id_survey_id_survey_result_id_company_idx    INDEX     �   CREATE INDEX survey_results_detail_id_survey_id_survey_result_id_company_idx ON survey_results_detail USING btree (id_survey, id_survey_result, id_company, id_employee);
 P   DROP INDEX hcm.survey_results_detail_id_survey_id_survey_result_id_company_idx;
       hcm         stilgar    false    218    218    218    218    2450            �           1259    75278 
   ik_helpers    INDEX     �   CREATE INDEX ik_helpers ON docs_library USING btree (doc_id, lang, doc_classification, doc_type, doc_review, doc_protection, doc_owner, doc_location, doc_origin, doc_retention, doc_status_general);
    DROP INDEX ims.ik_helpers;
       ims         stilgar    false    243    243    243    243    243    243    243    243    243    243    243    2450            �           1259    66945    pk_proc_rel_history    INDEX     �   CREATE UNIQUE INDEX pk_proc_rel_history ON process_relations_history USING btree (type, id, parent_id, date_creation, country, company, location, date_modification);
 $   DROP INDEX ims.pk_proc_rel_history;
       ims         stilgar    false    236    236    236    236    236    236    236    236    2450            �           1259    66936    uk_process_relations    INDEX     }   CREATE UNIQUE INDEX uk_process_relations ON process_relations USING btree (type, id, parent_id, country, company, location);
 %   DROP INDEX ims.uk_process_relations;
       ims         stilgar    false    235    235    235    235    235    235    2450            r           1259    17370    fki_companies_users    INDEX     A   CREATE INDEX fki_companies_users ON users USING btree (company);
 '   DROP INDEX system.fki_companies_users;
       system         stilgar    false    185    2450            s           1259    17364    fki_countries_users    INDEX     A   CREATE INDEX fki_countries_users ON users USING btree (country);
 '   DROP INDEX system.fki_countries_users;
       system         stilgar    false    185    2450            t           1259    17488    fki_locations_users    INDEX     K   CREATE INDEX fki_locations_users ON users USING btree (location, country);
 '   DROP INDEX system.fki_locations_users;
       system         stilgar    false    185    185    2450            y           1259    16658    fki_users_users_sessions    INDEX     O   CREATE INDEX fki_users_users_sessions ON users_sessions USING btree (user_id);
 ,   DROP INDEX system.fki_users_users_sessions;
       system         stilgar    false    187    2450            H	           2618    17524    content_text_control    RULE     �  CREATE RULE content_text_control AS ON UPDATE TO content_text DO INSERT INTO content_text_history (id_module, id_submodule, lang, content, majorversion, minorversion, correction, date_creation, date_modification, user_id, country, company, location, ims_registry) VALUES (old.id_module, old.id_submodule, old.lang, old.content, old.majorversion, old.minorversion, old.correction, old.date_creation, new.date_creation, old.user_id, old.country, old.company, old.location, old.ims_registry);
 4   DROP RULE content_text_control ON ims.content_text;
       ims       stilgar    false    201    201    201    201    201    201    201    201    201    201    201    201    202    201    201    201    2450            I	           2618    66947    process_relations_control    RULE     j  CREATE RULE process_relations_control AS ON UPDATE TO process_relations DO INSERT INTO process_relations_history (type, id, parent_id, date_creation, user_id, country, company, location, date_modification, user_mod) VALUES (old.type, old.id, old.parent_id, old.date_creation, old.user_id, old.country, old.company, old.location, new.date_creation, new.user_id);
 >   DROP RULE process_relations_control ON ims.process_relations;
       ims       stilgar    false    235    235    235    235    235    235    235    236    235    235    235    2450            �           2606    17750    survey_results_detail_fk    FK CONSTRAINT     �   ALTER TABLE ONLY survey_results_detail
    ADD CONSTRAINT survey_results_detail_fk FOREIGN KEY (id_survey_result, id_survey, id_company, id_employee) REFERENCES survey_results_header(id_survey_result, id_survey, id_company, id_employee);
 U   ALTER TABLE ONLY hcm.survey_results_detail DROP CONSTRAINT survey_results_detail_fk;
       hcm       stilgar    false    218    218    218    218    217    217    2220    217    217    2450            �           2606    17769    surveys_detail_id_survey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY surveys_detail
    ADD CONSTRAINT surveys_detail_id_survey_fkey FOREIGN KEY (id_survey) REFERENCES surveys_header(id_survey);
 S   ALTER TABLE ONLY hcm.surveys_detail DROP CONSTRAINT surveys_detail_id_survey_fkey;
       hcm       stilgar    false    220    221    2226    2450            �           2606    17623    hira_risk_level_i18n_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hira_risk_level_i18n
    ADD CONSTRAINT hira_risk_level_i18n_id_fkey FOREIGN KEY (id_level) REFERENCES hira_risk_level(id_level);
 X   ALTER TABLE ONLY ims.hira_risk_level_i18n DROP CONSTRAINT hira_risk_level_i18n_id_fkey;
       ims       stilgar    false    207    208    2208    2450            �           2606    17208 
   fk_modules    FK CONSTRAINT     k   ALTER TABLE ONLY submodules_users
    ADD CONSTRAINT fk_modules FOREIGN KEY (mid) REFERENCES modules(mid);
 E   ALTER TABLE ONLY system.submodules_users DROP CONSTRAINT fk_modules;
       system       stilgar    false    2154    180    179    2450            �           2606    16664    fk_modules_1    FK CONSTRAINT     j   ALTER TABLE ONLY modules_users
    ADD CONSTRAINT fk_modules_1 FOREIGN KEY (mid) REFERENCES modules(mid);
 D   ALTER TABLE ONLY system.modules_users DROP CONSTRAINT fk_modules_1;
       system       stilgar    false    180    2154    182    2450            �           2606    17213    fk_submodules    FK CONSTRAINT     }   ALTER TABLE ONLY submodules_users
    ADD CONSTRAINT fk_submodules FOREIGN KEY (mid, smid) REFERENCES submodules(mid, smid);
 H   ALTER TABLE ONLY system.submodules_users DROP CONSTRAINT fk_submodules;
       system       stilgar    false    183    179    183    179    2160    2450            �           2606    17218    fk_users    FK CONSTRAINT     j   ALTER TABLE ONLY submodules_users
    ADD CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users(id);
 C   ALTER TABLE ONLY system.submodules_users DROP CONSTRAINT fk_users;
       system       stilgar    false    185    179    2167    2450            �           2606    16679 
   fk_users_1    FK CONSTRAINT     i   ALTER TABLE ONLY modules_users
    ADD CONSTRAINT fk_users_1 FOREIGN KEY (user_id) REFERENCES users(id);
 B   ALTER TABLE ONLY system.modules_users DROP CONSTRAINT fk_users_1;
       system       stilgar    false    185    2167    182    2450            �           2606    17167    fk_users_userprefs    FK CONSTRAINT     t   ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT fk_users_userprefs FOREIGN KEY (user_id) REFERENCES users(id);
 M   ALTER TABLE ONLY system.user_preferences DROP CONSTRAINT fk_users_userprefs;
       system       stilgar    false    185    191    2167    2450            �           2606    16684    fk_users_users_sessions    FK CONSTRAINT     ~   ALTER TABLE ONLY users_sessions
    ADD CONSTRAINT fk_users_users_sessions FOREIGN KEY (user_id) REFERENCES rolpro.roles(id);
 P   ALTER TABLE ONLY system.users_sessions DROP CONSTRAINT fk_users_users_sessions;
       system       stilgar    false    187    171    2144    2450            q	      x������ � �      s	      x������ � �      v	      x������ � �      u	      x������ � �      y	      x������ � �      x	      x������ � �      |	      x������ � �      {	      x������ � �      h	   �  x��V�n�8}v�b�E�[�|�/��:M�&)��[ ��(�M
$�&����{֩��h��Ag�s����m��-u3��Y����+3)&*��+�M��U��:]?�?�#�]�1��H�re+��$3^�;�դ?�`�u|�@ip�+�)�s+���%�d��ftߍ������ܤ�3�oCK�DJA) �Z&�2�@�a���J뤊OkGVI�B7Rz���(w�������N2~�2��g�b~�e��Hg��yKfm�Sz>��ǻEH�L��F0y	�\.�1�˔-[nDځ�z${Z=���d�B�p�����T�Y�,�&f�w �R��i4��4E"70��M�N��)�?���`��	7��;`<�ȉ��R@;@�u�	i�h�q�-Ss&!�F+�&>r��[���t,��5��sm"�W<��Aft�b<$�WZ%z��g+@�ʄ�'�Z�$g�����81z���dKEVq�x�B���e,I���B.߶�t���<u�98I~��.���o"qS܀��-����s�z+�=�,w�t�\ܘ�Sfؚ�/޶h�+D��vj�;l���_�B؝BO7џ�˚!b$��� 2bI�d��_�_V��T�/\Rܡ�ko�#�J��S�Ɔ�����M��Bߧ��B�J��n�-Ң>3�T,���耐V%KR\��s=oI�����!���V�_��������"��8j�C-br��߅���z=��E�a4�Ct͛��7猪�q)P��ț9�_���f���؈,o��#����v�i38���68>�����k����D�-��纸{埀�w�/a�t�3��-�E����T����ѿ_nP���no>~~�����_�)~5�SR&�|J'AX'��_m3ÿ�zh��\\\� �CB      i	   !  x��mo�:�_�OqĴ�j�N ��֭���jܽ���ā�&�����
\(0u�-=EJ?���s|�jCI��K"+��ԃ�����2D<)���g�,��~��)IH�S�+"��䞸��/Rڗ�<%��x<ɳ�S�⑛���φto#�P>0�!��p!�D��㧐�(32��A��Y��``��~V�S���b��[P(V�����8ID��L���e�2xgێڐ���?z����׽��˯?ο��n
ճv5�S�J�n�g��o��\L�
�Xƫ�0��ڹms��j7�Z>��јK���^�)1����L�bhEp��R���!r��5�k~QX燓B��y7Ic�{a-�~�#?��?*v�Tۥ�&���2��]����n����7�f��UE/CK��h���ۚp��z�|z��1��.�"Pz&���R���r�c�TP�L�7qc��8I�����0�� ��y@�a>Cۧa�F�^�Z������$̖j���r]��a��{�M��=MB�ՠ�N��N'����j1�ř����ck���w�p(���w�B�0LE�)�JX�J�B�fŪ8k�&�����8��MB���ʠ�τ����ѝN��[��I��w�[#�$R��]���]j�&�Z{.��y�Л�^��/:���F�\G��O���4��u]��+o�ʗ�����"��0�s��ڎ�3��P�A�V>�p��������OlL��O$�ܖt>�"��(���^�gx+k�V�`= �;nܐ9%mX�MJV���v�Alô�RFk�j��V\7Y�΋u-t�p{}B�����6������A	��������~�6�Y.6�k.B�y�~}}}}}}}^���g��f���3Cc���@�A�A�A�A�A�A�y�cm��bZc&E��o~}}}}}}^9�le��b�D��@��K!l[����hf.�������Q�Q}�[��M�#�#�#�#�#�#�#䣷�G�6Z+���������s��5]��'e���z�����\B6�Y��� �=9�th�D�^�(w�bß�=�zV�o�,ѥ�Yo�m0���U!�f����Z�՝
�ubY�A�&�B��H�Ԁ��x�P��7�뛑c.oF9x3z�Ļ�I�^�%�%$��F�fأK�����<b�ߒ+��䃟+^P��Ǘ����45{����n,�hN�Xu��)������d�|�rȦ��0�	�O��@�e���4|�|<�y�y�y�y�y�y�y�y��Ci������#&��J��ϦW�4[999�����      �	   �  x��XMo�@=;�bo9�b�*7��*_
�J�l�Y���N�O��襩�C�����]�`�S)BB�y3�f��|�
��D��LF	{ǆS�:Q���^����Q����'��I/���?��w}��^M�
	�E(�Ks��U��u��&�fpWL�X������y&�r�oˌ��]���b�Z���"\ħ~ ءf By�X�Nr�\&j��+���<z*R6�Y.f��c��A�B�]�,��:�8aY�4��	 �gx�z���L2c^<�	ױ`q���,/�\츑QMIM��!��$<���,U��S��`)��ų_�q�t�!v�p��UX�r�;���R� B��eS6�SB�$���:�-N�ty����Q#����˘���b�e���<�h��8�8/��:��$\����P|�c����iz4z��^�VN�*_Q1̴tŜh
�#���P9��s�ʝ��#���>��]�Z㬃{�R�h� �� Z���+j��!CEN���.��술�.6_�(�59�2,4�����O��<�aN|Xٜ�h0t�y1���_r���Y���]�`��0v�N�&��NO�@�5�R#����V��Xh;^�V:�;;D�H�tZ�uÕ'�PJe����+/���"1��,�r�ts��H�r&�l���T,Z���w7o	{�������FF6�	=q:Y5p�A�.vA��c��wW�n8j P @�b��6ܜ�t�(�wY�}�[�]\�wA�m���]�v���!*d����T[����x����Dvg.y�F'�?�l7<[����3:�|�	39�ϖ��˹�����X;��i���-_�B(=/�4�9w9�7V�c��n����G����+�aS�l�=$ʾOPN7��ZbD+��	[t�Hn��W�D�"����֞�B���[Q˒5d��y�988��Z
�      �	      x�ͽɒ�F�&��}
��]3]3&�0�.RCIUj��mFCF �`EB��,RoS�Z�7��u��/�~�1��{I�[��E"%���g>�a��jN�ث���t�d�$�vl����sr�M�o��Y<y�{��'�y�ӥ=v��*9��ù���>��}��O���9��K�kN��n�%��?^���7?~����~��3������0��(�R��W�������W��o��ߠ�|�U��|�*�W�HPq�e����?��ܼ�3�<�24�R������w;���\~�4�������Ïu_?���}��n�m���$�r/��k��`,��/���Mw����=�G�{�@��[Á��*2:� n�����F]������U6�_1\XЈc��>���fӾ�z�?���ql�����}Z��=GU�0&�����`�	�ט\�L�5~�
',B,Xt��]��*[��eS���c��������Yݳo&t��w|��7��+����#�8{̱A�Be�%��}�{�W�ʪ,�Q�2�F���X��8k�m���fs�vJ�,�ǐ|��Qd�}��9
�)3��"co��3
r�q���\�
CQ�$�(�ﻧ���	���k��K������+������׈�OWIy��-����nS^"@� Ѧَ�;6�8�ϝ���C����Gt9�׷�O���?��=*9�[�7l@Xb�2�LAȿ��o��D�d�5�`�����Q>)����2/�m+����@�j�p�Ի}�iʕ۴���T��M�?��%m�7�vsYQg�q>�GHQ ~q� �ݟ��Q��kT�y�%+��m��fs�v;ּp8�t�~^z�!�p��^9��J�2B���͐�O��!�|:7��q����P!��߶�~JX�����	�/��yGnR�7����(c�F��/%G�����$��=�%cBV������]ed�Rє�"AQĨ���3}�N���pg�YS���n"T3�&8%4b�J�D#��S'���(���yS���N=<JIn%�WVhj�%$S0\�$|3��4-�(\_�=<���XWM�f}w�$G~��nѸ ���a��"��D��]���	�	�T�4/#Pt}��h��=<�{��9@)-O|����*�qb5lU�{�q��qY�MEa%,vM#EIE����z~�Η�^����4lӌ\b9�&˾Q�M&0�+ؚ;�"ķnx�}+�C}�tK����k�i����['n#�,��� <��uk_�����v�]�W������q�0-�3��w����,�S��?�\2o/�h�򍫪�_��;�k��R�a/�0|MJ0\#��>`���e[�	wq�@ܦ*
�Eq�:`0P�1��"�F����ݬ-�^[|�]����׈���,�f��s��p��50_�X�b�k.�HJ�(,˾Ѐ�\��-��˾��k���;B�$"dWQ����vƽNny���gn��s�3�!ysX��N���?JM����q���]$�b��5`l���������7'nJn�n���7�7�]A�oo� �#����*�eW��������/�.!����[�]%/Op�.���wr�$��0���!������;�1���W�Ga矚'e[o��]����ϭ/n*ss�,[&�\yF�3%�F����MV�p#7��q��������ܣ�ZU��_���q�}�)A���EC��\�A$(�s�E�o4D�98�F�ܪb�ji;Dnb��ô�u���_�=��	�w�&��p#(d[��H�$&�0vc�����H>t��s���������(h���(H�գ��s�d�Wn�~>�O�ţ��S���5)�<B������O}����_Z�b��\��@�.���Yqj��s���H��E��(BP���,�CAWPl@>qi��> ���� 6 ��y�~���c�kA]��E�pm�.9�#�R���7wqZ���L�f��O����?�^T����	����~�A��c�a*W��kQ�O�|P�@@Ab���m\�Ҳ�ۄ5��=vp�Z�<qc�w�R��'�X����<FW#�v��������
a��G�s{h-�QPqI5ڀY���uQUB�̍�����8_��,��������,h7pj �\,����XAP�%x�8��{�-��h����]Dl0�˱��\���'��*w���@¶�:�0`�Y����
ݐ{=;+34 LRa ���G�P��(�������t�G�i�Qvͬ�a
�e6��N���.Ǳf�֛�����m`V�ع������&���՚q����D@s�|�=׌����#)�7R�٢W��R����I��t�]Ҟ�c��x}��)RM����	Mf�d�6�jDLa��_n�'_4�s���÷AX�vg�#if��T�\qy�ښ�HW�pG�Oe*iA�<eq�lMA�Cל�C��!h���X��TdA�ؚnl�]�i��ѷTdl1S)J \�8N��)E�D���[,�f���)@�W*�0%_9���$�;X�?�j�o��S+/~�7^��1I�3���HX�ҘZţ[.�dPT̡�؜B�{�Z�Y��d�>+���S1([S�����,eD��+��¦�"��h��M��עAî���9�k���'Ȗd���iW��P��]}�ȼ��5ܿ�/����Nvu��=b"�$!;�3�"W,
ؐ$$Ͽ�k_3LhF!��طOM/L-_4W5�P�Q�&��Α�Y%������G�~(�qh?H�Ti���XV�(�;^�^��
���aO!B�E�P�f�L���S�v��),��q76��=� 0}�RL��2S����K�R�A���
���.���p������I� ���$ w�Q�Ÿ�S�.��P�7�����`tͭ��h
�+�<���
��7�A2!w�&���4�J�!�f��}�k6���X�#��j����0�q>��wh�|Q���1BB5�I؎9LeB�Fw�t*����M�?P&�0�A�5wfT�]�*n��t�hh^���K0΂��BX5w�\�Vq�ZS��mdȾ�)b�T}K�|�ܡo)�V��5};�;���]��R��!�h�X'�W%��/Bz?\�>9~��/U̅%��C�����<����YSNC����� �|	o�P�A�r�0h	�:�z�<4���:<;Y��2x
��@+~U�@�9n�sE}�J]� �;B,[��S3�5��zg�>�w<���q�W)���[��FqlE��
U�0/�9B����2xU�̵ Aa�BUv�sS���ƪ��Z
�;6}��C���x+�p;FA�Ĺ5���,lϢR�>�H�oS�����A��5��*�@�5m(������ڥV�	�&���`�X���Q�}�_\;[�}�;72[�VB{�jD��\�Èd�5�R%d5rܷ�/{q�j��~�����6H�3a��ugJ(����z0���{��[ò�ۙ (�a3({I���YS��f��C�ov��'��7�MQ���$xa�1Ip\�eD�������.F�`��>F�hĊ�	ЏU^�Ⱥ��,�p�Ԯ1mJ��	�]��D�VL���r��/�����w���o[�
$HM˨@����?���2zGh���	VaŚ�e�#�gU,�5m��D���$\�fC=b�����rQ4�ҵ9�ǑV%]j�O���;���9a�Ů��!I��%]S���BK��W�Q1(�,~$z�� ]U�@�tl�P3����R��e�#��S��蚒�_������� n ܪ�sV�n����з;�(�=
˿��i�Dkc��5���ճ�x$č�Xϑ��a@rH�.��$Z2��D�t�<U�)7V��׮��w^	�A
��.H�p\����G	i�/5�O 
@��UZ�	��s2VR�5X���w��ӥ!	Yn$��t���Aj0����DuI���`����$[��k���\��_/MT���a�cn���u �������:�M��{�x��    [� �E���IZDź�j������J$��am*�a��B�C�U��p�0v��c��yS�ڵ�ڜ8�..A�J�k����o��Ƽ+���8HJQ+6�A@�i��\\�����ߚ^����BA��u���˩,�+d�	Q�u�QRM��^'�0��i��5�= �M�w'?��+���h�����Q��|�RU~a}[�C�Q�������;��;$��d�n��#�&�.�5�bK��5-���WY�|�7�<���:48� <�㜧|M�oۓ��Ik/�%��|���̤2��*z_J*Il���5e��P���ًV�n��.����t+�H	� �F
4������4��I��=��v��k¤�,a%7��f�z�[�j��h��8���ٕj����T����K��
T�5}l�@t��'u�wm��Ue�ET�	�Ul�4_hOH6ݮ����T�VUP9�&C�/��1��P#�}�Ap���z�]G/$������/4ٲ�p�^��!�z��*�^��xy'TVdP9t(���f�*5@�T����6���u���C����q*,����B�X����U� �?5��_��tH�bB�FD�l#��僫$\�욽d�z����ہ�7F��e6���c��Vi�-z�C���ߙELH�ƨ-�&0��<�tP,q9%��a�!9��_M|�U����*��&O��k�q���Rn�S���[`��xU���Ȳ+�EPa�5�LI e�P�[��J(���4�*���)9o�0��������U�	���H�Zs�Ӧ9l����/PZ�?��XΘSq�(��E!g�a�2%L��(*��"�\Ex�rAV\�I�7}s G�`Z�7��xp��s��<U#�Y�(s�$nb���f+��
�}��+P?�\��Ev�r'�B	PE2��
ުJ�fv#�Ol�čT�ERq�UR�!Մ`a�9L(���"�x�P���>5��o0��dN��9,�S�Hn�NѾ�g-
�XN�X��TC��	�0��y/�s��C��
8q�AHE�����
\�C�::�]�Ⱦ�,��j��"䰉�0��%�*Y����w]���M"�*Y{�(�>!�4��P��gk��\��d*�0�8d�G�����J��p*s\�Q�,�I?��R4��� �p����jѷQ'�0F��S�U���,Ad	}$F��)����À��y��8�D8 =���;l<�$��
�0�h�r92iA2}^!�0o��J ��@h��u���R�!sw���#�;�i�=�v�>����T�b;rA6�㋇-L�䥧�C_�0���v�.vjO�f=�'�.['�}/�������ҧ���$pĸ@�4���&��9C&4	�.��*h���6)S��yj��AO0ĳ;D��JGYa7��鲟�c�L�{0�k>��:�S̯�Q���j9De��az�h�'�
�X91�s��zw�&G�9��i�0l�@Ï�3�0���E��ů�d'���Lݎ�I���H~�O\���G�ǁ,��V�:0��"��=;p��7�pټ��5���]�g 0��?]���_a@x��t4�,�O���T�(�RՌ� 5�z�߮�"�E,��X�������U����p S��:A3f~08S��Y����2ZQ�ryx��f��4�5�$���*�HE�]lyHM�mQq-��N3��^�g�V���J��A�74�D��*G�<f�W��)i�~�K�'�-O��/8.�WYi$���;}h��6a���:?8L`���T�:^��ه����.mC9�HTO'�pa����	8�y�![�t�۳$1����4a�{;\n�1�]V)t��)�럵��E��KE���H��:i�ʙ��ݶ�t�i~����Cء��(�����(��=L���X���>0���~ٸ�^��Q�,j�%4DU��yG�P��;�8�nY�$8�j? U#�0#�84")�Y��WY~�m��(��"�&d�'MH*�ŋ�W�}�����ʯ6�� �#!�P�T�؋�ū��&6�-��j���ԽN����%�o���?�HT�&IE:$��]�&�Ψ�10AJ��2�/�c:īF}'
��P5c`6�84#�E�`T�r=�Z���'�GՐ�IP�А���15�x��h�zxc;1�nveݞv�����hj�P{8ÄT(�o�Τ�VÊ.q�U��EJx����yEQ��1��40�Kʔ!arFk��G�᫭�����U����S�a�K�0�`���GT�B��P��B,6�b�JtS>�C�lH�L�x�O��G�*��,(u(���ƀW����{�xW�L
RK�`H
"��19�W)�4�V�+ȫעH"e~`�
,�����0�Kl�ŃW�h�Y�%�]����w���3\?�JE���%�1S�"EQ%�x�0vT�2��_�0X���<��x�l7	��)'��z�m���~]�9��1KN�k��-Aī�A��F:���Y��e�x��g���
-�R1˝Â�>.(X��&{��m-h�co��rH�޼ϊ1G��	�V�,��6�:�.�*)�8=$�j:�DC���;����p�H*�1�����tl����[i��x�ö����*����JD��o��.2�
J�����Q�ͱp����Y2��Ϗ������z��,fy��)9θ��*���1�p�C�*�0a�,��I�Q1r�f�.�����~?�1u��R�2a���(�".�<2P͙X~C�]}�Yޟ�9�ch`�\�i뽁��L	vdDsWD��Fu�ٱ&�sc	^�HH5�z���3Ȃi8z�ӥ=
�"�CP/�Rf��w��&\ yaFJ��F� ��:�ۮd�:�}8(Vq���#L��H�l���p�n^9
��e��97��6S6L�)�	͠f���③J����,�:7=��s����ʌfa7Ʋ)���¢����R5����<�#����+�y�����pK��0�L$��TN���K� �]�ҋB��9
t3,�1�R?�R����T�i�Ż}s��BW����[�JΕ[�|.�-t+sjP��]��k��e�A���N��8a42O)�\
8:����g��f��3Dt�-=�_�ъq�:1s����@?����~j��`
�V���
�i.�cH��V߃A�[4VE�f
..��<��������Tj��s��$���7E� 4ق���r�8H1���@�l-a�v�:�(�=v��0��T������s��Q��13�n܈�e���->���AvRfGsQʕZw�L��
9�޽+Wj
�ʃnCf��P-�P�:f�"K�����Z��Q�/�����|��*l�웭8&��?��>tg���_]�JQ$E��\t����ܡ�>l>�A�G�$��:�(pI��E���D�i|���\'�����t���^�%s
Qm�m������_�FP���dK���(p
���4[̘�Φ�v�R� �I* ZI��rjrK! �&E��A�R�T��X�[��\�M��H]t��-!Z@A/߲�E[���a��?vi��_�k/B�nI�B�薱�#��C6��n�}�/Cn�	@T���wn)[�tM�`e�t'r UЩ�Bv�
vfd=hny��y�4��l�8�7�f���8d^D��p��̟�Z�!E�;rS���\����U�����C���'�	��R^;�?�ôkM�x�Vn3�J��xYd:��D�A��YXZ�\��胟i�.?���}Յ����XDa�,s�����&	2잁ʡ����\+,�e.��h{�aU�� {���/��D�2��T��|O��m�UJ¬�%�&qɁ�R^��[�z1i��ar���ȠJai�Sw�i���Y�'H�-�0(H���ei5s�8���~ͬ*2d�}�`]id�Fi���_���H�>���(����Aa��T��~�_�&��,#�T�#P�:JK!s;�K#ø����� ���)5�    \�HL����)-��H>@g�7)��4̏t��@�u\J��t���2��S���
 H38�2���������.�"P��1���鶑��� ���e܍\S鎌ٵ�i��rƐ����;���\2� ;���'xh���!�m����!����c7zϛ��96���~N��+�;���( ���޳< nIF�G��l3���$�� �a~��@L�ؠ8<��v�����ޕÈ^G	�(�~�È�Y�:��BY G��?`�f@l�0p������ RZ�HZ�ʁ��%
�0����C�TCg��H!6�I�?x#O*�@V��mc#Eod�-ld��؍$��L�дZ����U�2�>���1��0��R��/$��:)7�0�����Y@�0&F&dKn���C���Jl��Z�˶�2�:i>��� �Кx����d�
kt�E�yo(B<�5fC��J8�dɐ�����@"$�J�y)E}?!iY���6Ew�UPl��%}Dy6�N��N�{6����+@�	�ie��V��R�`���@�?h�Z@�l'U��*A�&�8��t:b�,���U�?k>6���	�������i�D�v�;��/�U^�5? 5��M�
 �'�7����)�%���ӆѬ�z�ʚI���Sf�!W-m��
�Q:pRǎ�_~q$��"l�J�r�$~9�\�8�Pvt)|d�� 4�7�v{�N������aZd�b"�E��D��lt_1�Ap�����'��6،���Ca�ȱjVh0h�}�(
�HJ
�Gp�����Z%%¢����<9H�{f 㩯�C7��>�w�Y����es�	Ļ���'��,�^`@��w�]!&�4�k�"��q����LAҏ��ss7eNVRW(D>9�r����^Rb^�1��׀C(n&A��;E���ˇS}�p�3~���_���o�n���˃.V_�]��cX!L�/R�ꤘH��c4ێ[�`w���Z9)��~�"
���z��/|ꡕlx��1��ތj����E�m��ꨄ��'НV�Z��[���oE� s�d�a�Ee�,4q1���
N��Zȿ�k	8,�z-��ۯC���[��[���ob���S��	}+�Tk�V����)�N�C�=���@��gh��/9&{"6�
�a�v���t6�&`B��s } )�\�K�܇�Շ�Ql��['s2�"��K/Aqm$I흔�Q���&��pi8��&��)��8٪ �͆[C�?24)��a�9�!�QV8-�M���~l{��� �?o/�O-
O�z7�Ecߨ�ä���|�<7�<�	k1���/$�;Jj/��]���Ȋ�ڙ���Q�.R�-��<���_Ǧ7,Y��W@�Xd�D���G(���d?��B��0w���R?@k!Kˆ,�!]�D����R�y��1��zT��=B!���6�
j���JXZN��ؾ�0���F�Ю���B��2)�TiYG�3�/ ǅ��E��eq������h�.����,����lS�'�RWHQe8�����wm:�����/Y@Z[K՜�4��lEb��	1�>��3�C�}��*�籆��fS����p���u��~��_��K��Ҕ�B�8�Ȍ�#Ѹa��^�6�B���Tyb�H���o�;N
�Հ"*����|��"��)�+�1|�C�ȥ��^���J\q�G��RCQ�Uk!zO��Y-�q�^�U�m�}�C\�>ԡ�m*pS�O���W��B�b���Q�P�h�W�_3ڲa7�r_���I���@��D�E�ҹ���<��R��n�0JJk%!�=����
����C�NQ�%� U'
�u�c~��
���J0����3	Y�0cP�l�*�kR\�Pa�=�> b囎�\���Y��\��܄�.�X�P��(��G7��&��{��Q�c��%�����+���#X�A�]�U�
�B��SA���FJ��}��W�?_��N�_K��/�@@R�����T�0���K�7��K�ҡE b�Uf,^	~����S��6�z�'$ϒ�nJu�BY��P�{(苁B�}XP�GI�k6�se�)�oU�]�	������ܚ��<�U�ܓ�_���P�C��o�{���U,ʹ3h%�X��'8%���8R�2�Á����kG�N]u�=bw�e2-�('-2~
��e���J���aO�9[�c��NI�cڤ�FTt�j':�@G�kL-t]g��˝6��d�0}���a0�?^��Sr%�oӟ�,JJ�DӢ��%�i�W� �$��1<����Iq]E�Kr��t�ҡ:=�m1�|6����h���b���c��Z�7Րe�U�k]�e��@�RX0=-sy�.�#��M���S�# BqrX��3�N�*��+-����;��q+�t�\��N�9��3�1����f�Hmr��|��d�M�ь
ʾzp���35�Ql� �=g1JR*0�0���"@���:#JT��k���-�\:u�\�iə ��S�y�,�t�qg�y8�"A�� d�H������
6�x�B~��f���~�/n��n�{�� ��U�
|�m�V��eKV�e��|H�-Dm�u�e�.OB_7��v�v�Ӽ�vF<a�H�/���iĬz��� �a�qhv�>����)jG�p�
�f��O�<�i��1�����6��7m�36�pW��Y�t5�=iH��݈!\{�j���t����d� ��Ƥ�ʁ���R%��3#r���`sH�/���"�|����"�f�^\(.�$�pZ���O0��)�l�r���Da_�JBۍ�2W��L7��c�r��CM'����*��`����J��37�w�m�m.���ƅ�x:ק7�ceo���|D�� a�����k�s����h�	"0����Erx��ͯD�q_z%�|%�,,�l��7I(d�p� �|)w�z;r�p7�{�oSp�ƛ���6�6T��C���t��C�Lǻw��������C���m�x��-��M��7�z���<�^���4�9(�+�)�l� -���)-�a�:��T(#wO�51� ~P��|h7��e��{Y4+& �6 `���7�@u�7��8�oA����F�rh�lM!��>�ʅ� �W��B?��qr���Bh@�ި�5�P#1�ƀ�;I��C�o��ڟ��N�V����O�?=��!-ʙ[�/�cO��dh7$������tm����A��А	#�	�;�������d��u�x�3f�Rq��V�������g��A��q$�ԙ*���=in�{���)+f��<oguH�jFTy��U=xd`k�M){娿�����C���Pmf�s���f��r�ߌt�xpA�S����TK�5��Zz�S�К��+��^�n�C]�c����p/�N�V�L�.Tt�*�b|Q\�c�.��~m��!H`���=FC'��-pFƈ�����8�������\�nV���_������xn�#�$�C�I�X}�?����
!���/�-�,u0�eS�|¹��� �uz��[n���n�s���`|�6]2;Z4��O
2�Zr&������qQ���+�p�!�ٽ�5���ݨ볦A��q��^���Ov���|����8k��������c�����{0	��!��[��@��e�Q�I�6�'G|�~�$��y:<TE�:w�!��+��-�V�Fs���)���%�G)O9 ���}����8\U�w��J,�Ъ�����
⣕�TW���O��"�R� �R�o��#�b�� �`���MT,(�����F��P��Dԯ^�M ��<B�#᣹+��:��w�ط��5�%\� ���s}�
 ~bS3>�>�!ĵ��9rȲ�L����K� ��P�\� ���[E�[usx���=�2�(���tm�m2�6+�Θ���7Llt�ֆ� to� �Aj}_��b	hݹ:���X��    ����s����K�ٶ�2��8Rje�)s�y��pj�QU����*�g���õ����uTI7�n.��~k[����
�����>����F]y�?37�{g�5��Lv3�_g�ÓPs�v�p(w9����ȈB�1�w֞�a����[A�i���B+p+X��W���ˉ�>W?]^~ك4֮v?w�4ԩ-w��	�u����o�M!ø6\\gsTy��#s*D�[Z$a��1Ns�oHR?C�a�7�R�T"��j7ɂ"�C�_~�����l�b���]��h��z�k�A�XSM��bh�s��#����=�	7,W� �Tc�O�q7�g�5ε�FK�lH�A5� '������xA��W9����(z47�	��$	I��gJ+ު�'���c���&��n]�S�P���}�<��Uo5��X|U?��1Z˥�r��>ֳU�2do��2h�u(�ߎ��z^!��,?�u �	-p�U����X5���a=!�uh����WbH�{���!�)�KȦ�:��m�[&ʲ��;LY]�Q��d��v*���@FW�%2kG
�(��U^�Μ{���h*?d��`�B` p�Yb��V��m�̯���y� ��.���U����+08@ez_�|i�&bsm�#9����sp�܀iE̓XB��)r�?��d�[�����H <l�#�'��x�h:ӳ����Fa_�t�n;�-����%�}̚Z�>�n���Z���_7K60��ŧZW:�g�X�;e�z�q-���`
5۱�}4�����f���A�4�c~ ,�{�>�z����%��%�5�%�(K�x�-OK���d�4��J	|eիq{C��`G�I�,B��`F9
�2AXj�#e Q̶��(�N1�fq�4y&l�92�Nտ�&�NA���\\�R@6t5V٢�.�y�@Q��+�u�j1����۠Z���qӓLq!�U-��O�nmD�o6�?Q��č�%�?�*���a�ï��+���B�YD�J�S7���/��]�C�g3/�(�����b_+���{nL�ۧZ�#���zܖ��	ϭ�-bfO�@��S��Od?�Tq�6w��K�ż�to�sg0�pⰏ��)Yo����gŐ#ֻ���\�W^3ȱ��ʼ�"w�nE��C���Aδm����8r�c�x5!��|R�p2Ii�~qfI47~��;��v��_�@"]�	�d��������A&���b����M�ou�h[�E$������8=��
hǁʘ��_���[��/����U��O��c��dܟ�]�S�x������c�X��k���t���n�ic)X������BQT�gC*�]������ؠ�YJ^h�Eʳf�4��lT�\<t!.����V��`�^ӈ�*�9*�v���6?עnQk
����ry��.�Uܨ�*���4�#��#DlHo�����ָ7��_�[��ZA2��� �߷��wÒ�j<Y�:WW��t�F��X@��+b��� h<}����\z���=
A�����Q~5��L(�-�:JW;�˯��I*�]7t)k�S?��$\���M��c��s����7ſ�������\8��%��51v�4.���\� �;��4u#"�,<��7zW���5����`�]��@��a�b4�ݰ�2���� hUmI��'��m�\���p�/�	��j�YA�ͭ�eY�V�*����`	��:٤c�����zi�^��Z�㪴֋�T�В��냴�d�%�A�|`�>Cc��H�DCk����x0�0��~^>"�9,�s�ވ07����1�Ĩe��I�i�ݨ#G\>�hr��d|�FA�u� �w������Z�J5�-�V�-fx)F3��ʪ-f8�
������/j�����p$.��oU�9?W���D��s%��K.��
�l�4�M<
[�c�N�%�?r*�A�X��k�I�X?q�����rv�m �d@G ��|ۂf$ƚ'%u�vۜ�Ͷ7kZ2�S��$$#!U 1W�,"���r�BJ�`�S����� eЎ	���u�����Ѥ��z9��nWÁ>���ɶ�����<pqũw~TՍ	+X�fS��u������#R`�q���R]/���¡^8���]*-8`��kgU$#G1�r�(��+ԉy��o�՗"�nn���>�Y�4Sڠ:��:�n��ʍy��&6݅���7f��E�B���+B����]6��veq����̲](^��y��=�%���OY	�<.�n��ȝd�tn��Wr�9�Լ�?�c���TA�=�>%K���.���	����w-�R�)d"��?���%��d�K���>-�Y�'��Z��b[�=L�b����*�LۧCm%���<������h�e�~q�CU��,A?b�C������@m�0�Oƍ����;��$����?��s��u �5��g�N ��, �2� �c�ļX�M�kzQ�V�\���ɾV[㐿PX��	���ʅ6	�9���L�qr�$��i}~sq����+#^ �6Ft��S�$���GV�4JV\��6�l�b�p��R��S�Q�e��U)��z�^��;���Z���~������MvwY��l�U�Y�a���7��?y����S�`��n�$"�DǾl5�d�JG����OUQo'Q9�e��>�_�2G|�=<C�ϓBG�Y����TV�����W�\4�2*d}�N�-e�&�q�7��~�v��s��A�>f���������0�E/T�k��WV������EK�,D W�3��_�����?��"c�0� �����vt�p$��?gK��2� V�V�~kc�0*���O&��Q�g�6]߹������-� w��+�Z"��S���ۖC�r�\��i�A�0\��T[}G
&ꥻ����C�>"FK��vNDL��)U%[���Pl�V���d�A�(��Vo��������\�c�ʨ�������A���S�@��W���3� hb�R�M�R0�\�*��1�h����f��y�6��0t��[Mo ����{�g��#8��gQ�pF�����7��j��!I5�l.Ei%����S��wl��(��oH9a���csv��l~9@���I���q�����B%Z˷g�rm��'[n)^^�!ǽ�os2��🲉ha[���C[���}mB�`��ʀ���8sjXF-���6�g(k�����P��}���3�s���Ҽ����n|�ǘck#��@����P�<�x��2����0��FK�XV��I治���޸�?)�����摗��5�We��\I0�Ʈ���?b�����4&�����E~ӹY�x��
c�k�[��2p��1}JA��ޮݏ�r�ʉ�Z�{=�(5ꊅ���1�\�-�O��8������vAK�G�u�E��)�������S���
�)P7	��z3�I��P�R��ǵ��P'w@�r"<���<= �.�������s�>|�pӹy=N��kCn�=��H��wA>o�`��R�RtWV���<���F����!Lú���u��Q*45ӓR����Wa_��QηpW�Y�5ӈ��b�4������#7�
lSZ@�D\�F��d�	Э��"�H�3?�xڔ�<���A͎L�/
�9�>���@�:}�SR���l�*����rf�f��S��)�b��5�66 n����W`�u�5h(��T���j�Ty�&J��3r���,��fU�t�M�W �G����QL(���;�¸^(��g�ǔ�*P��*{]D���1�e�K<)ۮ*��x�%J*���4�`1_��r��!R�N8�`ΐ#vta������ 5|�M.P�":��g�"�˳@Q��sA�#]Zb��P����/P:Pr�����Wf�~q����;�ح&Ut6Q�S���8����8�Lq�s��&�=���8�K��8"��(v�wp� �i�B�5� �ɼ�b&��(�������z���x��X�Uv�0��Ӧ`�&1L���A1ӇT������n�1    �������P�ydZ���iCK��bur���۵?]ڭBTgt-�0Tˑ-����,G��� %ID�[N�csͧcw��I��.e�ih�p��!4Qk��I�{&b�	�PKY��>��q�f��4��f�3�XR�ep �����
=NsͰ��pC�9��Wv1T�
�Qq�lo�;��og���y��o���I&�hG�H�UjJ��z����U�U�t��?٫�w͝ᘩ�9u�?6��\�8�yUE�|������@����=�w�Fav�Y��*�Ljǁ�/�Y ²�n|�C���_��'K݌����8F �G��V�����)��!Х��4���35�(���ܪ���݄p���^Ÿ�95��#EH4�A"����[���S���	 ��˸�iR�
���4e�Jy@sn�:�=�BI��2d�Clu�k�wo�壀�߽5�/2��[���?+�pqV��jY��q���8��
ꭋV9H:m��֢@e���HQ��8N�K��ߙ͸^%3�S�����w���-��ƫ�ɇ*���a1��@2��l�}�ڿp�W�9]žʻ/2����^>?��Tp/G���u�)⢺?v}r+^��&��:�q���C��V	�����оN ߖ��hOn����)�]�+�ͺ_$ܚ�Ƒ	��os��5����D��7�YQ �M�1�$+�c�{����	��'݆dB{���.}��)r�g�}@��<X#67{���,|ٽ�ތ�eJ��l1=-,eQ��چ	\��8��A%F�9KI��f}Φ���c<bZL�+���l<�.��"L����^(��b̯�W> ��Va��1�;�rtG�B�x�d<�D���q��R���U�@�B�
Ξ�J�YT�?�)�P�	��7�f��ہs�����yp��"{��b�+���e���3���(�c�X=�"_{{<��5�䘈�ɔ_[dF�K��p����R�����?��Ļ�8�z!��M:����lkh!�Ծ��࿅�6�-r:<�rj��n�(H �b��&4�>W�-�ͭ!p�(��d�k2��gW?է�!��絯��$���x�,��_L즠��X����5����S�y�V����8}��(���Ji[�Gڤ��|e�9��K�p[�|e$l0�u5�m9��|��(ב�T�0��z�$������]kꉃ]�ۼ�0���4V���%�꟧y��b!5����l�y�oHӝ,0LD;��:���<��%w�~a�%!->� �'���5s��6��P��3��T�ti>��ʍ����,=NF�z\=՛$�B�1Z�gz N����"����R��n8W?m���
�v�k��Q���ޭ�R����R���W�P�i�&�b�HX�!��M�w?sh��Ѥ��z�n�kR��PE.	#��;���N
�rE��+DzN��x��l��μx�Z��{g/��z�2�$u5��p���"������Z﬑:�B�D�8M�"�,)�0U��(�?'u�oൣYnS_N�?��I����E�����\ �Չr�����)mM�"{������{Ћ�sŷ�${ÿ��*�!U�r��R�&+nK�Rũ����Uaק���[�������gga V�ԅ|_�j�R~^B䒹s��]�P�
�5tEz[�"*&Df�Q�	�|���
��i�6�K�����D*��P캫��1~ZI���	i��������fB���^CX$Y1�Qj���D��b�f�]�P�l&p�qYqd��y��u��n���a~JIa,�a��]ZX��.9zOS6��8�3� ��oz��$���j�Q�V�~�E̼�r��8M�[�}'�R(�DoO���c)��e��Hn��KU��_b ���y��q>���-[=���2�`���L�"���a�W� �Z����b��0%��\���S���L�L�IV�$�0\�<��.�d�۱�A��/ �����D{q~�)�E�r�=�-�za�
��כ/lC�����[�v<rS�ǄʏU�R����3u�BHiL"��{�� �����[{�z�tZ(��sǑ���"j.KI޳������r�Iqm7���x"��=(�A��k�<���^(b�\���f��`R�^�v	KT6%+u��-4��6J�>#8�5�>�|��,�#:� ~�r�� ��ܦWisߔ8$xX�=��HGu�x���b��z�<q@�O��Q���a-e���")a`A)#3�O�#�^p{�P�sj�� �0� ��b��
8
�(�Ǖz<�'�$�m�`�t&ď����b4W	��lv�Sߝ�q<��o<#].򙑾�����������*������ ��;B��T �7y��QA������U-����Hn��3�%��,�.e�k����w��FE4\ajoZꮊ-��*e"U{�4\K_��ȍ)GrK��WQz&[�z��%��"��˅
t�3�v�I��+�@d�o(S;��������i~&��
�&d`�ai�0]�S7�`i� �l�d������#�}�B���j�N~@�4�Bd�T �A'�pG��
�B����s�t͌����d����o4]%	HU�G���L����[1�\ؠ�3]|��(B��W.Yx���(
㍗�9s	�~�Q�3��-�=� �$�枔�yH�Pl�q�"�sζulR`_�>0n(K]G�m!�"�q �z�4�b�ټ��n.?���1x�m���Z� ���[W�{(U9��S��ݶ�����l�/��*���ĺc@F��V���0�>97/���r$vMl�؜� �\��t5�<u��)���['	���]А�P1�[FP�<0�Q�l���x)I�Zb̳xC�$��L)��J199��,���nO��Y6�AY`#�(脅��<�������3S�iӴ���*1G�팒0��_-h'��!�X�e��?fd�|��~0�a��x녉�r���-�c��qj��M�V�1X��ιt/�K�I���EgLR�b_��8��8�v��[a2�
=�&S�H���ʐ\%�BId�u.�Lp�������r�o�@�X��)��V�Ѝ��z�4�"p`�@V�F`q��,��"c	���3�u62�w6���A�ґ�� l.��Nqq]���	�'������bN�-Q�}�@!�1���td�B@�ԅA9LE����:L��S�1S�j/̀GG]���ǱX�\'���|B���/�����Oë���P�	Ӳ�*gi2�r�#ar���u��T\���;-R<��i-�rA��Lٝ��tI���"�X(ܠ���خe���q]RU[~��s-_(9ӛXV���s�D�O;3f���$�}��D��;�>��ҋz^Ж�����RQ0>7��V���k�e�_��1��e5K���X-[�aJ�0�{�]߁�{�|� ���nz}e#��E�I�u���]��*�V��)��~y3-e��~yc,�u,r�苆'0� ����#6v�4`��Z4p�k-}Ƣ�*�[��%��'��{�h{7���K�lT�aAtH�ૉ1�qJ�pE���/c��s��3U�\#��T�8�@���]������)�Uo���k�}k.R\L[��i6-��3��X7S��J�gm�J��n�-,�쐖�b��l<�1��� �@@�μ�b��H���;#�]pT�G���\ h��Ś��営����~��}1T;���qx :�"���	�&]͞γS��`.�� ���XB���&���a���
�	�S9�{�<"?�S��킱DnW�8 �;m]���a���\��UA�U�(Fʣ����%\ˢ���2Ó�&�]�g�t�ڪpdn9���H]5�/���ڹ*��1�bӪ�#ʗŝ�̈d��U����q-K��1����w[�sY��b^�A~X��i�46�-�)�+���Ho��f�"��+�btQJ�?WF�%Q�rro(������	������8���O�*�\���E+k.';g*����<�}���@�+x'�^�������ߪ � �  �ց���M��gj2�>\js��[6O�^T�}i������ɘ`Jhj��e�-(��"e�ڂ��&�i:~����2+l��r�|�^��Y��q�J��-�����1v�f5N ��xe�c�+[��]x�+ͩ�Hx2P�Ɇ���(��{ȉN�����_�Y1"^��svs��}���)b��s���Q�7�+ Y�ʆ@a�P����@Ou�]�aN�����`HۯlaDE���႓m{�+�.���5�r+�Հ��~���t<TZ5�U�<5��R�]�J��qRTX�J��d�;y�)������~̏Y�(ڠQ���(�Y���J9 C��y(j�N(iO���vb"�%�E6U0j�ލ�&�w
f��8W���w��҃o�Q��x��`Z��C��\jh��0B�>v��6 ����RZ]�`&�=�A�g���撡�N>+x�3�t�t�
W�z�lG.Zg���GiS�Q�z��#��7|���|!^!�u�.�e)0�����ƭ!`�1a��I�?�5p����v�k��3꧴�Q���x9�X�ʄ�|�D�DN$Tʎ�Y�G�y�]9��(����8�X���Z�56̄`+U[P� ��m+ʁ�@�A��q��m���QP��>������b��10)�,�[�r՝�l%PV����o�n^p��|���M)1�87�����Qv,�\g��6����T8^ߙ�T�E�ŴCW����ӧN!�HU��=�>B�b�uŬۛ�����P���쏀���J�'8����js~�J�SvO��Be�>-a�\�vϝ�s4�E���F=4":\���	 ʘw�R3k7#Ya����t:�]����$c}}���SӞ�	���38��n�ޚ����S�߽q�U�pј� �>�E��Z0mɕ�s���&/���E�a�¡Z#`��
����\32���:/��ET��)�8�+���%1g/�rTA��־���C��^~}�Kq%�sĬ%���"Q�L݋fR��6"O:�<_����z ��B��X9ʙ���+�<�.tr�T�A���M˿����P�Æ��`ԇàGT�d%�8%˅�턈�j�S�}�j
�YL�k5o�P#0Ojsn�ݼ=�֌J0w&��K����:<|uG>'�]}Һ��ա'�����r�����&ϱ!�En���Ƣl�7�-�9�����p�uG��o��4#�����8���[{��z%(-sE~���B�D@�Xͭ���uc��zקя�Ďؠ�����| ��pIk�oN�ǇdJj�xh-,�Y����;���E�7�J Y�|��hy�yw2@`����e7�r�o��:�"I¸�?�.\��:%���f����bך+��\s��I �$Z~;�s������f)�X�r�����^�uM����ƈ2t`	r8�Jϟ�;��1kPƅm�o�ĵ�RT��$����`�t�k��N0J(�$G�!H�rB"�ec너�q�}�EaH�Bd�J!_��X���a�]��x/)�1���yG�0
HE�\��tV��o��1I��\�x�WF���BFF�(�l0�toۜ���y�O���ԥzORn��Bx�$��7�sp4PX�_=������cmm��|qn��U��W�K� G"�F*����~���p ����V�c��x�ca�1�)ƑJK��[N*���B��L���B�H�d1��(%NW�,>Kk�>׮YHd�� \�Eħ��E�H$�$Iq�]�$k���pt�$�4���3�C:�yΫp��X�?��@�A�t��-�?Ir!IIl�X���0���0Ι�U ��v1��[Q.*������-e(
��N�ƍE��.�,*Mz���xmHzko�0��
 ��5}�M��*"zk�}໠��=t���s+P�?s�$�C��*̛�줩,O��ޅD_ڄL�)�<V��+�_$R��A���0��'a�En��t�Ed$l4��/�FR��}�%Zv���%F@L��� mw)*��u9I`7G��?A��%2Q+l)�'� ŵ�
�g�ĩ�7)H�װ���!�*b��9�#bv����C�H��$�!!$��=�!e�H*�����1Ų��^��G3Հ���y�~��M���1���u���T��&���.���x�Z�Z�MAِ(<�8L���mlE����BO�<�eޠ(���:C4����P����"�-W�F֢�hQck�w]`ǲ�8���<�^E��ѵ�S��~)�'Q�����=<��LЭpX�,6d��JoYw\��fJk�D�75��JԼ1H: ��bxR���2P���R-{#6[����F���$����_8Z	��J~�䎪r�����xq����t�(�D��Л�*F���Իmg��bg$�	u )�j�1���s6cw��/6�\���+;��64��D�V4?���Ǘ_N�f���ϭtb�sؘce��$>��%W��a �=����:��v�����~ɡ~j-��	�^0f�"�g!&�L��n㳗��$̮7рk==�y�1��BXЪ@۫��Ʈ8����I?v���./���o����Q<�6b����<R����-�٧���+�L&N��O���1��m��7߃�3ӑ�:�M��#;7������AXH�u���r1�bF�ܽԆE��W<)������ͩ��?1����Y�q"'0{�T�x�r#6�[L��с�_Kj�vՉ�����;[%��>��*�؎.����S!� D��V�&;�Dz\K��ku���0�J�V���1C(�21�R�0����%p�PC�� �����f�̧mZ�`X�Q��q���!�zy��e��t@SH4�i+���0F�$g*�VE��L,a��w^.덜N�T]��]b�xZ�� �h=,B�a��=�;
L����Oh������L�q��ʞ������v=R�      k	     x�e�AN�0E��)|$`8@�`W[6��HIS�d���,� �^;�0���������SK��&��5��6��s=?���K�?�1���z�ּ;G��B�$
�b�w}\D�k��a~_�im2Y*U�jԎB���cLn�IХ�d���������k�.j��!X[��m����;��þd��	���3�Il�%�C��Pw�H� ����P��	<*�4�Z�1��,�b.��v�XV����@2	���\��W0;���K+_�N��Y�4_��j      }	   �  x����R�@���S\G#��t8CafB��s��NܝH�ӤuA�!o���$;�&�ζf>�~��sD..[��Q��|r���S����4ˎf�"�g�{t����á4q/�P��\���kyA�L?���t��v%��dk���
g���!%EYu���6L����� �B,,�U���F�����$�`�ԓd㾓���7�Aْd�ȏ-q�0�M\�%���X\)���V��^-ސ�R��V5�~�}��&��
���f���-ܨ]�6H�b����?8l���m �3��y���K�^�:R�4��[�j�⺍�������g�O,��83w�"ֱ;I�f(�'��#�94Ț��<�l�'�ڻLYybZ��Bu�\�K�I�7�5�#ƕ2j�hXE?��3	d�S�J6�{���m8�4�S���*���H:'(��V[��Q��1���V���$�7��`�b�t�-� NĭW64�GFT���C��w$F̓����\,�������1�ʳdkKs��P���b�%�A�.��)K^��kcq�+�X���4���5���6gUv�ߦ���&�g!ɇ�ƿh�ΖbtkV�̇���au���mr3�{��Қ���*U1���$qצ7Hw//|k�&f����f��#$:�a����q��M@�\�!%j��3���h4�_Bq�      l	   �   x�m�=B1��=�ӄ����-��9H$j��\Y�͌��C<�a��s�Yx�1��횭�+��Z� �Y�Ъ�V�J�8 Q/�k�ʭ�*�,u��8qӮ��l�l��l��r���U*��R�m�U������4RH      n	   <   x�3�4��4�42���
�,�2��44���Ō9�8�@�����~!@�=... m�i      o	   ;  x�͓Kn�@���)��P��N�8�&p��f"��$��3�n�c]ζG��J�z�����o~]gh�;��dsȠSO�i�_�v�A�5VZ��lpd|�)B�,X
�|�|�M��r�'�-MVؓ{m!l0}���`�X�t�UJ=4��Vή�K��W��{�o��\����E{1m�E�Q&��>��ѾݮVG)v.��}61���F�&6;ܾoi�ێ ��U3�ۈ�P�<N���C�RN}R`�C`]�L�21bM�`�@=�K�|D§�,'+�VO�]%<��/��0�)��kQTe��?���������V�=���g7�/����h�����ew*��;ZБ��ѡ�xz�55�(q�RtМ;^��՜+I:���5"[k~@l�����y\�����3J�XB�V�B��*��O�I�{Ps�mC;_���;yM��F�F�vT6o`�_�6���|� kd2	��������X���Ś���N��u?�G�]I�S2-���4Q<��U���
)�z��a� �.$��{���_���2      j	   �   x�mν�0��ڞ� �o$�H�4Vr�;�M�8�Ԍ�ŸK.�"�{��3^�m�1a/�QIe:SW�^�k�p�������g�s�@ܻt'�Y�Hk[#FQYMO!�}f0[��#�`=�DT0�/���vG�����	�1�E�]�W�Մ�����j��Y�Ut��S磜����<��o��s�      �	      x������ � �      �	      x������ � �      �	   Y   x����0��0\�@J�`�9�h��N�4��i��Q,Okۘh'1,"](���ѕ�N.��*t��|{���/: r�BG����ޣ��ܬY      �	   v  x�u��r;���S�	N�!{i�p��C�lRŦ=�1�f�A�qUx�� /X��bt�6r�Y���-���o��L,�Z9cȗڡ� >�{��8+Ӣ�4�Tj����A��T�I�9���V5��Z��gJ��ɿ�5�|�57�ΥX��Y��c��3��`���oe��F.�cＷF�
�
���^L������٩x��l�r�5�`�f�IE3�����TU,��;�T�P�\t&^�L?����X+#��uL���i@#W_�k�*�>�d�+g��fWb����ٮ�^����q+7��|S��N��l!64dl���G�;�Y��u�NSY/��	�F#=+Q��AתWzU�F����}��Ų�̠Uʥ�F��	;li02R����+�T5M굢�Ѩ&{.�Ă��S�h-��A�����tA��$z���=6�+��PLD�K6C�5��e�P<�H��{e�.��4��@�@�'zV���k��h�.�<o*^���/��;��".�a]Fn�y�i����۹�r��)Ư�/Lm���u `�
�"ǃI�����M(�eN~���! �g�CBP�\��H���\��i���C>���Sq���A�@=)P�M�Wm��r�Q>\,��sa ��e ����4}7��K�8�ϝ�y���`�M�\8%BN��G_+w6i��>B����LC��x��.B��4�?�y~d^�w��T!�ָ#}톮�]Q4/�&�k������c6x0�Η�!Q}�w�?a<���r�pQΉσ���`��"�YtB�rJ�>�ug��z��>����x�9A��x�E1���^-���H\��Q0~k�w=v���ZFL.���������      �	   ;
  x��\Ms7=˿����3dn*ږ��c���^r�g@
�p��mi�n尫��)����m7f��t.�H.*��z ����L.Tsq�jU�J�J��U[وg�IeeUT������"���A�u�� �6�}/�	�4�.f�����
�����V�vWˆ��@ķe&��+}��lZ��v�D�;�쪲��c�;0	4�!�e�vl|[�R�A�	7<xD�eo�������V�=2�.e��G��;�6��d���.i�8���6��̷�K�����v�h&^�F�Sr��+��3s@����8TY^-\��N�2�UI3v�r�J� [��>��j�`d,2.A��O���/uoi�E�U�E"��0�z�4Ի)7`RUW��F���$Х��{��j�˜ͦ�B��Ϻ c�ó��0p#:O;�xj�u$���B'q�n�8I��n+���ۚ}����ԙ	Cww��$�ŉӍ<�2���u%.��5����l�.����:w<I��Ն�I��>�U^=pl����;�L��^�ͩ���Sz��U�e���V
A�u�_��WU�f9:���	�C΋�r��;����l�R�Ey>;�R�M�w@k%⳸�E���Y�3u"q��_�!�J�rq:��T���uK+��s�]������@�d���C.�!�n �R�.7�d��j���&}�$<�!o<���w��z�g�r�r�}#���x�I��?6	2�L�!go�d��'K���
��]�XT���"�$�C�wC�G+s��K����9��s���L�䫁��K��	-`j�|b��1��#������&U��ź���a�����P���VeF�ФkV���-�ي���I�iKP����	v9���CUG���Q/�B���f� `���U��7xHM����ؠ�܅��a(��Ӽ��� k�9Z���O3ʜ1aG4̲R��jQ�_%;��0�Av�w�!����X�ֆ2�t��/����n�R�Fd��,<�}L�E��j�KЂd��3>a���$�q%� ��C�X�k��@���4BT���0�z�5D�)7�z$�� ��� ����_2�f�������YW�.%:�z�H䗂Q<5�kGpW4ܹ�[J�*�7t��Л1�b����>����]Uo�4hjW*��ũ��2�`�']��Ԗ�����_�PR]<6Ĕ�z�[*T����,�8p�ٵ#-{�4�8��N8���RQ���/���6���I�d���a�i�!��	��
/92^�������vZ�U���C�ä]|)=�	� c���_���,�$i�y�'�}��t���2��Ɩ����AU6�]U[q�j�u��4�vlb�/��!b��)@&�!��!���wu���_	����=%�)K�=8��]�OLT<x�Rf����F�t	+-�c�Ib=�D�Î����4�Y��v�t�+5X
�M�&"J'��kC���nJ{�9�8Oo�"�a�U�L�@v�Ÿ�QQ�i�Ƅ���ϝ������"Z��(����Ib'k)d�m$U� �[�\WE!�Q�`�{�6�����:�=�Az�f�8� J50ж9�����ufނ(} �a�fr�Qn�-�e-��o���g���	#̈��_��Br�/��*y�l��$D�G/獇�`ÿ�fN�I��Lсu����0aa{ۈ����!�[�xP�q��ުyF&��h/�g%�����wشVs�<�G��#��xb�|D}��,WF.ۘ, ��Nܔ��:|�i�� 
nT?2J��o����<��k�wLn⻮�b�h�8p���Pbxmơj�\>G~`c��;2�Mr��-�ɇ�-տ��i.v�J��
���N�O����^���"�pş���Q��TϜG0]v�,�Z����,�!S~�?�r�y�~�/��c�b��<�̠�  �/��&����Ѕ��@�ԕ��q�o�D�fK	���4��8m�wi�������-|�@i_^��� ����#O[��Di�e�ZC?hA2R�����A6�ʨT��g:Y�qU^"�3hT��s����+�Jv��2DH����2:�`R�A���wb�� ��e��|�܈	;�!����[U�dg���0��3Tk�&�ĺ-0�x<3�y�4��ɈvX�z|h�4|Aft�ψ%�E�~�!��Q	����(�C����!��@�-7��4��
l�^�GX��ja�������Q�:�Ƅ�ɢ����l��E^����P��>��*���B@�6�s��ʵÊ�m?��0� ����icC6�MKBr$�8���2˪��Ƌ1�p�$*>�D���)d�fl&8��� _�n���+�����W���5KǺ�D �֞�f�>f؏oM?^�-����/�p�� ��<�t�x� �
 z��>��$0S��K73}�7��.��g)zC!�L�Z;�4�M�g7�D�������0��V�|�|b(����Uw15uX�Pҥ���c�:mo��vy�0Q০I�_��_�T����ͫW��]7�      �	   �   x���݉�0�g��4�����V-W�A��S���������!K��ZҤ��A7��%���+"�?�r�ʨ�vf)�{�;�&eE�R%	����+ĥ9f���.Fm,����:X��Q+	/V�b<j�<���\*���}�,hlL������3|�}�b��3�X�c_�%W���U �ǽc��`�l�YYد�/�z�1�u�����#}��������=�X#-��˲��o      �	     x���[��0E�a�@+�I�c,gG:��v�r!EB�dk���w��Bl��O�L�lra���x�[�$Y���wp׀)��@4e@�`�|��a�M����ɸ.�P&�e ܃}r>q�� ػ h�\��= �E}(s&�e�" �o�q����@RHH���ԍ�"n��H	�d�EJ������-*	������gmN���E�Z.����N�DM�h��\'p�����{K)��%ΐ*�Qn-7�.�N�ˀ��^�m'��#s.t>�m;��h��h������
�Y_sTi��I�������1��똿2�)�a#�=�&x�9��	'�@�86��p��j��-���E��Լ�m�uB��[ �= �Jp��7�D	��D>Q6q�ɷ�	b3�/��r(�����&l��7��]BP7�H�	�[�B�����yR.-�?̢I����|7���n��x�P���c�BhM�~H] B���ا/���F2���q��3#      �	     x�ҹm 1D��o1��B����0ga�"i���Al&�Y�fӛ�l���n�˞��{sL�&��b�ɱ�$�`��`��b�����_=[�<\�'.��������������K�#�����"	yQ��hB^!/!/.!/_R^)/���A~=ۦ��"�e��rHyyHyyIy�R��(y唼
J^%�Ma� ���WCɫCɫK�뗖�F�k��u��:iy]�7���Z^Z^_Z޼��1F�8#o��7�țb�M3ߦ�ț�ț��;/G����<�xg[i      �	      x��}˒Iv�:�+b�,����
==�A�#�i���ȈT<
SXIK���6g���z!rC-��#��s���*��Ԑf�@e��_w��s����mqX��|S^N�MsW�W��Ln��]9�'�5�������Ż�tM��?��z�����o���k�ʯ};�/��ʷ]�.������e�O��Ey�M}y�?N��tmUc�ӷ��W�+�������]a���e��X&c=�M��#�K�����$�4��;t]޺�ܸ~l}?��5������X��o��x�>�ȣ�kה�k�z(.Ii��~9��7���uI"���1���?(��]5-Ǻk�Wݪ�z9���[wU7�(�/k��&�c��W7�*����JF�3�Ya�߶$,o��烽tKn�c���d�iC�s�>)��j7�)���8�&������p��m*���>��J�[?-����I%=���x�V����~X`��mWW��M7�9�Ȳ�=��ؤ��i�h��SU�$Y;���4��]�+0����-�����{҃��~�����O�ӎ��">B�)]u[��Ww��u�-1jה��0�5���Ï���骻����c�4��$��oa�2G�k��/�7���/H�xfY�_�<�g���/�n]^�j��I�n�k����2�p���nZ�Д��.x}/���zf���1����kq	�M~��?�#�o���[��c��Ͷ�v,I����S�M�>���2�q���z��y[Wԑ~FV�Ã��4�D��M�*�����c<4�2�غ�z�K-�zxT��I���vqMK@��"A�=���Ge�j��ܟN�f"= �����;0��م�ƣ_�n��Q�c��T�[̨�(C�gQjo��{�tX�8ר����xkR�$��箿�Y�2&�,+Z2�+>���e�԰����^����v_�.O���w�AHϗ�c��MiC>��_���y�P��	�U�S�ɦ�"s�a�x�8XGWU�0w����j,hk%bQT��״˽�50X�ƱnܝM��j�,�A!b����[�1�����7ID��t��� |Q�ڏ��|{[�]I�ඈ.�Hvo1ۿEGx�f"<Z�%��/p>�W��;'���4"|�o�h~mS;B8|Z\�N��Z]�B�6q�����Ar��h��ɬVo|@�Nj���u�o6��T7Ubʽ�L��R4�t�h3�A����J4���r$/}�5 Ԃ=�?/�BqIN¡��;}l)+Ej��g�Y,�*�Dz�\�v��2]��C=ޔ������xܣ�jo�A7��� ���_���4^IJ�{]^q�gc�t��#�1��(R�"���;)�K$G�5�k�.��9V1�k��J >�O�B���t��U�,�����?��4����KG.K�8��{��Q_w�E �4���EX�D�~��o�j¶9�Ŵ����
�����HI��!�C��=�h�����̌zyF�A�kݑ`ٔ��D�$�L��>/�z��	ײD�@~@����rl~tV��	��m����u�]=+�dp�^M�͗~��O�W��7\�=��a����^�[�軤�ī~�k�w
?��		��_x�z��}V��XS��!FP¦qWp0�d��3��ZNp]��2��)�3Rؽ����ȇH D�CB ��h@��@�P(q׮�[�F���RdB���!�{jM��>?��
؝�K�h��OZjB}^~ J�*ttσ<��\��鰒����W�қ���&$�v=��J���?=>.~K�rC.�'Yxq�V���>�����tN΁6����>�;�h��q��=� ��h�(�1a5J�W��_��_y�Ѭ����$��9��m�����K�C�a
z��%gg(���F&CȖ��0��_�H��GX�L�NAl�.>O&���`��0�Tْ�At�`��d����zC"����<H�V�wh����_�e�,M��bEX$�Փ⻮%S��Cj+e$q�z	��/o�(Pu�a��[--Ф�v_�Vz�n��V�}J�A&�
���3�A+G=�<�^e��3
'��g=��$ݷ��*.U8�m��]�<.~���?�k ω�W�	�@(y�:�;6�R[�DnhѮ������W�o]?�/M���?������`aiE�*�|#�/�,�-��b�S�Q%��B���//�+Neg+s\|�8Z��9P�{n,F[��zd�l�CM���IA��Cz���:��N�r��K��X���_�������'M���`������`��o3ΒBH:��:��;�aU�b�P�5Rڻ;C��z�3�IP�{���_���Al�mK�+������B�%�����ֿ�A�Z�
V��<3�c��u,	I9S�{l?�����O(������������r��?¦˵��|X��Z��Njا(�)e�\�?� ��w5A�!��nxؓ��< ����1�������(4�rf��pEʲ�gC���hH�'�$q^��;<�Gڬ��eGَ�D�%u��6M�a��;�ɺQ�X�<����{���H���uG�LI-P��[)ɪ�,/I,B�Aă�����5�o=F�M�6[��4����:J�<\x>1�ӳ"C2���q���[�����րva�ƻ#݅��2X�̅�>)����m�-RE���#�2��eN���� ��G�A(L�YM����>���-�)0.#$M6f�������u�q� ��s�HP��Įx����*�|]r]�xQ�M��hOɏ�/O*R<KL�x95ך�b"\�--����f�^X#�B[<��JJ!P���Z�b\,��;A��΀�"se�m/u�x���y�R�u<|C�˕�˜=ֳ����k��ԁ��_��;;��nt${�yC�{MN����HZ�}�fG�ҫ�6�'BS;��G���|��NȞ=:}\�n�IrQ$7H/E�@���r�_׫k�"	�$6ȝ���Ƅr��R��x���y �!+�F�]��8�F��2�Q��	c���8��u�IjVn3�bnh@������d�'����+<F��X������-p�ʋP6�£�/��ƦHZԌ������M�i�	������l����W�����A��jWӼ�QKe-�ކ�Q9H}�o_�	6����h���˝�pݙ]��E�ͱ(�X���e- ����!�^f��o���PUҀs�P#�����ßot���3_�ʯH�<�<9*��\��͖t�+�J�����O��	���NNat'�� ԙ�~�Zh2����F���40Y͐Bu�J��!Ob\Õl��Hz�$����I�g}W~�;����>�]�w�l���D��":��/����7���^����E>9+~��k�n2q�R:��{�{|������gڰ
��0��wK�mē�o�$e��2�o��G�g@���!��*#\�[M�#�wt�xl�s��l?4�CM�R`&�����2�*�����u�<�����o�IE}�R�v3-���M�;��ʗ,{D�g�%�#��ǛO�"��t���8�BR����#�1(1��ط�H+��\�З��bϑ]Z�{�*��3�l¿*�B���5pƲ���������Gח���+�v���@ ��/Py��\CY���I�bТ眳�8�'�˦�g��f"��Y��*4౗҈""a|Z/�(>������I��|ċn=�:�-�\��xR��۟(� �~�cFJGى��E�%S�:�6:�K�+��f}������ڕ3u�	�7��w.��沨�w�;>;�9�zz�	t�J����%b1����pں�%��~a��%���=)�A�1��ɿw,�s�y�bv�6��E{��FQ���`�N����1��VC�Ed�{R1
`8��8�G��3�{Z0ӫ�?�RO�d�{�D�`�$Yӭz��(
�p )��{O��$�F�40x�=�Hz$����`��4���֟P�Z��|l�;&GQ��ު�ε�8m��
)�<JY-�����=(�uJ� T�    �� ��N9)d�d�n����g��uXE��s��p=�ԮW���3����7�e�V:�κ��0��@��G�F�tCʧK\̦�e���&�T$Rr�,s�P�\am��Л�A�/)S]Pvd#�[TNk�PDys`�]��Pڠ�3B����iQ3M�o=V^�P�a��;��H�I5�d�H�cG6���ST�l�:ނUϟX-'�U����DvH��]�!�;U�T�@a��bb*-��g��a������H6r�#T�E�'�|+�8u���z�ZD��)%�8P.��E�Wl]ˉ�HWJ�	_6A�ZRӶ��Y�8<)�7�:�[a�u×�wa���s�j'���"����\ʀ�D��,'�}9����.�z��
� A�So���ʁ�A�I�{���4t�D��L���'-~1{����c�-|�糧7�!(�z��Kq#�o۟��)ە�e�x�;�Y�������|��%r���V�
��BA�L��|J��B_������ ��5����5�hd��P�}�g���S��\2�5��)>{�3�0cըv�;[{-,�𼧱����L���T�ߣ�!�[�X��|\�i�Ҡ��)úv�ߟ�f��ۗdy����(MQ7��M�n)�֚}�eF_� �Ț�SYS�儷� ����9�P�ߛ����-%hpl�������:�Z8�f�3)Q&�fLd��eu6W͈=R�o�¦����f�s`��Ḱn�ɮ̳�dG�y�Bl4���Jv6�=�^�b����I����"�nf�=f���5��;�,���ٱ��`�A9��[��,H�,���k'��}�;c>J���:�I��,�9:J�0�)��'��e���EL!��0`t�DB����2��T��=�� �����L�����݅�e��yE�@q;N�Q�0�o(>_,��X}�6�=?4��n���0�2� �������P�h���a����=��dh�8fq* �hl�D�'��X��倧!C8{��Ex��]�>7��)�)ls �����*���s��Շ��(����v�Z�����.�Y��i �ՒR#0*���"*}���(z���O��"����?fA�d.�.���fئ�Ǉ
�b�`Hxaw���¹�4U�:N�)�o�����*ONB@��6,��\�ȝ�I���&��A��5���dFt0Ө�\�4�<>.B!aΥ��=d�Ÿ� ��Ti����d�V�;Ɇ��E��{Gc-������Bڝ�3?:��t&Et�v��X+&�),m�8��O��9-{Wi^��'�-��}iI��� /�o�[��r��i�_䄢�ߩ�ϲ��{�͡W�`�I��'�"y������*n(N��* `��&��:ub�:iaD���Y�F��Ru,����G+���>���kߡ'I�P�P��@�d`wjd�t�����r���\�������>"��LrB�u5u��s���3	���x�S��>��}rkP�\-N�x��QF�?O��@�	|�޼'��܅u}��bm��Ie�CN �F~(/; <�+�Ä5�I4�����a-���r�RE���S�:��y���u��s���TkI����b	Fv ]��╻E�&��6���PW0�d�6�i�����Z����T:f(��xU�މ+�5�-i=9-�p��2|I�P�����L��ڎ+jR�p�����&<�Y5l�.���K
���{c��P9�A�h�O��b����q�ɓ�g����*�j���Fj ||�>~��=��rS���U?c�.䞟[ݛ�iy�Y� ���K��e�V�������BKD����̮E��ח)�5�Q1>�����Mʱ����V��9���{�j))�U#��&'f�����M��������+�ջh?;YeZg�Z'�$F�g��Y��j�ڜ���]p�f�iU/�2���f���c�;���G
 �1����>Rb�#��R�aZ,;QiE�zQյ�#}�~j��$+'vpW��Z���Y���%;�,%9=���!E3ҋ�L�3�=eGjN��ޕ�ラ非q��v�]H
%C�Ꝓe른�ʒ�+]���9��i���0�~����Y��W�,�Y$ɕ�C���v���&ӳ�Zy� ֙#@�Մ����ib�����������<��vƖ��� x'k2(��k��e�c]������r��ٖ�3Rl�����@�͝�b1$��T��K8���Yr;>9P�Obm�s�X��Mk�5UF� ��}���a���k�Լ�o�G�Z���p:�����fd\)e�=.�[��� ��[!���]FV��al%� 3s�v�Dܤ'!���{��(� ��P�w�b�0��ql�zl��v)Cw C7<l�uG[IAd�-���ȟ甋Y�8��P=J�{�YIb_�eI ���;����,AՏ"�M��py�i�p�l^���B��BG�s(rH&��!�kƮ��ɱ�ٳ�ì�IC�V�����z�� "���l�)��ʁ�7;�4�c�sr`��5=	�L�M8D`uM0��ܖ��!�8��(�f�A3���3�O���v9-�Fd�N��$B'_���Y5݊�������2�Q�X��r�d���I��59����G��3-�6?�HOLe_�u�I��ȷ�d2����4��M���W&)�w��r��zpƁµz��u����;��󄾢����Ռ�ġƙnei~����,O"�������,�s'{�B��]���'g�kL��9%;)C�޲���S�Nv��|8sy�/�9	�4������8�뎓LSLc-�r�C��j ��D1����\�u��.k#��:�i���9}}���M��JB'? _F��`�S�LR�d�~H��K�"�3Zi���G#><}\d��C"،� ��6��(�۟oQ�_Q���e �!��1�`�E�
���� �a�8�oO#D8��#����hᨑsD��/�۟+-9Zޏ��������������'Ps-ΰ w�a�$�����R����y�1������t����/}�n0!#��0��k����ǻ�DP�+!���=�`F�5��3�0/�7B�e��#$�����y��=Ir�I�m�ЗՑ�ŉ��]R81m>�|�J�c�X��(@�� ����O��;(��E�<�����֭}����5��{�#��]R� ���k(��)ˁ���`�
Q��u�����>)[�K�Y����1v5&��RM#"m��1���j��(��=����X=⒒+�|� ����g�ޕ[�袭�N��a�ˠ?��k�X�t9'w]&ː5aFn��\�#���U��J{	��
��BnpamvjJ$3i���^n�Lۋ�z���LÅ��4ܗ34?U��,U���b�V�ޢ���4��ʯ	�L�y��R��`d��މB�4��ӧ����{}歈Y��h��۟�����y���g��&�O[�#��n�g����.�%������y�J��x�dQ�v$aQ *�S^Ħ:Rm-v��0'�39�v���0F�����<}�H鶮�Zh�+7x+ ��������G�	�W�O��b����n/�������wd�А-��M>	n��W�Ӌ�	�Y��l�=W����k���eL[2%eT[]��m?���L�8-jO@N[(�9#S&7�u��u��2��X�}9�ͩ��U�[l��m���Vv��j(���B-fe�|��s;Y�����w'��:s{>e����A@p ��Q�n���W*���f+3Jh������?wXs�k��q<�%��`n>���{?U����F_�V)}�:��v��V�ש3#wbq�0z�Dd��d�Uܵ��*�S�0Vl���Ō�����PX�nY�m�Z'��Y�k�Cަ����9uH��Y3W)��(�ŜS���յ �kq������M��UK�A��K<5M��U/��R۔~�����ߧ���E���]�kR�<�ρ�:��0�9ʄy��@_�r����W<���n�,Ev��Ki�.u<Bb}    ���X1�I�nŖ�]�g�dgij��O�*J�Rf	�t���O�|��Լ���6ҕ��g����Ҕ�茙���E��Qÿ�,�����'�����BP�эS���9�cD�ݵ�o���S���a({`ܮ~�ȩ�MFN��M�x���Z	�k��>�wl.�~J�rR��`){�<�T{����$�8���n�q�f?���8��e	�VkT`zP�j�U��LP5~�W�r^��fR)ϴ���L�z	,�OBK�?8�q��!lԗ�������<O �Ҙۑ�If2;Zt�+�xt壪4稶l?����ϰ���L0<�Cl�A�Pu���3O:'{��oc�t�L��pO/e�Ӵ0���;{�������}5����؍T5D�k�	�r�5cf	xmw��.�kO��o/�bns���^��9g/��G�Y�k''s1�U��K�)tQ&�TD?F�sO��ε�+6]yC�n2���\�����bB�yէ��+g�(����;ND���M���&�䆍=�`NjܙQQ��.�ۊi��A�sab�
�w�ijo����Y�� K@�X��i��b��Y�*6���C��߻~|�AXL*����j�G��Y�I/#��<%M���i������<����St�ip��oLT��#m�cR2�d%s�e<S-�D�i^}�؞%<2���_��������vx���}��A4��O�''�oF�"�g�ϙl�a�)R�P7_�����\:���T�a�`~�{���@>�2��������ٳ\*;�>�k㖤򊠀|�!��Ä��`��Kc�I�2���K�Á]�b�e�>��n�p;.u*���B����.>m�����,{_ U͝tJ���eL�#��l~mE@�>�L,��R^��R�C+�qN	�ԩl��*}(7� e!����"DRӍ�R+��N�Gft������"���!�66	���&�,�أ�c��%v/��yӧ+ӽ�������@'�@)o4����ӫ�n!�Q���H���R�%M�'��2s��|�8玢�z�
_�&T.�	eƶ ����ԛ�.�Egŭ��Ip$۪P�H)c"��i��\c�Q]�|ja���h;ŧ�9L�R����$Х�X$���@��<)��	���vd$�u(Ax=B2ԅ�F!�K���r�hO.@p(�\ �&Ź^}�?*���y�m�2d7�Z겔qg���*,F)��)�$��s�`!�k)0��S
W���f^x�T�A�{�X�:Tlmd�� ƍN~��7�[����kF��# a��mV	�I����+���S��F�"9���K$����Hj%��I�c���Ni�F��-�����W��fQ)a4�Ieb�����-�rE ��qG�0sG�V�m�Q�4�G� ��j\QӦx��R`�Q4F=��B%!�<�Ҝf^:�I���)%�2��^%����,	QJ$�`�d�3j(�������N����Q������;n��ʐ\	�.6A�xP�?R.*.ӓ�K��z,����NIh.;�qE�#�i¦�v��n�=7�z	��tK.�2V��R>kV��Ȭ�6��:�ʗ��FfE�mj�ڜ��9�Pk8�d\?ω+9R��:p����	�������{��Ɗ��꥕��ӽKΐ T�%��n�������t%d�b�%��U�Wa�b��<Y@�:���+��ʻ�(Rw�>o��1X�a�%BdE��Ɗ��2�c%��=	y����ӱn�����Ff�@���������:�U+J�_%J�g�-�3�L�0����s%LJG����a�_��Y�>�X�w4����@`5���o)�5 �}�d�K���<oݡ�ֿ k��&�9�%�Y*��y�cͪ�m�C���Mث׌�����}io���-��S1�jp=�A$�]��Y"��X�|���2�NW?+�_d2op�N=�In?S@���=���
ABX�zO<��qsm��5�-~}K	(n?�K�9�^�#@e����;~���}�<�W�x#~GKa�/���7�@B[�}�T�W	+���ص�������tK&�sie���Mr=��ᥭr���}��ˌ�J����*��qx��%�Ÿ�$Q�����L6�ndB�v������'؄�/ʷ�T��� =�ё��O?d�N��7���?`�L��Y��~Z5�#M�\o?	���������<r�Vh:ڄ��}��a�}�Ő�4�3������T��Q����=l�� �F(xPPI��~�c����g�M�aU������Έ���#�y����	�\�N^��}�W���=�Z��d�Ag��	�v�(���~u`Z��z��t[������g�K�^Y��1)�U	������ߎ�Cip��ޣ{�I !PW7��� k�?�O`�����1.0Hߒ����*�=��?�}�n�)�[�!�t�WF7^yR��^�N����U~AxX��(^:��K:�d�j�{V���p�.�U/�{ќ��o���o�7�U#6��i/*��5��7"���BFRA�&1�.�Eph�KW����\�(y��n��q/ŷ�[W\�?"A��v�������P��8��~.T7�kŭO�K�o���z5C@y�E[��*vĿ�8��J~���8ʏ�!�	c��{�������;��m�-��L���;�2�*!��;�s����Q���x�*���a�9�b��k(����<�G�Jxv=�h����Ѻ�	�{Ėա8��~�T���9�y�>z~}~�6�24��hRZ�����Z󸒦_��O ��l�W�l�P��c�����C�ݠ���t-�DiO�W��
�-��o��Z��������Ĵp�IW��Yy�{���
$����V������D:�6�r�PG���<�*%�XPbه�R2vԥҟ�~���c�G����}����W�s��\�m9�+M��M'�x�;����W3S}��[s��-��O�JV��]䠰6D��yg�~��N�'���'���e�B��e�;�w��4�/�5�9�i���?�s������ζVe��zu5�5���,�<��^ �����ȓ]��X�a2j�̒�,��Q���,JQ�"���zdo�_�<��vgF����,�A9Xޮ릥�=�nj.ɍ/����������f�I=!�5�D���S1E�h�D���ݯ��g��.e��C�sH.L*��^(��Iw�ҎU��!���'\��G����M��X�͑ˤ,ZHH�4r��wtɓ�E&:����yȶ8�S\����UD���ií��!3j｣i�S�/v��v'r�Y���%e}0k����S�[��D�U�[�|����:-.ɑn�Z�����|6�-��NI����_�q�ok��V�z�B��`�XaM�����ر��}�!!:���%"<��Ʃi���z`'�����h�"u��;lw�J�3�2��8`�~��&$��g���Y��G��[�){�~�@L�e�(Q�����>�7R��5��׾r��ߥ?��4{�,ʋȠ��U!���{��&�x|����{�=�)�	9b�����;���]�*��!E��?��وN�b�i�_�=���򇪕>�D1ݖ��L2��T�&�\�P$�x���ⷴx7�q�6p��\-ٕ�?�v�G�+��qǇ�8'�v�܉"�(DY�"(���d:B�l��H��X*�[F=��N����׋$���}D2%y}��G�NC*�ǒ'��8��x�p�k/GFƯj^8�P�k0��7o8N�vK��Î!�ne�g��{�j3Gny��K|_Rt�r>^��^7K�.��r�Jb8�jf���A�xon��h^��[r[<X�J�i��.�LU�=�
��N֩�DO	&gP�5���H���\n�h�Hfo��@f�<!D�Wi�,�U���v��쬎f�����(0���
\$�H���1�糬ϷR>�I��@��uz����g��K�"���:�����5r�U/E�8�&�]͜y@� �  �X����#~Q��q�94I�J��c���6�#/ACQp��rM)���ͦ=�[�p�++O���."%�}k{����G.���G0�@���v<��=K��B �d\�2 e�
o����l��S��uV�X'ϰi��+��_�
Nq��[Mb@�_���JzX��6o�@�E|���L⚋�W�v�x�(�_�)��z�0r?�p"��كje�0	N�e�5�f����\�Vq��~�~���jr�����1T��gV�ݟ�e7��D��Y�ax>R_sɒ_h
ށ"��^|{�T��V��ײ����� ��q�q��<"ݣ9Nu@ŭ��uN�+�m��%$\\J��z�>v�<�H ��p	�k�QD���e֫�X�Ϝ���ۿ�� \?�^��d�5�^)�;	�2pc�K+��0^��y��� *�꛲p�@í�K+Ҥ��o�W1Z�p�MrvJ��0O����`�ފ�n;D�G��D�ُFz\*QIF"��C}䝯�)α��ū�%U�
���i����q�gK�U�^��'�!�Ufs�%��r���bc�7����-B��x'�rM P���t3�y���z�V��Okg�\��Z	֓!���y��s8B����N��j�^~~�^������'3)�\�g��}|��'zȅ3���u�z.ܥ�s�������3�N&�$�	�#,f%"=+^:�
�����N$����Lra%4�"8�YD^1�>ri!'�-\ԡ���eE�����R��}���e����@��z�PVk|c���ɻ���ӵ�N���|RǨ�=2xe@���H#�o�l��`�M�q�L~mſ�R
o���*�~	������(�e3�.{�T�0�)~�H���Rxi�^���#K��r�<�*%Q�z�+�qc+��f��U�WIn|��P��.�B˦z��Np��M���|mŧܸI�qv*
�۩�/�ȸ�w�9L 0��R�#NHC��h�� 0�V�(��B���	K��6��
ïۛ��;w�WΡ}���?JK�g q@>=�L[?vv�ʜ^�����Ä~i������&^C�NՁi�I7CX[��,��#Q���o�,�R|�����gwk�� ��r�n��ZN����0�dB�����s�	�{*x��e��g�f�!����1#r��n�W�-�qz�ԉ�Ry�0u����^zA�򪰀5��y��;]_7�'I1rS�C�&�fujI�<p{��^j���M�x���S
x��P7��\�������]Ol6z�=��<�t"�$g�'��!���rh��w*�̃�o�H���#d�o=�2,�r7��� N�E!������ڶ,��Ѯf��*!���r<P#��d�YA�HP��e�Ғ���|�K1�"jB���:���F�5��z����Y�����Q1�ӺB0Od��0)X�v���K|�ӄ�?	�e����*��'�Ͷ�Y��2(�Ζzo�����կ�C�[�      �	      x������ � �      	      x�3�4�t�2�4����@2F��� $�      �	   �   x�]���0���� ���*��%
YBq������hҒT����QԠ���Β�M�σ��(j���`8pLX����;
����DSrp��U$�Œ?'er(��<�ֽ�����굑���a�9\s��f󇯌+���MXѴ3�?�D���z�Z� ݾm�      d	      x������ � �      L	      x������ � �      f	   d   x�±
�  ���
��ˊr�Z�kB��A̥��=�9^��͞�\�'� �m:� 5�*�+������F�����?l�ؘy�8�x3�qB��B�3��      b	   "  x�u�Mj�0���S�b,;N����P�Iބl�6-�	IK�_����A�޼���(��z�GO5�z����%Ǎ�]`�����dD�y� ��d���l`ZYt�s)c�3�d�Y�"�1�5��f��\��"�ѣ�GR)�7փX�U%e%�H���5���~w�_�c�6���x��5Y�� uc�T�:�6}��]l�����)�v@J�R��N3��ZQǂqIb�8?����`�I����b�ȳ!nr���,�'�SY/�z.�R�k���3����<˲_4~zj      �	   <   x�U��	  �s���o1�_�(���;I7f����ʦ�ʡ��u�qe(߷ZƱ��F      a	   �   x�M�K� EǏUt��Ж(	�#�4$�$X�/u`M��s)�hu�$�h��,7�����ۂᨱ���!�ޯяS��4���t[�us���Ң�|�d�,�B�-�E�����Sg�����Ñ�Y�=�A�\\��ԙ�>�����<       c	   �   x�m�K� Eǰ
V`h�wxm�%Bظ�uEkb��p΅����a�n&1��n$A*Ίg����}�F����q�1*P,��� ���S��D ��aI(��d=�Yf��*}R!�����4=&�y��aL%��z�J���}ˌ���Aݓ��J�lJHۓ���i�M���㜿 ��G�      N	   �  x����j1�����Bo]4��.
n��@l7�ԡ�&4�E)}�j��G�f�+C$^��h��F�C8`f "C�r z�7��O{w��b6����_-_���o/���˧����jt������d��]�t��G
5��PN� Y��x�%O�'����ft9�����,�^Ϸ�%AU|>�
k���χ�w�{����$�*^����r��(�����_6	�͇��,�t��j���<+4�fi�0T@8&�@)��T�^1Cp�84Q��g>Ԉ_�C�D�i(�(�D�ݗo�����H�7���� ~�et��k��6'c��]/�{;������~{���n��M�p��4j��M�1G��A��:�v^d+�����@�è4�j�{`��T4�:��v�<��5@����C��E�x�V������YEQ�[gzO��ud�NsO��"?���Daf>`0@U�Y9V�UOOg�N騖N����H�u�:�B���v�T�<��:�7Et?O�XG�#o��'kߧq����gc?�$�t��x���X�q�c�xo8'X4���2pA��oxɹ&c��?�;�dT��<��N��l1���K�fCx��}�6�ʤ[�dTA��	�}sO8R����.��Hζ��w�@lȡ���i�=vgC*�1	�U�O�~4�I����D��/eQ�
��Ө�+�
CPk�b[l�RxOA��"	��"�D,�)��G���X��� ���eͱ"`w)��� ����U0n�8LP`�p(�[2��Ywlp��0�7�
.C�y�wY����˰�[�G���؝�x^���G��k�ŀ��G��vм��,��n^-,K��X�m�"V���e ���{��k��h+�(
K�>�hSnX���S�}�����=f�      P	     x�՚Qo�:ǟç��*]���Nl����Ect*��JW�b�Pi��v꽟~v`����	�������?9>�s�`B��M*��Q#�T%�0kQ��o�ŧ�����]�f��l>��E�� ��������1��n�ȃL�M�1������9�~�Z�ͥ�9����N�,��dk����m���eTҿ8����{I�On>_On��ΐ��Ϻ�Ĝ#���I�ո����|�1�K�E��������)BZ��������:��)9��v�^�?$���J\#+R��8
լ�F~'��[!=x�j!��'�P�哹�����,�Ű4yYG1�Qg4��k
���PMd��\S��v��G����|�~����-��"/^�����"���t�爜|�]\O���AҖTd8�2��-�i]������2,�e>�\+��wY<���}YBsYKY۸�"a;U����a����m=Vm kRhb����YP�����3�J�U	����<��H��!|(�W�࣏|�#>+ď�� ��9�h�"|M�>>�����4�i��|��a��'i�mp�[sj� �3ƛV�ӚUZ��MͩYMc�6�i��������S7]�hP�nPC���Y�$�j{�2|T�-k�l��QDZl�3�uP�|n���f�����]T��ύ��5�X*���3ӟ�N}��Gğ�N�調ew3�i]Oe��J��QO�GEs��w�kl�K��Y}i�:�2��kn뺑j�3������ hv����"]�|����}EZ��Y�%��Qt����2�;��k�%Z���i��b�4��^T�8K�Ӻ�"M�t�QL��I\� �1l-QbW�����ܲ��>p���u��,3e������%fĀ��[���N�k8C����w2[��C,�a��=���e��=5U-
vXg_�U���b/O�.-�4t/����j����r�ָ%۽B��S�V��2�s�'i�~]8-���R��q�њ�ŰSo��"ꊻ��1���h4~PV�g      R	      x������ � �      g	   �  x����n�0�g�)�yj��P)P p�c��B]"O�������l]�b=J�H���z!�#��u��i���+4(���c⁌pǬ�o��5�v��z�`2�Z�u�+J�b/Z�FH��}�P�.So��$��Ǩ����FZ�C�����hs)��	Ձ�r�.n�����-���uy'�iAw*qq��gW���B�28���p��l��QZYg���:x�G!���Y��
����:1�>�� >/ ����r�H�c��
�ڡQW����3*sPk���f��9�y�_�99���^D8�8Fx�������j~����?���[��H� ^x�#�	y���"ɀ�� /}��\c�� �	��_Y/˟�K���;����I���(�PHChڸiZ��X�7���e���t���H�<���KγL����S��Q򞀤��}��6&�9|;�r������j��U5�      U	   �  x����o�0����?�����m1��󰋗�ڤ��l��(�mh�,���{ߒ~m9,��T�J}p�dc�J!�@\��#����~@���ej���`A��NY�S��p��8	لG�E8�1����yM쳈0�<��d1�G���Ѷ0J5�9s"tF�쀶t�i�bX�,���x��Bayf����6�h�x�di�ZYi��fN{�����x�^D�GS����{��^��G��Jj�S)T�L�����yǝ�ǝ�J!��H�Y.݃�o�W��og�M���x�r��3��*�������Ű�Xt��x\-�����K��m�+�m�ؽQ���q)�7[Xk��Z��-X[,�~�s �_9�u�(�}"��>!M�lByPcnE`�&��}�	��      ^	   �  x���AO�0���W��02�-.�K��%z�ұ:�@;��aǃ���G��1;d���	�W�|�y��Gr�8�x�e�r����=�﹁=�/��������9^��E�+Δ�q|��c0�CKY|�8M�T��RE9;�����SIJ�)e�Eǲ��#4�	Q���u�`f/�䩈�vU��4^'�v�{V�8h~��_ K�-6��G�j=���f(�2�}��hL�xGW�����_7���;��j�נ���}���]*a8�\蝉b��̕�U�� Q*$�v>a�<�-gs �Q��ݠTlK�ߺ�lgWu�>���Բn��W�*�-��E͔�b�ND�Sh���ۖD�P}����b��j\�x�s�(3��G��3 k����޲W����'D�+�M���(߄�ڿu�������}�����F������o���'��{�[��p�LL      W	   /   x���  �7�CD�]��G�p[���Х��)�P�Z����      X	   �  x����r�������6�cl�y�ٚTMvS��Q@�U��� g�O���!cg�S55A�2|nI����?�M��o�Yn_3QqR�"���Ԩ�ayJ�O�EZg�Z*��bRM2Jvp�`�׳�ڏ� \�u��FQ�/�K��~�W�i z*2j��5�So�$T���EF�����]� ���`9��ȟ�.�]t���lp��Dr���<}TJ��Ts�ھ��5����~>�&ބ�إ3: �YJ9<bbw���R�L���T��$�#/p�O�v�Y}���H����Q� ��4���3�=������j��H��1�U��m=-�`>�?��ψ5d<r�h�Ǘ>��bͷɷ£�������l+8�b��v?�X��^Ϣ����?����wL�x���r[��j��tH|ѥ2B�gc��t�jj03��${L�d�s�27T|�, 2�ڥ4!�X��Uw���?��<a)�+��V�n�?��,ߟ���Ȋ��7F��-�9��MFjSW�L�xZ��%��h��`{b�%e�8�}H�mDI4ڋ�L�E�}y%Y����S�ʝ�ݰ�>�7Ժ��L�;r�F�A���:���b/� \]R�_s�_�<)r�'GV�y�ʕ�N>�SQ��͏¦�a�\���0M���h�r�~�v�W�UX�]��s��F�
#������$�,��-�ʖ[��끆s.��>��js~��M��jr��SV��2:5Pz��H�����7i8e�	b��w{ q_v���Dr��p�b����x����i��a�PN�P8�"�@szVhw#�İ�G�a�p����]v$�~g�`VrIgQ&�t�V�����R�3<�E���A4��Qs���
�K���W��ơ!]�&����z�H��O&o������+���á���CYw���L�Et��NG����n;t��}e�=����J�u�Zh���n:D7�;��H��B�O8���z���_\���P�v��C��CF�I��D�NS��mw��nsC=?ZG3�7���"�.�Z����o�^����Ypf�}t�p����#��ثGҵہq�L����p.��dG!��-��IU��
��%uI��ØT��h� ᰼Ŕ�Iֽ4�d�Wo;�v��:�s��qC�}��m�o�w�+g�Ezv�-FS̑�+����Ȳ��Hg�ӳ]t�Ɓ1���)��HYY�s������+��X�.��"<U:=��yPhRs,6�B$}.�����	&��w��!�3z��%�Xs�Fs������G�Z�l���ܶ��J���@�3��3�������)C����[�Ԑ�~�$��#!	��#�r�B���,���mJ��'C�VX�ȊCfW��[��(t�)����zi�$|\ESU
����$b>�rZ��� ����1������y�S<�i�0
��{�yr���\��Ȏ'Z�X�Pb���nuizeݐ'���iд�?m]�F��'��}Q}�"@�XR�7PW-H�G]�Id�>6�|O�ZȠ�^z7�#��eB����!mo�k�!��(x�W:kR�m[��ҟ s�p:��5��:�N�D����ioJ8��X�A�#mC
�Q�fvo�7�
������F'S^O;U�ҍT���f�v*?�ZuJ��O*�,�T]�F�Y�!���|�|ǈL�ܱ�I���1���xȺ�;�"���Ve����+�"�x�4i;���#Xhʥՙ�����9�qc�熝B�q�e������BJ��Tr�hO���ϋ3�����?`x�lORzIu�{T�����~������r�<��K���3R=��1���OfO��^?N«]Ir�����Op��3ʯV��?���[NIE��NrsH�7��$j���%�"���Y����<^��4���8��R�� Y6�_�梗��YQ#���L�d��s�'���.��vw�p��$ZMi��^��kшG�98����z�=��T���<^��K��'B����5��>��^i~#���v�`à���n��G�������$B~�t��1ē�L�_jN%z�"D�:�Ja��G�0Z,#���j`����6���^�j֙��0�
at�Ccd��p=��J}�'�)���.����c~6c'ۃy"��߬����tJ�w�Hj��l��{~��bx4���j_R5H����[���av0��hvv���H� r9>���)�M����D��      _	   B  x��\�r�8>3O�[.���X��U�����i/0��P�� �I�`cjO��ev/{�m7 J���⧭T���G�5��CK&�Ypt\<�8�̗*	�_�s��\[�\���`4>x3�������o���N�OG�oF��O_I�s|��؈՛[ ��(�ei$�v UI$��F��,�C���L�\�KM>D�~0�r�� �� �h���$���`&�9	���!8
.��u��$\�Z�qp���{����?�l!!�O�������U!��W�n�wU�g���E�7�: ��(�x��DЭ��AD�V/Flm��_�Эu*�\b���<��"�Z�3��41D�z1�1���zR����ug�b�B>����u�\����F8�:,�`[��i��/5�q�.Wq�[>T��.���a���(VM?�Or袷2�H�FA�y��
�؍�"5"�
"�!�J겨��ۣ��TS����Ԇ����\k)s�tmMG�OFIް�ຎ+���;t��
%�o��A���O�L�$z �Kh8TKE�%�X�������մ�l�X�u%eԉ��ݙ�c�7*�� b�̩eu?Ԡ��w��X�}E1���k4�>�;�������L��l9صӝћLTᛈ��oi���ώO�=Hͧ����b�� �â#%���}Դ����;ᣣ7�'������������d����
�n�XV�� ᤷV�j��w �����˥��( �����x'�OŪY �?��*q�;������4�[% �)o%�v}�,�J�4K ��(�*�)��m�[��q0%c�NhY�o�n��FB�SE�]��9 �)�6a�v�0������9
�lv�Y:/"c 5
 �<�t%�_�ȓ��sڄj����"�p�R�lNo! g�,�U�h�[� �o�٩�L,[e̘,�G���#l�蕌8�뫄 �?�I��J�_BO�0�	i!nFxI�~$Hk�Z�������H�;S����c^�{�?��L7�b�ro�$�-V��{�M�P�* @d4/%�5I�w��^HƎ�w������7�{agH�����g��Qp�&��!{�<n�R�"�Vmu?�[Vv�=����tp떹]G1��^W�Gg�$1���Gm�?��n  �4�
���S����Z���؆ڼ��J��S�:�`W�G��z��8��Y��kc�W;Y��U���[_�4�py3� �6�:ID�E+��A@�6�����@������dYX�/��]�76Z�އ-�� �����6��N��AD�W���B�jY�
]�����'h�h��ixAC˒�뫃��#�"c�m�wi�)$�4�Iie,�gC>�$�a}&�H���Qd��KW5�4�1�
��>H���ȴ��Z�Y`�R�%�oF�$�2IB��Z�<>�:��6���M9oW@�H�Y����Y��5�#i���Bo�p#�vY��9�y������`��8&����d67K��J�J�\�s�w�Z���{4�>��	�d�ǜ�Y-rY�|���������i� ��F���LV��D��?���בn��Y
�V��c��<!-�1�\=�_�x�j��S�����(�� ���o �َ�Wg���l�Qmj�?j3>T�魐�C���/�oX��.�h� ��p#�X��ᮩn� !�M�2�9���f5`G"��gb�"�d ����a�.M��2#�@m���j��f�BD{�w<S�	^VG`�)YdU�by��s�8y����4�9�!eۼ1';��3@�g�GX����1�������{;�=����O��seA���:�,q�b��-�_V�!��������ap=�U�p;�w��q&xx'���2RK�ՠF�I�;yd��`+$a��B��~���1��U�����A_�"�C�߅�rQ�Χ�`��º��Q����]7��>ڀ#H�Q�!�b���&��1��6���T[�A�,�sބP�Cd)��$j��=B�hG$\�.n0}D�$)�iN���K'p|7��N��Ѡ��2�81`��
����f�n~��P�n�n�J@��n��2�Œ\�c�E�A9��p���<O;��,Wq,3+\�L�wnZw�Id�v.���P -�N&�һ�(q1���ic��Ҥ$����Y�Ta��.f�ސu.3;���$'�M���*� ��P�ntv5��QT��ݴ�W�4>�MU��Q��Z�E՗hǠE\|��n��e�(C��^�b���zg�����B2�M���Q��b�W���0
 �̠�c䗿-!\O+ zP�5��x�ڨ!@u6a?N��|"t,T�@��k�&"�|����n#�E-�T�P �B,��$�����`b���0���:��I�y�j�溞���S��ոM_+Щ4�� ����!@J��3̨Wh�1Bw�q������dQ�El4i�2�H�p�[��Y�G0,%/��v��0�^�A���@�`�ꩵ	���c��T���5����`��	V�Ud
��K�\.��2�&
W���p{�G$�P�I�h���@�֩��'O��cׁ5M�8�ﾠ�Np���G���<����.̻����	�*��a��b	ɜ���O'���N�������Pk���琷����+FE���e�yz�n�Q��� }B�PX����؄�B=*Ө�t�IPü��e��L��������Y}6���c2�@+.a:�Kp�\��ه��N&a'`�<)������'�s)
�3�	0�6� a��>Ⴕ���3Y|F�*8�^ހU&�����gy���TE��p�6���̮�������Z3�W�7h�e��Au0M���WZ$���L<
�q&���c���7N{������J�4�y->
ኦ�O��)0TP��#L��˯�j�i}��'��?
h�=��D���Z+]D��\� �Z�Q�������l �����`� VyO�t���G�$��N$����5��E��i�!h�|�5�M�0EZgZ�s�؀m1��)unF�����IhT w.p=к�/9ט��xk�����?yH�53 ���"�BR$���	x�u�H�[)8�ԑ#Q0�a+�Γ`��?���a5��f�
$��^��ob���݄��.R#���FhL3�M����������h�c�@�7Ȍ��-&��2�9�GVD��o��)�E^L�A����!$����i�7BmR!$(��v<���Le�L�#��r Rw�мZ��g�0����,M�b=��7�eL����A�_��&��5�p�o�_��a7ĝ%>8�=��fr�'��}�>��D��̀��+�����y��dC�-�N��^�$��a�������ؓ���$�x^΢b*����ПSr`������")�a&�K���J���Wx`	$�e��s��bgo�>����TJ�<O`�:-D�Npރ��N�b&5�R����8܀�/�z(�C\ڃo�)2���<����̑vL`�����ж�
�:�0����I��'f3�E�@��=�ѼdE�W�+�!�Ѷ�����
'�� ]����u�իW��eH      T	   �  x�e�Ana��p��g柡�]��	|�GN��.DU�c�kۯ�s���x�}���fg��;�`/6<<<<<'<'<'<�Ɇ�����o���[�-�|�߂o�����������~���%۶�u�5_�ƺƺ�z��ce���s��g�| �Њ������������������������������������������������������������������������������އ���3_�9��p�_�}�v��ߏ���9�9�9�9לל���9'�=���TM2M2M2M2M2M2M2M2M2M2M2M2M2M2M2M2M"M"M"M"M"M"M"M"M"M"M"M"M"M"M"͉m��iNnsr�����4'�I�I�I�I����������k�5�|�_�����k�5�|�_�����k�5�|�_�����k�5�|�_�����k�5�|�_������������8�      ]	   �
  x��[�n�]Ww޴�%�깫��ۅ��܃  `K�MD�!�j��,�Y�L�E�$� ���W.�zPe�,զ,��9�彇��LxϏ�h�K9a!�yHz�y��zI�ꛃ����!s2����ذ���5:�۽.ޑ-@�9�1O��xMt�m�0Ǧ=����8�K�]ο�h�F���y����{m�{�=���:���#��8Mh$.1b��hxG�������9�i1�����*b�����V��nE���5u���_6û&.�fA$�{I~Li�l���K�$Q�6���C��
ȉ������v	a�U�Ea��0��Lº�H`�K��(���-��Q(���hM��?�0��>�oN�\�K�K7eb()̔��S�#��5�{.�@	�Ԙ}��̿u��>��B#�B�_m
�
��!�`���U�y�r�s�D(�����AB׹�	�D5���M(	�s��#D�O0�|���m���C[+7��R����/�K7
�4!�lY�ۭFa��FS���G_sk�g�FE%?���Ovx����l�Y���ۘA^Dxx�� '��7v9Nj��o�U|�L��̉1�����Pd����Q�bӼ4�x!�_m�R��X	�K�Ŭ�r�>ʞ7A,�7&!�\ť����ȣwTlH
n	a�]#$n���F-�
.9�7�
e�󘆾�f�Օ�P\�_�����U�ʞ[-��KP�E1�糆Y)l�����H�f��Y�@��f�M4��,�8���s��-~�\X��a�2]�_D�҄��ㄤ�f�iL}���
pB
�%�F(���Y���DaH`m�^���(r�:®���Q�rI�H��j���Ĳg0���H��V8<` ��h�A��_�6Ly�[�GhCq�0��5��B�"��D隄�I��(dL�&����~Y(b,����0L�� �PL�g7b���Fp؇��k\e�P�>��G��=)���&ʪfP��Hq80<�lT�a?b������+
����'
H�v(�c���p;c0�ڦ�kU�S�]Fc�J�;�abW`�Ѐ��t�DwT�^�(H��ݡd��C�)�w����1l_�4/ A�S�t~�掳p����:��\/�Ж���낊���Q���X�N���߭����eW>~��x�����a�;�����<�莠�lҹ��Nh��|�y~��~������t��լu;��~�T6"�i&n
G�턢���uKW��v5Pʞ�#(�]�,KNJ�ߝ,P��t����:�����E[������=��v۪�¢����uǡ����uL�z�'��B�ں�_YW��f�u�v
�Kj7�[γ�f����9i-vD�H�]~�vzgd%đh3��"sh�+�D	������d�ar�%��C�5/ڑ�.%`Gx;�����"�!A}U#B2���{h�}̻�e�.�rұ/n7V�~벋�$qyh��n�1Ox�(ß`�|��=��*ϣ�b&ްD�hskG8Tԟ ��}k2��=aM��P!;��~Quψ�!tGs��;��}Fi�+Lx��0;�XKk8E�Ei�z�-��HR\�`w�vN0B)�
�k�R��/�0.�����C<�9�h�q�b}��C���K�����d��_p?�yB䓭���.V4���Vt X��(VP�F�,y<v����;�F�����S��XU��%+']^-�@W.r5�&t��-�E_�Σ
��P
W�F��;��i�Kuy!\m�lى<�m�]��]�X�i���^�!8t�%Z��h1�Z=t�U��q���Uw��`-������p�P�;:�`��K�/]
V-Aw�UKё`i=O���{��w��}��_O�+��V�6k�QV� 4E����)��SU}��AN���C�.E����8�u��F�sWY��Nծ3 y������r���?�kv��Tlq(��T��b�b�[)^�wG��<L�*Y1o�/ v�����e���5\�����6�g�k<�-�N[[�m��L���#�IR7�֬ocӞ�t��ڒ�w�2���1�
�����}{8�*K��~��|�qu�����1�Z���+T��dR'&���S�c?"9��x��������tf��tl��������������'0a(>�:M��[�7����-u��G�@%'2���Z�)���|������܅�u,mmΰ7�I�{���ه�ė�C��`j�'�p]m����<t��e����BKp^4���<a�=ud�+��݀jl���j��Qց�3)I�d?���I�L�kB� ѹKʑ��뼑�Vc�]���Z�@��#$�$���y
�aTG,BR;��P�(�c8�р��Ǜ�w��jo�Z3��9�Ul<5�o@U,�	������y	u�7���pZ��ưd&{̼\��2l�V����!o��Ŀ����t��ia��#V��]Ⱥ�*#�p��mN�:���w��N$��՚���ܡ���`�|��N�4=�elb&����U��U�Ss04�h�ﮪ��3�7Xv<���u�/N���b�H9[h�ok��CÆ��5��v�6�6�����t2�F�im{X������]���&��U��161�;��w����@�0      `	   �   x����
�0D��W�j�Mo*Z��z(�
�hZ�IV���5���A����݉�p��H��,[R�'�d�ϋ��o����.�J+O�f���Ҵ蝗�(K�xΒx�O1��di�^�ܟ##o7%��pCr��#�Z#\����l�����^Q�04�Hv(�r��z�)�O�b�      Z	   �  x����j1��ާ��A�e��[J�@	驗��=�ö�ٰ�)$O_�ҖB� ���>�|��=�<�E��$�R��nP��ׂ���D@5$���`�)���u��Ovt�����H��.�H	4w{�  �8������V�<o�sUY�H�b�+s-�V���0M#�}N�6�� L%���Bⷈ=��Ȉ�{пH[`���[��+w�/w+Z�um~�;�ƓD��ɸg���6���.�UA3e�a�2�\ٽϏǧ��q���0\����|���||�;�1x���u�0J�@p�~a�K~p�����?��U��/�|9t`Y����j@�YFM5�|����l�ϧ��̫Z@�&\5�����ɸ����B�J�-En�H���}<�ps)6|��|<��C����/�A�;O�DI���2`׮��������q��� f?ִ      \	      x������ � �     