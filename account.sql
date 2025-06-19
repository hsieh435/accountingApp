--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-06-19 21:15:15

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
-- TOC entry 8 (class 2615 OID 16387)
-- Name: pgagent; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pgagent;


ALTER SCHEMA pgagent OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA pgagent; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA pgagent IS 'pgAgent system tables';


--
-- TOC entry 2 (class 3079 OID 16388)
-- Name: pgagent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgagent WITH SCHEMA pgagent;


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgagent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgagent IS 'A PostgreSQL job scheduler';


--
-- TOC entry 3 (class 3079 OID 16546)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 235 (class 1259 OID 16689)
-- Name: account_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_types (
    type_id character varying NOT NULL,
    type_name character varying NOT NULL
);


ALTER TABLE public.account_types OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16721)
-- Name: accounts_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_list (
    user_id character varying NOT NULL,
    account_id character varying NOT NULL,
    account_name character varying NOT NULL,
    account_type character varying,
    account_bank character varying,
    bank_code character varying,
    account_no character varying,
    is_salary_account boolean,
    created_at timestamp with time zone
);


ALTER TABLE public.accounts_list OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16784)
-- Name: address_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address_book (
    sid integer NOT NULL,
    name character varying(20),
    mobile character varying(20),
    birthday date,
    email character varying(50),
    address character varying(20),
    "createdDate" timestamp with time zone,
    "explainColumn" character varying(255),
    "movedRecord" character varying(255),
    moved character varying(5)
);


ALTER TABLE public.address_book OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16783)
-- Name: address_book_sid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_book_sid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.address_book_sid_seq OWNER TO postgres;

--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 240
-- Name: address_book_sid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_book_sid_seq OWNED BY public.address_book.sid;


--
-- TOC entry 243 (class 1259 OID 16824)
-- Name: bankAccount_trade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."bankAccount_trade" (
    trade_id character varying,
    account_id character varying,
    trade_datetime timestamp with time zone,
    account_user character varying,
    account_type character varying,
    trade_type character varying,
    trade_category character varying,
    trade_amount numeric(14,2),
    note text
);


ALTER TABLE public."bankAccount_trade" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16737)
-- Name: currency_trade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency_trade (
    trade_id character varying NOT NULL,
    account_id character varying NOT NULL,
    trade_datetime timestamp with time zone,
    account_user character varying,
    account_type character varying,
    trade_type character varying NOT NULL,
    trade_category character varying,
    trade_amount numeric(14,2) NOT NULL,
    note text
);


ALTER TABLE public.currency_trade OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16836)
-- Name: function; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.function (
    function_group character varying NOT NULL,
    function_id character varying NOT NULL,
    function_name character varying NOT NULL,
    url character varying,
    sort integer
);


ALTER TABLE public.function OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16829)
-- Name: function_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.function_group (
    function_group_id character varying NOT NULL,
    functiongroup_name character varying,
    sort integer
);


ALTER TABLE public.function_group OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16762)
-- Name: stockAccount_trade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."stockAccount_trade" (
    trade_id character varying NOT NULL,
    account_id character varying NOT NULL,
    account_user character varying,
    trade_datetime timestamp with time zone NOT NULL,
    "buySell" character varying NOT NULL,
    stock_no character varying NOT NULL,
    stock_name character varying NOT NULL,
    price_per_share numeric(14,2) NOT NULL,
    quantity integer NOT NULL,
    total_price numeric(14,2) NOT NULL,
    handling_fee numeric(14,2) NOT NULL,
    note character varying(250)
);


ALTER TABLE public."stockAccount_trade" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16700)
-- Name: trade_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trade_category (
    trade_code character varying NOT NULL,
    trade_name character varying NOT NULL
);


ALTER TABLE public.trade_category OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16793)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    "userId" character varying(20) NOT NULL,
    "userNme" character varying(20) NOT NULL,
    password text NOT NULL,
    "createdDate" timestamp with time zone
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 4791 (class 2604 OID 16787)
-- Name: address_book sid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address_book ALTER COLUMN sid SET DEFAULT nextval('public.address_book_sid_seq'::regclass);


--
-- TOC entry 4753 (class 0 OID 16389)
-- Dependencies: 220
-- Data for Name: pga_jobagent; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobagent (jagpid, jaglogintime, jagstation) FROM stdin;
\.


--
-- TOC entry 4754 (class 0 OID 16398)
-- Dependencies: 222
-- Data for Name: pga_jobclass; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobclass (jclid, jclname) FROM stdin;
\.


--
-- TOC entry 4755 (class 0 OID 16408)
-- Dependencies: 224
-- Data for Name: pga_job; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_job (jobid, jobjclid, jobname, jobdesc, jobhostagent, jobenabled, jobcreated, jobchanged, jobagentid, jobnextrun, joblastrun) FROM stdin;
\.


--
-- TOC entry 4757 (class 0 OID 16456)
-- Dependencies: 228
-- Data for Name: pga_schedule; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_schedule (jscid, jscjobid, jscname, jscdesc, jscenabled, jscstart, jscend, jscminutes, jschours, jscweekdays, jscmonthdays, jscmonths) FROM stdin;
\.


--
-- TOC entry 4758 (class 0 OID 16484)
-- Dependencies: 230
-- Data for Name: pga_exception; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_exception (jexid, jexscid, jexdate, jextime) FROM stdin;
\.


