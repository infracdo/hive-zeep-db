--
-- PostgreSQL database dump
--

\restrict zoaHaicj008HAQaNGGtc1cGxXoEPkIHRNbZYAn40oMt9qqW0iKbIPGUhZlcfM3R

-- Dumped from database version 15.14 (Debian 15.14-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Ubuntu 17.6-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: radiator
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO radiator;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Dashboard; Type: TABLE; Schema: public; Owner: zeepuser
--

CREATE TABLE public."Dashboard" (
    type text NOT NULL,
    total_online_subscriber integer,
    total_online_router integer,
    total_data_usage double precision,
    last_updated_at timestamp(3) without time zone
);


ALTER TABLE public."Dashboard" OWNER TO zeepuser;

--
-- Name: MobileOtp; Type: TABLE; Schema: public; Owner: zeepuser
--

CREATE TABLE public."MobileOtp" (
    otp_id text NOT NULL,
    otp text,
    mobile_no text,
    device_id text,
    created_at timestamp(3) without time zone,
    ref_id text
);


ALTER TABLE public."MobileOtp" OWNER TO zeepuser;

--
-- Name: Promos; Type: TABLE; Schema: public; Owner: zeepuser
--

CREATE TABLE public."Promos" (
    promo_id text NOT NULL,
    image_url text,
    link_url text,
    title text,
    description text,
    is_show boolean,
    created_at timestamp(3) without time zone,
    updated_at timestamp(3) without time zone,
    deleted_at timestamp(3) without time zone,
    type text
);


ALTER TABLE public."Promos" OWNER TO zeepuser;

--
-- Name: Routers; Type: TABLE; Schema: public; Owner: zeepuser
--

CREATE TABLE public."Routers" (
    router_id text NOT NULL,
    owner_user_id text,
    serial_no text,
    router_model text,
    router_version text,
    data_usage double precision,
    subscribers_count integer DEFAULT 0,
    long double precision,
    lat double precision,
    created_at timestamp(3) without time zone NOT NULL,
    updated_at timestamp(3) with time zone,
    deleted_at timestamp(3) with time zone,
    is_enabled boolean,
    mac_address text,
    ip_address text,
    password text,
    qr_string text,
    created_by text
);


ALTER TABLE public."Routers" OWNER TO zeepuser;

--
-- Name: Tiers; Type: TABLE; Schema: public; Owner: zeepuser
--

CREATE TABLE public."Tiers" (
    tier_id text NOT NULL,
    name text,
    description text,
    data_limit double precision,
    created_at timestamp(3) without time zone,
    updated_at timestamp(3) without time zone,
    deleted_at timestamp(3) without time zone,
    is_default_tier boolean
);


ALTER TABLE public."Tiers" OWNER TO zeepuser;

--
-- Name: Transactions; Type: TABLE; Schema: public; Owner: zeepuser
--

CREATE TABLE public."Transactions" (
    transaction_id text NOT NULL,
    type text,
    status text,
    payment_method text,
    amount double precision,
    qr_code_string text,
    charge_reference text,
    retrieval_reference text,
    retrieval_timestamp text,
    created_at timestamp(3) without time zone NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) with time zone
);


ALTER TABLE public."Transactions" OWNER TO zeepuser;

--
-- Name: UserRoles; Type: TABLE; Schema: public; Owner: zeepuser
--

