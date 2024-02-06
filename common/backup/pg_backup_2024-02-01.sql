--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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
-- Name: Status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Status" (
    "ID" integer NOT NULL,
    description character varying(512),
    status character varying(512),
    type character(3)
);


ALTER TABLE public."Status" OWNER TO postgres;

--
-- Name: Status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Status_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Status_id_seq" OWNER TO postgres;

--
-- Name: Status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Status_id_seq" OWNED BY public."Status"."ID";


--
-- Name: auth_assignment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_assignment (
    item_name character varying(64) NOT NULL,
    user_id character varying(64) NOT NULL,
    created_at integer
);


ALTER TABLE public.auth_assignment OWNER TO postgres;

--
-- Name: auth_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_item (
    name character varying(64) NOT NULL,
    type smallint NOT NULL,
    description text,
    rule_name character varying(64),
    data bytea,
    created_at integer,
    updated_at integer
);


ALTER TABLE public.auth_item OWNER TO postgres;

--
-- Name: auth_item_child; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_item_child (
    parent character varying(64) NOT NULL,
    child character varying(64) NOT NULL
);


ALTER TABLE public.auth_item_child OWNER TO postgres;

--
-- Name: auth_rule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_rule (
    name character varying(64) NOT NULL,
    data bytea,
    created_at integer,
    updated_at integer
);


ALTER TABLE public.auth_rule OWNER TO postgres;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    iso3 character(3),
    numeric_code character(3),
    iso2 character(2),
    phonecode character varying(255),
    capital character varying(255),
    currency character varying(255),
    currency_name character varying(255),
    currency_symbol character varying(255),
    tld character varying(255),
    native_name character varying(255),
    region character varying(255),
    region_id integer,
    subregion character varying(255),
    subregion_id integer,
    nationality character varying(255),
    timezones text,
    translations text,
    latitude numeric(10,8),
    longitude numeric(11,8),
    emoji character varying(191),
    emojiu character varying(191),
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    flag smallint DEFAULT 1 NOT NULL,
    wikidataid character varying(255)
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    course_code character varying(20),
    course_name character varying(255),
    credit_hours integer,
    student_id integer
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_id_seq OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: email_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_template (
    id integer NOT NULL,
    subject character varying(255) NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.email_template OWNER TO postgres;

--
-- Name: email_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.email_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.email_template_id_seq OWNER TO postgres;

--
-- Name: email_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.email_template_id_seq OWNED BY public.email_template.id;


--
-- Name: iiumcourse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iiumcourse (
    id integer NOT NULL,
    course_code character varying(20),
    course_name character varying(255),
    credit_hours integer,
    student_id integer
);


ALTER TABLE public.iiumcourse OWNER TO postgres;

--
-- Name: iiumcourse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iiumcourse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.iiumcourse_id_seq OWNER TO postgres;

--
-- Name: iiumcourse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iiumcourse_id_seq OWNED BY public.iiumcourse.id;


--
-- Name: in_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.in_courses (
    id integer NOT NULL,
    course_code character varying(20),
    course_name character varying(255),
    credit_hours integer,
    student_id integer
);


ALTER TABLE public.in_courses OWNER TO postgres;

--
-- Name: in_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.in_courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.in_courses_id_seq OWNER TO postgres;

--
-- Name: in_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.in_courses_id_seq OWNED BY public.in_courses.id;


--
-- Name: inbound; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inbound (
    "ID" integer NOT NULL,
    "Name" character varying(255) NOT NULL,
    "Gender" character(1),
    "Relation_ship" character varying(10),
    "Date_of_Birth" date,
    "Passport_Number" character varying(9),
    "Passport_Expiration" date,
    "Religion" character varying(100),
    "Mazhab" character varying(100),
    "Citizenship" character(512),
    "Country_of_origin" character varying(100),
    "Country_of_residence" character varying(100),
    "Mobile_Number" character varying(15),
    "Email_address" character varying(512),
    "Permanent_Address" character varying(255),
    "Postcode" character varying(10),
    "Country" character varying(100),
    "Emergency_name" character varying(512),
    "Emergency_relationship" character varying(255),
    "Emergency_phoneNumber" character varying(15),
    "Emergency_email" character varying(512),
    "Emergency_homeAddress" character varying(512),
    "Emergency_postCode" character varying(10),
    "Emergency_country" character varying(100),
    "Academic_home_university" character varying(512),
    "Academic_lvl_edu" character varying(20),
    "Academic_name_of_programme" character varying(512),
    "Academic_current_semester" integer,
    "Academic_current_year" integer,
    "Academic_name_of_faculty" character varying(512),
    "Academic_current_result" double precision,
    "Research_title" character varying(512),
    "Mou_or_Moa" integer,
    "English_native" integer,
    "English_test_name" character varying(512),
    "English_other_test_name" character varying(512),
    "English_certificate" bytea,
    "Propose_type_of_programme" character varying(512),
    "Propose_type_of_programme_other" character varying(512),
    "Propose_type_of_mobility" integer,
    "Propose_kulliyyah_applied" character varying(512),
    "Propose_duration_of_study" character varying(30),
    "Propose_duration_start" date,
    "Propose_duration_end" date,
    "Propose_transfer_credit_hours" integer,
    "Financial_accommodation_on_campus" integer,
    campus_location character varying(512),
    "Financial_funding" character varying(30),
    "Sponsor_name" character varying(100),
    "Room_type" character varying(100),
    "Financial_funding_sponsor_amount" integer,
    "Financial_funding_other" character varying(512),
    "Approval_university_person_name" character varying(512),
    "Approval_person_position" character varying(512),
    "Approval_person_email" character varying(512),
    "Approval_person_mobile_number" character varying(16),
    "Approval_date" date,
    "Recommendation_letter" bytea,
    "Student_declaration_name" character varying(512),
    "Student_declaration_date" date,
    "Student_declaration_agreement" integer,
    "Passport" bytea,
    "Latest_passport_photo" bytea,
    "Latest_certified_academic_transcript" bytea,
    "Confirmation_letter" bytea,
    "Sponsorship_letter" bytea,
    "Status" integer,
    "Kulliyyah" integer,
    msd_cps integer,
    note_kulliyyah character varying,
    note_msd_cps character varying,
    "Token" character varying(512),
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    offer_letter bytea,
    reference_number character varying(100),
    temp character varying,
    proof_of_payment character varying(512)
);


ALTER TABLE public.inbound OWNER TO postgres;

--
-- Name: inbound_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."inbound_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."inbound_ID_seq" OWNER TO postgres;

--
-- Name: inbound_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."inbound_ID_seq" OWNED BY public.inbound."ID";


--
-- Name: inlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inlog (
    id integer NOT NULL,
    outbound_id integer,
    old_status integer,
    new_status integer,
    message character varying,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.inlog OWNER TO postgres;

--
-- Name: inlog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inlog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inlog_id_seq OWNER TO postgres;

--
-- Name: inlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inlog_id_seq OWNED BY public.inlog.id;


--
-- Name: kcdio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kcdio (
    id integer NOT NULL,
    kcdio character varying(100)
);


ALTER TABLE public.kcdio OWNER TO postgres;

--
-- Name: kcdio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kcdio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kcdio_id_seq OWNER TO postgres;

--
-- Name: kcdio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kcdio_id_seq OWNED BY public.kcdio.id;


--
-- Name: log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log (
    id integer NOT NULL,
    outbound_id integer,
    old_status integer,
    new_status integer,
    message character varying,
    updated_at time(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.log OWNER TO postgres;

--
-- Name: log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.log_id_seq OWNER TO postgres;

--
-- Name: log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_id_seq OWNED BY public.log.id;


--
-- Name: migration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


ALTER TABLE public.migration OWNER TO postgres;

--
-- Name: outFiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."outFiles" (
    "ID" integer NOT NULL,
    "Student_ID" integer,
    location character varying(255),
    created_at timestamp(0) without time zone
);


ALTER TABLE public."outFiles" OWNER TO postgres;

--
-- Name: outFiles_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."outFiles_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."outFiles_ID_seq" OWNER TO postgres;

--
-- Name: outFiles_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."outFiles_ID_seq" OWNED BY public."outFiles"."ID";


--
-- Name: outbound; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outbound (
    "ID" integer NOT NULL,
    "Status" integer,
    "Matric_Number" character varying(15),
    "Name" character varying(255),
    "Citizenship" character varying(512),
    "Gender" character(1),
    "Date_of_Birth" date,
    "Passport_Number" character varying(15),
    "Passport_Expiration" date,
    "Mobile_Number" character varying(15),
    "Email" character varying(512),
    "Permanent_Address" character varying(255),
    "Postcode" character varying(10),
    "State" character varying(100),
    "Country" character varying(100),
    "Mailing_Address" character varying(255),
    "Mailing_Postcode" character varying(10),
    "Mailing_State" character varying(100),
    "Mailing_Country" character varying(100),
    "Dean_ID" integer,
    "Person_in_charge_ID" integer,
    "Note_dean" character varying,
    "Note_hod" character varying,
    "Emergency_name" character varying(512),
    "Emergency_relationship" character varying(512),
    "Emergency_phoneNumber" character varying(15),
    "Emergency_email" character varying(512),
    "Emergency_homeAddress" character varying(512),
    "Emergency_postCode" character varying(10),
    "Emergency_tate" character varying(100),
    "Emergency_country" character varying(100),
    "Academic_lvl_edu" character(2),
    "Academic_kulliyyah" character varying(512),
    "Academic_kulliyyah_others" character varying(512),
    "Academic_current_semester" integer,
    "Academic_current_year" integer,
    "Academic_name_of_programme" character varying(512),
    "Academic_cgpa" double precision,
    "Research" character varying(512),
    "English_language_proficiency" character varying(60),
    "English_result" double precision,
    "Third_language" character varying(25),
    "Financial_funded_accept" integer,
    "Sponsoring_name" character varying(512),
    "Sponsoring_name_other" character varying(512),
    "Sponsoring_funding" double precision,
    "Type_mobility" integer,
    "Type_mobility_program" character varying(512),
    "Type_mobility_program_other" character varying(512),
    "Host_university_name" character varying(512),
    "Mobility_from" date,
    "Mobility_until" date,
    "Country_host_university" character varying(100),
    credit_transfer_availability integer,
    "Connect_host_name" character varying(100),
    "Connect_host_position" character varying(100),
    "Connect_host_mobile_number" character varying(19),
    "Connect_host_address" character varying(512),
    "Connect_host_postcode" character varying(10),
    "Connect_host_country" character varying(100),
    host_scholarship integer,
    host_scholarship_amount character varying(9),
    "Offer_letter" bytea,
    "Academic_transcript" bytea,
    "Program_brochure" bytea,
    "Latest_pay_slip" bytea,
    "Other_latest_pay_slip" bytea,
    "Proof_of_sponsorship" bytea,
    "Proof_insurance_cover" bytea,
    "Letter_of_indemnity" bytea,
    "Flight_ticket" bytea,
    agreement_data date,
    agreement integer,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    "Token" character varying(512),
    "Connect_host_email" character varying(512),
    temp character varying,
    "driveLink" character varying(255)
);


ALTER TABLE public.outbound OWNER TO postgres;

--
-- Name: outbound_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."outbound_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."outbound_ID_seq" OWNER TO postgres;

--
-- Name: outbound_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."outbound_ID_seq" OWNED BY public.outbound."ID";


--
-- Name: poc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poc (
    id integer NOT NULL,
    name character varying(512),
    email character varying(512),
    email_cc character varying(512),
    "KCDIO" character varying(512),
    email_cc_additional character varying(512),
    name_cc1 character varying(512),
    name_cc2 character varying(512)
);


ALTER TABLE public.poc OWNER TO postgres;

--
-- Name: poc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.poc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.poc_id_seq OWNER TO postgres;

--
-- Name: poc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.poc_id_seq OWNED BY public.poc.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    translations text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    flag smallint DEFAULT 1 NOT NULL,
    wikidataid character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.regions_id_seq OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.states (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    country_id integer NOT NULL,
    country_code character(2) NOT NULL,
    fips_code character varying(255),
    iso2 character varying(255),
    type character varying(191),
    latitude numeric(10,8),
    longitude numeric(11,8),
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    flag smallint DEFAULT 1 NOT NULL,
    wikidataid character varying(255)
);


ALTER TABLE public.states OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.states_id_seq OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: subregions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subregions (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    translations text,
    region_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    flag smallint DEFAULT 1 NOT NULL,
    wikidataid character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.subregions OWNER TO postgres;

--
-- Name: subregions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subregions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subregions_id_seq OWNER TO postgres;

--
-- Name: subregions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subregions_id_seq OWNED BY public.subregions.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    auth_key character varying(32) NOT NULL,
    password_hash character varying(255) NOT NULL,
    password_reset_token character varying(255),
    email character varying(255) NOT NULL,
    status smallint DEFAULT 10 NOT NULL,
    created_at integer NOT NULL,
    updated_at integer NOT NULL,
    verification_token character varying(255) DEFAULT NULL::character varying,
    type character(1) DEFAULT 'I'::bpchar NOT NULL,
    matric_number character varying(10)
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_admin (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    matric_number character varying(8) NOT NULL,
    auth_key character varying(32) NOT NULL,
    password_hash character varying(255) NOT NULL,
    password_reset_token character varying(255),
    email character varying(255) NOT NULL,
    status smallint DEFAULT 10 NOT NULL,
    created_at integer,
    updated_at integer
);


ALTER TABLE public.user_admin OWNER TO postgres;

--
-- Name: user_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_admin_id_seq OWNER TO postgres;

--
-- Name: user_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_admin_id_seq OWNED BY public.user_admin.id;


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: Status ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Status" ALTER COLUMN "ID" SET DEFAULT nextval('public."Status_id_seq"'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: email_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_template ALTER COLUMN id SET DEFAULT nextval('public.email_template_id_seq'::regclass);


--
-- Name: iiumcourse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iiumcourse ALTER COLUMN id SET DEFAULT nextval('public.iiumcourse_id_seq'::regclass);


--
-- Name: in_courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.in_courses ALTER COLUMN id SET DEFAULT nextval('public.in_courses_id_seq'::regclass);


--
-- Name: inbound ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inbound ALTER COLUMN "ID" SET DEFAULT nextval('public."inbound_ID_seq"'::regclass);


--
-- Name: inlog id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inlog ALTER COLUMN id SET DEFAULT nextval('public.inlog_id_seq'::regclass);


--
-- Name: kcdio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kcdio ALTER COLUMN id SET DEFAULT nextval('public.kcdio_id_seq'::regclass);


--
-- Name: log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log ALTER COLUMN id SET DEFAULT nextval('public.log_id_seq'::regclass);


--
-- Name: outFiles ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."outFiles" ALTER COLUMN "ID" SET DEFAULT nextval('public."outFiles_ID_seq"'::regclass);


--
-- Name: outbound ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outbound ALTER COLUMN "ID" SET DEFAULT nextval('public."outbound_ID_seq"'::regclass);


--
-- Name: poc id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poc ALTER COLUMN id SET DEFAULT nextval('public.poc_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: subregions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subregions ALTER COLUMN id SET DEFAULT nextval('public.subregions_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_admin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_admin ALTER COLUMN id SET DEFAULT nextval('public.user_admin_id_seq'::regclass);


--
-- Data for Name: Status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Status" ("ID", description, status, type) FROM stdin;
65	Application is approved with complete upload documents, inform student.	Application Accepted	I
16	Application rejected by Kulliyyah, return back to IO	Rejected (Kulliyyah)	I
21	In progress, from IO, application submitted to Dean	Redirected (IO -> Dean)	O
25	In progress, pass by IO to AMAD/CPS\n	Redirected (IO -> AMAD/CPS)	I
31	Application approved by Dean, return to IO	Accepted (Dean)	O
32	Application rejected by Dean, return to IO	Rejected (Dean)	O
35	Application Complete by AMAD/CPS Return back to IO	AMAD/CPS Accepted	I
41	Application return to student, upload documents 	Redirected (IO -> Student)	O
45	Redirect to student, Upload proof of Payment/ Update Status	Redirect (IO -> Student)	I
51	Student upload documents, return to IO for verification	Documents Upload	O
55	Student upload documents, return to IO for verification	Document uploaded	I
61	Application is approved with complete upload documents, inform student.	Application Accepted	O
1	In progress, from IO, application submitted to HOD	Redirected (IO -> HOD)1	O
2	Application rejected by IO, return back to student	Rejected (IO)	O
3	Incomplete application, return back to student 	Not Complete	O
5	In progress, from Io, application submitted to Kulliyyah or other institutions	Redirected (IO -> Kulliyyah)	I
6	Application rejected by IO, return back to student	Rejected IO	I
7	Incomplete application, return back to student	Not Complete	I
11	Application approved by HOD, return to IO	Accepted (HOD)	O
12	Application rejected by HOD, return back to IO	Rejected (HOD)	O
15	Application approved by Kulliyyah, return back to IO	Accepted (Kulliyyah)	I
71	Email send to applicant to upload images and videos 	Upload Documents 2(IO -> Student)	O
81	Documents Uploaded before coming back to IIUM	completed	O
10	In progress, application submitted by student to IO	In process	I/O
\.


--
-- Data for Name: auth_assignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_assignment (item_name, user_id, created_at) FROM stdin;
superAdmin	1	\N
\.


--
-- Data for Name: auth_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_item (name, type, description, rule_name, data, created_at, updated_at) FROM stdin;
superAdmin	1	superAdmin	\N	\N	\N	\N
\.


--
-- Data for Name: auth_item_child; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_item_child (parent, child) FROM stdin;
\.


--
-- Data for Name: auth_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_rule (name, data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, iso3, numeric_code, iso2, phonecode, capital, currency, currency_name, currency_symbol, tld, native_name, region, region_id, subregion, subregion_id, nationality, timezones, translations, latitude, longitude, emoji, emojiu, created_at, updated_at, flag, wikidataid) FROM stdin;
1	Afghanistan	AFG	004	AF	93	Kabul	AFN	Afghan afghani	؋	.af	افغانستان	Asia	3	Southern Asia	14	Afghan	[{\\"zoneName\\":\\"Asia/Kabul\\",\\"gmtOffset\\":16200,\\"gmtOffsetName\\":\\"UTC+04:30\\",\\"abbreviation\\":\\"AFT\\",\\"tzName\\":\\"Afghanistan Time\\"}]	{\\"kr\\":\\"아프가니스탄\\",\\"pt-BR\\":\\"Afeganistão\\",\\"pt\\":\\"Afeganistão\\",\\"nl\\":\\"Afghanistan\\",\\"hr\\":\\"Afganistan\\",\\"fa\\":\\"افغانستان\\",\\"de\\":\\"Afghanistan\\",\\"es\\":\\"Afganistán\\",\\"fr\\":\\"Afghanistan\\",\\"ja\\":\\"アフガニスタン\\",\\"it\\":\\"Afghanistan\\",\\"cn\\":\\"阿富汗\\",\\"tr\\":\\"Afganistan\\"}	33.00000000	65.00000000	🇦🇫	U+1F1E6 U+1F1EB	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q889
2	Aland Islands	ALA	248	AX	+358-18	Mariehamn	EUR	Euro	€	.ax	Åland	Europe	4	Northern Europe	18	Aland Island	[{\\"zoneName\\":\\"Europe/Mariehamn\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"올란드 제도\\",\\"pt-BR\\":\\"Ilhas de Aland\\",\\"pt\\":\\"Ilhas de Aland\\",\\"nl\\":\\"Ålandeilanden\\",\\"hr\\":\\"Ålandski otoci\\",\\"fa\\":\\"جزایر الند\\",\\"de\\":\\"Åland\\",\\"es\\":\\"Alandia\\",\\"fr\\":\\"Åland\\",\\"ja\\":\\"オーランド諸島\\",\\"it\\":\\"Isole Aland\\",\\"cn\\":\\"奥兰群岛\\",\\"tr\\":\\"Åland Adalari\\"}	60.11666700	19.90000000	🇦🇽	U+1F1E6 U+1F1FD	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
3	Albania	ALB	008	AL	355	Tirana	ALL	Albanian lek	Lek	.al	Shqipëria	Europe	4	Southern Europe	16	Albanian 	[{\\"zoneName\\":\\"Europe/Tirane\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"알바니아\\",\\"pt-BR\\":\\"Albânia\\",\\"pt\\":\\"Albânia\\",\\"nl\\":\\"Albanië\\",\\"hr\\":\\"Albanija\\",\\"fa\\":\\"آلبانی\\",\\"de\\":\\"Albanien\\",\\"es\\":\\"Albania\\",\\"fr\\":\\"Albanie\\",\\"ja\\":\\"アルバニア\\",\\"it\\":\\"Albania\\",\\"cn\\":\\"阿尔巴尼亚\\",\\"tr\\":\\"Arnavutluk\\"}	41.00000000	20.00000000	🇦🇱	U+1F1E6 U+1F1F1	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q222
4	Algeria	DZA	012	DZ	213	Algiers	DZD	Algerian dinar	دج	.dz	الجزائر	Africa	1	Northern Africa	1	Algerian	[{\\"zoneName\\":\\"Africa/Algiers\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"알제리\\",\\"pt-BR\\":\\"Argélia\\",\\"pt\\":\\"Argélia\\",\\"nl\\":\\"Algerije\\",\\"hr\\":\\"Alžir\\",\\"fa\\":\\"الجزایر\\",\\"de\\":\\"Algerien\\",\\"es\\":\\"Argelia\\",\\"fr\\":\\"Algérie\\",\\"ja\\":\\"アルジェリア\\",\\"it\\":\\"Algeria\\",\\"cn\\":\\"阿尔及利亚\\",\\"tr\\":\\"Cezayir\\"}	28.00000000	3.00000000	🇩🇿	U+1F1E9 U+1F1FF	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q262
5	American Samoa	ASM	016	AS	+1-684	Pago Pago	USD	US Dollar	$	.as	American Samoa	Oceania	5	Polynesia	22	American Samoan	[{\\"zoneName\\":\\"Pacific/Pago_Pago\\",\\"gmtOffset\\":-39600,\\"gmtOffsetName\\":\\"UTC-11:00\\",\\"abbreviation\\":\\"SST\\",\\"tzName\\":\\"Samoa Standard Time\\"}]	{\\"kr\\":\\"아메리칸사모아\\",\\"pt-BR\\":\\"Samoa Americana\\",\\"pt\\":\\"Samoa Americana\\",\\"nl\\":\\"Amerikaans Samoa\\",\\"hr\\":\\"Američka Samoa\\",\\"fa\\":\\"ساموآی آمریکا\\",\\"de\\":\\"Amerikanisch-Samoa\\",\\"es\\":\\"Samoa Americana\\",\\"fr\\":\\"Samoa américaines\\",\\"ja\\":\\"アメリカ領サモア\\",\\"it\\":\\"Samoa Americane\\",\\"cn\\":\\"美属萨摩亚\\",\\"tr\\":\\"Amerikan Samoasi\\"}	-14.33333333	-170.00000000	🇦🇸	U+1F1E6 U+1F1F8	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
6	Andorra	AND	020	AD	376	Andorra la Vella	EUR	Euro	€	.ad	Andorra	Europe	4	Southern Europe	16	Andorran	[{\\"zoneName\\":\\"Europe/Andorra\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"안도라\\",\\"pt-BR\\":\\"Andorra\\",\\"pt\\":\\"Andorra\\",\\"nl\\":\\"Andorra\\",\\"hr\\":\\"Andora\\",\\"fa\\":\\"آندورا\\",\\"de\\":\\"Andorra\\",\\"es\\":\\"Andorra\\",\\"fr\\":\\"Andorre\\",\\"ja\\":\\"アンドラ\\",\\"it\\":\\"Andorra\\",\\"cn\\":\\"安道尔\\",\\"tr\\":\\"Andorra\\"}	42.50000000	1.50000000	🇦🇩	U+1F1E6 U+1F1E9	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q228
7	Angola	AGO	024	AO	244	Luanda	AOA	Angolan kwanza	Kz	.ao	Angola	Africa	1	Middle Africa	2	Angolan	[{\\"zoneName\\":\\"Africa/Luanda\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"WAT\\",\\"tzName\\":\\"West Africa Time\\"}]	{\\"kr\\":\\"앙골라\\",\\"pt-BR\\":\\"Angola\\",\\"pt\\":\\"Angola\\",\\"nl\\":\\"Angola\\",\\"hr\\":\\"Angola\\",\\"fa\\":\\"آنگولا\\",\\"de\\":\\"Angola\\",\\"es\\":\\"Angola\\",\\"fr\\":\\"Angola\\",\\"ja\\":\\"アンゴラ\\",\\"it\\":\\"Angola\\",\\"cn\\":\\"安哥拉\\",\\"tr\\":\\"Angola\\"}	-12.50000000	18.50000000	🇦🇴	U+1F1E6 U+1F1F4	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q916
8	Anguilla	AIA	660	AI	+1-264	The Valley	XCD	East Caribbean dollar	$	.ai	Anguilla	Americas	2	Caribbean	7	Anguillan	[{\\"zoneName\\":\\"America/Anguilla\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"앵귈라\\",\\"pt-BR\\":\\"Anguila\\",\\"pt\\":\\"Anguila\\",\\"nl\\":\\"Anguilla\\",\\"hr\\":\\"Angvila\\",\\"fa\\":\\"آنگویلا\\",\\"de\\":\\"Anguilla\\",\\"es\\":\\"Anguilla\\",\\"fr\\":\\"Anguilla\\",\\"ja\\":\\"アンギラ\\",\\"it\\":\\"Anguilla\\",\\"cn\\":\\"安圭拉\\",\\"tr\\":\\"Anguilla\\"}	18.25000000	-63.16666666	🇦🇮	U+1F1E6 U+1F1EE	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
9	Antarctica	ATA	010	AQ	672		AAD	Antarctican dollar	$	.aq	Antarctica	Polar	6		\N	Antarctic	[{\\"zoneName\\":\\"Antarctica/Casey\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"AWST\\",\\"tzName\\":\\"Australian Western Standard Time\\"},{\\"zoneName\\":\\"Antarctica/Davis\\",\\"gmtOffset\\":25200,\\"gmtOffsetName\\":\\"UTC+07:00\\",\\"abbreviation\\":\\"DAVT\\",\\"tzName\\":\\"Davis Time\\"},{\\"zoneName\\":\\"Antarctica/DumontDUrville\\",\\"gmtOffset\\":36000,\\"gmtOffsetName\\":\\"UTC+10:00\\",\\"abbreviation\\":\\"DDUT\\",\\"tzName\\":\\"Dumont d\\"Urville Time\\"},{\\"zoneName\\":\\"Antarctica/Mawson\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"MAWT\\",\\"tzName\\":\\"Mawson Station Time\\"},{\\"zoneName\\":\\"Antarctica/McMurdo\\",\\"gmtOffset\\":46800,\\"gmtOffsetName\\":\\"UTC+13:00\\",\\"abbreviation\\":\\"NZDT\\",\\"tzName\\":\\"New Zealand Daylight Time\\"},{\\"zoneName\\":\\"Antarctica/Palmer\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"CLST\\",\\"tzName\\":\\"Chile Summer Time\\"},{\\"zoneName\\":\\"Antarctica/Rothera\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"ROTT\\",\\"tzName\\":\\"Rothera Research Station Time\\"},{\\"zoneName\\":\\"Antarctica/Syowa\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"SYOT\\",\\"tzName\\":\\"Showa Station Time\\"},{\\"zoneName\\":\\"Antarctica/Troll\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"},{\\"zoneName\\":\\"Antarctica/Vostok\\",\\"gmtOffset\\":21600,\\"gmtOffsetName\\":\\"UTC+06:00\\",\\"abbreviation\\":\\"VOST\\",\\"tzName\\":\\"Vostok Station Time\\"}]	{\\"kr\\":\\"남극\\",\\"pt-BR\\":\\"Antártida\\",\\"pt\\":\\"Antárctida\\",\\"nl\\":\\"Antarctica\\",\\"hr\\":\\"Antarktika\\",\\"fa\\":\\"جنوبگان\\",\\"de\\":\\"Antarktika\\",\\"es\\":\\"Antártida\\",\\"fr\\":\\"Antarctique\\",\\"ja\\":\\"南極大陸\\",\\"it\\":\\"Antartide\\",\\"cn\\":\\"南极洲\\",\\"tr\\":\\"Antartika\\"}	-74.65000000	4.48000000	🇦🇶	U+1F1E6 U+1F1F6	2018-07-21 09:11:03	2023-08-11 17:31:40	1	\N
21	Belarus	BLR	112	BY	375	Minsk	BYN	Belarusian ruble	Br	.by	Белару́сь	Europe	4	Eastern Europe	15	Belarusian	[{\\"zoneName\\":\\"Europe/Minsk\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"MSK\\",\\"tzName\\":\\"Moscow Time\\"}]	{\\"kr\\":\\"벨라루스\\",\\"pt-BR\\":\\"Bielorrússia\\",\\"pt\\":\\"Bielorrússia\\",\\"nl\\":\\"Wit-Rusland\\",\\"hr\\":\\"Bjelorusija\\",\\"fa\\":\\"بلاروس\\",\\"de\\":\\"Weißrussland\\",\\"es\\":\\"Bielorrusia\\",\\"fr\\":\\"Biélorussie\\",\\"ja\\":\\"ベラルーシ\\",\\"it\\":\\"Bielorussia\\",\\"cn\\":\\"白俄罗斯\\",\\"tr\\":\\"Belarus\\"}	53.00000000	28.00000000	🇧🇾	U+1F1E7 U+1F1FE	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q184
10	Antigua And Barbuda	ATG	028	AG	+1-268	St. John\\"s	XCD	Eastern Caribbean dollar	$	.ag	Antigua and Barbuda	Americas	2	Caribbean	7	Antiguan or Barbudan	[{\\"zoneName\\":\\"America/Antigua\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"앤티가 바부다\\",\\"pt-BR\\":\\"Antígua e Barbuda\\",\\"pt\\":\\"Antígua e Barbuda\\",\\"nl\\":\\"Antigua en Barbuda\\",\\"hr\\":\\"Antigva i Barbuda\\",\\"fa\\":\\"آنتیگوا و باربودا\\",\\"de\\":\\"Antigua und Barbuda\\",\\"es\\":\\"Antigua y Barbuda\\",\\"fr\\":\\"Antigua-et-Barbuda\\",\\"ja\\":\\"アンティグア・バーブーダ\\",\\"it\\":\\"Antigua e Barbuda\\",\\"cn\\":\\"安提瓜和巴布达\\",\\"tr\\":\\"Antigua Ve Barbuda\\"}	17.05000000	-61.80000000	🇦🇬	U+1F1E6 U+1F1EC	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q781
11	Argentina	ARG	032	AR	54	Buenos Aires	ARS	Argentine peso	$	.ar	Argentina	Americas	2	South America	8	Argentine	[{\\"zoneName\\":\\"America/Argentina/Buenos_Aires\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"ART\\",\\"tzName\\":\\"Argentina Time\\"},{\\"zoneName\\":\\"America/Argentina/Catamarca\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"ART\\",\\"tzName\\":\\"Argentina Time\\"},{\\"zoneName\\":\\"America/Argentina/Cordoba\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"ART\\",\\"tzName\\":\\"Argentina Time\\"},{\\"zoneName\\":\\"America/Argentina/Jujuy\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"ART\\",\\"tzName\\":\\"Argentina Time\\"},{\\"zoneName\\":\\"America/Argentina/La_Rioja\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"ART\\",\\"tzName\\":\\"Argentina Time\\"},{\\"zoneName\\":\\"America/Argentina/Mendoza\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"ART\\",\\"tzName\\":\\"Argentina Time\\"},{\\"zoneName\\":\\"America/Argentina/Rio_Gallegos\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"ART\\",\\"tzName\\":\\"Argentina Time\\"},{\\"zoneName\\":\\"America/Argentina/Salta\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"ART\\",\\"tzName\\":\\"Argentina Time\\"},{\\"zoneName\\":\\"America/Argentina/San_Juan\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"ART\\",\\"tzName\\":\\"Argentina Time\\"},{\\"zoneName\\":\\"America/Argentina/San_Luis\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"ART\\",\\"tzName\\":\\"Argentina Time\\"},{\\"zoneName\\":\\"America/Argentina/Tucuman\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"ART\\",\\"tzName\\":\\"Argentina Time\\"},{\\"zoneName\\":\\"America/Argentina/Ushuaia\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"ART\\",\\"tzName\\":\\"Argentina Time\\"}]	{\\"kr\\":\\"아르헨티나\\",\\"pt-BR\\":\\"Argentina\\",\\"pt\\":\\"Argentina\\",\\"nl\\":\\"Argentinië\\",\\"hr\\":\\"Argentina\\",\\"fa\\":\\"آرژانتین\\",\\"de\\":\\"Argentinien\\",\\"es\\":\\"Argentina\\",\\"fr\\":\\"Argentine\\",\\"ja\\":\\"アルゼンチン\\",\\"it\\":\\"Argentina\\",\\"cn\\":\\"阿根廷\\",\\"tr\\":\\"Arjantin\\"}	-34.00000000	-64.00000000	🇦🇷	U+1F1E6 U+1F1F7	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q414
12	Armenia	ARM	051	AM	374	Yerevan	AMD	Armenian dram	֏	.am	Հայաստան	Asia	3	Western Asia	11	Armenian	[{\\"zoneName\\":\\"Asia/Yerevan\\",\\"gmtOffset\\":14400,\\"gmtOffsetName\\":\\"UTC+04:00\\",\\"abbreviation\\":\\"AMT\\",\\"tzName\\":\\"Armenia Time\\"}]	{\\"kr\\":\\"아르메니아\\",\\"pt-BR\\":\\"Armênia\\",\\"pt\\":\\"Arménia\\",\\"nl\\":\\"Armenië\\",\\"hr\\":\\"Armenija\\",\\"fa\\":\\"ارمنستان\\",\\"de\\":\\"Armenien\\",\\"es\\":\\"Armenia\\",\\"fr\\":\\"Arménie\\",\\"ja\\":\\"アルメニア\\",\\"it\\":\\"Armenia\\",\\"cn\\":\\"亚美尼亚\\",\\"tr\\":\\"Ermenistan\\"}	40.00000000	45.00000000	🇦🇲	U+1F1E6 U+1F1F2	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q399
13	Aruba	ABW	533	AW	297	Oranjestad	AWG	Aruban florin	ƒ	.aw	Aruba	Americas	2	Caribbean	7	Aruban	[{\\"zoneName\\":\\"America/Aruba\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"아루바\\",\\"pt-BR\\":\\"Aruba\\",\\"pt\\":\\"Aruba\\",\\"nl\\":\\"Aruba\\",\\"hr\\":\\"Aruba\\",\\"fa\\":\\"آروبا\\",\\"de\\":\\"Aruba\\",\\"es\\":\\"Aruba\\",\\"fr\\":\\"Aruba\\",\\"ja\\":\\"アルバ\\",\\"it\\":\\"Aruba\\",\\"cn\\":\\"阿鲁巴\\",\\"tr\\":\\"Aruba\\"}	12.50000000	-69.96666666	🇦🇼	U+1F1E6 U+1F1FC	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
14	Australia	AUS	036	AU	61	Canberra	AUD	Australian dollar	$	.au	Australia	Oceania	5	Australia and New Zealand	19	Australian	[{\\"zoneName\\":\\"Antarctica/Macquarie\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"MIST\\",\\"tzName\\":\\"Macquarie Island Station Time\\"},{\\"zoneName\\":\\"Australia/Adelaide\\",\\"gmtOffset\\":37800,\\"gmtOffsetName\\":\\"UTC+10:30\\",\\"abbreviation\\":\\"ACDT\\",\\"tzName\\":\\"Australian Central Daylight Saving Time\\"},{\\"zoneName\\":\\"Australia/Brisbane\\",\\"gmtOffset\\":36000,\\"gmtOffsetName\\":\\"UTC+10:00\\",\\"abbreviation\\":\\"AEST\\",\\"tzName\\":\\"Australian Eastern Standard Time\\"},{\\"zoneName\\":\\"Australia/Broken_Hill\\",\\"gmtOffset\\":37800,\\"gmtOffsetName\\":\\"UTC+10:30\\",\\"abbreviation\\":\\"ACDT\\",\\"tzName\\":\\"Australian Central Daylight Saving Time\\"},{\\"zoneName\\":\\"Australia/Currie\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"AEDT\\",\\"tzName\\":\\"Australian Eastern Daylight Saving Time\\"},{\\"zoneName\\":\\"Australia/Darwin\\",\\"gmtOffset\\":34200,\\"gmtOffsetName\\":\\"UTC+09:30\\",\\"abbreviation\\":\\"ACST\\",\\"tzName\\":\\"Australian Central Standard Time\\"},{\\"zoneName\\":\\"Australia/Eucla\\",\\"gmtOffset\\":31500,\\"gmtOffsetName\\":\\"UTC+08:45\\",\\"abbreviation\\":\\"ACWST\\",\\"tzName\\":\\"Australian Central Western Standard Time (Unofficial)\\"},{\\"zoneName\\":\\"Australia/Hobart\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"AEDT\\",\\"tzName\\":\\"Australian Eastern Daylight Saving Time\\"},{\\"zoneName\\":\\"Australia/Lindeman\\",\\"gmtOffset\\":36000,\\"gmtOffsetName\\":\\"UTC+10:00\\",\\"abbreviation\\":\\"AEST\\",\\"tzName\\":\\"Australian Eastern Standard Time\\"},{\\"zoneName\\":\\"Australia/Lord_Howe\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"LHST\\",\\"tzName\\":\\"Lord Howe Summer Time\\"},{\\"zoneName\\":\\"Australia/Melbourne\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"AEDT\\",\\"tzName\\":\\"Australian Eastern Daylight Saving Time\\"},{\\"zoneName\\":\\"Australia/Perth\\",\\"gmtOffset\\":28800,\\"gmtOffsetName\\":\\"UTC+08:00\\",\\"abbreviation\\":\\"AWST\\",\\"tzName\\":\\"Australian Western Standard Time\\"},{\\"zoneName\\":\\"Australia/Sydney\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"AEDT\\",\\"tzName\\":\\"Australian Eastern Daylight Saving Time\\"}]	{\\"kr\\":\\"호주\\",\\"pt-BR\\":\\"Austrália\\",\\"pt\\":\\"Austrália\\",\\"nl\\":\\"Australië\\",\\"hr\\":\\"Australija\\",\\"fa\\":\\"استرالیا\\",\\"de\\":\\"Australien\\",\\"es\\":\\"Australia\\",\\"fr\\":\\"Australie\\",\\"ja\\":\\"オーストラリア\\",\\"it\\":\\"Australia\\",\\"cn\\":\\"澳大利亚\\",\\"tr\\":\\"Avustralya\\"}	-27.00000000	133.00000000	🇦🇺	U+1F1E6 U+1F1FA	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q408
15	Austria	AUT	040	AT	43	Vienna	EUR	Euro	€	.at	Österreich	Europe	4	Western Europe	17	Austrian	[{\\"zoneName\\":\\"Europe/Vienna\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"오스트리아\\",\\"pt-BR\\":\\"áustria\\",\\"pt\\":\\"áustria\\",\\"nl\\":\\"Oostenrijk\\",\\"hr\\":\\"Austrija\\",\\"fa\\":\\"اتریش\\",\\"de\\":\\"Österreich\\",\\"es\\":\\"Austria\\",\\"fr\\":\\"Autriche\\",\\"ja\\":\\"オーストリア\\",\\"it\\":\\"Austria\\",\\"cn\\":\\"奥地利\\",\\"tr\\":\\"Avusturya\\"}	47.33333333	13.33333333	🇦🇹	U+1F1E6 U+1F1F9	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q40
16	Azerbaijan	AZE	031	AZ	994	Baku	AZN	Azerbaijani manat	m	.az	Azərbaycan	Asia	3	Western Asia	11	Azerbaijani, Azeri	[{\\"zoneName\\":\\"Asia/Baku\\",\\"gmtOffset\\":14400,\\"gmtOffsetName\\":\\"UTC+04:00\\",\\"abbreviation\\":\\"AZT\\",\\"tzName\\":\\"Azerbaijan Time\\"}]	{\\"kr\\":\\"아제르바이잔\\",\\"pt-BR\\":\\"Azerbaijão\\",\\"pt\\":\\"Azerbaijão\\",\\"nl\\":\\"Azerbeidzjan\\",\\"hr\\":\\"Azerbajdžan\\",\\"fa\\":\\"آذربایجان\\",\\"de\\":\\"Aserbaidschan\\",\\"es\\":\\"Azerbaiyán\\",\\"fr\\":\\"Azerbaïdjan\\",\\"ja\\":\\"アゼルバイジャン\\",\\"it\\":\\"Azerbaijan\\",\\"cn\\":\\"阿塞拜疆\\",\\"tr\\":\\"Azerbaycan\\"}	40.50000000	47.50000000	🇦🇿	U+1F1E6 U+1F1FF	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q227
17	The Bahamas	BHS	044	BS	+1-242	Nassau	BSD	Bahamian dollar	B$	.bs	Bahamas	Americas	2	Caribbean	7	Bahamian	[{\\"zoneName\\":\\"America/Nassau\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America)\\"}]	{\\"kr\\":\\"바하마\\",\\"pt-BR\\":\\"Bahamas\\",\\"pt\\":\\"Baamas\\",\\"nl\\":\\"Bahama’s\\",\\"hr\\":\\"Bahami\\",\\"fa\\":\\"باهاما\\",\\"de\\":\\"Bahamas\\",\\"es\\":\\"Bahamas\\",\\"fr\\":\\"Bahamas\\",\\"ja\\":\\"バハマ\\",\\"it\\":\\"Bahamas\\",\\"cn\\":\\"巴哈马\\",\\"tr\\":\\"Bahamalar\\"}	24.25000000	-76.00000000	🇧🇸	U+1F1E7 U+1F1F8	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q778
18	Bahrain	BHR	048	BH	973	Manama	BHD	Bahraini dinar	.د.ب	.bh	‏البحرين	Asia	3	Western Asia	11	Bahraini	[{\\"zoneName\\":\\"Asia/Bahrain\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Arabia Standard Time\\"}]	{\\"kr\\":\\"바레인\\",\\"pt-BR\\":\\"Bahrein\\",\\"pt\\":\\"Barém\\",\\"nl\\":\\"Bahrein\\",\\"hr\\":\\"Bahrein\\",\\"fa\\":\\"بحرین\\",\\"de\\":\\"Bahrain\\",\\"es\\":\\"Bahrein\\",\\"fr\\":\\"Bahreïn\\",\\"ja\\":\\"バーレーン\\",\\"it\\":\\"Bahrein\\",\\"cn\\":\\"巴林\\",\\"tr\\":\\"Bahreyn\\"}	26.00000000	50.55000000	🇧🇭	U+1F1E7 U+1F1ED	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q398
19	Bangladesh	BGD	050	BD	880	Dhaka	BDT	Bangladeshi taka	৳	.bd	Bangladesh	Asia	3	Southern Asia	14	Bangladeshi	[{\\"zoneName\\":\\"Asia/Dhaka\\",\\"gmtOffset\\":21600,\\"gmtOffsetName\\":\\"UTC+06:00\\",\\"abbreviation\\":\\"BDT\\",\\"tzName\\":\\"Bangladesh Standard Time\\"}]	{\\"kr\\":\\"방글라데시\\",\\"pt-BR\\":\\"Bangladesh\\",\\"pt\\":\\"Bangladeche\\",\\"nl\\":\\"Bangladesh\\",\\"hr\\":\\"Bangladeš\\",\\"fa\\":\\"بنگلادش\\",\\"de\\":\\"Bangladesch\\",\\"es\\":\\"Bangladesh\\",\\"fr\\":\\"Bangladesh\\",\\"ja\\":\\"バングラデシュ\\",\\"it\\":\\"Bangladesh\\",\\"cn\\":\\"孟加拉\\",\\"tr\\":\\"Bangladeş\\"}	24.00000000	90.00000000	🇧🇩	U+1F1E7 U+1F1E9	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q902
20	Barbados	BRB	052	BB	+1-246	Bridgetown	BBD	Barbadian dollar	Bds$	.bb	Barbados	Americas	2	Caribbean	7	Barbadian	[{\\"zoneName\\":\\"America/Barbados\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"바베이도스\\",\\"pt-BR\\":\\"Barbados\\",\\"pt\\":\\"Barbados\\",\\"nl\\":\\"Barbados\\",\\"hr\\":\\"Barbados\\",\\"fa\\":\\"باربادوس\\",\\"de\\":\\"Barbados\\",\\"es\\":\\"Barbados\\",\\"fr\\":\\"Barbade\\",\\"ja\\":\\"バルバドス\\",\\"it\\":\\"Barbados\\",\\"cn\\":\\"巴巴多斯\\",\\"tr\\":\\"Barbados\\"}	13.16666666	-59.53333333	🇧🇧	U+1F1E7 U+1F1E7	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q244
22	Belgium	BEL	056	BE	32	Brussels	EUR	Euro	€	.be	België	Europe	4	Western Europe	17	Belgian	[{\\"zoneName\\":\\"Europe/Brussels\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"벨기에\\",\\"pt-BR\\":\\"Bélgica\\",\\"pt\\":\\"Bélgica\\",\\"nl\\":\\"België\\",\\"hr\\":\\"Belgija\\",\\"fa\\":\\"بلژیک\\",\\"de\\":\\"Belgien\\",\\"es\\":\\"Bélgica\\",\\"fr\\":\\"Belgique\\",\\"ja\\":\\"ベルギー\\",\\"it\\":\\"Belgio\\",\\"cn\\":\\"比利时\\",\\"tr\\":\\"Belçika\\"}	50.83333333	4.00000000	🇧🇪	U+1F1E7 U+1F1EA	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q31
23	Belize	BLZ	084	BZ	501	Belmopan	BZD	Belize dollar	$	.bz	Belize	Americas	2	Central America	9	Belizean	[{\\"zoneName\\":\\"America/Belize\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America)\\"}]	{\\"kr\\":\\"벨리즈\\",\\"pt-BR\\":\\"Belize\\",\\"pt\\":\\"Belize\\",\\"nl\\":\\"Belize\\",\\"hr\\":\\"Belize\\",\\"fa\\":\\"بلیز\\",\\"de\\":\\"Belize\\",\\"es\\":\\"Belice\\",\\"fr\\":\\"Belize\\",\\"ja\\":\\"ベリーズ\\",\\"it\\":\\"Belize\\",\\"cn\\":\\"伯利兹\\",\\"tr\\":\\"Belize\\"}	17.25000000	-88.75000000	🇧🇿	U+1F1E7 U+1F1FF	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q242
24	Benin	BEN	204	BJ	229	Porto-Novo	XOF	West African CFA franc	CFA	.bj	Bénin	Africa	1	Western Africa	3	Beninese, Beninois	[{\\"zoneName\\":\\"Africa/Porto-Novo\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"WAT\\",\\"tzName\\":\\"West Africa Time\\"}]	{\\"kr\\":\\"베냉\\",\\"pt-BR\\":\\"Benin\\",\\"pt\\":\\"Benim\\",\\"nl\\":\\"Benin\\",\\"hr\\":\\"Benin\\",\\"fa\\":\\"بنین\\",\\"de\\":\\"Benin\\",\\"es\\":\\"Benín\\",\\"fr\\":\\"Bénin\\",\\"ja\\":\\"ベナン\\",\\"it\\":\\"Benin\\",\\"cn\\":\\"贝宁\\",\\"tr\\":\\"Benin\\"}	9.50000000	2.25000000	🇧🇯	U+1F1E7 U+1F1EF	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q962
25	Bermuda	BMU	060	BM	+1-441	Hamilton	BMD	Bermudian dollar	$	.bm	Bermuda	Americas	2	Northern America	6	Bermudian, Bermudan	[{\\"zoneName\\":\\"Atlantic/Bermuda\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"버뮤다\\",\\"pt-BR\\":\\"Bermudas\\",\\"pt\\":\\"Bermudas\\",\\"nl\\":\\"Bermuda\\",\\"hr\\":\\"Bermudi\\",\\"fa\\":\\"برمودا\\",\\"de\\":\\"Bermuda\\",\\"es\\":\\"Bermudas\\",\\"fr\\":\\"Bermudes\\",\\"ja\\":\\"バミューダ\\",\\"it\\":\\"Bermuda\\",\\"cn\\":\\"百慕大\\",\\"tr\\":\\"Bermuda\\"}	32.33333333	-64.75000000	🇧🇲	U+1F1E7 U+1F1F2	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
26	Bhutan	BTN	064	BT	975	Thimphu	BTN	Bhutanese ngultrum	Nu.	.bt	ʼbrug-yul	Asia	3	Southern Asia	14	Bhutanese	[{\\"zoneName\\":\\"Asia/Thimphu\\",\\"gmtOffset\\":21600,\\"gmtOffsetName\\":\\"UTC+06:00\\",\\"abbreviation\\":\\"BTT\\",\\"tzName\\":\\"Bhutan Time\\"}]	{\\"kr\\":\\"부탄\\",\\"pt-BR\\":\\"Butão\\",\\"pt\\":\\"Butão\\",\\"nl\\":\\"Bhutan\\",\\"hr\\":\\"Butan\\",\\"fa\\":\\"بوتان\\",\\"de\\":\\"Bhutan\\",\\"es\\":\\"Bután\\",\\"fr\\":\\"Bhoutan\\",\\"ja\\":\\"ブータン\\",\\"it\\":\\"Bhutan\\",\\"cn\\":\\"不丹\\",\\"tr\\":\\"Butan\\"}	27.50000000	90.50000000	🇧🇹	U+1F1E7 U+1F1F9	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q917
27	Bolivia	BOL	068	BO	591	Sucre	BOB	Bolivian boliviano	Bs.	.bo	Bolivia	Americas	2	South America	8	Bolivian	[{\\"zoneName\\":\\"America/La_Paz\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"BOT\\",\\"tzName\\":\\"Bolivia Time\\"}]	{\\"kr\\":\\"볼리비아\\",\\"pt-BR\\":\\"Bolívia\\",\\"pt\\":\\"Bolívia\\",\\"nl\\":\\"Bolivia\\",\\"hr\\":\\"Bolivija\\",\\"fa\\":\\"بولیوی\\",\\"de\\":\\"Bolivien\\",\\"es\\":\\"Bolivia\\",\\"fr\\":\\"Bolivie\\",\\"ja\\":\\"ボリビア多民族国\\",\\"it\\":\\"Bolivia\\",\\"cn\\":\\"玻利维亚\\",\\"tr\\":\\"Bolivya\\"}	-17.00000000	-65.00000000	🇧🇴	U+1F1E7 U+1F1F4	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q750
28	Bosnia and Herzegovina	BIH	070	BA	387	Sarajevo	BAM	Bosnia and Herzegovina convertible mark	KM	.ba	Bosna i Hercegovina	Europe	4	Southern Europe	16	Bosnian or Herzegovinian	[{\\"zoneName\\":\\"Europe/Sarajevo\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"보스니아 헤르체고비나\\",\\"pt-BR\\":\\"Bósnia e Herzegovina\\",\\"pt\\":\\"Bósnia e Herzegovina\\",\\"nl\\":\\"Bosnië en Herzegovina\\",\\"hr\\":\\"Bosna i Hercegovina\\",\\"fa\\":\\"بوسنی و هرزگوین\\",\\"de\\":\\"Bosnien und Herzegowina\\",\\"es\\":\\"Bosnia y Herzegovina\\",\\"fr\\":\\"Bosnie-Herzégovine\\",\\"ja\\":\\"ボスニア・ヘルツェゴビナ\\",\\"it\\":\\"Bosnia ed Erzegovina\\",\\"cn\\":\\"波斯尼亚和黑塞哥维那\\",\\"tr\\":\\"Bosna Hersek\\"}	44.00000000	18.00000000	🇧🇦	U+1F1E7 U+1F1E6	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q225
29	Botswana	BWA	072	BW	267	Gaborone	BWP	Botswana pula	P	.bw	Botswana	Africa	1	Southern Africa	5	Motswana, Botswanan	[{\\"zoneName\\":\\"Africa/Gaborone\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"CAT\\",\\"tzName\\":\\"Central Africa Time\\"}]	{\\"kr\\":\\"보츠와나\\",\\"pt-BR\\":\\"Botsuana\\",\\"pt\\":\\"Botsuana\\",\\"nl\\":\\"Botswana\\",\\"hr\\":\\"Bocvana\\",\\"fa\\":\\"بوتسوانا\\",\\"de\\":\\"Botswana\\",\\"es\\":\\"Botswana\\",\\"fr\\":\\"Botswana\\",\\"ja\\":\\"ボツワナ\\",\\"it\\":\\"Botswana\\",\\"cn\\":\\"博茨瓦纳\\",\\"tr\\":\\"Botsvana\\"}	-22.00000000	24.00000000	🇧🇼	U+1F1E7 U+1F1FC	2018-07-21 09:11:03	2023-08-11 17:31:40	1	Q963
30	Bouvet Island	BVT	074	BV	0055		NOK	Norwegian Krone	kr	.bv	Bouvetøya		\N		\N	Bouvet Island	[{\\"zoneName\\":\\"Europe/Oslo\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"부벳 섬\\",\\"pt-BR\\":\\"Ilha Bouvet\\",\\"pt\\":\\"Ilha Bouvet\\",\\"nl\\":\\"Bouveteiland\\",\\"hr\\":\\"Otok Bouvet\\",\\"fa\\":\\"جزیره بووه\\",\\"de\\":\\"Bouvetinsel\\",\\"es\\":\\"Isla Bouvet\\",\\"fr\\":\\"Île Bouvet\\",\\"ja\\":\\"ブーベ島\\",\\"it\\":\\"Isola Bouvet\\",\\"cn\\":\\"布维岛\\",\\"tr\\":\\"Bouvet Adasi\\"}	-54.43333333	3.40000000	🇧🇻	U+1F1E7 U+1F1FB	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
31	Brazil	BRA	076	BR	55	Brasilia	BRL	Brazilian real	R$	.br	Brasil	Americas	2	South America	8	Brazilian	[{\\"zoneName\\":\\"America/Araguaina\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"BRT\\",\\"tzName\\":\\"Brasília Time\\"},{\\"zoneName\\":\\"America/Bahia\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"BRT\\",\\"tzName\\":\\"Brasília Time\\"},{\\"zoneName\\":\\"America/Belem\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"BRT\\",\\"tzName\\":\\"Brasília Time\\"},{\\"zoneName\\":\\"America/Boa_Vista\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AMT\\",\\"tzName\\":\\"Amazon Time (Brazil)[3\\"},{\\"zoneName\\":\\"America/Campo_Grande\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AMT\\",\\"tzName\\":\\"Amazon Time (Brazil)[3\\"},{\\"zoneName\\":\\"America/Cuiaba\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"BRT\\",\\"tzName\\":\\"Brasilia Time\\"},{\\"zoneName\\":\\"America/Eirunepe\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"ACT\\",\\"tzName\\":\\"Acre Time\\"},{\\"zoneName\\":\\"America/Fortaleza\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"BRT\\",\\"tzName\\":\\"Brasília Time\\"},{\\"zoneName\\":\\"America/Maceio\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"BRT\\",\\"tzName\\":\\"Brasília Time\\"},{\\"zoneName\\":\\"America/Manaus\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AMT\\",\\"tzName\\":\\"Amazon Time (Brazil)\\"},{\\"zoneName\\":\\"America/Noronha\\",\\"gmtOffset\\":-7200,\\"gmtOffsetName\\":\\"UTC-02:00\\",\\"abbreviation\\":\\"FNT\\",\\"tzName\\":\\"Fernando de Noronha Time\\"},{\\"zoneName\\":\\"America/Porto_Velho\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AMT\\",\\"tzName\\":\\"Amazon Time (Brazil)[3\\"},{\\"zoneName\\":\\"America/Recife\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"BRT\\",\\"tzName\\":\\"Brasília Time\\"},{\\"zoneName\\":\\"America/Rio_Branco\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"ACT\\",\\"tzName\\":\\"Acre Time\\"},{\\"zoneName\\":\\"America/Santarem\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"BRT\\",\\"tzName\\":\\"Brasília Time\\"},{\\"zoneName\\":\\"America/Sao_Paulo\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"BRT\\",\\"tzName\\":\\"Brasília Time\\"}]	{\\"kr\\":\\"브라질\\",\\"pt-BR\\":\\"Brasil\\",\\"pt\\":\\"Brasil\\",\\"nl\\":\\"Brazilië\\",\\"hr\\":\\"Brazil\\",\\"fa\\":\\"برزیل\\",\\"de\\":\\"Brasilien\\",\\"es\\":\\"Brasil\\",\\"fr\\":\\"Brésil\\",\\"ja\\":\\"ブラジル\\",\\"it\\":\\"Brasile\\",\\"cn\\":\\"巴西\\",\\"tr\\":\\"Brezilya\\"}	-10.00000000	-55.00000000	🇧🇷	U+1F1E7 U+1F1F7	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q155
32	British Indian Ocean Territory	IOT	086	IO	246	Diego Garcia	USD	United States dollar	$	.io	British Indian Ocean Territory	Africa	1	Eastern Africa	4	BIOT	[{\\"zoneName\\":\\"Indian/Chagos\\",\\"gmtOffset\\":21600,\\"gmtOffsetName\\":\\"UTC+06:00\\",\\"abbreviation\\":\\"IOT\\",\\"tzName\\":\\"Indian Ocean Time\\"}]	{\\"kr\\":\\"영국령 인도양 지역\\",\\"pt-BR\\":\\"Território Britânico do Oceano íÍdico\\",\\"pt\\":\\"Território Britânico do Oceano Índico\\",\\"nl\\":\\"Britse Gebieden in de Indische Oceaan\\",\\"hr\\":\\"Britanski Indijskooceanski teritorij\\",\\"fa\\":\\"قلمرو بریتانیا در اقیانوس هند\\",\\"de\\":\\"Britisches Territorium im Indischen Ozean\\",\\"es\\":\\"Territorio Británico del Océano Índico\\",\\"fr\\":\\"Territoire britannique de l\\"océan Indien\\",\\"ja\\":\\"イギリス領インド洋地域\\",\\"it\\":\\"Territorio britannico dell\\"oceano indiano\\",\\"cn\\":\\"英属印度洋领地\\",\\"tr\\":\\"Britanya Hint Okyanusu Topraklari\\"}	-6.00000000	71.50000000	🇮🇴	U+1F1EE U+1F1F4	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
33	Brunei	BRN	096	BN	673	Bandar Seri Begawan	BND	Brunei dollar	B$	.bn	Negara Brunei Darussalam	Asia	3	South-Eastern Asia	13	Bruneian	[{\\"zoneName\\":\\"Asia/Brunei\\",\\"gmtOffset\\":28800,\\"gmtOffsetName\\":\\"UTC+08:00\\",\\"abbreviation\\":\\"BNT\\",\\"tzName\\":\\"Brunei Darussalam Time\\"}]	{\\"kr\\":\\"브루나이\\",\\"pt-BR\\":\\"Brunei\\",\\"pt\\":\\"Brunei\\",\\"nl\\":\\"Brunei\\",\\"hr\\":\\"Brunej\\",\\"fa\\":\\"برونئی\\",\\"de\\":\\"Brunei\\",\\"es\\":\\"Brunei\\",\\"fr\\":\\"Brunei\\",\\"ja\\":\\"ブルネイ・ダルサラーム\\",\\"it\\":\\"Brunei\\",\\"cn\\":\\"文莱\\",\\"tr\\":\\"Brunei\\"}	4.50000000	114.66666666	🇧🇳	U+1F1E7 U+1F1F3	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q921
34	Bulgaria	BGR	100	BG	359	Sofia	BGN	Bulgarian lev	Лв.	.bg	България	Europe	4	Eastern Europe	15	Bulgarian	[{\\"zoneName\\":\\"Europe/Sofia\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"불가리아\\",\\"pt-BR\\":\\"Bulgária\\",\\"pt\\":\\"Bulgária\\",\\"nl\\":\\"Bulgarije\\",\\"hr\\":\\"Bugarska\\",\\"fa\\":\\"بلغارستان\\",\\"de\\":\\"Bulgarien\\",\\"es\\":\\"Bulgaria\\",\\"fr\\":\\"Bulgarie\\",\\"ja\\":\\"ブルガリア\\",\\"it\\":\\"Bulgaria\\",\\"cn\\":\\"保加利亚\\",\\"tr\\":\\"Bulgaristan\\"}	43.00000000	25.00000000	🇧🇬	U+1F1E7 U+1F1EC	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q219
35	Burkina Faso	BFA	854	BF	226	Ouagadougou	XOF	West African CFA franc	CFA	.bf	Burkina Faso	Africa	1	Western Africa	3	Burkinabe	[{\\"zoneName\\":\\"Africa/Ouagadougou\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"부르키나 파소\\",\\"pt-BR\\":\\"Burkina Faso\\",\\"pt\\":\\"Burquina Faso\\",\\"nl\\":\\"Burkina Faso\\",\\"hr\\":\\"Burkina Faso\\",\\"fa\\":\\"بورکینافاسو\\",\\"de\\":\\"Burkina Faso\\",\\"es\\":\\"Burkina Faso\\",\\"fr\\":\\"Burkina Faso\\",\\"ja\\":\\"ブルキナファソ\\",\\"it\\":\\"Burkina Faso\\",\\"cn\\":\\"布基纳法索\\",\\"tr\\":\\"Burkina Faso\\"}	13.00000000	-2.00000000	🇧🇫	U+1F1E7 U+1F1EB	2018-07-21 09:11:03	2023-08-11 17:45:55	1	Q965
36	Burundi	BDI	108	BI	257	Bujumbura	BIF	Burundian franc	FBu	.bi	Burundi	Africa	1	Eastern Africa	4	Burundian	[{\\"zoneName\\":\\"Africa/Bujumbura\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"CAT\\",\\"tzName\\":\\"Central Africa Time\\"}]	{\\"kr\\":\\"부룬디\\",\\"pt-BR\\":\\"Burundi\\",\\"pt\\":\\"Burúndi\\",\\"nl\\":\\"Burundi\\",\\"hr\\":\\"Burundi\\",\\"fa\\":\\"بوروندی\\",\\"de\\":\\"Burundi\\",\\"es\\":\\"Burundi\\",\\"fr\\":\\"Burundi\\",\\"ja\\":\\"ブルンジ\\",\\"it\\":\\"Burundi\\",\\"cn\\":\\"布隆迪\\",\\"tr\\":\\"Burundi\\"}	-3.50000000	30.00000000	🇧🇮	U+1F1E7 U+1F1EE	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q967
37	Cambodia	KHM	116	KH	855	Phnom Penh	KHR	Cambodian riel	KHR	.kh	Kâmpŭchéa	Asia	3	South-Eastern Asia	13	Cambodian	[{\\"zoneName\\":\\"Asia/Phnom_Penh\\",\\"gmtOffset\\":25200,\\"gmtOffsetName\\":\\"UTC+07:00\\",\\"abbreviation\\":\\"ICT\\",\\"tzName\\":\\"Indochina Time\\"}]	{\\"kr\\":\\"캄보디아\\",\\"pt-BR\\":\\"Camboja\\",\\"pt\\":\\"Camboja\\",\\"nl\\":\\"Cambodja\\",\\"hr\\":\\"Kambodža\\",\\"fa\\":\\"کامبوج\\",\\"de\\":\\"Kambodscha\\",\\"es\\":\\"Camboya\\",\\"fr\\":\\"Cambodge\\",\\"ja\\":\\"カンボジア\\",\\"it\\":\\"Cambogia\\",\\"cn\\":\\"柬埔寨\\",\\"tr\\":\\"Kamboçya\\"}	13.00000000	105.00000000	🇰🇭	U+1F1F0 U+1F1ED	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q424
38	Cameroon	CMR	120	CM	237	Yaounde	XAF	Central African CFA franc	FCFA	.cm	Cameroon	Africa	1	Middle Africa	2	Cameroonian	[{\\"zoneName\\":\\"Africa/Douala\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"WAT\\",\\"tzName\\":\\"West Africa Time\\"}]	{\\"kr\\":\\"카메룬\\",\\"pt-BR\\":\\"Camarões\\",\\"pt\\":\\"Camarões\\",\\"nl\\":\\"Kameroen\\",\\"hr\\":\\"Kamerun\\",\\"fa\\":\\"کامرون\\",\\"de\\":\\"Kamerun\\",\\"es\\":\\"Camerún\\",\\"fr\\":\\"Cameroun\\",\\"ja\\":\\"カメルーン\\",\\"it\\":\\"Camerun\\",\\"cn\\":\\"喀麦隆\\",\\"tr\\":\\"Kamerun\\"}	6.00000000	12.00000000	🇨🇲	U+1F1E8 U+1F1F2	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q1009
39	Canada	CAN	124	CA	1	Ottawa	CAD	Canadian dollar	$	.ca	Canada	Americas	2	Northern America	6	Canadian	[{\\"zoneName\\":\\"America/Atikokan\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America)\\"},{\\"zoneName\\":\\"America/Blanc-Sablon\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"},{\\"zoneName\\":\\"America/Cambridge_Bay\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America)\\"},{\\"zoneName\\":\\"America/Creston\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America)\\"},{\\"zoneName\\":\\"America/Dawson\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America)\\"},{\\"zoneName\\":\\"America/Dawson_Creek\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America)\\"},{\\"zoneName\\":\\"America/Edmonton\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America)\\"},{\\"zoneName\\":\\"America/Fort_Nelson\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America)\\"},{\\"zoneName\\":\\"America/Glace_Bay\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"},{\\"zoneName\\":\\"America/Goose_Bay\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"},{\\"zoneName\\":\\"America/Halifax\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"},{\\"zoneName\\":\\"America/Inuvik\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America\\"},{\\"zoneName\\":\\"America/Iqaluit\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Moncton\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"},{\\"zoneName\\":\\"America/Nipigon\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Pangnirtung\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Rainy_River\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Rankin_Inlet\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Regina\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Resolute\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/St_Johns\\",\\"gmtOffset\\":-12600,\\"gmtOffsetName\\":\\"UTC-03:30\\",\\"abbreviation\\":\\"NST\\",\\"tzName\\":\\"Newfoundland Standard Time\\"},{\\"zoneName\\":\\"America/Swift_Current\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Thunder_Bay\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Toronto\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Vancouver\\",\\"gmtOffset\\":-28800,\\"gmtOffsetName\\":\\"UTC-08:00\\",\\"abbreviation\\":\\"PST\\",\\"tzName\\":\\"Pacific Standard Time (North America\\"},{\\"zoneName\\":\\"America/Whitehorse\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America\\"},{\\"zoneName\\":\\"America/Winnipeg\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Yellowknife\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America\\"}]	{\\"kr\\":\\"캐나다\\",\\"pt-BR\\":\\"Canadá\\",\\"pt\\":\\"Canadá\\",\\"nl\\":\\"Canada\\",\\"hr\\":\\"Kanada\\",\\"fa\\":\\"کانادا\\",\\"de\\":\\"Kanada\\",\\"es\\":\\"Canadá\\",\\"fr\\":\\"Canada\\",\\"ja\\":\\"カナダ\\",\\"it\\":\\"Canada\\",\\"cn\\":\\"加拿大\\",\\"tr\\":\\"Kanada\\"}	60.00000000	-95.00000000	🇨🇦	U+1F1E8 U+1F1E6	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q16
40	Cape Verde	CPV	132	CV	238	Praia	CVE	Cape Verdean escudo	$	.cv	Cabo Verde	Africa	1	Western Africa	3	Verdean	[{\\"zoneName\\":\\"Atlantic/Cape_Verde\\",\\"gmtOffset\\":-3600,\\"gmtOffsetName\\":\\"UTC-01:00\\",\\"abbreviation\\":\\"CVT\\",\\"tzName\\":\\"Cape Verde Time\\"}]	{\\"kr\\":\\"카보베르데\\",\\"pt-BR\\":\\"Cabo Verde\\",\\"pt\\":\\"Cabo Verde\\",\\"nl\\":\\"Kaapverdië\\",\\"hr\\":\\"Zelenortska Republika\\",\\"fa\\":\\"کیپ ورد\\",\\"de\\":\\"Kap Verde\\",\\"es\\":\\"Cabo Verde\\",\\"fr\\":\\"Cap Vert\\",\\"ja\\":\\"カーボベルデ\\",\\"it\\":\\"Capo Verde\\",\\"cn\\":\\"佛得角\\",\\"tr\\":\\"Cabo Verde\\"}	16.00000000	-24.00000000	🇨🇻	U+1F1E8 U+1F1FB	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q1011
41	Cayman Islands	CYM	136	KY	+1-345	George Town	KYD	Cayman Islands dollar	$	.ky	Cayman Islands	Americas	2	Caribbean	7	Caymanian	[{\\"zoneName\\":\\"America/Cayman\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"}]	{\\"kr\\":\\"케이먼 제도\\",\\"pt-BR\\":\\"Ilhas Cayman\\",\\"pt\\":\\"Ilhas Caimão\\",\\"nl\\":\\"Caymaneilanden\\",\\"hr\\":\\"Kajmanski otoci\\",\\"fa\\":\\"جزایر کیمن\\",\\"de\\":\\"Kaimaninseln\\",\\"es\\":\\"Islas Caimán\\",\\"fr\\":\\"Îles Caïmans\\",\\"ja\\":\\"ケイマン諸島\\",\\"it\\":\\"Isole Cayman\\",\\"cn\\":\\"开曼群岛\\",\\"tr\\":\\"Cayman Adalari\\"}	19.50000000	-80.50000000	🇰🇾	U+1F1F0 U+1F1FE	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
42	Central African Republic	CAF	140	CF	236	Bangui	XAF	Central African CFA franc	FCFA	.cf	Ködörösêse tî Bêafrîka	Africa	1	Middle Africa	2	Central African	[{\\"zoneName\\":\\"Africa/Bangui\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"WAT\\",\\"tzName\\":\\"West Africa Time\\"}]	{\\"kr\\":\\"중앙아프리카 공화국\\",\\"pt-BR\\":\\"República Centro-Africana\\",\\"pt\\":\\"República Centro-Africana\\",\\"nl\\":\\"Centraal-Afrikaanse Republiek\\",\\"hr\\":\\"Srednjoafrička Republika\\",\\"fa\\":\\"جمهوری آفریقای مرکزی\\",\\"de\\":\\"Zentralafrikanische Republik\\",\\"es\\":\\"República Centroafricana\\",\\"fr\\":\\"République centrafricaine\\",\\"ja\\":\\"中央アフリカ共和国\\",\\"it\\":\\"Repubblica Centrafricana\\",\\"cn\\":\\"中非\\",\\"tr\\":\\"Orta Afrika Cumhuriyeti\\"}	7.00000000	21.00000000	🇨🇫	U+1F1E8 U+1F1EB	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q929
43	Chad	TCD	148	TD	235	N\\"Djamena	XAF	Central African CFA franc	FCFA	.td	Tchad	Africa	1	Middle Africa	2	Chadian	[{\\"zoneName\\":\\"Africa/Ndjamena\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"WAT\\",\\"tzName\\":\\"West Africa Time\\"}]	{\\"kr\\":\\"차드\\",\\"pt-BR\\":\\"Chade\\",\\"pt\\":\\"Chade\\",\\"nl\\":\\"Tsjaad\\",\\"hr\\":\\"Čad\\",\\"fa\\":\\"چاد\\",\\"de\\":\\"Tschad\\",\\"es\\":\\"Chad\\",\\"fr\\":\\"Tchad\\",\\"ja\\":\\"チャド\\",\\"it\\":\\"Ciad\\",\\"cn\\":\\"乍得\\",\\"tr\\":\\"Çad\\"}	15.00000000	19.00000000	🇹🇩	U+1F1F9 U+1F1E9	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q657
44	Chile	CHL	152	CL	56	Santiago	CLP	Chilean peso	$	.cl	Chile	Americas	2	South America	8	Chilean	[{\\"zoneName\\":\\"America/Punta_Arenas\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"CLST\\",\\"tzName\\":\\"Chile Summer Time\\"},{\\"zoneName\\":\\"America/Santiago\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"CLST\\",\\"tzName\\":\\"Chile Summer Time\\"},{\\"zoneName\\":\\"Pacific/Easter\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EASST\\",\\"tzName\\":\\"Easter Island Summer Time\\"}]	{\\"kr\\":\\"칠리\\",\\"pt-BR\\":\\"Chile\\",\\"pt\\":\\"Chile\\",\\"nl\\":\\"Chili\\",\\"hr\\":\\"Čile\\",\\"fa\\":\\"شیلی\\",\\"de\\":\\"Chile\\",\\"es\\":\\"Chile\\",\\"fr\\":\\"Chili\\",\\"ja\\":\\"チリ\\",\\"it\\":\\"Cile\\",\\"cn\\":\\"智利\\",\\"tr\\":\\"Şili\\"}	-30.00000000	-71.00000000	🇨🇱	U+1F1E8 U+1F1F1	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q298
45	China	CHN	156	CN	86	Beijing	CNY	Chinese yuan	¥	.cn	中国	Asia	3	Eastern Asia	12	Chinese	[{\\"zoneName\\":\\"Asia/Shanghai\\",\\"gmtOffset\\":28800,\\"gmtOffsetName\\":\\"UTC+08:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"China Standard Time\\"},{\\"zoneName\\":\\"Asia/Urumqi\\",\\"gmtOffset\\":21600,\\"gmtOffsetName\\":\\"UTC+06:00\\",\\"abbreviation\\":\\"XJT\\",\\"tzName\\":\\"China Standard Time\\"}]	{\\"kr\\":\\"중국\\",\\"pt-BR\\":\\"China\\",\\"pt\\":\\"China\\",\\"nl\\":\\"China\\",\\"hr\\":\\"Kina\\",\\"fa\\":\\"چین\\",\\"de\\":\\"China\\",\\"es\\":\\"China\\",\\"fr\\":\\"Chine\\",\\"ja\\":\\"中国\\",\\"it\\":\\"Cina\\",\\"cn\\":\\"中国\\",\\"tr\\":\\"Çin\\"}	35.00000000	105.00000000	🇨🇳	U+1F1E8 U+1F1F3	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q148
46	Christmas Island	CXR	162	CX	61	Flying Fish Cove	AUD	Australian dollar	$	.cx	Christmas Island	Oceania	5	Australia and New Zealand	19	Christmas Island	[{\\"zoneName\\":\\"Indian/Christmas\\",\\"gmtOffset\\":25200,\\"gmtOffsetName\\":\\"UTC+07:00\\",\\"abbreviation\\":\\"CXT\\",\\"tzName\\":\\"Christmas Island Time\\"}]	{\\"kr\\":\\"크리스마스 섬\\",\\"pt-BR\\":\\"Ilha Christmas\\",\\"pt\\":\\"Ilha do Natal\\",\\"nl\\":\\"Christmaseiland\\",\\"hr\\":\\"Božićni otok\\",\\"fa\\":\\"جزیره کریسمس\\",\\"de\\":\\"Weihnachtsinsel\\",\\"es\\":\\"Isla de Navidad\\",\\"fr\\":\\"Île Christmas\\",\\"ja\\":\\"クリスマス島\\",\\"it\\":\\"Isola di Natale\\",\\"cn\\":\\"圣诞岛\\",\\"tr\\":\\"Christmas Adasi\\"}	-10.50000000	105.66666666	🇨🇽	U+1F1E8 U+1F1FD	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
47	Cocos (Keeling) Islands	CCK	166	CC	61	West Island	AUD	Australian dollar	$	.cc	Cocos (Keeling) Islands	Oceania	5	Australia and New Zealand	19	Cocos Island	[{\\"zoneName\\":\\"Indian/Cocos\\",\\"gmtOffset\\":23400,\\"gmtOffsetName\\":\\"UTC+06:30\\",\\"abbreviation\\":\\"CCT\\",\\"tzName\\":\\"Cocos Islands Time\\"}]	{\\"kr\\":\\"코코스 제도\\",\\"pt-BR\\":\\"Ilhas Cocos\\",\\"pt\\":\\"Ilhas dos Cocos\\",\\"nl\\":\\"Cocoseilanden\\",\\"hr\\":\\"Kokosovi Otoci\\",\\"fa\\":\\"جزایر کوکوس\\",\\"de\\":\\"Kokosinseln\\",\\"es\\":\\"Islas Cocos o Islas Keeling\\",\\"fr\\":\\"Îles Cocos\\",\\"ja\\":\\"ココス（キーリング）諸島\\",\\"it\\":\\"Isole Cocos e Keeling\\",\\"cn\\":\\"科科斯（基林）群岛\\",\\"tr\\":\\"Cocos Adalari\\"}	-12.50000000	96.83333333	🇨🇨	U+1F1E8 U+1F1E8	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
48	Colombia	COL	170	CO	57	Bogotá	COP	Colombian peso	$	.co	Colombia	Americas	2	South America	8	Colombian	[{\\"zoneName\\":\\"America/Bogota\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"COT\\",\\"tzName\\":\\"Colombia Time\\"}]	{\\"kr\\":\\"콜롬비아\\",\\"pt-BR\\":\\"Colômbia\\",\\"pt\\":\\"Colômbia\\",\\"nl\\":\\"Colombia\\",\\"hr\\":\\"Kolumbija\\",\\"fa\\":\\"کلمبیا\\",\\"de\\":\\"Kolumbien\\",\\"es\\":\\"Colombia\\",\\"fr\\":\\"Colombie\\",\\"ja\\":\\"コロンビア\\",\\"it\\":\\"Colombia\\",\\"cn\\":\\"哥伦比亚\\",\\"tr\\":\\"Kolombiya\\"}	4.00000000	-72.00000000	🇨🇴	U+1F1E8 U+1F1F4	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q739
49	Comoros	COM	174	KM	269	Moroni	KMF	Comorian franc	CF	.km	Komori	Africa	1	Eastern Africa	4	Comoran, Comorian	[{\\"zoneName\\":\\"Indian/Comoro\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"EAT\\",\\"tzName\\":\\"East Africa Time\\"}]	{\\"kr\\":\\"코모로\\",\\"pt-BR\\":\\"Comores\\",\\"pt\\":\\"Comores\\",\\"nl\\":\\"Comoren\\",\\"hr\\":\\"Komori\\",\\"fa\\":\\"کومور\\",\\"de\\":\\"Union der Komoren\\",\\"es\\":\\"Comoras\\",\\"fr\\":\\"Comores\\",\\"ja\\":\\"コモロ\\",\\"it\\":\\"Comore\\",\\"cn\\":\\"科摩罗\\",\\"tr\\":\\"Komorlar\\"}	-12.16666666	44.25000000	🇰🇲	U+1F1F0 U+1F1F2	2018-07-21 09:11:03	2023-08-11 17:45:55	1	Q970
50	Congo	COG	178	CG	242	Brazzaville	XAF	Central African CFA franc	FC	.cg	République du Congo	Africa	1	Middle Africa	2	Congolese	[{\\"zoneName\\":\\"Africa/Brazzaville\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"WAT\\",\\"tzName\\":\\"West Africa Time\\"}]	{\\"kr\\":\\"콩고\\",\\"pt-BR\\":\\"Congo\\",\\"pt\\":\\"Congo\\",\\"nl\\":\\"Congo [Republiek]\\",\\"hr\\":\\"Kongo\\",\\"fa\\":\\"کنگو\\",\\"de\\":\\"Kongo\\",\\"es\\":\\"Congo\\",\\"fr\\":\\"Congo\\",\\"ja\\":\\"コンゴ共和国\\",\\"it\\":\\"Congo\\",\\"cn\\":\\"刚果\\",\\"tr\\":\\"Kongo\\"}	-1.00000000	15.00000000	🇨🇬	U+1F1E8 U+1F1EC	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q971
51	Democratic Republic of the Congo	COD	180	CD	243	Kinshasa	CDF	Congolese Franc	FC	.cd	République démocratique du Congo	Africa	1	Middle Africa	2	Congolese	[{\\"zoneName\\":\\"Africa/Kinshasa\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"WAT\\",\\"tzName\\":\\"West Africa Time\\"},{\\"zoneName\\":\\"Africa/Lubumbashi\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"CAT\\",\\"tzName\\":\\"Central Africa Time\\"}]	{\\"kr\\":\\"콩고 민주 공화국\\",\\"pt-BR\\":\\"RD Congo\\",\\"pt\\":\\"RD Congo\\",\\"nl\\":\\"Congo [DRC]\\",\\"hr\\":\\"Kongo, Demokratska Republika\\",\\"fa\\":\\"جمهوری کنگو\\",\\"de\\":\\"Kongo (Dem. Rep.)\\",\\"es\\":\\"Congo (Rep. Dem.)\\",\\"fr\\":\\"Congo (Rép. dém.)\\",\\"ja\\":\\"コンゴ民主共和国\\",\\"it\\":\\"Congo (Rep. Dem.)\\",\\"cn\\":\\"刚果（金）\\",\\"tr\\":\\"Kongo Demokratik Cumhuriyeti\\"}	0.00000000	25.00000000	🇨🇩	U+1F1E8 U+1F1E9	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q974
52	Cook Islands	COK	184	CK	682	Avarua	NZD	Cook Islands dollar	$	.ck	Cook Islands	Oceania	5	Polynesia	22	Cook Island	[{\\"zoneName\\":\\"Pacific/Rarotonga\\",\\"gmtOffset\\":-36000,\\"gmtOffsetName\\":\\"UTC-10:00\\",\\"abbreviation\\":\\"CKT\\",\\"tzName\\":\\"Cook Island Time\\"}]	{\\"kr\\":\\"쿡 제도\\",\\"pt-BR\\":\\"Ilhas Cook\\",\\"pt\\":\\"Ilhas Cook\\",\\"nl\\":\\"Cookeilanden\\",\\"hr\\":\\"Cookovo Otočje\\",\\"fa\\":\\"جزایر کوک\\",\\"de\\":\\"Cookinseln\\",\\"es\\":\\"Islas Cook\\",\\"fr\\":\\"Îles Cook\\",\\"ja\\":\\"クック諸島\\",\\"it\\":\\"Isole Cook\\",\\"cn\\":\\"库克群岛\\",\\"tr\\":\\"Cook Adalari\\"}	-21.23333333	-159.76666666	🇨🇰	U+1F1E8 U+1F1F0	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q26988
53	Costa Rica	CRI	188	CR	506	San Jose	CRC	Costa Rican colón	₡	.cr	Costa Rica	Americas	2	Central America	9	Costa Rican	[{\\"zoneName\\":\\"America/Costa_Rica\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"}]	{\\"kr\\":\\"코스타리카\\",\\"pt-BR\\":\\"Costa Rica\\",\\"pt\\":\\"Costa Rica\\",\\"nl\\":\\"Costa Rica\\",\\"hr\\":\\"Kostarika\\",\\"fa\\":\\"کاستاریکا\\",\\"de\\":\\"Costa Rica\\",\\"es\\":\\"Costa Rica\\",\\"fr\\":\\"Costa Rica\\",\\"ja\\":\\"コスタリカ\\",\\"it\\":\\"Costa Rica\\",\\"cn\\":\\"哥斯达黎加\\",\\"tr\\":\\"Kosta Rika\\"}	10.00000000	-84.00000000	🇨🇷	U+1F1E8 U+1F1F7	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q800
65	Egypt	EGY	818	EG	20	Cairo	EGP	Egyptian pound	ج.م	.eg	مصر‎	Africa	1	Northern Africa	1	Egyptian	[{\\"zoneName\\":\\"Africa/Cairo\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"이집트\\",\\"pt-BR\\":\\"Egito\\",\\"pt\\":\\"Egipto\\",\\"nl\\":\\"Egypte\\",\\"hr\\":\\"Egipat\\",\\"fa\\":\\"مصر\\",\\"de\\":\\"Ägypten\\",\\"es\\":\\"Egipto\\",\\"fr\\":\\"Égypte\\",\\"ja\\":\\"エジプト\\",\\"it\\":\\"Egitto\\",\\"cn\\":\\"埃及\\",\\"tr\\":\\"Mısır\\"}	27.00000000	30.00000000	🇪🇬	U+1F1EA U+1F1EC	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q79
54	Cote D\\"Ivoire (Ivory Coast)	CIV	384	CI	225	Yamoussoukro	XOF	West African CFA franc	CFA	.ci	\N	Africa	1	Western Africa	3	Ivorian	[{\\"zoneName\\":\\"Africa/Abidjan\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"코트디부아르\\",\\"pt-BR\\":\\"Costa do Marfim\\",\\"pt\\":\\"Costa do Marfim\\",\\"nl\\":\\"Ivoorkust\\",\\"hr\\":\\"Obala Bjelokosti\\",\\"fa\\":\\"ساحل عاج\\",\\"de\\":\\"Elfenbeinküste\\",\\"es\\":\\"Costa de Marfil\\",\\"fr\\":\\"Côte d\\"Ivoire\\",\\"ja\\":\\"コートジボワール\\",\\"it\\":\\"Costa D\\"Avorio\\",\\"cn\\":\\"科特迪瓦\\",\\"tr\\":\\"Kotdivuar\\"}	8.00000000	-5.00000000	🇨🇮	U+1F1E8 U+1F1EE	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q1008
55	Croatia	HRV	191	HR	385	Zagreb	HRK	Croatian kuna	kn	.hr	Hrvatska	Europe	4	Southern Europe	16	Croatian	[{\\"zoneName\\":\\"Europe/Zagreb\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"크로아티아\\",\\"pt-BR\\":\\"Croácia\\",\\"pt\\":\\"Croácia\\",\\"nl\\":\\"Kroatië\\",\\"hr\\":\\"Hrvatska\\",\\"fa\\":\\"کرواسی\\",\\"de\\":\\"Kroatien\\",\\"es\\":\\"Croacia\\",\\"fr\\":\\"Croatie\\",\\"ja\\":\\"クロアチア\\",\\"it\\":\\"Croazia\\",\\"cn\\":\\"克罗地亚\\",\\"tr\\":\\"Hirvatistan\\"}	45.16666666	15.50000000	🇭🇷	U+1F1ED U+1F1F7	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q224
56	Cuba	CUB	192	CU	53	Havana	CUP	Cuban peso	$	.cu	Cuba	Americas	2	Caribbean	7	Cuban	[{\\"zoneName\\":\\"America/Havana\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Cuba Standard Time\\"}]	{\\"kr\\":\\"쿠바\\",\\"pt-BR\\":\\"Cuba\\",\\"pt\\":\\"Cuba\\",\\"nl\\":\\"Cuba\\",\\"hr\\":\\"Kuba\\",\\"fa\\":\\"کوبا\\",\\"de\\":\\"Kuba\\",\\"es\\":\\"Cuba\\",\\"fr\\":\\"Cuba\\",\\"ja\\":\\"キューバ\\",\\"it\\":\\"Cuba\\",\\"cn\\":\\"古巴\\",\\"tr\\":\\"Küba\\"}	21.50000000	-80.00000000	🇨🇺	U+1F1E8 U+1F1FA	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q241
57	Cyprus	CYP	196	CY	357	Nicosia	EUR	Euro	€	.cy	Κύπρος	Europe	4	Southern Europe	16	Cypriot	[{\\"zoneName\\":\\"Asia/Famagusta\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"},{\\"zoneName\\":\\"Asia/Nicosia\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"키프로스\\",\\"pt-BR\\":\\"Chipre\\",\\"pt\\":\\"Chipre\\",\\"nl\\":\\"Cyprus\\",\\"hr\\":\\"Cipar\\",\\"fa\\":\\"قبرس\\",\\"de\\":\\"Zypern\\",\\"es\\":\\"Chipre\\",\\"fr\\":\\"Chypre\\",\\"ja\\":\\"キプロス\\",\\"it\\":\\"Cipro\\",\\"cn\\":\\"塞浦路斯\\",\\"tr\\":\\"Kuzey Kıbrıs Türk Cumhuriyeti\\"}	35.00000000	33.00000000	🇨🇾	U+1F1E8 U+1F1FE	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q229
58	Czech Republic	CZE	203	CZ	420	Prague	CZK	Czech koruna	Kč	.cz	Česká republika	Europe	4	Eastern Europe	15	Czech	 	{\\"kr\\":\\"체코\\",\\"pt-BR\\":\\"República Tcheca\\",\\"pt\\":\\"República Checa\\",\\"nl\\":\\"Tsjechië\\",\\"hr\\":\\"Češka\\",\\"fa\\":\\"جمهوری چک\\",\\"de\\":\\"Tschechische Republik\\",\\"es\\":\\"República Checa\\",\\"fr\\":\\"République tchèque\\",\\"ja\\":\\"チェコ\\",\\"it\\":\\"Repubblica Ceca\\",\\"cn\\":\\"捷克\\",\\"tr\\":\\"Çekya\\"}	49.75000000	15.50000000	🇨🇿	U+1F1E8 U+1F1FF	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q213
59	Denmark	DNK	208	DK	45	Copenhagen	DKK	Danish krone	Kr.	.dk	Danmark	Europe	4	Northern Europe	18	Danish	[{\\"zoneName\\":\\"Europe/Copenhagen\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"덴마크\\",\\"pt-BR\\":\\"Dinamarca\\",\\"pt\\":\\"Dinamarca\\",\\"nl\\":\\"Denemarken\\",\\"hr\\":\\"Danska\\",\\"fa\\":\\"دانمارک\\",\\"de\\":\\"Dänemark\\",\\"es\\":\\"Dinamarca\\",\\"fr\\":\\"Danemark\\",\\"ja\\":\\"デンマーク\\",\\"it\\":\\"Danimarca\\",\\"cn\\":\\"丹麦\\",\\"tr\\":\\"Danimarka\\"}	56.00000000	10.00000000	🇩🇰	U+1F1E9 U+1F1F0	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q35
60	Djibouti	DJI	262	DJ	253	Djibouti	DJF	Djiboutian franc	Fdj	.dj	Djibouti	Africa	1	Eastern Africa	4	Djiboutian	[{\\"zoneName\\":\\"Africa/Djibouti\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"EAT\\",\\"tzName\\":\\"East Africa Time\\"}]	{\\"kr\\":\\"지부티\\",\\"pt-BR\\":\\"Djibuti\\",\\"pt\\":\\"Djibuti\\",\\"nl\\":\\"Djibouti\\",\\"hr\\":\\"Džibuti\\",\\"fa\\":\\"جیبوتی\\",\\"de\\":\\"Dschibuti\\",\\"es\\":\\"Yibuti\\",\\"fr\\":\\"Djibouti\\",\\"ja\\":\\"ジブチ\\",\\"it\\":\\"Gibuti\\",\\"cn\\":\\"吉布提\\",\\"tr\\":\\"Cibuti\\"}	11.50000000	43.00000000	🇩🇯	U+1F1E9 U+1F1EF	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q977
61	Dominica	DMA	212	DM	+1-767	Roseau	XCD	Eastern Caribbean dollar	$	.dm	Dominica	Americas	2	Caribbean	7	Dominican	[{\\"zoneName\\":\\"America/Dominica\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"도미니카 연방\\",\\"pt-BR\\":\\"Dominica\\",\\"pt\\":\\"Dominica\\",\\"nl\\":\\"Dominica\\",\\"hr\\":\\"Dominika\\",\\"fa\\":\\"دومینیکا\\",\\"de\\":\\"Dominica\\",\\"es\\":\\"Dominica\\",\\"fr\\":\\"Dominique\\",\\"ja\\":\\"ドミニカ国\\",\\"it\\":\\"Dominica\\",\\"cn\\":\\"多米尼加\\",\\"tr\\":\\"Dominika\\"}	15.41666666	-61.33333333	🇩🇲	U+1F1E9 U+1F1F2	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q784
62	Dominican Republic	DOM	214	DO	+1-809 and 1-829	Santo Domingo	DOP	Dominican peso	$	.do	República Dominicana	Americas	2	Caribbean	7	Dominican	[{\\"zoneName\\":\\"America/Santo_Domingo\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"도미니카 공화국\\",\\"pt-BR\\":\\"República Dominicana\\",\\"pt\\":\\"República Dominicana\\",\\"nl\\":\\"Dominicaanse Republiek\\",\\"hr\\":\\"Dominikanska Republika\\",\\"fa\\":\\"جمهوری دومینیکن\\",\\"de\\":\\"Dominikanische Republik\\",\\"es\\":\\"República Dominicana\\",\\"fr\\":\\"République dominicaine\\",\\"ja\\":\\"ドミニカ共和国\\",\\"it\\":\\"Repubblica Dominicana\\",\\"cn\\":\\"多明尼加共和国\\",\\"tr\\":\\"Dominik Cumhuriyeti\\"}	19.00000000	-70.66666666	🇩🇴	U+1F1E9 U+1F1F4	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q786
63	East Timor	TLS	626	TL	670	Dili	USD	United States dollar	$	.tl	Timor-Leste	Asia	3	South-Eastern Asia	13	Timorese	[{\\"zoneName\\":\\"Asia/Dili\\",\\"gmtOffset\\":32400,\\"gmtOffsetName\\":\\"UTC+09:00\\",\\"abbreviation\\":\\"TLT\\",\\"tzName\\":\\"Timor Leste Time\\"}]	{\\"kr\\":\\"동티모르\\",\\"pt-BR\\":\\"Timor Leste\\",\\"pt\\":\\"Timor Leste\\",\\"nl\\":\\"Oost-Timor\\",\\"hr\\":\\"Istočni Timor\\",\\"fa\\":\\"تیمور شرقی\\",\\"de\\":\\"Timor-Leste\\",\\"es\\":\\"Timor Oriental\\",\\"fr\\":\\"Timor oriental\\",\\"ja\\":\\"東ティモール\\",\\"it\\":\\"Timor Est\\",\\"cn\\":\\"东帝汶\\",\\"tr\\":\\"Doğu Timor\\"}	-8.83333333	125.91666666	🇹🇱	U+1F1F9 U+1F1F1	2018-07-21 09:11:03	2023-08-11 17:45:55	1	Q574
64	Ecuador	ECU	218	EC	593	Quito	USD	United States dollar	$	.ec	Ecuador	Americas	2	South America	8	Ecuadorian	[{\\"zoneName\\":\\"America/Guayaquil\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"ECT\\",\\"tzName\\":\\"Ecuador Time\\"},{\\"zoneName\\":\\"Pacific/Galapagos\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"GALT\\",\\"tzName\\":\\"Galápagos Time\\"}]	{\\"kr\\":\\"에콰도르\\",\\"pt-BR\\":\\"Equador\\",\\"pt\\":\\"Equador\\",\\"nl\\":\\"Ecuador\\",\\"hr\\":\\"Ekvador\\",\\"fa\\":\\"اکوادور\\",\\"de\\":\\"Ecuador\\",\\"es\\":\\"Ecuador\\",\\"fr\\":\\"Équateur\\",\\"ja\\":\\"エクアドル\\",\\"it\\":\\"Ecuador\\",\\"cn\\":\\"厄瓜多尔\\",\\"tr\\":\\"Ekvator\\"}	-2.00000000	-77.50000000	🇪🇨	U+1F1EA U+1F1E8	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q736
66	El Salvador	SLV	222	SV	503	San Salvador	USD	United States dollar	$	.sv	El Salvador	Americas	2	Central America	9	Salvadoran	[{\\"zoneName\\":\\"America/El_Salvador\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"}]	{\\"kr\\":\\"엘살바도르\\",\\"pt-BR\\":\\"El Salvador\\",\\"pt\\":\\"El Salvador\\",\\"nl\\":\\"El Salvador\\",\\"hr\\":\\"Salvador\\",\\"fa\\":\\"السالوادور\\",\\"de\\":\\"El Salvador\\",\\"es\\":\\"El Salvador\\",\\"fr\\":\\"Salvador\\",\\"ja\\":\\"エルサルバドル\\",\\"it\\":\\"El Salvador\\",\\"cn\\":\\"萨尔瓦多\\",\\"tr\\":\\"El Salvador\\"}	13.83333333	-88.91666666	🇸🇻	U+1F1F8 U+1F1FB	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q792
67	Equatorial Guinea	GNQ	226	GQ	240	Malabo	XAF	Central African CFA franc	FCFA	.gq	Guinea Ecuatorial	Africa	1	Middle Africa	2	Equatorial Guinean, Equatoguinean	[{\\"zoneName\\":\\"Africa/Malabo\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"WAT\\",\\"tzName\\":\\"West Africa Time\\"}]	{\\"kr\\":\\"적도 기니\\",\\"pt-BR\\":\\"Guiné Equatorial\\",\\"pt\\":\\"Guiné Equatorial\\",\\"nl\\":\\"Equatoriaal-Guinea\\",\\"hr\\":\\"Ekvatorijalna Gvineja\\",\\"fa\\":\\"گینه استوایی\\",\\"de\\":\\"Äquatorial-Guinea\\",\\"es\\":\\"Guinea Ecuatorial\\",\\"fr\\":\\"Guinée-Équatoriale\\",\\"ja\\":\\"赤道ギニア\\",\\"it\\":\\"Guinea Equatoriale\\",\\"cn\\":\\"赤道几内亚\\",\\"tr\\":\\"Ekvator Ginesi\\"}	2.00000000	10.00000000	🇬🇶	U+1F1EC U+1F1F6	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q983
68	Eritrea	ERI	232	ER	291	Asmara	ERN	Eritrean nakfa	Nfk	.er	ኤርትራ	Africa	1	Eastern Africa	4	Eritrean	[{\\"zoneName\\":\\"Africa/Asmara\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"EAT\\",\\"tzName\\":\\"East Africa Time\\"}]	{\\"kr\\":\\"에리트레아\\",\\"pt-BR\\":\\"Eritreia\\",\\"pt\\":\\"Eritreia\\",\\"nl\\":\\"Eritrea\\",\\"hr\\":\\"Eritreja\\",\\"fa\\":\\"اریتره\\",\\"de\\":\\"Eritrea\\",\\"es\\":\\"Eritrea\\",\\"fr\\":\\"Érythrée\\",\\"ja\\":\\"エリトリア\\",\\"it\\":\\"Eritrea\\",\\"cn\\":\\"厄立特里亚\\",\\"tr\\":\\"Eritre\\"}	15.00000000	39.00000000	🇪🇷	U+1F1EA U+1F1F7	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q986
69	Estonia	EST	233	EE	372	Tallinn	EUR	Euro	€	.ee	Eesti	Europe	4	Northern Europe	18	Estonian	[{\\"zoneName\\":\\"Europe/Tallinn\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"에스토니아\\",\\"pt-BR\\":\\"Estônia\\",\\"pt\\":\\"Estónia\\",\\"nl\\":\\"Estland\\",\\"hr\\":\\"Estonija\\",\\"fa\\":\\"استونی\\",\\"de\\":\\"Estland\\",\\"es\\":\\"Estonia\\",\\"fr\\":\\"Estonie\\",\\"ja\\":\\"エストニア\\",\\"it\\":\\"Estonia\\",\\"cn\\":\\"爱沙尼亚\\",\\"tr\\":\\"Estonya\\"}	59.00000000	26.00000000	🇪🇪	U+1F1EA U+1F1EA	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q191
70	Ethiopia	ETH	231	ET	251	Addis Ababa	ETB	Ethiopian birr	Nkf	.et	ኢትዮጵያ	Africa	1	Eastern Africa	4	Ethiopian	[{\\"zoneName\\":\\"Africa/Addis_Ababa\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"EAT\\",\\"tzName\\":\\"East Africa Time\\"}]	{\\"kr\\":\\"에티오피아\\",\\"pt-BR\\":\\"Etiópia\\",\\"pt\\":\\"Etiópia\\",\\"nl\\":\\"Ethiopië\\",\\"hr\\":\\"Etiopija\\",\\"fa\\":\\"اتیوپی\\",\\"de\\":\\"Äthiopien\\",\\"es\\":\\"Etiopía\\",\\"fr\\":\\"Éthiopie\\",\\"ja\\":\\"エチオピア\\",\\"it\\":\\"Etiopia\\",\\"cn\\":\\"埃塞俄比亚\\",\\"tr\\":\\"Etiyopya\\"}	8.00000000	38.00000000	🇪🇹	U+1F1EA U+1F1F9	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q115
71	Falkland Islands	FLK	238	FK	500	Stanley	FKP	Falkland Islands pound	£	.fk	Falkland Islands	Americas	2	South America	8	Falkland Island	[{\\"zoneName\\":\\"Atlantic/Stanley\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"FKST\\",\\"tzName\\":\\"Falkland Islands Summer Time\\"}]	{\\"kr\\":\\"포클랜드 제도\\",\\"pt-BR\\":\\"Ilhas Malvinas\\",\\"pt\\":\\"Ilhas Falkland\\",\\"nl\\":\\"Falklandeilanden [Islas Malvinas]\\",\\"hr\\":\\"Falklandski Otoci\\",\\"fa\\":\\"جزایر فالکلند\\",\\"de\\":\\"Falklandinseln\\",\\"es\\":\\"Islas Malvinas\\",\\"fr\\":\\"Îles Malouines\\",\\"ja\\":\\"フォークランド（マルビナス）諸島\\",\\"it\\":\\"Isole Falkland o Isole Malvine\\",\\"cn\\":\\"福克兰群岛\\",\\"tr\\":\\"Falkland Adalari\\"}	-51.75000000	-59.00000000	🇫🇰	U+1F1EB U+1F1F0	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
72	Faroe Islands	FRO	234	FO	298	Torshavn	DKK	Danish krone	Kr.	.fo	Føroyar	Europe	4	Northern Europe	18	Faroese	[{\\"zoneName\\":\\"Atlantic/Faroe\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"WET\\",\\"tzName\\":\\"Western European Time\\"}]	{\\"kr\\":\\"페로 제도\\",\\"pt-BR\\":\\"Ilhas Faroé\\",\\"pt\\":\\"Ilhas Faroé\\",\\"nl\\":\\"Faeröer\\",\\"hr\\":\\"Farski Otoci\\",\\"fa\\":\\"جزایر فارو\\",\\"de\\":\\"Färöer-Inseln\\",\\"es\\":\\"Islas Faroe\\",\\"fr\\":\\"Îles Féroé\\",\\"ja\\":\\"フェロー諸島\\",\\"it\\":\\"Isole Far Oer\\",\\"cn\\":\\"法罗群岛\\",\\"tr\\":\\"Faroe Adalari\\"}	62.00000000	-7.00000000	🇫🇴	U+1F1EB U+1F1F4	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
73	Fiji Islands	FJI	242	FJ	679	Suva	FJD	Fijian dollar	FJ$	.fj	Fiji	Oceania	5	Melanesia	20	Fijian	[{\\"zoneName\\":\\"Pacific/Fiji\\",\\"gmtOffset\\":43200,\\"gmtOffsetName\\":\\"UTC+12:00\\",\\"abbreviation\\":\\"FJT\\",\\"tzName\\":\\"Fiji Time\\"}]	{\\"kr\\":\\"피지\\",\\"pt-BR\\":\\"Fiji\\",\\"pt\\":\\"Fiji\\",\\"nl\\":\\"Fiji\\",\\"hr\\":\\"Fiđi\\",\\"fa\\":\\"فیجی\\",\\"de\\":\\"Fidschi\\",\\"es\\":\\"Fiyi\\",\\"fr\\":\\"Fidji\\",\\"ja\\":\\"フィジー\\",\\"it\\":\\"Figi\\",\\"cn\\":\\"斐济\\",\\"tr\\":\\"Fiji\\"}	-18.00000000	175.00000000	🇫🇯	U+1F1EB U+1F1EF	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q712
74	Finland	FIN	246	FI	358	Helsinki	EUR	Euro	€	.fi	Suomi	Europe	4	Northern Europe	18	Finnish	[{\\"zoneName\\":\\"Europe/Helsinki\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"핀란드\\",\\"pt-BR\\":\\"Finlândia\\",\\"pt\\":\\"Finlândia\\",\\"nl\\":\\"Finland\\",\\"hr\\":\\"Finska\\",\\"fa\\":\\"فنلاند\\",\\"de\\":\\"Finnland\\",\\"es\\":\\"Finlandia\\",\\"fr\\":\\"Finlande\\",\\"ja\\":\\"フィンランド\\",\\"it\\":\\"Finlandia\\",\\"cn\\":\\"芬兰\\",\\"tr\\":\\"Finlandiya\\"}	64.00000000	26.00000000	🇫🇮	U+1F1EB U+1F1EE	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q33
75	France	FRA	250	FR	33	Paris	EUR	Euro	€	.fr	France	Europe	4	Western Europe	17	French	[{\\"zoneName\\":\\"Europe/Paris\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"프랑스\\",\\"pt-BR\\":\\"França\\",\\"pt\\":\\"França\\",\\"nl\\":\\"Frankrijk\\",\\"hr\\":\\"Francuska\\",\\"fa\\":\\"فرانسه\\",\\"de\\":\\"Frankreich\\",\\"es\\":\\"Francia\\",\\"fr\\":\\"France\\",\\"ja\\":\\"フランス\\",\\"it\\":\\"Francia\\",\\"cn\\":\\"法国\\",\\"tr\\":\\"Fransa\\"}	46.00000000	2.00000000	🇫🇷	U+1F1EB U+1F1F7	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q142
76	French Guiana	GUF	254	GF	594	Cayenne	EUR	Euro	€	.gf	Guyane française	Americas	2	South America	8	French Guianese	[{\\"zoneName\\":\\"America/Cayenne\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"GFT\\",\\"tzName\\":\\"French Guiana Time\\"}]	{\\"kr\\":\\"프랑스령 기아나\\",\\"pt-BR\\":\\"Guiana Francesa\\",\\"pt\\":\\"Guiana Francesa\\",\\"nl\\":\\"Frans-Guyana\\",\\"hr\\":\\"Francuska Gvajana\\",\\"fa\\":\\"گویان فرانسه\\",\\"de\\":\\"Französisch Guyana\\",\\"es\\":\\"Guayana Francesa\\",\\"fr\\":\\"Guayane\\",\\"ja\\":\\"フランス領ギアナ\\",\\"it\\":\\"Guyana francese\\",\\"cn\\":\\"法属圭亚那\\",\\"tr\\":\\"Fransiz Guyanasi\\"}	4.00000000	-53.00000000	🇬🇫	U+1F1EC U+1F1EB	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
166	Oman	OMN	512	OM	968	Muscat	OMR	Omani rial	.ع.ر	.om	عمان	Asia	3	Western Asia	11	Omani	[{\\"zoneName\\":\\"Asia/Muscat\\",\\"gmtOffset\\":14400,\\"gmtOffsetName\\":\\"UTC+04:00\\",\\"abbreviation\\":\\"GST\\",\\"tzName\\":\\"Gulf Standard Time\\"}]	{\\"kr\\":\\"오만\\",\\"pt-BR\\":\\"Omã\\",\\"pt\\":\\"Omã\\",\\"nl\\":\\"Oman\\",\\"hr\\":\\"Oman\\",\\"fa\\":\\"عمان\\",\\"de\\":\\"Oman\\",\\"es\\":\\"Omán\\",\\"fr\\":\\"Oman\\",\\"ja\\":\\"オマーン\\",\\"it\\":\\"oman\\",\\"cn\\":\\"阿曼\\",\\"tr\\":\\"Umman\\"}	21.00000000	57.00000000	🇴🇲	U+1F1F4 U+1F1F2	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q842
77	French Polynesia	PYF	258	PF	689	Papeete	XPF	CFP franc	₣	.pf	Polynésie française	Oceania	5	Polynesia	22	French Polynesia	[{\\"zoneName\\":\\"Pacific/Gambier\\",\\"gmtOffset\\":-32400,\\"gmtOffsetName\\":\\"UTC-09:00\\",\\"abbreviation\\":\\"GAMT\\",\\"tzName\\":\\"Gambier Islands Time\\"},{\\"zoneName\\":\\"Pacific/Marquesas\\",\\"gmtOffset\\":-34200,\\"gmtOffsetName\\":\\"UTC-09:30\\",\\"abbreviation\\":\\"MART\\",\\"tzName\\":\\"Marquesas Islands Time\\"},{\\"zoneName\\":\\"Pacific/Tahiti\\",\\"gmtOffset\\":-36000,\\"gmtOffsetName\\":\\"UTC-10:00\\",\\"abbreviation\\":\\"TAHT\\",\\"tzName\\":\\"Tahiti Time\\"}]	{\\"kr\\":\\"프랑스령 폴리네시아\\",\\"pt-BR\\":\\"Polinésia Francesa\\",\\"pt\\":\\"Polinésia Francesa\\",\\"nl\\":\\"Frans-Polynesië\\",\\"hr\\":\\"Francuska Polinezija\\",\\"fa\\":\\"پلی‌نزی فرانسه\\",\\"de\\":\\"Französisch-Polynesien\\",\\"es\\":\\"Polinesia Francesa\\",\\"fr\\":\\"Polynésie française\\",\\"ja\\":\\"フランス領ポリネシア\\",\\"it\\":\\"Polinesia Francese\\",\\"cn\\":\\"法属波利尼西亚\\",\\"tr\\":\\"Fransiz Polinezyasi\\"}	-15.00000000	-140.00000000	🇵🇫	U+1F1F5 U+1F1EB	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
78	French Southern Territories	ATF	260	TF	262	Port-aux-Francais	EUR	Euro	€	.tf	Territoire des Terres australes et antarctiques fr	Africa	1	Southern Africa	5	French Southern Territories	[{\\"zoneName\\":\\"Indian/Kerguelen\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"TFT\\",\\"tzName\\":\\"French Southern and Antarctic Time\\"}]	{\\"kr\\":\\"프랑스령 남방 및 남극\\",\\"pt-BR\\":\\"Terras Austrais e Antárticas Francesas\\",\\"pt\\":\\"Terras Austrais e Antárticas Francesas\\",\\"nl\\":\\"Franse Gebieden in de zuidelijke Indische Oceaan\\",\\"hr\\":\\"Francuski južni i antarktički teritoriji\\",\\"fa\\":\\"سرزمین‌های جنوبی و جنوبگانی فرانسه\\",\\"de\\":\\"Französische Süd- und Antarktisgebiete\\",\\"es\\":\\"Tierras Australes y Antárticas Francesas\\",\\"fr\\":\\"Terres australes et antarctiques françaises\\",\\"ja\\":\\"フランス領南方・南極地域\\",\\"it\\":\\"Territori Francesi del Sud\\",\\"cn\\":\\"法属南部领地\\",\\"tr\\":\\"Fransiz Güney Topraklari\\"}	-49.25000000	69.16700000	🇹🇫	U+1F1F9 U+1F1EB	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
79	Gabon	GAB	266	GA	241	Libreville	XAF	Central African CFA franc	FCFA	.ga	Gabon	Africa	1	Middle Africa	2	Gabonese	[{\\"zoneName\\":\\"Africa/Libreville\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"WAT\\",\\"tzName\\":\\"West Africa Time\\"}]	{\\"kr\\":\\"가봉\\",\\"pt-BR\\":\\"Gabão\\",\\"pt\\":\\"Gabão\\",\\"nl\\":\\"Gabon\\",\\"hr\\":\\"Gabon\\",\\"fa\\":\\"گابن\\",\\"de\\":\\"Gabun\\",\\"es\\":\\"Gabón\\",\\"fr\\":\\"Gabon\\",\\"ja\\":\\"ガボン\\",\\"it\\":\\"Gabon\\",\\"cn\\":\\"加蓬\\",\\"tr\\":\\"Gabon\\"}	-1.00000000	11.75000000	🇬🇦	U+1F1EC U+1F1E6	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q1000
80	Gambia The	GMB	270	GM	220	Banjul	GMD	Gambian dalasi	D	.gm	Gambia	Africa	1	Western Africa	3	Gambian	[{\\"zoneName\\":\\"Africa/Banjul\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"감비아\\",\\"pt-BR\\":\\"Gâmbia\\",\\"pt\\":\\"Gâmbia\\",\\"nl\\":\\"Gambia\\",\\"hr\\":\\"Gambija\\",\\"fa\\":\\"گامبیا\\",\\"de\\":\\"Gambia\\",\\"es\\":\\"Gambia\\",\\"fr\\":\\"Gambie\\",\\"ja\\":\\"ガンビア\\",\\"it\\":\\"Gambia\\",\\"cn\\":\\"冈比亚\\",\\"tr\\":\\"Gambiya\\"}	13.46666666	-16.56666666	🇬🇲	U+1F1EC U+1F1F2	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q1005
81	Georgia	GEO	268	GE	995	Tbilisi	GEL	Georgian lari	ლ	.ge	საქართველო	Asia	3	Western Asia	11	Georgian	[{\\"zoneName\\":\\"Asia/Tbilisi\\",\\"gmtOffset\\":14400,\\"gmtOffsetName\\":\\"UTC+04:00\\",\\"abbreviation\\":\\"GET\\",\\"tzName\\":\\"Georgia Standard Time\\"}]	{\\"kr\\":\\"조지아\\",\\"pt-BR\\":\\"Geórgia\\",\\"pt\\":\\"Geórgia\\",\\"nl\\":\\"Georgië\\",\\"hr\\":\\"Gruzija\\",\\"fa\\":\\"گرجستان\\",\\"de\\":\\"Georgien\\",\\"es\\":\\"Georgia\\",\\"fr\\":\\"Géorgie\\",\\"ja\\":\\"グルジア\\",\\"it\\":\\"Georgia\\",\\"cn\\":\\"格鲁吉亚\\",\\"tr\\":\\"Gürcistan\\"}	42.00000000	43.50000000	🇬🇪	U+1F1EC U+1F1EA	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q230
82	Germany	DEU	276	DE	49	Berlin	EUR	Euro	€	.de	Deutschland	Europe	4	Western Europe	17	German	[{\\"zoneName\\":\\"Europe/Berlin\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"},{\\"zoneName\\":\\"Europe/Busingen\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"독일\\",\\"pt-BR\\":\\"Alemanha\\",\\"pt\\":\\"Alemanha\\",\\"nl\\":\\"Duitsland\\",\\"hr\\":\\"Njemačka\\",\\"fa\\":\\"آلمان\\",\\"de\\":\\"Deutschland\\",\\"es\\":\\"Alemania\\",\\"fr\\":\\"Allemagne\\",\\"ja\\":\\"ドイツ\\",\\"it\\":\\"Germania\\",\\"cn\\":\\"德国\\",\\"tr\\":\\"Almanya\\"}	51.00000000	9.00000000	🇩🇪	U+1F1E9 U+1F1EA	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q183
83	Ghana	GHA	288	GH	233	Accra	GHS	Ghanaian cedi	GH₵	.gh	Ghana	Africa	1	Western Africa	3	Ghanaian	[{\\"zoneName\\":\\"Africa/Accra\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"가나\\",\\"pt-BR\\":\\"Gana\\",\\"pt\\":\\"Gana\\",\\"nl\\":\\"Ghana\\",\\"hr\\":\\"Gana\\",\\"fa\\":\\"غنا\\",\\"de\\":\\"Ghana\\",\\"es\\":\\"Ghana\\",\\"fr\\":\\"Ghana\\",\\"ja\\":\\"ガーナ\\",\\"it\\":\\"Ghana\\",\\"cn\\":\\"加纳\\",\\"tr\\":\\"Gana\\"}	8.00000000	-2.00000000	🇬🇭	U+1F1EC U+1F1ED	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q117
84	Gibraltar	GIB	292	GI	350	Gibraltar	GIP	Gibraltar pound	£	.gi	Gibraltar	Europe	4	Southern Europe	16	Gibraltar	[{\\"zoneName\\":\\"Europe/Gibraltar\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"지브롤터\\",\\"pt-BR\\":\\"Gibraltar\\",\\"pt\\":\\"Gibraltar\\",\\"nl\\":\\"Gibraltar\\",\\"hr\\":\\"Gibraltar\\",\\"fa\\":\\"جبل‌طارق\\",\\"de\\":\\"Gibraltar\\",\\"es\\":\\"Gibraltar\\",\\"fr\\":\\"Gibraltar\\",\\"ja\\":\\"ジブラルタル\\",\\"it\\":\\"Gibilterra\\",\\"cn\\":\\"直布罗陀\\",\\"tr\\":\\"Cebelitarik\\"}	36.13333333	-5.35000000	🇬🇮	U+1F1EC U+1F1EE	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
85	Greece	GRC	300	GR	30	Athens	EUR	Euro	€	.gr	Ελλάδα	Europe	4	Southern Europe	16	Greek, Hellenic	[{\\"zoneName\\":\\"Europe/Athens\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"그리스\\",\\"pt-BR\\":\\"Grécia\\",\\"pt\\":\\"Grécia\\",\\"nl\\":\\"Griekenland\\",\\"hr\\":\\"Grčka\\",\\"fa\\":\\"یونان\\",\\"de\\":\\"Griechenland\\",\\"es\\":\\"Grecia\\",\\"fr\\":\\"Grèce\\",\\"ja\\":\\"ギリシャ\\",\\"it\\":\\"Grecia\\",\\"cn\\":\\"希腊\\",\\"tr\\":\\"Yunanistan\\"}	39.00000000	22.00000000	🇬🇷	U+1F1EC U+1F1F7	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q41
86	Greenland	GRL	304	GL	299	Nuuk	DKK	Danish krone	Kr.	.gl	Kalaallit Nunaat	Americas	2	Northern America	6	Greenlandic	[{\\"zoneName\\":\\"America/Danmarkshavn\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"},{\\"zoneName\\":\\"America/Nuuk\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"WGT\\",\\"tzName\\":\\"West Greenland Time\\"},{\\"zoneName\\":\\"America/Scoresbysund\\",\\"gmtOffset\\":-3600,\\"gmtOffsetName\\":\\"UTC-01:00\\",\\"abbreviation\\":\\"EGT\\",\\"tzName\\":\\"Eastern Greenland Time\\"},{\\"zoneName\\":\\"America/Thule\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"그린란드\\",\\"pt-BR\\":\\"Groelândia\\",\\"pt\\":\\"Gronelândia\\",\\"nl\\":\\"Groenland\\",\\"hr\\":\\"Grenland\\",\\"fa\\":\\"گرینلند\\",\\"de\\":\\"Grönland\\",\\"es\\":\\"Groenlandia\\",\\"fr\\":\\"Groenland\\",\\"ja\\":\\"グリーンランド\\",\\"it\\":\\"Groenlandia\\",\\"cn\\":\\"格陵兰岛\\",\\"tr\\":\\"Grönland\\"}	72.00000000	-40.00000000	🇬🇱	U+1F1EC U+1F1F1	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
87	Grenada	GRD	308	GD	+1-473	St. George\\"s	XCD	Eastern Caribbean dollar	$	.gd	Grenada	Americas	2	Caribbean	7	Grenadian	[{\\"zoneName\\":\\"America/Grenada\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"그레나다\\",\\"pt-BR\\":\\"Granada\\",\\"pt\\":\\"Granada\\",\\"nl\\":\\"Grenada\\",\\"hr\\":\\"Grenada\\",\\"fa\\":\\"گرنادا\\",\\"de\\":\\"Grenada\\",\\"es\\":\\"Grenada\\",\\"fr\\":\\"Grenade\\",\\"ja\\":\\"グレナダ\\",\\"it\\":\\"Grenada\\",\\"cn\\":\\"格林纳达\\",\\"tr\\":\\"Grenada\\"}	12.11666666	-61.66666666	🇬🇩	U+1F1EC U+1F1E9	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q769
88	Guadeloupe	GLP	312	GP	590	Basse-Terre	EUR	Euro	€	.gp	Guadeloupe	Americas	2	Caribbean	7	Guadeloupe	[{\\"zoneName\\":\\"America/Guadeloupe\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"과들루프\\",\\"pt-BR\\":\\"Guadalupe\\",\\"pt\\":\\"Guadalupe\\",\\"nl\\":\\"Guadeloupe\\",\\"hr\\":\\"Gvadalupa\\",\\"fa\\":\\"جزیره گوادلوپ\\",\\"de\\":\\"Guadeloupe\\",\\"es\\":\\"Guadalupe\\",\\"fr\\":\\"Guadeloupe\\",\\"ja\\":\\"グアドループ\\",\\"it\\":\\"Guadeloupa\\",\\"cn\\":\\"瓜德罗普岛\\",\\"tr\\":\\"Guadeloupe\\"}	16.25000000	-61.58333300	🇬🇵	U+1F1EC U+1F1F5	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
89	Guam	GUM	316	GU	+1-671	Hagatna	USD	US Dollar	$	.gu	Guam	Oceania	5	Micronesia	21	Guamanian, Guambat	[{\\"zoneName\\":\\"Pacific/Guam\\",\\"gmtOffset\\":36000,\\"gmtOffsetName\\":\\"UTC+10:00\\",\\"abbreviation\\":\\"CHST\\",\\"tzName\\":\\"Chamorro Standard Time\\"}]	{\\"kr\\":\\"괌\\",\\"pt-BR\\":\\"Guam\\",\\"pt\\":\\"Guame\\",\\"nl\\":\\"Guam\\",\\"hr\\":\\"Guam\\",\\"fa\\":\\"گوام\\",\\"de\\":\\"Guam\\",\\"es\\":\\"Guam\\",\\"fr\\":\\"Guam\\",\\"ja\\":\\"グアム\\",\\"it\\":\\"Guam\\",\\"cn\\":\\"关岛\\",\\"tr\\":\\"Guam\\"}	13.46666666	144.78333333	🇬🇺	U+1F1EC U+1F1FA	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
90	Guatemala	GTM	320	GT	502	Guatemala City	GTQ	Guatemalan quetzal	Q	.gt	Guatemala	Americas	2	Central America	9	Guatemalan	[{\\"zoneName\\":\\"America/Guatemala\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"}]	{\\"kr\\":\\"과테말라\\",\\"pt-BR\\":\\"Guatemala\\",\\"pt\\":\\"Guatemala\\",\\"nl\\":\\"Guatemala\\",\\"hr\\":\\"Gvatemala\\",\\"fa\\":\\"گواتمالا\\",\\"de\\":\\"Guatemala\\",\\"es\\":\\"Guatemala\\",\\"fr\\":\\"Guatemala\\",\\"ja\\":\\"グアテマラ\\",\\"it\\":\\"Guatemala\\",\\"cn\\":\\"危地马拉\\",\\"tr\\":\\"Guatemala\\"}	15.50000000	-90.25000000	🇬🇹	U+1F1EC U+1F1F9	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q774
91	Guernsey and Alderney	GGY	831	GG	+44-1481	St Peter Port	GBP	British pound	£	.gg	Guernsey	Europe	4	Northern Europe	18	Channel Island	[{\\"zoneName\\":\\"Europe/Guernsey\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"건지, 올더니\\",\\"pt-BR\\":\\"Guernsey\\",\\"pt\\":\\"Guernsey\\",\\"nl\\":\\"Guernsey\\",\\"hr\\":\\"Guernsey\\",\\"fa\\":\\"گرنزی\\",\\"de\\":\\"Guernsey\\",\\"es\\":\\"Guernsey\\",\\"fr\\":\\"Guernesey\\",\\"ja\\":\\"ガーンジー\\",\\"it\\":\\"Guernsey\\",\\"cn\\":\\"根西岛\\",\\"tr\\":\\"Alderney\\"}	49.46666666	-2.58333333	🇬🇬	U+1F1EC U+1F1EC	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
92	Guinea	GIN	324	GN	224	Conakry	GNF	Guinean franc	FG	.gn	Guinée	Africa	1	Western Africa	3	Guinean	[{\\"zoneName\\":\\"Africa/Conakry\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"기니\\",\\"pt-BR\\":\\"Guiné\\",\\"pt\\":\\"Guiné\\",\\"nl\\":\\"Guinee\\",\\"hr\\":\\"Gvineja\\",\\"fa\\":\\"گینه\\",\\"de\\":\\"Guinea\\",\\"es\\":\\"Guinea\\",\\"fr\\":\\"Guinée\\",\\"ja\\":\\"ギニア\\",\\"it\\":\\"Guinea\\",\\"cn\\":\\"几内亚\\",\\"tr\\":\\"Gine\\"}	11.00000000	-10.00000000	🇬🇳	U+1F1EC U+1F1F3	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q1006
93	Guinea-Bissau	GNB	624	GW	245	Bissau	XOF	West African CFA franc	CFA	.gw	Guiné-Bissau	Africa	1	Western Africa	3	Bissau-Guinean	[{\\"zoneName\\":\\"Africa/Bissau\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"기니비사우\\",\\"pt-BR\\":\\"Guiné-Bissau\\",\\"pt\\":\\"Guiné-Bissau\\",\\"nl\\":\\"Guinee-Bissau\\",\\"hr\\":\\"Gvineja Bisau\\",\\"fa\\":\\"گینه بیسائو\\",\\"de\\":\\"Guinea-Bissau\\",\\"es\\":\\"Guinea-Bisáu\\",\\"fr\\":\\"Guinée-Bissau\\",\\"ja\\":\\"ギニアビサウ\\",\\"it\\":\\"Guinea-Bissau\\",\\"cn\\":\\"几内亚比绍\\",\\"tr\\":\\"Gine-bissau\\"}	12.00000000	-15.00000000	🇬🇼	U+1F1EC U+1F1FC	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q1007
94	Guyana	GUY	328	GY	592	Georgetown	GYD	Guyanese dollar	$	.gy	Guyana	Americas	2	South America	8	Guyanese	[{\\"zoneName\\":\\"America/Guyana\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"GYT\\",\\"tzName\\":\\"Guyana Time\\"}]	{\\"kr\\":\\"가이아나\\",\\"pt-BR\\":\\"Guiana\\",\\"pt\\":\\"Guiana\\",\\"nl\\":\\"Guyana\\",\\"hr\\":\\"Gvajana\\",\\"fa\\":\\"گویان\\",\\"de\\":\\"Guyana\\",\\"es\\":\\"Guyana\\",\\"fr\\":\\"Guyane\\",\\"ja\\":\\"ガイアナ\\",\\"it\\":\\"Guyana\\",\\"cn\\":\\"圭亚那\\",\\"tr\\":\\"Guyana\\"}	5.00000000	-59.00000000	🇬🇾	U+1F1EC U+1F1FE	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q734
95	Haiti	HTI	332	HT	509	Port-au-Prince	HTG	Haitian gourde	G	.ht	Haïti	Americas	2	Caribbean	7	Haitian	[{\\"zoneName\\":\\"America/Port-au-Prince\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"}]	{\\"kr\\":\\"아이티\\",\\"pt-BR\\":\\"Haiti\\",\\"pt\\":\\"Haiti\\",\\"nl\\":\\"Haïti\\",\\"hr\\":\\"Haiti\\",\\"fa\\":\\"هائیتی\\",\\"de\\":\\"Haiti\\",\\"es\\":\\"Haiti\\",\\"fr\\":\\"Haïti\\",\\"ja\\":\\"ハイチ\\",\\"it\\":\\"Haiti\\",\\"cn\\":\\"海地\\",\\"tr\\":\\"Haiti\\"}	19.00000000	-72.41666666	🇭🇹	U+1F1ED U+1F1F9	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q790
96	Heard Island and McDonald Islands	HMD	334	HM	672		AUD	Australian dollar	$	.hm	Heard Island and McDonald Islands		\N		\N	Heard Island or McDonald Islands	[{\\"zoneName\\":\\"Indian/Kerguelen\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"TFT\\",\\"tzName\\":\\"French Southern and Antarctic Time\\"}]	{\\"kr\\":\\"허드 맥도날드 제도\\",\\"pt-BR\\":\\"Ilha Heard e Ilhas McDonald\\",\\"pt\\":\\"Ilha Heard e Ilhas McDonald\\",\\"nl\\":\\"Heard- en McDonaldeilanden\\",\\"hr\\":\\"Otok Heard i otočje McDonald\\",\\"fa\\":\\"جزیره هرد و جزایر مک‌دونالد\\",\\"de\\":\\"Heard und die McDonaldinseln\\",\\"es\\":\\"Islas Heard y McDonald\\",\\"fr\\":\\"Îles Heard-et-MacDonald\\",\\"ja\\":\\"ハード島とマクドナルド諸島\\",\\"it\\":\\"Isole Heard e McDonald\\",\\"cn\\":\\"赫德·唐纳岛及麦唐纳岛\\",\\"tr\\":\\"Heard Adasi Ve Mcdonald Adalari\\"}	-53.10000000	72.51666666	🇭🇲	U+1F1ED U+1F1F2	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
97	Honduras	HND	340	HN	504	Tegucigalpa	HNL	Honduran lempira	L	.hn	Honduras	Americas	2	Central America	9	Honduran	[{\\"zoneName\\":\\"America/Tegucigalpa\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"}]	{\\"kr\\":\\"온두라스\\",\\"pt-BR\\":\\"Honduras\\",\\"pt\\":\\"Honduras\\",\\"nl\\":\\"Honduras\\",\\"hr\\":\\"Honduras\\",\\"fa\\":\\"هندوراس\\",\\"de\\":\\"Honduras\\",\\"es\\":\\"Honduras\\",\\"fr\\":\\"Honduras\\",\\"ja\\":\\"ホンジュラス\\",\\"it\\":\\"Honduras\\",\\"cn\\":\\"洪都拉斯\\",\\"tr\\":\\"Honduras\\"}	15.00000000	-86.50000000	🇭🇳	U+1F1ED U+1F1F3	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q783
154	Nepal	NPL	524	NP	977	Kathmandu	NPR	Nepalese rupee	₨	.np	नपल	Asia	3	Southern Asia	14	Nepali, Nepalese	[{\\"zoneName\\":\\"Asia/Kathmandu\\",\\"gmtOffset\\":20700,\\"gmtOffsetName\\":\\"UTC+05:45\\",\\"abbreviation\\":\\"NPT\\",\\"tzName\\":\\"Nepal Time\\"}]	{\\"kr\\":\\"네팔\\",\\"pt-BR\\":\\"Nepal\\",\\"pt\\":\\"Nepal\\",\\"nl\\":\\"Nepal\\",\\"hr\\":\\"Nepal\\",\\"fa\\":\\"نپال\\",\\"de\\":\\"Népal\\",\\"es\\":\\"Nepal\\",\\"fr\\":\\"Népal\\",\\"ja\\":\\"ネパール\\",\\"it\\":\\"Nepal\\",\\"cn\\":\\"尼泊尔\\",\\"tr\\":\\"Nepal\\"}	28.00000000	84.00000000	🇳🇵	U+1F1F3 U+1F1F5	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q837
98	Hong Kong S.A.R.	HKG	344	HK	852	Hong Kong	HKD	Hong Kong dollar	$	.hk	香港	Asia	3	Eastern Asia	12	Hong Kong, Hong Kongese	[{\\"zoneName\\":\\"Asia/Hong_Kong\\",\\"gmtOffset\\":28800,\\"gmtOffsetName\\":\\"UTC+08:00\\",\\"abbreviation\\":\\"HKT\\",\\"tzName\\":\\"Hong Kong Time\\"}]	{\\"kr\\":\\"홍콩\\",\\"pt-BR\\":\\"Hong Kong\\",\\"pt\\":\\"Hong Kong\\",\\"nl\\":\\"Hongkong\\",\\"hr\\":\\"Hong Kong\\",\\"fa\\":\\"هنگ‌کنگ\\",\\"de\\":\\"Hong Kong\\",\\"es\\":\\"Hong Kong\\",\\"fr\\":\\"Hong Kong\\",\\"ja\\":\\"香港\\",\\"it\\":\\"Hong Kong\\",\\"cn\\":\\"中国香港\\",\\"tr\\":\\"Hong Kong\\"}	22.25000000	114.16666666	🇭🇰	U+1F1ED U+1F1F0	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q8646
99	Hungary	HUN	348	HU	36	Budapest	HUF	Hungarian forint	Ft	.hu	Magyarország	Europe	4	Eastern Europe	15	Hungarian, Magyar	[{\\"zoneName\\":\\"Europe/Budapest\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"헝가리\\",\\"pt-BR\\":\\"Hungria\\",\\"pt\\":\\"Hungria\\",\\"nl\\":\\"Hongarije\\",\\"hr\\":\\"Mađarska\\",\\"fa\\":\\"مجارستان\\",\\"de\\":\\"Ungarn\\",\\"es\\":\\"Hungría\\",\\"fr\\":\\"Hongrie\\",\\"ja\\":\\"ハンガリー\\",\\"it\\":\\"Ungheria\\",\\"cn\\":\\"匈牙利\\",\\"tr\\":\\"Macaristan\\"}	47.00000000	20.00000000	🇭🇺	U+1F1ED U+1F1FA	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q28
100	Iceland	ISL	352	IS	354	Reykjavik	ISK	Icelandic króna	kr	.is	Ísland	Europe	4	Northern Europe	18	Icelandic	[{\\"zoneName\\":\\"Atlantic/Reykjavik\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"아이슬란드\\",\\"pt-BR\\":\\"Islândia\\",\\"pt\\":\\"Islândia\\",\\"nl\\":\\"IJsland\\",\\"hr\\":\\"Island\\",\\"fa\\":\\"ایسلند\\",\\"de\\":\\"Island\\",\\"es\\":\\"Islandia\\",\\"fr\\":\\"Islande\\",\\"ja\\":\\"アイスランド\\",\\"it\\":\\"Islanda\\",\\"cn\\":\\"冰岛\\",\\"tr\\":\\"İzlanda\\"}	65.00000000	-18.00000000	🇮🇸	U+1F1EE U+1F1F8	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q189
101	India	IND	356	IN	91	New Delhi	INR	Indian rupee	₹	.in	भारत	Asia	3	Southern Asia	14	Indian	[{\\"zoneName\\":\\"Asia/Kolkata\\",\\"gmtOffset\\":19800,\\"gmtOffsetName\\":\\"UTC+05:30\\",\\"abbreviation\\":\\"IST\\",\\"tzName\\":\\"Indian Standard Time\\"}]	{\\"kr\\":\\"인도\\",\\"pt-BR\\":\\"Índia\\",\\"pt\\":\\"Índia\\",\\"nl\\":\\"India\\",\\"hr\\":\\"Indija\\",\\"fa\\":\\"هند\\",\\"de\\":\\"Indien\\",\\"es\\":\\"India\\",\\"fr\\":\\"Inde\\",\\"ja\\":\\"インド\\",\\"it\\":\\"India\\",\\"cn\\":\\"印度\\",\\"tr\\":\\"Hindistan\\"}	20.00000000	77.00000000	🇮🇳	U+1F1EE U+1F1F3	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q668
102	Indonesia	IDN	360	ID	62	Jakarta	IDR	Indonesian rupiah	Rp	.id	Indonesia	Asia	3	South-Eastern Asia	13	Indonesian	[{\\"zoneName\\":\\"Asia/Jakarta\\",\\"gmtOffset\\":25200,\\"gmtOffsetName\\":\\"UTC+07:00\\",\\"abbreviation\\":\\"WIB\\",\\"tzName\\":\\"Western Indonesian Time\\"},{\\"zoneName\\":\\"Asia/Jayapura\\",\\"gmtOffset\\":32400,\\"gmtOffsetName\\":\\"UTC+09:00\\",\\"abbreviation\\":\\"WIT\\",\\"tzName\\":\\"Eastern Indonesian Time\\"},{\\"zoneName\\":\\"Asia/Makassar\\",\\"gmtOffset\\":28800,\\"gmtOffsetName\\":\\"UTC+08:00\\",\\"abbreviation\\":\\"WITA\\",\\"tzName\\":\\"Central Indonesia Time\\"},{\\"zoneName\\":\\"Asia/Pontianak\\",\\"gmtOffset\\":25200,\\"gmtOffsetName\\":\\"UTC+07:00\\",\\"abbreviation\\":\\"WIB\\",\\"tzName\\":\\"Western Indonesian Time\\"}]	{\\"kr\\":\\"인도네시아\\",\\"pt-BR\\":\\"Indonésia\\",\\"pt\\":\\"Indonésia\\",\\"nl\\":\\"Indonesië\\",\\"hr\\":\\"Indonezija\\",\\"fa\\":\\"اندونزی\\",\\"de\\":\\"Indonesien\\",\\"es\\":\\"Indonesia\\",\\"fr\\":\\"Indonésie\\",\\"ja\\":\\"インドネシア\\",\\"it\\":\\"Indonesia\\",\\"cn\\":\\"印度尼西亚\\",\\"tr\\":\\"Endonezya\\"}	-5.00000000	120.00000000	🇮🇩	U+1F1EE U+1F1E9	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q252
103	Iran	IRN	364	IR	98	Tehran	IRR	Iranian rial	﷼	.ir	ایران	Asia	3	Southern Asia	14	Iranian, Persian	[{\\"zoneName\\":\\"Asia/Tehran\\",\\"gmtOffset\\":12600,\\"gmtOffsetName\\":\\"UTC+03:30\\",\\"abbreviation\\":\\"IRDT\\",\\"tzName\\":\\"Iran Daylight Time\\"}]	{\\"kr\\":\\"이란\\",\\"pt-BR\\":\\"Irã\\",\\"pt\\":\\"Irão\\",\\"nl\\":\\"Iran\\",\\"hr\\":\\"Iran\\",\\"fa\\":\\"ایران\\",\\"de\\":\\"Iran\\",\\"es\\":\\"Iran\\",\\"fr\\":\\"Iran\\",\\"ja\\":\\"イラン・イスラム共和国\\",\\"cn\\":\\"伊朗\\",\\"tr\\":\\"İran\\"}	32.00000000	53.00000000	🇮🇷	U+1F1EE U+1F1F7	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q794
104	Iraq	IRQ	368	IQ	964	Baghdad	IQD	Iraqi dinar	د.ع	.iq	العراق	Asia	3	Western Asia	11	Iraqi	[{\\"zoneName\\":\\"Asia/Baghdad\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Arabia Standard Time\\"}]	{\\"kr\\":\\"이라크\\",\\"pt-BR\\":\\"Iraque\\",\\"pt\\":\\"Iraque\\",\\"nl\\":\\"Irak\\",\\"hr\\":\\"Irak\\",\\"fa\\":\\"عراق\\",\\"de\\":\\"Irak\\",\\"es\\":\\"Irak\\",\\"fr\\":\\"Irak\\",\\"ja\\":\\"イラク\\",\\"it\\":\\"Iraq\\",\\"cn\\":\\"伊拉克\\",\\"tr\\":\\"Irak\\"}	33.00000000	44.00000000	🇮🇶	U+1F1EE U+1F1F6	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q796
105	Ireland	IRL	372	IE	353	Dublin	EUR	Euro	€	.ie	Éire	Europe	4	Northern Europe	18	Irish	[{\\"zoneName\\":\\"Europe/Dublin\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"아일랜드\\",\\"pt-BR\\":\\"Irlanda\\",\\"pt\\":\\"Irlanda\\",\\"nl\\":\\"Ierland\\",\\"hr\\":\\"Irska\\",\\"fa\\":\\"ایرلند\\",\\"de\\":\\"Irland\\",\\"es\\":\\"Irlanda\\",\\"fr\\":\\"Irlande\\",\\"ja\\":\\"アイルランド\\",\\"it\\":\\"Irlanda\\",\\"cn\\":\\"爱尔兰\\",\\"tr\\":\\"İrlanda\\"}	53.00000000	-8.00000000	🇮🇪	U+1F1EE U+1F1EA	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q27
106	Israel	ISR	376	IL	972	Jerusalem	ILS	Israeli new shekel	₪	.il	יִשְׂרָאֵל	Asia	3	Western Asia	11	Israeli	[{\\"zoneName\\":\\"Asia/Jerusalem\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"IST\\",\\"tzName\\":\\"Israel Standard Time\\"}]	{\\"kr\\":\\"이스라엘\\",\\"pt-BR\\":\\"Israel\\",\\"pt\\":\\"Israel\\",\\"nl\\":\\"Israël\\",\\"hr\\":\\"Izrael\\",\\"fa\\":\\"اسرائیل\\",\\"de\\":\\"Israel\\",\\"es\\":\\"Israel\\",\\"fr\\":\\"Israël\\",\\"ja\\":\\"イスラエル\\",\\"it\\":\\"Israele\\",\\"cn\\":\\"以色列\\",\\"tr\\":\\"İsrail\\"}	31.50000000	34.75000000	🇮🇱	U+1F1EE U+1F1F1	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q801
107	Italy	ITA	380	IT	39	Rome	EUR	Euro	€	.it	Italia	Europe	4	Southern Europe	16	Italian	[{\\"zoneName\\":\\"Europe/Rome\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"이탈리아\\",\\"pt-BR\\":\\"Itália\\",\\"pt\\":\\"Itália\\",\\"nl\\":\\"Italië\\",\\"hr\\":\\"Italija\\",\\"fa\\":\\"ایتالیا\\",\\"de\\":\\"Italien\\",\\"es\\":\\"Italia\\",\\"fr\\":\\"Italie\\",\\"ja\\":\\"イタリア\\",\\"it\\":\\"Italia\\",\\"cn\\":\\"意大利\\",\\"tr\\":\\"İtalya\\"}	42.83333333	12.83333333	🇮🇹	U+1F1EE U+1F1F9	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q38
108	Jamaica	JAM	388	JM	+1-876	Kingston	JMD	Jamaican dollar	J$	.jm	Jamaica	Americas	2	Caribbean	7	Jamaican	[{\\"zoneName\\":\\"America/Jamaica\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"}]	{\\"kr\\":\\"자메이카\\",\\"pt-BR\\":\\"Jamaica\\",\\"pt\\":\\"Jamaica\\",\\"nl\\":\\"Jamaica\\",\\"hr\\":\\"Jamajka\\",\\"fa\\":\\"جامائیکا\\",\\"de\\":\\"Jamaika\\",\\"es\\":\\"Jamaica\\",\\"fr\\":\\"Jamaïque\\",\\"ja\\":\\"ジャマイカ\\",\\"it\\":\\"Giamaica\\",\\"cn\\":\\"牙买加\\",\\"tr\\":\\"Jamaika\\"}	18.25000000	-77.50000000	🇯🇲	U+1F1EF U+1F1F2	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q766
109	Japan	JPN	392	JP	81	Tokyo	JPY	Japanese yen	¥	.jp	日本	Asia	3	Eastern Asia	12	Japanese	[{\\"zoneName\\":\\"Asia/Tokyo\\",\\"gmtOffset\\":32400,\\"gmtOffsetName\\":\\"UTC+09:00\\",\\"abbreviation\\":\\"JST\\",\\"tzName\\":\\"Japan Standard Time\\"}]	{\\"kr\\":\\"일본\\",\\"pt-BR\\":\\"Japão\\",\\"pt\\":\\"Japão\\",\\"nl\\":\\"Japan\\",\\"hr\\":\\"Japan\\",\\"fa\\":\\"ژاپن\\",\\"de\\":\\"Japan\\",\\"es\\":\\"Japón\\",\\"fr\\":\\"Japon\\",\\"ja\\":\\"日本\\",\\"it\\":\\"Giappone\\",\\"cn\\":\\"日本\\",\\"tr\\":\\"Japonya\\"}	36.00000000	138.00000000	🇯🇵	U+1F1EF U+1F1F5	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q17
110	Jersey	JEY	832	JE	+44-1534	Saint Helier	GBP	British pound	£	.je	Jersey	Europe	4	Northern Europe	18	Channel Island	[{\\"zoneName\\":\\"Europe/Jersey\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"저지 섬\\",\\"pt-BR\\":\\"Jersey\\",\\"pt\\":\\"Jersey\\",\\"nl\\":\\"Jersey\\",\\"hr\\":\\"Jersey\\",\\"fa\\":\\"جرزی\\",\\"de\\":\\"Jersey\\",\\"es\\":\\"Jersey\\",\\"fr\\":\\"Jersey\\",\\"ja\\":\\"ジャージー\\",\\"it\\":\\"Isola di Jersey\\",\\"cn\\":\\"泽西岛\\",\\"tr\\":\\"Jersey\\"}	49.25000000	-2.16666666	🇯🇪	U+1F1EF U+1F1EA	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q785
111	Jordan	JOR	400	JO	962	Amman	JOD	Jordanian dinar	ا.د	.jo	الأردن	Asia	3	Western Asia	11	Jordanian	[{\\"zoneName\\":\\"Asia/Amman\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"요르단\\",\\"pt-BR\\":\\"Jordânia\\",\\"pt\\":\\"Jordânia\\",\\"nl\\":\\"Jordanië\\",\\"hr\\":\\"Jordan\\",\\"fa\\":\\"اردن\\",\\"de\\":\\"Jordanien\\",\\"es\\":\\"Jordania\\",\\"fr\\":\\"Jordanie\\",\\"ja\\":\\"ヨルダン\\",\\"it\\":\\"Giordania\\",\\"cn\\":\\"约旦\\",\\"tr\\":\\"Ürdün\\"}	31.00000000	36.00000000	🇯🇴	U+1F1EF U+1F1F4	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q810
112	Kazakhstan	KAZ	398	KZ	7	Astana	KZT	Kazakhstani tenge	лв	.kz	Қазақстан	Asia	3	Central Asia	10	Kazakhstani, Kazakh	[{\\"zoneName\\":\\"Asia/Almaty\\",\\"gmtOffset\\":21600,\\"gmtOffsetName\\":\\"UTC+06:00\\",\\"abbreviation\\":\\"ALMT\\",\\"tzName\\":\\"Alma-Ata Time[1\\"},{\\"zoneName\\":\\"Asia/Aqtau\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"AQTT\\",\\"tzName\\":\\"Aqtobe Time\\"},{\\"zoneName\\":\\"Asia/Aqtobe\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"AQTT\\",\\"tzName\\":\\"Aqtobe Time\\"},{\\"zoneName\\":\\"Asia/Atyrau\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"MSD+1\\",\\"tzName\\":\\"Moscow Daylight Time+1\\"},{\\"zoneName\\":\\"Asia/Oral\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"ORAT\\",\\"tzName\\":\\"Oral Time\\"},{\\"zoneName\\":\\"Asia/Qostanay\\",\\"gmtOffset\\":21600,\\"gmtOffsetName\\":\\"UTC+06:00\\",\\"abbreviation\\":\\"QYZST\\",\\"tzName\\":\\"Qyzylorda Summer Time\\"},{\\"zoneName\\":\\"Asia/Qyzylorda\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"QYZT\\",\\"tzName\\":\\"Qyzylorda Summer Time\\"}]	{\\"kr\\":\\"카자흐스탄\\",\\"pt-BR\\":\\"Cazaquistão\\",\\"pt\\":\\"Cazaquistão\\",\\"nl\\":\\"Kazachstan\\",\\"hr\\":\\"Kazahstan\\",\\"fa\\":\\"قزاقستان\\",\\"de\\":\\"Kasachstan\\",\\"es\\":\\"Kazajistán\\",\\"fr\\":\\"Kazakhstan\\",\\"ja\\":\\"カザフスタン\\",\\"it\\":\\"Kazakistan\\",\\"cn\\":\\"哈萨克斯坦\\",\\"tr\\":\\"Kazakistan\\"}	48.00000000	68.00000000	🇰🇿	U+1F1F0 U+1F1FF	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q232
113	Kenya	KEN	404	KE	254	Nairobi	KES	Kenyan shilling	KSh	.ke	Kenya	Africa	1	Eastern Africa	4	Kenyan	[{\\"zoneName\\":\\"Africa/Nairobi\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"EAT\\",\\"tzName\\":\\"East Africa Time\\"}]	{\\"kr\\":\\"케냐\\",\\"pt-BR\\":\\"Quênia\\",\\"pt\\":\\"Quénia\\",\\"nl\\":\\"Kenia\\",\\"hr\\":\\"Kenija\\",\\"fa\\":\\"کنیا\\",\\"de\\":\\"Kenia\\",\\"es\\":\\"Kenia\\",\\"fr\\":\\"Kenya\\",\\"ja\\":\\"ケニア\\",\\"it\\":\\"Kenya\\",\\"cn\\":\\"肯尼亚\\",\\"tr\\":\\"Kenya\\"}	1.00000000	38.00000000	🇰🇪	U+1F1F0 U+1F1EA	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q114
114	Kiribati	KIR	296	KI	686	Tarawa	AUD	Australian dollar	$	.ki	Kiribati	Oceania	5	Micronesia	21	I-Kiribati	[{\\"zoneName\\":\\"Pacific/Enderbury\\",\\"gmtOffset\\":46800,\\"gmtOffsetName\\":\\"UTC+13:00\\",\\"abbreviation\\":\\"PHOT\\",\\"tzName\\":\\"Phoenix Island Time\\"},{\\"zoneName\\":\\"Pacific/Kiritimati\\",\\"gmtOffset\\":50400,\\"gmtOffsetName\\":\\"UTC+14:00\\",\\"abbreviation\\":\\"LINT\\",\\"tzName\\":\\"Line Islands Time\\"},{\\"zoneName\\":\\"Pacific/Tarawa\\",\\"gmtOffset\\":43200,\\"gmtOffsetName\\":\\"UTC+12:00\\",\\"abbreviation\\":\\"GILT\\",\\"tzName\\":\\"Gilbert Island Time\\"}]	{\\"kr\\":\\"키리바시\\",\\"pt-BR\\":\\"Kiribati\\",\\"pt\\":\\"Quiribáti\\",\\"nl\\":\\"Kiribati\\",\\"hr\\":\\"Kiribati\\",\\"fa\\":\\"کیریباتی\\",\\"de\\":\\"Kiribati\\",\\"es\\":\\"Kiribati\\",\\"fr\\":\\"Kiribati\\",\\"ja\\":\\"キリバス\\",\\"it\\":\\"Kiribati\\",\\"cn\\":\\"基里巴斯\\",\\"tr\\":\\"Kiribati\\"}	1.41666666	173.00000000	🇰🇮	U+1F1F0 U+1F1EE	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q710
115	North Korea	PRK	408	KP	850	Pyongyang	KPW	North Korean Won	₩	.kp	북한	Asia	3	Eastern Asia	12	North Korean	[{\\"zoneName\\":\\"Asia/Pyongyang\\",\\"gmtOffset\\":32400,\\"gmtOffsetName\\":\\"UTC+09:00\\",\\"abbreviation\\":\\"KST\\",\\"tzName\\":\\"Korea Standard Time\\"}]	{\\"kr\\":\\"조선민주주의인민공화국\\",\\"pt-BR\\":\\"Coreia do Norte\\",\\"pt\\":\\"Coreia do Norte\\",\\"nl\\":\\"Noord-Korea\\",\\"hr\\":\\"Sjeverna Koreja\\",\\"fa\\":\\"کره جنوبی\\",\\"de\\":\\"Nordkorea\\",\\"es\\":\\"Corea del Norte\\",\\"fr\\":\\"Corée du Nord\\",\\"ja\\":\\"朝鮮民主主義人民共和国\\",\\"it\\":\\"Corea del Nord\\",\\"cn\\":\\"朝鲜\\",\\"tr\\":\\"Kuzey Kore\\"}	40.00000000	127.00000000	🇰🇵	U+1F1F0 U+1F1F5	2018-07-21 09:11:03	2023-08-11 17:45:55	1	Q423
116	South Korea	KOR	410	KR	82	Seoul	KRW	Won	₩	.kr	대한민국	Asia	3	Eastern Asia	12	South Korean	[{\\"zoneName\\":\\"Asia/Seoul\\",\\"gmtOffset\\":32400,\\"gmtOffsetName\\":\\"UTC+09:00\\",\\"abbreviation\\":\\"KST\\",\\"tzName\\":\\"Korea Standard Time\\"}]	{\\"kr\\":\\"대한민국\\",\\"pt-BR\\":\\"Coreia do Sul\\",\\"pt\\":\\"Coreia do Sul\\",\\"nl\\":\\"Zuid-Korea\\",\\"hr\\":\\"Južna Koreja\\",\\"fa\\":\\"کره شمالی\\",\\"de\\":\\"Südkorea\\",\\"es\\":\\"Corea del Sur\\",\\"fr\\":\\"Corée du Sud\\",\\"ja\\":\\"大韓民国\\",\\"it\\":\\"Corea del Sud\\",\\"cn\\":\\"韩国\\",\\"tr\\":\\"Güney Kore\\"}	37.00000000	127.50000000	🇰🇷	U+1F1F0 U+1F1F7	2018-07-21 09:11:03	2023-08-11 17:45:55	1	Q884
117	Kuwait	KWT	414	KW	965	Kuwait City	KWD	Kuwaiti dinar	ك.د	.kw	الكويت	Asia	3	Western Asia	11	Kuwaiti	[{\\"zoneName\\":\\"Asia/Kuwait\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Arabia Standard Time\\"}]	{\\"kr\\":\\"쿠웨이트\\",\\"pt-BR\\":\\"Kuwait\\",\\"pt\\":\\"Kuwait\\",\\"nl\\":\\"Koeweit\\",\\"hr\\":\\"Kuvajt\\",\\"fa\\":\\"کویت\\",\\"de\\":\\"Kuwait\\",\\"es\\":\\"Kuwait\\",\\"fr\\":\\"Koweït\\",\\"ja\\":\\"クウェート\\",\\"it\\":\\"Kuwait\\",\\"cn\\":\\"科威特\\",\\"tr\\":\\"Kuveyt\\"}	29.50000000	45.75000000	🇰🇼	U+1F1F0 U+1F1FC	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q817
118	Kyrgyzstan	KGZ	417	KG	996	Bishkek	KGS	Kyrgyzstani som	лв	.kg	Кыргызстан	Asia	3	Central Asia	10	Kyrgyzstani, Kyrgyz, Kirgiz, Kirghiz	[{\\"zoneName\\":\\"Asia/Bishkek\\",\\"gmtOffset\\":21600,\\"gmtOffsetName\\":\\"UTC+06:00\\",\\"abbreviation\\":\\"KGT\\",\\"tzName\\":\\"Kyrgyzstan Time\\"}]	{\\"kr\\":\\"키르기스스탄\\",\\"pt-BR\\":\\"Quirguistão\\",\\"pt\\":\\"Quirguizistão\\",\\"nl\\":\\"Kirgizië\\",\\"hr\\":\\"Kirgistan\\",\\"fa\\":\\"قرقیزستان\\",\\"de\\":\\"Kirgisistan\\",\\"es\\":\\"Kirguizistán\\",\\"fr\\":\\"Kirghizistan\\",\\"ja\\":\\"キルギス\\",\\"it\\":\\"Kirghizistan\\",\\"cn\\":\\"吉尔吉斯斯坦\\",\\"tr\\":\\"Kirgizistan\\"}	41.00000000	75.00000000	🇰🇬	U+1F1F0 U+1F1EC	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q813
119	Laos	LAO	418	LA	856	Vientiane	LAK	Lao kip	₭	.la	ສປປລາວ	Asia	3	South-Eastern Asia	13	Lao, Laotian	[{\\"zoneName\\":\\"Asia/Vientiane\\",\\"gmtOffset\\":25200,\\"gmtOffsetName\\":\\"UTC+07:00\\",\\"abbreviation\\":\\"ICT\\",\\"tzName\\":\\"Indochina Time\\"}]	{\\"kr\\":\\"라오스\\",\\"pt-BR\\":\\"Laos\\",\\"pt\\":\\"Laos\\",\\"nl\\":\\"Laos\\",\\"hr\\":\\"Laos\\",\\"fa\\":\\"لائوس\\",\\"de\\":\\"Laos\\",\\"es\\":\\"Laos\\",\\"fr\\":\\"Laos\\",\\"ja\\":\\"ラオス人民民主共和国\\",\\"it\\":\\"Laos\\",\\"cn\\":\\"寮人民民主共和国\\",\\"tr\\":\\"Laos\\"}	18.00000000	105.00000000	🇱🇦	U+1F1F1 U+1F1E6	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q819
120	Latvia	LVA	428	LV	371	Riga	EUR	Euro	€	.lv	Latvija	Europe	4	Northern Europe	18	Latvian	[{\\"zoneName\\":\\"Europe/Riga\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"라트비아\\",\\"pt-BR\\":\\"Letônia\\",\\"pt\\":\\"Letónia\\",\\"nl\\":\\"Letland\\",\\"hr\\":\\"Latvija\\",\\"fa\\":\\"لتونی\\",\\"de\\":\\"Lettland\\",\\"es\\":\\"Letonia\\",\\"fr\\":\\"Lettonie\\",\\"ja\\":\\"ラトビア\\",\\"it\\":\\"Lettonia\\",\\"cn\\":\\"拉脱维亚\\",\\"tr\\":\\"Letonya\\"}	57.00000000	25.00000000	🇱🇻	U+1F1F1 U+1F1FB	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q211
121	Lebanon	LBN	422	LB	961	Beirut	LBP	Lebanese pound	£	.lb	لبنان	Asia	3	Western Asia	11	Lebanese	[{\\"zoneName\\":\\"Asia/Beirut\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"레바논\\",\\"pt-BR\\":\\"Líbano\\",\\"pt\\":\\"Líbano\\",\\"nl\\":\\"Libanon\\",\\"hr\\":\\"Libanon\\",\\"fa\\":\\"لبنان\\",\\"de\\":\\"Libanon\\",\\"es\\":\\"Líbano\\",\\"fr\\":\\"Liban\\",\\"ja\\":\\"レバノン\\",\\"it\\":\\"Libano\\",\\"cn\\":\\"黎巴嫩\\",\\"tr\\":\\"Lübnan\\"}	33.83333333	35.83333333	🇱🇧	U+1F1F1 U+1F1E7	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q822
122	Lesotho	LSO	426	LS	266	Maseru	LSL	Lesotho loti	L	.ls	Lesotho	Africa	1	Southern Africa	5	Basotho	[{\\"zoneName\\":\\"Africa/Maseru\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"SAST\\",\\"tzName\\":\\"South African Standard Time\\"}]	{\\"kr\\":\\"레소토\\",\\"pt-BR\\":\\"Lesoto\\",\\"pt\\":\\"Lesoto\\",\\"nl\\":\\"Lesotho\\",\\"hr\\":\\"Lesoto\\",\\"fa\\":\\"لسوتو\\",\\"de\\":\\"Lesotho\\",\\"es\\":\\"Lesotho\\",\\"fr\\":\\"Lesotho\\",\\"ja\\":\\"レソト\\",\\"it\\":\\"Lesotho\\",\\"cn\\":\\"莱索托\\",\\"tr\\":\\"Lesotho\\"}	-29.50000000	28.50000000	🇱🇸	U+1F1F1 U+1F1F8	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q1013
123	Liberia	LBR	430	LR	231	Monrovia	LRD	Liberian dollar	$	.lr	Liberia	Africa	1	Western Africa	3	Liberian	[{\\"zoneName\\":\\"Africa/Monrovia\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"라이베리아\\",\\"pt-BR\\":\\"Libéria\\",\\"pt\\":\\"Libéria\\",\\"nl\\":\\"Liberia\\",\\"hr\\":\\"Liberija\\",\\"fa\\":\\"لیبریا\\",\\"de\\":\\"Liberia\\",\\"es\\":\\"Liberia\\",\\"fr\\":\\"Liberia\\",\\"ja\\":\\"リベリア\\",\\"it\\":\\"Liberia\\",\\"cn\\":\\"利比里亚\\",\\"tr\\":\\"Liberya\\"}	6.50000000	-9.50000000	🇱🇷	U+1F1F1 U+1F1F7	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q1014
124	Libya	LBY	434	LY	218	Tripolis	LYD	Libyan dinar	د.ل	.ly	‏ليبيا	Africa	1	Northern Africa	1	Libyan	[{\\"zoneName\\":\\"Africa/Tripoli\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"리비아\\",\\"pt-BR\\":\\"Líbia\\",\\"pt\\":\\"Líbia\\",\\"nl\\":\\"Libië\\",\\"hr\\":\\"Libija\\",\\"fa\\":\\"لیبی\\",\\"de\\":\\"Libyen\\",\\"es\\":\\"Libia\\",\\"fr\\":\\"Libye\\",\\"ja\\":\\"リビア\\",\\"it\\":\\"Libia\\",\\"cn\\":\\"利比亚\\",\\"tr\\":\\"Libya\\"}	25.00000000	17.00000000	🇱🇾	U+1F1F1 U+1F1FE	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q1016
125	Liechtenstein	LIE	438	LI	423	Vaduz	CHF	Swiss franc	CHf	.li	Liechtenstein	Europe	4	Western Europe	17	Liechtenstein	[{\\"zoneName\\":\\"Europe/Vaduz\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"리히텐슈타인\\",\\"pt-BR\\":\\"Liechtenstein\\",\\"pt\\":\\"Listenstaine\\",\\"nl\\":\\"Liechtenstein\\",\\"hr\\":\\"Lihtenštajn\\",\\"fa\\":\\"لیختن‌اشتاین\\",\\"de\\":\\"Liechtenstein\\",\\"es\\":\\"Liechtenstein\\",\\"fr\\":\\"Liechtenstein\\",\\"ja\\":\\"リヒテンシュタイン\\",\\"it\\":\\"Liechtenstein\\",\\"cn\\":\\"列支敦士登\\",\\"tr\\":\\"Lihtenştayn\\"}	47.26666666	9.53333333	🇱🇮	U+1F1F1 U+1F1EE	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q347
126	Lithuania	LTU	440	LT	370	Vilnius	EUR	Euro	€	.lt	Lietuva	Europe	4	Northern Europe	18	Lithuanian	[{\\"zoneName\\":\\"Europe/Vilnius\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"리투아니아\\",\\"pt-BR\\":\\"Lituânia\\",\\"pt\\":\\"Lituânia\\",\\"nl\\":\\"Litouwen\\",\\"hr\\":\\"Litva\\",\\"fa\\":\\"لیتوانی\\",\\"de\\":\\"Litauen\\",\\"es\\":\\"Lituania\\",\\"fr\\":\\"Lituanie\\",\\"ja\\":\\"リトアニア\\",\\"it\\":\\"Lituania\\",\\"cn\\":\\"立陶宛\\",\\"tr\\":\\"Litvanya\\"}	56.00000000	24.00000000	🇱🇹	U+1F1F1 U+1F1F9	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q37
127	Luxembourg	LUX	442	LU	352	Luxembourg	EUR	Euro	€	.lu	Luxembourg	Europe	4	Western Europe	17	Luxembourg, Luxembourgish	[{\\"zoneName\\":\\"Europe/Luxembourg\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"룩셈부르크\\",\\"pt-BR\\":\\"Luxemburgo\\",\\"pt\\":\\"Luxemburgo\\",\\"nl\\":\\"Luxemburg\\",\\"hr\\":\\"Luksemburg\\",\\"fa\\":\\"لوکزامبورگ\\",\\"de\\":\\"Luxemburg\\",\\"es\\":\\"Luxemburgo\\",\\"fr\\":\\"Luxembourg\\",\\"ja\\":\\"ルクセンブルク\\",\\"it\\":\\"Lussemburgo\\",\\"cn\\":\\"卢森堡\\",\\"tr\\":\\"Lüksemburg\\"}	49.75000000	6.16666666	🇱🇺	U+1F1F1 U+1F1FA	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q32
128	Macau S.A.R.	MAC	446	MO	853	Macao	MOP	Macanese pataca	$	.mo	澳門	Asia	3	Eastern Asia	12	Macanese, Chinese	[{\\"zoneName\\":\\"Asia/Macau\\",\\"gmtOffset\\":28800,\\"gmtOffsetName\\":\\"UTC+08:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"China Standard Time\\"}]	{\\"kr\\":\\"마카오\\",\\"pt-BR\\":\\"Macau\\",\\"pt\\":\\"Macau\\",\\"nl\\":\\"Macao\\",\\"hr\\":\\"Makao\\",\\"fa\\":\\"مکائو\\",\\"de\\":\\"Macao\\",\\"es\\":\\"Macao\\",\\"fr\\":\\"Macao\\",\\"ja\\":\\"マカオ\\",\\"it\\":\\"Macao\\",\\"cn\\":\\"中国澳门\\",\\"tr\\":\\"Makao\\"}	22.16666666	113.55000000	🇲🇴	U+1F1F2 U+1F1F4	2018-07-21 09:11:03	2023-08-08 23:04:58	1	\N
129	North Macedonia	MKD	807	MK	389	Skopje	MKD	Denar	ден	.mk	Северна Македонија	Europe	4	Southern Europe	16	Macedonian	[{\\"zoneName\\":\\"Europe/Skopje\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"북마케도니아\\",\\"pt-BR\\":\\"Macedônia do Norte\\",\\"pt\\":\\"Macedónia do Norte\\",\\"nl\\":\\"Noord-Macedonië\\",\\"hr\\":\\"Sjeverna Makedonija\\",\\"fa\\":\\"ﻢﻗﺩﻮﻨﯿﻫ ﺶﻣﺎﻠﯾ\\",\\"de\\":\\"Nordmazedonien\\",\\"es\\":\\"Macedonia del Norte\\",\\"fr\\":\\"Macédoine du Nord\\",\\"ja\\":\\"北マケドニア\\",\\"it\\":\\"Macedonia del Nord\\",\\"cn\\":\\"北馬其頓\\",\\"tr\\":\\"Kuzey Makedonya\\"}	41.83333333	22.00000000	🇲🇰	U+1F1F2 U+1F1F0	2018-07-21 09:11:03	2023-08-11 17:45:55	1	Q221
130	Madagascar	MDG	450	MG	261	Antananarivo	MGA	Malagasy ariary	Ar	.mg	Madagasikara	Africa	1	Eastern Africa	4	Malagasy	[{\\"zoneName\\":\\"Indian/Antananarivo\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"EAT\\",\\"tzName\\":\\"East Africa Time\\"}]	{\\"kr\\":\\"마다가스카르\\",\\"pt-BR\\":\\"Madagascar\\",\\"pt\\":\\"Madagáscar\\",\\"nl\\":\\"Madagaskar\\",\\"hr\\":\\"Madagaskar\\",\\"fa\\":\\"ماداگاسکار\\",\\"de\\":\\"Madagaskar\\",\\"es\\":\\"Madagascar\\",\\"fr\\":\\"Madagascar\\",\\"ja\\":\\"マダガスカル\\",\\"it\\":\\"Madagascar\\",\\"cn\\":\\"马达加斯加\\",\\"tr\\":\\"Madagaskar\\"}	-20.00000000	47.00000000	🇲🇬	U+1F1F2 U+1F1EC	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q1019
131	Malawi	MWI	454	MW	265	Lilongwe	MWK	Malawian kwacha	MK	.mw	Malawi	Africa	1	Eastern Africa	4	Malawian	[{\\"zoneName\\":\\"Africa/Blantyre\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"CAT\\",\\"tzName\\":\\"Central Africa Time\\"}]	{\\"kr\\":\\"말라위\\",\\"pt-BR\\":\\"Malawi\\",\\"pt\\":\\"Malávi\\",\\"nl\\":\\"Malawi\\",\\"hr\\":\\"Malavi\\",\\"fa\\":\\"مالاوی\\",\\"de\\":\\"Malawi\\",\\"es\\":\\"Malawi\\",\\"fr\\":\\"Malawi\\",\\"ja\\":\\"マラウイ\\",\\"it\\":\\"Malawi\\",\\"cn\\":\\"马拉维\\",\\"tr\\":\\"Malavi\\"}	-13.50000000	34.00000000	🇲🇼	U+1F1F2 U+1F1FC	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q1020
132	Malaysia	MYS	458	MY	60	Kuala Lumpur	MYR	Malaysian ringgit	RM	.my	Malaysia	Asia	3	South-Eastern Asia	13	Malaysian	[{\\"zoneName\\":\\"Asia/Kuala_Lumpur\\",\\"gmtOffset\\":28800,\\"gmtOffsetName\\":\\"UTC+08:00\\",\\"abbreviation\\":\\"MYT\\",\\"tzName\\":\\"Malaysia Time\\"},{\\"zoneName\\":\\"Asia/Kuching\\",\\"gmtOffset\\":28800,\\"gmtOffsetName\\":\\"UTC+08:00\\",\\"abbreviation\\":\\"MYT\\",\\"tzName\\":\\"Malaysia Time\\"}]	{\\"kr\\":\\"말레이시아\\",\\"pt-BR\\":\\"Malásia\\",\\"pt\\":\\"Malásia\\",\\"nl\\":\\"Maleisië\\",\\"hr\\":\\"Malezija\\",\\"fa\\":\\"مالزی\\",\\"de\\":\\"Malaysia\\",\\"es\\":\\"Malasia\\",\\"fr\\":\\"Malaisie\\",\\"ja\\":\\"マレーシア\\",\\"it\\":\\"Malesia\\",\\"cn\\":\\"马来西亚\\",\\"tr\\":\\"Malezya\\"}	2.50000000	112.50000000	🇲🇾	U+1F1F2 U+1F1FE	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q833
133	Maldives	MDV	462	MV	960	Male	MVR	Maldivian rufiyaa	Rf	.mv	Maldives	Asia	3	Southern Asia	14	Maldivian	[{\\"zoneName\\":\\"Indian/Maldives\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"MVT\\",\\"tzName\\":\\"Maldives Time\\"}]	{\\"kr\\":\\"몰디브\\",\\"pt-BR\\":\\"Maldivas\\",\\"pt\\":\\"Maldivas\\",\\"nl\\":\\"Maldiven\\",\\"hr\\":\\"Maldivi\\",\\"fa\\":\\"مالدیو\\",\\"de\\":\\"Malediven\\",\\"es\\":\\"Maldivas\\",\\"fr\\":\\"Maldives\\",\\"ja\\":\\"モルディブ\\",\\"it\\":\\"Maldive\\",\\"cn\\":\\"马尔代夫\\",\\"tr\\":\\"Maldivler\\"}	3.25000000	73.00000000	🇲🇻	U+1F1F2 U+1F1FB	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q826
134	Mali	MLI	466	ML	223	Bamako	XOF	West African CFA franc	CFA	.ml	Mali	Africa	1	Western Africa	3	Malian, Malinese	[{\\"zoneName\\":\\"Africa/Bamako\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"말리\\",\\"pt-BR\\":\\"Mali\\",\\"pt\\":\\"Mali\\",\\"nl\\":\\"Mali\\",\\"hr\\":\\"Mali\\",\\"fa\\":\\"مالی\\",\\"de\\":\\"Mali\\",\\"es\\":\\"Mali\\",\\"fr\\":\\"Mali\\",\\"ja\\":\\"マリ\\",\\"it\\":\\"Mali\\",\\"cn\\":\\"马里\\",\\"tr\\":\\"Mali\\"}	17.00000000	-4.00000000	🇲🇱	U+1F1F2 U+1F1F1	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q912
135	Malta	MLT	470	MT	356	Valletta	EUR	Euro	€	.mt	Malta	Europe	4	Southern Europe	16	Maltese	[{\\"zoneName\\":\\"Europe/Malta\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"몰타\\",\\"pt-BR\\":\\"Malta\\",\\"pt\\":\\"Malta\\",\\"nl\\":\\"Malta\\",\\"hr\\":\\"Malta\\",\\"fa\\":\\"مالت\\",\\"de\\":\\"Malta\\",\\"es\\":\\"Malta\\",\\"fr\\":\\"Malte\\",\\"ja\\":\\"マルタ\\",\\"it\\":\\"Malta\\",\\"cn\\":\\"马耳他\\",\\"tr\\":\\"Malta\\"}	35.83333333	14.58333333	🇲🇹	U+1F1F2 U+1F1F9	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q233
136	Man (Isle of)	IMN	833	IM	+44-1624	Douglas, Isle of Man	GBP	British pound	£	.im	Isle of Man	Europe	4	Northern Europe	18	Manx	[{\\"zoneName\\":\\"Europe/Isle_of_Man\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"맨 섬\\",\\"pt-BR\\":\\"Ilha de Man\\",\\"pt\\":\\"Ilha de Man\\",\\"nl\\":\\"Isle of Man\\",\\"hr\\":\\"Otok Man\\",\\"fa\\":\\"جزیره من\\",\\"de\\":\\"Insel Man\\",\\"es\\":\\"Isla de Man\\",\\"fr\\":\\"Île de Man\\",\\"ja\\":\\"マン島\\",\\"it\\":\\"Isola di Man\\",\\"cn\\":\\"马恩岛\\",\\"tr\\":\\"Man Adasi\\"}	54.25000000	-4.50000000	🇮🇲	U+1F1EE U+1F1F2	2018-07-21 09:11:03	2023-08-11 17:45:55	1	\N
137	Marshall Islands	MHL	584	MH	692	Majuro	USD	United States dollar	$	.mh	M̧ajeļ	Oceania	5	Micronesia	21	Marshallese	[{\\"zoneName\\":\\"Pacific/Kwajalein\\",\\"gmtOffset\\":43200,\\"gmtOffsetName\\":\\"UTC+12:00\\",\\"abbreviation\\":\\"MHT\\",\\"tzName\\":\\"Marshall Islands Time\\"},{\\"zoneName\\":\\"Pacific/Majuro\\",\\"gmtOffset\\":43200,\\"gmtOffsetName\\":\\"UTC+12:00\\",\\"abbreviation\\":\\"MHT\\",\\"tzName\\":\\"Marshall Islands Time\\"}]	{\\"kr\\":\\"마셜 제도\\",\\"pt-BR\\":\\"Ilhas Marshall\\",\\"pt\\":\\"Ilhas Marshall\\",\\"nl\\":\\"Marshalleilanden\\",\\"hr\\":\\"Maršalovi Otoci\\",\\"fa\\":\\"جزایر مارشال\\",\\"de\\":\\"Marshallinseln\\",\\"es\\":\\"Islas Marshall\\",\\"fr\\":\\"Îles Marshall\\",\\"ja\\":\\"マーシャル諸島\\",\\"it\\":\\"Isole Marshall\\",\\"cn\\":\\"马绍尔群岛\\",\\"tr\\":\\"Marşal Adalari\\"}	9.00000000	168.00000000	🇲🇭	U+1F1F2 U+1F1ED	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q709
138	Martinique	MTQ	474	MQ	596	Fort-de-France	EUR	Euro	€	.mq	Martinique	Americas	2	Caribbean	7	Martiniquais, Martinican	[{\\"zoneName\\":\\"America/Martinique\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"마르티니크\\",\\"pt-BR\\":\\"Martinica\\",\\"pt\\":\\"Martinica\\",\\"nl\\":\\"Martinique\\",\\"hr\\":\\"Martinique\\",\\"fa\\":\\"مونتسرات\\",\\"de\\":\\"Martinique\\",\\"es\\":\\"Martinica\\",\\"fr\\":\\"Martinique\\",\\"ja\\":\\"マルティニーク\\",\\"it\\":\\"Martinica\\",\\"cn\\":\\"马提尼克岛\\",\\"tr\\":\\"Martinik\\"}	14.66666700	-61.00000000	🇲🇶	U+1F1F2 U+1F1F6	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
139	Mauritania	MRT	478	MR	222	Nouakchott	MRO	Mauritanian ouguiya	MRU	.mr	موريتانيا	Africa	1	Western Africa	3	Mauritanian	[{\\"zoneName\\":\\"Africa/Nouakchott\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"모리타니\\",\\"pt-BR\\":\\"Mauritânia\\",\\"pt\\":\\"Mauritânia\\",\\"nl\\":\\"Mauritanië\\",\\"hr\\":\\"Mauritanija\\",\\"fa\\":\\"موریتانی\\",\\"de\\":\\"Mauretanien\\",\\"es\\":\\"Mauritania\\",\\"fr\\":\\"Mauritanie\\",\\"ja\\":\\"モーリタニア\\",\\"it\\":\\"Mauritania\\",\\"cn\\":\\"毛里塔尼亚\\",\\"tr\\":\\"Moritanya\\"}	20.00000000	-12.00000000	🇲🇷	U+1F1F2 U+1F1F7	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1025
140	Mauritius	MUS	480	MU	230	Port Louis	MUR	Mauritian rupee	₨	.mu	Maurice	Africa	1	Eastern Africa	4	Mauritian	[{\\"zoneName\\":\\"Indian/Mauritius\\",\\"gmtOffset\\":14400,\\"gmtOffsetName\\":\\"UTC+04:00\\",\\"abbreviation\\":\\"MUT\\",\\"tzName\\":\\"Mauritius Time\\"}]	{\\"kr\\":\\"모리셔스\\",\\"pt-BR\\":\\"Maurício\\",\\"pt\\":\\"Maurícia\\",\\"nl\\":\\"Mauritius\\",\\"hr\\":\\"Mauricijus\\",\\"fa\\":\\"موریس\\",\\"de\\":\\"Mauritius\\",\\"es\\":\\"Mauricio\\",\\"fr\\":\\"Île Maurice\\",\\"ja\\":\\"モーリシャス\\",\\"it\\":\\"Mauritius\\",\\"cn\\":\\"毛里求斯\\",\\"tr\\":\\"Morityus\\"}	-20.28333333	57.55000000	🇲🇺	U+1F1F2 U+1F1FA	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1027
141	Mayotte	MYT	175	YT	262	Mamoudzou	EUR	Euro	€	.yt	Mayotte	Africa	1	Eastern Africa	4	Mahoran	[{\\"zoneName\\":\\"Indian/Mayotte\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"EAT\\",\\"tzName\\":\\"East Africa Time\\"}]	{\\"kr\\":\\"마요트\\",\\"pt-BR\\":\\"Mayotte\\",\\"pt\\":\\"Mayotte\\",\\"nl\\":\\"Mayotte\\",\\"hr\\":\\"Mayotte\\",\\"fa\\":\\"مایوت\\",\\"de\\":\\"Mayotte\\",\\"es\\":\\"Mayotte\\",\\"fr\\":\\"Mayotte\\",\\"ja\\":\\"マヨット\\",\\"it\\":\\"Mayotte\\",\\"cn\\":\\"马约特\\",\\"tr\\":\\"Mayotte\\"}	-12.83333333	45.16666666	🇾🇹	U+1F1FE U+1F1F9	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
142	Mexico	MEX	484	MX	52	Ciudad de México	MXN	Mexican peso	$	.mx	México	Americas	2	Central America	9	Mexican	[{\\"zoneName\\":\\"America/Bahia_Banderas\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Cancun\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Chihuahua\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America\\"},{\\"zoneName\\":\\"America/Hermosillo\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America\\"},{\\"zoneName\\":\\"America/Matamoros\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Mazatlan\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America\\"},{\\"zoneName\\":\\"America/Merida\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Mexico_City\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Monterrey\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Ojinaga\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America\\"},{\\"zoneName\\":\\"America/Tijuana\\",\\"gmtOffset\\":-28800,\\"gmtOffsetName\\":\\"UTC-08:00\\",\\"abbreviation\\":\\"PST\\",\\"tzName\\":\\"Pacific Standard Time (North America\\"}]	{\\"kr\\":\\"멕시코\\",\\"pt-BR\\":\\"México\\",\\"pt\\":\\"México\\",\\"nl\\":\\"Mexico\\",\\"hr\\":\\"Meksiko\\",\\"fa\\":\\"مکزیک\\",\\"de\\":\\"Mexiko\\",\\"es\\":\\"México\\",\\"fr\\":\\"Mexique\\",\\"ja\\":\\"メキシコ\\",\\"it\\":\\"Messico\\",\\"cn\\":\\"墨西哥\\",\\"tr\\":\\"Meksika\\"}	23.00000000	-102.00000000	🇲🇽	U+1F1F2 U+1F1FD	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q96
143	Micronesia	FSM	583	FM	691	Palikir	USD	United States dollar	$	.fm	Micronesia	Oceania	5	Micronesia	21	Micronesian	[{\\"zoneName\\":\\"Pacific/Chuuk\\",\\"gmtOffset\\":36000,\\"gmtOffsetName\\":\\"UTC+10:00\\",\\"abbreviation\\":\\"CHUT\\",\\"tzName\\":\\"Chuuk Time\\"},{\\"zoneName\\":\\"Pacific/Kosrae\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"KOST\\",\\"tzName\\":\\"Kosrae Time\\"},{\\"zoneName\\":\\"Pacific/Pohnpei\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"PONT\\",\\"tzName\\":\\"Pohnpei Standard Time\\"}]	{\\"kr\\":\\"미크로네시아 연방\\",\\"pt-BR\\":\\"Micronésia\\",\\"pt\\":\\"Micronésia\\",\\"nl\\":\\"Micronesië\\",\\"hr\\":\\"Mikronezija\\",\\"fa\\":\\"ایالات فدرال میکرونزی\\",\\"de\\":\\"Mikronesien\\",\\"es\\":\\"Micronesia\\",\\"fr\\":\\"Micronésie\\",\\"ja\\":\\"ミクロネシア連邦\\",\\"it\\":\\"Micronesia\\",\\"cn\\":\\"密克罗尼西亚\\",\\"tr\\":\\"Mikronezya\\"}	6.91666666	158.25000000	🇫🇲	U+1F1EB U+1F1F2	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q702
144	Moldova	MDA	498	MD	373	Chisinau	MDL	Moldovan leu	L	.md	Moldova	Europe	4	Eastern Europe	15	Moldovan	[{\\"zoneName\\":\\"Europe/Chisinau\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"몰도바\\",\\"pt-BR\\":\\"Moldávia\\",\\"pt\\":\\"Moldávia\\",\\"nl\\":\\"Moldavië\\",\\"hr\\":\\"Moldova\\",\\"fa\\":\\"مولداوی\\",\\"de\\":\\"Moldawie\\",\\"es\\":\\"Moldavia\\",\\"fr\\":\\"Moldavie\\",\\"ja\\":\\"モルドバ共和国\\",\\"it\\":\\"Moldavia\\",\\"cn\\":\\"摩尔多瓦\\",\\"tr\\":\\"Moldova\\"}	47.00000000	29.00000000	🇲🇩	U+1F1F2 U+1F1E9	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q217
145	Monaco	MCO	492	MC	377	Monaco	EUR	Euro	€	.mc	Monaco	Europe	4	Western Europe	17	Monegasque, Monacan	[{\\"zoneName\\":\\"Europe/Monaco\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"모나코\\",\\"pt-BR\\":\\"Mônaco\\",\\"pt\\":\\"Mónaco\\",\\"nl\\":\\"Monaco\\",\\"hr\\":\\"Monako\\",\\"fa\\":\\"موناکو\\",\\"de\\":\\"Monaco\\",\\"es\\":\\"Mónaco\\",\\"fr\\":\\"Monaco\\",\\"ja\\":\\"モナコ\\",\\"it\\":\\"Principato di Monaco\\",\\"cn\\":\\"摩纳哥\\",\\"tr\\":\\"Monako\\"}	43.73333333	7.40000000	🇲🇨	U+1F1F2 U+1F1E8	2018-07-21 09:11:03	2023-08-11 17:45:55	1	Q235
146	Mongolia	MNG	496	MN	976	Ulan Bator	MNT	Mongolian tögrög	₮	.mn	Монгол улс	Asia	3	Eastern Asia	12	Mongolian	[{\\"zoneName\\":\\"Asia/Choibalsan\\",\\"gmtOffset\\":28800,\\"gmtOffsetName\\":\\"UTC+08:00\\",\\"abbreviation\\":\\"CHOT\\",\\"tzName\\":\\"Choibalsan Standard Time\\"},{\\"zoneName\\":\\"Asia/Hovd\\",\\"gmtOffset\\":25200,\\"gmtOffsetName\\":\\"UTC+07:00\\",\\"abbreviation\\":\\"HOVT\\",\\"tzName\\":\\"Hovd Time\\"},{\\"zoneName\\":\\"Asia/Ulaanbaatar\\",\\"gmtOffset\\":28800,\\"gmtOffsetName\\":\\"UTC+08:00\\",\\"abbreviation\\":\\"ULAT\\",\\"tzName\\":\\"Ulaanbaatar Standard Time\\"}]	{\\"kr\\":\\"몽골\\",\\"pt-BR\\":\\"Mongólia\\",\\"pt\\":\\"Mongólia\\",\\"nl\\":\\"Mongolië\\",\\"hr\\":\\"Mongolija\\",\\"fa\\":\\"مغولستان\\",\\"de\\":\\"Mongolei\\",\\"es\\":\\"Mongolia\\",\\"fr\\":\\"Mongolie\\",\\"ja\\":\\"モンゴル\\",\\"it\\":\\"Mongolia\\",\\"cn\\":\\"蒙古\\",\\"tr\\":\\"Moğolistan\\"}	46.00000000	105.00000000	🇲🇳	U+1F1F2 U+1F1F3	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q711
147	Montenegro	MNE	499	ME	382	Podgorica	EUR	Euro	€	.me	Црна Гора	Europe	4	Southern Europe	16	Montenegrin	[{\\"zoneName\\":\\"Europe/Podgorica\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"몬테네그로\\",\\"pt-BR\\":\\"Montenegro\\",\\"pt\\":\\"Montenegro\\",\\"nl\\":\\"Montenegro\\",\\"hr\\":\\"Crna Gora\\",\\"fa\\":\\"مونته‌نگرو\\",\\"de\\":\\"Montenegro\\",\\"es\\":\\"Montenegro\\",\\"fr\\":\\"Monténégro\\",\\"ja\\":\\"モンテネグロ\\",\\"it\\":\\"Montenegro\\",\\"cn\\":\\"黑山\\",\\"tr\\":\\"Karadağ\\"}	42.50000000	19.30000000	🇲🇪	U+1F1F2 U+1F1EA	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q236
148	Montserrat	MSR	500	MS	+1-664	Plymouth	XCD	Eastern Caribbean dollar	$	.ms	Montserrat	Americas	2	Caribbean	7	Montserratian	[{\\"zoneName\\":\\"America/Montserrat\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"몬트세랫\\",\\"pt-BR\\":\\"Montserrat\\",\\"pt\\":\\"Monserrate\\",\\"nl\\":\\"Montserrat\\",\\"hr\\":\\"Montserrat\\",\\"fa\\":\\"مایوت\\",\\"de\\":\\"Montserrat\\",\\"es\\":\\"Montserrat\\",\\"fr\\":\\"Montserrat\\",\\"ja\\":\\"モントセラト\\",\\"it\\":\\"Montserrat\\",\\"cn\\":\\"蒙特塞拉特\\",\\"tr\\":\\"Montserrat\\"}	16.75000000	-62.20000000	🇲🇸	U+1F1F2 U+1F1F8	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
149	Morocco	MAR	504	MA	212	Rabat	MAD	Moroccan dirham	DH	.ma	المغرب	Africa	1	Northern Africa	1	Moroccan	[{\\"zoneName\\":\\"Africa/Casablanca\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"WEST\\",\\"tzName\\":\\"Western European Summer Time\\"}]	{\\"kr\\":\\"모로코\\",\\"pt-BR\\":\\"Marrocos\\",\\"pt\\":\\"Marrocos\\",\\"nl\\":\\"Marokko\\",\\"hr\\":\\"Maroko\\",\\"fa\\":\\"مراکش\\",\\"de\\":\\"Marokko\\",\\"es\\":\\"Marruecos\\",\\"fr\\":\\"Maroc\\",\\"ja\\":\\"モロッコ\\",\\"it\\":\\"Marocco\\",\\"cn\\":\\"摩洛哥\\",\\"tr\\":\\"Fas\\"}	32.00000000	-5.00000000	🇲🇦	U+1F1F2 U+1F1E6	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1028
150	Mozambique	MOZ	508	MZ	258	Maputo	MZN	Mozambican metical	MT	.mz	Moçambique	Africa	1	Eastern Africa	4	Mozambican	[{\\"zoneName\\":\\"Africa/Maputo\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"CAT\\",\\"tzName\\":\\"Central Africa Time\\"}]	{\\"kr\\":\\"모잠비크\\",\\"pt-BR\\":\\"Moçambique\\",\\"pt\\":\\"Moçambique\\",\\"nl\\":\\"Mozambique\\",\\"hr\\":\\"Mozambik\\",\\"fa\\":\\"موزامبیک\\",\\"de\\":\\"Mosambik\\",\\"es\\":\\"Mozambique\\",\\"fr\\":\\"Mozambique\\",\\"ja\\":\\"モザンビーク\\",\\"it\\":\\"Mozambico\\",\\"cn\\":\\"莫桑比克\\",\\"tr\\":\\"Mozambik\\"}	-18.25000000	35.00000000	🇲🇿	U+1F1F2 U+1F1FF	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1029
151	Myanmar	MMR	104	MM	95	Nay Pyi Taw	MMK	Burmese kyat	K	.mm	မြန်မာ	Asia	3	South-Eastern Asia	13	Burmese	[{\\"zoneName\\":\\"Asia/Yangon\\",\\"gmtOffset\\":23400,\\"gmtOffsetName\\":\\"UTC+06:30\\",\\"abbreviation\\":\\"MMT\\",\\"tzName\\":\\"Myanmar Standard Time\\"}]	{\\"kr\\":\\"미얀마\\",\\"pt-BR\\":\\"Myanmar\\",\\"pt\\":\\"Myanmar\\",\\"nl\\":\\"Myanmar\\",\\"hr\\":\\"Mijanmar\\",\\"fa\\":\\"میانمار\\",\\"de\\":\\"Myanmar\\",\\"es\\":\\"Myanmar\\",\\"fr\\":\\"Myanmar\\",\\"ja\\":\\"ミャンマー\\",\\"it\\":\\"Birmania\\",\\"cn\\":\\"缅甸\\",\\"tr\\":\\"Myanmar\\"}	22.00000000	98.00000000	🇲🇲	U+1F1F2 U+1F1F2	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q836
152	Namibia	NAM	516	NA	264	Windhoek	NAD	Namibian dollar	$	.na	Namibia	Africa	1	Southern Africa	5	Namibian	[{\\"zoneName\\":\\"Africa/Windhoek\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"WAST\\",\\"tzName\\":\\"West Africa Summer Time\\"}]	{\\"kr\\":\\"나미비아\\",\\"pt-BR\\":\\"Namíbia\\",\\"pt\\":\\"Namíbia\\",\\"nl\\":\\"Namibië\\",\\"hr\\":\\"Namibija\\",\\"fa\\":\\"نامیبیا\\",\\"de\\":\\"Namibia\\",\\"es\\":\\"Namibia\\",\\"fr\\":\\"Namibie\\",\\"ja\\":\\"ナミビア\\",\\"it\\":\\"Namibia\\",\\"cn\\":\\"纳米比亚\\",\\"tr\\":\\"Namibya\\"}	-22.00000000	17.00000000	🇳🇦	U+1F1F3 U+1F1E6	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1030
153	Nauru	NRU	520	NR	674	Yaren	AUD	Australian dollar	$	.nr	Nauru	Oceania	5	Micronesia	21	Nauruan	[{\\"zoneName\\":\\"Pacific/Nauru\\",\\"gmtOffset\\":43200,\\"gmtOffsetName\\":\\"UTC+12:00\\",\\"abbreviation\\":\\"NRT\\",\\"tzName\\":\\"Nauru Time\\"}]	{\\"kr\\":\\"나우루\\",\\"pt-BR\\":\\"Nauru\\",\\"pt\\":\\"Nauru\\",\\"nl\\":\\"Nauru\\",\\"hr\\":\\"Nauru\\",\\"fa\\":\\"نائورو\\",\\"de\\":\\"Nauru\\",\\"es\\":\\"Nauru\\",\\"fr\\":\\"Nauru\\",\\"ja\\":\\"ナウル\\",\\"it\\":\\"Nauru\\",\\"cn\\":\\"瑙鲁\\",\\"tr\\":\\"Nauru\\"}	-0.53333333	166.91666666	🇳🇷	U+1F1F3 U+1F1F7	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q697
155	Bonaire, Sint Eustatius and Saba	BES	535	BQ	599	Kralendijk	USD	United States dollar	$	.an	Caribisch Nederland	Americas	2	Caribbean	7	Bonaire	[{\\"zoneName\\":\\"America/Anguilla\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"보네르 섬\\",\\"pt-BR\\":\\"Bonaire\\",\\"pt\\":\\"Bonaire\\",\\"fa\\":\\"بونیر\\",\\"de\\":\\"Bonaire, Sint Eustatius und Saba\\",\\"fr\\":\\"Bonaire, Saint-Eustache et Saba\\",\\"it\\":\\"Bonaire, Saint-Eustache e Saba\\",\\"cn\\":\\"博内尔岛、圣尤斯特歇斯和萨巴岛\\",\\"tr\\":\\"Karayip Hollandasi\\"}	12.15000000	-68.26666700	🇧🇶	U+1F1E7 U+1F1F6	2018-07-21 09:11:03	2023-08-08 23:04:58	1	Q27561
156	Netherlands	NLD	528	NL	31	Amsterdam	EUR	Euro	€	.nl	Nederland	Europe	4	Western Europe	17	Dutch, Netherlandic	[{\\"zoneName\\":\\"Europe/Amsterdam\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"네덜란드 \\",\\"pt-BR\\":\\"Holanda\\",\\"pt\\":\\"Países Baixos\\",\\"nl\\":\\"Nederland\\",\\"hr\\":\\"Nizozemska\\",\\"fa\\":\\"پادشاهی هلند\\",\\"de\\":\\"Niederlande\\",\\"es\\":\\"Países Bajos\\",\\"fr\\":\\"Pays-Bas\\",\\"ja\\":\\"オランダ\\",\\"it\\":\\"Paesi Bassi\\",\\"cn\\":\\"荷兰\\",\\"tr\\":\\"Hollanda\\"}	52.50000000	5.75000000	🇳🇱	U+1F1F3 U+1F1F1	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q55
157	New Caledonia	NCL	540	NC	687	Noumea	XPF	CFP franc	₣	.nc	Nouvelle-Calédonie	Oceania	5	Melanesia	20	New Caledonian	[{\\"zoneName\\":\\"Pacific/Noumea\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"NCT\\",\\"tzName\\":\\"New Caledonia Time\\"}]	{\\"kr\\":\\"누벨칼레도니\\",\\"pt-BR\\":\\"Nova Caledônia\\",\\"pt\\":\\"Nova Caledónia\\",\\"nl\\":\\"Nieuw-Caledonië\\",\\"hr\\":\\"Nova Kaledonija\\",\\"fa\\":\\"کالدونیای جدید\\",\\"de\\":\\"Neukaledonien\\",\\"es\\":\\"Nueva Caledonia\\",\\"fr\\":\\"Nouvelle-Calédonie\\",\\"ja\\":\\"ニューカレドニア\\",\\"it\\":\\"Nuova Caledonia\\",\\"cn\\":\\"新喀里多尼亚\\",\\"tr\\":\\"Yeni Kaledonya\\"}	-21.50000000	165.50000000	🇳🇨	U+1F1F3 U+1F1E8	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
158	New Zealand	NZL	554	NZ	64	Wellington	NZD	New Zealand dollar	$	.nz	New Zealand	Oceania	5	Australia and New Zealand	19	New Zealand, NZ	[{\\"zoneName\\":\\"Pacific/Auckland\\",\\"gmtOffset\\":46800,\\"gmtOffsetName\\":\\"UTC+13:00\\",\\"abbreviation\\":\\"NZDT\\",\\"tzName\\":\\"New Zealand Daylight Time\\"},{\\"zoneName\\":\\"Pacific/Chatham\\",\\"gmtOffset\\":49500,\\"gmtOffsetName\\":\\"UTC+13:45\\",\\"abbreviation\\":\\"CHAST\\",\\"tzName\\":\\"Chatham Standard Time\\"}]	{\\"kr\\":\\"뉴질랜드\\",\\"pt-BR\\":\\"Nova Zelândia\\",\\"pt\\":\\"Nova Zelândia\\",\\"nl\\":\\"Nieuw-Zeeland\\",\\"hr\\":\\"Novi Zeland\\",\\"fa\\":\\"نیوزیلند\\",\\"de\\":\\"Neuseeland\\",\\"es\\":\\"Nueva Zelanda\\",\\"fr\\":\\"Nouvelle-Zélande\\",\\"ja\\":\\"ニュージーランド\\",\\"it\\":\\"Nuova Zelanda\\",\\"cn\\":\\"新西兰\\",\\"tr\\":\\"Yeni Zelanda\\"}	-41.00000000	174.00000000	🇳🇿	U+1F1F3 U+1F1FF	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q664
159	Nicaragua	NIC	558	NI	505	Managua	NIO	Nicaraguan córdoba	C$	.ni	Nicaragua	Americas	2	Central America	9	Nicaraguan	[{\\"zoneName\\":\\"America/Managua\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"}]	{\\"kr\\":\\"니카라과\\",\\"pt-BR\\":\\"Nicarágua\\",\\"pt\\":\\"Nicarágua\\",\\"nl\\":\\"Nicaragua\\",\\"hr\\":\\"Nikaragva\\",\\"fa\\":\\"نیکاراگوئه\\",\\"de\\":\\"Nicaragua\\",\\"es\\":\\"Nicaragua\\",\\"fr\\":\\"Nicaragua\\",\\"ja\\":\\"ニカラグア\\",\\"it\\":\\"Nicaragua\\",\\"cn\\":\\"尼加拉瓜\\",\\"tr\\":\\"Nikaragua\\"}	13.00000000	-85.00000000	🇳🇮	U+1F1F3 U+1F1EE	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q811
160	Niger	NER	562	NE	227	Niamey	XOF	West African CFA franc	CFA	.ne	Niger	Africa	1	Western Africa	3	Nigerien	[{\\"zoneName\\":\\"Africa/Niamey\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"WAT\\",\\"tzName\\":\\"West Africa Time\\"}]	{\\"kr\\":\\"니제르\\",\\"pt-BR\\":\\"Níger\\",\\"pt\\":\\"Níger\\",\\"nl\\":\\"Niger\\",\\"hr\\":\\"Niger\\",\\"fa\\":\\"نیجر\\",\\"de\\":\\"Niger\\",\\"es\\":\\"Níger\\",\\"fr\\":\\"Niger\\",\\"ja\\":\\"ニジェール\\",\\"it\\":\\"Niger\\",\\"cn\\":\\"尼日尔\\",\\"tr\\":\\"Nijer\\"}	16.00000000	8.00000000	🇳🇪	U+1F1F3 U+1F1EA	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1032
161	Nigeria	NGA	566	NG	234	Abuja	NGN	Nigerian naira	₦	.ng	Nigeria	Africa	1	Western Africa	3	Nigerian	[{\\"zoneName\\":\\"Africa/Lagos\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"WAT\\",\\"tzName\\":\\"West Africa Time\\"}]	{\\"kr\\":\\"나이지리아\\",\\"pt-BR\\":\\"Nigéria\\",\\"pt\\":\\"Nigéria\\",\\"nl\\":\\"Nigeria\\",\\"hr\\":\\"Nigerija\\",\\"fa\\":\\"نیجریه\\",\\"de\\":\\"Nigeria\\",\\"es\\":\\"Nigeria\\",\\"fr\\":\\"Nigéria\\",\\"ja\\":\\"ナイジェリア\\",\\"it\\":\\"Nigeria\\",\\"cn\\":\\"尼日利亚\\",\\"tr\\":\\"Nijerya\\"}	10.00000000	8.00000000	🇳🇬	U+1F1F3 U+1F1EC	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1033
162	Niue	NIU	570	NU	683	Alofi	NZD	New Zealand dollar	$	.nu	Niuē	Oceania	5	Polynesia	22	Niuean	[{\\"zoneName\\":\\"Pacific/Niue\\",\\"gmtOffset\\":-39600,\\"gmtOffsetName\\":\\"UTC-11:00\\",\\"abbreviation\\":\\"NUT\\",\\"tzName\\":\\"Niue Time\\"}]	{\\"kr\\":\\"니우에\\",\\"pt-BR\\":\\"Niue\\",\\"pt\\":\\"Niue\\",\\"nl\\":\\"Niue\\",\\"hr\\":\\"Niue\\",\\"fa\\":\\"نیووی\\",\\"de\\":\\"Niue\\",\\"es\\":\\"Niue\\",\\"fr\\":\\"Niue\\",\\"ja\\":\\"ニウエ\\",\\"it\\":\\"Niue\\",\\"cn\\":\\"纽埃\\",\\"tr\\":\\"Niue\\"}	-19.03333333	-169.86666666	🇳🇺	U+1F1F3 U+1F1FA	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q34020
163	Norfolk Island	NFK	574	NF	672	Kingston	AUD	Australian dollar	$	.nf	Norfolk Island	Oceania	5	Australia and New Zealand	19	Norfolk Island	[{\\"zoneName\\":\\"Pacific/Norfolk\\",\\"gmtOffset\\":43200,\\"gmtOffsetName\\":\\"UTC+12:00\\",\\"abbreviation\\":\\"NFT\\",\\"tzName\\":\\"Norfolk Time\\"}]	{\\"kr\\":\\"노퍽 섬\\",\\"pt-BR\\":\\"Ilha Norfolk\\",\\"pt\\":\\"Ilha Norfolk\\",\\"nl\\":\\"Norfolkeiland\\",\\"hr\\":\\"Otok Norfolk\\",\\"fa\\":\\"جزیره نورفک\\",\\"de\\":\\"Norfolkinsel\\",\\"es\\":\\"Isla de Norfolk\\",\\"fr\\":\\"Île de Norfolk\\",\\"ja\\":\\"ノーフォーク島\\",\\"it\\":\\"Isola Norfolk\\",\\"cn\\":\\"诺福克岛\\",\\"tr\\":\\"Norfolk Adasi\\"}	-29.03333333	167.95000000	🇳🇫	U+1F1F3 U+1F1EB	2018-07-21 09:11:03	2023-08-11 17:45:55	1	\N
164	Northern Mariana Islands	MNP	580	MP	+1-670	Saipan	USD	United States dollar	$	.mp	Northern Mariana Islands	Oceania	5	Micronesia	21	Northern Marianan	[{\\"zoneName\\":\\"Pacific/Saipan\\",\\"gmtOffset\\":36000,\\"gmtOffsetName\\":\\"UTC+10:00\\",\\"abbreviation\\":\\"ChST\\",\\"tzName\\":\\"Chamorro Standard Time\\"}]	{\\"kr\\":\\"북마리아나 제도\\",\\"pt-BR\\":\\"Ilhas Marianas\\",\\"pt\\":\\"Ilhas Marianas\\",\\"nl\\":\\"Noordelijke Marianeneilanden\\",\\"hr\\":\\"Sjevernomarijanski otoci\\",\\"fa\\":\\"جزایر ماریانای شمالی\\",\\"de\\":\\"Nördliche Marianen\\",\\"es\\":\\"Islas Marianas del Norte\\",\\"fr\\":\\"Îles Mariannes du Nord\\",\\"ja\\":\\"北マリアナ諸島\\",\\"it\\":\\"Isole Marianne Settentrionali\\",\\"cn\\":\\"北马里亚纳群岛\\",\\"tr\\":\\"Kuzey Mariana Adalari\\"}	15.20000000	145.75000000	🇲🇵	U+1F1F2 U+1F1F5	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
165	Norway	NOR	578	NO	47	Oslo	NOK	Norwegian krone	kr	.no	Norge	Europe	4	Northern Europe	18	Norwegian	[{\\"zoneName\\":\\"Europe/Oslo\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"노르웨이\\",\\"pt-BR\\":\\"Noruega\\",\\"pt\\":\\"Noruega\\",\\"nl\\":\\"Noorwegen\\",\\"hr\\":\\"Norveška\\",\\"fa\\":\\"نروژ\\",\\"de\\":\\"Norwegen\\",\\"es\\":\\"Noruega\\",\\"fr\\":\\"Norvège\\",\\"ja\\":\\"ノルウェー\\",\\"it\\":\\"Norvegia\\",\\"cn\\":\\"挪威\\",\\"tr\\":\\"Norveç\\"}	62.00000000	10.00000000	🇳🇴	U+1F1F3 U+1F1F4	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q20
167	Pakistan	PAK	586	PK	92	Islamabad	PKR	Pakistani rupee	₨	.pk	Pakistan	Asia	3	Southern Asia	14	Pakistani	[{\\"zoneName\\":\\"Asia/Karachi\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"PKT\\",\\"tzName\\":\\"Pakistan Standard Time\\"}]	{\\"kr\\":\\"파키스탄\\",\\"pt-BR\\":\\"Paquistão\\",\\"pt\\":\\"Paquistão\\",\\"nl\\":\\"Pakistan\\",\\"hr\\":\\"Pakistan\\",\\"fa\\":\\"پاکستان\\",\\"de\\":\\"Pakistan\\",\\"es\\":\\"Pakistán\\",\\"fr\\":\\"Pakistan\\",\\"ja\\":\\"パキスタン\\",\\"it\\":\\"Pakistan\\",\\"cn\\":\\"巴基斯坦\\",\\"tr\\":\\"Pakistan\\"}	30.00000000	70.00000000	🇵🇰	U+1F1F5 U+1F1F0	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q843
168	Palau	PLW	585	PW	680	Melekeok	USD	United States dollar	$	.pw	Palau	Oceania	5	Micronesia	21	Palauan	[{\\"zoneName\\":\\"Pacific/Palau\\",\\"gmtOffset\\":32400,\\"gmtOffsetName\\":\\"UTC+09:00\\",\\"abbreviation\\":\\"PWT\\",\\"tzName\\":\\"Palau Time\\"}]	{\\"kr\\":\\"팔라우\\",\\"pt-BR\\":\\"Palau\\",\\"pt\\":\\"Palau\\",\\"nl\\":\\"Palau\\",\\"hr\\":\\"Palau\\",\\"fa\\":\\"پالائو\\",\\"de\\":\\"Palau\\",\\"es\\":\\"Palau\\",\\"fr\\":\\"Palaos\\",\\"ja\\":\\"パラオ\\",\\"it\\":\\"Palau\\",\\"cn\\":\\"帕劳\\",\\"tr\\":\\"Palau\\"}	7.50000000	134.50000000	🇵🇼	U+1F1F5 U+1F1FC	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q695
169	Palestinian Territory Occupied	PSE	275	PS	970	East Jerusalem	ILS	Israeli new shekel	₪	.ps	فلسطين	Asia	3	Western Asia	11	Palestinian	[{\\"zoneName\\":\\"Asia/Gaza\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"},{\\"zoneName\\":\\"Asia/Hebron\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"팔레스타인 영토\\",\\"pt-BR\\":\\"Palestina\\",\\"pt\\":\\"Palestina\\",\\"nl\\":\\"Palestijnse gebieden\\",\\"hr\\":\\"Palestina\\",\\"fa\\":\\"فلسطین\\",\\"de\\":\\"Palästina\\",\\"es\\":\\"Palestina\\",\\"fr\\":\\"Palestine\\",\\"ja\\":\\"パレスチナ\\",\\"it\\":\\"Palestina\\",\\"cn\\":\\"巴勒斯坦\\",\\"tr\\":\\"Filistin\\"}	31.90000000	35.20000000	🇵🇸	U+1F1F5 U+1F1F8	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
170	Panama	PAN	591	PA	507	Panama City	PAB	Panamanian balboa	B/.	.pa	Panamá	Americas	2	Central America	9	Panamanian	[{\\"zoneName\\":\\"America/Panama\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"}]	{\\"kr\\":\\"파나마\\",\\"pt-BR\\":\\"Panamá\\",\\"pt\\":\\"Panamá\\",\\"nl\\":\\"Panama\\",\\"hr\\":\\"Panama\\",\\"fa\\":\\"پاناما\\",\\"de\\":\\"Panama\\",\\"es\\":\\"Panamá\\",\\"fr\\":\\"Panama\\",\\"ja\\":\\"パナマ\\",\\"it\\":\\"Panama\\",\\"cn\\":\\"巴拿马\\",\\"tr\\":\\"Panama\\"}	9.00000000	-80.00000000	🇵🇦	U+1F1F5 U+1F1E6	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q804
171	Papua new Guinea	PNG	598	PG	675	Port Moresby	PGK	Papua New Guinean kina	K	.pg	Papua Niugini	Oceania	5	Melanesia	20	Papua New Guinean, Papuan	[{\\"zoneName\\":\\"Pacific/Bougainville\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"BST\\",\\"tzName\\":\\"Bougainville Standard Time[6\\"},{\\"zoneName\\":\\"Pacific/Port_Moresby\\",\\"gmtOffset\\":36000,\\"gmtOffsetName\\":\\"UTC+10:00\\",\\"abbreviation\\":\\"PGT\\",\\"tzName\\":\\"Papua New Guinea Time\\"}]	{\\"kr\\":\\"파푸아뉴기니\\",\\"pt-BR\\":\\"Papua Nova Guiné\\",\\"pt\\":\\"Papua Nova Guiné\\",\\"nl\\":\\"Papoea-Nieuw-Guinea\\",\\"hr\\":\\"Papua Nova Gvineja\\",\\"fa\\":\\"پاپوآ گینه نو\\",\\"de\\":\\"Papua-Neuguinea\\",\\"es\\":\\"Papúa Nueva Guinea\\",\\"fr\\":\\"Papouasie-Nouvelle-Guinée\\",\\"ja\\":\\"パプアニューギニア\\",\\"it\\":\\"Papua Nuova Guinea\\",\\"cn\\":\\"巴布亚新几内亚\\",\\"tr\\":\\"Papua Yeni Gine\\"}	-6.00000000	147.00000000	🇵🇬	U+1F1F5 U+1F1EC	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q691
172	Paraguay	PRY	600	PY	595	Asuncion	PYG	Paraguayan guarani	₲	.py	Paraguay	Americas	2	South America	8	Paraguayan	[{\\"zoneName\\":\\"America/Asuncion\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"PYST\\",\\"tzName\\":\\"Paraguay Summer Time\\"}]	{\\"kr\\":\\"파라과이\\",\\"pt-BR\\":\\"Paraguai\\",\\"pt\\":\\"Paraguai\\",\\"nl\\":\\"Paraguay\\",\\"hr\\":\\"Paragvaj\\",\\"fa\\":\\"پاراگوئه\\",\\"de\\":\\"Paraguay\\",\\"es\\":\\"Paraguay\\",\\"fr\\":\\"Paraguay\\",\\"ja\\":\\"パラグアイ\\",\\"it\\":\\"Paraguay\\",\\"cn\\":\\"巴拉圭\\",\\"tr\\":\\"Paraguay\\"}	-23.00000000	-58.00000000	🇵🇾	U+1F1F5 U+1F1FE	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q733
173	Peru	PER	604	PE	51	Lima	PEN	Peruvian sol	S/.	.pe	Perú	Americas	2	South America	8	Peruvian	[{\\"zoneName\\":\\"America/Lima\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"PET\\",\\"tzName\\":\\"Peru Time\\"}]	{\\"kr\\":\\"페루\\",\\"pt-BR\\":\\"Peru\\",\\"pt\\":\\"Peru\\",\\"nl\\":\\"Peru\\",\\"hr\\":\\"Peru\\",\\"fa\\":\\"پرو\\",\\"de\\":\\"Peru\\",\\"es\\":\\"Perú\\",\\"fr\\":\\"Pérou\\",\\"ja\\":\\"ペルー\\",\\"it\\":\\"Perù\\",\\"cn\\":\\"秘鲁\\",\\"tr\\":\\"Peru\\"}	-10.00000000	-76.00000000	🇵🇪	U+1F1F5 U+1F1EA	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q419
174	Philippines	PHL	608	PH	63	Manila	PHP	Philippine peso	₱	.ph	Pilipinas	Asia	3	South-Eastern Asia	13	Philippine, Filipino	[{\\"zoneName\\":\\"Asia/Manila\\",\\"gmtOffset\\":28800,\\"gmtOffsetName\\":\\"UTC+08:00\\",\\"abbreviation\\":\\"PHT\\",\\"tzName\\":\\"Philippine Time\\"}]	{\\"kr\\":\\"필리핀\\",\\"pt-BR\\":\\"Filipinas\\",\\"pt\\":\\"Filipinas\\",\\"nl\\":\\"Filipijnen\\",\\"hr\\":\\"Filipini\\",\\"fa\\":\\"جزایر الندفیلیپین\\",\\"de\\":\\"Philippinen\\",\\"es\\":\\"Filipinas\\",\\"fr\\":\\"Philippines\\",\\"ja\\":\\"フィリピン\\",\\"it\\":\\"Filippine\\",\\"cn\\":\\"菲律宾\\",\\"tr\\":\\"Filipinler\\"}	13.00000000	122.00000000	🇵🇭	U+1F1F5 U+1F1ED	2018-07-21 09:11:03	2023-08-11 17:45:55	1	Q928
175	Pitcairn Island	PCN	612	PN	870	Adamstown	NZD	New Zealand dollar	$	.pn	Pitcairn Islands	Oceania	5	Polynesia	22	Pitcairn Island	[{\\"zoneName\\":\\"Pacific/Pitcairn\\",\\"gmtOffset\\":-28800,\\"gmtOffsetName\\":\\"UTC-08:00\\",\\"abbreviation\\":\\"PST\\",\\"tzName\\":\\"Pacific Standard Time (North America\\"}]	{\\"kr\\":\\"핏케언 제도\\",\\"pt-BR\\":\\"Ilhas Pitcairn\\",\\"pt\\":\\"Ilhas Picárnia\\",\\"nl\\":\\"Pitcairneilanden\\",\\"hr\\":\\"Pitcairnovo otočje\\",\\"fa\\":\\"پیتکرن\\",\\"de\\":\\"Pitcairn\\",\\"es\\":\\"Islas Pitcairn\\",\\"fr\\":\\"Îles Pitcairn\\",\\"ja\\":\\"ピトケアン\\",\\"it\\":\\"Isole Pitcairn\\",\\"cn\\":\\"皮特凯恩群岛\\",\\"tr\\":\\"Pitcairn Adalari\\"}	-25.06666666	-130.10000000	🇵🇳	U+1F1F5 U+1F1F3	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
176	Poland	POL	616	PL	48	Warsaw	PLN	Polish złoty	zł	.pl	Polska	Europe	4	Eastern Europe	15	Polish	[{\\"zoneName\\":\\"Europe/Warsaw\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"폴란드\\",\\"pt-BR\\":\\"Polônia\\",\\"pt\\":\\"Polónia\\",\\"nl\\":\\"Polen\\",\\"hr\\":\\"Poljska\\",\\"fa\\":\\"لهستان\\",\\"de\\":\\"Polen\\",\\"es\\":\\"Polonia\\",\\"fr\\":\\"Pologne\\",\\"ja\\":\\"ポーランド\\",\\"it\\":\\"Polonia\\",\\"cn\\":\\"波兰\\",\\"tr\\":\\"Polonya\\"}	52.00000000	20.00000000	🇵🇱	U+1F1F5 U+1F1F1	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q36
177	Portugal	PRT	620	PT	351	Lisbon	EUR	Euro	€	.pt	Portugal	Europe	4	Southern Europe	16	Portuguese	[{\\"zoneName\\":\\"Atlantic/Azores\\",\\"gmtOffset\\":-3600,\\"gmtOffsetName\\":\\"UTC-01:00\\",\\"abbreviation\\":\\"AZOT\\",\\"tzName\\":\\"Azores Standard Time\\"},{\\"zoneName\\":\\"Atlantic/Madeira\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"WET\\",\\"tzName\\":\\"Western European Time\\"},{\\"zoneName\\":\\"Europe/Lisbon\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"WET\\",\\"tzName\\":\\"Western European Time\\"}]	{\\"kr\\":\\"포르투갈\\",\\"pt-BR\\":\\"Portugal\\",\\"pt\\":\\"Portugal\\",\\"nl\\":\\"Portugal\\",\\"hr\\":\\"Portugal\\",\\"fa\\":\\"پرتغال\\",\\"de\\":\\"Portugal\\",\\"es\\":\\"Portugal\\",\\"fr\\":\\"Portugal\\",\\"ja\\":\\"ポルトガル\\",\\"it\\":\\"Portogallo\\",\\"cn\\":\\"葡萄牙\\",\\"tr\\":\\"Portekiz\\"}	39.50000000	-8.00000000	🇵🇹	U+1F1F5 U+1F1F9	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q45
178	Puerto Rico	PRI	630	PR	+1-787 and 1-939	San Juan	USD	United States dollar	$	.pr	Puerto Rico	Americas	2	Caribbean	7	Puerto Rican	[{\\"zoneName\\":\\"America/Puerto_Rico\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"푸에르토리코\\",\\"pt-BR\\":\\"Porto Rico\\",\\"pt\\":\\"Porto Rico\\",\\"nl\\":\\"Puerto Rico\\",\\"hr\\":\\"Portoriko\\",\\"fa\\":\\"پورتو ریکو\\",\\"de\\":\\"Puerto Rico\\",\\"es\\":\\"Puerto Rico\\",\\"fr\\":\\"Porto Rico\\",\\"ja\\":\\"プエルトリコ\\",\\"it\\":\\"Porto Rico\\",\\"cn\\":\\"波多黎各\\",\\"tr\\":\\"Porto Riko\\"}	18.25000000	-66.50000000	🇵🇷	U+1F1F5 U+1F1F7	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
179	Qatar	QAT	634	QA	974	Doha	QAR	Qatari riyal	ق.ر	.qa	قطر	Asia	3	Western Asia	11	Qatari	[{\\"zoneName\\":\\"Asia/Qatar\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Arabia Standard Time\\"}]	{\\"kr\\":\\"카타르\\",\\"pt-BR\\":\\"Catar\\",\\"pt\\":\\"Catar\\",\\"nl\\":\\"Qatar\\",\\"hr\\":\\"Katar\\",\\"fa\\":\\"قطر\\",\\"de\\":\\"Katar\\",\\"es\\":\\"Catar\\",\\"fr\\":\\"Qatar\\",\\"ja\\":\\"カタール\\",\\"it\\":\\"Qatar\\",\\"cn\\":\\"卡塔尔\\",\\"tr\\":\\"Katar\\"}	25.50000000	51.25000000	🇶🇦	U+1F1F6 U+1F1E6	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q846
180	Reunion	REU	638	RE	262	Saint-Denis	EUR	Euro	€	.re	La Réunion	Africa	1	Eastern Africa	4	Reunionese, Reunionnais	[{\\"zoneName\\":\\"Indian/Reunion\\",\\"gmtOffset\\":14400,\\"gmtOffsetName\\":\\"UTC+04:00\\",\\"abbreviation\\":\\"RET\\",\\"tzName\\":\\"Réunion Time\\"}]	{\\"kr\\":\\"레위니옹\\",\\"pt-BR\\":\\"Reunião\\",\\"pt\\":\\"Reunião\\",\\"nl\\":\\"Réunion\\",\\"hr\\":\\"Réunion\\",\\"fa\\":\\"رئونیون\\",\\"de\\":\\"Réunion\\",\\"es\\":\\"Reunión\\",\\"fr\\":\\"Réunion\\",\\"ja\\":\\"レユニオン\\",\\"it\\":\\"Riunione\\",\\"cn\\":\\"留尼汪岛\\",\\"tr\\":\\"Réunion\\"}	-21.15000000	55.50000000	🇷🇪	U+1F1F7 U+1F1EA	2018-07-21 09:11:03	2023-08-11 17:45:55	1	\N
181	Romania	ROU	642	RO	40	Bucharest	RON	Romanian leu	lei	.ro	România	Europe	4	Eastern Europe	15	Romanian	[{\\"zoneName\\":\\"Europe/Bucharest\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"루마니아\\",\\"pt-BR\\":\\"Romênia\\",\\"pt\\":\\"Roménia\\",\\"nl\\":\\"Roemenië\\",\\"hr\\":\\"Rumunjska\\",\\"fa\\":\\"رومانی\\",\\"de\\":\\"Rumänien\\",\\"es\\":\\"Rumania\\",\\"fr\\":\\"Roumanie\\",\\"ja\\":\\"ルーマニア\\",\\"it\\":\\"Romania\\",\\"cn\\":\\"罗马尼亚\\",\\"tr\\":\\"Romanya\\"}	46.00000000	25.00000000	🇷🇴	U+1F1F7 U+1F1F4	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q218
182	Russia	RUS	643	RU	7	Moscow	RUB	Russian ruble	₽	.ru	Россия	Europe	4	Eastern Europe	15	Russian	[{\\"zoneName\\":\\"Asia/Anadyr\\",\\"gmtOffset\\":43200,\\"gmtOffsetName\\":\\"UTC+12:00\\",\\"abbreviation\\":\\"ANAT\\",\\"tzName\\":\\"Anadyr Time[4\\"},{\\"zoneName\\":\\"Asia/Barnaul\\",\\"gmtOffset\\":25200,\\"gmtOffsetName\\":\\"UTC+07:00\\",\\"abbreviation\\":\\"KRAT\\",\\"tzName\\":\\"Krasnoyarsk Time\\"},{\\"zoneName\\":\\"Asia/Chita\\",\\"gmtOffset\\":32400,\\"gmtOffsetName\\":\\"UTC+09:00\\",\\"abbreviation\\":\\"YAKT\\",\\"tzName\\":\\"Yakutsk Time\\"},{\\"zoneName\\":\\"Asia/Irkutsk\\",\\"gmtOffset\\":28800,\\"gmtOffsetName\\":\\"UTC+08:00\\",\\"abbreviation\\":\\"IRKT\\",\\"tzName\\":\\"Irkutsk Time\\"},{\\"zoneName\\":\\"Asia/Kamchatka\\",\\"gmtOffset\\":43200,\\"gmtOffsetName\\":\\"UTC+12:00\\",\\"abbreviation\\":\\"PETT\\",\\"tzName\\":\\"Kamchatka Time\\"},{\\"zoneName\\":\\"Asia/Khandyga\\",\\"gmtOffset\\":32400,\\"gmtOffsetName\\":\\"UTC+09:00\\",\\"abbreviation\\":\\"YAKT\\",\\"tzName\\":\\"Yakutsk Time\\"},{\\"zoneName\\":\\"Asia/Krasnoyarsk\\",\\"gmtOffset\\":25200,\\"gmtOffsetName\\":\\"UTC+07:00\\",\\"abbreviation\\":\\"KRAT\\",\\"tzName\\":\\"Krasnoyarsk Time\\"},{\\"zoneName\\":\\"Asia/Magadan\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"MAGT\\",\\"tzName\\":\\"Magadan Time\\"},{\\"zoneName\\":\\"Asia/Novokuznetsk\\",\\"gmtOffset\\":25200,\\"gmtOffsetName\\":\\"UTC+07:00\\",\\"abbreviation\\":\\"KRAT\\",\\"tzName\\":\\"Krasnoyarsk Time\\"},{\\"zoneName\\":\\"Asia/Novosibirsk\\",\\"gmtOffset\\":25200,\\"gmtOffsetName\\":\\"UTC+07:00\\",\\"abbreviation\\":\\"NOVT\\",\\"tzName\\":\\"Novosibirsk Time\\"},{\\"zoneName\\":\\"Asia/Omsk\\",\\"gmtOffset\\":21600,\\"gmtOffsetName\\":\\"UTC+06:00\\",\\"abbreviation\\":\\"OMST\\",\\"tzName\\":\\"Omsk Time\\"},{\\"zoneName\\":\\"Asia/Sakhalin\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"SAKT\\",\\"tzName\\":\\"Sakhalin Island Time\\"},{\\"zoneName\\":\\"Asia/Srednekolymsk\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"SRET\\",\\"tzName\\":\\"Srednekolymsk Time\\"},{\\"zoneName\\":\\"Asia/Tomsk\\",\\"gmtOffset\\":25200,\\"gmtOffsetName\\":\\"UTC+07:00\\",\\"abbreviation\\":\\"MSD+3\\",\\"tzName\\":\\"Moscow Daylight Time+3\\"},{\\"zoneName\\":\\"Asia/Ust-Nera\\",\\"gmtOffset\\":36000,\\"gmtOffsetName\\":\\"UTC+10:00\\",\\"abbreviation\\":\\"VLAT\\",\\"tzName\\":\\"Vladivostok Time\\"},{\\"zoneName\\":\\"Asia/Vladivostok\\",\\"gmtOffset\\":36000,\\"gmtOffsetName\\":\\"UTC+10:00\\",\\"abbreviation\\":\\"VLAT\\",\\"tzName\\":\\"Vladivostok Time\\"},{\\"zoneName\\":\\"Asia/Yakutsk\\",\\"gmtOffset\\":32400,\\"gmtOffsetName\\":\\"UTC+09:00\\",\\"abbreviation\\":\\"YAKT\\",\\"tzName\\":\\"Yakutsk Time\\"},{\\"zoneName\\":\\"Asia/Yekaterinburg\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"YEKT\\",\\"tzName\\":\\"Yekaterinburg Time\\"},{\\"zoneName\\":\\"Europe/Astrakhan\\",\\"gmtOffset\\":14400,\\"gmtOffsetName\\":\\"UTC+04:00\\",\\"abbreviation\\":\\"SAMT\\",\\"tzName\\":\\"Samara Time\\"},{\\"zoneName\\":\\"Europe/Kaliningrad\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"},{\\"zoneName\\":\\"Europe/Kirov\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"MSK\\",\\"tzName\\":\\"Moscow Time\\"},{\\"zoneName\\":\\"Europe/Moscow\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"MSK\\",\\"tzName\\":\\"Moscow Time\\"},{\\"zoneName\\":\\"Europe/Samara\\",\\"gmtOffset\\":14400,\\"gmtOffsetName\\":\\"UTC+04:00\\",\\"abbreviation\\":\\"SAMT\\",\\"tzName\\":\\"Samara Time\\"},{\\"zoneName\\":\\"Europe/Saratov\\",\\"gmtOffset\\":14400,\\"gmtOffsetName\\":\\"UTC+04:00\\",\\"abbreviation\\":\\"MSD\\",\\"tzName\\":\\"Moscow Daylight Time+4\\"},{\\"zoneName\\":\\"Europe/Ulyanovsk\\",\\"gmtOffset\\":14400,\\"gmtOffsetName\\":\\"UTC+04:00\\",\\"abbreviation\\":\\"SAMT\\",\\"tzName\\":\\"Samara Time\\"},{\\"zoneName\\":\\"Europe/Volgograd\\",\\"gmtOffset\\":14400,\\"gmtOffsetName\\":\\"UTC+04:00\\",\\"abbreviation\\":\\"MSK\\",\\"tzName\\":\\"Moscow Standard Time\\"}]	{\\"kr\\":\\"러시아\\",\\"pt-BR\\":\\"Rússia\\",\\"pt\\":\\"Rússia\\",\\"nl\\":\\"Rusland\\",\\"hr\\":\\"Rusija\\",\\"fa\\":\\"روسیه\\",\\"de\\":\\"Russland\\",\\"es\\":\\"Rusia\\",\\"fr\\":\\"Russie\\",\\"ja\\":\\"ロシア連邦\\",\\"it\\":\\"Russia\\",\\"cn\\":\\"俄罗斯联邦\\",\\"tr\\":\\"Rusya\\"}	60.00000000	100.00000000	🇷🇺	U+1F1F7 U+1F1FA	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q159
183	Rwanda	RWA	646	RW	250	Kigali	RWF	Rwandan franc	FRw	.rw	Rwanda	Africa	1	Eastern Africa	4	Rwandan	[{\\"zoneName\\":\\"Africa/Kigali\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"CAT\\",\\"tzName\\":\\"Central Africa Time\\"}]	{\\"kr\\":\\"르완다\\",\\"pt-BR\\":\\"Ruanda\\",\\"pt\\":\\"Ruanda\\",\\"nl\\":\\"Rwanda\\",\\"hr\\":\\"Ruanda\\",\\"fa\\":\\"رواندا\\",\\"de\\":\\"Ruanda\\",\\"es\\":\\"Ruanda\\",\\"fr\\":\\"Rwanda\\",\\"ja\\":\\"ルワンダ\\",\\"it\\":\\"Ruanda\\",\\"cn\\":\\"卢旺达\\",\\"tr\\":\\"Ruanda\\"}	-2.00000000	30.00000000	🇷🇼	U+1F1F7 U+1F1FC	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1037
184	Saint Helena	SHN	654	SH	290	Jamestown	SHP	Saint Helena pound	£	.sh	Saint Helena	Africa	1	Western Africa	3	Saint Helenian	[{\\"zoneName\\":\\"Atlantic/St_Helena\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"세인트헬레나\\",\\"pt-BR\\":\\"Santa Helena\\",\\"pt\\":\\"Santa Helena\\",\\"nl\\":\\"Sint-Helena\\",\\"hr\\":\\"Sveta Helena\\",\\"fa\\":\\"سنت هلنا، اسنشن و تریستان دا کونا\\",\\"de\\":\\"Sankt Helena\\",\\"es\\":\\"Santa Helena\\",\\"fr\\":\\"Sainte-Hélène\\",\\"ja\\":\\"セントヘレナ・アセンションおよびトリスタンダクーニャ\\",\\"it\\":\\"Sant\\"Elena\\",\\"cn\\":\\"圣赫勒拿\\",\\"tr\\":\\"Saint Helena\\"}	-15.95000000	-5.70000000	🇸🇭	U+1F1F8 U+1F1ED	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
185	Saint Kitts And Nevis	KNA	659	KN	+1-869	Basseterre	XCD	Eastern Caribbean dollar	$	.kn	Saint Kitts and Nevis	Americas	2	Caribbean	7	Kittitian or Nevisian	[{\\"zoneName\\":\\"America/St_Kitts\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"세인트키츠 네비스\\",\\"pt-BR\\":\\"São Cristóvão e Neves\\",\\"pt\\":\\"São Cristóvão e Neves\\",\\"nl\\":\\"Saint Kitts en Nevis\\",\\"hr\\":\\"Sveti Kristof i Nevis\\",\\"fa\\":\\"سنت کیتس و نویس\\",\\"de\\":\\"St. Kitts und Nevis\\",\\"es\\":\\"San Cristóbal y Nieves\\",\\"fr\\":\\"Saint-Christophe-et-Niévès\\",\\"ja\\":\\"セントクリストファー・ネイビス\\",\\"it\\":\\"Saint Kitts e Nevis\\",\\"cn\\":\\"圣基茨和尼维斯\\",\\"tr\\":\\"Saint Kitts Ve Nevis\\"}	17.33333333	-62.75000000	🇰🇳	U+1F1F0 U+1F1F3	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q763
186	Saint Lucia	LCA	662	LC	+1-758	Castries	XCD	Eastern Caribbean dollar	$	.lc	Saint Lucia	Americas	2	Caribbean	7	Saint Lucian	[{\\"zoneName\\":\\"America/St_Lucia\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"세인트루시아\\",\\"pt-BR\\":\\"Santa Lúcia\\",\\"pt\\":\\"Santa Lúcia\\",\\"nl\\":\\"Saint Lucia\\",\\"hr\\":\\"Sveta Lucija\\",\\"fa\\":\\"سنت لوسیا\\",\\"de\\":\\"Saint Lucia\\",\\"es\\":\\"Santa Lucía\\",\\"fr\\":\\"Saint-Lucie\\",\\"ja\\":\\"セントルシア\\",\\"it\\":\\"Santa Lucia\\",\\"cn\\":\\"圣卢西亚\\",\\"tr\\":\\"Saint Lucia\\"}	13.88333333	-60.96666666	🇱🇨	U+1F1F1 U+1F1E8	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q760
187	Saint Pierre and Miquelon	SPM	666	PM	508	Saint-Pierre	EUR	Euro	€	.pm	Saint-Pierre-et-Miquelon	Americas	2	Northern America	6	Saint-Pierrais or Miquelonnais	[{\\"zoneName\\":\\"America/Miquelon\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"PMDT\\",\\"tzName\\":\\"Pierre & Miquelon Daylight Time\\"}]	{\\"kr\\":\\"생피에르 미클롱\\",\\"pt-BR\\":\\"Saint-Pierre e Miquelon\\",\\"pt\\":\\"São Pedro e Miquelon\\",\\"nl\\":\\"Saint Pierre en Miquelon\\",\\"hr\\":\\"Sveti Petar i Mikelon\\",\\"fa\\":\\"سن پیر و میکلن\\",\\"de\\":\\"Saint-Pierre und Miquelon\\",\\"es\\":\\"San Pedro y Miquelón\\",\\"fr\\":\\"Saint-Pierre-et-Miquelon\\",\\"ja\\":\\"サンピエール島・ミクロン島\\",\\"it\\":\\"Saint-Pierre e Miquelon\\",\\"cn\\":\\"圣皮埃尔和密克隆\\",\\"tr\\":\\"Saint Pierre Ve Miquelon\\"}	46.83333333	-56.33333333	🇵🇲	U+1F1F5 U+1F1F2	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
188	Saint Vincent And The Grenadines	VCT	670	VC	+1-784	Kingstown	XCD	Eastern Caribbean dollar	$	.vc	Saint Vincent and the Grenadines	Americas	2	Caribbean	7	Saint Vincentian, Vincentian	[{\\"zoneName\\":\\"America/St_Vincent\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"세인트빈센트 그레나딘\\",\\"pt-BR\\":\\"São Vicente e Granadinas\\",\\"pt\\":\\"São Vicente e Granadinas\\",\\"nl\\":\\"Saint Vincent en de Grenadines\\",\\"hr\\":\\"Sveti Vincent i Grenadini\\",\\"fa\\":\\"سنت وینسنت و گرنادین‌ها\\",\\"de\\":\\"Saint Vincent und die Grenadinen\\",\\"es\\":\\"San Vicente y Granadinas\\",\\"fr\\":\\"Saint-Vincent-et-les-Grenadines\\",\\"ja\\":\\"セントビンセントおよびグレナディーン諸島\\",\\"it\\":\\"Saint Vincent e Grenadine\\",\\"cn\\":\\"圣文森特和格林纳丁斯\\",\\"tr\\":\\"Saint Vincent Ve Grenadinler\\"}	13.25000000	-61.20000000	🇻🇨	U+1F1FB U+1F1E8	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q757
189	Saint-Barthelemy	BLM	652	BL	590	Gustavia	EUR	Euro	€	.bl	Saint-Barthélemy	Americas	2	Caribbean	7	Barthelemois	[{\\"zoneName\\":\\"America/St_Barthelemy\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"생바르텔레미\\",\\"pt-BR\\":\\"São Bartolomeu\\",\\"pt\\":\\"São Bartolomeu\\",\\"nl\\":\\"Saint Barthélemy\\",\\"hr\\":\\"Saint Barthélemy\\",\\"fa\\":\\"سن-بارتلمی\\",\\"de\\":\\"Saint-Barthélemy\\",\\"es\\":\\"San Bartolomé\\",\\"fr\\":\\"Saint-Barthélemy\\",\\"ja\\":\\"サン・バルテルミー\\",\\"it\\":\\"Antille Francesi\\",\\"cn\\":\\"圣巴泰勒米\\",\\"tr\\":\\"Saint Barthélemy\\"}	18.50000000	-63.41666666	🇧🇱	U+1F1E7 U+1F1F1	2018-07-21 09:11:03	2023-08-11 17:45:55	1	\N
190	Saint-Martin (French part)	MAF	663	MF	590	Marigot	EUR	Euro	€	.mf	Saint-Martin	Americas	2	Caribbean	7	Saint-Martinoise	[{\\"zoneName\\":\\"America/Marigot\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"세인트마틴 섬\\",\\"pt-BR\\":\\"Saint Martin\\",\\"pt\\":\\"Ilha São Martinho\\",\\"nl\\":\\"Saint-Martin\\",\\"hr\\":\\"Sveti Martin\\",\\"fa\\":\\"سینت مارتن\\",\\"de\\":\\"Saint Martin\\",\\"es\\":\\"Saint Martin\\",\\"fr\\":\\"Saint-Martin\\",\\"ja\\":\\"サン・マルタン（フランス領）\\",\\"it\\":\\"Saint Martin\\",\\"cn\\":\\"密克罗尼西亚\\",\\"tr\\":\\"Saint Martin\\"}	18.08333333	-63.95000000	🇲🇫	U+1F1F2 U+1F1EB	2018-07-21 09:11:03	2023-08-11 17:45:55	1	\N
191	Samoa	WSM	882	WS	685	Apia	WST	Samoan tālā	SAT	.ws	Samoa	Oceania	5	Polynesia	22	Samoan	[{\\"zoneName\\":\\"Pacific/Apia\\",\\"gmtOffset\\":50400,\\"gmtOffsetName\\":\\"UTC+14:00\\",\\"abbreviation\\":\\"WST\\",\\"tzName\\":\\"West Samoa Time\\"}]	{\\"kr\\":\\"사모아\\",\\"pt-BR\\":\\"Samoa\\",\\"pt\\":\\"Samoa\\",\\"nl\\":\\"Samoa\\",\\"hr\\":\\"Samoa\\",\\"fa\\":\\"ساموآ\\",\\"de\\":\\"Samoa\\",\\"es\\":\\"Samoa\\",\\"fr\\":\\"Samoa\\",\\"ja\\":\\"サモア\\",\\"it\\":\\"Samoa\\",\\"cn\\":\\"萨摩亚\\",\\"tr\\":\\"Samoa\\"}	-13.58333333	-172.33333333	🇼🇸	U+1F1FC U+1F1F8	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q683
192	San Marino	SMR	674	SM	378	San Marino	EUR	Euro	€	.sm	San Marino	Europe	4	Southern Europe	16	Sammarinese	[{\\"zoneName\\":\\"Europe/San_Marino\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"산마리노\\",\\"pt-BR\\":\\"San Marino\\",\\"pt\\":\\"São Marinho\\",\\"nl\\":\\"San Marino\\",\\"hr\\":\\"San Marino\\",\\"fa\\":\\"سان مارینو\\",\\"de\\":\\"San Marino\\",\\"es\\":\\"San Marino\\",\\"fr\\":\\"Saint-Marin\\",\\"ja\\":\\"サンマリノ\\",\\"it\\":\\"San Marino\\",\\"cn\\":\\"圣马力诺\\",\\"tr\\":\\"San Marino\\"}	43.76666666	12.41666666	🇸🇲	U+1F1F8 U+1F1F2	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q238
193	Sao Tome and Principe	STP	678	ST	239	Sao Tome	STD	Dobra	Db	.st	São Tomé e Príncipe	Africa	1	Middle Africa	2	Sao Tomean	[{\\"zoneName\\":\\"Africa/Sao_Tome\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"상투메 프린시페\\",\\"pt-BR\\":\\"São Tomé e Príncipe\\",\\"pt\\":\\"São Tomé e Príncipe\\",\\"nl\\":\\"Sao Tomé en Principe\\",\\"hr\\":\\"Sveti Toma i Princip\\",\\"fa\\":\\"کواترو دو فرویرو\\",\\"de\\":\\"São Tomé und Príncipe\\",\\"es\\":\\"Santo Tomé y Príncipe\\",\\"fr\\":\\"Sao Tomé-et-Principe\\",\\"ja\\":\\"サントメ・プリンシペ\\",\\"it\\":\\"São Tomé e Príncipe\\",\\"cn\\":\\"圣多美和普林西比\\",\\"tr\\":\\"Sao Tome Ve Prinsipe\\"}	1.00000000	7.00000000	🇸🇹	U+1F1F8 U+1F1F9	2018-07-21 09:11:03	2023-08-11 17:45:55	1	Q1039
194	Saudi Arabia	SAU	682	SA	966	Riyadh	SAR	Saudi riyal	﷼	.sa	المملكة العربية السعودية	Asia	3	Western Asia	11	Saudi, Saudi Arabian	[{\\"zoneName\\":\\"Asia/Riyadh\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Arabia Standard Time\\"}]	{\\"kr\\":\\"사우디아라비아\\",\\"pt-BR\\":\\"Arábia Saudita\\",\\"pt\\":\\"Arábia Saudita\\",\\"nl\\":\\"Saoedi-Arabië\\",\\"hr\\":\\"Saudijska Arabija\\",\\"fa\\":\\"عربستان سعودی\\",\\"de\\":\\"Saudi-Arabien\\",\\"es\\":\\"Arabia Saudí\\",\\"fr\\":\\"Arabie Saoudite\\",\\"ja\\":\\"サウジアラビア\\",\\"it\\":\\"Arabia Saudita\\",\\"cn\\":\\"沙特阿拉伯\\",\\"tr\\":\\"Suudi Arabistan\\"}	25.00000000	45.00000000	🇸🇦	U+1F1F8 U+1F1E6	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q851
195	Senegal	SEN	686	SN	221	Dakar	XOF	West African CFA franc	CFA	.sn	Sénégal	Africa	1	Western Africa	3	Senegalese	[{\\"zoneName\\":\\"Africa/Dakar\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"세네갈\\",\\"pt-BR\\":\\"Senegal\\",\\"pt\\":\\"Senegal\\",\\"nl\\":\\"Senegal\\",\\"hr\\":\\"Senegal\\",\\"fa\\":\\"سنگال\\",\\"de\\":\\"Senegal\\",\\"es\\":\\"Senegal\\",\\"fr\\":\\"Sénégal\\",\\"ja\\":\\"セネガル\\",\\"it\\":\\"Senegal\\",\\"cn\\":\\"塞内加尔\\",\\"tr\\":\\"Senegal\\"}	14.00000000	-14.00000000	🇸🇳	U+1F1F8 U+1F1F3	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1041
196	Serbia	SRB	688	RS	381	Belgrade	RSD	Serbian dinar	din	.rs	Србија	Europe	4	Southern Europe	16	Serbian	[{\\"zoneName\\":\\"Europe/Belgrade\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"세르비아\\",\\"pt-BR\\":\\"Sérvia\\",\\"pt\\":\\"Sérvia\\",\\"nl\\":\\"Servië\\",\\"hr\\":\\"Srbija\\",\\"fa\\":\\"صربستان\\",\\"de\\":\\"Serbien\\",\\"es\\":\\"Serbia\\",\\"fr\\":\\"Serbie\\",\\"ja\\":\\"セルビア\\",\\"it\\":\\"Serbia\\",\\"cn\\":\\"塞尔维亚\\",\\"tr\\":\\"Sirbistan\\"}	44.00000000	21.00000000	🇷🇸	U+1F1F7 U+1F1F8	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q403
197	Seychelles	SYC	690	SC	248	Victoria	SCR	Seychellois rupee	SRe	.sc	Seychelles	Africa	1	Eastern Africa	4	Seychellois	[{\\"zoneName\\":\\"Indian/Mahe\\",\\"gmtOffset\\":14400,\\"gmtOffsetName\\":\\"UTC+04:00\\",\\"abbreviation\\":\\"SCT\\",\\"tzName\\":\\"Seychelles Time\\"}]	{\\"kr\\":\\"세이셸\\",\\"pt-BR\\":\\"Seicheles\\",\\"pt\\":\\"Seicheles\\",\\"nl\\":\\"Seychellen\\",\\"hr\\":\\"Sejšeli\\",\\"fa\\":\\"سیشل\\",\\"de\\":\\"Seychellen\\",\\"es\\":\\"Seychelles\\",\\"fr\\":\\"Seychelles\\",\\"ja\\":\\"セーシェル\\",\\"it\\":\\"Seychelles\\",\\"cn\\":\\"塞舌尔\\",\\"tr\\":\\"Seyşeller\\"}	-4.58333333	55.66666666	🇸🇨	U+1F1F8 U+1F1E8	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1042
198	Sierra Leone	SLE	694	SL	232	Freetown	SLL	Sierra Leonean leone	Le	.sl	Sierra Leone	Africa	1	Western Africa	3	Sierra Leonean	[{\\"zoneName\\":\\"Africa/Freetown\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"시에라리온\\",\\"pt-BR\\":\\"Serra Leoa\\",\\"pt\\":\\"Serra Leoa\\",\\"nl\\":\\"Sierra Leone\\",\\"hr\\":\\"Sijera Leone\\",\\"fa\\":\\"سیرالئون\\",\\"de\\":\\"Sierra Leone\\",\\"es\\":\\"Sierra Leone\\",\\"fr\\":\\"Sierra Leone\\",\\"ja\\":\\"シエラレオネ\\",\\"it\\":\\"Sierra Leone\\",\\"cn\\":\\"塞拉利昂\\",\\"tr\\":\\"Sierra Leone\\"}	8.50000000	-11.50000000	🇸🇱	U+1F1F8 U+1F1F1	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1044
199	Singapore	SGP	702	SG	65	Singapur	SGD	Singapore dollar	$	.sg	Singapore	Asia	3	South-Eastern Asia	13	Singaporean	[{\\"zoneName\\":\\"Asia/Singapore\\",\\"gmtOffset\\":28800,\\"gmtOffsetName\\":\\"UTC+08:00\\",\\"abbreviation\\":\\"SGT\\",\\"tzName\\":\\"Singapore Time\\"}]	{\\"kr\\":\\"싱가포르\\",\\"pt-BR\\":\\"Singapura\\",\\"pt\\":\\"Singapura\\",\\"nl\\":\\"Singapore\\",\\"hr\\":\\"Singapur\\",\\"fa\\":\\"سنگاپور\\",\\"de\\":\\"Singapur\\",\\"es\\":\\"Singapur\\",\\"fr\\":\\"Singapour\\",\\"ja\\":\\"シンガポール\\",\\"it\\":\\"Singapore\\",\\"cn\\":\\"新加坡\\",\\"tr\\":\\"Singapur\\"}	1.36666666	103.80000000	🇸🇬	U+1F1F8 U+1F1EC	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q334
200	Slovakia	SVK	703	SK	421	Bratislava	EUR	Euro	€	.sk	Slovensko	Europe	4	Eastern Europe	15	Slovak	[{\\"zoneName\\":\\"Europe/Bratislava\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"슬로바키아\\",\\"pt-BR\\":\\"Eslováquia\\",\\"pt\\":\\"Eslováquia\\",\\"nl\\":\\"Slowakije\\",\\"hr\\":\\"Slovačka\\",\\"fa\\":\\"اسلواکی\\",\\"de\\":\\"Slowakei\\",\\"es\\":\\"República Eslovaca\\",\\"fr\\":\\"Slovaquie\\",\\"ja\\":\\"スロバキア\\",\\"it\\":\\"Slovacchia\\",\\"cn\\":\\"斯洛伐克\\",\\"tr\\":\\"Slovakya\\"}	48.66666666	19.50000000	🇸🇰	U+1F1F8 U+1F1F0	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q214
201	Slovenia	SVN	705	SI	386	Ljubljana	EUR	Euro	€	.si	Slovenija	Europe	4	Southern Europe	16	Slovenian, Slovene	[{\\"zoneName\\":\\"Europe/Ljubljana\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"슬로베니아\\",\\"pt-BR\\":\\"Eslovênia\\",\\"pt\\":\\"Eslovénia\\",\\"nl\\":\\"Slovenië\\",\\"hr\\":\\"Slovenija\\",\\"fa\\":\\"اسلوونی\\",\\"de\\":\\"Slowenien\\",\\"es\\":\\"Eslovenia\\",\\"fr\\":\\"Slovénie\\",\\"ja\\":\\"スロベニア\\",\\"it\\":\\"Slovenia\\",\\"cn\\":\\"斯洛文尼亚\\",\\"tr\\":\\"Slovenya\\"}	46.11666666	14.81666666	🇸🇮	U+1F1F8 U+1F1EE	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q215
202	Solomon Islands	SLB	090	SB	677	Honiara	SBD	Solomon Islands dollar	Si$	.sb	Solomon Islands	Oceania	5	Melanesia	20	Solomon Island	[{\\"zoneName\\":\\"Pacific/Guadalcanal\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"SBT\\",\\"tzName\\":\\"Solomon Islands Time\\"}]	{\\"kr\\":\\"솔로몬 제도\\",\\"pt-BR\\":\\"Ilhas Salomão\\",\\"pt\\":\\"Ilhas Salomão\\",\\"nl\\":\\"Salomonseilanden\\",\\"hr\\":\\"Solomonski Otoci\\",\\"fa\\":\\"جزایر سلیمان\\",\\"de\\":\\"Salomonen\\",\\"es\\":\\"Islas Salomón\\",\\"fr\\":\\"Îles Salomon\\",\\"ja\\":\\"ソロモン諸島\\",\\"it\\":\\"Isole Salomone\\",\\"cn\\":\\"所罗门群岛\\",\\"tr\\":\\"Solomon Adalari\\"}	-8.00000000	159.00000000	🇸🇧	U+1F1F8 U+1F1E7	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q685
203	Somalia	SOM	706	SO	252	Mogadishu	SOS	Somali shilling	Sh.so.	.so	Soomaaliya	Africa	1	Eastern Africa	4	Somali, Somalian	[{\\"zoneName\\":\\"Africa/Mogadishu\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"EAT\\",\\"tzName\\":\\"East Africa Time\\"}]	{\\"kr\\":\\"소말리아\\",\\"pt-BR\\":\\"Somália\\",\\"pt\\":\\"Somália\\",\\"nl\\":\\"Somalië\\",\\"hr\\":\\"Somalija\\",\\"fa\\":\\"سومالی\\",\\"de\\":\\"Somalia\\",\\"es\\":\\"Somalia\\",\\"fr\\":\\"Somalie\\",\\"ja\\":\\"ソマリア\\",\\"it\\":\\"Somalia\\",\\"cn\\":\\"索马里\\",\\"tr\\":\\"Somali\\"}	10.00000000	49.00000000	🇸🇴	U+1F1F8 U+1F1F4	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1045
204	South Africa	ZAF	710	ZA	27	Pretoria	ZAR	South African rand	R	.za	South Africa	Africa	1	Southern Africa	5	South African	[{\\"zoneName\\":\\"Africa/Johannesburg\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"SAST\\",\\"tzName\\":\\"South African Standard Time\\"}]	{\\"kr\\":\\"남아프리카 공화국\\",\\"pt-BR\\":\\"República Sul-Africana\\",\\"pt\\":\\"República Sul-Africana\\",\\"nl\\":\\"Zuid-Afrika\\",\\"hr\\":\\"Južnoafrička Republika\\",\\"fa\\":\\"آفریقای جنوبی\\",\\"de\\":\\"Republik Südafrika\\",\\"es\\":\\"República de Sudáfrica\\",\\"fr\\":\\"Afrique du Sud\\",\\"ja\\":\\"南アフリカ\\",\\"it\\":\\"Sud Africa\\",\\"cn\\":\\"南非\\",\\"tr\\":\\"Güney Afrika Cumhuriyeti\\"}	-29.00000000	24.00000000	🇿🇦	U+1F1FF U+1F1E6	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q258
205	South Georgia	SGS	239	GS	500	Grytviken	GBP	British pound	£	.gs	South Georgia	Americas	2	South America	8	South Georgia or South Sandwich Islands	[{\\"zoneName\\":\\"Atlantic/South_Georgia\\",\\"gmtOffset\\":-7200,\\"gmtOffsetName\\":\\"UTC-02:00\\",\\"abbreviation\\":\\"GST\\",\\"tzName\\":\\"South Georgia and the South Sandwich Islands Time\\"}]	{\\"kr\\":\\"사우스조지아\\",\\"pt-BR\\":\\"Ilhas Geórgias do Sul e Sandwich do Sul\\",\\"pt\\":\\"Ilhas Geórgia do Sul e Sanduíche do Sul\\",\\"nl\\":\\"Zuid-Georgia en Zuidelijke Sandwicheilanden\\",\\"hr\\":\\"Južna Georgija i otočje Južni Sandwich\\",\\"fa\\":\\"جزایر جورجیای جنوبی و ساندویچ جنوبی\\",\\"de\\":\\"Südgeorgien und die Südlichen Sandwichinseln\\",\\"es\\":\\"Islas Georgias del Sur y Sandwich del Sur\\",\\"fr\\":\\"Géorgie du Sud-et-les Îles Sandwich du Sud\\",\\"ja\\":\\"サウスジョージア・サウスサンドウィッチ諸島\\",\\"it\\":\\"Georgia del Sud e Isole Sandwich Meridionali\\",\\"cn\\":\\"南乔治亚\\",\\"tr\\":\\"Güney Georgia\\"}	-54.50000000	-37.00000000	🇬🇸	U+1F1EC U+1F1F8	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
206	South Sudan	SSD	728	SS	211	Juba	SSP	South Sudanese pound	£	.ss	South Sudan	Africa	1	Middle Africa	2	South Sudanese	[{\\"zoneName\\":\\"Africa/Juba\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"EAT\\",\\"tzName\\":\\"East Africa Time\\"}]	{\\"kr\\":\\"남수단\\",\\"pt-BR\\":\\"Sudão do Sul\\",\\"pt\\":\\"Sudão do Sul\\",\\"nl\\":\\"Zuid-Soedan\\",\\"hr\\":\\"Južni Sudan\\",\\"fa\\":\\"سودان جنوبی\\",\\"de\\":\\"Südsudan\\",\\"es\\":\\"Sudán del Sur\\",\\"fr\\":\\"Soudan du Sud\\",\\"ja\\":\\"南スーダン\\",\\"it\\":\\"Sudan del sud\\",\\"cn\\":\\"南苏丹\\",\\"tr\\":\\"Güney Sudan\\"}	7.00000000	30.00000000	🇸🇸	U+1F1F8 U+1F1F8	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q958
207	Spain	ESP	724	ES	34	Madrid	EUR	Euro	€	.es	España	Europe	4	Southern Europe	16	Spanish	[{\\"zoneName\\":\\"Africa/Ceuta\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"},{\\"zoneName\\":\\"Atlantic/Canary\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"WET\\",\\"tzName\\":\\"Western European Time\\"},{\\"zoneName\\":\\"Europe/Madrid\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"스페인\\",\\"pt-BR\\":\\"Espanha\\",\\"pt\\":\\"Espanha\\",\\"nl\\":\\"Spanje\\",\\"hr\\":\\"Španjolska\\",\\"fa\\":\\"اسپانیا\\",\\"de\\":\\"Spanien\\",\\"es\\":\\"España\\",\\"fr\\":\\"Espagne\\",\\"ja\\":\\"スペイン\\",\\"it\\":\\"Spagna\\",\\"cn\\":\\"西班牙\\",\\"tr\\":\\"İspanya\\"}	40.00000000	-4.00000000	🇪🇸	U+1F1EA U+1F1F8	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q29
208	Sri Lanka	LKA	144	LK	94	Colombo	LKR	Sri Lankan rupee	Rs	.lk	śrī laṃkāva	Asia	3	Southern Asia	14	Sri Lankan	[{\\"zoneName\\":\\"Asia/Colombo\\",\\"gmtOffset\\":19800,\\"gmtOffsetName\\":\\"UTC+05:30\\",\\"abbreviation\\":\\"IST\\",\\"tzName\\":\\"Indian Standard Time\\"}]	{\\"kr\\":\\"스리랑카\\",\\"pt-BR\\":\\"Sri Lanka\\",\\"pt\\":\\"Sri Lanka\\",\\"nl\\":\\"Sri Lanka\\",\\"hr\\":\\"Šri Lanka\\",\\"fa\\":\\"سری‌لانکا\\",\\"de\\":\\"Sri Lanka\\",\\"es\\":\\"Sri Lanka\\",\\"fr\\":\\"Sri Lanka\\",\\"ja\\":\\"スリランカ\\",\\"it\\":\\"Sri Lanka\\",\\"cn\\":\\"斯里兰卡\\",\\"tr\\":\\"Sri Lanka\\"}	7.00000000	81.00000000	🇱🇰	U+1F1F1 U+1F1F0	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q854
209	Sudan	SDN	729	SD	249	Khartoum	SDG	Sudanese pound	.س.ج	.sd	السودان	Africa	1	Northern Africa	1	Sudanese	[{\\"zoneName\\":\\"Africa/Khartoum\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EAT\\",\\"tzName\\":\\"Eastern African Time\\"}]	{\\"kr\\":\\"수단\\",\\"pt-BR\\":\\"Sudão\\",\\"pt\\":\\"Sudão\\",\\"nl\\":\\"Soedan\\",\\"hr\\":\\"Sudan\\",\\"fa\\":\\"سودان\\",\\"de\\":\\"Sudan\\",\\"es\\":\\"Sudán\\",\\"fr\\":\\"Soudan\\",\\"ja\\":\\"スーダン\\",\\"it\\":\\"Sudan\\",\\"cn\\":\\"苏丹\\",\\"tr\\":\\"Sudan\\"}	15.00000000	30.00000000	🇸🇩	U+1F1F8 U+1F1E9	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1049
210	Suriname	SUR	740	SR	597	Paramaribo	SRD	Surinamese dollar	$	.sr	Suriname	Americas	2	South America	8	Surinamese	[{\\"zoneName\\":\\"America/Paramaribo\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"SRT\\",\\"tzName\\":\\"Suriname Time\\"}]	{\\"kr\\":\\"수리남\\",\\"pt-BR\\":\\"Suriname\\",\\"pt\\":\\"Suriname\\",\\"nl\\":\\"Suriname\\",\\"hr\\":\\"Surinam\\",\\"fa\\":\\"سورینام\\",\\"de\\":\\"Suriname\\",\\"es\\":\\"Surinam\\",\\"fr\\":\\"Surinam\\",\\"ja\\":\\"スリナム\\",\\"it\\":\\"Suriname\\",\\"cn\\":\\"苏里南\\",\\"tr\\":\\"Surinam\\"}	4.00000000	-56.00000000	🇸🇷	U+1F1F8 U+1F1F7	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q730
211	Svalbard And Jan Mayen Islands	SJM	744	SJ	47	Longyearbyen	NOK	Norwegian Krone	kr	.sj	Svalbard og Jan Mayen	Europe	4	Northern Europe	18	Svalbard	[{\\"zoneName\\":\\"Arctic/Longyearbyen\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"스발바르 얀마옌 제도\\",\\"pt-BR\\":\\"Svalbard\\",\\"pt\\":\\"Svalbard\\",\\"nl\\":\\"Svalbard en Jan Mayen\\",\\"hr\\":\\"Svalbard i Jan Mayen\\",\\"fa\\":\\"سوالبارد و یان ماین\\",\\"de\\":\\"Svalbard und Jan Mayen\\",\\"es\\":\\"Islas Svalbard y Jan Mayen\\",\\"fr\\":\\"Svalbard et Jan Mayen\\",\\"ja\\":\\"スヴァールバル諸島およびヤンマイエン島\\",\\"it\\":\\"Svalbard e Jan Mayen\\",\\"cn\\":\\"斯瓦尔巴和扬马延群岛\\",\\"tr\\":\\"Svalbard Ve Jan Mayen\\"}	78.00000000	20.00000000	🇸🇯	U+1F1F8 U+1F1EF	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
212	Swaziland	SWZ	748	SZ	268	Mbabane	SZL	Lilangeni	E	.sz	Swaziland	Africa	1	Southern Africa	5	Swazi	[{\\"zoneName\\":\\"Africa/Mbabane\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"SAST\\",\\"tzName\\":\\"South African Standard Time\\"}]	{\\"kr\\":\\"에스와티니\\",\\"pt-BR\\":\\"Suazilândia\\",\\"pt\\":\\"Suazilândia\\",\\"nl\\":\\"Swaziland\\",\\"hr\\":\\"Svazi\\",\\"fa\\":\\"سوازیلند\\",\\"de\\":\\"Swasiland\\",\\"es\\":\\"Suazilandia\\",\\"fr\\":\\"Swaziland\\",\\"ja\\":\\"スワジランド\\",\\"it\\":\\"Swaziland\\",\\"cn\\":\\"斯威士兰\\",\\"tr\\":\\"Esvatini\\"}	-26.50000000	31.50000000	🇸🇿	U+1F1F8 U+1F1FF	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1050
213	Sweden	SWE	752	SE	46	Stockholm	SEK	Swedish krona	kr	.se	Sverige	Europe	4	Northern Europe	18	Swedish	[{\\"zoneName\\":\\"Europe/Stockholm\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"스웨덴\\",\\"pt-BR\\":\\"Suécia\\",\\"pt\\":\\"Suécia\\",\\"nl\\":\\"Zweden\\",\\"hr\\":\\"Švedska\\",\\"fa\\":\\"سوئد\\",\\"de\\":\\"Schweden\\",\\"es\\":\\"Suecia\\",\\"fr\\":\\"Suède\\",\\"ja\\":\\"スウェーデン\\",\\"it\\":\\"Svezia\\",\\"cn\\":\\"瑞典\\",\\"tr\\":\\"İsveç\\"}	62.00000000	15.00000000	🇸🇪	U+1F1F8 U+1F1EA	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q34
214	Switzerland	CHE	756	CH	41	Bern	CHF	Swiss franc	CHf	.ch	Schweiz	Europe	4	Western Europe	17	Swiss	[{\\"zoneName\\":\\"Europe/Zurich\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"스위스\\",\\"pt-BR\\":\\"Suíça\\",\\"pt\\":\\"Suíça\\",\\"nl\\":\\"Zwitserland\\",\\"hr\\":\\"Švicarska\\",\\"fa\\":\\"سوئیس\\",\\"de\\":\\"Schweiz\\",\\"es\\":\\"Suiza\\",\\"fr\\":\\"Suisse\\",\\"ja\\":\\"スイス\\",\\"it\\":\\"Svizzera\\",\\"cn\\":\\"瑞士\\",\\"tr\\":\\"İsviçre\\"}	47.00000000	8.00000000	🇨🇭	U+1F1E8 U+1F1ED	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q39
215	Syria	SYR	760	SY	963	Damascus	SYP	Syrian pound	LS	.sy	سوريا	Asia	3	Western Asia	11	Syrian	[{\\"zoneName\\":\\"Asia/Damascus\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"시리아\\",\\"pt-BR\\":\\"Síria\\",\\"pt\\":\\"Síria\\",\\"nl\\":\\"Syrië\\",\\"hr\\":\\"Sirija\\",\\"fa\\":\\"سوریه\\",\\"de\\":\\"Syrien\\",\\"es\\":\\"Siria\\",\\"fr\\":\\"Syrie\\",\\"ja\\":\\"シリア・アラブ共和国\\",\\"it\\":\\"Siria\\",\\"cn\\":\\"叙利亚\\",\\"tr\\":\\"Suriye\\"}	35.00000000	38.00000000	🇸🇾	U+1F1F8 U+1F1FE	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q858
216	Taiwan	TWN	158	TW	886	Taipei	TWD	New Taiwan dollar	$	.tw	臺灣	Asia	3	Eastern Asia	12	Chinese, Taiwanese	[{\\"zoneName\\":\\"Asia/Taipei\\",\\"gmtOffset\\":28800,\\"gmtOffsetName\\":\\"UTC+08:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"China Standard Time\\"}]	{\\"kr\\":\\"대만\\",\\"pt-BR\\":\\"Taiwan\\",\\"pt\\":\\"Taiwan\\",\\"nl\\":\\"Taiwan\\",\\"hr\\":\\"Tajvan\\",\\"fa\\":\\"تایوان\\",\\"de\\":\\"Taiwan\\",\\"es\\":\\"Taiwán\\",\\"fr\\":\\"Taïwan\\",\\"ja\\":\\"台湾（中華民国）\\",\\"it\\":\\"Taiwan\\",\\"cn\\":\\"中国台湾\\",\\"tr\\":\\"Tayvan\\"}	23.50000000	121.00000000	🇹🇼	U+1F1F9 U+1F1FC	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q865
217	Tajikistan	TJK	762	TJ	992	Dushanbe	TJS	Tajikistani somoni	SM	.tj	Тоҷикистон	Asia	3	Central Asia	10	Tajikistani	[{\\"zoneName\\":\\"Asia/Dushanbe\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"TJT\\",\\"tzName\\":\\"Tajikistan Time\\"}]	{\\"kr\\":\\"타지키스탄\\",\\"pt-BR\\":\\"Tajiquistão\\",\\"pt\\":\\"Tajiquistão\\",\\"nl\\":\\"Tadzjikistan\\",\\"hr\\":\\"Tađikistan\\",\\"fa\\":\\"تاجیکستان\\",\\"de\\":\\"Tadschikistan\\",\\"es\\":\\"Tayikistán\\",\\"fr\\":\\"Tadjikistan\\",\\"ja\\":\\"タジキスタン\\",\\"it\\":\\"Tagikistan\\",\\"cn\\":\\"塔吉克斯坦\\",\\"tr\\":\\"Tacikistan\\"}	39.00000000	71.00000000	🇹🇯	U+1F1F9 U+1F1EF	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q863
218	Tanzania	TZA	834	TZ	255	Dodoma	TZS	Tanzanian shilling	TSh	.tz	Tanzania	Africa	1	Eastern Africa	4	Tanzanian	[{\\"zoneName\\":\\"Africa/Dar_es_Salaam\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"EAT\\",\\"tzName\\":\\"East Africa Time\\"}]	{\\"kr\\":\\"탄자니아\\",\\"pt-BR\\":\\"Tanzânia\\",\\"pt\\":\\"Tanzânia\\",\\"nl\\":\\"Tanzania\\",\\"hr\\":\\"Tanzanija\\",\\"fa\\":\\"تانزانیا\\",\\"de\\":\\"Tansania\\",\\"es\\":\\"Tanzania\\",\\"fr\\":\\"Tanzanie\\",\\"ja\\":\\"タンザニア\\",\\"it\\":\\"Tanzania\\",\\"cn\\":\\"坦桑尼亚\\",\\"tr\\":\\"Tanzanya\\"}	-6.00000000	35.00000000	🇹🇿	U+1F1F9 U+1F1FF	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q924
219	Thailand	THA	764	TH	66	Bangkok	THB	Thai baht	฿	.th	ประเทศไทย	Asia	3	South-Eastern Asia	13	Thai	[{\\"zoneName\\":\\"Asia/Bangkok\\",\\"gmtOffset\\":25200,\\"gmtOffsetName\\":\\"UTC+07:00\\",\\"abbreviation\\":\\"ICT\\",\\"tzName\\":\\"Indochina Time\\"}]	{\\"kr\\":\\"태국\\",\\"pt-BR\\":\\"Tailândia\\",\\"pt\\":\\"Tailândia\\",\\"nl\\":\\"Thailand\\",\\"hr\\":\\"Tajland\\",\\"fa\\":\\"تایلند\\",\\"de\\":\\"Thailand\\",\\"es\\":\\"Tailandia\\",\\"fr\\":\\"Thaïlande\\",\\"ja\\":\\"タイ\\",\\"it\\":\\"Tailandia\\",\\"cn\\":\\"泰国\\",\\"tr\\":\\"Tayland\\"}	15.00000000	100.00000000	🇹🇭	U+1F1F9 U+1F1ED	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q869
220	Togo	TGO	768	TG	228	Lome	XOF	West African CFA franc	CFA	.tg	Togo	Africa	1	Western Africa	3	Togolese	[{\\"zoneName\\":\\"Africa/Lome\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"토고\\",\\"pt-BR\\":\\"Togo\\",\\"pt\\":\\"Togo\\",\\"nl\\":\\"Togo\\",\\"hr\\":\\"Togo\\",\\"fa\\":\\"توگو\\",\\"de\\":\\"Togo\\",\\"es\\":\\"Togo\\",\\"fr\\":\\"Togo\\",\\"ja\\":\\"トーゴ\\",\\"it\\":\\"Togo\\",\\"cn\\":\\"多哥\\",\\"tr\\":\\"Togo\\"}	8.00000000	1.16666666	🇹🇬	U+1F1F9 U+1F1EC	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q945
221	Tokelau	TKL	772	TK	690		NZD	New Zealand dollar	$	.tk	Tokelau	Oceania	5	Polynesia	22	Tokelauan	[{\\"zoneName\\":\\"Pacific/Fakaofo\\",\\"gmtOffset\\":46800,\\"gmtOffsetName\\":\\"UTC+13:00\\",\\"abbreviation\\":\\"TKT\\",\\"tzName\\":\\"Tokelau Time\\"}]	{\\"kr\\":\\"토켈라우\\",\\"pt-BR\\":\\"Tokelau\\",\\"pt\\":\\"Toquelau\\",\\"nl\\":\\"Tokelau\\",\\"hr\\":\\"Tokelau\\",\\"fa\\":\\"توکلائو\\",\\"de\\":\\"Tokelau\\",\\"es\\":\\"Islas Tokelau\\",\\"fr\\":\\"Tokelau\\",\\"ja\\":\\"トケラウ\\",\\"it\\":\\"Isole Tokelau\\",\\"cn\\":\\"托克劳\\",\\"tr\\":\\"Tokelau\\"}	-9.00000000	-172.00000000	🇹🇰	U+1F1F9 U+1F1F0	2018-07-21 09:11:03	2023-08-11 17:45:55	1	\N
222	Tonga	TON	776	TO	676	Nuku\\"alofa	TOP	Tongan paʻanga	$	.to	Tonga	Oceania	5	Polynesia	22	Tongan	[{\\"zoneName\\":\\"Pacific/Tongatapu\\",\\"gmtOffset\\":46800,\\"gmtOffsetName\\":\\"UTC+13:00\\",\\"abbreviation\\":\\"TOT\\",\\"tzName\\":\\"Tonga Time\\"}]	{\\"kr\\":\\"통가\\",\\"pt-BR\\":\\"Tonga\\",\\"pt\\":\\"Tonga\\",\\"nl\\":\\"Tonga\\",\\"hr\\":\\"Tonga\\",\\"fa\\":\\"تونگا\\",\\"de\\":\\"Tonga\\",\\"es\\":\\"Tonga\\",\\"fr\\":\\"Tonga\\",\\"ja\\":\\"トンガ\\",\\"it\\":\\"Tonga\\",\\"cn\\":\\"汤加\\",\\"tr\\":\\"Tonga\\"}	-20.00000000	-175.00000000	🇹🇴	U+1F1F9 U+1F1F4	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q678
223	Trinidad And Tobago	TTO	780	TT	+1-868	Port of Spain	TTD	Trinidad and Tobago dollar	$	.tt	Trinidad and Tobago	Americas	2	Caribbean	7	Trinidadian or Tobagonian	[{\\"zoneName\\":\\"America/Port_of_Spain\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"트리니다드 토바고\\",\\"pt-BR\\":\\"Trinidad e Tobago\\",\\"pt\\":\\"Trindade e Tobago\\",\\"nl\\":\\"Trinidad en Tobago\\",\\"hr\\":\\"Trinidad i Tobago\\",\\"fa\\":\\"ترینیداد و توباگو\\",\\"de\\":\\"Trinidad und Tobago\\",\\"es\\":\\"Trinidad y Tobago\\",\\"fr\\":\\"Trinité et Tobago\\",\\"ja\\":\\"トリニダード・トバゴ\\",\\"it\\":\\"Trinidad e Tobago\\",\\"cn\\":\\"特立尼达和多巴哥\\",\\"tr\\":\\"Trinidad Ve Tobago\\"}	11.00000000	-61.00000000	🇹🇹	U+1F1F9 U+1F1F9	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q754
224	Tunisia	TUN	788	TN	216	Tunis	TND	Tunisian dinar	ت.د	.tn	تونس	Africa	1	Northern Africa	1	Tunisian	[{\\"zoneName\\":\\"Africa/Tunis\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"튀니지\\",\\"pt-BR\\":\\"Tunísia\\",\\"pt\\":\\"Tunísia\\",\\"nl\\":\\"Tunesië\\",\\"hr\\":\\"Tunis\\",\\"fa\\":\\"تونس\\",\\"de\\":\\"Tunesien\\",\\"es\\":\\"Túnez\\",\\"fr\\":\\"Tunisie\\",\\"ja\\":\\"チュニジア\\",\\"it\\":\\"Tunisia\\",\\"cn\\":\\"突尼斯\\",\\"tr\\":\\"Tunus\\"}	34.00000000	9.00000000	🇹🇳	U+1F1F9 U+1F1F3	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q948
225	Turkey	TUR	792	TR	90	Ankara	TRY	Turkish lira	₺	.tr	Türkiye	Asia	3	Western Asia	11	Turkish	[{\\"zoneName\\":\\"Europe/Istanbul\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"터키\\",\\"pt-BR\\":\\"Turquia\\",\\"pt\\":\\"Turquia\\",\\"nl\\":\\"Turkije\\",\\"hr\\":\\"Turska\\",\\"fa\\":\\"ترکیه\\",\\"de\\":\\"Türkei\\",\\"es\\":\\"Turquía\\",\\"fr\\":\\"Turquie\\",\\"ja\\":\\"トルコ\\",\\"it\\":\\"Turchia\\",\\"cn\\":\\"土耳其\\",\\"tr\\":\\"Türkiye\\"}	39.00000000	35.00000000	🇹🇷	U+1F1F9 U+1F1F7	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q43
226	Turkmenistan	TKM	795	TM	993	Ashgabat	TMT	Turkmenistan manat	T	.tm	Türkmenistan	Asia	3	Central Asia	10	Turkmen	[{\\"zoneName\\":\\"Asia/Ashgabat\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"TMT\\",\\"tzName\\":\\"Turkmenistan Time\\"}]	{\\"kr\\":\\"투르크메니스탄\\",\\"pt-BR\\":\\"Turcomenistão\\",\\"pt\\":\\"Turquemenistão\\",\\"nl\\":\\"Turkmenistan\\",\\"hr\\":\\"Turkmenistan\\",\\"fa\\":\\"ترکمنستان\\",\\"de\\":\\"Turkmenistan\\",\\"es\\":\\"Turkmenistán\\",\\"fr\\":\\"Turkménistan\\",\\"ja\\":\\"トルクメニスタン\\",\\"it\\":\\"Turkmenistan\\",\\"cn\\":\\"土库曼斯坦\\",\\"tr\\":\\"Türkmenistan\\"}	40.00000000	60.00000000	🇹🇲	U+1F1F9 U+1F1F2	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q874
227	Turks And Caicos Islands	TCA	796	TC	+1-649	Cockburn Town	USD	United States dollar	$	.tc	Turks and Caicos Islands	Americas	2	Caribbean	7	Turks and Caicos Island	[{\\"zoneName\\":\\"America/Grand_Turk\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"}]	{\\"kr\\":\\"터크스 케이커스 제도\\",\\"pt-BR\\":\\"Ilhas Turcas e Caicos\\",\\"pt\\":\\"Ilhas Turcas e Caicos\\",\\"nl\\":\\"Turks- en Caicoseilanden\\",\\"hr\\":\\"Otoci Turks i Caicos\\",\\"fa\\":\\"جزایر تورکس و کایکوس\\",\\"de\\":\\"Turks- und Caicosinseln\\",\\"es\\":\\"Islas Turks y Caicos\\",\\"fr\\":\\"Îles Turques-et-Caïques\\",\\"ja\\":\\"タークス・カイコス諸島\\",\\"it\\":\\"Isole Turks e Caicos\\",\\"cn\\":\\"特克斯和凯科斯群岛\\",\\"tr\\":\\"Turks Ve Caicos Adalari\\"}	21.75000000	-71.58333333	🇹🇨	U+1F1F9 U+1F1E8	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
228	Tuvalu	TUV	798	TV	688	Funafuti	AUD	Australian dollar	$	.tv	Tuvalu	Oceania	5	Polynesia	22	Tuvaluan	[{\\"zoneName\\":\\"Pacific/Funafuti\\",\\"gmtOffset\\":43200,\\"gmtOffsetName\\":\\"UTC+12:00\\",\\"abbreviation\\":\\"TVT\\",\\"tzName\\":\\"Tuvalu Time\\"}]	{\\"kr\\":\\"투발루\\",\\"pt-BR\\":\\"Tuvalu\\",\\"pt\\":\\"Tuvalu\\",\\"nl\\":\\"Tuvalu\\",\\"hr\\":\\"Tuvalu\\",\\"fa\\":\\"تووالو\\",\\"de\\":\\"Tuvalu\\",\\"es\\":\\"Tuvalu\\",\\"fr\\":\\"Tuvalu\\",\\"ja\\":\\"ツバル\\",\\"it\\":\\"Tuvalu\\",\\"cn\\":\\"图瓦卢\\",\\"tr\\":\\"Tuvalu\\"}	-8.00000000	178.00000000	🇹🇻	U+1F1F9 U+1F1FB	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q672
229	Uganda	UGA	800	UG	256	Kampala	UGX	Ugandan shilling	USh	.ug	Uganda	Africa	1	Eastern Africa	4	Ugandan	[{\\"zoneName\\":\\"Africa/Kampala\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"EAT\\",\\"tzName\\":\\"East Africa Time\\"}]	{\\"kr\\":\\"우간다\\",\\"pt-BR\\":\\"Uganda\\",\\"pt\\":\\"Uganda\\",\\"nl\\":\\"Oeganda\\",\\"hr\\":\\"Uganda\\",\\"fa\\":\\"اوگاندا\\",\\"de\\":\\"Uganda\\",\\"es\\":\\"Uganda\\",\\"fr\\":\\"Uganda\\",\\"ja\\":\\"ウガンダ\\",\\"it\\":\\"Uganda\\",\\"cn\\":\\"乌干达\\",\\"tr\\":\\"Uganda\\"}	1.00000000	32.00000000	🇺🇬	U+1F1FA U+1F1EC	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q1036
230	Ukraine	UKR	804	UA	380	Kyiv	UAH	Ukrainian hryvnia	₴	.ua	Україна	Europe	4	Eastern Europe	15	Ukrainian	[{\\"zoneName\\":\\"Europe/Kiev\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"},{\\"zoneName\\":\\"Europe/Simferopol\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"MSK\\",\\"tzName\\":\\"Moscow Time\\"},{\\"zoneName\\":\\"Europe/Uzhgorod\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"},{\\"zoneName\\":\\"Europe/Zaporozhye\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"EET\\",\\"tzName\\":\\"Eastern European Time\\"}]	{\\"kr\\":\\"우크라이나\\",\\"pt-BR\\":\\"Ucrânia\\",\\"pt\\":\\"Ucrânia\\",\\"nl\\":\\"Oekraïne\\",\\"hr\\":\\"Ukrajina\\",\\"fa\\":\\"وکراین\\",\\"de\\":\\"Ukraine\\",\\"es\\":\\"Ucrania\\",\\"fr\\":\\"Ukraine\\",\\"ja\\":\\"ウクライナ\\",\\"it\\":\\"Ucraina\\",\\"cn\\":\\"乌克兰\\",\\"tr\\":\\"Ukrayna\\"}	49.00000000	32.00000000	🇺🇦	U+1F1FA U+1F1E6	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q212
240	Vietnam	VNM	704	VN	84	Hanoi	VND	Vietnamese đồng	₫	.vn	Việt Nam	Asia	3	South-Eastern Asia	13	Vietnamese	[{\\"zoneName\\":\\"Asia/Ho_Chi_Minh\\",\\"gmtOffset\\":25200,\\"gmtOffsetName\\":\\"UTC+07:00\\",\\"abbreviation\\":\\"ICT\\",\\"tzName\\":\\"Indochina Time\\"}]	{\\"kr\\":\\"베트남\\",\\"pt-BR\\":\\"Vietnã\\",\\"pt\\":\\"Vietname\\",\\"nl\\":\\"Vietnam\\",\\"hr\\":\\"Vijetnam\\",\\"fa\\":\\"ویتنام\\",\\"de\\":\\"Vietnam\\",\\"es\\":\\"Vietnam\\",\\"fr\\":\\"Viêt Nam\\",\\"ja\\":\\"ベトナム\\",\\"it\\":\\"Vietnam\\",\\"cn\\":\\"越南\\",\\"tr\\":\\"Vietnam\\"}	16.16666666	107.83333333	🇻🇳	U+1F1FB U+1F1F3	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q881
231	United Arab Emirates	ARE	784	AE	971	Abu Dhabi	AED	United Arab Emirates dirham	إ.د	.ae	دولة الإمارات العربية المتحدة	Asia	3	Western Asia	11	Emirati, Emirian, Emiri	[{\\"zoneName\\":\\"Asia/Dubai\\",\\"gmtOffset\\":14400,\\"gmtOffsetName\\":\\"UTC+04:00\\",\\"abbreviation\\":\\"GST\\",\\"tzName\\":\\"Gulf Standard Time\\"}]	{\\"kr\\":\\"아랍에미리트\\",\\"pt-BR\\":\\"Emirados árabes Unidos\\",\\"pt\\":\\"Emirados árabes Unidos\\",\\"nl\\":\\"Verenigde Arabische Emiraten\\",\\"hr\\":\\"Ujedinjeni Arapski Emirati\\",\\"fa\\":\\"امارات متحده عربی\\",\\"de\\":\\"Vereinigte Arabische Emirate\\",\\"es\\":\\"Emiratos Árabes Unidos\\",\\"fr\\":\\"Émirats arabes unis\\",\\"ja\\":\\"アラブ首長国連邦\\",\\"it\\":\\"Emirati Arabi Uniti\\",\\"cn\\":\\"阿拉伯联合酋长国\\",\\"tr\\":\\"Birleşik Arap Emirlikleri\\"}	24.00000000	54.00000000	🇦🇪	U+1F1E6 U+1F1EA	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q878
232	United Kingdom	GBR	826	GB	44	London	GBP	British pound	£	.uk	United Kingdom	Europe	4	Northern Europe	18	British, UK	[{\\"zoneName\\":\\"Europe/London\\",\\"gmtOffset\\":0,\\"gmtOffsetName\\":\\"UTC±00\\",\\"abbreviation\\":\\"GMT\\",\\"tzName\\":\\"Greenwich Mean Time\\"}]	{\\"kr\\":\\"영국\\",\\"pt-BR\\":\\"Reino Unido\\",\\"pt\\":\\"Reino Unido\\",\\"nl\\":\\"Verenigd Koninkrijk\\",\\"hr\\":\\"Ujedinjeno Kraljevstvo\\",\\"fa\\":\\"بریتانیای کبیر و ایرلند شمالی\\",\\"de\\":\\"Vereinigtes Königreich\\",\\"es\\":\\"Reino Unido\\",\\"fr\\":\\"Royaume-Uni\\",\\"ja\\":\\"イギリス\\",\\"it\\":\\"Regno Unito\\",\\"cn\\":\\"英国\\",\\"tr\\":\\"Birleşik Krallik\\"}	54.00000000	-2.00000000	🇬🇧	U+1F1EC U+1F1E7	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q145
233	United States	USA	840	US	1	Washington	USD	United States dollar	$	.us	United States	Americas	2	Northern America	6	American	[{\\"zoneName\\":\\"America/Adak\\",\\"gmtOffset\\":-36000,\\"gmtOffsetName\\":\\"UTC-10:00\\",\\"abbreviation\\":\\"HST\\",\\"tzName\\":\\"Hawaii–Aleutian Standard Time\\"},{\\"zoneName\\":\\"America/Anchorage\\",\\"gmtOffset\\":-32400,\\"gmtOffsetName\\":\\"UTC-09:00\\",\\"abbreviation\\":\\"AKST\\",\\"tzName\\":\\"Alaska Standard Time\\"},{\\"zoneName\\":\\"America/Boise\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America\\"},{\\"zoneName\\":\\"America/Chicago\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Denver\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America\\"},{\\"zoneName\\":\\"America/Detroit\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Indiana/Indianapolis\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Indiana/Knox\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Indiana/Marengo\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Indiana/Petersburg\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Indiana/Tell_City\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Indiana/Vevay\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Indiana/Vincennes\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Indiana/Winamac\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Juneau\\",\\"gmtOffset\\":-32400,\\"gmtOffsetName\\":\\"UTC-09:00\\",\\"abbreviation\\":\\"AKST\\",\\"tzName\\":\\"Alaska Standard Time\\"},{\\"zoneName\\":\\"America/Kentucky/Louisville\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Kentucky/Monticello\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Los_Angeles\\",\\"gmtOffset\\":-28800,\\"gmtOffsetName\\":\\"UTC-08:00\\",\\"abbreviation\\":\\"PST\\",\\"tzName\\":\\"Pacific Standard Time (North America\\"},{\\"zoneName\\":\\"America/Menominee\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Metlakatla\\",\\"gmtOffset\\":-32400,\\"gmtOffsetName\\":\\"UTC-09:00\\",\\"abbreviation\\":\\"AKST\\",\\"tzName\\":\\"Alaska Standard Time\\"},{\\"zoneName\\":\\"America/New_York\\",\\"gmtOffset\\":-18000,\\"gmtOffsetName\\":\\"UTC-05:00\\",\\"abbreviation\\":\\"EST\\",\\"tzName\\":\\"Eastern Standard Time (North America\\"},{\\"zoneName\\":\\"America/Nome\\",\\"gmtOffset\\":-32400,\\"gmtOffsetName\\":\\"UTC-09:00\\",\\"abbreviation\\":\\"AKST\\",\\"tzName\\":\\"Alaska Standard Time\\"},{\\"zoneName\\":\\"America/North_Dakota/Beulah\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/North_Dakota/Center\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/North_Dakota/New_Salem\\",\\"gmtOffset\\":-21600,\\"gmtOffsetName\\":\\"UTC-06:00\\",\\"abbreviation\\":\\"CST\\",\\"tzName\\":\\"Central Standard Time (North America\\"},{\\"zoneName\\":\\"America/Phoenix\\",\\"gmtOffset\\":-25200,\\"gmtOffsetName\\":\\"UTC-07:00\\",\\"abbreviation\\":\\"MST\\",\\"tzName\\":\\"Mountain Standard Time (North America\\"},{\\"zoneName\\":\\"America/Sitka\\",\\"gmtOffset\\":-32400,\\"gmtOffsetName\\":\\"UTC-09:00\\",\\"abbreviation\\":\\"AKST\\",\\"tzName\\":\\"Alaska Standard Time\\"},{\\"zoneName\\":\\"America/Yakutat\\",\\"gmtOffset\\":-32400,\\"gmtOffsetName\\":\\"UTC-09:00\\",\\"abbreviation\\":\\"AKST\\",\\"tzName\\":\\"Alaska Standard Time\\"},{\\"zoneName\\":\\"Pacific/Honolulu\\",\\"gmtOffset\\":-36000,\\"gmtOffsetName\\":\\"UTC-10:00\\",\\"abbreviation\\":\\"HST\\",\\"tzName\\":\\"Hawaii–Aleutian Standard Time\\"}]	{\\"kr\\":\\"미국\\",\\"pt-BR\\":\\"Estados Unidos\\",\\"pt\\":\\"Estados Unidos\\",\\"nl\\":\\"Verenigde Staten\\",\\"hr\\":\\"Sjedinjene Američke Države\\",\\"fa\\":\\"ایالات متحده آمریکا\\",\\"de\\":\\"Vereinigte Staaten von Amerika\\",\\"es\\":\\"Estados Unidos\\",\\"fr\\":\\"États-Unis\\",\\"ja\\":\\"アメリカ合衆国\\",\\"it\\":\\"Stati Uniti D\\"America\\",\\"cn\\":\\"美国\\",\\"tr\\":\\"Amerika\\"}	38.00000000	-97.00000000	🇺🇸	U+1F1FA U+1F1F8	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q30
234	United States Minor Outlying Islands	UMI	581	UM	1		USD	United States dollar	$	.us	United States Minor Outlying Islands	Americas	2	Northern America	6	American	[{\\"zoneName\\":\\"Pacific/Midway\\",\\"gmtOffset\\":-39600,\\"gmtOffsetName\\":\\"UTC-11:00\\",\\"abbreviation\\":\\"SST\\",\\"tzName\\":\\"Samoa Standard Time\\"},{\\"zoneName\\":\\"Pacific/Wake\\",\\"gmtOffset\\":43200,\\"gmtOffsetName\\":\\"UTC+12:00\\",\\"abbreviation\\":\\"WAKT\\",\\"tzName\\":\\"Wake Island Time\\"}]	{\\"kr\\":\\"미국령 군소 제도\\",\\"pt-BR\\":\\"Ilhas Menores Distantes dos Estados Unidos\\",\\"pt\\":\\"Ilhas Menores Distantes dos Estados Unidos\\",\\"nl\\":\\"Kleine afgelegen eilanden van de Verenigde Staten\\",\\"hr\\":\\"Mali udaljeni otoci SAD-a\\",\\"fa\\":\\"جزایر کوچک حاشیه‌ای ایالات متحده آمریکا\\",\\"de\\":\\"Kleinere Inselbesitzungen der Vereinigten Staaten\\",\\"es\\":\\"Islas Ultramarinas Menores de Estados Unidos\\",\\"fr\\":\\"Îles mineures éloignées des États-Unis\\",\\"ja\\":\\"合衆国領有小離島\\",\\"it\\":\\"Isole minori esterne degli Stati Uniti d\\"America\\",\\"cn\\":\\"美国本土外小岛屿\\",\\"tr\\":\\"Abd Küçük Harici Adalari\\"}	0.00000000	0.00000000	🇺🇲	U+1F1FA U+1F1F2	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
235	Uruguay	URY	858	UY	598	Montevideo	UYU	Uruguayan peso	$	.uy	Uruguay	Americas	2	South America	8	Uruguayan	[{\\"zoneName\\":\\"America/Montevideo\\",\\"gmtOffset\\":-10800,\\"gmtOffsetName\\":\\"UTC-03:00\\",\\"abbreviation\\":\\"UYT\\",\\"tzName\\":\\"Uruguay Standard Time\\"}]	{\\"kr\\":\\"우루과이\\",\\"pt-BR\\":\\"Uruguai\\",\\"pt\\":\\"Uruguai\\",\\"nl\\":\\"Uruguay\\",\\"hr\\":\\"Urugvaj\\",\\"fa\\":\\"اروگوئه\\",\\"de\\":\\"Uruguay\\",\\"es\\":\\"Uruguay\\",\\"fr\\":\\"Uruguay\\",\\"ja\\":\\"ウルグアイ\\",\\"it\\":\\"Uruguay\\",\\"cn\\":\\"乌拉圭\\",\\"tr\\":\\"Uruguay\\"}	-33.00000000	-56.00000000	🇺🇾	U+1F1FA U+1F1FE	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q77
236	Uzbekistan	UZB	860	UZ	998	Tashkent	UZS	Uzbekistani soʻm	лв	.uz	O‘zbekiston	Asia	3	Central Asia	10	Uzbekistani, Uzbek	[{\\"zoneName\\":\\"Asia/Samarkand\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"UZT\\",\\"tzName\\":\\"Uzbekistan Time\\"},{\\"zoneName\\":\\"Asia/Tashkent\\",\\"gmtOffset\\":18000,\\"gmtOffsetName\\":\\"UTC+05:00\\",\\"abbreviation\\":\\"UZT\\",\\"tzName\\":\\"Uzbekistan Time\\"}]	{\\"kr\\":\\"우즈베키스탄\\",\\"pt-BR\\":\\"Uzbequistão\\",\\"pt\\":\\"Usbequistão\\",\\"nl\\":\\"Oezbekistan\\",\\"hr\\":\\"Uzbekistan\\",\\"fa\\":\\"ازبکستان\\",\\"de\\":\\"Usbekistan\\",\\"es\\":\\"Uzbekistán\\",\\"fr\\":\\"Ouzbékistan\\",\\"ja\\":\\"ウズベキスタン\\",\\"it\\":\\"Uzbekistan\\",\\"cn\\":\\"乌兹别克斯坦\\",\\"tr\\":\\"Özbekistan\\"}	41.00000000	64.00000000	🇺🇿	U+1F1FA U+1F1FF	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q265
237	Vanuatu	VUT	548	VU	678	Port Vila	VUV	Vanuatu vatu	VT	.vu	Vanuatu	Oceania	5	Melanesia	20	Ni-Vanuatu, Vanuatuan	[{\\"zoneName\\":\\"Pacific/Efate\\",\\"gmtOffset\\":39600,\\"gmtOffsetName\\":\\"UTC+11:00\\",\\"abbreviation\\":\\"VUT\\",\\"tzName\\":\\"Vanuatu Time\\"}]	{\\"kr\\":\\"바누아투\\",\\"pt-BR\\":\\"Vanuatu\\",\\"pt\\":\\"Vanuatu\\",\\"nl\\":\\"Vanuatu\\",\\"hr\\":\\"Vanuatu\\",\\"fa\\":\\"وانواتو\\",\\"de\\":\\"Vanuatu\\",\\"es\\":\\"Vanuatu\\",\\"fr\\":\\"Vanuatu\\",\\"ja\\":\\"バヌアツ\\",\\"it\\":\\"Vanuatu\\",\\"cn\\":\\"瓦努阿图\\",\\"tr\\":\\"Vanuatu\\"}	-16.00000000	167.00000000	🇻🇺	U+1F1FB U+1F1FA	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q686
238	Vatican City State (Holy See)	VAT	336	VA	379	Vatican City	EUR	Euro	€	.va	Vaticano	Europe	4	Southern Europe	16	Vatican	[{\\"zoneName\\":\\"Europe/Vatican\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"바티칸 시국\\",\\"pt-BR\\":\\"Vaticano\\",\\"pt\\":\\"Vaticano\\",\\"nl\\":\\"Heilige Stoel\\",\\"hr\\":\\"Sveta Stolica\\",\\"fa\\":\\"سریر مقدس\\",\\"de\\":\\"Heiliger Stuhl\\",\\"es\\":\\"Santa Sede\\",\\"fr\\":\\"voir Saint\\",\\"ja\\":\\"聖座\\",\\"it\\":\\"Santa Sede\\",\\"cn\\":\\"梵蒂冈\\",\\"tr\\":\\"Vatikan\\"}	41.90000000	12.45000000	🇻🇦	U+1F1FB U+1F1E6	2018-07-21 09:11:03	2023-08-11 17:45:55	1	Q237
239	Venezuela	VEN	862	VE	58	Caracas	VES	Bolívar	Bs	.ve	Venezuela	Americas	2	South America	8	Venezuelan	[{\\"zoneName\\":\\"America/Caracas\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"VET\\",\\"tzName\\":\\"Venezuelan Standard Time\\"}]	{\\"kr\\":\\"베네수엘라\\",\\"pt-BR\\":\\"Venezuela\\",\\"pt\\":\\"Venezuela\\",\\"nl\\":\\"Venezuela\\",\\"hr\\":\\"Venezuela\\",\\"fa\\":\\"ونزوئلا\\",\\"de\\":\\"Venezuela\\",\\"es\\":\\"Venezuela\\",\\"fr\\":\\"Venezuela\\",\\"ja\\":\\"ベネズエラ・ボリバル共和国\\",\\"it\\":\\"Venezuela\\",\\"cn\\":\\"委内瑞拉\\",\\"tr\\":\\"Venezuela\\"}	8.00000000	-66.00000000	🇻🇪	U+1F1FB U+1F1EA	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q717
241	Virgin Islands (British)	VGB	092	VG	+1-284	Road Town	USD	United States dollar	$	.vg	British Virgin Islands	Americas	2	Caribbean	7	British Virgin Island	[{\\"zoneName\\":\\"America/Tortola\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"영국령 버진아일랜드\\",\\"pt-BR\\":\\"Ilhas Virgens Britânicas\\",\\"pt\\":\\"Ilhas Virgens Britânicas\\",\\"nl\\":\\"Britse Maagdeneilanden\\",\\"hr\\":\\"Britanski Djevičanski Otoci\\",\\"fa\\":\\"جزایر ویرجین بریتانیا\\",\\"de\\":\\"Britische Jungferninseln\\",\\"es\\":\\"Islas Vírgenes del Reino Unido\\",\\"fr\\":\\"Îles Vierges britanniques\\",\\"ja\\":\\"イギリス領ヴァージン諸島\\",\\"it\\":\\"Isole Vergini Britanniche\\",\\"cn\\":\\"圣文森特和格林纳丁斯\\",\\"tr\\":\\"Britanya Virjin Adalari\\"}	18.43138300	-64.62305000	🇻🇬	U+1F1FB U+1F1EC	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
242	Virgin Islands (US)	VIR	850	VI	+1-340	Charlotte Amalie	USD	United States dollar	$	.vi	United States Virgin Islands	Americas	2	Caribbean	7	U.S. Virgin Island	[{\\"zoneName\\":\\"America/St_Thomas\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"미국령 버진아일랜드\\",\\"pt-BR\\":\\"Ilhas Virgens Americanas\\",\\"pt\\":\\"Ilhas Virgens Americanas\\",\\"nl\\":\\"Verenigde Staten Maagdeneilanden\\",\\"fa\\":\\"جزایر ویرجین آمریکا\\",\\"de\\":\\"Amerikanische Jungferninseln\\",\\"es\\":\\"Islas Vírgenes de los Estados Unidos\\",\\"fr\\":\\"Îles Vierges des États-Unis\\",\\"ja\\":\\"アメリカ領ヴァージン諸島\\",\\"it\\":\\"Isole Vergini americane\\",\\"cn\\":\\"维尔京群岛（美国）\\",\\"tr\\":\\"Abd Virjin Adalari\\"}	18.34000000	-64.93000000	🇻🇮	U+1F1FB U+1F1EE	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
243	Wallis And Futuna Islands	WLF	876	WF	681	Mata Utu	XPF	CFP franc	₣	.wf	Wallis et Futuna	Oceania	5	Polynesia	22	Wallis and Futuna, Wallisian or Futunan	[{\\"zoneName\\":\\"Pacific/Wallis\\",\\"gmtOffset\\":43200,\\"gmtOffsetName\\":\\"UTC+12:00\\",\\"abbreviation\\":\\"WFT\\",\\"tzName\\":\\"Wallis & Futuna Time\\"}]	{\\"kr\\":\\"왈리스 푸투나\\",\\"pt-BR\\":\\"Wallis e Futuna\\",\\"pt\\":\\"Wallis e Futuna\\",\\"nl\\":\\"Wallis en Futuna\\",\\"hr\\":\\"Wallis i Fortuna\\",\\"fa\\":\\"والیس و فوتونا\\",\\"de\\":\\"Wallis und Futuna\\",\\"es\\":\\"Wallis y Futuna\\",\\"fr\\":\\"Wallis-et-Futuna\\",\\"ja\\":\\"ウォリス・フツナ\\",\\"it\\":\\"Wallis e Futuna\\",\\"cn\\":\\"瓦利斯群岛和富图纳群岛\\",\\"tr\\":\\"Wallis Ve Futuna\\"}	-13.30000000	-176.20000000	🇼🇫	U+1F1FC U+1F1EB	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
244	Western Sahara	ESH	732	EH	212	El-Aaiun	MAD	Moroccan Dirham	MAD	.eh	الصحراء الغربية	Africa	1	Northern Africa	1	Sahrawi, Sahrawian, Sahraouian	[{\\"zoneName\\":\\"Africa/El_Aaiun\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"WEST\\",\\"tzName\\":\\"Western European Summer Time\\"}]	{\\"kr\\":\\"서사하라\\",\\"pt-BR\\":\\"Saara Ocidental\\",\\"pt\\":\\"Saara Ocidental\\",\\"nl\\":\\"Westelijke Sahara\\",\\"hr\\":\\"Zapadna Sahara\\",\\"fa\\":\\"جمهوری دموکراتیک عربی صحرا\\",\\"de\\":\\"Westsahara\\",\\"es\\":\\"Sahara Occidental\\",\\"fr\\":\\"Sahara Occidental\\",\\"ja\\":\\"西サハラ\\",\\"it\\":\\"Sahara Occidentale\\",\\"cn\\":\\"西撒哈拉\\",\\"tr\\":\\"Bati Sahra\\"}	24.50000000	-13.00000000	🇪🇭	U+1F1EA U+1F1ED	2018-07-21 09:11:03	2023-08-09 21:23:19	1	\N
245	Yemen	YEM	887	YE	967	Sanaa	YER	Yemeni rial	﷼	.ye	اليَمَن	Asia	3	Western Asia	11	Yemeni	[{\\"zoneName\\":\\"Asia/Aden\\",\\"gmtOffset\\":10800,\\"gmtOffsetName\\":\\"UTC+03:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Arabia Standard Time\\"}]	{\\"kr\\":\\"예멘\\",\\"pt-BR\\":\\"Iêmen\\",\\"pt\\":\\"Iémen\\",\\"nl\\":\\"Jemen\\",\\"hr\\":\\"Jemen\\",\\"fa\\":\\"یمن\\",\\"de\\":\\"Jemen\\",\\"es\\":\\"Yemen\\",\\"fr\\":\\"Yémen\\",\\"ja\\":\\"イエメン\\",\\"it\\":\\"Yemen\\",\\"cn\\":\\"也门\\",\\"tr\\":\\"Yemen\\"}	15.00000000	48.00000000	🇾🇪	U+1F1FE U+1F1EA	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q805
246	Zambia	ZMB	894	ZM	260	Lusaka	ZMW	Zambian kwacha	ZK	.zm	Zambia	Africa	1	Eastern Africa	4	Zambian	[{\\"zoneName\\":\\"Africa/Lusaka\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"CAT\\",\\"tzName\\":\\"Central Africa Time\\"}]	{\\"kr\\":\\"잠비아\\",\\"pt-BR\\":\\"Zâmbia\\",\\"pt\\":\\"Zâmbia\\",\\"nl\\":\\"Zambia\\",\\"hr\\":\\"Zambija\\",\\"fa\\":\\"زامبیا\\",\\"de\\":\\"Sambia\\",\\"es\\":\\"Zambia\\",\\"fr\\":\\"Zambie\\",\\"ja\\":\\"ザンビア\\",\\"it\\":\\"Zambia\\",\\"cn\\":\\"赞比亚\\",\\"tr\\":\\"Zambiya\\"}	-15.00000000	30.00000000	🇿🇲	U+1F1FF U+1F1F2	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q953
247	Zimbabwe	ZWE	716	ZW	263	Harare	ZWL	Zimbabwe Dollar	$	.zw	Zimbabwe	Africa	1	Eastern Africa	4	Zimbabwean	[{\\"zoneName\\":\\"Africa/Harare\\",\\"gmtOffset\\":7200,\\"gmtOffsetName\\":\\"UTC+02:00\\",\\"abbreviation\\":\\"CAT\\",\\"tzName\\":\\"Central Africa Time\\"}]	{\\"kr\\":\\"짐바브웨\\",\\"pt-BR\\":\\"Zimbabwe\\",\\"pt\\":\\"Zimbabué\\",\\"nl\\":\\"Zimbabwe\\",\\"hr\\":\\"Zimbabve\\",\\"fa\\":\\"زیمباوه\\",\\"de\\":\\"Simbabwe\\",\\"es\\":\\"Zimbabue\\",\\"fr\\":\\"Zimbabwe\\",\\"ja\\":\\"ジンバブエ\\",\\"it\\":\\"Zimbabwe\\",\\"cn\\":\\"津巴布韦\\",\\"tr\\":\\"Zimbabve\\"}	-20.00000000	30.00000000	🇿🇼	U+1F1FF U+1F1FC	2018-07-21 09:11:03	2023-08-09 21:23:19	1	Q954
248	Kosovo	XKX	926	XK	383	Pristina	EUR	Euro	€	.xk	Republika e Kosovës	Europe	4	Eastern Europe	15	Kosovar, Kosovan	[{\\"zoneName\\":\\"Europe/Belgrade\\",\\"gmtOffset\\":3600,\\"gmtOffsetName\\":\\"UTC+01:00\\",\\"abbreviation\\":\\"CET\\",\\"tzName\\":\\"Central European Time\\"}]	{\\"kr\\":\\"코소보\\",\\"cn\\":\\"科索沃\\",\\"tr\\":\\"Kosova\\"}	42.56129090	20.34030350	🇽🇰	U+1F1FD U+1F1F0	2020-08-16 04:33:50	2023-08-11 17:46:28	1	Q1246
249	Curaçao	CUW	531	CW	599	Willemstad	ANG	Netherlands Antillean guilder	ƒ	.cw	Curaçao	Americas	2	Caribbean	7	Curacaoan	[{\\"zoneName\\":\\"America/Curacao\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"퀴라소\\",\\"pt-BR\\":\\"Curaçao\\",\\"pt\\":\\"Curaçao\\",\\"nl\\":\\"Curaçao\\",\\"fa\\":\\"کوراسائو\\",\\"de\\":\\"Curaçao\\",\\"fr\\":\\"Curaçao\\",\\"it\\":\\"Curaçao\\",\\"cn\\":\\"库拉索\\",\\"tr\\":\\"Curaçao\\"}	12.11666700	-68.93333300	🇨🇼	U+1F1E8 U+1F1FC	2020-10-26 02:54:20	2023-08-11 17:45:55	1	Q25279
250	Sint Maarten (Dutch part)	SXM	534	SX	1721	Philipsburg	ANG	Netherlands Antillean guilder	ƒ	.sx	Sint Maarten	Americas	2	Caribbean	7	Sint Maarten	[{\\"zoneName\\":\\"America/Anguilla\\",\\"gmtOffset\\":-14400,\\"gmtOffsetName\\":\\"UTC-04:00\\",\\"abbreviation\\":\\"AST\\",\\"tzName\\":\\"Atlantic Standard Time\\"}]	{\\"kr\\":\\"신트마르턴\\",\\"pt-BR\\":\\"Sint Maarten\\",\\"pt\\":\\"São Martinho\\",\\"nl\\":\\"Sint Maarten\\",\\"fa\\":\\"سینت مارتن\\",\\"de\\":\\"Sint Maarten (niederl. Teil)\\",\\"fr\\":\\"Saint Martin (partie néerlandaise)\\",\\"it\\":\\"Saint Martin (parte olandese)\\",\\"cn\\":\\"圣马丁岛（荷兰部分）\\",\\"tr\\":\\"Sint Maarten\\"}	18.03333300	-63.05000000	🇸🇽	U+1F1F8 U+1F1FD	2020-12-06 01:03:39	2023-08-09 21:23:19	1	Q26273
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, course_code, course_name, credit_hours, student_id) FROM stdin;
\.


--
-- Data for Name: email_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_template (id, subject, body) FROM stdin;
3	Approval process for Inbound application 	<p>salam {recipientName}</p>\r\n<p>please take a look at this: <a href="{link}">Click here!</a></p>
4	Issue offer letter to applicant	<p>Salam {recipientName}</p>\r\n<p>please issue an offer letter for this applicant <a href="{link}">Click here!</a></p>
11	Reconsideration	<p>alsalam {recipientName}</p>\r\n<p>please reconsider this applicant bcasue of {reason}</p>\r\n<p><a href="{link}">chick here!</a></p>
8	Upload documents before leaving Malaysia 	<p>Dear Student {recipientName}</p>\r\n<p>Kindly prepare and upload the following files:</p>\r\n<p style="margin-left: 39.0pt; text-indent: -.25in; mso-list: l0 level1 lfo1;"><!-- [if !supportLists]--><span style="font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;"><span style="mso-list: Ignore;">&middot;<span style="font: 7.0pt 'Times New Roman';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Passport</p>\r\n<p style="margin-left: 39.0pt; text-indent: -.25in; mso-list: l0 level1 lfo1;"><!-- [if !supportLists]--><span style="font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;"><span style="mso-list: Ignore;">&middot;<span style="font: 7.0pt 'Times New Roman';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Flight ticket</p>
6	Matriculate applicant and email Pin No to applicant 	6
5	Upload proof of payment	5
9	Upload documents before return back to Malaysia	<p>Dear {recipientName}</p>\r\n<p>login to your account and upload your images and videos&nbsp;<br>upload all files into google drive-&gt; share the link and make sure visibility is for everyone</p>
7	Approval process for Outbound application 	<p>Salam {recipientName}</p>\r\n<p>please {recipientName} take a look <a href="{link}">for approval please click here!!!!!!!!!!!!</a></p>
10	Congrats	0
2	Application Rejected	<p><span style="background-color: rgb(230, 126, 35); color: rgb(186, 55, 42);">hello {recipientName}</span></p>\r\n<p><span style="background-color: rgb(230, 126, 35); color: rgb(186, 55, 42);">sorry your application has been rejected</span></p>\r\n<p>{reason}</p>
1	Incomplete Application	<p>السلام عليكم ورحمة الله وبركاته&nbsp;<br><br></p>\r\n<p>Dear {recipientName}</p>\r\n<p>please be informaed that your application is not complete<br>&nbsp;becasue: {reason}<br>best regards</p>
\.


--
-- Data for Name: iiumcourse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iiumcourse (id, course_code, course_name, credit_hours, student_id) FROM stdin;
412	\N	\N	1	29
413	\N	\N	1	29
414	\N	\N	1	29
415	\N	\N	1	29
2	1	1	1	29
1	1	1	1	29
\.


--
-- Data for Name: in_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.in_courses (id, course_code, course_name, credit_hours, student_id) FROM stdin;
\.


--
-- Data for Name: inbound; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inbound ("ID", "Name", "Gender", "Relation_ship", "Date_of_Birth", "Passport_Number", "Passport_Expiration", "Religion", "Mazhab", "Citizenship", "Country_of_origin", "Country_of_residence", "Mobile_Number", "Email_address", "Permanent_Address", "Postcode", "Country", "Emergency_name", "Emergency_relationship", "Emergency_phoneNumber", "Emergency_email", "Emergency_homeAddress", "Emergency_postCode", "Emergency_country", "Academic_home_university", "Academic_lvl_edu", "Academic_name_of_programme", "Academic_current_semester", "Academic_current_year", "Academic_name_of_faculty", "Academic_current_result", "Research_title", "Mou_or_Moa", "English_native", "English_test_name", "English_other_test_name", "English_certificate", "Propose_type_of_programme", "Propose_type_of_programme_other", "Propose_type_of_mobility", "Propose_kulliyyah_applied", "Propose_duration_of_study", "Propose_duration_start", "Propose_duration_end", "Propose_transfer_credit_hours", "Financial_accommodation_on_campus", campus_location, "Financial_funding", "Sponsor_name", "Room_type", "Financial_funding_sponsor_amount", "Financial_funding_other", "Approval_university_person_name", "Approval_person_position", "Approval_person_email", "Approval_person_mobile_number", "Approval_date", "Recommendation_letter", "Student_declaration_name", "Student_declaration_date", "Student_declaration_agreement", "Passport", "Latest_passport_photo", "Latest_certified_academic_transcript", "Confirmation_letter", "Sponsorship_letter", "Status", "Kulliyyah", msd_cps, note_kulliyyah, note_msd_cps, "Token", updated_at, created_at, offer_letter, reference_number, temp, proof_of_payment) FROM stdin;
7	hadeel Abd Alkader Hamo	M	Married	1998-09-13	1915552	2028-11-25	Islam	Sunni	Syrian                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	215	215	0193079894	lina24lolo24@gmail.com	salahaldeen/aleppo/syria	00000	215	Fatimah alzahraa	Firend	0951979810	fatima@gmail.com	halab aljadiddah/ aleppo/ syria	00000	215	Aleppo University	Degree	APPLIT UNIVERSITY	2	2	Faculty of  Engineering	4	A BIBLIOMETRIC ANALYSIS OF CHEMICAL ENGINEERING RESEARCH USING VOSVIEWER AND ITS CORRELATION WITH COVID-19 PANDEMIC CONDITION	1	0	TOFEL	asdflkj	\\x62696e6172792064617461	Mevlana Exchange Program		2		Others	2024-01-25	2024-02-25	\N	1	Kuantan Campus, IIUMKuantan	Self-sponsor		Single Room(for PG Students) RM360/Month	\N		John Alagaratnam	Teacher	asdf@gmail.com	01951979810	2023-12-11	\\x62696e6172792064617461	\N	\N	1	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	65	6	6	<p>testing rejections&nbsp;<br><span style="color: rgb(53, 152, 219);"><em><span style="text-decoration: underline;"><strong>BUTTON</strong></span></em></span></p>	\N	\N	2024-01-17 10:28:08	2024-01-17 14:57:34	\\x62696e6172792064617461	\N	<p>Testing resending <em><span style="text-decoration: underline;"><strong>BUTTON</strong></span></em></p>	24_32_proof_of_payment.pdf
9	hadeel Abd Alkader Hamo	M	Married	1998-09-13	1915552	2028-11-25	Islam	Sunni	Syrian                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	215	215	0193079894	lina24lolo24@gmail.com	salahaldeen/aleppo/syria	00000	215	Fatimah alzahraa	Firend	0951979810	fatima@gmail.com	halab aljadiddah/ aleppo/ syria	00000	215	Aleppo University	Degree	APPLIT UNIVERSITY	2	2	Faculty of  Engineering	4	A BIBLIOMETRIC ANALYSIS OF CHEMICAL ENGINEERING RESEARCH USING VOSVIEWER AND ITS CORRELATION WITH COVID-19 PANDEMIC CONDITION	1	0	TOFEL	asdflkj	\\x62696e6172792064617461	Mevlana Exchange Program		2		Others	2024-01-25	2024-02-25	\N	1	Kuantan Campus, IIUMKuantan	Self-sponsor		Single Room(for PG Students) RM360/Month	\N		John Alagaratnam	Teacher	asdf@gmail.com	01951979810	2023-12-11	\\x62696e6172792064617461	\N	\N	1	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	65	6	6	<p>testing rejections&nbsp;<br><span style="color: rgb(53, 152, 219);"><em><span style="text-decoration: underline;"><strong>BUTTON</strong></span></em></span></p>	\N	\N	2024-01-17 10:28:08	2024-01-17 14:57:34	\\x62696e6172792064617461	\N	<p>Testing resending <em><span style="text-decoration: underline;"><strong>BUTTON</strong></span></em></p>	24_32_proof_of_payment.pdf
10	hadeel Abd Alkader Hamo	M	Married	1998-09-13	1915552	2028-11-25	Islam	Sunni	Syrian                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	215	215	0193079894	lina24lolo24@gmail.com	salahaldeen/aleppo/syria	00000	215	Fatimah alzahraa	Firend	0951979810	fatima@gmail.com	halab aljadiddah/ aleppo/ syria	00000	215	Aleppo University	Degree	APPLIT UNIVERSITY	2	2	Faculty of  Engineering	4	A BIBLIOMETRIC ANALYSIS OF CHEMICAL ENGINEERING RESEARCH USING VOSVIEWER AND ITS CORRELATION WITH COVID-19 PANDEMIC CONDITION	1	0	TOFEL	asdflkj	\\x62696e6172792064617461	Mevlana Exchange Program		2		Others	2024-01-25	2024-02-25	\N	1	Kuantan Campus, IIUMKuantan	Self-sponsor		Single Room(for PG Students) RM360/Month	\N		John Alagaratnam	Teacher	asdf@gmail.com	01951979810	2023-12-11	\\x62696e6172792064617461	\N	\N	1	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	65	6	6	<p>testing rejections&nbsp;<br><span style="color: rgb(53, 152, 219);"><em><span style="text-decoration: underline;"><strong>BUTTON</strong></span></em></span></p>	\N	\N	2024-01-17 10:28:08	2024-01-17 14:57:34	\\x62696e6172792064617461	\N	<p>Testing resending <em><span style="text-decoration: underline;"><strong>BUTTON</strong></span></em></p>	24_32_proof_of_payment.pdf
12	hadeel Abd Alkader Hamo	M	Married	1998-09-13	1915552	2028-11-25	Islam	Sunni	Syrian                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	215	215	0193079894	lina24lolo24@gmail.com	salahaldeen/aleppo/syria	00000	215	Fatimah alzahraa	Firend	0951979810	fatima@gmail.com	halab aljadiddah/ aleppo/ syria	00000	215	Aleppo University	Degree	APPLIT UNIVERSITY	2	2	Faculty of  Engineering	4	A BIBLIOMETRIC ANALYSIS OF CHEMICAL ENGINEERING RESEARCH USING VOSVIEWER AND ITS CORRELATION WITH COVID-19 PANDEMIC CONDITION	1	0	TOFEL	asdflkj	\\x62696e6172792064617461	Mevlana Exchange Program		2		Others	2024-01-25	2024-02-25	\N	1	Kuantan Campus, IIUMKuantan	Self-sponsor		Single Room(for PG Students) RM360/Month	\N		John Alagaratnam	Teacher	asdf@gmail.com	01951979810	2023-12-11	\\x62696e6172792064617461	\N	\N	1	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	65	6	6	<p>testing rejections&nbsp;<br><span style="color: rgb(53, 152, 219);"><em><span style="text-decoration: underline;"><strong>BUTTON</strong></span></em></span></p>	\N	\N	2024-01-17 10:28:08	2024-01-17 14:57:34	\\x62696e6172792064617461	\N	<p>Testing resending <em><span style="text-decoration: underline;"><strong>BUTTON</strong></span></em></p>	24_32_proof_of_payment.pdf
13	hadeel Abd Alkader Hamo	M	Married	1998-09-13	1915552	2028-11-25	Islam	Sunni	Syrian                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	215	215	0193079894	lina24lolo24@gmail.com	salahaldeen/aleppo/syria	00000	215	Fatimah alzahraa	Firend	0951979810	fatima@gmail.com	halab aljadiddah/ aleppo/ syria	00000	215	Aleppo University	Degree	APPLIT UNIVERSITY	2	2	Faculty of  Engineering	4	A BIBLIOMETRIC ANALYSIS OF CHEMICAL ENGINEERING RESEARCH USING VOSVIEWER AND ITS CORRELATION WITH COVID-19 PANDEMIC CONDITION	1	0	TOFEL	asdflkj	\\x62696e6172792064617461	Mevlana Exchange Program		2		Others	2024-01-25	2024-02-25	\N	1	Kuantan Campus, IIUMKuantan	Self-sponsor		Single Room(for PG Students) RM360/Month	\N		John Alagaratnam	Teacher	asdf@gmail.com	01951979810	2023-12-11	\\x62696e6172792064617461	\N	\N	1	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	5	6	6	<p>rejected</p>	\N	8wgvPLEaQZnNhUkWSJIM8gjWW_gqyoA1	2024-02-01 07:52:18	2024-01-17 14:57:34	\\x313732353633352059616d656e20416c7a6569746572202d20417474656e64616e6365204c65747465722e706466		<p>Testing resending <em><span style="text-decoration: underline;"><strong>BUTTON</strong></span></em></p>	24_32_proof_of_payment.pdf
\.


--
-- Data for Name: inlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inlog (id, outbound_id, old_status, new_status, message, created_at, updated_at) FROM stdin;
185	13	0	10	Application has been submitted	2024-02-01 09:20:18	\N
186	13	10	5	\N	2024-02-01 09:20:25	\N
187	13	5	15	\N	2024-02-01 10:17:08	\N
188	13	15	25	\N	2024-02-01 10:17:45	\N
189	13	25	35	\N	2024-02-01 10:24:26	\N
190	13	35	45	\N	2024-02-01 10:28:31	\N
191	13	0	10	Application has been submitted	2024-02-01 10:30:42	\N
192	13	10	5	\N	2024-02-01 10:33:05	\N
193	13	5	16	<p>rejected</p>	2024-02-01 10:33:23	\N
194	13	0	10	Application has been submitted	2024-02-01 11:18:49	\N
195	13	10	5	\N	2024-02-01 11:18:54	\N
196	13	5	15	\N	2024-02-01 11:19:10	\N
197	13	15	16	\N	2024-02-01 12:16:57	\N
198	13	0	10	Application has been submitted	2024-02-01 12:42:00	\N
199	13	10	5	\N	2024-02-01 12:42:07	\N
200	13	5	16	\N	2024-02-01 12:43:07	\N
201	13	16	5	\N	2024-02-01 14:52:18	\N
171	13	0	10	Application has been submitted	2024-01-31 14:12:53	\N
172	13	10	5	\N	2024-01-31 14:13:00	\N
\.


--
-- Data for Name: kcdio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kcdio (id, kcdio) FROM stdin;
1	KICT
2	KIRKHS
3	KENMS
4	AIKOL
5	KOE
6	KOM
7	KAED
8	KOS
9	KOP
10	KAHS
11	ISTAC
12	KOED
13	KON
14	KOD
15	IIiBF
16	KLM
\.


--
-- Data for Name: log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log (id, outbound_id, old_status, new_status, message, updated_at, created_at) FROM stdin;
527	29	0	10	Application has been submitted	\N	2024-01-30 17:27:14
528	29	10	1	\N	\N	2024-01-30 17:27:19
529	29	1	11	\N	\N	2024-01-30 17:27:34
530	29	11	21	\N	\N	2024-01-30 17:27:41
531	29	21	32	<p>sssssssssssssssss</p>	\N	2024-01-30 17:27:58
532	29	32	21	<p>sssssssssssssssssss</p>	\N	2024-01-30 17:32:44
533	29	21	32	<p>ffffffffffffffff</p>	\N	2024-01-30 17:33:00
534	29	32	21	<p>rrrrrrrrrrr</p>	\N	2024-01-30 17:33:09
535	29	21	31	\N	\N	2024-01-30 17:33:17
536	29	31	41	\N	\N	2024-01-30 17:34:00
537	29	0	10	Application has been submitted	\N	2024-01-31 09:06:07
538	29	10	3	<p>rrrrrrrrrrr</p>	\N	2024-01-31 09:06:15
539	29	0	10	Application has been resubmitted	\N	2024-01-31 09:15:26
540	29	10	2	<p>not good</p>	\N	2024-01-31 09:15:33
541	29	0	10	Application has been submitted	\N	2024-01-31 09:16:44
542	29	10	3	<p>not complete</p>	\N	2024-01-31 09:16:50
543	29	0	10	Application has been resubmitted	\N	2024-01-31 09:17:27
544	29	10	1	\N	\N	2024-01-31 09:17:36
545	29	1	12	<p>NOT GOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOD</p>	\N	2024-01-31 09:17:58
546	29	12	1	<p>ACCEPTING</p>\r\n<p>&nbsp;</p>	\N	2024-01-31 09:18:48
547	29	1	11	\N	\N	2024-01-31 09:18:58
548	29	11	21	\N	\N	2024-01-31 09:19:06
549	29	21	32	<p>NOTTTTTTTTTTTTTTTTTTT GOOOOD!!!!!!@#$%r</p>	\N	2024-01-31 09:19:30
550	29	32	21	<p>RECONSIDARAATION !@#$%</p>	\N	2024-01-31 09:19:52
551	29	21	31	\N	\N	2024-01-31 09:22:57
552	29	0	10	Application has been submitted	\N	2024-01-31 09:26:58
553	29	10	1	\N	\N	2024-01-31 09:27:05
554	29	0	10	Application has been submitted	\N	2024-01-31 09:28:53
555	29	10	1	\N	\N	2024-01-31 09:29:02
556	29	0	10	Application has been submitted	\N	2024-01-31 09:32:00
471	29	0	10	Application has been submitted	\N	2024-01-30 09:34:44
557	29	10	1	\N	\N	2024-01-31 09:32:05
473	29	0	10	Application has been submitted	\N	2024-01-30 10:56:47
558	29	1	11	\N	\N	2024-01-31 09:33:02
559	29	0	10	Application has been submitted	\N	2024-01-31 09:33:07
560	29	10	1	\N	\N	2024-01-31 09:33:12
561	29	0	10	Application has been submitted	\N	2024-01-31 09:36:12
562	29	10	1	\N	\N	2024-01-31 09:36:18
563	29	1	12	<p>nto good</p>\r\n<p>&nbsp;</p>	\N	2024-01-31 09:36:57
564	29	12	1	<p>no good</p>\r\n<p>&nbsp;</p>	\N	2024-01-31 09:37:12
481	29	0	10	Application has been submitted	\N	2024-01-30 15:19:03
565	29	0	10	Application has been submitted	\N	2024-01-31 09:41:06
566	29	10	2	<p>you are not good&nbsp;</p>\r\n<p>&nbsp;</p>	\N	2024-01-31 09:41:16
484	29	0	10	Application has been submitted	\N	2024-01-30 15:22:41
567	29	0	10	Application has been submitted	\N	2024-01-31 09:41:31
568	29	10	3	<p>you are not good&nbsp;</p>\r\n<p>&nbsp;</p>	\N	2024-01-31 09:41:41
487	29	0	10	Application has been submitted	\N	2024-01-30 15:52:14
569	29	0	10	Application has been resubmitted	\N	2024-01-31 09:43:37
570	29	10	3	<p>you are not complete</p>	\N	2024-01-31 09:43:46
571	29	0	10	Application has been resubmitted	\N	2024-01-31 09:45:02
572	29	10	1	\N	\N	2024-01-31 09:45:08
573	29	1	12	<p>not good enough</p>	\N	2024-01-31 09:46:35
493	29	0	10	Application has been submitted	\N	2024-01-30 16:00:50
574	29	12	1	<p>you are not complete</p>	\N	2024-01-31 09:48:12
575	29	0	10	Application has been submitted	\N	2024-01-31 09:50:08
576	29	10	1	\N	\N	2024-01-31 09:50:13
577	29	0	10	Application has been submitted	\N	2024-01-31 09:55:04
578	29	10	3	<p>your applicatoin is not commplete</p>	\N	2024-01-31 09:57:38
579	29	0	10	Application has been resubmitted	\N	2024-01-31 10:29:12
580	29	10	1	\N	\N	2024-01-31 10:43:31
501	29	0	10	Application has been submitted	\N	2024-01-30 16:20:02
581	29	0	10	Application has been submitted	\N	2024-01-31 10:56:36
582	29	10	1	\N	\N	2024-01-31 10:56:41
583	29	1	11	\N	\N	2024-01-31 10:57:02
584	29	0	10	Application has been submitted	\N	2024-01-31 11:32:32
585	29	10	2	<p>reject</p>\r\n<p>&nbsp;</p>	\N	2024-01-31 11:32:38
586	29	0	10	Application has been submitted	\N	2024-01-31 11:32:53
508	29	51	41	<p>not complete</p>\r\n<p>&nbsp;</p>	\N	2024-01-30 16:37:16
587	29	10	3	<p>not complete</p>	\N	2024-01-31 11:33:00
588	29	0	10	Application has been resubmitted	\N	2024-01-31 11:33:21
511	29	0	10	Application has been submitted	\N	2024-01-30 16:45:10
512	29	10	2	<p>test 1234</p>\r\n<p>&nbsp;</p>	\N	2024-01-30 16:45:17
513	29	0	10	Application has been submitted	\N	2024-01-30 16:49:35
514	29	10	2	<p>test 1234</p>\r\n<p>&nbsp;</p>	\N	2024-01-30 16:49:41
515	29	0	10	Application has been submitted	\N	2024-01-30 16:53:24
516	29	10	3	<p>test4321</p>\r\n<p>&nbsp;</p>	\N	2024-01-30 16:53:32
517	29	0	10	Application has been resubmitted	\N	2024-01-30 17:06:13
589	29	10	1	\N	\N	2024-01-31 11:33:26
519	29	0	10	Application has been submitted	\N	2024-01-30 17:09:29
590	29	1	12	<p>rejected</p>	\N	2024-01-31 11:33:48
521	29	0	10	Application has been submitted	\N	2024-01-30 17:12:30
591	29	12	1	<p>resend</p>	\N	2024-01-31 11:34:32
523	29	1	12	<p>kkkkkkkkkkkk</p>	\N	2024-01-30 17:13:22
524	29	12	1	<p>kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk</p>	\N	2024-01-30 17:15:30
525	29	1	12	<p>sssssssssssssssssssssssssssssssssssssss</p>	\N	2024-01-30 17:15:41
526	29	12	1	<p>ffffffffffffffffffff</p>	\N	2024-01-30 17:15:51
592	29	1	11	\N	\N	2024-01-31 11:34:44
593	29	11	21	\N	\N	2024-01-31 11:34:53
594	29	21	32	<p>reject</p>	\N	2024-01-31 11:35:05
595	29	32	21	<p>resending</p>	\N	2024-01-31 11:39:10
596	29	21	31	\N	\N	2024-01-31 11:39:33
597	29	31	41	\N	\N	2024-01-31 11:44:08
598	29	41	51	\N	\N	2024-01-31 11:44:37
599	29	51	41	<p>incomplete</p>	\N	2024-01-31 11:45:10
600	29	41	51	\N	\N	2024-01-31 11:45:33
601	29	51	61	\N	\N	2024-01-31 11:45:46
602	29	61	71	\N	\N	2024-01-31 11:46:25
603	29	71	81	\N	\N	2024-01-31 11:47:22
604	29	81	51	\N	\N	2024-01-31 12:37:09
605	29	51	61	\N	\N	2024-01-31 12:37:13
606	29	61	51	\N	\N	2024-01-31 12:37:43
607	29	51	61	\N	\N	2024-01-31 12:37:46
608	29	61	71	\N	\N	2024-02-01 10:52:05
609	29	0	10	Application has been submitted	\N	2024-02-01 11:16:58
610	29	10	1	\N	\N	2024-02-01 11:17:52
611	29	1	11	\N	\N	2024-02-01 11:18:18
612	29	11	12	\N	\N	2024-02-01 11:51:32
613	86	81	32	\N	\N	2024-02-01 11:54:09
614	86	0	10	Application has been submitted	\N	2024-02-01 12:40:17
615	86	10	1	\N	\N	2024-02-01 12:40:22
616	86	1	12	\N	\N	2024-02-01 12:43:29
617	86	0	10	Application has been submitted	\N	2024-02-01 14:19:02
618	29	12	32	\N	\N	2024-02-01 14:20:33
619	29	32	21	\N	\N	2024-02-01 14:20:44
\.


--
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migration (version, apply_time) FROM stdin;
m000000_000000_base	1700903742
m130524_201442_init	1700903746
m190124_110200_add_verification_token_column_to_user_table	1700903746
m231126_030545_create_inbound_table	1700974378
m231126_031640_create_outbound_table	1700974378
m231126_041730_create_kcdio_table	1700974378
m231126_041956_create_poc_table	1700974378
m231126_042305_create_courses_table	1700974378
m231126_042322_create_iiumcourses_table	1700974378
m231126_042656_create_Status_table	1700974378
m231126_042929_create_user_admin_table	1700974378
m140506_102106_rbac_init	1700977239
m170907_052038_rbac_add_index_on_auth_assignment_user_id	1700977239
m180523_151638_rbac_updates_indexes_without_prefix	1700977239
m200409_110543_rbac_update_mssql_trigger	1700977239
m231128_124547_create_add_token_table	1701175617
m231204_025430_create_host_email_column	1701658640
m231206_011256_create_email_template_column	1701825283
m231213_064744_create_alter_matric_number	1702450156
m231214_043413_create_status_log_table	1702529595
m231214_062229_create_log_table	1702535132
m231214_084620_create_inlog_table	1702543682
m231219_011048_add_temp_column	1702948279
m231219_013427_add_temp_column_for_inbound	1702949685
m231226_140519_user_new_column	1703639044
m231227_034209_create_inBound_course_table	1703648660
m231227_042435_add_status_column_table	1703661748
m231227_075526_add_status_column_type_table	1703663796
m240104_034521_create_new_column_outbound	1704340040
m240116_004016_create_outFiles_table	1705365697
\.


--
-- Data for Name: outFiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."outFiles" ("ID", "Student_ID", location, created_at) FROM stdin;
84	29	24_29_File_1.png	\N
85	29	24_29_File_2.pdf	\N
86	29	24_29_File_3.pdf	\N
87	29	24_29_File_4.pdf	\N
88	29	24_29_File_5.pdf	\N
\.


--
-- Data for Name: outbound; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.outbound ("ID", "Status", "Matric_Number", "Name", "Citizenship", "Gender", "Date_of_Birth", "Passport_Number", "Passport_Expiration", "Mobile_Number", "Email", "Permanent_Address", "Postcode", "State", "Country", "Mailing_Address", "Mailing_Postcode", "Mailing_State", "Mailing_Country", "Dean_ID", "Person_in_charge_ID", "Note_dean", "Note_hod", "Emergency_name", "Emergency_relationship", "Emergency_phoneNumber", "Emergency_email", "Emergency_homeAddress", "Emergency_postCode", "Emergency_tate", "Emergency_country", "Academic_lvl_edu", "Academic_kulliyyah", "Academic_kulliyyah_others", "Academic_current_semester", "Academic_current_year", "Academic_name_of_programme", "Academic_cgpa", "Research", "English_language_proficiency", "English_result", "Third_language", "Financial_funded_accept", "Sponsoring_name", "Sponsoring_name_other", "Sponsoring_funding", "Type_mobility", "Type_mobility_program", "Type_mobility_program_other", "Host_university_name", "Mobility_from", "Mobility_until", "Country_host_university", credit_transfer_availability, "Connect_host_name", "Connect_host_position", "Connect_host_mobile_number", "Connect_host_address", "Connect_host_postcode", "Connect_host_country", host_scholarship, host_scholarship_amount, "Offer_letter", "Academic_transcript", "Program_brochure", "Latest_pay_slip", "Other_latest_pay_slip", "Proof_of_sponsorship", "Proof_insurance_cover", "Letter_of_indemnity", "Flight_ticket", agreement_data, agreement, updated_at, created_at, "Token", "Connect_host_email", temp, "driveLink") FROM stdin;
38	10	1111111	Adnan binti Nordin	Malaysian	F	2000-02-02	01544723	2030-11-30	01987654322	yamen.zaiter24@gmail.com	 SMK Danau Kota, Lot 21750, Jalan Danau Saujana 1	21750	1949	132	 SMK Danau Kota, Lot 21750, Jalan Danau Saujana 1	21750	1949	132	\N	\N	\N	\N	nour aini binti aini	Friend	0125347895	nour@gmail.com	SMK Danau Kota, Lot 21750, Jalan Danau Saujana 1	53000	1949	132	UG	KICT		4	6	mechatronic	3.6	\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t	TOFEL	7.5		1	OTHERS		20000	1	Erasmus+ Exchange Program	qe1234	Aleppo University	2024-01-30	2024-07-01	215	1	Khoder Khoder	Lecturer	+963944412122	aleppo/syria	00000	215	0	1234	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\N	\N	\N	\N	\N	1	2024-01-18 12:23:16	2023-01-18 09:32:35	\N	khoderkhoder@gmail.com	<p>testing2</p>	\N
86	10	1725635	Yamen Alzeiter	Syrian	M	1998-09-13	01911999	2025-02-05	0193079894	yamen.zaiter24@gmail.com	mahallah zubair/iium/gombak/53100/kuala lumpur/malaysia	53100	1949	132	mahallah zubair/iium/gombak/53100/kuala lumpur/malaysia	53100	1949	132	6	6	<p>the<br><span style="font-size: 14pt;">file</span><br><span style="font-size: 18pt;">is&nbsp;</span><br><span style="font-size: 24pt;">messing&nbsp;</span></p>	<p>the application is missing file, rejected,</p>\r\n<p>in case you know what file i'm talking about then the applicant is approved&nbsp;</p>	Khoder Khoder	Friend	0944412122	doublekhoder@gmail.com	دوار كراج عفرين, Ma’arrat al-Artik, Syria	00000	2946	215	PG	KICT		5	4	Digital Media Design	3.3	\t\t\t\t\t\t\t\t\t\t\t\t\t\tInformation seeking behaviour of postgraduate students from Eduardo Mondlane University, Medicine Faculty	IELTS	5.5		0	OTHERS		0	1	Mevlana Exchange Program		Universitry 	2024-01-01	2024-01-30	56	1	Nouri	Lecturer	978465132	FAbrica y L. del Ferroc. Luy, Alquizar,Cuba	26	56	0	0	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\N	1	2024-02-01 14:19:02	2024-01-17 09:12:22	GM942Qdp9QGCIP1JjksIfT_3LDLCOvZq	nouri@gmail.com	<p>adslfasdf</p>	\N
29	21	1725635	Yamen Alzeiter	Syrian	M	1998-09-13	01911999	2025-02-05	0193079894	yamen.zaiter24@gmail.com	mahallah zubair/iium/gombak/53100/kuala lumpur/malaysia	53100	1949	132	mahallah zubair/iium/gombak/53100/kuala lumpur/malaysia	53100	1949	132	6	6	<p>reject</p>	<p>rejected</p>	Khoder Khoder	Friend	0944412122	doublekhoder@gmail.com	دوار كراج عفرين, Ma’arrat al-Artik, Syria	00000	2946	215	PG	KICT		5	4	Digital Media Design	3.3	\t\t\t\t\t\t\t\t\t\t\t\t\t\tInformation seeking behaviour of postgraduate students from Eduardo Mondlane University, Medicine Faculty	IELTS	5.5		0	OTHERS		0	1	Mevlana Exchange Program		Universitry 	2024-01-01	2024-01-30	56	1	Nouri	Lecturer	978465132	FAbrica y L. del Ferroc. Luy, Alquizar,Cuba	26	56	0	0	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x62696e6172792064617461	\\x32345f32395f50726f6f664f6653706f6e736f72736869702e706466	\\x32345f32395f50726f6f66496e737572616e6365436f7665722e706466	\\x32345f32395f4c65747465724f66496e64656d6e6974792e706466	\\x32345f32395f46696c655f352e706466	\N	1	2024-02-01 14:20:44	2024-01-17 09:12:22	\N	nouri@gmail.com	<p>incomplete</p>	\N
\.


--
-- Data for Name: poc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poc (id, name, email, email_cc, "KCDIO", email_cc_additional, name_cc1, name_cc2) FROM stdin;
6	yameeeeen	yamen.zaiter24@gmail.com	bla24blabla@gmail.com	KICT	yamen.zeiter24@gmail.com	yamen alzeiter	z3tora
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (id, name, translations, created_at, updated_at, flag, wikidataid) FROM stdin;
1	Africa	{\\"kr\\":\\"아프리카\\",\\"pt-BR\\":\\"África\\",\\"pt\\":\\"África\\",\\"nl\\":\\"Afrika\\",\\"hr\\":\\"Afrika\\",\\"fa\\":\\"آفریقا\\",\\"de\\":\\"Afrika\\",\\"es\\":\\"África\\",\\"fr\\":\\"Afrique\\",\\"ja\\":\\"アフリカ\\",\\"it\\":\\"Africa\\",\\"cn\\":\\"非洲\\",\\"tr\\":\\"Afrika\\"}	2023-08-14 07:11:03	2023-08-14 07:11:03	1	Q15
2	Americas	{\\"kr\\":\\"아메리카\\",\\"pt-BR\\":\\"América\\",\\"pt\\":\\"América\\",\\"nl\\":\\"Amerika\\",\\"hr\\":\\"Amerika\\",\\"fa\\":\\"قاره آمریکا\\",\\"de\\":\\"Amerika\\",\\"es\\":\\"América\\",\\"fr\\":\\"Amérique\\",\\"ja\\":\\"アメリカ州\\",\\"it\\":\\"America\\",\\"cn\\":\\"美洲\\",\\"tr\\":\\"Amerika\\"}	2023-08-14 07:11:03	2023-08-14 07:11:03	1	Q828
3	Asia	{\\"kr\\":\\"아시아\\",\\"pt-BR\\":\\"Ásia\\",\\"pt\\":\\"Ásia\\",\\"nl\\":\\"Azië\\",\\"hr\\":\\"Ázsia\\",\\"fa\\":\\"آسیا\\",\\"de\\":\\"Asien\\",\\"es\\":\\"Asia\\",\\"fr\\":\\"Asie\\",\\"ja\\":\\"アジア\\",\\"it\\":\\"Asia\\",\\"cn\\":\\"亚洲\\",\\"tr\\":\\"Asya\\"}	2023-08-14 07:11:03	2023-08-14 07:11:03	1	Q48
4	Europe	{\\"kr\\":\\"유럽\\",\\"pt-BR\\":\\"Europa\\",\\"pt\\":\\"Europa\\",\\"nl\\":\\"Europa\\",\\"hr\\":\\"Európa\\",\\"fa\\":\\"اروپا\\",\\"de\\":\\"Europa\\",\\"es\\":\\"Europa\\",\\"fr\\":\\"Europe\\",\\"ja\\":\\"ヨーロッパ\\",\\"it\\":\\"Europa\\",\\"cn\\":\\"欧洲\\",\\"tr\\":\\"Avrupa\\"}	2023-08-14 07:11:03	2023-08-14 07:11:03	1	Q46
5	Oceania	{\\"kr\\":\\"오세아니아\\",\\"pt-BR\\":\\"Oceania\\",\\"pt\\":\\"Oceania\\",\\"nl\\":\\"Oceanië en Australië\\",\\"hr\\":\\"Óceánia és Ausztrália\\",\\"fa\\":\\"اقیانوسیه\\",\\"de\\":\\"Ozeanien und Australien\\",\\"es\\":\\"Oceanía\\",\\"fr\\":\\"Océanie\\",\\"ja\\":\\"オセアニア\\",\\"it\\":\\"Oceania\\",\\"cn\\":\\"大洋洲\\",\\"tr\\":\\"Okyanusya\\"}	2023-08-14 07:11:03	2023-08-14 07:11:03	1	Q55643
6	Polar	{\\"kr\\":\\"남극\\",\\"pt-BR\\":\\"Antártida\\",\\"pt\\":\\"Antártida\\",\\"nl\\":\\"Antarctica\\",\\"hr\\":\\"Antarktika\\",\\"fa\\":\\"جنوبگان\\",\\"de\\":\\"Antarktika\\",\\"es\\":\\"Antártida\\",\\"fr\\":\\"Antarctique\\",\\"ja\\":\\"南極大陸\\",\\"it\\":\\"Antartide\\",\\"cn\\":\\"南極洲\\",\\"tr\\":\\"Antarktika\\"}	2023-08-14 07:11:03	2023-08-14 07:11:03	1	Q51
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (id, name, country_id, country_code, fips_code, iso2, type, latitude, longitude, created_at, updated_at, flag, wikidataid) FROM stdin;
1	Southern Nations, Nationalities, and Peoples\\" Region	70	ET	54	SN	\N	6.51569110	36.95410700	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q203193
2	Somali Region	70	ET	52	SO	\N	6.66122930	43.79084530	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q202800
3	Amhara Region	70	ET	46	AM	\N	11.34942470	37.97845850	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q203009
4	Tigray Region	70	ET	53	TI	\N	14.03233360	38.31657250	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q200127
5	Oromia Region	70	ET	51	OR	\N	7.54603770	40.63468510	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q202107
6	Afar Region	70	ET	45	AF	\N	11.75593880	40.95868800	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q193494
7	Harari Region	70	ET	50	HA	\N	9.31486600	42.19677160	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q1033855
8	Dire Dawa	70	ET	48	DD	\N	9.60087470	41.85014200	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q193486
9	Benishangul-Gumuz Region	70	ET	47	BE	\N	10.78028890	35.56578620	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q207635
10	Gambela Region	70	ET	49	GA	\N	7.92196870	34.15319470	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q207638
11	Addis Ababa	70	ET	44	AA	\N	8.98060340	38.75776050	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q3624
12	Petnjica Municipality	147	ME	23	23	\N	42.93534800	20.02114490	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q15630696
13	Bar Municipality	147	ME	02	02	\N	42.12781190	19.14043800	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q2604068
14	Danilovgrad Municipality	147	ME	07	07	\N	42.58357000	19.14043800	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q3741507
15	Rožaje Municipality	147	ME	17	17	\N	42.84083890	20.16706280	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q3296677
16	Plužine Municipality	147	ME	15	15	\N	43.15933840	18.85514840	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q4864476
17	Nikšić Municipality	147	ME	12	12	\N	42.79971840	18.76009630	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q4865016
18	Šavnik Municipality	147	ME	18	18	\N	42.96037560	19.14043800	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q13365880
19	Plav Municipality	147	ME	13	13	\N	42.60013370	19.94075410	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q4859821
20	Pljevlja Municipality	147	ME	14	14	\N	43.27233830	19.28315310	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q3299950
21	Berane Municipality	147	ME	03	03	\N	42.82572890	19.90205090	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q4853794
22	Mojkovac Municipality	147	ME	11	11	\N	42.96880180	19.52110630	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q3299782
23	Andrijevica Municipality	147	ME	01	01	\N	42.73624770	19.78595560	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q2384773
24	Gusinje Municipality	147	ME	22	22	\N	42.55634550	19.83060510	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q16085370
25	Bijelo Polje Municipality	147	ME	04	04	\N	43.08465260	19.71154720	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q4086488
26	Kotor Municipality	147	ME	10	10	\N	42.57402610	18.64131450	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q4856305
27	Podgorica Municipality	147	ME	16	16	\N	42.36938340	19.28315310	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q3305250
28	Old Royal Capital Cetinje	147	ME	16	06	\N	42.39309590	18.91159640	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q3305075
29	Tivat Municipality	147	ME	19	19	\N	42.42348000	18.71851840	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q3738564
30	Budva Municipality	147	ME	05	05	\N	42.31407200	18.83138320	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q3739214
31	Kolašin Municipality	147	ME	09	09	\N	42.76019160	19.42591140	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q3303233
32	Žabljak Municipality	147	ME	21	21	\N	43.15551520	19.12260180	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q3304454
33	Ulcinj Municipality	147	ME	20	20	\N	41.96527950	19.30694320	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q3305169
34	Kunene Region	152	NA	32	KU	\N	-19.40863170	13.91439900	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q834513
35	Kavango West Region	152	NA	41	KW	\N	-18.27104800	18.42760470	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q14824027
36	Kavango East Region	152	NA	40	KE	\N	-18.27104800	18.42760470	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q14824032
37	Oshana Region	152	NA	37	ON	\N	-18.43050640	15.68817880	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q534528
38	Hardap Region	152	NA	30	HA	\N	-24.23101340	17.66888700	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q752676
39	Omusati Region	152	NA	36	OS	\N	-18.40702940	14.84546190	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q764385
40	Ohangwena Region	152	NA	33	OW	\N	-17.59792910	16.81783770	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q845702
41	Omaheke Region	152	NA	35	OH	\N	-21.84666510	19.18800470	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q838775
42	Oshikoto Region	152	NA	38	OT	\N	-18.41525750	16.91225100	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q876512
43	Erongo Region	152	NA	29	ER	\N	-22.25656820	15.40680790	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q648753
44	Khomas Region	152	NA	21	KH	\N	-22.63778540	17.10119310	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q834508
45	Karas Region	152	NA	31	KA	\N	-26.84296450	17.29028390	2019-10-05 23:18:35	2022-08-31 15:52:51	1	Q573467
46	Otjozondjupa Region	152	NA	39	OD	\N	-20.54869160	17.66888700	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q876506
47	Zambezi Region	152	NA	28	CA	\N	-17.81934190	23.95364660	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q473190
48	Ashanti	83	GH	02	AH	region	6.74704360	-1.52086240	2019-10-05 17:48:36	2021-10-30 16:08:55	1	Q398417
49	Western	83	GH	09	WP	region	5.50000000	-2.50000000	2019-10-05 17:48:36	2021-10-30 16:08:55	1	Q870155
50	Eastern	83	GH	05	EP	region	6.50000000	-0.50000000	2019-10-05 17:48:36	2021-10-30 16:08:55	1	Q405670
51	Northern	83	GH	06	NP	region	9.50000000	-1.00000000	2019-10-05 17:48:36	2021-10-30 16:08:55	1	Q502215
52	Central	83	GH	04	CP	region	5.50000000	-1.00000000	2019-10-05 17:48:36	2021-10-30 16:08:55	1	Q846323
53	Ahafo	83	GH	03	AF	region	7.58213720	-2.54974630	2019-10-05 17:48:36	2021-10-30 16:08:55	1	Q48804007
54	Greater Accra	83	GH	01	AA	region	5.81428360	0.07467670	2019-10-05 17:48:36	2021-10-30 16:08:55	1	Q431729
55	Upper East	83	GH	10	UE	region	10.70824990	-0.98206680	2019-10-05 17:48:36	2021-10-30 16:08:55	1	Q712828
56	Volta	83	GH	08	TV	region	6.57813730	0.45023680	2019-10-05 17:48:36	2021-10-30 16:08:55	1	Q712832
57	Upper West	83	GH	11	UW	region	10.25297570	-2.14502450	2019-10-05 17:48:36	2021-10-30 16:08:55	1	Q715805
58	San Marino	192	SM	07	07	\N	43.94236000	12.45777700	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q1848
59	Acquaviva	192	SM	01	01	\N	41.86715970	14.74694790	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q206363
60	Chiesanuova	192	SM	02	02	\N	45.42261720	7.65038540	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q206980
61	Borgo Maggiore	192	SM	06	06	\N	43.95748820	12.45525460	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q201368
62	Faetano	192	SM	04	04	\N	43.93489670	12.48965540	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q206356
63	Montegiardino	192	SM	08	08	\N	43.90529990	12.48105420	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q206962
64	Domagnano	192	SM	03	03	\N	43.95019290	12.46815370	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q202202
65	Serravalle	192	SM	09	09	\N	44.72320840	8.85740050	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q185412
66	Fiorentino	192	SM	05	05	\N	43.90783370	12.45812090	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q206968
67	Tillabéri Region	160	NE	09	6	\N	14.64895250	2.14502450	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q861914
68	Dosso Region	160	NE	03	3	\N	13.15139470	3.41955270	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q850055
69	Zinder Region	160	NE	07	7	\N	15.17188810	10.26001250	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q204367
70	Maradi Region	160	NE	04	4	\N	13.80180740	7.43813550	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q850036
71	Agadez Region	160	NE	01	1	\N	20.66707520	12.07182810	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q389944
72	Diffa Region	160	NE	02	2	\N	13.67686470	12.71351210	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q1053302
73	Tahoua Region	160	NE	06	5	\N	16.09025430	5.39395510	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q871083
74	Mqabba	135	MT	06	33	\N	35.84441430	14.46941860	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q1017953
75	San Ġwann	135	MT	54	49	\N	35.90773650	14.47524160	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q39507
76	Żurrieq	135	MT	54	68	\N	35.82163060	14.48106480	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q44417
77	Luqa	135	MT	30	25	\N	35.85828650	14.48688830	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q475585
78	Marsaxlokk	135	MT	33	28	\N	35.84116990	14.53930970	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q781921
79	Qala	135	MT	33	42	\N	36.03886280	14.31810100	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q1088033
80	Żebbuġ Malta	135	MT	33	66	\N	35.87646480	14.43908400	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q44573
81	Xgħajra	135	MT	33	63	\N	35.88682820	14.54723910	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q520962
82	Kirkop	135	MT	28	23	\N	35.84378620	14.48543240	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q597464
83	Rabat	135	MT	28	46	\N	33.97159040	-6.84981290	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q44381
84	Floriana	135	MT	28	09	\N	45.49521850	-73.71395760	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q832807
85	Żebbuġ Gozo	135	MT	28	65	\N	36.07164030	14.24540800	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q179243
86	Swieqi	135	MT	28	57	\N	35.91911820	14.46941860	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q220667
87	Saint Lawrence	135	MT	50	50	\N	38.95780560	-95.25656890	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q537308
88	Birżebbuġa	135	MT	05	05	\N	35.81359890	14.52474630	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q258028
89	Mdina	135	MT	05	29	\N	35.88809300	14.40683570	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q207277
90	Santa Venera	135	MT	05	54	\N	35.89022010	14.47669740	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q585420
91	Kerċem	135	MT	05	22	\N	36.04479390	14.22506050	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q674679
92	Għarb	135	MT	05	14	\N	36.06890900	14.20180980	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q1026487
93	Iklin	135	MT	05	19	\N	35.90987740	14.45777320	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q304589
94	Santa Luċija	135	MT	05	53	\N	35.85614200	14.50436000	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q1087776
95	Valletta	135	MT	05	60	\N	35.89890850	14.51455280	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q23800
96	Msida	135	MT	05	34	\N	35.89563880	14.48688830	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q585187
97	Birkirkara	135	MT	04	04	\N	35.89547060	14.46650720	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q39583
98	Siġġiewi	135	MT	04	55	\N	35.84637420	14.43157460	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q919908
99	Kalkara	135	MT	04	21	\N	35.89142420	14.53202780	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q533257
100	St. Julian\\"s	135	MT	35	48	\N	42.21225130	-85.89171270	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q669979
101	Victoria	135	MT	46	45	\N	28.80526740	-97.00359820	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q752348
102	Mellieħa	135	MT	46	30	\N	35.95235290	14.35009750	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q755979
103	Tarxien	135	MT	58	59	\N	35.86725520	14.51164050	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q744001
104	Sliema	135	MT	58	56	\N	35.91100810	14.50290400	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q39526
105	Ħamrun	135	MT	58	18	\N	35.88612370	14.48834420	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q343001
106	Għasri	135	MT	58	16	\N	36.06680750	14.21924750	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q1017339
107	Birgu	135	MT	58	03	\N	35.88792140	14.52256200	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q752346
108	Balzan	135	MT	02	02	\N	35.89574140	14.45340650	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q789794
109	Mġarr	135	MT	02	31	\N	35.91893270	14.36173430	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q691220
110	Attard	135	MT	01	01	\N	35.89049670	14.41993220	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q44557
111	Qrendi	135	MT	01	44	\N	35.83284880	14.45486210	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q282203
112	Naxxar	135	MT	01	38	\N	35.93175180	14.43157460	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q44397
113	Gżira	135	MT	01	12	\N	35.90589700	14.49533380	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q632097
114	Xagħra	135	MT	01	61	\N	36.05084500	14.26748200	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q605343
115	Paola	135	MT	39	39	\N	38.57223530	-94.87912940	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q846589
116	Sannat	135	MT	54	52	\N	36.01926430	14.25994370	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q602037
117	Dingli	135	MT	07	07	\N	35.86273090	14.38501070	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q905641
118	Gudja	135	MT	07	11	\N	35.84698030	14.50290400	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q1018153
119	Qormi	135	MT	43	43	\N	35.87643880	14.46941860	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q39578
120	Għargħur	135	MT	43	15	\N	35.92205690	14.45631760	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q1018111
121	Xewkija	135	MT	43	62	\N	36.02992360	14.25994370	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q919921
122	Ta\\" Xbiex	135	MT	59	58	\N	35.89914480	14.49635190	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q1017348
123	Żabbar	135	MT	59	64	\N	35.87247150	14.54513540	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q39518
124	Għaxaq	135	MT	59	17	\N	35.84403590	14.51600900	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q426385
125	Pembroke	135	MT	40	40	\N	34.68016260	-79.19503730	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q775756
126	Lija	135	MT	29	24	\N	49.18007600	-123.10331700	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q782049
127	Pietà	135	MT	29	41	\N	42.21862000	-83.73464700	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q744070
128	Marsa	135	MT	29	26	\N	34.03195870	-118.44555350	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q267431
129	Fgura	135	MT	29	08	\N	35.87382690	14.52329010	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q44388
130	Għajnsielem	135	MT	11	13	\N	36.02479660	14.28029610	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q761675
131	Mtarfa	135	MT	11	35	\N	35.88951250	14.39519530	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q656837
132	Munxar	135	MT	11	36	\N	36.02880580	14.22506050	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q587462
133	Nadur	135	MT	11	37	\N	36.04470190	14.29192730	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q929969
134	Fontana	135	MT	11	10	\N	34.09223350	-117.43504800	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q1002742
135	Żejtun	135	MT	11	67	\N	35.85487140	14.53639690	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q44392
136	Senglea	135	MT	11	20	\N	35.88730410	14.51673710	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q846593
137	Marsaskala	135	MT	32	27	\N	35.86036400	14.55678760	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q534571
138	Cospicua	135	MT	32	06	\N	35.88067530	14.52183380	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q757225
139	St. Paul\\"s Bay	135	MT	35	51	\N	35.93601700	14.39665030	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q39521
140	Mosta	135	MT	35	32	\N	35.91415040	14.42284270	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q39520
141	Mangystau Region	112	KZ	09	MAN	\N	44.59080200	53.84995080	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q238931
142	Kyzylorda Region	112	KZ	14	KZY	\N	44.69226130	62.65718850	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q485322
143	Almaty Region	112	KZ	01	ALM	\N	45.01192270	78.42293920	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q186466
144	North Kazakhstan Region	112	KZ	16	SEV	\N	54.16220660	69.93870710	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q485088
145	Akmola Region	112	KZ	03	AKM	\N	51.91653200	69.41104940	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q485056
146	Pavlodar Region	112	KZ	11	PAV	\N	52.28784440	76.97334530	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q486144
147	Jambyl Region	112	KZ	17	ZHA	\N	44.22203080	72.36579670	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q486657
148	West Kazakhstan Province	112	KZ	07	ZAP	\N	49.56797270	50.80666160	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q486007
149	Turkestan Region	112	KZ	10	YUZ	\N	43.36669580	68.40944050	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q815330
150	Karaganda Region	112	KZ	12	KAR	\N	47.90221820	71.77068070	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q485429
151	Aktobe Region	112	KZ	04	AKT	\N	48.77970780	57.99743780	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q485437
152	Almaty	112	KZ	02	ALA	\N	43.22201460	76.85124850	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q35493
153	Atyrau Region	112	KZ	06	ATY	\N	47.10761880	51.91413300	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q427658
154	East Kazakhstan Region	112	KZ	15	VOS	\N	48.70626870	80.79225340	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q36156
155	Baikonur	112	KZ	08	BAY	\N	45.96458510	63.30524280	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q165413
156	Nur-Sultan	112	KZ	05	AST	\N	51.16052270	71.47035580	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q1520
157	Kostanay Region	112	KZ	13	KUS	\N	51.50770960	64.04790730	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q485605
158	Kakamega	113	KE	20	11	county	0.30789400	34.77407930	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1721867
159	Kisii	113	KE	25	16	county	-0.67733400	34.77960300	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1743730
161	Busia	113	KE	13	04	county	0.43465060	34.24215970	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1017519
163	Embu	113	KE	15	06	county	-0.65604770	37.72376780	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1335242
164	Laikipia	113	KE	29	20	county	0.36060630	36.78195050	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1800699
165	Nandi	113	KE	40	32	county	0.18358670	35.12687810	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1964569
166	Lamu	113	KE	30	21	county	-2.23550580	40.47200040	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1951652
167	Kirinyaga	113	KE	24	15	county	-0.65905650	37.38272340	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q2230311
168	Bungoma	113	KE	12	03	county	0.56952520	34.55837660	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q2928204
169	Uasin Gishu	113	KE	52	44	county	0.55276380	35.30272260	2019-10-05 23:18:36	2021-10-11 12:38:13	1	Q1121429
170	Isiolo	113	KE	18	09	county	0.35243520	38.48499230	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1499046
171	Kisumu	113	KE	26	17	county	-0.09170160	34.76795680	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1743809
173	Kwale	113	KE	28	19	county	-4.18161150	39.46056120	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q952571
174	Kilifi	113	KE	23	14	county	-3.51065080	39.90932690	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1741307
175	Narok	113	KE	41	33	county	-1.10411100	36.08934060	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1852220
176	Taita–Taveta	113	KE	41	39	county	-3.31606870	38.48499230	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q7193788
178	Murang\\"a	113	KE	38	29	county	-0.78392810	37.04003390	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1781723
180	Nyeri	113	KE	44	36	county	-0.41969150	37.04003390	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q749665
181	Baringo	113	KE	10	01	county	0.85549880	36.08934060	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q808201
182	Wajir	113	KE	54	46	county	1.63604750	40.30886260	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1852209
183	Trans Nzoia	113	KE	50	42	county	1.05666670	34.95066250	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1278653
184	Machakos	113	KE	31	22	county	-1.51768370	37.26341460	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1882639
185	Tharaka-Nithi	113	KE	49	41	county	-0.29648510	37.72376780	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q2189432
186	Siaya	113	KE	46	38	county	-0.06173280	34.24215970	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q3482913
187	Mandera	113	KE	33	24	county	3.57379910	40.95868800	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1477874
188	Makueni	113	KE	32	23	county	-2.25587340	37.89366630	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q473717
190	Migori	113	KE	36	27	county	-0.93657020	34.41982430	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q429955
191	Nairobi City	113	KE	05	30	county	-1.29206590	36.82194620	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q3870
192	Nyandarua	113	KE	43	35	county	-0.18038550	36.52296410	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1714352
193	Kericho	113	KE	21	12	county	-0.18279130	35.47819260	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1739252
194	Marsabit	113	KE	34	25	county	2.44264030	37.97845850	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1323683
195	Homa Bay	113	KE	17	08	county	-0.62206550	34.33103640	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1625834
196	Garissa	113	KE	16	07	county	-0.45322930	39.64609880	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1494292
197	Kajiado	113	KE	19	10	county	-2.09807510	36.78195050	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q285072
198	Meru	113	KE	35	26	county	0.35571740	37.80876930	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q15045704
199	Kiambu	113	KE	22	13	county	-1.03137010	36.86807910	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q2575594
200	Mombasa	113	KE	37	28	county	-3.97682910	39.71371810	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1112885
201	Elgeyo-Marakwet	113	KE	37	05	county	1.04982370	35.47819260	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q15216433
202	Vihiga	113	KE	53	45	county	0.07675530	34.70776650	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1313202
203	Nakuru	113	KE	39	31	county	-0.30309880	36.08002600	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1852202
205	Tana River	113	KE	48	40	county	-1.65184680	39.65181650	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q383150
206	Turkana	113	KE	51	43	county	3.31224770	35.56578620	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1633078
207	Samburu	113	KE	45	37	county	1.21545060	36.95410700	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q2096419
208	West Pokot	113	KE	55	47	county	1.62100760	35.39050460	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q590860
209	Nyamira	113	KE	42	34	county	-0.56694050	34.93412340	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1569613
210	Bomet	113	KE	11	02	county	-0.80150090	35.30272260	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q891952
211	Kitui	113	KE	27	18	county	-1.68328220	38.31657250	2019-10-05 23:18:36	2021-12-11 19:42:47	1	Q1722597
212	Bié Province	7	AO	02	BIE	\N	-12.57279070	17.66888700	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q213977
213	Huambo Province	7	AO	08	HUA	\N	-12.52682210	15.59433880	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q218848
214	Zaire Province	7	AO	16	ZAI	\N	-6.57334580	13.17403480	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q196674
215	Cunene Province	7	AO	07	CNN	\N	-16.28022210	16.15809370	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q216987
216	Cuanza Sul	7	AO	06	CUS	\N	-10.59519100	15.40680790	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q216998
217	Cuanza Norte Province	7	AO	05	CNO	\N	-9.23985130	14.65878210	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q216834
218	Benguela Province	7	AO	01	BGU	\N	-12.80037440	13.91439900	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q212786
219	Moxico Province	7	AO	14	MOX	\N	-13.42935790	20.33088140	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q173988
220	Lunda Sul Province	7	AO	18	LSU	\N	-10.28665780	20.71224650	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q219648
221	Bengo Province	7	AO	19	BGO	\N	-9.10422570	13.72891670	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q191299
222	Luanda Province	7	AO	20	LUA	\N	-9.03508800	13.26634790	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q190066
223	Lunda Norte Province	7	AO	17	LNO	\N	-8.35250220	19.18800470	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q214221
224	Uíge Province	7	AO	15	UIG	\N	-7.17367320	15.40680790	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q216972
225	Huíla Province	7	AO	09	HUI	\N	-14.92805530	14.65878210	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q214572
226	Cuando Cubango Province	7	AO	04	CCU	\N	-16.41808240	18.80761950	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q215268
227	Malanje Province	7	AO	12	MAL	\N	-9.82511830	16.91225100	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q219072
228	Cabinda Province	7	AO	03	CAB	\N	-5.02487490	12.34638750	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q168787
229	Gasa District	26	BT	23	GA	\N	28.01858860	89.92532330	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q578294
230	Tsirang District	26	BT	07	21	\N	27.03220700	90.18696440	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q728922
231	Wangdue Phodrang District	26	BT	07	24	\N	27.45260460	90.06749280	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q728933
232	Haa District	26	BT	10	13	\N	27.26516690	89.17059980	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q754448
233	Zhemgang District	26	BT	18	34	\N	27.07697500	90.82940020	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q197564
234	Lhuntse District	26	BT	11	44	\N	27.82649890	91.13530200	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q598793
235	Punakha District	26	BT	15	23	\N	27.69037160	89.88793040	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q587062
236	Trashigang District	26	BT	19	41	\N	27.25667950	91.75388170	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q652773
237	Paro District	26	BT	13	11	\N	27.42859490	89.41665160	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q652784
238	Dagana District	26	BT	08	22	\N	27.03228610	89.88793040	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q735146
239	Chukha District	26	BT	06	12	\N	27.07843040	89.47421770	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q652754
240	Bumthang District	26	BT	05	33	\N	27.64183900	90.67730460	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q463242
241	Thimphu District	26	BT	20	15	\N	27.47122160	89.63390410	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q254889
242	Mongar District	26	BT	12	42	\N	27.26170590	91.28910360	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q389734
243	Samdrup Jongkhar District	26	BT	17	45	\N	26.80356820	91.50392070	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q728929
244	Pemagatshel District	26	BT	14	43	\N	27.00238200	91.34692470	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q167279
245	Trongsa District	26	BT	14	32	\N	27.50022690	90.50806340	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q728938
246	Samtse District	26	BT	16	14	\N	27.02918320	89.05615320	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q728917
247	Sarpang District	26	BT	09	31	\N	26.93730410	90.48799160	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q728947
248	Tombouctou Region	134	ML	08	6	\N	21.05267060	-3.74350900	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q339462
249	Ségou Region	134	ML	05	4	\N	13.83944560	-6.06791940	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q656845
250	Koulikoro Region	134	ML	07	2	\N	13.80180740	-7.43813550	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q287789
251	Ménaka Region	134	ML	07	9	\N	15.91564210	2.39617400	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q3455550
252	Kayes Region	134	ML	03	1	\N	14.08183080	-9.90181310	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q332113
253	Bamako	134	ML	01	BKO	\N	12.63923160	-8.00288920	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q3703
254	Sikasso Region	134	ML	06	3	\N	10.89051860	-7.43813550	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q461298
255	Mopti Region	134	ML	04	5	\N	14.63380390	-3.41955270	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q214155
256	Taoudénit Region	134	ML	04	10	\N	22.67641320	-3.97891430	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q2424657
257	Kidal Region	134	ML	10	8	\N	18.79868320	1.83183340	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q338988
258	Gao Region	134	ML	09	7	\N	16.90663320	1.52086240	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q332392
259	Southern Province	183	RW	15	05	\N	\N	\N	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q853162
260	Western Province	183	RW	14	04	\N	\N	\N	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q737354
261	Eastern Province	183	RW	11	02	\N	\N	\N	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q853152
262	Kigali district	183	RW	12	01	\N	-1.94407270	30.06188510	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q167196
263	Northern Province	183	RW	13	03	\N	\N	\N	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q845807
264	Belize District	23	BZ	01	BZ	\N	17.56776790	-88.40160410	2019-10-05 23:18:36	2022-08-31 15:52:51	1	Q506056
265	Stann Creek District	23	BZ	05	SC	\N	16.81166310	-88.40160410	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q502652
266	Corozal District	23	BZ	03	CZL	\N	18.13492380	-88.24611830	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q512273
267	Toledo District	23	BZ	06	TOL	\N	16.24919230	-88.86469800	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q506049
268	Orange Walk District	23	BZ	04	OW	\N	17.76035300	-88.86469800	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q506036
269	Cayo District	23	BZ	02	CY	\N	17.09844450	-88.94138650	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q508773
270	Príncipe Province	193	ST	01	P	\N	1.61393810	7.40569280	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q2366966
271	São Tomé Province	193	ST	02	S	\N	0.33019240	6.73334300	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q6710363
272	Havana Province	56	CU	02	03	\N	23.05406980	-82.34518900	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q12588
273	Santiago de Cuba Province	56	CU	15	13	\N	20.23976820	-75.99276520	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q234200
274	Sancti Spíritus Province	56	CU	14	07	\N	21.99382140	-79.47038850	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q115441
275	Granma Province	56	CU	09	12	\N	20.38449020	-76.64127120	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q115046
276	Mayabeque Province	56	CU	MA	16	\N	22.89265290	-81.95348150	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q115310
277	Pinar del Río Province	56	CU	01	01	\N	22.40762560	-83.84730150	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q115497
278	Isla de la Juventud	56	CU	04	99	\N	21.70847370	-82.82202320	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q115027
279	Holguín Province	56	CU	12	11	\N	20.78378930	-75.80690820	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q115302
280	Villa Clara Province	56	CU	16	05	\N	22.49372040	-79.91927020	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q115434
281	Las Tunas Province	56	CU	13	10	\N	21.06051620	-76.91820970	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q115334
282	Ciego de Ávila Province	56	CU	07	08	\N	21.93295150	-78.56608520	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q220692
283	Artemisa Province	56	CU	AR	15	\N	22.75229030	-82.99316070	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q115325
284	Matanzas Province	56	CU	03	04	\N	22.57671230	-81.33994140	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q115438
285	Guantánamo Province	56	CU	10	14	\N	20.14559170	-74.87410450	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q115319
286	Camagüey Province	56	CU	05	09	\N	21.21672470	-77.74520810	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q215147
287	Cienfuegos Province	56	CU	08	06	\N	22.23797830	-80.36586500	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q115444
288	Jigawa	161	NG	39	JI	state	12.22801200	9.56158670	2019-10-05 23:18:37	2021-10-11 12:08:24	1	Q682691
289	Enugu	161	NG	47	EN	state	6.53635300	7.43561940	2019-10-05 23:18:37	2021-10-11 12:08:21	1	Q3817714
290	Kebbi	161	NG	40	KE	state	11.49420030	4.23333550	2019-10-05 23:18:37	2021-10-11 12:08:25	1	Q748523
291	Benue	161	NG	26	BE	state	7.33690240	8.74036870	2019-10-05 23:18:37	2021-10-11 12:08:15	1	Q429908
292	Sokoto	161	NG	51	SO	state	13.05331430	5.32227220	2019-10-05 23:18:37	2021-10-11 12:08:38	1	Q503941
293	Abuja Federal Capital Territory	161	NG	11	FC	capital territory	8.89406910	7.18604020	2019-10-05 23:18:37	2021-10-11 12:08:07	1	Q509300
294	Kaduna	161	NG	23	KD	state	10.37640060	7.70945370	2019-10-05 23:18:37	2021-10-11 12:08:25	1	Q878284
295	Kwara	161	NG	30	KW	state	8.96689610	4.38740510	2019-10-05 23:18:37	2021-10-11 12:08:29	1	Q464953
296	Oyo	161	NG	32	OY	state	8.15738090	3.61465340	2019-10-05 23:18:37	2021-10-11 12:08:35	1	Q503905
297	Yobe	161	NG	44	YO	state	12.29387600	11.43904110	2019-10-05 23:18:37	2021-10-11 12:08:39	1	Q682777
298	Kogi	161	NG	41	KO	state	7.73373250	6.69058360	2019-10-05 23:18:37	2021-10-11 12:08:27	1	Q387745
299	Zamfara	161	NG	57	ZA	state	12.12218050	6.22358190	2019-10-05 23:18:37	2021-10-11 12:08:40	1	Q145793
300	Kano	161	NG	29	KN	state	11.74706980	8.52471070	2019-10-05 23:18:37	2021-10-11 12:08:26	1	Q682571
301	Nasarawa	161	NG	56	NA	state	8.49979080	8.19969370	2019-10-05 23:18:37	2021-10-11 12:08:31	1	Q836645
302	Plateau	161	NG	49	PL	state	9.21820930	9.51794880	2019-10-05 23:18:37	2021-10-11 12:08:36	1	Q503928
303	Abia	161	NG	45	AB	state	5.45273540	7.52484140	2019-10-05 23:18:37	2021-10-11 12:07:55	1	Q320852
304	Akwa Ibom	161	NG	21	AK	state	4.90573710	7.85366750	2019-10-05 23:18:37	2021-10-11 12:08:11	1	Q424388
305	Bayelsa	161	NG	52	BY	state	4.77190710	6.06985260	2019-10-05 23:18:37	2021-10-11 12:08:17	1	Q532153
306	Lagos	161	NG	05	LA	state	6.52437930	3.37920570	2019-10-05 23:18:37	2021-10-11 12:08:30	1	Q815913
307	Borno	161	NG	27	BO	state	11.88463560	13.15196650	2019-10-05 23:18:37	2021-10-11 12:08:16	1	Q130626
308	Imo	161	NG	28	IM	state	5.57201220	7.05882190	2019-10-05 23:18:37	2021-10-11 12:08:23	1	Q842939
309	Ekiti	161	NG	54	EK	state	7.71898620	5.31095050	2019-10-05 23:18:37	2021-10-11 12:08:21	1	Q534917
310	Gombe	161	NG	55	GO	state	10.36377950	11.19275870	2019-10-05 23:18:37	2021-10-11 12:08:22	1	Q376241
311	Ebonyi	161	NG	53	EB	state	6.26492320	8.01373020	2019-10-05 23:18:37	2021-10-11 12:08:18	1	Q506808
312	Bauchi	161	NG	46	BA	state	10.77606240	9.99919430	2019-10-05 23:18:37	2021-10-11 12:08:14	1	Q503936
313	Katsina	161	NG	24	KT	state	12.37967070	7.63057480	2019-10-05 23:18:37	2021-10-11 12:08:28	1	Q657821
314	Cross River	161	NG	22	CR	state	5.87017240	8.59880140	2019-10-05 23:18:37	2021-10-11 12:08:17	1	Q739676
315	Anambra	161	NG	25	AN	state	6.22089970	6.93695590	2019-10-05 23:18:37	2021-10-11 12:08:14	1	Q117714
316	Delta	161	NG	36	DE	state	33.74537840	-90.73545080	2019-10-05 23:18:37	2021-10-11 12:08:19	1	Q503910
317	Niger	161	NG	31	NI	state	9.93092240	5.59832100	2019-10-05 23:18:37	2021-10-11 12:08:31	1	Q503932
318	Edo	161	NG	37	ED	state	6.63418310	5.93040560	2019-10-05 23:18:37	2021-10-11 12:08:20	1	Q682704
319	Taraba	161	NG	43	TA	state	7.99936160	10.77398630	2019-10-05 23:18:37	2021-10-11 12:08:39	1	Q463959
320	Adamawa	161	NG	35	AD	state	9.32647510	12.39838530	2019-10-05 23:18:37	2021-10-11 12:08:11	1	Q337514
321	Ondo	161	NG	48	ON	state	6.91486820	5.14781440	2019-10-05 23:18:37	2021-10-11 12:08:33	1	Q836654
322	Osun	161	NG	42	OS	state	7.56289640	4.51995930	2019-10-05 23:18:37	2021-10-11 12:08:35	1	Q682721
323	Ogun	161	NG	16	OG	state	6.99797470	3.47373780	2019-10-05 23:18:37	2021-10-11 12:08:32	1	Q836657
324	Rukungiri District	229	UG	93	412	\N	-0.75184900	29.92779470	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q289419
325	Kyankwanzi District	229	UG	93	123	\N	1.09660370	31.71954590	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q534203
326	Kabarole District	229	UG	79	405	\N	0.58507910	30.25127280	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1229910
327	Mpigi District	229	UG	89	106	\N	0.22735280	32.32492360	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1362109
328	Apac District	229	UG	26	302	\N	1.87302630	32.62774550	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1229750
329	Abim District	229	UG	26	314	\N	2.70669800	33.65953370	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375780
330	Yumbe District	229	UG	97	313	\N	3.46980230	31.24832910	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1362587
331	Rukiga District	229	UG	97	431	\N	-1.13263370	30.04341200	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q38249615
332	Northern Region	229	UG	N	N	\N	9.54392690	-0.90566230	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q2559686
333	Serere District	229	UG	N	232	\N	1.49940330	33.54900780	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1114927
334	Kamuli District	229	UG	38	205	\N	0.91871070	33.12390490	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q164474
335	Amuru District	229	UG	38	316	\N	2.96678780	32.08374450	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375771
336	Kaberamaido District	229	UG	80	213	\N	1.69633220	33.21385100	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1229906
337	Namutumba District	229	UG	80	224	\N	0.84926100	33.66233010	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375819
338	Kibuku District	229	UG	80	227	\N	1.04528740	33.79925360	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1114885
339	Ibanda District	229	UG	80	417	\N	-0.09648900	30.57395790	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1318877
340	Iganga District	229	UG	78	203	\N	0.66001370	33.48319060	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1229869
341	Dokolo District	229	UG	78	317	\N	1.96364210	33.03387670	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1318872
342	Lira District	229	UG	47	307	\N	2.23161690	32.94376670	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q206519
343	Bukedea District	229	UG	47	219	\N	1.35568980	34.10867930	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375812
344	Alebtong District	229	UG	47	323	\N	2.25457730	33.34861470	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3536082
345	Koboko District	229	UG	47	319	\N	3.52370580	31.03351000	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1318857
346	Kiryandongo District	229	UG	47	421	\N	2.01799070	32.08374450	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3539116
347	Kiboga District	229	UG	42	103	\N	0.96575900	31.71954590	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q892064
348	Kitgum District	229	UG	84	305	\N	3.33968290	33.16888830	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q500162
349	Bududa District	229	UG	84	218	\N	1.00296930	34.33381230	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1365449
350	Mbale District	229	UG	87	209	\N	1.03442740	34.19768820	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q581822
351	Namayingo District	229	UG	87	230	\N	-0.28035750	33.75177230	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1114915
352	Amuria District	229	UG	87	216	\N	2.03017000	33.64275330	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375762
353	Amudat District	229	UG	87	324	\N	1.79162240	34.90655100	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3536116
354	Masindi District	229	UG	50	409	\N	1.49203630	31.71954590	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1032238
355	Kiruhura District	229	UG	50	419	\N	-0.19279980	30.80394740	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1318865
356	Masaka District	229	UG	71	105	\N	-0.44636910	31.90179540	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1032233
357	Pakwach District	229	UG	71	332	\N	2.46071410	31.49417380	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q38249567
358	Rubanda District	229	UG	71	429	\N	-1.18611900	29.84535760	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q38249602
359	Tororo District	229	UG	76	212	\N	0.68709940	34.06414190	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1186541
360	Kamwenge District	229	UG	81	413	\N	0.22579300	30.48184460	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1318806
361	Adjumani District	229	UG	65	301	\N	3.25485270	31.71954590	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1229734
362	Wakiso District	229	UG	96	113	\N	0.06301900	32.44672380	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q976848
363	Moyo District	229	UG	72	309	\N	3.56964640	31.67393710	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q2183668
364	Mityana District	229	UG	72	115	\N	0.44548450	32.08374450	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1230005
365	Butaleja District	229	UG	72	221	\N	0.84749220	33.84112880	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375755
366	Gomba District	229	UG	72	121	\N	0.22297910	31.67393710	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3321637
367	Jinja District	229	UG	33	204	\N	0.53437430	33.30371430	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q983748
368	Kayunga District	229	UG	83	112	\N	0.98601820	32.85357550	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1207391
369	Kween District	229	UG	83	228	\N	1.44387900	34.59713200	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3321998
370	Western Region	229	UG	W	W	\N	40.76672150	-111.88772030	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q2559188
371	Mubende District	229	UG	56	107	\N	0.57727580	31.53700030	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q891962
372	Eastern Region	229	UG	E	E	\N	6.23740360	-0.45023680	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q2559220
373	Kanungu District	229	UG	82	414	\N	-0.81952530	29.74260400	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1032245
374	Omoro District	229	UG	82	331	\N	2.71522300	32.49200880	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q38249597
375	Bukomansimbi District	229	UG	82	118	\N	-0.14327520	31.60548930	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3321599
376	Lyantonde District	229	UG	82	114	\N	-0.22406960	31.21684660	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375878
377	Buikwe District	229	UG	82	117	\N	0.31440460	32.98883190	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3321631
378	Nwoya District	229	UG	82	328	\N	2.56244400	31.90179540	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3539572
379	Zombo District	229	UG	82	330	\N	2.55442930	30.94173680	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3539730
380	Buyende District	229	UG	82	226	\N	1.24136820	33.12390490	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1114938
381	Bunyangabu District	229	UG	82	430	\N	0.48709180	30.20510960	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q38249629
382	Kampala District	229	UG	37	102	\N	0.34759640	32.58251970	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q926417
383	Isingiro District	229	UG	37	418	\N	-0.84354300	30.80394740	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1318887
384	Butambala District	229	UG	37	119	\N	0.17425000	32.10646680	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3321622
385	Bukwo District	229	UG	37	220	\N	1.28186510	34.72987650	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375868
386	Bushenyi District	229	UG	29	402	\N	-0.48709180	30.20510960	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1229797
387	Bugiri District	229	UG	66	201	\N	0.53161270	33.75177230	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1229798
388	Butebo District	229	UG	66	233	\N	1.21411240	33.90808960	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q44377523
389	Buliisa District	229	UG	66	416	\N	2.02996070	31.53700030	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1229793
390	Otuke District	229	UG	66	329	\N	2.52140590	33.34861470	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3539602
391	Buhweju District	229	UG	66	420	\N	-0.29113590	30.29741990	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3537661
392	Agago District	229	UG	66	322	\N	2.92508200	33.34861470	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3536053
393	Nakapiripirit District	229	UG	91	311	\N	1.96061730	34.59713200	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375853
394	Kalungu District	229	UG	91	122	\N	-0.09528310	31.76513620	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3321614
395	Moroto District	229	UG	88	308	\N	2.61685450	34.59713200	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375850
396	Central Region	229	UG	C	C	\N	44.29687500	-94.74017330	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q429685
397	Oyam District	229	UG	C	321	\N	2.27762810	32.44672380	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1318833
398	Kaliro District	229	UG	C	222	\N	1.04311070	33.48319060	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375859
399	Kakumiro District	229	UG	C	428	\N	0.78080350	31.32413890	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q38249480
400	Namisindwa District	229	UG	C	234	\N	0.90710100	34.35740370	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q44380663
401	Kole District	229	UG	C	325	\N	2.37010970	32.76330360	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3539151
402	Kyenjojo District	229	UG	85	415	\N	0.60929230	30.64012310	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1318815
403	Kagadi District	229	UG	85	427	\N	0.94007610	30.81256380	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q38249484
404	Ntungamo District	229	UG	59	411	\N	-0.98073410	30.25127280	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q204642
405	Kalangala District	229	UG	36	101	\N	-0.63505780	32.53727410	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q867219
406	Nakasongola District	229	UG	73	109	\N	1.34897210	32.44672380	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q976859
407	Sheema District	229	UG	73	426	\N	-0.55152980	30.38966510	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3539711
408	Pader District	229	UG	92	312	\N	2.94306820	32.80844960	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1230035
409	Kisoro District	229	UG	43	408	\N	-1.22094300	29.64991620	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q580538
410	Mukono District	229	UG	90	108	\N	0.28354760	32.76330360	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1151066
411	Lamwo District	229	UG	90	326	\N	3.57075680	32.53727410	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3539277
412	Pallisa District	229	UG	60	210	\N	1.23242060	33.75177230	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375843
413	Gulu District	229	UG	30	304	\N	2.81857760	32.44672380	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1028215
414	Buvuma District	229	UG	30	120	\N	-0.37649120	33.25879300	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3321608
415	Mbarara District	229	UG	52	410	\N	-0.60715960	30.65450220	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1091595
416	Amolatar District	229	UG	52	315	\N	1.60544020	32.80844960	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1318822
417	Lwengo District	229	UG	52	124	\N	-0.41652880	31.39989950	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1114954
418	Mayuge District	229	UG	86	214	\N	-0.21829820	33.57280270	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1364824
419	Bundibugyo District	229	UG	28	401	\N	0.68517630	30.02029640	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1362129
420	Katakwi District	229	UG	69	207	\N	1.97310300	34.06414190	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1229930
421	Maracha District	229	UG	69	320	\N	3.28731270	30.94030230	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q588927
422	Ntoroko District	229	UG	69	424	\N	1.07881780	30.38966510	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3539547
423	Nakaseke District	229	UG	69	116	\N	1.22308480	32.08374450	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q432438
424	Ngora District	229	UG	69	231	\N	1.49081150	33.75177230	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1114903
425	Kumi District	229	UG	46	208	\N	1.48769990	33.93039910	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1151062
426	Kabale District	229	UG	34	404	\N	-1.24930840	30.06652360	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3526470
427	Sembabule District	229	UG	74	111	\N	0.06377150	31.35416310	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q976883
428	Bulambuli District	229	UG	74	225	\N	1.47988460	34.37544140	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1114868
429	Sironko District	229	UG	94	215	\N	1.23022740	34.24910640	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375835
430	Napak District	229	UG	94	327	\N	2.36299450	34.24215970	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3539495
431	Busia District	229	UG	67	202	\N	0.40447310	34.01958270	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1229800
432	Kapchorwa District	229	UG	39	206	\N	1.33502050	34.39763560	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1229921
433	Luwero District	229	UG	70	104	\N	0.82711180	32.62774550	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1364817
434	Kaabong District	229	UG	70	318	\N	3.51262150	33.97500180	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1229881
435	Mitooma District	229	UG	70	423	\N	-0.61932760	30.02029640	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3539414
436	Kibaale District	229	UG	41	407	\N	0.90668020	31.07937050	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q604966
437	Kyegegwa District	229	UG	41	422	\N	0.48181930	31.05500930	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3539256
438	Manafwa District	229	UG	41	223	\N	0.90635990	34.28660910	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375789
439	Rakai District	229	UG	61	110	\N	-0.70691350	31.53700030	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q976873
440	Kasese District	229	UG	40	406	\N	0.06462850	30.06652360	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1229919
441	Budaka District	229	UG	40	217	\N	1.10162770	33.93039910	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1362085
442	Rubirizi District	229	UG	40	425	\N	-0.26424100	30.10840330	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3539648
443	Kotido District	229	UG	45	306	\N	3.04156790	33.88577470	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1318843
444	Soroti District	229	UG	95	211	\N	1.72291170	33.52800720	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1091337
445	Luuka District	229	UG	95	229	\N	0.72505990	33.30371430	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1114977
446	Nebbi District	229	UG	58	310	\N	2.44093920	31.35416310	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1375825
447	Arua District	229	UG	77	303	\N	2.99598460	31.17103890	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1229758
448	Kyotera District	229	UG	77	125	\N	-0.63589880	31.54556370	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q38249546
449	Schellenberg	125	LI	08	08	\N	47.23096600	9.54678430	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q49655
450	Schaan	125	LI	07	07	\N	47.12043400	9.59416020	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q49657
451	Eschen	125	LI	02	02	\N	40.76695740	-73.95228210	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q4540
452	Vaduz	125	LI	11	11	\N	47.14103030	9.52092770	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1844
453	Ruggell	125	LI	06	06	\N	47.25292220	9.54021270	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q49659
454	Planken	125	LI	05	05	\N	40.66505760	-73.50479800	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q49660
455	Mauren	125	LI	04	04	\N	47.21892850	9.54173500	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q49661
456	Triesenberg	125	LI	10	10	\N	47.12245110	9.57019850	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q49651
457	Gamprin	125	LI	03	03	\N	47.21324900	9.50251950	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q49662
458	Balzers	125	LI	01	01	\N	42.05283570	-88.03668480	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q49663
459	Triesen	125	LI	09	09	\N	47.10979880	9.52482960	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q49654
460	Brčko District	28	BA	BRC	BRC	\N	44.84059440	18.74215300	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q194483
461	Tuzla Canton	28	BA	BRC	03	\N	44.53434630	18.69727970	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q18250
462	Central Bosnia Canton	28	BA	BRC	06	\N	44.13818560	17.68667140	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q18262
463	Herzegovina-Neretva Canton	28	BA	BRC	07	\N	43.52651590	17.76362100	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q18273
464	Posavina Canton	28	BA	BRC	02	\N	45.07520940	18.37763040	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q18249
465	Una-Sana Canton	28	BA	BRC	01	\N	44.65031160	16.31716290	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q18248
466	Sarajevo Canton	28	BA	BRC	09	\N	43.85125640	18.29534420	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q18276
467	Federation of Bosnia and Herzegovina	28	BA	01	BIH	\N	43.88748970	17.84279300	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q11198
468	Zenica-Doboj Canton	28	BA	01	04	\N	44.21271090	18.16046250	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q18253
469	West Herzegovina Canton	28	BA	01	08	\N	43.43692440	17.38488310	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q18275
470	Republika Srpska	28	BA	02	SRP	\N	44.72801860	17.31481360	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q11196
471	Canton 10	28	BA	02	10	\N	43.95341550	16.94251870	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q18277
472	Bosnian Podrinje Canton	28	BA	02	05	\N	43.68749000	18.82443940	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q18256
473	Dakar	195	SN	01	DK	\N	14.71667700	-17.46768610	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q856268
474	Kolda	195	SN	11	KD	\N	12.91074950	-14.95056710	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q738081
475	Kaffrine	195	SN	16	KA	\N	14.10520200	-15.54157550	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1059694
476	Matam	195	SN	15	MT	\N	15.66002250	-13.25769060	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q856275
477	Saint-Louis	195	SN	14	SL	\N	38.62700250	-90.19940420	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q178872
478	Ziguinchor	195	SN	12	ZG	\N	12.56414790	-16.26398250	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q822692
479	Fatick	195	SN	09	FK	\N	14.33901670	-16.41114250	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q856282
480	Diourbel Region	195	SN	03	DB	\N	14.72830850	-16.25221430	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q856261
481	Kédougou	195	SN	17	KE	\N	12.56046070	-12.17470770	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1046666
482	Sédhiou	195	SN	18	SE	\N	12.70460400	-15.55623040	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q589848
483	Kaolack	195	SN	10	KL	\N	14.16520830	-16.07577490	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q847671
484	Thiès Region	195	SN	07	TH	\N	14.79100520	-16.93586040	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q847682
485	Louga	195	SN	13	LG	\N	15.61417680	-16.22868000	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q738061
486	Tambacounda Region	195	SN	05	TC	\N	13.56190110	-13.17403480	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q848554
487	Encamp	6	AD	03	03	\N	42.53597640	1.58367730	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q24269
488	Andorra la Vella	6	AD	07	07	\N	42.50631740	1.52183550	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q2522163
489	Canillo	6	AD	02	02	\N	42.59782490	1.65663770	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q24260
490	Sant Julià de Lòria	6	AD	06	06	\N	42.45296310	1.49182350	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q24282
491	Ordino	6	AD	05	05	\N	42.59944330	1.54023270	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q24272
492	Escaldes-Engordany	6	AD	08	08	\N	42.49093790	1.58869660	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q24286
493	La Massana	6	AD	04	04	\N	42.54562500	1.51473920	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q24276
494	Mont Buxton	197	SC	17	17	\N	-4.61666670	55.44577680	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3241682
495	La Digue	197	SC	25	15	\N	49.76669220	-97.15466290	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q581154
496	Saint Louis	197	SC	22	22	\N	38.62700250	-90.19940420	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q2278695
497	Baie Lazare	197	SC	06	06	\N	-4.74825250	55.48593630	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q2494551
498	Mont Fleuri	197	SC	18	18	\N	-4.63565430	55.45546880	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q1945413
499	Les Mamelles	197	SC	29	24	\N	38.82505050	-90.48345170	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q2280357
500	Grand\\"Anse Mahé	197	SC	24	13	\N	-4.67739200	55.46377700	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3241690
501	Roche Caiman	197	SC	30	25	\N	-4.63960280	55.46793150	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q2718315
502	Anse Royale	197	SC	05	05	\N	-4.74079880	55.50810120	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3241674
503	Glacis	197	SC	12	12	\N	47.11573030	-70.30281830	2019-10-05 23:18:37	2022-08-31 15:52:51	1	Q3241696
504	Grand\\"Anse Praslin	197	SC	14	14	\N	-4.31762190	55.70783630	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1231388
505	Bel Ombre	197	SC	10	10	\N	-20.50100950	57.42596240	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q3245439
506	Anse-aux-Pins	197	SC	01	01	\N	-4.69004430	55.51502890	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q569458
507	Port Glaud	197	SC	27	21	\N	-4.64885230	55.41947530	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1808165
508	Au Cap	197	SC	28	04	\N	-4.70597230	55.50810120	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2667004
509	Takamaka	197	SC	23	23	\N	37.96459170	-1.22177270	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2287379
510	Pointe La Rue	197	SC	20	20	\N	-4.68048900	55.51918570	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2877260
511	Plaisance	197	SC	19	19	\N	45.60709500	-75.11427450	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2199897
512	Beau Vallon	197	SC	08	08	\N	-4.62109670	55.42778020	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q7479348
513	Anse Boileau	197	SC	02	02	\N	-4.70472680	55.48593630	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q569453
514	Baie Sainte Anne	197	SC	07	07	\N	47.05259000	-64.95245790	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q803716
515	Bel Air	197	SC	09	09	\N	34.10024550	-118.45946300	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q815077
516	La Rivière Anglaise	197	SC	26	16	\N	-4.61061500	55.45408410	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1819963
517	Cascade	197	SC	11	11	\N	44.51628210	-116.04179830	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1928685
518	Shaki	16	AZ	48	SA	\N	41.19747530	47.15712410	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q234783
519	Tartar District	16	AZ	57	TAR	\N	40.34438750	46.93765190	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q477168
520	Shirvan	16	AZ	07	SR	\N	39.94697070	48.92239190	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q241116
521	Qazakh District	16	AZ	40	QAZ	\N	41.09710740	45.35163310	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q389381
522	Sadarak District	16	AZ	40	SAD	\N	39.71051140	44.88642770	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q641468
523	Yevlakh District	16	AZ	67	YEV	\N	40.61966380	47.15003240	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q458524
524	Khojali District	16	AZ	64	XCI	\N	39.91325530	46.79430500	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q330790
525	Kalbajar District	16	AZ	26	KAL	\N	40.10243290	46.03648720	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q457513
526	Qakh District	16	AZ	39	QAX	\N	41.42068270	46.93201840	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q330796
527	Fizuli District	16	AZ	18	FUZ	\N	39.53786050	47.30338770	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q331687
528	Astara District	16	AZ	08	AST	\N	38.49378450	48.69443650	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q269680
529	Shamakhi District	16	AZ	50	SMI	\N	40.63187310	48.63638010	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q330839
530	Neftchala District	16	AZ	36	NEF	\N	39.38810520	49.24137430	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q688633
531	Goychay	16	AZ	22	GOY	\N	40.62361680	47.74030340	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q477163
532	Bilasuvar District	16	AZ	13	BIL	\N	39.45988330	48.55098130	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q330834
533	Tovuz District	16	AZ	58	TOV	\N	40.99545230	45.61659070	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q388980
534	Ordubad District	16	AZ	58	ORD	\N	38.90216220	46.02376250	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q512623
535	Sharur District	16	AZ	58	SAR	\N	39.55363320	44.98456800	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q390820
536	Samukh District	16	AZ	52	SMX	\N	40.76046310	46.40631810	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q498437
537	Khizi District	16	AZ	63	XIZ	\N	40.91094890	49.07292640	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q476708
538	Yevlakh	16	AZ	68	YE	\N	40.61966380	47.15003240	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q175459
539	Ujar District	16	AZ	59	UCA	\N	40.50675250	47.64896410	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q476703
540	Absheron District	16	AZ	01	ABS	\N	40.36296930	49.27368150	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q179538
541	Lachin District	16	AZ	28	LAC	\N	39.63834140	46.54608530	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q301832
542	Qabala District	16	AZ	38	QAB	\N	40.92539250	47.80161060	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q593872
543	Agstafa District	16	AZ	05	AGA	\N	41.26559330	45.51342910	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q275744
544	Imishli District	16	AZ	24	IMI	\N	39.86946860	48.06652180	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q343908
545	Salyan District	16	AZ	49	SAL	\N	28.35248110	82.12784000	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q457485
546	Lerik District	16	AZ	31	LER	\N	38.77361920	48.41514830	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q688626
547	Agsu District	16	AZ	06	AGU	\N	40.52833390	48.36508350	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q330800
548	Qubadli District	16	AZ	43	QBI	\N	39.27139960	46.63543120	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q644048
549	Kurdamir District	16	AZ	27	KUR	\N	40.36986510	48.16446260	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q688589
550	Yardymli District	16	AZ	66	YAR	\N	38.90589170	48.24961270	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q127255
551	Goranboy District	16	AZ	21	GOR	\N	40.53805060	46.59908910	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q330843
552	Baku	16	AZ	09	BA	\N	40.40926170	49.86709240	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q9248
553	Agdash District	16	AZ	04	AGS	\N	40.63354270	47.46743100	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q275784
554	Beylagan District	16	AZ	12	BEY	\N	39.77230730	47.61541660	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q330807
555	Masally District	16	AZ	32	MAS	\N	39.03407220	48.65893540	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q476695
556	Oghuz District	16	AZ	37	OGU	\N	41.07279240	47.46506720	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q643989
557	Saatly District	16	AZ	45	SAT	\N	39.90955030	48.35951220	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q601105
558	Lankaran District	16	AZ	29	LA	\N	38.75286690	48.84750150	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q269986
559	Agdam District	16	AZ	03	AGM	\N	39.99318530	46.99495620	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q201647
560	Balakan District	16	AZ	10	BAL	\N	41.70375090	46.40442130	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q330850
561	Dashkasan District	16	AZ	16	DAS	\N	40.52022570	46.07793040	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q457494
562	Nakhchivan Autonomous Republic	16	AZ	35	NX	\N	39.32568140	45.49126480	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q131083
563	Quba District	16	AZ	42	QBA	\N	41.15642420	48.41350210	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q457499
564	Ismailli District	16	AZ	25	ISM	\N	40.74299360	48.21255560	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q344252
565	Sabirabad District	16	AZ	46	SAB	\N	39.98706630	48.46925450	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q382132
566	Zaqatala District	16	AZ	70	ZAQ	\N	41.59068890	46.72403730	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q147553
567	Kangarli District	16	AZ	70	KAN	\N	39.38719400	45.16398520	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q734030
568	Martuni	16	AZ	65	XVD	\N	39.79146930	47.11008140	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q330813
569	Barda District	16	AZ	11	BAR	\N	40.37065550	47.13789090	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q330857
570	Jabrayil District	16	AZ	14	CAB	\N	39.26455440	46.96215620	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q457491
571	Hajigabul District	16	AZ	23	HAC	\N	40.03937700	48.92025330	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q476690
572	Julfa District	16	AZ	23	CUL	\N	38.96049830	45.62929390	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q644035
573	Gobustan District	16	AZ	41	QOB	\N	40.53261040	48.92737500	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q457508
574	Goygol District	16	AZ	62	GYG	\N	40.55953780	46.33149530	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q388087
575	Babek District	16	AZ	62	BAB	\N	39.15076130	45.44853680	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q643895
576	Zardab District	16	AZ	71	ZAR	\N	40.21481140	47.71494400	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q249293
577	Aghjabadi District	16	AZ	02	AGC	\N	28.78918410	77.51607880	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q330818
578	Jalilabad District	16	AZ	15	CAL	\N	39.20516320	48.51006040	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q372795
579	Shahbuz District	16	AZ	15	SAH	\N	39.44521030	45.65680090	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q388081
580	Mingachevir	16	AZ	33	MI	\N	40.77025630	47.04960150	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q230932
581	Zangilan District	16	AZ	69	ZAN	\N	39.08568990	46.65247280	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q249252
582	Sumqayit	16	AZ	54	SM	\N	40.58547650	49.63174110	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q179833
583	Shamkir District	16	AZ	51	SKR	\N	40.82881440	46.01668790	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q467491
584	Siazan District	16	AZ	53	SIY	\N	41.07838330	49.11184770	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q820940
585	Ganja	16	AZ	20	GA	\N	36.36873380	-95.99857670	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q131290
586	Shaki District	16	AZ	47	SAK	\N	41.11346620	47.13169270	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q330864
587	Lankaran	16	AZ	30	LAN	\N	38.75286690	48.84750150	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q228811
588	Qusar District	16	AZ	44	QUS	\N	41.42668860	48.43455770	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q386506
589	Gədəbəy	16	AZ	19	GAD	\N	40.56996390	45.81068830	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q330749
590	Khachmaz District	16	AZ	60	XAC	\N	41.45911680	48.80206260	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q6398826
591	Shabran District	16	AZ	17	SBN	\N	41.22283760	48.84573040	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q387994
592	Shusha District	16	AZ	55	SUS	\N	39.75374380	46.74647550	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q388960
593	Skrapar District	3	AL	55	SK	\N	40.53499460	20.28322170	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q194381
594	Kavajë District	3	AL	55	KA	\N	41.18445290	19.56275960	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q194182
595	Lezhë District	3	AL	48	LE	\N	41.78607300	19.64607580	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q194185
596	Librazhd District	3	AL	48	LB	\N	41.18292320	20.31747690	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q207002
597	Korçë District	3	AL	46	KO	\N	40.59056700	20.61689210	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q191491
598	Elbasan County	3	AL	43	03	\N	41.12666720	20.23556470	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q193790
599	Lushnjë District	3	AL	43	LU	\N	40.94198300	19.69964280	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q206994
600	Has District	3	AL	43	HA	\N	42.79013360	-83.61220120	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q207007
601	Kukës County	3	AL	47	07	\N	42.08074640	20.41429230	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q231896
602	Malësi e Madhe District	3	AL	47	MM	\N	42.42451730	19.61631850	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q236845
603	Berat County	3	AL	40	01	\N	40.69530120	20.04496620	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q189296
604	Gjirokastër County	3	AL	45	05	\N	40.06728740	20.10452290	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q193454
605	Dibër District	3	AL	41	DI	\N	41.58881630	20.23556470	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q192123
606	Pogradec District	3	AL	41	PG	\N	40.90153140	20.65562890	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q202197
607	Bulqizë District	3	AL	41	BU	\N	41.49425870	20.21471570	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q191872
608	Devoll District	3	AL	41	DV	\N	40.64473470	20.95066360	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q192126
609	Lezhë County	3	AL	48	08	\N	41.78137590	19.80679160	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q193436
610	Dibër County	3	AL	41	09	\N	41.58881630	20.23556470	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q192866
611	Shkodër County	3	AL	49	10	\N	42.15037100	19.66393090	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q193438
612	Kuçovë District	3	AL	49	KC	\N	40.78370630	19.87823480	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q211946
613	Vlorë District	3	AL	51	VL	\N	40.46606680	19.49135600	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q158601
614	Krujë District	3	AL	51	KR	\N	41.50947650	19.77107320	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q205261
615	Tirana County	3	AL	50	11	\N	41.24275980	19.80679160	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q229892
616	Tepelenë District	3	AL	50	TE	\N	40.29666320	20.01816730	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q202656
617	Gramsh District	3	AL	50	GR	\N	40.86698730	20.18493230	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q210090
618	Delvinë District	3	AL	50	DL	\N	39.94813640	20.09558910	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q166959
619	Peqin District	3	AL	50	PQ	\N	41.04709020	19.75023840	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q202652
620	Pukë District	3	AL	50	PU	\N	42.04697720	19.89609680	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q206997
621	Gjirokastër District	3	AL	45	GJ	\N	40.06728740	20.10452290	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q209749
622	Kurbin District	3	AL	45	KB	\N	41.64126440	19.70559500	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q123602
623	Kukës District	3	AL	47	KU	\N	42.08074640	20.41429230	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q123395
624	Sarandë District	3	AL	47	SR	\N	39.85921190	20.02710010	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q748235
625	Përmet District	3	AL	47	PR	\N	40.23618370	20.35173340	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q121074
626	Shkodër District	3	AL	49	SH	\N	42.06929850	19.50325590	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q194176
627	Fier District	3	AL	44	FR	\N	40.72750400	19.56275960	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q209019
628	Kolonjë District	3	AL	44	ER	\N	40.33732620	20.67946760	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q194178
629	Berat District	3	AL	40	BR	\N	40.70863770	19.94373140	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q202981
630	Korçë County	3	AL	46	06	\N	40.59056700	20.61689210	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q193464
631	Fier County	3	AL	44	04	\N	40.91913920	19.66393090	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q231900
632	Durrës County	3	AL	42	02	\N	41.50809720	19.61631850	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q192853
633	Tirana District	3	AL	50	TR	\N	41.32754590	19.81869820	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q201073
634	Vlorë County	3	AL	51	12	\N	40.15009600	19.80679160	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q192849
635	Mat District	3	AL	51	MT	\N	41.59376750	19.99732440	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q202665
636	Tropojë District	3	AL	51	TP	\N	42.39821510	20.16259550	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q123615
637	Mallakastër District	3	AL	51	MK	\N	40.52733760	19.78297910	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q207437
638	Mirditë District	3	AL	51	MR	\N	41.76428600	19.90205090	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q236850
639	Durrës District	3	AL	42	DR	\N	41.37065170	19.52110630	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q37662
640	Sveti Nikole Municipality	129	MK	A4	69	\N	41.89803120	21.99994350	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2308277
641	Kratovo Municipality	129	MK	51	43	\N	42.05371410	22.07148350	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1992716
642	Zajas Municipality	129	MK	C1	31	\N	41.60303280	20.87913430	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2018939
643	Staro Nagoričane Municipality	129	MK	97	71	\N	42.21916920	21.90455410	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2128903
644	Češinovo-Obleševo Municipality	129	MK	19	81	\N	41.86393160	22.26224600	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q281898
645	Debarca Municipality	129	MK	F5	22	\N	41.35840770	20.85529190	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1323340
646	Probištip Municipality	129	MK	83	63	\N	41.95891460	22.16686700	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2270414
647	Krivogaštani Municipality	129	MK	53	45	\N	41.30823060	21.36796890	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2018930
648	Gevgelija Municipality	129	MK	33	18	\N	41.21186060	22.38146240	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2018974
649	Bogdanci Municipality	129	MK	08	05	\N	41.18696160	22.59602680	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1992752
650	Vraneštica Municipality	129	MK	B6	15	\N	41.48290870	21.05796320	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1998500
651	Veles Municipality	129	MK	F1	13	\N	41.72744260	21.71376940	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2088561
652	Bosilovo Municipality	129	MK	11	07	\N	41.49048640	22.78671740	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1779775
653	Mogila Municipality	129	MK	D9	53	\N	41.14796450	21.45143690	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1839369
654	Tearce Municipality	129	MK	A5	75	\N	42.07775110	21.05349230	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2282274
655	Demir Kapija Municipality	129	MK	25	24	\N	41.37955380	22.21455710	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2370973
656	Aračinovo Municipality	129	MK	01	02	\N	42.02473810	21.57664070	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q597345
657	Drugovo Municipality	129	MK	30	28	\N	41.44081530	20.92682010	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1996439
658	Vasilevo Municipality	129	MK	A9	11	\N	41.47416990	22.64221280	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2018980
659	Lipkovo Municipality	129	MK	59	48	\N	42.20066260	21.61837550	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2041236
660	Brvenica Municipality	129	MK	12	08	\N	41.96814820	20.98195860	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1057563
661	Štip Municipality	129	MK	98	83	\N	41.70792970	22.19071220	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2423082
662	Vevčani Municipality	129	MK	B3	12	\N	41.24075430	20.59156490	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2029825
663	Tetovo Municipality	129	MK	E8	76	\N	42.02748600	20.95066360	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q3245456
664	Negotino Municipality	129	MK	69	54	\N	41.49899850	22.09532970	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q3246545
665	Konče Municipality	129	MK	47	41	\N	41.51710110	22.38146240	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1992728
666	Prilep Municipality	129	MK	E3	62	\N	41.26931420	21.71376940	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q6312454
667	Saraj Municipality	129	MK	90	68	\N	41.98694960	21.26065540	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1309481
668	Želino Municipality	129	MK	C3	30	\N	41.90065310	21.11757670	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1996410
669	Mavrovo and Rostuša Municipality	129	MK	E4	50	\N	41.60924270	20.60124880	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1323332
670	Plasnica Municipality	129	MK	80	61	\N	41.45463490	21.10565390	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2018921
671	Valandovo Municipality	129	MK	E9	10	\N	41.32119090	22.50066930	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2018965
672	Vinica Municipality	129	MK	B4	14	\N	41.85710200	22.57218810	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2479526
673	Zrnovci Municipality	129	MK	C6	33	\N	41.82282210	22.41722560	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q950881
674	Karbinci	129	MK	40	37	\N	41.81801590	22.23247580	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1346554
675	Dolneni Municipality	129	MK	28	27	\N	41.46409350	21.40374070	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1992691
676	Čaška Municipality	129	MK	C9	80	\N	41.64743800	21.69141150	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1994547
677	Kriva Palanka Municipality	129	MK	52	44	\N	42.20584540	22.33079650	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1422453
678	Jegunovce Municipality	129	MK	D5	35	\N	42.07407200	21.12204780	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q431908
679	Bitola Municipality	129	MK	06	04	\N	41.03633020	21.33219740	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q159380
680	Šuto Orizari Municipality	129	MK	A3	84	\N	42.02904160	21.40970270	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1020859
681	Karpoš Municipality	129	MK	41	38	\N	41.97096610	21.39181680	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1463246
682	Oslomej Municipality	129	MK	77	57	\N	41.57583910	21.02219600	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2001785
683	Kumanovo Municipality	129	MK	D7	47	\N	42.07326130	21.78531430	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2352376
684	Greater Skopje	129	MK	F6	85	\N	41.99812940	21.42543550	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2575820
685	Pehčevo Municipality	129	MK	78	60	\N	41.77371320	22.88204890	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q426114
686	Kisela Voda Municipality	129	MK	44	39	\N	41.92748000	21.49317130	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1386136
687	Demir Hisar Municipality	129	MK	D3	25	\N	41.22708300	21.14142260	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q856278
688	Kičevo Municipality	129	MK	43	40	\N	41.51291120	20.95250650	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2018957
689	Vrapčište Municipality	129	MK	B7	16	\N	41.87911600	20.83145000	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1996740
690	Ilinden Municipality	129	MK	36	34	\N	41.99574430	21.56769750	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q657754
691	Rosoman Municipality	129	MK	87	67	\N	41.48480060	21.88070640	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2088585
692	Makedonski Brod Municipality	129	MK	D8	52	\N	41.51330880	21.21743290	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2364199
693	Gostivar Municipality	129	MK	D4	19	\N	41.80255410	20.90893780	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q521112
694	Butel Municipality	129	MK	F4	09	\N	42.08950680	21.46336100	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q935620
695	Delčevo Municipality	129	MK	22	23	\N	41.96843870	22.76288300	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1323322
696	Novaci Municipality	129	MK	E1	55	\N	41.04426610	21.45888940	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2088022
697	Dojran Municipality	129	MK	E5	26	\N	41.24366720	22.69137640	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1996413
698	Petrovec Municipality	129	MK	79	59	\N	41.90298970	21.68992100	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1018191
699	Ohrid Municipality	129	MK	E2	58	\N	41.06820880	20.75992660	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1125333
700	Struga Municipality	129	MK	E6	72	\N	41.31737440	20.66456830	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q749618
701	Makedonska Kamenica Municipality	129	MK	62	51	\N	42.06946040	22.54834900	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2041219
702	Centar Municipality	129	MK	62	77	\N	41.96989340	21.42162670	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1463152
703	Aerodrom Municipality	129	MK	F3	01	\N	41.94643630	21.49317130	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1992708
704	Čair Municipality	129	MK	C8	79	\N	41.99303550	21.43653180	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1419314
705	Lozovo Municipality	129	MK	60	49	\N	41.78181390	21.90008270	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1996470
706	Zelenikovo Municipality	129	MK	C2	32	\N	41.87338120	21.60272500	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q9050283
707	Gazi Baba Municipality	129	MK	32	17	\N	42.01629610	21.49913340	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2019836
708	Gradsko Municipality	129	MK	35	20	\N	41.59916080	21.88070640	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1992701
709	Radoviš Municipality	129	MK	84	64	\N	41.64955310	22.47682870	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2738284
710	Strumica Municipality	129	MK	E7	73	\N	41.43780040	22.64274280	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2308287
711	Studeničani Municipality	129	MK	A2	74	\N	41.92256390	21.53639650	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2088034
712	Resen Municipality	129	MK	86	66	\N	40.93680930	21.04604070	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q740591
713	Kavadarci Municipality	129	MK	D6	36	\N	41.28900680	21.99994350	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1155055
714	Kruševo Municipality	129	MK	54	46	\N	41.37693310	21.26065540	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2476159
715	Čučer-Sandevo Municipality	129	MK	20	82	\N	42.14839460	21.40374070	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q629720
716	Berovo Municipality	129	MK	04	03	\N	41.66619290	22.76288300	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q793727
717	Rankovce Municipality	129	MK	85	65	\N	42.18081410	22.09532970	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1475001
718	Novo Selo Municipality	129	MK	72	56	\N	41.43255800	22.88204890	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1946579
719	Sopište Municipality	129	MK	92	70	\N	41.86384920	21.30834990	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2282240
720	Centar Župa Municipality	129	MK	18	78	\N	41.46522590	20.59305480	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1779085
721	Bogovinje Municipality	129	MK	C7	06	\N	41.92363710	20.91638870	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q9035785
722	Gjorče Petrov Municipality	129	MK	29	29	\N	42.06063740	21.32027360	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q924278
723	Kočani Municipality	129	MK	46	42	\N	41.98583740	22.40530460	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1819289
724	Požega-Slavonia	55	HR	11	11	county	45.34178680	17.81143590	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58111
725	Split-Dalmatia	55	HR	15	17	county	43.52403280	16.81783770	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58253
726	Međimurje	55	HR	09	20	county	46.37666440	16.42132980	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58330
727	Zadar	55	HR	19	13	county	44.14693900	15.61649430	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58146
728	Dubrovnik-Neretva	55	HR	03	19	county	43.07665880	17.52684710	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58289
729	Krapina-Zagorje	55	HR	07	02	county	46.10133930	15.88096930	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q57056
730	Šibenik-Knin	55	HR	13	15	county	43.92814850	16.10376940	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58194
731	Lika-Senj	55	HR	08	09	county	44.61922180	15.47016080	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58081
732	Virovitica-Podravina	55	HR	17	10	county	45.65579850	17.79324720	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58092
733	Sisak-Moslavina	55	HR	14	03	county	45.38379260	16.53809940	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q57060
734	Bjelovar-Bilogora	55	HR	01	07	county	45.89879720	16.84230930	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58060
735	Primorje-Gorski Kotar	55	HR	12	08	county	45.31739960	14.81674660	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58071
736	Zagreb	55	HR	20	01	county	45.87066120	16.39549100	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q27038
737	Brod-Posavina	55	HR	02	12	county	45.26379510	17.32645620	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58129
738	Zagreb	55	HR	21	21	city	45.81501080	15.98191890	2019-10-05 23:18:38	2022-05-08 20:24:42	1	Q1435
739	Varaždin	55	HR	16	05	county	46.23174730	16.33605590	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q57967
740	Osijek-Baranja	55	HR	10	14	county	45.55764280	18.39421410	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58159
741	Vukovar-Syrmia	55	HR	18	16	county	45.17735520	18.80535270	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58225
742	Koprivnica-Križevci	55	HR	06	06	county	46.15689190	16.83908260	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58026
743	Istria	55	HR	04	18	county	45.12864550	13.90154200	2019-10-05 23:18:38	2022-05-08 20:25:51	1	Q58268
744	Kyrenia District (Keryneia)	57	CY	02	06	district	35.29919400	33.23632460	2019-10-05 23:18:38	2021-10-30 20:20:18	1	Q59146
745	Nicosia District (Lefkoşa)	57	CY	04	01	district	35.18556590	33.38227640	2019-10-05 23:18:38	2021-10-30 20:20:14	1	Q59147
746	Paphos District (Pafos)	57	CY	06	05	district	34.91645940	32.49200880	2019-10-05 23:18:38	2021-10-30 20:20:17	1	Q59133
747	Larnaca District (Larnaka)	57	CY	03	03	district	34.85072060	33.48319060	2019-10-05 23:18:38	2021-10-30 20:20:16	1	Q59153
748	Limassol District (Leymasun)	57	CY	05	02	district	34.70713010	33.02261740	2019-10-05 23:18:38	2021-10-30 20:20:15	1	Q59150
749	Famagusta District (Mağusa)	57	CY	01	04	district	35.28570230	33.84112880	2019-10-05 23:18:38	2021-10-30 20:20:16	1	Q59148
750	Rangpur Division	19	BD	87	F	division	25.84833880	88.94138650	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q876023
751	Cox\\"s Bazar District	19	BD	87	11	district	21.56406260	92.02821290	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1122278
752	Bandarban District	19	BD	87	01	district	21.83110020	92.36863210	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q806273
753	Rajshahi Division	19	BD	83	E	division	24.71057760	88.94138650	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q379382
754	Pabna District	19	BD	83	49	district	24.15850500	89.44807180	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1083505
755	Sherpur District	19	BD	83	57	district	25.07462350	90.14949040	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2039314
756	Bhola District	19	BD	83	07	district	22.17853150	90.71010230	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q855042
757	Jessore District	19	BD	83	22	district	23.16340140	89.21816640	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1862981
758	Mymensingh Division	19	BD	H	H	division	24.71362000	90.45023680	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q19594930
759	Rangpur District	19	BD	87	55	district	25.74679250	89.25083350	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2344570
760	Dhaka Division	19	BD	81	C	division	23.95357420	90.14949880	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q330158
761	Chapai Nawabganj District	19	BD	81	45	district	24.74131110	88.29120690	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q46043
762	Faridpur District	19	BD	81	15	district	23.54239190	89.63089210	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2093552
763	Comilla District	19	BD	81	08	district	23.45756670	91.18089960	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1480778
764	Netrokona District	19	BD	81	41	district	24.81032840	90.86564150	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2344966
765	Sylhet Division	19	BD	86	G	division	24.70498110	91.67606910	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q459732
766	Mymensingh District	19	BD	H	34	district	24.75385750	90.40729190	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1429976
767	Sylhet District	19	BD	86	60	district	24.89933570	91.87004730	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2093352
768	Chandpur District	19	BD	86	09	district	23.25131480	90.85178460	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1429697
769	Narail District	19	BD	86	43	district	23.11629290	89.58404040	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1550260
770	Narayanganj District	19	BD	86	40	district	23.71466010	90.56360900	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2208354
771	Dhaka District	19	BD	81	13	district	23.81051400	90.33718890	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1850485
772	Nilphamari District	19	BD	81	46	district	25.84827980	88.94141340	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2188627
773	Rajbari District	19	BD	81	53	district	23.71513400	89.58748190	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2348762
774	Kushtia District	19	BD	81	30	district	23.89069950	89.10993680	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q956895
775	Khulna Division	19	BD	82	D	division	22.80878160	89.24671910	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q501696
776	Meherpur District	19	BD	82	39	district	23.80519910	88.67235780	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1474206
777	Patuakhali District	19	BD	82	51	district	22.22486320	90.45475030	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1429761
778	Jhalokati District	19	BD	82	25	district	22.57208000	90.18696440	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2093327
779	Kishoreganj District	19	BD	82	26	district	24.42604570	90.98206680	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2344833
780	Lalmonirhat District	19	BD	82	32	district	25.99233980	89.28472510	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2373734
781	Sirajganj District	19	BD	82	59	district	24.31411150	89.56996150	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2429432
782	Tangail District	19	BD	82	63	district	24.39174270	89.99482570	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q952184
783	Dinajpur District	19	BD	82	14	district	25.62791230	88.63317580	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1985120
784	Barguna District	19	BD	82	02	district	22.09529150	90.11206960	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q808172
785	Chittagong District	19	BD	84	10	district	22.51501050	91.75388170	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1074991
786	Khagrachari District	19	BD	84	29	district	23.13217510	91.94902100	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q1429685
787	Natore District	19	BD	84	44	district	24.41024300	89.00761770	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2093361
788	Chuadanga District	19	BD	84	12	district	23.61605120	88.82630060	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2094570
789	Jhenaidah District	19	BD	84	23	district	23.54498730	89.17260310	2019-10-05 23:18:38	2022-08-31 15:52:51	1	Q2188750
790	Munshiganj District	19	BD	84	35	district	23.49809310	90.41266210	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q1990519
791	Pirojpur District	19	BD	84	50	district	22.57907440	89.97592640	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q609190
792	Gopalganj District	19	BD	84	17	district	26.48315840	84.43655000	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q1537813
793	Kurigram District	19	BD	84	28	district	25.80724140	89.62947460	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2348751
794	Moulvibazar District	19	BD	84	38	district	24.30953440	91.73149030	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q281435
795	Gaibandha District	19	BD	84	19	district	25.32969280	89.54296520	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2344595
796	Bagerhat District	19	BD	84	05	district	22.66024360	89.78954780	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2344861
797	Bogra District	19	BD	84	03	district	24.85104020	89.36972250	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2039066
798	Gazipur District	19	BD	84	18	district	24.09581710	90.41251810	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2094101
799	Satkhira District	19	BD	84	58	district	22.31548120	89.11145250	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q1233680
800	Panchagarh District	19	BD	84	52	district	26.27087050	88.59517510	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2367822
801	Shariatpur District	19	BD	84	62	district	23.24232140	90.43477110	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q253007
802	Bahadia	19	BD	84	33	\N	23.78987120	90.16714830	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2024719
803	Chittagong Division	19	BD	84	B	division	23.17931570	91.98815270	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q158087
804	Thakurgaon District	19	BD	84	64	district	26.04183920	88.42826160	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2367825
805	Habiganj District	19	BD	84	20	district	24.47712360	91.45065650	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q1438974
806	Joypurhat District	19	BD	84	24	district	25.09473490	89.09449370	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2348146
807	Barisal Division	19	BD	85	A	division	22.38111310	90.33718890	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q459723
808	Jamalpur District	19	BD	85	21	district	25.08309260	89.78532180	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2039306
809	Rangamati Hill District	19	BD	85	56	district	22.73241730	92.29851340	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2121686
810	Brahmanbaria District	19	BD	85	04	district	23.96081810	91.11150140	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q897330
811	Khulna District	19	BD	82	27	district	22.67377350	89.39665810	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2093344
812	Sunamganj District	19	BD	82	61	district	25.07145350	91.39916270	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2093388
813	Rajshahi District	19	BD	83	54	district	24.37330870	88.60487160	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2344697
814	Naogaon District	19	BD	83	48	district	24.91315970	88.75309520	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2094277
815	Noakhali District	19	BD	83	47	district	22.87237890	91.09731840	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q68585
816	Feni District	19	BD	83	16	district	22.94087840	91.40666460	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q1404741
817	Madaripur District	19	BD	83	36	district	23.23933460	90.18696440	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q928836
818	Barisal District	19	BD	85	06	district	22.70220980	90.36963160	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q1763301
819	Lakshmipur District	19	BD	85	31	district	22.94467440	90.82819070	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q1550252
820	Okayama Prefecture	109	JP	31	33	\N	34.89634070	133.63753140	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q132936
821	Chiba Prefecture	109	JP	04	12	\N	35.33541550	140.18325160	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q80011
822	Ōita Prefecture	109	JP	30	44	\N	33.15892990	131.36111210	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q133924
823	Tokyo	109	JP	40	13	\N	35.67619190	139.65031060	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q1490
824	Nara Prefecture	109	JP	28	29	\N	34.29755280	135.82797340	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q131287
825	Shizuoka Prefecture	109	JP	37	22	\N	35.09293970	138.31902760	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q131320
826	Shimane Prefecture	109	JP	36	32	\N	35.12440940	132.62934460	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q132751
827	Aichi Prefecture	109	JP	01	23	\N	35.01825050	137.29238930	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q80434
828	Hiroshima Prefecture	109	JP	11	34	\N	34.88234080	133.01948970	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q617375
829	Akita Prefecture	109	JP	02	05	\N	40.13762930	140.33434100	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q81863
830	Ishikawa Prefecture	109	JP	15	17	\N	36.32603170	136.52896530	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q131281
831	Hyōgo Prefecture	109	JP	13	28	\N	34.85795180	134.54537870	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q130290
832	Hokkaidō Prefecture	109	JP	12	01	\N	43.22032660	142.86347370	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q1037393
833	Mie Prefecture	109	JP	23	24	\N	33.81439010	136.04870470	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q128196
834	Kyōto Prefecture	109	JP	22	26	\N	35.15666090	135.52519820	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q120730
835	Yamaguchi Prefecture	109	JP	45	35	\N	34.27967690	131.52127420	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q127264
836	Tokushima Prefecture	109	JP	39	36	\N	33.94196550	134.32365570	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q160734
837	Yamagata Prefecture	109	JP	44	06	\N	38.53705640	140.14351980	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q125863
838	Toyama Prefecture	109	JP	42	16	\N	36.69582660	137.21370710	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q132929
839	Aomori Prefecture	109	JP	03	02	\N	40.76570770	140.91758790	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q71699
840	Kagoshima Prefecture	109	JP	18	46	\N	31.39119580	130.87785860	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q15701
841	Niigata Prefecture	109	JP	29	15	\N	37.51783860	138.92697940	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q132705
842	Kanagawa Prefecture	109	JP	19	14	\N	35.49135350	139.28414300	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q127513
843	Nagano Prefecture	109	JP	26	20	\N	36.15439410	137.92182040	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q127877
844	Wakayama Prefecture	109	JP	43	30	\N	33.94809140	135.37453580	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q131314
845	Shiga Prefecture	109	JP	35	25	\N	35.32920140	136.05632120	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q131358
846	Kumamoto Prefecture	109	JP	21	43	\N	32.85944270	130.79691490	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q130308
847	Fukushima Prefecture	109	JP	08	07	\N	37.38343730	140.18325160	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q71707
848	Fukui Prefecture	109	JP	06	18	\N	35.89622700	136.21115790	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q133879
849	Nagasaki Prefecture	109	JP	27	42	\N	33.24885250	129.69309120	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q169376
850	Tottori Prefecture	109	JP	41	31	\N	35.35731610	133.40666180	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q133935
851	Ibaraki Prefecture	109	JP	14	08	\N	36.21935710	140.18325160	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q83273
852	Yamanashi Prefecture	109	JP	46	19	\N	35.66351130	138.63888790	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q132720
853	Okinawa Prefecture	109	JP	47	47	\N	26.12019110	127.70250120	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q766445
854	Tochigi Prefecture	109	JP	38	09	\N	36.67147390	139.85472660	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q44843
855	Miyazaki Prefecture	109	JP	25	45	\N	32.60360220	131.44125100	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q130300
856	Iwate Prefecture	109	JP	16	03	\N	39.58329890	141.25345740	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q48326
857	Miyagi Prefecture	109	JP	24	04	\N	38.63061200	141.11930480	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q47896
858	Gifu Prefecture	109	JP	09	21	\N	35.74374910	136.98051030	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q131277
859	Ōsaka Prefecture	109	JP	32	27	\N	34.64133150	135.56293940	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q122723
860	Saitama Prefecture	109	JP	34	11	\N	35.99625130	139.44660050	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q128186
861	Fukuoka Prefecture	109	JP	07	40	\N	33.56625590	130.71585700	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q123258
862	Gunma Prefecture	109	JP	10	10	\N	36.56053880	138.87999720	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q129499
863	Saga Prefecture	109	JP	33	41	\N	33.30783710	130.22712430	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q160420
864	Kagawa Prefecture	109	JP	17	37	\N	34.22259150	134.01991520	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q161454
865	Ehime Prefecture	109	JP	05	38	\N	33.60253060	132.78575830	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q123376
866	Ontario	39	CA	08	ON	province	51.25377500	-85.32321400	2019-10-05 23:18:39	2022-01-16 11:58:39	1	Q1904
867	Manitoba	39	CA	03	MB	province	53.76086080	-98.81387620	2019-10-05 23:18:39	2022-01-16 11:58:16	1	Q1948
868	New Brunswick	39	CA	04	NB	province	46.56531630	-66.46191640	2019-10-05 23:18:39	2022-01-16 11:58:17	1	Q1965
869	Yukon	39	CA	12	YT	territory	35.50672150	-97.76254410	2019-10-05 23:18:39	2022-01-16 11:58:51	1	Q2009
870	Saskatchewan	39	CA	11	SK	province	52.93991590	-106.45086390	2019-10-05 23:18:39	2022-01-16 11:58:50	1	Q1989
871	Prince Edward Island	39	CA	09	PE	province	46.51071200	-63.41681360	2019-10-05 23:18:39	2022-01-16 11:58:48	1	Q1979
872	Alberta	39	CA	01	AB	province	53.93327060	-116.57650350	2019-10-05 23:18:39	2022-01-16 11:58:09	1	Q1951
873	Quebec	39	CA	10	QC	province	52.93991590	-73.54913610	2019-10-05 23:18:39	2022-01-16 11:58:48	1	Q176
874	Nova Scotia	39	CA	07	NS	province	44.68198660	-63.74431100	2019-10-05 23:18:39	2022-01-16 11:58:28	1	Q1952
875	British Columbia	39	CA	02	BC	province	53.72666830	-127.64762050	2019-10-05 23:18:39	2022-01-16 11:58:15	1	Q1974
876	Nunavut	39	CA	14	NU	territory	70.29977110	-83.10757700	2019-10-05 23:18:39	2022-01-16 11:58:40	1	Q2023
877	Newfoundland and Labrador	39	CA	05	NL	province	53.13550910	-57.66043640	2019-10-05 23:18:39	2022-01-16 11:58:18	1	Q2003
878	Northwest Territories	39	CA	13	NT	territory	64.82554410	-124.84573340	2019-10-05 23:18:39	2022-01-16 11:58:27	1	Q2007
879	White Nile	209	SD	41	NW	\N	9.33215160	31.46153000	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q311371
880	Red Sea	209	SD	36	RS	\N	20.28023200	38.51257300	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q310120
881	Khartoum	209	SD	29	KH	\N	15.50065440	32.55989940	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q310385
882	Sennar	209	SD	58	SI	\N	13.56746900	33.56720450	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q865534
883	South Kordofan	209	SD	50	KS	\N	11.19901920	29.41793240	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q465490
884	Kassala	209	SD	52	KA	\N	15.45813320	36.40396290	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q954963
885	Al Jazirah	209	SD	38	GZ	\N	14.88596110	33.43835300	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q309469
886	Al Qadarif	209	SD	39	GD	\N	14.02430700	35.36856790	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q309478
887	Blue Nile	209	SD	42	NB	\N	47.59867300	-122.33441900	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q309489
888	West Darfur	209	SD	47	DW	\N	12.84635610	23.00119890	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q846331
889	West Kordofan	209	SD	62	GK	\N	11.19901920	29.41793240	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q536396
890	North Darfur	209	SD	55	DN	\N	15.76619690	24.90422080	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q688306
891	River Nile	209	SD	53	NR	\N	23.97275950	32.87492060	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q849297
892	East Darfur	209	SD	60	DE	\N	14.37827470	24.90422080	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q3545641
893	North Kordofan	209	SD	56	KN	\N	13.83064410	29.41793240	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q864093
894	South Darfur	209	SD	49	DS	\N	11.64886390	24.90422080	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q838778
895	Northern	209	SD	43	NO	\N	38.06381700	-84.46286480	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q310118
896	Central Darfur	209	SD	61	DC	\N	14.37827470	24.90422080	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q4116493
897	Khelvachauri Municipality	81	GE	61	29	\N	41.58019260	41.66107420	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q175786
898	Senaki Municipality	81	GE	49	50	\N	42.26963600	42.06568960	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2490876
899	Tbilisi	81	GE	51	TB	\N	41.71513770	44.82709600	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q994
900	Adjara	81	GE	04	AJ	\N	41.60056260	42.06883830	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q45693
901	Autonomous Republic of Abkhazia	81	GE	02	AB	\N	43.00155440	41.02340700	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q2914461
902	Mtskheta-Mtianeti	81	GE	69	MM	\N	42.16821850	44.65060580	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q203339
903	Shida Kartli	81	GE	73	SK	\N	42.07569440	43.95404620	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q200047
904	Kvemo Kartli	81	GE	68	KK	\N	41.47918330	44.65604510	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q200048
905	Imereti	81	GE	66	IM	\N	42.23010800	42.90086640	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q200045
906	Samtskhe-Javakheti	81	GE	72	SJ	\N	41.54792960	43.27764000	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q19039
907	Guria	81	GE	65	GU	\N	41.94427360	42.04580910	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q19038
908	Samegrelo-Zemo Svaneti	81	GE	71	SZ	\N	42.73522470	42.16893620	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q200309
909	Racha-Lechkhumi and Kvemo Svaneti	81	GE	70	RL	\N	42.67188730	43.05628360	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q38893
910	Kakheti	81	GE	67	KA	\N	41.64816020	45.69055540	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q169674
911	Northern Province	198	SL	02	N	\N	\N	\N	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q912359
912	Southern Province	198	SL	03	S	\N	\N	\N	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q772185
913	Western Area	198	SL	04	W	\N	40.25459690	-80.24554440	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q1050475
914	Eastern Province	198	SL	01	E	\N	\N	\N	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q1050497
915	Hiran	203	SO	07	HI	\N	4.32101500	45.29938620	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q660040
916	Mudug	203	SO	10	MU	\N	6.56567260	47.76375650	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q877034
917	Bakool	203	SO	01	BK	\N	4.36572210	44.09603110	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q282471
918	Galguduud	203	SO	05	GA	\N	5.18501280	46.82528380	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q876772
919	Sanaag Region	203	SO	12	SA	\N	10.39382180	47.76375650	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q751387
920	Nugal	203	SO	18	NU	\N	43.27938610	17.03392050	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q1046329
921	Lower Shebelle	203	SO	14	SH	\N	1.87664580	44.24790150	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q877028
922	Middle Juba	203	SO	08	JD	\N	2.07804880	41.60118140	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q1046324
923	Middle Shebelle	203	SO	13	SD	\N	2.92502470	45.90396890	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q678435
924	Lower Juba	203	SO	09	JH	\N	0.22402100	41.60118140	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q877042
925	Awdal Region	203	SO	21	AW	\N	10.63342850	43.32946600	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q791667
926	Bay	203	SO	04	BY	\N	37.03655340	-95.61747670	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q812064
927	Banaadir	203	SO	02	BN	\N	2.11873750	45.33694590	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q806070
928	Gedo	203	SO	06	GE	\N	3.50392270	42.23624350	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q856719
929	Togdheer Region	203	SO	19	TO	\N	9.44605870	45.29938620	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q865590
930	Bari	203	SO	03	BR	\N	41.11714320	16.87187150	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q729170
931	Northern Cape	204	ZA	08	NC	\N	-29.04668080	21.85685860	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q132418
932	Free State	204	ZA	03	FS	\N	37.68585250	-97.28112560	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q160284
933	Limpopo	204	ZA	09	LP	\N	-23.40129460	29.41793240	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q134907
934	North West	204	ZA	10	NW	\N	32.75885200	-97.32880600	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q165956
935	KwaZulu-Natal	204	ZA	02	KZN	\N	-28.53055390	30.89582420	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q81725
936	Gauteng	204	ZA	06	GP	\N	-26.27075930	28.11226790	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q133083
937	Mpumalanga	204	ZA	07	MP	\N	-25.56533600	30.52790960	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q132410
938	Eastern Cape	204	ZA	05	EC	\N	-32.29684020	26.41938900	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q130840
939	Western Cape	204	ZA	11	WC	\N	-33.22779180	21.85685860	2019-10-05 23:18:39	2022-08-31 15:52:51	1	Q127167
940	Chontales	159	NI	04	CO	department	11.93947170	-85.18940450	2019-10-05 23:18:39	2021-11-13 19:38:26	1	Q498443
941	Managua	159	NI	10	MN	department	12.13916990	-86.33767610	2019-10-05 23:18:39	2021-11-13 19:38:26	1	Q260009
942	Rivas	159	NI	15	RI	department	11.40234900	-85.68457800	2019-10-05 23:18:39	2021-11-13 19:38:26	1	Q728127
943	Granada	159	NI	06	GR	department	11.93440730	-85.95600050	2019-10-05 23:18:39	2021-11-13 19:38:26	1	Q258405
944	León	159	NI	08	LE	department	12.50920370	-86.66110830	2019-10-05 23:18:39	2021-11-13 19:38:26	1	Q586818
945	Estelí	159	NI	05	ES	department	13.08511390	-86.36301970	2019-10-05 23:18:39	2021-11-13 19:38:26	1	Q728015
946	Boaco	159	NI	01	BO	department	12.46928400	-85.66146820	2019-10-05 23:18:39	2021-11-13 19:38:26	1	Q280973
947	Matagalpa	159	NI	12	MT	department	12.94984360	-85.43755740	2019-10-05 23:18:39	2021-11-13 19:38:26	1	Q728099
948	Madriz	159	NI	09	MD	department	13.47260050	-86.45920910	2019-10-05 23:18:39	2021-11-13 19:38:26	1	Q728056
949	Río San Juan	159	NI	14	SJ	department	11.47816100	-84.77333250	2019-10-05 23:18:39	2021-11-13 19:38:26	1	Q728155
950	Carazo	159	NI	02	CA	department	11.72747290	-86.21584970	2019-10-05 23:18:39	2021-11-13 19:38:26	1	Q461133
951	North Caribbean Coast	159	NI	17	AN	autonomous region	13.83944560	-83.93208060	2019-10-05 23:18:39	2021-11-13 19:38:02	1	Q498452
952	South Caribbean Coast	159	NI	18	AS	autonomous region	12.19185020	-84.10128610	2019-10-05 23:18:40	2021-11-13 19:38:02	1	Q291279
953	Masaya	159	NI	11	MS	department	11.97593280	-86.07334980	2019-10-05 23:18:40	2021-11-13 19:38:26	1	Q570358
954	Chinandega	159	NI	03	CI	department	12.88200620	-87.14228950	2019-10-05 23:18:40	2021-11-13 19:38:26	1	Q644024
955	Jinotega	159	NI	07	JI	department	13.08839070	-85.99939970	2019-10-05 23:18:40	2021-11-13 19:38:26	1	Q728120
956	Karak	111	JO	09	KA	\N	31.18535270	35.70476820	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q735245
957	Tafilah	111	JO	12	AT	\N	30.83380630	35.61605130	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q750259
958	Madaba	111	JO	23	MD	\N	31.71960970	35.79327540	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q750447
959	Aqaba	111	JO	21	AQ	\N	29.53208600	35.00628210	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q260796
960	Irbid	111	JO	18	IR	\N	32.55696360	35.84789650	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q721441
961	Balqa	111	JO	02	BA	\N	32.03668060	35.72884800	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q721431
962	Mafraq	111	JO	15	MA	\N	32.34169230	36.20201750	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q854871
963	Ajloun	111	JO	20	AJ	\N	32.33255840	35.75168440	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q506658
964	Ma\\"an	111	JO	19	MN	\N	30.19267890	35.72493190	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q606340
965	Amman	111	JO	16	AM	\N	31.94536330	35.92838950	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q472788
966	Jerash	111	JO	22	JA	\N	32.27472370	35.89609540	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q750270
967	Zarqa	111	JO	17	AZ	\N	32.06085050	36.09421210	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q721445
968	Manzini District	212	SZ	03	MA	\N	-26.50819990	31.37131640	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q305395
969	Hhohho District	212	SZ	01	HH	\N	-26.13656620	31.35416310	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q735570
970	Lubombo District	212	SZ	02	LU	\N	-26.78517730	31.81070790	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q856657
971	Shiselweni District	212	SZ	04	SH	\N	-26.98275770	31.35416310	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q845934
972	Al Jahra	117	KW	05	JA	\N	29.99318310	47.76347310	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q405701
973	Hawalli	117	KW	08	HA	\N	29.30567160	48.03076130	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q747432
974	Mubarak Al-Kabeer	117	KW	09	MU	\N	29.21224000	48.06051080	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q913370
975	Al Farwaniyah	117	KW	07	FA	\N	29.27335700	47.94001540	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q1072757
976	Capital	117	KW	02	KU	\N	26.22851610	50.58604970	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q1046645
977	Al Ahmadi	117	KW	04	AH	\N	28.57451250	48.10247430	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q552354
978	Luang Prabang Province	119	LA	17	LP	\N	20.06562290	102.62162110	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q747881
979	Vientiane Prefecture	119	LA	24	VT	\N	18.11054100	102.52980280	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q390377
980	Vientiane Province	119	LA	27	VI	\N	18.57050630	102.62162110	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q720066
981	Salavan Province	119	LA	19	SL	\N	15.81710730	106.25221430	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q302656
982	Attapeu Province	119	LA	01	AT	\N	14.93634000	107.10119310	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q503004
983	Xaisomboun Province	119	LA	28	XS	\N	18.43629240	104.47233010	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q20202028
984	Sekong Province	119	LA	26	XE	\N	15.57674460	107.00670310	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q585707
985	Bolikhamsai Province	119	LA	23	BL	\N	18.43629240	104.47233010	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q2403514
986	Khammouane Province	119	LA	15	KH	\N	17.63840660	105.21948080	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q506641
987	Phongsaly Province	119	LA	18	PH	\N	21.59193770	102.25479190	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q334868
988	Oudomxay Province	119	LA	07	OU	\N	20.49219290	101.88917210	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q465961
989	Houaphanh Province	119	LA	03	HO	\N	20.32541750	104.10013260	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q502997
990	Savannakhet Province	119	LA	20	SV	\N	16.50653810	105.59433880	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q465940
991	Bokeo Province	119	LA	22	BK	\N	20.28726620	100.70978670	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q334884
992	Luang Namtha Province	119	LA	16	LM	\N	20.91701870	101.16173560	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q948691
993	Sainyabuli Province	119	LA	13	XA	\N	19.39078860	101.52480550	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q465929
994	Xaisomboun	119	LA	25	XN	\N	\N	\N	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q846580
995	Xiangkhouang Province	119	LA	14	XI	\N	19.60930030	103.72891670	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q465947
996	Champasak Province	119	LA	02	CH	\N	14.65786640	105.96998780	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q334888
997	Talas Region	118	KG	06	T	\N	42.28673390	72.52048270	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q109838
998	Batken Region	118	KG	09	B	\N	39.97214250	69.85974060	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q487631
999	Naryn Region	118	KG	04	N	\N	41.29432270	75.34121790	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q486375
1000	Jalal-Abad Region	118	KG	03	J	\N	41.10680800	72.89880690	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q487640
1001	Bishkek	118	KG	01	GB	\N	42.87462120	74.56976170	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q9361
1002	Issyk-Kul Region	118	KG	07	Y	\N	42.18594280	77.56194190	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q487413
1003	Osh	118	KG	08	GO	\N	36.06313990	-95.91828950	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q47282
1004	Chuy Region	118	KG	02	C	\N	42.56550000	74.40566120	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q486370
1005	Osh Region	118	KG	08	O	\N	39.84073660	72.89880690	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q231987
1006	Trøndelag	165	NO	21	50	county	63.54201250	10.93692670	2019-10-05 23:18:40	2022-11-13 20:35:24	1	Q127676
1007	Oslo	165	NO	12	03	county	59.91386880	10.75224540	2019-10-05 23:18:40	2022-11-13 20:38:20	1	Q585
1009	Innlandet	165	NO	11	34	county	61.19357870	5.50832660	2019-10-05 23:18:40	2022-11-13 20:24:54	1	Q56404886
1011	Viken	165	NO	04	30	county	59.96530050	7.45051440	2019-10-05 23:18:40	2022-11-13 20:22:13	1	Q56407178
1013	Svalbard	165	NO	SV	21	arctic region	77.87497250	20.97518210	2019-10-05 23:18:40	2022-11-13 20:38:20	1	Q25231
1014	Agder	165	NO	19	42	county	58.74069340	6.75315210	2019-10-05 23:18:40	2022-11-13 20:29:05	1	Q2729021
1015	Troms og Finnmark	165	NO	18	54	county	69.77890670	18.99401840	2019-10-05 23:18:40	2022-11-13 20:36:57	1	Q52600648
1018	Vestland	165	NO	15	46	county	60.90694420	3.96270810	2019-10-05 23:18:40	2022-11-13 20:32:28	1	Q56407177
1020	Møre og Romsdal	165	NO	08	15	county	62.84068330	7.00714300	2019-10-05 23:18:40	2022-11-13 20:38:20	1	Q50627
1021	Rogaland	165	NO	14	11	county	59.14895440	6.01434320	2019-10-05 23:18:40	2022-11-13 20:38:20	1	Q50624
1024	Vestfold og Telemark	165	NO	17	38	county	59.41174820	7.76471750	2019-10-05 23:18:40	2022-11-13 20:26:29	1	Q56405721
1025	Nordland	165	NO	09	18	county	67.69305800	12.70739360	2019-10-05 23:18:40	2022-11-13 20:38:20	1	Q50630
1026	Jan Mayen	165	NO	JN	22	arctic region	71.03181800	-8.29203460	2019-10-05 23:18:40	2022-11-13 20:38:20	1	Q14056
1027	Hódmezővásárhely	99	HU	29	HV	city with county rights	46.41812620	20.33003150	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q124375
1028	Érd	99	HU	43	ER	city with county rights	47.39197180	18.90454400	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q193050
1029	Szeged	99	HU	19	SD	city with county rights	46.25301020	20.14142530	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q81581
1030	Nagykanizsa	99	HU	32	NK	city with county rights	46.45902180	16.98967960	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q14424
1031	Csongrád County	99	HU	06	CS	county	46.41670500	20.25661610	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q193031
1032	Debrecen	99	HU	07	DE	city with county rights	47.53160490	21.62731240	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q79880
1033	Székesfehérvár	99	HU	35	SF	city with county rights	47.18602620	18.42213580	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q130212
1034	Nyíregyháza	99	HU	33	NY	city with county rights	47.94953240	21.72440530	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q171223
1035	Somogy County	99	HU	17	SO	county	46.55485900	17.58667320	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q190522
1036	Békéscsaba	99	HU	26	BC	city with county rights	46.67359390	21.08773090	2019-10-05 23:18:40	2022-05-08 21:30:22	1	Q178878
1037	Eger	99	HU	28	EG	city with county rights	47.90253480	20.37722840	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q167109
1038	Tolna County	99	HU	21	TO	county	46.47627540	18.55706270	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q191625
1039	Vas County	99	HU	22	VA	county	47.09291110	16.68121830	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q187677
1040	Heves County	99	HU	11	HE	county	47.80576170	20.20385590	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q191604
1041	Győr	99	HU	25	GY	city with county rights	47.68745690	17.65039740	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q134494
1042	Győr-Moson-Sopron County	99	HU	09	GS	county	47.65092850	17.25058830	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q187753
1043	Jász-Nagykun-Szolnok County	99	HU	20	JN	county	47.25555790	20.52324560	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q189655
1044	Fejér County	99	HU	08	FE	county	47.12179320	18.52948150	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q187693
1045	Szabolcs-Szatmár-Bereg County	99	HU	18	SZ	county	48.03949540	22.00333000	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q190518
1046	Zala County	99	HU	24	ZA	county	46.73844040	16.91522520	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q185374
1047	Szolnok	99	HU	36	SK	city with county rights	47.16213550	20.18247120	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q181276
1048	Bács-Kiskun	99	HU	01	BK	county	46.56614370	19.42724640	2019-10-05 23:18:40	2022-05-08 21:30:22	1	Q181018
1049	Dunaújváros	99	HU	27	DU	city with county rights	46.96190590	18.93552270	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q187812
1050	Zalaegerszeg	99	HU	40	ZE	county	46.84169360	16.84163220	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q60037
1051	Nógrád County	99	HU	14	NO	county	47.90410310	19.04985040	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q194273
1052	Szombathely	99	HU	37	SH	city with county rights	47.23068510	16.62184410	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q42007
1053	Pécs	99	HU	15	PS	city with county rights	46.07273450	18.23226600	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q45779
1054	Veszprém County	99	HU	23	VE	county	47.09309740	17.91007630	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q188890
1055	Baranya	99	HU	02	BA	county	46.04845850	18.27191730	2019-10-05 23:18:40	2022-05-08 21:30:22	1	Q186195
1056	Kecskemét	99	HU	31	KM	city with county rights	46.89637110	19.68968610	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q171357
1057	Sopron	99	HU	34	SN	city with county rights	47.68166190	16.58447950	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q168648
1058	Borsod-Abaúj-Zemplén	99	HU	04	BZ	county	48.29394010	20.69341120	2019-10-05 23:18:40	2022-05-08 21:30:22	1	Q188895
1059	Pest County	99	HU	16	PE	county	47.44800010	19.46181280	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q188612
1060	Békés	99	HU	03	BE	county	46.67048990	21.04349960	2019-10-05 23:18:40	2022-05-08 21:30:22	1	Q191616
1061	Szekszárd	99	HU	42	SS	city with county rights	46.34743260	18.70622930	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q189761
1062	Veszprém	99	HU	39	VM	city with county rights	47.10280870	17.90930190	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q146317
1063	Hajdú-Bihar County	99	HU	10	HB	county	47.46883550	21.54532270	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q185368
1064	Budapest	99	HU	05	BU	capital city	47.49791200	19.04023500	2019-10-05 23:18:40	2022-05-08 21:30:22	1	Q1781
1065	Miskolc	99	HU	13	MI	city with county rights	48.10347750	20.77843840	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q102397
1066	Tatabánya	99	HU	38	TB	city with county rights	47.56924600	18.40481800	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q187821
1067	Kaposvár	99	HU	30	KV	city with county rights	46.35936060	17.79676390	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q184998
1068	Salgótarján	99	HU	41	ST	city with county rights	48.09352370	19.79998130	2019-10-05 23:18:40	2022-05-08 21:35:54	1	Q189769
1069	Tipperary	105	IE	26	TA	county	52.47378940	-8.16185140	2019-10-05 23:18:40	2022-03-13 16:43:20	1	Q184618
1070	Sligo	105	IE	25	SO	county	54.15532770	-8.60645320	2019-10-05 23:18:40	2022-03-13 16:43:20	1	Q179325
1071	Donegal	105	IE	06	DL	county	54.65489930	-8.10409670	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q179424
1072	Dublin	105	IE	07	D	county	53.34980530	-6.26030970	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q173500
1073	Leinster	105	IE	L	L	province	53.32715380	-7.51408410	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q159736
1074	Cork	105	IE	04	CO	county	51.89851430	-8.47560350	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q162475
1075	Monaghan	105	IE	22	MN	county	54.24920460	-6.96831320	2019-10-05 23:18:40	2022-03-13 16:43:20	1	Q184760
1076	Longford	105	IE	18	LD	county	53.72749820	-7.79315270	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q186220
1077	Kerry	105	IE	11	KY	county	52.15446070	-9.56686330	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q184469
1078	Offaly	105	IE	23	OY	county	53.23568710	-7.71222290	2019-10-05 23:18:40	2022-03-13 16:43:20	1	Q184445
1079	Galway	105	IE	10	G	county	53.35645090	-8.85341130	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q169923
1080	Munster	105	IE	M	M	province	51.94711970	7.58453200	2019-10-05 23:18:40	2022-03-13 16:43:20	1	Q131438
1081	Roscommon	105	IE	24	RN	county	53.75926040	-8.26816210	2019-10-05 23:18:40	2022-03-13 16:43:20	1	Q179437
1082	Kildare	105	IE	12	KE	county	53.21204340	-6.81947080	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q173332
1083	Louth	105	IE	19	LH	county	53.92523240	-6.48894230	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q183539
1084	Mayo	105	IE	20	MO	county	54.01526040	-9.42893690	2019-10-05 23:18:40	2022-03-13 16:43:20	1	Q178626
1085	Wicklow	105	IE	31	WW	county	52.98623130	-6.36725430	2019-10-05 23:18:40	2022-03-13 16:43:20	1	Q182591
1086	Ulster	105	IE	U	U	province	54.76165550	-6.96122730	2019-10-05 23:18:40	2022-03-13 16:43:20	1	Q93195
1087	Connacht	105	IE	U	C	province	53.83762430	-8.95844810	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q164421
1088	Cavan	105	IE	02	CN	county	53.97654240	-7.29966230	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q187402
1089	Waterford	105	IE	27	WD	county	52.19435490	-7.62275120	2019-10-05 23:18:40	2022-03-13 16:43:20	1	Q184594
1090	Kilkenny	105	IE	13	KK	county	52.57769570	-7.21800200	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q180231
1091	Clare	105	IE	03	CE	county	43.04664000	-87.89958100	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q181862
1092	Meath	105	IE	21	MH	county	53.60554800	-6.65641690	2019-10-05 23:18:40	2022-03-13 16:43:20	1	Q183544
1093	Wexford	105	IE	30	WX	county	52.47936030	-6.58399130	2019-10-05 23:18:40	2022-03-13 16:43:20	1	Q184599
1094	Limerick	105	IE	16	LK	county	52.50905170	-8.74749550	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q178283
1095	Carlow	105	IE	01	CW	county	52.72322170	-6.81082950	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q181882
1096	Laois	105	IE	15	LS	county	52.99429500	-7.33230070	2019-10-05 23:18:40	2022-03-13 16:42:13	1	Q55299
1097	Westmeath	105	IE	29	WH	county	53.53453080	-7.46532170	2019-10-05 23:18:40	2022-03-13 16:43:20	1	Q182633
1098	Djelfa	4	DZ	22	17	\N	34.67039560	3.25037610	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q233233
1099	El Oued	4	DZ	43	39	\N	33.36781100	6.85165110	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q233651
1100	El Tarf	4	DZ	44	36	\N	36.75766780	8.30763430	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q236788
1101	Oran	4	DZ	09	31	\N	35.60823510	-0.56360900	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q231331
1102	Naama	4	DZ	49	45	\N	33.26673170	-0.31286590	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q233675
1103	Annaba	4	DZ	37	23	\N	36.80205080	7.52472430	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q213944
1104	Bouïra	4	DZ	21	10	\N	36.36918460	3.90061940	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q233655
1105	Chlef	4	DZ	41	02	\N	36.16935150	1.28910360	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q231752
1106	Tiaret	4	DZ	13	14	\N	35.37086890	1.32178520	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q233258
1107	Tlemcen	4	DZ	15	13	\N	34.67802840	-1.36621600	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q233632
1108	Béchar	4	DZ	38	08	\N	31.62380980	-2.21624430	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q215467
1109	Médéa	4	DZ	06	26	\N	36.26370780	2.75878570	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q235810
1110	Skikda	4	DZ	31	21	\N	36.67211980	6.83509990	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q234227
1111	Blida	4	DZ	20	09	\N	36.53112300	2.89762540	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q233637
1112	Illizi	4	DZ	46	33	\N	26.16900050	8.48424650	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q233659
1113	Jijel	4	DZ	24	18	\N	36.71796810	5.98325770	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q235718
1114	Biskra	4	DZ	19	07	\N	34.84494370	5.72485670	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q458402
1115	Tipasa	4	DZ	55	42	\N	36.54626500	2.18432850	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q235814
1116	Bordj Bou Arréridj	4	DZ	39	34	\N	36.07399250	4.76302710	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q266411
1117	Tébessa	4	DZ	33	12	\N	35.12906910	7.95928630	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q267224
1118	Adrar	4	DZ	34	01	\N	26.41813100	-0.60147170	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q188166
1119	Aïn Defla	4	DZ	35	44	\N	36.25094290	1.93938150	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q168953
1120	Tindouf	4	DZ	54	37	\N	27.80631190	-5.72998210	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q231151
1121	Constantine	4	DZ	04	25	\N	36.33739110	6.66381200	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q232043
1122	Aïn Témouchent	4	DZ	36	46	\N	35.29926980	-1.13927920	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q233670
1123	Saïda	4	DZ	10	20	\N	34.84152070	0.14560550	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q233640
1124	Mascara	4	DZ	26	29	\N	35.39041250	0.14949880	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q236776
1125	Boumerdès	4	DZ	40	35	\N	36.68395590	3.62178020	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q236752
1126	Khenchela	4	DZ	47	40	\N	35.42694040	7.14601550	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q213950
1127	Ghardaïa	4	DZ	45	47	\N	32.49437410	3.64446000	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q17601
1128	Béjaïa	4	DZ	18	06	\N	36.75152580	5.05568370	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q233665
1129	El Bayadh	4	DZ	42	32	\N	32.71488240	0.90566230	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q235703
1130	Relizane	4	DZ	51	48	\N	35.73834050	0.75328090	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q236758
1131	Tizi Ouzou	4	DZ	14	15	\N	36.70691100	4.23333550	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q233645
1132	Mila	4	DZ	48	43	\N	36.36479570	6.15269850	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q235723
1133	Tissemsilt	4	DZ	56	38	\N	35.60537810	1.81309800	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q235805
1134	M\\"Sila	4	DZ	27	28	\N	35.71866460	4.52334230	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q240870
1135	Tamanghasset	4	DZ	53	11	\N	22.79029720	5.51932680	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q229467
1136	Oum El Bouaghi	4	DZ	29	04	\N	35.86887890	7.11082660	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q235705
1137	Guelma	4	DZ	23	24	\N	36.46274440	7.43308330	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q235727
1138	Laghouat	4	DZ	25	03	\N	33.80783410	2.86282940	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q231748
1139	Ouargla	4	DZ	50	30	\N	32.22648630	5.72998210	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q235709
1140	Mostaganem	4	DZ	07	27	\N	35.95830540	0.33718890	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q221445
1141	Sétif	4	DZ	12	19	\N	36.30733890	5.56172790	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q237164
1142	Batna	4	DZ	03	05	\N	35.59659540	5.89871390	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q215452
1143	Souk Ahras	4	DZ	52	41	\N	36.28010620	7.93840330	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q236772
1144	Algiers	4	DZ	01	16	\N	36.69972940	3.05761990	2019-10-05 23:18:40	2022-08-31 15:52:51	1	Q141026
1146	Burgos	207	ES		BU	province	42.33807580	-3.58126920	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q55271
1147	Salamanca	207	ES		SA	province	40.95152630	-6.23759470	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q71080
1157	Palencia	207	ES		P	province	42.00968320	-4.52879490	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q55269
1158	Madrid	207	ES	29	M	province	40.41675150	-3.70383220	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q5756
1160	Asturias	207	ES	34	O	province	43.36139530	-5.85932670	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q3934
1161	Zamora	207	ES		ZA	province	41.60957440	-5.89871390	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q71113
1167	Pontevedra	207	ES	58	PO	province	42.43385950	-8.65685520	2019-10-05 23:18:40	2022-08-28 19:26:09	1	Q95086
1170	Cantabria	207	ES	39	S	province	43.18283960	-3.98784270	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q3946
1171	La Rioja	207	ES	27	LO	province	42.28707330	-2.53960300	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q5727
1174	Islas Baleares	207	ES	07	PM	province	39.35877590	2.73563280	2019-10-05 23:18:40	2022-11-13 16:55:56	1	Q5765
1175	Valencia	207	ES	60	V	province	39.48401080	-0.75328090	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q5720
1176	Murcia	207	ES	31	MU	province	38.13981410	-1.36621600	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q5772
1177	Huesca	207	ES	52	HU	province	41.59762750	-0.90566230	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q4040
1183	Valladolid	207	ES		VA	province	41.65173750	-4.72449500	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q71097
1185	Las Palmas	207	ES	53	GC	province	28.29156370	-16.62913040	2019-10-05 23:18:40	2022-08-29 13:31:56	1	Q5813
1189	Ávila	207	ES		AV	province	40.69345110	-4.89356270	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q55288
1190	Caceres	207	ES	57	CC	province	39.47163130	-6.42573840	2022-08-28 19:40:45	2022-08-28 19:40:50	1	Q81977
1191	Gipuzkoa	207	ES	59	SS	province	43.14523600	-2.44618250	2019-10-05 23:18:40	2022-08-28 19:57:11	1	Q95010
1192	Segovia	207	ES		SG	province	40.94292960	-4.10889420	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q55283
1193	Sevilla	207	ES	51	SE	province	37.37535010	-6.02509730	2022-08-28 20:38:04	2022-08-28 20:38:04	1	Q8717
1200	Léon	207	ES	55	LE	province	42.59870410	-5.56708390	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q71140
1203	Tarragona	207	ES	56	T	province	41.12586420	1.20356420	2022-08-29 12:26:30	2022-08-29 12:26:30	1	Q15088
1204	Navarra	207	ES	32	NA	province	42.69539090	-1.67606910	2019-10-05 23:18:40	2022-08-28 12:54:14	1	Q4018
1205	Toledo	207	ES	54	TO	province	39.86232000	-4.06946920	2022-08-29 12:37:43	2022-08-29 12:37:43	1	Q5836
1208	Soria	207	ES		SO	province	41.76654640	-2.47903060	2019-10-05 23:18:41	2022-08-28 12:54:14	1	Q55276
1209	Guanacaste Province	53	CR	03	G	\N	10.62673990	-85.44367060	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q690026
1210	Puntarenas Province	53	CR	07	P	\N	9.21695310	-83.33618800	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q502170
1211	Provincia de Cartago	53	CR	02	C	\N	9.86223110	-83.92141870	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q502181
1212	Heredia Province	53	CR	04	H	\N	10.47352300	-84.01674230	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q502192
1213	Limón Province	53	CR	06	L	\N	9.98963980	-83.03324170	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q642644
1214	San José Province	53	CR	08	SJ	\N	9.91297270	-84.07682940	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q647808
1215	Alajuela Province	53	CR	01	A	\N	10.39158300	-84.43827210	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q502188
1216	Brunei-Muara District	33	BN	02	BM	\N	4.93112060	114.95168690	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q153009
1217	Belait District	33	BN	01	BE	\N	4.37507490	114.61928990	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q40395
1218	Temburong District	33	BN	03	TE	\N	4.62041280	115.14148400	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q263285
1219	Tutong District	33	BN	04	TU	\N	4.71403730	114.66679390	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q40398
1220	Saint Philip	20	BB	10	10	\N	35.23311400	-89.43640420	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1647436
1221	Saint Lucy	20	BB	07	07	\N	38.76146250	-77.44914390	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1647447
1222	Saint Peter	20	BB	09	09	\N	37.08271190	-94.51712500	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q932723
1223	Saint Joseph	20	BB	06	06	\N	39.76745780	-94.84668100	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q550249
1224	Saint James	20	BB	04	04	\N	48.52356600	-1.32378850	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q592141
1225	Saint Thomas	20	BB	11	11	\N	18.33809650	-64.89409460	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1647432
1226	Saint George	20	BB	03	03	\N	37.09652780	-113.56841640	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1647443
1227	Saint John	20	BB	05	05	\N	45.27331530	-66.06330800	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1626540
1228	Christ Church	20	BB	01	01	\N	36.00604070	-95.92112100	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1626524
1229	Saint Andrew	20	BB	02	02	\N	\N	\N	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1647439
1230	Saint Michael	20	BB	08	08	\N	36.03597700	-95.84905200	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q819170
1231	Ta\\"izz	245	YE	25	TA	\N	13.57758860	44.01779890	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q388330
1232	Amanat Al Asimah	245	YE	16	SA	\N	15.36944510	44.19100660	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q2471
1233	Ibb	245	YE	23	IB	\N	14.14157170	44.24790150	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q388274
1234	Ma\\"rib	245	YE	14	MA	\N	15.51588800	45.44980650	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q498465
1235	Al Mahwit	245	YE	10	MW	\N	15.39632290	43.56069460	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q388280
1236	Sana\\"a	245	YE	16	SN	\N	15.31689130	44.47480180	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q388291
1237	Abyan	245	YE	01	AB	\N	13.63434130	46.05632120	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q241774
1238	Hadhramaut	245	YE	04	HD	\N	16.93041350	49.36531490	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q241135
1239	Socotra	245	YE	28	SU	\N	12.46342050	53.82373850	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q15728745
1240	Al Bayda\\"	245	YE	20	BA	\N	14.35886620	45.44980650	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q221212
1241	Al Hudaydah	245	YE	08	HU	\N	15.30530720	43.01948970	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q275755
1242	\\"Adan	245	YE	02	AD	\N	12.82574810	44.79438040	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q275729
1243	Al Jawf	245	YE	21	JA	\N	16.79018190	45.29938620	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q328128
1244	Hajjah	245	YE	22	HJ	\N	16.11806310	43.32946600	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q328158
1245	Lahij	245	YE	24	LA	\N	13.14895880	44.85054950	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q388318
1246	Dhamar	245	YE	11	DH	\N	14.71953440	44.24790150	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q328193
1247	Shabwah	245	YE	05	SH	\N	14.75463030	46.51626200	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q328180
1248	Raymah	245	YE	27	RA	\N	14.62776820	43.71424840	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q475033
1249	Saada	245	YE	15	SD	\N	16.84765280	43.94367880	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q275732
1250	\\"Amran	245	YE	19	AM	\N	16.25692140	43.94367880	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q275720
1251	Al Mahrah	245	YE	03	MR	\N	16.52384230	51.68342750	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q275752
1252	Sangha-Mbaéré	42	CF	16	SE	\N	3.43686070	16.34637910	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q856237
1253	Nana-Grébizi Economic Prefecture	42	CF	15	KB	\N	7.18486070	19.37832060	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q856227
1254	Ouham Prefecture	42	CF	12	AC	\N	7.09091100	17.66888700	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q726620
1255	Ombella-M\\"Poko Prefecture	42	CF	17	MP	\N	5.11888250	18.42760470	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q378970
1256	Lobaye Prefecture	42	CF	07	LB	\N	4.35259810	17.47951730	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q821037
1257	Mambéré-Kadéï	42	CF	04	HS	\N	4.70556530	15.96998780	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q848567
1258	Haut-Mbomou Prefecture	42	CF	05	HM	\N	6.25371340	25.47335540	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q848578
1259	Bamingui-Bangoran Prefecture	42	CF	01	BB	\N	8.27334550	20.71224650	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q741025
1260	Nana-Mambéré Prefecture	42	CF	09	NM	\N	5.69321350	15.21948080	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q742455
1261	Vakaga Prefecture	42	CF	14	VK	\N	9.51132960	22.23840170	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q848585
1262	Bangui	42	CF	18	BGF	\N	4.39467350	18.55818990	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q3832
1263	Kémo Prefecture	42	CF	06	KG	\N	5.88677940	19.37832060	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q848572
1264	Basse-Kotto Prefecture	42	CF	02	BK	\N	4.87193190	21.28450250	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q810484
1265	Ouaka Prefecture	42	CF	11	UK	\N	6.31682160	20.71224650	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q848560
1266	Mbomou Prefecture	42	CF	08	MB	\N	5.55683700	23.76328280	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q848582
1267	Ouham-Pendé Prefecture	42	CF	13	OP	\N	6.48509840	16.15809370	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q848591
1268	Haute-Kotto Prefecture	42	CF	03	HK	\N	7.79643790	23.38235450	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q848596
1269	Romblon	174	PH	54	ROM	province	12.57780160	122.26914600	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13875
1270	Bukidnon	174	PH	12	BUK	province	8.05150540	124.92299460	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13753
1271	Rizal	174	PH	53	RIZ	province	14.60374460	121.30840880	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13874
1272	Bohol	174	PH	11	BOH	province	9.84999110	124.14354270	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13752
1273	Quirino	174	PH	68	QUI	province	16.27004240	121.53700030	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13873
1274	Biliran	174	PH	68	BIL	province	11.58331520	124.46418480	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13751
1275	Quezon	174	PH	H2	QUE	province	14.03139060	122.11309090	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13872
1276	Siquijor	174	PH	69	SIG	province	9.19987790	123.59519250	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13879
1277	Sarangani	174	PH	69	SAR	province	5.92671750	124.99475100	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13877
1278	Bulacan	174	PH	13	BUL	province	14.79427350	120.87990080	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13755
1279	Cagayan	174	PH	14	CAG	province	18.24896290	121.87878330	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13759
1280	South Cotabato	174	PH	70	SCO	province	6.33575650	124.77407930	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13882
1281	Sorsogon	174	PH	58	SOR	province	12.99270950	124.01474640	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13881
1282	Sultan Kudarat	174	PH	71	SUK	province	6.50694010	124.41982430	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13885
1283	Camarines Norte	174	PH	15	CAN	province	14.13902650	122.76330360	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13763
1284	Southern Leyte	174	PH	59	SLE	province	10.33462060	125.17087410	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13884
1285	Camiguin	174	PH	17	CAM	province	9.17321640	124.72987650	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13769
1286	Surigao del Norte	174	PH	61	SUN	province	9.51482800	125.69699840	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13889
1287	Camarines Sur	174	PH	16	CAS	province	13.52501970	123.34861470	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13767
1288	Sulu	174	PH	60	SLU	province	5.97490110	121.03351000	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13887
1289	Davao Oriental	174	PH	26	DAO	province	7.31715850	126.54198870	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13806
1290	Eastern Samar	174	PH	23	EAS	province	11.50007310	125.49999080	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13809
1291	Dinagat Islands	174	PH	23	DIN	province	10.12818160	125.60954740	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13807
1292	Capiz	174	PH	18	CAP	province	11.55288160	122.74072300	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13772
1293	Tawi-Tawi	174	PH	72	TAW	province	5.13381100	119.95092600	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13893
1294	Calabarzon	174	PH	40	40	region	14.10078030	121.07937050	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13650
1295	Tarlac	174	PH	63	TAR	province	15.47547860	120.59634920	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13892
1296	Surigao del Sur	174	PH	62	SUR	province	8.54049060	126.11447580	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13891
1297	Zambales	174	PH	64	ZMB	province	15.50817660	119.96978080	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13895
1298	Ilocos Norte	174	PH	28	ILN	province	18.16472810	120.71155920	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13813
1299	Mimaropa	174	PH	41	41	region	9.84320650	118.73647830	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13658
1300	Ifugao	174	PH	27	IFU	province	16.83307920	121.17103890	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13812
1301	Catanduanes	174	PH	19	CAT	province	13.70886840	124.24215970	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13778
1302	Zamboanga del Norte	174	PH	65	ZAN	province	8.38862820	123.16888830	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13899
1303	Guimaras	174	PH	65	GUI	province	10.59286610	122.63250810	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13810
1304	Bicol	174	PH	05	05	region	13.42098850	123.41367360	2019-10-05 23:18:41	2022-08-31 15:31:49	1	Q13662
1305	Western Visayas	174	PH	06	06	region	11.00498360	122.53727410	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13665
1306	Cebu	174	PH	21	CEB	province	10.31569920	123.88543660	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13786
1307	Cavite	174	PH	20	CAV	province	14.47912970	120.89696340	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13785
1308	Central Visayas	174	PH	07	07	region	9.81687500	124.06414190	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13669
1309	Davao Occidental	174	PH	11	DVO	province	6.09413960	125.60954740	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q3656379
1310	Soccsksargen	174	PH	12	12	region	6.27069180	124.68565090	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13701
1311	Compostela Valley	174	PH	12	COM	province	7.51251500	126.17626150	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13789
1312	Kalinga	174	PH	12	KAL	province	17.47404220	121.35416310	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13827
1313	Isabela	174	PH	31	ISA	province	18.50077590	-67.02434620	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13826
1314	Caraga	174	PH	13	13	region	8.80145620	125.74068820	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13704
1315	Iloilo	174	PH	30	ILI	province	10.72015010	122.56210630	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13825
1316	Autonomous Region in Muslim Mindanao	174	PH	14	14	region	6.95683130	124.24215970	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13708
1317	La Union	174	PH	36	LUN	province	38.87668780	-77.12809120	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13829
1318	Davao del Sur	174	PH	25	DAS	province	6.76626870	125.32842690	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13794
1319	Davao del Norte	174	PH	24	DAV	province	7.56176990	125.65328480	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13792
1320	Cotabato	174	PH	57	NCO	province	7.20466680	124.23104390	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13791
1321	Ilocos Sur	174	PH	29	ILS	province	17.22786640	120.57395790	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q12741
1322	Eastern Visayas	174	PH	08	08	region	12.24455330	125.03881640	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13675
1323	Agusan del Norte	174	PH	02	AGN	province	8.94562590	125.53192340	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13714
1324	Abra	174	PH	01	ABR	province	42.49708300	-96.38441000	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13711
1325	Zamboanga Peninsula	174	PH	09	09	region	8.15407700	123.25879300	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13682
1326	Agusan del Sur	174	PH	03	AGS	province	8.04638880	126.06153840	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13721
1327	Lanao del Norte	174	PH	34	LAN	province	7.87218110	123.88577470	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13841
1328	Laguna	174	PH	33	LAG	province	33.54271890	-117.78535680	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13840
1329	Marinduque	174	PH	38	MAD	province	13.47671710	121.90321920	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13846
1330	Maguindanao	174	PH	56	MAG	province	6.94225810	124.41982430	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13845
1331	Aklan	174	PH	04	AKL	province	11.81661090	122.09415410	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13723
1332	Leyte	174	PH	37	LEY	province	10.86245360	124.88111950	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13844
1333	Lanao del Sur	174	PH	35	LAS	province	7.82317600	124.41982430	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13843
1334	Apayao	174	PH	35	APA	province	18.01203040	121.17103890	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13728
1335	Cordillera Administrative	174	PH	15	15	region	17.35125420	121.17188510	2019-10-05 23:18:41	2022-08-31 15:31:54	1	Q13606
1336	Antique	174	PH	06	ANT	province	37.03586950	-95.63616940	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13727
1337	Albay	174	PH	05	ALB	province	13.17748270	123.52800720	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13726
1338	Masbate	174	PH	39	MAS	province	12.35743460	123.55040760	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13847
1339	Northern Mindanao	174	PH	10	10	region	8.02016350	124.68565090	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13690
1340	Davao	174	PH	11	11	region	7.30416220	126.08934060	2019-10-05 23:18:41	2022-08-31 15:31:49	1	Q13694
1341	Aurora	174	PH	G8	AUR	province	36.97089100	-93.71797900	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13730
1342	Cagayan Valley	174	PH	02	02	region	16.97537580	121.81070790	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13615
1343	Misamis Occidental	174	PH	42	MSC	province	8.33749030	123.70706190	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13857
1344	Bataan	174	PH	07	BAN	province	14.64168420	120.48184460	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13739
1345	Central Luzon	174	PH	03	03	region	15.48277220	120.71200230	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13617
1346	Basilan	174	PH	22	BAS	province	6.42963490	121.98701650	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13737
1347	Metro Manila	174	PH	00	NCR	province	14.60905370	121.02225650	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13580
1348	Misamis Oriental	174	PH	43	MSR	province	8.50455580	124.62195920	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13860
1349	Northern Samar	174	PH	67	NSA	province	12.36131990	124.77407930	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13864
1350	Negros Oriental	174	PH	46	NER	province	9.62820830	122.98883190	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13863
1351	Negros Occidental	174	PH	45	NEC	province	10.29256090	123.02465180	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13862
1352	Batanes	174	PH	08	BTN	province	20.44850740	121.97081290	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13740
1353	Mountain Province	174	PH	44	MOU	province	40.70754370	-73.95010330	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13861
1354	Oriental Mindoro	174	PH	41	MDR	province	13.05645980	121.40694170	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13868
1355	Ilocos	174	PH	01	01	region	16.08321440	120.61998950	2019-10-05 23:18:41	2022-08-31 15:31:49	1	Q12933
1356	Occidental Mindoro	174	PH	40	MDC	province	13.10241110	120.76512840	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13867
1357	Zamboanga del Sur	174	PH	66	ZAS	province	7.83830540	123.29666570	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13900
1358	Nueva Vizcaya	174	PH	48	NUV	province	16.33011070	121.17103890	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13866
1359	Batangas	174	PH	09	BTG	province	13.75646510	121.05830760	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13744
1360	Nueva Ecija	174	PH	47	NUE	province	15.57837500	121.11126150	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13865
1361	Palawan	174	PH	49	PLW	province	9.83494930	118.73836150	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13869
1362	Zamboanga Sibugay	174	PH	09	ZSI	province	7.52252470	122.31075170	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13902
1363	Benguet	174	PH	10	BEN	province	16.55772570	120.80394740	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13750
1364	Pangasinan	174	PH	51	PAN	province	15.89490550	120.28631830	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13871
1365	Pampanga	174	PH	50	PAM	province	15.07940900	120.61998950	2019-10-05 23:18:41	2022-08-31 15:31:38	1	Q13870
1366	Northern District	106	IL	03	Z	\N	36.15118640	-95.99517630	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q189942
1367	Central District	106	IL	02	M	\N	47.60875830	-122.29642350	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q188785
1368	Southern District	106	IL	01	D	\N	40.71375860	-74.00090590	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q188781
1369	Haifa District	106	IL	04	HA	\N	32.48141110	34.99475100	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q185845
1370	Jerusalem District	106	IL	06	JM	\N	31.76482430	34.99475100	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q192232
1371	Tel Aviv District	106	IL	05	TA	\N	32.09290750	34.80721650	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q192811
1372	Limburg	22	BE	05	VLI	\N	\N	\N	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1095
1373	Flanders	22	BE	VLG	VLG	\N	51.01087060	3.72646130	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q234
1374	Flemish Brabant	22	BE	12	VBR	\N	50.88154340	4.56459700	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1118
1375	Hainaut	22	BE	03	WHT	\N	50.52570760	4.06210170	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1129
1376	Brussels-Capital Region	22	BE	11	BRU	\N	50.85034630	4.35172110	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q240
1377	East Flanders	22	BE	08	VOV	\N	51.03621010	3.73731240	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1114
1378	Namur	22	BE	07	WNA	\N	50.46738830	4.87198540	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1125
1379	Luxembourg	22	BE	06	WLX	\N	49.81527300	6.12958300	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1126
1380	Wallonia	22	BE	WAL	WAL	\N	50.41756370	4.45100660	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q231
1381	Antwerp	22	BE	01	VAN	\N	51.21944750	4.40246430	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1116
1382	Walloon Brabant	22	BE	10	WBR	\N	50.63324100	4.52431500	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1122
1383	West Flanders	22	BE	09	VWV	\N	51.04047470	2.99942130	2019-10-05 23:18:41	2023-03-05 19:14:32	1	Q1113
1384	Liège	22	BE	04	WLG	\N	50.63255740	5.57966620	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1127
1385	Darién Province	170	PA	05	5	\N	7.86817130	-77.83672820	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q688660
1386	Colón Province	170	PA	04	3	\N	9.18519890	-80.05349230	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q820514
1387	Coclé Province	170	PA	03	2	\N	8.62660680	-80.36586500	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q825799
1388	Guna Yala	170	PA	09	KY	\N	9.23443950	-78.19262500	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q919017
1389	Herrera Province	170	PA	06	6	\N	7.77042820	-80.72144170	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q842886
1390	Los Santos Province	170	PA	07	7	\N	7.59093020	-80.36586500	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q911278
1391	Ngöbe-Buglé Comarca	170	PA	12	NB	\N	8.65958330	-81.77870210	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1129783
1392	Veraguas Province	170	PA	10	9	\N	8.12310330	-81.07546570	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q593137
1393	Bocas del Toro Province	170	PA	01	1	\N	9.41655210	-82.52077870	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q217138
1394	Panamá Oeste Province	170	PA	13	10	\N	9.11967510	-79.29021330	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q16250688
1395	Panamá Province	170	PA	08	8	\N	9.11967510	-79.29021330	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q557506
1396	Emberá-Wounaan Comarca	170	PA	11	EM	\N	8.37669830	-77.65361250	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q1141041
1397	Chiriquí Province	170	PA	02	4	\N	8.58489800	-82.38857830	2019-10-05 23:18:41	2022-08-31 15:52:51	1	Q739651
1398	Howland Island	233	US	HQ	UM-84	islands / groups of islands	0.81132190	-176.61827360	2019-10-05 23:18:41	2022-03-13 16:01:27	1	Q131305
1399	Delaware	233	US	10	DE	state	38.91083250	-75.52766990	2019-10-05 23:18:41	2022-03-13 15:59:55	1	Q1393
1400	Alaska	233	US	02	AK	state	64.20084130	-149.49367330	2019-10-05 23:18:41	2022-03-13 15:59:55	1	Q797
1401	Maryland	233	US	24	MD	state	39.04575490	-76.64127120	2019-10-05 23:18:41	2022-03-13 15:59:55	1	Q1391
1402	Baker Island	233	US	FQ	UM-81	islands / groups of islands	0.19362660	-176.47690800	2019-10-05 23:18:41	2022-03-13 16:01:27	1	Q46879
1403	Kingman Reef	233	US	KQ	UM-89	islands / groups of islands	6.38333300	-162.41666700	2019-10-05 23:18:41	2022-03-13 16:01:27	1	Q130895
1404	New Hampshire	233	US	33	NH	state	43.19385160	-71.57239530	2019-10-05 23:18:41	2022-03-13 15:59:55	1	Q759
1405	Wake Island	233	US	WQ	UM-79	islands / groups of islands	19.27961900	166.64993480	2019-10-05 23:18:41	2022-03-13 16:01:27	1	Q43296
1406	Kansas	233	US	20	KS	state	39.01190200	-98.48424650	2019-10-05 23:18:41	2022-03-13 15:59:55	1	Q1558
1407	Texas	233	US	48	TX	state	31.96859880	-99.90181310	2019-10-05 23:18:41	2022-03-13 15:59:55	1	Q1439
1408	Nebraska	233	US	31	NE	state	41.49253740	-99.90181310	2019-10-05 23:18:41	2022-03-13 15:59:55	1	Q1553
1409	Vermont	233	US	50	VT	state	44.55880280	-72.57784150	2019-10-05 23:18:41	2022-03-13 15:59:55	1	Q16551
1410	Jarvis Island	233	US	DQ	UM-86	islands / groups of islands	-0.37435030	-159.99672060	2019-10-05 23:18:41	2022-03-13 16:01:27	1	Q62218
1411	Hawaii	233	US	15	HI	state	19.89676620	-155.58278180	2019-10-05 23:18:41	2022-03-13 15:59:55	1	Q782
1412	Guam	233	US	GQ	GU	outlying area	13.44430400	144.79373100	2019-10-05 23:18:41	2022-03-13 15:59:55	1	Q16635
1413	United States Virgin Islands	233	US	VQ	VI	outlying area	18.33576500	-64.89633500	2019-10-05 23:18:41	2022-03-13 15:59:55	1	Q11703
1414	Utah	233	US	49	UT	state	39.32098010	-111.09373110	2019-10-05 23:18:41	2022-03-13 15:59:55	1	Q829
1415	Oregon	233	US	41	OR	state	43.80413340	-120.55420120	2019-10-05 23:18:41	2022-03-13 15:59:55	1	Q824
1416	California	233	US	06	CA	state	36.77826100	-119.41793240	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q99
1417	New Jersey	233	US	34	NJ	state	40.05832380	-74.40566120	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1408
1418	North Dakota	233	US	38	ND	state	47.55149260	-101.00201190	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1207
1419	Kentucky	233	US	21	KY	state	37.83933320	-84.27001790	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1603
1420	Minnesota	233	US	27	MN	state	46.72955300	-94.68589980	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1527
1421	Oklahoma	233	US	40	OK	state	35.46756020	-97.51642760	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1649
1422	Pennsylvania	233	US	42	PA	state	41.20332160	-77.19452470	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1400
1423	New Mexico	233	US	35	NM	state	34.51994020	-105.87009010	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1522
1424	American Samoa	233	US	AQ	AS	outlying area	-14.27097200	-170.13221700	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q16641
1425	Illinois	233	US	17	IL	state	40.63312490	-89.39852830	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1204
1426	Michigan	233	US	26	MI	state	44.31484430	-85.60236430	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1166
1427	Virginia	233	US	51	VA	state	37.43157340	-78.65689420	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1370
1428	Johnston Atoll	233	US	JQ	UM-67	islands / groups of islands	16.72950350	-169.53364770	2019-10-05 23:18:42	2022-03-13 16:01:27	1	Q131008
1429	West Virginia	233	US	54	WV	state	38.59762620	-80.45490260	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1371
1430	Mississippi	233	US	28	MS	state	32.35466790	-89.39852830	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1494
1431	Northern Mariana Islands	233	US	CQ	MP	outlying area	15.09790000	145.67390000	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q16644
1432	United States Minor Outlying Islands	233	US	CQ	UM	outlying area	19.28231920	166.64704700	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q16645
1433	Massachusetts	233	US	25	MA	state	42.40721070	-71.38243740	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q771
1434	Arizona	233	US	04	AZ	state	34.04892810	-111.09373110	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q816
1435	Connecticut	233	US	09	CT	state	41.60322070	-73.08774900	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q779
1436	Florida	233	US	12	FL	state	27.66482740	-81.51575350	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q812
1437	District of Columbia	233	US	11	DC	district	38.90719230	-77.03687070	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q3551781
1438	Midway Atoll	233	US	MQ	UM-71	islands / groups of islands	28.20721680	-177.37349260	2019-10-05 23:18:42	2022-03-13 16:01:27	1	Q47863
1439	Navassa Island	233	US	BQ	UM-76	islands / groups of islands	18.41006890	-75.01146120	2019-10-05 23:18:42	2022-03-13 16:01:27	1	Q25359
1440	Indiana	233	US	18	IN	state	40.26719410	-86.13490190	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1415
1441	Wisconsin	233	US	55	WI	state	43.78443970	-88.78786780	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1537
1442	Wyoming	233	US	56	WY	state	43.07596780	-107.29028390	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1214
1443	South Carolina	233	US	45	SC	state	33.83608100	-81.16372450	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1456
1444	Arkansas	233	US	05	AR	state	35.20105000	-91.83183340	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1612
1445	South Dakota	233	US	46	SD	state	43.96951480	-99.90181310	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1211
1446	Montana	233	US	30	MT	state	46.87968220	-110.36256580	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1212
1447	North Carolina	233	US	37	NC	state	35.75957310	-79.01929970	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1454
1448	Palmyra Atoll	233	US	LQ	UM-95	islands / groups of islands	5.88850260	-162.07866560	2019-10-05 23:18:42	2022-03-13 16:01:27	1	Q123076
1449	Puerto Rico	233	US	RQ	PR	outlying area	18.22083300	-66.59014900	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1183
1450	Colorado	233	US	08	CO	state	39.55005070	-105.78206740	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1261
1451	Missouri	233	US	29	MO	state	37.96425290	-91.83183340	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1581
1452	New York	233	US	36	NY	state	40.71277530	-74.00597280	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1384
1453	Maine	233	US	23	ME	state	45.25378300	-69.44546890	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q724
1454	Tennessee	233	US	47	TN	state	35.51749130	-86.58044730	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1509
1455	Georgia	233	US	13	GA	state	32.16562210	-82.90007510	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1428
1456	Alabama	233	US	01	AL	state	32.31823140	-86.90229800	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q173
1457	Louisiana	233	US	22	LA	state	30.98429770	-91.96233270	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1588
1458	Nevada	233	US	32	NV	state	38.80260970	-116.41938900	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1227
1459	Iowa	233	US	19	IA	state	41.87800250	-93.09770200	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1546
1460	Idaho	233	US	16	ID	state	44.06820190	-114.74204080	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1221
1461	Rhode Island	233	US	44	RI	state	41.58009450	-71.47742910	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1387
1462	Washington	233	US	53	WA	state	47.75107410	-120.74013850	2019-10-05 23:18:42	2022-03-13 15:59:55	1	Q1223
1463	Shinyanga	218	TZ	15	22	Region	-3.68099610	33.42714030	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q153339
1464	Simiyu	218	TZ	31	30	Region	-2.83087380	34.15319470	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q2787568
1465	Kagera	218	TZ	19	05	Region	-1.30011150	31.26263660	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q309190
1466	Dodoma	218	TZ	03	03	Region	-6.57382280	36.26308460	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q213268
1467	Kilimanjaro	218	TZ	06	09	Region	-4.13369270	37.80876930	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q328922
1468	Mara	218	TZ	08	13	Region	-1.77535380	34.15319470	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q458406
1469	Tabora	218	TZ	17	24	Region	-5.03421380	32.80844960	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q153335
1470	Morogoro	218	TZ	10	16	Region	-8.81371730	36.95410700	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q458388
1471	Zanzibar South	218	TZ	21	11	Region	-6.26428510	39.44502810	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q643120
1472	Pemba South	218	TZ	20	10	Region	-5.31469610	39.75495110	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q498067
1473	Zanzibar North	218	TZ	22	07	Region	-5.93950930	39.27910110	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q147116
1474	Singida	218	TZ	16	23	Region	-6.74533520	34.15319470	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q153326
1475	Zanzibar West	218	TZ	25	15	Region	-6.22981360	39.25832930	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q180822
1476	Mtwara	218	TZ	11	17	Region	-10.33984550	40.16574660	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q499465
1477	Rukwa	218	TZ	24	20	Region	-8.01094440	31.44561790	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q153329
1478	Kigoma	218	TZ	05	08	Region	-4.88240920	29.66150550	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q747943
1479	Mwanza	218	TZ	12	18	Region	-2.46711970	32.89868120	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q331153
1480	Njombe	218	TZ	30	29	Region	-9.24226320	35.12687810	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q2086273
1481	Geita	218	TZ	28	27	Region	-2.82422570	32.26538870	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q1848521
1482	Katavi	218	TZ	29	28	Region	-6.36771250	31.26263660	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q2682731
1483	Lindi	218	TZ	07	12	Region	-9.23433940	38.31657250	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q309339
1484	Manyara	218	TZ	27	26	Region	-4.31500580	36.95410700	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q331117
1485	Pwani	218	TZ	02	19	Region	-7.32377140	38.82054540	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q458412
1486	Ruvuma	218	TZ	14	21	Region	-10.68787170	36.26308460	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q115318
1487	Tanga	218	TZ	18	25	Region	-5.30497890	38.31657250	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q389737
1488	Pemba North	218	TZ	13	06	Region	-5.03193520	39.77555710	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q498073
1489	Iringa	218	TZ	04	04	Region	-7.78874420	35.56578620	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q309352
1490	Dar es Salaam	218	TZ	23	02	Region	-6.79235400	39.20832840	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q557539
1491	Arusha	218	TZ	26	01	Region	-3.38692540	36.68299270	2019-10-05 23:18:42	2021-10-10 17:37:41	1	Q329261
1493	Tavastia Proper	74	FI	05	06	region	60.90701500	24.30054980	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5695
1494	Central Ostrobothnia	74	FI	16	07	region	63.56217350	24.00136310	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5696
1495	Southern Savonia	74	FI	10	04	region	61.69451480	27.80050150	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5693
1496	Kainuu	74	FI	18	05	region	64.37365640	28.74374750	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5694
1497	South Karelia	74	FI	09	02	region	61.11819490	28.10243720	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5691
1498	Southern Ostrobothnia	74	FI	14	03	region	62.94330990	23.52852670	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5692
1500	Lapland	74	FI	19	10	region	67.92223040	26.50464380	2019-10-05 23:18:42	2022-08-31 16:21:14	1	Q5700
1501	Satakunta	74	FI	04	17	region	61.59327580	22.14830810	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5709
1502	Päijänne Tavastia	74	FI	07	16	region	61.32300410	25.73224960	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5708
1503	Northern Savonia	74	FI	07	15	region	63.08448000	27.02535040	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5706
1504	North Karelia	74	FI	12	13	region	62.80620780	30.15538870	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5703
1505	Northern Ostrobothnia	74	FI	17	14	region	65.27949300	26.28904170	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5704
1506	Pirkanmaa	74	FI	06	11	region	61.69869180	23.78955980	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5701
1507	Finland Proper	74	FI	02	19	region	60.36279140	22.44393690	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5712
1508	Ostrobothnia	74	FI	15	12	region	63.11817570	21.90610620	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5702
1509	Åland Islands	74	FI	01	01	region	60.17852470	19.91561050	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5689
1510	Uusimaa	74	FI	01	18	region	60.21872000	25.27162100	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5711
1511	Central Finland	74	FI	13	08	region	62.56667430	25.55494450	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5697
1512	Kymenlaakso	74	FI	08	09	region	60.78051200	26.88293360	2019-10-05 23:18:42	2022-08-31 16:18:33	1	Q5698
1513	Canton of Diekirch	127	LU	08	DI	\N	49.86717840	6.15956330	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q691842
1514	Luxembourg District	127	LU	03	L	\N	49.59537060	6.13331780	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q2032
1515	Canton of Echternach	127	LU	03	EC	\N	49.81141330	6.41756350	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q720221
1516	Canton of Redange	127	LU	03	RD	\N	49.76455000	5.88948000	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q835980
1517	Canton of Esch-sur-Alzette	127	LU	03	ES	\N	49.50088050	5.98609250	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q188283
1518	Canton of Capellen	127	LU	03	CA	\N	49.64039310	5.95538460	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q397678
1519	Canton of Remich	127	LU	03	RM	\N	49.54501700	6.36742220	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q691781
1520	Grevenmacher District	127	LU	02	G	\N	49.68085100	6.44075240	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q208284
1521	Canton of Clervaux	127	LU	02	CL	\N	50.05463130	6.02858750	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q691793
1522	Canton of Mersch	127	LU	02	ME	\N	49.75429060	6.12921850	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q753917
1523	Canton of Vianden	127	LU	02	VD	\N	49.93419240	6.20199170	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q845600
1524	Diekirch District	127	LU	01	D	\N	49.86717200	6.15963620	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q208747
1525	Canton of Grevenmacher	127	LU	01	GR	\N	49.68084100	6.44075930	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q836002
1526	Canton of Wiltz	127	LU	01	WI	\N	49.96622000	5.93243060	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q550021
1527	Canton of Luxembourg	127	LU	01	LU	\N	49.63010250	6.15201850	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q691741
1528	Region Zealand	59	DK	20	85	\N	55.46325180	11.72149790	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q26589
1529	Region of Southern Denmark	59	DK	21	83	\N	55.33077140	9.09249030	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q26061
1530	Capital Region of Denmark	59	DK	17	84	\N	55.67518120	12.54932610	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q26073
1531	Central Denmark Region	59	DK	18	82	\N	56.30213900	9.30277700	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q26586
1532	North Denmark Region	59	DK	19	81	\N	56.83074160	9.49305270	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q26067
1533	Gävleborg County	213	SE	03	X	\N	61.30119930	16.15342140	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q103699
1534	Dalarna County	213	SE	10	W	\N	61.09170120	14.66636530	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q103732
1535	Värmland County	213	SE	22	S	\N	59.72940650	13.23540240	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q106789
1536	Östergötland County	213	SE	16	E	\N	58.34536350	15.51978440	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q104940
1537	Blekinge County	213	SE	02	K	\N	56.28333333	15.11666666	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q102377
1538	Norrbotten County	213	SE	14	BD	\N	66.83092160	20.39919660	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q103686
1539	Örebro County	213	SE	15	T	\N	59.53503600	15.00657310	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q104257
1540	Södermanland County	213	SE	18	D	\N	59.03363490	16.75188990	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q106915
1541	Skåne County	213	SE	27	M	\N	55.99025720	13.59576920	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q103659
1542	Kronoberg County	213	SE	12	G	\N	56.71834030	14.41146730	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q104746
1543	Västerbotten County	213	SE	23	AC	\N	65.33373110	16.51616940	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q104877
1544	Kalmar County	213	SE	09	H	\N	57.23501560	16.18493490	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q103707
1545	Uppsala County	213	SE	21	C	\N	60.00922620	17.27145880	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q104926
1546	Gotland County	213	SE	05	I	\N	57.46841210	18.48674470	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q103738
1547	Västra Götaland County	213	SE	28	O	\N	58.25279260	13.05964250	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q103093
1548	Halland County	213	SE	06	N	\N	56.89668050	12.80339930	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q103691
1549	Västmanland County	213	SE	25	U	\N	59.67138790	16.21589530	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q105075
1550	Jönköping County	213	SE	08	F	\N	57.37084340	14.34391740	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q103672
1551	Stockholm County	213	SE	26	AB	\N	59.60249580	18.13843830	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q104231
1552	Västernorrland County	213	SE	24	Y	\N	63.42764730	17.72924440	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q104891
1553	Plungė District Municipality	126	LT	24	35	\N	55.91078400	21.84540690	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q404943
1554	Šiauliai District Municipality	126	LT	61	44	\N	55.97214560	23.03323710	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q1417346
1555	Jurbarkas District Municipality	126	LT	61	12	\N	55.07740700	22.74195690	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q2089815
1556	Kaunas County	126	LT	57	KU	\N	54.98728630	23.95257360	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q853861
1557	Mažeikiai District Municipality	126	LT	57	26	\N	56.30924390	22.34146800	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q313132
1558	Panevėžys County	126	LT	60	PN	\N	55.97480490	25.07947670	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q188085
1559	Elektrėnai municipality	126	LT	60	08	\N	54.76539340	24.77405830	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q2089777
1560	Švenčionys District Municipality	126	LT	60	49	\N	55.10280980	26.00718550	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q1813849
1561	Akmenė District Municipality	126	LT	60	01	\N	56.24550290	22.74711690	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q1023041
1562	Ignalina District Municipality	126	LT	60	09	\N	55.40903420	26.32848930	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q2069330
1563	Neringa Municipality	126	LT	60	28	\N	55.45724030	21.08390050	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q9305847
1564	Visaginas Municipality	126	LT	60	59	\N	55.59411800	26.43079540	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q2558824
1565	Kaunas District Municipality	126	LT	57	16	\N	54.99362360	23.63249410	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q1351722
1566	Biržai District Municipality	126	LT	57	06	\N	56.20177190	24.75601180	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q763504
1567	Jonava District Municipality	126	LT	57	10	\N	55.07272420	24.27933370	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q1351768
1568	Radviliškis District Municipality	126	LT	57	37	\N	55.81083990	23.54648700	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q1755961
1569	Telšiai County	126	LT	63	TE	\N	56.10266160	22.11139150	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q188963
1570	Marijampolė County	126	LT	59	MR	\N	54.78199710	23.13413650	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q853948
1571	Kretinga District Municipality	126	LT	59	22	\N	55.88384200	21.23509190	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q156560
1572	Tauragė District Municipality	126	LT	62	50	\N	55.25036600	22.29095000	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q2071640
1573	Tauragė County	126	LT	62	TA	\N	55.30725860	22.35729390	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q188960
1574	Alytus County	126	LT	56	AL	\N	54.20002140	24.15126340	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q669470
1575	Kazlų Rūda municipality	126	LT	56	17	\N	54.78075260	23.48402430	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q1461972
1576	Šakiai District Municipality	126	LT	56	41	\N	54.95267100	23.04801990	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q2021307
1577	Šalčininkai District Municipality	126	LT	56	42	\N	54.30976700	25.38756400	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q1799182
1578	Prienai District Municipality	126	LT	56	36	\N	54.63835800	23.94680090	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q47090
1579	Druskininkai municipality	126	LT	56	07	\N	53.99336850	24.03424380	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q669649
1580	Kaunas City Municipality	126	LT	57	15	\N	54.91453260	23.90535180	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q928938
1581	Joniškis District Municipality	126	LT	57	11	\N	56.23607300	23.61365790	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q610133
1582	Molėtai District Municipality	126	LT	57	27	\N	55.22653090	25.41800110	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q2089785
1583	Kaišiadorys District Municipality	126	LT	57	13	\N	54.85886690	24.42779290	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q2069320
1584	Kėdainiai District Municipality	126	LT	57	18	\N	55.35609470	23.98326830	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q46786
1585	Kupiškis District Municipality	126	LT	57	23	\N	55.84287410	25.02958160	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q2089791
1586	Šiauliai County	126	LT	61	SA	\N	55.99857510	23.13800510	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q186410
1587	Raseiniai District Municipality	126	LT	61	38	\N	55.38194990	23.11561290	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q2069355
1588	Palanga City Municipality	126	LT	61	31	\N	55.92019800	21.06776140	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q3685410
1589	Panevėžys City Municipality	126	LT	60	32	\N	55.73479150	24.35747740	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q3685412
1590	Rietavas municipality	126	LT	60	39	\N	55.70217190	21.99865640	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q712011
1591	Kalvarija municipality	126	LT	60	14	\N	54.37616740	23.19203210	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q1461987
1592	Vilnius District Municipality	126	LT	65	58	\N	54.77325780	25.58671130	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q118903
1593	Trakai District Municipality	126	LT	65	52	\N	54.63791130	24.93468940	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q1987743
1594	Širvintos District Municipality	126	LT	65	47	\N	55.04310200	24.95698100	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q58882
1595	Pakruojis District Municipality	126	LT	65	30	\N	56.07326050	23.93899060	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q1657116
1596	Ukmergė District Municipality	126	LT	65	53	\N	55.24526500	24.77607490	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q68929
1597	Klaipeda City Municipality	126	LT	58	20	\N	55.70329480	21.14427950	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q16456513
1598	Utena District Municipality	126	LT	64	54	\N	55.50846140	25.68326420	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q2089798
1599	Alytus District Municipality	126	LT	56	03	\N	54.32974960	24.19609310	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q769940
1600	Klaipėda County	126	LT	58	KL	\N	55.65197440	21.37439560	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q475207
1601	Vilnius County	126	LT	65	VL	\N	54.80865020	25.21821390	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q188061
1602	Varėna District Municipality	126	LT	65	55	\N	54.22033300	24.57899700	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q1351747
1603	Birštonas Municipality	126	LT	65	05	\N	54.56696640	24.00930980	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q2015893
1604	Klaipėda District Municipality	126	LT	58	21	\N	55.68416150	21.44164640	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q141132
1605	Alytus City Municipality	126	LT	56	02	\N	54.39629380	24.04587610	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q3685407
1606	Vilnius City Municipality	126	LT	65	57	\N	54.67107610	25.28787210	2019-10-05 23:18:42	2022-08-31 15:52:51	1	Q923117
1607	Šilutė District Municipality	126	LT	65	46	\N	55.35041400	21.46598590	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q282098
1608	Telšiai District Municipality	126	LT	63	51	\N	55.91752150	22.34518400	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q588916
1609	Šiauliai City Municipality	126	LT	61	43	\N	55.93490850	23.31368230	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q4993831
1610	Marijampolė Municipality	126	LT	59	25	\N	54.57110940	23.48593710	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q1931377
1611	Lazdijai District Municipality	126	LT	59	24	\N	54.23432670	23.51565050	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q2069342
1612	Pagėgiai municipality	126	LT	59	29	\N	55.17213200	21.96836140	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q2283574
1613	Šilalė District Municipality	126	LT	59	45	\N	55.49268000	22.18455590	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q677400
1614	Panevėžys District Municipality	126	LT	60	33	\N	55.61667280	24.31422830	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q1351758
1615	Rokiškis District Municipality	126	LT	60	40	\N	55.95550390	25.58592490	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q766969
1616	Pasvalys District Municipality	126	LT	60	34	\N	56.06046190	24.39629100	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q1461920
1617	Skuodas District Municipality	126	LT	60	48	\N	56.27021690	21.52143310	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q219115
1618	Kelmė District Municipality	126	LT	60	19	\N	55.62663520	22.87817200	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q1387044
1619	Zarasai District Municipality	126	LT	60	60	\N	55.73096090	26.24529500	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q664415
1620	Vilkaviškis District Municipality	126	LT	60	56	\N	54.65194500	23.03515500	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q2021318
1621	Utena County	126	LT	64	UT	\N	55.53189690	25.79046990	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q188659
1622	Opole Voivodeship	176	PL	79	OP	\N	50.80037610	17.93798900	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54171
1623	Silesian Voivodeship	176	PL	83	SL	\N	50.57165950	19.32197680	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54181
1624	Pomeranian Voivodeship	176	PL	82	PM	\N	54.29442520	18.15311640	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54180
1625	Kuyavian-Pomeranian Voivodeship	176	PL	73	KP	\N	53.16483630	18.48342240	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54153
1626	Podkarpackie Voivodeship	176	PL	80	PK	\N	50.05747490	22.08956910	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54175
1628	Warmian-Masurian Voivodeship	176	PL	85	WN	\N	53.86711170	20.70278610	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54184
1629	Lower Silesian Voivodeship	176	PL	72	DS	\N	51.13398610	16.88419610	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54150
1630	Świętokrzyskie Voivodeship	176	PL	84	SK	\N	50.62610410	20.94062790	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54183
1631	Lubusz Voivodeship	176	PL	76	LB	\N	52.22746120	15.25591030	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54157
1632	Podlaskie Voivodeship	176	PL	81	PD	\N	53.06971590	22.96746390	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54177
1633	West Pomeranian Voivodeship	176	PL	87	ZP	\N	53.46578910	15.18225810	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54188
1634	Greater Poland Voivodeship	176	PL	86	WP	\N	52.27998600	17.35229390	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54187
1635	Lesser Poland Voivodeship	176	PL	77	MA	\N	49.72253060	20.25033580	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54159
1636	Łódź Voivodeship	176	PL	74	LD	\N	51.46347710	19.17269740	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54158
1637	Masovian Voivodeship	176	PL	78	MZ	\N	51.89271820	21.00216790	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54169
1638	Lublin Voivodeship	176	PL	75	LU	\N	51.24935190	23.10113920	2019-10-05 23:18:43	2022-08-31 15:52:51	1	Q54155
1639	Aargau	214	CH	01	AG	canton	47.38766640	8.25542950	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q11972
1640	Fribourg	214	CH	06	FR	canton	46.68167480	7.11726350	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12640
1641	Basel-Land	214	CH	03	BL	canton	47.44181220	7.76440020	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12146
1642	Uri	214	CH	21	UR	canton	41.48606470	-71.53085370	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12404
1643	Ticino	214	CH	20	TI	canton	46.33173400	8.80045290	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12724
1644	St. Gallen	214	CH	15	SG	canton	47.14562540	9.35043320	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12746
1645	Bern	214	CH	05	BE	canton	46.79886210	7.70807010	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q11911
1646	Zug	214	CH	24	ZG	canton	47.16615050	8.51547490	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q11933
1647	Geneva	214	CH	07	GE	canton	46.21800730	6.12169250	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q11917
1648	Valais	214	CH	22	VS	canton	46.19046140	7.54492260	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q834
1649	Appenzell Innerrhoden	214	CH	10	AI	canton	47.31619250	9.43165730	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12094
1650	Obwalden	214	CH	14	OW	canton	46.87785800	8.25124900	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12573
1651	Vaud	214	CH	23	VD	canton	46.56131350	6.53676500	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12771
1652	Nidwalden	214	CH	13	NW	canton	46.92670160	8.38499820	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12592
1653	Schwyz	214	CH	17	SZ	canton	47.02071380	8.65298840	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12433
1654	Schaffhausen	214	CH	16	SH	canton	47.70093640	8.56800400	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12697
1655	Appenzell Ausserrhoden	214	CH	02	AR	canton	47.36648100	9.30009160	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12079
1656	Zürich	214	CH	25	ZH	canton	47.35953600	8.63564520	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q11943
1657	Thurgau	214	CH	19	TG	canton	47.60378560	9.05573710	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12713
1658	Jura	214	CH	26	JU	canton	47.34444740	7.14306080	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12755
1659	Neuchâtel	214	CH	12	NE	canton	46.98998740	6.92927320	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12738
1660	Graubünden	214	CH	09	GR	canton	46.65698710	9.57802570	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q11925
1661	Glarus	214	CH	08	GL	canton	47.04112320	9.06790000	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q11922
1662	Solothurn	214	CH	18	SO	canton	47.33207170	7.63883850	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q11929
1663	Lucerne	214	CH	11	LU	canton	47.07956710	8.16624450	2019-10-05 23:18:43	2021-11-13 19:21:51	1	Q12121
1664	Tuscany	107	IT	16	52	region	43.77105130	11.24862080	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1273
1665	Padua	107	IT	16	PD	province	45.36618640	11.82091390	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16226
1666	Parma	107	IT	16	PR	province	44.80153220	10.32793540	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16228
1667	Siracusa	107	IT	16	SR	free municipal consortium	37.06569240	15.28571090	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q25510290
1668	Palermo	107	IT	16	PA	province	38.11569000	13.36148680	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q20795016
1669	Campania	107	IT	04	72	region	40.66708870	15.10681130	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1438
1670	Marche	107	IT	10	57	region	43.30456200	13.71947000	2019-10-05 23:18:43	2022-09-22 15:00:00	1	Q1279
1672	Ancona	107	IT	10	AN	province	43.54932450	13.26634790	2019-10-05 23:18:43	2022-05-08 20:07:14	1	Q16114
1674	Latina	107	IT	10	LT	province	41.40874760	13.08179030	2019-10-05 23:18:43	2022-05-08 20:09:31	1	Q16196
1675	Lecce	107	IT	10	LE	province	40.23473930	18.14286690	2019-10-05 23:18:43	2022-05-08 20:09:31	1	Q16197
1676	Pavia	107	IT	10	PV	province	45.32181660	8.84662360	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16231
1677	Lecco	107	IT	10	LC	province	45.93829410	9.38572900	2019-10-05 23:18:43	2022-05-08 20:09:31	1	Q16199
1678	Lazio	107	IT	07	62	region	41.81224100	12.73851000	2019-10-05 23:18:43	2022-09-22 15:00:00	1	Q1282
1679	Abruzzo	107	IT	01	65	region	42.19201190	13.72891670	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1284
1681	Ascoli Piceno	107	IT	01	AP	province	42.86389330	13.58997330	2019-10-05 23:18:43	2022-05-08 20:07:14	1	Q16117
1683	Umbria	107	IT	18	55	region	42.93800400	12.62162110	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1280
1685	Pisa	107	IT	18	PI	province	43.72283150	10.40171940	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16244
1686	Barletta-Andria-Trani	107	IT	18	BT	province	41.20045430	16.20514840	2019-10-05 23:18:43	2022-05-08 20:08:11	1	Q16124
1687	Pistoia	107	IT	18	PT	province	43.95437330	10.89030990	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16245
1688	Apulia	107	IT	13	75	region	40.79283930	17.10119310	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1447
1689	Belluno	107	IT	13	BL	province	46.24976590	12.19695650	2019-10-05 23:18:43	2022-05-08 20:07:41	1	Q16126
1690	Pordenone	107	IT	13	PN	decentralized regional entity	46.03788620	12.71083500	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16247
1691	Perugia	107	IT	13	PG	province	42.93800400	12.62162110	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16240
1692	Avellino	107	IT	13	AV	province	40.99645100	15.12589550	2019-10-05 23:18:43	2022-05-08 20:07:41	1	Q16120
1693	Pesaro and Urbino	107	IT	13	PU	province	43.61301180	12.71351210	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16241
1694	Pescara	107	IT	13	PE	province	42.35706550	13.96080910	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16242
1695	Molise	107	IT	11	67	region	41.67388650	14.75209390	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1443
1696	Piacenza	107	IT	11	PC	province	44.82631120	9.52914470	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16243
1697	Potenza	107	IT	11	PZ	province	40.41821940	15.87600400	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q16249
1700	Prato	107	IT	11	PO	province	44.04539000	11.11644520	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16250
1701	Benevento	107	IT	11	BN	province	41.20350930	14.75209390	2019-10-05 23:18:43	2022-05-08 20:07:41	1	Q16134
1702	Piedmont	107	IT	12	21	region	45.05223660	7.51538850	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1216
1703	Calabria	107	IT	03	78	region	39.30877140	16.34637910	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1458
1704	Bergamo	107	IT	03	BG	province	45.69826420	9.67726980	2019-10-05 23:18:43	2022-05-08 20:07:41	1	Q16137
1705	Lombardy	107	IT	09	25	region	45.47906710	9.84524330	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1210
1706	Basilicata	107	IT	02	77	region	40.64307660	15.96998780	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1452
1707	Ravenna	107	IT	02	RA	province	44.41844430	12.20359980	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q16252
1708	Reggio Emilia	107	IT	02	RE	province	44.58565800	10.55647360	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q16254
1709	Sicily	107	IT	15	82	autonomous region	37.59999380	14.01535570	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1460
1712	Rieti	107	IT	15	RI	province	42.36744050	12.89750980	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q16267
1713	Rimini	107	IT	15	RN	province	44.06782880	12.56951580	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q16268
1714	Brindisi	107	IT	15	BR	province	40.61126630	17.76362100	2019-10-05 23:18:43	2022-05-08 20:08:11	1	Q16148
1715	Sardinia	107	IT	14	88	autonomous region	40.12087520	9.01289260	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1462
1716	Aosta Valley	107	IT	19	23	autonomous region	45.73888780	7.42618660	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1222
1717	Brescia	107	IT	19	BS	province	45.54155260	10.21180190	2019-10-05 23:18:43	2022-05-08 20:08:11	1	Q16144
1718	Caltanissetta	107	IT	19	CL	free municipal consortium	37.48601300	14.06149820	2019-10-05 23:18:43	2022-05-08 20:08:11	1	Q26160410
1719	Rovigo	107	IT	19	RO	province	45.02418180	11.82381620	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q16270
1720	Salerno	107	IT	19	SA	province	40.42878320	15.21948080	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q16271
1721	Campobasso	107	IT	19	CB	province	41.67388650	14.75209390	2019-10-05 23:18:43	2022-05-08 20:08:11	1	Q16151
1722	Sassari	107	IT	19	SS	province	40.79679070	8.57504070	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q16272
1723	Enna	107	IT	19	EN	free municipal consortium	37.56762160	14.27953490	2019-10-05 23:18:43	2022-05-08 20:08:42	1	Q26160408
1725	Trentino-South Tyrol	107	IT	17	32	autonomous region	46.43366620	11.16932960	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1237
1726	Verbano-Cusio-Ossola	107	IT	17	VB	province	46.13996880	8.27246490	2019-10-05 23:18:43	2022-05-08 20:12:57	1	Q16312
1727	Agrigento	107	IT	17	AG	free municipal consortium	37.31052020	13.58579780	2019-10-05 23:18:43	2022-05-08 20:07:14	1	Q26160406
1728	Catanzaro	107	IT	17	CZ	province	38.88963480	16.44058720	2019-10-05 23:18:43	2022-05-08 20:08:42	1	Q16159
1729	Ragusa	107	IT	17	RG	free municipal consortium	36.92692730	14.72551290	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q26160405
1730	South Sardinia	107	IT	17	SU	province	39.38935350	8.93970000	2019-10-05 23:18:43	2022-05-08 20:06:51	1	Q23498165
1731	Caserta	107	IT	17	CE	province	41.20783540	14.10013260	2019-10-05 23:18:43	2022-05-08 20:08:11	1	Q16153
1732	Savona	107	IT	17	SV	province	44.28879950	8.26505800	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q16274
1733	Trapani	107	IT	17	TP	free municipal consortium	38.01831160	12.51482650	2019-10-05 23:18:43	2022-05-08 20:12:57	1	Q26160403
1734	Siena	107	IT	17	SI	province	43.29377320	11.43391480	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q16275
1735	Viterbo	107	IT	17	VT	province	42.40024200	11.88917210	2019-10-05 23:18:43	2022-05-08 20:13:09	1	Q16318
1736	Verona	107	IT	17	VR	province	45.44184980	11.07353160	2019-10-05 23:18:43	2022-05-08 20:12:57	1	Q16314
1737	Vibo Valentia	107	IT	17	VV	province	38.63785650	16.20514840	2019-10-05 23:18:43	2022-05-08 20:13:14	1	Q16315
1738	Vicenza	107	IT	17	VI	province	45.69839950	11.56614650	2019-10-05 23:18:43	2022-05-08 20:12:57	1	Q16316
1739	Chieti	107	IT	17	CH	province	42.03344280	14.37919120	2019-10-05 23:18:43	2022-05-08 20:08:11	1	Q16160
1740	Como	107	IT	17	CO	province	45.80804160	9.08517930	2019-10-05 23:18:43	2022-05-08 20:08:11	1	Q16161
1741	Sondrio	107	IT	17	SO	province	46.17276360	9.79949170	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q16282
1742	Cosenza	107	IT	17	CS	province	39.56441050	16.25221430	2019-10-05 23:18:43	2022-05-08 20:08:42	1	Q16162
1743	Taranto	107	IT	17	TA	province	40.57409010	17.24299760	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q16283
1744	Fermo	107	IT	17	FM	province	43.09313670	13.58997330	2019-10-05 23:18:43	2022-05-08 20:08:42	1	Q16167
1745	Livorno	107	IT	17	LI	province	43.02398480	10.66471010	2019-10-05 23:18:43	2022-05-08 20:09:31	1	Q16200
1746	Ferrara	107	IT	17	FE	province	44.76636800	11.76440680	2019-10-05 23:18:43	2022-05-08 20:08:42	1	Q16168
1747	Lodi	107	IT	17	LO	province	45.24050360	9.52925120	2019-10-05 23:18:43	2022-05-08 20:09:31	1	Q16201
1749	Lucca	107	IT	17	LU	province	43.83767360	10.49505300	2019-10-05 23:18:43	2022-05-08 20:09:31	1	Q16202
1750	Macerata	107	IT	17	MC	province	43.24593220	13.26634790	2019-10-05 23:18:43	2022-05-08 20:09:55	1	Q16203
1751	Cremona	107	IT	17	CR	province	45.20143750	9.98365820	2019-10-05 23:18:43	2022-05-08 20:08:11	1	Q16163
1752	Teramo	107	IT	17	TE	province	42.58956080	13.63627150	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q16284
1753	Veneto	107	IT	20	34	region	45.44146620	12.31525950	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1243
1754	Crotone	107	IT	20	KR	province	39.13098560	17.00670310	2019-10-05 23:18:43	2022-05-08 20:09:31	1	Q16165
1755	Terni	107	IT	20	TR	province	42.56345340	12.52980280	2019-10-05 23:18:43	2022-05-08 20:12:57	1	Q16286
1756	Friuli–Venezia Giulia	107	IT	06	36	autonomous region	46.22591770	13.10336460	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1250
1757	Modena	107	IT	06	MO	province	44.55137990	10.91804800	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16209
1758	Mantua	107	IT	06	MN	province	45.16677280	10.77536130	2019-10-05 23:18:43	2022-05-08 20:10:05	1	Q16204
1759	Massa and Carrara	107	IT	06	MS	province	44.22139980	10.03596610	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16205
1760	Matera	107	IT	06	MT	province	40.66634960	16.60436360	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16206
1761	Medio Campidano	107	IT	06	VS	province	39.53173890	8.70407500	2019-10-05 23:18:43	2022-05-08 20:13:09	1	Q16207
1762	Treviso	107	IT	06	TV	province	45.66685170	12.24306170	2019-10-05 23:18:43	2022-05-08 20:12:57	1	Q16292
1763	Trieste	107	IT	06	TS	decentralized regional entity	45.68948230	13.78330720	2019-10-05 23:18:43	2022-05-08 20:12:57	1	Q16293
1764	Udine	107	IT	06	UD	decentralized regional entity	46.14079720	13.16628960	2019-10-05 23:18:43	2022-05-08 20:12:57	1	Q16294
1765	Varese	107	IT	06	VA	province	45.79902600	8.73009450	2019-10-05 23:18:43	2022-05-08 20:12:57	1	Q16299
1768	Liguria	107	IT	08	42	region	44.31679170	8.39649380	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1256
1769	Monza and Brianza	107	IT	08	MB	province	45.62359900	9.25880150	2019-10-05 23:18:43	2022-05-08 20:09:31	1	Q16210
1771	Foggia	107	IT	08	FG	province	41.63844800	15.59433880	2019-10-05 23:18:43	2022-05-08 20:08:42	1	Q15129
1773	Emilia-Romagna	107	IT	05	45	region	44.59676070	11.21863960	2019-10-05 23:18:43	2021-09-26 18:37:37	1	Q1263
1774	Novara	107	IT	05	NO	province	45.54851330	8.51507930	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16216
1775	Cuneo	107	IT	05	CN	province	44.59703140	7.61142170	2019-10-05 23:18:43	2022-05-08 20:08:11	1	Q15091
1776	Frosinone	107	IT	05	FR	province	41.65765280	13.63627150	2019-10-05 23:18:43	2022-05-08 20:08:42	1	Q16181
1777	Gorizia	107	IT	05	GO	decentralized regional entity	45.90538990	13.51637250	2019-10-05 23:18:43	2022-05-08 20:08:59	1	Q16184
1778	Biella	107	IT	05	BI	province	45.56281760	8.05827170	2019-10-05 23:18:43	2022-05-08 20:07:41	1	Q15094
1779	Forlì-Cesena	107	IT	05	FC	province	43.99476810	11.98046130	2019-10-05 23:18:43	2022-05-08 20:08:42	1	Q16180
1780	Asti	107	IT	05	AT	province	44.90076520	8.20643150	2019-10-05 23:18:43	2022-05-08 20:07:41	1	Q15099
1781	L\\"Aquila	107	IT	05	AQ	province	42.12563170	13.63627150	2019-10-05 23:18:43	2022-05-08 20:07:14	1	Q16189
1783	Alessandria	107	IT	05	AL	province	44.81755870	8.70466270	2019-10-05 23:18:43	2022-05-08 20:07:14	1	Q15097
1785	Vercelli	107	IT	05	VC	province	45.32022040	8.41850800	2019-10-05 23:18:43	2022-05-08 20:12:57	1	Q15096
1786	Oristano	107	IT	05	OR	province	40.05990680	8.74811670	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16225
1787	Grosseto	107	IT	05	GR	province	42.85180070	11.25237920	2019-10-05 23:18:43	2022-05-08 20:08:59	1	Q16185
1788	Imperia	107	IT	05	IM	province	43.94186600	7.82863680	2019-10-05 23:18:43	2022-05-08 20:08:59	1	Q16186
1789	Isernia	107	IT	05	IS	province	41.58915550	14.19309180	2019-10-05 23:18:43	2022-05-08 20:09:31	1	Q16187
1790	Nuoro	107	IT	05	NU	province	40.32869040	9.45615500	2019-10-05 23:18:43	2022-05-08 20:11:10	1	Q16220
1791	La Spezia	107	IT	05	SP	province	44.24479130	9.76786870	2019-10-05 23:18:43	2022-05-08 20:12:08	1	Q16188
1792	Sumatera Utara	102	ID	26	SU	province	2.11535470	99.54509740	2019-10-05 23:18:43	2022-05-21 21:48:20	1	Q2140
1793	Bengkulu	102	ID	03	BE	province	-3.79284510	102.26076410	2019-10-05 23:18:43	2022-05-21 21:48:20	1	Q1890
1794	Kalimantan Tengah	102	ID	13	KT	province	-1.68148780	113.38235450	2019-10-05 23:18:43	2022-05-21 21:48:20	1	Q3891
1795	Sulawesi Selatan	102	ID	38	SN	province	-3.66879940	119.97405340	2019-10-05 23:18:43	2022-05-21 21:48:20	1	Q5078
1796	Sulawesi Tenggara	102	ID	22	SG	province	-4.14491000	122.17460500	2019-10-05 23:18:43	2022-05-21 21:48:20	1	Q5075
1798	Papua	102	ID	36	PA	province	-5.01222020	141.34701590	2019-10-05 23:18:43	2022-05-21 21:48:20	1	Q5095
1799	Papua Barat	102	ID	39	PB	province	-1.33611540	133.17471620	2019-10-05 23:18:43	2022-05-21 21:48:20	1	Q5096
1800	Maluku	102	ID	28	MA	province	-3.23846160	130.14527340	2019-10-05 23:18:43	2022-05-21 21:48:20	1	Q5093
1801	Maluku Utara	102	ID	29	MU	province	1.57099930	127.80876930	2019-10-05 23:18:43	2022-05-21 21:48:20	1	Q5094
1802	Jawa Tengah	102	ID	07	JT	province	-7.15097500	110.14025940	2019-10-05 23:18:43	2022-05-21 21:48:20	1	Q3557
1804	Kalimantan Timur	102	ID	14	KI	province	0.53865860	116.41938900	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q3899
1805	DKI Jakarta	102	ID	04	JK	capital district	-6.20876340	106.84559900	2019-10-05 23:18:44	2022-05-21 21:48:40	1	Q3630
1806	Kalimantan Barat	102	ID	11	KB	province	0.47734750	106.61314050	2019-10-05 23:18:44	2022-05-21 21:52:41	1	Q3795
1807	Kepulauan Riau	102	ID	40	KR	province	3.94565140	108.14286690	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q2223
1808	Sulawesi Utara	102	ID	31	SA	province	0.62469320	123.97500180	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q5068
1809	Riau	102	ID	37	RI	province	0.29334690	101.70682940	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q2175
1810	Banten	102	ID	33	BT	province	-6.40581720	106.06401790	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q3540
1811	Lampung	102	ID	15	LA	province	-4.55858490	105.40680790	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q2110
1812	Gorontalo	102	ID	34	GO	province	0.54354420	123.05676930	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q5067
1813	Sulawesi Tengah	102	ID	21	ST	province	-1.43002540	121.44561790	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q5065
1814	Nusa Tenggara Barat	102	ID	17	NB	province	-8.65293340	117.36164760	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q5062
1815	Jambi	102	ID	05	JA	province	-1.61012290	103.61312030	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q2051
1816	Sumatera Selatan	102	ID	32	SS	province	-3.31943740	103.91439900	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q2271
1817	Sulawesi Barat	102	ID	41	SR	province	-2.84413710	119.23207840	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q5082
1818	Nusa Tenggara Timur	102	ID	18	NT	province	-8.65738190	121.07937050	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q5061
1819	Kalimantan Selatan	102	ID	12	KS	province	-3.09264150	115.28375850	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q3906
1820	Kepulauan Bangka Belitung	102	ID	35	BB	province	-2.74105130	106.44058720	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q1866
1822	Aceh	102	ID	01	AC	province	4.69513500	96.74939930	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q1823
1824	Kalimantan Utara	102	ID	42	KU	province	3.07309290	116.04138890	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q3903
1825	Jawa Barat	102	ID	30	JB	province	-7.09091100	107.66888700	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q3724
1826	Bali	102	ID	02	BA	province	-8.34053890	115.09195090	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q3125978
1827	Jawa Timur	102	ID	08	JI	province	-7.53606390	112.23840170	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q3586
1828	Sumatera Barat	102	ID	24	SB	province	-0.73993970	100.80000510	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q2772
1829	DI Yogyakarta	102	ID	10	YO	province	-7.87538490	110.42620880	2019-10-05 23:18:44	2022-05-21 21:48:20	1	Q3741
1830	Phoenix Islands	114	KI	03	P	\N	33.32843690	-111.98247740	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q271674
1831	Gilbert Islands	114	KI	01	G	\N	0.35242620	174.75526340	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q271876
1832	Line Islands	114	KI	02	L	\N	1.74294390	-157.21328260	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q55076234
1833	Primorsky Krai	182	RU	59	PRI	\N	45.05256410	135.00000000	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q4341
1834	Novgorod Oblast	182	RU	52	NGR	\N	58.24275520	32.56651900	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2240
1835	Jewish Autonomous Oblast	182	RU	89	YEV	\N	48.48081470	131.76573670	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q7730
1836	Nenets Autonomous Okrug	182	RU	50	NEN	\N	67.60783370	57.63383310	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2164
1837	Rostov Oblast	182	RU	61	ROS	\N	47.68532470	41.82589520	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q3573
1838	Khanty-Mansi Autonomous Okrug	182	RU	32	KHM	\N	62.22870620	70.64100570	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q6320
1839	Magadan Oblast	182	RU	44	MAG	\N	62.66434170	153.91499100	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q7971
1840	Krasnoyarsk Krai	182	RU	91	KYA	\N	64.24797580	95.11041760	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q6563
1841	Republic of Karelia	182	RU	28	KR	\N	63.15587020	32.99055520	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1914
1842	Republic of Buryatia	182	RU	11	BU	\N	54.83311460	112.40605300	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q6809
1843	Murmansk Oblast	182	RU	49	MUR	\N	67.84426740	35.08841020	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1759
1844	Kaluga Oblast	182	RU	25	KLU	\N	54.38726660	35.18890940	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2842
1845	Chelyabinsk Oblast	182	RU	13	CHE	\N	54.43194220	60.87889630	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5714
1846	Omsk Oblast	182	RU	54	OMS	\N	55.05546690	73.31673420	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5835
1847	Yamalo-Nenets Autonomous Okrug	182	RU	87	YAN	\N	66.06530570	76.93451930	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q6407
1848	Sakha Republic	182	RU	63	SA	\N	66.76134510	124.12375300	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q6605
1849	Arkhangelsk	182	RU	06	ARK	\N	64.54585490	40.55057690	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1875
1850	Republic of Dagestan	182	RU	17	DA	\N	42.14318860	47.09497990	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5118
1851	Yaroslavl Oblast	182	RU	88	YAR	\N	57.89915230	38.83886330	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2448
1852	Republic of Adygea	182	RU	01	AD	\N	44.82291550	40.17544630	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q3734
1853	Republic of North Ossetia-Alania	182	RU	68	SE	\N	43.04513020	44.28709720	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5237
1854	Republic of Bashkortostan	182	RU	08	BA	\N	54.23121720	56.16452570	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5710
1855	Kursk Oblast	182	RU	41	KRS	\N	51.76340260	35.38118120	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q3178
1856	Ulyanovsk Oblast	182	RU	81	ULY	\N	53.97933570	47.77624250	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5634
1857	Nizhny Novgorod Oblast	182	RU	51	NIZ	\N	55.79951590	44.02967690	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2246
1858	Amur Oblast	182	RU	05	AMU	\N	54.60350650	127.48017210	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q6886
1859	Chukotka Autonomous Okrug	182	RU	15	CHU	\N	65.62983550	171.69521590	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q7984
1860	Tver Oblast	182	RU	77	TVE	\N	57.00216540	33.98531420	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2292
1861	Republic of Tatarstan	182	RU	73	TA	\N	55.18023640	50.72639450	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5481
1862	Samara Oblast	182	RU	65	SAM	\N	53.41838390	50.47255280	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1727
1863	Pskov Oblast	182	RU	60	PSK	\N	56.77085990	29.09400900	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2218
1864	Ivanovo Oblast	182	RU	21	IVA	\N	57.10568540	41.48300840	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2654
1865	Kamchatka Krai	182	RU	92	KAM	\N	61.43439810	166.78841310	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q7948
1866	Astrakhan Oblast	182	RU	07	AST	\N	46.13211660	48.06101150	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q3941
1867	Bryansk Oblast	182	RU	10	BRY	\N	53.04085990	33.26909000	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2810
1868	Stavropol Krai	182	RU	70	STA	\N	44.66809930	43.52021400	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5207
1869	Karachay-Cherkess Republic	182	RU	27	KC	\N	43.88451430	41.73039390	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5328
1870	Mari El Republic	182	RU	45	ME	\N	56.43845700	47.96077580	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5446
1871	Perm Krai	182	RU	90	PER	\N	58.82319290	56.58724810	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5400
1872	Tomsk Oblast	182	RU	75	TOM	\N	58.89698820	82.67655000	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5884
1873	Khabarovsk Krai	182	RU	30	KHA	\N	50.58884310	135.00000000	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q7788
1874	Vologda Oblast	182	RU	85	VLG	\N	59.87067110	40.65554110	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2015
1875	Sakhalin	182	RU	64	SAK	\N	50.69098480	142.95056890	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q7797
1876	Altai Republic	182	RU	03	AL	\N	50.61819240	86.21993080	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5971
1877	Republic of Khakassia	182	RU	31	KK	\N	53.04522810	90.39821450	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q6543
1878	Tambov Oblast	182	RU	72	TAM	\N	52.64165890	41.42164510	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q3550
1879	Saint Petersburg	182	RU	66	SPE	\N	59.93105840	30.36090960	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q656
1880	Irkutsk	182	RU	20	IRK	\N	52.28548340	104.28902220	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q6585
1881	Vladimir Oblast	182	RU	83	VLA	\N	56.15534650	40.59266850	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2702
1882	Moscow Oblast	182	RU	47	MOS	\N	55.34039600	38.29176510	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1697
1883	Republic of Kalmykia	182	RU	24	KL	\N	46.18671760	45.00000000	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q3953
1884	Republic of Ingushetia	182	RU	19	IN	\N	43.40516980	44.82029990	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5219
1885	Smolensk Oblast	182	RU	69	SMO	\N	54.98829940	32.66773780	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2347
1886	Orenburg Oblast	182	RU	55	ORE	\N	51.76340260	54.61881880	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5338
1887	Saratov Oblast	182	RU	67	SAR	\N	51.83692630	46.75393970	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5334
1888	Novosibirsk	182	RU	53	NVS	\N	54.98326930	82.89638310	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5851
1889	Lipetsk Oblast	182	RU	43	LIP	\N	52.52647020	39.20322690	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q3510
1890	Kirov Oblast	182	RU	33	KIR	\N	58.41985290	50.20972480	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5387
1891	Krasnodar Krai	182	RU	38	KDA	\N	45.64152890	39.70559770	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q3680
1892	Kabardino-Balkar Republic	182	RU	22	KB	\N	43.39324690	43.56284980	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5267
1893	Chechen Republic	182	RU	12	CE	\N	43.40233010	45.71874680	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5187
1894	Sverdlovsk	182	RU	71	SVE	\N	56.84309930	60.64540860	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5462
1895	Tula Oblast	182	RU	76	TUL	\N	54.16376800	37.56495070	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2792
1896	Leningrad Oblast	182	RU	42	LEN	\N	60.07932080	31.89266450	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2191
1897	Kemerovo Oblast	182	RU	29	KEM	\N	54.75746480	87.40552880	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q6076
1898	Republic of Mordovia	182	RU	46	MO	\N	54.23694410	44.06839700	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5340
1899	Komi Republic	182	RU	34	KO	\N	63.86305390	54.83126900	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2073
1900	Tuva Republic	182	RU	79	TY	\N	51.88726690	95.62601720	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q960
1901	Moscow	182	RU	48	MOW	\N	55.75582600	37.61729990	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q649
1902	Kaliningrad	182	RU	23	KGD	\N	54.71042640	20.45221440	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1749
1903	Belgorod Oblast	182	RU	09	BEL	\N	50.71069260	37.75333770	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q3329
1904	Zabaykalsky Krai	182	RU	93	ZAB	\N	53.09287710	116.96765610	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q6838
1905	Ryazan Oblast	182	RU	62	RYA	\N	54.38759640	41.25956610	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2753
1906	Voronezh Oblast	182	RU	86	VOR	\N	50.85897130	39.86443740	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q3447
1907	Tyumen Oblast	182	RU	78	TYU	\N	56.96343870	66.94827800	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5824
1908	Oryol Oblast	182	RU	56	ORL	\N	52.78564140	36.92423440	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q3129
1909	Penza Oblast	182	RU	57	PNZ	\N	53.14121050	44.09400480	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5545
1910	Kostroma Oblast	182	RU	37	KOS	\N	58.55010690	43.95411020	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2596
1911	Altai Krai	182	RU	04	ALT	\N	51.79362980	82.67585960	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5942
1912	Sevastopol	230	UA	20	40	\N	44.61665000	33.52536710	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q7525
1913	Udmurt Republic	182	RU	80	UD	\N	57.06702180	53.02779480	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5422
1914	Chuvash Republic	182	RU	16	CU	\N	55.55959920	46.92835350	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5466
1915	Kurgan Oblast	182	RU	40	KGN	\N	55.44815480	65.11809750	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q5741
1916	Lomaiviti	73	FJ	40	06	\N	-17.70900000	179.09100000	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q2144922
1917	Ba	73	FJ	40	01	\N	36.06138930	-95.80058720	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q797434
1918	Tailevu	73	FJ	40	14	\N	-17.82691110	178.29324800	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1365322
1919	Nadroga-Navosa	73	FJ	40	08	\N	-17.98652780	177.65811300	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q952528
1920	Rewa	73	FJ	40	12	\N	34.79235170	-82.36092640	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1365257
1921	Northern Division	73	FJ	03	N	\N	32.87687660	-117.21563450	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1062430
1922	Macuata	73	FJ	03	07	\N	-16.48649220	179.28472510	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1365304
1923	Western Division	73	FJ	05	W	\N	42.96621980	-78.70211340	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1062451
1924	Cakaudrove	73	FJ	05	03	\N	-16.58141050	179.51200840	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q676046
1925	Serua	73	FJ	05	13	\N	-18.18047490	178.05097900	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1208362
1926	Ra	73	FJ	05	11	\N	37.10031530	-95.67442460	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1208350
1927	Naitasiri	73	FJ	05	09	\N	-17.89757540	178.20715980	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1365284
1928	Namosi	73	FJ	05	10	\N	-18.08641760	178.12913870	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1365295
1929	Central Division	73	FJ	01	C	\N	34.04400660	-118.24727380	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1053789
1930	Bua	73	FJ	01	02	\N	43.09645840	-89.50088000	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1365265
1931	Rotuma	73	FJ	04	R	\N	-12.50250690	177.07241640	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q459763
1932	Eastern Division	73	FJ	02	E	\N	32.80943050	-117.12899370	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q182169
1933	Lau	73	FJ	02	05	\N	31.66870150	-106.39557630	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q513104
1934	Kadavu	73	FJ	02	04	\N	-19.01271220	178.18766760	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q1196481
1935	Labuan	132	MY	15	15	\N	5.28314560	115.23082500	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q214504
1936	Sabah	132	MY	16	12	\N	5.97883980	116.07531990	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q179029
1937	Sarawak	132	MY	11	13	\N	1.55327830	110.35921270	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q170462
1938	Perlis	132	MY	08	09	\N	29.92270940	-90.12285590	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q213467
1939	Penang	132	MY	09	07	\N	5.41639350	100.33267860	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q188096
1940	Pahang	132	MY	06	06	\N	3.81263180	103.32562040	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q191346
1941	Malacca	132	MY	04	04	\N	2.18959400	102.25008680	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q185221
1942	Terengganu	132	MY	13	11	\N	5.31169160	103.13241540	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q189701
1943	Perak	132	MY	07	08	\N	4.59211260	101.09010900	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q188953
1944	Selangor	132	MY	12	10	\N	3.07383790	101.51834690	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q189710
1945	Putrajaya	132	MY	17	16	\N	2.92636100	101.69644500	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q182378
1946	Kelantan	132	MY	03	03	\N	6.12539690	102.23807100	2019-10-05 23:18:44	2022-08-31 15:52:51	1	Q185944
1947	Kedah	132	MY	02	02	\N	6.11839640	100.36845950	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q188947
1948	Negeri Sembilan	132	MY	05	05	\N	2.72580580	101.94237820	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q213893
1949	Kuala Lumpur	132	MY	14	14	\N	3.13900300	101.68685500	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q1865
1950	Johor	132	MY	01	01	\N	1.48536820	103.76181540	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q183032
1951	Mashonaland East Province	247	ZW	04	ME	\N	-18.58716420	31.26263660	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q465853
1952	Matabeleland South Province	247	ZW	07	MS	\N	-21.05233700	29.04599270	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q498355
1953	Mashonaland West Province	247	ZW	05	MW	\N	-17.48510290	29.78892480	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q457189
1954	Matabeleland North Province	247	ZW	06	MN	\N	-18.53315660	27.54958460	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q456562
1955	Mashonaland Central Province	247	ZW	03	MC	\N	-16.76442950	31.07937050	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q596156
1956	Bulawayo Province	247	ZW	09	BU	\N	-20.14895050	28.53310380	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q24045859
1957	Midlands Province	247	ZW	02	MI	\N	-19.05520090	29.60354950	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q456556
1958	Harare Province	247	ZW	10	HA	\N	-17.82162880	31.04922590	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q16928358
1959	Manicaland	247	ZW	01	MA	\N	-18.92163860	32.17460500	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q465847
1960	Masvingo Province	247	ZW	08	MV	\N	-20.62415090	31.26263660	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q498351
1961	Bulgan Province	146	MN	21	067	\N	48.96909130	102.88317230	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q209774
1962	Darkhan-Uul Province	146	MN	23	037	\N	49.46484340	105.97459190	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q18827
1963	Dornod Province	146	MN	06	061	\N	47.46581540	115.39271200	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q207795
1964	Khovd Province	146	MN	12	043	\N	47.11296540	92.31107520	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q194098
1965	Övörkhangai Province	146	MN	15	055	\N	45.76243920	103.09170320	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q234713
1966	Orkhon Province	146	MN	25	035	\N	49.00470500	104.30165270	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q234710
1967	Ömnögovi Province	146	MN	14	053	\N	43.50002400	104.28611160	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q235579
1968	Töv Province	146	MN	18	047	\N	47.21240560	106.41541000	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q276195
1969	Bayan-Ölgii Province	146	MN	03	071	\N	48.39832540	89.66259150	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q191792
1970	Dundgovi Province	146	MN	08	059	\N	45.58227860	106.76442090	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q211835
1971	Uvs Province	146	MN	19	046	\N	49.64497070	93.27365760	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q192942
1972	Govi-Altai Province	146	MN	10	065	\N	45.45112270	95.85057660	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q192945
1973	Arkhangai Province	146	MN	01	073	\N	47.89711010	100.72401650	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q207809
1974	Khentii Province	146	MN	11	039	\N	47.60812090	109.93728560	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q239040
1975	Khövsgöl Province	146	MN	13	041	\N	50.22044840	100.32137680	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q244788
1976	Bayankhongor Province	146	MN	02	069	\N	45.15267070	100.10736670	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q276200
1977	Sükhbaatar Province	146	MN	17	051	\N	46.56531630	113.53808360	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q244804
1978	Govisümber Province	146	MN	24	064	\N	46.47627540	108.55706270	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q236333
1979	Zavkhan Province	146	MN	09	057	\N	48.23881470	96.07030190	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q167764
1980	Selenge Province	146	MN	16	049	\N	50.00592730	106.44341080	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q234680
1981	Dornogovi Province	146	MN	07	063	\N	43.96538890	109.17734590	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q213272
1982	Northern Province	246	ZM	05	05	\N	8.88550270	80.27673270	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q778738
1983	Western Province	246	ZM	01	01	\N	6.90160860	80.00877460	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q748486
1984	Copperbelt Province	246	ZM	08	08	\N	-13.05700730	27.54958460	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q1131523
1985	Northwestern Province	246	ZM	06	06	\N	-13.00502580	24.90422080	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q846320
1986	Central Province	246	ZM	02	02	\N	7.25649960	80.72144170	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q190718
1987	Luapula Province	246	ZM	04	04	\N	-11.56483100	29.04599270	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q386667
1988	Lusaka Province	246	ZM	09	09	\N	-15.36571290	29.23207840	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q819998
1989	Muchinga Province	246	ZM	10	10	\N	-15.38219300	28.26158000	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q6714242
1990	Southern Province	246	ZM	07	07	\N	6.23737500	80.54384500	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q738382
1991	Eastern Province	246	ZM	03	03	\N	23.16696880	49.36531490	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q823810
1992	Capital	18	BH	16	13	\N	\N	\N	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q528953
1993	Southern	18	BH	17	14	\N	25.93810180	50.57568870	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q838532
1994	Northern	18	BH	18	17	\N	26.15519140	50.48251730	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q840445
1995	Muharraq	18	BH	15	15	\N	26.26856530	50.64825170	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q375630
1996	Central	18	BH	19	16	\N	26.14260930	50.56532940	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q856539
1997	Rio de Janeiro	31	BR	21	RJ	\N	-22.90684670	-43.17289650	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q41428
1998	Minas Gerais	31	BR	15	MG	\N	-18.51217800	-44.55503080	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q39109
1999	Amapá	31	BR	03	AP	\N	0.90199250	-52.00295650	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q40130
2000	Goiás	31	BR	29	GO	\N	-15.82703690	-49.83622370	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q41587
2001	Rio Grande do Sul	31	BR	23	RS	\N	-30.03463160	-51.21769860	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q40030
2002	Bahia	31	BR	05	BA	\N	-11.40987400	-41.28085700	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q40430
2003	Sergipe	31	BR	28	SE	\N	-10.57409340	-37.38565810	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q43783
2004	Amazonas	31	BR	04	AM	\N	-3.07000000	-61.66000000	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q40040
2005	Paraíba	31	BR	17	PB	\N	-7.23996090	-36.78195050	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q38088
2006	Pernambuco	31	BR	30	PE	\N	-8.81371730	-36.95410700	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q40942
2007	Alagoas	31	BR	02	AL	\N	-9.57130580	-36.78195050	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q40885
2008	Piauí	31	BR	20	PI	\N	-7.71834010	-42.72892360	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q42722
2009	Pará	31	BR	16	PA	\N	-1.99812710	-54.93061520	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q39517
2010	Mato Grosso do Sul	31	BR	11	MS	\N	-20.77222950	-54.78515310	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q43319
2011	Mato Grosso	31	BR	14	MT	\N	-12.68187120	-56.92109900	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q42824
2012	Acre	31	BR	01	AC	\N	-9.02379600	-70.81199500	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q40780
2013	Rondônia	31	BR	24	RO	\N	-11.50573410	-63.58061100	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q43235
2014	Santa Catarina	31	BR	26	SC	\N	-27.33000000	-49.44000000	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q41115
2015	Maranhão	31	BR	13	MA	\N	-4.96094980	-45.27441590	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q42362
2016	Ceará	31	BR	06	CE	\N	-5.49839770	-39.32062410	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q40123
2017	Distrito Federal	31	BR	07	DF	\N	-15.79976540	-47.86447150	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q119158
2018	Espírito Santo	31	BR	08	ES	\N	-19.18342290	-40.30886260	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q43233
2019	Rio Grande do Norte	31	BR	22	RN	\N	-5.40258030	-36.95410700	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q43255
2020	Tocantins	31	BR	31	TO	\N	-10.17528000	-48.29824740	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q43695
2021	São Paulo	31	BR	27	SP	\N	-23.55051990	-46.63330940	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q175
2022	Paraná	31	BR	18	PR	\N	-25.25208880	-52.02154150	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q15499
2023	Aragatsotn Region	12	AM	01	AG	\N	40.33473010	44.37482960	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q17915
2024	Ararat Province	12	AM	02	AR	\N	39.91394150	44.72000040	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q199880
2025	Vayots Dzor Region	12	AM	10	VD	\N	39.76419960	45.33375280	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q200124
2026	Armavir Region	12	AM	03	AV	\N	40.15546310	44.03724460	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q201147
2027	Syunik Province	12	AM	08	SU	\N	39.51331120	46.33932340	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q2523428
2028	Gegharkunik Province	12	AM	04	GR	\N	40.35264260	45.12604140	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q199905
2029	Lori Region	12	AM	06	LO	\N	40.96984520	44.49001380	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q200350
2030	Yerevan	12	AM	11	ER	\N	40.18720230	44.51520900	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q1953
2031	Shirak Region	12	AM	07	SH	\N	40.96308140	43.81024610	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q201063
2032	Tavush Region	12	AM	09	TV	\N	40.88662960	45.33934900	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q201140
2033	Kotayk Region	12	AM	05	KT	\N	40.54102140	44.76901480	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q4511
2034	Cojedes	239	VE	08	H	state	9.38166820	-68.33392750	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q205460
2035	Falcón	239	VE	11	I	state	11.18106740	-69.85974060	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q202071
2036	Portuguesa	239	VE	18	P	state	9.09439990	-69.09702300	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q205784
2037	Miranda	239	VE	15	M	state	42.35193830	-71.52907660	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q191174
2038	Lara	239	VE	13	K	state	33.98221650	-118.13227470	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q205796
2039	Bolívar	239	VE	06	F	state	37.61448380	-93.41047490	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q191164
2040	Carabobo	239	VE	07	G	state	10.11764330	-68.04775090	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q191186
2041	Yaracuy	239	VE	22	U	state	10.33938900	-68.81088490	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q201121
2042	Zulia	239	VE	23	V	state	10.29102370	-72.14161320	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q43269
2043	Trujillo	239	VE	21	T	state	36.67343430	-121.62875880	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q202068
2044	Amazonas	239	VE	01	Z	state	-3.41684270	-65.85606460	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q170453
2045	Guárico	239	VE	12	J	state	8.74893090	-66.23671720	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q202075
2046	Federal Dependencies of Venezuela	239	VE	24	W	federal dependency	10.93770530	-65.35695730	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q130343
2047	Aragua	239	VE	04	D	state	10.06357580	-67.28478750	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q190687
2048	Táchira	239	VE	20	S	state	7.91370010	-72.14161320	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q41144
2049	Barinas	239	VE	05	E	state	8.62314980	-70.23710450	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q43271
2050	Anzoátegui	239	VE	02	B	state	8.59130730	-63.95861110	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q190922
2051	Delta Amacuro	239	VE	09	Y	state	8.84993070	-61.14031960	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q201137
2052	Nueva Esparta	239	VE	17	O	state	10.99707230	-63.91132960	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q204876
2053	Mérida	239	VE	14	L	state	20.96737020	-89.59258570	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q165582
2054	Monagas	239	VE	16	N	state	9.32416520	-63.01475780	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q205776
2055	La Guaira	239	VE	26	X	state	29.30522680	-94.79138540	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q205843
2056	Sucre	239	VE	19	R	state	-19.03534500	-65.25921280	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q205824
2057	Carinthia	15	AT	02	2	\N	46.72220300	14.18058820	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q37985
2058	Upper Austria	15	AT	04	4	\N	48.02585400	13.97236650	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q41967
2059	Styria	15	AT	06	6	\N	47.35934420	14.46998270	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q41358
2060	Vienna	15	AT	09	9	\N	48.20817430	16.37381890	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q1741
2061	Salzburg	15	AT	05	5	\N	47.80949000	13.05501000	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q43325
2062	Burgenland	15	AT	01	1	\N	47.15371650	16.26887970	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q43210
2063	Vorarlberg	15	AT	08	8	\N	47.24974270	9.97973730	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q38981
2064	Tyrol	15	AT	07	7	\N	47.25374140	11.60148700	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q42880
2065	Lower Austria	15	AT	03	3	\N	48.10807700	15.80495580	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q42497
2066	Mid-Western Region	154	NP	MR	2	\N	38.41118410	-90.38320980	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q28464
2067	Western Region	154	NP	WR	3	\N	\N	\N	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q28462
2068	Far-Western Development Region	154	NP	FR	5	\N	29.29878710	80.98710740	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q28235
2069	Eastern Development Region	154	NP	ER	4	\N	27.33090720	87.06242610	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q28576
2070	Mechi Zone	154	NP	10	ME	\N	26.87600070	87.93348030	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q9180
2071	Bheri Zone	154	NP	02	BH	\N	28.51745600	81.77870210	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q9060
2072	Kosi Zone	154	NP	07	KO	\N	27.05365240	87.30161320	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q9170
2073	Central Region	154	NP	CR	1	\N	\N	\N	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q28579
2074	Lumbini Zone	154	NP	08	LU	\N	27.45000000	83.25000000	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q9172
2075	Narayani Zone	154	NP	11	NA	\N	27.36117660	84.85679320	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q9183
2076	Janakpur Zone	154	NP	05	JA	\N	27.21108990	86.01215730	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q9152
2077	Rapti Zone	154	NP	12	RA	\N	28.27434700	82.38857830	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q9185
2078	Seti Zone	154	NP	14	SE	\N	29.69054270	81.33994140	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q9196
2079	Karnali Zone	154	NP	06	KA	\N	29.38625550	82.38857830	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q9164
2080	Dhaulagiri Zone	154	NP	03	DH	\N	28.61117600	83.50702030	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q9088
2081	Gandaki Zone	154	NP	04	GA	\N	28.37320370	84.43827210	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q9133
2082	Bagmati Zone	154	NP	01	BA	\N	28.03675770	85.43755740	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q9046
2083	Mahakali Zone	154	NP	09	MA	\N	29.36010790	80.54384500	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q9178
2084	Sagarmatha Zone	154	NP	13	SA	\N	27.32382630	86.74163740	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q9195
2085	Unity	206	SS	40	UY	\N	37.78712760	-122.40340790	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q319965
2086	Upper Nile	206	SS	35	NU	\N	9.88942020	32.71813750	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q487702
2087	Warrap	206	SS	59	WR	\N	8.08862380	28.64106410	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q491138
2088	Northern Bahr el Ghazal	206	SS	54	BN	\N	8.53604490	26.79678490	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q491111
2089	Western Equatoria	206	SS	45	EW	\N	5.34717990	28.29943500	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q319979
2090	Lakes	206	SS	11550544	LK	\N	37.16282550	-95.69116230	2019-10-05 23:18:45	2022-08-31 15:52:51	1	Q491096
2091	Western Bahr el Ghazal	206	SS	46	BW	\N	8.64523990	25.28375850	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q332095
2092	Central Equatoria	206	SS	44	EC	\N	4.61440630	31.26263660	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q487709
2093	Eastern Equatoria	206	SS	57	EE	\N	5.06929950	33.43835300	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q488519
2094	Jonglei State	206	SS	51	JG	\N	7.18196190	32.35609520	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q488904
2095	Karditsa Regional Unit	85	GR	23	41	\N	39.36402580	21.92140490	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q212810
2096	West Greece Region	85	GR	ESYE23	G	\N	38.51154960	21.57067860	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q170291
2097	Thessaloniki Regional Unit	85	GR	13	54	\N	40.64006290	22.94441910	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q210176
2098	Arcadia Prefecture	85	GR	41	12	\N	37.55578250	22.33377690	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q170054
2099	Imathia Regional Unit	85	GR	12	53	\N	40.60600670	22.14302150	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q207840
2100	Kastoria Regional Unit	85	GR	09	56	\N	40.51926910	21.26871710	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q1080115
2101	Euboea	85	GR	34	04	\N	38.52360360	23.85847370	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q670126
2102	Grevena Prefecture	85	GR	10	51	\N	40.08376260	21.42732990	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q209385
2103	Preveza Prefecture	85	GR	19	34	\N	38.95926490	20.75171550	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q7780449
2104	Lefkada Regional Unit	85	GR	26	24	\N	38.83336630	20.70691080	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q1248071
2105	Argolis Regional Unit	85	GR	36	11	\N	\N	\N	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q191897
2106	Laconia	85	GR	42	16	\N	43.52785460	-71.47035090	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q190216
2107	Pella Regional Unit	85	GR	07	59	\N	40.91480390	22.14302150	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q649484
2108	West Macedonia Region	85	GR	ESYE13	C	\N	40.30040580	21.79035590	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q165408
2109	Crete Region	85	GR	ESYE43	M	\N	35.24011700	24.80926910	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q1267522
2110	Epirus Region	85	GR	ESYE21	D	\N	39.57064130	20.76428430	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q180484
2111	Kilkis Regional Unit	85	GR	06	57	\N	40.99370710	22.87536740	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q210097
2112	Kozani Prefecture	85	GR	11	58	\N	40.30055860	21.78877370	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q211732
2113	Ioannina Regional Unit	85	GR	17	33	\N	39.66502880	20.85374660	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q212921
2114	Phthiotis Prefecture	85	GR	29	06	\N	38.99978500	22.33377690	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q207554
2115	Chania Regional Unit	85	GR	43	94	\N	35.51382980	24.01803670	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q210487
2116	Achaea Regional Unit	85	GR	38	13	\N	38.11587290	21.95224910	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q2495811
2117	East Macedonia and Thrace	85	GR	ESYE11	A	\N	41.12951260	24.88771910	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q171314
2118	South Aegean	85	GR	ESYE42	L	\N	37.08553020	25.14892150	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q173616
2119	Peloponnese Region	85	GR	ESYE25	J	\N	37.50794720	22.37349000	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q202484
2120	East Attica Regional Unit	85	GR	ESYE11	A2	\N	38.20540930	23.85847370	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q211934
2121	Serres Prefecture	85	GR	05	62	\N	41.08638540	23.54838190	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q211319
2122	Attica Region	85	GR	ESYE31	I	\N	38.04575680	23.85847370	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q758056
2123	Aetolia-Acarnania Regional Unit	85	GR	31	01	\N	38.70843860	21.37989280	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q202624
2124	Corfu Prefecture	85	GR	25	22	\N	39.62498380	19.92234610	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q842235
2125	Central Macedonia	85	GR	ESYE12	B	\N	40.62117300	23.19180210	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q17152
2126	Boeotia Regional Unit	85	GR	33	03	\N	38.36636640	23.09650640	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q8257871
2127	Kefalonia Prefecture	85	GR	27	23	\N	38.17536750	20.56921790	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q838993
2128	Central Greece Region	85	GR	ESYE24	H	\N	38.60439840	22.71521310	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q199580
2129	Corinthia Regional Unit	85	GR	37	15	\N	\N	\N	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q208306
2130	Drama Regional Unit	85	GR	04	52	\N	41.23400230	24.23904980	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q208606
2131	Ionian Islands Region	85	GR	ESYE22	F	\N	37.96948980	21.38023720	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q1147674
2132	Larissa Prefecture	85	GR	21	42	\N	39.63902240	22.41912540	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q578879
2133	Kayin State	151	MM	05	13	\N	16.94593460	97.95928630	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q495342
2134	Mandalay Region	151	MM	08	04	\N	21.56190580	95.89871390	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q119494
2135	Yangon Region	151	MM	17	06	\N	16.91434880	96.15269850	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q856781
2136	Magway Region	151	MM	15	03	\N	19.88713860	94.72775280	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q833013
2137	Chin State	151	MM	02	14	\N	22.00869780	93.58126920	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q46910
2138	Rakhine State	151	MM	01	16	\N	20.10408180	93.58126920	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q233838
2139	Shan State	151	MM	11	17	\N	22.03619850	98.13385580	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q456847
2140	Tanintharyi Region	151	MM	12	05	\N	12.47068760	99.01289260	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q843954
2141	Bago	151	MM	16	02	\N	17.32207110	96.46632860	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q800124
2142	Ayeyarwady Region	151	MM	03	07	\N	17.03421250	95.22666750	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q47047
2143	Kachin State	151	MM	04	11	\N	25.85090400	97.43813550	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q140646
2144	Kayah State	151	MM	06	12	\N	19.23420610	97.26528580	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q652845
2145	Sagaing Region	151	MM	10	01	\N	24.42838100	95.39395510	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q847289
2146	Naypyidaw Union Territory	151	MM	10	18	\N	19.93862450	96.15269850	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q4796
2147	Mon State	151	MM	13	15	\N	16.30031330	97.69822720	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q818742
2148	Bartın	225	TR	87	74	province	41.58105090	32.46097940	2019-10-05 23:18:46	2021-10-30 20:47:57	1	Q83342
2149	Kütahya	225	TR	43	43	province	39.35813700	29.60354950	2019-10-05 23:18:46	2021-10-30 20:45:54	1	Q126874
2150	Sakarya	225	TR	54	54	province	40.78885500	30.40595400	2019-10-05 23:18:46	2021-10-30 20:46:30	1	Q83069
2151	Edirne	225	TR	22	22	province	41.15172220	26.51379640	2019-10-05 23:18:46	2021-10-30 20:44:30	1	Q83102
2152	Van	225	TR	65	65	province	38.36794170	43.71827870	2019-10-05 23:18:46	2021-10-30 20:47:26	1	Q80550
2153	Bingöl	225	TR	12	12	province	39.06263540	40.76960950	2019-10-05 23:18:46	2021-10-30 20:43:51	1	Q79760
2154	Kilis	225	TR	90	79	province	36.82047750	37.16873390	2019-10-05 23:18:46	2021-10-30 20:47:23	1	Q128978
2155	Adıyaman	225	TR	02	02	province	37.90782910	38.48499230	2019-10-05 23:18:46	2021-10-30 20:43:15	1	Q43924
2156	Mersin	225	TR	32	33	province	36.81208580	34.64147500	2019-10-05 23:18:46	2021-10-30 20:45:13	1	Q132637
2157	Denizli	225	TR	20	20	province	37.61283950	29.23207840	2019-10-05 23:18:46	2021-10-30 20:44:21	1	Q82096
2158	Malatya	225	TR	44	44	province	38.40150570	37.95362980	2019-10-05 23:18:46	2021-10-30 20:45:58	1	Q131384
2159	Elazığ	225	TR	23	23	province	38.49648040	39.21990290	2019-10-05 23:18:46	2021-10-30 20:44:31	1	Q483091
2160	Erzincan	225	TR	24	24	province	39.76819140	39.05013060	2019-10-05 23:18:46	2021-10-30 20:44:37	1	Q483173
2161	Amasya	225	TR	05	05	province	40.65166080	35.90379660	2019-10-05 23:18:46	2021-10-30 20:43:28	1	Q80036
2162	Muş	225	TR	49	49	province	38.94618880	41.75389310	2019-10-05 23:18:46	2021-10-30 20:46:15	1	Q131387
2163	Bursa	225	TR	16	16	province	40.06554590	29.23207840	2019-10-05 23:18:46	2021-10-30 20:44:05	1	Q43690
2164	Eskişehir	225	TR	26	26	province	39.63296570	31.26263660	2019-10-05 23:18:46	2021-10-30 20:44:46	1	Q483053
2165	Erzurum	225	TR	25	25	province	40.07467990	41.66945620	2019-10-05 23:18:46	2021-10-30 20:44:42	1	Q376797
2166	Iğdır	225	TR	88	76	province	39.88798410	44.00483650	2019-10-05 23:18:46	2021-10-30 20:48:13	1	Q125506
2167	Tekirdağ	225	TR	59	59	province	41.11212270	27.26761160	2019-10-05 23:18:46	2021-10-30 20:46:45	1	Q129387
2168	Çankırı	225	TR	82	18	province	40.53690730	33.58838930	2019-10-05 23:18:46	2021-10-30 20:44:14	1	Q272662
2169	Antalya	225	TR	07	07	province	37.09516720	31.07937050	2019-10-05 23:18:46	2021-10-30 20:43:35	1	Q40249
2170	İstanbul	225	TR	34	34	province	41.16343020	28.76644080	2019-10-05 23:18:46	2022-11-13 16:55:32	1	Q534799
2171	Konya	225	TR	71	42	province	37.98381340	32.71813750	2019-10-05 23:18:46	2021-10-30 20:45:49	1	Q81551
2172	Bolu	225	TR	14	14	province	40.57597660	31.57880860	2019-10-05 23:18:46	2021-10-30 20:44:02	1	Q82089
2173	Çorum	225	TR	19	19	province	40.49982110	34.59862630	2019-10-05 23:18:46	2021-10-30 20:44:17	1	Q272947
2174	Ordu	225	TR	52	52	province	40.79905800	37.38990050	2019-10-05 23:18:46	2021-10-30 20:46:25	1	Q483180
2175	Balıkesir	225	TR	10	10	province	39.76167820	28.11226790	2019-10-05 23:18:46	2021-10-30 20:43:44	1	Q47117
2176	Kırklareli	225	TR	39	39	province	41.72597950	27.48383900	2019-10-05 23:18:46	2021-10-30 20:45:39	1	Q131597
2177	Bayburt	225	TR	77	69	province	40.26032000	40.22804800	2019-10-05 23:18:46	2021-10-30 20:47:42	1	Q483063
2178	Kırıkkale	225	TR	79	71	province	39.88768780	33.75552480	2019-10-05 23:18:46	2021-10-30 20:47:50	1	Q484392
2179	Afyonkarahisar	225	TR	03	03	province	38.73910990	30.71200230	2019-10-05 23:18:46	2021-10-30 20:43:21	1	Q45220
2180	Kırşehir	225	TR	40	40	province	39.22689050	33.97500180	2019-10-05 23:18:46	2021-10-30 20:45:43	1	Q134187
2181	Sivas	225	TR	58	58	province	39.44880390	37.12944970	2019-10-05 23:18:46	2021-10-30 20:46:41	1	Q483100
2182	Muğla	225	TR	48	48	province	37.18358190	28.48639630	2019-10-05 23:18:46	2021-10-30 20:46:13	1	Q123934
2183	Şanlıurfa	225	TR	63	63	province	37.35691020	39.15436770	2019-10-05 23:18:46	2021-10-30 20:47:06	1	Q388469
2184	Karaman	225	TR	78	70	province	37.24363360	33.61757700	2019-10-05 23:18:46	2021-10-30 20:47:45	1	Q482975
2185	Ardahan	225	TR	86	75	province	41.11129640	42.78316740	2019-10-05 23:18:46	2021-10-30 20:48:04	1	Q79840
2186	Giresun	225	TR	28	28	province	40.64616720	38.59355110	2019-10-05 23:18:46	2021-10-30 20:44:54	1	Q482779
2187	Aydın	225	TR	09	09	province	37.81170330	28.48639630	2019-10-05 23:18:46	2021-10-30 20:43:39	1	Q79846
2188	Yozgat	225	TR	66	66	province	39.72719790	35.10778580	2019-10-05 23:18:46	2021-10-30 20:47:28	1	Q75445
2189	Niğde	225	TR	73	51	province	38.09930860	34.68565090	2019-10-05 23:18:46	2021-10-30 20:46:23	1	Q155219
2190	Hakkâri	225	TR	70	30	province	37.44593190	43.74498410	2019-10-05 23:18:46	2021-10-30 20:45:04	1	Q93209
2191	Artvin	225	TR	08	08	province	41.07866400	41.76282230	2019-10-05 23:18:46	2021-10-30 20:43:37	1	Q43745
2192	Tunceli	225	TR	62	62	province	39.30735540	39.43877780	2019-10-05 23:18:46	2021-10-30 20:46:59	1	Q620742
2193	Ağrı	225	TR	04	04	province	39.62692180	43.02159650	2019-10-05 23:18:46	2021-10-30 20:43:25	1	Q80051
2194	Batman	225	TR	76	72	province	37.83624960	41.36057390	2019-10-05 23:18:46	2021-10-30 20:47:52	1	Q80370
2195	Kocaeli	225	TR	41	41	province	40.85327040	29.88152030	2019-10-05 23:18:46	2021-10-30 20:45:48	1	Q83965
2196	Nevşehir	225	TR	50	50	province	38.69393990	34.68565090	2019-10-05 23:18:46	2021-10-30 20:46:19	1	Q430693
2197	Kastamonu	225	TR	37	37	province	41.41038630	33.69983340	2019-10-05 23:18:46	2021-10-30 20:45:30	1	Q483191
2198	Manisa	225	TR	45	45	province	38.84193730	28.11226790	2019-10-05 23:18:46	2021-10-30 20:46:02	1	Q130553
2199	Tokat	225	TR	60	60	province	40.39027130	36.62518630	2019-10-05 23:18:46	2021-10-30 20:46:49	1	Q483195
2200	Kayseri	225	TR	38	38	province	38.62568540	35.74068820	2019-10-05 23:18:46	2021-10-30 20:45:34	1	Q483472
2201	Uşak	225	TR	64	64	province	38.54313190	29.23207840	2019-10-05 23:18:46	2021-10-30 20:47:08	1	Q483078
2202	Düzce	225	TR	93	81	province	40.87705310	31.31927130	2019-10-05 23:18:46	2021-10-30 20:47:13	1	Q432391
2203	Gaziantep	225	TR	83	27	province	37.07638820	37.38272340	2019-10-05 23:18:46	2021-10-30 20:44:50	1	Q483154
2204	Gümüşhane	225	TR	69	29	province	40.28036730	39.31432530	2019-10-05 23:18:46	2021-10-30 20:44:59	1	Q482788
2205	İzmir	225	TR	35	35	province	38.35916930	27.26761160	2019-10-05 23:18:46	2021-10-30 20:45:22	1	Q344490
2206	Trabzon	225	TR	61	61	province	40.79924100	39.58479440	2019-10-05 23:18:46	2021-10-30 20:46:54	1	Q388995
2207	Siirt	225	TR	74	56	province	37.86588620	42.14945230	2019-10-05 23:18:46	2021-10-30 20:46:36	1	Q482825
2208	Kars	225	TR	84	36	province	40.28076360	42.99195270	2019-10-05 23:18:46	2021-10-30 20:45:25	1	Q83077
2209	Burdur	225	TR	15	15	province	37.46126690	30.06652360	2019-10-05 23:18:46	2021-10-30 20:44:03	1	Q80088
2210	Aksaray	225	TR	75	68	province	38.33520430	33.97500180	2019-10-05 23:18:46	2021-10-30 20:47:37	1	Q83073
2211	Hatay	225	TR	31	31	province	36.40184880	36.34980970	2019-10-05 23:18:46	2021-10-30 20:45:06	1	Q83274
2212	Adana	225	TR	81	01	province	37.26123150	35.39050460	2019-10-05 23:18:46	2021-10-30 20:43:11	1	Q40549
2213	Zonguldak	225	TR	85	67	province	41.31249170	31.85982510	2019-10-05 23:18:46	2021-10-30 20:47:32	1	Q219956
2214	Osmaniye	225	TR	91	80	province	37.21302580	36.17626150	2019-10-05 23:18:46	2021-10-30 20:47:20	1	Q281206
2215	Bitlis	225	TR	13	13	province	38.65231330	42.42020280	2019-10-05 23:18:46	2021-10-30 20:43:58	1	Q83239
2216	Çanakkale	225	TR	17	17	province	40.05101040	26.98524220	2019-10-05 23:18:46	2021-10-30 20:44:10	1	Q47813
2217	Ankara	225	TR	68	06	province	39.78052450	32.71813750	2019-10-05 23:18:46	2021-10-30 20:43:30	1	Q2297724
2218	Yalova	225	TR	92	77	province	40.57759860	29.20883030	2019-10-05 23:18:46	2021-10-30 20:48:11	1	Q483083
2219	Rize	225	TR	53	53	province	40.95814970	40.92269850	2019-10-05 23:18:46	2021-10-30 20:46:27	1	Q483481
2220	Samsun	225	TR	55	55	province	41.18648590	36.13226780	2019-10-05 23:18:46	2021-10-30 20:46:33	1	Q483040
2221	Bilecik	225	TR	11	11	province	40.05665550	30.06652360	2019-10-05 23:18:46	2021-10-30 20:43:49	1	Q46763
2222	Isparta	225	TR	33	32	province	38.02114640	31.07937050	2019-10-05 23:18:46	2021-10-30 20:45:10	1	Q268043
2223	Karabük	225	TR	89	78	province	41.18748900	32.74174190	2019-10-05 23:18:46	2021-10-30 20:48:09	1	Q483168
2224	Mardin	225	TR	72	47	province	37.34429290	40.61964870	2019-10-05 23:18:46	2021-10-30 20:46:10	1	Q131293
2225	Şırnak	225	TR	80	73	province	37.41874810	42.49183380	2019-10-05 23:18:46	2021-10-30 20:47:54	1	Q647378
2226	Diyarbakır	225	TR	21	21	province	38.10663720	40.54268960	2019-10-05 23:18:46	2021-10-30 20:44:26	1	Q83081
2227	Kahramanmaraş	225	TR	46	46	province	37.75030360	36.95410700	2019-10-05 23:18:46	2021-10-30 20:46:08	1	Q482834
2228	Lisbon	177	PT	14	11	\N	38.72232630	-9.13927140	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q207199
2229	Bragança	177	PT	05	04	\N	41.80616520	-6.75674270	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q373528
2230	Beja	177	PT	03	02	\N	37.96877860	-7.87216000	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q321455
2231	Madeira	177	PT	10	30	\N	32.76070740	-16.95947230	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q26253
2232	Portalegre	177	PT	16	12	\N	39.29670860	-7.42847550	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q225189
2233	Açores	177	PT	23	20	\N	37.74124880	-25.67559440	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q25263
2234	Vila Real	177	PT	21	17	\N	41.30035270	-7.74572740	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q379372
2235	Aveiro	177	PT	02	01	\N	40.72090230	-8.57210160	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q210527
2236	Évora	177	PT	08	07	\N	38.57444680	-7.90765530	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q274118
2237	Viseu	177	PT	22	18	\N	40.65884240	-7.91475600	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q273525
2238	Santarém	177	PT	18	14	\N	39.23666870	-8.68599440	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q244510
2239	Faro	177	PT	09	08	\N	37.01935480	-7.93043970	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q244521
2240	Leiria	177	PT	13	10	\N	39.77095320	-8.79218360	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q244512
2241	Castelo Branco	177	PT	06	05	\N	39.86313230	-7.48141630	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q273529
2242	Setúbal	177	PT	19	15	\N	38.52409330	-8.89258760	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q274109
2243	Porto	177	PT	17	13	\N	41.14766290	-8.60789730	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q322792
2244	Braga	177	PT	04	03	\N	41.55038800	-8.42613010	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q326203
2245	Viana do Castelo	177	PT	20	16	\N	41.69180460	-8.83445100	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q326214
2246	Coimbra	177	PT	07	06	\N	40.20579940	-8.41369000	2019-10-05 23:18:46	2022-08-31 15:52:51	1	Q244517
2247	Zhejiang	45	CN	02	ZJ	province	29.14164320	119.78892480	2019-10-05 23:18:46	2021-11-27 16:19:08	1	Q16967
2248	Fujian	45	CN	07	FJ	province	26.48368420	117.92490020	2019-10-05 23:18:46	2021-11-27 16:19:08	1	Q41705
2249	Shanghai	45	CN	23	SH	municipality	31.23041600	121.47370100	2019-10-05 23:18:46	2021-11-27 16:19:08	1	Q8686
2250	Jiangsu	45	CN	04	JS	province	33.14017150	119.78892480	2019-10-05 23:18:46	2021-11-27 16:19:08	1	Q16963
2251	Anhui	45	CN	01	AH	province	30.60067730	117.92490020	2019-10-05 23:18:46	2021-11-27 16:19:08	1	Q40956
2252	Shandong	45	CN	25	SD	province	37.80060640	-122.26999180	2019-10-05 23:18:46	2021-11-27 16:19:08	1	Q43407
2253	Jilin	45	CN	05	JL	province	43.83788300	126.54957200	2019-10-05 23:18:46	2021-11-27 16:19:08	1	Q45208
2254	Shanxi	45	CN	24	SX	province	37.24256490	111.85685860	2019-10-05 23:18:46	2021-11-27 16:19:08	1	Q46913
2255	Taiwan	45	CN	04	TW	province	23.69781000	120.96051500	2019-10-05 23:18:46	2021-11-27 16:19:08	1	Q57251
2256	Jiangxi	45	CN	03	JX	province	27.08745640	114.90422080	2019-10-05 23:18:46	2021-11-27 16:19:08	1	Q57052
2257	Beijing	45	CN	22	BJ	municipality	39.90419990	116.40739630	2019-10-05 23:18:46	2021-11-27 16:19:08	1	Q956
2258	Hunan	45	CN	11	HN	province	27.36830090	109.28193470	2019-10-05 23:18:46	2022-08-31 16:30:15	1	Q45761
2259	Henan	45	CN	09	HA	province	34.29043020	113.38235450	2019-10-05 23:18:46	2021-11-27 16:19:08	1	Q43684
2260	Yunnan	45	CN	29	YN	province	24.47528470	101.34310580	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q43194
2261	Guizhou	45	CN	18	GZ	province	26.84296450	107.29028390	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q47097
2262	Ningxia Huizu	45	CN	21	NX	autonomous region	37.19873100	106.15809370	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q57448
2263	Xinjiang	45	CN	13	XJ	autonomous region	42.52463570	87.53958550	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q34800
2264	Xizang	45	CN	14	XZ	autonomous region	30.15336050	88.78786780	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q17269
2265	Heilongjiang	45	CN	08	HL	province	47.12164720	128.73823100	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q19206
2266	Macau SAR	45	CN	MC	MO	special administrative region	22.19874500	113.54387300	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q14773
2267	Hong Kong SAR	45	CN	HK	HK	special administrative region	22.31930390	114.16936110	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q8646
2268	Liaoning	45	CN	19	LN	province	41.94365430	122.52903760	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q43934
2269	Inner Mongolia	45	CN	20	NM	autonomous region	43.37822000	115.05948150	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q41079
2270	Qinghai	45	CN	06	QH	province	35.74479800	96.40773580	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q45833
2271	Chongqing	45	CN	33	CQ	municipality	29.43158610	106.91225100	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q11725
2272	Shaanxi	45	CN	26	SN	province	35.39399080	109.18800470	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q47974
2273	Hainan	45	CN	31	HI	province	19.56639470	109.94968600	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q42200
2274	Hubei	45	CN	12	HB	province	30.73781180	112.23840170	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q46862
2275	Gansu	45	CN	15	GS	province	35.75183260	104.28611160	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q42392
2276	Tianjin	45	CN	28	TJ	municipality	39.12522910	117.01534350	2021-11-27 16:19:08	2021-11-27 16:19:08	1	Q11736
2277	Sichuan	45	CN	32	SC	province	30.26380320	102.80547530	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q19770
2278	Guangxi Zhuang	45	CN	16	GX	autonomous region	23.72475990	108.80761950	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q15176
2279	Guangdong	45	CN	30	GD	province	23.37903330	113.76328280	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q15175
2280	Hebei	45	CN	10	HE	province	37.89565940	114.90422080	2019-10-05 23:18:47	2021-11-27 16:19:08	1	Q21208
2281	South	121	LB	06	JA	\N	33.27214790	35.20327780	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q223643
2282	Mount Lebanon	121	LB	05	JL	\N	33.81008580	35.59731390	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q216945
2283	Baalbek-Hermel	121	LB	11	BH	\N	34.26585560	36.34980970	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q787753
2284	North	121	LB	09	AS	\N	34.43806250	35.83082330	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q390267
2285	Akkar	121	LB	10	AK	\N	34.53287630	36.13281320	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q556146
2286	Beirut	121	LB	04	BA	\N	33.88861060	35.49547720	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q651688
2287	Beqaa	121	LB	08	BI	\N	33.84626620	35.90194890	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q319632
2288	Nabatieh	121	LB	07	NA	\N	33.37716930	35.48382930	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q458417
2289	Isle of Wight	232	GB	G2	IOW	\N	50.69384790	-1.30473400	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q9679
2290	St Helens	232	GB	N1	SHN	\N	45.85896100	-122.82123560	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q179206
2291	London Borough of Brent	232	GB	B5	BEN	\N	51.56728080	-0.27105680	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q207201
2292	Walsall	232	GB	O8	WLL	\N	52.58621400	-1.98291900	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q178356
2293	Trafford	232	GB	O6	TRF	\N	40.38562460	-79.75893470	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q915954
2294	City of Southampton	232	GB	O6	STH	\N	50.90970040	-1.40435090	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21683230
2295	Sheffield	232	GB	O6	SHF	\N	36.09507430	-80.27884660	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q12956644
2296	West Sussex	232	GB	P6	WSX	\N	50.92801430	-0.46170750	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q23287
2297	City of Peterborough	232	GB	P6	PTE	\N	44.30936360	-78.32015300	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q12956645
2298	Caerphilly County Borough	232	GB	X4	CAY	\N	51.66044650	-3.21787240	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q748065
2299	Vale of Glamorgan	232	GB	Z3	VGL	\N	51.40959580	-3.48481670	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q844784
2300	Shetland Islands	232	GB	W3	ZET	\N	60.52965070	-1.26594090	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q47134
2301	Rhondda Cynon Taf	232	GB	Y9	RCT	\N	51.64902070	-3.42886920	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q817960
2302	Poole	232	GB	Y9	POL	\N	50.71505000	-1.98724800	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21683234
2303	Central Bedfordshire	232	GB	Y9	CBF	\N	52.00297440	-0.46513890	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1053723
2304	Down District Council	232	GB	R9	DOW	\N	54.24342870	-5.95779590	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1198492
2305	City of Portsmouth	232	GB	R9	POR	\N	36.83291500	-76.29755490	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21683233
2306	London Borough of Haringey	232	GB	F3	HRY	\N	51.59061130	-0.11097090	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q213560
2307	London Borough of Bexley	232	GB	A6	BEX	\N	51.45190210	0.11717860	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q207208
2308	Rotherham	232	GB	L3	ROT	\N	53.43260350	-1.36350090	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1878732
2309	Hartlepool	232	GB	F5	HPL	\N	54.69174500	-1.21292600	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q2594690
2310	Telford and Wrekin	232	GB	O2	TFW	\N	52.74099160	-2.48685860	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1425298
2311	Belfast district	232	GB	R3	BFS	\N	54.61703660	-5.95318610	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1140130
2312	Cornwall	232	GB	C6	CON	\N	50.26604710	-5.05271250	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q22338583
2313	London Borough of Sutton	232	GB	N8	STN	\N	51.35737620	-0.17527960	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q320378
2314	Omagh District Council	232	GB	T3	OMH	\N	54.45135240	-7.71250180	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q505691
2315	Banbridge	232	GB	R2	BNB	\N	54.34872900	-6.27048030	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q806141
2316	Causeway Coast and Glens	232	GB	R2	CCG	\N	55.04318300	-6.67412880	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q5054638
2317	Newtownabbey Borough Council	232	GB	T1	NTA	\N	54.67924220	-5.95911020	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1198475
2318	City of Leicester	232	GB	T1	LCE	\N	52.63687780	-1.13975920	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21683242
2319	London Borough of Islington	232	GB	G3	ISL	\N	51.54650630	-0.10580580	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q205817
2320	Metropolitan Borough of Wigan	232	GB	P7	WGN	\N	53.51348120	-2.61069990	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q684307
2321	Oxfordshire	232	GB	K2	OXF	\N	51.76120560	-1.24646740	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q23169
2322	Magherafelt District Council	232	GB	S7	MFT	\N	54.75532790	-6.60774870	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1198482
2323	Southend-on-Sea	232	GB	M5	SOS	\N	51.54592690	0.70771230	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q203995
2324	Armagh, Banbridge and Craigavon	232	GB	M5	ABC	\N	54.39325920	-6.45634010	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q4792580
2325	Perth and Kinross	232	GB	W1	PKN	\N	56.39538170	-3.42835470	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q207679
2326	London Borough of Waltham Forest	232	GB	O9	WFT	\N	51.58863830	-0.01176250	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q40608
2327	Rochdale	232	GB	L2	RCH	\N	53.60971360	-2.15610000	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1892596
2328	Merthyr Tydfil County Borough	232	GB	Y3	MTY	\N	51.74674740	-3.38132750	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q3306663
2329	Blackburn with Darwen	232	GB	A8	BBD	\N	53.69575220	-2.46829850	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q880782
2330	Knowsley	232	GB	G9	KWL	\N	53.45459400	-2.85290700	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1228523
2331	Armagh City and District Council	232	GB	Q8	ARM	\N	54.39325920	-6.45634010	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q676704
2332	Middlesbrough	232	GB	I5	MDB	\N	54.57422700	-1.23495600	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q171866
2333	East Renfrewshire	232	GB	U7	ERW	\N	55.77047350	-4.33598210	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q211925
2334	Cumbria	232	GB	C9	CMA	\N	54.57723230	-2.79748350	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q23066
2335	Scotland	232	GB	SCT	SCT	\N	56.49067120	-4.20264580	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q22
2336	England	232	GB	ENG	ENG	\N	52.35551770	-1.17431970	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21
2337	Northern Ireland	232	GB	NIR	NIR	\N	54.78771490	-6.49231450	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q26
2338	Wales	232	GB	WLS	WLS	\N	52.13066070	-3.78371170	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q25
2339	Bath and North East Somerset	232	GB	A4	BAS	\N	51.32501020	-2.47662410	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q810793
2340	Liverpool	232	GB	A4	LIV	\N	32.65649810	-115.47632410	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21665571
2341	Sandwell	232	GB	L7	SAW	\N	52.53616740	-2.01079300	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q285964
2342	Bournemouth	232	GB	L7	BMH	\N	50.71916400	-1.88076900	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q20989094
2343	Isles of Scilly	232	GB	L7	IOS	\N	49.92772610	-6.32749660	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q180209
2344	Falkirk	232	GB	U9	FAL	\N	56.00187750	-3.78391310	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q216802
2345	Dorset	232	GB	U9	DOR	\N	50.74876350	-2.34447860	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21694711
2346	Scottish Borders	232	GB	T9	SCB	\N	55.54856970	-2.78613880	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q211113
2347	London Borough of Havering	232	GB	F6	HAV	\N	51.57792400	0.21208290	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q215038
2348	Moyle District Council	232	GB	S8	MYL	\N	55.20473270	-6.25317400	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1198496
2349	London Borough of Camden	232	GB	C4	CMD	\N	51.54547360	-0.16279020	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q202088
2350	Newry and Mourne District Council	232	GB	S9	NYM	\N	54.17425050	-6.33919920	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q606825
2351	Neath Port Talbot County Borough	232	GB	Y5	NTL	\N	51.59785190	-3.78396680	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q748078
2352	Conwy County Borough	232	GB	X8	CWY	\N	53.29350130	-3.72651610	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q817971
2353	Outer Hebrides	232	GB	W8	ELS	\N	57.75989180	-7.01940340	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q80967
2354	West Lothian	232	GB	W9	WLN	\N	55.90701980	-3.55171670	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q204940
2355	Lincolnshire	232	GB	W9	LIN	\N	52.94518890	-0.16012460	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21269047
2356	London Borough of Barking and Dagenham	232	GB	A1	BDG	\N	51.55406660	0.13401700	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q205358
2357	City of Westminster	232	GB	P5	WSM	\N	39.57659770	-76.99721260	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q179351
2358	London Borough of Lewisham	232	GB	H6	LEW	\N	51.44145790	-0.01170060	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q215030
2359	City of Nottingham	232	GB	H6	NGM	\N	52.95478320	-1.15810860	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21885994
2360	Moray	232	GB	V6	MRY	\N	57.64984760	-3.31680390	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q211106
2361	Ballymoney	232	GB	R1	BLY	\N	55.07048880	-6.51737080	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q805427
2362	South Lanarkshire	232	GB	W5	SLK	\N	55.67359090	-3.78196610	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q209142
2363	Ballymena Borough	232	GB	Q9	BLA	\N	54.86426000	-6.27910740	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q805424
2364	Doncaster	232	GB	D5	DNC	\N	53.52282000	-1.12846200	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1925846
2365	Northumberland	232	GB	J6	NBL	\N	55.20825420	-2.07841380	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q23079
2366	Fermanagh and Omagh	232	GB	J6	FMO	\N	54.45135240	-7.71250180	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q5444365
2367	Tameside	232	GB	O1	TAM	\N	53.48058280	-2.08098910	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1423078
2368	Royal Borough of Kensington and Chelsea	232	GB	G4	KEC	\N	51.49908050	-0.19382530	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q188801
2369	Hertfordshire	232	GB	F8	HRT	\N	51.80978230	-0.23767440	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q3410
2370	East Riding of Yorkshire	232	GB	F8	ERY	\N	53.84161680	-0.43441060	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21695028
2371	Kirklees	232	GB	G8	KIR	\N	53.59334320	-1.80095090	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q918975
2372	City of Sunderland	232	GB	N6	SND	\N	54.88614890	-1.47857970	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1280897
2373	Gloucestershire	232	GB	N6	GLS	\N	51.86421120	-2.23803350	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21694733
2374	East Ayrshire	232	GB	U4	EAY	\N	55.45184960	-4.26444780	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q209135
2375	United Kingdom	232	GB	UK	UKM	\N	55.37805100	-3.43597300	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q145
2376	London Borough of Hillingdon	232	GB	F9	HIL	\N	51.53518320	-0.44813780	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q205690
2377	South Ayrshire	232	GB	W4	SAY	\N	55.45889880	-4.62919940	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q209131
2378	Ascension Island	232	GB	01	SH-AC	\N	-7.94671660	-14.35591580	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q46197
2379	Gwynedd	232	GB	Y2	GWN	\N	52.92772660	-4.13348360	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q109128
2380	London Borough of Hounslow	232	GB	G1	HNS	\N	51.48283580	-0.38820620	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q214162
2381	Medway	232	GB	I3	MDW	\N	42.14176410	-71.39672560	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q797782
2382	Limavady Borough Council	232	GB	S4	LMV	\N	55.05168200	-6.94919440	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1198505
2383	Highland	232	GB	V3	HLD	\N	36.29675080	-95.83803660	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q208279
2384	North East Lincolnshire	232	GB	J2	NEL	\N	53.56682010	-0.08150660	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1342914
2385	London Borough of Harrow	232	GB	F4	HRW	\N	51.58816270	-0.34228510	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q210476
2386	Somerset	232	GB	F4	SOM	\N	51.10509700	-2.92623070	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21694741
2387	Angus	232	GB	T7	ANS	\N	37.27578860	-95.65010330	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q202177
2388	Inverclyde	232	GB	V4	IVC	\N	55.93165690	-4.68001580	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q208271
2389	Darlington	232	GB	D1	DAL	\N	34.29987620	-79.87617410	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1171024
2390	London Borough of Tower Hamlets	232	GB	O5	TWH	\N	51.52026070	-0.02933960	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q208152
2391	Wiltshire	232	GB	P8	WIL	\N	51.34919960	-1.99271050	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21694746
2392	Argyll and Bute	232	GB	T8	AGB	\N	56.40062140	-5.48074800	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q202174
2393	Strabane District Council	232	GB	T4	STB	\N	54.82738650	-7.46331030	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1198500
2394	Stockport	232	GB	N2	SKP	\N	53.41063160	-2.15753320	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1752424
2395	Brighton and Hove	232	GB	B6	BNH	\N	50.82262880	-0.13704700	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1022488
2396	London Borough of Lambeth	232	GB	H1	LBH	\N	51.45714770	-0.12306810	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q202059
2397	London Borough of Redbridge	232	GB	K8	RDB	\N	51.58861210	0.08239820	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q208955
2398	Manchester	232	GB	K8	MAN	\N	53.48075930	-2.24263050	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21525592
2399	Mid Ulster	232	GB	K8	MUL	\N	54.64113010	-6.75225490	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q6840825
2400	South Gloucestershire	232	GB	M6	SGC	\N	51.52643610	-2.47284870	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1369280
2401	Aberdeenshire	232	GB	T6	ABD	\N	57.28687230	-2.38156840	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q189912
2402	Monmouthshire	232	GB	Y4	MON	\N	51.81161000	-2.71634170	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q207176
2403	Derbyshire	232	GB	Y4	DBY	\N	53.10467820	-1.56238850	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q11775003
2404	Glasgow	232	GB	V2	GLG	\N	55.86423700	-4.25180600	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q4093
2405	Buckinghamshire	232	GB	V2	BKM	\N	51.80722040	-0.81276640	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21694636
2406	County Durham	232	GB	D8	DUR	\N	54.72940990	-1.88115980	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1137286
2407	Shropshire	232	GB	D8	SHR	\N	52.70636570	-2.74178490	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21694759
2408	Wirral	232	GB	Q1	WRL	\N	53.37271810	-3.07375400	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q11365639
2409	South Tyneside	232	GB	M7	STY	\N	54.96366930	-1.44186340	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1541228
2410	Essex	232	GB	M7	ESS	\N	51.57424470	0.48567810	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21272241
2411	London Borough of Hackney	232	GB	E8	HCK	\N	51.57344500	-0.07243760	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q205679
2412	Antrim and Newtownabbey	232	GB	E8	ANN	\N	54.69568870	-5.94810690	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q4777347
2413	City of Bristol	232	GB	E8	BST	\N	41.67352200	-72.94653750	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21693433
2414	East Sussex	232	GB	E8	ESX	\N	50.90859550	0.24941660	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21694646
2415	Dumfries and Galloway	232	GB	U2	DGY	\N	55.07010730	-3.60525810	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q126514
2416	Milton Keynes	232	GB	I6	MIK	\N	52.08520380	-0.73331330	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q894090
2417	Derry City Council	232	GB	S6	DRY	\N	54.96907780	-7.19583510	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1200370
2418	London Borough of Newham	232	GB	I8	NWM	\N	51.52551620	0.03521630	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q208139
2419	Wokingham	232	GB	Q2	WOK	\N	51.41045700	-0.83386100	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1758432
2420	Warrington	232	GB	Q2	WRT	\N	40.24927410	-75.13406040	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q894095
2421	Stockton-on-Tees	232	GB	N3	STT	\N	54.57045510	-1.32898210	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q894094
2422	Swindon	232	GB	N9	SWD	\N	51.55577390	-1.77971760	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q894093
2423	Cambridgeshire	232	GB	N9	CAM	\N	52.20529730	0.12181950	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21272276
2424	City of London	232	GB	H9	LND	\N	51.51234430	-0.09098520	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q23311
2425	Birmingham	232	GB	H9	BIR	\N	33.51858920	-86.81035670	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q20986424
2426	City of York	232	GB	H9	YOR	\N	53.95996510	-1.08729790	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q20986421
2427	Slough	232	GB	H9	SLG	\N	51.51053840	-0.59504060	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21163036
2428	Edinburgh	232	GB	U8	EDH	\N	55.95325200	-3.18826700	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q23436
2429	Mid and East Antrim	232	GB	U8	MEA	\N	54.93993410	-6.11374230	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q6841059
2430	North Somerset	232	GB	J4	NSM	\N	51.38790280	-2.77810910	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q178196
2431	Gateshead	232	GB	E5	GAT	\N	54.95268000	-1.60341100	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q929034
2432	London Borough of Southwark	232	GB	M8	SWK	\N	51.48805720	-0.07628380	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q730706
2433	City and County of Swansea	232	GB	Z1	SWA	\N	51.62144000	-3.94364600	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q10996863
2434	London Borough of Wandsworth	232	GB	P1	WND	\N	51.45682740	-0.18966380	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q210563
2435	Hampshire	232	GB	P1	HAM	\N	51.05769480	-1.30806290	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21694653
2436	Wrexham County Borough	232	GB	Z4	WRX	\N	53.03013780	-3.02614870	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q843868
2437	Flintshire	232	GB	Y1	FLN	\N	53.16686580	-3.14189080	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q505610
2438	Coventry	232	GB	Y1	COV	\N	52.40682200	-1.51969300	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q20986417
2439	Carrickfergus Borough Council	232	GB	R4	CKF	\N	54.72568430	-5.80937190	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1045012
2440	West Dunbartonshire	232	GB	W7	WDU	\N	55.94509250	-4.56462590	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q208121
2441	Powys	232	GB	Y8	POW	\N	52.64642490	-3.32609040	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q156150
2442	Cheshire West and Chester	232	GB	Y8	CHW	\N	53.23029740	-2.71511170	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1070591
2443	Renfrewshire	232	GB	W2	RFW	\N	55.84665400	-4.53312590	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q211091
2444	Cheshire East	232	GB	W2	CHE	\N	53.16104460	-2.21859320	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1070590
2445	Cookstown District Council	232	GB	R7	CKT	\N	54.64181580	-6.74438950	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1129644
2446	Derry City and Strabane	232	GB	R7	DRS	\N	55.00474430	-7.32092220	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q15213714
2447	Staffordshire	232	GB	R7	STS	\N	52.87927450	-2.05718680	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21694786
2448	London Borough of Hammersmith and Fulham	232	GB	F1	HMF	\N	51.49901560	-0.22915000	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q40478
2449	Craigavon Borough Council	232	GB	R8	CGV	\N	54.39325920	-6.45634010	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q427201
2450	Clackmannanshire	232	GB	U1	CLK	\N	56.10753510	-3.75294090	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q207268
2451	Blackpool	232	GB	A9	BPL	\N	53.81750530	-3.03567480	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q170377
2452	Bridgend County Borough	232	GB	X3	BGE	\N	51.50831990	-3.58120750	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q697126
2453	North Lincolnshire	232	GB	J3	NLN	\N	53.60555920	-0.55965820	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q175945
2454	East Dunbartonshire	232	GB	U5	EDU	\N	55.97431620	-4.20229800	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q211889
2455	Reading	232	GB	U5	RDG	\N	36.14866590	-95.98400120	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21496716
2456	Nottinghamshire	232	GB	U5	NTT	\N	53.10031900	-0.99363060	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21272736
2457	Dudley	232	GB	D7	DUD	\N	42.04336610	-71.92760330	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1617704
2458	Newcastle upon Tyne	232	GB	D7	NET	\N	54.97825200	-1.61778000	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21012735
2459	Bury	232	GB	C1	BUR	\N	53.59334980	-2.29660540	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q512036
2460	Lisburn and Castlereagh	232	GB	C1	LBC	\N	54.49815840	-6.13067910	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q6558667
2461	Coleraine Borough Council	232	GB	R6	CLR	\N	55.14515700	-6.67598140	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q991411
2462	East Lothian	232	GB	U6	ELN	\N	55.94933830	-2.77044640	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q207257
2463	Aberdeen	232	GB	T5	ABE	\N	57.14971700	-2.09427800	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q36405
2464	Kent	232	GB	T5	KEN	\N	41.15366740	-81.35788590	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21694674
2465	Wakefield	232	GB	O7	WKF	\N	42.50393950	-71.07233910	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q763171
2466	Halton	232	GB	E9	HAL	\N	43.53253720	-79.87448360	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q376141
2467	Suffolk	232	GB	N5	SFK	\N	52.18724720	0.97078010	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q23111
2468	Thurrock	232	GB	O3	THR	\N	51.49345570	0.35291970	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1549155
2469	Solihull	232	GB	M2	SOL	\N	52.41181100	-1.77761000	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1925858
2470	Bracknell Forest	232	GB	B3	BRC	\N	51.41538280	-0.75364950	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q896725
2471	West Berkshire	232	GB	P4	WBK	\N	51.43082550	-1.14449270	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1473780
2472	Rutland	232	GB	L4	RUT	\N	43.61062370	-72.97260650	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q23107
2473	Norfolk	232	GB	I9	NFK	\N	36.85076890	-76.28587260	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q23109
2474	Orkney Islands	232	GB	V9	ORK	\N	58.98094010	-2.96052060	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q100166
2475	City of Kingston upon Hull	232	GB	V9	KHL	\N	53.76762360	-0.32741980	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21885987
2476	London Borough of Enfield	232	GB	E3	ENF	\N	51.66229090	-0.11806510	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q210531
2477	Oldham	232	GB	K1	OLD	\N	42.20405980	-71.20481190	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1278608
2478	Torbay	232	GB	O4	TOB	\N	50.43923290	-3.53698990	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1136118
2479	Fife	232	GB	V1	FIF	\N	56.20820780	-3.14951750	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q201149
2480	Northamptonshire	232	GB	J1	NTH	\N	52.27299440	-0.87555150	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q23115
2481	Royal Borough of Kingston upon Thames	232	GB	G7	KTT	\N	51.37811700	-0.29270900	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q32508
2482	Windsor and Maidenhead	232	GB	P9	WNM	\N	51.47997120	-0.62425650	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1368496
2483	London Borough of Merton	232	GB	I4	MRT	\N	51.40977420	-0.21080840	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q32504
2484	Carmarthenshire	232	GB	X7	CMN	\N	51.85723090	-4.31159590	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q217840
2485	City of Derby	232	GB	X7	DER	\N	37.54837550	-97.24851910	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21885980
2486	Pembrokeshire	232	GB	Y7	PEM	\N	51.67407800	-4.90887850	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q213361
2487	North Lanarkshire	232	GB	V8	NLK	\N	55.86624320	-3.96131440	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q207111
2488	Stirling	232	GB	W6	STG	\N	56.11652270	-3.93690290	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q217838
2489	City of Wolverhampton	232	GB	W6	WLV	\N	52.58891200	-2.15646300	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21885975
2490	London Borough of Bromley	232	GB	B8	BRY	\N	51.36797050	0.07006200	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q208201
2491	Devon	232	GB	B8	DEV	\N	50.71555910	-3.53087500	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21694695
2492	Royal Borough of Greenwich	232	GB	E7	GRE	\N	51.48346270	0.05862020	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q693450
2493	Salford	232	GB	L5	SLF	\N	53.48752350	-2.29012640	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1142118
2494	Lisburn City Council	232	GB	S5	LSB	\N	54.49815840	-6.13067910	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q210647
2495	Lancashire	232	GB	S5	LAN	\N	53.76322540	-2.70440520	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q21279371
2496	Torfaen	232	GB	Z2	TOF	\N	51.70022530	-3.04460150	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q643919
2497	Denbighshire	232	GB	X9	DEN	\N	53.18422880	-3.42249850	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q650682
2498	Ards	232	GB	Q7	ARD	\N	42.13918510	-87.86149720	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q640080
2499	Barnsley	232	GB	A3	BNS	\N	34.29949560	-84.98458090	2019-10-05 23:18:47	2022-08-31 15:52:51	1	Q1857382
2500	Herefordshire	232	GB	F7	HEF	\N	52.07651640	-2.65441820	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q23129
2501	London Borough of Richmond upon Thames	232	GB	L1	RIC	\N	51.46130540	-0.30377090	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q32515
2502	Saint Helena	232	GB	02	SH-HL	\N	-15.96501040	-5.70892410	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q34497
2503	Leeds	232	GB	H3	LDS	\N	53.80075540	-1.54907740	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q774015
2504	Bolton	232	GB	B1	BOL	\N	44.37264760	-72.87876250	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1364541
2505	Warwickshire	232	GB	P3	WAR	\N	52.26713530	-1.46752160	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q23140
2506	City of Stoke-on-Trent	232	GB	P3	STE	\N	53.00266800	-2.17940400	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q21891722
2507	Bedford	232	GB	P3	BDF	\N	32.84401700	-97.14306710	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q894077
2508	Dungannon and South Tyrone Borough Council	232	GB	S1	DGN	\N	54.50826840	-6.76658910	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1198466
2509	Ceredigion	232	GB	X6	CGN	\N	52.21914290	-3.93212560	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q217829
2510	Worcestershire	232	GB	Q4	WOR	\N	52.25452250	-2.26683820	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q23135
2511	Dundee	232	GB	U3	DND	\N	56.46201800	-2.97072100	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q123709
2512	London Borough of Croydon	232	GB	C8	CRY	\N	51.38274460	-0.09851630	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q26888
2513	North Down Borough Council	232	GB	T2	NDN	\N	54.65362970	-5.67249250	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1156987
2514	City of Plymouth	232	GB	T2	PLY	\N	42.37089410	-83.46971410	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q21674890
2515	Larne Borough Council	232	GB	S3	LRN	\N	54.85780030	-5.82362240	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1198470
2516	Leicestershire	232	GB	S3	LEC	\N	52.77257100	-1.20521260	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q21272890
2517	Calderdale	232	GB	C2	CLD	\N	53.72478450	-1.86583570	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1026448
2518	Sefton	232	GB	L8	SFT	\N	53.50344490	-2.97035900	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1546645
2519	Midlothian	232	GB	V5	MLN	\N	32.47533500	-97.01031810	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q206934
2520	London Borough of Barnet	232	GB	A2	BNE	\N	51.60496730	-0.20762950	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q151048
2521	North Tyneside	232	GB	J5	NTY	\N	55.01823990	-1.48584360	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1120443
2522	North Yorkshire	232	GB	NIR	NYK	\N	53.99150280	-1.54120150	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q21241814
2523	Ards and North Down	232	GB	NIR	AND	\N	54.58996450	-5.59849720	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q7055155
2524	Newport	232	GB	Y6	NWP	\N	37.52782340	-94.10438760	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q11294004
2525	Castlereagh	232	GB	R5	CSR	\N	54.57567900	-5.88840280	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1049680
2526	Surrey	232	GB	N7	SRY	\N	51.31475930	-0.55995010	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q23276
2527	Redcar and Cleveland	232	GB	K9	RCC	\N	54.59713440	-1.07759970	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1434448
2528	City and County of Cardiff	232	GB	X5	CRF	\N	51.48158100	-3.17909000	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q24342199
2529	Bradford	232	GB	B4	BRD	\N	53.79598400	-1.75939800	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q2834810
2530	Blaenau Gwent County Borough	232	GB	X2	BGW	\N	51.78757790	-3.20439310	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q596885
2531	Fermanagh District Council	232	GB	S2	FER	\N	54.34479780	-7.63842180	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1198461
2532	London Borough of Ealing	232	GB	D9	EAL	\N	51.52503660	-0.34139650	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q207218
2533	Antrim	232	GB	Q6	ANT	\N	54.71953380	-6.20724980	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q609214
2534	Newry, Mourne and Down	232	GB	Q6	NMD	\N	54.24342870	-5.95779590	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q15262186
2535	North Ayrshire	232	GB	V7	NAY	\N	55.64167310	-4.75946000	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q206926
2536	Tashkent	236	UZ	13	TK	\N	41.29949580	69.24007340	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q269
2537	Namangan Region	236	UZ	06	NG	\N	41.05100370	71.09731700	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q474876
2538	Fergana Region	236	UZ	03	FA	\N	40.45680810	71.28742090	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q487089
2539	Xorazm Region	236	UZ	05	XO	\N	41.35653360	60.85666860	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q487561
2540	Andijan Region	236	UZ	01	AN	\N	40.76859410	72.23637900	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q487384
2541	Bukhara Region	236	UZ	02	BU	\N	40.25041620	63.20321510	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q487372
2542	Navoiy Region	236	UZ	07	NW	\N	42.69885750	64.63376850	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q487570
2543	Qashqadaryo Region	236	UZ	08	QA	\N	38.89862310	66.04635340	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q487577
2544	Samarqand Region	236	UZ	10	SA	\N	39.62701200	66.97497310	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q487532
2545	Jizzakh Region	236	UZ	15	JI	\N	40.47064150	67.57085360	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q488811
2546	Surxondaryo Region	236	UZ	12	SU	\N	37.94090050	67.57085360	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q487537
2547	Sirdaryo Region	236	UZ	16	SI	\N	40.38638080	68.71549750	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q487547
2548	Karakalpakstan	236	UZ	09	QR	\N	43.80413340	59.44579880	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q484245
2549	Tashkent Region	236	UZ	14	TO	\N	41.22132340	69.85974060	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q487585
2550	Ariana	224	TN	38	12	governorate	36.99227510	10.12551640	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q233116
2551	Bizerte	224	TN	18	23	governorate	37.16093970	9.63413500	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q241129
2552	Jendouba	224	TN	06	32	governorate	36.71818620	8.74811670	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q276580
2553	Monastir	224	TN	16	52	governorate	35.76425150	10.81128850	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q318102
2554	Tunis	224	TN	36	11	governorate	36.83749460	10.19273890	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q328109
2555	Manouba	224	TN	39	14	governorate	36.84465040	9.85714160	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q734328
2556	Gafsa	224	TN	30	71	governorate	34.37885050	8.66005860	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q269968
2557	Sfax	224	TN	32	61	governorate	34.86065810	10.34978950	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q241145
2558	Gabès	224	TN	29	81	governorate	33.94596480	9.72326730	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q242263
2559	Tataouine	224	TN	34	83	governorate	32.13441220	10.08072980	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q327045
2560	Medenine	224	TN	28	82	governorate	33.22805650	10.89030990	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q327087
2561	Kef	224	TN	14	33	governorate	36.12305120	8.66005860	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q328199
2562	Kebili	224	TN	31	73	governorate	33.70715510	8.97146230	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q286063
2563	Siliana	224	TN	22	34	governorate	36.08872080	9.36453350	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q328115
2564	Kairouan	224	TN	03	41	governorate	35.67116630	10.10054690	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q276574
2565	Zaghouan	224	TN	37	22	governorate	36.40911880	10.14231720	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q27916
2566	Ben Arous	224	TN	27	13	governorate	36.64356060	10.21515780	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q238555
2567	Sidi Bouzid	224	TN	33	43	governorate	35.03543860	9.48393920	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q327097
2568	Mahdia	224	TN	15	53	governorate	35.33525580	10.89030990	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q328164
2569	Tozeur	224	TN	35	72	governorate	33.97894910	8.04651850	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q388059
2570	Kasserine	224	TN	02	42	governorate	35.08091480	8.66005860	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q388047
2571	Sousse	224	TN	23	51	governorate	35.90222670	10.34978950	2019-10-05 23:18:48	2022-08-31 15:54:55	1	Q276565
2572	Béja	224	TN	17	31	governorate	35.17227160	8.83076260	2019-10-05 23:18:48	2023-03-25 16:56:05	1	Q276576
2573	Ratak Chain	137	MH	17	T	\N	10.27632760	170.55009370	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q700048
2574	Ralik Chain	137	MH	17	L	\N	8.13614600	164.88679560	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q697840
2575	Centrale Region	220	TG	22	C	\N	8.65860290	1.05861350	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q316220
2576	Maritime	220	TG	24	M	\N	41.65514930	-83.52784670	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q316291
2577	Plateaux Region	220	TG	25	P	\N	7.61013780	1.05861350	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q316306
2578	Savanes Region	220	TG	26	S	\N	10.52917810	0.52578230	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q279945
2579	Kara Region	220	TG	23	K	\N	9.72163930	1.05861350	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q316216
2580	Chuuk State	143	FM	03	TRK	\N	7.13867590	151.55930650	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q221684
2581	Pohnpei State	143	FM	02	PNI	\N	6.85412540	158.26238220	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q7771127
2582	Yap State	143	FM	04	YAP	\N	8.67164900	142.84393350	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q11342951
2583	Kosrae State	143	FM	01	KSA	\N	5.30956180	162.98148770	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1785093
2584	Vaavu Atoll	133	MV	47	04	\N	3.39554380	73.51229280	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q2709111
2585	Shaviyani Atoll	133	MV	45	24	\N	6.17511000	73.13496050	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q2190334
2586	Haa Alif Atoll	133	MV	36	07	\N	6.99034880	72.94605660	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q2360912
2587	Alif Alif Atoll	133	MV		02	\N	4.08500000	72.85154790	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q775323
2588	North Province	133	MV	30	NO	\N	8.88550270	80.27673270	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q13365882
2589	North Central Province	133	MV		NC	\N	\N	\N	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q13365881
2590	Dhaalu Atoll	133	MV	32	17	\N	2.84685020	72.94605660	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q2290784
2591	Thaa Atoll	133	MV	46	08	\N	2.43111610	73.18216230	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q2709118
2592	Noonu Atoll	133	MV	43	25	\N	5.85512760	73.32370800	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q2406322
2593	Upper South Province	133	MV		US	\N	0.23070000	73.27948460	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q7898928
2594	Addu Atoll	133	MV	01	01	\N	-0.63009950	73.15856260	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q353375
2595	Gnaviyani Atoll	133	MV	42	29	\N	-0.30064250	73.42391430	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1811116
2596	Kaafu Atoll	133	MV	38	26	\N	4.45589790	73.55941280	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1468407
2597	Haa Dhaalu Atoll	133	MV	37	23	\N	6.57827170	72.94605660	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q2360368
2598	Gaafu Alif Atoll	133	MV	34	27	\N	0.61248130	73.32370800	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1116203
2599	Faafu Atoll	133	MV	33	14	\N	3.23094090	72.94605660	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q2469227
2600	Alif Dhaal Atoll	133	MV		00	\N	3.65433020	72.80427970	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q2316922
2601	Laamu Atoll	133	MV	05	05	\N	1.94307370	73.41802110	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1996432
2602	Raa Atoll	133	MV	44	13	\N	5.60064570	72.94605660	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1457965
2603	Gaafu Dhaalu Atoll	133	MV	35	28	\N	0.35880400	73.18216230	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q2640183
2604	Central Province	133	MV		CE	\N	\N	\N	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q5061718
2605	South Province	133	MV	10346475	SU	\N	-21.74820060	166.17837390	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q7568276
2606	South Central Province	133	MV	10346475	SC	\N	7.25649960	80.72144170	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q7566772
2607	Lhaviyani Atoll	133	MV	39	03	\N	5.37470210	73.51229280	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q1390048
2608	Meemu Atoll	133	MV	41	12	\N	3.00903450	73.51229280	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q2210716
2609	Malé	133	MV	40	MLE	\N	46.34888670	10.90724890	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q9347
2610	Utrecht	156	NL	09	UT	province	52.09073740	5.12142010	2019-10-05 23:18:48	2022-05-09 00:08:51	1	Q776
2611	Gelderland	156	NL	03	GE	province	52.04515500	5.87182350	2019-10-05 23:18:48	2022-05-09 00:08:51	1	Q775
2612	North Holland	156	NL	07	NH	province	52.52058690	4.78847400	2019-10-05 23:18:48	2022-05-09 00:08:51	1	Q701
2613	Drenthe	156	NL	01	DR	province	52.94760120	6.62305860	2019-10-05 23:18:48	2022-05-09 00:08:51	1	Q772
2614	South Holland	156	NL	11	ZH	province	51.99667920	4.55973970	2019-10-05 23:18:48	2023-03-05 19:14:51	1	Q694
2615	Limburg	156	NL	05	LI	province	51.44272380	6.06087260	2019-10-05 23:18:48	2022-05-09 00:08:51	1	Q1093
2616	Sint Eustatius	156	NL	05	BQ3	special municipality	17.48903060	-62.97355500	2019-10-05 23:18:48	2022-05-09 00:08:21	1	Q26180
2617	Groningen	156	NL	04	GR	province	53.21938350	6.56650170	2019-10-05 23:18:48	2022-05-09 00:08:51	1	Q752
2618	Overijssel	156	NL	15	OV	province	52.43878140	6.50164110	2019-10-05 23:18:48	2022-05-09 00:08:51	1	Q773
2619	Flevoland	156	NL	16	FL	province	52.52797810	5.59535080	2019-10-05 23:18:48	2022-05-09 00:08:51	1	Q707
2620	Zeeland	156	NL	10	ZE	province	51.49403090	3.84968150	2019-10-05 23:18:48	2022-05-09 00:08:51	1	Q705
2621	Saba	156	NL	10	BQ2	special municipality	17.63546420	-63.23267630	2019-10-05 23:18:48	2022-05-09 00:08:21	1	Q25528
2622	Friesland	156	NL	02	FR	province	53.16416420	5.78175420	2019-10-05 23:18:48	2022-05-09 00:08:51	1	Q770
2623	North Brabant	156	NL	06	NB	province	51.48265370	5.23216870	2019-10-05 23:18:48	2022-05-09 00:08:51	1	Q1101
2624	Bonaire	156	NL	06	BQ1	special municipality	12.20189020	-68.26238220	2019-10-05 23:18:48	2022-05-09 00:08:21	1	Q25396
2625	Savanes Region	54	CI	87	03	\N	\N	\N	2019-10-05 23:18:48	2022-08-31 15:52:51	1	Q853460
2626	Agnéby	54	CI	74	16	\N	5.32245030	-4.34495290	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q395166
2627	Lagunes District	54	CI	82	LG	\N	5.88273340	-4.23333550	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q20980365
2628	Sud-Bandama	54	CI	88	15	\N	5.53570830	-5.56172790	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q845713
2629	Montagnes District	54	CI	78	MG	\N	7.37623730	-7.43813550	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q20980366
2630	Moyen-Comoé	54	CI	85	05	\N	6.65149170	-3.50034540	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q303645
2631	Marahoué Region	54	CI	83	12	\N	6.88462070	-5.89871390	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q839083
2632	Lacs District	54	CI	81	LC	\N	48.19801690	-80.45644120	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q20980363
2633	Fromager	54	CI	79	18	\N	45.54502130	-73.60462230	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q818774
2634	Abidjan	54	CI	93	AB	\N	5.35995170	-4.00825630	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1515
2635	Bas-Sassandra Region	54	CI	76	09	\N	5.35679160	-6.74939930	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q809733
2636	Bafing Region	54	CI	75	17	\N	8.32520470	-7.52472430	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q799800
2637	Vallée du Bandama District	54	CI	90	VB	\N	8.27897800	-4.89356270	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q21002356
2638	Haut-Sassandra	54	CI	80	02	\N	6.87578480	-6.57833870	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q845709
2639	Lagunes region	54	CI	82	01	\N	5.88273340	-4.23333550	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q639491
2640	Lacs Region	54	CI	81	07	\N	47.73958660	-70.41866520	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q845706
2641	Zanzan Region	54	CI	92	ZZ	\N	8.82079040	-3.41955270	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q147081
2642	Denguélé Region	54	CI	77	10	\N	9.46623720	-7.43813550	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q729010
2643	Bas-Sassandra District	54	CI	76	BS	\N	5.27983560	-6.15269850	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q20980352
2644	Denguélé District	54	CI	77	DN	\N	48.07077630	-68.56093410	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q20980374
2645	Dix-Huit Montagnes	54	CI	78	06	\N	7.37623730	-7.43813550	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q820486
2646	Moyen-Cavally	54	CI	84	19	\N	6.52087930	-7.61142170	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q842499
2647	Vallée du Bandama Region	54	CI	90	04	\N	8.27897800	-4.89356270	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q845721
2648	Sassandra-Marahoué District	54	CI	96	SM	\N	6.88033480	-6.23759470	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q20365127
2649	Worodougou	54	CI	91	14	\N	8.25489620	-6.57833870	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q846056
2650	Woroba District	54	CI	97	WR	\N	8.24913720	-6.92091350	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q20980371
2651	Gôh-Djiboua District	54	CI	95	GD	\N	5.87113930	-5.56172790	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q21003640
2652	Sud-Comoé	54	CI	89	13	\N	5.55279300	-3.25836260	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q842495
2653	Yamoussoukro	54	CI	98	YM	\N	6.82762280	-5.28934330	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q3768
2654	Comoé District	54	CI	94	CM	\N	5.55279300	-3.25836260	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q16629374
2655	N\\"zi-Comoé	54	CI	86	11	\N	7.24567490	-4.23333550	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q842491
2656	Far North	38	CM	12	EN	\N	66.76134510	124.12375300	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q823976
2657	Northwest	38	CM	07	NW	\N	36.37118570	-94.19346060	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q823946
2658	Southwest	38	CM	09	SW	\N	36.19088130	-95.88974480	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q607499
2659	South	38	CM	14	SU	\N	37.63159500	-97.34584090	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q857122
2660	Centre	38	CM	11	CE	\N	\N	\N	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q739951
2661	East	38	CM	04	ES	\N	39.01853360	-94.27924110	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q845168
2662	Littoral	38	CM	05	LT	\N	48.46227570	-68.51780710	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q845172
2663	Adamawa	38	CM	10	AD	\N	9.32647510	12.39838530	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q351514
2664	West	38	CM	08	OU	\N	37.03649890	-95.67059870	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q165784
2665	North	38	CM	13	NO	\N	37.09024000	-95.71289100	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q502341
2666	Banjul	80	GM	01	B	\N	13.45487610	-16.57903230	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q3726
2667	West Coast Division	80	GM	05	W	\N	5.97727980	116.07542880	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q846158
2668	Upper River Division	80	GM	04	U	\N	13.42573660	-14.00723480	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q824373
2669	Central River Division	80	GM	03	M	\N	13.59944690	-14.89216680	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q824431
2670	Lower River Division	80	GM	02	L	\N	13.35533060	-15.92299000	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q824421
2671	North Bank Division	80	GM	07	N	\N	13.52854360	-16.01699710	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q846161
2672	Beyla Prefecture	92	GN	01	BE	\N	8.91981780	-8.30884410	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q853169
2673	Mandiana Prefecture	92	GN	37	MD	\N	10.61728270	-8.69857160	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1470878
2674	Yomou Prefecture	92	GN	29	YO	\N	7.56962790	-9.25915710	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q623139
2675	Fria Prefecture	92	GN	11	FR	\N	10.36745430	-13.58418710	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1456055
2676	Boké Region	92	GN	B	B	\N	11.18646720	-14.10013260	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q862611
2677	Labé Region	92	GN	L	L	\N	11.32320420	-12.28913140	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q868515
2678	Nzérékoré Prefecture	92	GN	24	NZ	\N	7.74783590	-8.82525020	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1471203
2679	Dabola Prefecture	92	GN	05	DB	\N	10.72978060	-11.11078540	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1156587
2680	Labé Prefecture	92	GN	20	LA	\N	11.35419390	-12.34638750	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1781303
2681	Dubréka Prefecture	92	GN	08	DU	\N	9.79073480	-13.51477350	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1263263
2682	Faranah Prefecture	92	GN	09	FA	\N	9.90573990	-10.80000510	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1396210
2683	Forécariah Prefecture	92	GN	10	FO	\N	9.38861870	-13.08179030	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1439329
2684	Nzérékoré Region	92	GN	N	N	\N	8.03858700	-8.83627550	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q870146
2685	Gaoual Prefecture	92	GN	12	GA	\N	11.57628040	-13.35872880	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q614669
2686	Conakry	92	GN	04	C	\N	9.64118550	-13.57840120	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q3733
2687	Télimélé Prefecture	92	GN	27	TE	\N	10.90893640	-13.02993310	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q922545
2688	Dinguiraye Prefecture	92	GN	07	DI	\N	11.68442220	-10.80000510	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1226479
2689	Mamou Prefecture	92	GN	23	MM	\N	10.57360240	-11.88917210	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q623295
2690	Lélouma Prefecture	92	GN	35	LE	\N	11.18333300	-12.93333300	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q253661
2691	Kissidougou Prefecture	92	GN	17	KS	\N	9.22520220	-10.08072980	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1470920
2692	Koubia Prefecture	92	GN	33	KB	\N	11.58235400	-11.89202370	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q623409
2693	Kindia Prefecture	92	GN	16	KD	\N	10.10132920	-12.71351210	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1741960
2694	Pita Prefecture	92	GN	25	PI	\N	10.80620860	-12.71351210	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q736507
2695	Kouroussa Prefecture	92	GN	19	KO	\N	10.64892290	-9.88505860	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1471573
2696	Tougué Prefecture	92	GN	28	TO	\N	11.38415830	-11.61577730	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1432094
2697	Kankan Region	92	GN	K	K	\N	10.12092300	-9.54509740	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q870191
2698	Mamou Region	92	GN	M	M	\N	10.57360240	-11.88917210	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1043650
2699	Boffa Prefecture	92	GN	02	BF	\N	10.18082540	-14.03916150	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q890340
2700	Mali Prefecture	92	GN	22	ML	\N	11.98370900	-12.25479190	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1781017
2701	Kindia Region	92	GN	D	D	\N	10.17816940	-12.98961500	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q868520
2702	Macenta Prefecture	92	GN	21	MC	\N	8.46157950	-9.27855830	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q949332
2703	Koundara Prefecture	92	GN	18	KN	\N	12.48940210	-13.30675620	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1781312
2704	Kankan Prefecture	92	GN	14	KA	\N	10.30344650	-9.36730840	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q581719
2705	Coyah Prefecture	92	GN	30	CO	\N	9.77155350	-13.31252990	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q616816
2706	Dalaba Prefecture	92	GN	06	DL	\N	10.68681760	-12.24906970	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q623302
2707	Siguiri Prefecture	92	GN	26	SI	\N	11.41481130	-9.17883040	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1780649
2708	Lola Prefecture	92	GN	36	LO	\N	7.96138180	-8.39649380	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q623145
2709	Boké Prefecture	92	GN	03	BK	\N	11.08473790	-14.37919120	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q891238
2710	Kérouané Prefecture	92	GN	15	KE	\N	9.25366430	-9.01289260	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q962654
2711	Guéckédou Prefecture	92	GN	13	GU	\N	8.56496880	-10.13111630	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q623142
2712	Tombali Region	93	GW	07	TO	\N	11.36326960	-14.98561760	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q1047255
2713	Cacheu Region	93	GW	06	CA	\N	12.05514160	-16.06401790	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q780838
2714	Biombo Region	93	GW	12	BM	\N	11.85290610	-15.73511710	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q872228
2715	Quinara Region	93	GW	02	QU	\N	11.79556200	-15.17268160	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q862617
2716	Sul Province	93	GW	02	S	\N	-10.28665780	20.71224650	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q13378476
2717	Norte Province	93	GW	02	N	\N	7.87218110	123.88577470	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q13378475
2718	Oio Region	93	GW	04	OI	\N	12.27607090	-15.31311850	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q853991
2719	Gabú Region	93	GW	10	GA	\N	11.89624880	-14.10013260	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q872212
2720	Bafatá	93	GW	01	BA	\N	12.17352430	-14.65295200	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q799791
2721	Leste Province	93	GW	01	L	\N	\N	\N	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q13378473
2722	Bolama Region	93	GW	05	BL	\N	11.14805910	-16.13457050	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q151909
2723	Woleu-Ntem Province	79	GA	09	9	\N	2.29898270	11.44669140	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q823800
2724	Ogooué-Ivindo Province	79	GA	06	6	\N	0.88183110	13.17403480	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q823822
2725	Nyanga Province	79	GA	05	5	\N	-2.88210330	11.16173560	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q846017
2726	Haut-Ogooué Province	79	GA	02	2	\N	-1.47625440	13.91439900	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q654438
2727	Estuaire Province	79	GA	01	1	\N	0.44328640	10.08072980	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q281109
2728	Ogooué-Maritime Province	79	GA	08	8	\N	-1.34659750	9.72326730	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q823751
2729	Ogooué-Lolo Province	79	GA	07	7	\N	-0.88440930	12.43805810	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q823762
2730	Moyen-Ogooué Province	79	GA	03	3	\N	-0.44278400	10.43965600	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q590802
2731	Ngounié Province	79	GA	04	4	\N	-1.49303030	10.98070030	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q823774
2732	Tshuapa	51	CD	31	TU	\N	-0.99030230	23.02888440	2019-10-05 23:18:49	2022-08-31 15:52:51	1	Q427246
2733	Tanganyika	51	CD	29	TA	\N	-6.27401180	27.92490020	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q826585
2734	Haut-Uélé	51	CD	16	HU	\N	3.58451540	28.29943500	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q751632
2735	Kasaï Oriental	51	CD	04	KE	\N	-6.03362300	23.57285010	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q80953
2738	Sud-Kivu	51	CD	12	SK	\N	-3.01165800	28.29943500	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q488326
2739	Nord-Ubangi	51	CD	26	NU	\N	3.78787260	21.47528510	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q843312
2740	Kwango	51	CD	19	KG	\N	-6.43374090	17.66888700	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q757095
2741	Kinshasa	51	CD	06	KN	\N	-4.44193110	15.26629310	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q3838
2742	Kasaï Central	51	CD	05	KC	\N	-8.44045910	20.41659340	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q6702952
2743	Sankuru	51	CD	27	SA	\N	-2.84374530	23.38235450	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q209829
2744	Équateur	51	CD	02	EQ	\N	-1.83123900	-78.18340600	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q988104
2745	Maniema	51	CD	10	MA	\N	-3.07309290	26.04138890	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q130566
2746	Kongo Central	51	CD	08	BC	\N	-5.23656850	13.91439900	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q130588
2747	Lomami	51	CD	21	LO	\N	-6.14539310	24.52426400	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q241886
2748	Sud-Ubangi	51	CD	28	SU	\N	3.22999420	19.18800470	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q834551
2749	Nord-Kivu	51	CD	11	NK	\N	-0.79177290	29.04599270	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q130625
2750	Haut-Katanga	51	CD	14	HK	\N	-10.41020750	27.54958460	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q130268
2751	Ituri	51	CD	17	IT	\N	1.59576820	29.41793240	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q750659
2752	Mongala	51	CD	25	MO	\N	1.99623240	21.47528510	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q847527
2753	Bas-Uélé	51	CD	13	BU	\N	3.99010090	24.90422080	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q652056
2755	Mai-Ndombe	51	CD	24	MN	\N	-2.63574340	18.42760470	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1163429
2756	Tshopo	51	CD	30	TO	\N	0.54554620	24.90422080	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q630900
2757	Kasaï	51	CD	18	KS	\N	-5.04719790	20.71224650	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q255655
2758	Haut-Lomami	51	CD	15	HL	\N	-7.70527520	24.90422080	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q605672
2759	Kwilu	51	CD	20	KL	\N	-5.11888250	18.42760470	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q559537
2760	Cuyuni-Mazaruni	94	GY	11	CU	\N	6.46421410	-60.21107520	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1146777
2761	Potaro-Siparuni	94	GY	17	PT	\N	4.78558530	-59.28799770	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1454035
2762	Mahaica-Berbice	94	GY	15	MA	\N	6.23849600	-57.91625550	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1466671
2763	Upper Demerara-Berbice	94	GY	18	UD	\N	5.30648790	-58.18929210	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1309042
2764	Barima-Waini	94	GY	10	BA	\N	7.48824190	-59.65644940	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q537740
2765	Pomeroon-Supenaam	94	GY	16	PM	\N	7.12941660	-58.92062950	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q680382
2766	East Berbice-Corentyne	94	GY	13	EB	\N	2.74779220	-57.46272590	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1277758
2767	Demerara-Mahaica	94	GY	12	DE	\N	6.54642600	-58.09820460	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1185362
2768	Essequibo Islands-West Demerara	94	GY	14	ES	\N	6.57201320	-58.46299970	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1368802
2769	Upper Takutu-Upper Essequibo	94	GY	19	UT	\N	2.92395950	-58.73736340	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1516381
2770	Presidente Hayes Department	172	PY	16	15	\N	-23.35126050	-58.73736340	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q750551
2771	Canindeyú	172	PY	19	14	\N	-24.13787350	-55.66896360	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q279085
2772	Guairá Department	172	PY	10	4	\N	-25.88109320	-56.29293810	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q755116
2773	Caaguazú	172	PY	04	5	\N	-25.46458180	-56.01385100	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q880399
2774	Paraguarí Department	172	PY	15	9	\N	-25.62621740	-57.15206420	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q240014
2775	Caazapá	172	PY	05	6	\N	-26.18277130	-56.37123270	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q881839
2776	San Pedro Department	172	PY	17	2	\N	-24.19486680	-56.56164700	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q526176
2777	Central Department	172	PY	06	11	\N	36.15592290	-95.96620750	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q372461
2778	Itapúa	172	PY	11	7	\N	-26.79236230	-55.66896360	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q222564
2779	Concepción Department	172	PY	07	1	\N	-23.42142640	-57.43444510	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q741009
2780	Boquerón Department	172	PY	24	19	\N	-21.74492540	-60.95400730	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q741017
2781	Ñeembucú Department	172	PY	13	12	\N	-27.02991140	-57.82539500	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q755115
2782	Amambay Department	172	PY	02	13	\N	-22.55902720	-56.02499820	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q686586
2783	Cordillera Department	172	PY	08	3	\N	-25.22894910	-57.01116810	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q755121
2784	Alto Paraná Department	172	PY	01	10	\N	-25.60755460	-54.96118360	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q682654
2785	Alto Paraguay Department	172	PY	23	16	\N	-20.08525080	-59.47209040	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q682642
2786	Misiones Department	172	PY	12	8	\N	-26.84335120	-57.10131880	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q591194
2787	Jaffna District	208	LK	25	41	\N	9.69304680	80.16518540	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1520182
2788	Kandy District	208	LK	10	21	\N	7.29315880	80.63501070	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q723002
2789	Kalutara District	208	LK	09	13	\N	6.60846860	80.14285840	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q728935
2790	Badulla District	208	LK	03	81	\N	6.99340090	81.05498150	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q799713
2791	Hambantota District	208	LK	07	33	\N	6.15358160	81.12714900	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q723006
2792	Galle District	208	LK	06	31	\N	6.05774900	80.21755720	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q647649
2793	Kilinochchi District	208	LK	06	42	\N	9.36779710	80.32131060	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1584007
2794	Nuwara Eliya District	208	LK	17	23	\N	6.96065320	80.76927580	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1583950
2795	Trincomalee District	208	LK	21	53	\N	8.60130690	81.11960750	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1493318
2796	Puttalam District	208	LK	19	62	\N	8.02599150	79.84712720	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1665318
2797	Kegalle District	208	LK	11	92	\N	7.12040530	80.32131060	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1737803
2798	Central Province	208	LK	29	2	\N	\N	\N	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q190716
2799	Ampara District	208	LK	01	52	\N	7.29116850	81.67237610	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q474395
2800	North Central Province	208	LK	30	7	\N	8.19956380	80.63269160	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1057124
2801	Southern Province	208	LK	34	3	\N	\N	\N	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q876308
2802	Western Province	208	LK	36	1	\N	\N	\N	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q856686
2803	Sabaragamuwa Province	208	LK	33	9	\N	6.73959410	80.36586500	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q853272
2804	Gampaha District	208	LK	24	12	\N	7.07126190	80.00877460	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q206344
2805	Mannar District	208	LK	26	43	\N	8.98095310	79.90439750	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q178003
2806	Matara District	208	LK	15	32	\N	5.94493480	80.54879970	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1281285
2807	Ratnapura district	208	LK	20	91	\N	6.70551680	80.38483890	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1587175
2808	Eastern Province	208	LK	37	5	\N	\N	\N	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1046126
2809	Vavuniya District	208	LK	28	44	\N	8.75947390	80.50003340	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q527980
2810	Matale District	208	LK	14	22	\N	7.46596460	80.62342590	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q787421
2811	Uva Province	208	LK	35	8	\N	6.84276120	81.33994140	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q876293
2812	Polonnaruwa District	208	LK	18	72	\N	7.93955670	81.00034030	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q931057
2813	Northern Province	208	LK	38	4	\N	\N	\N	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q598745
2814	Mullaitivu District	208	LK	27	45	\N	9.26753880	80.81282540	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1587508
2815	Colombo District	208	LK	23	11	\N	6.92695570	79.86173060	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q606287
2816	Anuradhapura District	208	LK	02	71	\N	8.33183050	80.40290170	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q612614
2817	North Western Province	208	LK	32	6	\N	7.75840910	80.18750650	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q876339
2818	Batticaloa District	208	LK	04	51	\N	7.82927810	81.47183870	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q810960
2819	Monaragala District	208	LK	16	82	\N	6.87277810	81.35068320	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q923420
2820	Mohéli	49	KM	03	M	\N	-12.33773760	43.73340890	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q271797
2821	Anjouan	49	KM	01	A	\N	-12.21381450	44.43706060	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q231324
2822	Grande Comore	49	KM	02	G	\N	-11.71673380	43.36807880	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q244978
2823	Atacama	44	CL	05	AT	\N	-27.56605580	-70.05031400	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q2120
2824	Región Metropolitana de Santiago	44	CL	12	RM	\N	-33.43755450	-70.65048960	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q2131
2825	Coquimbo	44	CL	07	CO	\N	-30.54018100	-70.81199530	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q2121
2826	La Araucanía	44	CL	04	AR	\N	-38.94892100	-72.33111300	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q2176
2827	Biobío	44	CL	06	BI	\N	-37.44644280	-72.14161320	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q2170
2828	Aisén del General Carlos Ibañez del Campo	44	CL	02	AI	\N	-46.37834500	-72.30076230	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q2181
2829	Arica y Parinacota	44	CL	16	AP	\N	-18.59404850	-69.47845410	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q2109
2830	Valparaíso	44	CL	01	VS	\N	-33.04723800	-71.61268850	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q219458
2831	Ñuble	44	CL	18	NB	\N	-36.72257430	-71.76224810	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q24076693
2832	Antofagasta	44	CL	03	AN	\N	-23.83691040	-69.28775350	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q2118
2833	Maule	44	CL	11	ML	\N	-35.51636030	-71.57239530	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q2166
2834	Los Ríos	44	CL	17	LR	\N	-40.23102170	-72.33111300	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q2177
2835	Los Lagos	44	CL	14	LL	\N	-41.91977790	-72.14161320	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q2178
2836	Magallanes y de la Antártica Chilena	44	CL	10	MA	\N	-52.20643160	-72.16850010	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q2189
2837	Tarapacá	44	CL	15	TA	\N	-20.20287990	-69.28775350	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q2114
2838	Libertador General Bernardo O\\"Higgins	44	CL	08	LI	\N	-34.57553740	-71.00223110	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q2133
2839	Commewijne District	210	SR	11	CM	\N	5.74021100	-54.87312190	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q952510
2840	Nickerie District	210	SR	14	NI	\N	5.58554690	-56.83111170	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1147515
2841	Para District	210	SR	15	PR	\N	5.48173180	-55.22592070	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1140891
2842	Coronie District	210	SR	12	CR	\N	5.69432710	-56.29293810	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1130141
2843	Paramaribo District	210	SR	16	PM	\N	5.85203550	-55.20382780	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1130134
2844	Wanica District	210	SR	19	WA	\N	5.73237620	-55.27012350	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1147524
2845	Marowijne District	210	SR	13	MA	\N	5.62681280	-54.25931180	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1140897
2846	Brokopondo District	210	SR	10	BR	\N	4.77102470	-55.04933750	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q847680
2847	Sipaliwini District	210	SR	18	SI	\N	3.65673820	-56.20353870	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1130138
2848	Saramacca District	210	SR	17	SA	\N	5.72408130	-55.66896360	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1351157
2849	Riyadh	194	SA	10	01	region	22.75543850	46.20915470	2019-10-05 23:18:50	2022-11-13 15:04:39	1	Q1249255
2850	Makkah	194	SA	14	02	region	21.52355840	41.91964710	2019-10-05 23:18:50	2022-11-13 15:04:39	1	Q234167
2851	Al Madinah	194	SA	05	03	region	24.84039770	39.32062410	2019-10-05 23:18:50	2022-11-13 15:04:39	1	Q236027
2852	Tabuk	194	SA	19	07	region	28.24533350	37.63866220	2019-10-05 23:18:50	2022-11-13 15:04:39	1	Q1315953
2853	\\"Asir	194	SA	11	14	region	19.09690620	42.86378750	2019-10-05 23:18:50	2022-11-13 15:04:39	1	Q779855
2854	Northern Borders	194	SA	15	08	region	30.07991620	42.86378750	2019-10-05 23:18:50	2022-11-13 15:04:39	1	Q201781
2855	Ha\\"il	194	SA	13	06	region	27.70761430	41.91964710	2019-10-05 23:18:50	2022-11-13 15:04:39	1	Q243656
2856	Eastern Province	194	SA	06	04	region	24.04399320	45.65892250	2019-10-05 23:18:50	2022-11-13 15:04:39	1	Q953508
2857	Al Jawf	194	SA	20	12	region	29.88735600	39.32062410	2019-10-05 23:18:50	2022-11-13 15:04:39	1	Q1471266
2858	Jizan	194	SA	17	09	region	17.17381760	42.70761070	2019-10-05 23:18:50	2022-11-13 15:04:39	1	Q269973
2859	Al Bahah	194	SA	02	11	region	20.27227390	41.44125100	2019-10-05 23:18:50	2022-11-13 15:04:39	1	Q852774
2860	Najran	194	SA	16	10	region	18.35146640	45.60071080	2019-10-05 23:18:50	2022-11-13 15:04:39	1	Q464718
2861	Al-Qassim	194	SA	08	05	region	26.20782600	43.48373800	2019-10-05 23:18:50	2022-11-13 15:04:39	1	Q1105411
2862	Plateaux Department	50	CG	08	14	\N	-2.06800880	15.40680790	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q765370
2863	Pointe-Noire	50	CG	15	16	\N	-4.76916230	11.86636200	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q7208306
2864	Cuvette Department	50	CG	13	8	\N	-0.28774460	16.15809370	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q780884
2865	Likouala Department	50	CG	06	7	\N	2.04392400	17.66888700	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q863554
2866	Bouenza Department	50	CG	01	11	\N	-4.11280790	13.72891670	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q827015
2867	Kouilou Department	50	CG	04	5	\N	-4.14284130	11.88917210	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q855327
2868	Lékoumou Department	50	CG	05	2	\N	-3.17038200	13.35872880	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q862753
2869	Cuvette-Ouest Department	50	CG	14	15	\N	0.14475500	14.47233010	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q125711
2870	Brazzaville	50	CG	12	BZV	\N	-4.26335970	15.24288530	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q3844
2871	Sangha Department	50	CG	10	13	\N	1.46623280	15.40680790	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q775410
2872	Niari Department	50	CG	07	9	\N	-3.18427000	12.25479190	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q969317
2873	Pool Department	50	CG	11	12	\N	-3.77626280	14.84546190	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q864647
2874	Quindío	48	CO	23	QUI	\N	4.46101910	-75.66735600	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q13995
2875	Cundinamarca	48	CO	33	CUN	\N	5.02600300	-74.03001220	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q232564
2876	Chocó	48	CO	11	CHO	\N	5.25280330	-76.82596520	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q230584
2877	Norte de Santander	48	CO	21	NSA	\N	7.94628310	-72.89880690	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q233058
2878	Meta	48	CO	19	MET	\N	39.76732580	-104.97535950	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q238629
2879	Risaralda	48	CO	24	RIS	\N	5.31584750	-75.99276520	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q13993
2880	Atlántico	48	CO	04	ATL	\N	10.69661590	-74.87410450	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q230882
2881	Arauca	48	CO	03	ARA	\N	6.54730600	-71.00223110	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q230223
2882	Guainía	48	CO	15	GUA	\N	2.58539300	-68.52471490	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q238645
2883	Tolima	48	CO	28	TOL	\N	4.09251680	-75.15453810	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q234501
2884	Cauca	48	CO	09	CAU	\N	2.70498130	-76.82596520	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q230602
2885	Vaupés	48	CO	30	VAU	\N	0.85535610	-70.81199530	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q234505
2886	Magdalena	48	CO	38	MAG	\N	10.41130140	-74.40566120	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q199910
2887	Caldas	48	CO	37	CAL	\N	5.29826000	-75.24790610	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q230607
2888	Guaviare	48	CO	14	GUV	\N	2.04392400	-72.33111300	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q272885
2889	La Guajira	48	CO	17	LAG	\N	11.35477430	-72.52048270	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q272747
2890	Antioquia	48	CO	02	ANT	\N	7.19860640	-75.34121790	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q123304
2891	Caquetá	48	CO	08	CAQ	\N	0.86989200	-73.84190630	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q13985
2892	Casanare	48	CO	32	CAS	\N	5.75892690	-71.57239530	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q13984
2893	Bolívar	48	CO	35	BOL	\N	8.67043820	-74.03001220	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q230597
2894	Vichada	48	CO	31	VID	\N	4.42344520	-69.28775350	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q268729
2895	Amazonas	48	CO	01	AMA	\N	-1.44291230	-71.57239530	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q44724
2896	Putumayo	48	CO	22	PUT	\N	0.43595060	-75.52766990	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q232953
2897	Nariño	48	CO	20	NAR	\N	1.28915100	-77.35794000	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q230217
2898	Córdoba	48	CO	12	COR	\N	8.04929300	-75.57405000	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q234912
2899	Cesar	48	CO	10	CES	\N	9.33729480	-73.65362090	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q234916
2900	Archipiélago de San Andrés, Providencia y Santa Catalina	48	CO	25	SAP	\N	12.55673240	-81.71852530	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q26855
2901	Santander	48	CO	26	SAN	\N	6.64370760	-73.65362090	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q235166
2902	Sucre	48	CO	27	SUC	\N	8.81397700	-74.72328300	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q235188
2903	Boyacá	48	CO	36	BOY	\N	5.45451100	-73.36200300	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q121233
2904	Valle del Cauca	48	CO	29	VAC	\N	3.80088930	-76.64127120	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q13990
2905	Galápagos	64	EC	01	W	province	-0.95376910	-90.96560190	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q475038
2906	Sucumbíos	64	EC	22	U	province	0.08892310	-76.88975570	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q499456
2907	Pastaza	64	EC	17	Y	province	-1.48822650	-78.00310570	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q214814
2908	Tungurahua	64	EC	19	T	province	-1.26352840	-78.56608520	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q504252
2909	Zamora Chinchipe	64	EC	20	Z	province	-4.06558920	-78.95035250	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q744670
2910	Los Ríos	64	EC	13	R	province	-1.02306070	-79.46088970	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q504260
2911	Imbabura	64	EC	11	I	province	0.34997680	-78.12601290	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q321863
2912	Santa Elena	64	EC	25	SE	province	-2.22671050	-80.85949900	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q1124125
2913	Manabí	64	EC	14	M	province	-1.05434340	-80.45264400	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q504666
2914	Guayas	64	EC	10	G	province	-1.95748390	-79.91927020	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q335464
2915	Carchi	64	EC	05	C	province	0.50269120	-77.90425210	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q321729
2916	Napo	64	EC	23	N	province	-0.99559640	-77.81296840	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q211900
2917	Cañar	64	EC	04	F	province	-2.55893150	-78.93881910	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q335471
2918	Morona-Santiago	64	EC	15	S	province	-2.30510620	-78.11468660	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q549522
2919	Santo Domingo de los Tsáchilas	64	EC	26	SD	province	-0.25218820	-79.18793830	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q1123208
2920	Bolívar	64	EC	03	B	province	-1.70958280	-79.04504290	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q261165
2921	Cotopaxi	64	EC	07	X	province	-0.83842060	-78.66626780	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q241140
2922	Esmeraldas	64	EC	09	E	province	0.96817890	-79.65172020	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q335526
2923	Azuay	64	EC	02	A	province	-2.89430680	-78.99683440	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q220451
2924	El Oro	64	EC	08	O	province	-3.25924130	-79.95835410	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q466019
2925	Chimborazo	64	EC	06	H	province	-1.66479950	-78.65432550	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q238492
2926	Orellana	64	EC	24	D	province	-0.45451630	-76.99502860	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q499475
2927	Pichincha	64	EC	18	P	province	-0.14648470	-78.47519450	2019-10-05 23:18:51	2022-01-22 14:51:12	1	Q272586
2928	Obock Region	60	DJ	04	OB	\N	12.38956910	43.01948970	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q844929
2929	Djibouti	60	DJ	07	DJ	\N	11.82513800	42.59027500	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q3604
2930	Dikhil Region	60	DJ	06	DI	\N	11.10543360	42.37047440	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q283979
2931	Tadjourah Region	60	DJ	05	TA	\N	11.93388850	42.39383750	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q645896
2932	Arta Region	60	DJ	08	AR	\N	11.52555280	42.84794740	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q705941
2933	Ali Sabieh Region	60	DJ	01	AS	\N	11.19289730	42.94169800	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q821008
2934	Hama	215	SY	10	HM	\N	35.18878650	37.21158290	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q232355
2935	Rif Dimashq	215	SY	08	RD	\N	33.51672890	36.95410700	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q232399
2936	As-Suwayda	215	SY	05	SU	\N	32.79891560	36.78195050	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q236797
2937	Deir ez-Zor	215	SY	07	DY	\N	35.28797980	40.30886260	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q232387
2938	Latakia	215	SY	02	LA	\N	35.61297910	36.00232250	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q233236
2939	Damascus	215	SY	13	DI	\N	33.51514440	36.39313540	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q2007044
2940	Idlib	215	SY	12	ID	\N	35.82687980	36.69572160	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q233218
2941	Al-Hasakah	215	SY	01	HA	\N	36.40551500	40.79691490	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q233914
2942	Homs	215	SY	11	HI	\N	34.25671230	38.31657250	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q214094
2943	Quneitra	215	SY	03	QU	\N	33.07763180	35.89341360	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q219690
2944	Al-Raqqah	215	SY	04	RA	\N	35.95941060	38.99810520	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q235563
2945	Daraa	215	SY	06	DR	\N	32.92488130	36.17626150	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q1689560
2946	Aleppo	215	SY	09	HL	\N	36.22623930	37.46813960	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q214064
2947	Tartus	215	SY	14	TA	\N	35.00066520	36.00232250	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q232382
2948	Fianarantsoa Province	130	MG	02	F	\N	-22.35362400	46.82528380	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q841197
2949	Toliara Province	130	MG	06	U	\N	-23.35161910	43.68549360	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q162020
2950	Antsiranana Province	130	MG	31	D	\N	-13.77153900	49.52799960	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q656073
2951	Antananarivo Province	130	MG	05	T	\N	-18.70514740	46.82528380	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q489821
2952	Toamasina Province	130	MG	04	A	\N	-18.14428110	49.39578360	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q639418
2953	Mahajanga Province	130	MG	03	M	\N	-16.52388300	46.51626200	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q669259
2954	Mogilev Region	21	BY	06	MA	\N	53.51017910	30.40064440	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q189822
2955	Gomel Region	21	BY	02	HO	\N	52.16487540	29.13332510	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q188732
2956	Grodno Region	21	BY	03	HR	\N	53.65999450	25.34485710	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q191061
2957	Minsk Region	21	BY	05	MI	\N	54.10678890	27.41292450	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q192959
2958	Minsk	21	BY	04	HM	\N	53.90060110	27.55897200	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q2280
2959	Brest Region	21	BY	01	BR	\N	52.52966410	25.46064800	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q173822
2960	Vitebsk Region	21	BY	07	VI	\N	55.29598330	28.75836270	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q185700
2961	Murqub	124	LY	82	MB	\N	32.45996770	14.10013260	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q209778
2962	Nuqat al Khams	124	LY	67	NQ	\N	32.69149090	11.88917210	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q26161
2963	Zawiya District	124	LY	68	ZA	\N	32.76302820	12.73649620	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q26153
2964	Al Wahat District	124	LY	83	WA	\N	29.04668080	21.85685860	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q26000
2965	Sabha District	124	LY	75	SB	\N	27.03654060	14.42902360	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q26132
2966	Derna District	124	LY	70	DR	\N	32.75561300	22.63774320	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q26124
2967	Murzuq District	124	LY	73	MQ	\N	25.91822620	13.92600010	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q48239
2968	Marj District	124	LY	66	MJ	\N	32.05503630	21.18911510	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q26023
2969	Ghat District	124	LY	71	GT	\N	24.96403710	10.17592850	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q48236
2970	Jufra	124	LY	64	JU	\N	27.98351350	16.91225100	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q48247
2971	Tripoli District	124	LY	77	TB	\N	32.64080210	13.26634790	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q32837
2972	Kufra District	124	LY	65	KF	\N	23.31123890	21.85685860	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q48200
2973	Wadi al Hayaa District	124	LY	84	WD	\N	26.42259260	12.62162110	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q48233
2974	Jabal al Gharbi District	124	LY	80	JG	\N	30.26380320	12.80547530	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q25632
2975	Wadi al Shatii District	124	LY	78	WS	\N	27.73514680	12.43805810	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q48232
2976	Nalut District	124	LY	74	NL	\N	31.87423480	10.97504840	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q27659
2977	Sirte District	124	LY	76	SR	\N	31.18968900	16.57019270	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q26417
2978	Misrata District	124	LY	72	MI	\N	32.32558840	15.09925560	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q32845
2979	Jafara	124	LY	81	JI	\N	32.45259040	12.94355360	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q329060
2980	Jabal al Akhdar	124	LY	63	JA	\N	23.18560810	57.37138790	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q32841
2981	Benghazi	124	LY	69	BA	\N	32.11942420	20.08679090	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q40816
2982	Ribeira Brava Municipality	40	CV	22	RB	\N	16.60707390	-24.20338430	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q747221
2983	Tarrafal	40	CV	20	TA	\N	15.27605780	-23.74840770	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q499598
2984	Ribeira Grande de Santiago	40	CV	23	RS	\N	14.98302980	-23.65617250	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q499620
2985	Santa Catarina	40	CV	15	CA	\N	-27.24233920	-50.21885560	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q494882
2986	São Domingos	40	CV	17	SD	\N	15.02861650	-23.56392200	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q499009
2987	Mosteiros	40	CV	13	MO	\N	37.89043480	-25.82075560	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q516835
2988	Praia	40	CV	14	PR	\N	14.93305000	-23.51332670	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q497019
2989	Porto Novo	40	CV	21	PN	\N	6.49685740	2.62885230	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q1552897
2990	São Miguel	40	CV	19	SM	\N	37.78041100	-25.49704660	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q494874
2991	Maio Municipality	40	CV	04	MA	\N	15.20030980	-23.16797930	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q2551133
2992	Sotavento Islands	40	CV	04	S	\N	15.00000000	-24.00000000	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q500453
2993	São Lourenço dos Órgãos	40	CV	25	SO	\N	15.05378410	-23.60856120	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q494726
2994	Barlavento Islands	40	CV	25	B	\N	16.82368450	-23.99348810	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q494869
2995	Santa Catarina do Fogo	40	CV	24	CF	\N	14.93091040	-24.32225770	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q2608046
2996	Brava	40	CV	02	BR	\N	40.98977780	-73.68357150	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q2571624
2997	Paul	40	CV	05	PA	\N	37.06250000	-95.67706800	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q1475374
2998	Sal	40	CV	08	SL	\N	26.59581220	-80.20450830	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q2721003
2999	Boa Vista	40	CV	01	BV	\N	38.74346600	-120.73042970	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q2721025
3000	São Filipe	40	CV	18	SF	\N	14.89516790	-24.49456360	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q6430079
3001	São Vicente	40	CV	11	SV	\N	-23.96071570	-46.39620220	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q648842
3002	Ribeira Grande	40	CV	07	RG	\N	37.82103690	-25.51481370	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q1355642
3003	Tarrafal de São Nicolau	40	CV	27	TS	\N	16.56364980	-24.35494200	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q1895853
3004	Santa Cruz	40	CV	16	CR	\N	36.97411710	-122.03079630	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q497472
3005	Schleswig-Holstein	82	DE	10	SH	\N	54.21936720	9.69611670	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q1194
3006	Baden-Württemberg	82	DE	01	BW	\N	48.66160370	9.35013360	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q985
3007	Mecklenburg-Vorpommern	82	DE	12	MV	\N	53.61265050	12.42959530	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q1196
3008	Lower Saxony	82	DE	06	NI	\N	52.63670360	9.84507660	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q1197
3009	Bavaria	82	DE	02	BY	\N	48.79044720	11.49788950	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q980
3010	Berlin	82	DE	16	BE	\N	52.52000660	13.40495400	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q64
3011	Saxony-Anhalt	82	DE	14	ST	\N	51.95026490	11.69227340	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q1206
3013	Brandenburg	82	DE	11	BB	\N	52.41252870	12.53164440	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q1208
3014	Bremen	82	DE	03	HB	\N	53.07929620	8.80169360	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q1209
3015	Thuringia	82	DE	15	TH	\N	51.01098920	10.84534600	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q1205
3016	Hamburg	82	DE	04	HH	\N	53.55108460	9.99368190	2019-10-05 23:18:51	2022-08-31 15:52:51	1	Q1055
3017	North Rhine-Westphalia	82	DE	07	NW	\N	51.43323670	7.66159380	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1198
3018	Hesse	82	DE	05	HE	\N	50.65205150	9.16243760	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1199
3019	Rhineland-Palatinate	82	DE	08	RP	\N	50.11834600	7.30895270	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1200
3020	Saarland	82	DE	09	SL	\N	49.39642340	7.02296070	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1201
3021	Saxony	82	DE	13	SN	\N	51.10454070	13.20173840	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1202
3022	Mafeteng District	122	LS	13	E	\N	-29.80410080	27.50261740	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q817342
3023	Mohale\\"s Hoek District	122	LS	15	F	\N	-30.14259170	27.46738450	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q839074
3024	Mokhotlong District	122	LS	16	J	\N	-29.25731930	28.95286450	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q817340
3025	Qacha\\"s Nek District	122	LS	17	H	\N	-30.11145650	28.67897900	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q850423
3026	Leribe District	122	LS	12	C	\N	-28.86380650	28.04788260	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q819987
3027	Quthing District	122	LS	18	G	\N	-30.40156870	27.70801330	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q839060
3028	Maseru District	122	LS	14	A	\N	-29.51656500	27.83114280	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q844921
3029	Butha-Buthe District	122	LS	11	B	\N	-28.76537540	28.24681480	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q535632
3030	Berea District	122	LS	10	D	\N	41.36616140	-81.85430260	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q737086
3031	Thaba-Tseka District	122	LS	19	K	\N	-29.52389750	28.60897520	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q817327
3032	Montserrado County	123	LR	14	MO	\N	6.55258150	-10.52961150	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q862608
3033	River Cess County	123	LR	18	RI	\N	5.90253280	-9.45615500	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q955095
3034	Bong County	123	LR	01	BG	\N	6.82950190	-9.36730840	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q877578
3035	Sinoe County	123	LR	10	SI	\N	5.49871000	-8.66005860	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1043644
3036	Grand Cape Mount County	123	LR	12	CM	\N	7.04677580	-11.07117580	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1047921
3037	Lofa County	123	LR	20	LO	\N	8.19111840	-9.72326730	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q870130
3038	River Gee County	123	LR	22	RG	\N	5.26048940	-7.87216000	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1047875
3039	Grand Gedeh County	123	LR	19	GG	\N	5.92220780	-8.22129790	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q950841
3040	Grand Bassa County	123	LR	11	GB	\N	6.23084520	-9.81249350	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1047895
3041	Bomi County	123	LR	15	BM	\N	6.75629260	-10.84514670	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q844127
3042	Maryland County	123	LR	13	MY	\N	39.04575490	-76.64127120	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q870138
3043	Margibi County	123	LR	17	MG	\N	6.51518750	-10.30488970	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1052737
3044	Gbarpolu County	123	LR	21	GP	\N	7.49526370	-10.08072980	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q592251
3045	Grand Kru County	123	LR	16	GK	\N	4.76138620	-8.22129790	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q574952
3046	Nimba	123	LR	09	NI	\N	7.61666670	-8.41666670	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q868497
3047	Ad Dhahirah	166	OM	09	ZA	\N	23.21616740	56.49074440	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1468596
3048	Al Batinah North	166	OM	11	BS	\N	24.34198460	56.72989040	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q4703564
3049	Al Batinah South	166	OM	02	BJ	\N	23.43149030	57.42397960	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q4703565
3050	Al Batinah Region	166	OM	02	BA	\N	24.34198460	56.72989040	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q264245
3051	Ash Sharqiyah Region	166	OM	04	SH	\N	22.71411960	58.53080640	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1106416
3052	Musandam	166	OM	07	MU	\N	26.19861440	56.24609490	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q372144
3053	Ash Sharqiyah North	166	OM	07	SS	\N	22.71411960	58.53080640	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q4501876
3054	Ash Sharqiyah South	166	OM	07	SJ	\N	22.01582490	59.32519220	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q4501894
3055	Muscat	166	OM	06	MA	\N	23.58803070	58.38287170	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q544762
3056	Al Wusta	166	OM	03	WU	\N	19.95710780	56.27568460	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q958518
3057	Dhofar	166	OM	08	ZU	\N	17.03221210	54.14252140	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1207752
3058	Ad Dakhiliyah	166	OM	01	DA	\N	22.85887580	57.53943560	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q792550
3059	Al Buraimi	166	OM	10	BU	\N	24.16714130	56.11422530	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q852039
3060	Ngamiland	29	BW	07	NG	\N	-19.19053210	23.00119890	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q3339267
3061	Ghanzi District	29	BW	03	GH	\N	-21.86523140	21.85685860	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q57571
3062	Kgatleng District	29	BW	05	KL	\N	-24.19704450	26.23046160	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q57593
3063	Southern District	29	BW	10	SO	\N	\N	\N	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q57609
3064	South-East District	29	BW	09	SE	\N	31.21637980	-82.35270440	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q57695
3065	North-West District	29	BW	11	NW	\N	39.34463070	-76.68542830	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q57617
3066	Kgalagadi District	29	BW	04	KG	\N	-24.75502850	21.85685860	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q57581
3067	Central District	29	BW	01	CE	\N	\N	\N	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q57525
3068	North-East District	29	BW	08	NE	\N	37.58844610	-94.68637820	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q57636
3069	Kweneng District	29	BW	06	KW	\N	-23.83672490	25.28375850	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q57599
3070	Collines Department	24	BJ	11	CO	\N	8.30222970	2.30244600	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q29141
3071	Kouffo Department	24	BJ	12	KO	\N	7.00358940	1.75388170	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q29173
3072	Donga Department	24	BJ	13	DO	\N	9.71918670	1.67606910	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q29161
3073	Zou Department	24	BJ	18	ZO	\N	7.34692680	2.06651970	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q29172
3074	Plateau Department	24	BJ	17	PL	\N	7.34451410	2.53960300	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q32108
3075	Mono Department	24	BJ	15	MO	\N	37.92186080	-118.95286450	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q29135
3076	Atakora Department	24	BJ	08	AK	\N	10.79549310	1.67606910	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q29154
3077	Alibori Department	24	BJ	07	AL	\N	10.96810930	2.77798130	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q29165
3078	Borgou Department	24	BJ	10	BO	\N	9.53408640	2.77798130	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q29136
3079	Atlantique Department	24	BJ	09	AQ	\N	6.65883910	2.22366670	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q29147
3080	Ouémé Department	24	BJ	16	OU	\N	6.61481520	2.49999180	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q29169
3081	Littoral Department	24	BJ	14	LI	\N	6.38069730	2.44063870	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q29158
3082	Machinga District	131	MW	28	MH	\N	-14.94072630	35.47819260	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q198585
3083	Zomba District	131	MW	23	ZO	\N	-15.37658570	35.33565180	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1058442
3084	Mwanza District	131	MW	25	MW	\N	-2.46711970	32.89868120	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q797933
3085	Nsanje District	131	MW	19	NS	\N	-16.72882020	35.17087410	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q198587
3086	Salima District	131	MW	22	SA	\N	-13.68095860	34.41982430	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q195353
3087	Chitipa district	131	MW	04	CT	\N	-9.70376550	33.27002530	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1044337
3088	Ntcheu District	131	MW	16	NU	\N	-14.90375380	34.77407930	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q797937
3089	Rumphi District	131	MW	21	RU	\N	-10.78515370	34.33103640	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1044312
3090	Dowa District	131	MW	07	DO	\N	-13.60412560	33.88577470	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q195356
3091	Karonga District	131	MW	08	KR	\N	-9.90363650	33.97500180	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q868819
3092	Central Region	131	MW	C	C	\N	\N	\N	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q860758
3093	Likoma District	131	MW	27	LK	\N	-12.05840050	34.73540310	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q740622
3094	Kasungu District	131	MW	09	KS	\N	-13.13670650	33.25879300	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q868778
3095	Nkhata Bay District	131	MW	17	NB	\N	-11.71850420	34.33103640	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1051505
3096	Balaka District	131	MW	26	BA	\N	-15.05065950	35.08285880	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q870044
3097	Dedza District	131	MW	06	DE	\N	-14.18945850	34.24215970	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q667153
3098	Thyolo District	131	MW	05	TH	\N	-16.12991770	35.12687810	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q722515
3099	Mchinji District	131	MW	13	MC	\N	-13.74015250	32.98883190	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q868792
3100	Nkhotakota District	131	MW	18	NK	\N	-12.75419610	34.24215970	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q687248
3101	Lilongwe District	131	MW	11	LI	\N	-14.04752280	33.61757700	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1058453
3102	Blantyre District	131	MW	24	BL	\N	-15.67785410	34.95066250	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1059262
3103	Mulanje District	131	MW	29	MU	\N	-15.93464340	35.52200120	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q509097
3104	Mzimba District	131	MW	15	MZ	\N	-11.74754520	33.52800720	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1045435
3105	Northern Region	131	MW	N	N	\N	\N	\N	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q868827
3106	Southern Region	131	MW	S	S	\N	32.75049570	-97.33154760	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q868784
3107	Chikwawa District	131	MW	02	CK	\N	-16.19584460	34.77407930	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q722509
3108	Phalombe District	131	MW	30	PH	\N	-15.70920380	35.65328480	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q538991
3109	Chiradzulu District	131	MW	03	CR	\N	-15.74231510	35.25879640	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q722501
3110	Mangochi District	131	MW	12	MG	\N	-14.13882480	35.03881640	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q722505
3111	Ntchisi District	131	MW	20	NI	\N	-13.28419920	33.88577470	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q798235
3112	Kénédougou Province	35	BF	54	KEN	\N	11.39193950	-4.97665400	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1150901
3113	Namentenga Province	35	BF	64	NAM	\N	13.08125840	-0.52578230	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1142044
3114	Sahel Region	35	BF	12	12	\N	14.10008650	-0.14949880	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q665514
3115	Centre-Ouest Region	35	BF	06	06	\N	11.87984660	-2.30244600	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q850075
3116	Nahouri Province	35	BF	65	NAO	\N	11.25022670	-1.13530200	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1142003
3117	Passoré Province	35	BF	34	PAS	\N	12.88812210	-2.22366670	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1142008
3118	Zoundwéogo Province	35	BF	44	ZOU	\N	11.61411740	-0.98206680	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q227059
3119	Sissili Province	35	BF	72	SIS	\N	11.24412190	-2.22366670	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q964281
3120	Banwa Province	35	BF	46	BAN	\N	12.13230530	-4.15137640	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q674664
3121	Bougouriba Province	35	BF	48	BGR	\N	10.87226460	-3.33889170	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q676641
3122	Gnagna Province	35	BF	21	GNA	\N	12.89749920	0.07467670	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1074144
3123	Mouhoun	35	BF	63	MOU	\N	12.14323810	-3.33889170	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1142050
3124	Yagha Province	35	BF	75	YAG	\N	13.35761570	0.75328090	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1074466
3125	Plateau-Central Region	35	BF	11	11	\N	12.25376480	-0.75328090	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q862606
3126	Sanmatenga Province	35	BF	70	SMT	\N	13.35653040	-1.05861350	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1142039
3127	Centre-Nord Region	35	BF	05	05	\N	13.17244640	-0.90566230	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q850064
3128	Tapoa Province	35	BF	42	TAP	\N	12.24970720	1.67606910	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q621983
3129	Houet Province	35	BF	51	HOU	\N	11.13204470	-4.23333550	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1074161
3130	Zondoma Province	35	BF	78	ZON	\N	13.11659260	-2.42087130	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q219859
3131	Boulgou	35	BF	49	BLG	\N	11.43367660	-0.37483540	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q895097
3132	Komondjari Province	35	BF	56	KMD	\N	12.71265270	0.67730460	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1074479
3133	Koulpélogo Province	35	BF	59	KOP	\N	11.52476740	0.14949880	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q934923
3134	Tuy Province	35	BF	74	TUI	\N	38.88868400	-77.00471900	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q627844
3135	Ioba Province	35	BF	52	IOB	\N	11.05620340	-3.01757120	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1074154
3136	Centre	35	BF	03	03	\N	\N	\N	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q515655
3137	Sourou Province	35	BF	73	SOR	\N	13.34180300	-2.93757390	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q558703
3138	Boucle du Mouhoun Region	35	BF	01	01	\N	12.41660000	-3.41955270	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q527093
3139	Séno Province	35	BF	71	SEN	\N	14.00722340	-0.07467670	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1061214
3140	Sud-Ouest Region	35	BF	13	13	\N	10.42314930	-3.25836260	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q429149
3141	Oubritenga Province	35	BF	68	OUB	\N	12.70960870	-1.44346900	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1142026
3142	Nayala Province	35	BF	66	NAY	\N	12.69645580	-3.01757120	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1141776
3143	Gourma Province	35	BF	50	GOU	\N	12.16244730	0.67730460	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q432317
3144	Oudalan Province	35	BF	33	OUD	\N	14.47190200	-0.45023680	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q514173
3145	Ziro Province	35	BF	77	ZIR	\N	11.60949950	-1.90992380	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q206019
3146	Kossi Province	35	BF	58	KOS	\N	12.96045800	-3.90626880	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1074485
3147	Kourwéogo Province	35	BF	60	KOW	\N	12.70774950	-1.75388170	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q661376
3148	Ganzourgou Province	35	BF	20	GAN	\N	12.25376480	-0.75328090	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q182889
3149	Centre-Sud Region	35	BF	07	07	\N	11.52289110	-1.05861350	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q853405
3150	Yatenga Province	35	BF	76	YAT	\N	13.62493440	-2.38136210	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1074521
3151	Loroum Province	35	BF	62	LOR	\N	13.81298140	-2.06651970	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1142054
3152	Bazèga Province	35	BF	47	BAZ	\N	11.97676920	-1.44346900	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q619764
3153	Cascades Region	35	BF	02	02	\N	10.40729920	-4.56244260	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q850043
3154	Sanguié Province	35	BF	36	SNG	\N	12.15018610	-2.69838680	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1142014
3155	Bam Province	35	BF	15	BAM	\N	13.44613300	-1.59839590	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q620710
3156	Noumbiel Province	35	BF	67	NOU	\N	9.84409460	-2.97755580	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q646647
3157	Kompienga Province	35	BF	57	KMP	\N	11.52383620	0.75328090	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q1142059
3158	Est Region	35	BF	57	08	\N	12.43655260	0.90566230	2019-10-05 23:18:52	2022-08-31 15:52:51	1	Q850088
3159	Léraba Province	35	BF	61	LER	\N	10.66487850	-5.31025050	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q977607
3160	Balé Province	35	BF	45	BAL	\N	11.78206020	-3.01757120	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q805913
3161	Kouritenga Province	35	BF	28	KOT	\N	12.16318130	-0.22446620	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q1141767
3162	Centre-Est Region	35	BF	28	04	\N	11.52476740	-0.14949880	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q543006
3163	Poni Province	35	BF	69	PON	\N	10.33259960	-3.33889170	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q953657
3164	Nord Region, Burkina Faso	35	BF	69	10	\N	13.71825200	-2.30244600	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q502320
3165	Hauts-Bassins Region	35	BF	09	09	\N	11.49420030	-4.23333550	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q845303
3166	Soum Province	35	BF	40	SOM	\N	14.09628410	-1.36621600	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q385973
3167	Comoé Province	35	BF	55	COM	\N	10.40729920	-4.56244260	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q1074496
3168	Kadiogo Province	35	BF	53	KAD	\N	12.34258970	-1.44346900	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q1074530
3169	Islamabad Capital Territory	167	PK	08	IS	\N	33.72049970	73.04052770	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q848613
3170	Gilgit-Baltistan	167	PK	07	GB	\N	35.80256670	74.98318080	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q200697
3171	Khyber Pakhtunkhwa	167	PK	03	KP	\N	34.95262050	72.33111300	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q183314
3172	Azad Kashmir	167	PK	06	JK	\N	33.92590550	73.78103340	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q200130
3173	Federally Administered Tribal Areas	167	PK	01	TA	\N	32.66747600	69.85974060	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q208270
3174	Balochistan	167	PK	02	BA	\N	28.49073320	65.09577920	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q163239
3175	Sindh	167	PK	05	SD	\N	25.89430180	68.52471490	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q37211
3176	Punjab	167	PK	04	PB	\N	31.14713050	75.34121790	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q4478
3177	Al Rayyan Municipality	179	QA	06	RA	\N	25.25225510	51.43887130	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q311272
3178	Al-Shahaniya	179	QA	14	SH	\N	25.41063860	51.18460250	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q12188815
3179	Al Wakrah	179	QA	10	WA	\N	25.16593140	51.59755240	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q310893
3180	Madinat ash Shamal	179	QA	08	MS	\N	26.11827430	51.21572650	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q310872
3181	Doha	179	QA	01	DA	\N	25.28544730	51.53103980	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q3861
3182	Al Daayen	179	QA	01	ZA	\N	25.57845590	51.48213870	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q310786
3183	Al Khor	179	QA	04	KH	\N	25.68040780	51.49685020	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q1156471
3184	Umm Salal Municipality	179	QA	09	US	\N	25.48752420	51.39656800	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q990414
3185	Rumonge Province	36	BI	26	RM	\N	-3.97540490	29.43880140	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q20669646
3186	Muyinga Province	36	BI	18	MY	\N	-2.77935110	30.29741990	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q822571
3187	Mwaro Province	36	BI	23	MW	\N	-3.50259180	29.64991620	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q847718
3188	Makamba Province	36	BI	17	MA	\N	-4.32570620	29.69626770	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q823740
3189	Rutana Province	36	BI	20	RT	\N	-3.87915230	30.06652360	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q822566
3190	Cibitoke Province	36	BI	12	CI	\N	-2.81028970	29.18557850	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q505596
3191	Ruyigi Province	36	BI	21	RY	\N	-3.44620700	30.25127280	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q822578
3192	Kayanza Province	36	BI	15	KY	\N	-3.00779810	29.64991620	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q720848
3193	Muramvya Province	36	BI	22	MU	\N	-3.28983980	29.64991620	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q671086
3194	Karuzi Province	36	BI	14	KR	\N	-3.13403470	30.11273500	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q735463
3195	Kirundo Province	36	BI	16	KI	\N	-2.57628820	30.11273500	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q600840
3196	Bubanza Province	36	BI	09	BB	\N	-3.15724030	29.37149090	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q460538
3197	Gitega Province	36	BI	13	GI	\N	-3.49290510	29.92779470	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q720843
3198	Bujumbura Mairie Province	36	BI	24	BM	\N	-3.38841410	29.34826460	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q1816580
3199	Ngozi Province	36	BI	19	NG	\N	-2.89582430	29.88152030	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q720852
3200	Bujumbura Rural Province	36	BI	25	BL	\N	-3.50901440	29.46435900	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q645043
3201	Cankuzo Province	36	BI	11	CA	\N	-3.15277880	30.61998950	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q645033
3202	Bururi Province	36	BI	10	BR	\N	-3.90068510	29.51077080	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q431385
3203	Flores	235	UY	06	FS	\N	-33.57337530	-56.89450280	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16578
3204	San José	235	UY	16	SJ	\N	37.34929680	-121.90560490	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16579
3205	Artigas	235	UY	01	AR	\N	-30.61751120	-56.95945590	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16603
3206	Maldonado	235	UY	09	MA	\N	-34.55979320	-54.86285520	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q331196
3207	Rivera	235	UY	13	RV	\N	-31.48174210	-55.24357590	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16609
3208	Colonia	235	UY	04	CO	\N	-34.12946780	-57.66051840	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16580
3209	Durazno	235	UY	05	DU	\N	-33.02324540	-56.02846440	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16591
3210	Río Negro	235	UY	12	RN	\N	-32.76763560	-57.42952070	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16596
3211	Cerro Largo	235	UY	03	CL	\N	-32.44110320	-54.35217530	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16575
3212	Paysandú	235	UY	11	PA	\N	-32.06673660	-57.33647890	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16576
3213	Canelones	235	UY	02	CA	\N	-34.54087170	-55.93076000	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16577
3214	Treinta y Tres	235	UY	19	TT	\N	-33.06850860	-54.28586270	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16610
3215	Lavalleja	235	UY	08	LA	\N	-33.92261750	-54.97657940	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q460435
3216	Rocha	235	UY	14	RO	\N	-33.96900810	-54.02148500	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16582
3217	Florida	235	UY	07	FD	\N	28.03594950	-82.45792890	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16593
3218	Montevideo	235	UY	10	MO	\N	-34.81815870	-56.21382560	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16594
3219	Soriano	235	UY	17	SO	\N	-33.51027920	-57.74981030	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16584
3220	Salto	235	UY	15	SA	\N	-31.38802800	-57.96124550	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16595
3221	Tacuarembó	235	UY	18	TA	\N	-31.72068370	-55.98598870	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q16587
3222	Kafr el-Sheikh	65	EG	21	KFS	\N	31.30854440	30.80394740	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30946
3223	Cairo	65	EG	11	C	\N	29.95375640	31.53700030	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30805
3224	Damietta	65	EG	20	DT	\N	31.36257990	31.67393710	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30644
3225	Aswan	65	EG	16	ASN	\N	23.69664980	32.71813750	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q29937
3226	Sohag	65	EG	24	SHG	\N	26.69383400	32.17460500	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30669
3227	North Sinai	65	EG	27	SIN	\N	30.28236500	33.61757700	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30662
3228	Monufia	65	EG	09	MNF	\N	30.59724550	30.98763210	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30786
3229	Port Said	65	EG	19	PTS	\N	31.07586060	32.26538870	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q31079
3230	Beni Suef	65	EG	18	BNS	\N	28.89388370	31.44561790	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30683
3231	Matrouh	65	EG	22	MT	\N	29.56963500	26.41938900	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30682
3232	Qalyubia	65	EG	12	KB	\N	30.32923680	31.21684660	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q31075
3233	Suez	65	EG	15	SUZ	\N	29.36822550	32.17460500	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q31070
3234	Gharbia	65	EG	05	GH	\N	30.87535560	31.03351000	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30835
3235	Alexandria	65	EG	06	ALX	\N	30.87605680	29.74260400	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q29943
3236	Asyut	65	EG	17	AST	\N	27.21338310	31.44561790	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q29965
3237	South Sinai	65	EG	26	JS	\N	29.31018280	34.15319470	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30815
3238	Faiyum	65	EG	04	FYM	\N	29.30840210	30.84284970	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30656
3239	Giza	65	EG	08	GZ	\N	28.76662160	29.23207840	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30832
3240	Red Sea	65	EG	02	BA	\N	24.68263160	34.15319470	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30831
3241	Beheira	65	EG	03	BH	\N	30.84809860	30.34355060	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30630
3242	Luxor	65	EG	28	LX	\N	25.39444440	32.49200880	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30797
3243	Minya	65	EG	10	MN	\N	28.28472900	30.52790960	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30675
3244	Ismailia	65	EG	07	IS	\N	30.58309340	32.26538870	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q31067
3245	Dakahlia	65	EG	01	DK	\N	31.16560440	31.49131820	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q31068
3246	New Valley	65	EG	13	WAD	\N	24.54556380	27.17353160	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q30650
3247	Qena	65	EG	23	KN	\N	26.23460330	32.98883190	2019-10-05 23:18:53	2022-08-31 15:52:51	1	Q31065
3248	Agalega Islands	140	MU	21	AG	dependency	-10.40000000	56.61666670	2019-10-05 23:18:53	2022-11-06 19:55:16	1	Q196042
3249	Rodrigues Island	140	MU	23	RO	dependency	-19.72453850	63.42721850	2019-10-05 23:18:53	2022-11-06 19:55:16	1	Q208668
3250	Pamplemousses	140	MU	16	PA	district	-20.11360080	57.57592600	2019-10-05 23:18:53	2022-11-06 19:55:16	1	Q934126
3251	Saint Brandon Islands	140	MU	22	CC	dependency	-16.58333300	59.61666700	2019-10-05 23:18:53	2022-11-06 19:55:16	1	Q511859
3253	Moka	140	MU	15	MO	district	-20.23997820	57.57592600	2019-10-05 23:18:53	2022-11-06 19:55:16	1	Q911643
3254	Flacq	140	MU	13	FL	district	-20.22578360	57.71192740	2019-10-05 23:18:53	2022-11-06 19:55:16	1	Q911651
3257	Savanne	140	MU	20	SA	district	-20.47395300	57.48535610	2019-10-05 23:18:53	2022-11-06 19:55:16	1	Q1053600
3259	Black River	140	MU	12	BL	district	-20.37084920	57.39486490	2019-10-05 23:18:53	2022-11-06 19:55:16	1	Q873740
3260	Port Louis	140	MU	18	PL	district	-20.16089120	57.50122220	2019-10-05 23:18:53	2022-11-06 19:55:16	1	Q960645
3261	Rivière du Rempart	140	MU	19	RR	district	-20.05609830	57.65523890	2019-10-05 23:18:53	2022-11-06 19:55:16	1	Q1053565
3263	Plaines Wilhems	140	MU	17	PW	district	-20.30548720	57.48535610	2019-10-05 23:18:53	2022-11-06 19:55:16	1	Q1053595
3264	Grand Port	140	MU	14	GP	district	-20.38515460	57.66657420	2019-10-05 23:18:53	2022-11-06 19:55:16	1	Q911635
3265	Guelmim	149	MA	10	GUE	province	28.98836590	-10.05274980	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q923219
3266	Aousserd (EH)	149	MA	12	AOU	province	22.55215380	-14.32973530	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q972665
3267	Al Hoceïma	149	MA	01	HOC	province	35.24455890	-3.93174680	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q1969619
3268	Larache	149	MA	01	LAR	province	35.17442710	-6.14739640	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q1759567
3269	Ouarzazate	149	MA	08	OUA	province	30.93354360	-6.93701600	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q1629229
3270	Boulemane	149	MA	03	BOM	province	33.36251590	-4.73033970	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q895063
3271	L\\"Oriental	149	MA	02	02	region	37.06968300	-94.51227700	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q23048167
3272	Béni Mellal	149	MA	05	BEM	province	32.34244300	-6.37579900	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q1019461
3274	Chichaoua	149	MA	07	CHI	province	31.53835810	-8.76463880	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q1072085
3275	Boujdour (EH)	149	MA	11	BOD	province	26.12524930	-14.48473470	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q895028
3276	Khémisset	149	MA	04	KHE	province	33.81537040	-6.05733020	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q1740735
3277	Tiznit	149	MA	09	TIZ	province	29.69339200	-9.73215700	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q2339589
3278	Béni Mellal-Khénifra	149	MA	05	05	region	32.57191840	-6.06791940	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q19953016
3279	Sidi Kacem	149	MA	04	SIK	province	34.22601720	-5.71291640	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q1969542
3280	El Jadida	149	MA	06	JDI	province	33.23163260	-8.50071160	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q599606
3281	Nador	149	MA	02	NAD	province	34.91719260	-2.85771050	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q367864
3282	Settat	149	MA	06	SET	province	32.99242420	-7.62226650	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q1523840
3283	Zagora	149	MA	08	ZAG	province	30.57860930	-5.89871390	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q2265471
3284	Médiouna	149	MA	06	MED	province	33.45409390	-7.51660200	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q1957680
3285	Berkane	149	MA	02	BER	province	34.88408760	-2.34188700	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q820802
3286	Tan-Tan (EH-partial)	149	MA	10	TNT	province	28.03012000	-11.16173560	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q972535
3287	Nouaceur	149	MA	04	NOU	province	33.36703930	-7.57325370	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q516261
3288	Marrakesh-Safi	149	MA	07	07	region	31.73308330	-8.13385580	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q19951125
3289	Sefrou	149	MA	03	SEF	province	33.83052440	-4.83531540	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q1969535
3290	Drâa-Tafilalet	149	MA	08	08	region	31.14995380	-5.39395510	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q19950954
3291	El Hajeb	149	MA	03	HAJ	province	33.68573500	-5.36778440	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q2540509
3292	Es-Semara (EH-partial)	149	MA	11	ESM	province	26.74185600	-11.67836710	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q1366420
3293	Laâyoune (EH)	149	MA	11	LAA	province	27.15003840	-13.19907580	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q631610
3294	Inezgane-Ait Melloul	149	MA	09	INE	prefecture	30.35090980	-9.38951100	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q1662264
3295	Souss-Massa	149	MA	09	09	region	30.27506110	-8.13385580	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q20652586
3296	Taza	149	MA	03	TAZ	province	34.27889530	-3.58126920	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q1819589
3297	Assa-Zag (EH-partial)	149	MA	10	ASZ	province	28.14023950	-9.72326730	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q180994
3298	Laâyoune-Sakia El Hamra (EH-partial)	149	MA	11	11	region	27.86831940	-11.98046130	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q19951088
3299	Errachidia	149	MA	08	ERR	province	31.90512750	-4.72775280	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q2024447
3300	Fahs-Anjra	149	MA	01	FAH	province	35.76019920	-5.66683060	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q2013946
3301	Figuig	149	MA	02	FIG	province	32.10926130	-1.22980600	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q1412034
3302	Chtouka-Ait Baha	149	MA	06	CHT	province	30.10724220	-9.27855830	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q2424820
3303	Casablanca-Settat	149	MA	06	06	region	33.21608720	-7.43813550	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q19843788
3304	Benslimane	149	MA	06	BES	province	33.61896980	-7.13055360	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q15198365
3305	Guelmim-Oued Noun (EH-partial)	149	MA	10	10	region	28.48442810	-10.08072980	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q19951051
3306	Dakhla-Oued Ed-Dahab (EH)	149	MA	12	12	region	22.73378920	-14.28611160	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q21235104
3307	Jerada	149	MA	02	JRA	province	34.30617910	-2.17941360	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q1687516
3308	Kénitra	149	MA	04	KEN	province	34.25405030	-6.58901660	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q284878
3309	El Kelâa des Sraghna	149	MA	07	KES	province	32.05227670	-7.35165580	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q970179
3310	Chefchaouen	149	MA	01	CHE	province	35.01817200	-5.14320680	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q2354922
3311	Safi	149	MA	07	SAF	province	32.29898720	-9.10134980	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q637778
3312	Tata	149	MA	09	TAT	province	29.75087700	-7.97563430	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q546437
3313	Fès-Meknès	149	MA	03	03	region	34.06252900	-4.72775280	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q19951027
3314	Taroudannt	149	MA	09	TAR	province	30.47271260	-8.87487650	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q2092298
3315	Moulay Yacoub	149	MA	03	MOU	province	34.08744790	-5.17840190	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q1950226
3316	Essaouira	149	MA	07	ESI	province	31.50849260	-9.75950410	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q1368543
3317	Khénifra	149	MA	05	KHN	province	32.93404710	-5.66157100	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q1820589
3318	Tétouan	149	MA	01	TET	province	35.58889950	-5.36255160	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q1257443
3319	Oued Ed-Dahab (EH)	149	MA	12	OUD	province	22.73378920	-14.28611160	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q2410368
3320	Al Haouz	149	MA	07	HAO	province	31.29567290	-7.87216000	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q2150989
3321	Azilal	149	MA	05	AZI	province	32.00426200	-6.57833870	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q793763
3322	Taourirt	149	MA	02	TAI	province	34.21259800	-2.69838680	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q2165392
3323	Taounate	149	MA	03	TAO	province	34.53691700	-4.63986930	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q1969671
3324	Tanger-Tétouan-Al Hoceïma	149	MA	01	01	region	35.26295580	-5.56172790	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q19951300
3325	Ifrane	149	MA	03	IFR	province	33.52280620	-5.11095520	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q2301648
3326	Khouribga	149	MA	05	KHO	province	32.88602300	-6.92086550	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q1740686
3327	Cabo Delgado Province	150	MZ	01	P	\N	-12.33354740	39.32062410	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q466538
3328	Zambezia Province	150	MZ	09	Q	\N	-16.56389870	36.60939260	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q622803
3329	Gaza Province	150	MZ	02	G	\N	-23.02219280	32.71813750	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q466526
3330	Inhambane Province	150	MZ	03	I	\N	-22.85279970	34.55087580	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q466547
3331	Sofala Province	150	MZ	05	S	\N	-19.20390730	34.86241660	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q622801
3332	Maputo Province	150	MZ	04	L	\N	-25.25698760	32.53727410	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q379658
3333	Niassa Province	150	MZ	07	A	\N	-12.78262020	36.60939260	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q622799
3334	Tete Province	150	MZ	08	T	\N	-15.65960560	32.71813750	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q605787
3335	Maputo	150	MZ	11	MPM	\N	-25.96924800	32.57317460	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q3889
3336	Nampula Province	150	MZ	06	N	\N	-14.76049310	39.32062410	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q622794
3337	Manica Province	150	MZ	10	B	\N	-19.50597870	33.43835300	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q622792
3338	Hodh Ech Chargui	139	MR	01	01	region	18.67370260	-7.09287700	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q12621
3339	Brakna	139	MR	05	05	region	17.23175610	-13.17403480	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q12632
3340	Tiris Zemmour	139	MR	11	11	region	24.57737640	-9.90181310	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q859567
3341	Gorgol	139	MR	04	04	region	15.97173570	-12.62162110	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q859831
3342	Inchiri	139	MR	12	12	region	20.02805610	-15.40680790	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q850022
3343	Nouakchott-Nord	139	MR	14	14	region	18.11302050	-15.89949560	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q20669647
3344	Adrar	139	MR	07	07	region	19.86521760	-12.80547530	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q366626
3345	Tagant	139	MR	09	09	region	18.54675270	-9.90181310	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q843903
3346	Dakhlet Nouadhibou	139	MR	08	08	region	20.59855880	-16.25221430	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q859573
3347	Nouakchott-Sud	139	MR	15	15	region	17.97092880	-15.94648740	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q20669653
3348	Trarza	139	MR	06	06	region	17.86649640	-14.65878210	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q859581
3349	Assaba	139	MR	03	03	region	16.77595580	-11.52480550	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q738546
3350	Guidimaka	139	MR	10	10	region	15.25573310	-12.25479190	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q768119
3351	Hodh El Gharbi	139	MR	02	02	region	16.69121490	-9.54509740	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q850435
3352	Nouakchott-Ouest	139	MR	13	13	region	18.15113570	-15.99349100	2019-10-05 23:18:54	2022-05-09 00:20:26	1	Q20669651
3353	Western Tobago	223	TT	03	WTO	\N	11.18970720	-60.77954520	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q13365874
3354	Couva-Tabaquite-Talparo Regional Corporation	223	TT	CTT	CTT	\N	10.42971450	-61.37352100	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q2679127
3355	Eastern Tobago	223	TT	11	ETO	\N	11.29793480	-60.55885240	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q13365873
3356	Rio Claro-Mayaro Regional Corporation	223	TT	11	MRC	\N	10.24128320	-61.09372060	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q2487249
3357	San Juan-Laventille Regional Corporation	223	TT	SJL	SJL	\N	10.69085780	-61.45522130	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q979608
3358	Tunapuna-Piarco Regional Corporation	223	TT	TUP	TUP	\N	10.68590960	-61.30352480	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q1899163
3359	San Fernando	223	TT	10	SFO	\N	34.28194610	-118.43897190	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q1023712
3360	Point Fortin	223	TT	PTF	PTF	\N	10.17027370	-61.67133860	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q786957
3361	Sangre Grande Regional Corporation	223	TT	SGE	SGE	\N	10.58529390	-61.13158130	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q290292
3362	Arima	223	TT	01	ARI	\N	46.79316040	-71.25843110	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q661405
3363	Port of Spain	223	TT	05	POS	\N	10.66031960	-61.50856250	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q39178
3364	Siparia Regional Corporation	223	TT	SIP	SIP	\N	10.12456260	-61.56032440	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q2679119
3365	Penal-Debe Regional Corporation	223	TT	PED	PED	\N	10.13374020	-61.44354740	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q2056273
3366	Chaguanas	223	TT	CHA	CHA	\N	10.51683870	-61.41144820	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q1444575
3367	Diego Martin Regional Corporation	223	TT	DMN	DMN	\N	10.73622860	-61.55448360	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q2679107
3368	Princes Town Regional Corporation	223	TT	PRT	PRT	\N	10.17867460	-61.28019960	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q2228167
3369	Mary Region	226	TM	05	M	\N	36.94816230	62.45041540	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q487401
3370	Lebap Region	226	TM	04	L	\N	38.12724620	64.71624150	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q487389
3371	Ashgabat	226	TM	S	S	\N	37.96007660	58.32606290	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q23438
3372	Balkan Region	226	TM	02	B	\N	41.81014720	21.09373110	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q486073
3373	Daşoguz Region	226	TM	03	D	\N	41.83687370	59.96519040	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q487393
3374	Ahal Region	226	TM	01	A	\N	38.63993980	59.47209040	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q399899
3375	Beni Department	27	BO	03	B	\N	-14.37827470	-65.09577920	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q233169
3376	Oruro Department	27	BO	05	O	\N	-18.57115790	-67.76159830	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q1061368
3377	Santa Cruz Department	27	BO	08	S	\N	-16.74760370	-62.07509980	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q235106
3378	Tarija Department	27	BO	09	T	\N	-21.58315950	-63.95861110	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q233933
3379	Pando Department	27	BO	06	N	\N	-10.79889010	-66.99880110	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q235362
3380	La Paz Department	27	BO	04	L	\N	\N	\N	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q272784
3381	Cochabamba Department	27	BO	02	C	\N	-17.56816750	-65.47573600	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q233917
3382	Chuquisaca Department	27	BO	01	H	\N	-20.02491440	-64.14782360	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q235110
3383	Potosí Department	27	BO	07	P	\N	-20.62471300	-66.99880110	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q238079
3384	Saint George Parish	188	VC	04	04	\N	42.95760900	-81.32670500	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q2300294
3385	Saint Patrick Parish	188	VC	05	05	\N	39.75091860	-94.84505560	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q1864637
3386	Saint Andrew Parish	188	VC	02	02	\N	43.02429990	-81.20250000	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q2305115
3387	Saint David Parish	188	VC	03	03	\N	43.85230950	-79.52366540	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q2412394
3388	Grenadines Parish	188	VC	06	06	\N	13.01229650	-61.22773010	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q2545297
3389	Charlotte Parish	188	VC	01	01	\N	13.21754510	-61.16362440	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q2075188
3390	Sharjah Emirate	231	AE	06	SH	\N	25.07539740	55.75784030	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q188810
3391	Dubai	231	AE	03	DU	\N	25.20484930	55.27078280	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q613
3392	Umm al-Quwain	231	AE	07	UQ	\N	25.54263240	55.54753480	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q175021
3393	Fujairah	231	AE	04	FU	\N	25.12880990	56.32648490	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q4091
3394	Ras al-Khaimah	231	AE	05	RK	\N	25.67413430	55.98041730	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q170024
3395	Ajman Emirate	231	AE	02	AJ	\N	25.40521650	55.51364330	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q159477
3396	Abu Dhabi Emirate	231	AE	01	AZ	\N	24.45388400	54.37734380	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q187712
3397	districts of Republican Subordination	217	TJ	RR	RA	\N	39.08579020	70.24083250	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q633490
3398	Khatlon Province	217	TJ	02	KT	\N	37.91135620	69.09702300	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q633511
3399	Gorno-Badakhshan Autonomous Province	217	TJ	01	GB	\N	38.41273200	73.08774900	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q207319
3400	Sughd Province	217	TJ	03	SU	\N	39.51553260	69.09702300	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q241582
3402	Yilan	216	TW	03	ILA	county	24.70210730	121.73775020	2019-10-05 23:18:54	2021-11-27 16:34:03	1	Q237258
3403	Penghu	216	TW	03	PEN	county	23.57118990	119.57931570	2019-10-05 23:18:54	2021-11-27 16:36:24	1	Q198525
3404	Changhua	216	TW	03	CHA	county	24.05179630	120.51613520	2019-10-05 23:18:54	2021-11-27 16:34:03	1	Q133865
3405	Pingtung	216	TW	03	PIF	county	22.55197590	120.54875970	2019-10-05 23:18:54	2021-11-27 16:36:24	1	Q194989
3406	Taichung	216	TW	03	TXG	special municipality	24.14773580	120.67364820	2019-10-05 23:18:54	2021-11-27 16:36:24	1	Q245023
3407	Nantou	216	TW	03	NAN	county	23.96099810	120.97186380	2019-10-05 23:18:54	2021-11-27 16:35:49	1	Q82357
3408	Chiayi	216	TW	03	CYI	city	23.45184280	120.25546150	2019-10-05 23:18:54	2021-11-27 16:34:03	1	Q166977
3410	Taitung	216	TW	03	TTT	county	22.79724470	121.07137020	2019-10-05 23:18:54	2021-11-27 16:36:24	1	Q249904
3411	Hualien	216	TW	03	HUA	county	23.98715890	121.60157140	2019-10-05 23:18:54	2021-11-27 16:34:03	1	Q249868
3412	Kaohsiung	216	TW	02	KHH	special municipality	22.62727840	120.30143530	2019-10-05 23:18:54	2021-11-27 16:35:49	1	Q181557
3413	Miaoli	216	TW	02	MIA	county	24.56015900	120.82142650	2019-10-05 23:18:54	2021-11-27 16:35:49	1	Q63706
3415	Kinmen	216	TW	02	KIN	county	24.34877920	118.32856440	2019-10-05 23:18:54	2021-11-27 16:35:49	1	Q249870
3416	Yunlin	216	TW	02	YUN	county	23.70920330	120.43133730	2019-10-05 23:18:54	2021-11-27 16:36:24	1	Q153221
3417	Hsinchu	216	TW	02	HSZ	city	24.81382870	120.96747980	2019-10-05 23:18:54	2021-11-27 16:34:03	1	Q249994
3418	Chiayi	216	TW	02	CYQ	county	23.48007510	120.44911130	2019-10-05 23:18:54	2021-11-27 16:34:03	1	Q249995
3419	Taoyuan	216	TW	02	TAO	special municipality	24.99362810	121.30097980	2019-10-05 23:18:54	2021-11-27 16:36:24	1	Q115256
3420	Lienchiang	216	TW	02	LIE	county	26.15055560	119.92888890	2019-10-05 23:18:54	2021-11-27 16:35:49	1	Q249872
3421	Tainan	216	TW	02	TNN	special municipality	22.99972810	120.22702770	2019-10-05 23:18:54	2021-11-27 16:36:24	1	Q140631
3422	Taipei	216	TW	03	TPE	special municipality	25.03296940	121.56541770	2019-10-05 23:18:54	2021-11-27 16:36:24	1	Q1867
3423	Hsinchu	216	TW	03	HSQ	county	24.83872260	121.01772460	2019-10-05 23:18:54	2021-11-27 16:34:03	1	Q74054
3424	Northern Red Sea Region	68	ER	06	SK	\N	16.25839970	38.82054540	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q27910
3425	Anseba Region	68	ER	01	AN	\N	16.47455310	37.80876930	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q569468
3426	Maekel Region	68	ER	05	MA	\N	15.35514090	38.86236830	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q27710
3427	Debub Region	68	ER	02	DU	\N	14.94786920	39.15436770	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q27728
3428	Gash-Barka Region	68	ER	04	GB	\N	15.40688250	37.63866220	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q873012
3429	Southern Red Sea Region	68	ER	03	DK	\N	13.51371030	41.76064720	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q27928
3430	Southern Peninsula Region	100	IS	43	2	\N	63.91548030	-22.36496670	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q212768
3431	Capital Region	100	IS	39	1	\N	38.56569570	-92.18169490	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q203304
3432	Westfjords	100	IS	44	4	\N	65.91961500	-21.88117640	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q727267
3433	Eastern Region	100	IS	38	7	\N	\N	\N	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q220663
3434	Southern Region	100	IS	42	8	\N	\N	\N	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q204796
3435	Northwestern Region	100	IS	41	5	\N	41.91339320	-73.04716880	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q210866
3436	Western Region	100	IS	45	3	\N	\N	\N	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q221791
3437	Northeastern Region	100	IS	40	6	\N	43.29942850	-74.21793260	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q241551
3438	Río Muni	67	GQ	40	C	\N	1.46106060	9.67868940	2019-10-05 23:18:54	2022-08-31 15:52:51	1	Q845368
3439	Kié-Ntem Province	67	GQ	07	KN	\N	2.02809300	11.07117580	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q853393
3440	Wele-Nzas Province	67	GQ	09	WN	\N	1.41661620	11.07117580	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q853400
3441	Litoral Province	67	GQ	08	LI	\N	1.57502440	9.81249350	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q203873
3442	Insular Region	67	GQ	08	I	\N	37.09024000	-95.71289100	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q3040071
3443	Bioko Sur Province	67	GQ	05	BS	\N	3.42097850	8.61606740	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q845817
3444	Annobón Province	67	GQ	03	AN	\N	-1.42687820	5.63528010	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q3736616
3445	Centro Sur Province	67	GQ	06	CS	\N	1.34360840	10.43965600	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q845823
3446	Bioko Norte Province	67	GQ	04	BN	\N	3.65950720	8.79218360	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q845834
3447	Chihuahua	142	MX	06	CHH	state	28.63299570	-106.06910040	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q655
3448	Oaxaca	142	MX	20	OAX	state	17.07318420	-96.72658890	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q34110
3449	Sinaloa	142	MX	25	SIN	state	25.17210910	-107.47951730	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q80252
3450	Estado de México	142	MX	15	MEX	state	23.63450100	-102.55278400	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q82112
3451	Chiapas	142	MX	05	CHP	state	16.75693180	-93.12923530	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q60123
3452	Nuevo León	142	MX	19	NLE	state	25.59217200	-99.99619470	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q15282
3453	Durango	142	MX	10	DUR	state	37.27528000	-107.88006670	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q79918
3454	Tabasco	142	MX	27	TAB	state	17.84091730	-92.61892730	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q80914
3455	Querétaro	142	MX	22	QUE	state	20.58879320	-100.38988810	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q79754
3456	Aguascalientes	142	MX	01	AGU	state	21.88525620	-102.29156770	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q79952
3457	Baja California	142	MX	02	BCN	state	30.84063380	-115.28375850	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q58731
3458	Tlaxcala	142	MX	29	TLA	state	19.31815400	-98.23749540	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q82681
3459	Guerrero	142	MX	12	GRO	state	17.43919260	-99.54509740	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q60158
3460	Baja California Sur	142	MX	03	BCS	state	26.04444460	-111.66607250	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q46508
3461	San Luis Potosí	142	MX	24	SLP	state	22.15646990	-100.98554090	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q78980
3462	Zacatecas	142	MX	32	ZAC	state	22.77085550	-102.58324260	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q80269
3463	Tamaulipas	142	MX	28	TAM	state	24.26694000	-98.83627550	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q80007
3464	Veracruz de Ignacio de la Llave	142	MX	30	VER	state	19.17377300	-96.13422410	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q60130
3465	Morelos	142	MX	17	MOR	state	18.68130490	-99.10134980	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q66117
3466	Yucatán	142	MX	31	YUC	state	20.70987860	-89.09433770	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q60176
3467	Quintana Roo	142	MX	23	ROO	state	19.18173930	-88.47913760	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q80245
3468	Sonora	142	MX	26	SON	state	37.98294960	-120.38217240	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q46422
3469	Guanajuato	142	MX	11	GUA	state	21.01901450	-101.25735860	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q46475
3470	Hidalgo	142	MX	13	HID	state	26.10035470	-98.26306840	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q80903
3471	Coahuila de Zaragoza	142	MX	07	COA	state	27.05867600	-101.70682940	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q53079
3472	Colima	142	MX	08	COL	state	19.24523420	-103.72408680	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q61309
3473	Ciudad de México	142	MX	09	CMX	federal district	19.43260770	-99.13320800	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q1489
3474	Michoacán de Ocampo	142	MX	16	MIC	state	19.56651920	-101.70682940	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q79861
3475	Campeche	142	MX	04	CAM	state	19.83012510	-90.53490870	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q80908
3476	Puebla	142	MX	21	PUE	state	19.04143980	-98.20627270	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q79923
3477	Nayarit	142	MX	18	NAY	state	21.75138440	-104.84546190	2019-10-05 23:18:55	2022-05-08 23:24:46	1	Q79920
3478	Krabi	219	TH	63	81	\N	8.08629970	98.90628350	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q236769
3479	Ranong	219	TH	59	85	\N	9.95287020	98.60846410	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q236802
3480	Nong Bua Lam Phu	219	TH	79	39	\N	17.22182470	102.42603680	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q261241
3481	Samut Prakan	219	TH	42	11	\N	13.59909610	100.59983190	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q271529
3482	Surat Thani	219	TH	60	84	\N	9.13419490	99.33341980	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q240463
3483	Lamphun	219	TH	05	51	\N	18.57446060	99.00872210	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q240540
3484	Nong Khai	219	TH	17	43	\N	17.87828030	102.74126380	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q327737
3485	Khon Kaen	219	TH	22	40	\N	16.43219380	102.82362140	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q327533
3486	Chanthaburi	219	TH	48	22	\N	12.61124850	102.10378060	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q327730
3487	Saraburi	219	TH	37	19	\N	14.52891540	100.91014210	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q337627
3488	Phatthalung	219	TH	66	93	\N	7.61668230	100.07402310	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q243808
3489	Uttaradit	219	TH	10	53	\N	17.62008860	100.09929420	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q273794
3490	Sing Buri	219	TH	33	17	\N	14.89362530	100.39673140	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q334836
3491	Chiang Mai	219	TH	02	50	\N	18.78834390	98.98530080	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q233588
3492	Nakhon Sawan	219	TH	16	60	\N	15.69873820	100.11996000	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q239844
3493	Yala	219	TH	70	95	\N	44.05791170	-123.16538480	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q242977
3494	Phra Nakhon Si Ayutthaya	219	TH	36	14	\N	14.36923250	100.58766340	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q476222
3495	Nonthaburi	219	TH	38	12	\N	13.85910840	100.52165080	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q242932
3496	Trat	219	TH	49	23	\N	12.24275630	102.51747340	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q241884
3497	Nakhon Ratchasima	219	TH	27	30	\N	14.97384930	102.08365200	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q271737
3498	Chiang Rai	219	TH	03	57	\N	19.91047980	99.84057600	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q236419
3499	Ratchaburi	219	TH	52	70	\N	13.52828930	99.81342110	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q335492
3500	Pathum Thani	219	TH	39	13	\N	14.02083910	100.52502760	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q459748
3501	Sakon Nakhon	219	TH	20	47	\N	17.16642110	104.14860550	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q382125
3502	Samut Songkhram	219	TH	54	75	\N	13.40982170	100.00226450	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q459742
3503	Nakhon Pathom	219	TH	53	73	\N	13.81402930	100.03729290	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q334841
3504	Samut Sakhon	219	TH	55	74	\N	13.54752160	100.27439560	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q334686
3505	Mae Hong Son	219	TH	01	58	\N	19.30202960	97.96543680	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q269270
3506	Phitsanulok	219	TH	12	65	\N	16.82112380	100.26585160	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q275781
3507	Pattaya	219	TH	12	S	\N	12.92355570	100.88245510	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q170919
3508	Prachuap Khiri Khan	219	TH	57	77	\N	11.79383890	99.79575640	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q244628
3509	Loei	219	TH	18	42	\N	17.48602320	101.72230020	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q275388
3510	Roi Et	219	TH	25	45	\N	16.05381960	103.65200360	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q625463
3511	Kanchanaburi	219	TH	50	71	\N	14.10113930	99.41794310	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q275740
3512	Ubon Ratchathani	219	TH	75	34	\N	15.24484530	104.84729950	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q629024
3513	Chon Buri	219	TH	46	20	\N	13.36114310	100.98467170	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q207068
3514	Phichit	219	TH	13	66	\N	16.27408760	100.33469910	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q237874
3515	Phetchabun	219	TH	14	67	\N	16.30166900	101.11928040	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q240520
3516	Kamphaeng Phet	219	TH	11	62	\N	16.48277980	99.52266180	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q273807
3517	Maha Sarakham	219	TH	24	44	\N	16.01320150	103.16151690	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q468554
3518	Rayong	219	TH	47	21	\N	12.68139570	101.28162610	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q335221
3519	Ang Thong	219	TH	35	15	\N	14.58960540	100.45505200	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q243795
3520	Nakhon Si Thammarat	219	TH	64	80	\N	8.43248310	99.95990330	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q244691
3521	Yasothon	219	TH	72	35	\N	15.79264100	104.14528270	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q506598
3522	Chai Nat	219	TH	32	18	\N	15.18519710	100.12512500	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q459759
3523	Amnat Charoen	219	TH	77	37	\N	15.86567830	104.62577740	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q243791
3524	Suphan Buri	219	TH	51	72	\N	14.47448920	100.11771280	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q272247
3525	Tak	219	TH	08	63	\N	45.02996460	-93.10498150	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q275758
3526	Chumphon	219	TH	58	86	\N	10.49304960	99.18001990	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q244695
3527	Udon Thani	219	TH	76	41	\N	17.36469690	102.81589240	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q380752
3528	Phrae	219	TH	07	54	\N	18.14457740	100.14028310	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q244652
3529	Sa Kaeo	219	TH	80	27	\N	13.82403800	102.06458390	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q381889
3530	Nan	219	TH	04	55	\N	45.52220800	-122.98632810	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q244698
3531	Surin	219	TH	29	32	\N	37.03582710	-95.62763670	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q380757
3532	Phetchaburi	219	TH	56	76	\N	12.96492150	99.64258830	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q244699
3533	Bueng Kan	219	TH	81	38	\N	18.36091040	103.64644630	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1001862
3534	Buri Ram	219	TH	28	31	\N	14.99510030	103.11159150	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q327510
3535	Nakhon Nayok	219	TH	43	26	\N	14.20694660	101.21305110	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q466212
3536	Phuket	219	TH	62	83	\N	7.88044790	98.39225040	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q182565
3537	Satun	219	TH	67	91	\N	6.62381580	100.06737440	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q236263
3538	Phayao	219	TH	41	56	\N	19.21543670	100.20236920	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q244618
3539	Songkhla	219	TH	68	90	\N	7.18976590	100.59538130	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q235574
3540	Pattani	219	TH	69	94	\N	6.76183080	101.32325490	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q236781
3541	Trang	219	TH	65	92	\N	7.56448330	99.62393340	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q243805
3542	Prachin Buri	219	TH	74	25	\N	14.04206990	101.66008740	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q321324
3543	Lop Buri	219	TH	34	16	\N	14.79950810	100.65337060	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q336122
3544	Lampang	219	TH	06	52	\N	18.28553950	99.51278950	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q240495
3545	Sukhothai	219	TH	09	64	\N	43.64855560	-79.37466390	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q380764
3546	Mukdahan	219	TH	78	49	\N	16.54359140	104.70241210	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q335119
3547	Si Sa Ket	219	TH	30	33	\N	15.11860090	104.32200950	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q380761
3548	Nakhon Phanom	219	TH	73	48	\N	17.39203900	104.76955080	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q468547
3549	Phangnga	219	TH	61	82	\N	8.45014140	98.52553170	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q273306
3550	Kalasin	219	TH	23	46	\N	16.43850800	103.50609940	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q382144
3551	Uthai Thani	219	TH	15	61	\N	15.38350010	100.02455270	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q244649
3552	Chachoengsao	219	TH	44	24	\N	13.69041940	101.07795960	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q334906
3553	Narathiwat	219	TH	31	96	\N	6.42546070	101.82531430	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q271442
3554	Bangkok	219	TH	40	10	\N	13.75633090	100.50176510	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1861
3555	Hiiu County	69	EE	02	39	\N	58.92395530	22.59194680	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1466462
3556	Viljandi County	69	EE	20	84	\N	58.28217460	25.57522330	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q192061
3557	Tartu County	69	EE	18	78	\N	58.40571280	26.80157600	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q192370
3558	Valga County	69	EE	19	82	\N	57.91034410	26.16018190	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q192362
3559	Rapla County	69	EE	13	70	\N	58.84926250	24.73465690	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q192352
3560	Võru County	69	EE	21	86	\N	57.73773720	27.13989380	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q188076
3561	Saare County	69	EE	14	74	\N	58.48497210	22.61364080	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q203272
3562	Pärnu County	69	EE	11	67	\N	58.52619520	24.40201590	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q185036
3563	Põlva County	69	EE	12	65	\N	58.11606220	27.20663940	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q191813
3564	Lääne-Viru County	69	EE	08	59	\N	59.30188160	26.32803120	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q189952
3565	Jõgeva County	69	EE	05	49	\N	58.75061430	26.36048780	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q189974
3566	Järva County	69	EE	04	51	\N	58.88667130	25.50006240	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q188068
3567	Harju County	69	EE	01	37	\N	59.33342390	25.24669740	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q180200
3568	Lääne County	69	EE	07	57	\N	58.97227420	23.87408340	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q189968
3569	Ida-Viru County	69	EE	03	44	\N	59.25926630	27.41365350	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q189963
3570	Moyen-Chari	43	TD	17	MC	province	9.06399980	18.42760470	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q177799
3571	Mayo-Kebbi Ouest	43	TD	20	MO	province	10.41130140	15.59433880	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q910393
3572	Sila	43	TD	25	SI	province	12.13074000	21.28450250	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q1149611
3573	Hadjer-Lamis	43	TD	18	HL	province	12.45772730	16.72346390	2019-10-05 23:18:55	2022-08-31 14:16:52	1	Q1042437
3574	Borkou	43	TD	23	BO	province	17.86888450	18.80761950	2019-10-05 23:18:55	2022-08-31 14:16:52	1	Q1139666
3575	Ennedi-Est	43	TD	27	EE	province	16.34204960	23.00119890	2019-10-05 23:18:55	2022-08-31 14:16:52	1	Q16632169
3576	Guéra	43	TD	05	GR	province	11.12190150	18.42760470	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q175706
3577	Lac	43	TD	07	LC	province	13.69153770	14.10013260	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q867869
3579	Tandjilé	43	TD	14	TA	province	9.66257290	16.72346390	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q867856
3580	Mayo-Kebbi Est	43	TD	16	ME	province	9.40460390	14.84546190	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q911421
3581	Wadi Fira	43	TD	02	WF	province	15.08924160	21.47528510	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q860813
3582	Ouaddaï	43	TD	12	OD	province	13.74847600	20.71224650	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q841338
3583	Bahr el Gazel	43	TD	22	BG	province	14.77022660	16.91225100	2019-10-05 23:18:55	2022-08-31 14:16:52	1	Q1050621
3584	Ennedi-Ouest	43	TD	28	EO	province	18.97756300	21.85685860	2019-10-05 23:18:55	2022-08-31 14:16:52	1	Q16632172
3585	Logone Occidental	43	TD	08	LO	province	8.75967600	15.87600400	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q305257
3586	N\\"Djamena	43	TD	21	ND	province	12.13484570	15.05574150	2019-10-05 23:18:55	2022-08-31 14:16:52	1	Q3659
3587	Tibesti	43	TD	26	TI	province	21.36500310	16.91225100	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q737711
3588	Kanem	43	TD	06	KA	province	14.87812620	15.40680790	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q849841
3589	Mandoul	43	TD	19	MA	province	8.60309100	17.47951730	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q597410
3590	Batha	43	TD	01	BA	province	13.93717750	18.42760470	2019-10-05 23:18:55	2022-08-31 14:16:52	1	Q180414
3591	Logone Oriental	43	TD	09	LR	province	8.31499490	16.34637910	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q167514
3592	Salamat	43	TD	13	SA	province	10.96916010	20.71224650	2019-10-05 23:18:55	2022-08-31 14:19:32	1	Q385584
3593	Berry Islands	17	BS	32	BY	\N	25.62500420	-77.82522030	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q827173
3594	Nichollstown and Berry Islands	17	BS	32	NB	\N	25.72362340	-77.83101040	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q15478152
3595	Green Turtle Cay	17	BS	28	GT	\N	26.77471070	-77.32957080	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q3249446
3596	Central Eleuthera	17	BS	39	CE	\N	25.13620370	-76.14359150	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q938518
3597	Governor\\"s Harbour	17	BS	27	GH	\N	25.19480960	-76.24396220	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q5589465
3598	High Rock	17	BS	29	HR	\N	46.68434150	-121.90174610	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1771787
3599	West Grand Bahama	17	BS	54	WG	\N	26.65944700	-78.52065000	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2702338
3600	Rum Cay District	17	BS	49	RC	\N	23.68546760	-74.83901620	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q21713441
3601	Acklins	17	BS	24	AK	\N	22.36577080	-74.05351260	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q341919
3602	North Eleuthera	17	BS	48	NE	\N	25.46475170	-76.67592200	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2705535
3603	Central Abaco	17	BS	37	CO	\N	26.35550290	-77.14851630	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2525371
3604	Marsh Harbour	17	BS	31	MH	\N	26.52416530	-77.09098090	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1337651
3605	Black Point	17	BS	36	BP	\N	41.39510240	-71.46505560	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2525298
3606	Sandy Point	17	BS	34	SP	\N	39.01454640	-76.39989250	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q7417405
3607	South Eleuthera	17	BS	52	SE	\N	24.77085620	-76.21314740	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2699715
3608	South Abaco	17	BS	50	SO	\N	26.06405910	-77.26350380	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2703192
3609	Inagua	17	BS	13	IN	\N	21.06560660	-73.32370800	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1353668
3610	Long Island	17	BS	15	LI	\N	40.78914200	-73.13496100	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q890879
3611	Cat Island	17	BS	06	CI	\N	30.22801360	-89.10149330	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1050154
3612	Exuma	17	BS	10	EX	\N	23.61925980	-75.96954650	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1385577
3613	Harbour Island	17	BS	22	HI	\N	25.50011000	-76.63405110	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2357510
3614	East Grand Bahama	17	BS	41	EG	\N	26.65828230	-78.22482910	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2630334
3615	Ragged Island	17	BS	18	RI	\N	41.59743100	-71.26020200	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1532634
3616	North Abaco	17	BS	46	NO	\N	26.78716970	-77.43577390	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q623327
3617	North Andros	17	BS	47	NS	\N	24.70638050	-78.01953870	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2699411
3618	Kemps Bay	17	BS	30	KB	\N	24.02364000	-77.54534900	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q9291041
3619	Fresh Creek	17	BS	26	FC	\N	40.65437560	-73.89479390	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q14209513
3620	San Salvador and Rum Cay	17	BS	35	SR	\N	23.68546760	-74.83901620	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q7415283
3621	Crooked Island	17	BS	40	CK	\N	22.63909820	-74.00650900	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1140993
3622	South Andros	17	BS	51	SA	\N	23.97135560	-77.60778650	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2408672
3623	Rock Sound	17	BS	33	RS	\N	39.01424430	-95.67089890	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1771799
3624	Hope Town	17	BS	43	HT	\N	26.50095040	-76.99598720	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2699709
3625	Mangrove Cay	17	BS	44	MC	\N	24.14814250	-77.76809520	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2702334
3626	Freeport	17	BS	25	FP	\N	42.29668610	-89.62122710	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q867573
3627	San Salvador Island	17	BS	35	SS	\N	24.07755460	-74.47600880	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q845540
3628	Acklins and Crooked Islands	17	BS	24	AC	\N	22.36577080	-74.05351260	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q4674283
3629	Bimini	17	BS	05	BI	\N	24.64153250	-79.85062260	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q863476
3630	Spanish Wells	17	BS	53	SW	\N	26.32505990	-81.79803280	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1771681
3631	Central Andros	17	BS	38	CS	\N	24.46884820	-77.97386500	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2096558
3632	Grand Cay	17	BS	42	GC	\N	27.21626150	-78.32305590	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2524373
3633	Mayaguana District	17	BS	16	MG	\N	22.40177140	-73.06413960	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q21712462
3634	San Juan	11	AR	18	J	province	-31.53169760	-68.56769620	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44805
3635	Santiago del Estero	11	AR	22	G	province	-27.78335740	-64.26416700	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44827
3636	San Luis	11	AR	19	D	province	-33.29620420	-66.32949480	2019-10-05 23:18:55	2022-03-13 16:29:34	1	Q44818
3637	Tucumán	11	AR	24	T	province	-26.82211270	-65.21929030	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44829
3638	Corrientes	11	AR	06	W	province	-27.46921310	-58.83063490	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44758
3639	Río Negro	11	AR	16	R	province	-40.82614340	-63.02663390	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44802
3640	Chaco	11	AR	03	H	province	-27.42571750	-59.02437840	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44757
3641	Santa Fe	11	AR	21	S	province	-31.58551090	-60.72380160	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44823
3642	Córdoba	11	AR	05	X	province	-31.39928760	-64.26438420	2019-10-05 23:18:55	2022-01-22 15:01:23	1	Q44759
3643	Salta	11	AR	17	A	province	-24.79976880	-65.41503670	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44803
3644	Misiones	11	AR	14	N	province	-27.42692550	-55.94670760	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44798
3645	Jujuy	11	AR	10	Y	province	-24.18433970	-65.30217700	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44764
3646	Mendoza	11	AR	13	M	province	-32.88945870	-68.84583860	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44797
3647	Catamarca	11	AR	02	K	province	-28.47158770	-65.78772090	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44756
3648	Neuquén	11	AR	15	Q	province	-38.94587000	-68.07309250	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44800
3649	Santa Cruz	11	AR	20	Z	province	-51.63528210	-69.24743530	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44821
3650	Tierra del Fuego	11	AR	23	V	province	-54.80539980	-68.32420610	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44832
3651	Chubut	11	AR	04	U	province	-43.29342460	-65.11148180	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q45007
3652	Formosa	11	AR	09	P	province	-26.18948040	-58.22428060	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44761
3653	La Rioja	11	AR	12	F	province	-29.41937930	-66.85599320	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44796
3654	Entre Ríos	11	AR	08	E	province	-31.77466540	-60.49564610	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44762
3655	La Pampa	11	AR	11	L	province	-36.61475730	-64.28392090	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q44795
3656	Buenos Aires	11	AR	07	B	province	-37.20172850	-59.84106970	2019-10-05 23:18:55	2022-01-22 15:01:05	1	Q1486
3657	Quiché Department	90	GT	14	QC	\N	15.49838080	-90.98206680	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q669802
3658	Jalapa Department	90	GT	10	JA	\N	14.61214460	-89.96267990	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q795441
3659	Izabal Department	90	GT	09	IZ	\N	15.49765170	-88.86469800	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q693658
3660	Suchitepéquez Department	90	GT	20	SU	\N	14.42159820	-91.40482490	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q883734
3661	Sololá Department	90	GT	19	SO	\N	14.74852300	-91.28910360	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q178136
3662	El Progreso Department	90	GT	05	PR	\N	14.93887320	-90.07467670	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q795591
3663	Totonicapán Department	90	GT	21	TO	\N	14.91734020	-91.36139230	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q885644
3664	Retalhuleu Department	90	GT	15	RE	\N	14.52454850	-91.68578800	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q888307
3665	Santa Rosa Department	90	GT	18	SR	\N	38.44057590	-122.70375430	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q885656
3666	Chiquimula Department	90	GT	04	CQ	\N	14.75149990	-89.47421770	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q753037
3667	San Marcos Department	90	GT	17	SM	\N	14.93095690	-91.90992380	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q883907
3668	Quetzaltenango Department	90	GT	13	QZ	\N	14.79243300	-91.71495800	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q844502
3669	Petén Department	90	GT	12	PE	\N	16.91203300	-90.29957850	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q466061
3670	Huehuetenango Department	90	GT	08	HU	\N	15.58799140	-91.67606910	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q842266
3671	Alta Verapaz Department	90	GT	01	AV	\N	15.59428830	-90.14949880	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q504637
3672	Guatemala Department	90	GT	07	GU	\N	14.56494010	-90.52578230	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q695660
3673	Jutiapa Department	90	GT	11	JU	\N	14.19308020	-89.92532330	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q765984
3674	Baja Verapaz Department	90	GT	02	BV	\N	15.12558670	-90.37483540	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q504647
3675	Chimaltenango Department	90	GT	03	CM	\N	14.56347870	-90.98206680	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q765975
3676	Sacatepéquez Department	90	GT	16	SA	\N	14.51783790	-90.71527490	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q508804
3677	Escuintla Department	90	GT	06	ES	\N	14.19109120	-90.98206680	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q795587
3678	Madre de Dios	173	PE	17	MDD	\N	-11.76687050	-70.81199530	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q210896
3679	Huancavelica	173	PE	09	HUV	\N	-12.78619780	-74.97640240	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q505220
3680	Áncash	173	PE	02	ANC	\N	-9.32504970	-77.56194190	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q205089
3681	Arequipa	173	PE	04	ARE	\N	-16.40904740	-71.53745100	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q205068
3682	Puno	173	PE	21	PUN	\N	-15.84022180	-70.02188050	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q205104
3683	La Libertad	173	PE	13	LAL	\N	13.49069700	-89.30846070	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q205126
3684	Ucayali	173	PE	25	UCA	\N	-9.82511830	-73.08774900	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q207424
3685	Amazonas	173	PE	01	AMA	\N	\N	\N	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q201162
3686	Pasco	173	PE	19	PAS	\N	46.23050490	-119.09223160	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q211208
3687	Huanuco	173	PE	10	HUC	\N	-9.92076480	-76.24108430	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q215221
3688	Cajamarca	173	PE	06	CAJ	\N	-7.16174650	-78.51278550	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q205078
3689	Tumbes	173	PE	24	TUM	\N	-3.55649210	-80.42708850	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q209597
3691	Cusco	173	PE	08	CUS	\N	-13.53195000	-71.96746260	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q205057
3692	Ayacucho	173	PE	05	AYA	\N	-13.16387370	-74.22356410	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q205112
3693	Junín	173	PE	12	JUN	\N	-11.15819250	-75.99263060	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q207973
3694	San Martín	173	PE	22	SAM	\N	37.08494640	-121.61022160	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q211793
3695	Lima	173	PE	15	LIM	\N	-12.04637310	-77.04275400	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q211795
3696	Tacna	173	PE	23	TAC	\N	-18.00656790	-70.24627410	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q207413
3697	Piura	173	PE	20	PIU	\N	-5.17828840	-80.65488820	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q208183
3698	Moquegua	173	PE	18	MOQ	\N	-17.19273610	-70.93281380	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q208182
3699	Apurímac	173	PE	03	APU	\N	-14.05045330	-73.08774900	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q208185
3700	Ica	173	PE	11	ICA	\N	42.35288320	-71.04300970	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q208186
3701	Callao	173	PE	07	CAL	\N	-12.05084910	-77.12598430	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2071352
3702	Lambayeque	173	PE	14	LAM	\N	-6.71976660	-79.90807570	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q210061
3703	Redonda	10	AG	09	11	\N	16.93841600	-62.34551480	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q457261
3704	Saint Peter Parish	10	AG	07	07	\N	\N	\N	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1952603
3705	Saint Paul Parish	10	AG	06	06	\N	\N	\N	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q386093
3706	Saint John Parish	10	AG	04	04	\N	\N	\N	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q548816
3707	Saint Mary Parish	10	AG	05	05	\N	\N	\N	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1999872
3708	Barbuda	10	AG	01	10	\N	17.62662420	-61.77130280	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q238752
3709	Saint George Parish	10	AG	03	03	\N	\N	\N	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1770796
3710	Saint Philip Parish	10	AG	08	08	\N	40.43682580	-80.06855320	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1996895
3711	South Bačka District	196	RS	08	06	\N	45.48903440	19.69761870	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q648718
3712	Pirot District	196	RS	08	22	\N	43.08740360	22.59830440	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q580069
3713	South Banat District	196	RS	08	04	\N	45.00274570	21.05425090	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q720030
3714	North Bačka District	196	RS	08	01	\N	45.98033940	19.59070010	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q648758
3715	Jablanica District	196	RS	08	23	\N	42.94815600	21.81293210	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q876541
3716	Central Banat District	196	RS	SE	02	\N	45.47884850	20.60825220	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q425782
3717	Bor District	196	RS	SE	14	\N	44.06989180	22.09850860	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q477586
3718	Toplica District	196	RS	SE	21	\N	43.19065920	21.34077620	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1048184
3719	Mačva District	196	RS	SE	08	\N	44.59253140	19.50822460	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q867803
3720	Rasina District	196	RS	SE	19	\N	43.52635250	21.15881780	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1043446
3721	Pčinja District	196	RS	SE	24	\N	42.58363620	22.14302150	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1061099
3722	Nišava District	196	RS	SE	20	\N	43.37389020	21.93223310	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1061076
3723	Prizren District	248	XK	\N	XPR	\N	42.21525220	20.74147720	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q201085
3724	Kolubara District	196	RS	SE	09	\N	44.35098110	20.00043050	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1048139
3725	Raška District	196	RS	SE	18	\N	43.33734610	20.57340050	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q1061082
3726	West Bačka District	196	RS	SE	05	\N	45.73553850	19.18973640	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q735169
3727	Moravica District	196	RS	SE	17	\N	43.84147000	20.29049870	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q915380
3728	Belgrade	196	RS	SE	00	\N	44.78656800	20.44892160	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q3711
3729	Zlatibor District	196	RS	SE	16	\N	43.64541700	19.71014550	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q478278
3731	Zaječar District	196	RS	SE	15	\N	43.90150480	22.27380110	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q967339
3732	Braničevo District	196	RS	SE	11	\N	44.69822460	21.54467750	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q861539
3733	Vojvodina	196	RS	VO	VO	\N	45.26086510	19.83193380	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q44749
3734	Šumadija District	196	RS	VO	12	\N	44.20506780	20.78565650	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q544118
3736	North Banat District	196	RS	VO	03	\N	45.90683900	19.99934170	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q728041
3737	Pomoravlje District	196	RS	VO	13	\N	43.95913790	21.27135300	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q867816
3738	Peć District	248	XK	\N	XPE	\N	42.65921550	20.28876240	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q2510536
3740	Srem District	196	RS	VO	07	\N	45.00291710	19.80137730	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q217331
3741	Podunavlje District	196	RS	VO	10	\N	44.47291560	20.99014260	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q778561
3742	Westmoreland Parish	108	JM	16	10	\N	18.29443780	-78.15644320	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1440250
3743	Saint Elizabeth Parish	108	JM	11	11	\N	38.99253080	-94.58992000	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1473646
3744	Saint Ann Parish	108	JM	09	06	\N	37.28714520	-77.41035330	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1326284
3745	Saint James Parish	108	JM	12	08	\N	30.01792920	-90.79132270	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1421939
3746	Saint Catherine Parish	108	JM	10	14	\N	18.03641340	-77.05644640	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1473663
3747	Saint Mary Parish	108	JM	13	05	\N	36.09252200	-95.97384400	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q633565
3748	Kingston Parish	108	JM	17	01	\N	17.96832710	-76.78270200	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1473680
3749	Hanover Parish	108	JM	02	09	\N	18.40977070	-78.13363800	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1131779
3750	Saint Thomas Parish	108	JM	14	03	\N	41.44253890	-81.74022180	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1422332
3751	Saint Andrew	108	JM	08	02	\N	37.22451030	-95.70211890	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q2212935
3752	Portland Parish	108	JM	07	04	\N	18.08442740	-76.41002670	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q125148
3753	Clarendon Parish	108	JM	01	13	\N	17.95571830	-77.24051530	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1095557
3754	Manchester Parish	108	JM	04	12	\N	18.06696540	-77.51607880	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q920496
3755	Trelawny Parish	108	JM	15	07	\N	18.35261430	-77.60778650	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1123340
3756	Dennery Quarter	186	LC	05	05	\N	13.92673930	-60.91909880	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1188890
3757	Anse la Raye Quarter	186	LC	01	01	\N	13.94594240	-61.03694680	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1676934
3758	Castries Quarter	186	LC	03	02	\N	14.01010940	-60.98746870	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1049867
3759	Laborie Quarter	186	LC	07	07	\N	13.75227830	-60.99328890	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q599347
3760	Choiseul Quarter	186	LC	04	03	\N	13.77501540	-61.04859100	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1075816
3761	Canaries	186	LC	12	12	\N	28.29156370	-16.62913040	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1032796
3762	Micoud Quarter	186	LC	08	08	\N	13.82118710	-60.90019340	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1240193
3763	Vieux Fort Quarter	186	LC	10	11	\N	13.72060800	-60.94964330	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1472864
3764	Soufrière Quarter	186	LC	09	10	\N	13.85709860	-61.05732480	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1472841
3765	Praslin Quarter	186	LC	11	09	\N	13.87523920	-60.89946630	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1567791
3766	Gros Islet Quarter	186	LC	06	06	\N	14.08435780	-60.94527940	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q953557
3767	Dauphin Quarter	186	LC	02	04	\N	14.01033960	-60.91909880	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q182988
3768	Hưng Yên	240	VN	81	66	\N	20.85257110	106.01699710	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36235
3769	Đồng Tháp	240	VN	09	45	\N	10.49379890	105.68817880	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36676
3770	Bà Rịa-Vũng Tàu	240	VN	45	43	\N	10.54173970	107.24299760	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36874
3771	Thanh Hóa	240	VN	34	21	\N	19.80669200	105.78518160	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36512
3772	Kon Tum	240	VN	55	28	\N	14.34974030	108.00046060	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36315
3773	Điện Biên	240	VN	92	71	\N	21.80423090	103.10765250	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36955
3774	Vĩnh Phúc	240	VN	86	70	\N	21.36088050	105.54743730	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q27566
3775	Thái Bình	240	VN	35	20	\N	20.44634710	106.33658280	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36681
3776	Quảng Nam	240	VN	84	27	\N	15.53935380	108.01910200	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q33356
3777	Hậu Giang	240	VN	93	73	\N	9.75789800	105.64125270	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36320
3778	Cà Mau	240	VN	77	59	\N	9.15267280	105.19607950	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q33354
3779	Hà Giang	240	VN	50	03	\N	22.80255880	104.97844940	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36685
3780	Nghệ An	240	VN	58	22	\N	19.23424890	104.92003650	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36587
3781	Tiền Giang	240	VN	37	46	\N	10.44933240	106.34205040	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36666
3782	Cao Bằng	240	VN	05	04	\N	22.63568900	106.25221430	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36865
3783	Hải Phòng	240	VN	13	HP	\N	20.84491150	106.68808410	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q72818
3784	Yên Bái	240	VN	70	06	\N	21.71676890	104.89858780	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36349
3785	Bình Dương	240	VN	75	57	\N	11.32540240	106.47701700	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36866
3786	Ninh Bình	240	VN	59	18	\N	20.25061490	105.97445360	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36900
3787	Bình Thuận	240	VN	47	40	\N	11.09037030	108.07207810	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36869
3788	Ninh Thuận	240	VN	60	36	\N	11.67387670	108.86295720	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36903
3789	Nam Định	240	VN	82	67	\N	20.43882250	106.16210530	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36907
3790	Vĩnh Long	240	VN	69	49	\N	10.23957400	105.95719280	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q7333405
3791	Bắc Ninh	240	VN	74	56	\N	21.12144400	106.11105010	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q33408
3792	Lạng Sơn	240	VN	39	09	\N	21.85370800	106.76151900	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q33403
3793	Khánh Hòa	240	VN	54	34	\N	12.25850980	109.05260760	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q33369
3794	An Giang	240	VN	01	44	\N	10.52158360	105.12589550	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36592
3795	Tuyên Quang	240	VN	68	07	\N	21.77672460	105.22801960	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q2332060
3796	Bến Tre	240	VN	03	50	\N	10.24335560	106.37555100	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q33366
3797	Bình Phước	240	VN	76	58	\N	11.75118940	106.72346390	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36672
3798	Thừa Thiên-Huế	240	VN	66	26	\N	16.46739700	107.59053260	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36399
3799	Hòa Bình	240	VN	53	14	\N	20.68612650	105.31311850	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36015
3800	Kiên Giang	240	VN	21	47	\N	9.82495870	105.12589550	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36576
3801	Phú Thọ	240	VN	83	68	\N	21.26844300	105.20455730	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36610
3802	Hà Nam	240	VN	80	63	\N	20.58351960	105.92299000	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36413
3803	Quảng Trị	240	VN	64	25	\N	16.74030740	107.18546790	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36579
3804	Bạc Liêu	240	VN	73	55	\N	9.29400270	105.72156630	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36658
3805	Trà Vinh	240	VN	67	51	\N	9.81274100	106.29929120	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36615
3806	Đà Nẵng	240	VN	78	DN	\N	16.05440680	108.20216670	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q25282
3807	Thái Nguyên	240	VN	85	69	\N	21.56715590	105.82520380	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q26575
3808	Long An	240	VN	24	41	\N	10.56071680	106.64976230	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q26573
3809	Quảng Bình	240	VN	62	24	\N	17.61027150	106.34874740	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q23533
3810	Hà Nội	240	VN	44	HN	\N	21.02776440	105.83415980	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1858
3811	Hồ Chí Minh	240	VN	20	SG	\N	10.82309890	106.62966380	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1854
3812	Sơn La	240	VN	32	05	\N	21.10222840	103.72891670	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q33379
3813	Gia Lai	240	VN	49	30	\N	13.80789430	108.10937500	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36662
3814	Quảng Ninh	240	VN	30	13	\N	21.00638200	107.29251440	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q33396
3815	Bắc Giang	240	VN	71	54	\N	21.28199210	106.19747690	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36367
3816	Hà Tĩnh	240	VN	52	23	\N	18.35595370	105.88774940	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q33351
3817	Lào Cai	240	VN	90	02	\N	22.48094310	103.97549590	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36446
3818	Lâm Đồng	240	VN	23	35	\N	11.57527910	108.14286690	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36721
3819	Sóc Trăng	240	VN	65	52	\N	9.60252100	105.97390490	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q33272
3821	Đồng Nai	240	VN	43	39	\N	11.06863050	107.16759760	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q33271
3822	Bắc Kạn	240	VN	72	53	\N	22.30329230	105.87600400	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36404
3823	Đắk Nông	240	VN	91	72	\N	12.26464760	107.60980600	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36723
3824	Phú Yên	240	VN	61	32	\N	13.08818610	109.09287640	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36725
3825	Lai Châu	240	VN	89	01	\N	22.38622270	103.47026310	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36409
3826	Tây Ninh	240	VN	33	37	\N	11.33515540	106.10988540	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36608
3827	Hải Dương	240	VN	79	61	\N	20.93734130	106.31455420	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36729
3828	Quảng Ngãi	240	VN	63	29	\N	15.12138730	108.80441450	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q33304
3829	Đắk Lắk	240	VN	88	33	\N	12.71001160	108.23775190	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36690
3830	Bình Định	240	VN	46	31	\N	14.16653240	108.90268300	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q36693
3831	Saint Peter Basseterre Parish	185	KN	11	11	\N	17.31029110	-62.71475330	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1725609
3832	Nevis	185	KN	11	N	\N	17.15535580	-62.57960260	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q207794
3833	Christ Church Nichola Town Parish	185	KN	01	01	\N	17.36048120	-62.76178370	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q176164
3834	Saint Paul Capisterre Parish	185	KN	09	09	\N	17.40166830	-62.82573320	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q952735
3835	Saint James Windward Parish	185	KN	05	05	\N	17.17696330	-62.57960260	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1342139
3836	Saint Anne Sandy Point Parish	185	KN	02	02	\N	17.37253330	-62.84411330	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1473654
3837	Saint George Gingerland Parish	185	KN	04	04	\N	17.12577590	-62.56198110	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1472520
3838	Saint Paul Charlestown Parish	185	KN	10	10	\N	17.13462970	-62.61338160	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1752127
3839	Saint Thomas Lowland Parish	185	KN	12	12	\N	17.16505130	-62.60897530	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1752122
3840	Saint John Figtree Parish	185	KN	07	07	\N	17.11557480	-62.60310040	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q657318
3841	Saint Kitts	185	KN	07	K	\N	17.34337960	-62.75590430	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q204989
3842	Saint Thomas Middle Island Parish	185	KN	13	13	\N	17.33488130	-62.80882510	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1752101
3843	Trinity Palmetto Point Parish	185	KN	15	15	\N	17.30635190	-62.76178370	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q376738
3844	Saint Mary Cayon Parish	185	KN	08	08	\N	17.34620710	-62.73826710	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1538034
3845	Saint John Capisterre Parish	185	KN	06	06	\N	17.38103410	-62.79118330	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q668498
3846	Daegu	116	KR	15	27	\N	35.87143540	128.60144500	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q20927
3847	Gyeonggi Province	116	KR	13	41	\N	37.41380000	127.51830000	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q20937
3848	Incheon	116	KR	12	28	\N	37.45625570	126.70520620	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q20934
3849	Seoul	116	KR	11	11	\N	37.56653500	126.97796920	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q8684
3850	Daejeon	116	KR	19	30	\N	36.35041190	127.38454750	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q20921
3851	North Jeolla Province	116	KR	03	45	\N	35.71750000	127.15300000	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q41157
3852	Ulsan	116	KR	21	31	\N	35.53837730	129.31135960	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q41278
3853	Jeju	116	KR	01	49	\N	33.95682780	-84.13135000	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q41164
3854	North Chungcheong Province	116	KR	05	43	\N	36.80000000	127.70000000	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q41066
3855	North Gyeongsang Province	116	KR	14	47	\N	36.49190000	128.88890000	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q41154
3856	South Jeolla Province	116	KR	16	46	\N	34.86790000	126.99100000	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q41161
3857	South Gyeongsang Province	116	KR	20	48	\N	35.46060000	128.21320000	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q41151
3858	Gwangju	116	KR	18	29	\N	35.15954540	126.85260120	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q41283
3859	South Chungcheong Province	116	KR	17	44	\N	36.51840000	126.80000000	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q41070
3860	Busan	116	KR	10	26	\N	35.17955430	129.07564160	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q16520
3861	Sejong City	116	KR	22	50	\N	34.05233230	-118.30848970	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q20929
3862	Gangwon Province	116	KR	06	42	\N	37.82280000	128.15550000	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q41071
3863	Saint Patrick Parish	87	GD	06	06	\N	\N	\N	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1476309
3864	Saint George Parish	87	GD	03	03	\N	\N	\N	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q576651
3865	Saint Andrew Parish	87	GD	01	01	\N	\N	\N	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q977183
3866	Saint Mark Parish	87	GD	05	05	\N	40.58818630	-73.94957010	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1291077
3867	Carriacou and Petite Martinique	87	GD	10	10	\N	12.47858880	-61.44938420	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q3044818
3868	Saint John Parish	87	GD	04	04	\N	30.11183310	-90.48799160	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1476289
3869	Saint David Parish	87	GD	02	02	\N	\N	\N	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q2087806
3870	Ghazni	1	AF	08	GHA	\N	33.54505870	68.41739720	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q180415
3871	Badghis	1	AF	02	BDG	\N	35.16713390	63.76953840	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q172052
3872	Bamyan	1	AF	05	BAM	\N	34.81000670	67.82121040	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q171382
3873	Helmand	1	AF	10	HEL	\N	39.29893610	-76.61604720	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q173821
3874	Zabul	1	AF	28	ZAB	\N	32.19187820	67.18944880	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q139126
3875	Baghlan	1	AF	03	BGL	\N	36.17890260	68.74530640	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q170309
3876	Kunar	1	AF	34	KNR	\N	34.84658930	71.09731700	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q188147
3877	Paktika	1	AF	29	PKA	\N	32.26453860	68.52471490	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q185575
3878	Khost	1	AF	37	KHO	\N	33.33384720	69.93716730	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q185752
3879	Kapisa	1	AF	14	KAP	\N	34.98105720	69.62145620	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q173816
3880	Nuristan	1	AF	38	NUR	\N	35.32502230	70.90712360	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q167485
3881	Panjshir	1	AF	42	PAN	\N	38.88023910	-77.17172380	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q181235
3882	Nangarhar	1	AF	18	NAN	\N	34.17183130	70.62167940	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q178471
3883	Samangan	1	AF	32	SAM	\N	36.31555060	67.96428630	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q183015
3884	Balkh	1	AF	30	BAL	\N	36.75506030	66.89753720	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q121104
3885	Sar-e Pol	1	AF	33	SAR	\N	36.21662800	65.93336000	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q182487
3886	Jowzjan	1	AF	31	JOW	\N	36.89696920	65.66585680	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q183036
3887	Herat	1	AF	11	HER	\N	34.35286500	62.20402870	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q182844
3888	Ghōr	1	AF	09	GHO	\N	34.09957760	64.90595500	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q186392
3889	Faryab	1	AF	07	FYB	\N	36.07956130	64.90595500	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q173830
3890	Kandahar	1	AF	23	KAN	\N	31.62887100	65.73717490	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q173808
3891	Laghman	1	AF	35	LAG	\N	34.68976870	70.14558050	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q185442
3892	Daykundi	1	AF	41	DAY	\N	33.66949500	66.04635340	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q181220
3893	Takhar	1	AF	26	TAK	\N	36.66980130	69.47845410	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q186395
3894	Paktia	1	AF	36	PIA	\N	33.70619900	69.38310790	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q182493
3895	Parwan	1	AF	40	PAR	\N	34.96309770	68.81088490	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q188157
3896	Nimruz	1	AF	19	NIM	\N	31.02614880	62.45041540	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q183021
3897	Logar	1	AF	17	LOG	\N	34.01455180	69.19239160	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q6667298
3898	Urozgan	1	AF	39	URU	\N	32.92712870	66.14152630	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q183028
3899	Farah	1	AF	06	FRA	\N	32.49532800	62.26266270	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q180330
3900	Kunduz Province	1	AF	24	KDZ	\N	36.72855110	68.86789820	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q186418
3901	Badakhshan	1	AF	01	BDS	\N	36.73477250	70.81199530	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q165376
3902	Kabul	1	AF	13	KAB	\N	34.55534940	69.20748600	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q188933
3903	Victoria	14	AU	07	VIC	state	-36.48564230	140.97794250	2019-10-05 23:18:56	2022-01-16 11:50:54	1	Q36687
3904	South Australia	14	AU	05	SA	state	-30.00023150	136.20915470	2019-10-05 23:18:56	2022-01-16 11:50:07	1	Q35715
3905	Queensland	14	AU	04	QLD	state	-20.91757380	142.70279560	2019-10-05 23:18:56	2022-01-16 11:50:03	1	Q36074
3906	Western Australia	14	AU	08	WA	state	-27.67281680	121.62830980	2019-10-05 23:18:56	2022-01-16 11:50:12	1	Q3206
3907	Australian Capital Territory	14	AU	01	ACT	territory	-35.47346790	149.01236790	2019-10-05 23:18:56	2022-01-16 11:49:50	1	Q3258
3908	Tasmania	14	AU	06	TAS	state	-41.45451960	145.97066470	2019-10-05 23:18:56	2022-01-16 11:50:08	1	Q34366
3909	New South Wales	14	AU	02	NSW	state	-31.25321830	146.92109900	2019-10-05 23:18:56	2022-01-16 11:49:54	1	Q3224
3910	Northern Territory	14	AU	03	NT	territory	-19.49141080	132.55096030	2019-10-05 23:18:56	2022-01-16 11:50:00	1	Q3235
3911	Vavaʻu	222	TO	03	05	\N	-18.62275600	-173.99029820	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q10389402
3912	Tongatapu	222	TO	02	04	\N	-21.14659680	-175.25154820	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q10383165
3913	Haʻapai	222	TO	01	02	\N	-19.75000000	-174.36666700	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q10293470
3914	Niuas	222	TO	NI	03	\N	-15.95940000	-173.78300000	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q1200954
3915	ʻEua	222	TO	EU	01	\N	37.09024000	-95.71289100	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q18472979
3916	Markazi	103	IR	34	00	province	34.61230500	49.85472660	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q134417
3917	Khuzestan	103	IR	15	06	province	31.43601490	49.04131200	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q241119
3918	Ilam	103	IR	10	16	province	33.29576180	46.67053400	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q170570
3919	Kermanshah	103	IR	13	05	province	34.45762330	46.67053400	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q174010
3920	Gilan	103	IR	08	01	province	37.28094550	49.59241340	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q928828
3921	Chaharmahal and Bakhtiari	103	IR	03	14	province	31.99704190	50.66138490	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q171702
3922	Qom	103	IR	39	25	province	34.64157640	50.87460350	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q131664
3923	Isfahan	103	IR	28	10	province	33.27710730	52.36133780	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q1367759
3924	West Azarbaijan	103	IR	01	04	province	37.45500620	45.00000000	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q134411
3925	Zanjan	103	IR	36	19	province	36.50181850	48.39881860	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q146726
3926	Kohgiluyeh and Boyer-Ahmad	103	IR	05	17	province	30.72458600	50.84563230	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q180068
3927	Razavi Khorasan	103	IR	42	09	province	35.10202530	59.10417580	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q587090
3928	Lorestan	103	IR	23	15	province	33.58183940	48.39881860	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q1131727
3929	Alborz	103	IR	44	30	province	35.99604670	50.92892460	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q392522
3930	South Khorasan	103	IR	41	29	province	32.51756430	59.10417580	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q171551
3931	Sistan and Baluchestan	103	IR	04	11	province	27.52999060	60.58206760	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q939575
3932	Bushehr	103	IR	22	18	province	28.76207390	51.51500770	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q132945
3933	Golestan	103	IR	37	27	province	37.28981230	55.13758340	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q170041
3934	Ardabil	103	IR	32	24	province	38.48532760	47.89112090	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q134228
3935	Kurdistan	103	IR	16	12	province	35.95535790	47.13621250	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q134386
3936	Yazd	103	IR	40	21	province	32.10063870	54.43421380	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q170568
3937	Hormozgan	103	IR	11	22	province	27.13872300	55.13758340	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q633659
3938	Mazandaran	103	IR	35	02	province	36.22623930	52.53186040	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q308864
3939	Fars	103	IR	07	07	province	29.10438130	53.04589300	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q1004666
3940	Semnan	103	IR	25	20	province	35.22555850	54.43421380	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q168949
3941	Qazvin	103	IR	38	26	province	36.08813170	49.85472660	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q1105893
3942	North Khorasan	103	IR	43	28	province	37.47103530	57.10131880	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q180075
3943	Kerman	103	IR	29	08	province	29.48500890	57.64390480	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q165352
3944	East Azerbaijan	103	IR	33	03	province	37.90357330	46.26821090	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q176081
3945	Tehran	103	IR	26	23	province	35.72484160	51.38165300	2019-10-05 23:18:56	2022-03-13 16:49:05	1	Q590866
3946	Niutao Island Council	228	TV	NIT	NIT	\N	-6.10642580	177.34384290	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q17578833
3947	Nanumanga	228	TV	NMG	NMG	\N	-6.28580190	176.31992800	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q367027
3948	Nui	228	TV	NUI	NUI	\N	-7.23887680	177.14852320	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q547997
3949	Nanumea	228	TV	NMA	NMA	\N	-5.68816170	176.13701480	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q174618
3950	Vaitupu	228	TV	VAI	VAI	\N	-7.47673270	178.67476750	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q632495
3951	Funafuti	228	TV	FUN	FUN	\N	-8.52114710	179.19619260	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q34126
3952	Nukufetau	228	TV	NKF	NKF	\N	-8.00000000	178.50000000	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q745924
3953	Nukulaelae	228	TV	NKL	NKL	\N	-9.38111100	179.85222200	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q128654
3954	Dhi Qar	104	IQ	09	DQ	governorate	31.10422920	46.36246860	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q215649
3955	Babylon	104	IQ	06	BB	governorate	32.46819100	44.55019350	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q59202
3956	Al-Qādisiyyah	104	IQ	04	QA	governorate	32.04369100	45.14945050	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q62987
3957	Karbala	104	IQ	12	KA	governorate	32.40454930	43.86732220	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q214104
3958	Al Muthanna	104	IQ	03	MU	governorate	29.91331710	45.29938620	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q212761
3959	Baghdad	104	IQ	07	BG	governorate	33.31526180	44.36606530	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q191075
3960	Basra	104	IQ	02	BA	governorate	30.51142520	47.82962530	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q193551
3961	Saladin	104	IQ	18	SD	governorate	34.53375270	43.48373800	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q190131
3962	Najaf	104	IQ	17	NA	governorate	31.35174860	44.09603110	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q192882
3963	Nineveh	104	IQ	15	NI	governorate	36.22957400	42.23624350	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q189352
3964	Al Anbar	104	IQ	01	AN	governorate	32.55976140	41.91964710	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q187334
3965	Diyala	104	IQ	10	DI	governorate	33.77334870	45.14945050	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q217075
3966	Maysan	104	IQ	14	MA	governorate	31.87340020	47.13621250	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q213170
3967	Dohuk	104	IQ	08	DA	governorate	36.90772520	43.06316890	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q189541
3968	Erbil	104	IQ	11	AR	governorate	36.55706280	44.38512630	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q213189
3969	Sulaymaniyah	104	IQ	05	SU	governorate	35.54663480	45.30036830	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q213182
3970	Wasit	104	IQ	16	WA	governorate	32.60240940	45.75209850	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q189747
3971	Kirkuk	104	IQ	13	KI	governorate	35.32920140	43.94367880	2019-10-05 23:18:56	2022-08-31 15:53:39	1	Q193268
3972	Svay Rieng	37	KH	18	20	province	11.14272200	105.82902980	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q751864
3973	Preah Vihear	37	KH	13	13	province	14.00857970	104.84546190	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q502151
3974	Prey Veng	37	KH	14	14	province	11.38024420	105.50054830	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q856788
3975	Takeo	37	KH	19	21	province	10.93215190	104.79877100	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q613345
3976	Battambang	37	KH	29	2	province	13.02869710	102.98961500	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q810923
3977	Pursat	37	KH	12	15	province	12.27209560	103.72891670	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q834464
3978	Kep	37	KH	26	23	province	10.53608900	104.35591580	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q852089
3979	Kampong Chhnang	37	KH	03	4	province	12.13923520	104.56552730	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q877468
3980	Pailin	37	KH	30	24	province	12.90929620	102.66755750	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q506646
3981	Kampot	37	KH	21	7	province	10.73253510	104.37919120	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q748470
3982	Koh Kong	37	KH	08	9	province	11.57628040	103.35872880	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q466000
3983	Kandal	37	KH	07	8	province	11.22373830	105.12589550	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q466031
3984	Banteay Meanchey	37	KH	25	1	province	13.75319140	102.98961500	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q3817
3985	Mondulkiri	37	KH	10	11	province	12.78794270	107.10119310	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q652830
3986	Kratie	37	KH	09	10	province	12.50436080	105.96998780	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q785896
3987	Oddar Meanchey	37	KH	27	22	province	14.16097380	103.82162610	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q629538
3988	Kampong Speu	37	KH	04	5	province	11.61551090	104.37919120	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q652867
3989	Sihanoukville	37	KH	28	18	province	10.75818990	103.82162610	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q220966
3990	Ratanakiri	37	KH	23	16	province	13.85766070	107.10119310	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q747846
3991	Kampong Cham	37	KH	02	3	province	12.09829180	105.31311850	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q142258
3992	Siem Reap	37	KH	24	17	province	13.33026600	104.10013260	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q652818
3993	Stung Treng	37	KH	17	19	province	13.57647300	105.96998780	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q837889
3994	Phnom Penh	37	KH	22	12	autonomous municipality	11.55637380	104.92820990	2019-10-05 23:18:56	2022-03-13 13:39:56	1	Q1850
3995	North Hamgyong Province	115	KP	17	09	\N	41.81487580	129.45819550	2019-10-05 23:18:56	2022-08-31 15:52:51	1	Q109361
3996	Ryanggang Province	115	KP	13	10	\N	41.23189210	128.50763590	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q110171
3997	South Pyongan Province	115	KP	15	02	\N	39.35391780	126.16827100	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q109380
3998	Chagang Province	115	KP	01	04	\N	40.72028090	126.56211370	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q272406
3999	Kangwon Province	115	KP	09	07	\N	38.84323930	127.55970670	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q41416
4000	South Hamgyong Province	115	KP	03	08	\N	40.37253390	128.29888400	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q109368
4001	Rason	115	KP	18	13	\N	42.25690630	130.29771860	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q221734
4002	North Pyongan Province	115	KP	11	03	\N	39.92556180	125.39280250	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q109348
4003	South Hwanghae Province	115	KP	06	05	\N	38.20072150	125.47819260	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q626052
4004	North Hwanghae Province	115	KP	07	06	\N	38.37860850	126.43643630	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q109342
4005	Pyongyang	115	KP	12	01	\N	39.03921930	125.76252410	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q18808
4006	Meghalaya	101	IN	18	ML	state	25.46703080	91.36621600	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1195
4007	Haryana	101	IN	10	HR	state	29.05877570	76.08560100	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1174
4008	Maharashtra	101	IN	16	MH	state	19.75147980	75.71388840	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1191
4009	Goa	101	IN	33	GA	state	15.29932650	74.12399600	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1171
4010	Manipur	101	IN	17	MN	state	24.66371730	93.90626880	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1193
4011	Puducherry	101	IN	22	PY	Union territory	11.94159150	79.80831330	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q66743
4012	Telangana	101	IN	40	TG	state	18.11243720	79.01929970	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q677037
4013	Odisha	101	IN	21	OR	state	20.95166580	85.09852360	2019-10-05 23:18:57	2022-10-06 12:09:54	1	Q22048
4014	Rajasthan	101	IN	24	RJ	state	27.02380360	74.21793260	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1437
4015	Punjab	101	IN	23	PB	state	31.14713050	75.34121790	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q22424
4016	Uttarakhand	101	IN	39	UT	state	30.06675300	79.01929970	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1499
4017	Andhra Pradesh	101	IN	02	AP	state	15.91289980	79.73998750	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1159
4018	Nagaland	101	IN	20	NL	state	26.15843540	94.56244260	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1599
4019	Lakshadweep	101	IN	14	LD	Union territory	10.32802650	72.78463360	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q26927
4020	Himachal Pradesh	101	IN	11	HP	state	31.10482940	77.17339010	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1177
4021	Delhi	101	IN	07	DL	Union territory	28.70405920	77.10249020	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1353
4022	Uttar Pradesh	101	IN	36	UP	state	26.84670880	80.94615920	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1498
4023	Andaman and Nicobar Islands	101	IN	01	AN	Union territory	11.74008670	92.65864010	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q40888
4024	Arunachal Pradesh	101	IN	30	AR	state	28.21799940	94.72775280	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1162
4025	Jharkhand	101	IN	38	JH	state	23.61018080	85.27993540	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1184
4026	Karnataka	101	IN	19	KA	state	15.31727750	75.71388840	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1185
4027	Assam	101	IN	03	AS	state	26.20060430	92.93757390	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1164
4028	Kerala	101	IN	13	KL	state	10.85051590	76.27108330	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1186
4029	Jammu and Kashmir	101	IN	12	JK	Union territory	33.27783900	75.34121790	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1180
4030	Gujarat	101	IN	09	GJ	state	22.25865200	71.19238050	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1061
4031	Chandigarh	101	IN	05	CH	Union territory	30.73331480	76.77941790	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q43433
4033	Dadra and Nagar Haveli and Daman and Diu	101	IN	32	DH	Union territory	20.39737360	72.83279910	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q66710
4034	Sikkim	101	IN	29	SK	state	27.53297180	88.51221780	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1505
4035	Tamil Nadu	101	IN	25	TN	state	11.12712250	78.65689420	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1445
4036	Mizoram	101	IN	31	MZ	state	23.16454300	92.93757390	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1502
4037	Bihar	101	IN	34	BR	state	25.09607420	85.31311940	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1165
4038	Tripura	101	IN	26	TR	state	23.94084820	91.98815270	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1363
4039	Madhya Pradesh	101	IN	35	MP	state	22.97342290	78.65689420	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1188
4040	Chhattisgarh	101	IN	37	CT	state	21.27865670	81.86614420	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1168
4041	Choluteca Department	97	HN	02	CH	\N	13.25043250	-87.14228950	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q899272
4042	Comayagua Department	97	HN	04	CM	\N	14.55348280	-87.61863790	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q823443
4043	El Paraíso Department	97	HN	07	EP	\N	13.98212940	-86.49965460	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q867108
4044	Intibucá Department	97	HN	10	IN	\N	14.37273400	-88.24611830	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q262125
4045	Bay Islands Department	97	HN	11	IB	\N	16.48266140	-85.87932520	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q751725
4046	Cortés Department	97	HN	06	CR	\N	15.49235080	-88.09007620	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q767244
4047	Atlántida Department	97	HN	01	AT	\N	15.66962830	-87.14228950	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q622619
4048	Gracias a Dios Department	97	HN	09	GD	\N	15.34180600	-84.60604490	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q867112
4049	Copán Department	97	HN	05	CP	\N	14.93608380	-88.86469800	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q843984
4050	Olancho Department	97	HN	15	OL	\N	14.80674060	-85.76666450	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q867089
4051	Colón Department	97	HN	03	CL	\N	15.64259650	-85.52002400	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q867117
4052	Francisco Morazán Department	97	HN	08	FM	\N	14.45411000	-87.06242610	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q867126
4053	Santa Bárbara Department	97	HN	16	SB	\N	15.12027950	-88.40160410	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q591139
4054	Lempira Department	97	HN	13	LE	\N	14.18876980	-88.55653100	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q744138
4055	Valle Department	97	HN	17	VA	\N	13.57829360	-87.57912870	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q867097
4056	Ocotepeque Department	97	HN	14	OC	\N	14.51703470	-89.05615320	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q867084
4057	Yoro Department	97	HN	18	YO	\N	15.29496790	-87.14228950	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1123380
4058	La Paz Department	97	HN	12	LP	\N	-15.08924160	-68.52471490	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q866886
4059	Northland Region	158	NZ	F6	NTL	\N	-35.41361720	173.93208060	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q59596
4060	Manawatu-Wanganui Region	158	NZ	F3	MWT	\N	-39.72733560	175.43755740	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q139907
4061	Waikato Region	158	NZ	G1	WKO	\N	-37.61908620	175.02334600	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q139918
4062	Otago Region	158	NZ	F7	OTA	\N	-45.47906710	170.15475670	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q692912
4063	Marlborough Region	158	NZ	F4	MBH	\N	-41.59168830	173.76240530	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q140083
4064	West Coast Region	158	NZ	G3	WTC	\N	62.41136340	-149.07297140	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q541468
4065	Wellington Region	158	NZ	G2	WGN	\N	-41.02993230	175.43755740	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q856010
4066	Canterbury Region	158	NZ	E9	CAN	\N	-43.75422750	171.16372450	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q657004
4067	Chatham Islands	158	NZ	10	CIT	\N	-44.00575230	-176.54006740	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q26882619
4068	Gisborne District	158	NZ	F1	GIS	\N	-38.13581740	178.32393090	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q140246
4069	Taranaki Region	158	NZ	F9	TKI	\N	-39.35381490	174.43827210	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q140207
4070	Nelson Region	158	NZ	F5	NSN	\N	-41.29853970	173.24414910	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1995856
4071	Southland Region	158	NZ	F8	STL	\N	-45.84891590	167.67553870	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q864971
4072	Auckland Region	158	NZ	E7	AUK	\N	-36.66753280	174.77333250	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q726917
4073	Tasman District	158	NZ	TAS	TAS	\N	-41.45711840	172.82097400	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q666142
4074	Bay of Plenty Region	158	NZ	E8	BOP	\N	-37.42339170	176.74163740	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q2192924
4075	Hawke\\"s Bay Region	158	NZ	F2	HKB	\N	-39.60165970	176.58044730	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q251825
4076	Saint John Parish	61	DM	05	05	\N	\N	\N	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1476285
4077	Saint Mark Parish	61	DM	08	08	\N	\N	\N	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1431115
4078	Saint David Parish	61	DM	03	03	\N	\N	\N	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1431129
4079	Saint George Parish	61	DM	04	04	\N	\N	\N	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q617801
4080	Saint Patrick Parish	61	DM	09	09	\N	\N	\N	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1431108
4081	Saint Peter Parish	61	DM	11	11	\N	40.45241940	-80.00850560	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1476294
4082	Saint Andrew Parish	61	DM	02	02	\N	\N	\N	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q732322
4083	Saint Luke Parish	61	DM	07	07	\N	42.10513630	-80.05707220	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1431099
4084	Saint Paul Parish	61	DM	10	10	\N	38.86146000	-90.74356190	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q339063
4085	Saint Joseph Parish	61	DM	06	06	\N	39.02227120	-94.71765040	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1476302
4086	El Seibo Province	62	DO	28	08	\N	18.76584960	-69.04066800	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1774831
4087	La Romana Province	62	DO	12	12	\N	18.43102710	-68.98373730	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1140742
4088	Sánchez Ramírez Province	62	DO	21	24	\N	19.05270600	-70.14922640	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1836903
4089	Hermanas Mirabal Province	62	DO	19	19	\N	19.37475590	-70.35132350	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q549386
4090	Barahona Province	62	DO	03	04	\N	18.21390660	-71.10437590	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1137551
4091	San Cristóbal Province	62	DO	33	21	\N	18.41804140	-70.10658490	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1366107
4092	Puerto Plata Province	62	DO	18	18	\N	19.75432250	-70.83328470	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q693487
4093	Santo Domingo Province	62	DO	37	32	\N	18.51042530	-69.84040540	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1352536
4094	María Trinidad Sánchez Province	62	DO	14	14	\N	19.37345970	-69.85144390	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1949656
4095	Distrito Nacional	62	DO	34	01	\N	18.48605750	-69.93121170	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q2499228
4096	Peravia Province	62	DO	35	17	\N	18.27865940	-70.33358870	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1331932
4097	Independencia	62	DO	09	10	\N	32.63357480	-115.42892940	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1424401
4098	San Juan Province	62	DO	23	22	\N	-31.52871270	-68.53604030	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q2001793
4099	Monseñor Nouel Province	62	DO	31	28	\N	18.92152340	-70.38368150	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1295496
4100	Santiago Rodríguez Province	62	DO	26	26	\N	19.47131810	-71.33958010	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q2021942
4101	Pedernales Province	62	DO	16	16	\N	17.85376260	-71.33032090	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1352533
4102	Espaillat Province	62	DO	08	09	\N	19.62776580	-70.27867750	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q530231
4103	Samaná Province	62	DO	20	20	\N	19.20583710	-69.33629490	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1145487
4104	Valverde Province	62	DO	27	27	\N	19.58812210	-70.98033100	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1774848
4105	Baoruco Province	62	DO	02	03	\N	18.48798980	-71.41822490	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q807079
4106	Hato Mayor Province	62	DO	29	30	\N	18.76357990	-69.25576370	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q937217
4107	Dajabón Province	62	DO	04	05	\N	19.54992410	-71.70865140	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1138575
4108	Santiago Province	62	DO	25	25	\N	-33.45000000	-70.66670000	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1772983
4109	La Altagracia Province	62	DO	10	11	\N	18.58502360	-68.62010720	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1323353
4110	San Pedro de Macorís	62	DO	24	23	\N	18.46266000	-69.30512340	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1366119
4111	Monte Plata Province	62	DO	32	29	\N	18.80808780	-69.78691460	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1772745
4112	San José de Ocoa Province	62	DO	36	31	\N	18.54385800	-70.50418160	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1424391
4113	Duarte Province	62	DO	06	06	\N	19.20908230	-70.02700040	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1262745
4114	Azua Province	62	DO	01	02	\N	18.45527090	-70.73809280	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q794239
4115	Monte Cristi Province	62	DO	15	15	\N	19.73968990	-71.44339840	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q592624
4116	La Vega Province	62	DO	30	13	\N	19.22115540	-70.52887530	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q594405
4117	Nord	95	HT	09	ND	\N	43.19052600	-89.43792100	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q943932
4118	Nippes	95	HT	15	NI	\N	18.39907350	-73.41802110	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q125232
4119	Grand\\"Anse	95	HT	14	GA	\N	12.01666670	-61.76666670	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q913231
4120	Ouest	95	HT	11	OU	\N	45.45472490	-73.65023650	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1434621
4121	Nord-Est	95	HT	10	NE	\N	19.48897230	-71.85713310	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q928694
4122	Sud	95	HT	12	SD	\N	29.92132480	-90.09737720	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q936704
4123	Artibonite	95	HT	06	AR	\N	19.36290200	-72.42581450	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q844024
4124	Sud-Est	95	HT	13	SE	\N	18.27835980	-72.35479150	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q936717
4125	Centre	95	HT	07	CE	\N	32.83702510	-96.77738820	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q844528
4126	Nord-Ouest	95	HT	03	NO	\N	19.83740090	-73.04052770	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q608361
4127	San Vicente Department	66	SV	12	SV	\N	13.58685610	-88.74939980	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1130180
4128	Santa Ana Department	66	SV	11	SA	\N	14.14611210	-89.51200840	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q671158
4129	Usulután Department	66	SV	14	US	\N	13.44706340	-88.55653100	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1122748
4130	Morazán Department	66	SV	08	MO	\N	13.76820000	-88.12913870	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1122836
4131	Chalatenango Department	66	SV	03	CH	\N	14.19166480	-89.17059980	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q522221
4132	Cabañas Department	66	SV	02	CA	\N	13.86482880	-88.74939980	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q914058
4133	San Salvador Department	66	SV	10	SS	\N	13.77399970	-89.20867730	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1543219
4134	La Libertad Department	66	SV	05	LI	\N	13.68176610	-89.36062980	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q930820
4135	San Miguel Department	66	SV	09	SM	\N	13.44510410	-88.24611830	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q930804
4136	La Paz Department	66	SV	06	PA	\N	\N	\N	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1129788
4137	Cuscatlán Department	66	SV	04	CU	\N	13.86619570	-89.05615320	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1130677
4138	La Unión Department	66	SV	07	UN	\N	13.48864430	-87.89424510	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1130688
4139	Ahuachapán Department	66	SV	01	AH	\N	13.82161480	-89.92532330	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q572993
4140	Sonsonate Department	66	SV	13	SO	\N	13.68235800	-89.66281110	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q212540
4141	Braslovče Municipality	201	SI	F7	151	\N	46.28361920	15.04183200	2019-10-05 23:18:57	2022-08-31 15:52:51	1	Q1034410
4142	Lenart Municipality	201	SI	I3	058	\N	46.58344240	15.82621250	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13365883
4143	Oplotnica	201	SI	J8	171	\N	46.38716300	15.44581310	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1587261
4144	Velike Lašče Municipality	201	SI	D8	134	\N	45.83365910	14.63623630	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13378281
4145	Hajdina Municipality	201	SI	G9	159	\N	46.41850140	15.82447220	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q995065
4146	Podčetrtek Municipality	201	SI	92	092	\N	46.17395420	15.60138160	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q999540
4147	Cankova Municipality	201	SI	F8	152	\N	46.71823700	16.01972220	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13377751
4148	Vitanje Municipality	201	SI	E2	137	\N	46.38153230	15.29506870	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13378288
4149	Sežana Municipality	201	SI	B7	111	\N	45.72751090	13.86619310	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q554854
4150	Kidričevo Municipality	201	SI	45	045	\N	46.39575720	15.79259060	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q776770
4151	Črenšovci Municipality	201	SI	15	015	\N	46.57200290	16.28773460	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q341658
4152	Idrija Municipality	201	SI	36	036	\N	46.00409390	13.97754930	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3441842
4153	Trnovska Vas Municipality	201	SI	M7	185	\N	46.52940350	15.88531180	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q999559
4154	Vodice Municipality	201	SI	E3	138	\N	46.18966430	14.49385390	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13378292
4155	Ravne na Koroškem Municipality	201	SI	K8	103	\N	46.55211940	14.95990840	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13378051
4156	Lovrenc na Pohorju Municipality	201	SI	I8	167	\N	46.54196380	15.40004430	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q25110
4157	Majšperk Municipality	201	SI	J1	069	\N	46.35030190	15.73405950	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1002371
4158	Loški Potok Municipality	201	SI	66	066	\N	45.69096370	14.59859700	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q999553
4159	Domžale Municipality	201	SI	G7	023	\N	46.14382690	14.63752790	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13377763
4160	Rečica ob Savinji Municipality	201	SI	O9	209	\N	46.32337900	14.92236700	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13378058
4161	Podlehnik Municipality	201	SI	K1	172	\N	46.33107820	15.87858360	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1002247
4162	Cerknica Municipality	201	SI	13	013	\N	45.79662550	14.39217700	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13107298
4163	Vransko Municipality	201	SI	N4	189	\N	46.23900600	14.95272490	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13378299
4164	Sveta Ana Municipality	201	SI	M3	181	\N	46.65000000	15.84527800	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q990063
4165	Brezovica Municipality	201	SI	09	008	\N	45.95593510	14.43499520	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q849320
4166	Benedikt Municipality	201	SI	F4	148	\N	46.61558410	15.89572810	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q779018
4167	Divača Municipality	201	SI	19	019	\N	45.68060690	13.97203120	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q557216
4168	Moravče Municipality	201	SI	77	077	\N	46.13627810	14.74600100	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1012761
4169	Slovenj Gradec City Municipality	201	SI	C2	112	\N	46.48777180	15.07294780	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3441817
4170	Škocjan Municipality	201	SI	B8	121	\N	45.91754540	15.31017360	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q391800
4171	Šentjur Municipality	201	SI	L7	120	\N	46.26543390	15.40800000	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13378384
4172	Pesnica Municipality	201	SI	89	089	\N	46.60887550	15.67570510	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q995048
4173	Dol pri Ljubljani Municipality	201	SI	22	022	\N	46.08843860	14.64247920	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q998557
4174	Loška Dolina Municipality	201	SI	I7	065	\N	45.64779080	14.49731470	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q999525
4175	Hoče–Slivnica Municipality	201	SI	H1	160	\N	46.47785800	15.64760050	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1008102
4176	Cerkvenjak Municipality	201	SI	F9	153	\N	46.56707110	15.94297530	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1252438
4177	Naklo Municipality	201	SI	82	082	\N	46.27186630	14.31569320	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1569014
4178	Cerkno Municipality	201	SI	14	014	\N	46.12884140	13.98940270	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13220435
4179	Bistrica ob Sotli Municipality	201	SI	F5	149	\N	46.05655790	15.66259470	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13377731
4180	Kamnik Municipality	201	SI	H6	043	\N	46.22216660	14.60707270	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3503153
4181	Bovec Municipality	201	SI	06	006	\N	46.33804950	13.55241740	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3259688
4182	Zavrč Municipality	201	SI	E9	143	\N	46.35713000	16.04777470	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q167001
4183	Ajdovščina Municipality	201	SI	01	001	\N	45.88707760	13.90428180	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q331701
4184	Pivka Municipality	201	SI	91	091	\N	45.67892960	14.25426890	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q252154
4185	Štore Municipality	201	SI	C9	127	\N	46.22225140	15.31261160	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q392468
4186	Kozje Municipality	201	SI	51	051	\N	46.07332110	15.55967190	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1009421
4187	Municipality of Škofljica	201	SI	C1	123	\N	45.98409620	14.57466260	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q392103
4188	Prebold Municipality	201	SI	K4	174	\N	46.23591360	15.09369120	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1016698
4189	Dobrovnik Municipality	201	SI	G5	156	\N	46.65386620	16.35065940	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13365892
4190	Mozirje Municipality	201	SI	79	079	\N	46.33943500	14.96024130	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q670975
4191	City Municipality of Celje	201	SI	11	011	\N	46.23974950	15.26770630	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3441823
4192	Žiri Municipality	201	SI	F2	147	\N	46.04724990	14.10984510	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q394087
4193	Horjul Municipality	201	SI	H3	162	\N	46.02253780	14.29862690	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1005185
4194	Tabor Municipality	201	SI	M5	184	\N	46.21079210	15.01742490	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q999530
4195	Radeče Municipality	201	SI	99	099	\N	46.06669540	15.18204380	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13377986
4196	Vipava Municipality	201	SI	E1	136	\N	45.84126740	13.96096130	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1002229
4197	Kungota	201	SI	55	055	\N	46.64187930	15.60362880	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q998566
4198	Slovenske Konjice Municipality	201	SI	C4	114	\N	46.33691910	15.42147080	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13378155
4199	Osilnica Municipality	201	SI	88	088	\N	45.54184670	14.71563030	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q778147
4200	Borovnica Municipality	201	SI	05	005	\N	45.90445250	14.38241890	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13377747
4201	Piran Municipality	201	SI	J9	090	\N	45.52888560	13.56807350	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q565170
4202	Bled Municipality	201	SI	03	003	\N	46.36832660	14.11457980	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q647572
4203	Jezersko Municipality	201	SI	H5	163	\N	46.39427940	14.49855590	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1688771
4204	Rače–Fram Municipality	201	SI	98	098	\N	46.45420830	15.63294670	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q731093
4205	Nova Gorica City Municipality	201	SI	84	084	\N	45.97627600	13.73088810	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3435478
4206	Razkrižje Municipality	201	SI	K9	176	\N	46.52263390	16.26686380	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3435117
4207	Ribnica na Pohorju Municipality	201	SI	L2	177	\N	46.53561450	15.26745380	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1009413
4208	Muta Municipality	201	SI	81	081	\N	46.60973660	15.16299950	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q6309297
4209	Rogatec Municipality	201	SI	A8	107	\N	46.22866260	15.69913380	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1027245
4210	Gorišnica Municipality	201	SI	28	028	\N	46.41202710	16.01330890	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q632998
4211	Kuzma Municipality	201	SI	I2	056	\N	46.83510380	16.08071000	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q906636
4212	Mislinja Municipality	201	SI	76	076	\N	46.44294030	15.19876780	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q999584
4213	Duplek Municipality	201	SI	26	026	\N	46.50100160	15.75463070	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q999589
4214	Trebnje Municipality	201	SI	D4	130	\N	45.90801630	15.01319050	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13378243
4215	Brežice Municipality	201	SI	08	009	\N	45.90410960	15.59436390	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q906879
4216	Dobrepolje Municipality	201	SI	20	020	\N	45.85249510	14.70831090	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1009409
4217	Grad Municipality	201	SI	G8	158	\N	46.80873200	16.10920600	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1019067
4218	Moravske Toplice Municipality	201	SI	78	078	\N	46.68569320	16.22245820	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3494723
4219	Luče Municipality	201	SI	I9	067	\N	46.35449250	14.74715040	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q669648
4220	Miren–Kostanjevica Municipality	201	SI	J5	075	\N	45.84360290	13.62766470	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q658076
4221	Ormož Municipality	201	SI	87	087	\N	46.43533330	16.15437400	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15900
4222	Šalovci Municipality	201	SI	L4	033	\N	46.85335680	16.25917910	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13378373
4223	Miklavž na Dravskem Polju Municipality	201	SI	J4	169	\N	46.50826280	15.69520650	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1005165
4224	Makole Municipality	201	SI	O5	198	\N	46.31686970	15.66641260	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1808143
4225	Lendava Municipality	201	SI	I4	059	\N	46.55134830	16.44198390	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q587328
4226	Vuzenica Municipality	201	SI	E6	141	\N	46.59808360	15.16572370	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q370390
4227	Kanal ob Soči Municipality	201	SI	44	044	\N	46.06735300	13.62033500	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3435496
4228	Ptuj City Municipality	201	SI	K7	096	\N	46.41995350	15.86968840	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3441808
4229	Sveti Andraž v Slovenskih Goricah Municipality	201	SI	M4	182	\N	46.51897470	15.94982620	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q925149
4230	Selnica ob Dravi Municipality	201	SI	L5	178	\N	46.55139180	15.49294100	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q919934
4231	Radovljica Municipality	201	SI	A3	102	\N	46.33558270	14.20945340	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15910
4232	Črna na Koroškem Municipality	201	SI	16	016	\N	46.47045290	14.84999980	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q279072
4233	Rogaška Slatina Municipality	201	SI	A7	106	\N	46.24539730	15.62650140	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15913
4234	Podvelka Municipality	201	SI	K2	093	\N	46.62219520	15.38899220	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1016800
4235	Ribnica Municipality	201	SI	L1	104	\N	45.74003030	14.72657820	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15912
4236	City Municipality of Novo Mesto	201	SI	J7	085	\N	45.80108240	15.17100890	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q398116
4237	Mirna Peč Municipality	201	SI	J6	170	\N	45.84815740	15.08794500	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1016805
4238	Križevci Municipality	201	SI	I1	166	\N	46.57018210	16.10926530	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q999563
4239	Poljčane Municipality	201	SI	O8	200	\N	46.31398530	15.57847910	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q594852
4240	Brda Municipality	201	SI	07	007	\N	45.99756520	13.52704740	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q763400
4241	Šentjernej Municipality	201	SI	B4	119	\N	45.84341300	15.33783120	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1016812
4242	Maribor City Municipality	201	SI	J2	070	\N	46.55064960	15.62054390	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3435104
4243	Kobarid Municipality	201	SI	46	046	\N	46.24569710	13.57869490	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q688287
4244	Markovci Municipality	201	SI	J3	168	\N	46.38793090	15.95860140	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1008095
4245	Vojnik Municipality	201	SI	N3	139	\N	46.29205810	15.30205800	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q2134561
4246	Trbovlje Municipality	201	SI	D3	129	\N	46.15035630	15.04531370	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15925
4247	Tolmin Municipality	201	SI	D2	128	\N	46.18571880	13.73198380	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15924
4248	Šoštanj Municipality	201	SI	C7	126	\N	46.37828360	15.04613780	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15923
4249	Žetale Municipality	201	SI	N6	191	\N	46.27428330	15.79133590	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q393910
4250	Tržič Municipality	201	SI	D5	131	\N	46.35935140	14.30066230	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15927
4251	Turnišče Municipality	201	SI	D6	132	\N	46.61375040	16.32021000	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q201074
4252	Dobrna Municipality	201	SI	G3	155	\N	46.33561410	15.22597320	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q999579
4253	Renče–Vogrsko Municipality	201	SI	P1	201	\N	45.89546170	13.67856730	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q612216
4254	Kostanjevica na Krki Municipality	201	SI	O3	197	\N	45.83166380	15.44119060	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q12062190
4255	Sveti Jurij ob Ščavnici Municipality	201	SI	O3	116	\N	46.56874520	16.02225280	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q920353
4256	Železniki Municipality	201	SI	F1	146	\N	46.22563770	14.16936170	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15932
4257	Veržej Municipality	201	SI	N1	188	\N	46.58411350	16.16208000	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1008086
4258	Žalec Municipality	201	SI	N5	190	\N	46.25197120	15.16500720	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15931
4259	Starše Municipality	201	SI	C8	115	\N	46.46743310	15.76405460	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1016826
4260	Sveta Trojica v Slovenskih Goricah Municipality	201	SI	P6	204	\N	46.56808090	15.88230640	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1016820
4261	Solčava Municipality	201	SI	M2	180	\N	46.40235260	14.68023040	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1313614
4262	Vrhnika Municipality	201	SI	E5	140	\N	45.95027190	14.32764220	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q9014817
4263	Središče ob Dravi	201	SI	P4	202	\N	46.39592820	16.27049150	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3441796
4264	Rogašovci Municipality	201	SI	A6	105	\N	46.80557850	16.03452370	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q599480
4265	Mežica Municipality	201	SI	74	074	\N	46.52150270	14.85213400	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q678147
4266	Juršinci Municipality	201	SI	42	042	\N	46.48986510	15.98092300	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1003984
4267	Velika Polana Municipality	201	SI	M9	187	\N	46.57317150	16.34441260	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q995101
4268	Sevnica Municipality	201	SI	B6	110	\N	46.00703170	15.30456790	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q11214302
4269	Zagorje ob Savi Municipality	201	SI	E7	142	\N	46.13452020	14.99643840	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13378328
4270	Ljubljana City Municipality	201	SI	61	061	\N	46.05694650	14.50575150	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3434113
4271	Gornji Petrovci Municipality	201	SI	31	031	\N	46.80371280	16.21913790	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3435689
4272	Polzela Municipality	201	SI	K3	173	\N	46.28089700	15.07373210	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q938443
4273	Sveti Tomaž Municipality	201	SI	P8	205	\N	46.48352830	16.07944200	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1016831
4274	Prevalje Municipality	201	SI	K6	175	\N	46.56211460	14.88478610	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q650009
4275	Radlje ob Dravi Municipality	201	SI	A2	101	\N	46.61357320	15.23544380	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1005364
4276	Žirovnica Municipality	201	SI	N7	192	\N	46.39544030	14.15396320	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q394103
4277	Sodražica Municipality	201	SI	M1	179	\N	45.76165650	14.63528530	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1008079
4278	Bloke Municipality	201	SI	F6	150	\N	45.77281410	14.50634590	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q164123
4279	Šmartno pri Litiji Municipality	201	SI	L9	194	\N	46.04549710	14.84101330	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13378453
4280	Ruše Municipality	201	SI	L3	108	\N	46.52062650	15.48178690	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3346841
4281	Dolenjske Toplice Municipality	201	SI	G6	157	\N	45.73457110	15.01294930	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1016840
4282	Bohinj Municipality	201	SI	04	004	\N	46.30056520	13.94271950	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3661628
4283	Komenda Municipality	201	SI	H8	164	\N	46.20648800	14.53824990	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q963986
4284	Gorje Municipality	201	SI	H8	207	\N	46.38024580	14.06853390	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1027062
4285	Šmarje pri Jelšah Municipality	201	SI	C5	124	\N	46.22870250	15.51903530	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q392173
4286	Ig Municipality	201	SI	37	037	\N	45.95888680	14.52705280	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q917397
4287	Kranj City Municipality	201	SI	52	052	\N	46.25850210	14.35435690	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3441893
4288	Puconci Municipality	201	SI	97	097	\N	46.72004180	16.09977920	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q921092
4289	Šmarješke Toplice Municipality	201	SI	P3	206	\N	45.86803770	15.23474220	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3509893
4290	Dornava Municipality	201	SI	24	024	\N	46.44435130	15.98891590	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1003969
4291	Črnomelj Municipality	201	SI	17	017	\N	45.53612250	15.19441430	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3482211
4292	Radenci Municipality	201	SI	A1	100	\N	46.62311210	16.05069030	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q338743
4293	Gorenja Vas–Poljane Municipality	201	SI	27	027	\N	46.11165820	14.11493480	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1005224
4294	Ljubno Municipality	201	SI	62	062	\N	46.34431250	14.83354920	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q773659
4295	Dobje Municipality	201	SI	G2	154	\N	46.13700370	15.39412900	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1008179
4296	Šmartno ob Paki Municipality	201	SI	C6	125	\N	46.32903720	15.03339370	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q392188
4297	Mokronog–Trebelno Municipality	201	SI	C6	199	\N	45.90885290	15.15967360	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1027078
4298	Mirna Municipality	201	SI	C6	212	\N	45.95156470	15.06209770	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1515842
4299	Šenčur Municipality	201	SI	B2	117	\N	46.24336990	14.41922230	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q2346638
4300	Videm Municipality	201	SI	N2	135	\N	46.36383300	15.87812120	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1002863
4301	Beltinci Municipality	201	SI	02	002	\N	46.60791530	16.23651270	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q778542
4302	Lukovica Municipality	201	SI	68	068	\N	46.16962930	14.69072590	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q946766
4303	Preddvor Municipality	201	SI	K5	095	\N	46.30171390	14.42181650	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q539864
4304	Destrnik Municipality	201	SI	G1	018	\N	46.49223680	15.87779560	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q570618
4305	Ivančna Gorica Municipality	201	SI	39	039	\N	45.93958410	14.80476260	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1008048
4306	Log–Dragomer Municipality	201	SI	39	208	\N	46.01787470	14.36877670	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1027089
4307	Žužemberk Municipality	201	SI	N8	193	\N	45.82003500	14.95359190	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13377798
4308	Dobrova–Polhov Gradec Municipality	201	SI	G4	021	\N	46.06488960	14.31681950	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1005208
4309	Municipality of Cirkulane	201	SI	G4	196	\N	46.32983220	15.99806660	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13370246
4310	Cerklje na Gorenjskem Municipality	201	SI	12	012	\N	46.25170540	14.48579790	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q859679
4311	Šentrupert Municipality	201	SI	P2	211	\N	45.98731420	15.08297830	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3487128
4312	Tišina Municipality	201	SI	M6	010	\N	46.65418840	16.07547810	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1276793
4313	Murska Sobota City Municipality	201	SI	80	080	\N	46.64321470	16.15157540	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q9273677
4314	Municipality of Krško	201	SI	54	054	\N	45.95896090	15.49235550	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3484655
4315	Komen Municipality	201	SI	49	049	\N	45.81752350	13.74827110	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15283322
4316	Škofja Loka Municipality	201	SI	B9	122	\N	46.14098440	14.28118730	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q2318898
4317	Šempeter–Vrtojba Municipality	201	SI	L6	183	\N	45.92900950	13.64155940	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q391428
4318	Municipality of Apače	201	SI	N9	195	\N	46.69746790	15.91025340	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3278915
4319	Koper City Municipality	201	SI	50	050	\N	45.54805900	13.73018770	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q556203
4320	Odranci Municipality	201	SI	86	086	\N	46.59010170	16.27881650	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q924698
4321	Hrpelje–Kozina Municipality	201	SI	35	035	\N	45.60911920	13.93791480	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q556206
4322	Izola Municipality	201	SI	40	040	\N	45.53135570	13.66646490	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q12042076
4323	Metlika Municipality	201	SI	73	073	\N	45.64807150	15.31778380	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3441856
4324	Šentilj Municipality	201	SI	B3	118	\N	46.68628390	15.71035670	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q391446
4325	Kobilje Municipality	201	SI	47	047	\N	46.68518000	16.39367190	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q927718
4326	Ankaran Municipality	201	SI	P9	213	\N	45.57845100	13.73691740	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q12042075
4327	Hodoš Municipality	201	SI	H2	161	\N	46.83141340	16.32106800	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13365904
4328	Sveti Jurij v Slovenskih Goricah Municipality	201	SI	D1	210	\N	46.61707910	15.78046770	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1008144
4329	Nazarje Municipality	201	SI	83	083	\N	46.28217410	14.92256290	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q954987
4330	Postojna Municipality	201	SI	94	094	\N	45.77493900	14.21342630	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q2242799
4331	Kostel Municipality	201	SI	H9	165	\N	45.49282550	14.87082350	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3434092
4332	Slovenska Bistrica Municipality	201	SI	L8	113	\N	46.39198130	15.57278690	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q11211457
4333	Straža Municipality	201	SI	P5	203	\N	45.77684280	15.09486940	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1784972
4334	Trzin Municipality	201	SI	M8	186	\N	46.12982410	14.55776370	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q773160
4335	Kočevje Municipality	201	SI	H7	048	\N	45.64280000	14.86158380	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15884
4336	Grosuplje Municipality	201	SI	32	032	\N	45.95576450	14.65889900	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13377778
4337	Jesenice Municipality	201	SI	H4	041	\N	46.43670470	14.05260570	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15881
4338	Laško Municipality	201	SI	57	057	\N	46.15422360	15.23614910	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15887
4339	Gornji Grad Municipality	201	SI	30	030	\N	46.29617120	14.80623470	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q726548
4340	Kranjska Gora Municipality	201	SI	53	053	\N	46.48452930	13.78571450	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q507051
4341	Hrastnik Municipality	201	SI	34	034	\N	46.14172880	15.08448940	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13377780
4342	Zreče Municipality	201	SI	F3	144	\N	46.41777860	15.37094310	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q227163
4343	Gornja Radgona Municipality	201	SI	29	029	\N	46.67670990	15.99108470	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q570397
4344	Municipality of Ilirska Bistrica	201	SI	38	038	\N	45.57913230	14.28097290	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q13377784
4345	Dravograd Municipality	201	SI	25	025	\N	46.58921900	15.02460210	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q3503123
4346	Semič Municipality	201	SI	B1	109	\N	45.65205340	15.18207010	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q1587704
4347	Litija Municipality	201	SI	I5	060	\N	46.05732260	14.83096360	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15891
4348	Mengeš Municipality	201	SI	72	072	\N	46.16591220	14.57196940	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15895
4349	Medvode Municipality	201	SI	71	071	\N	46.14190800	14.40325960	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15894
4350	Logatec Municipality	201	SI	64	064	\N	45.91761100	14.23514510	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15893
4351	Ljutomer Municipality	201	SI	I6	063	\N	46.51908480	16.18932160	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q15892
4352	Banská Bystrica Region	200	SK	01	BC	\N	48.53124990	19.38287400	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q183640
4353	Košice Region	200	SK	03	KI	\N	48.63757370	21.08342250	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q186295
4354	Prešov Region	200	SK	05	PV	\N	49.17167730	21.37420010	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q189001
4355	Trnava Region	200	SK	07	TA	\N	48.39438980	17.72162050	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q181342
4356	Bratislava Region	200	SK	02	BL	\N	48.31183040	17.19732990	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q183498
4357	Nitra Region	200	SK	04	NI	\N	48.01437650	18.54165040	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q184548
4358	Trenčín Region	200	SK	06	TC	\N	48.80867580	18.23240260	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q183139
4359	Žilina Region	200	SK	08	ZI	\N	49.20314350	19.36457330	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q184228
4360	Cimișlia District	144	MD	68	CM	\N	46.52508510	28.77218350	2019-10-05 23:18:58	2022-08-31 15:52:51	1	Q286646
4361	Orhei District	144	MD	82	OR	\N	47.38604000	28.83030820	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2112462
4362	Bender Municipality	144	MD	62	BD	\N	46.82275510	29.46201010	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q18088065
4363	Nisporeni District	144	MD	80	NI	\N	47.07513490	28.17681550	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q878266
4364	Sîngerei District	144	MD	85	SI	\N	47.63891340	28.13718160	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1796621
4365	Căușeni District	144	MD	67	CS	\N	46.65547150	29.40912220	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2128869
4366	Călărași District	144	MD	66	CL	\N	47.28694600	28.27453100	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2128868
4367	Glodeni District	144	MD	76	GL	\N	47.77901560	27.51680100	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q860716
4368	Anenii Noi District	144	MD	59	AN	\N	46.87956630	29.23121750	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q769224
4369	Ialoveni District	144	MD	78	IA	\N	46.86308600	28.82342180	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2128964
4370	Florești District	144	MD	75	FL	\N	47.86678490	28.33918640	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q865726
4371	Telenești District	144	MD	91	TE	\N	47.49839620	28.36760190	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2129025
4372	Taraclia District	144	MD	90	TA	\N	45.89865100	28.66716440	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q865884
4373	Chișinău Municipality	144	MD	57	CU	\N	47.01045290	28.86381020	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q17176229
4374	Soroca District	144	MD	87	SO	\N	48.15497430	28.28707830	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2129022
4375	Briceni District	144	MD	63	BR	\N	48.36320220	27.07503980	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q753795
4376	Rîșcani District	144	MD	84	RI	\N	47.90701530	27.53749960	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q611656
4377	Strășeni District	144	MD	89	ST	\N	47.14502670	28.61367360	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q878308
4378	Ștefan Vodă District	144	MD	88	SV	\N	46.55404880	29.70224200	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2129061
4379	Basarabeasca District	144	MD	61	BS	\N	46.42370600	28.89354920	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1980044
4380	Cantemir District	144	MD	65	CT	\N	46.27717420	28.20096530	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q684183
4381	Fălești District	144	MD	74	FA	\N	47.56477250	27.72655930	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q878375
4382	Hîncești District	144	MD	77	HI	\N	46.82811470	28.58508890	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q878297
4383	Dubăsari District	144	MD	72	DU	\N	47.26439420	29.15503480	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q878278
4384	Dondușeni District	144	MD	70	DO	\N	48.23383050	27.59980870	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1061128
4385	Gagauzia	144	MD	51	GA	\N	46.09794350	28.63846450	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q164819
4386	Ungheni District	144	MD	92	UN	\N	47.23057670	27.78926610	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q854443
4387	Edineț District	144	MD	73	ED	\N	48.16789910	27.29361430	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q878290
4388	Șoldănești District	144	MD	86	SD	\N	47.81473890	28.78895860	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q865639
4389	Ocnița District	144	MD	81	OC	\N	48.41104350	27.47680920	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q266444
4390	Criuleni District	144	MD	69	CR	\N	47.21361140	29.15575190	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2128862
4391	Cahul District	144	MD	64	CA	\N	45.89394040	28.18902750	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2128882
4392	Drochia District	144	MD	71	DR	\N	48.07977880	27.86041140	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q865594
4393	Bălți Municipality	144	MD	60	BA	\N	47.75399470	27.91841480	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q29017181
4394	Rezina District	144	MD	83	RE	\N	47.71804470	28.88710240	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q878317
4395	Transnistria autonomous territorial unit	144	MD	58	SN	\N	47.21529720	29.46380540	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q648767
4396	Salacgrīva Municipality	120	LV	C1	086	\N	57.75808830	24.35431810	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2251931
4397	Vecumnieki Municipality	120	LV	E4	105	\N	56.60623370	24.52218910	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2299436
4398	Naukšēni Municipality	120	LV	97	064	\N	57.92953610	25.51192660	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q773027
4399	Ilūkste Municipality	120	LV	69	036	\N	55.97825470	26.29650880	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2025473
4400	Gulbene Municipality	120	LV	09	033	\N	57.21556450	26.64529550	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q209187
4401	Līvāni Municipality	120	LV	90	056	\N	56.35509420	26.17251900	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2277489
4402	Salaspils Municipality	120	LV	C3	087	\N	56.86081520	24.34978810	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2140753
4403	Ventspils Municipality	120	LV	33	106	\N	57.28336820	21.85875580	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1345325
4404	Rundāle Municipality	120	LV	B9	083	\N	56.40972100	24.01241390	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2122124
4405	Pļaviņas Municipality	120	LV	A6	072	\N	56.61773130	25.71940430	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q865649
4406	Vārkava Municipality	120	LV	E2	103	\N	56.24657440	26.56643710	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1023757
4407	Jaunpiebalga Municipality	120	LV	72	039	\N	57.14334710	25.99518880	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2306846
4408	Sēja Municipality	120	LV	29	090	\N	57.20069950	24.59228210	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2299447
4409	Tukums Municipality	120	LV	29	099	\N	56.96728680	23.15243790	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q369007
4410	Cibla Municipality	120	LV	56	023	\N	56.61023440	27.86965980	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1955102
4411	Burtnieki Municipality	120	LV	52	019	\N	57.69490040	25.27647770	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2079428
4412	Ķegums Municipality	120	LV	79	051	\N	56.74753570	24.71736450	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2072209
4413	Krustpils Municipality	120	LV	85	049	\N	56.54155780	26.24463970	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2277478
4414	Cesvaine Municipality	120	LV	55	021	\N	56.96792640	26.30831720	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2327041
4415	Skrīveri Municipality	120	LV	C8	092	\N	56.67613910	25.09788490	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2286864
4416	Ogre Municipality	120	LV	21	067	\N	56.81473550	24.60445550	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2321579
4417	Olaine Municipality	120	LV	A2	068	\N	56.79523530	24.01535890	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2451375
4418	Limbaži Municipality	120	LV	18	054	\N	57.54032270	24.71344510	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1579076
4419	Lubāna Municipality	120	LV	91	057	\N	56.89992690	26.71987890	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2072165
4420	Kandava Municipality	120	LV	77	043	\N	57.03406730	22.78018130	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2024643
4421	Ventspils	120	LV	32	VEN	\N	57.39372160	21.56470660	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q104036
4422	Krimulda Municipality	120	LV	84	048	\N	57.17912730	24.71401270	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2302998
4423	Rugāji Municipality	120	LV	B7	082	\N	57.00560230	27.13172030	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1837354
4424	Jelgava Municipality	120	LV	12	041	\N	56.58956890	23.66104810	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1579113
4425	Valka Municipality	120	LV	30	101	\N	57.77439000	26.01700500	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1945263
4426	Rūjiena Municipality	120	LV	B8	084	\N	57.89372910	25.33910080	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2299415
4427	Babīte Municipality	120	LV	45	012	\N	56.95415500	23.94539900	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2079353
4428	Dundaga Municipality	120	LV	60	027	\N	57.50491670	22.35051140	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2274832
4429	Priekule Municipality	120	LV	A8	074	\N	56.41794130	21.55033360	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2304893
4430	Zilupe Municipality	120	LV	E9	110	\N	56.30189850	28.13395900	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q3274762
4431	Varakļāni Municipality	120	LV	E1	102	\N	56.66880060	26.56364140	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q432596
4432	Nereta Municipality	120	LV	98	065	\N	56.19866550	25.32529690	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2161795
4433	Madona Municipality	120	LV	20	059	\N	56.85989230	26.22762010	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2198472
4434	Sala Municipality	120	LV	20	085	\N	59.96796130	16.49782170	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2375848
4435	Ķekava Municipality	120	LV	80	052	\N	56.80643510	24.19394930	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2268947
4436	Nīca Municipality	120	LV	99	066	\N	56.34649830	21.06549300	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1950456
4437	Dobele Municipality	120	LV	08	026	\N	56.62630500	23.28090660	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q519580
4438	Jēkabpils Municipality	120	LV	10	042	\N	56.29193200	25.98120170	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1579101
4439	Saldus Municipality	120	LV	27	088	\N	56.66650880	22.49354930	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2299261
4440	Roja Municipality	120	LV	B4	079	\N	57.50467130	22.80121640	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2302986
4441	Iecava Municipality	120	LV	67	034	\N	56.59867930	24.19962720	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2337266
4442	Ozolnieki Municipality	120	LV	A3	069	\N	56.67563050	23.89948160	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2304926
4443	Saulkrasti Municipality	120	LV	C5	089	\N	57.25794180	24.41831460	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q371429
4444	Ērgļi Municipality	120	LV	63	030	\N	56.92370650	25.67538520	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2079406
4445	Aglona Municipality	120	LV	35	001	\N	56.10890060	27.12862270	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2045300
4446	Jūrmala	120	LV	13	JUR	\N	56.94707900	23.61684850	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q178382
4447	Skrunda Municipality	120	LV	C9	093	\N	56.66434580	22.00457290	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2299239
4448	Engure Municipality	120	LV	62	029	\N	57.16235000	23.21966340	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2079455
4449	Inčukalns Municipality	120	LV	70	037	\N	57.09943420	24.68555700	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2252820
4450	Mārupe Municipality	120	LV	95	062	\N	56.89657170	24.04600490	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2232018
4451	Mērsrags Municipality	120	LV	95	063	\N	57.33068810	23.10237070	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2416186
4452	Koknese Municipality	120	LV	82	046	\N	56.72055600	25.48939090	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q865682
4453	Kārsava Municipality	120	LV	78	044	\N	56.76458420	27.73582950	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2395952
4454	Carnikava Municipality	120	LV	53	020	\N	57.10241210	24.21086620	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2453125
4455	Rēzekne Municipality	120	LV	53	077	\N	56.32736380	27.32843310	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1518841
4456	Viesīte Municipality	120	LV	E6	107	\N	56.31130850	25.50704640	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2093996
4457	Ape Municipality	120	LV	43	009	\N	57.53926970	26.69416490	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2343837
4458	Durbe Municipality	120	LV	61	028	\N	56.62798570	21.49162450	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1962356
4459	Talsi Municipality	120	LV	28	097	\N	57.34152080	22.57131250	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2302964
4460	Liepāja	120	LV	16	LPX	\N	56.50466780	21.01080600	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q167668
4461	Mālpils Municipality	120	LV	94	061	\N	57.00841190	24.95742780	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2304902
4462	Smiltene Municipality	120	LV	D1	094	\N	57.42303320	25.90027800	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1959984
4463	Daugavpils	120	LV	06	DGV	\N	55.87473600	26.53617900	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q80021
4464	Jēkabpils	120	LV	74	JKB	\N	56.50145500	25.87829900	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q191120
4465	Bauska Municipality	120	LV	04	016	\N	56.41018680	24.20006890	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2365998
4466	Vecpiebalga Municipality	120	LV	E3	104	\N	57.06033560	25.81615920	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1920815
4467	Pāvilosta Municipality	120	LV	A5	071	\N	56.88654240	21.19468490	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1942469
4468	Brocēni Municipality	120	LV	51	018	\N	56.73475410	22.63573710	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q865717
4469	Cēsis Municipality	120	LV	05	022	\N	57.31028970	25.26761250	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1989164
4470	Grobiņa Municipality	120	LV	65	032	\N	56.53963200	21.16689200	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2320320
4471	Beverīna Municipality	120	LV	50	017	\N	57.51971090	25.60736540	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2018692
4472	Aizkraukle Municipality	120	LV	01	002	\N	56.64610800	25.23708540	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q865676
4473	Valmiera	120	LV	31	VMR	\N	57.53846590	25.42636180	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q108037
4474	Krāslava Municipality	120	LV	14	047	\N	55.89514640	27.18145770	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1831695
4475	Jaunjelgava Municipality	120	LV	71	038	\N	56.52836590	25.39214430	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2880128
4476	Sigulda Municipality	120	LV	C7	091	\N	57.10550920	24.83142590	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2299251
4477	Viļaka Municipality	120	LV	E7	108	\N	57.17222630	27.66731880	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1869075
4478	Stopiņi Municipality	120	LV	D2	095	\N	56.93644900	24.28729490	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2299214
4479	Rauna Municipality	120	LV	B1	076	\N	57.33169300	25.61003390	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2124808
4480	Tērvete Municipality	120	LV	D5	098	\N	56.41192010	23.31883320	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2269685
4481	Auce Municipality	120	LV	44	010	\N	56.46016800	22.90547810	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1934932
4482	Baldone Municipality	120	LV	46	013	\N	56.74246000	24.39115440	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2030886
4483	Preiļi Municipality	120	LV	22	073	\N	56.15111570	26.74397670	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2277469
4484	Aloja Municipality	120	LV	39	005	\N	57.76713600	24.87708390	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2989420
4485	Alsunga Municipality	120	LV	40	006	\N	56.98285310	21.55559190	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1995769
4486	Viļāni Municipality	120	LV	E8	109	\N	56.54561710	26.91679270	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2018681
4487	Alūksne Municipality	120	LV	02	007	\N	57.42544850	27.04249680	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q3393445
4488	Līgatne Municipality	120	LV	88	055	\N	57.19442040	25.09406810	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1023736
4489	Jaunpils Municipality	120	LV	73	040	\N	56.73141940	23.01256160	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2072154
4490	Kuldīga Municipality	120	LV	15	050	\N	56.96872570	21.96137390	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2337188
4491	Riga	120	LV	25	RIX	\N	56.94964870	24.10518650	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1773
4492	Daugavpils Municipality	120	LV	07	025	\N	55.89917830	26.61020120	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q960572
4493	Ropaži Municipality	120	LV	B5	080	\N	56.96157860	24.60104760	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q11068461
4494	Strenči Municipality	120	LV	D3	096	\N	57.62254710	25.80480860	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2299223
4495	Kocēni Municipality	120	LV	81	045	\N	57.52262920	25.33495070	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2304840
4496	Aizpute Municipality	120	LV	37	003	\N	56.71825960	21.60727590	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2485015
4497	Amata Municipality	120	LV	42	008	\N	56.99387260	25.26276750	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1892063
4498	Baltinava Municipality	120	LV	47	014	\N	56.94584680	27.64410660	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2361012
4499	Aknīste Municipality	120	LV	38	004	\N	56.16130370	25.74848270	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q865658
4500	Jelgava	120	LV	11	JEL	\N	56.65110910	23.72135410	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q179830
4501	Ludza Municipality	120	LV	19	058	\N	56.54595900	27.71431990	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q932445
4502	Riebiņi Municipality	120	LV	B3	078	\N	56.34361900	26.80181380	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2106159
4503	Rucava Municipality	120	LV	B6	081	\N	56.15931240	21.16181210	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2124995
4504	Dagda Municipality	120	LV	57	024	\N	56.09560890	27.53245900	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2361131
4505	Balvi Municipality	120	LV	03	015	\N	57.13262400	27.26466850	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2018672
4506	Priekuļi Municipality	120	LV	A9	075	\N	57.36171380	25.44104230	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2299231
4507	Pārgauja Municipality	120	LV	A4	070	\N	57.36481220	24.98220450	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2304831
4508	Vaiņode Municipality	120	LV	D7	100	\N	56.41542710	21.85139840	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q511151
4509	Rēzekne	120	LV	23	REZ	\N	56.50992230	27.33313570	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q180379
4510	Garkalne Municipality	120	LV	64	031	\N	57.01903870	24.38261810	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2171669
4511	Ikšķile Municipality	120	LV	68	035	\N	56.83736670	24.49747450	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2337298
4512	Lielvārde Municipality	120	LV	87	053	\N	56.73929760	24.97116180	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q279004
4513	Mazsalaca Municipality	120	LV	96	060	\N	57.92677490	25.06698950	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q2283334
4514	Viqueque Municipality	63	TL	VI	VI	\N	-8.85979180	126.36335160	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q610726
4515	Liquiçá Municipality	63	TL	LI	LI	\N	-8.66740950	125.25879640	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q860897
4516	Ermera District	63	TL	ER	ER	\N	-8.75248020	125.39872940	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q668171
4517	Manatuto District	63	TL	MT	MT	\N	-8.51556080	126.01592550	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q860630
4518	Ainaro Municipality	63	TL	AN	AN	\N	-9.01131710	125.52200120	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q405926
4519	Manufahi Municipality	63	TL	MF	MF	\N	-9.01454950	125.82799590	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q629934
4520	Aileu municipality	63	TL	AL	AL	\N	-8.70439940	125.60954740	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q405100
4521	Baucau Municipality	63	TL	BA	BA	\N	-8.47143080	126.45759910	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q811132
4522	Cova Lima Municipality	63	TL	CO	CO	\N	-9.26503750	125.25879640	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q165575
4523	Lautém Municipality	63	TL	LA	LA	\N	-8.36423070	126.90438450	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q686554
4524	Dili municipality	63	TL	DI	DI	\N	-8.24496130	125.58766970	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q860901
4525	Bobonaro Municipality	63	TL	BO	BO	\N	-8.96554060	125.25879640	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q860913
4526	Peleliu	168	PW	15	350	\N	7.00229060	134.24316280	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q497981
4527	Ngardmau	168	PW	10	222	\N	7.58504860	134.55960890	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1144496
4528	Airai	168	PW	02	004	\N	7.39661180	134.56902250	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q407967
4529	Hatohobei	168	PW	04	050	\N	3.00706580	131.12377810	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q3516752
4530	Melekeok	168	PW	07	212	\N	7.51502860	134.59725180	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q12898552
4531	Ngatpang	168	PW	11	224	\N	7.47109940	134.52664660	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q430385
4532	Koror	168	PW	06	150	\N	7.33756460	134.48894690	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q189426
4533	Ngarchelong	168	PW	09	218	\N	7.71054690	134.63016460	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1070185
4534	Ngiwal	168	PW	14	228	\N	7.56147640	134.61606190	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1154101
4535	Sonsorol	168	PW	16	370	\N	5.32681190	132.22391170	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q866699
4536	Ngchesar	168	PW	12	226	\N	7.45232800	134.57843420	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1070180
4537	Ngaraard	168	PW	08	214	\N	7.60794000	134.63486450	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1154127
4538	Angaur	168	PW	03	010	\N	6.90922300	134.13879340	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q530813
4539	Kayangel	168	PW	05	100	\N	8.07000000	134.70277800	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q871222
4540	Aimeliik	168	PW	01	002	\N	7.44558590	134.50308780	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q405589
4541	Ngeremlengui	168	PW	13	227	\N	7.51983970	134.55960890	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q975076
4542	Břeclav	58	CZ	13	644	\N	48.75314000	16.88251690	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q582488
4543	Český Krumlov	58	CZ	79	312	\N	48.81273540	14.31746570	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q605208
4544	Plzeň-město	58	CZ	87	323	\N	49.73843140	13.37363710	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q1080673
4545	Brno-venkov	58	CZ	87	643	\N	49.12501380	16.45588240	2019-10-05 23:18:59	2022-08-31 15:52:51	1	Q286787
4546	Příbram	58	CZ	87	20B	\N	49.69479590	14.08238100	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q852457
4547	Pardubice	58	CZ	87	532	\N	49.94444790	16.28569160	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q838301
4548	Nový Jičín	58	CZ	87	804	\N	49.59432510	18.01353560	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q517427
4550	Náchod	58	CZ	87	523	\N	50.41457220	16.16563470	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q838308
4551	Prostějov	58	CZ	87	713	\N	49.44184010	17.12779040	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q837629
4552	Zlínský kraj	58	CZ	90	72	\N	49.21622960	17.77203530	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q192536
4553	Chomutov	58	CZ	90	422	\N	50.45838720	13.30179100	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q161094
4554	Středočeský kraj	58	CZ	88	20	\N	49.87822230	14.93629550	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q188399
4556	České Budějovice	58	CZ	88	311	\N	48.97755530	14.51507470	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q753120
4558	Rakovník	58	CZ	88	20C	\N	50.10612300	13.73966230	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q338296
4559	Frýdek-Místek	58	CZ	88	802	\N	49.68193050	18.36732160	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q175781
4560	Písek	58	CZ	88	314	\N	49.34199380	14.24697600	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q594929
4561	Hodonín	58	CZ	88	645	\N	48.85293910	17.12600250	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q637425
4563	Zlín	58	CZ	90	724	\N	49.16960520	17.80252200	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q262111
4564	Plzeň-sever	58	CZ	87	325	\N	49.87748930	13.25374280	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q266036
4565	Tábor	58	CZ	87	317	\N	49.36462930	14.71912930	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q117503
4568	Brno-město	58	CZ	87	642	\N	49.19506020	16.60683710	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q850531
4571	Svitavy	58	CZ	87	533	\N	49.75516290	16.46918610	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q852438
4572	Vsetín	58	CZ	87	723	\N	49.37932500	18.06181620	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q852541
4573	Cheb	58	CZ	87	411	\N	50.07953340	12.36986360	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q628280
4574	Olomouc	58	CZ	84	712	\N	49.59377800	17.25087870	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q375466
4575	Kraj Vysočina	58	CZ	80	63	\N	49.44900520	15.64059340	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q190930
4576	Ústecký kraj	58	CZ	89	42	\N	50.61190370	13.78700860	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q192702
4578	Prachatice	58	CZ	89	315	\N	49.01091000	14.00000050	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q385016
4579	Trutnov	58	CZ	89	525	\N	50.56538380	15.90909230	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q517734
4580	Hradec Králové	58	CZ	82	521	\N	50.24148050	15.67430000	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q176082
4581	Karlovarský kraj	58	CZ	81	41	\N	50.14350000	12.75018990	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q191091
4582	Nymburk	58	CZ	81	208	\N	50.18558160	15.04366040	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q852491
4583	Rokycany	58	CZ	81	326	\N	49.82628270	13.68749430	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q643400
4584	Ostrava-město	58	CZ	81	806	\N	49.82092260	18.26252430	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q918108
4586	Karviná	58	CZ	81	803	\N	49.85665240	18.54321860	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q852496
4588	Pardubický kraj	58	CZ	86	53	\N	49.94444790	16.28569160	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q193317
4589	Olomoucký kraj	58	CZ	84	71	\N	49.65865490	17.08114060	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q193307
4590	Liberec	58	CZ	83	513	\N	50.75641010	14.99650410	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q739824
4591	Klatovy	58	CZ	83	322	\N	49.39555490	13.29509370	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q838341
4592	Uherské Hradiště	58	CZ	83	722	\N	49.05979690	17.49585010	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q277873
4593	Kroměříž	58	CZ	83	721	\N	49.29165820	17.39938000	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q852532
4595	Sokolov	58	CZ	83	413	\N	50.20134340	12.60546360	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q833856
4596	Semily	58	CZ	83	514	\N	50.60515760	15.32814090	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q663532
4597	Třebíč	58	CZ	83	634	\N	49.21478690	15.87955160	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q856857
4598	Praha, Hlavní město	58	CZ	52	10	\N	50.07553810	14.43780050	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1085
4599	Ústí nad Labem	58	CZ	52	427	\N	50.61190370	13.78700860	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q852480
4600	Moravskoslezský kraj	58	CZ	85	80	\N	49.73053270	18.23326370	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q190550
4601	Liberecký kraj	58	CZ	83	51	\N	50.65942400	14.76324240	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q193266
4602	Jihomoravský kraj	58	CZ	78	64	\N	48.95445280	16.76768990	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q192697
4604	Karlovy Vary	58	CZ	78	412	\N	50.14350000	12.75018990	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q757240
4605	Litoměřice	58	CZ	78	423	\N	50.53841970	14.13054580	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q383415
4606	Praha-východ	58	CZ	78	209	\N	49.93893070	14.79244720	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q645376
4607	Plzeňský kraj	58	CZ	87	32	\N	49.41348120	13.31572460	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q46070
4608	Plzeň-jih	58	CZ	87	324	\N	49.59048850	13.57158610	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q909754
4609	Děčín	58	CZ	87	421	\N	50.77255630	14.21276120	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q852525
4611	Havlíčkův Brod	58	CZ	87	631	\N	49.60433640	15.57965520	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q368105
4612	Jablonec nad Nisou	58	CZ	87	512	\N	50.72205280	15.17031350	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q837639
4613	Jihlava	58	CZ	87	632	\N	49.39837820	15.58704150	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q852472
4614	Královéhradecký kraj	58	CZ	82	52	\N	50.35124840	15.79764590	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q193295
4615	Blansko	58	CZ	82	641	\N	49.36485020	16.64775520	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q804356
4617	Louny	58	CZ	82	424	\N	50.35398120	13.80335510	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q838292
4618	Kolín	58	CZ	82	204	\N	49.98832930	15.05519770	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q847318
4619	Praha-západ	58	CZ	82	20A	\N	49.89352350	14.32937790	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q302778
4620	Beroun	58	CZ	82	202	\N	49.95734280	13.98407150	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q480085
4621	Teplice	58	CZ	82	426	\N	50.65846050	13.75132270	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q852518
4622	Vyškov	58	CZ	82	646	\N	49.21274450	16.98559270	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q570682
4623	Opava	58	CZ	82	805	\N	49.90837570	17.91633800	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q838320
4624	Jindřichův Hradec	58	CZ	82	313	\N	49.14448230	15.00613890	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1160841
4625	Jeseník	58	CZ	82	711	\N	50.22462490	17.19804710	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q838288
4626	Přerov	58	CZ	82	714	\N	49.46713560	17.50773320	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q838324
4627	Benešov	58	CZ	82	201	\N	49.69008280	14.77643990	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q792883
4628	Strakonice	58	CZ	82	316	\N	49.26040430	13.91030850	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q837633
4629	Most	58	CZ	82	425	\N	37.15540830	-94.29488840	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q852511
4630	Znojmo	58	CZ	82	647	\N	48.92723270	16.10378080	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q853969
4631	Kladno	58	CZ	82	203	\N	50.19402580	14.10436570	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q837635
4633	Česká Lípa	58	CZ	82	511	\N	50.67852010	14.53969910	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q538500
4634	Chrudim	58	CZ	82	531	\N	49.88302160	15.82908660	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q838329
4636	Rychnov nad Kněžnou	58	CZ	82	524	\N	50.16596510	16.27768420	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q240419
4638	Mělník	58	CZ	82	206	\N	50.31044150	14.51792230	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q852463
4639	Jihočeský kraj	58	CZ	79	31	\N	48.94577890	14.44160550	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q188373
4640	Jičín	58	CZ	79	522	\N	50.43533250	15.36104400	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q838333
4641	Domažlice	58	CZ	79	321	\N	49.43970270	12.93114350	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q784736
4642	Šumperk	58	CZ	79	715	\N	49.97784070	16.97177540	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q838335
4643	Mladá Boleslav	58	CZ	79	207	\N	50.42523170	14.93624770	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q852468
4644	Bruntál	58	CZ	79	801	\N	49.98817670	17.46369410	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q850323
4645	Pelhřimov	58	CZ	79	633	\N	49.43062070	15.22298300	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q852505
4646	Tachov	58	CZ	79	327	\N	49.79878030	12.63619210	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q838338
4647	Ústí nad Orlicí	58	CZ	79	534	\N	49.97218010	16.39966170	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q856824
4648	Žďár nad Sázavou	58	CZ	79	635	\N	49.56430120	15.93910300	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q579648
4649	North East	199	SG	79	02	district	1.38240000	103.89720000	2019-10-05 23:19:00	2023-05-20 19:11:28	1	Q3710534
4650	South East	199	SG	79	04	district	1.35710000	103.70040000	2019-10-05 23:19:00	2023-05-20 19:12:09	1	Q1687545
4651	Central Singapore	199	SG	79	01	district	1.28840000	103.85350000	2019-10-05 23:19:00	2023-05-20 19:09:25	1	Q2544592
4652	South West	199	SG	79	05	district	1.35710000	103.94510000	2019-10-05 23:19:00	2023-05-20 19:12:28	1	Q5784126
4653	North West	199	SG	79	03	district	1.41800000	103.82750000	2019-10-05 23:19:00	2023-05-20 19:11:45	1	Q5784118
4654	Ewa District	153	NR	09	09	\N	-0.50872410	166.93693840	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q274381
4655	Uaboe District	153	NR	13	13	\N	-0.52022220	166.93117610	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q473764
4656	Aiwo District	153	NR	01	01	\N	-0.53400120	166.91388730	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q240017
4657	Meneng District	153	NR	11	11	\N	-0.54672400	166.93837900	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q327788
4658	Anabar District	153	NR	02	02	\N	-0.51335170	166.94846240	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q328735
4659	Nibok District	153	NR	12	12	\N	-0.51962080	166.91893010	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q378780
4660	Baiti District	153	NR	05	05	\N	-0.51043100	166.92757440	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q328727
4661	Ijuw District	153	NR	10	10	\N	-0.52027670	166.95710460	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q328738
4662	Buada District	153	NR	07	07	\N	-0.53287770	166.92685410	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q202747
4663	Anibare District	153	NR	04	04	\N	-0.52947580	166.95134320	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q328733
4664	Yaren District	153	NR	14	14	\N	-0.54668570	166.92109130	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q31026
4665	Boe District	153	NR	06	06	\N	39.07327760	-94.57104980	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q378829
4666	Denigomodu District	153	NR	08	08	\N	-0.52479640	166.91676890	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1187200
4667	Anetan District	153	NR	03	03	\N	-0.50643430	166.94270060	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q378813
4668	Zhytomyrska oblast	230	UA	27	18	region	50.25465000	28.65866690	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q40637
4669	Vinnytska oblast	230	UA	23	05	region	49.23308300	28.46821690	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q166709
4670	Zakarpatska Oblast	230	UA	25	21	region	48.62080000	22.28788300	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q170213
4671	Kyivska oblast	230	UA	13	32	region	50.05295060	30.76671340	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q170036
4672	Lvivska oblast	230	UA	15	46	region	49.83968300	24.02971700	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q164193
4673	Luhanska oblast	230	UA	14	09	region	48.57404100	39.30781500	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q171965
4674	Ternopilska oblast	230	UA	22	61	region	49.55351700	25.59476700	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q173407
4675	Dnipropetrovska oblast	230	UA	04	12	region	48.46471700	35.04618300	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q170672
4676	Kyiv	230	UA	12	30	city	50.45010000	30.52340000	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q1899
4677	Kirovohradska oblast	230	UA	10	35	region	48.50793300	32.26231700	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q180981
4678	Chernivetska oblast	230	UA	03	77	region	48.29168300	25.93521700	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q168856
4679	Mykolaivska oblast	230	UA	16	48	region	46.97503300	31.99458290	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q181633
4680	Cherkaska oblast	230	UA	01	71	region	49.44443300	32.05976700	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q161808
4681	Khmelnytska oblast	230	UA	09	68	region	49.42298300	26.98713310	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q171331
4682	Ivano-Frankivska oblast	230	UA	06	26	region	48.92263300	24.71111700	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q178269
4683	Rivnenska oblast	230	UA	19	56	region	50.61990000	26.25161700	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q174187
4684	Khersonska oblast	230	UA	08	65	region	46.63541700	32.61686700	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q163271
4685	Sumska oblast	230	UA	21	59	region	50.90770000	34.79810000	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q170446
4686	Kharkivska oblast	230	UA	07	63	region	49.99350000	36.23038300	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q170666
4687	Zaporizka oblast	230	UA	26	23	region	47.83880000	35.13956700	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q171334
4688	Odeska oblast	230	UA	17	51	region	46.48458300	30.73260000	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q171852
4689	Autonomous Republic of Crimea	230	UA	11	43	republic	44.95211700	34.10241700	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q756294
4690	Volynska oblast	230	UA	24	07	region	50.74723300	25.32538300	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q167859
4691	Donetska oblast	230	UA	05	14	region	48.01588300	37.80285000	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q2012050
4692	Chernihivska oblast	230	UA	02	74	region	51.49820000	31.28934990	2019-10-05 23:19:00	2022-03-13 15:35:25	1	Q167874
4693	Gabrovo Province	34	BG	41	07	\N	42.86847000	25.31688900	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1007272
4694	Smolyan Province	34	BG	57	21	\N	41.57741480	24.70108710	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q2012430
4695	Pernik Province	34	BG	49	14	\N	42.60519900	23.03779160	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q2012234
4696	Montana Province	34	BG	47	12	\N	43.40851480	23.22575890	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q2012057
4697	Vidin Province	34	BG	63	05	\N	43.99617390	22.86795150	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q2012772
4698	Razgrad Province	34	BG	52	17	\N	43.52717050	26.52412280	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q2790675
4699	Blagoevgrad Province	34	BG	38	01	\N	42.02086140	23.09433560	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q804311
4700	Sliven Province	34	BG	56	20	\N	42.68167020	26.32285690	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q113120
4701	Plovdiv Province	34	BG	51	16	\N	42.13540790	24.74529040	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q187874
4702	Kardzhali Province	34	BG	44	09	\N	41.63384160	25.37766870	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1104675
4703	Kyustendil Province	34	BG	45	10	\N	42.28687990	22.69396350	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1112985
4704	Haskovo Province	34	BG	43	26	\N	41.93441780	25.55546720	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q182809
4705	Sofia City Province	34	BG	42	22	\N	42.75701090	23.45046830	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1585725
4706	Pleven Province	34	BG	50	15	\N	43.41701690	24.60667080	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q2012242
4707	Stara Zagora Province	34	BG	59	24	\N	42.42577090	25.63448550	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q2012583
4708	Silistra Province	34	BG	55	19	\N	44.11471010	27.26714540	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q2012423
4709	Veliko Tarnovo Province	34	BG	62	04	\N	43.07565390	25.61715000	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q2012621
4710	Lovech Province	34	BG	46	11	\N	43.13677980	24.71393350	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q6587068
4711	Vratsa Province	34	BG	64	06	\N	43.21018060	23.55292100	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q2012785
4712	Pazardzhik Province	34	BG	48	13	\N	42.19275670	24.33362260	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q2012227
4713	Ruse Province	34	BG	53	18	\N	43.83559640	25.96561440	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1251933
4714	Targovishte Province	34	BG	60	25	\N	43.24623490	26.56912510	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q2012589
4715	Burgas Province	34	BG	39	02	\N	42.50480000	27.46260790	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q369220
4716	Yambol Province	34	BG	65	28	\N	42.48414940	26.50352960	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q220736
4717	Varna Province	34	BG	61	03	\N	43.20464770	27.91054880	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q183487
4718	Dobrich Province	34	BG	40	08	\N	43.57278600	27.82728020	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q907395
4719	Sofia Province	34	BG	58	23	\N	42.67344000	23.83349370	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q202904
4720	Suceava County	181	RO	34	SV	\N	47.55055480	25.74106200	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q181209
4721	Hunedoara County	181	RO	21	HD	\N	45.79363800	22.99759930	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q191071
4722	Arges	181	RO	03	AG	\N	45.07225270	24.81427260	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q179567
4723	Bihor County	181	RO	05	BH	\N	47.01575160	22.17226600	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q179588
4724	Alba	181	RO	01	AB	\N	44.70091530	8.03569110	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q45868
4725	Ilfov County	181	RO	43	IF	\N	44.53554800	26.23248860	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q191670
4726	Giurgiu County	181	RO	42	GR	\N	43.90370760	25.96992650	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q193055
4727	Tulcea County	181	RO	37	TL	\N	45.04505650	29.03249120	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q191078
4728	Teleorman County	181	RO	35	TR	\N	44.01604910	25.29866280	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q191653
4729	Prahova County	181	RO	30	PH	\N	45.08919060	26.08293130	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q188665
4730	Bucharest	181	RO	10	B	\N	44.42676740	26.10253840	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q19660
4731	Neamț County	181	RO	28	NT	\N	46.97586850	26.38187640	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q188661
4732	Călărași County	181	RO	41	CL	\N	44.36587150	26.75486070	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q188948
4733	Bistrița-Năsăud County	181	RO	06	BN	\N	47.24861070	24.53228140	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q181513
4734	Cluj County	181	RO	13	CJ	\N	46.79417970	23.61214920	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q182624
4735	Iași County	181	RO	23	IS	\N	47.26796530	27.21856620	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q182888
4736	Braila	181	RO	08	BR	\N	45.26524630	27.95947140	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q188503
4737	Constanța County	181	RO	14	CT	\N	44.21298700	28.25500550	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q188505
4738	Olt County	181	RO	29	OT	\N	44.20079700	24.50229810	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q188945
4739	Arad County	181	RO	02	AR	\N	46.22836510	21.65978190	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q179559
4740	Botoșani County	181	RO	07	BT	\N	47.89240420	26.75917810	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q178861
4741	Sălaj County	181	RO	31	SJ	\N	47.20908130	23.21219010	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q190690
4742	Dolj County	181	RO	17	DJ	\N	44.16230220	23.63250540	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q191065
4743	Ialomița County	181	RO	22	IL	\N	44.60313300	27.37899140	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q193044
4744	Bacău County	181	RO	04	BC	\N	46.32581840	26.66237800	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q179779
4745	Dâmbovița County	181	RO	16	DB	\N	44.92898930	25.42538500	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q188797
4746	Satu Mare County	181	RO	32	SM	\N	47.76689050	22.92413770	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q165459
4747	Galați County	181	RO	18	GL	\N	45.78005690	27.82515760	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q188796
4748	Timiș County	181	RO	36	TM	\N	45.81389020	21.33310550	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q185586
4749	Harghita County	181	RO	20	HR	\N	46.49285070	25.64566960	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q190702
4750	Gorj County	181	RO	19	GJ	\N	44.94855950	23.24270790	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q190406
4751	Mehedinți County	181	RO	26	MH	\N	44.55150530	22.90441570	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q191717
4752	Vaslui County	181	RO	38	VS	\N	46.46310590	27.73980310	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q167199
4753	Caraș-Severin County	181	RO	12	CS	\N	45.11396460	22.07409930	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q187925
4754	Covasna County	181	RO	15	CV	\N	45.94263470	25.89189840	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q188959
4755	Sibiu County	181	RO	33	SB	\N	45.92691060	24.22548070	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q184797
4756	Buzău County	181	RO	11	BZ	\N	45.33509120	26.71075780	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q185309
4757	Vâlcea County	181	RO	39	VL	\N	45.07980510	24.08352830	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q186838
4758	Vrancea County	181	RO	40	VN	\N	45.81348760	27.06575310	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q182778
4759	Brașov County	181	RO	09	BV	\N	45.77818440	25.22258000	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q182614
4760	Maramureș County	181	RO	25	MM	\N	46.55699040	24.67232150	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q190711
4761	Aiga-i-le-Tai	191	WS	02	AL	\N	-13.85137910	-172.03254010	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1144488
4762	Satupa\\"itea	191	WS	09	SA	\N	-13.65382140	-172.61592710	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q651573
4763	A\\"ana	191	WS	01	AA	\N	-13.89841800	-171.97529950	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1154121
4764	Fa\\"asaleleaga	191	WS	04	FA	\N	-13.63076380	-172.23659810	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1154134
4765	Atua	191	WS	03	AT	\N	-13.97870530	-171.62542830	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1154332
4766	Vaisigano	191	WS	11	VS	\N	-13.54138270	-172.70233830	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1193139
4767	Palauli	191	WS	08	PA	\N	-13.72945790	-172.45361150	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1147216
4768	Va\\"a-o-Fonoti	191	WS	06	VF	\N	-13.94709030	-171.54318720	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1154109
4769	Gaga\\"emauga	191	WS	05	GE	\N	-13.54286660	-172.36688700	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1193143
4770	Tuamasaga	191	WS	10	TU	\N	-13.91635920	-171.82243620	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1144482
4771	Gaga\\"ifomauga	191	WS	07	GI	\N	-13.54680070	-172.49693310	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1193134
4772	Torba	237	VU	07	TOB	\N	37.07653000	27.45657300	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q822514
4773	Penama	237	VU	17	PAM	\N	-15.37957580	167.90531820	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q836649
4774	Shefa	237	VU	18	SEE	\N	32.80576500	35.16997100	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q650617
4775	Malampa	237	VU	16	MAP	\N	-16.40114050	167.60778650	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q740656
4776	Sanma	237	VU	13	SAM	\N	-15.48400170	166.91820970	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q740640
4777	Tafea	237	VU	15	TAE	\N	-18.72378270	169.06450560	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q576417
4778	Honiara	202	SB	14	CT	\N	-9.44563810	159.97289990	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q40921
4779	Temotu Province	202	SB	09	TE	\N	-10.68692900	166.06239790	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q936088
4780	Isabel Province	202	SB	07	IS	\N	-8.05923530	159.14470810	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1139082
4781	Choiseul Province	202	SB	12	CH	\N	-7.05014940	156.95114590	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q399063
4782	Makira-Ulawa Province	202	SB	08	MK	\N	-10.57374470	161.80969410	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1116700
4783	Malaita Province	202	SB	03	ML	\N	-8.94461680	160.90712360	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1190896
4784	Central Province	202	SB	10	CE	\N	\N	\N	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q293722
4785	Guadalcanal Province	202	SB	06	GU	\N	-9.57732840	160.14558050	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q760888
4786	Western Province	202	SB	11	WE	\N	\N	\N	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q150325
4787	Rennell and Bellona Province	202	SB	13	RB	\N	-11.61314350	160.16939490	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q1051475
4794	Saint-Barthélemy	75	FR	TB	BL	overseas collectivity	17.90051340	-62.82058710	2019-10-05 23:19:01	2021-12-11 14:36:45	1	Q25362
4795	Nouvelle-Aquitaine	75	FR	75	NAQ	metropolitan region	45.70871820	0.62689100	2019-10-05 23:19:01	2021-12-11 14:35:35	1	Q18678082
4796	Île-de-France	75	FR	A8	IDF	metropolitan region	48.84991980	2.63704110	2019-10-05 23:19:01	2021-12-11 14:42:34	1	Q13917
4797	Mayotte	75	FR	YT	976	overseas region	-12.82750000	45.16624400	2019-10-05 23:19:01	2021-12-11 17:55:50	1	Q17063
4798	Auvergne-Rhône-Alpes	75	FR	84	ARA	metropolitan region	45.44714310	4.38525070	2019-10-05 23:19:01	2021-12-11 14:34:32	1	Q18338206
4799	Occitanie	75	FR	84	OCC	metropolitan region	43.89272320	3.28276250	2019-10-05 23:19:01	2021-12-11 14:45:35	1	Q18678265
4802	Pays-de-la-Loire	75	FR	B5	PDL	metropolitan region	47.76328360	-0.32996870	2019-10-05 23:19:01	2021-12-11 14:46:23	1	Q16994
4804	Normandie	75	FR	28	NOR	metropolitan region	48.87987040	0.17125290	2019-10-05 23:19:01	2021-12-11 14:45:03	1	Q18677875
4806	Corse	75	FR	A5	20R	metropolitan collectivity with special status	42.03960420	9.01289260	2019-10-05 23:19:01	2021-12-11 14:38:31	1	Q14112
4807	Bretagne	75	FR	A2	BRE	metropolitan region	48.20204710	-2.93264350	2019-10-05 23:19:01	2021-12-11 14:37:21	1	Q12130
4809	Saint-Martin	75	FR	RN	MF	overseas collectivity	18.07082980	-63.05008090	2019-10-05 23:19:01	2021-12-11 14:43:49	1	Q126125
4810	Wallis and Futuna	75	FR	WF	WF	overseas collectivity	-14.29380000	-178.11650000	2019-10-05 23:19:01	2021-12-11 14:48:27	1	Q35555
4811	Alsace	75	FR	C1	6AE	European collectivity	48.31817950	7.44162410	2019-10-05 23:19:01	2021-12-11 14:34:06	1	Q1142
4812	Provence-Alpes-Côte-d’Azur	75	FR	B8	PAC	metropolitan region	43.93516910	6.06791940	2019-10-05 23:19:01	2021-12-11 14:46:05	1	Q15104
4816	Paris	75	FR	B7	75C	metropolitan collectivity with special status	48.85661400	2.35222190	2019-10-05 23:19:01	2021-12-11 14:34:15	1	Q90
4818	Centre-Val de Loire	75	FR	A3	CVL	metropolitan region	47.75156860	1.67506310	2019-10-05 23:19:01	2021-12-11 14:38:52	1	Q13947
4820	Grand-Est	75	FR	44	GES	metropolitan region	48.69980300	6.18780740	2019-10-05 23:19:01	2021-12-11 14:40:24	1	Q18677983
4821	Saint Pierre and Miquelon	75	FR	SB	PM	overseas collectivity	46.88520000	-56.31590000	2019-10-05 23:19:01	2021-12-11 14:46:53	1	Q34617
4822	French Guiana	75	FR	GF	973	overseas region	3.93388900	-53.12578200	2019-10-05 23:19:01	2021-12-11 17:56:22	1	Q3769
4823	La Réunion	75	FR	RE	974	overseas region	-21.11514100	55.53638400	2019-10-05 23:19:01	2021-12-11 17:55:58	1	Q17070
4824	French Polynesia	75	FR	FP	PF	overseas collectivity	-17.67974200	-149.40684300	2019-10-05 23:19:01	2021-12-11 14:46:42	1	Q30971
4825	Bourgogne-Franche-Comté	75	FR	27	BFC	metropolitan region	47.28051270	4.99943720	2019-10-05 23:19:01	2021-12-11 14:36:09	1	Q18578267
4827	Martinique	75	FR	MQ	972	overseas region	14.64152800	-61.02417400	2019-10-05 23:19:01	2021-12-11 17:56:10	1	Q17054
4828	Hauts-de-France	75	FR	32	HDF	metropolitan region	50.48011530	2.79372650	2019-10-05 23:19:01	2021-12-11 14:42:01	1	Q18677767
4829	Guadeloupe	75	FR	GP	971	overseas region	16.26500000	-61.55100000	2019-10-05 23:19:01	2021-12-11 17:55:47	1	Q17012
4830	West New Britain Province	171	PG	17	WBK	\N	-5.70474320	150.02594660	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q667468
4831	Bougainville	171	PG	07	NSB	\N	-6.37539190	155.38071010	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q18826
4832	Jiwaka Province	171	PG	22	JWK	\N	-5.86911540	144.69727740	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q1400625
4833	Hela	171	PG	21	HLA	\N	42.33295160	-83.04826180	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q1382499
4834	East New Britain	171	PG	10	EBR	\N	-4.61289430	151.88773210	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q753702
4835	Morobe Province	171	PG	14	MPL	\N	-6.80137370	146.56164700	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q853664
4836	Sandaun Province	171	PG	18	SAN	\N	-3.71261790	141.68342750	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q753689
4837	Port Moresby	171	PG	20	NCD	\N	-9.44380040	147.18026710	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q36526
4838	Oro Province	171	PG	04	NPP	\N	-8.89880630	148.18929210	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q753686
4839	Gulf	171	PG	02	GPK	\N	37.05483150	-94.43704190	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q874980
4840	Western Highlands Province	171	PG	16	WHM	\N	-5.62681280	144.25931180	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q849807
4841	New Ireland Province	171	PG	15	NIK	\N	-4.28532560	152.92059180	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q838690
4842	Manus Province	171	PG	13	MRL	\N	-2.09411690	146.87609510	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q874935
4843	Madang Province	171	PG	12	MPM	\N	-4.98497330	145.13758340	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q326254
4844	Southern Highlands Province	171	PG	05	SHM	\N	-6.41790830	143.56356370	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q849801
4845	Eastern Highlands Province	171	PG	09	EHG	\N	-6.58616740	145.66896360	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q849812
4846	Chimbu Province	171	PG	08	CPK	\N	-6.30876820	144.87312190	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q599448
4847	Central Province	171	PG	01	CPM	\N	\N	\N	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q874942
4848	Enga Province	171	PG	19	EPW	\N	-5.30058490	143.56356370	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q862584
4849	Milne Bay Province	171	PG	03	MBA	\N	-9.52214510	150.67496530	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q874962
4850	Western Province	171	PG	06	WPD	\N	\N	\N	2019-10-05 23:19:01	2022-08-31 15:52:51	1	Q849790
4851	Ohio	233	US	39	OH	state	40.41728710	-82.90712300	2019-11-13 05:30:00	2022-03-13 15:59:55	1	Q1397
4852	Ladakh	101	IN	\N	LA	Union territory	34.22684750	77.56194190	2019-10-05 23:18:57	2022-03-13 16:09:54	1	Q200667
4853	West Bengal	101	IN	28	WB	state	22.98675690	87.85497550	2019-10-05 23:18:57	2022-03-13 12:57:52	1	Q1356
4854	Sinop	225	TR	57	57	province	41.55947490	34.85805320	2020-05-24 23:18:46	2021-10-30 20:46:39	1	Q134413
4855	Distrito Capital	239	VE	25	A	capital district	41.26148460	-95.93108070	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q492791
4856	Apure	239	VE	03	C	state	6.92694830	-68.52471490	2019-10-05 23:18:45	2022-01-22 13:08:16	1	Q41146
4857	Jalisco	142	MX	14	JAL	state	20.65953820	-103.34943760	2020-06-28 23:18:55	2022-05-08 23:24:46	1	Q13160
4858	Roraima	31	BR	25	RR	\N	2.73759710	-62.07509980	2020-06-28 23:18:45	2022-08-31 15:52:51	1	Q42508
4859	Guarda	177	PT	11	09	\N	40.53859720	-7.26757720	2020-06-28 23:18:46	2022-08-31 15:52:51	1	Q273533
4860	Devonshire	25	BM	01	DEV	municipality	32.30380620	-64.76069540	2020-07-22 15:26:00	2023-05-20 20:20:55	1	Q1207018
4861	Hamilton	25	BM	02	HA	municipality	32.34494320	-64.72365000	2020-07-22 15:26:00	2023-05-20 20:20:55	1	Q289876
4863	Paget	25	BM	04	PAG	municipality	32.28107400	-64.77847870	2020-07-22 15:26:00	2023-05-20 20:20:55	1	Q2046204
4864	Pembroke	25	BM	05	PEM	municipality	32.30076720	-64.79626300	2020-07-22 15:26:00	2023-05-20 20:20:55	1	Q1756036
4866	Saint George\\"s	25	BM	07	SGE	municipality	17.12577590	-62.56198110	2020-07-22 15:26:00	2023-05-20 20:20:55	1	Q1521745
4867	Sandys	25	BM	08	SAN	municipality	32.29995280	-64.86741030	2020-07-22 15:26:00	2023-05-20 20:20:55	1	Q121782
4868	Smith\\"s	25	BM	09	SMI	municipality	32.31339660	-64.73105880	2020-07-22 15:26:00	2023-05-20 20:20:55	1	Q1735847
4869	Southampton	25	BM	10	SOU	municipality	32.25400950	-64.82590580	2020-07-22 15:26:00	2023-05-20 20:20:55	1	Q1323054
4870	Warwick	25	BM	11	WAR	municipality	32.26615340	-64.80811980	2020-07-22 15:26:00	2023-05-20 20:20:55	1	Q1468860
4871	Huila	48	CO	16	HUI	department	2.53593490	-75.52766990	2020-08-15 20:49:06	2022-01-22 13:01:23	1	Q234920
4874	Uroševac District (Ferizaj)	248	XK	\N	XUF	\N	42.37018440	21.14832810	2020-08-15 21:35:46	2022-08-31 15:52:51	1	Q868964
4876	Đakovica District (Gjakove)	248	XK	\N	XDG	\N	42.43757560	20.37854380	2020-08-15 21:36:53	2022-08-31 15:52:51	1	Q1059386
4877	Gjilan District	248	XK	\N	XGJ	\N	42.46352060	21.46940110	2020-08-15 21:38:25	2022-08-31 15:52:51	1	Q1048355
4878	Kosovska Mitrovica District	248	XK	\N	XKM	\N	42.89139090	20.86599950	2020-08-15 21:39:53	2022-08-31 15:52:51	1	Q1046673
4879	Pristina (Priştine)	248	XK	\N	XPI	\N	42.66291380	21.16550280	2020-08-15 22:03:03	2022-08-31 15:52:51	1	Q25270
4880	Ciudad Autónoma de Buenos Aires	11	AR	01	C	city	-34.60368440	-58.38155910	2020-08-15 22:19:48	2022-03-13 16:09:22	1	Q44754
4881	New Providence	17	BS	23	NP	\N	40.69843480	-74.40154050	2020-10-13 20:56:49	2022-08-31 15:52:51	1	Q858513
4882	Shumen	34	BG	54	27	\N	43.27123980	26.93612860	2020-12-05 18:53:53	2022-08-31 15:52:51	1	Q184981
4883	Yuen Long	98	HK	\N	NYL	district	22.44559000	114.02218000	2021-01-23 16:57:51	2023-05-20 19:52:51	1	Q871442
4884	Tsuen Wan	98	HK	\N	NTW	district	22.36281000	114.12907000	2021-01-23 17:00:27	2023-05-20 19:52:51	1	Q878514
4885	Tai Po	98	HK	\N	NTP	district	22.45085000	114.16422000	2021-01-23 17:00:27	2023-05-20 19:52:51	1	Q877813
4887	Sai Kung	98	HK	\N	NSK	district	22.38143000	114.27052000	2021-01-23 17:09:34	2023-05-20 19:52:51	1	Q155697
4888	Islands	98	HK	\N	NIS	district	22.26114000	113.94608000	2021-01-23 17:09:35	2023-05-20 19:52:51	1	Q752523
4889	Central and Western	98	HK	\N	HCW	district	22.28666000	114.15497000	2021-01-23 17:09:36	2023-05-20 19:52:51	1	Q312485
4890	Wan Chai	98	HK	\N	HWC	district	22.27968000	114.17168000	2021-01-23 17:09:37	2023-05-20 19:52:51	1	Q986434
4891	Eastern	98	HK	\N	HEA	district	22.28411000	114.22414000	2021-01-23 17:09:38	2023-05-20 19:52:51	1	Q727054
4892	Southern	98	HK	\N	HSO	district	22.24725000	114.15884000	2021-01-23 17:09:39	2023-05-20 19:52:51	1	Q986431
4893	Yau Tsim Mong	98	HK	\N	KYT	district	22.32138000	114.17260000	2021-01-23 17:09:40	2023-05-20 19:52:51	1	Q157669
4894	Sham Shui Po	98	HK	\N	KSS	district	22.33074000	114.16220000	2021-01-23 17:09:40	2023-05-20 19:52:51	1	Q655626
4895	Kowloon City	98	HK	\N	KKC	district	22.32820000	114.19155000	2021-01-23 17:09:41	2023-05-20 19:52:51	1	Q986415
4896	Wong Tai Sin	98	HK	\N	KWT	district	22.33353000	114.19686000	2021-01-23 17:09:42	2023-05-20 19:52:51	1	Q878503
4897	Kwun Tong	98	HK	\N	KKT	district	22.31326000	114.22581000	2021-01-23 17:09:43	2023-05-20 19:52:51	1	Q1045119
4898	Kwai Tsing	98	HK	\N	NKT	district	22.35488000	114.08401000	2021-01-23 17:09:43	2023-05-20 19:52:51	1	Q877132
4899	Tuen Mun	98	HK	\N	NTM	district	22.39163000	113.97708850	2021-01-23 17:09:44	2023-05-20 19:52:51	1	Q986383
4900	North	98	HK	\N	NNO	district	22.49471000	114.13812000	2021-01-23 17:09:45	2023-05-20 19:52:51	1	Q868032
4901	Sha Tin	98	HK	\N	NST	district	22.38715000	114.19534000	2021-01-23 17:09:46	2023-05-20 19:52:51	1	Q15019
4902	Sidi Bel Abbès	4	DZ	30	22	\N	34.68060240	-1.09994950	2021-04-11 20:43:17	2022-08-31 15:52:51	1	Q235714
4905	El M\\"ghair	4	DZ	\N	49	\N	33.95405610	5.13464180	2021-04-11 20:54:32	2022-08-31 15:52:51	1	Q77103173
4906	El Menia	4	DZ	\N	50	\N	31.36422500	2.57844950	2021-04-11 20:55:09	2022-08-31 15:52:51	1	Q76520264
4907	Ouled Djellal	4	DZ	\N	51	\N	34.41782210	4.96858430	2021-04-11 20:55:53	2022-08-31 15:52:51	1	Q77105251
4908	Bordj Baji Mokhtar	4	DZ	\N	52	\N	22.96633500	-3.94727320	2021-04-11 20:56:33	2022-08-31 15:52:51	1	Q76592938
4909	Béni Abbès	4	DZ	\N	53	\N	30.08310420	-2.83450520	2021-04-11 20:57:17	2022-08-31 15:52:51	1	Q21606902
4910	Timimoun	4	DZ	\N	54	\N	29.67890600	0.50046080	2021-04-11 20:57:46	2022-08-31 15:52:51	1	Q21606903
4911	Touggourt	4	DZ	\N	55	\N	33.12484760	5.78327150	2021-04-11 20:58:14	2022-08-31 15:52:51	1	Q77103880
4912	Djanet	4	DZ	\N	56	\N	23.83108720	8.70046720	2021-04-11 20:58:43	2022-08-31 15:52:51	1	Q77101547
4913	In Salah	4	DZ	\N	57	\N	27.21492290	1.84843960	2021-04-11 20:59:14	2022-08-31 15:52:51	1	Q76593022
4914	In Guezzam	4	DZ	\N	58	\N	20.38643230	4.77893940	2021-04-11 20:59:49	2022-08-31 15:52:51	1	Q77102475
4915	Mureș County	181	RO	27	MS	\N	46.55699040	24.67232150	2019-10-05 23:19:00	2022-08-31 15:52:51	1	Q188813
4916	Volgograd Oblast	182	RU	84	VGG	\N	49.25873930	39.81544630	2021-05-30 23:18:44	2022-08-31 15:52:51	1	Q3819
4917	La Colle	145	MC	\N	CL	\N	43.73274650	7.41372760	2021-05-30 23:18:44	2022-08-31 15:52:51	1	Q55102
4918	La Condamine	145	MC	\N	CO	\N	43.73506650	7.41990600	2021-05-30 23:18:44	2022-08-31 15:52:51	1	Q55095
4919	Moneghetti	145	MC	\N	MG	\N	43.73649270	7.41533830	2021-05-30 23:18:44	2022-08-31 15:52:51	1	Q55108
4920	Hamadan	103	IR	24	13	province	34.91936070	47.48329250	2021-05-30 20:48:53	2022-03-13 16:49:05	1	Q187373
4921	Bogotá D.C.	48	CO	00	DC	capital district	4.28204150	-74.50270420	2021-07-17 17:04:59	2022-01-22 13:01:23	1	\N
4922	Loreto	173	PE	16	LOR	\N	-4.37416430	-76.13042640	2021-07-17 17:17:41	2022-08-31 15:52:51	1	Q200938
4923	Kutná Hora	58	CZ	82	205	\N	49.94920890	15.24704400	2021-07-17 17:48:50	2022-08-31 15:52:51	1	Q155975
4924	Kōchi Prefecture	109	JP	20	39	\N	33.28791610	132.27592620	2021-07-17 18:13:41	2022-08-31 15:52:51	1	Q134093
4925	Cần Thơ	240	VN	87	CT	\N	10.03418510	105.72255070	2021-07-17 18:35:10	2022-08-31 15:52:51	1	Q216075
4926	Rivers	161	NG	50	RI	state	5.02134200	6.43760220	2019-10-05 23:18:37	2021-10-11 12:08:37	1	Q503923
4927	Rabat-Salé-Kénitra	149	MA	04	04	region	34.07686400	-7.34544760	2021-07-24 16:29:10	2022-05-08 20:45:15	1	Q19951239
4928	Agadir-Ida-Ou-Tanane	149	MA	09	AGD	prefecture	30.64620910	-9.83390610	2021-07-24 16:32:42	2022-05-08 20:45:15	1	Q389976
4929	Berrechid	149	MA	06	BRR	province	33.26025230	-7.59848370	2021-07-24 16:35:48	2022-05-08 20:45:15	1	Q2395317
4930	Casablanca	149	MA	06	CAS	prefecture	33.57226780	-7.65703260	2021-07-24 16:39:02	2022-05-08 20:45:15	1	Q7903
4931	Driouch	149	MA	02	DRI	province	34.97603200	-3.39644930	2021-07-24 16:40:37	2022-05-08 20:45:15	1	Q1440552
4932	Fès	149	MA	03	FES	prefecture	34.02395790	-5.03675990	2021-07-24 16:42:38	2022-05-08 20:45:15	1	Q80985
4933	Fquih Ben Salah	149	MA	05	FQH	province	32.50016800	-6.71007170	2021-07-24 16:43:44	2022-05-08 20:45:15	1	Q3408359
4934	Guercif	149	MA	02	GUF	province	34.23450360	-3.38130050	2021-07-24 16:44:55	2022-05-08 20:45:15	1	Q3408363
4935	Marrakech	149	MA	07	MAR	prefecture	31.63460230	-8.07789320	2021-07-24 16:49:01	2022-05-08 20:45:15	1	Q101625
4936	M’diq-Fnideq	149	MA	01	MDF	prefecture	35.77330190	-5.51433000	2021-07-24 16:50:36	2022-05-08 20:45:15	1	Q3408887
4937	Meknès	149	MA	03	MEK	prefecture	33.88100000	-5.57303970	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q3408890
4938	Midelt	149	MA	08	MID	province	32.68550790	-4.75017090	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q3408385
4939	Mohammadia	149	MA	06	MOH	prefecture	33.68737490	-7.42391420	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q647417
4940	Oujda-Angad	149	MA	02	OUJ	prefecture	34.68375040	-2.29932390	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q1734717
4941	Ouezzane	149	MA	01	OUZ	province	34.80634500	-5.59145050	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q3408330
4942	Rabat	149	MA	04	RAB	prefecture	33.96919900	-6.92730290	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q3551
4943	Rehamna	149	MA	07	REH	province	32.20329050	-8.56896710	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q3408399
4944	Salé	149	MA	04	SAL	prefecture	34.03775700	-6.84270730	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q466046
4945	Sidi Bennour	149	MA	06	SIB	province	32.64926020	-8.44714530	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q3408408
4946	Sidi Ifni	149	MA	10	SIF	province	29.36657970	-10.21084850	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q2672941
4947	Skhirate-Témara	149	MA	04	SKH	prefecture	33.76224250	-7.04190520	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q737483
4948	Tarfaya (EH-partial)	149	MA	11	TAF	province	27.93777010	-12.92940630	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q15125620
4949	Tinghir	149	MA	08	TIN	province	31.48507940	-6.20192980	2019-10-05 23:18:54	2022-05-08 20:45:15	1	Q3408414
4950	Tanger-Assilah	149	MA	01	TNG	prefecture	35.76325390	-5.90450980	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q2392485
4951	Youssoufia	149	MA	07	YUS	province	32.02006790	-8.86926480	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q3408420
4952	Sidi Slimane	149	MA	04	SIL	province	34.27378280	-5.98059720	2019-10-05 23:18:53	2022-05-08 20:45:15	1	Q3408411
4953	Lualaba	51	CD	21	LU	\N	-10.48086980	25.62978160	2019-10-05 23:18:50	2022-08-31 15:52:51	1	Q1159531
4954	Chaiyaphum	219	TH	26	36	\N	16.00749740	101.61291720	2019-10-05 23:18:55	2022-08-31 15:52:51	1	Q275377
4955	Mbeya	218	TZ	09	14	Region	-8.28661120	32.81325370	2021-10-10 17:37:41	2021-10-10 17:40:52	1	Q458382
4956	Songwe	218	TZ	32	31	Region	-8.27261200	31.71131740	2021-10-10 17:37:41	2021-10-10 17:41:37	1	Q458382
4957	Basel-Stadt	214	CH	04	BS	canton	47.56666700	7.60000000	2021-10-15 20:39:18	2021-11-13 19:21:51	1	Q12172
4958	Bono East	83	GH		BE	region	7.75000000	-1.05000000	2021-10-30 16:08:55	2021-10-30 16:08:55	1	Q60764358
4959	Bono	83	GH		BO	region	7.65000000	-2.50000000	2021-10-30 16:08:55	2021-10-30 16:08:55	1	Q64685186
4960	North East	83	GH	\N	NE	region	10.51666700	-0.36666700	2021-10-30 16:08:55	2021-10-30 16:08:55	1	Q60764359
4961	Oti	83	GH	\N	OT	region	7.90000000	0.30000000	2021-10-30 16:08:55	2021-10-30 16:08:55	1	Q48804004
4962	Savannah	83	GH	\N	SV	region	9.08333300	-1.81666700	2021-10-30 16:08:55	2021-10-30 16:08:55	1	Q60764352
4963	Western North	83	GH	\N	WN	region	6.30000000	-2.80000000	2021-10-30 16:08:55	2021-10-30 16:08:55	1	Q60764360
4964	Nueva Segovia	159	NI	16	NS	department	13.76570610	-86.53700390	2021-11-13 19:38:02	2022-03-13 16:32:08	1	Q728022
4965	Keelung	216	TW	02	KEE	city	25.12418620	121.64758340	2021-11-27 16:34:03	2021-11-27 16:34:03	1	Q249996
4966	New Taipei	216	TW	03	NWT	special municipality	24.98752780	121.36459470	2021-11-27 16:35:49	2021-11-27 16:35:49	1	Q244898
4967	Ain	75	FR	\N	01	metropolitan department	46.06508600	4.88861500	2021-12-11 19:31:24	2021-12-11 19:31:24	1	Q3083
4968	Aisne	75	FR	\N	02	metropolitan department	49.45289210	3.04651110	2021-12-11 19:31:25	2021-12-11 19:33:54	1	Q3093
4969	Allier	75	FR	\N	03	metropolitan department	46.36708630	2.58082770	2021-12-11 19:31:26	2021-12-11 19:34:05	1	Q3113
4970	Alpes-de-Haute-Provence	75	FR	\N	04	metropolitan department	44.16377520	5.67247800	2021-12-11 19:31:27	2021-12-11 19:34:21	1	Q3131
4971	Hautes-Alpes	75	FR	\N	05	metropolitan department	44.65626820	5.68732110	2021-12-11 19:31:28	2022-03-13 16:31:45	1	Q3125
4972	Alpes-Maritimes	75	FR	\N	06	metropolitan department	43.92041700	6.61678220	2021-12-11 19:31:30	2021-12-11 19:34:59	1	Q3139
4973	Ardèche	75	FR	\N	07	metropolitan department	44.81486950	3.81334830	2021-12-11 19:31:31	2021-12-11 19:35:13	1	Q3148
4974	Ardennes	75	FR	\N	08	metropolitan department	49.69759510	4.14895760	2021-12-11 19:31:32	2021-12-11 19:48:24	1	Q3164
4975	Ariège	75	FR	\N	09	metropolitan department	42.94347830	0.94048640	2021-12-11 19:31:34	2021-12-11 19:48:44	1	Q3184
4976	Aube	75	FR	\N	10	metropolitan department	48.31975470	3.56371040	2021-12-11 19:31:35	2021-12-11 19:49:16	1	Q3194
4977	Aude	75	FR	\N	11	metropolitan department	43.05411400	1.90384760	2021-12-11 19:31:36	2021-12-11 19:49:31	1	Q3207
4978	Aveyron	75	FR	\N	12	metropolitan department	44.31563620	2.08523790	2021-12-11 19:31:37	2021-12-11 19:50:35	1	Q3216
4979	Bouches-du-Rhône	75	FR	\N	13	metropolitan department	43.54038650	4.46138290	2021-12-11 19:31:38	2021-12-11 19:50:54	1	Q3240
4981	Calvados	75	FR	\N	14	metropolitan department	49.09035140	-0.91706480	2021-12-11 19:31:40	2021-12-11 19:51:22	1	Q3249
4982	Cantal	75	FR	\N	15	metropolitan department	45.04921770	2.15672720	2021-12-11 19:31:41	2021-12-11 19:51:38	1	Q3259
4983	Charente	75	FR	\N	16	metropolitan department	45.66584790	-0.31845770	2021-12-11 19:31:42	2021-12-11 19:52:01	1	Q3266
4984	Charente-Maritime	75	FR	\N	17	metropolitan department	45.72968280	-1.33881160	2021-12-11 19:31:44	2021-12-11 19:52:21	1	Q3278
4985	Cher	75	FR	\N	18	metropolitan department	47.02436280	1.86627320	2021-12-11 19:31:45	2021-12-11 19:52:46	1	Q3286
4986	Corrèze	75	FR	\N	19	metropolitan department	45.34237070	1.31717330	2021-12-11 19:31:46	2021-12-11 19:53:01	1	Q3326
4987	Côte-d\\"Or	75	FR	\N	21	metropolitan department	47.46513020	4.23154950	2021-12-11 19:31:48	2021-12-11 19:53:22	1	Q3342
4988	Côtes-d\\"Armor	75	FR	\N	22	metropolitan department	48.46633360	-3.34789610	2021-12-11 19:31:49	2021-12-11 19:53:46	1	Q3349
4989	Creuse	75	FR	\N	23	metropolitan department	46.05903940	1.43150500	2021-12-11 19:31:52	2021-12-11 19:53:58	1	Q3353
4990	Dordogne	75	FR	\N	24	metropolitan department	45.14234160	0.14274080	2021-12-11 19:31:53	2021-12-11 19:54:19	1	Q3357
4991	Doubs	75	FR	\N	25	metropolitan department	46.93217740	6.34762140	2021-12-11 19:31:56	2021-12-11 19:54:41	1	Q3361
4992	Drôme	75	FR	\N	26	metropolitan department	44.72933570	4.67821580	2021-12-11 19:31:54	2021-12-11 19:55:00	1	Q3364
4993	Eure	75	FR	\N	27	metropolitan department	49.07540350	0.48937320	2021-12-11 19:31:57	2021-12-11 19:55:20	1	Q3372
4994	Eure-et-Loir	75	FR	\N	28	metropolitan department	48.44697840	0.81470250	2021-12-11 19:31:58	2021-12-11 19:55:36	1	Q3377
4995	Finistère	75	FR	\N	29	metropolitan department	48.22696100	-4.82437330	2021-12-11 19:32:00	2021-12-11 19:55:58	1	Q3389
4996	Corse-du-Sud	75	FR	\N	2A	metropolitan department	41.85720550	8.41091830	2021-12-11 19:31:59	2021-12-11 19:56:19	1	Q3336
4997	Haute-Corse	75	FR	\N	2B	metropolitan department	42.42958660	8.50625610	2021-12-11 19:32:01	2021-12-11 19:56:48	1	Q3334
4998	Gard	75	FR	\N	30	metropolitan department	43.95952760	3.49356810	2021-12-11 19:32:04	2021-12-11 19:57:37	1	Q12515
4999	Haute-Garonne	75	FR	\N	31	metropolitan department	43.30505550	0.68455150	2021-12-11 19:32:02	2021-12-11 19:57:53	1	Q12538
5000	Gers	75	FR	\N	32	metropolitan department	43.69505340	-0.09997280	2021-12-11 19:32:06	2021-12-11 19:58:07	1	Q12517
5001	Gironde	75	FR	\N	33	metropolitan department	44.89584690	-1.59405320	2021-12-11 19:32:07	2021-12-11 19:58:24	1	Q12526
5002	Hérault	75	FR	\N	34	metropolitan department	43.59111200	2.80661080	2021-12-11 19:32:08	2021-12-11 19:58:46	1	Q12545
5003	Ille-et-Vilaine	75	FR	\N	35	metropolitan department	48.17624840	-2.21304010	2021-12-11 19:32:15	2021-12-11 19:59:06	1	Q12549
5004	Indre	75	FR	\N	36	metropolitan department	46.81175500	0.97555230	2021-12-11 19:32:16	2021-12-11 19:59:21	1	Q12553
5005	Indre-et-Loire	75	FR	\N	37	metropolitan department	47.22285820	0.14896190	2021-12-11 19:32:18	2021-12-11 19:59:44	1	Q12556
5006	Isère	75	FR	\N	38	metropolitan department	45.28922710	4.99023550	2021-12-11 19:32:19	2021-12-11 20:00:01	1	Q12559
5007	Jura	75	FR	\N	39	metropolitan department	46.78287410	5.16918440	2021-12-11 19:32:20	2021-12-11 20:00:16	1	Q3120
5008	Landes	75	FR	\N	40	metropolitan department	44.00950800	-1.25385790	2021-12-11 19:32:21	2021-12-11 20:00:30	1	Q12563
5009	Loir-et-Cher	75	FR	\N	41	metropolitan department	47.65937600	0.85376310	2021-12-11 19:32:22	2021-12-11 20:00:43	1	Q12564
5010	Loire	75	FR	\N	42	metropolitan department	46.35228120	-1.17563390	2021-12-11 19:32:26	2021-12-11 20:01:02	1	
5011	Haute-Loire	75	FR	\N	43	metropolitan department	45.08538060	3.22607070	2021-12-11 19:32:28	2021-12-11 20:01:37	1	Q12572
5012	Loire-Atlantique	75	FR	\N	44	metropolitan department	47.34757210	-2.34663120	2021-12-11 19:32:29	2021-12-11 20:01:54	1	Q3068
5013	Loiret	75	FR	\N	45	metropolitan department	47.91354310	1.76009900	2021-12-11 19:32:31	2021-12-11 20:02:21	1	Q12574
5014	Lot	75	FR	\N	46	metropolitan department	44.62460700	1.03576310	2021-12-11 19:32:30	2021-12-11 20:02:36	1	Q12576
5015	Lot-et-Garonne	75	FR	\N	47	metropolitan department	44.36873140	-0.09161690	2021-12-11 19:32:32	2021-12-11 20:03:00	1	Q12578
5016	Lozère	75	FR	\N	48	metropolitan department	44.54227790	2.92934590	2021-12-11 19:32:33	2021-12-11 20:03:14	1	Q12580
5017	Maine-et-Loire	75	FR	\N	49	metropolitan department	47.38900340	-1.12025270	2021-12-11 19:32:35	2021-12-11 20:03:37	1	Q12584
5018	Manche	75	FR	\N	50	metropolitan department	49.08817340	-2.46272090	2021-12-11 19:32:36	2021-12-11 20:03:56	1	Q12589
5019	Marne	75	FR	\N	51	metropolitan department	48.96107450	3.65737670	2021-12-11 19:32:37	2021-12-11 20:04:15	1	Q12594
5020	Haute-Marne	75	FR	\N	52	metropolitan department	48.13248210	4.69834990	2021-12-11 19:32:38	2021-12-11 20:04:28	1	Q12607
5021	Mayenne	75	FR	\N	53	metropolitan department	48.30668420	-0.64901820	2021-12-11 19:32:39	2021-12-11 20:04:45	1	Q12620
5022	Meurthe-et-Moselle	75	FR	\N	54	metropolitan department	48.95566150	5.71423500	2021-12-11 19:32:42	2021-12-11 20:05:09	1	Q12626
5023	Meuse	75	FR	\N	55	metropolitan department	49.01246200	4.81087340	2021-12-11 19:32:43	2021-12-11 20:05:31	1	Q12631
5024	Morbihan	75	FR	\N	56	metropolitan department	47.74395180	-3.44555240	2021-12-11 19:32:44	2021-12-11 20:05:57	1	Q12642
5025	Moselle	75	FR	\N	57	metropolitan department	49.02045660	6.20553220	2021-12-11 19:32:45	2021-12-11 20:06:11	1	Q12652
5026	Nièvre	75	FR	\N	58	metropolitan department	47.11921640	2.97797130	2021-12-11 19:32:46	2021-12-11 20:06:25	1	Q12657
5027	Nord	75	FR	\N	59	metropolitan department	50.52854770	2.60007760	2021-12-11 19:32:49	2021-12-11 20:09:50	1	Q12661
5028	Oise	75	FR	\N	60	metropolitan department	49.41173350	1.86688250	2021-12-11 19:32:47	2021-12-11 20:10:23	1	Q12675
5029	Orne	75	FR	\N	61	metropolitan department	48.57576440	-0.50242950	2021-12-11 19:32:50	2021-12-11 20:10:53	1	Q12679
5030	Pas-de-Calais	75	FR	\N	62	metropolitan department	50.51446990	1.81149800	2021-12-11 19:32:51	2021-12-11 20:11:13	1	Q12689
5031	Puy-de-Dôme	75	FR	\N	63	metropolitan department	45.77141850	2.62626760	2021-12-11 19:32:54	2021-12-11 20:11:28	1	Q12694
5032	Pyrénées-Atlantiques	75	FR	\N	64	metropolitan department	43.18681700	-1.44170710	2021-12-11 19:32:53	2021-12-11 20:11:48	1	Q12703
5033	Hautes-Pyrénées	75	FR	\N	65	metropolitan department	43.14294620	-0.40097360	2021-12-11 19:32:55	2021-12-11 20:12:09	1	Q12700
5034	Pyrénées-Orientales	75	FR	\N	66	metropolitan department	42.62541790	1.88929580	2021-12-11 19:32:56	2021-12-11 20:12:26	1	Q12709
5035	Bas-Rhin	75	FR	\N	67	metropolitan department	48.59864440	7.02666760	2021-12-11 19:32:57	2022-03-13 16:31:45	1	Q12717
5036	Haut-Rhin	75	FR	\N	68	metropolitan department	47.86537740	6.67113810	2021-12-11 19:32:58	2021-12-11 20:12:59	1	Q12722
5037	Rhône	75	FR	\N	69	metropolitan department	44.93433000	4.24093290	2021-12-11 19:33:00	2021-12-11 20:13:17	1	Q46130
5038	Métropole de Lyon	75	FR	\N	69M	metropolitan department	45.74826290	4.59584040	2021-12-11 19:33:02	2021-12-11 20:13:36	1	Q16665897
5039	Haute-Saône	75	FR	\N	70	metropolitan department	47.63789960	5.53550550	2021-12-11 19:33:03	2021-12-11 20:13:51	1	Q12730
5040	Saône-et-Loire	75	FR	\N	71	metropolitan department	46.65548830	3.98350500	2021-12-11 19:33:05	2021-12-11 20:14:15	1	Q12736
5041	Sarthe	75	FR	\N	72	metropolitan department	48.02627330	-0.32613170	2021-12-11 19:33:06	2021-12-11 20:14:34	1	Q12740
5042	Savoie	75	FR	\N	73	metropolitan department	45.49469900	5.84329840	2021-12-11 19:33:08	2021-12-11 20:14:59	1	Q12745
5043	Haute-Savoie	75	FR	\N	74	metropolitan department	46.04452770	5.86413800	2021-12-11 19:33:07	2021-12-11 20:15:14	1	Q12751
5044	Seine-Maritime	75	FR	\N	76	metropolitan department	49.66096810	0.36775610	2021-12-11 19:33:09	2021-12-11 20:15:31	1	Q12758
5045	Seine-et-Marne	75	FR	\N	77	metropolitan department	48.61853940	2.41525610	2021-12-11 19:33:10	2021-12-11 20:15:59	1	Q12753
5046	Yvelines	75	FR	\N	78	metropolitan department	48.76153010	1.27729490	2021-12-11 19:33:11	2021-12-11 20:16:15	1	Q12820
5047	Deux-Sèvres	75	FR	\N	79	metropolitan department	46.53868170	-0.90199480	2021-12-11 19:33:12	2021-12-11 20:16:37	1	Q12765
5048	Somme	75	FR	\N	80	metropolitan department	49.96859220	1.73106960	2021-12-11 19:33:14	2021-12-11 20:16:52	1	Q12770
5049	Tarn	75	FR	\N	81	metropolitan department	43.79149770	1.67588930	2021-12-11 19:33:16	2021-12-11 20:17:07	1	Q12772
5050	Tarn-et-Garonne	75	FR	\N	82	metropolitan department	44.08089500	1.08916570	2021-12-11 19:33:17	2021-12-11 20:17:24	1	Q12779
5051	Var	75	FR	\N	83	metropolitan department	43.39507300	5.73424170	2021-12-11 19:33:18	2021-12-11 20:18:05	1	Q12789
5052	Vaucluse	75	FR	\N	84	metropolitan department	44.04475000	4.64277180	2021-12-11 19:33:19	2021-12-11 20:18:19	1	Q12792
5053	Vendée	75	FR	\N	85	metropolitan department	46.67541030	-2.02983920	2021-12-11 19:33:20	2021-12-11 20:18:33	1	Q12798
5054	Vienne	75	FR	\N	86	metropolitan department	45.52213140	4.84531360	2021-12-11 19:33:23	2021-12-11 20:18:48	1	Q12804
5055	Haute-Vienne	75	FR	\N	87	metropolitan department	45.91868780	0.70972060	2021-12-11 19:33:22	2022-03-13 16:31:45	1	Q12808
5056	Vosges	75	FR	\N	88	metropolitan department	48.16301730	5.73556000	2021-12-11 19:33:25	2021-12-11 20:19:42	1	Q3105
5057	Yonne	75	FR	\N	89	metropolitan department	47.85476140	3.03394040	2021-12-11 19:33:26	2021-12-11 20:19:57	1	Q12816
5058	Territoire de Belfort	75	FR	\N	90	metropolitan department	47.62930720	6.66962000	2021-12-11 19:33:28	2021-12-11 20:20:17	1	Q12782
5059	Essonne	75	FR	\N	91	metropolitan department	48.53046150	1.96990560	2021-12-11 19:33:29	2021-12-11 20:20:33	1	Q3368
5060	Hauts-de-Seine	75	FR	\N	92	metropolitan department	48.84030080	2.10125590	2021-12-11 19:33:31	2021-12-11 20:20:47	1	Q12543
5061	Seine-Saint-Denis	75	FR	\N	93	metropolitan department	48.90993180	2.30573790	2021-12-11 19:33:32	2021-12-11 20:21:12	1	Q12761
5062	Val-de-Marne	75	FR	\N	94	metropolitan department	48.77470040	2.32210390	2021-12-11 19:33:33	2022-03-13 16:31:45	1	Q12788
5063	Val-d\\"Oise	75	FR	\N	95	metropolitan department	49.07518180	1.82169140	2021-12-11 19:33:34	2021-12-11 20:21:42	1	Q12784
5064	Clipperton	75	FR	IP	CP	dependency	10.28335410	-109.22542150	2021-12-11 17:51:55	2021-12-11 18:12:43	1	Q161258
5065	French Southern and Antarctic Lands	75	FR	FS	TF	overseas territory	-47.54466040	51.28375420	2021-12-11 17:52:02	2021-12-11 18:13:21	1	Q129003
5067	Sharqia	65	EG	13	SHR	\N	30.67305450	31.15932470	2022-01-16 12:06:48	2022-08-31 15:52:51	1	Q31074
5068	Loja	64	EC	12	L	province	-3.99313000	-79.20422000	2022-01-20 15:19:51	2022-01-22 14:51:12	1	Q504238
5069	Karlovac	55	HR	05	04	county	45.26133520	15.52542016	2022-03-04 15:22:53	2022-05-08 20:25:51	1	Q57071
5070	Kampong Thom	37	KH	05	6	province	12.81674850	103.84131040	2019-10-05 23:18:56	2022-03-13 13:41:34	1	Q502148
5071	Poltavska oblast	230	UA	18	53	region	49.64291960	32.66753390	2022-03-13 15:35:25	2022-03-13 15:35:25	1	Q169501
5072	Saint Thomas	242	VI	\N	ST	district	18.34284590	-65.07701800	2022-05-08 17:27:30	2022-05-08 17:27:30	1	Q463937
5073	Saint John	242	VI	\N	SJ	district	18.33561690	-64.80028000	2022-05-08 17:27:30	2022-05-08 17:27:30	1	Q849441
5074	Saint Croix	242	VI	\N	SC	district	17.72935200	-64.73437050	2022-05-08 17:27:30	2022-05-08 17:28:39	1	Q642481
5075	San Juan	178	PR	233	SJ	region	18.45000000	-66.06666667	2022-05-08 18:23:18	2023-03-25 19:26:47	1	Q41211
5076	Bayamon	178	PR	233	BY	region	18.17777778	-66.11333333	2022-05-08 18:23:18	2023-03-25 19:26:47	1	Q16089204
5077	Carolina	178	PR	233	CL	region	18.38888889	-65.96666667	2022-05-08 18:23:18	2023-03-25 19:26:47	1	Q990293
5078	Ponce	178	PR	233	PO	region	18.00000000	-66.61666667	2022-05-08 18:23:18	2023-03-25 19:26:47	1	Q864024
5079	Caguas	178	PR	233	CG	region	18.23333333	-66.03333333	2022-05-08 18:23:18	2023-03-25 19:26:47	1	Q527268
5080	Guaynabo	178	PR	233	GN	region	18.36666667	-66.10000000	2022-05-08 18:23:18	2023-03-25 19:26:47	1	Q590060
5081	Arecibo	178	PR	233	AR	region	18.47055556	-66.72083333	2022-05-08 18:23:18	2023-03-25 19:26:47	1	Q640728
5082	Toa Baja	178	PR	233	TB	region	18.44388900	-66.25972200	2022-05-08 18:23:18	2023-03-25 19:26:47	1	Q2238070
5083	Mayagüez	178	PR	233	MG	region	18.20111111	-67.13972222	2022-05-08 18:23:18	2023-03-25 19:26:47	1	Q632727
5084	Trujillo Alto	178	PR	233	TA	region	18.36277800	-66.01750000	2022-05-08 18:23:18	2023-03-25 19:26:47	1	Q1150895
5085	Komárom-Esztergom	99	HU		KE	county	47.57797860	18.12568550	2019-10-05 23:18:40	2020-12-21 21:20:22	1	Q190018
5086	Bonaire	155	BQ	06	BQ1	special municipality	12.20189020	-68.26238220	2019-10-05 23:18:48	2022-05-09 00:08:21	1	Q25396
5087	Saba	155	BQ	10	BQ2	special municipality	17.63546420	-63.23267630	2019-10-05 23:18:48	2022-05-09 00:08:21	1	Q25528
5088	Sint Eustatius	155	BQ	05	BQ3	special municipality	17.48903060	-62.97355500	2019-10-05 23:18:48	2022-05-09 00:08:21	1	Q26180
5089	A Coruña	207	ES	\N	C	province	43.36190400	-8.43019320	2022-08-28 14:59:02	2022-08-28 14:59:02	1	Q8757
5090	Lugo	207	ES	\N	LU	province	43.01231370	-7.57400960	2022-08-28 18:51:53	2022-08-28 18:51:53	1	Q11125
5091	Ourense	207	ES	\N	OR	province	42.33836130	-7.88119510	2022-08-28 19:22:08	2022-08-28 19:22:08	1	Q95038
5092	Badajoz	207	ES	\N	BA	province	38.87937480	-7.02269830	2022-08-28 19:38:39	2022-08-28 19:38:39	1	Q81803
5093	Araba	207	ES	\N	VI	province	42.83951190	-3.84237740	2022-08-28 19:51:50	2022-08-28 19:51:50	1	Q81801
5094	Bizkaia	207	ES	\N	BI	province	43.21921990	-3.21110870	2022-08-28 19:54:54	2022-08-28 19:54:54	1	Q93366
5095	Almeria	207	ES	\N	AL	province	36.84152680	-2.47462610	2022-08-28 20:10:22	2022-08-28 20:10:22	1	Q10400
5096	Cádiz	207	ES	\N	CA	province	36.51638510	-6.29997670	2022-08-28 20:13:54	2022-08-28 20:13:54	1	Q15682
5097	Córdoba	207	ES	\N	CO	province	36.51638510	-6.29997670	2022-08-28 20:16:43	2022-08-28 20:18:36	1	Q5818
5098	Granada	207	ES	\N	GR	province	37.18094110	-3.62629100	2022-08-28 20:21:59	2022-08-28 20:21:59	1	Q8810
5099	Huelva	207	ES	\N	H	province	37.27086660	-6.95719990	2022-08-28 20:28:21	2022-08-28 20:28:21	1	Q12246
5100	Jaén	207	ES	\N	J	province	37.78009310	-3.81437450	2022-08-28 20:32:57	2022-08-28 20:32:57	1	Q15681
5101	Málaga	207	ES	\N	MA	province	36.71820150	-4.51930600	2022-08-28 20:36:13	2022-08-28 20:36:13	1	Q8851
5102	Barcelona	207	ES	\N	B	province	41.39266790	2.14018910	2022-08-29 12:18:40	2022-08-29 12:18:40	1	Q1492
5103	Girona	207	ES	\N	GI	province	41.98034450	2.80115770	2022-08-29 12:21:41	2022-08-29 12:21:41	1	Q7038
5104	Lleida	207	ES	\N	L	province	41.61837310	0.60242530	2022-08-29 12:24:43	2022-08-29 12:24:43	1	Q15090
5105	Ciudad Real	207	ES	\N	CR	province	38.98607580	-3.94449750	2022-08-29 12:32:44	2022-08-29 12:32:44	1	Q15093
5106	Cuenca	207	ES	\N	CU	province	40.06200360	-2.16553440	2022-08-29 12:34:38	2022-08-29 12:34:38	1	Q54888
5107	Guadalajara	207	ES	\N	GU	province	40.63222140	-3.19068200	2022-08-29 12:36:21	2022-08-29 12:36:21	1	Q11953
5108	Alicante	207	ES	\N	A	province	38.35795460	-0.54256340	2022-08-29 12:42:59	2022-08-29 12:42:59	1	Q11959
5109	Albacete	207	ES	\N	AB	province	38.99223120	-1.87809890	2022-08-29 12:46:46	2022-08-29 12:46:46	1	Q54889
5110	Castellón	207	ES	\N	CS	province	39.98114350	0.00884070	2022-08-29 12:56:02	2022-08-29 12:56:02	1	Q54942
5111	Teruel	207	ES	\N	TE	province	40.34504100	-1.11847440	2022-08-29 12:58:56	2022-08-29 12:58:56	1	Q14336
5112	Santa Cruz de Tenerife	207	ES	\N	TF	province	28.45789140	-16.32135390	2022-08-29 13:00:37	2022-08-29 13:00:37	1	Q14328
5113	Zaragoza	207	ES	\N	Z	province	41.65175010	-0.93000020	2022-08-29 13:02:20	2022-08-29 13:02:20	1	Q10305
5114	Chari-Baguirmi	43	TD	15	CB	province	11.46186260	15.24463940	2022-08-31 14:16:52	2022-08-31 14:16:52	1	Q843975
5115	Western Samar	174	PH	\N	WSA	province	12.00002060	124.99124520	2022-08-31 15:39:41	2022-08-31 15:39:41	1	Q13876
5116	Nabeul	224	TN	19	21	governorate	36.45245910	10.68032220	2022-08-31 15:56:14	2022-08-31 15:57:04	1	Q328145
5117	Jämtland County	213	SE	29	0	SE-Z	63.28306200	14.23828100	2022-11-04 09:51:51	2022-11-04 09:51:51	1	Q103679
5118	Bethlehem	169	PS	\N	BTH	governorate	31.70539960	35.19368770	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5119	Deir El Balah	169	PS	\N	DEB	governorate	\N	\N	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5120	Gaza	169	PS	\N	GZA	governorate	\N	\N	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5121	Hebron	169	PS	\N	HBN	governorate	31.53260010	35.06394750	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5122	Jenin	169	PS	\N	JEN	governorate	\N	\N	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5123	Jericho and Al Aghwar	169	PS	\N	JRH	governorate	\N	\N	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5124	Jerusalem	169	PS	\N	JEM	governorate	\N	\N	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5125	Khan Yunis	169	PS	\N	KYS	governorate	\N	\N	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5126	Nablus	169	PS	\N	NBS	governorate	\N	\N	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5127	North Gaza	169	PS	\N	NGZ	governorate	\N	\N	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5128	Qalqilya	169	PS	\N	QQA	governorate	\N	\N	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5129	Rafah	169	PS	\N	RFH	governorate	\N	\N	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5130	Ramallah	169	PS	\N	RBH	governorate	\N	\N	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5131	Salfit	169	PS	\N	SLT	governorate	\N	\N	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5132	Tubas	169	PS	\N	TBS	governorate	\N	\N	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5133	Tulkarm	169	PS	\N	TKM	governorate	\N	\N	2022-11-06 19:34:06	2022-11-06 19:34:06	1	\N
5134	Adjuntas	178	PR	\N	001	municipalities	18.16348480	-66.72315800	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q1864884
5135	Aguada	178	PR	\N	003	municipalities	18.38015790	-67.18870400	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q365641
5136	Aguadilla	178	PR	\N	005	municipalities	18.42744540	-67.15406980	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q397826
5137	Aguas Buenas	178	PR	\N	007	municipalities	18.25689890	-66.10294420	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2361568
5138	Aibonito	178	PR	\N	009	municipalities	18.13995940	-66.26600160	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2485628
5139	Añasco	178	PR	\N	011	municipalities	18.28544760	-67.14029350	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2390910
5140	Arecibo	178	PR	\N	013	municipalities	18.47051370	-66.72184720	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q640728
5141	Arroyo	178	PR	\N	015	municipalities	17.99642200	-66.09248790	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q344528
5142	Barceloneta	178	PR	\N	017	municipalities	41.38010610	2.18969570	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q526438
5143	Barranquitas	178	PR	\N	019	municipalities	18.18662420	-66.30628020	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2485615
5144	Bayamón	178	PR	\N	021	municipalities	18.38939600	-66.16532240	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q739675
5145	Cabo Rojo	178	PR	\N	023	municipalities	18.08662650	-67.14573470	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q396221
5146	Caguas	178	PR	\N	025	municipalities	18.23879950	-66.03524900	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q527268
5147	Camuy	178	PR	\N	027	municipalities	18.48383300	-66.84489940	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2380860
5148	Canóvanas	178	PR	\N	029	municipalities	18.37487480	-65.89975330	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2361552
5149	Carolina	178	PR	\N	031	municipalities	18.36808770	-66.04247340	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q729639
5150	Cataño	178	PR	\N	033	municipalities	18.44653550	-66.13557750	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q768483
5151	Cayey	178	PR	\N	035	municipalities	18.11190510	-66.16600000	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2307508
5152	Ceiba	178	PR	\N	037	municipalities	18.24751770	-65.90849530	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q284019
5153	Ciales	178	PR	\N	039	municipalities	18.33606220	-66.46878230	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2485522
5154	Cidra	178	PR	\N	041	municipalities	18.17579140	-66.16127790	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q431138
5155	Coamo	178	PR	\N	043	municipalities	18.07996160	-66.35794730	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q1942303
5156	Comerío	178	PR	\N	045	municipalities	18.21920010	-66.22560220	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2222328
5157	Corozal	178	PR	\N	047	municipalities	18.40308020	-88.39675360	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q451786
5158	Culebra	178	PR	\N	049	municipalities	18.31039400	-65.30307050	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q526402
5159	Dorado	178	PR	\N	051	municipalities	43.14805560	-77.57722220	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q8837
5160	Fajardo	178	PR	\N	053	municipalities	18.32521480	-65.65393560	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q542833
5161	Florida	178	PR	\N	054	municipalities	27.66482740	-81.51575350	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q812
5162	Guánica	178	PR	\N	055	municipalities	17.97251450	-66.90862640	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q1019645
5163	Guayama	178	PR	\N	057	municipalities	17.98413280	-66.11377670	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q1870997
5164	Guayanilla	178	PR	\N	059	municipalities	18.01913140	-66.79184200	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2333093
5165	Guaynabo	178	PR	\N	061	municipalities	18.36129540	-66.11029570	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q590060
5166	Gurabo	178	PR	\N	063	municipalities	18.25439870	-65.97294210	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q396816
5167	Hatillo	178	PR	\N	065	municipalities	18.42846420	-66.78753210	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q1179486
5168	Hormigueros	178	PR	\N	067	municipalities	18.13346380	-67.11281230	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2361536
5169	Humacao	178	PR	\N	069	municipalities	18.15157360	-65.82485290	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2307535
5170	Isabela	178	PR	\N	071	municipalities	16.97537580	121.81070790	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q230864
5171	Jayuya	178	PR	\N	073	municipalities	18.21856740	-66.59156170	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2095818
5172	Juana Díaz	178	PR	\N	075	municipalities	18.05343720	-66.50750790	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2361577
5173	Juncos	178	PR	\N	077	municipalities	18.22745580	-65.92099700	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2347667
5174	Lajas	178	PR	\N	079	municipalities	18.04996200	-67.05934490	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q396648
5175	Lares	178	PR	\N	081	municipalities	34.02508020	-118.45945930	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q504377
5176	Las Marías	178	PR	\N	083	municipalities	35.83822380	-78.61035660	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2485590
5177	Las Piedras	178	PR	\N	085	municipalities	18.18557530	-65.87362450	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q115308
5178	Loíza	178	PR	\N	087	municipalities	18.43299040	-65.87836000	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q1853983
5179	Luquillo	178	PR	\N	089	municipalities	18.37245070	-65.71655110	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q1984618
5180	Manatí	178	PR	\N	091	municipalities	18.41812150	-66.52627830	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q674599
5181	Maricao	178	PR	\N	093	municipalities	18.18079020	-66.97990010	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2624359
5182	Maunabo	178	PR	\N	095	municipalities	18.00718850	-65.89932890	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q3017679
5183	Mayagüez	178	PR	\N	097	municipalities	18.20134520	-67.14515490	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q632727
5184	Moca	178	PR	\N	099	municipalities	18.39679290	-67.14790350	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q439855
5185	Morovis	178	PR	\N	101	municipalities	18.32578500	-66.40655920	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2623982
5186	Naguabo	178	PR	\N	103	municipalities	18.21162470	-65.73488410	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2659720
5187	Naranjito	178	PR	\N	105	municipalities	18.30078610	-66.24489040	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q416476
5188	Orocovis	178	PR	\N	107	municipalities	18.22692240	-66.39116860	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2624345
5189	Patillas	178	PR	\N	109	municipalities	18.00373810	-66.01340590	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2485638
5190	Peñuelas	178	PR	\N	111	municipalities	18.06335770	-66.72738960	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q369880
5191	Ponce	178	PR	\N	113	municipalities	18.01107680	-66.61406160	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q403985
5192	Quebradillas	178	PR	\N	115	municipalities	18.47383300	-66.93851200	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2057872
5193	Rincón	178	PR	\N	117	municipalities	18.34015140	-67.24994590	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q294727
5194	Río Grande	178	PR	\N	119	municipalities	28.81063826	-101.83538780	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q160636
5195	Sabana Grande	178	PR	\N	121	municipalities	18.07773920	-66.96045490	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q739870
5196	Salinas	178	PR	\N	123	municipalities	36.67773720	-121.65550130	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q229252
5197	San Germán	178	PR	\N	125	municipalities	18.08070820	-67.04110960	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q1598808
5198	San Juan	178	PR	\N	127	municipalities	18.46320300	-66.11475710	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q1320747
5199	San Lorenzo	178	PR	\N	129	municipalities	18.18869120	-65.97658620	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q225380
5200	San Sebastián	178	PR	\N	131	municipalities	43.31833400	-1.98123130	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q10313
5201	Santa Isabel	178	PR	\N	133	municipalities	17.96607750	-66.40489200	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q234744
5202	Toa Alta	178	PR	\N	135	municipalities	18.38828230	-66.24822370	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2485509
5203	Toa Baja	178	PR	\N	137	municipalities	18.44447090	-66.25432930	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2238070
5204	Trujillo Alto	178	PR	\N	139	municipalities	18.35467190	-66.00738760	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q1150895
5205	Utuado	178	PR	\N	141	municipalities	18.26550950	-66.70045190	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q617096
5206	Vega Alta	178	PR	\N	143	municipalities	18.41217030	-66.33128050	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2640843
5207	Vega Baja	178	PR	\N	145	municipalities	18.44614590	-66.40419670	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2179051
5208	Vieques	178	PR	\N	147	municipalities	18.12628540	-65.44009850	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q737624
5209	Villalba	178	PR	\N	149	municipalities	18.12175540	-66.49857870	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q299761
5210	Yabucoa	178	PR	\N	151	municipalities	18.05052010	-65.87932880	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q2361097
5211	Yauco	178	PR	\N	153	municipalities	18.03496400	-66.84989830	2023-03-25 19:59:22	2023-03-25 19:59:22	1	Q368526
5212	Baker Island	234	UM	\N	81	island	0.19362660	-176.47690800	2023-03-25 20:08:55	2023-03-25 20:08:55	1	Q46879
5213	Howland Island	234	UM	\N	84	island	0.81132190	-176.61827360	2023-03-25 20:08:55	2023-03-25 20:08:55	1	Q131305
5214	Jarvis Island	234	UM	\N	86	island	-0.37435030	-159.99672060	2023-03-25 20:08:55	2023-03-25 20:08:55	1	Q62218
5215	Johnston Atoll	234	UM	\N	67	island	16.72950350	-169.53364770	2023-03-25 20:08:55	2023-03-25 20:08:55	1	Q131008
5216	Kingman Reef	234	UM	\N	89	island	6.38333300	-162.41666700	2023-03-25 20:08:55	2023-03-25 20:08:55	1	Q130895
5217	Midway Islands	234	UM	\N	71	island	28.20721680	-177.37349260	2023-03-25 20:08:55	2023-03-25 20:08:55	1	Q47863
5218	Navassa Island	234	UM	\N	76	island	18.41006890	-75.01146120	2023-03-25 20:08:55	2023-03-25 20:08:55	1	Q25359
5219	Palmyra Atoll	234	UM	\N	95	island	5.88850260	-162.07866560	2023-03-25 20:08:55	2023-03-25 20:08:55	1	Q123076
5220	Wake Island	234	UM	\N	79	island	19.27961900	166.64993480	2023-03-25 20:08:55	2023-03-25 20:08:55	1	Q43296
5221	Asuncion	172	PY	\N	ASU	capital	-25.29682970	-57.68066230	2023-06-28 20:08:55	2023-06-28 20:08:55	1	Q2933
5222	Canarias	207	ES	IC	CN	autonomous community	28.29160000	16.62910000	2019-10-05 23:19:00	2023-07-28 17:08:53	1	Q5813
5223	Ceuta	207	ES		CE	autonomous city in North Africa	35.88900000	-5.31870000	2023-07-28 17:49:31	2023-07-28 17:49:31	1	Q25212
5224	Melilla	207	ES		ML	autonomous city in North Africa	35.29370000	-2.93830000	2023-07-28 17:49:31	2023-07-28 17:49:56	1	Q131981
5225	South Province	157	NC		01	province	-22.27580000	166.45800000	2023-09-06 12:55:00	2023-09-06 12:55:00	1	Q965632
5226	North Province	157	NC		02	province	-22.27580000	166.45800000	2023-09-06 12:55:00	2023-09-06 12:55:00	1	Q1612920
5227	Loyalty Islands Province	157	NC		03	province	-20.96670000	167.23330000	2023-09-06 12:55:00	2023-09-06 12:55:00	1	Q18655787
\.


--
-- Data for Name: subregions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subregions (id, name, translations, region_id, created_at, updated_at, flag, wikidataid) FROM stdin;
1	Northern Africa	{\\"korean\\":\\"북아프리카\\",\\"portuguese\\":\\"Norte de África\\",\\"dutch\\":\\"Noord-Afrika\\",\\"croatian\\":\\"Sjeverna Afrika\\",\\"persian\\":\\"شمال آفریقا\\",\\"german\\":\\"Nordafrika\\",\\"spanish\\":\\"Norte de África\\",\\"french\\":\\"Afrique du Nord\\",\\"japanese\\":\\"北アフリカ\\",\\"italian\\":\\"Nordafrica\\",\\"chinese\\":\\"北部非洲\\"}	1	2023-08-14 07:11:03	2023-08-24 20:10:23	1	Q27381
2	Middle Africa	{\\"korean\\":\\"중앙아프리카\\",\\"portuguese\\":\\"África Central\\",\\"dutch\\":\\"Centraal-Afrika\\",\\"croatian\\":\\"Srednja Afrika\\",\\"persian\\":\\"مرکز آفریقا\\",\\"german\\":\\"Zentralafrika\\",\\"spanish\\":\\"África Central\\",\\"french\\":\\"Afrique centrale\\",\\"japanese\\":\\"中部アフリカ\\",\\"italian\\":\\"Africa centrale\\",\\"chinese\\":\\"中部非洲\\"}	1	2023-08-14 07:11:03	2023-08-24 20:22:09	1	Q27433
3	Western Africa	{\\"korean\\":\\"서아프리카\\",\\"portuguese\\":\\"África Ocidental\\",\\"dutch\\":\\"West-Afrika\\",\\"croatian\\":\\"Zapadna Afrika\\",\\"persian\\":\\"غرب آفریقا\\",\\"german\\":\\"Westafrika\\",\\"spanish\\":\\"África Occidental\\",\\"french\\":\\"Afrique de l\\"Ouest\\",\\"japanese\\":\\"西アフリカ\\",\\"italian\\":\\"Africa occidentale\\",\\"chinese\\":\\"西非\\"}	1	2023-08-14 07:11:03	2023-08-24 20:22:09	1	Q4412
4	Eastern Africa	{\\"korean\\":\\"동아프리카\\",\\"portuguese\\":\\"África Oriental\\",\\"dutch\\":\\"Oost-Afrika\\",\\"croatian\\":\\"Istočna Afrika\\",\\"persian\\":\\"شرق آفریقا\\",\\"german\\":\\"Ostafrika\\",\\"spanish\\":\\"África Oriental\\",\\"french\\":\\"Afrique de l\\"Est\\",\\"japanese\\":\\"東アフリカ\\",\\"italian\\":\\"Africa orientale\\",\\"chinese\\":\\"东部非洲\\"}	1	2023-08-14 07:11:03	2023-08-24 20:22:10	1	Q27407
5	Southern Africa	{\\"korean\\":\\"남아프리카\\",\\"portuguese\\":\\"África Austral\\",\\"dutch\\":\\"Zuidelijk Afrika\\",\\"croatian\\":\\"Južna Afrika\\",\\"persian\\":\\"جنوب آفریقا\\",\\"german\\":\\"Südafrika\\",\\"spanish\\":\\"África austral\\",\\"french\\":\\"Afrique australe\\",\\"japanese\\":\\"南部アフリカ\\",\\"italian\\":\\"Africa australe\\",\\"chinese\\":\\"南部非洲\\"}	1	2023-08-14 07:11:03	2023-08-24 20:22:10	1	Q27394
6	Northern America	{\\"korean\\":\\"북미\\",\\"portuguese\\":\\"América Setentrional\\",\\"dutch\\":\\"Noord-Amerika\\",\\"persian\\":\\"شمال آمریکا\\",\\"german\\":\\"Nordamerika\\",\\"spanish\\":\\"América Norteña\\",\\"french\\":\\"Amérique septentrionale\\",\\"japanese\\":\\"北部アメリカ\\",\\"italian\\":\\"America settentrionale\\",\\"chinese\\":\\"北美地區\\"}	2	2023-08-14 07:11:03	2023-08-24 20:22:10	1	Q2017699
7	Caribbean	{\\"korean\\":\\"카리브\\",\\"portuguese\\":\\"Caraíbas\\",\\"dutch\\":\\"Caraïben\\",\\"croatian\\":\\"Karibi\\",\\"persian\\":\\"کارائیب\\",\\"german\\":\\"Karibik\\",\\"spanish\\":\\"Caribe\\",\\"french\\":\\"Caraïbes\\",\\"japanese\\":\\"カリブ海地域\\",\\"italian\\":\\"Caraibi\\",\\"chinese\\":\\"加勒比地区\\"}	2	2023-08-14 07:11:03	2023-08-24 20:22:10	1	Q664609
8	South America	{\\"korean\\":\\"남아메리카\\",\\"portuguese\\":\\"América do Sul\\",\\"dutch\\":\\"Zuid-Amerika\\",\\"croatian\\":\\"Južna Amerika\\",\\"persian\\":\\"آمریکای جنوبی\\",\\"german\\":\\"Südamerika\\",\\"spanish\\":\\"América del Sur\\",\\"french\\":\\"Amérique du Sud\\",\\"japanese\\":\\"南アメリカ\\",\\"italian\\":\\"America meridionale\\",\\"chinese\\":\\"南美洲\\"}	2	2023-08-14 07:11:03	2023-08-24 20:22:10	1	Q18
9	Central America	{\\"korean\\":\\"중앙아메리카\\",\\"portuguese\\":\\"América Central\\",\\"dutch\\":\\"Centraal-Amerika\\",\\"croatian\\":\\"Srednja Amerika\\",\\"persian\\":\\"آمریکای مرکزی\\",\\"german\\":\\"Zentralamerika\\",\\"spanish\\":\\"América Central\\",\\"french\\":\\"Amérique centrale\\",\\"japanese\\":\\"中央アメリカ\\",\\"italian\\":\\"America centrale\\",\\"chinese\\":\\"中美洲\\"}	2	2023-08-14 07:11:03	2023-08-24 20:22:11	1	Q27611
10	Central Asia	{\\"korean\\":\\"중앙아시아\\",\\"portuguese\\":\\"Ásia Central\\",\\"dutch\\":\\"Centraal-Azië\\",\\"croatian\\":\\"Srednja Azija\\",\\"persian\\":\\"آسیای میانه\\",\\"german\\":\\"Zentralasien\\",\\"spanish\\":\\"Asia Central\\",\\"french\\":\\"Asie centrale\\",\\"japanese\\":\\"中央アジア\\",\\"italian\\":\\"Asia centrale\\",\\"chinese\\":\\"中亚\\"}	3	2023-08-14 07:11:03	2023-08-24 20:22:11	1	Q27275
11	Western Asia	{\\"korean\\":\\"서아시아\\",\\"portuguese\\":\\"Sudoeste Asiático\\",\\"dutch\\":\\"Zuidwest-Azië\\",\\"croatian\\":\\"Jugozapadna Azija\\",\\"persian\\":\\"غرب آسیا\\",\\"german\\":\\"Vorderasien\\",\\"spanish\\":\\"Asia Occidental\\",\\"french\\":\\"Asie de l\\"Ouest\\",\\"japanese\\":\\"西アジア\\",\\"italian\\":\\"Asia occidentale\\",\\"chinese\\":\\"西亚\\"}	3	2023-08-14 07:11:03	2023-08-24 20:22:11	1	Q27293
12	Eastern Asia	{\\"korean\\":\\"동아시아\\",\\"portuguese\\":\\"Ásia Oriental\\",\\"dutch\\":\\"Oost-Azië\\",\\"croatian\\":\\"Istočna Azija\\",\\"persian\\":\\"شرق آسیا\\",\\"german\\":\\"Ostasien\\",\\"spanish\\":\\"Asia Oriental\\",\\"french\\":\\"Asie de l\\"Est\\",\\"japanese\\":\\"東アジア\\",\\"italian\\":\\"Asia orientale\\",\\"chinese\\":\\"東亞\\"}	3	2023-08-14 07:11:03	2023-08-24 20:22:11	1	Q27231
13	South-Eastern Asia	{\\"korean\\":\\"동남아시아\\",\\"portuguese\\":\\"Sudeste Asiático\\",\\"dutch\\":\\"Zuidoost-Azië\\",\\"croatian\\":\\"Jugoistočna Azija\\",\\"persian\\":\\"جنوب شرق آسیا\\",\\"german\\":\\"Südostasien\\",\\"spanish\\":\\"Sudeste Asiático\\",\\"french\\":\\"Asie du Sud-Est\\",\\"japanese\\":\\"東南アジア\\",\\"italian\\":\\"Sud-est asiatico\\",\\"chinese\\":\\"东南亚\\"}	3	2023-08-14 07:11:03	2023-08-24 20:22:12	1	Q11708
14	Southern Asia	{\\"korean\\":\\"남아시아\\",\\"portuguese\\":\\"Ásia Meridional\\",\\"dutch\\":\\"Zuid-Azië\\",\\"croatian\\":\\"Južna Azija\\",\\"persian\\":\\"جنوب آسیا\\",\\"german\\":\\"Südasien\\",\\"spanish\\":\\"Asia del Sur\\",\\"french\\":\\"Asie du Sud\\",\\"japanese\\":\\"南アジア\\",\\"italian\\":\\"Asia meridionale\\",\\"chinese\\":\\"南亚\\"}	3	2023-08-14 07:11:03	2023-08-24 20:22:12	1	Q771405
15	Eastern Europe	{\\"korean\\":\\"동유럽\\",\\"portuguese\\":\\"Europa de Leste\\",\\"dutch\\":\\"Oost-Europa\\",\\"croatian\\":\\"Istočna Europa\\",\\"persian\\":\\"شرق اروپا\\",\\"german\\":\\"Osteuropa\\",\\"spanish\\":\\"Europa Oriental\\",\\"french\\":\\"Europe de l\\"Est\\",\\"japanese\\":\\"東ヨーロッパ\\",\\"italian\\":\\"Europa orientale\\",\\"chinese\\":\\"东欧\\"}	4	2023-08-14 07:11:03	2023-08-24 20:22:12	1	Q27468
16	Southern Europe	{\\"korean\\":\\"남유럽\\",\\"portuguese\\":\\"Europa meridional\\",\\"dutch\\":\\"Zuid-Europa\\",\\"croatian\\":\\"Južna Europa\\",\\"persian\\":\\"جنوب اروپا\\",\\"german\\":\\"Südeuropa\\",\\"spanish\\":\\"Europa del Sur\\",\\"french\\":\\"Europe du Sud\\",\\"japanese\\":\\"南ヨーロッパ\\",\\"italian\\":\\"Europa meridionale\\",\\"chinese\\":\\"南欧\\"}	4	2023-08-14 07:11:03	2023-08-24 20:22:12	1	Q27449
17	Western Europe	{\\"korean\\":\\"서유럽\\",\\"portuguese\\":\\"Europa Ocidental\\",\\"dutch\\":\\"West-Europa\\",\\"croatian\\":\\"Zapadna Europa\\",\\"persian\\":\\"غرب اروپا\\",\\"german\\":\\"Westeuropa\\",\\"spanish\\":\\"Europa Occidental\\",\\"french\\":\\"Europe de l\\"Ouest\\",\\"japanese\\":\\"西ヨーロッパ\\",\\"italian\\":\\"Europa occidentale\\",\\"chinese\\":\\"西欧\\"}	4	2023-08-14 07:11:03	2023-08-24 20:22:12	1	Q27496
18	Northern Europe	{\\"korean\\":\\"북유럽\\",\\"portuguese\\":\\"Europa Setentrional\\",\\"dutch\\":\\"Noord-Europa\\",\\"croatian\\":\\"Sjeverna Europa\\",\\"persian\\":\\"شمال اروپا\\",\\"german\\":\\"Nordeuropa\\",\\"spanish\\":\\"Europa del Norte\\",\\"french\\":\\"Europe du Nord\\",\\"japanese\\":\\"北ヨーロッパ\\",\\"italian\\":\\"Europa settentrionale\\",\\"chinese\\":\\"北歐\\"}	4	2023-08-14 07:11:03	2023-08-24 20:22:13	1	Q27479
19	Australia and New Zealand	{\\"korean\\":\\"오스트랄라시아\\",\\"portuguese\\":\\"Australásia\\",\\"dutch\\":\\"Australazië\\",\\"croatian\\":\\"Australazija\\",\\"persian\\":\\"استرالزی\\",\\"german\\":\\"Australasien\\",\\"spanish\\":\\"Australasia\\",\\"french\\":\\"Australasie\\",\\"japanese\\":\\"オーストララシア\\",\\"italian\\":\\"Australasia\\",\\"chinese\\":\\"澳大拉西亞\\"}	5	2023-08-14 07:11:03	2023-08-24 20:22:13	1	Q45256
20	Melanesia	{\\"korean\\":\\"멜라네시아\\",\\"portuguese\\":\\"Melanésia\\",\\"dutch\\":\\"Melanesië\\",\\"croatian\\":\\"Melanezija\\",\\"persian\\":\\"ملانزی\\",\\"german\\":\\"Melanesien\\",\\"spanish\\":\\"Melanesia\\",\\"french\\":\\"Mélanésie\\",\\"japanese\\":\\"メラネシア\\",\\"italian\\":\\"Melanesia\\",\\"chinese\\":\\"美拉尼西亚\\"}	5	2023-08-14 07:11:03	2023-08-24 20:22:13	1	Q37394
21	Micronesia	{\\"korean\\":\\"미크로네시아\\",\\"portuguese\\":\\"Micronésia\\",\\"dutch\\":\\"Micronesië\\",\\"croatian\\":\\"Mikronezija\\",\\"persian\\":\\"میکرونزی\\",\\"german\\":\\"Mikronesien\\",\\"spanish\\":\\"Micronesia\\",\\"french\\":\\"Micronésie\\",\\"japanese\\":\\"ミクロネシア\\",\\"italian\\":\\"Micronesia\\",\\"chinese\\":\\"密克罗尼西亚群岛\\"}	5	2023-08-14 07:11:03	2023-08-24 20:22:13	1	Q3359409
22	Polynesia	{\\"korean\\":\\"폴리네시아\\",\\"portuguese\\":\\"Polinésia\\",\\"dutch\\":\\"Polynesië\\",\\"croatian\\":\\"Polinezija\\",\\"persian\\":\\"پلی‌نزی\\",\\"german\\":\\"Polynesien\\",\\"spanish\\":\\"Polinesia\\",\\"french\\":\\"Polynésie\\",\\"japanese\\":\\"ポリネシア\\",\\"italian\\":\\"Polinesia\\",\\"chinese\\":\\"玻里尼西亞\\"}	5	2023-08-14 07:11:03	2023-08-24 20:22:13	1	Q35942
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, username, auth_key, password_hash, password_reset_token, email, status, created_at, updated_at, verification_token, type, matric_number) FROM stdin;
1	erau	tUu1qHcde0diwUol3xeI-18MuHkkprQI	$2y$13$nJ1WDlBaGcbCdbNC5.5l4.sgy.OMEKCqtDQOdQ2OWpgiKRWYyzzne	RkD_Jw0_8HEedzLk7MM-ZKEFfYR7VbMr_1392559490	sfriesen@jenkins.info	10	1392559490	1392559490	\N	I	\N
\.


--
-- Data for Name: user_admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_admin (id, username, matric_number, auth_key, password_hash, password_reset_token, email, status, created_at, updated_at) FROM stdin;
85	mohammed	11113	1eQj8nrSmfT2BHqeciTVKdSkMXRYQxP7	$2y$13$frw4lhz/ABCRPE.WwX9et.ELwCTvuKOB2tIOmHi3jqiI3Wz4SjFNK	\N	mohammed@gmail.com	10	1704271613	1704271613
88	nour	114	u2Nb4xcyp48ytOVXgY_EotbROpRuOHZn	$2y$13$JI/IYNsZTd4rgQIjDXOjbOFIURTgcsttsLpLLLRUn08B4Zw6vlBVi	\N	nour@gmail.com	10	1706588841	1706588841
1	yamen 	1725635	1eQj8nrSmfT2BHqeciTVKdSkMXRYQxP7	$2y$13$JI/IYNsZTd4rgQIjDXOjbOFIURTgcsttsLpLLLRUn08B4Zw6vlBVi	zwxD2MTsLDaumhkXWvbb47xW8CMater6_1706588882	yamen.zaiter24@gmail.com	10	\N	1706588882
\.


--
-- Name: Status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Status_id_seq"', 1, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, false);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 499, true);


--
-- Name: email_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.email_template_id_seq', 11, true);


--
-- Name: iiumcourse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iiumcourse_id_seq', 415, true);


--
-- Name: in_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.in_courses_id_seq', 151, true);


--
-- Name: inbound_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."inbound_ID_seq"', 14, true);


--
-- Name: inlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inlog_id_seq', 201, true);


--
-- Name: kcdio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kcdio_id_seq', 1, false);


--
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_id_seq', 619, true);


--
-- Name: outFiles_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."outFiles_ID_seq"', 88, true);


--
-- Name: outbound_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."outbound_ID_seq"', 88, true);


--
-- Name: poc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.poc_id_seq', 71, true);


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_id_seq', 1, false);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.states_id_seq', 1, false);


--
-- Name: subregions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subregions_id_seq', 1, false);


--
-- Name: user_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_admin_id_seq', 88, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- Name: Status Status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Status"
    ADD CONSTRAINT "Status_pkey" PRIMARY KEY ("ID");


--
-- Name: auth_assignment auth_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_assignment
    ADD CONSTRAINT auth_assignment_pkey PRIMARY KEY (item_name, user_id);


--
-- Name: auth_item_child auth_item_child_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_pkey PRIMARY KEY (parent, child);


--
-- Name: auth_item auth_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item
    ADD CONSTRAINT auth_item_pkey PRIMARY KEY (name);


--
-- Name: auth_rule auth_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_rule
    ADD CONSTRAINT auth_rule_pkey PRIMARY KEY (name);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: email_template email_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_template
    ADD CONSTRAINT email_template_pkey PRIMARY KEY (id);


--
-- Name: iiumcourse iiumcourse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iiumcourse
    ADD CONSTRAINT iiumcourse_pkey PRIMARY KEY (id);


--
-- Name: in_courses in_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.in_courses
    ADD CONSTRAINT in_courses_pkey PRIMARY KEY (id);


--
-- Name: inbound inbound_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inbound
    ADD CONSTRAINT inbound_pkey PRIMARY KEY ("ID");


--
-- Name: inlog inlog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inlog
    ADD CONSTRAINT inlog_pkey PRIMARY KEY (id);


--
-- Name: kcdio kcdio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kcdio
    ADD CONSTRAINT kcdio_pkey PRIMARY KEY (id);


--
-- Name: log log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY (id);


--
-- Name: migration migration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- Name: outFiles outFiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."outFiles"
    ADD CONSTRAINT "outFiles_pkey" PRIMARY KEY ("ID");


--
-- Name: outbound outbound_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outbound
    ADD CONSTRAINT outbound_pkey PRIMARY KEY ("ID");


--
-- Name: poc poc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poc
    ADD CONSTRAINT poc_pkey PRIMARY KEY (id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: subregions subregions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subregions
    ADD CONSTRAINT subregions_pkey PRIMARY KEY (id);


--
-- Name: user_admin user_admin_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_admin
    ADD CONSTRAINT user_admin_email_key UNIQUE (email);


--
-- Name: user_admin user_admin_matric_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_admin
    ADD CONSTRAINT user_admin_matric_number_key UNIQUE (matric_number);


--
-- Name: user_admin user_admin_matric_number_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_admin
    ADD CONSTRAINT user_admin_matric_number_key1 UNIQUE (matric_number);


--
-- Name: user_admin user_admin_password_reset_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_admin
    ADD CONSTRAINT user_admin_password_reset_token_key UNIQUE (password_reset_token);


--
-- Name: user_admin user_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_admin
    ADD CONSTRAINT user_admin_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_password_reset_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_password_reset_token_key UNIQUE (password_reset_token);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: idx-auth_assignment-user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx-auth_assignment-user_id" ON public.auth_assignment USING btree (user_id);


--
-- Name: idx-auth_item-type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx-auth_item-type" ON public.auth_item USING btree (type);


--
-- Name: auth_assignment auth_assignment_item_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_assignment
    ADD CONSTRAINT auth_assignment_item_name_fkey FOREIGN KEY (item_name) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_item_child auth_item_child_child_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_child_fkey FOREIGN KEY (child) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_item_child auth_item_child_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_parent_fkey FOREIGN KEY (parent) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_item auth_item_rule_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item
    ADD CONSTRAINT auth_item_rule_name_fkey FOREIGN KEY (rule_name) REFERENCES public.auth_rule(name) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: countries country_continent_final; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT country_continent_final FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: states country_region_final; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT country_region_final FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- Name: countries country_subregion_final; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT country_subregion_final FOREIGN KEY (subregion_id) REFERENCES public.subregions(id);


--
-- Name: outFiles fk-outbound-files-student_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."outFiles"
    ADD CONSTRAINT "fk-outbound-files-student_id" FOREIGN KEY ("Student_ID") REFERENCES public.outbound("ID") ON DELETE CASCADE;


--
-- Name: log fk-status_log-outbound_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log
    ADD CONSTRAINT "fk-status_log-outbound_id" FOREIGN KEY (outbound_id) REFERENCES public.outbound("ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: inlog fk-status_log-outbound_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inlog
    ADD CONSTRAINT "fk-status_log-outbound_id" FOREIGN KEY (outbound_id) REFERENCES public.inbound("ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: courses fk_courses_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_student FOREIGN KEY (student_id) REFERENCES public.outbound("ID") ON DELETE CASCADE;


--
-- Name: in_courses fk_courses_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.in_courses
    ADD CONSTRAINT fk_courses_student FOREIGN KEY (student_id) REFERENCES public.inbound("ID") ON DELETE CASCADE;


--
-- Name: iiumcourse fk_iiumcourses_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iiumcourse
    ADD CONSTRAINT fk_iiumcourses_student FOREIGN KEY (student_id) REFERENCES public.outbound("ID") ON DELETE CASCADE;


--
-- Name: subregions subregion_continent_final; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subregions
    ADD CONSTRAINT subregion_continent_final FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- PostgreSQL database dump complete
--