--
-- TOC entry 4759 (class 0 OID 16498)
-- Dependencies: 232
-- Data for Name: pga_joblog; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_joblog (jlgid, jlgjobid, jlgstatus, jlgstart, jlgduration) FROM stdin;
\.


--
-- TOC entry 4756 (class 0 OID 16432)
-- Dependencies: 226
-- Data for Name: pga_jobstep; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobstep (jstid, jstjobid, jstname, jstdesc, jstenabled, jstkind, jstcode, jstconnstr, jstdbname, jstonerror, jscnextrun) FROM stdin;
\.


--
-- TOC entry 4760 (class 0 OID 16514)
-- Dependencies: 234
-- Data for Name: pga_jobsteplog; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobsteplog (jslid, jsljlgid, jsljstid, jslstatus, jslresult, jslstart, jslduration, jsloutput) FROM stdin;
\.


--
-- TOC entry 4989 (class 0 OID 16689)
-- Dependencies: 235
-- Data for Name: account_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_types (type_id, type_name) FROM stdin;
c	現金帳戶
s	證券帳戶
\.


--
-- TOC entry 4991 (class 0 OID 16721)
-- Dependencies: 237
-- Data for Name: accounts_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_list (user_id, account_id, account_name, account_type, account_bank, bank_code, account_no, is_salary_account, created_at) FROM stdin;
mike	mike01	123	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 4997 (class 0 OID 16824)
-- Dependencies: 243
-- Data for Name: bankAccount_trade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."bankAccount_trade" (trade_id, account_id, trade_datetime, account_user, account_type, trade_type, trade_category, trade_amount, note) FROM stdin;
\.


--
-- TOC entry 4992 (class 0 OID 16737)
-- Dependencies: 238
-- Data for Name: currency_trade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency_trade (trade_id, account_id, trade_datetime, account_user, account_type, trade_type, trade_category, trade_amount, note) FROM stdin;
\.


--
-- TOC entry 4999 (class 0 OID 16836)
-- Dependencies: 245
-- Data for Name: function; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.function (function_group, function_id, function_name, url, sort) FROM stdin;
systemSystem	accountSetting	帳戶資料	/accountSetting	1
statement	inoutStatement	收支報表	/inoutStatement	1
\.


--
-- TOC entry 4998 (class 0 OID 16829)
-- Dependencies: 244
-- Data for Name: function_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.function_group (function_group_id, functiongroup_name, sort) FROM stdin;
systemSystem	系統設定	1
statement	報表	2
\.


--
-- TOC entry 4993 (class 0 OID 16762)
-- Dependencies: 239
-- Data for Name: stockAccount_trade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."stockAccount_trade" (trade_id, account_id, account_user, trade_datetime, "buySell", stock_no, stock_name, price_per_share, quantity, total_price, handling_fee, note) FROM stdin;
\.


--
-- TOC entry 4990 (class 0 OID 16700)
-- Dependencies: 236
-- Data for Name: trade_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trade_category (trade_code, trade_name) FROM stdin;
salary	薪資
miscellaneous	雜支
phoneBill	電話費
transportation	交通費
food	伙食費
medical	醫藥費
clothing	治裝費
atm	ATM 提款
currency	取得現金
else	其他
\.


--
-- TOC entry 4996 (class 0 OID 16793)
-- Dependencies: 242
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" ("userId", "userNme", password, "createdDate") FROM stdin;
mike	mike	9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0	2025-06-16 00:00:00+08
\.


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 240
-- Name: address_book_sid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_book_sid_seq', 1, false);


--
-- TOC entry 4827 (class 2606 OID 16807)
-- Name: account_types account_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_types
    ADD CONSTRAINT account_types_pkey PRIMARY KEY (type_id);


--
-- TOC entry 4831 (class 2606 OID 16803)
-- Name: accounts_list accounts_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_list
    ADD CONSTRAINT accounts_list_pkey PRIMARY KEY (user_id, account_id);


--
-- TOC entry 4837 (class 2606 OID 16791)
-- Name: address_book address_book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address_book
    ADD CONSTRAINT address_book_pkey PRIMARY KEY (sid);


--
-- TOC entry 4841 (class 2606 OID 16835)
-- Name: function_group function_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.function_group
    ADD CONSTRAINT function_group_pkey PRIMARY KEY (function_group_id);


--
-- TOC entry 4843 (class 2606 OID 16842)
-- Name: function function_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.function
    ADD CONSTRAINT function_pkey PRIMARY KEY (function_group, function_id);


--
-- TOC entry 4835 (class 2606 OID 16823)
-- Name: stockAccount_trade investments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."stockAccount_trade"
    ADD CONSTRAINT investments_pkey PRIMARY KEY (trade_id, account_id);


--
-- TOC entry 4829 (class 2606 OID 16809)
-- Name: trade_category trade_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trade_category
    ADD CONSTRAINT trade_category_pkey PRIMARY KEY (trade_code);


--
-- TOC entry 4833 (class 2606 OID 16813)
-- Name: currency_trade transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency_trade
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (trade_id, account_id);


--
-- TOC entry 4839 (class 2606 OID 16799)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("userId");


-- Completed on 2025-06-19 21:15:15

--
-- PostgreSQL database dump complete
--