CREATE TABLE public."UserRoles" (
    type text NOT NULL,
    description text,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public."UserRoles" OWNER TO zeepuser;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: zeepuser
--

CREATE TABLE public."Users" (
    user_id text NOT NULL,
    user_type text,
    name text,
    mobile_no text,
    email text,
    password text,
    created_at timestamp(3) without time zone NOT NULL,
    updated_at timestamp(3) without time zone,
    last_login timestamp(3) without time zone,
    deleted_at timestamp(3) without time zone,
    is_active boolean,
    device_id text,
    data_limit double precision,
    data_usage double precision,
    tier text,
    data_left double precision
);


ALTER TABLE public."Users" OWNER TO zeepuser;

--
-- Name: accounting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounting (
    username character varying(253),
    time_stamp bigint,
    acctstatustype character varying(50),
    acctdelaytime bigint,
    acctinputoctets bigint,
    acctoutputoctets bigint,
    acctsessionid character varying,
    acctsessiontime bigint,
    acctterminatecause character varying(50),
    nasidentifier character varying(253),
    nasport bigint,
    framedipaddress character varying(22),
    auth_mode character varying,
    device character varying,
    mac character varying,
    created_at timestamp with time zone,
    called_station_id text,
    calling_station_id text
);


ALTER TABLE public.accounting OWNER TO postgres;

--
-- Name: allowed_nas_mac_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.allowed_nas_mac_address (
    id integer NOT NULL,
    called_station_id text NOT NULL,
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.allowed_nas_mac_address OWNER TO postgres;

--
-- Name: allowed_nas_mac_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.allowed_nas_mac_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.allowed_nas_mac_address_id_seq OWNER TO postgres;

--
-- Name: allowed_nas_mac_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.allowed_nas_mac_address_id_seq OWNED BY public.allowed_nas_mac_address.id;


--
-- Name: called_station_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.called_station_log (
    id integer NOT NULL,
    username text,
    called_station_id text,
    nas_ip text,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.called_station_log OWNER TO postgres;

--
-- Name: called_station_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.called_station_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.called_station_log_id_seq OWNER TO postgres;

--
-- Name: called_station_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.called_station_log_id_seq OWNED BY public.called_station_log.id;


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: radiator
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hibernate_sequence OWNER TO radiator;

--
-- Name: nas_session_mac_attrs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nas_session_mac_attrs (
    username text NOT NULL,
    called_station_id text,
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.nas_session_mac_attrs OWNER TO postgres;

--
-- Name: radacct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.radacct (
    radacctid bigint NOT NULL,
    username character varying(64),
    acctstarttime timestamp without time zone,
    acctstoptime timestamp without time zone,
    acctsessiontime integer,
    unixtimestamp integer,
    acctstatustype character varying(32)
);


ALTER TABLE public.radacct OWNER TO postgres;

--
-- Name: radacct_radacctid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.radacct_radacctid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.radacct_radacctid_seq OWNER TO postgres;

--
-- Name: radacct_radacctid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.radacct_radacctid_seq OWNED BY public.radacct.radacctid;


--
-- Name: radauthlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.radauthlog (
    time_stamp bigint,
    username character varying(253),
    type integer,
    reason character varying(253)
);


ALTER TABLE public.radauthlog OWNER TO postgres;

--
-- Name: radcheck_old; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.radcheck_old (
    id integer NOT NULL,
    username character varying(64) DEFAULT ''::character varying NOT NULL,
    attribute character varying(64) DEFAULT ''::character varying NOT NULL,
    op character(2) DEFAULT '=='::bpchar NOT NULL,
    value character varying(253) DEFAULT ''::character varying NOT NULL,
    full_name character varying,
    address character varying,
    phone_no character varying,
    birthday character varying,
    gender character varying,
    id_type character varying,
    id_value character varying,
    status smallint,
    token character varying,
    registration_date character varying,
    validated smallint
);


ALTER TABLE public.radcheck_old OWNER TO postgres;

--
-- Name: radcheck_old_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.radcheck_old_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.radcheck_old_id_seq OWNER TO postgres;

--
-- Name: radcheck_old_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.radcheck_old_id_seq OWNED BY public.radcheck_old.id;


--
-- Name: radclientlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.radclientlist (
    nasidentifier character varying(50) NOT NULL,
    secret character varying(50) NOT NULL,
    ignoreacctsignature integer,
    dupinterval integer,
    defaultrealm character varying(80),
    nastype character varying(20),
    snmpcommunity character varying(20),
    livingstonoffs integer,
    livingstonhole integer,
    framedgroupbaseaddress character varying(50),
    framedgroupmaxportsperclassc integer,
    rewriteusername character varying(50),
    noignoreduplicates character varying(50),
    prehandlerhook character varying(50),
    identifier character varying
);


ALTER TABLE public.radclientlist OWNER TO postgres;

--
-- Name: radlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.radlog (
    time_stamp bigint,
    priority integer,
    message character varying(200)
);


ALTER TABLE public.radlog OWNER TO postgres;

--
-- Name: radonline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.radonline (
    username character varying(253) NOT NULL,
    nasidentifier character varying(253) NOT NULL,
    nasport bigint NOT NULL,
    acctsessionid character varying(253) NOT NULL,
    time_stamp bigint,
    framedipaddress character varying(22),
    nasporttype character varying(40),
    servicetype character varying(40)
);


ALTER TABLE public.radonline OWNER TO postgres;

--
-- Name: radpool; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.radpool (
    state integer NOT NULL,
    time_stamp bigint,
    expiry bigint,
    username character varying(253),
    pool character varying(50) NOT NULL,
    yiaddr character varying(50) NOT NULL,
    subnetmask character varying(50) NOT NULL,
    dnsserver character varying(50),
    nas_id character varying(253)
);


ALTER TABLE public.radpool OWNER TO postgres;

--
-- Name: radsqlradius; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.radsqlradius (
    targetname character varying(80),
    host1 character varying(50),
    host2 character varying(50),
    secret character varying(50),
    authport character varying(20),
    acctport character varying(20),
    retries integer,
    retrytimeout integer,
    useoldascendpasswords integer,
    serverhasbrokenportnumbers integer,
    serverhasbrokenaddresses integer,
    ignorereplysignature integer,
    failurepolicy integer
);


ALTER TABLE public.radsqlradius OWNER TO postgres;

--
-- Name: radsqlradiusindirect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.radsqlradiusindirect (
    sourcename character varying(80),
    targetname character varying(80)
);


ALTER TABLE public.radsqlradiusindirect OWNER TO postgres;

--
-- Name: radstatslog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.radstatslog (
    time_stamp bigint,
    type character varying(20),
    identifier character varying(30),
    accessaccepts bigint,
    accesschallenges bigint,
    accessrejects bigint,
    accessrequests bigint,
    accountingrequests bigint,
    accountingresponses bigint,
    badauthaccessrequests bigint,
    badauthaccountingrequests bigint,
    badauthrequests bigint,
    droppedaccessrequests bigint,
    droppedaccountingrequests bigint,
    droppedrequests bigint,
    dupaccessrequests bigint,
    dupaccountingrequests bigint,
    duplicaterequests bigint,
    malformedaccessrequests bigint,
    malformedaccountingrequests bigint,
    proxiednoreply bigint,
    proxiedrequests bigint,
    requests bigint,
    responsetime numeric(12,6)
);


ALTER TABLE public.radstatslog OWNER TO postgres;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    username text NOT NULL,
    nasipaddress text NOT NULL,
    nasport integer,
    acctsessionid text NOT NULL,
    acctstarttime timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: subscribers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscribers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscribers_id_seq OWNER TO postgres;

--
-- Name: subscribers; Type: TABLE; Schema: public; Owner: radiator
--

CREATE TABLE public.subscribers (
    id integer DEFAULT nextval('public.subscribers_id_seq'::regclass) NOT NULL,
    username character varying(255) NOT NULL,
    password text NOT NULL,
    session_limit integer DEFAULT 0 NOT NULL,
    remaining_session_time integer,
    bytes_limit bigint,
    remaining_bytes bigint,
    lname character varying NOT NULL,
    fname character varying NOT NULL,
    mname character varying,
    ename character varying,
    address character varying NOT NULL,
    phone_no character varying NOT NULL,
    birthdate date NOT NULL,
    gender character varying NOT NULL,
    status smallint NOT NULL,
    registration_date character varying NOT NULL
);


ALTER TABLE public.subscribers OWNER TO radiator;

--
-- Name: allowed_nas_mac_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.allowed_nas_mac_address ALTER COLUMN id SET DEFAULT nextval('public.allowed_nas_mac_address_id_seq'::regclass);


--
-- Name: called_station_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.called_station_log ALTER COLUMN id SET DEFAULT nextval('public.called_station_log_id_seq'::regclass);


--
-- Name: radacct radacctid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.radacct ALTER COLUMN radacctid SET DEFAULT nextval('public.radacct_radacctid_seq'::regclass);


--
-- Name: radcheck_old id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.radcheck_old ALTER COLUMN id SET DEFAULT nextval('public.radcheck_old_id_seq'::regclass);


--
-- Data for Name: Dashboard; Type: TABLE DATA; Schema: public; Owner: zeepuser
--

COPY public."Dashboard" (type, total_online_subscriber, total_online_router, total_data_usage, last_updated_at) FROM stdin;
online-dashboard	3	2	13356	2025-06-25 12:32:48
\.


--
-- Data for Name: MobileOtp; Type: TABLE DATA; Schema: public; Owner: zeepuser
--

COPY public."MobileOtp" (otp_id, otp, mobile_no, device_id, created_at, ref_id) FROM stdin;
bf593ab6-c851-4d91-91e6-288b3680b000	4600	+639633690526	7752732a3bcc2d7b	2025-09-16 10:19:16	d6c689
b3bf0023-6d64-46fc-bf73-25edc14db84e	8427	+639355378733	9b86d526c5afa7cb	2025-09-16 10:19:46	11ecd5
bfa17f74-7ac1-48e2-ac0f-458191750696	9725	+639355378733	9b86d526c5afa7cb	2025-09-16 10:19:47	dd05ac
4362dc8c-53b8-40a4-85a2-fc121009426d	2197	+639355378733	9b86d526c5afa7cb	2025-09-16 10:19:48	837d09
da11922a-0aae-43d3-a190-47cb9f285499	4949	+639355378733	9b86d526c5afa7cb	2025-09-16 10:19:49	c65a3b
0ce0a900-a2be-43e0-a541-887214c28174	4331	+639355378733	9b86d526c5afa7cb	2025-09-16 10:19:50	22c99b
88a1c056-c206-4bae-ada1-f7a944a0b670	2618	+639355378733	9b86d526c5afa7cb	2025-09-16 10:19:51	4f46d1
959e39ac-125e-4a4b-bc1f-c9460e2c5505	8050	+639355378733	9b86d526c5afa7cb	2025-09-16 10:19:52	87d826
ffd1db64-3cfa-4ad6-b21c-ce1b75d1c7b6	7362	+639693479965	894b9f677008c9fd	2025-09-16 10:20:55	06a161
943dc23d-9218-4c12-a524-fa19545c9cd0	8895	+639355378733	9b86d526c5afa7cb	2025-09-16 10:21:56	dc20ba
641ab3a1-3dc5-4d09-a27e-c343edb90c6a	2226	+639693479965	894b9f677008c9fd	2025-09-16 10:22:49	d2d835
100c2e9c-fbe0-4ec6-b978-8f6fee52631f	5229	+639693479965	894b9f677008c9fd	2025-09-16 10:23:39	229a02
ddc0ffa4-f012-46dc-b1f6-11295fb0c593	2732	+639633690526	7752732a3bcc2d7b	2025-09-16 10:26:49	d351f9
9baf79b1-8bab-4747-8537-e1293cedd554	8820	+639309308247	6ad40ea4dd5c7db4	2025-09-16 10:34:32	45cd1e
ac995ce3-dd38-48f3-8baa-41df5fb459d0	6808	+639912108905	2a8db541e434d820	2025-09-16 10:35:58	a2d743
0bf7352c-f628-45c9-9e26-4a1ab72de4a5	8466	+639064302413	92d8a69307f92091	2025-09-16 10:36:47	ea647f
52b1bcaa-b553-4c9d-ac2d-b4e727ac9a39	9969	+639693479965	894b9f677008c9fd	2025-09-16 10:46:05	232466
7e50b11e-4274-45da-9b3f-39c6fafbe5ce	7315	+639919529935	5bbfde264cba574d	2025-09-16 11:03:57	cddbb4
59232e91-01ad-4224-b637-4d22aff891ae	3061	+639186824209	836ca3f6e7df20a1	2025-09-16 11:04:58	834527
fff20e82-59b9-40bd-85dd-7e54577261da	6965	+639673487354	f23970b34f423357	2025-09-16 11:05:10	74d3a0
10c30f58-4928-4eed-b358-c6172628d7b9	2444	+639693479965	894b9f677008c9fd	2025-09-16 11:21:03	63f93d
92bbbadb-f169-419d-8828-bc483a1a5259	1393	+639178780688	2d2234a5e69d3472	2025-09-11 11:31:22	8dba25
4118582f-d282-4d1b-b217-1a0fcaaa8705	3044	+639693479965	01d5e8df-8722-4f42-80f3-605093960553	2025-09-16 11:50:25	f5e789
7469d429-4c05-47af-8d2b-46ec35ba77fe	6811	+639693479965	01d5e8df-8722-4f42-80f3-605093960553	2025-09-16 11:50:27	fd1562
bfdccbb7-afd6-4fa9-804c-277cf4e05158	8303	+639693479965	01d5e8df-8722-4f42-80f3-605093960553	2025-09-16 11:50:28	bc6584
377fa48f-0f5f-4e3e-8cb1-0b8523a76118	4379	+639693479965	01d5e8df-8722-4f42-80f3-605093960553	2025-09-16 11:50:29	3a214d
7fd71f68-09db-41f2-bf48-eb4b3372d2b6	6973	+639693479965	01d5e8df-8722-4f42-80f3-605093960553	2025-09-16 11:50:38	99e7ae
9feb86ef-978b-411b-9ddb-97b59202fd9b	9111	+639693479965	01d5e8df-8722-4f42-80f3-605093960553	2025-09-16 11:53:22	ad7c02
3fe7e2b9-1527-4786-bb1a-754dfffab195	7975	+639693479965	894b9f677008c9fd	2025-09-16 11:56:43	276cd8
9f4cdb32-9d8f-4a18-b3fa-9b68c13033f4	9040	+639175991688	11b2085f204c6ed4	2025-09-16 13:18:05	59a6de
3b2bdaa5-8932-4c58-8709-162dd03c272e	1833	+639355378733	9b86d526c5afa7cb	2025-09-16 13:48:11	249e08
7e83677e-018a-4279-88c9-9b631f89f0b2	2494	+639355378733	9b86d526c5afa7cb	2025-09-16 13:52:19	d53574
0a685b57-b821-4ebe-9f87-d9b2332625f7	6221	+639692351767	006d31b5b9ad4108	2025-09-16 14:39:10	77c111
736fd4c0-1c76-4ed1-b669-a298ac5aa218	8918	+639241004020	083cb14a17811f4d	2025-09-16 15:38:12	020a0f
\.


--
-- Data for Name: Promos; Type: TABLE DATA; Schema: public; Owner: zeepuser
--

COPY public."Promos" (promo_id, image_url, link_url, title, description, is_show, created_at, updated_at, deleted_at, type) FROM stdin;
889acfe1-6d72-4a42-9cc4-fd66891f492e	https://s3.jp-tok.cloud-object-storage.appdomain.cloud/zeep/promos/2571902.jpg	https://www.example.com/promo/124	Test Promo 2		t	2025-07-27 00:02:22	2025-07-31 22:46:19	\N	campaign
6abbb6e5-dae7-4b95-97c4-28beaf9ecb8f	https://s3.jp-tok.cloud-object-storage.appdomain.cloud/zeep/promos/Screenshot_2025-07-28_at_1.14.38_PM.png	https://www.example.com/promo/124	Rewards		t	2025-08-01 13:46:08	2025-08-01 13:46:08	\N	campaign
d2332355-0270-400b-90e8-59f20efe76e4	https://s3.jp-tok.cloud-object-storage.appdomain.cloud/zeep/promos/Screenshot 2025-07-31 at 5.53.16 PM.png	https://coronatel.com	Corona Telecoms		t	2025-07-31 17:54:42	2025-08-19 11:25:38	\N	promo
622b0fc6-20dc-49a9-981d-08dd78fdd445	https://s3.jp-tok.cloud-object-storage.appdomain.cloud/zeep/promos/219.jpg	https://take.supersurvey.com/poll5559353x1142466E-164	Test Promo	Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. 	t	2025-07-26 23:56:26	2025-08-19 11:25:47	\N	promo
\.


--
-- Data for Name: Routers; Type: TABLE DATA; Schema: public; Owner: zeepuser
--

COPY public."Routers" (router_id, owner_user_id, serial_no, router_model, router_version, data_usage, subscribers_count, long, lat, created_at, updated_at, deleted_at, is_enabled, mac_address, ip_address, password, qr_string, created_by) FROM stdin;
889a74b3-5841-489a-8300-119fba013370	65e2e646-9f39-43e8-aea8-c91e1c8a3d1d	G1LQ4JR20058A	RG-AP520(W2)	\N	0	0	121.01224228276631	14.576576576576576	2025-09-10 16:01:18	2025-09-10 16:01:18+00	2025-09-10 17:34:47+00	t	58696CFA8A39	192.168.110.1	admin	RG-AP520(W2);SN:G1LQ4JR20058A;MAC:58696CFA8A39;Ipaddress:192.168.110.1;Password:admin	65e2e646-9f39-43e8-aea8-c91e1c8a3d1d
e1e92e8a-61ef-468f-ac49-2d3c7c1511a1	8d962af1-b208-4abe-bf53-04d01e20fc01	G1LQAJU038353	RG-AP520(W2)	\N	0	0	125.61160210883432	7.099099099099099	2025-09-10 16:15:26	2025-09-10 16:15:26+00	\N	t	00749C6464F0	192.168.110.1	admin	RG-AP520(W2);SN:G1LQAJU038353;MAC:00749C6464F0;Ipaddress:192.168.110.1;Password:admin	8d962af1-b208-4abe-bf53-04d01e20fc01
08dc0ddd-cbc8-4853-ad9e-537d41916362	65e2e646-9f39-43e8-aea8-c91e1c8a3d1d	G1LQ4JR20058A	RG-AP520(W2)	\N	0	0	121.01224228276631	14.576576576576576	2025-09-10 17:35:53	2025-09-10 17:35:53+00	2025-09-11 09:16:09+00	t	58696CFA8A39	192.168.110.1	admin	RG-AP520(W2);SN:G1LQ4JR20058A;MAC:58696CFA8A39;Ipaddress:192.168.110.1;Password:admin	65e2e646-9f39-43e8-aea8-c91e1c8a3d1d
fabccdab-3558-4aa6-a871-154df2976bd8	65e2e646-9f39-43e8-aea8-c91e1c8a3d1d	G1LQ4JR20058A	RG-AP520(W2)	\N	0	0	121.01224228276631	14.576576576576576	2025-09-11 09:35:55	2025-09-11 09:35:55+00	\N	t	58696CFA8A39	192.168.110.1	admin	RG-AP520(W2);SN:G1LQ4JR20058A;MAC:58696CFA8A39;Ipaddress:192.168.110.1;Password:admin	65e2e646-9f39-43e8-aea8-c91e1c8a3d1d
e61293f5-6b9e-4361-ac4c-eb88b256e120	65e2e646-9f39-43e8-aea8-c91e1c8a3d1d	G1LQ4JR20058A	RG-AP520(W2)	\N	0	0	121.01224228276631	14.576576576576576	2025-09-10 14:29:44	2025-09-10 14:29:44+00	2025-09-10 16:01:17+00	t	58696CFA8A39	192.168.110.1	admin	RG-AP520(W2);SN:G1LQ4JR20058A;MAC:58696CFA8A39;Ipaddress:192.168.110.1;Password:admin	65e2e646-9f39-43e8-aea8-c91e1c8a3d1d
31d70275-6670-4108-837f-bc637e09f912	65e2e646-9f39-43e8-aea8-c91e1c8a3d1d	G1LQCLC015989	RG-AP630(IDA2)	\N	0	0	121.0023530562959	14.558558558558559	2025-09-04 17:24:46	2025-09-04 17:24:46+00	\N	t	00749C9D7251			RG-AP630(IDA2);SN:G1LQCLC015989;MAC:00749C9D7251	65e2e646-9f39-43e8-aea8-c91e1c8a3d1d
c338bffb-ff8a-4e2c-9cde-09a4d955ed49	174b1b5f-c73d-4e05-8496-69225184f1c5	G1LQCLC02391B	RG-AP630(IDA2)	\N	0	0	121.02096880291994	14.558558558558559	2025-09-05 17:39:32	2025-09-05 17:39:32+00	\N	t	00749C9DA1B6			RG-AP630(IDA2);SN:G1LQCLC02391B;MAC:00749C9DA1B6	174b1b5f-c73d-4e05-8496-69225184f1c5
a6fcd4bd-ebe1-4afe-a641-571c95ef0cd0	65e2e646-9f39-43e8-aea8-c91e1c8a3d1d	G1LQAJU157182	RG-AP520(W2)	\N	0	0	121.01224228276631	14.576576576576576	2025-09-08 16:40:15	2025-09-08 16:40:15+00	\N	t	00749C65A0C4	192.168.110.1	admin	RG-AP520(W2);SN:G1LQAJU157182;MAC:00749C65A0C4;Ipaddress:192.168.110.1;Password:admin	65e2e646-9f39-43e8-aea8-c91e1c8a3d1d
99752cb0-eac4-4d14-b973-c876fa7212f0	65e2e646-9f39-43e8-aea8-c91e1c8a3d1d	G1MQ7JU010237	RG-AP520(W2)	\N	0	0	121.01224228276631	14.576576576576576	2025-09-10 10:14:36	2025-09-10 10:14:36+00	\N	t	00749CD49CCA	192.168.110.1	admin	RG-AP520(W2);SN:G1MQ7JU010237;MAC:00749CD49CCA;Ipaddress:192.168.110.1;Password:admin	65e2e646-9f39-43e8-aea8-c91e1c8a3d1d
5f33ecef-2c8b-4f02-aa27-dd91843e92c8	174b1b5f-c73d-4e05-8496-69225184f1c5	G1MQ7JU01332C	RG-AP520(W2)	\N	0	0	121.03085955080982	14.576576576576576	2025-09-10 14:53:46	2025-09-10 14:53:46+00	2025-09-16 10:43:42+00	t	00749CD4A19E	192.168.110.1	admin	RG-AP520(W2);SN:G1MQ7JU01332C;MAC:00749CD4A19E;Ipaddress:192.168.110.1;Password:admin	174b1b5f-c73d-4e05-8496-69225184f1c5
d5ae46e0-c2e3-421c-a7ca-a638942d96ba	174b1b5f-c73d-4e05-8496-69225184f1c5	G1MQ7JU01332C	RG-AP520(W2)	\N	0	0	121.01224228276631	14.576576576576576	2025-09-16 10:43:58	2025-09-16 10:43:58+00	\N	t	00749CD4A19E	192.168.110.1	admin	RG-AP520(W2);SN:G1MQ7JU01332C;MAC:00749CD4A19E;Ipaddress:192.168.110.1;Password:admin	174b1b5f-c73d-4e05-8496-69225184f1c5
\.


--
-- Data for Name: Tiers; Type: TABLE DATA; Schema: public; Owner: zeepuser
--

COPY public."Tiers" (tier_id, name, description, data_limit, created_at, updated_at, deleted_at, is_default_tier) FROM stdin;
tier2	Tier 2	100 MB	100	2025-06-19 00:35:06	2025-06-25 20:54:46	\N	f
tier1	Tier 1	50 MB	50	2025-06-19 00:30:27	2025-06-25 20:55:10	\N	t
\.


--
-- Data for Name: Transactions; Type: TABLE DATA; Schema: public; Owner: zeepuser
--

COPY public."Transactions" (transaction_id, type, status, payment_method, amount, qr_code_string, charge_reference, retrieval_reference, retrieval_timestamp, created_at, updated_at, deleted_at) FROM stdin;
14e0c5f5-cef8-4b2a-9710-d02df4733e8b	PAYMENT	pending	QRPH	1	00020101021128780011ph.ppmi.p2m0111RUGUPHM1XXX0325001541104000000000000000204081010734005030005204541153036085802PH5912MARCMERCHANT6005Albay62450012ph.ppmi.qrph05062110000708PTR105010803***88620012ph.ppmi.qrph0142s:52::14e0c5f5-cef8-4b2a-9710-d02df4733e8b6304832A	\N	\N	\N	2025-08-08 13:41:01	2025-08-08 13:41:01	\N
fe025e32-1b89-40ed-a2f7-b710767f6bad	PAYMENT	pending	QRPH	1	00020101021128780011ph.ppmi.p2m0111RUGUPHM1XXX0325001541104000000000000000204081010734005030005204541153036085802PH5912MARCMERCHANT6005Albay62450012ph.ppmi.qrph05062110000708PTR105010803***88620012ph.ppmi.qrph0142s:52::fe025e32-1b89-40ed-a2f7-b710767f6bad6304FF50	\N	\N	\N	2025-08-08 13:42:53	2025-08-08 13:42:53	\N
4821eae6-7882-40df-8196-d43584c6a9fa	PAYMENT	pending	QRPH	10	00020101021128780011ph.ppmi.p2m0111RUGUPHM1XXX0325001541104000000000000000204081010734005030005204541153036085802PH5912MARCMERCHANT6005Albay62450012ph.ppmi.qrph05062110000708PTR105010803***88620012ph.ppmi.qrph0142s:52::4821eae6-7882-40df-8196-d43584c6a9fa6304C392	\N	\N	\N	2025-08-08 14:32:51	2025-08-08 14:32:51	\N
fd196732-4bf9-4afa-a47c-9f507b7cabb8	PAYMENT	pending	QRPH	50	00020101021128780011ph.ppmi.p2m0111RUGUPHM1XXX0325001541104000000000000000204081010734005030005204541153036085802PH5912MARCMERCHANT6005Albay62450012ph.ppmi.qrph05062110000708PTR105010803***88620012ph.ppmi.qrph0142s:52::fd196732-4bf9-4afa-a47c-9f507b7cabb86304B175	\N	\N	\N	2025-08-08 14:41:05	2025-08-08 14:41:05	\N
253f730f-3fe3-41cd-b536-5ad847714ef5	PAYMENT	pending	QRPH	50	00020101021128780011ph.ppmi.p2m0111RUGUPHM1XXX0325001541104000000000000000204081010734005030005204541153036085802PH5912MARCMERCHANT6005Albay62450012ph.ppmi.qrph05062110000708PTR105010803***88620012ph.ppmi.qrph0142s:52::253f730f-3fe3-41cd-b536-5ad847714ef56304EEBB	\N	\N	\N	2025-08-08 14:45:43	2025-08-08 14:45:43	\N
d3189dc6-9d19-4606-9ea8-10e3396b2235	PAYMENT	pending	QRPH	100	00020101021128780011ph.ppmi.p2m0111RUGUPHM1XXX0325001541104000000000000000204081010734005030005204541153036085802PH5912MARCMERCHANT6005Albay62450012ph.ppmi.qrph05062110000708PTR105010803***88620012ph.ppmi.qrph0142s:52::d3189dc6-9d19-4606-9ea8-10e3396b22356304DCDB	\N	\N	\N	2025-08-08 14:47:11	2025-08-08 14:47:11	\N
fc2a9acb-bda2-480c-876a-1ceb16ec7dd7	PAYMENT	pending	QRPH	1	00020101021128790011ph.ppmi.p2m0111RUGUPHM1XXX03250014816040000000000000008040913004792105030005204481653036085802PH5911CORONATELCO6006Makati62450012ph.ppmi.qrph05062110000708PTR103590803***88630012ph.ppmi.qrph0143s:102::fc2a9acb-bda2-480c-876a-1ceb16ec7dd76304EDEB	\N	\N	\N	2025-08-08 14:48:43	2025-08-08 14:48:43	\N
745fd58b-f45f-4b7f-ad68-6a128251ce10	PAYMENT	paid	QRPH	1	00020101021128780011ph.ppmi.p2m0111RUGUPHM1XXX0325001541104000000000000000204081010734005030005204541153036085802PH5912MARCMERCHANT6005Albay62450012ph.ppmi.qrph05062110000708PTR105010803***88620012ph.ppmi.qrph0142s:52::745fd58b-f45f-4b7f-ad68-6a128251ce1063040BEB	745fd58b-f45f-4b7f-ad68-6a128251ce10	123456789	\N	2025-08-08 14:42:39	2025-08-08 16:33:34	\N
c675d2ff-efcd-42f8-b439-57950d78afff	PAYMENT	paid	QRPH	10	00020101021128780011ph.ppmi.p2m0111RUGUPHM1XXX0325001541104000000000000000204081010734005030005204541153036085802PH5912MARCMERCHANT6005Albay62450012ph.ppmi.qrph05062110000708PTR105010803***88620012ph.ppmi.qrph0142s:52::c675d2ff-efcd-42f8-b439-57950d78afff6304458C	c675d2ff-efcd-42f8-b439-57950d78afff	123456789	2025-08-07T15:00:00Z	2025-08-08 14:30:28	2025-08-08 17:35:41	\N
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: zeepuser
--

COPY public."UserRoles" (type, description, deleted_at) FROM stdin;
admin	Admin	\N
business_owner	Business Owner	\N
support	Support	\N
subscriber	Subscriber	\N
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: zeepuser
--

COPY public."Users" (user_id, user_type, name, mobile_no, email, password, created_at, updated_at, last_login, deleted_at, is_active, device_id, data_limit, data_usage, tier, data_left) FROM stdin;
dddf7e43-a795-45d4-98dd-1f91f3fdeae8	business_owner	Test User 15	+639000000015	test15@test.com	$2b$12$VkJgnla4IZAkqlTEdOo6Yukr7/ZlISxF/fMRC3vOlchKwrbT9Wf9O	2025-06-27 16:19:58	2025-06-27 16:19:58	2025-06-27 17:42:24	\N	t	\N	0	0	\N	0
dc98491d-12c1-477c-99a5-1148819d4b9d	business_owner	Dev Frencys Ann	+639552884150	frencysann09@gmail.com	$2b$12$QFXqM6lAN0MFUU5JM6EhYewjGL5nYG9bsDpewUyEQan0wmYczEcfq	2025-06-16 01:11:41	2025-06-26 17:30:21	2025-07-01 15:43:42	\N	t		\N	\N	\N	\N
0d917198-acf5-4d61-b41d-5730d8a0de1e	business_owner	testaccount	+639519076634	testaccount1@test.com	$2b$12$qmA2FND9X4E9qGI.FMT7uei6vn5N7YtU3w36E111KefexvDIX.m3W	2025-08-08 15:48:41	2025-08-08 15:48:41	2025-08-08 15:49:02	\N	t	\N	0	0	\N	0
47bd9da1-0b47-4c9a-8f0c-ee7642396d1c	admin	Dev Frencys Ann	+639552884150	frencysann09@gmail.com	$2b$12$V6cAyALdokzB6XKYXnZB7.K4AlCiJLZZtKbmXdILEcS8r7qDRTn/q	2025-06-26 17:02:39	2025-06-26 18:20:46	2025-06-26 19:13:31	\N	t	123	\N	\N	\N	\N
b2fe4ede-4435-4087-947c-712924bf1ed4	business_owner	Jan	+639123456788	jan@thousandminds.com	$2b$12$9lmb8rw7vQKw/3gp86Tb6ePIJsZug2Ze5qh2aUKbW06IpHElrHSHC	2025-06-23 11:40:03	2025-06-27 17:40:55	\N	\N	t	e3bbb29f-215a-4524-ad8c-f4d95b544011	\N	\N	\N	\N
c471744b-2920-466d-8f9d-3cb66aecfb41	business_owner	Test User 1	+639000000001	test1@test.com	$2b$12$JbQMwenHbhi.izgqMBQun.hTv.zCL.chYJzxkgBiI/vZ0ldi52XqC	2025-06-27 17:41:52	2025-06-27 17:41:52	\N	\N	t	\N	0	0	\N	0
479a44ea-92ce-4dcb-82b4-925b557656a2	admin	Admin Corona	+639175991688	admin@coronatel.com	$2b$12$yVgFyOwuuNt6v1c6jNAMC.JA6sqIpDPVeLUAo2YVfc10oB6lWB6D6	2025-08-13 11:34:54	2025-08-13 11:34:54	2025-08-13 11:35:10	\N	t	\N	0	0	\N	0
175e4693-f84c-4e23-9b74-c805664bed41	business_owner	Nathan Luna	+639499214188	nathan@thousandminds.com	$2b$12$3Z2JvZXoUaAmv8IIPX.XBerQjOGmIyS.YCu7pkEkuJllyUVcXzI6O	2025-06-24 10:48:01	2025-08-13 11:36:29	2025-08-08 14:38:13	\N	f		\N	\N	\N	\N
c40271b8-1e1d-4211-a742-d9c8f6066270	business_owner	marc	+639175991689	mcandres888@gmail.com	$2b$12$B9Ql4PZYUwqPDgWkUj5sOer.0UfS83FwFUkolyNI7y84L7qGcCBnu	2025-06-25 10:51:27	2025-08-13 11:36:49	2025-06-27 09:44:13	\N	t	\N	\N	\N	\N	\N
bae65694-e229-4230-8326-4280ba781174	subscriber	Daniel Mariscotes	+639919529935	danmariscotes@gmail.com	$2b$12$dcaQ.yD.Ry/SL67PoP5vTuiFr5i85arH/HBkBrTGvHUB8LnO9ToHa	2025-09-16 11:06:46	2025-09-16 11:06:46	2025-09-16 11:10:47	\N	t	5bbfde264cba574d	50	0	tier1	0
7121ddb2-d849-4cfb-b835-32b56e5f754c	subscriber	Dave Bajuyo	+639309308247	davebajuyo1@gmail.com	$2b$12$pNwXxdNDqLZ0fT3FazTS.edpL0qqajJwU9BXnMHvA0EgIoVdaGQ1S	2025-09-16 10:35:37	2025-09-16 10:35:37	2025-09-16 10:35:38	\N	t	6ad40ea4dd5c7db4	50	0	tier1	0
7b1ed392-f402-447e-858c-bfb2ad5775a4	business_owner	zeep	+639289204525	mcandres168@gmail.com	$2b$12$ollrlpSfjfMMvup4Ftz5WOZX3yPGYPuUFDVnWyn9sv0wGpL2Jwtom	2025-08-13 13:07:05	2025-08-13 13:07:05	2025-08-14 11:47:45	\N	t	\N	0	0	\N	0
e3839dab-17d4-4f81-88ac-79b6f3a943c3	subscriber	John Charles Villavicencio	+639693479965	johncharles@apolloglobal.net	$2b$12$GQHasPkSk2MsWWZZUNztBOyEtZUS9drbvpmlB7EPLzh.Q4RlGbYLC	2025-09-16 10:21:58	2025-09-16 10:21:58	2025-09-16 14:21:17	\N	t	894b9f677008c9fd	50	0	tier1	0
9f5f52b2-eae7-41dd-a5c4-a548c57879ed	business_owner	John Charles	+639693479965	johncharles@apolloglobal.net	$2b$12$kM4/6pX2QXC4zpLURYzEbeR2n5xqCJfAaiOohiRlETjBjnqi.8w2.	2025-08-14 17:16:00	2025-08-26 14:43:12	2025-09-03 11:52:48	\N	t		0	0	\N	0
a3fdb6bc-32cf-4b9c-9ec4-d11a298c1f3b	admin	johncharles	+639693479965	johncharles@apolloglobal.net	$2b$12$/k8s8Gd4ibeusLU1WJQcqeywmvtnUw5eZR7nSndrqtc1TDG3wwO1.	2025-08-14 16:47:06	2025-08-14 17:08:48	2025-09-01 13:09:02	\N	t	\N	0	0	\N	0
91f71a23-c4ae-4fdc-8408-dc68ecdbbe13	subscriber	Patrick Jansein	+639692351767	patrickjansein@gmail.com	$2b$12$yypv.Tt5VQ55GVu9pPhNRO7Ayrlx.LXWL0ikaZ87aa8dZcWD1EGB.	2025-09-16 14:40:37	2025-09-16 14:40:37	2025-09-16 14:41:39	\N	t	006d31b5b9ad4108	50	0	tier1	0
9924ba30-d2ce-4da7-903f-1d62e28db603	admin	Charchel	+639355378733	charchel@apollo.com.ph	$2b$12$AYunCW3But9ixd51HHKEmuZbXaH0ZxXUkOzSKFTwmQyZ3Vxs4xYD2	2025-08-26 10:25:49	2025-08-26 10:25:49	2025-09-01 12:02:07	\N	t	\N	0	0	\N	0
6da65823-50f1-4325-a702-519ced54d7c4	admin	ric	+639633690526	ricphilip@apolloglobal.net	$2b$12$hPkose77lFBC5OzfpbmzgufQIPp6BRsjxPM48Z/2gQE9pUaojmy4q	2025-09-03 10:36:54	2025-09-03 10:36:54	2025-09-03 10:37:07	\N	t	\N	0	0	\N	0
dc9cb3ec-67a5-4a80-9c95-73f3548f4999	admin	Admin Dev	+639922871361	devfrencys@gmail.com	$2b$12$GYMxq4vV5Wv04Hia0.5M.usjdfEW55nW3/x87M1P598lpgObqBYhO	2025-06-20 18:16:17	2025-06-24 09:57:11	2025-08-26 17:45:53	\N	t	\N	\N	\N	\N	\N
dc52ee7e-67ec-47eb-ac7a-aa47a57a0675	business_owner	test	+639212599601	test@yahoo.com	$2b$12$0/q/bUXmKsCj1I6Wl8XDAeVLlx3LxAnXyiELEp.17uAeScA2ufatK	2025-08-28 16:56:51	2025-08-28 16:56:51	\N	\N	t	\N	0	0	\N	0
edb0af2d-07e3-4786-8007-4db78b7e4e24	business_owner	test	+639226565835	test2@yahoo.com	$2b$12$rWh.yst5VlETgp89ryfsY.O2Tzp6HDj6JfAmKXAcpR05HYfMpLOiC	2025-08-28 17:00:48	2025-08-28 17:00:48	\N	\N	t	\N	0	0	\N	0
369495c4-5b1c-47d1-81d0-aa7365c3c3b6	subscriber	Joseph Pornillos	+639912108905	josephpornillos@apolloglobal.net	$2b$12$dws9sTrHdD2k385DlfDYKO8ZGYVjd8bf5TPsv47A4.ShvwFJrtpKa	2025-09-16 10:37:43	2025-09-16 10:37:43	2025-09-16 11:19:49	\N	t	2a8db541e434d820	50	0	tier1	0
8912e297-dfb3-4051-984d-ad1a32211a46	subscriber	Bong Fajardo	+639178780688	Bfajardo@coronatel.com	$2b$12$6.uTSxXZmkYk0I9YeSXrV.XSoRg6zlEqH0Leq3Bo7Ra5XLgOwX1Pu	2025-09-16 11:06:04	2025-09-16 11:06:04	2025-09-16 11:13:17	\N	t	2d2234a5e69d3472	50	0	tier1	0
174b1b5f-c73d-4e05-8496-69225184f1c5	business_owner	charchel	+639355378733	charchel@apollo.com.ph	$2b$12$I7iOVEyCkBS5S1EnUUUHBufXfTo6hn2Hm4c31zbwHvAUKRqTQt8Ai	2025-09-05 17:21:45	2025-09-05 17:21:45	2025-09-10 14:53:04	\N	t	\N	0	0	\N	0
6338f2a9-6823-49a9-9ad4-f8e55effbd6f	subscriber	charchel quider	+639355378733	charchel@apollo.com.ph	$2b$12$vT5LJP0yBB69ML4FVvOYWOzhf9OgbVG3XlWvqjT1HT7LEFVZfXW8G	2025-09-16 10:25:20	2025-09-16 10:25:20	2025-09-16 13:52:46	\N	t	9b86d526c5afa7cb	50	0	tier1	0
8d962af1-b208-4abe-bf53-04d01e20fc01	business_owner	Joseph Pornillos	+639912108905	josephpornillos@apolloglobal.net	$2b$12$9b5xEN/oRjVOmClllNukBuNLNXLgPI.CQwYFeVk8IVx8BUf2Z3yde	2025-09-10 16:13:38	2025-09-10 16:13:38	2025-09-10 16:14:09	\N	t	\N	0	0	\N	0
65e2e646-9f39-43e8-aea8-c91e1c8a3d1d	business_owner	John Charles	+639947439272	johncharles1@apolloglobal.net	$2b$12$C/LARt6f1u9TgfegOR8bVeb/6hT13IIwRVkVE4XqFJdCWmNEpUgeG	2025-08-15 11:21:40	2025-08-15 11:23:23	2025-09-10 17:35:42	\N	t		0	0	\N	0
2fa1f5ed-c42b-4d73-a61c-bdbb159b2b25	subscriber	Ric Philip Talagtag	+639633690526	rpttalagtag@gmail.com	$2b$12$.ZBdm6Y.sWsrBzLShUhncewTLXSrICB.cATuEUOS/S3rgtb2GswKO	2025-09-16 10:27:42	2025-09-16 10:27:42	2025-09-16 11:37:11	\N	t	7752732a3bcc2d7b	50	0	tier1	0
5ffcf260-cd59-421a-ace6-ffd9a61fe706	subscriber	marc andrs	+639175991688	mcandres168@gmail.com	$2b$12$pLwIbGwIupcOjKmA5vcsmOIECKepxacwOxTyqlDC8W9i13bsGSbvq	2025-09-16 13:19:04	2025-09-16 13:19:04	2025-09-16 13:19:05	\N	t	11b2085f204c6ed4	50	0	tier1	0
c3ada1e8-571e-4a69-9460-58f9470d62db	subscriber	Jemmuel Talagtag	+639673487354	jemtalagtag@gmail.com	$2b$12$SYN.7hnVwKXBqlkJPHRIO.CVd8hWEautuJCAMgnHlrjCcdnhb73VC	2025-09-16 11:06:04	2025-09-16 11:06:04	2025-09-16 11:13:17	\N	t	f23970b34f423357	50	0	tier1	0
01ff24c5-5c3a-49d2-bf10-2f823cff5cbd	subscriber	ZEEP Wifi	+639888888888	ssid@router.com	$2b$12$zOrDuqmmFCoJ9zyYxX5t..4nCPtp3SPhh.H2EBfT7o25FWJHNGduG	2025-06-21 16:44:44	2025-06-24 09:55:19	2025-09-16 15:38:26	\N	t	\N	\N	\N	\N	\N
\.


--
-- Data for Name: accounting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounting (username, time_stamp, acctstatustype, acctdelaytime, acctinputoctets, acctoutputoctets, acctsessionid, acctsessiontime, acctterminatecause, nasidentifier, nasport, framedipaddress, auth_mode, device, mac, created_at, called_station_id, calling_station_id) FROM stdin;
66cc0641241a5806	1757989016	Alive	\N	6554335	120871794	00749c658d2c_000_0000000085_1757985715	3300	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
836ca3f6e7df20a1	1757989017	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	14400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
380b1d99fdf49294	1757989031	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	4440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757989042	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	4320	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757989043	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	5640	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1757989050	Alive	\N	7634747	170292471	00749c9d7251_000_0000000242_1757984669	4380	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
ee85bdcff91e47ef	1757989051	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	2700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989052	Alive	\N	16424652	507687845	00749c658d2c_000_0000000083_1757984370	4680	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989055	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	4260	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
ddeac671993bf524	1757989055	Alive	\N	0	0	00749c2e292c_000_0000000059_0011308856	180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2e292c:ZEEP Wifi	be8248a674aa
836ca3f6e7df20a1	1757989062	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	14460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989077	Alive	\N	6554892	120872563	00749c658d2c_000_0000000085_1757985715	3360	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757989083	Stop	\N	7634747	170292471	00749c9d7251_000_0000000242_1757984669	4413	User-Request	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
ddeac671993bf524	1757989086	Stop	\N	0	0	00749c2e292c_000_0000000059_0011308856	211	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2e292c:ZEEP Wifi	be8248a674aa
380b1d99fdf49294	1757989090	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	4500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757989102	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	4380	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757989103	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	5700	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757989110	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	2760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989111	Alive	\N	16424652	507687845	00749c658d2c_000_0000000083_1757984370	4740	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989114	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	4320	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757989123	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	14520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989136	Alive	\N	6554892	120872563	00749c658d2c_000_0000000085_1757985715	3420	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
380b1d99fdf49294	1757989150	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	4560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757989162	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	4440	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757989163	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	5760	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757989170	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	2820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989171	Alive	\N	17020274	508887334	00749c658d2c_000_0000000083_1757984370	4800	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989174	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	4380	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757989177	Start	\N	\N	\N	00749c9d7251_000_0000000252_1757989171	\N	\N	\N	2	0.0.0.0	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
836ca3f6e7df20a1	1757989183	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	14580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989196	Alive	\N	6562207	120889263	00749c658d2c_000_0000000085_1757985715	3480	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
380b1d99fdf49294	1757989210	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	4620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757989223	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	4500	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757989224	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	5820	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757989230	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	2880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989231	Alive	\N	17191352	509133934	00749c658d2c_000_0000000083_1757984370	4860	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989234	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	4440	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757989238	Alive	\N	0	0	00749c9d7251_000_0000000252_1757989171	60	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
836ca3f6e7df20a1	1757989242	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	14640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989256	Alive	\N	6572674	120905907	00749c658d2c_000_0000000085_1757985715	3540	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
380b1d99fdf49294	1757989270	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	4680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757989283	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	4560	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757989284	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	5880	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757989290	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	2940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989291	Alive	\N	17210207	509167796	00749c658d2c_000_0000000083_1757984370	4920	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989295	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	4500	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757989298	Alive	\N	136687	174495	00749c9d7251_000_0000000252_1757989171	120	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
836ca3f6e7df20a1	1757989302	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	14700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989316	Alive	\N	6572908	120908181	00749c658d2c_000_0000000085_1757985715	3600	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757989329	Start	\N	\N	\N	00749c9d7251_000_0000000253_1757989323	\N	\N	\N	2	0.0.0.0	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757989330	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	4740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
7752732a3bcc2d7b	1757989334	Stop	\N	160193	214911	00749c9d7251_000_0000000252_1757989171	156	User-Request	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
d681b5c249787836	1757989342	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	4620	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757989344	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	5940	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757989351	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989351	Alive	\N	17259786	509237359	00749c658d2c_000_0000000083_1757984370	4980	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989354	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	4560	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
9b86d526c5afa7cb	1757989361	Start	\N	\N	\N	00749c65aff0_000_0000000178_0000673491	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
836ca3f6e7df20a1	1757989362	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	14760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989376	Alive	\N	6582394	120920851	00749c658d2c_000_0000000085_1757985715	3660	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757989389	Alive	\N	95342	161444	00749c9d7251_000_0000000253_1757989323	60	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757989390	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	4800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
9b86d526c5afa7cb	1757989391	Stop	\N	0	0	00749c65aff0_000_0000000178_0000673491	30	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
9b86d526c5afa7cb	1757989395	Start	\N	\N	\N	00749c65aff0_000_0000000179_0000673526	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
d681b5c249787836	1757989402	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	4680	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757989403	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6000	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1757989408	Stop	\N	95342	161444	00749c9d7251_000_0000000253_1757989323	79	User-Request	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
ee85bdcff91e47ef	1757989410	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989411	Alive	\N	17359636	509351935	00749c658d2c_000_0000000083_1757984370	5040	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989414	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	4620	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757989422	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	14820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989436	Alive	\N	6583089	120923574	00749c658d2c_000_0000000085_1757985715	3720	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
380b1d99fdf49294	1757989450	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	4860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
9b86d526c5afa7cb	1757989455	Alive	\N	0	0	00749c65aff0_000_0000000179_0000673526	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
d681b5c249787836	1757989462	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	4740	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757989463	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6060	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757989470	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989471	Alive	\N	17392960	509390134	00749c658d2c_000_0000000083_1757984370	5100	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989474	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	4680	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757989483	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	14880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989496	Alive	\N	6583184	120923745	00749c658d2c_000_0000000085_1757985715	3780	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
380b1d99fdf49294	1757989510	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	4920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
9b86d526c5afa7cb	1757989515	Alive	\N	0	0	00749c65aff0_000_0000000179_0000673526	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
d681b5c249787836	1757989523	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	4800	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757989523	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757989530	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989532	Alive	\N	17454138	509505898	00749c658d2c_000_0000000083_1757984370	5160	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989535	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	4740	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757989543	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	14940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989557	Alive	\N	6869048	121874202	00749c658d2c_000_0000000085_1757985715	3840	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
380b1d99fdf49294	1757989570	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	4980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
9b86d526c5afa7cb	1757989575	Alive	\N	0	0	00749c65aff0_000_0000000179_0000673526	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
d681b5c249787836	1757989583	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	4860	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757989583	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757989590	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989591	Alive	\N	17454138	509505898	00749c658d2c_000_0000000083_1757984370	5220	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989594	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	4800	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757989603	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	15000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989616	Alive	\N	6957832	121935250	00749c658d2c_000_0000000085_1757985715	3900	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
7752732a3bcc2d7b	1757989625	Start	\N	\N	\N	00749c658aa8_000_0000000240_0011833687	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
380b1d99fdf49294	1757989630	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
9b86d526c5afa7cb	1757989635	Alive	\N	0	0	00749c65aff0_000_0000000179_0000673526	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
d681b5c249787836	1757989642	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	4920	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757989643	Start	\N	\N	\N	00749c9d7251_000_0000000254_1757989642	\N	\N	\N	2	0.0.0.0	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757989643	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757989650	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989651	Alive	\N	17486878	510417908	00749c658d2c_000_0000000083_1757984370	5280	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989654	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	4860	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757989662	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	15060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989676	Alive	\N	7147062	122040290	00749c658d2c_000_0000000085_1757985715	3960	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
7752732a3bcc2d7b	1757989684	Alive	\N	0	0	00749c658aa8_000_0000000240_0011833687	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
380b1d99fdf49294	1757989691	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
9b86d526c5afa7cb	1757989696	Alive	\N	0	0	00749c65aff0_000_0000000179_0000673526	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
d681b5c249787836	1757989702	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	4980	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757989703	Alive	\N	0	0	00749c9d7251_000_0000000254_1757989642	60	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757989704	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757989711	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989711	Alive	\N	17551180	510490236	00749c658d2c_000_0000000083_1757984370	5340	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989714	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	4920	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757989722	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	15120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
9b86d526c5afa7cb	1757989725	Stop	\N	0	0	00749c65aff0_000_0000000179_0000673526	330	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
66cc0641241a5806	1757989736	Alive	\N	7320734	122151208	00749c658d2c_000_0000000085_1757985715	4020	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757989738	Start	\N	\N	\N	00749c65aff0_000_0000000180_0000673869	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
7752732a3bcc2d7b	1757989744	Alive	\N	0	0	00749c658aa8_000_0000000240_0011833687	120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
380b1d99fdf49294	1757989750	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757989762	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5040	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757989763	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	120	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757989764	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6360	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757989770	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989771	Alive	\N	17551613	510490409	00749c658d2c_000_0000000083_1757984370	5400	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989774	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	4980	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757989782	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	15180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989796	Alive	\N	7322621	122156810	00749c658d2c_000_0000000085_1757985715	4080	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757989798	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
7752732a3bcc2d7b	1757989804	Alive	\N	0	0	00749c658aa8_000_0000000240_0011833687	180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
380b1d99fdf49294	1757989810	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757989822	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5100	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757989823	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	180	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757989824	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6420	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757989830	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989831	Alive	\N	17555493	510492102	00749c658d2c_000_0000000083_1757984370	5460	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989834	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5040	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757989842	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	15240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989856	Alive	\N	7325538	122169498	00749c658d2c_000_0000000085_1757985715	4140	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757989858	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
7752732a3bcc2d7b	1757989865	Alive	\N	0	0	00749c658aa8_000_0000000240_0011833687	240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
380b1d99fdf49294	1757989870	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757989883	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5160	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757989883	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	240	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757989883	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6480	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757989890	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989891	Alive	\N	17661770	510645851	00749c658d2c_000_0000000083_1757984370	5520	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989895	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5100	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757989903	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	15300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989916	Alive	\N	7333916	122183199	00749c658d2c_000_0000000085_1757985715	4200	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757989918	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
7752732a3bcc2d7b	1757989925	Alive	\N	0	0	00749c658aa8_000_0000000240_0011833687	300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
380b1d99fdf49294	1757989930	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757989943	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5220	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757989943	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	300	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757989943	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6540	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757989950	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757989951	Alive	\N	17663283	510647375	00749c658d2c_000_0000000083_1757984370	5580	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757989954	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5160	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757989963	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	15360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757989976	Alive	\N	7454492	122252436	00749c658d2c_000_0000000085_1757985715	4260	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757989978	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
7752732a3bcc2d7b	1757989984	Alive	\N	0	0	00749c658aa8_000_0000000240_0011833687	360	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
380b1d99fdf49294	1757989990	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757990002	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5280	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757990003	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	360	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757990003	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6600	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757990010	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990012	Alive	\N	17678736	510691738	00749c658d2c_000_0000000083_1757984370	5640	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990014	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5220	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757990023	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	15420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757990037	Alive	\N	7481864	122446288	00749c658d2c_000_0000000085_1757985715	4320	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990039	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
7752732a3bcc2d7b	1757990044	Alive	\N	0	0	00749c658aa8_000_0000000240_0011833687	420	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
380b1d99fdf49294	1757990051	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757990062	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5340	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757990063	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	420	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757990063	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6660	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
e2e8c519aa5edc7a	1757990071	Alive	\N	17678736	510691738	00749c658d2c_000_0000000083_1757984370	5700	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
ee85bdcff91e47ef	1757990071	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
charchels	1757990074	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5280	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757990082	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	15480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757990096	Alive	\N	7520654	122486813	00749c658d2c_000_0000000085_1757985715	4380	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990098	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
7752732a3bcc2d7b	1757990105	Alive	\N	0	0	00749c658aa8_000_0000000240_0011833687	480	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
6ad40ea4dd5c7db4	1757990105	Start	\N	\N	\N	00749c658d2c_000_0000000086_1757990104	\N	\N	\N	2	0.0.0.0	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757990110	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
7752732a3bcc2d7b	1757990115	Stop	\N	0	0	00749c658aa8_000_0000000240_0011833687	490	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
7752732a3bcc2d7b	1757990122	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	480	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
d681b5c249787836	1757990123	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5400	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757990123	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6720	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
ee85bdcff91e47ef	1757990130	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990131	Alive	\N	17697041	510713199	00749c658d2c_000_0000000083_1757984370	5760	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990134	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5340	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757990142	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	15540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757990156	Alive	\N	7532702	122513906	00749c658d2c_000_0000000085_1757985715	4440	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990158	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757990165	Alive	\N	0	0	00749c658d2c_000_0000000086_1757990104	60	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757990170	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757990182	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5460	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757990182	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	540	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757990183	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6780	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757990187	Start	\N	\N	\N	00749c6464f0_000_0000000017_1757990186	\N	\N	\N	2	0.0.0.0	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757990190	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990191	Alive	\N	17697768	510713923	00749c658d2c_000_0000000083_1757984370	5820	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990195	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5400	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757990202	Alive	\N	0	0	00749c64d520_000_0000000146_0000652034	15600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
66cc0641241a5806	1757990216	Alive	\N	7588240	122712948	00749c658d2c_000_0000000085_1757985715	4500	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990218	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757990225	Alive	\N	573826	1416092	00749c658d2c_000_0000000086_1757990104	120	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757990230	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757990242	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5520	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757990242	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	600	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757990244	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6840	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757990247	Alive	\N	0	0	00749c6464f0_000_0000000017_1757990186	60	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
836ca3f6e7df20a1	1757990250	Stop	\N	0	0	00749c64d520_000_0000000146_0000652034	15648	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
ee85bdcff91e47ef	1757990250	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990251	Alive	\N	17728604	510767811	00749c658d2c_000_0000000083_1757984370	5880	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990254	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5460	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757990276	Alive	\N	7590185	122718762	00749c658d2c_000_0000000085_1757985715	4560	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990278	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757990285	Alive	\N	575511	1417978	00749c658d2c_000_0000000086_1757990104	180	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757990290	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
7752732a3bcc2d7b	1757990302	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	660	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
d681b5c249787836	1757990303	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5580	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757990304	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6900	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757990308	Alive	\N	115622	106167	00749c6464f0_000_0000000017_1757990186	120	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757990310	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	3960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990311	Alive	\N	17730613	510769874	00749c658d2c_000_0000000083_1757984370	5940	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990314	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5520	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757990336	Alive	\N	7598958	122739015	00749c658d2c_000_0000000085_1757985715	4620	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990338	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757990345	Alive	\N	578710	1421555	00749c658d2c_000_0000000086_1757990104	240	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757990351	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757990362	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5640	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757990363	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	720	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757990364	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	6960	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757990368	Alive	\N	170784	406870	00749c6464f0_000_0000000017_1757990186	180	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757990371	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990371	Alive	\N	17744716	510794177	00749c658d2c_000_0000000083_1757984370	6000	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990374	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5580	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757990396	Alive	\N	7599200	122742033	00749c658d2c_000_0000000085_1757985715	4680	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990398	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757990405	Alive	\N	594231	1449442	00749c658d2c_000_0000000086_1757990104	300	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757990410	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757990422	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5700	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757990423	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	780	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757990423	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7020	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757990428	Alive	\N	171154	407352	00749c6464f0_000_0000000017_1757990186	240	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757990430	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990431	Alive	\N	17752962	510808767	00749c658d2c_000_0000000083_1757984370	6060	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990435	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5640	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757990456	Alive	\N	7599757	122750922	00749c658d2c_000_0000000085_1757985715	4740	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990458	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757990465	Alive	\N	606790	1466131	00749c658d2c_000_0000000086_1757990104	360	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757990470	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757990482	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5760	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757990483	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	840	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757990483	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7080	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757990488	Alive	\N	649453	9172132	00749c6464f0_000_0000000017_1757990186	300	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757990490	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990491	Alive	\N	17770460	510846768	00749c658d2c_000_0000000083_1757984370	6120	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990495	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5700	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757990516	Alive	\N	7609205	122763618	00749c658d2c_000_0000000085_1757985715	4800	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990518	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757990525	Alive	\N	662827	1895951	00749c658d2c_000_0000000086_1757990104	420	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757990530	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	5940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
7752732a3bcc2d7b	1757990543	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	900	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
d681b5c249787836	1757990543	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5820	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757990543	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7140	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757990548	Alive	\N	650071	9172781	00749c6464f0_000_0000000017_1757990186	360	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757990550	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990552	Alive	\N	17790151	511024281	00749c658d2c_000_0000000083_1757984370	6180	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990554	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5760	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757990576	Alive	\N	7612017	122769148	00749c658d2c_000_0000000085_1757985715	4860	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990578	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757990585	Alive	\N	665304	1897700	00749c658d2c_000_0000000086_1757990104	480	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757990590	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757990603	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5880	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757990603	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	960	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757990603	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7200	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757990607	Alive	\N	754861	9305905	00749c6464f0_000_0000000017_1757990186	420	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757990610	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990611	Alive	\N	17790151	511024281	00749c658d2c_000_0000000083_1757984370	6240	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990614	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5820	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757990636	Alive	\N	7612527	122769632	00749c658d2c_000_0000000085_1757985715	4920	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990638	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757990645	Alive	\N	666955	1899510	00749c658d2c_000_0000000086_1757990104	540	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757990650	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757990662	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	5940	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757990663	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	1020	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757990663	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7260	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757990667	Alive	\N	759206	9316207	00749c6464f0_000_0000000017_1757990186	480	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757990670	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990671	Alive	\N	17800906	511052506	00749c658d2c_000_0000000083_1757984370	6300	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990674	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5880	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757990696	Alive	\N	7618507	122779797	00749c658d2c_000_0000000085_1757985715	4980	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990699	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757990705	Alive	\N	669149	1903065	00749c658d2c_000_0000000086_1757990104	600	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757990711	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757990722	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6000	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757990723	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	1080	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757990724	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7320	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757990727	Alive	\N	781279	9332125	00749c6464f0_000_0000000017_1757990186	540	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757990731	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990731	Alive	\N	17825960	511112657	00749c658d2c_000_0000000083_1757984370	6360	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990734	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	5940	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757990756	Alive	\N	7618809	122780380	00749c658d2c_000_0000000085_1757985715	5040	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990758	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	1020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757990765	Alive	\N	670246	1904114	00749c658d2c_000_0000000086_1757990104	660	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
894b9f677008c9fd	1757990766	Start	\N	\N	\N	00749c9d7251_000_0000000256_1757990766	\N	\N	\N	2	0.0.0.0	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757990770	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
7752732a3bcc2d7b	1757990782	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	1140	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
d681b5c249787836	1757990783	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6060	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757990784	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7380	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757990787	Alive	\N	793966	9348411	00749c6464f0_000_0000000017_1757990186	600	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757990790	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990791	Alive	\N	17839886	511141803	00749c658d2c_000_0000000083_1757984370	6420	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990795	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6000	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757990816	Alive	\N	7619859	122781627	00749c658d2c_000_0000000085_1757985715	5100	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990818	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	1080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757990825	Alive	\N	680944	1917303	00749c658d2c_000_0000000086_1757990104	720	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
894b9f677008c9fd	1757990826	Alive	\N	0	0	00749c9d7251_000_0000000256_1757990766	60	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757990830	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757990842	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757990842	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	1200	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757990844	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7440	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757990848	Alive	\N	794506	9348543	00749c6464f0_000_0000000017_1757990186	660	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757990850	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990851	Alive	\N	19646811	613854941	00749c658d2c_000_0000000083_1757984370	6480	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990855	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6060	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757990876	Alive	\N	7652332	122820020	00749c658d2c_000_0000000085_1757985715	5160	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990878	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	1140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757990885	Alive	\N	710509	1962454	00749c658d2c_000_0000000086_1757990104	780	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
894b9f677008c9fd	1757990886	Alive	\N	72816	115360	00749c9d7251_000_0000000256_1757990766	120	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757990890	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757990902	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757990902	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	1260	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757990903	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7500	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757990908	Alive	\N	1176190	10177884	00749c6464f0_000_0000000017_1757990186	720	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757990910	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990911	Alive	\N	19982746	614392895	00749c658d2c_000_0000000083_1757984370	6540	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990914	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757990936	Alive	\N	7667762	123024680	00749c658d2c_000_0000000085_1757985715	5220	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990938	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	1200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757990945	Alive	\N	726877	2167549	00749c658d2c_000_0000000086_1757990104	840	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
894b9f677008c9fd	1757990946	Alive	\N	435848	17710065	00749c9d7251_000_0000000256_1757990766	180	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757990950	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
7752732a3bcc2d7b	1757990962	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	1320	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
d681b5c249787836	1757990963	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757990963	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7560	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757990968	Alive	\N	1599014	15344996	00749c6464f0_000_0000000017_1757990186	780	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757990970	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757990971	Alive	\N	20661279	631598935	00749c658d2c_000_0000000083_1757984370	6600	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757990974	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757990997	Alive	\N	7669539	123026811	00749c658d2c_000_0000000085_1757985715	5280	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757990998	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	1260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757991006	Alive	\N	748496	2231393	00749c658d2c_000_0000000086_1757990104	900	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
894b9f677008c9fd	1757991007	Alive	\N	626743	29916310	00749c9d7251_000_0000000256_1757990766	240	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757991010	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
7752732a3bcc2d7b	1757991023	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	1380	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
d681b5c249787836	1757991023	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757991023	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7620	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757991028	Alive	\N	1599278	15345412	00749c6464f0_000_0000000017_1757990186	840	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991031	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991031	Alive	\N	20661279	631598935	00749c658d2c_000_0000000083_1757984370	6660	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757991034	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757991056	Alive	\N	8708365	134790306	00749c658d2c_000_0000000085_1757985715	5340	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757991059	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	1320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757991065	Alive	\N	758178	2244318	00749c658d2c_000_0000000086_1757990104	960	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
894b9f677008c9fd	1757991067	Alive	\N	719748	36051931	00749c9d7251_000_0000000256_1757990766	300	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757991070	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757991082	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6360	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991083	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	1440	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991083	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7680	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757991087	Alive	\N	1601000	15351905	00749c6464f0_000_0000000017_1757990186	900	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991090	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991091	Alive	\N	20856884	636320565	00749c658d2c_000_0000000083_1757984370	6720	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757991094	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757991116	Alive	\N	9252565	147244761	00749c658d2c_000_0000000085_1757985715	5400	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
9b86d526c5afa7cb	1757991118	Alive	\N	0	0	00749c65aff0_000_0000000180_0000673869	1380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
6ad40ea4dd5c7db4	1757991125	Alive	\N	760247	2246782	00749c658d2c_000_0000000086_1757990104	1020	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
894b9f677008c9fd	1757991127	Alive	\N	1253935	44658147	00749c9d7251_000_0000000256_1757990766	360	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757991130	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757991142	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6420	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991143	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	1500	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991143	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7740	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757991147	Alive	\N	1604946	15358275	00749c6464f0_000_0000000017_1757990186	960	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991150	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991151	Alive	\N	21037662	638485981	00749c658d2c_000_0000000083_1757984370	6780	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
9b86d526c5afa7cb	1757991153	Stop	\N	0	0	00749c65aff0_000_0000000180_0000673869	1415	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
charchels	1757991155	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6360	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
9b86d526c5afa7cb	1757991157	Start	\N	\N	\N	00749c65aff0_000_0000000183_0000675287	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
66cc0641241a5806	1757991176	Alive	\N	9409482	151504572	00749c658d2c_000_0000000085_1757985715	5460	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757991185	Alive	\N	774237	2267786	00749c658d2c_000_0000000086_1757990104	1080	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
894b9f677008c9fd	1757991187	Alive	\N	1276922	44667740	00749c9d7251_000_0000000256_1757990766	420	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757991190	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757991203	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6480	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991203	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	1560	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991204	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7800	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757991207	Alive	\N	1605552	15359975	00749c6464f0_000_0000000017_1757990186	1020	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991210	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991211	Alive	\N	21650904	650611267	00749c658d2c_000_0000000083_1757984370	6840	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757991214	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6420	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
9b86d526c5afa7cb	1757991217	Alive	\N	0	0	00749c65aff0_000_0000000183_0000675287	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
66cc0641241a5806	1757991236	Alive	\N	9703184	162546946	00749c658d2c_000_0000000085_1757985715	5520	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757991245	Alive	\N	775792	2270257	00749c658d2c_000_0000000086_1757990104	1140	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
894b9f677008c9fd	1757991247	Alive	\N	1306466	44702610	00749c9d7251_000_0000000256_1757990766	480	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757991250	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757991263	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6540	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991263	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	1620	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991264	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7860	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757991267	Alive	\N	1614392	15381701	00749c6464f0_000_0000000017_1757990186	1080	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
9b86d526c5afa7cb	1757991269	Stop	\N	0	0	00749c65aff0_000_0000000183_0000675287	112	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
ee85bdcff91e47ef	1757991270	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991271	Alive	\N	21924973	658064099	00749c658d2c_000_0000000083_1757984370	6900	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757991274	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6480	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757991296	Alive	\N	10088803	178219172	00749c658d2c_000_0000000085_1757985715	5580	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757991305	Alive	\N	907956	2860796	00749c658d2c_000_0000000086_1757990104	1200	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
894b9f677008c9fd	1757991307	Alive	\N	1308905	44704866	00749c9d7251_000_0000000256_1757990766	540	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757991310	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757991322	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6600	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991323	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	1680	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991324	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7920	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757991328	Alive	\N	1614620	15381942	00749c6464f0_000_0000000017_1757990186	1140	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991330	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	4980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991331	Alive	\N	22482798	668379063	00749c658d2c_000_0000000083_1757984370	6960	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757991334	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6540	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757991356	Alive	\N	10606559	186627627	00749c658d2c_000_0000000085_1757985715	5640	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757991366	Alive	\N	954998	3715767	00749c658d2c_000_0000000086_1757990104	1260	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
894b9f677008c9fd	1757991367	Alive	\N	1318963	44730691	00749c9d7251_000_0000000256_1757990766	600	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757991371	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
d681b5c249787836	1757991382	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6660	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991383	Alive	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	1740	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991383	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	7980	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757991388	Alive	\N	1614620	15381942	00749c6464f0_000_0000000017_1757990186	1200	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991390	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991392	Alive	\N	23350367	682702017	00749c658d2c_000_0000000083_1757984370	7020	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757991394	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6600	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757991407	Start	\N	\N	\N	00749c658aa8_000_0000000241_0011835469	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757991407	Start	\N	\N	\N	00749c658aa8_000_0000000242_0011835469	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757991416	Alive	\N	11005050	204362701	00749c658d2c_000_0000000085_1757985715	5700	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757991425	Alive	\N	1008722	4868849	00749c658d2c_000_0000000086_1757990104	1320	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
894b9f677008c9fd	1757991425	Stop	\N	1318963	44730691	00749c9d7251_000_0000000256_1757990766	659	User-Request	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757991430	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
7752732a3bcc2d7b	1757991438	Stop	\N	1672	1172	00749c9d7251_000_0000000254_1757989642	1796	User-Request	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757991440	Start	\N	\N	\N	00749c64d520_000_0000000161_0000668871	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
d681b5c249787836	1757991443	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6720	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991443	Start	\N	\N	\N	00749c64d520_000_0000000162_0000668874	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991443	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8040	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757991448	Alive	\N	1614800	15382046	00749c6464f0_000_0000000017_1757990186	1260	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991450	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991451	Alive	\N	23350367	682702017	00749c658d2c_000_0000000083_1757984370	7080	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757991454	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6660	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757991467	Alive	\N	0	0	00749c658aa8_000_0000000241_0011835469	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757991468	Alive	\N	0	0	00749c658aa8_000_0000000242_0011835469	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757991476	Alive	\N	11121884	204395910	00749c658d2c_000_0000000085_1757985715	5760	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757991485	Alive	\N	1026193	4896142	00749c658d2c_000_0000000086_1757990104	1380	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757991490	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
894b9f677008c9fd	1757991499	Alive	\N	0	0	00749c64d520_000_0000000161_0000668871	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
7752732a3bcc2d7b	1757991502	Alive	\N	0	0	00749c64d520_000_0000000162_0000668874	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
d681b5c249787836	1757991503	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6780	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757991503	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8100	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757991508	Alive	\N	1614800	15382046	00749c6464f0_000_0000000017_1757990186	1320	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991510	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991511	Alive	\N	23572066	687869549	00749c658d2c_000_0000000083_1757984370	7140	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757991515	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6720	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757991526	Alive	\N	0	0	00749c658aa8_000_0000000241_0011835469	120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757991527	Alive	\N	0	0	00749c658aa8_000_0000000242_0011835469	120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757991536	Alive	\N	11124149	204404236	00749c658d2c_000_0000000085_1757985715	5820	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757991545	Alive	\N	1087448	5909055	00749c658d2c_000_0000000086_1757990104	1440	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757991550	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	6960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
894b9f677008c9fd	1757991560	Alive	\N	0	0	00749c64d520_000_0000000161_0000668871	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
d681b5c249787836	1757991562	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6840	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991563	Alive	\N	0	0	00749c64d520_000_0000000162_0000668874	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991563	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8160	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757991568	Alive	\N	1614958	15382202	00749c6464f0_000_0000000017_1757990186	1380	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991570	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991571	Alive	\N	23634078	690262372	00749c658d2c_000_0000000083_1757984370	7200	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757991574	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6780	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757991586	Alive	\N	0	0	00749c658aa8_000_0000000241_0011835469	180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757991587	Alive	\N	0	0	00749c658aa8_000_0000000242_0011835469	180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757991596	Alive	\N	11126338	204416859	00749c658d2c_000_0000000085_1757985715	5880	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757991605	Alive	\N	1135996	6034956	00749c658d2c_000_0000000086_1757990104	1500	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757991610	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
894b9f677008c9fd	1757991620	Alive	\N	0	0	00749c64d520_000_0000000161_0000668871	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
d681b5c249787836	1757991622	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6900	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991623	Alive	\N	0	0	00749c64d520_000_0000000162_0000668874	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991623	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8220	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757991627	Alive	\N	1696364	15434673	00749c6464f0_000_0000000017_1757990186	1440	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991630	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991631	Alive	\N	24090107	699490989	00749c658d2c_000_0000000083_1757984370	7260	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757991634	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6840	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757991647	Alive	\N	0	0	00749c658aa8_000_0000000241_0011835469	240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757991648	Alive	\N	0	0	00749c658aa8_000_0000000242_0011835469	240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	b26221fabb05
894b9f677008c9fd	1757991653	Start	\N	\N	\N	00749c65aff0_000_0000000184_0000675783	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757991656	Alive	\N	11154585	204471106	00749c658d2c_000_0000000085_1757985715	5940	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757991665	Alive	\N	1361582	9347980	00749c658d2c_000_0000000086_1757990104	1560	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757991671	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
894b9f677008c9fd	1757991680	Alive	\N	0	0	00749c64d520_000_0000000161_0000668871	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
d681b5c249787836	1757991683	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	6960	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991683	Alive	\N	0	0	00749c64d520_000_0000000162_0000668874	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991684	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8280	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757991687	Alive	\N	1697289	15435000	00749c6464f0_000_0000000017_1757990186	1500	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991691	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991691	Alive	\N	24110808	699499656	00749c658d2c_000_0000000083_1757984370	7320	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757991694	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6900	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757991707	Alive	\N	0	0	00749c658aa8_000_0000000241_0011835469	300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757991708	Alive	\N	0	0	00749c658aa8_000_0000000242_0011835469	300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	b26221fabb05
894b9f677008c9fd	1757991714	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757991716	Alive	\N	11156278	204476131	00749c658d2c_000_0000000085_1757985715	6000	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757991725	Alive	\N	1486742	14263644	00749c658d2c_000_0000000086_1757990104	1620	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757991730	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
7752732a3bcc2d7b	1757991731	Stop	\N	0	0	00749c658aa8_000_0000000241_0011835469	325	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757991731	Stop	\N	0	0	00749c658aa8_000_0000000242_0011835469	324	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	b26221fabb05
894b9f677008c9fd	1757991739	Alive	\N	0	0	00749c64d520_000_0000000161_0000668871	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
d681b5c249787836	1757991742	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7020	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991742	Alive	\N	0	0	00749c64d520_000_0000000162_0000668874	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991744	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8340	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
2a8db541e434d820	1757991747	Alive	\N	1697289	15435000	00749c6464f0_000_0000000017_1757990186	1560	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991750	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991751	Alive	\N	24129015	699630760	00749c658d2c_000_0000000083_1757984370	7380	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757991754	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	6960	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757991773	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757991776	Alive	\N	11162750	204488858	00749c658d2c_000_0000000085_1757985715	6060	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757991785	Alive	\N	1546190	14688090	00749c658d2c_000_0000000086_1757990104	1680	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757991790	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
894b9f677008c9fd	1757991799	Alive	\N	0	0	00749c64d520_000_0000000161_0000668871	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
d681b5c249787836	1757991802	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7080	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991802	Alive	\N	0	0	00749c64d520_000_0000000162_0000668874	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991804	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8400	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757991806	Start	\N	\N	\N	00749c65aff0_000_0000000185_0000675936	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757991807	Alive	\N	1697289	15435000	00749c6464f0_000_0000000017_1757990186	1620	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991810	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991811	Alive	\N	24236374	700240178	00749c658d2c_000_0000000083_1757984370	7440	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757991815	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7020	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757991833	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757991836	Alive	\N	11163622	204492320	00749c658d2c_000_0000000085_1757985715	6120	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757991846	Alive	\N	1587061	15672183	00749c658d2c_000_0000000086_1757990104	1740	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757991850	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
894b9f677008c9fd	1757991859	Alive	\N	0	0	00749c64d520_000_0000000161_0000668871	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
d681b5c249787836	1757991862	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7140	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991862	Alive	\N	0	0	00749c64d520_000_0000000162_0000668874	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991863	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8460	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757991866	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757991868	Alive	\N	1697449	15435156	00749c6464f0_000_0000000017_1757990186	1680	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991870	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991872	Alive	\N	24241676	700245765	00749c658d2c_000_0000000083_1757984370	7500	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
charchels	1757991875	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7080	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757991893	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757991896	Alive	\N	11174998	204510464	00749c658d2c_000_0000000085_1757985715	6180	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757991905	Alive	\N	1653754	15791912	00749c658d2c_000_0000000086_1757990104	1800	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757991910	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
836ca3f6e7df20a1	1757991916	Start	\N	\N	\N	00749c64d520_000_0000000167_0000669348	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
894b9f677008c9fd	1757991920	Alive	\N	0	0	00749c64d520_000_0000000161_0000668871	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
d681b5c249787836	1757991922	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7200	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991923	Alive	\N	0	0	00749c64d520_000_0000000162_0000668874	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991923	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8520	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757991926	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757991928	Alive	\N	1697449	15435156	00749c6464f0_000_0000000017_1757990186	1740	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991930	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991931	Alive	\N	24254627	700261899	00749c658d2c_000_0000000083_1757984370	7560	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757991932	Start	\N	\N	\N	00749c64d520_000_0000000168_0000669364	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757991934	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7140	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757991952	Stop	\N	0	0	00749c64d520_000_0000000161_0000668871	512	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
894b9f677008c9fd	1757991953	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757991956	Alive	\N	11175364	204513579	00749c658d2c_000_0000000085_1757985715	6240	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757991965	Alive	\N	1726005	17143172	00749c658d2c_000_0000000086_1757990104	1860	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757991970	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
836ca3f6e7df20a1	1757991977	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757991983	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7260	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757991983	Alive	\N	0	0	00749c64d520_000_0000000162_0000668874	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
2d2234a5e69d3472	1757991983	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8580	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757991986	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757991988	Alive	\N	1697449	15435156	00749c6464f0_000_0000000017_1757990186	1800	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757991990	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757991991	Alive	\N	24260438	700264252	00749c658d2c_000_0000000083_1757984370	7620	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757991993	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757991994	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7200	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992013	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992016	Alive	\N	11175430	204513826	00749c658d2c_000_0000000085_1757985715	6300	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992025	Alive	\N	1802922	20912075	00749c658d2c_000_0000000086_1757990104	1920	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992031	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
836ca3f6e7df20a1	1757992037	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
7752732a3bcc2d7b	1757992043	Alive	\N	0	0	00749c64d520_000_0000000162_0000668874	600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
d681b5c249787836	1757992043	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7320	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992043	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8640	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992047	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992048	Alive	\N	1697449	15435156	00749c6464f0_000_0000000017_1757990186	1860	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992051	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992051	Alive	\N	24265651	700270296	00749c658d2c_000_0000000083_1757984370	7680	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992053	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992054	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7260	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992074	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992076	Alive	\N	11182984	204540739	00749c658d2c_000_0000000085_1757985715	6360	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992085	Alive	\N	1898701	27453529	00749c658d2c_000_0000000086_1757990104	1980	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992091	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992093	Start	\N	\N	\N	00749c64d520_000_0000000169_0000669524	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
7752732a3bcc2d7b	1757992094	Stop	\N	0	0	00749c64d520_000_0000000162_0000668874	651	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
836ca3f6e7df20a1	1757992097	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992102	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7380	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992103	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8700	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992106	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992108	Alive	\N	1697449	15435156	00749c6464f0_000_0000000017_1757990186	1920	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992110	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992111	Alive	\N	24273295	700288839	00749c658d2c_000_0000000083_1757984370	7740	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992112	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992114	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7320	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992133	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992136	Alive	\N	11296568	204936921	00749c658d2c_000_0000000085_1757985715	6420	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992145	Alive	\N	1939416	31629130	00749c658d2c_000_0000000086_1757990104	2040	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992150	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992153	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992156	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992162	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7440	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992164	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8760	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992166	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992167	Alive	\N	1697609	15435312	00749c6464f0_000_0000000017_1757990186	1980	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992170	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992171	Alive	\N	24297290	700319698	00749c658d2c_000_0000000083_1757984370	7800	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992172	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992175	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7380	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992193	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992196	Alive	\N	11296758	204937170	00749c658d2c_000_0000000085_1757985715	6480	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992205	Alive	\N	2062158	40470462	00749c658d2c_000_0000000086_1757990104	2100	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992210	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992213	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992216	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992223	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7500	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992224	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8820	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992226	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992227	Alive	\N	1697609	15435312	00749c6464f0_000_0000000017_1757990186	2040	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992230	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992231	Alive	\N	24346240	700360297	00749c658d2c_000_0000000083_1757984370	7860	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992232	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992234	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7440	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992253	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992256	Alive	\N	11298558	204948031	00749c658d2c_000_0000000085_1757985715	6540	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992265	Alive	\N	2132585	41259357	00749c658d2c_000_0000000086_1757990104	2160	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992270	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992273	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992276	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992283	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7560	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992284	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8880	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992286	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992287	Alive	\N	1756395	15860306	00749c6464f0_000_0000000017_1757990186	2100	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992290	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	5940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992291	Alive	\N	24346450	700362515	00749c658d2c_000_0000000083_1757984370	7920	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992292	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992294	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7500	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992313	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992317	Alive	\N	11347883	204976096	00749c658d2c_000_0000000085_1757985715	6600	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992326	Alive	\N	2214313	43170245	00749c658d2c_000_0000000086_1757990104	2220	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992330	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992333	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992337	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992342	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7620	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992343	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	8940	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992346	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992347	Alive	\N	1756395	15860306	00749c6464f0_000_0000000017_1757990186	2160	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992350	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992352	Alive	\N	24439208	700805720	00749c658d2c_000_0000000083_1757984370	7980	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992353	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992354	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7560	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992374	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992376	Alive	\N	11653886	209814956	00749c658d2c_000_0000000085_1757985715	6660	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992385	Alive	\N	2275509	47570627	00749c658d2c_000_0000000086_1757990104	2280	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992391	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992394	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992397	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992402	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7680	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992403	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9000	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992407	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992408	Alive	\N	1756555	15860462	00749c6464f0_000_0000000017_1757990186	2220	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992410	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992411	Alive	\N	24653916	700855591	00749c658d2c_000_0000000083_1757984370	8040	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992413	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992414	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7620	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992433	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992436	Alive	\N	12199435	225308856	00749c658d2c_000_0000000085_1757985715	6720	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992445	Alive	\N	2316803	50741894	00749c658d2c_000_0000000086_1757990104	2340	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992450	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992454	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992457	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992462	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7740	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992463	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9060	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992466	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992468	Alive	\N	1756897	15861060	00749c6464f0_000_0000000017_1757990186	2280	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992470	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992471	Alive	\N	24653916	700855591	00749c658d2c_000_0000000083_1757984370	8100	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992473	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992474	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7680	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992493	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992496	Alive	\N	12394416	227168747	00749c658d2c_000_0000000085_1757985715	6780	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992505	Alive	\N	2323978	50749518	00749c658d2c_000_0000000086_1757990104	2400	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992510	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992514	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992517	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992522	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7800	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992523	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992526	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992528	Alive	\N	1756897	15861060	00749c6464f0_000_0000000017_1757990186	2340	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992530	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992531	Alive	\N	24654247	700856315	00749c658d2c_000_0000000083_1757984370	8160	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992532	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992535	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7740	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992553	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992556	Alive	\N	12688915	238948642	00749c658d2c_000_0000000085_1757985715	6840	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992565	Alive	\N	2404481	50867894	00749c658d2c_000_0000000086_1757990104	2460	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992570	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	7980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992573	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992576	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992583	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7860	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992583	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992586	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992588	Alive	\N	1756897	15861060	00749c6464f0_000_0000000017_1757990186	2400	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992590	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992591	Alive	\N	24654719	700858399	00749c658d2c_000_0000000083_1757984370	8220	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992592	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992594	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7800	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992613	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992616	Alive	\N	13012088	252067656	00749c658d2c_000_0000000085_1757985715	6900	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992625	Alive	\N	2416666	50886026	00749c658d2c_000_0000000086_1757990104	2520	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992630	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992633	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992636	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992642	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7920	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992644	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992646	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992647	Alive	\N	1756969	15861164	00749c6464f0_000_0000000017_1757990186	2460	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992650	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992651	Alive	\N	24675236	700896723	00749c658d2c_000_0000000083_1757984370	8280	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992652	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992654	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7860	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992673	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	1020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992676	Alive	\N	13410932	269914891	00749c658d2c_000_0000000085_1757985715	6960	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992685	Alive	\N	2432110	50911638	00749c658d2c_000_0000000086_1757990104	2580	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992691	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992693	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992696	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992702	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	7980	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992704	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992707	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992707	Alive	\N	1757129	15861320	00749c6464f0_000_0000000017_1757990186	2520	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992711	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992711	Alive	\N	24826231	701515837	00749c658d2c_000_0000000083_1757984370	8340	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992712	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992714	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7920	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992734	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	1080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992737	Alive	\N	13771475	269971864	00749c658d2c_000_0000000085_1757985715	7020	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992746	Alive	\N	2475254	51462554	00749c658d2c_000_0000000086_1757990104	2640	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992750	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992754	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992757	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992762	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8040	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992764	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9360	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992766	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992767	Alive	\N	2232492	20329048	00749c6464f0_000_0000000017_1757990186	2580	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992770	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992771	Alive	\N	24840208	701539334	00749c658d2c_000_0000000083_1757984370	8400	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992773	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992774	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	7980	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992793	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	1140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992796	Alive	\N	13771619	269972086	00749c658d2c_000_0000000085_1757985715	7080	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992805	Alive	\N	2586932	61790750	00749c658d2c_000_0000000086_1757990104	2700	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992810	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992814	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992817	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992823	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8100	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992823	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9420	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992826	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992827	Alive	\N	2736065	22410339	00749c6464f0_000_0000000017_1757990186	2640	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992830	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992831	Alive	\N	24845560	701548311	00749c658d2c_000_0000000083_1757984370	8460	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992833	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992835	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8040	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992853	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	1200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992856	Alive	\N	13773451	269974320	00749c658d2c_000_0000000085_1757985715	7140	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992865	Alive	\N	2617928	61836965	00749c658d2c_000_0000000086_1757990104	2760	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992870	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992874	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992877	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992883	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8160	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992883	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9480	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992886	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992888	Alive	\N	3269454	38949815	00749c6464f0_000_0000000017_1757990186	2700	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992890	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992891	Alive	\N	24845862	701549842	00749c658d2c_000_0000000083_1757984370	8520	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992893	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992895	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8100	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992913	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	1260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992916	Alive	\N	13773773	269974777	00749c658d2c_000_0000000085_1757985715	7200	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992925	Alive	\N	2627678	61847491	00749c658d2c_000_0000000086_1757990104	2820	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992930	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992933	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992936	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757992942	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8220	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757992943	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9540	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757992946	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757992948	Alive	\N	4015455	40111724	00749c6464f0_000_0000000017_1757990186	2760	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757992950	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757992951	Alive	\N	24846325	701551167	00749c658d2c_000_0000000083_1757984370	8580	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757992952	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757992954	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8160	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757992973	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	1320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757992976	Alive	\N	13774023	269975011	00749c658d2c_000_0000000085_1757985715	7260	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757992985	Alive	\N	2654522	61886544	00749c658d2c_000_0000000086_1757990104	2880	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757992990	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757992993	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757992996	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993002	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8280	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993003	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9600	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993006	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993008	Alive	\N	4169397	40246843	00749c6464f0_000_0000000017_1757990186	2820	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993010	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993011	Alive	\N	25454472	701646524	00749c658d2c_000_0000000083_1757984370	8640	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993012	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993014	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8220	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757993034	Alive	\N	0	0	00749c65aff0_000_0000000184_0000675783	1380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757993036	Alive	\N	13774574	269975905	00749c658d2c_000_0000000085_1757985715	7320	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757993042	Stop	\N	0	0	00749c65aff0_000_0000000184_0000675783	1389	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757993045	Alive	\N	2670428	61913724	00749c658d2c_000_0000000086_1757990104	2940	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993051	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993053	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993056	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993062	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8340	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993063	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9660	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993067	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993068	Alive	\N	4207652	40677333	00749c6464f0_000_0000000017_1757990186	2880	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993071	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993071	Alive	\N	25454642	701647077	00749c658d2c_000_0000000083_1757984370	8700	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993072	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993074	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8280	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757993096	Alive	\N	13775642	269982850	00749c658d2c_000_0000000085_1757985715	7380	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757993105	Alive	\N	2688361	61939277	00749c658d2c_000_0000000086_1757990104	3000	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993110	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993113	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993116	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993122	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8400	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993124	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9720	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993126	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993128	Alive	\N	4401403	40821979	00749c6464f0_000_0000000017_1757990186	2940	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993130	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993131	Alive	\N	25455557	701653124	00749c658d2c_000_0000000083_1757984370	8760	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993133	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993135	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8340	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757993140	Start	\N	\N	\N	00749c65aff0_000_0000000186_0000677270	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757993156	Alive	\N	13775947	269983087	00749c658d2c_000_0000000085_1757985715	7440	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757993165	Alive	\N	2693488	61947183	00749c658d2c_000_0000000086_1757990104	3060	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993170	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993174	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993177	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993183	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8460	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993184	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9780	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993186	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993187	Alive	\N	4975554	47415400	00749c6464f0_000_0000000017_1757990186	3000	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993190	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993191	Alive	\N	25455557	701653124	00749c658d2c_000_0000000083_1757984370	8820	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993193	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993195	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8400	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757993200	Alive	\N	0	0	00749c65aff0_000_0000000186_0000677270	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757993217	Alive	\N	13776306	269984609	00749c658d2c_000_0000000085_1757985715	7500	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757993226	Alive	\N	2700117	61999089	00749c658d2c_000_0000000086_1757990104	3120	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993230	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993234	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993237	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993242	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8520	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993244	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9840	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993246	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993247	Alive	\N	5412161	54854117	00749c6464f0_000_0000000017_1757990186	3060	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993250	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993252	Alive	\N	25455623	701653613	00749c658d2c_000_0000000083_1757984370	8880	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993253	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993254	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8460	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757993260	Alive	\N	0	0	00749c65aff0_000_0000000186_0000677270	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757993276	Alive	\N	13776401	269984780	00749c658d2c_000_0000000085_1757985715	7560	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757993285	Alive	\N	2715562	62019969	00749c658d2c_000_0000000086_1757990104	3180	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993290	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993294	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993297	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993302	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8580	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993304	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9900	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993306	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993307	Alive	\N	6329222	85289770	00749c6464f0_000_0000000017_1757990186	3120	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993310	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	6960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993311	Alive	\N	25463187	701667275	00749c658d2c_000_0000000083_1757984370	8940	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993313	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993314	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8520	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757993320	Alive	\N	0	0	00749c65aff0_000_0000000186_0000677270	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757993336	Alive	\N	13776401	269984780	00749c658d2c_000_0000000085_1757985715	7620	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757993345	Alive	\N	2728575	62050643	00749c658d2c_000_0000000086_1757990104	3240	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993350	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993353	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993356	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993362	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8640	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993363	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	9960	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993366	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993367	Alive	\N	6847706	87261926	00749c6464f0_000_0000000017_1757990186	3180	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993370	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993371	Alive	\N	25463397	701667535	00749c658d2c_000_0000000083_1757984370	9000	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993372	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993374	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8580	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757993381	Alive	\N	0	0	00749c65aff0_000_0000000186_0000677270	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757993396	Alive	\N	13785969	269997482	00749c658d2c_000_0000000085_1757985715	7680	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757993405	Alive	\N	2912687	62103323	00749c658d2c_000_0000000086_1757990104	3300	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993411	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993413	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993416	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993422	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8700	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993423	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10020	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993427	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993428	Alive	\N	7967028	115484478	00749c6464f0_000_0000000017_1757990186	3240	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993430	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993431	Alive	\N	25463558	701667706	00749c658d2c_000_0000000083_1757984370	9060	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993432	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993434	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8640	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757993440	Alive	\N	0	0	00749c65aff0_000_0000000186_0000677270	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757993456	Alive	\N	13787320	270001031	00749c658d2c_000_0000000085_1757985715	7740	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757993465	Alive	\N	2966930	62127152	00749c658d2c_000_0000000086_1757990104	3360	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993470	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993473	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993476	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993483	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8760	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993483	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10080	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993486	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993488	Alive	\N	8476523	120780476	00749c6464f0_000_0000000017_1757990186	3300	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993490	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993491	Alive	\N	25463624	701667706	00749c658d2c_000_0000000083_1757984370	9120	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993492	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993495	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8700	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757993500	Alive	\N	0	0	00749c65aff0_000_0000000186_0000677270	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757993516	Alive	\N	14059968	271454607	00749c658d2c_000_0000000085_1757985715	7800	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757993525	Alive	\N	2974192	62149905	00749c658d2c_000_0000000086_1757990104	3420	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993530	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	8940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993533	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993536	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993543	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8820	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993543	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10140	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993546	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993548	Alive	\N	8554053	120849979	00749c6464f0_000_0000000017_1757990186	3360	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993550	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993551	Alive	\N	25463850	701667974	00749c658d2c_000_0000000083_1757984370	9180	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993552	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993554	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8760	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757993560	Alive	\N	0	0	00749c65aff0_000_0000000186_0000677270	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757993576	Alive	\N	14586979	291693272	00749c658d2c_000_0000000085_1757985715	7860	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757993585	Alive	\N	2978410	62157567	00749c658d2c_000_0000000086_1757990104	3480	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993590	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993594	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993597	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993602	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8880	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993603	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10200	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993606	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993608	Alive	\N	8555093	120858406	00749c6464f0_000_0000000017_1757990186	3420	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993610	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993611	Alive	\N	26490424	733057285	00749c658d2c_000_0000000083_1757984370	9240	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993613	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993614	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8820	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757993620	Alive	\N	0	0	00749c65aff0_000_0000000186_0000677270	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757993636	Alive	\N	14853466	300501294	00749c658d2c_000_0000000085_1757985715	7920	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757993646	Alive	\N	3006658	62189277	00749c658d2c_000_0000000086_1757990104	3540	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993650	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993654	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993657	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993662	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	8940	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993664	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10260	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993666	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993667	Alive	\N	8595088	120915224	00749c6464f0_000_0000000017_1757990186	3480	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993670	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993671	Alive	\N	26708985	749329487	00749c658d2c_000_0000000083_1757984370	9300	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993673	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993674	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8880	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757993680	Alive	\N	0	0	00749c65aff0_000_0000000186_0000677270	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757993696	Alive	\N	15431061	337876689	00749c658d2c_000_0000000085_1757985715	7980	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757993705	Alive	\N	3045352	62271077	00749c658d2c_000_0000000086_1757990104	3600	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993710	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993714	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993717	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993722	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9000	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993724	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10320	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993727	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993727	Alive	\N	8615098	120938109	00749c6464f0_000_0000000017_1757990186	3540	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993731	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993731	Alive	\N	27092561	771092040	00749c658d2c_000_0000000083_1757984370	9360	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993733	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993734	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	8940	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757993741	Alive	\N	0	0	00749c65aff0_000_0000000186_0000677270	600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
894b9f677008c9fd	1757993741	Stop	\N	0	0	00749c65aff0_000_0000000186_0000677270	601	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	b26221fabb05
66cc0641241a5806	1757993756	Alive	\N	15774912	350215904	00749c658d2c_000_0000000085_1757985715	8040	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757993760	Start	\N	\N	\N	00749c64d520_000_0000000170_0000671192	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757993765	Alive	\N	3545382	64500930	00749c658d2c_000_0000000086_1757990104	3660	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993770	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993773	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993776	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993783	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9060	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993784	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10380	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993786	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	1980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993787	Alive	\N	8710470	120979322	00749c6464f0_000_0000000017_1757990186	3600	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993790	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993791	Alive	\N	27243160	781341844	00749c658d2c_000_0000000083_1757984370	9420	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993792	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993794	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	9000	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757993816	Alive	\N	16460767	392658137	00749c658d2c_000_0000000085_1757985715	8100	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757993820	Alive	\N	0	0	00749c64d520_000_0000000170_0000671192	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757993825	Alive	\N	3622493	64866122	00749c658d2c_000_0000000086_1757990104	3720	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993830	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993833	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993836	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993843	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993843	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10440	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993846	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993847	Alive	\N	8716452	120989723	00749c6464f0_000_0000000017_1757990186	3660	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993850	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993851	Alive	\N	27490783	786733877	00749c658d2c_000_0000000083_1757984370	9480	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993852	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993855	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	9060	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757993876	Alive	\N	16608057	400360828	00749c658d2c_000_0000000085_1757985715	8160	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757993880	Alive	\N	0	0	00749c64d520_000_0000000170_0000671192	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757993885	Alive	\N	3653526	64919329	00749c658d2c_000_0000000086_1757990104	3780	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993890	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993893	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993896	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	1980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993902	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993903	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10500	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993906	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993908	Alive	\N	8716668	120989723	00749c6464f0_000_0000000017_1757990186	3720	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993910	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993911	Alive	\N	27831996	805407023	00749c658d2c_000_0000000083_1757984370	9540	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993912	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	1980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993914	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	9120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757993937	Alive	\N	16745582	407333346	00749c658d2c_000_0000000085_1757985715	8220	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757993940	Alive	\N	0	0	00749c64d520_000_0000000170_0000671192	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757993946	Alive	\N	3703803	65124179	00749c658d2c_000_0000000086_1757990104	3840	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757993950	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757993953	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757993956	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757993962	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757993963	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10560	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757993966	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757993968	Alive	\N	8716668	120989723	00749c6464f0_000_0000000017_1757990186	3780	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757993970	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757993971	Alive	\N	27851679	805452403	00749c658d2c_000_0000000083_1757984370	9600	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757993972	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757993974	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	9180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757993996	Alive	\N	17032436	428999680	00749c658d2c_000_0000000085_1757985715	8280	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757994001	Alive	\N	0	0	00749c64d520_000_0000000170_0000671192	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757994005	Alive	\N	3754198	65189878	00749c658d2c_000_0000000086_1757990104	3900	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994010	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994014	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757994017	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757994022	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757994023	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10620	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757994026	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757994028	Alive	\N	8716668	120989723	00749c6464f0_000_0000000017_1757990186	3840	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757994030	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757994031	Alive	\N	27872432	805469720	00749c658d2c_000_0000000083_1757984370	9660	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994033	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757994034	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	9240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757994056	Alive	\N	17297513	442874171	00749c658d2c_000_0000000085_1757985715	8340	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757994061	Alive	\N	0	0	00749c64d520_000_0000000170_0000671192	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757994065	Alive	\N	3904455	65398104	00749c658d2c_000_0000000086_1757990104	3960	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994070	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994074	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	1980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757994077	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757994083	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9360	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757994083	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10680	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757994087	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757994088	Alive	\N	8716828	120989879	00749c6464f0_000_0000000017_1757990186	3900	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757994091	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757994091	Alive	\N	27873282	805473218	00749c658d2c_000_0000000083_1757984370	9720	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994093	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757994094	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	9300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757994116	Alive	\N	18159652	460058155	00749c658d2c_000_0000000085_1757985715	8400	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757994121	Alive	\N	0	0	00749c64d520_000_0000000170_0000671192	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757994125	Alive	\N	4144491	65725511	00749c658d2c_000_0000000086_1757990104	4020	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994131	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994134	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757994137	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757994143	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9420	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757994144	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10740	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757994146	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757994148	Alive	\N	8716828	120989879	00749c6464f0_000_0000000017_1757990186	3960	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757994150	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757994151	Alive	\N	27873811	805474966	00749c658d2c_000_0000000083_1757984370	9780	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994153	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757994155	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	9360	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757994176	Alive	\N	18618472	479423589	00749c658d2c_000_0000000085_1757985715	8460	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757994180	Alive	\N	0	0	00749c64d520_000_0000000170_0000671192	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757994185	Alive	\N	4370000	66048470	00749c658d2c_000_0000000086_1757990104	4080	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994190	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994193	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757994196	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757994202	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9480	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757994204	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10800	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757994206	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757994207	Alive	\N	8781813	121113518	00749c6464f0_000_0000000017_1757990186	4020	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757994210	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757994211	Alive	\N	27893254	805493719	00749c658d2c_000_0000000083_1757984370	9840	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994212	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757994214	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	9420	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757994236	Alive	\N	19422810	518537758	00749c658d2c_000_0000000085_1757985715	8520	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757994240	Alive	\N	0	0	00749c64d520_000_0000000170_0000671192	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757994245	Alive	\N	4615323	66387546	00749c658d2c_000_0000000086_1757990104	4140	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994250	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994253	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757994256	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757994262	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9540	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2d2234a5e69d3472	1757994264	Alive	\N	0	0	00749cd49c12_000_0000000019_0000426167	10860	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
7752732a3bcc2d7b	1757994266	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757994267	Alive	\N	8781813	121113518	00749c6464f0_000_0000000017_1757990186	4080	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
ee85bdcff91e47ef	1757994270	Alive	\N	0	0	00749c65aff0_000_0000000177_0000670481	7920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
e2e8c519aa5edc7a	1757994272	Alive	\N	28487318	830395295	00749c658d2c_000_0000000083_1757984370	9900	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994272	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757994274	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	9480	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
ee85bdcff91e47ef	1757994293	Stop	\N	0	0	00749c65aff0_000_0000000177_0000670481	7943	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	36da16ac0617
66cc0641241a5806	1757994297	Alive	\N	19532433	518568562	00749c658d2c_000_0000000085_1757985715	8580	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757994300	Alive	\N	0	0	00749c64d520_000_0000000170_0000671192	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757994305	Alive	\N	4877135	66756671	00749c658d2c_000_0000000086_1757990104	4200	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
2d2234a5e69d3472	1757994306	Stop	\N	0	0	00749cd49c12_000_0000000019_0000426167	10903	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
380b1d99fdf49294	1757994310	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994313	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757994316	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1757994321	Start	\N	\N	\N	00749c2ddcc0_000_0000000206_0000677283	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	0ef0ebe6c8cf
d681b5c249787836	1757994322	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9600	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757994326	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757994327	Alive	\N	8781813	121113518	00749c6464f0_000_0000000017_1757990186	4140	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
e2e8c519aa5edc7a	1757994331	Alive	\N	28768649	860650803	00749c658d2c_000_0000000083_1757984370	9960	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994332	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757994334	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	9540	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757994356	Alive	\N	19849138	522290414	00749c658d2c_000_0000000085_1757985715	8640	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757994360	Alive	\N	0	0	00749c64d520_000_0000000170_0000671192	600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757994365	Alive	\N	5172027	67260069	00749c658d2c_000_0000000086_1757990104	4260	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994370	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994373	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757994376	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1757994382	Alive	\N	0	0	00749c2ddcc0_000_0000000206_0000677283	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	0ef0ebe6c8cf
d681b5c249787836	1757994382	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9660	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757994386	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757994387	Alive	\N	8781973	121113674	00749c6464f0_000_0000000017_1757990186	4200	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
e2e8c519aa5edc7a	1757994391	Alive	\N	28957265	867789812	00749c658d2c_000_0000000083_1757984370	10020	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994393	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757994394	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	9600	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
66cc0641241a5806	1757994416	Alive	\N	20426027	565425074	00749c658d2c_000_0000000085_1757985715	8700	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757994421	Alive	\N	0	0	00749c64d520_000_0000000170_0000671192	660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757994425	Alive	\N	5426023	67584743	00749c658d2c_000_0000000086_1757990104	4320	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994431	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994434	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757994437	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1757994442	Alive	\N	0	0	00749c2ddcc0_000_0000000206_0000677283	120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	0ef0ebe6c8cf
d681b5c249787836	1757994443	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9720	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757994447	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757994448	Alive	\N	8781973	121113674	00749c6464f0_000_0000000017_1757990186	4260	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
e2e8c519aa5edc7a	1757994451	Alive	\N	28999325	867835227	00749c658d2c_000_0000000083_1757984370	10080	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994453	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757994455	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	9660	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757994457	Start	\N	\N	\N	00749c64d520_000_0000000171_0000671888	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
7752732a3bcc2d7b	1757994471	Start	\N	\N	\N	00749c658aa8_000_0000000243_0011838533	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
66cc0641241a5806	1757994476	Alive	\N	20715243	598866374	00749c658d2c_000_0000000085_1757985715	8760	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
894b9f677008c9fd	1757994481	Alive	\N	0	0	00749c64d520_000_0000000170_0000671192	720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757994485	Alive	\N	5681335	68473806	00749c658d2c_000_0000000086_1757990104	4380	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994490	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
894b9f677008c9fd	1757994492	Stop	\N	0	0	00749c64d520_000_0000000170_0000671192	732	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757994494	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757994497	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1757994501	Alive	\N	0	0	00749c2ddcc0_000_0000000206_0000677283	180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	0ef0ebe6c8cf
d681b5c249787836	1757994503	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9780	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757994506	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757994508	Alive	\N	8781973	121113674	00749c6464f0_000_0000000017_1757990186	4320	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757994509	Start	\N	\N	\N	00749c9d7251_000_0000000265_1757994509	\N	\N	\N	2	0.0.0.0	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757994511	Alive	\N	29014616	867856641	00749c658d2c_000_0000000083_1757984370	10140	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994513	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757994514	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	9720	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757994518	Alive	\N	0	0	00749c64d520_000_0000000171_0000671888	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
7752732a3bcc2d7b	1757994531	Alive	\N	0	0	00749c658aa8_000_0000000243_0011838533	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
66cc0641241a5806	1757994536	Alive	\N	20841121	600453252	00749c658d2c_000_0000000085_1757985715	8820	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757994545	Alive	\N	5964018	68953464	00749c658d2c_000_0000000086_1757990104	4440	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994550	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	9960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994554	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757994557	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1757994561	Alive	\N	0	0	00749c2ddcc0_000_0000000206_0000677283	240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	0ef0ebe6c8cf
d681b5c249787836	1757994562	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9840	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757994566	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757994568	Alive	\N	8781973	121113674	00749c6464f0_000_0000000017_1757990186	4380	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757994569	Alive	\N	0	0	00749c9d7251_000_0000000265_1757994509	60	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757994571	Alive	\N	29019651	867865436	00749c658d2c_000_0000000083_1757984370	10200	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994573	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
charchels	1757994574	Alive	\N	0	0	58696cfa681d_000_0000000141_0003339981	9780	\N	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
charchels	1757994577	Stop	\N	0	0	58696cfa681d_000_0000000141_0003339981	9783	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	58696cfa681d:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757994578	Alive	\N	0	0	00749c64d520_000_0000000171_0000671888	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
7752732a3bcc2d7b	1757994591	Alive	\N	0	0	00749c658aa8_000_0000000243_0011838533	120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
66cc0641241a5806	1757994596	Alive	\N	20855417	600470106	00749c658d2c_000_0000000085_1757985715	8880	\N	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
6ad40ea4dd5c7db4	1757994605	Alive	\N	6152875	69252217	00749c658d2c_000_0000000086_1757990104	4500	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994610	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994613	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
7752732a3bcc2d7b	1757994614	Stop	\N	0	0	00749c658aa8_000_0000000243_0011838533	143	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
836ca3f6e7df20a1	1757994616	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1757994621	Alive	\N	0	0	00749c2ddcc0_000_0000000206_0000677283	300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	0ef0ebe6c8cf
d681b5c249787836	1757994622	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9900	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
66cc0641241a5806	1757994626	Stop	\N	20855417	600470106	00749c658d2c_000_0000000085_1757985715	8909	User-Request	\N	2	10.51.0.56	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	5e8457e45372
7752732a3bcc2d7b	1757994626	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757994628	Alive	\N	8781973	121113674	00749c6464f0_000_0000000017_1757990186	4440	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757994629	Alive	\N	80239	151395	00749c9d7251_000_0000000265_1757994509	120	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757994631	Alive	\N	29020130	867865844	00749c658d2c_000_0000000083_1757984370	10260	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994632	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
7752732a3bcc2d7b	1757994637	Alive	\N	0	0	00749c64d520_000_0000000171_0000671888	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
6ad40ea4dd5c7db4	1757994666	Alive	\N	6400546	69544219	00749c658d2c_000_0000000086_1757990104	4560	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994670	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
2d2234a5e69d3472	1757994670	Stop	\N	0	0	00749c2ddcc0_000_0000000206_0000677283	349	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	0ef0ebe6c8cf
5bbfde264cba574d	1757994673	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757994674	Start	\N	\N	\N	00749c9d7251_000_0000000268_1757994665	\N	\N	\N	2	0.0.0.0	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757994676	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757994682	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	9960	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757994686	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757994688	Alive	\N	9279953	122897882	00749c6464f0_000_0000000017_1757990186	4500	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757994690	Alive	\N	153920	369523	00749c9d7251_000_0000000265_1757994509	180	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757994692	Alive	\N	29020130	867865844	00749c658d2c_000_0000000083_1757984370	10320	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994692	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
7752732a3bcc2d7b	1757994697	Alive	\N	0	0	00749c64d520_000_0000000171_0000671888	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757994716	Start	\N	\N	\N	00749c9d7251_000_0000000269_1757994716	\N	\N	\N	2	0.0.0.0	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757994725	Alive	\N	6694638	69910618	00749c658d2c_000_0000000086_1757990104	4620	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994730	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994733	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757994734	Alive	\N	285271	435908	00749c9d7251_000_0000000268_1757994665	60	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757994736	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757994743	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10020	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757994747	Alive	\N	0	0	00749c65aff0_000_0000000185_0000675936	2940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757994747	Alive	\N	9396177	123218594	00749c6464f0_000_0000000017_1757990186	4560	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757994750	Alive	\N	155333	371213	00749c9d7251_000_0000000265_1757994509	240	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757994751	Alive	\N	29020710	867867865	00749c658d2c_000_0000000083_1757984370	10380	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994752	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
7752732a3bcc2d7b	1757994753	Stop	\N	0	0	00749c65aff0_000_0000000185_0000675936	2947	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
7752732a3bcc2d7b	1757994757	Stop	\N	0	0	00749c64d520_000_0000000171_0000671888	300	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757994777	Alive	\N	0	0	00749c9d7251_000_0000000269_1757994716	60	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757994785	Alive	\N	6907619	70196729	00749c658d2c_000_0000000086_1757990104	4680	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994791	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994793	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757994794	Alive	\N	351521	576611	00749c9d7251_000_0000000268_1757994665	120	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757994796	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757994803	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10080	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2a8db541e434d820	1757994807	Alive	\N	9397167	123220663	00749c6464f0_000_0000000017_1757990186	4620	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757994810	Alive	\N	186165	456614	00749c9d7251_000_0000000265_1757994509	300	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757994811	Alive	\N	29085199	867980953	00749c658d2c_000_0000000083_1757984370	10440	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994813	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757994837	Alive	\N	427482	429290	00749c9d7251_000_0000000269_1757994716	120	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757994845	Alive	\N	7030541	71737264	00749c658d2c_000_0000000086_1757990104	4740	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994850	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994854	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757994854	Alive	\N	470329	801667	00749c9d7251_000_0000000268_1757994665	180	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757994857	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	2940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757994862	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10140	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2a8db541e434d820	1757994867	Alive	\N	9398078	123223078	00749c6464f0_000_0000000017_1757990186	4680	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757994870	Alive	\N	194881	482619	00749c9d7251_000_0000000265_1757994509	360	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757994871	Alive	\N	29085385	867981568	00749c658d2c_000_0000000083_1757984370	10500	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994873	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	2940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757994897	Alive	\N	523393	454895	00749c9d7251_000_0000000269_1757994716	180	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757994905	Alive	\N	7262699	72073390	00749c658d2c_000_0000000086_1757990104	4800	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994910	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994914	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757994914	Alive	\N	517633	866834	00749c9d7251_000_0000000268_1757994665	240	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757994917	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757994922	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10200	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2a8db541e434d820	1757994927	Alive	\N	9407353	123238881	00749c6464f0_000_0000000017_1757990186	4740	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757994930	Alive	\N	203008	485491	00749c9d7251_000_0000000265_1757994509	420	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757994931	Alive	\N	29085385	867981682	00749c658d2c_000_0000000083_1757984370	10560	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994933	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757994957	Alive	\N	571112	483062	00749c9d7251_000_0000000269_1757994716	240	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757994965	Alive	\N	7349497	77400514	00749c658d2c_000_0000000086_1757990104	4860	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757994970	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757994974	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757994974	Alive	\N	587704	968310	00749c9d7251_000_0000000268_1757994665	300	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757994977	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757994982	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10260	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2a8db541e434d820	1757994988	Alive	\N	9418473	123253715	00749c6464f0_000_0000000017_1757990186	4800	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757994990	Alive	\N	212423	505366	00749c9d7251_000_0000000265_1757994509	480	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757994991	Alive	\N	29085716	867982276	00749c658d2c_000_0000000083_1757984370	10620	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757994992	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757995017	Alive	\N	656158	584057	00749c9d7251_000_0000000269_1757994716	300	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757995025	Alive	\N	7387013	77534081	00749c658d2c_000_0000000086_1757990104	4920	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757995030	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757995033	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	2940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757995034	Alive	\N	682455	1112804	00749c9d7251_000_0000000268_1757994665	360	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757995036	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757995042	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10320	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2a8db541e434d820	1757995048	Alive	\N	9419124	123255076	00749c6464f0_000_0000000017_1757990186	4860	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757995050	Alive	\N	221187	522196	00749c9d7251_000_0000000265_1757994509	540	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757995051	Alive	\N	29438133	870996066	00749c658d2c_000_0000000083_1757984370	10680	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757995052	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757995077	Alive	\N	713159	681136	00749c9d7251_000_0000000269_1757994716	360	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757995085	Alive	\N	7418296	77575717	00749c658d2c_000_0000000086_1757990104	4980	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757995090	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757995093	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	3000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757995094	Alive	\N	783154	1308415	00749c9d7251_000_0000000268_1757994665	420	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757995096	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757995103	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10380	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2a8db541e434d820	1757995108	Alive	\N	9419124	123255076	00749c6464f0_000_0000000017_1757990186	4920	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757995110	Alive	\N	222003	522821	00749c9d7251_000_0000000265_1757994509	600	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757995112	Alive	\N	29824103	878156188	00749c658d2c_000_0000000083_1757984370	10740	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757995112	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757995136	Alive	\N	750043	698579	00749c9d7251_000_0000000269_1757994716	420	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757995145	Alive	\N	7438224	77613054	00749c658d2c_000_0000000086_1757990104	5040	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
5bbfde264cba574d	1757995147	Start	\N	\N	\N	00749c2ddcc0_000_0000000207_0000678109	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	3e5e4ee1d7a6
380b1d99fdf49294	1757995151	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757995153	Alive	\N	805864	1338305	00749c9d7251_000_0000000268_1757994665	480	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
5bbfde264cba574d	1757995153	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	3060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757995156	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757995163	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10440	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2a8db541e434d820	1757995168	Alive	\N	9419124	123255076	00749c6464f0_000_0000000017_1757990186	4980	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757995169	Alive	\N	275154	582414	00749c9d7251_000_0000000265_1757994509	660	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757995171	Alive	\N	30293680	910908869	00749c658d2c_000_0000000083_1757984370	10800	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757995172	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757995196	Alive	\N	767285	707542	00749c9d7251_000_0000000269_1757994716	480	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757995205	Alive	\N	7444114	77639781	00749c658d2c_000_0000000086_1757990104	5100	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
5bbfde264cba574d	1757995208	Alive	\N	0	0	00749c2ddcc0_000_0000000207_0000678109	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	3e5e4ee1d7a6
380b1d99fdf49294	1757995210	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757995213	Alive	\N	819715	1358085	00749c9d7251_000_0000000268_1757994665	540	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
5bbfde264cba574d	1757995214	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	3120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757995217	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757995222	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10500	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2a8db541e434d820	1757995228	Alive	\N	9419454	123256671	00749c6464f0_000_0000000017_1757990186	5040	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757995229	Alive	\N	277406	583953	00749c9d7251_000_0000000265_1757994509	720	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757995231	Alive	\N	33486392	919139400	00749c658d2c_000_0000000083_1757984370	10860	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757995233	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757995256	Alive	\N	769889	711695	00749c9d7251_000_0000000269_1757994716	540	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757995265	Alive	\N	7536119	80627481	00749c658d2c_000_0000000086_1757990104	5160	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
5bbfde264cba574d	1757995268	Alive	\N	0	0	00749c2ddcc0_000_0000000207_0000678109	120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	3e5e4ee1d7a6
380b1d99fdf49294	1757995270	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757995273	Alive	\N	847734	1393704	00749c9d7251_000_0000000268_1757994665	600	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
5bbfde264cba574d	1757995274	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	3180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757995277	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757995282	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10560	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2a8db541e434d820	1757995287	Alive	\N	9419520	123257535	00749c6464f0_000_0000000017_1757990186	5100	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757995289	Alive	\N	321910	660303	00749c9d7251_000_0000000265_1757994509	780	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757995291	Alive	\N	33907237	927178761	00749c658d2c_000_0000000083_1757984370	10920	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757995293	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757995313	Stop	\N	835725	776280	00749c9d7251_000_0000000269_1757994716	596	User-Request	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
894b9f677008c9fd	1757995314	Start	\N	\N	\N	00749c64d520_000_0000000172_0000672745	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757995325	Alive	\N	7592104	81312685	00749c658d2c_000_0000000086_1757990104	5220	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
5bbfde264cba574d	1757995328	Alive	\N	0	0	00749c2ddcc0_000_0000000207_0000678109	180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	3e5e4ee1d7a6
380b1d99fdf49294	1757995330	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757995333	Alive	\N	880691	1434476	00749c9d7251_000_0000000268_1757994665	660	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
894b9f677008c9fd	1757995333	Stop	\N	0	0	00749c64d520_000_0000000172_0000672745	20	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757995334	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	3240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757995337	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
894b9f677008c9fd	1757995341	Start	\N	\N	\N	00749c2ddcc0_000_0000000208_0000678303	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	b26221fabb05
d681b5c249787836	1757995342	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10620	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2a8db541e434d820	1757995347	Alive	\N	9419520	123257535	00749c6464f0_000_0000000017_1757990186	5160	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757995349	Alive	\N	333184	679896	00749c9d7251_000_0000000265_1757994509	840	\N	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
e2e8c519aa5edc7a	1757995351	Alive	\N	34088765	932026875	00749c658d2c_000_0000000083_1757984370	10980	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757995353	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
5bbfde264cba574d	1757995385	Stop	\N	0	0	00749c2ddcc0_000_0000000207_0000678109	237	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	3e5e4ee1d7a6
6ad40ea4dd5c7db4	1757995385	Alive	\N	7618225	81358643	00749c658d2c_000_0000000086_1757990104	5280	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
7752732a3bcc2d7b	1757995390	Start	\N	\N	\N	00749c658aa8_000_0000000244_0011839450	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
380b1d99fdf49294	1757995390	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
5bbfde264cba574d	1757995393	Alive	\N	0	0	00749c64d520_000_0000000169_0000669524	3300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757995394	Alive	\N	919797	1478362	00749c9d7251_000_0000000268_1757994665	720	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757995396	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
894b9f677008c9fd	1757995400	Alive	\N	0	0	00749c2ddcc0_000_0000000208_0000678303	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	b26221fabb05
d681b5c249787836	1757995402	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10680	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
7752732a3bcc2d7b	1757995404	Stop	\N	509766	7127325	00749c9d7251_000_0000000265_1757994509	894	User-Request	\N	2	10.51.0.54	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757995407	Alive	\N	9433501	123315486	00749c6464f0_000_0000000017_1757990186	5220	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
e2e8c519aa5edc7a	1757995411	Alive	\N	34811296	960853328	00749c658d2c_000_0000000083_1757984370	11040	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757995412	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
7752732a3bcc2d7b	1757995414	Start	\N	\N	\N	00749c65aff0_000_0000000190_0000679544	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757995429	Stop	\N	0	0	00749c2ddcc0_000_0000000208_0000678303	88	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	b26221fabb05
6ad40ea4dd5c7db4	1757995445	Alive	\N	7632236	81385606	00749c658d2c_000_0000000086_1757990104	5340	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
5bbfde264cba574d	1757995445	Stop	\N	0	0	00749c64d520_000_0000000169_0000669524	3352	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
7752732a3bcc2d7b	1757995450	Alive	\N	0	0	00749c658aa8_000_0000000244_0011839450	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
380b1d99fdf49294	1757995451	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757995454	Alive	\N	982517	1557521	00749c9d7251_000_0000000268_1757994665	780	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757995456	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757995463	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10740	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2a8db541e434d820	1757995467	Alive	\N	9433501	123315486	00749c6464f0_000_0000000017_1757990186	5280	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
e2e8c519aa5edc7a	1757995471	Alive	\N	35000795	961539794	00749c658d2c_000_0000000083_1757984370	11100	\N	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
f23970b34f423357	1757995472	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
7752732a3bcc2d7b	1757995475	Alive	\N	0	0	00749c65aff0_000_0000000190_0000679544	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
6ad40ea4dd5c7db4	1757995505	Alive	\N	7637463	81398498	00749c658d2c_000_0000000086_1757990104	5400	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
7752732a3bcc2d7b	1757995510	Alive	\N	0	0	00749c658aa8_000_0000000244_0011839450	120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
380b1d99fdf49294	1757995510	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757995514	Alive	\N	1009507	1599539	00749c9d7251_000_0000000268_1757994665	840	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757995516	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
e2e8c519aa5edc7a	1757995521	Stop	\N	35677781	984046976	00749c658d2c_000_0000000083_1757984370	11150	User-Request	\N	2	10.51.0.53	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	9a4acc16c18f
d681b5c249787836	1757995523	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10800	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2a8db541e434d820	1757995528	Alive	\N	9433501	123315486	00749c6464f0_000_0000000017_1757990186	5340	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
f23970b34f423357	1757995532	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
7752732a3bcc2d7b	1757995534	Alive	\N	0	0	00749c65aff0_000_0000000190_0000679544	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
6ad40ea4dd5c7db4	1757995566	Alive	\N	7660680	81437370	00749c658d2c_000_0000000086_1757990104	5460	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
7752732a3bcc2d7b	1757995569	Alive	\N	0	0	00749c658aa8_000_0000000244_0011839450	180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
380b1d99fdf49294	1757995570	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	10980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757995574	Alive	\N	1032163	1632850	00749c9d7251_000_0000000268_1757994665	900	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757995577	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
d681b5c249787836	1757995582	Alive	\N	0	0	00749c658aa8_000_0000000236_0011828785	10860	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
2a8db541e434d820	1757995588	Alive	\N	9433501	123315486	00749c6464f0_000_0000000017_1757990186	5400	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
f23970b34f423357	1757995593	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
7752732a3bcc2d7b	1757995594	Alive	\N	0	0	00749c65aff0_000_0000000190_0000679544	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
d681b5c249787836	1757995620	Stop	\N	0	0	00749c658aa8_000_0000000236_0011828785	10897	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	26afb767960e
6ad40ea4dd5c7db4	1757995625	Alive	\N	7753624	81624707	00749c658d2c_000_0000000086_1757990104	5520	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
7752732a3bcc2d7b	1757995629	Alive	\N	0	0	00749c658aa8_000_0000000244_0011839450	240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
380b1d99fdf49294	1757995630	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	11040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757995634	Alive	\N	1092109	1750571	00749c9d7251_000_0000000268_1757994665	960	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757995635	Start	\N	\N	\N	00749c65a0c4_000_0000000033_1757995633	\N	\N	\N	2	0.0.0.0	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	1ee2271c23db
836ca3f6e7df20a1	1757995637	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
894b9f677008c9fd	1757995639	Start	\N	\N	\N	00749c2ddcc0_000_0000000210_0000678601	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	b26221fabb05
2a8db541e434d820	1757995648	Alive	\N	9433501	123315486	00749c6464f0_000_0000000017_1757990186	5460	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
f23970b34f423357	1757995653	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
7752732a3bcc2d7b	1757995654	Alive	\N	0	0	00749c65aff0_000_0000000190_0000679544	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
2a8db541e434d820	1757995661	Stop	\N	9433501	123315486	00749c6464f0_000_0000000017_1757990186	5474	User-Request	\N	2	10.51.0.52	\N	\N	\N	\N	00749c6464f0:ZEEP Wifi	42c166d9418a
7752732a3bcc2d7b	1757995667	Start	\N	\N	\N	00749c64d520_000_0000000173_0000673099	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
6ad40ea4dd5c7db4	1757995685	Alive	\N	7792166	81673193	00749c658d2c_000_0000000086_1757990104	5580	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
7752732a3bcc2d7b	1757995687	Start	\N	\N	\N	00749c2ddcc0_000_0000000211_0000678649	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	1ee2271c23db
7752732a3bcc2d7b	1757995689	Alive	\N	0	0	00749c658aa8_000_0000000244_0011839450	300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
380b1d99fdf49294	1757995690	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	11100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
7752732a3bcc2d7b	1757995692	Stop	\N	0	0	00749c658aa8_000_0000000244_0011839450	302	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	1ee2271c23db
01d5e8df-8722-4f42-80f3-605093960553	1757995694	Alive	\N	1400511	1804815	00749c9d7251_000_0000000268_1757994665	1020	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757995695	Alive	\N	0	0	00749c65a0c4_000_0000000033_1757995633	60	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757995697	Stop	\N	0	0	00749c2ddcc0_000_0000000210_0000678601	57	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	b26221fabb05
836ca3f6e7df20a1	1757995697	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
894b9f677008c9fd	1757995705	Start	\N	\N	\N	00749c658aa8_000_0000000246_0011839767	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	b26221fabb05
f23970b34f423357	1757995713	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
7752732a3bcc2d7b	1757995714	Alive	\N	0	0	00749c65aff0_000_0000000190_0000679544	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757995720	Start	\N	\N	\N	00749c9d7251_000_0000000272_1757995720	\N	\N	\N	2	0.0.0.0	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
7752732a3bcc2d7b	1757995728	Alive	\N	0	0	00749c64d520_000_0000000173_0000673099	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
6ad40ea4dd5c7db4	1757995745	Alive	\N	7831173	81756837	00749c658d2c_000_0000000086_1757990104	5640	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
7752732a3bcc2d7b	1757995747	Alive	\N	0	0	00749c2ddcc0_000_0000000211_0000678649	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757995748	Stop	\N	0	0	00749c658aa8_000_0000000246_0011839767	42	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	b26221fabb05
380b1d99fdf49294	1757995750	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	11160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757995754	Alive	\N	1424641	1840416	00749c9d7251_000_0000000268_1757994665	1080	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757995756	Alive	\N	893	740	00749c65a0c4_000_0000000033_1757995633	120	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	1ee2271c23db
836ca3f6e7df20a1	1757995757	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757995772	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
7752732a3bcc2d7b	1757995775	Alive	\N	0	0	00749c65aff0_000_0000000190_0000679544	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
7752732a3bcc2d7b	1757995776	Stop	\N	0	0	00749c2ddcc0_000_0000000211_0000678649	89	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757995781	Alive	\N	0	0	00749c9d7251_000_0000000272_1757995720	60	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
7752732a3bcc2d7b	1757995787	Alive	\N	0	0	00749c64d520_000_0000000173_0000673099	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
6ad40ea4dd5c7db4	1757995805	Alive	\N	7845336	81784234	00749c658d2c_000_0000000086_1757990104	5700	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757995811	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	11220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757995814	Alive	\N	1445278	1874628	00749c9d7251_000_0000000268_1757994665	1140	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757995816	Alive	\N	893	740	00749c65a0c4_000_0000000033_1757995633	180	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	1ee2271c23db
836ca3f6e7df20a1	1757995816	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757995832	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
7752732a3bcc2d7b	1757995835	Alive	\N	0	0	00749c65aff0_000_0000000190_0000679544	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757995841	Alive	\N	49910	55520	00749c9d7251_000_0000000272_1757995720	120	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
7752732a3bcc2d7b	1757995847	Alive	\N	0	0	00749c64d520_000_0000000173_0000673099	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
6ad40ea4dd5c7db4	1757995865	Alive	\N	7852404	81799492	00749c658d2c_000_0000000086_1757990104	5760	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757995870	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	11280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757995873	Alive	\N	1505041	2001235	00749c9d7251_000_0000000268_1757994665	1200	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757995875	Alive	\N	893	740	00749c65a0c4_000_0000000033_1757995633	240	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	1ee2271c23db
836ca3f6e7df20a1	1757995876	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	3960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757995892	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	3960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
7752732a3bcc2d7b	1757995894	Alive	\N	0	0	00749c65aff0_000_0000000190_0000679544	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757995900	Alive	\N	369473	796172	00749c9d7251_000_0000000272_1757995720	180	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
7752732a3bcc2d7b	1757995907	Alive	\N	0	0	00749c64d520_000_0000000173_0000673099	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
6ad40ea4dd5c7db4	1757995925	Alive	\N	7865061	81821638	00749c658d2c_000_0000000086_1757990104	5820	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757995930	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	11340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757995933	Alive	\N	1535268	2044412	00749c9d7251_000_0000000268_1757994665	1260	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
7752732a3bcc2d7b	1757995935	Alive	\N	893	740	00749c65a0c4_000_0000000033_1757995633	300	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	1ee2271c23db
836ca3f6e7df20a1	1757995936	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757995952	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
7752732a3bcc2d7b	1757995953	Stop	\N	893	740	00749c65a0c4_000_0000000033_1757995633	318	User-Request	\N	2	10.51.0.51	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	1ee2271c23db
7752732a3bcc2d7b	1757995954	Alive	\N	0	0	00749c65aff0_000_0000000190_0000679544	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
7752732a3bcc2d7b	1757995959	Stop	\N	0	0	00749c65aff0_000_0000000190_0000679544	544	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	1ee2271c23db
894b9f677008c9fd	1757995960	Alive	\N	499119	4506898	00749c9d7251_000_0000000272_1757995720	240	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
7752732a3bcc2d7b	1757995967	Alive	\N	0	0	00749c64d520_000_0000000173_0000673099	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
7752732a3bcc2d7b	1757995968	Stop	\N	0	0	00749c64d520_000_0000000173_0000673099	300	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	1ee2271c23db
6ad40ea4dd5c7db4	1757995985	Alive	\N	7884378	81883430	00749c658d2c_000_0000000086_1757990104	5880	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757995990	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	11400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757995993	Alive	\N	1567700	2086173	00749c9d7251_000_0000000268_1757994665	1320	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
5bbfde264cba574d	1757995996	Start	\N	\N	\N	00749c2ddcc0_000_0000000214_0000678958	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757995997	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996013	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996020	Alive	\N	648939	4741870	00749c9d7251_000_0000000272_1757995720	300	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996028	Start	\N	\N	\N	00749c64d520_000_0000000174_0000673459	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
6ad40ea4dd5c7db4	1757996046	Alive	\N	7907236	81905417	00749c658d2c_000_0000000086_1757990104	5940	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757996050	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	11460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757996053	Alive	\N	1586574	2112509	00749c9d7251_000_0000000268_1757994665	1380	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
5bbfde264cba574d	1757996057	Alive	\N	0	0	00749c2ddcc0_000_0000000214_0000678958	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757996057	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996073	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996080	Alive	\N	845500	4889430	00749c9d7251_000_0000000272_1757995720	360	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996089	Alive	\N	0	0	00749c64d520_000_0000000174_0000673459	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
5bbfde264cba574d	1757996099	Start	\N	\N	\N	00749c65aff0_000_0000000191_0000680229	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
6ad40ea4dd5c7db4	1757996105	Alive	\N	7918669	81930562	00749c658d2c_000_0000000086_1757990104	6000	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757996110	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	11520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757996113	Alive	\N	1608689	2142411	00749c9d7251_000_0000000268_1757994665	1440	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
5bbfde264cba574d	1757996117	Alive	\N	0	0	00749c2ddcc0_000_0000000214_0000678958	120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757996117	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996133	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996141	Alive	\N	1053600	5042903	00749c9d7251_000_0000000272_1757995720	420	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996149	Alive	\N	0	0	00749c64d520_000_0000000174_0000673459	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
5bbfde264cba574d	1757996160	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
6ad40ea4dd5c7db4	1757996165	Alive	\N	7957340	82200017	00749c658d2c_000_0000000086_1757990104	6060	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757996171	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	11580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757996174	Alive	\N	1629062	2171862	00749c9d7251_000_0000000268_1757994665	1500	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
5bbfde264cba574d	1757996177	Alive	\N	0	0	00749c2ddcc0_000_0000000214_0000678958	180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757996177	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996192	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996201	Alive	\N	1182521	5143780	00749c9d7251_000_0000000272_1757995720	480	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996208	Alive	\N	0	0	00749c64d520_000_0000000174_0000673459	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
5bbfde264cba574d	1757996219	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
6ad40ea4dd5c7db4	1757996225	Alive	\N	8042731	83936099	00749c658d2c_000_0000000086_1757990104	6120	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
380b1d99fdf49294	1757996230	Alive	\N	0	0	00749c65aff0_000_0000000176_0000668720	11640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
380b1d99fdf49294	1757996233	Stop	\N	0	0	00749c65aff0_000_0000000176_0000668720	11642	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	8a9a9724b5f6
01d5e8df-8722-4f42-80f3-605093960553	1757996234	Alive	\N	1669706	2216432	00749c9d7251_000_0000000268_1757994665	1560	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757996236	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
5bbfde264cba574d	1757996237	Alive	\N	0	0	00749c2ddcc0_000_0000000214_0000678958	240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	3e5e4ee1d7a6
6ad40ea4dd5c7db4	1757996238	Stop	\N	8042731	83936099	00749c658d2c_000_0000000086_1757990104	6133	User-Request	\N	2	10.51.0.51	\N	\N	\N	\N	00749c658d2c:ZEEP Wifi	d6743a276b56
f23970b34f423357	1757996252	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996261	Alive	\N	1212645	5181028	00749c9d7251_000_0000000272_1757995720	540	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996268	Alive	\N	0	0	00749c64d520_000_0000000174_0000673459	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
5bbfde264cba574d	1757996279	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757996294	Alive	\N	1689483	2249198	00749c9d7251_000_0000000268_1757994665	1620	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
5bbfde264cba574d	1757996296	Alive	\N	0	0	00749c2ddcc0_000_0000000214_0000678958	300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757996296	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996312	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996321	Alive	\N	1224802	5199336	00749c9d7251_000_0000000272_1757995720	600	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996321	Stop	\N	0	0	00749c2ddcc0_000_0000000214_0000678958	324	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	3e5e4ee1d7a6
5bbfde264cba574d	1757996328	Stop	\N	0	0	00749c64d520_000_0000000174_0000673459	299	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	3e5e4ee1d7a6
5bbfde264cba574d	1757996339	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757996354	Alive	\N	1879903	2355814	00749c9d7251_000_0000000268_1757994665	1680	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757996356	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996372	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996381	Alive	\N	1282229	5246448	00749c9d7251_000_0000000272_1757995720	660	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996399	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757996414	Alive	\N	1894265	2373504	00749c9d7251_000_0000000268_1757994665	1740	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757996417	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996433	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996441	Alive	\N	1300957	5290255	00749c9d7251_000_0000000272_1757995720	720	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996459	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757996474	Alive	\N	1894265	2373564	00749c9d7251_000_0000000268_1757994665	1800	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757996477	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996493	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996501	Alive	\N	1312293	5324072	00749c9d7251_000_0000000272_1757995720	780	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996520	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757996534	Alive	\N	1894472	2373789	00749c9d7251_000_0000000268_1757994665	1860	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757996537	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996553	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996561	Alive	\N	1312293	5324072	00749c9d7251_000_0000000272_1757995720	840	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996579	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757996593	Alive	\N	1894472	2373789	00749c9d7251_000_0000000268_1757994665	1920	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757996597	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996613	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996620	Alive	\N	1312293	5324072	00749c9d7251_000_0000000272_1757995720	900	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996639	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757996653	Alive	\N	1894472	2373789	00749c9d7251_000_0000000268_1757994665	1980	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757996656	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996672	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996680	Alive	\N	1312293	5324072	00749c9d7251_000_0000000272_1757995720	960	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996699	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757996713	Alive	\N	1894680	2374014	00749c9d7251_000_0000000268_1757994665	2040	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757996716	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996732	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996740	Alive	\N	1312453	5324228	00749c9d7251_000_0000000272_1757995720	1020	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996759	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757996773	Alive	\N	1894680	2374014	00749c9d7251_000_0000000268_1757994665	2100	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757996776	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996792	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996800	Alive	\N	1312453	5324228	00749c9d7251_000_0000000272_1757995720	1080	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996819	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757996834	Alive	\N	1894680	2374014	00749c9d7251_000_0000000268_1757994665	2160	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757996837	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996853	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996861	Alive	\N	1312453	5324228	00749c9d7251_000_0000000272_1757995720	1140	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996880	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757996894	Alive	\N	1894889	2374239	00749c9d7251_000_0000000268_1757994665	2220	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757996897	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	4980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996913	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	4980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996921	Alive	\N	1312453	5324228	00749c9d7251_000_0000000272_1757995720	1200	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996939	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757996954	Alive	\N	1894889	2374239	00749c9d7251_000_0000000268_1757994665	2280	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757996957	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757996973	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757996981	Alive	\N	1312453	5324228	00749c9d7251_000_0000000272_1757995720	1260	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757996999	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997014	Alive	\N	1894889	2374239	00749c9d7251_000_0000000268_1757994665	2340	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997017	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997033	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997041	Alive	\N	1379036	5379358	00749c9d7251_000_0000000272_1757995720	1320	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997059	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997074	Alive	\N	1895098	2374464	00749c9d7251_000_0000000268_1757994665	2400	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997076	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997092	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997101	Alive	\N	1438470	5857321	00749c9d7251_000_0000000272_1757995720	1380	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997119	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997134	Alive	\N	1895098	2374464	00749c9d7251_000_0000000268_1757994665	2460	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997136	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997152	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997161	Alive	\N	1438470	5857321	00749c9d7251_000_0000000272_1757995720	1440	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997180	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997194	Alive	\N	1895617	2375178	00749c9d7251_000_0000000268_1757994665	2520	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997196	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997212	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997221	Alive	\N	1438470	5857321	00749c9d7251_000_0000000272_1757995720	1500	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997239	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997254	Alive	\N	1895826	2375403	00749c9d7251_000_0000000268_1757994665	2580	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997256	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997272	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997280	Alive	\N	1438470	5857321	00749c9d7251_000_0000000272_1757995720	1560	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997299	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997313	Alive	\N	1895826	2375403	00749c9d7251_000_0000000268_1757994665	2640	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997317	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997333	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997340	Alive	\N	1438628	5857477	00749c9d7251_000_0000000272_1757995720	1620	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997359	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997373	Alive	\N	1895826	2375403	00749c9d7251_000_0000000268_1757994665	2700	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997377	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997393	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997400	Alive	\N	1438628	5857477	00749c9d7251_000_0000000272_1757995720	1680	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997419	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997433	Alive	\N	1896035	2375628	00749c9d7251_000_0000000268_1757994665	2760	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997437	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997453	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
5bbfde264cba574d	1757997480	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997493	Alive	\N	1896035	2375628	00749c9d7251_000_0000000268_1757994665	2820	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997497	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997512	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997520	Alive	\N	1438628	5857477	00749c9d7251_000_0000000272_1757995720	1800	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997539	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997554	Alive	\N	1896035	2375628	00749c9d7251_000_0000000268_1757994665	2880	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997556	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997572	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997581	Alive	\N	1438628	5857477	00749c9d7251_000_0000000272_1757995720	1860	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997599	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997614	Alive	\N	1896244	2375853	00749c9d7251_000_0000000268_1757994665	2940	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997616	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997632	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997641	Alive	\N	1438788	5857633	00749c9d7251_000_0000000272_1757995720	1920	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997659	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997674	Alive	\N	1896244	2375853	00749c9d7251_000_0000000268_1757994665	3000	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997676	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997692	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997701	Alive	\N	1447501	5872851	00749c9d7251_000_0000000272_1757995720	1980	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997719	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997734	Alive	\N	1896244	2375853	00749c9d7251_000_0000000268_1757994665	3060	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997737	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997753	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997761	Alive	\N	1447501	5872851	00749c9d7251_000_0000000272_1757995720	2040	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997779	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
836ca3f6e7df20a1	1757999716	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
01d5e8df-8722-4f42-80f3-605093960553	1757997794	Alive	\N	1896453	2376078	00749c9d7251_000_0000000268_1757994665	3120	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997797	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997813	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997821	Alive	\N	1447501	5872851	00749c9d7251_000_0000000272_1757995720	2100	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997840	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997854	Alive	\N	1896453	2376078	00749c9d7251_000_0000000268_1757994665	3180	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997857	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	5940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997873	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	5940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997881	Alive	\N	1447501	5872851	00749c9d7251_000_0000000272_1757995720	2160	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997899	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997914	Alive	\N	1896453	2376078	00749c9d7251_000_0000000268_1757994665	3240	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997917	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997933	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757997941	Alive	\N	1447661	5873007	00749c9d7251_000_0000000272_1757995720	2220	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757997959	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757997974	Alive	\N	1896662	2376303	00749c9d7251_000_0000000268_1757994665	3300	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757997976	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757997992	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998001	Alive	\N	1447661	5873007	00749c9d7251_000_0000000272_1757995720	2280	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998019	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998033	Alive	\N	1896662	2376303	00749c9d7251_000_0000000268_1757994665	3360	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998036	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998052	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998060	Alive	\N	1447661	5873007	00749c9d7251_000_0000000272_1757995720	2340	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998079	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	1980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998093	Alive	\N	1896662	2376303	00749c9d7251_000_0000000268_1757994665	3420	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998096	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998112	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998120	Alive	\N	1447661	5873007	00749c9d7251_000_0000000272_1757995720	2400	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998139	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998153	Alive	\N	1896871	2376528	00749c9d7251_000_0000000268_1757994665	3480	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998157	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998173	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998180	Alive	\N	1447661	5873007	00749c9d7251_000_0000000272_1757995720	2460	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998200	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998213	Alive	\N	1896871	2376528	00749c9d7251_000_0000000268_1757994665	3540	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998217	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998233	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998240	Alive	\N	1447821	5873163	00749c9d7251_000_0000000272_1757995720	2520	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998259	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1757999732	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
01d5e8df-8722-4f42-80f3-605093960553	1757998273	Alive	\N	1896871	2376528	00749c9d7251_000_0000000268_1757994665	3600	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998277	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998293	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998300	Alive	\N	1447821	5873163	00749c9d7251_000_0000000272_1757995720	2580	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998319	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998334	Alive	\N	1897080	2376753	00749c9d7251_000_0000000268_1757994665	3660	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998336	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998352	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998361	Alive	\N	1447821	5873163	00749c9d7251_000_0000000272_1757995720	2640	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998379	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998394	Alive	\N	1897080	2376753	00749c9d7251_000_0000000268_1757994665	3720	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998396	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998412	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998421	Alive	\N	1447821	5873163	00749c9d7251_000_0000000272_1757995720	2700	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998439	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998454	Alive	\N	1897080	2376753	00749c9d7251_000_0000000268_1757994665	3780	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998456	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998472	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998481	Alive	\N	1559525	5943970	00749c9d7251_000_0000000272_1757995720	2760	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998499	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998514	Alive	\N	1897289	2376978	00749c9d7251_000_0000000268_1757994665	3840	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998517	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998533	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998541	Alive	\N	1561652	5945640	00749c9d7251_000_0000000272_1757995720	2820	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998560	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998574	Alive	\N	1897289	2376978	00749c9d7251_000_0000000268_1757994665	3900	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998577	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998593	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998601	Alive	\N	1562044	5946044	00749c9d7251_000_0000000272_1757995720	2880	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998619	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998634	Alive	\N	1897289	2376978	00749c9d7251_000_0000000268_1757994665	3960	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998637	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998653	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998661	Alive	\N	1562044	5946044	00749c9d7251_000_0000000272_1757995720	2940	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998679	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998694	Alive	\N	1897498	2377203	00749c9d7251_000_0000000268_1757994665	4020	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998697	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998713	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998721	Alive	\N	1562044	5946044	00749c9d7251_000_0000000272_1757995720	3000	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998739	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
894b9f677008c9fd	1757999740	Alive	\N	2403539	6998988	00749c9d7251_000_0000000272_1757995720	4020	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
01d5e8df-8722-4f42-80f3-605093960553	1757998754	Alive	\N	1897498	2377203	00749c9d7251_000_0000000268_1757994665	4080	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998756	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998772	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998781	Alive	\N	1562044	5946044	00749c9d7251_000_0000000272_1757995720	3060	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998799	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998813	Alive	\N	1897498	2377203	00749c9d7251_000_0000000268_1757994665	4140	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998816	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998832	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998840	Alive	\N	1562192	5946384	00749c9d7251_000_0000000272_1757995720	3120	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998859	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998873	Alive	\N	1897707	2377428	00749c9d7251_000_0000000268_1757994665	4200	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998876	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	6960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998892	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	6960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998900	Alive	\N	1562500	5946880	00749c9d7251_000_0000000272_1757995720	3180	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998919	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998933	Alive	\N	1897707	2377428	00749c9d7251_000_0000000268_1757994665	4260	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998937	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757998953	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757998960	Alive	\N	1766308	6164174	00749c9d7251_000_0000000272_1757995720	3240	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757998980	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757998993	Alive	\N	2266572	3481804	00749c9d7251_000_0000000268_1757994665	4320	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757998997	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999013	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999021	Alive	\N	1844972	6250636	00749c9d7251_000_0000000272_1757995720	3300	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757999039	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	2940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757999054	Alive	\N	2489565	3883152	00749c9d7251_000_0000000268_1757994665	4380	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999057	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999073	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999081	Alive	\N	1845194	6250978	00749c9d7251_000_0000000272_1757995720	3360	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757999099	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757999114	Alive	\N	2685424	4114770	00749c9d7251_000_0000000268_1757994665	4440	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999117	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999133	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999141	Alive	\N	1845876	6251871	00749c9d7251_000_0000000272_1757995720	3420	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757999159	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757999174	Alive	\N	3116780	24664488	00749c9d7251_000_0000000268_1757994665	4500	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999176	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999192	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999201	Alive	\N	1846086	6252264	00749c9d7251_000_0000000272_1757995720	3480	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757999219	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
5bbfde264cba574d	1757999759	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757999234	Alive	\N	3848907	29187012	00749c9d7251_000_0000000268_1757994665	4560	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999236	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999252	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999261	Alive	\N	1846086	6252264	00749c9d7251_000_0000000272_1757995720	3540	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757999279	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757999294	Alive	\N	3987991	29359174	00749c9d7251_000_0000000268_1757994665	4620	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999296	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999312	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999321	Alive	\N	1846086	6252264	00749c9d7251_000_0000000272_1757995720	3600	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757999340	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757999354	Alive	\N	4078055	29713668	00749c9d7251_000_0000000268_1757994665	4680	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999356	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999373	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
5bbfde264cba574d	1757999399	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757999414	Alive	\N	4129032	29771866	00749c9d7251_000_0000000268_1757994665	4740	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999417	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999433	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999441	Alive	\N	2393442	6988411	00749c9d7251_000_0000000272_1757995720	3720	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757999459	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757999474	Alive	\N	4164253	29834715	00749c9d7251_000_0000000268_1757994665	4800	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999477	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999493	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999500	Alive	\N	2401412	6996967	00749c9d7251_000_0000000272_1757995720	3780	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757999519	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757999533	Alive	\N	4196471	29878687	00749c9d7251_000_0000000268_1757994665	4860	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999537	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999553	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999560	Alive	\N	2402967	6998163	00749c9d7251_000_0000000272_1757995720	3840	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757999579	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757999593	Alive	\N	4198137	29881115	00749c9d7251_000_0000000268_1757994665	4920	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999596	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999612	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999620	Alive	\N	2403284	6998661	00749c9d7251_000_0000000272_1757995720	3900	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757999640	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757999653	Alive	\N	4211369	30004647	00749c9d7251_000_0000000268_1757994665	4980	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999656	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999672	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999680	Alive	\N	2403444	6998817	00749c9d7251_000_0000000272_1757995720	3960	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757999700	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757999713	Alive	\N	4227472	30022543	00749c9d7251_000_0000000268_1757994665	5040	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
01d5e8df-8722-4f42-80f3-605093960553	1757999774	Alive	\N	4248572	30059916	00749c9d7251_000_0000000268_1757994665	5100	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999776	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999792	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999801	Alive	\N	2403539	6998988	00749c9d7251_000_0000000272_1757995720	4080	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757999819	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757999834	Alive	\N	4264719	30083523	00749c9d7251_000_0000000268_1757994665	5160	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999837	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999853	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999861	Alive	\N	2403539	6998988	00749c9d7251_000_0000000272_1757995720	4140	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757999879	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
01d5e8df-8722-4f42-80f3-605093960553	1757999894	Alive	\N	4352796	30176421	00749c9d7251_000_0000000268_1757994665	5220	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999897	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	7980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999913	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	7980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999921	Alive	\N	2403634	6999159	00749c9d7251_000_0000000272_1757995720	4200	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1757999939	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1757999951	Start	\N	\N	\N	00749c9d7251_000_0000000276_1757999950	\N	\N	\N	2	0.0.0.0	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1757999954	Alive	\N	4391926	30218024	00749c9d7251_000_0000000268_1757994665	5280	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1757999957	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1757999973	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1757999981	Alive	\N	2684877	7784374	00749c9d7251_000_0000000272_1757995720	4260	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000000	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000011	Alive	\N	0	0	00749c9d7251_000_0000000276_1757999950	60	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000014	Alive	\N	4415739	30282352	00749c9d7251_000_0000000268_1757994665	5340	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000017	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000032	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000041	Alive	\N	2685260	7784926	00749c9d7251_000_0000000272_1757995720	4320	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000060	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	3960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000071	Alive	\N	223151	358591	00749c9d7251_000_0000000276_1757999950	120	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000074	Alive	\N	4428226	30298408	00749c9d7251_000_0000000268_1757994665	5400	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000076	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000092	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000101	Alive	\N	2685260	7784926	00749c9d7251_000_0000000272_1757995720	4380	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000119	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000131	Alive	\N	727157	378012	00749c9d7251_000_0000000276_1757999950	180	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000134	Alive	\N	4446231	30319907	00749c9d7251_000_0000000268_1757994665	5460	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000136	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000152	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000160	Alive	\N	2685260	7784926	00749c9d7251_000_0000000272_1757995720	4440	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000179	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000190	Alive	\N	732066	393495	00749c9d7251_000_0000000276_1757999950	240	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000193	Alive	\N	4449907	30326680	00749c9d7251_000_0000000268_1757994665	5520	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000196	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000212	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000220	Alive	\N	2810341	7936079	00749c9d7251_000_0000000272_1757995720	4500	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000239	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000250	Alive	\N	732667	394019	00749c9d7251_000_0000000276_1757999950	300	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000253	Alive	\N	4487689	30378252	00749c9d7251_000_0000000268_1757994665	5580	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000257	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000273	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000280	Alive	\N	2958285	8083347	00749c9d7251_000_0000000272_1757995720	4560	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000299	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000310	Alive	\N	813984	454498	00749c9d7251_000_0000000276_1757999950	360	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000313	Alive	\N	4489802	30381061	00749c9d7251_000_0000000268_1757994665	5640	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000317	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000333	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000340	Alive	\N	3603865	30913511	00749c9d7251_000_0000000272_1757995720	4620	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000360	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000370	Alive	\N	1217728	1059541	00749c9d7251_000_0000000276_1757999950	420	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000373	Alive	\N	4704799	30459780	00749c9d7251_000_0000000268_1757994665	5700	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000377	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000393	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000400	Alive	\N	3812759	44512018	00749c9d7251_000_0000000272_1757995720	4680	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000419	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000431	Alive	\N	1220603	1063422	00749c9d7251_000_0000000276_1757999950	480	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000434	Alive	\N	4715021	30474149	00749c9d7251_000_0000000268_1757994665	5760	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000436	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000452	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000461	Alive	\N	3813522	44513276	00749c9d7251_000_0000000272_1757995720	4740	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000479	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000491	Alive	\N	1222970	1067863	00749c9d7251_000_0000000276_1757999950	540	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000494	Alive	\N	4735365	30500652	00749c9d7251_000_0000000268_1757994665	5820	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000496	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000512	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000521	Alive	\N	3837189	44541298	00749c9d7251_000_0000000272_1757995720	4800	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000539	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000551	Alive	\N	1239340	1082169	00749c9d7251_000_0000000276_1757999950	600	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000554	Alive	\N	4736614	30502731	00749c9d7251_000_0000000268_1757994665	5880	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000556	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000572	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000581	Alive	\N	3837255	44541410	00749c9d7251_000_0000000272_1757995720	4860	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000600	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000611	Alive	\N	1256771	1111236	00749c9d7251_000_0000000276_1757999950	660	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000614	Alive	\N	4745680	30514699	00749c9d7251_000_0000000268_1757994665	5940	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000616	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000633	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000641	Alive	\N	3837680	44541581	00749c9d7251_000_0000000272_1757995720	4920	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000659	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000671	Alive	\N	1259442	1120198	00749c9d7251_000_0000000276_1757999950	720	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000674	Alive	\N	5150237	31024284	00749c9d7251_000_0000000268_1757994665	6000	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000677	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000693	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000701	Alive	\N	3837680	44541581	00749c9d7251_000_0000000272_1757995720	4980	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000719	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000731	Alive	\N	1272520	1136830	00749c9d7251_000_0000000276_1757999950	780	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000734	Alive	\N	5198561	31086775	00749c9d7251_000_0000000268_1757994665	6060	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000737	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000753	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000761	Alive	\N	3906773	44615373	00749c9d7251_000_0000000272_1757995720	5040	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000779	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000791	Alive	\N	1292793	1167956	00749c9d7251_000_0000000276_1757999950	840	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000794	Alive	\N	5371237	31256167	00749c9d7251_000_0000000268_1757994665	6120	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000797	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000813	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000821	Alive	\N	3915074	44633008	00749c9d7251_000_0000000272_1757995720	5100	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000840	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000851	Alive	\N	1338191	1213479	00749c9d7251_000_0000000276_1757999950	900	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000854	Alive	\N	5530379	31348836	00749c9d7251_000_0000000268_1757994665	6180	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000857	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	8940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000872	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	8940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000880	Alive	\N	3932325	44657476	00749c9d7251_000_0000000272_1757995720	5160	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000899	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000910	Alive	\N	1406332	1303247	00749c9d7251_000_0000000276_1757999950	960	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000913	Alive	\N	5723552	31454558	00749c9d7251_000_0000000268_1757994665	6240	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000916	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000932	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	9000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758000940	Alive	\N	3932391	44657542	00749c9d7251_000_0000000272_1757995720	5220	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758000959	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758000970	Alive	\N	1463504	1421392	00749c9d7251_000_0000000276_1757999950	1020	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758000973	Alive	\N	5818900	31507985	00749c9d7251_000_0000000268_1757994665	6300	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758000976	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758000992	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	9060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758001000	Alive	\N	3938713	44668327	00749c9d7251_000_0000000272_1757995720	5280	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758001019	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758001030	Alive	\N	1489647	1448738	00749c9d7251_000_0000000276_1757999950	1080	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001033	Alive	\N	5833009	31518166	00749c9d7251_000_0000000268_1757994665	6360	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001036	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758001052	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	9120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758001060	Alive	\N	3939017	44668727	00749c9d7251_000_0000000272_1757995720	5340	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758001080	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	4980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758001090	Alive	\N	1551639	1493287	00749c9d7251_000_0000000276_1757999950	1140	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001093	Alive	\N	5855675	31538324	00749c9d7251_000_0000000268_1757994665	6420	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001097	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758001113	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	9180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758001121	Alive	\N	3939165	44669067	00749c9d7251_000_0000000272_1757995720	5400	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758001139	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758001151	Alive	\N	1604601	1530718	00749c9d7251_000_0000000276_1757999950	1200	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001154	Alive	\N	5871670	31551780	00749c9d7251_000_0000000268_1757994665	6480	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001157	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758001173	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	9240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758001181	Alive	\N	4008291	44772260	00749c9d7251_000_0000000272_1757995720	5460	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758001199	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758001211	Alive	\N	1605257	1531552	00749c9d7251_000_0000000276_1757999950	1260	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001214	Alive	\N	5906602	31604178	00749c9d7251_000_0000000268_1757994665	6540	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001217	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758001233	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	9300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758001241	Alive	\N	4052067	44786941	00749c9d7251_000_0000000272_1757995720	5520	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758001259	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758001271	Alive	\N	1635952	1578736	00749c9d7251_000_0000000276_1757999950	1320	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001274	Alive	\N	5930305	31634379	00749c9d7251_000_0000000268_1757994665	6600	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001277	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758001292	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	9360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758001301	Alive	\N	4060644	44818164	00749c9d7251_000_0000000272_1757995720	5580	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758001319	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758001331	Alive	\N	1637358	1581645	00749c9d7251_000_0000000276_1757999950	1380	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001334	Alive	\N	5963380	31671982	00749c9d7251_000_0000000268_1757994665	6660	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001336	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758001352	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	9420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758001361	Alive	\N	4060858	44818570	00749c9d7251_000_0000000272_1757995720	5640	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758001379	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758001391	Alive	\N	1653560	1612746	00749c9d7251_000_0000000276_1757999950	1440	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001394	Alive	\N	6006827	31820194	00749c9d7251_000_0000000268_1757994665	6720	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001396	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758001412	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	9480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758001421	Alive	\N	4067103	44829148	00749c9d7251_000_0000000272_1757995720	5700	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758001440	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
2d2234a5e69d3472	1758001440	Start	\N	\N	\N	00749c65aff0_000_0000000200_0000685570	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	0ef0ebe6c8cf
11b2085f204c6ed4	1758001451	Alive	\N	1669931	1651848	00749c9d7251_000_0000000276_1757999950	1500	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001454	Alive	\N	6046162	31862351	00749c9d7251_000_0000000268_1757994665	6780	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001456	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758001472	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	9540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758001481	Alive	\N	4183303	44989214	00749c9d7251_000_0000000272_1757995720	5760	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758001499	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
2d2234a5e69d3472	1758001500	Alive	\N	0	0	00749c65aff0_000_0000000200_0000685570	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	0ef0ebe6c8cf
11b2085f204c6ed4	1758001511	Alive	\N	1682886	1670676	00749c9d7251_000_0000000276_1757999950	1560	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001514	Alive	\N	6067433	31880731	00749c9d7251_000_0000000268_1757994665	6840	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001517	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758001533	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	9600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758001541	Alive	\N	4183303	44989214	00749c9d7251_000_0000000272_1757995720	5820	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
2d2234a5e69d3472	1758001556	Start	\N	\N	\N	00749c2ddcc0_000_0000000218_0000684518	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	0ef0ebe6c8cf
5bbfde264cba574d	1758001559	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
2d2234a5e69d3472	1758001560	Alive	\N	0	0	00749c65aff0_000_0000000200_0000685570	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	0ef0ebe6c8cf
11b2085f204c6ed4	1758001571	Alive	\N	1683572	1671257	00749c9d7251_000_0000000276_1757999950	1620	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001573	Alive	\N	6106479	31910901	00749c9d7251_000_0000000268_1757994665	6900	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001577	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758001593	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	9660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758001600	Alive	\N	4183525	44989370	00749c9d7251_000_0000000272_1757995720	5880	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
2d2234a5e69d3472	1758001610	Stop	\N	0	0	00749c2ddcc0_000_0000000218_0000684518	53	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	0ef0ebe6c8cf
5bbfde264cba574d	1758001619	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
2d2234a5e69d3472	1758001620	Alive	\N	0	0	00749c65aff0_000_0000000200_0000685570	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	0ef0ebe6c8cf
11b2085f204c6ed4	1758001630	Alive	\N	1998255	5649152	00749c9d7251_000_0000000276_1757999950	1680	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001633	Alive	\N	6154139	31944290	00749c9d7251_000_0000000268_1757994665	6960	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001637	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758001653	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	9720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
2d2234a5e69d3472	1758001654	Start	\N	\N	\N	00749cd49c12_000_0000000020_0000444417	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758001660	Alive	\N	4183525	44989370	00749c9d7251_000_0000000272_1757995720	5940	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758001679	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
2d2234a5e69d3472	1758001680	Alive	\N	0	0	00749c65aff0_000_0000000200_0000685570	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	0ef0ebe6c8cf
11b2085f204c6ed4	1758001690	Alive	\N	3563501	24292838	00749c9d7251_000_0000000276_1757999950	1740	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001693	Alive	\N	6194282	31982193	00749c9d7251_000_0000000268_1757994665	7020	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001697	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758001713	Alive	\N	0	0	00749c64d520_000_0000000168_0000669364	9780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
2d2234a5e69d3472	1758001714	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758001720	Alive	\N	4183813	44989819	00749c9d7251_000_0000000272_1757995720	6000	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
2d2234a5e69d3472	1758001739	Stop	\N	0	0	00749c65aff0_000_0000000200_0000685570	299	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	0ef0ebe6c8cf
5bbfde264cba574d	1758001740	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758001744	Stop	\N	0	0	00749c64d520_000_0000000168_0000669364	9811	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
f23970b34f423357	1758001748	Start	\N	\N	\N	00749c64d520_000_0000000177_0000679179	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758001750	Alive	\N	3580631	24316490	00749c9d7251_000_0000000276_1757999950	1800	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001753	Alive	\N	6225476	32013784	00749c9d7251_000_0000000268_1757994665	7080	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001756	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758001774	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758001780	Alive	\N	4184037	44989975	00749c9d7251_000_0000000272_1757995720	6060	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758001799	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758001808	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758001810	Alive	\N	3619468	24407313	00749c9d7251_000_0000000276_1757999950	1860	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001814	Alive	\N	6270394	32046537	00749c9d7251_000_0000000268_1757994665	7140	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001816	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758001834	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758001841	Alive	\N	4184037	44989975	00749c9d7251_000_0000000272_1757995720	6120	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758001859	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758001868	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758001871	Alive	\N	3626356	24411121	00749c9d7251_000_0000000276_1757999950	1920	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001874	Alive	\N	6417118	32148101	00749c9d7251_000_0000000268_1757994665	7200	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001876	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	9960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758001894	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758001901	Alive	\N	4184037	44989975	00749c9d7251_000_0000000272_1757995720	6180	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758001919	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758001929	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758001931	Alive	\N	3629467	24414018	00749c9d7251_000_0000000276_1757999950	1980	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001934	Alive	\N	6761377	34474010	00749c9d7251_000_0000000268_1757994665	7260	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001937	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758001955	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758001961	Alive	\N	4189737	45005174	00749c9d7251_000_0000000272_1757995720	6240	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758001974	Start	\N	\N	\N	00749c65aff0_000_0000000201_0000686104	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758001980	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758001989	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758001991	Alive	\N	3632993	24416996	00749c9d7251_000_0000000276_1757999950	2040	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758001994	Alive	\N	7336973	36789726	00749c9d7251_000_0000000268_1757994665	7320	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758001997	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002015	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	360	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002021	Alive	\N	4190039	45006115	00749c9d7251_000_0000000272_1757995720	6300	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758002035	Alive	\N	0	0	00749c65aff0_000_0000000201_0000686104	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758002040	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	5940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002049	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002051	Alive	\N	3644631	24434247	00749c9d7251_000_0000000276_1757999950	2100	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002054	Alive	\N	7474659	36976746	00749c9d7251_000_0000000268_1757994665	7380	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002057	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002075	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	420	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002081	Alive	\N	4190039	45006115	00749c9d7251_000_0000000272_1757995720	6360	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758002082	Stop	\N	0	0	00749c65aff0_000_0000000201_0000686104	107	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758002099	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002109	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002111	Alive	\N	3690309	24498486	00749c9d7251_000_0000000276_1757999950	2160	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002114	Alive	\N	7676157	37211972	00749c9d7251_000_0000000268_1757994665	7440	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002117	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002134	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	480	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002141	Alive	\N	4201405	45035174	00749c9d7251_000_0000000272_1757995720	6420	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758002159	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002168	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002171	Alive	\N	3695548	24505215	00749c9d7251_000_0000000276_1757999950	2220	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002174	Alive	\N	7741882	37310433	00749c9d7251_000_0000000268_1757994665	7500	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002176	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002194	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	540	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002201	Alive	\N	4201471	45035174	00749c9d7251_000_0000000272_1757995720	6480	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758002219	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002228	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002231	Alive	\N	3695916	24506678	00749c9d7251_000_0000000276_1757999950	2280	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002234	Alive	\N	7828100	37418244	00749c9d7251_000_0000000268_1757994665	7560	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002236	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002254	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	600	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002261	Alive	\N	4201471	45035174	00749c9d7251_000_0000000272_1757995720	6540	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758002279	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002288	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002291	Alive	\N	3712925	24536889	00749c9d7251_000_0000000276_1757999950	2340	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002294	Alive	\N	7884642	37462443	00749c9d7251_000_0000000268_1757994665	7620	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002296	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002314	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	660	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002320	Alive	\N	4201471	45035174	00749c9d7251_000_0000000272_1757995720	6600	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758002340	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002349	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002350	Alive	\N	3714317	24541120	00749c9d7251_000_0000000276_1757999950	2400	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002353	Alive	\N	8045221	37654205	00749c9d7251_000_0000000268_1757994665	7680	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002357	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002374	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	720	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002380	Alive	\N	4201471	45035174	00749c9d7251_000_0000000272_1757995720	6660	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758002399	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002409	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002410	Alive	\N	3782875	24611827	00749c9d7251_000_0000000276_1757999950	2460	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002413	Alive	\N	8367045	40418722	00749c9d7251_000_0000000268_1757994665	7740	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002417	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002435	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	780	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002440	Alive	\N	4201631	45035330	00749c9d7251_000_0000000272_1757995720	6720	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758002459	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002469	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002470	Alive	\N	3850939	24650772	00749c9d7251_000_0000000276_1757999950	2520	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002473	Alive	\N	8495527	40595960	00749c9d7251_000_0000000268_1757994665	7800	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002477	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002495	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	840	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002500	Alive	\N	4201631	45035330	00749c9d7251_000_0000000272_1757995720	6780	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758002519	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002529	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002530	Alive	\N	4028769	24782482	00749c9d7251_000_0000000276_1757999950	2580	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002533	Alive	\N	8596345	40803712	00749c9d7251_000_0000000268_1757994665	7860	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002537	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002555	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	900	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002561	Alive	\N	4201631	45035330	00749c9d7251_000_0000000272_1757995720	6840	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758002579	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002589	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002591	Alive	\N	4456225	25150423	00749c9d7251_000_0000000276_1757999950	2640	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002594	Alive	\N	8912972	41059860	00749c9d7251_000_0000000268_1757994665	7920	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002597	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002615	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	960	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002621	Alive	\N	4201631	45035330	00749c9d7251_000_0000000272_1757995720	6900	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758002640	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002648	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002651	Alive	\N	4509058	25207489	00749c9d7251_000_0000000276_1757999950	2700	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002654	Alive	\N	9087088	41332006	00749c9d7251_000_0000000268_1757994665	7980	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002656	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002674	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1020	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002681	Alive	\N	4201631	45035330	00749c9d7251_000_0000000272_1757995720	6960	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758002700	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002708	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002711	Alive	\N	5001817	29516798	00749c9d7251_000_0000000276_1757999950	2760	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002714	Alive	\N	9229759	41513729	00749c9d7251_000_0000000268_1757994665	8040	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002716	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002734	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1080	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002741	Alive	\N	4356156	45224610	00749c9d7251_000_0000000272_1757995720	7020	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758002759	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002768	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002771	Alive	\N	5005576	29526685	00749c9d7251_000_0000000276_1757999950	2820	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002774	Alive	\N	9330470	41822524	00749c9d7251_000_0000000268_1757994665	8100	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002776	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002794	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1140	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002801	Alive	\N	4356389	45224856	00749c9d7251_000_0000000272_1757995720	7080	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758002819	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002829	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002831	Alive	\N	5015661	29568313	00749c9d7251_000_0000000276_1757999950	2880	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002834	Alive	\N	9471659	42070306	00749c9d7251_000_0000000268_1757994665	8160	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002837	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002854	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1200	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002861	Alive	\N	4356599	45225134	00749c9d7251_000_0000000272_1757995720	7140	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758002879	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002889	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002891	Alive	\N	5016882	29574916	00749c9d7251_000_0000000276_1757999950	2940	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002894	Alive	\N	9529677	42157798	00749c9d7251_000_0000000268_1757994665	8220	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002897	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	10980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002915	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1260	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002921	Alive	\N	4356743	45225388	00749c9d7251_000_0000000272_1757995720	7200	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758002939	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758002949	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758002951	Alive	\N	5102017	29742410	00749c9d7251_000_0000000276_1757999950	3000	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758002954	Alive	\N	9571304	42218502	00749c9d7251_000_0000000268_1757994665	8280	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758002957	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758002975	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1320	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758002981	Alive	\N	4370146	45242717	00749c9d7251_000_0000000272_1757995720	7260	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758003000	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003009	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003011	Alive	\N	6714772	29866698	00749c9d7251_000_0000000276_1757999950	3060	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003014	Alive	\N	9579020	42238745	00749c9d7251_000_0000000268_1757994665	8340	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003017	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003035	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1380	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003040	Alive	\N	4370644	45244784	00749c9d7251_000_0000000272_1757995720	7320	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758003059	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	6960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003068	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003070	Alive	\N	6752567	29902807	00749c9d7251_000_0000000276_1757999950	3120	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003073	Alive	\N	9877080	64241024	00749c9d7251_000_0000000268_1757994665	8400	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003076	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003095	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1440	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003100	Alive	\N	4723822	61054469	00749c9d7251_000_0000000272_1757995720	7380	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758003119	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	7020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003128	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003130	Alive	\N	6768444	29935973	00749c9d7251_000_0000000276_1757999950	3180	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003133	Alive	\N	9897311	64271726	00749c9d7251_000_0000000268_1757994665	8460	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003136	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003154	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1500	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003160	Alive	\N	4998812	75047000	00749c9d7251_000_0000000272_1757995720	7440	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758003179	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	7080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003188	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003190	Alive	\N	6770793	29938656	00749c9d7251_000_0000000276_1757999950	3240	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003193	Alive	\N	9943705	64338521	00749c9d7251_000_0000000268_1757994665	8520	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003196	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003214	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1560	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003220	Alive	\N	5400352	104713050	00749c9d7251_000_0000000272_1757995720	7500	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758003239	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	7140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003249	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003250	Alive	\N	6797657	30006329	00749c9d7251_000_0000000276_1757999950	3300	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003253	Alive	\N	9986297	64386878	00749c9d7251_000_0000000268_1757994665	8580	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003257	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003274	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1620	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003281	Alive	\N	5692430	127934887	00749c9d7251_000_0000000272_1757995720	7560	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758003300	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	7200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003309	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003311	Alive	\N	6814255	30077227	00749c9d7251_000_0000000276_1757999950	3360	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003314	Alive	\N	10073996	64562904	00749c9d7251_000_0000000268_1757994665	8640	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003317	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003334	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1680	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003341	Alive	\N	5697150	127938699	00749c9d7251_000_0000000272_1757995720	7620	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758003359	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	7260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003369	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003371	Alive	\N	6827345	30088283	00749c9d7251_000_0000000276_1757999950	3420	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003374	Alive	\N	18903682	64874340	00749c9d7251_000_0000000268_1757994665	8700	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003377	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003395	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1740	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003401	Alive	\N	5953148	138273792	00749c9d7251_000_0000000272_1757995720	7680	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758003419	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	7320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003429	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003431	Alive	\N	6830717	30088717	00749c9d7251_000_0000000276_1757999950	3480	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003434	Alive	\N	27755811	65114793	00749c9d7251_000_0000000268_1757994665	8760	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003437	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003455	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1800	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003461	Alive	\N	5961839	138313329	00749c9d7251_000_0000000272_1757995720	7740	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758003479	Alive	\N	0	0	00749c65aff0_000_0000000191_0000680229	7380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
5bbfde264cba574d	1758003487	Start	\N	\N	\N	00749c65a0c4_000_0000000051_1758003473	\N	\N	\N	2	0.0.0.0	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003488	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003491	Alive	\N	6831254	30089168	00749c9d7251_000_0000000276_1757999950	3540	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003494	Alive	\N	27881592	65479290	00749c9d7251_000_0000000268_1757994665	8820	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003496	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
5bbfde264cba574d	1758003514	Stop	\N	0	0	00749c65aff0_000_0000000191_0000680229	7415	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
2d2234a5e69d3472	1758003515	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1860	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003521	Alive	\N	5961839	138313329	00749c9d7251_000_0000000272_1757995720	7800	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
5bbfde264cba574d	1758003542	Alive	\N	59353	62034	00749c65a0c4_000_0000000051_1758003473	60	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003548	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003551	Alive	\N	7029330	30218599	00749c9d7251_000_0000000276_1757999950	3600	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003554	Alive	\N	28128191	65868608	00749c9d7251_000_0000000268_1757994665	8880	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003556	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003574	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1920	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003581	Alive	\N	5962311	138315203	00749c9d7251_000_0000000272_1757995720	7860	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758003586	Start	\N	\N	\N	00749c65aff0_000_0000000202_0000687716	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758003602	Alive	\N	84891	79511	00749c65a0c4_000_0000000051_1758003473	120	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003608	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003611	Alive	\N	7142172	30766028	00749c9d7251_000_0000000276_1757999950	3660	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003614	Alive	\N	28203601	65916698	00749c9d7251_000_0000000268_1757994665	8940	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003616	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003634	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	1980	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003641	Alive	\N	6789040	156747139	00749c9d7251_000_0000000272_1757995720	7920	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758003646	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758003662	Alive	\N	111995	132751	00749c65a0c4_000_0000000051_1758003473	180	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003669	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003671	Alive	\N	7210510	30808291	00749c9d7251_000_0000000276_1757999950	3720	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003674	Alive	\N	28281331	66009269	00749c9d7251_000_0000000268_1757994665	9000	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003677	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003694	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	2040	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003701	Alive	\N	7604761	163649488	00749c9d7251_000_0000000272_1757995720	7980	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758003706	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758003722	Alive	\N	280572	534166	00749c65a0c4_000_0000000051_1758003473	240	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003729	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	1980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003731	Alive	\N	7256746	30875813	00749c9d7251_000_0000000276_1757999950	3780	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003734	Alive	\N	28560985	67182285	00749c9d7251_000_0000000268_1757994665	9060	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003737	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003754	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	2100	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003760	Alive	\N	7976620	169709965	00749c9d7251_000_0000000272_1757995720	8040	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758003766	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758003783	Alive	\N	292889	541882	00749c65a0c4_000_0000000051_1758003473	300	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003789	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003790	Alive	\N	7278770	30911074	00749c9d7251_000_0000000276_1757999950	3840	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003793	Alive	\N	28791127	69469699	00749c9d7251_000_0000000268_1757994665	9120	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003797	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003814	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	2160	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003820	Alive	\N	7977479	169711250	00749c9d7251_000_0000000272_1757995720	8100	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758003826	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758003843	Alive	\N	505066	3854797	00749c65a0c4_000_0000000051_1758003473	360	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003849	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003850	Alive	\N	7322323	31037648	00749c9d7251_000_0000000276_1757999950	3900	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003853	Alive	\N	28940000	71082721	00749c9d7251_000_0000000268_1757994665	9180	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003857	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	11940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003875	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	2220	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003880	Alive	\N	7999836	169736481	00749c9d7251_000_0000000272_1757995720	8160	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758003887	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758003902	Alive	\N	548870	3872069	00749c65a0c4_000_0000000051_1758003473	420	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003908	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003910	Alive	\N	7340152	31097295	00749c9d7251_000_0000000276_1757999950	3960	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003913	Alive	\N	29062980	71292500	00749c9d7251_000_0000000268_1757994665	9240	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003916	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003935	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	2280	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758003940	Alive	\N	7999836	169736481	00749c9d7251_000_0000000272_1757995720	8220	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758003947	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758003962	Alive	\N	563507	3881370	00749c65a0c4_000_0000000051_1758003473	480	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758003968	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758003970	Alive	\N	7351075	31121386	00749c9d7251_000_0000000276_1757999950	4020	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758003973	Alive	\N	29229019	72312690	00749c9d7251_000_0000000268_1757994665	9300	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758003976	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758003995	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	2340	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758004001	Alive	\N	8000026	169736730	00749c9d7251_000_0000000272_1757995720	8280	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004006	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004022	Alive	\N	620850	3932701	00749c65a0c4_000_0000000051_1758003473	540	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758004028	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758004031	Alive	\N	7398145	31185631	00749c9d7251_000_0000000276_1757999950	4080	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004034	Alive	\N	29385810	74379312	00749c9d7251_000_0000000268_1757994665	9360	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004036	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758004055	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	2400	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758004061	Alive	\N	8000026	169736730	00749c9d7251_000_0000000272_1757995720	8340	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004066	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004082	Alive	\N	647723	3948155	00749c65a0c4_000_0000000051_1758003473	600	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758004089	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758004091	Alive	\N	7407513	31229492	00749c9d7251_000_0000000276_1757999950	4140	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004094	Alive	\N	29515511	75443507	00749c9d7251_000_0000000268_1757994665	9420	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004097	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758004114	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	2460	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758004121	Alive	\N	8000026	169736730	00749c9d7251_000_0000000272_1757995720	8400	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004126	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004142	Alive	\N	701512	4008527	00749c65a0c4_000_0000000051_1758003473	660	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758004149	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758004151	Alive	\N	7467083	31267308	00749c9d7251_000_0000000276_1757999950	4200	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004154	Alive	\N	29596455	75503090	00749c9d7251_000_0000000268_1757994665	9480	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004157	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758004174	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	2520	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758004181	Alive	\N	8000281	169737057	00749c9d7251_000_0000000272_1757995720	8460	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004186	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004202	Alive	\N	737388	4029076	00749c65a0c4_000_0000000051_1758003473	720	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758004209	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758004211	Alive	\N	7481668	31284094	00749c9d7251_000_0000000276_1757999950	4260	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004214	Alive	\N	29780172	77462748	00749c9d7251_000_0000000268_1757994665	9540	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004217	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
2d2234a5e69d3472	1758004234	Alive	\N	0	0	00749cd49c12_000_0000000020_0000444417	2580	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758004241	Alive	\N	8017066	169780762	00749c9d7251_000_0000000272_1757995720	8520	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
2d2234a5e69d3472	1758004241	Stop	\N	0	0	00749cd49c12_000_0000000020_0000444417	2587	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758004247	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004262	Alive	\N	912905	4796468	00749c65a0c4_000_0000000051_1758003473	780	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758004269	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758004271	Alive	\N	7665954	31849553	00749c9d7251_000_0000000276_1757999950	4320	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004274	Alive	\N	29872464	79356142	00749c9d7251_000_0000000268_1757994665	9600	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004277	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
894b9f677008c9fd	1758004301	Alive	\N	8017066	169780762	00749c9d7251_000_0000000272_1757995720	8580	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004307	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004323	Alive	\N	936014	4820927	00749c65a0c4_000_0000000051_1758003473	840	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758004328	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758004331	Alive	\N	8213005	38020334	00749c9d7251_000_0000000276_1757999950	4380	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004334	Alive	\N	30010038	80139614	00749c9d7251_000_0000000268_1757994665	9660	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004336	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
894b9f677008c9fd	1758004361	Alive	\N	8026072	169825973	00749c9d7251_000_0000000272_1757995720	8640	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004366	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004383	Alive	\N	956805	4831443	00749c65a0c4_000_0000000051_1758003473	900	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758004388	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758004391	Alive	\N	8467384	40625007	00749c9d7251_000_0000000276_1757999950	4440	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004394	Alive	\N	30285391	80278892	00749c9d7251_000_0000000268_1757994665	9720	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004396	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
894b9f677008c9fd	1758004421	Alive	\N	8061662	169910087	00749c9d7251_000_0000000272_1757995720	8700	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004426	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004442	Alive	\N	965995	4835599	00749c65a0c4_000_0000000051_1758003473	960	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758004448	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758004451	Alive	\N	8503718	40680112	00749c9d7251_000_0000000276_1757999950	4500	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004454	Alive	\N	30533409	81501540	00749c9d7251_000_0000000268_1757994665	9780	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004456	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
894b9f677008c9fd	1758004480	Alive	\N	8069594	169926112	00749c9d7251_000_0000000272_1757995720	8760	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004486	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004502	Alive	\N	1026304	4883208	00749c65a0c4_000_0000000051_1758003473	1020	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758004509	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758004510	Alive	\N	8538115	40740211	00749c9d7251_000_0000000276_1757999950	4560	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004513	Alive	\N	30629763	83461637	00749c9d7251_000_0000000268_1757994665	9840	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004517	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
894b9f677008c9fd	1758004540	Alive	\N	8069594	169926112	00749c9d7251_000_0000000272_1757995720	8820	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004547	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004562	Alive	\N	1049649	4892439	00749c65a0c4_000_0000000051_1758003473	1080	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758004569	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758004570	Alive	\N	8748475	41210140	00749c9d7251_000_0000000276_1757999950	4620	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004573	Alive	\N	30711495	83528150	00749c9d7251_000_0000000268_1757994665	9900	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004577	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
894b9f677008c9fd	1758004600	Alive	\N	8337176	170672006	00749c9d7251_000_0000000272_1757995720	8880	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004607	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004622	Alive	\N	1062839	4903513	00749c65a0c4_000_0000000051_1758003473	1140	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758004629	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758004630	Alive	\N	8891057	41363281	00749c9d7251_000_0000000276_1757999950	4680	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004633	Alive	\N	30879956	85103223	00749c9d7251_000_0000000268_1757994665	9960	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004637	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
894b9f677008c9fd	1758004660	Alive	\N	8354083	170695805	00749c9d7251_000_0000000272_1757995720	8940	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004666	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004682	Alive	\N	1070811	4912930	00749c65a0c4_000_0000000051_1758003473	1200	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758004689	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	2940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758004690	Alive	\N	9085704	50891477	00749c9d7251_000_0000000276_1757999950	4740	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004693	Alive	\N	31467926	88693094	00749c9d7251_000_0000000268_1757994665	10020	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004696	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
894b9f677008c9fd	1758004721	Alive	\N	8362506	170703793	00749c9d7251_000_0000000272_1757995720	9000	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004726	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004742	Alive	\N	1113944	4958748	00749c65a0c4_000_0000000051_1758003473	1260	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758004748	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	3000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758004751	Alive	\N	9164255	50971829	00749c9d7251_000_0000000276_1757999950	4800	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004754	Alive	\N	32554262	95110508	00749c9d7251_000_0000000268_1757994665	10080	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004756	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758004762	Start	\N	\N	\N	00749c658aa8_000_0000000264_0011848824	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758004781	Alive	\N	8367536	170707525	00749c9d7251_000_0000000272_1757995720	9060	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004786	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004802	Alive	\N	1122564	4966169	00749c65a0c4_000_0000000051_1758003473	1320	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
f23970b34f423357	1758004808	Alive	\N	0	0	00749c64d520_000_0000000177_0000679179	3060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758004811	Alive	\N	9328813	51210255	00749c9d7251_000_0000000276_1757999950	4860	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004814	Alive	\N	33267192	111698996	00749c9d7251_000_0000000268_1757994665	10140	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004816	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758004818	Stop	\N	0	0	00749c64d520_000_0000000177_0000679179	3069	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
006d31b5b9ad4108	1758004822	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758004841	Alive	\N	8367536	170707525	00749c9d7251_000_0000000272_1757995720	9120	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004846	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004863	Alive	\N	1143047	4973950	00749c65a0c4_000_0000000051_1758003473	1380	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758004871	Alive	\N	9390368	51265880	00749c9d7251_000_0000000276_1757999950	4920	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004874	Alive	\N	33768897	131399295	00749c9d7251_000_0000000268_1757994665	10200	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004877	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	12960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758004882	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758004901	Alive	\N	8367697	170707696	00749c9d7251_000_0000000272_1757995720	9180	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004906	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004923	Alive	\N	1165484	5116825	00749c65a0c4_000_0000000051_1758003473	1440	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758004931	Alive	\N	9441857	51389976	00749c9d7251_000_0000000276_1757999950	4980	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004934	Alive	\N	34014250	135837515	00749c9d7251_000_0000000268_1757994665	10260	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004937	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758004942	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758004961	Alive	\N	8389055	170774994	00749c9d7251_000_0000000272_1757995720	9240	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758004967	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758004982	Alive	\N	1172950	5122118	00749c65a0c4_000_0000000051_1758003473	1500	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758004991	Alive	\N	9755586	51641066	00749c9d7251_000_0000000276_1757999950	5040	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758004994	Alive	\N	34310200	140142979	00749c9d7251_000_0000000268_1757994665	10320	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758004997	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005003	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005021	Alive	\N	8390396	170787047	00749c9d7251_000_0000000272_1757995720	9300	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005026	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758005042	Alive	\N	1186904	5133754	00749c65a0c4_000_0000000051_1758003473	1560	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758005051	Alive	\N	10177013	51931501	00749c9d7251_000_0000000276_1757999950	5100	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005054	Alive	\N	35154438	149495326	00749c9d7251_000_0000000268_1757994665	10380	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005057	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005063	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005081	Alive	\N	8399738	170800555	00749c9d7251_000_0000000272_1757995720	9360	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005086	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758005102	Alive	\N	1198785	5147074	00749c65a0c4_000_0000000051_1758003473	1620	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758005111	Alive	\N	10525411	62632430	00749c9d7251_000_0000000276_1757999950	5160	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005114	Alive	\N	35368790	150556298	00749c9d7251_000_0000000268_1757994665	10440	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005116	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005122	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	360	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005141	Alive	\N	8399738	170800555	00749c9d7251_000_0000000272_1757995720	9420	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005146	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758005162	Alive	\N	1219782	5156573	00749c65a0c4_000_0000000051_1758003473	1680	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758005171	Alive	\N	15859649	62900286	00749c9d7251_000_0000000276_1757999950	5220	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005174	Alive	\N	35923453	153651367	00749c9d7251_000_0000000268_1757994665	10500	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005176	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005182	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	420	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005200	Alive	\N	8419127	170863566	00749c9d7251_000_0000000272_1757995720	9480	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005206	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758005222	Alive	\N	1229614	5162101	00749c65a0c4_000_0000000051_1758003473	1740	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758005230	Alive	\N	16009134	63131009	00749c9d7251_000_0000000276_1757999950	5280	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005233	Alive	\N	36138421	156324472	00749c9d7251_000_0000000268_1757994665	10560	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005236	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005242	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	480	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005260	Alive	\N	8420541	170865538	00749c9d7251_000_0000000272_1757995720	9540	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005267	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758005282	Alive	\N	1239949	5169178	00749c65a0c4_000_0000000051_1758003473	1800	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758005290	Alive	\N	18052568	67487836	00749c9d7251_000_0000000276_1757999950	5340	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005293	Alive	\N	36255870	157880260	00749c9d7251_000_0000000268_1757994665	10620	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005297	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005303	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	540	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005320	Alive	\N	8421161	170866414	00749c9d7251_000_0000000272_1757995720	9600	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005327	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758005343	Alive	\N	1252279	5176516	00749c65a0c4_000_0000000051_1758003473	1860	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758005350	Alive	\N	20283594	68719562	00749c9d7251_000_0000000276_1757999950	5400	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005353	Alive	\N	36378976	160324193	00749c9d7251_000_0000000268_1757994665	10680	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005357	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005363	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	600	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005380	Alive	\N	8696474	180835960	00749c9d7251_000_0000000272_1757995720	9660	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005386	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758005403	Alive	\N	1472098	6619649	00749c65a0c4_000_0000000051_1758003473	1920	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758005410	Alive	\N	20316285	68767722	00749c9d7251_000_0000000276_1757999950	5460	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005413	Alive	\N	36486925	162994680	00749c9d7251_000_0000000268_1757994665	10740	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005417	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005422	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	660	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005441	Alive	\N	8843309	188591343	00749c9d7251_000_0000000272_1757995720	9720	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005446	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758005462	Alive	\N	2296074	9858354	00749c65a0c4_000_0000000051_1758003473	1980	\N	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758005471	Alive	\N	20403987	68926156	00749c9d7251_000_0000000276_1757999950	5520	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005474	Alive	\N	36609175	165432427	00749c9d7251_000_0000000268_1757994665	10800	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005477	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005482	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	720	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005501	Alive	\N	9154270	205429794	00749c9d7251_000_0000000272_1757995720	9780	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005506	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758005515	Stop	\N	2296074	9858354	00749c65a0c4_000_0000000051_1758003473	2033	User-Request	\N	2	10.51.0.59	\N	\N	\N	\N	00749c65a0c4:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758005531	Alive	\N	20442211	68978321	00749c9d7251_000_0000000276_1757999950	5580	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005534	Alive	\N	37109027	169767325	00749c9d7251_000_0000000268_1757994665	10860	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005536	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005542	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	780	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005561	Alive	\N	9381925	224563789	00749c9d7251_000_0000000272_1757995720	9840	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005567	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	1980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758005570	Start	\N	\N	\N	00749c2ddcc0_000_0000000219_0000688532	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758005591	Alive	\N	20508562	69061624	00749c9d7251_000_0000000276_1757999950	5640	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005594	Alive	\N	38839256	171451746	00749c9d7251_000_0000000268_1757994665	10920	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005596	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005603	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	840	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005621	Alive	\N	9382057	224563994	00749c9d7251_000_0000000272_1757995720	9900	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005627	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758005630	Alive	\N	0	0	00749c2ddcc0_000_0000000219_0000688532	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
f23970b34f423357	1758005644	Start	\N	\N	\N	00749c64d520_000_0000000178_0000683075	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758005651	Alive	\N	20636680	69169293	00749c9d7251_000_0000000276_1757999950	5700	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005654	Alive	\N	39865186	199309392	00749c9d7251_000_0000000268_1757994665	10980	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005656	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005663	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	900	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005681	Alive	\N	9382619	224564479	00749c9d7251_000_0000000272_1757995720	9960	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005686	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758005690	Alive	\N	0	0	00749c2ddcc0_000_0000000219_0000688532	120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
f23970b34f423357	1758005705	Alive	\N	0	0	00749c64d520_000_0000000178_0000683075	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758005711	Alive	\N	20706576	69288325	00749c9d7251_000_0000000276_1757999950	5760	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005714	Alive	\N	40080501	211874054	00749c9d7251_000_0000000268_1757994665	11040	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005717	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005722	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	960	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005741	Alive	\N	9382912	224564716	00749c9d7251_000_0000000272_1757995720	10020	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005746	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758005750	Alive	\N	0	0	00749c2ddcc0_000_0000000219_0000688532	180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
f23970b34f423357	1758005765	Alive	\N	0	0	00749c64d520_000_0000000178_0000683075	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758005771	Alive	\N	20717376	69313468	00749c9d7251_000_0000000276_1757999950	5820	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005774	Alive	\N	40211755	216747048	00749c9d7251_000_0000000268_1757994665	11100	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005777	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13860	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005782	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1020	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005801	Alive	\N	9810193	237816926	00749c9d7251_000_0000000272_1757995720	10080	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005806	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758005810	Alive	\N	0	0	00749c2ddcc0_000_0000000219_0000688532	240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
f23970b34f423357	1758005825	Alive	\N	0	0	00749c64d520_000_0000000178_0000683075	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758005831	Alive	\N	20731134	69337276	00749c9d7251_000_0000000276_1757999950	5880	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005834	Alive	\N	40330796	221443000	00749c9d7251_000_0000000268_1757994665	11160	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005837	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13920	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005842	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1080	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005861	Alive	\N	9810589	237817124	00749c9d7251_000_0000000272_1757995720	10140	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005867	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758005871	Alive	\N	0	0	00749c2ddcc0_000_0000000219_0000688532	300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
f23970b34f423357	1758005885	Alive	\N	0	0	00749c64d520_000_0000000178_0000683075	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758005890	Alive	\N	20798537	69429245	00749c9d7251_000_0000000276_1757999950	5940	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005893	Alive	\N	40416156	224868774	00749c9d7251_000_0000000268_1757994665	11220	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005897	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	13980	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005903	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1140	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005920	Alive	\N	9810589	237817124	00749c9d7251_000_0000000272_1757995720	10200	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005926	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758005931	Alive	\N	0	0	00749c2ddcc0_000_0000000219_0000688532	360	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
f23970b34f423357	1758005936	Stop	\N	0	0	00749c2ddcc0_000_0000000219_0000688532	365	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
f23970b34f423357	1758005944	Alive	\N	0	0	00749c64d520_000_0000000178_0000683075	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758005950	Alive	\N	20908533	69505683	00749c9d7251_000_0000000276_1757999950	6000	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758005953	Alive	\N	40563125	229079018	00749c9d7251_000_0000000268_1757994665	11280	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758005956	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	14040	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758005963	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1200	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758005980	Alive	\N	9810589	237817124	00749c9d7251_000_0000000272_1757995720	10260	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758005986	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758006004	Alive	\N	0	0	00749c64d520_000_0000000178_0000683075	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758006010	Alive	\N	20936668	69568649	00749c9d7251_000_0000000276_1757999950	6060	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758006013	Alive	\N	40674631	232022802	00749c9d7251_000_0000000268_1757994665	11340	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758006016	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	14100	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758006023	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1260	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758006040	Alive	\N	9810589	237817124	00749c9d7251_000_0000000272_1757995720	10320	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006046	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758006064	Alive	\N	0	0	00749c64d520_000_0000000178_0000683075	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758006070	Alive	\N	20937036	69568927	00749c9d7251_000_0000000276_1757999950	6120	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758006073	Alive	\N	40777288	236529500	00749c9d7251_000_0000000268_1757994665	11400	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758006076	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	14160	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758006082	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1320	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758006100	Alive	\N	9810751	237817280	00749c9d7251_000_0000000272_1757995720	10380	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006106	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758006125	Alive	\N	0	0	00749c64d520_000_0000000178_0000683075	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758006131	Alive	\N	21082698	69693036	00749c9d7251_000_0000000276_1757999950	6180	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758006134	Alive	\N	41012168	240438596	00749c9d7251_000_0000000268_1757994665	11460	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758006137	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	14220	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758006142	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1380	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758006161	Alive	\N	9810751	237817280	00749c9d7251_000_0000000272_1757995720	10440	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006167	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758006185	Alive	\N	0	0	00749c64d520_000_0000000178_0000683075	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758006191	Alive	\N	21209056	69865863	00749c9d7251_000_0000000276_1757999950	6240	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758006194	Alive	\N	41541788	240772252	00749c9d7251_000_0000000268_1757994665	11520	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758006197	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	14280	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758006203	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1440	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758006221	Alive	\N	9810751	237817280	00749c9d7251_000_0000000272_1757995720	10500	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006227	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758006245	Alive	\N	0	0	00749c64d520_000_0000000178_0000683075	600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758006251	Alive	\N	21339456	69959469	00749c9d7251_000_0000000276_1757999950	6300	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758006254	Alive	\N	41827110	240975135	00749c9d7251_000_0000000268_1757994665	11580	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758006257	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	14340	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758006263	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1500	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758006281	Alive	\N	9810751	237817280	00749c9d7251_000_0000000272_1757995720	10560	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006286	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758006305	Alive	\N	0	0	00749c64d520_000_0000000178_0000683075	660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758006311	Alive	\N	21339918	69959903	00749c9d7251_000_0000000276_1757999950	6360	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
f23970b34f423357	1758006313	Start	\N	\N	\N	00749c65aff0_000_0000000203_0000690443	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	720a6db864d4
01d5e8df-8722-4f42-80f3-605093960553	1758006314	Alive	\N	42244864	241183917	00749c9d7251_000_0000000268_1757994665	11640	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758006317	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	14400	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758006322	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1560	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758006341	Alive	\N	9875531	237865495	00749c9d7251_000_0000000272_1757995720	10620	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006346	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758006364	Alive	\N	0	0	00749c64d520_000_0000000178_0000683075	720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758006371	Alive	\N	21362909	69977488	00749c9d7251_000_0000000276_1757999950	6420	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
f23970b34f423357	1758006372	Alive	\N	0	0	00749c65aff0_000_0000000203_0000690443	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	720a6db864d4
01d5e8df-8722-4f42-80f3-605093960553	1758006374	Alive	\N	46588067	519043663	00749c9d7251_000_0000000268_1757994665	11700	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758006376	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	14460	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
006d31b5b9ad4108	1758006382	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1620	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758006401	Alive	\N	10363993	241055276	00749c9d7251_000_0000000272_1757995720	10680	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006406	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2820	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758006424	Alive	\N	0	0	00749c64d520_000_0000000178_0000683075	780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758006431	Alive	\N	21363277	69977766	00749c9d7251_000_0000000276_1757999950	6480	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
836ca3f6e7df20a1	1758006432	Start	\N	\N	\N	00749c2ddcc0_000_0000000220_0000689394	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758006433	Alive	\N	0	0	00749c65aff0_000_0000000203_0000690443	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	720a6db864d4
01d5e8df-8722-4f42-80f3-605093960553	1758006434	Alive	\N	48785583	678272688	00749c9d7251_000_0000000268_1757994665	11760	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758006436	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	14520	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758006439	Start	\N	\N	\N	00749c2ddcc0_000_0000000221_0000689401	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
006d31b5b9ad4108	1758006442	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1680	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758006461	Alive	\N	10548036	244205693	00749c9d7251_000_0000000272_1757995720	10740	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006467	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2880	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
f23970b34f423357	1758006484	Alive	\N	0	0	00749c64d520_000_0000000178_0000683075	840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
11b2085f204c6ed4	1758006491	Alive	\N	21366478	69988108	00749c9d7251_000_0000000276_1757999950	6540	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
f23970b34f423357	1758006493	Alive	\N	0	0	00749c65aff0_000_0000000203_0000690443	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	720a6db864d4
836ca3f6e7df20a1	1758006493	Alive	\N	0	0	00749c2ddcc0_000_0000000220_0000689394	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	7ad0dfe16c5b
01d5e8df-8722-4f42-80f3-605093960553	1758006494	Alive	\N	48897542	678333589	00749c9d7251_000_0000000268_1757994665	11820	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758006496	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	14580	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758006499	Alive	\N	0	0	00749c2ddcc0_000_0000000221_0000689401	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
006d31b5b9ad4108	1758006503	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1740	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
f23970b34f423357	1758006505	Stop	\N	0	0	00749c64d520_000_0000000178_0000683075	860	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758006521	Alive	\N	11066737	273365099	00749c9d7251_000_0000000272_1757995720	10800	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006527	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	2940	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
836ca3f6e7df20a1	1758006537	Stop	\N	0	0	00749c2ddcc0_000_0000000220_0000689394	104	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	7ad0dfe16c5b
11b2085f204c6ed4	1758006551	Alive	\N	21434022	70054546	00749c9d7251_000_0000000276_1757999950	6600	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
f23970b34f423357	1758006552	Alive	\N	0	0	00749c65aff0_000_0000000203_0000690443	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	720a6db864d4
01d5e8df-8722-4f42-80f3-605093960553	1758006554	Alive	\N	48921930	678370305	00749c9d7251_000_0000000268_1757994665	11880	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758006557	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	14640	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758006559	Alive	\N	0	0	00749c2ddcc0_000_0000000221_0000689401	120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
006d31b5b9ad4108	1758006563	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1800	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758006581	Alive	\N	11083644	273395948	00749c9d7251_000_0000000272_1757995720	10860	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006586	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3000	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758006610	Alive	\N	21449277	70070573	00749c9d7251_000_0000000276_1757999950	6660	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
f23970b34f423357	1758006612	Alive	\N	0	0	00749c65aff0_000_0000000203_0000690443	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	720a6db864d4
01d5e8df-8722-4f42-80f3-605093960553	1758006613	Alive	\N	50282529	741657563	00749c9d7251_000_0000000268_1757994665	11940	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758006617	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	14700	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758006618	Alive	\N	0	0	00749c2ddcc0_000_0000000221_0000689401	180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
006d31b5b9ad4108	1758006622	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1860	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758006640	Alive	\N	11092662	273398987	00749c9d7251_000_0000000272_1757995720	10920	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006646	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3060	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758006670	Alive	\N	21449966	70071178	00749c9d7251_000_0000000276_1757999950	6720	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
f23970b34f423357	1758006672	Alive	\N	0	0	00749c65aff0_000_0000000203_0000690443	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	720a6db864d4
01d5e8df-8722-4f42-80f3-605093960553	1758006673	Alive	\N	51946668	801316321	00749c9d7251_000_0000000268_1757994665	12000	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
836ca3f6e7df20a1	1758006677	Alive	\N	0	0	00749c64d520_000_0000000167_0000669348	14760	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
f23970b34f423357	1758006678	Alive	\N	0	0	00749c2ddcc0_000_0000000221_0000689401	240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
006d31b5b9ad4108	1758006683	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1920	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
836ca3f6e7df20a1	1758006699	Stop	\N	0	0	00749c64d520_000_0000000167_0000669348	14782	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c64d520:ZEEP Wifi	7ad0dfe16c5b
894b9f677008c9fd	1758006700	Alive	\N	11201278	274040478	00749c9d7251_000_0000000272_1757995720	10980	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
f23970b34f423357	1758006702	Stop	\N	0	0	00749c65aff0_000_0000000203_0000690443	390	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	720a6db864d4
9b86d526c5afa7cb	1758006706	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758006730	Alive	\N	21458693	70076482	00749c9d7251_000_0000000276_1757999950	6780	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758006733	Alive	\N	54081972	941174891	00749c9d7251_000_0000000268_1757994665	12060	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
f23970b34f423357	1758006738	Alive	\N	0	0	00749c2ddcc0_000_0000000221_0000689401	300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
006d31b5b9ad4108	1758006743	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	1980	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758006760	Alive	\N	11243081	274088173	00749c9d7251_000_0000000272_1757995720	11040	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006767	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758006790	Alive	\N	21459061	70076826	00749c9d7251_000_0000000276_1757999950	6840	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758006793	Alive	\N	61895087	1411694568	00749c9d7251_000_0000000268_1757994665	12120	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
f23970b34f423357	1758006799	Alive	\N	0	0	00749c2ddcc0_000_0000000221_0000689401	360	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
006d31b5b9ad4108	1758006802	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2040	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
f23970b34f423357	1758006806	Stop	\N	0	0	00749c2ddcc0_000_0000000221_0000689401	367	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c2ddcc0:ZEEP Wifi	720a6db864d4
894b9f677008c9fd	1758006821	Alive	\N	11456025	276670741	00749c9d7251_000_0000000272_1757995720	11100	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006827	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758006851	Alive	\N	21460116	70077797	00749c9d7251_000_0000000276_1757999950	6900	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758006854	Alive	\N	65082600	1645341628	00749c9d7251_000_0000000268_1757994665	12180	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758006862	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2100	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
894b9f677008c9fd	1758006881	Alive	\N	11524577	276745530	00749c9d7251_000_0000000272_1757995720	11160	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006886	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758006911	Alive	\N	21460644	70078231	00749c9d7251_000_0000000276_1757999950	6960	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758006914	Alive	\N	65264813	1646152197	00749c9d7251_000_0000000268_1757994665	12240	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758006922	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2160	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758006939	Start	\N	\N	\N	00749cd49c12_000_0000000021_0000449702	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758006941	Alive	\N	11534359	276754930	00749c9d7251_000_0000000272_1757995720	11220	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758006946	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758006971	Alive	\N	21463773	70079958	00749c9d7251_000_0000000276_1757999950	7020	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758006974	Alive	\N	69431501	1884178822	00749c9d7251_000_0000000268_1757994665	12300	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758006983	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2220	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007000	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	60	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758007001	Alive	\N	11535684	276756405	00749c9d7251_000_0000000272_1757995720	11280	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758007006	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758007031	Alive	\N	21572477	70630846	00749c9d7251_000_0000000276_1757999950	7080	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
11b2085f204c6ed4	1758007450	Alive	\N	21590090	70654678	00749c9d7251_000_0000000276_1757999950	7500	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007034	Alive	\N	69642575	1886161625	00749c9d7251_000_0000000268_1757994665	12360	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007043	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2280	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007060	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758007061	Alive	\N	11563848	276783048	00749c9d7251_000_0000000272_1757995720	11340	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758007066	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758007091	Alive	\N	21578146	70642528	00749c9d7251_000_0000000276_1757999950	7140	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007094	Alive	\N	69897619	1887834322	00749c9d7251_000_0000000268_1757994665	12420	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007102	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2340	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007120	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758007121	Alive	\N	11565508	276784726	00749c9d7251_000_0000000272_1757995720	11400	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758007127	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758007151	Alive	\N	21578514	70642948	00749c9d7251_000_0000000276_1757999950	7200	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007154	Alive	\N	69974114	1887968002	00749c9d7251_000_0000000268_1757994665	12480	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007162	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2400	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007180	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758007181	Alive	\N	11566791	276786568	00749c9d7251_000_0000000272_1757995720	11460	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758007186	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758007211	Alive	\N	21587274	70652210	00749c9d7251_000_0000000276_1757999950	7260	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007214	Alive	\N	70539823	1898244960	00749c9d7251_000_0000000268_1757994665	12540	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007223	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2460	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007239	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758007241	Alive	\N	11574886	276799908	00749c9d7251_000_0000000272_1757995720	11520	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758007246	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758007271	Alive	\N	21587642	70652488	00749c9d7251_000_0000000276_1757999950	7320	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007274	Alive	\N	71585068	1939561769	00749c9d7251_000_0000000268_1757994665	12600	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007283	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2520	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007299	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	360	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758007300	Alive	\N	11575996	276801291	00749c9d7251_000_0000000272_1757995720	11580	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758007306	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758007330	Alive	\N	21589036	70653744	00749c9d7251_000_0000000276_1757999950	7380	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007333	Alive	\N	72201416	1940155544	00749c9d7251_000_0000000268_1757994665	12660	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007343	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2580	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007359	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	420	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758007360	Alive	\N	11590420	276820574	00749c9d7251_000_0000000272_1757995720	11640	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758007366	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758007390	Alive	\N	21589564	70654244	00749c9d7251_000_0000000276_1757999950	7440	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007393	Alive	\N	75082286	2063943774	00749c9d7251_000_0000000268_1757994665	12720	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007402	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2640	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007419	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	480	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758007420	Alive	\N	11606743	276839296	00749c9d7251_000_0000000272_1757995720	11700	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758007427	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
01d5e8df-8722-4f42-80f3-605093960553	1758007453	Alive	\N	77943301	2235449378	00749c9d7251_000_0000000268_1757994665	12780	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007462	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2700	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007480	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	540	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758007480	Alive	\N	11735143	276923612	00749c9d7251_000_0000000272_1757995720	11760	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758007487	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3900	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758007510	Alive	\N	21591274	70664880	00749c9d7251_000_0000000276_1757999950	7560	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007513	Alive	\N	78148130	2237106103	00749c9d7251_000_0000000268_1757994665	12840	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007522	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2760	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007540	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	600	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
894b9f677008c9fd	1758007541	Alive	\N	11774184	276986911	00749c9d7251_000_0000000272_1757995720	11820	\N	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
9b86d526c5afa7cb	1758007546	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	3960	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758007571	Alive	\N	21688951	71041854	00749c9d7251_000_0000000276_1757999950	7620	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
894b9f677008c9fd	1758007573	Stop	\N	11935887	277436413	00749c9d7251_000_0000000272_1757995720	11852	User-Request	\N	2	10.51.0.52	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	b26221fabb05
01d5e8df-8722-4f42-80f3-605093960553	1758007574	Alive	\N	78298731	2239449545	00749c9d7251_000_0000000268_1757994665	12900	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007583	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2820	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007600	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	660	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758007606	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	4020	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
11b2085f204c6ed4	1758007631	Alive	\N	21696871	71052553	00749c9d7251_000_0000000276_1757999950	7680	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007634	Alive	\N	78612630	2240669340	00749c9d7251_000_0000000268_1757994665	12960	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007643	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2880	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007660	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	720	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758007666	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	4080	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758007681	Start	\N	\N	\N	00749c65aff0_000_0000000204_0000691811	\N	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758007691	Alive	\N	21698733	71055597	00749c9d7251_000_0000000276_1757999950	7740	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007694	Alive	\N	78813812	2241003632	00749c9d7251_000_0000000268_1757994665	13020	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007702	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	2940	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007719	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	780	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758007726	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	4140	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758007741	Alive	\N	0	0	00749c65aff0_000_0000000204_0000691811	60	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758007751	Alive	\N	21700327	71057277	00749c9d7251_000_0000000276_1757999950	7800	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007754	Alive	\N	79040529	2242588870	00749c9d7251_000_0000000268_1757994665	13080	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007762	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	3000	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007779	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	840	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758007787	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	4200	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758007802	Alive	\N	0	0	00749c65aff0_000_0000000204_0000691811	120	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758007811	Alive	\N	21708338	71069765	00749c9d7251_000_0000000276_1757999950	7860	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007814	Alive	\N	79110068	2244635479	00749c9d7251_000_0000000268_1757994665	13140	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007822	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	3060	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007839	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	900	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758007846	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	4260	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758007861	Alive	\N	0	0	00749c65aff0_000_0000000204_0000691811	180	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758007871	Alive	\N	21738027	71184460	00749c9d7251_000_0000000276_1757999950	7920	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007874	Alive	\N	79379601	2245922438	00749c9d7251_000_0000000268_1757994665	13200	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007883	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	3120	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007899	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	960	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758007906	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	4320	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758007921	Alive	\N	0	0	00749c65aff0_000_0000000204_0000691811	240	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758007931	Alive	\N	21800007	71427368	00749c9d7251_000_0000000276_1757999950	7980	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007934	Alive	\N	79403030	2245965648	00749c9d7251_000_0000000268_1757994665	13260	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758007943	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	3180	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758007960	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	1020	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758007966	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	4380	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758007981	Alive	\N	0	0	00749c65aff0_000_0000000204_0000691811	300	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758007990	Alive	\N	21801233	71428342	00749c9d7251_000_0000000276_1757999950	8040	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758007993	Alive	\N	79709190	2247083337	00749c9d7251_000_0000000268_1757994665	13320	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758008003	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	3240	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758008020	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	1080	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758008026	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	4440	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758008041	Alive	\N	0	0	00749c65aff0_000_0000000204_0000691811	360	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758008050	Alive	\N	21801762	71428791	00749c9d7251_000_0000000276_1757999950	8100	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758008053	Alive	\N	79778277	2249185560	00749c9d7251_000_0000000268_1757994665	13380	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758008062	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	3300	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758008080	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	1140	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758008087	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	4500	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758008102	Alive	\N	0	0	00749c65aff0_000_0000000204_0000691811	420	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758008110	Alive	\N	22204354	73571684	00749c9d7251_000_0000000276_1757999950	8160	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758008113	Alive	\N	79800621	2249377213	00749c9d7251_000_0000000268_1757994665	13440	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758008122	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	3360	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758008140	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	1200	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758008147	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	4560	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758008162	Alive	\N	0	0	00749c65aff0_000_0000000204_0000691811	480	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758008170	Alive	\N	22329541	73932068	00749c9d7251_000_0000000276_1757999950	8220	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758008173	Alive	\N	80486389	2258278220	00749c9d7251_000_0000000268_1757994665	13500	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758008183	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	3420	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758008199	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	1260	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758008206	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	4620	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758008221	Alive	\N	0	0	00749c65aff0_000_0000000204_0000691811	540	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758008231	Alive	\N	22336073	73947407	00749c9d7251_000_0000000276_1757999950	8280	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758008234	Alive	\N	80625343	2261754495	00749c9d7251_000_0000000268_1757994665	13560	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758008243	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	3480	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
2d2234a5e69d3472	1758008259	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	1320	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758008266	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	4680	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758008281	Alive	\N	0	0	00749c65aff0_000_0000000204_0000691811	600	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758008291	Alive	\N	22373517	74009818	00749c9d7251_000_0000000276_1757999950	8340	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758008294	Alive	\N	81886705	2320029400	00749c9d7251_000_0000000268_1757994665	13620	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758008303	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	3540	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
083cb14a17811f4d	1758008316	Start	\N	\N	\N	00749c9d7251_000_0000000282_1758008315	\N	\N	\N	2	0.0.0.0	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	5a9a567a112b
2d2234a5e69d3472	1758008319	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	1380	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758008326	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	4740	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758008341	Alive	\N	0	0	00749c65aff0_000_0000000204_0000691811	660	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758008351	Alive	\N	22411191	74051575	00749c9d7251_000_0000000276_1757999950	8400	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758008354	Alive	\N	83292607	2398255454	00749c9d7251_000_0000000268_1757994665	13680	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758008362	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	3600	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
083cb14a17811f4d	1758008376	Alive	\N	0	0	00749c9d7251_000_0000000282_1758008315	60	\N	\N	2	10.51.0.60	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	5a9a567a112b
2d2234a5e69d3472	1758008379	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	1440	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
9b86d526c5afa7cb	1758008386	Alive	\N	0	0	00749c65aff0_000_0000000202_0000687716	4800	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
5bbfde264cba574d	1758008402	Alive	\N	0	0	00749c65aff0_000_0000000204_0000691811	720	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758008411	Alive	\N	22416224	74059861	00749c9d7251_000_0000000276_1757999950	8460	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758008414	Alive	\N	83485845	2402409656	00749c9d7251_000_0000000268_1757994665	13740	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
9b86d526c5afa7cb	1758008416	Stop	\N	0	0	00749c65aff0_000_0000000202_0000687716	4830	User-Request	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	2e02d17dec09
006d31b5b9ad4108	1758008422	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	3660	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
083cb14a17811f4d	1758008436	Alive	\N	126474	187770	00749c9d7251_000_0000000282_1758008315	120	\N	\N	2	10.51.0.60	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	5a9a567a112b
2d2234a5e69d3472	1758008440	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	1500	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
5bbfde264cba574d	1758008462	Alive	\N	0	0	00749c65aff0_000_0000000204_0000691811	780	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
11b2085f204c6ed4	1758008471	Alive	\N	22418911	74062487	00749c9d7251_000_0000000276_1757999950	8520	\N	\N	2	10.51.0.51	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	be8248a674aa
01d5e8df-8722-4f42-80f3-605093960553	1758008474	Alive	\N	83665410	2403650190	00749c9d7251_000_0000000268_1757994665	13800	\N	\N	2	10.51.0.58	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	a8e291c3ad98
006d31b5b9ad4108	1758008482	Alive	\N	0	0	00749c658aa8_000_0000000264_0011848824	3720	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
083cb14a17811f4d	1758008496	Alive	\N	133460	196562	00749c9d7251_000_0000000282_1758008315	180	\N	\N	2	10.51.0.60	\N	\N	\N	\N	00749c9d7251:ZEEP Wifi	5a9a567a112b
2d2234a5e69d3472	1758008500	Alive	\N	0	0	00749cd49c12_000_0000000021_0000449702	1560	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749cd49c12:ZEEP Wifi	0ef0ebe6c8cf
006d31b5b9ad4108	1758008501	Stop	\N	0	0	00749c658aa8_000_0000000264_0011848824	3739	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	da898f694eda
083cb14a17811f4d	1758008509	Start	\N	\N	\N	00749c658aa8_000_0000000267_0011852571	\N	\N	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	5a9a567a112b
5bbfde264cba574d	1758008521	Alive	\N	0	0	00749c65aff0_000_0000000204_0000691811	840	\N	\N	5	0.0.0.0	\N	\N	\N	\N	00749c65aff0:ZEEP Wifi	3e5e4ee1d7a6
083cb14a17811f4d	1758008526	Stop	\N	0	0	00749c658aa8_000_0000000267_0011852571	17	User-Request	\N	4	0.0.0.0	\N	\N	\N	\N	00749c658aa8:ZEEP Wifi	5a9a567a112b
\.


--
-- Data for Name: allowed_nas_mac_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.allowed_nas_mac_address (id, called_station_id, updated_at) FROM stdin;
15	00749c65a0c4	2025-09-01 10:04:40.385857
25	58696cfa681d	2025-09-02 01:17:37.534
5	00749c9d7251	2025-09-04 09:25:33.683
1	00749c658aa8	2025-09-08 14:57:45.99928
8	00749c2e292c	2025-09-08 16:32:27.785893
9	00749c2ddcc0	2025-09-08 16:32:43.044805
10	00749c658d2c	2025-09-10 01:43:24.582
11	00749cd49cca	2025-09-10 02:17:49.595
13	00749c6588f0	2025-09-10 03:08:48.723
16	00749c65aff0	2025-09-10 15:41:41.03416
17	58696cfa8a39	2025-09-10 08:05:14.146
18	00749c6464f0	2025-09-10 08:19:50.888
19	00749c64d520	2025-09-11 09:45:37.418554
20	00749cd49c12	2025-09-11 11:16:26.605002
21	00749c6598d8	2025-09-12 02:22:23.322
22	00749c6599b4	2025-09-12 03:39:04.339
23	00749cd4a19e	2025-09-16 02:47:44.407
\.


--
-- Data for Name: called_station_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.called_station_log (id, username, called_station_id, nas_ip, "timestamp") FROM stdin;
\.


--
-- Data for Name: nas_session_mac_attrs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nas_session_mac_attrs (username, called_station_id, updated_at) FROM stdin;
9c1e79119efd43d3	00749c64d520	2025-09-16 02:27:48.984309
ee85bdcff91e47ef	00749c65aff0	2025-09-16 04:49:24.225764
9b86d526c5afa7cb	00749c65aff0	2025-09-16 07:40:17.007046
083cb14a17811f4d	00749c658aa8	2025-09-16 07:42:06.922157
charchels	58696cfa681d	2025-09-16 03:49:37.794375
testuser	00749cd4a19e	2025-09-16 05:19:13.54719
bbaca6176cf9bac9	00749c9d7251	2025-09-16 05:23:57.362554
836ca3f6e7df20a1	00749c64d520	2025-09-16 07:11:39.53361
e7e4f9a4b62fb76d	00749c9d7251	2025-09-16 03:27:23.312206
2d2234a5e69d3472	00749cd49c12	2025-09-16 07:41:40.238668
894b9f677008c9fd	00749c9d7251	2025-09-16 07:26:13.439033
006d31b5b9ad4108	00749c658aa8	2025-09-16 07:41:41.924617
e2e8c519aa5edc7a	00749c658d2c	2025-09-16 04:21:30.166727
01d5e8df-8722-4f42-80f3-605093960553	00749c658aa8	2025-09-16 07:42:14.843984
07be34f9696d7268	00749c9d7251	2025-09-16 02:19:08.78911
f23970b34f423357	00749c2ddcc0	2025-09-16 07:13:26.256181
66cc0641241a5806	00749c658d2c	2025-09-16 03:50:26.053133
6ad40ea4dd5c7db4	00749c658d2c	2025-09-16 04:17:18.39262
ddeac671993bf524	00749c9d7251	2025-09-16 05:17:06.659257
0ae6faba2b9f98f5	00749c6464f0	2025-09-16 04:33:16.258009
d681b5c249787836	00749c658aa8	2025-09-16 07:22:49.564682
52d766c415558156	00749c65a0c4	2025-09-16 07:28:52.183567
82fdf71180db29b8	00749c2ddcc0	2025-09-16 05:01:27.269852
2a8db541e434d820	00749c6464f0	2025-09-16 04:36:33.63727
11b2085f204c6ed4	00749c658aa8	2025-09-16 07:42:01.103696
7752732a3bcc2d7b	00749c64d520	2025-09-16 04:12:48.130021
380b1d99fdf49294	00749c65aff0	2025-09-16 05:01:30.778851
5bbfde264cba574d	00749c65aff0	2025-09-16 07:42:01.400824
\.


--
-- Data for Name: radacct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.radacct (radacctid, username, acctstarttime, acctstoptime, acctsessiontime, unixtimestamp, acctstatustype) FROM stdin;
\.


--
-- Data for Name: radauthlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.radauthlog (time_stamp, username, type, reason) FROM stdin;
\.


--
-- Data for Name: radcheck_old; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.radcheck_old (id, username, attribute, op, value, full_name, address, phone_no, birthday, gender, id_type, id_value, status, token, registration_date, validated) FROM stdin;
\.


--
-- Data for Name: radclientlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.radclientlist (nasidentifier, secret, ignoreacctsignature, dupinterval, defaultrealm, nastype, snmpcommunity, livingstonoffs, livingstonhole, framedgroupbaseaddress, framedgroupmaxportsperclassc, rewriteusername, noignoreduplicates, prehandlerhook, identifier) FROM stdin;
12.0.0.1	ap0ll0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
172.31.239.66	ap0ll0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
172.31.239.68	ap0ll0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
127.0.0.1	ap0ll0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
202.60.9.29	ap0ll0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
103.123.147.29	ap0ll0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
202.60.11.212	ap0ll0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	00749c64ae6c
10.42.96.0/24	ap0ll0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10.244.2.102	ap0ll0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10.42.20.0/24	ap0ll0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
192.168.2.169	ap0ll0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0.0.0.0/0	ap0ll0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: radlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.radlog (time_stamp, priority, message) FROM stdin;
\.


--
-- Data for Name: radonline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.radonline (username, nasidentifier, nasport, acctsessionid, time_stamp, framedipaddress, nasporttype, servicetype) FROM stdin;
\.


--
-- Data for Name: radpool; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.radpool (state, time_stamp, expiry, username, pool, yiaddr, subnetmask, dnsserver, nas_id) FROM stdin;
\.


--
-- Data for Name: radsqlradius; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.radsqlradius (targetname, host1, host2, secret, authport, acctport, retries, retrytimeout, useoldascendpasswords, serverhasbrokenportnumbers, serverhasbrokenaddresses, ignorereplysignature, failurepolicy) FROM stdin;
\.


--
-- Data for Name: radsqlradiusindirect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.radsqlradiusindirect (sourcename, targetname) FROM stdin;
\.


--
-- Data for Name: radstatslog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.radstatslog (time_stamp, type, identifier, accessaccepts, accesschallenges, accessrejects, accessrequests, accountingrequests, accountingresponses, badauthaccessrequests, badauthaccountingrequests, badauthrequests, droppedaccessrequests, droppedaccountingrequests, droppedrequests, dupaccessrequests, dupaccountingrequests, duplicaterequests, malformedaccessrequests, malformedaccountingrequests, proxiednoreply, proxiedrequests, requests, responsetime) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (username, nasipaddress, nasport, acctsessionid, acctstarttime) FROM stdin;
\.


--
-- Data for Name: subscribers; Type: TABLE DATA; Schema: public; Owner: radiator
--

COPY public.subscribers (id, username, password, session_limit, remaining_session_time, bytes_limit, remaining_bytes, lname, fname, mname, ename, address, phone_no, birthdate, gender, status, registration_date) FROM stdin;
23132	9b86d526c5afa7cb	Aj@>l=:>k=ini?kj	0	14400	\N	5000000000	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23131	7752732a3bcc2d7b	??=:?;:i;jkk:l?j	0	7200	\N	1982375365	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23140	6ad40ea4dd5c7db4	>il<8mi<ll=k?lj<	0	3600	\N	0	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23139	894b9f677008c9fd	@A<jAn>??88@kAnl	0	21600	\N	0	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23150	11b2085f204c6ed4	99j:8@=n:8<k>ml<	0	3600	\N	0	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23149	01d5e8df-8722-4f42-80f3-605093960553	89l=m@ln5@?::5<n<:5@8n;5>8=8A;A>8==;	0	18000	\N	0	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23144	836ca3f6e7df20a1	@;>ki;n>m?ln:8i9	0	3600	\N	1000000000	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23148	2d2234a5e69d3472	:l::;<i=m>Al;<?:	0	18000	\N	4637858708	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23151	006d31b5b9ad4108	88>l;9j=jAil<98@	0	3600	\N	1000000000	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23147	charchels	charchelpass	0	18000	\N	4637858708	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23143	5bbfde264cba574d	=jjnlm:><kji=?<l	0	3600	\N	817581585	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23152	083cb14a17811f4d	8@;kj9<i9?@99n<l	0	3600	\N	999355734	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23142	92d8a69307f92091	A:l@i>A;8?nA:8A9	0	3600	\N	1000000000	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23141	2a8db541e434d820	:i@lj=<9m<;<l@:8	0	3600	\N	0	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23145	f23970b34f423357	n:;A?8j;<n<:;;=?	0	3600	\N	1000000000	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
23146	cbcf1c972c44b438	kjkn9kA?:k<<j<;@	0	14400	\N	3000000000	default	default	\N	\N	unknown	0000000000	2025-09-16	N/A	1	2025-09-16
\.


--
-- Name: allowed_nas_mac_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.allowed_nas_mac_address_id_seq', 23, true);


--
-- Name: called_station_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.called_station_log_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: radiator
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, true);


--
-- Name: radacct_radacctid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.radacct_radacctid_seq', 39, true);


--
-- Name: radcheck_old_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.radcheck_old_id_seq', 1, false);


--
-- Name: subscribers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscribers_id_seq', 23152, true);


--
-- Name: Dashboard Dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: zeepuser
--

ALTER TABLE ONLY public."Dashboard"
    ADD CONSTRAINT "Dashboard_pkey" PRIMARY KEY (type);


--
-- Name: MobileOtp Otp_pkey; Type: CONSTRAINT; Schema: public; Owner: zeepuser
--

ALTER TABLE ONLY public."MobileOtp"
    ADD CONSTRAINT "Otp_pkey" PRIMARY KEY (otp_id);


--
-- Name: Promos Promos_pkey; Type: CONSTRAINT; Schema: public; Owner: zeepuser
--

ALTER TABLE ONLY public."Promos"
    ADD CONSTRAINT "Promos_pkey" PRIMARY KEY (promo_id);


--
-- Name: Routers Routers_pkey; Type: CONSTRAINT; Schema: public; Owner: zeepuser
--

ALTER TABLE ONLY public."Routers"
    ADD CONSTRAINT "Routers_pkey" PRIMARY KEY (router_id);


--
-- Name: Tiers Tiers_pkey; Type: CONSTRAINT; Schema: public; Owner: zeepuser
--

ALTER TABLE ONLY public."Tiers"
    ADD CONSTRAINT "Tiers_pkey" PRIMARY KEY (tier_id);


--
-- Name: Transactions Transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: zeepuser
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (transaction_id);


--
-- Name: UserRoles UserRoles_pkey; Type: CONSTRAINT; Schema: public; Owner: zeepuser
--

ALTER TABLE ONLY public."UserRoles"
    ADD CONSTRAINT "UserRoles_pkey" PRIMARY KEY (type);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: zeepuser
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);


--
-- Name: allowed_nas_mac_address allowed_nas_mac_address_called_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.allowed_nas_mac_address
    ADD CONSTRAINT allowed_nas_mac_address_called_station_id_key UNIQUE (called_station_id);


--
-- Name: allowed_nas_mac_address allowed_nas_mac_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.allowed_nas_mac_address
    ADD CONSTRAINT allowed_nas_mac_address_pkey PRIMARY KEY (id);


--
-- Name: called_station_log called_station_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.called_station_log
    ADD CONSTRAINT called_station_log_pkey PRIMARY KEY (id);


--
-- Name: nas_session_mac_attrs nas_session_mac_attrs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nas_session_mac_attrs
    ADD CONSTRAINT nas_session_mac_attrs_pkey PRIMARY KEY (username);


--
-- Name: radacct radacct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.radacct
    ADD CONSTRAINT radacct_pkey PRIMARY KEY (radacctid);


--
-- Name: radcheck_old radcheck_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.radcheck_old
    ADD CONSTRAINT radcheck_pkey PRIMARY KEY (id);


--
-- Name: subscribers test_pkey; Type: CONSTRAINT; Schema: public; Owner: radiator
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- Name: subscribers test_username_key; Type: CONSTRAINT; Schema: public; Owner: radiator
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT test_username_key UNIQUE (username);


--
-- Name: idx_radacct_starttime; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_radacct_starttime ON public.radacct USING btree (acctstarttime);


--
-- Name: idx_radacct_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_radacct_username ON public.radacct USING btree (username);


--
-- Name: radauthlog_i1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX radauthlog_i1 ON public.radauthlog USING btree (username);


--
-- Name: radcheck_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX radcheck_username ON public.radcheck_old USING btree (username, attribute);


--
-- Name: radclientlist_i1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX radclientlist_i1 ON public.radclientlist USING btree (nasidentifier);


--
-- Name: radonline_i1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX radonline_i1 ON public.radonline USING btree (nasidentifier, nasport);


--
-- Name: radonline_i2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX radonline_i2 ON public.radonline USING btree (username);


--
-- Name: radpool_i1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX radpool_i1 ON public.radpool USING btree (yiaddr);


--
-- Name: radpool_i2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX radpool_i2 ON public.radpool USING btree (pool);


--
-- Name: radsqlradius_i1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX radsqlradius_i1 ON public.radsqlradius USING btree (targetname);


--
-- Name: radsqlradiusindirect_i1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX radsqlradiusindirect_i1 ON public.radsqlradiusindirect USING btree (sourcename);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: radiator
--

GRANT USAGE ON SCHEMA public TO exporter;


--
-- Name: TABLE "Dashboard"; Type: ACL; Schema: public; Owner: zeepuser
--

GRANT SELECT ON TABLE public."Dashboard" TO exporter;


--
-- Name: TABLE "MobileOtp"; Type: ACL; Schema: public; Owner: zeepuser
--

GRANT SELECT ON TABLE public."MobileOtp" TO exporter;


--
-- Name: TABLE "Promos"; Type: ACL; Schema: public; Owner: zeepuser
--

GRANT SELECT ON TABLE public."Promos" TO exporter;


--
-- Name: TABLE "Routers"; Type: ACL; Schema: public; Owner: zeepuser
--

GRANT SELECT ON TABLE public."Routers" TO exporter;


--
-- Name: TABLE "Tiers"; Type: ACL; Schema: public; Owner: zeepuser
--

GRANT SELECT ON TABLE public."Tiers" TO exporter;


--
-- Name: TABLE "Transactions"; Type: ACL; Schema: public; Owner: zeepuser
--

GRANT SELECT ON TABLE public."Transactions" TO exporter;


--
-- Name: TABLE "UserRoles"; Type: ACL; Schema: public; Owner: zeepuser
--

GRANT SELECT ON TABLE public."UserRoles" TO exporter;


--
-- Name: TABLE "Users"; Type: ACL; Schema: public; Owner: zeepuser
--

GRANT SELECT ON TABLE public."Users" TO exporter;


--
-- Name: TABLE accounting; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.accounting TO radiator;
GRANT SELECT ON TABLE public.accounting TO exporter;


--
-- Name: TABLE allowed_nas_mac_address; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.allowed_nas_mac_address TO radiator;
GRANT SELECT ON TABLE public.allowed_nas_mac_address TO exporter;


--
-- Name: SEQUENCE allowed_nas_mac_address_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.allowed_nas_mac_address_id_seq TO radiator;


--
-- Name: TABLE called_station_log; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.called_station_log TO exporter;


--
-- Name: TABLE nas_session_mac_attrs; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.nas_session_mac_attrs TO radiator;
GRANT SELECT ON TABLE public.nas_session_mac_attrs TO exporter;


--
-- Name: TABLE radacct; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.radacct TO radiator;
GRANT SELECT ON TABLE public.radacct TO exporter;


--
-- Name: SEQUENCE radacct_radacctid_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.radacct_radacctid_seq TO radiator;


--
-- Name: TABLE radauthlog; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.radauthlog TO radiator;
GRANT SELECT ON TABLE public.radauthlog TO exporter;


--
-- Name: TABLE radcheck_old; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.radcheck_old TO radiator;
GRANT SELECT ON TABLE public.radcheck_old TO exporter;


--
-- Name: SEQUENCE radcheck_old_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.radcheck_old_id_seq TO radiator;


--
-- Name: TABLE radclientlist; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.radclientlist TO radiator;
GRANT SELECT ON TABLE public.radclientlist TO exporter;


--
-- Name: TABLE radlog; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.radlog TO radiator;
GRANT SELECT ON TABLE public.radlog TO exporter;


--
-- Name: TABLE radonline; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.radonline TO radiator;
GRANT SELECT ON TABLE public.radonline TO exporter;


--
-- Name: TABLE radpool; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.radpool TO radiator;
GRANT SELECT ON TABLE public.radpool TO exporter;


--
-- Name: TABLE radsqlradius; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.radsqlradius TO radiator;
GRANT SELECT ON TABLE public.radsqlradius TO exporter;


--
-- Name: TABLE radsqlradiusindirect; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.radsqlradiusindirect TO radiator;
GRANT SELECT ON TABLE public.radsqlradiusindirect TO exporter;


--
-- Name: TABLE radstatslog; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.radstatslog TO radiator;
GRANT SELECT ON TABLE public.radstatslog TO exporter;


--
-- Name: TABLE sessions; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.sessions TO radiator;
GRANT SELECT ON TABLE public.sessions TO exporter;


--
-- Name: SEQUENCE subscribers_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.subscribers_id_seq TO radiator;


--
-- Name: TABLE subscribers; Type: ACL; Schema: public; Owner: radiator
--

GRANT SELECT ON TABLE public.subscribers TO exporter;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: radiator
--

ALTER DEFAULT PRIVILEGES FOR ROLE radiator IN SCHEMA public GRANT SELECT ON TABLES TO exporter;


--
-- PostgreSQL database dump complete
--

\unrestrict zoaHaicj008HAQaNGGtc1cGxXoEPkIHRNbZYAn40oMt9qqW0iKbIPGUhZlcfM3R

