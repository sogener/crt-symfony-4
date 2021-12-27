--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE dbname;
DROP DATABASE "dbname-test_test";
DROP DATABASE "dbname-test_test_test";
DROP DATABASE dbname_test;
DROP DATABASE dbname_test_test;




--
-- Drop roles
--

DROP ROLE "user";


--
-- Roles
--

CREATE ROLE "user";
ALTER ROLE "user" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5ad42c83ac4d3b86de14f207c46a0df0e';






--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14
-- Dumped by pg_dump version 11.14

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO "user";

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: user
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: user
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: user
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14
-- Dumped by pg_dump version 11.14

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

--
-- Name: dbname; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE dbname WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE dbname OWNER TO "user";

\connect dbname

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

SET default_with_oids = false;

--
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO "user";

--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ingredients (
    id integer NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.ingredients OWNER TO "user";

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_id_seq OWNER TO "user";

--
-- Name: order; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public."order" OWNER TO "user";

--
-- Name: COLUMN "order".created_at; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public."order".created_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN "order".updated_at; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public."order".updated_at IS '(DC2Type:datetime_immutable)';


--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_seq OWNER TO "user";

--
-- Name: order_item; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.order_item (
    id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    order_ref_id integer NOT NULL
);


ALTER TABLE public.order_item OWNER TO "user";

--
-- Name: order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_item_id_seq OWNER TO "user";

--
-- Name: pizza; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.pizza (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    image_name character varying(255) NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.pizza OWNER TO "user";

--
-- Name: pizza_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.pizza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizza_id_seq OWNER TO "user";

--
-- Name: pizza_ingredients; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.pizza_ingredients (
    pizza_id integer NOT NULL,
    ingredients_id integer NOT NULL
);


ALTER TABLE public.pizza_ingredients OWNER TO "user";

--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "user";

--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20211220132019	2021-12-20 13:28:33	39
DoctrineMigrations\\Version20211226102125	2021-12-26 10:21:30	52
DoctrineMigrations\\Version20211226131956	2021-12-26 13:46:14	52
DoctrineMigrations\\Version20211226182107	2021-12-26 18:22:18	35
DoctrineMigrations\\Version20211227111359	2021-12-27 11:17:23	16
DoctrineMigrations\\Version20211227112530	2021-12-27 11:25:58	48
DoctrineMigrations\\Version20211227113533	2021-12-27 11:35:56	37
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ingredients (id, title) FROM stdin;
7	Моцарелла
8	Чеддер
9	Помидор
10	Шампиньоны
11	Соус томатный
12	Курица
13	Колбаски пеперони
14	Ветчина
15	Свежий базилик
16	Ананасы
17	Маслины
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."order" (id, status, created_at, updated_at) FROM stdin;
1	processed	2021-12-27 18:51:29	2021-12-27 19:31:36
2	processed	2021-12-27 21:12:16	2021-12-27 21:12:16
3	cart	2021-12-27 22:05:56	2021-12-27 22:23:20
\.


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.order_item (id, product_id, quantity, order_ref_id) FROM stdin;
1	25	88	1
2	26	8	1
3	25	2	2
4	25	22	3
5	26	110	3
6	28	5	3
\.


--
-- Data for Name: pizza; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.pizza (id, title, description, image_name, price) FROM stdin;
25	Маргарита	<div>Описание маргариты</div>	pizza2.jpg	1000.5
26	Куринная	<div>Куринная пицца :0</div>	pizza5.jpg	1300
27	Сырная	<div>Очень много сыра!</div>	pizza1	600
28	Авторская	<div>Пицца от шефа&nbsp; :)</div>	pizza4.jpg	2000
29	Гавайская	<div>Ананасы?</div>	Гавайская-2.jpg	852.5
30	Грибная	<div>Грибы</div>	c7cac170644f5dd32250d16df826cc92.jpg	1300
\.


--
-- Data for Name: pizza_ingredients; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.pizza_ingredients (pizza_id, ingredients_id) FROM stdin;
26	12
26	10
26	11
26	15
27	8
27	11
27	7
27	13
28	7
28	8
28	9
28	10
28	11
28	12
28	13
28	14
28	15
28	16
28	17
29	16
30	10
30	7
30	14
30	9
25	7
25	8
25	9
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.users (id, username, roles, password) FROM stdin;
4	admin	["ROLE_ADMIN"]	$2y$13$A63Z9APKf7VhG9xK5Efut.ijbVVD4YQUligk4IthyJpf1uz3fyZg2
\.


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 17, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.order_id_seq', 3, true);


--
-- Name: order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.order_item_id_seq', 6, true);


--
-- Name: pizza_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.pizza_id_seq', 30, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: pizza_ingredients pizza_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pizza_ingredients
    ADD CONSTRAINT pizza_ingredients_pkey PRIMARY KEY (pizza_id, ingredients_id);


--
-- Name: pizza pizza_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT pizza_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_52ea1f094584665a; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_52ea1f094584665a ON public.order_item USING btree (product_id);


--
-- Name: idx_52ea1f09e238517c; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_52ea1f09e238517c ON public.order_item USING btree (order_ref_id);


--
-- Name: idx_ad0714f63ec4dce; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_ad0714f63ec4dce ON public.pizza_ingredients USING btree (ingredients_id);


--
-- Name: idx_ad0714f6d41d1d42; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_ad0714f6d41d1d42 ON public.pizza_ingredients USING btree (pizza_id);


--
-- Name: uniq_1483a5e9f85e0677; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX uniq_1483a5e9f85e0677 ON public.users USING btree (username);


--
-- Name: order_item fk_52ea1f094584665a; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fk_52ea1f094584665a FOREIGN KEY (product_id) REFERENCES public.pizza(id);


--
-- Name: order_item fk_52ea1f09e238517c; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fk_52ea1f09e238517c FOREIGN KEY (order_ref_id) REFERENCES public."order"(id);


--
-- Name: pizza_ingredients fk_ad0714f63ec4dce; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pizza_ingredients
    ADD CONSTRAINT fk_ad0714f63ec4dce FOREIGN KEY (ingredients_id) REFERENCES public.ingredients(id) ON DELETE CASCADE;


--
-- Name: pizza_ingredients fk_ad0714f6d41d1d42; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pizza_ingredients
    ADD CONSTRAINT fk_ad0714f6d41d1d42 FOREIGN KEY (pizza_id) REFERENCES public.pizza(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14
-- Dumped by pg_dump version 11.14

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

--
-- Name: dbname-test_test; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE "dbname-test_test" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE "dbname-test_test" OWNER TO "user";

\connect -reuse-previous=on "dbname='dbname-test_test'"

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

--
-- Name: notify_messenger_messages(); Type: FUNCTION; Schema: public; Owner: user
--

CREATE FUNCTION public.notify_messenger_messages() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
        PERFORM pg_notify('messenger_messages', NEW.queue_name::text);
        RETURN NEW;
    END;
$$;


ALTER FUNCTION public.notify_messenger_messages() OWNER TO "user";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ingredients (
    id integer NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.ingredients OWNER TO "user";

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_id_seq OWNER TO "user";

--
-- Name: messenger_messages; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.messenger_messages (
    id bigint NOT NULL,
    body text NOT NULL,
    headers text NOT NULL,
    queue_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    available_at timestamp(0) without time zone NOT NULL,
    delivered_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.messenger_messages OWNER TO "user";

--
-- Name: messenger_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.messenger_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messenger_messages_id_seq OWNER TO "user";

--
-- Name: messenger_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.messenger_messages_id_seq OWNED BY public.messenger_messages.id;


--
-- Name: order; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public."order" OWNER TO "user";

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_seq OWNER TO "user";

--
-- Name: order_item; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.order_item (
    id integer NOT NULL,
    product_id integer NOT NULL,
    order_ref_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.order_item OWNER TO "user";

--
-- Name: order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_item_id_seq OWNER TO "user";

--
-- Name: pizza; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.pizza (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    image_name character varying(255) NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.pizza OWNER TO "user";

--
-- Name: pizza_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.pizza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizza_id_seq OWNER TO "user";

--
-- Name: pizza_ingredients; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.pizza_ingredients (
    pizza_id integer NOT NULL,
    ingredients_id integer NOT NULL
);


ALTER TABLE public.pizza_ingredients OWNER TO "user";

--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "user";

--
-- Name: messenger_messages id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.messenger_messages ALTER COLUMN id SET DEFAULT nextval('public.messenger_messages_id_seq'::regclass);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ingredients (id, title) FROM stdin;
\.


--
-- Data for Name: messenger_messages; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.messenger_messages (id, body, headers, queue_name, created_at, available_at, delivered_at) FROM stdin;
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."order" (id, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.order_item (id, product_id, order_ref_id, quantity) FROM stdin;
\.


--
-- Data for Name: pizza; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.pizza (id, title, description, image_name, price) FROM stdin;
\.


--
-- Data for Name: pizza_ingredients; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.pizza_ingredients (pizza_id, ingredients_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.users (id, username, roles, password) FROM stdin;
\.


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 1, false);


--
-- Name: messenger_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.messenger_messages_id_seq', 1, false);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- Name: order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.order_item_id_seq', 1, false);


--
-- Name: pizza_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.pizza_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: messenger_messages messenger_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.messenger_messages
    ADD CONSTRAINT messenger_messages_pkey PRIMARY KEY (id);


--
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: pizza_ingredients pizza_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pizza_ingredients
    ADD CONSTRAINT pizza_ingredients_pkey PRIMARY KEY (pizza_id, ingredients_id);


--
-- Name: pizza pizza_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT pizza_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_52ea1f094584665a; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_52ea1f094584665a ON public.order_item USING btree (product_id);


--
-- Name: idx_52ea1f09e238517c; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_52ea1f09e238517c ON public.order_item USING btree (order_ref_id);


--
-- Name: idx_75ea56e016ba31db; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_75ea56e016ba31db ON public.messenger_messages USING btree (delivered_at);


--
-- Name: idx_75ea56e0e3bd61ce; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_75ea56e0e3bd61ce ON public.messenger_messages USING btree (available_at);


--
-- Name: idx_75ea56e0fb7336f0; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_75ea56e0fb7336f0 ON public.messenger_messages USING btree (queue_name);


--
-- Name: idx_ad0714f63ec4dce; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_ad0714f63ec4dce ON public.pizza_ingredients USING btree (ingredients_id);


--
-- Name: idx_ad0714f6d41d1d42; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_ad0714f6d41d1d42 ON public.pizza_ingredients USING btree (pizza_id);


--
-- Name: uniq_1483a5e9f85e0677; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX uniq_1483a5e9f85e0677 ON public.users USING btree (username);


--
-- Name: messenger_messages notify_trigger; Type: TRIGGER; Schema: public; Owner: user
--

CREATE TRIGGER notify_trigger AFTER INSERT OR UPDATE ON public.messenger_messages FOR EACH ROW EXECUTE PROCEDURE public.notify_messenger_messages();


--
-- Name: order_item fk_52ea1f094584665a; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fk_52ea1f094584665a FOREIGN KEY (product_id) REFERENCES public.pizza(id);


--
-- Name: order_item fk_52ea1f09e238517c; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fk_52ea1f09e238517c FOREIGN KEY (order_ref_id) REFERENCES public."order"(id);


--
-- Name: pizza_ingredients fk_ad0714f63ec4dce; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pizza_ingredients
    ADD CONSTRAINT fk_ad0714f63ec4dce FOREIGN KEY (ingredients_id) REFERENCES public.ingredients(id) ON DELETE CASCADE;


--
-- Name: pizza_ingredients fk_ad0714f6d41d1d42; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pizza_ingredients
    ADD CONSTRAINT fk_ad0714f6d41d1d42 FOREIGN KEY (pizza_id) REFERENCES public.pizza(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14
-- Dumped by pg_dump version 11.14

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

--
-- Name: dbname-test_test_test; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE "dbname-test_test_test" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE "dbname-test_test_test" OWNER TO "user";

\connect -reuse-previous=on "dbname='dbname-test_test_test'"

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

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14
-- Dumped by pg_dump version 11.14

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

--
-- Name: dbname_test; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE dbname_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE dbname_test OWNER TO "user";

\connect dbname_test

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

--
-- Name: notify_messenger_messages(); Type: FUNCTION; Schema: public; Owner: user
--

CREATE FUNCTION public.notify_messenger_messages() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
        PERFORM pg_notify('messenger_messages', NEW.queue_name::text);
        RETURN NEW;
    END;
$$;


ALTER FUNCTION public.notify_messenger_messages() OWNER TO "user";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ingredients (
    id integer NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.ingredients OWNER TO "user";

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_id_seq OWNER TO "user";

--
-- Name: messenger_messages; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.messenger_messages (
    id bigint NOT NULL,
    body text NOT NULL,
    headers text NOT NULL,
    queue_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    available_at timestamp(0) without time zone NOT NULL,
    delivered_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.messenger_messages OWNER TO "user";

--
-- Name: messenger_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.messenger_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messenger_messages_id_seq OWNER TO "user";

--
-- Name: messenger_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.messenger_messages_id_seq OWNED BY public.messenger_messages.id;


--
-- Name: order; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public."order" OWNER TO "user";

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_seq OWNER TO "user";

--
-- Name: order_item; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.order_item (
    id integer NOT NULL,
    product_id integer NOT NULL,
    order_ref_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.order_item OWNER TO "user";

--
-- Name: order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_item_id_seq OWNER TO "user";

--
-- Name: pizza; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.pizza (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    image_name character varying(255) NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.pizza OWNER TO "user";

--
-- Name: pizza_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.pizza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizza_id_seq OWNER TO "user";

--
-- Name: pizza_ingredients; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.pizza_ingredients (
    pizza_id integer NOT NULL,
    ingredients_id integer NOT NULL
);


ALTER TABLE public.pizza_ingredients OWNER TO "user";

--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "user";

--
-- Name: messenger_messages id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.messenger_messages ALTER COLUMN id SET DEFAULT nextval('public.messenger_messages_id_seq'::regclass);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ingredients (id, title) FROM stdin;
\.


--
-- Data for Name: messenger_messages; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.messenger_messages (id, body, headers, queue_name, created_at, available_at, delivered_at) FROM stdin;
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."order" (id, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.order_item (id, product_id, order_ref_id, quantity) FROM stdin;
\.


--
-- Data for Name: pizza; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.pizza (id, title, description, image_name, price) FROM stdin;
\.


--
-- Data for Name: pizza_ingredients; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.pizza_ingredients (pizza_id, ingredients_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.users (id, username, roles, password) FROM stdin;
\.


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 1, false);


--
-- Name: messenger_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.messenger_messages_id_seq', 1, false);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- Name: order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.order_item_id_seq', 1, false);


--
-- Name: pizza_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.pizza_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: messenger_messages messenger_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.messenger_messages
    ADD CONSTRAINT messenger_messages_pkey PRIMARY KEY (id);


--
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: pizza_ingredients pizza_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pizza_ingredients
    ADD CONSTRAINT pizza_ingredients_pkey PRIMARY KEY (pizza_id, ingredients_id);


--
-- Name: pizza pizza_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT pizza_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_52ea1f094584665a; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_52ea1f094584665a ON public.order_item USING btree (product_id);


--
-- Name: idx_52ea1f09e238517c; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_52ea1f09e238517c ON public.order_item USING btree (order_ref_id);


--
-- Name: idx_75ea56e016ba31db; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_75ea56e016ba31db ON public.messenger_messages USING btree (delivered_at);


--
-- Name: idx_75ea56e0e3bd61ce; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_75ea56e0e3bd61ce ON public.messenger_messages USING btree (available_at);


--
-- Name: idx_75ea56e0fb7336f0; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_75ea56e0fb7336f0 ON public.messenger_messages USING btree (queue_name);


--
-- Name: idx_ad0714f63ec4dce; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_ad0714f63ec4dce ON public.pizza_ingredients USING btree (ingredients_id);


--
-- Name: idx_ad0714f6d41d1d42; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_ad0714f6d41d1d42 ON public.pizza_ingredients USING btree (pizza_id);


--
-- Name: uniq_1483a5e9f85e0677; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX uniq_1483a5e9f85e0677 ON public.users USING btree (username);


--
-- Name: messenger_messages notify_trigger; Type: TRIGGER; Schema: public; Owner: user
--

CREATE TRIGGER notify_trigger AFTER INSERT OR UPDATE ON public.messenger_messages FOR EACH ROW EXECUTE PROCEDURE public.notify_messenger_messages();


--
-- Name: order_item fk_52ea1f094584665a; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fk_52ea1f094584665a FOREIGN KEY (product_id) REFERENCES public.pizza(id);


--
-- Name: order_item fk_52ea1f09e238517c; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fk_52ea1f09e238517c FOREIGN KEY (order_ref_id) REFERENCES public."order"(id);


--
-- Name: pizza_ingredients fk_ad0714f63ec4dce; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pizza_ingredients
    ADD CONSTRAINT fk_ad0714f63ec4dce FOREIGN KEY (ingredients_id) REFERENCES public.ingredients(id) ON DELETE CASCADE;


--
-- Name: pizza_ingredients fk_ad0714f6d41d1d42; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pizza_ingredients
    ADD CONSTRAINT fk_ad0714f6d41d1d42 FOREIGN KEY (pizza_id) REFERENCES public.pizza(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14
-- Dumped by pg_dump version 11.14

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

--
-- Name: dbname_test_test; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE dbname_test_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE dbname_test_test OWNER TO "user";

\connect dbname_test_test

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

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14
-- Dumped by pg_dump version 11.14

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO "user";

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: user
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

