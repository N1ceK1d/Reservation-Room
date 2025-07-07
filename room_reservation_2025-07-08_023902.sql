--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Postgres.app)
-- Dumped by pg_dump version 17.5

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: vasilevaleksej
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    is_vip boolean NOT NULL
);


ALTER TABLE public.clients OWNER TO vasilevaleksej;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: vasilevaleksej
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_id_seq OWNER TO vasilevaleksej;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vasilevaleksej
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: reservations; Type: TABLE; Schema: public; Owner: vasilevaleksej
--

CREATE TABLE public.reservations (
    id integer NOT NULL,
    client_id integer NOT NULL,
    room_id integer NOT NULL,
    start_reservation date,
    end_reservation date
);


ALTER TABLE public.reservations OWNER TO vasilevaleksej;

--
-- Name: reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: vasilevaleksej
--

CREATE SEQUENCE public.reservations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservations_id_seq OWNER TO vasilevaleksej;

--
-- Name: reservations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vasilevaleksej
--

ALTER SEQUENCE public.reservations_id_seq OWNED BY public.reservations.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: vasilevaleksej
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    room_number character varying(255)
);


ALTER TABLE public.rooms OWNER TO vasilevaleksej;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: vasilevaleksej
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rooms_id_seq OWNER TO vasilevaleksej;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vasilevaleksej
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: vasilevaleksej
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: reservations id; Type: DEFAULT; Schema: public; Owner: vasilevaleksej
--

ALTER TABLE ONLY public.reservations ALTER COLUMN id SET DEFAULT nextval('public.reservations_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: vasilevaleksej
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: vasilevaleksej
--

COPY public.clients (id, is_vip) FROM stdin;
1	f
2	t
3	f
4	f
5	t
\.


--
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: vasilevaleksej
--

COPY public.reservations (id, client_id, room_id, start_reservation, end_reservation) FROM stdin;
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: vasilevaleksej
--

COPY public.rooms (id, room_number) FROM stdin;
1	1a
2	2b
3	3c
4	4d
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vasilevaleksej
--

SELECT pg_catalog.setval('public.clients_id_seq', 5, true);


--
-- Name: reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vasilevaleksej
--

SELECT pg_catalog.setval('public.reservations_id_seq', 10, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vasilevaleksej
--

SELECT pg_catalog.setval('public.rooms_id_seq', 4, true);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: vasilevaleksej
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: vasilevaleksej
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: vasilevaleksej
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: reservations reservations_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vasilevaleksej
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: reservations reservations_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vasilevaleksej
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- PostgreSQL database dump complete
--

