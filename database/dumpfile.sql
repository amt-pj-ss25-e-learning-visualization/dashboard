--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)

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
-- Name: actors; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.actors (
    id uuid NOT NULL,
    mail text,
    name text,
    role text
);


ALTER TABLE public.actors OWNER TO admin;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.courses (
    id uuid NOT NULL,
    title text,
    description text,
    language text
);


ALTER TABLE public.courses OWNER TO admin;

--
-- Name: learning_resources; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.learning_resources (
    id uuid NOT NULL,
    title text,
    description text,
    language text,
    interactivity_type text,
    interactivity_level text,
    learning_resource_type text,
    semantic_density text,
    difficulty text,
    typical_learning_time text
);


ALTER TABLE public.learning_resources OWNER TO admin;

--
-- Name: module_resources; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.module_resources (
    module_id uuid,
    resource_id uuid
);


ALTER TABLE public.module_resources OWNER TO admin;

--
-- Name: modules; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.modules (
    id uuid NOT NULL,
    course_id uuid,
    parent_id uuid,
    title text,
    instructor_id uuid
);


ALTER TABLE public.modules OWNER TO admin;

--
-- Name: COLUMN modules.instructor_id; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.modules.instructor_id IS 'only set for top-level modules (parent_id == NULL)';


--
-- Name: statements; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.statements (
    id uuid NOT NULL,
    actor_id uuid,
    module_id uuid,
    verb text,
    result jsonb,
    "timestamp" timestamp with time zone
);


ALTER TABLE public.statements OWNER TO admin;

--
-- Name: COLUMN statements.result; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.statements.result IS 'may be null, depending on verb';


--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.actors (id, mail, name, role) FROM stdin;
9e6eaafb-451e-5224-b656-fbd90faee84a	user_test_consistent_12w_d400a17a@example.com	User_test_consistent_12w_d400a17a	student
cb485377-c70b-528f-bc91-91f51042122f	instructor1@example.com	instructor1	instructor
0852f8f7-947c-5834-aceb-2f6f5d022d75	user_test_diminished_12w_26c7b87c@example.com	User_test_diminished_12w_26c7b87c	student
ac7e21de-93e9-5324-b04e-2bb8c74e01ad	instructor3@example.com	instructor3	instructor
fe17d1aa-87b5-5735-9eb1-6e54b52cb171	user_test_u_shaped_12w_da632fad@example.com	User_test_u_shaped_12w_da632fad	student
963076d1-bcef-5203-8e8a-5434830cb1b8	user_test_inconsistent_12w_25a98bd8@example.com	User_test_inconsistent_12w_25a98bd8	student
81da0bfe-19c8-5bcd-82d8-bcb5673384f0	instructor2@example.com	instructor2	instructor
f077b3df-c8db-5980-9d45-a9f18b43994f	user_test_consistent_8w_8ae01ed5@example.com	User_test_consistent_8w_8ae01ed5	student
62656c39-1f1d-5a6e-b4d9-b5320dc37621	user_test_inconsistent_8w_9b37ebad@example.com	User_test_inconsistent_8w_9b37ebad	student
c2698837-3e82-5bfc-b624-027b8b1d98b4	user_test_diminished_8w_92bc2880@example.com	User_test_diminished_8w_92bc2880	student
e435ea07-6b50-5f0a-92e1-d7b01f7c6296	user_test_u_shaped_8w_98ab8fae@example.com	User_test_u_shaped_8w_98ab8fae	student
e94bb903-b682-50b3-984a-ecdfc8b428b8	user_test_inconsistent_4w_d8d70195@example.com	User_test_inconsistent_4w_d8d70195	student
025122bf-9317-5a26-a542-61d51306d411	user_test_diminished_4w_4284cd3a@example.com	User_test_diminished_4w_4284cd3a	student
d8b612a2-dc91-5792-8e83-e230551cbe05	user_test_u_shaped_4w_e2423d5e@example.com	User_test_u_shaped_4w_e2423d5e	student
5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	user_test_consistent_4w_e0aa6e11@example.com	User_test_consistent_4w_e0aa6e11	student
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.courses (id, title, description, language) FROM stdin;
34821065-58d0-4440-b544-153d5e68658c	Baumchirurg/Baumchirurgin	Dieser Kurs gibt einen Überblick über die benötigten Kompetenzen und Fähigkeiten für die Berufsbezeichnung Baumchirurg/Baumchirurgin (http://data.europa.eu/esco/occupation/fa30c1cb-dbc5-409c-8124-7284592b123c)	en
\.


--
-- Data for Name: learning_resources; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.learning_resources (id, title, description, language, interactivity_type, interactivity_level, learning_resource_type, semantic_density, difficulty, typical_learning_time) FROM stdin;
72a96d1b-d1bc-5f43-a109-ba8c1dd476b4	Learning Object 11	Example: Learning Object 11	de-DE	expositive	low	narrative text	low	low	PT5M30S
a701ea3b-23df-56a6-a349-4162f070e367	Learning Object 04	Example: Learning Object 04	de-DE	expositive	low	narrative text	low	low	PT5M30S
dec7d788-ab62-55a9-80af-10c12cd4228f	Learning Object 07	Example: Learning Object 07	de-DE	expositive	low	narrative text	low	low	PT5M30S
9d83e7c0-7f12-529e-8587-84cbfe867826	Learning Object 09	Example: Learning Object 09	de-DE	expositive	low	narrative text	low	low	PT5M30S
721439fb-cd82-5b9b-90b3-c9f54daa0d23	Learning Object 06	Example: Learning Object 06	de-DE	expositive	low	narrative text	low	low	PT5M30S
b48a6928-01f2-5578-b089-f64da75d5361	Learning Object 03	Example: Learning Object 03	de-DE	expositive	low	narrative text	low	low	PT5M30S
a2779fdf-ec6f-5535-92db-c78f14e15dbc	Learning Object 10	Example: Learning Object 10	de-DE	expositive	low	narrative text	low	low	PT5M30S
217b5901-5c7a-5ffd-af0d-00b0a993380e	Learning Object 05	Example: Learning Object 05	de-DE	expositive	low	narrative text	low	low	PT5M30S
a869f521-b8ac-5561-a49c-9b7bdfac9793	Learning Object 08	Example: Learning Object 08	de-DE	expositive	low	narrative text	low	low	PT5M30S
21a9be69-1ea7-5f3a-8c0b-9f086f821be8	Learning Object 01	Example: Learning Object 01	de-DE	expositive	low	narrative text	low	low	PT5M30S
77e04731-9cea-57f1-b658-f19bcd2fd715	Learning Object 02	Example: Learning Object 02	de-DE	expositive	low	narrative text	low	low	PT5M30S
690e7da3-8773-5bde-a6cd-70ffcb58c4ee	Learning Object 15	Example: Learning Object 15	de-DE	expositive	low	narrative text	low	low	PT5M30S
d6102b11-d7a2-555b-affe-8dead6361f9f	Learning Object 14	Example: Learning Object 14	de-DE	expositive	low	narrative text	low	low	PT5M30S
531fcb6d-8894-5139-98ef-07826e3c1227	Learning Object 12	Example: Learning Object 12	de-DE	expositive	low	narrative text	low	low	PT5M30S
bc8092d0-8540-5f4a-9910-83d0354ae856	Learning Object 13	Example: Learning Object 13	de-DE	expositive	low	narrative text	low	low	PT5M30S
\.


--
-- Data for Name: module_resources; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.module_resources (module_id, resource_id) FROM stdin;
0895d383-5f59-51b2-ae8c-e0b985d81f1f	72a96d1b-d1bc-5f43-a109-ba8c1dd476b4
f8743c64-6b32-5a84-a231-88eaa828b8f3	a701ea3b-23df-56a6-a349-4162f070e367
70423966-9ebb-5262-b082-4b8925547d57	dec7d788-ab62-55a9-80af-10c12cd4228f
628435a2-1aba-5f57-8452-22f0f6fe8b5a	9d83e7c0-7f12-529e-8587-84cbfe867826
0f8226a0-d513-534c-871b-15d9f310349b	721439fb-cd82-5b9b-90b3-c9f54daa0d23
02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	21a9be69-1ea7-5f3a-8c0b-9f086f821be8
a38e6922-2eda-5548-9bc7-bd5f8e33cf73	d6102b11-d7a2-555b-affe-8dead6361f9f
d79afb6a-4da1-59a3-aca1-a837bf3e62aa	531fcb6d-8894-5139-98ef-07826e3c1227
fcc40587-6fbe-570f-8676-ba7f80daec71	b48a6928-01f2-5578-b089-f64da75d5361
6db96e1f-b595-5aec-adbb-46b408029b79	a2779fdf-ec6f-5535-92db-c78f14e15dbc
4bfce604-c23f-530e-8c8e-a24764e1667a	217b5901-5c7a-5ffd-af0d-00b0a993380e
9a044b1c-e0aa-54f5-8787-f52ec405b4d8	a869f521-b8ac-5561-a49c-9b7bdfac9793
f10c153c-968c-5979-b6cc-05736dc40095	77e04731-9cea-57f1-b658-f19bcd2fd715
dd4608c4-45ad-543d-a42c-6276790440d3	690e7da3-8773-5bde-a6cd-70ffcb58c4ee
ab3ff241-b1ca-54ed-aa92-b324f1a5155b	bc8092d0-8540-5f4a-9910-83d0354ae856
\.


--
-- Data for Name: modules; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.modules (id, course_id, parent_id, title, instructor_id) FROM stdin;
0895d383-5f59-51b2-ae8c-e0b985d81f1f	34821065-58d0-4440-b544-153d5e68658c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Bäume schützen	\N
f8743c64-6b32-5a84-a231-88eaa828b8f3	34821065-58d0-4440-b544-153d5e68658c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Bäume kappen	\N
70423966-9ebb-5262-b082-4b8925547d57	34821065-58d0-4440-b544-153d5e68658c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Bäume ausdünnen	\N
628435a2-1aba-5f57-8452-22f0f6fe8b5a	34821065-58d0-4440-b544-153d5e68658c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Baumkonservierung	\N
0f8226a0-d513-534c-871b-15d9f310349b	34821065-58d0-4440-b544-153d5e68658c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Beratung zu Fragen rund um Bäume	\N
02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	34821065-58d0-4440-b544-153d5e68658c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Krankheits- und Schädlingsbekämpfung durchführen	\N
a38e6922-2eda-5548-9bc7-bd5f8e33cf73	34821065-58d0-4440-b544-153d5e68658c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Grünpflanzen pflanzen	\N
d79afb6a-4da1-59a3-aca1-a837bf3e62aa	34821065-58d0-4440-b544-153d5e68658c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Baumkrankheiten bekämpfen	\N
fcc40587-6fbe-570f-8676-ba7f80daec71	34821065-58d0-4440-b544-153d5e68658c	fddec982-57b8-5dd3-8122-3c2363cc0151	Auf Bäume klettern	\N
6db96e1f-b595-5aec-adbb-46b408029b79	34821065-58d0-4440-b544-153d5e68658c	fddec982-57b8-5dd3-8122-3c2363cc0151	Gefahren im Umgang mit Bäumen mindern	\N
4bfce604-c23f-530e-8c8e-a24764e1667a	34821065-58d0-4440-b544-153d5e68658c	fddec982-57b8-5dd3-8122-3c2363cc0151	Mit Seilausrüstung Bäume erklimmen	\N
9a044b1c-e0aa-54f5-8787-f52ec405b4d8	34821065-58d0-4440-b544-153d5e68658c	fddec982-57b8-5dd3-8122-3c2363cc0151	Sicherheitsverfahren in großen Höhen befolgen	\N
f10c153c-968c-5979-b6cc-05736dc40095	34821065-58d0-4440-b544-153d5e68658c	eb99265a-e3fa-5d65-a73c-8042621cf088	Kettensäge bedienen	\N
dd4608c4-45ad-543d-a42c-6276790440d3	34821065-58d0-4440-b544-153d5e68658c	eb99265a-e3fa-5d65-a73c-8042621cf088	Forstwirtschaftliche Ausrüstung instand halten	\N
ab3ff241-b1ca-54ed-aa92-b324f1a5155b	34821065-58d0-4440-b544-153d5e68658c	eb99265a-e3fa-5d65-a73c-8042621cf088	Bei der Baumidentifizierung assistieren	\N
fddec982-57b8-5dd3-8122-3c2363cc0151	34821065-58d0-4440-b544-153d5e68658c	\N	Grundlagen des Kletterns	cb485377-c70b-528f-bc91-91f51042122f
eb99265a-e3fa-5d65-a73c-8042621cf088	34821065-58d0-4440-b544-153d5e68658c	\N	Grundlagen der Instandhaltung	ac7e21de-93e9-5324-b04e-2bb8c74e01ad
d33a5ca9-9a16-57b0-92a2-51dae47aa69a	34821065-58d0-4440-b544-153d5e68658c	\N	Grundlagen der Baumpflege	81da0bfe-19c8-5bcd-82d8-bcb5673384f0
\.


--
-- Data for Name: statements; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.statements (id, actor_id, module_id, verb, result, "timestamp") FROM stdin;
78d3d30f-7c95-4f57-96b1-96b4bac7fb8a	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-02-22 12:34:33.756+00
5e5f1024-e937-42f6-8758-9abbabdc8dba	0852f8f7-947c-5834-aceb-2f6f5d022d75	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-02-22 12:34:33.771+00
828193c7-b695-4478-b4d7-b83cd081c52d	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-02-22 12:36:33.756+00
02de51a1-80b7-41d9-8edf-1a163f02b7fe	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-02-22 12:36:33.768+00
e1e96b3c-874d-4700-bcab-cc5cf593433a	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-02-22 12:41:33.768+00
acd186c9-edf3-45d4-b42d-309550e714d2	0852f8f7-947c-5834-aceb-2f6f5d022d75	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-02-22 12:44:33.771+00
af6ba7a6-4f2a-419d-a86b-6be1b774951c	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT37M"}	2025-02-22 13:13:33.756+00
88573047-5410-4a62-baed-7f6c866d6e47	0852f8f7-947c-5834-aceb-2f6f5d022d75	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT92M"}	2025-02-22 14:06:33.771+00
3085d824-fd6b-4215-a201-5b563ffb8d17	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT285M"}	2025-02-22 17:26:33.768+00
bac170ad-835e-4d3b-83a7-4d7d6ee21dd5	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-02-22 17:32:33.768+00
fad343b8-e6f2-4784-9561-9c17d885eaa7	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-02-23 13:14:33.756+00
c1520033-bdd1-4aef-a011-3eb5e50a082f	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-02-23 13:19:33.756+00
bb21fde5-228d-4dc7-8dd8-d7b05adf4515	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT30M"}	2025-02-23 13:49:33.756+00
923871d7-2c68-42ac-bd33-7d64740f2b0d	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-02-23 13:52:33.756+00
55c87768-d236-4418-9bce-88a772bc626f	0852f8f7-947c-5834-aceb-2f6f5d022d75	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-02-23 14:51:33.771+00
83ec7830-851d-44cc-8a0c-6b7abf203866	0852f8f7-947c-5834-aceb-2f6f5d022d75	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-02-23 14:59:33.771+00
a92753c5-2d2a-4071-92ff-5819e36c024e	963076d1-bcef-5203-8e8a-5434830cb1b8	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-02-23 16:03:33.762+00
6f2767f9-067e-4123-b100-1f1e6886d669	0852f8f7-947c-5834-aceb-2f6f5d022d75	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT85M"}	2025-02-23 16:16:33.771+00
0b3caf7e-3fc0-476a-a6c3-b733ba98edec	963076d1-bcef-5203-8e8a-5434830cb1b8	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT124M"}	2025-02-23 18:07:33.762+00
a7776442-cc95-4bab-a461-7b23733ca71b	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-02-24 12:33:33.756+00
8bcd04b0-7fdd-45b5-a472-a5081485c3bd	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT34M"}	2025-02-24 13:07:33.756+00
cb2440a2-d1ca-4f45-a0e8-b689948ab0ab	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-02-24 13:10:33.756+00
c4244eb6-7597-499e-8b4b-1b9fa7c4c305	963076d1-bcef-5203-8e8a-5434830cb1b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-02-24 14:35:33.762+00
01156e6c-79bf-4c9a-9a3f-3725706fae8f	0852f8f7-947c-5834-aceb-2f6f5d022d75	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-02-24 15:07:33.771+00
9010d45e-2a65-46e3-bc3a-266583beadd8	0852f8f7-947c-5834-aceb-2f6f5d022d75	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT50M"}	2025-02-24 15:57:33.771+00
b2c85ba7-0be9-45a6-a1f6-1db0c7294a4c	963076d1-bcef-5203-8e8a-5434830cb1b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT122M"}	2025-02-24 16:37:33.762+00
ddf4ead9-8bc3-4149-b334-113776b6b1b5	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-02-24 19:22:39.603+00
0ef4162b-b007-44ba-ae18-738ce1337bec	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-02-24 19:26:39.603+00
ed081fc6-56b2-4421-b3e1-6ecfe31eceff	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT524M"}	2025-02-25 04:10:39.603+00
0a29dea0-c613-49b3-80d5-7c20090f949b	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-02-25 12:25:33.756+00
8d6b0a61-1d87-40f8-a13e-cd8120991868	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT31M"}	2025-02-25 12:56:33.756+00
2eff98c4-22bc-4414-9db7-5150de87dd45	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-02-25 12:59:33.756+00
ed1bd00d-1231-4a00-8266-c9780a144bd1	0852f8f7-947c-5834-aceb-2f6f5d022d75	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-02-25 14:39:33.771+00
37fb3afe-4fc3-4d3d-b572-89a7f702ffc8	0852f8f7-947c-5834-aceb-2f6f5d022d75	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-02-25 14:47:33.771+00
52ddfa99-cf8e-4277-bd0a-dbf683cfc60f	0852f8f7-947c-5834-aceb-2f6f5d022d75	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT83M"}	2025-02-25 16:02:33.771+00
2a0e5761-ba38-4353-b086-370af92a775f	0852f8f7-947c-5834-aceb-2f6f5d022d75	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-02-26 14:12:33.771+00
99bd023e-4001-40e8-93e6-1d303dabe6dd	0852f8f7-947c-5834-aceb-2f6f5d022d75	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT40M"}	2025-02-26 14:52:33.771+00
8ae199c0-0dc7-40fe-9055-1225589812f5	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-02-26 16:10:37.272+00
a73d2b05-3473-4ba6-8d48-4360f49e16d3	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-02-26 16:12:37.272+00
4441f78d-7d2a-4feb-a3ad-10ff69c933e3	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-02-26 19:31:33.762+00
14387734-8dc5-4a63-8ad5-10904b5bbbc9	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT133M"}	2025-02-26 21:44:33.762+00
627d0b00-78f7-48cd-b4a0-50415583cdd5	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT495M"}	2025-02-27 00:27:37.272+00
9edecbbe-1572-4ce5-8787-4e34d0dd9016	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-02-27 00:36:37.272+00
a9f82892-e992-4a6f-8899-264a966defdd	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-02-27 11:29:33.756+00
3fd911e9-bb1e-49f0-a9ab-d0c09e303f22	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-02-27 11:32:33.756+00
4d077e84-8d00-49e9-a0b7-76e932b32db5	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT30M"}	2025-02-27 12:02:33.756+00
caf00152-2ec7-40e5-8892-336a09710108	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-02-27 12:04:33.756+00
080e6f5b-785b-4d52-af49-2f269c6ca88f	963076d1-bcef-5203-8e8a-5434830cb1b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-02-27 15:06:33.762+00
966017bf-8998-4e4d-90db-69ba00b33e25	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	scored	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.6487021605036254}}	2025-02-27 15:17:33.756+00
97a77a34-e014-49ba-a0b0-4ad61d6cd18e	9e6eaafb-451e-5224-b656-fbd90faee84a	6db96e1f-b595-5aec-adbb-46b408029b79	completed	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.6487021605036254}}	2025-02-27 15:34:33.756+00
d65157a6-661c-4c1a-bbca-31ad4814019d	0852f8f7-947c-5834-aceb-2f6f5d022d75	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-02-27 15:52:33.771+00
8fef8b7f-ddc8-484d-835b-0da4a74b3aa2	0852f8f7-947c-5834-aceb-2f6f5d022d75	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-02-27 16:01:33.771+00
bcf2b466-2c84-4206-b9d1-c2e6db1b5aa3	963076d1-bcef-5203-8e8a-5434830cb1b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT56M"}	2025-02-27 16:02:33.762+00
61a1472a-8764-4561-9bd2-80e744a9e66f	0852f8f7-947c-5834-aceb-2f6f5d022d75	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT34M"}	2025-02-27 16:26:33.771+00
e3418279-e28c-4d73-b099-c04af571ef5a	0852f8f7-947c-5834-aceb-2f6f5d022d75	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-02-28 14:18:33.771+00
49286ca1-c9ba-4b10-8adf-1ccffa2e2626	0852f8f7-947c-5834-aceb-2f6f5d022d75	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-02-28 14:28:33.771+00
880f3b9f-fb32-4aa8-9f97-d710d1fff509	0852f8f7-947c-5834-aceb-2f6f5d022d75	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-02-28 14:33:33.771+00
dd8e694a-056c-46bc-83be-c440cc676a3c	0852f8f7-947c-5834-aceb-2f6f5d022d75	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT63M"}	2025-02-28 15:21:33.771+00
20e0f2ef-a4be-4665-824f-43bf73107af5	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-02-28 16:16:42.489+00
e503d944-a1f4-4789-a432-6f8bc08f6f57	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-02-28 16:19:42.489+00
e95444d9-9aec-4e6f-8ced-ed460fe717f6	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT286M"}	2025-02-28 21:05:42.489+00
a53d5ccf-8c40-4f96-8a96-13eaf1a75729	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-02-28 21:08:42.489+00
cf05690a-5962-4405-8b12-32b2a33bf4e6	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-03-02 12:53:33.756+00
51be9a71-8387-45ef-a263-f894ef5f5a92	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT36M"}	2025-03-02 13:29:33.756+00
bfe6533f-e018-448a-a992-7f6df8fdbd3e	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-03-02 13:32:33.756+00
a2908b3e-1f1d-445f-b795-6fa417c931b2	0852f8f7-947c-5834-aceb-2f6f5d022d75	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-03-02 14:14:33.771+00
7c2a29a6-3b23-4d9c-850f-a7ae6a38e318	0852f8f7-947c-5834-aceb-2f6f5d022d75	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT81M"}	2025-03-02 15:35:33.771+00
5595f6ed-eb0c-4ef2-811e-28de6d5db798	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-03-02 18:43:14.027+00
57b45bb3-3485-4526-b11c-276b48c41fa4	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-03-02 18:47:14.027+00
5e0885fa-6304-4f47-a414-6c8c3c01e9a9	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT406M"}	2025-03-03 01:33:14.027+00
336ab0ea-87eb-4fa7-a982-76419fb3008d	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-03-03 01:37:14.027+00
4a452ad1-bc1e-4d15-86e5-8cfe577bb573	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-03-03 11:58:33.756+00
b3c6379d-2a8e-4ab1-bf23-77bf2998227f	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-03-03 12:03:33.756+00
44bfa50b-d006-4339-a9ea-315645a5fac3	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT32M"}	2025-03-03 12:35:33.756+00
278308a7-572e-4d19-a4e5-fb3637ec8f7d	963076d1-bcef-5203-8e8a-5434830cb1b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-03-03 12:46:33.762+00
afaa2b39-0351-43e2-a8f8-78181f08346e	963076d1-bcef-5203-8e8a-5434830cb1b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT116M"}	2025-03-03 14:42:33.762+00
9c346ba3-a5d2-4f6c-88ed-30cae521b31a	0852f8f7-947c-5834-aceb-2f6f5d022d75	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-03-04 14:44:33.771+00
4aa97e15-9e41-4b5a-aebc-1cf94eb303e3	0852f8f7-947c-5834-aceb-2f6f5d022d75	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-03-04 14:51:33.771+00
9d3715c3-ef25-4a85-b874-b1a1de58c382	0852f8f7-947c-5834-aceb-2f6f5d022d75	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT79M"}	2025-03-04 16:03:33.771+00
e9b26dc5-c1ba-493e-8997-8d88165d7f0e	963076d1-bcef-5203-8e8a-5434830cb1b8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-03-04 17:33:33.762+00
f2bc2f80-a7f9-4e28-aaf4-81e3850dcc62	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-03-04 20:37:38.541+00
e937af48-a3c3-4011-8e29-d90dea2aa9f7	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-03-04 20:41:38.541+00
5cd5271a-6b3d-42cd-95ef-fc779c8c8185	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT516M"}	2025-03-05 05:17:38.541+00
debe4a0d-6338-4db0-ae90-951d09f3515b	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-03-05 05:27:38.541+00
4868ccf1-a93d-4d49-941b-7585e29d4cc7	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-03-05 11:05:33.756+00
7b014fb4-8d4a-4cef-8eb6-8aa13e7a1798	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT27M"}	2025-03-05 11:32:33.756+00
0d2a8608-0bf2-4340-9d09-d1866e600179	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-03-05 11:35:33.756+00
cda7f106-3ad7-423d-b9af-3b1a8ab9696a	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	scored	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.3799474215136023}}	2025-03-05 14:11:33.756+00
67d1ff1c-7853-44c7-904f-265c922a4395	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	failed	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.3799474215136023}}	2025-03-05 14:39:33.756+00
94fcb0cb-e93e-4a50-9123-8a91d3b0aa4c	963076d1-bcef-5203-8e8a-5434830cb1b8	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-03-05 17:41:33.762+00
dabb44f3-bedb-4ffb-a736-ef5e91102d0c	963076d1-bcef-5203-8e8a-5434830cb1b8	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT65M"}	2025-03-05 18:46:33.762+00
94c04b7f-3abe-454e-aaa0-ec74f944fe42	963076d1-bcef-5203-8e8a-5434830cb1b8	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-03-05 18:52:33.762+00
e09b03f2-b1d8-425d-8209-dffbd162c1d0	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-03-06 14:58:39.654+00
f7b083c8-86d1-4d1e-abdc-f830e05bb322	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-03-06 15:03:39.654+00
ee149f33-3396-4d85-bbb4-c1a76417c135	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT505M"}	2025-03-06 23:28:39.654+00
027674a7-8a18-47f7-bee7-ed2aeed6911c	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-03-06 23:34:39.654+00
cf1309be-9949-4599-b386-09df24e4b8f2	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-03-07 00:31:39.654+00
01db1274-6cf3-4242-84e9-9140da2a7571	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-03-07 00:32:39.654+00
ef29eac4-1b00-4b39-9848-3c1af9f00d0c	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-03-07 00:37:39.654+00
23d12aa9-e29c-43ef-97ee-80e602abc624	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-03-07 13:38:33.756+00
97717a50-31ee-4e8b-9537-644593102b62	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT29M"}	2025-03-07 14:07:33.756+00
379cc1b6-4b93-4895-b20d-5a17ae8432a4	0852f8f7-947c-5834-aceb-2f6f5d022d75	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-03-07 14:26:33.771+00
c9c69cd4-160c-49af-85c2-6448bad368b5	0852f8f7-947c-5834-aceb-2f6f5d022d75	4bfce604-c23f-530e-8c8e-a24764e1667a	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-03-07 14:34:33.771+00
13cd13e4-764f-47c1-ae03-995e73f6dab6	0852f8f7-947c-5834-aceb-2f6f5d022d75	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-03-07 14:44:33.771+00
5d734f48-4e12-4d4c-b51d-963f3143933d	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-03-07 15:07:33.762+00
b2803cc2-ee58-4877-91c6-63e67490efc1	0852f8f7-947c-5834-aceb-2f6f5d022d75	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT78M"}	2025-03-07 15:44:33.771+00
69ea2511-8ec1-489b-a4c7-82a768360e9b	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT143M"}	2025-03-07 17:30:33.762+00
398688ca-613c-4c6c-b10b-882f9248a33d	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-03-07 17:34:33.762+00
f3a62814-a7b0-4b49-8331-e490bf56ca32	963076d1-bcef-5203-8e8a-5434830cb1b8	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-03-08 10:48:33.762+00
4bc33170-ef3a-4a7e-919a-9af26f932edb	963076d1-bcef-5203-8e8a-5434830cb1b8	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT140M"}	2025-03-08 13:08:33.762+00
39b7d997-9cee-4422-bf2f-353067c2bab1	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-03-08 14:12:15.58+00
6f779ecf-dc7e-4067-bd5f-50c355331584	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-03-08 14:17:15.58+00
151a179d-efbc-465c-8a9c-7c615533d79b	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT472M"}	2025-03-08 22:09:15.58+00
cbebd995-6e24-4a65-a659-20539676120e	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-03-08 22:18:15.58+00
ceecd0c2-e3ef-4cea-a4f2-4e65e0a40ab4	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-03-09 14:23:33.756+00
274b3001-7786-4e79-85b3-721727890fb6	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-03-09 14:28:33.756+00
d519fab3-f99e-44ac-9db9-a417ec09e5c5	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT38M"}	2025-03-09 15:06:33.756+00
550f6d68-fe71-426d-ae66-6d1984d4bfb1	963076d1-bcef-5203-8e8a-5434830cb1b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-03-09 15:56:33.762+00
6d45bcf3-d838-41ae-867d-9d8f0774acb5	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	scored	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.5532527464608814}}	2025-03-09 17:04:33.756+00
96ea0de5-412b-4fa0-b745-515da967ddd7	9e6eaafb-451e-5224-b656-fbd90faee84a	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	completed	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.5532527464608814}}	2025-03-09 17:23:33.756+00
ab0fc6b5-0971-40cb-8471-eceaa8b9e3ca	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-03-10 17:24:33.762+00
7dac2539-16f7-454d-9be6-658011a7908b	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-03-10 18:27:57.754+00
92705a02-bc41-41f0-85a5-abbf09f41a26	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-03-10 18:31:57.754+00
ca6caf29-569f-4d4f-972a-d8640092bc0a	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT125M"}	2025-03-10 19:29:33.762+00
5d8c7d67-82c2-4f90-8e4d-47f1072c963f	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-03-10 19:39:33.762+00
6cb01feb-09d3-4103-92af-fd8d51f817dc	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT426M"}	2025-03-11 01:37:57.754+00
fc553415-286a-4077-b2c9-88273ab51467	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-03-11 01:42:57.754+00
d85941e2-e8d8-46f2-be9e-9099d458da72	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-03-12 20:23:34.357+00
5d26bbe9-c264-443d-831c-4b91a547d908	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT233M"}	2025-03-13 00:16:34.357+00
e17a1b6c-913a-4ffe-b609-e8f37602a73f	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-03-13 00:20:34.357+00
19374126-7c4b-48a8-9365-1f0992d89545	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-03-13 12:24:33.762+00
d19bd90f-00b3-4dfd-8ecd-c4c5d976ce1b	963076d1-bcef-5203-8e8a-5434830cb1b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-03-14 11:17:33.762+00
1fb870ed-f226-4ae9-9052-22bdd5f1f651	963076d1-bcef-5203-8e8a-5434830cb1b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT151M"}	2025-03-14 13:48:33.762+00
eae115e0-c66c-4f89-9ac7-3c4ff56fe866	963076d1-bcef-5203-8e8a-5434830cb1b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-03-14 13:55:33.762+00
20a5ce7b-52bd-4d86-acbd-425e2f777816	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-03-14 14:10:33.756+00
e86c85cd-9daf-4fb1-bc05-bf751d47a46a	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT30M"}	2025-03-14 14:40:33.756+00
237483bd-9a49-4aa7-8294-4ab1dde5c85f	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-03-14 19:16:10.911+00
8eb90299-fdf2-4ff1-958b-911145b869f2	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-03-14 19:19:10.911+00
ea040d7b-e865-440e-8a6e-5483b2043a35	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT333M"}	2025-03-15 00:52:10.911+00
7f49b115-5c0a-4b1c-b152-db46122e38fc	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-03-15 00:58:10.911+00
299d44b0-ee34-442a-8c27-c8196b74c07e	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-03-15 14:29:33.756+00
7b0783fb-d03c-4da4-b7b4-decc33468453	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT28M"}	2025-03-15 14:57:33.756+00
035a9c4e-d453-4f4e-aa17-f183e808120d	963076d1-bcef-5203-8e8a-5434830cb1b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-03-15 15:27:33.762+00
4be032b4-614d-4724-8acf-cc4e0401272d	963076d1-bcef-5203-8e8a-5434830cb1b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT58M"}	2025-03-15 16:25:33.762+00
805744e3-ee61-4ed9-965a-ea2cbdcbd60f	963076d1-bcef-5203-8e8a-5434830cb1b8	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-03-16 15:27:33.762+00
e3dbdc38-e2af-4481-9392-1ea233abb6fc	963076d1-bcef-5203-8e8a-5434830cb1b8	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT111M"}	2025-03-16 17:18:33.762+00
f81ccbcd-a379-40ac-ac40-81adaf26b609	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-03-16 20:54:22.084+00
8400a777-becb-4cf2-9011-8f0df4bc4c78	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-03-16 20:57:22.084+00
3311c1d7-db51-4bb8-a327-5178e255f0ca	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT183M"}	2025-03-17 00:00:22.084+00
68ad0c5a-c313-42a7-b99b-2950ecf9d9b2	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-03-17 11:06:33.756+00
658f172f-4454-4ac4-8559-780a145833f6	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT38M"}	2025-03-17 11:44:33.756+00
1d59b5ec-1a7b-4e42-bba0-4c24d55aca3f	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-03-17 11:45:33.756+00
a4b2aaab-ab50-43a5-a348-713fe866c99f	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	scored	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.3452677024080901}}	2025-03-17 13:48:33.756+00
358286b6-1fd2-49c7-8947-9d5e654b0e61	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	failed	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.3452677024080901}}	2025-03-17 14:05:33.756+00
7d35399b-742d-4798-b85a-c762c88c8279	963076d1-bcef-5203-8e8a-5434830cb1b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-03-17 19:25:33.762+00
29b6c197-77ed-41ec-83c2-0b6bc60b9c45	963076d1-bcef-5203-8e8a-5434830cb1b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT129M"}	2025-03-17 21:34:33.762+00
808f5ea7-a4ad-4636-b152-b0909a6af165	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-03-18 10:27:33.762+00
50b9a6ea-0be7-44c1-a68f-0e0abfc99dfd	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-03-18 18:46:03.96+00
f22e39d6-6c42-46d9-9d67-07c3fb6f38c1	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-03-18 18:51:03.96+00
007e870d-b407-47ba-9d19-20ea51df5cae	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT290M"}	2025-03-18 23:41:03.96+00
99ae6cce-d790-4278-8528-9cdbb0100307	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-03-18 23:47:03.96+00
5bafb5fc-c3e5-4901-8cc9-b42bc5be6e40	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-03-19 12:44:33.762+00
9304a5f0-6f3b-41a3-9d7f-81ba56288486	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT129M"}	2025-03-19 14:53:33.762+00
31bc2512-f1ea-408b-b939-a3907b068106	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-03-19 15:25:33.756+00
f7f6e9fe-c940-4fbf-9c76-d6cd7033c261	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-03-19 15:27:33.756+00
b6eae121-8168-49f6-a070-5d46899b1d5c	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT34M"}	2025-03-19 16:01:33.756+00
1eb4ed5b-b239-464f-bf23-df961f5a992a	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-03-20 14:13:33.756+00
d86fe0ea-b9e7-4552-889b-d11c616a2ff7	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-03-20 14:17:33.756+00
179c37de-8db4-456e-a017-f5f3bb14fccb	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT37M"}	2025-03-20 14:54:33.756+00
28dff568-ae8d-4df2-9bb0-f2b77753a746	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	scored	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.572962219036572}}	2025-03-20 16:50:33.756+00
fc7676ad-8db4-4265-a0cf-995d5483b85f	9e6eaafb-451e-5224-b656-fbd90faee84a	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	completed	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.572962219036572}}	2025-03-20 17:09:33.756+00
684b5d61-5412-4acb-a7fe-5c554872a522	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-03-20 20:08:59.34+00
f251999f-861c-4908-b2b0-8c1dd7eb6903	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT243M"}	2025-03-21 00:11:59.34+00
45246b7e-bffc-47ea-b374-c67f23cb3a58	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-03-21 00:21:59.34+00
1fd19da6-27b1-4244-b1b2-ffdaf262879b	963076d1-bcef-5203-8e8a-5434830cb1b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-03-21 10:21:33.762+00
b75a4c2b-865f-4554-8a7f-7125ba421dd2	963076d1-bcef-5203-8e8a-5434830cb1b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT101M"}	2025-03-21 12:02:33.762+00
094a5e13-8955-4c5f-9c9c-a782b6ce146b	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-03-22 10:01:33.762+00
b4b1c836-30ee-49ce-8fc7-95147f385495	9e6eaafb-451e-5224-b656-fbd90faee84a	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-03-22 12:05:33.756+00
cef72df5-a550-44a3-a3e0-9c8512de0bad	9e6eaafb-451e-5224-b656-fbd90faee84a	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-03-22 12:08:33.756+00
3dbe623a-f65f-430f-b21e-d561e13fd1ac	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT147M"}	2025-03-22 12:28:33.762+00
148c96c4-df25-434a-9f45-8f2b741a6f29	f077b3df-c8db-5980-9d45-a9f18b43994f	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-03-22 12:34:33.754+00
19f77598-1592-40f9-bcdf-069641abb363	62656c39-1f1d-5a6e-b4d9-b5320dc37621	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-03-22 12:34:33.76+00
fb91e78f-60ef-461e-9c91-b73e5e6e7158	c2698837-3e82-5bfc-b624-027b8b1d98b4	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-03-22 12:34:33.77+00
692c5732-1d73-4846-ba94-2d8e4c900bb8	f077b3df-c8db-5980-9d45-a9f18b43994f	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-03-22 12:36:33.754+00
8374dea5-7ebe-427b-98cc-582691a6e96c	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-03-22 12:39:33.767+00
bdae2a01-f86e-463d-82e4-216846b62ef1	c2698837-3e82-5bfc-b624-027b8b1d98b4	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-03-22 12:43:33.77+00
82813252-e9a0-484c-be6a-6a324a5e6706	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-03-22 12:44:33.767+00
af65284d-be4d-422d-b640-6d0c8eb8ed30	9e6eaafb-451e-5224-b656-fbd90faee84a	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT38M"}	2025-03-22 12:46:33.756+00
13948c6c-5a2a-46e3-96b1-d3167b8e894e	c2698837-3e82-5bfc-b624-027b8b1d98b4	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT43M"}	2025-03-22 13:17:33.77+00
79bcad6d-957e-4eb6-a77c-dcb9f1104fb1	f077b3df-c8db-5980-9d45-a9f18b43994f	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT62M"}	2025-03-22 13:38:33.754+00
03687f6f-9a04-4131-9e58-69a13a3fa33e	62656c39-1f1d-5a6e-b4d9-b5320dc37621	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT147M"}	2025-03-22 15:01:33.76+00
b1ffc45c-ce5e-418a-99f0-d045673abf77	0852f8f7-947c-5834-aceb-2f6f5d022d75	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-03-22 15:20:33.771+00
60795e1e-cd66-464d-93f1-2219c82c9972	0852f8f7-947c-5834-aceb-2f6f5d022d75	0f8226a0-d513-534c-871b-15d9f310349b	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-03-22 15:26:33.771+00
ace1974f-c34e-48b8-a57a-a64e9633acab	0852f8f7-947c-5834-aceb-2f6f5d022d75	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-03-22 15:34:33.771+00
246dd6cb-0ba5-4160-b2a2-f235ed5e0ac6	0852f8f7-947c-5834-aceb-2f6f5d022d75	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT65M"}	2025-03-22 16:25:33.771+00
452f89a0-2c77-4fd0-964a-a36755ac89d3	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT253M"}	2025-03-22 16:57:33.767+00
b7a4826e-a157-4711-b81b-a3a3ee7af17f	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-03-22 17:03:33.767+00
40a1ba9b-fca2-485e-8253-95442e0baa70	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-03-22 19:31:14.949+00
6b9c33e6-f57c-4299-957f-afac569998ec	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-03-22 19:33:14.949+00
3ebaff14-1b5c-4234-ba33-8eddea0b4d86	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT278M"}	2025-03-23 00:11:14.949+00
ec388410-761b-4d4b-b916-aed15ac0b245	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-03-23 00:20:14.949+00
041dc6f8-9625-4582-90c6-0eb1bfb54cd7	9e6eaafb-451e-5224-b656-fbd90faee84a	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-03-23 13:06:33.756+00
8ecfc0fb-414e-4aa2-8a38-72e6e109c099	9e6eaafb-451e-5224-b656-fbd90faee84a	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT26M"}	2025-03-23 13:32:33.756+00
119ee62a-bc1f-49de-92f6-bb108dadda55	9e6eaafb-451e-5224-b656-fbd90faee84a	0895d383-5f59-51b2-ae8c-e0b985d81f1f	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-03-23 13:37:33.756+00
aa30bd4b-be40-4878-b963-17787d2b4a14	f077b3df-c8db-5980-9d45-a9f18b43994f	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-03-23 14:55:33.754+00
2aab5b8c-9fa7-42ab-9467-4686c7b34dca	f077b3df-c8db-5980-9d45-a9f18b43994f	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT63M"}	2025-03-23 15:58:33.754+00
ca79840e-7764-4163-9c0d-e95f925e1710	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-03-24 12:52:49.816+00
cb2300e0-690f-474c-8492-d9cabec484b9	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-03-24 12:54:49.816+00
6a7a5e03-35cf-48cf-bc34-e9fb4f483232	62656c39-1f1d-5a6e-b4d9-b5320dc37621	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-03-24 13:24:33.76+00
b890e647-917e-4f77-a3a3-a38c73b4539d	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-03-24 14:37:24.749+00
27f5d347-9100-4f2c-a6c9-3b96216e5aba	9e6eaafb-451e-5224-b656-fbd90faee84a	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-03-24 14:37:33.756+00
82bf451e-8903-4d31-98c2-74c274f992d8	9e6eaafb-451e-5224-b656-fbd90faee84a	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-03-24 14:41:33.756+00
de4cdb25-2420-458f-872a-26efb2db585e	62656c39-1f1d-5a6e-b4d9-b5320dc37621	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT111M"}	2025-03-24 15:15:33.76+00
949c0c17-7241-4193-9317-52083c6a4d4d	9e6eaafb-451e-5224-b656-fbd90faee84a	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT38M"}	2025-03-24 15:19:33.756+00
a7d763cc-9cba-407c-a681-86b94cb96cde	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT82M"}	2025-03-24 15:59:24.749+00
60fadc87-41b9-4605-9f9e-a71a02f2f482	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-03-24 16:05:24.749+00
248fd265-45dd-4e6f-9fef-68cdc6016bf5	9e6eaafb-451e-5224-b656-fbd90faee84a	0895d383-5f59-51b2-ae8c-e0b985d81f1f	scored	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.7966503846813568}}	2025-03-24 17:12:33.756+00
4e2848e4-272e-44d0-9b89-0d1caef53fbc	9e6eaafb-451e-5224-b656-fbd90faee84a	0895d383-5f59-51b2-ae8c-e0b985d81f1f	completed	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.7966503846813568}}	2025-03-24 17:37:33.756+00
2ae25516-0847-4fb2-a854-e9c0ed97de06	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT330M"}	2025-03-24 18:24:49.816+00
3d23ebd1-6a84-4a81-9e12-d295a6bbaa83	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-03-24 18:34:49.816+00
abaf9a12-6485-4186-b673-403bae442c72	963076d1-bcef-5203-8e8a-5434830cb1b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-03-24 20:34:33.762+00
ab5fb343-8b98-4a1e-9941-4a638a0ad049	963076d1-bcef-5203-8e8a-5434830cb1b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT142M"}	2025-03-24 22:56:33.762+00
12ac22c4-9010-498a-8c66-b0c197d52377	963076d1-bcef-5203-8e8a-5434830cb1b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-03-25 11:53:33.762+00
49b69b63-8ef6-4f4d-8196-4246c3f06938	963076d1-bcef-5203-8e8a-5434830cb1b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT80M"}	2025-03-25 13:13:33.762+00
16022e74-8b38-4d72-abbd-0c606a1e22ba	c2698837-3e82-5bfc-b624-027b8b1d98b4	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-03-25 16:32:33.77+00
1d7ac15e-5396-4d20-8967-59e52b6d65d9	c2698837-3e82-5bfc-b624-027b8b1d98b4	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-03-25 16:42:33.77+00
922bd815-c66b-45eb-81ec-118d9dbc0916	62656c39-1f1d-5a6e-b4d9-b5320dc37621	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-03-25 16:49:33.76+00
298e4d37-fba8-43bd-99f8-1db749438c5b	c2698837-3e82-5bfc-b624-027b8b1d98b4	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT46M"}	2025-03-25 17:18:33.77+00
eb8fed60-ebb7-48a9-a8c0-ecca4b3e3de6	62656c39-1f1d-5a6e-b4d9-b5320dc37621	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT166M"}	2025-03-25 19:35:33.76+00
10a9221e-4925-4ed1-82ff-5c0d64a2e3a8	62656c39-1f1d-5a6e-b4d9-b5320dc37621	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-03-26 11:49:33.76+00
99581469-c400-4ad6-9df3-1663c5acfa34	f077b3df-c8db-5980-9d45-a9f18b43994f	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-03-26 13:06:33.754+00
a74031c0-0bc3-43d8-a6e3-9e7253ce3ded	f077b3df-c8db-5980-9d45-a9f18b43994f	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT62M"}	2025-03-26 14:08:33.754+00
ee9807c7-c503-4d82-af8e-b81873bd5688	f077b3df-c8db-5980-9d45-a9f18b43994f	dd4608c4-45ad-543d-a42c-6276790440d3	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-03-26 14:10:33.754+00
9115d7c5-4fe3-49d9-a9d1-a1135e65bf21	62656c39-1f1d-5a6e-b4d9-b5320dc37621	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT167M"}	2025-03-26 14:36:33.76+00
b0a41e21-ee26-4f87-b160-ad14010d9470	963076d1-bcef-5203-8e8a-5434830cb1b8	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-03-26 18:25:33.762+00
56cdca6b-e484-4325-93e0-5562448a00f7	963076d1-bcef-5203-8e8a-5434830cb1b8	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT87M"}	2025-03-26 19:52:33.762+00
d580bb72-7f81-4219-a590-0837fd34f6af	c2698837-3e82-5bfc-b624-027b8b1d98b4	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-03-26 20:18:33.77+00
ee643b85-912e-4dd9-a191-6338d9e050dd	c2698837-3e82-5bfc-b624-027b8b1d98b4	dd4608c4-45ad-543d-a42c-6276790440d3	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-03-26 20:28:33.77+00
32d29270-4bd7-4aba-a5b1-ed424f098bd8	c2698837-3e82-5bfc-b624-027b8b1d98b4	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-03-26 20:38:33.77+00
fae9730e-592b-4f7a-9e39-5b71fff20603	c2698837-3e82-5bfc-b624-027b8b1d98b4	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT86M"}	2025-03-26 21:44:33.77+00
6b7a7654-945c-4bf0-9223-4e38db375031	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-03-27 11:53:33.756+00
b61ac5ae-591d-4855-8b23-ea7eb161fefe	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT33M"}	2025-03-27 12:26:33.756+00
558c3d16-b0d9-4dd5-8a48-3c07e858348f	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-03-27 14:46:06.716+00
1472ba1f-aa99-420d-b0e5-3e152134fc4a	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-03-27 14:48:06.716+00
4ffed218-dd3a-4eff-b585-617291173113	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-03-27 15:11:33.762+00
aa468310-4506-478d-8121-cd4a1240ce4c	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT92M"}	2025-03-27 16:43:33.762+00
2dec7a5c-327a-496d-8d3b-3d21dc16378e	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-03-27 16:49:33.762+00
fefe9fd6-f7ca-4c0c-b507-45ad2d88a09c	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT405M"}	2025-03-27 21:33:06.716+00
c3805a67-ae04-4961-b0e1-9bc373604c4f	f077b3df-c8db-5980-9d45-a9f18b43994f	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-03-28 15:15:33.754+00
449fa8d5-3ccc-40ce-a81f-973cdc2d1ce4	f077b3df-c8db-5980-9d45-a9f18b43994f	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT50M"}	2025-03-28 16:05:33.754+00
f56ef441-ec39-42c1-ad30-a3fb5afddc6b	f077b3df-c8db-5980-9d45-a9f18b43994f	dd4608c4-45ad-543d-a42c-6276790440d3	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-03-28 16:07:33.754+00
605cdaa0-1c42-4b6d-a856-d200a37116dd	c2698837-3e82-5bfc-b624-027b8b1d98b4	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-03-28 16:56:33.77+00
7ef69365-28f8-464b-bb4b-d814f479f253	c2698837-3e82-5bfc-b624-027b8b1d98b4	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-03-28 17:04:33.77+00
969e526a-5136-4953-8d74-a3cff0f2f8e1	963076d1-bcef-5203-8e8a-5434830cb1b8	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-03-28 18:12:33.762+00
8e7a784a-48a9-4108-8396-04e4e9ad4fec	f077b3df-c8db-5980-9d45-a9f18b43994f	dd4608c4-45ad-543d-a42c-6276790440d3	scored	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.5738139689348263}}	2025-03-28 18:17:33.754+00
a26c1370-21b8-45bf-8797-a73f719f0cb3	c2698837-3e82-5bfc-b624-027b8b1d98b4	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT93M"}	2025-03-28 18:29:33.77+00
6c4274be-5a95-4740-a9ac-e96a60a48d6a	f077b3df-c8db-5980-9d45-a9f18b43994f	dd4608c4-45ad-543d-a42c-6276790440d3	completed	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.5738139689348263}}	2025-03-28 18:47:33.754+00
1b8ce92e-d4bf-4f18-b5f0-67ab2fc61bd0	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-03-28 19:11:23.165+00
07d2bda7-d553-4881-9da5-d15fee91ce43	963076d1-bcef-5203-8e8a-5434830cb1b8	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT150M"}	2025-03-28 20:42:33.762+00
f913bd3e-d609-4d97-985f-1237356bee3e	963076d1-bcef-5203-8e8a-5434830cb1b8	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-03-28 20:49:33.762+00
3685fcc4-8a5b-400a-b6d8-0f6ee14f4223	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT120M"}	2025-03-28 21:11:23.165+00
22449894-6817-430a-b54d-c525dfed2319	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-03-28 21:19:23.165+00
2a03e17e-ec74-4aed-8c7b-4adfa7e4ec5a	62656c39-1f1d-5a6e-b4d9-b5320dc37621	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-03-29 14:23:33.76+00
4e67aa6c-df44-4b1d-af97-b62b0a1bb3de	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-03-29 15:38:33.756+00
1834fe09-89d6-4711-ae63-be1a1ac08de8	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-03-29 15:42:33.756+00
919679da-b992-42ce-98d4-28dbe3cde818	963076d1-bcef-5203-8e8a-5434830cb1b8	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-03-29 15:50:33.762+00
6d597073-bc9d-4378-9eb1-3503e0bb1b10	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT30M"}	2025-03-29 16:12:33.756+00
c34e6c69-e4cb-4eec-bc01-47263cebea7a	62656c39-1f1d-5a6e-b4d9-b5320dc37621	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT110M"}	2025-03-29 16:13:33.76+00
ab675dd1-409d-4189-8996-400f7b08f2f3	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-03-29 16:17:33.756+00
25a22806-3a72-4af9-bf36-51352d9ff1ad	62656c39-1f1d-5a6e-b4d9-b5320dc37621	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-03-29 16:19:33.76+00
6363ff32-a7f6-4759-91c6-1db39b2d3646	963076d1-bcef-5203-8e8a-5434830cb1b8	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT121M"}	2025-03-29 17:51:33.762+00
a0524424-325c-4f96-8fa6-9db356f63997	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-03-30 11:42:33.76+00
3e47f7c5-e230-477f-a91c-66b857c8340f	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-03-30 12:10:07.247+00
a09a9e42-9912-45e4-b86b-bfdcefb1326a	963076d1-bcef-5203-8e8a-5434830cb1b8	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-03-30 14:35:33.762+00
26aa3192-38e1-45df-abaa-99369e3125d4	963076d1-bcef-5203-8e8a-5434830cb1b8	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT131M"}	2025-03-30 16:46:33.762+00
67d9356b-c15f-45ce-a1a2-0eb23abbf6ee	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT335M"}	2025-03-30 17:45:07.247+00
2e752db6-738b-45c4-97c6-dba6e6c291a2	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-03-30 17:49:07.247+00
5a9bb09f-0f4f-41fe-88a1-89cae0caf70a	c2698837-3e82-5bfc-b624-027b8b1d98b4	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-03-30 20:19:33.77+00
f4531080-bfd8-48ec-97a6-9335b2ac4874	c2698837-3e82-5bfc-b624-027b8b1d98b4	0895d383-5f59-51b2-ae8c-e0b985d81f1f	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-03-30 20:25:33.77+00
85ae6d4e-56f8-4fc1-b163-9e957561b02c	c2698837-3e82-5bfc-b624-027b8b1d98b4	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-03-30 20:35:33.77+00
a72a465c-2685-4d34-a110-bb1055385c1e	c2698837-3e82-5bfc-b624-027b8b1d98b4	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT97M"}	2025-03-30 21:56:33.77+00
40fe9fcb-ba9d-45a9-ba8d-1aff13410207	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-03-31 12:26:33.756+00
325ba23c-f372-4589-9c0a-37bdf1a4d09a	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT31M"}	2025-03-31 12:57:33.756+00
90326b23-aa58-4384-80a9-033fc7e63954	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-03-31 12:59:33.756+00
e735b89e-8b93-45d4-83fc-3ce2e0487259	c2698837-3e82-5bfc-b624-027b8b1d98b4	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-03-31 13:36:33.77+00
502ffa0b-81a4-431c-bc89-8fb8e4c1aa45	c2698837-3e82-5bfc-b624-027b8b1d98b4	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-03-31 13:44:33.77+00
f8fdb6c2-c70e-4bb9-8a0f-6f0efba5eb55	c2698837-3e82-5bfc-b624-027b8b1d98b4	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT90M"}	2025-03-31 15:06:33.77+00
909fa892-675a-4bb7-ad39-847271082795	963076d1-bcef-5203-8e8a-5434830cb1b8	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-03-31 16:22:33.762+00
b09377ed-d186-4fa4-944d-735217e0126e	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-03-31 16:41:33.76+00
ca08e386-3edb-4b84-b219-ce7a718421a4	963076d1-bcef-5203-8e8a-5434830cb1b8	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT59M"}	2025-03-31 17:21:33.762+00
b62b2a4a-8a6f-46e1-b029-67d1717646a9	963076d1-bcef-5203-8e8a-5434830cb1b8	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-03-31 17:30:33.762+00
cf6887a8-0900-45c7-8c30-7f7a6aa00fda	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT175M"}	2025-03-31 19:36:33.76+00
bd9c7839-8453-409e-9482-897c646b0b6a	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-03-31 19:40:33.76+00
a55558eb-67e2-4e95-b2b8-f8a5f8f72711	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-04-01 12:37:33.754+00
195abe53-9371-4ec1-baef-ed13a6c88933	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-01 12:39:33.754+00
cbb02927-19db-4d98-a207-4265f4ed072f	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT62M"}	2025-04-01 13:41:33.754+00
b2a69139-ae49-4b70-8746-2dae51ccc0fd	963076d1-bcef-5203-8e8a-5434830cb1b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-04-01 14:22:33.762+00
02784a90-790e-4d2c-8e5e-2504c135f7a4	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-04-01 14:25:49.247+00
b2480b91-ceab-435b-8856-46fbb9c259d0	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-04-01 14:30:49.247+00
0f658382-5135-4158-9271-9748bb1297f3	963076d1-bcef-5203-8e8a-5434830cb1b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT134M"}	2025-04-01 16:36:33.762+00
76751169-1853-4759-94a2-f93420d6e504	c2698837-3e82-5bfc-b624-027b8b1d98b4	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-04-01 18:29:33.77+00
7080bf9b-3317-4b27-90ce-a980c50d7fcf	c2698837-3e82-5bfc-b624-027b8b1d98b4	dd4608c4-45ad-543d-a42c-6276790440d3	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-04-01 18:36:33.77+00
f10e879e-b2fd-4e6e-ba6f-f127d908439d	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT300M"}	2025-04-01 19:30:49.247+00
e8b965a4-789a-4286-95ec-a3c4fe1211c6	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-04-01 19:35:49.247+00
c94bd4ca-8192-4ffd-ae67-a3b898c6683d	c2698837-3e82-5bfc-b624-027b8b1d98b4	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT70M"}	2025-04-01 19:39:33.77+00
d1de970b-ae03-4831-8a60-84ad18c02ce7	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-02 10:36:33.762+00
ec7ff3f3-d089-41cd-969f-7e6b6a012021	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-04-02 11:31:33.756+00
77558373-b036-4b41-8e21-6067aefac685	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT25M"}	2025-04-02 11:56:33.756+00
485fa424-3c44-4801-9a70-04fc66221661	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-04-02 11:57:33.756+00
0ee04264-a08a-4175-bc16-6c9f0f926059	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT89M"}	2025-04-02 12:05:33.762+00
934ba70a-8871-44e1-b173-aefe5fecfbec	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-04-02 12:43:33.76+00
823355cc-1001-4a0b-909f-9a663002323b	963076d1-bcef-5203-8e8a-5434830cb1b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-04-03 13:39:33.762+00
eb47eebb-4d5a-4891-9316-2066e96ed777	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-04-03 14:24:28.351+00
3d8e87e8-7cc6-4c8d-b4f4-7ea2ba750c4b	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-04-03 14:26:28.351+00
430b4eaa-e493-4875-9b50-db93e9d7ee30	c2698837-3e82-5bfc-b624-027b8b1d98b4	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-04-03 14:31:33.77+00
ce73f01c-36c9-412c-8fc0-8a92c502d6c7	c2698837-3e82-5bfc-b624-027b8b1d98b4	70423966-9ebb-5262-b082-4b8925547d57	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-04-03 14:40:33.77+00
d9453237-a5b6-41ec-b0fa-ea39a23d9fa8	c2698837-3e82-5bfc-b624-027b8b1d98b4	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-04-03 14:45:33.77+00
31e220e7-ca02-4199-8290-6badb71e2c9a	c2698837-3e82-5bfc-b624-027b8b1d98b4	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT92M"}	2025-04-03 16:03:33.77+00
26eb8423-db10-4840-8885-95d4c915142b	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-04-03 16:48:33.754+00
b509af29-2c2f-49d0-8780-07ba79267c97	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-03 16:51:33.754+00
8d5a0b5d-cedb-4ec7-a108-9f08bd27ad1a	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT152M"}	2025-04-03 16:58:28.351+00
03d2afe8-e8e6-4b24-81f1-5fa56892af63	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT52M"}	2025-04-03 17:43:33.754+00
a5608643-8831-45bb-94c8-5ae64a0dc201	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-04-04 13:12:33.756+00
0ba04580-1948-4fe4-9329-34c80191a4cb	62656c39-1f1d-5a6e-b4d9-b5320dc37621	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-04-04 13:13:33.76+00
96db79cb-5623-4c2c-9bda-387d6ba3888f	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT29M"}	2025-04-04 13:41:33.756+00
f889bbe6-1a34-4450-8ea1-eab8536ee1d8	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-04-04 13:46:33.756+00
31405b9c-7d24-4384-8c87-1d29d76b047c	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-04 14:57:33.754+00
c5ad7208-4c5b-4663-9af1-8f201417f3e7	62656c39-1f1d-5a6e-b4d9-b5320dc37621	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT143M"}	2025-04-04 15:36:33.76+00
45479255-0d54-4930-b9bd-f42679734a68	62656c39-1f1d-5a6e-b4d9-b5320dc37621	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-04-04 15:46:33.76+00
5e4bcb2b-69b0-4c52-abfa-5debfc041477	963076d1-bcef-5203-8e8a-5434830cb1b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-04 15:48:33.762+00
07e56d6f-a010-4234-a075-792b077e0b6b	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT60M"}	2025-04-04 15:57:33.754+00
f05779e9-3137-4d8b-bd14-dc8281cf85a9	c2698837-3e82-5bfc-b624-027b8b1d98b4	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-04-04 16:27:33.77+00
bbad1b03-53a2-4580-8e17-b21211197394	c2698837-3e82-5bfc-b624-027b8b1d98b4	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-04 16:30:33.77+00
f663c825-d73b-4416-91d3-131de52c8909	c2698837-3e82-5bfc-b624-027b8b1d98b4	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-04-04 16:36:33.77+00
a9fb41c8-bae8-4b28-bfbb-b210622b2015	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	scored	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.7740062097883718}}	2025-04-04 17:45:33.756+00
2c766daa-60ee-457c-a4aa-d14b921c5a98	c2698837-3e82-5bfc-b624-027b8b1d98b4	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT84M"}	2025-04-04 17:51:33.77+00
54e049a6-1cff-4dcf-8085-fb9f34c4102f	9e6eaafb-451e-5224-b656-fbd90faee84a	f10c153c-968c-5979-b6cc-05736dc40095	completed	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.7740062097883718}}	2025-04-04 18:10:33.756+00
c021a34c-7a99-4d6c-80dc-7a78c13fadbe	963076d1-bcef-5203-8e8a-5434830cb1b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT143M"}	2025-04-04 18:11:33.762+00
0b5e049e-42bd-4555-ab37-d2b2905b1f54	963076d1-bcef-5203-8e8a-5434830cb1b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-04-04 18:17:33.762+00
0dfc3d0d-d9bb-4c4c-acff-7b76bf33c002	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-04-05 11:00:33.76+00
00451573-e04e-48f5-8bae-97183a8d34be	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-05 12:56:33.754+00
93a58a3a-abc5-4177-90c1-51080554a8cf	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT56M"}	2025-04-05 13:52:33.754+00
8ad67278-547a-49bf-b12e-dc2e0ba2f7cc	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-04-05 13:55:33.754+00
b0f5b99e-4bee-45c6-ad3c-ff72242de8b7	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT182M"}	2025-04-05 14:02:33.76+00
8ea22207-ec62-4e73-be57-18393552f1a6	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-04-05 14:25:50.174+00
e6f32f2b-84e6-4195-9c64-37ab2e0ba388	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-04-05 14:28:50.174+00
4dffd162-d42f-41ff-bb43-5f1c6ee76169	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	scored	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.3872046310215093}}	2025-04-05 16:34:33.754+00
16c82682-3f65-4971-934c-4f2954f0d22a	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	failed	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.3872046310215093}}	2025-04-05 17:04:33.754+00
8836bdc5-147b-40eb-9215-846d3fd05431	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT327M"}	2025-04-05 19:55:50.174+00
613f3581-57da-41be-aad4-60e98674db55	9e6eaafb-451e-5224-b656-fbd90faee84a	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-04-06 11:47:33.756+00
48334e0f-e917-4b42-a466-49677ae2565a	9e6eaafb-451e-5224-b656-fbd90faee84a	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT27M"}	2025-04-06 12:14:33.756+00
95f72b9e-8539-40a3-bde9-5ec48363cf3e	9e6eaafb-451e-5224-b656-fbd90faee84a	628435a2-1aba-5f57-8452-22f0f6fe8b5a	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-06 12:17:33.756+00
ea19871d-d531-46b0-b7ca-cd013860ad3f	62656c39-1f1d-5a6e-b4d9-b5320dc37621	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-04-06 17:38:33.76+00
1f00e5b0-e205-4693-9e37-2a81365dc78c	963076d1-bcef-5203-8e8a-5434830cb1b8	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-04-06 18:30:33.762+00
e8ada5a8-0fa6-41c3-bc32-ba239e74aa2b	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-04-06 19:41:47.27+00
068b7204-463d-4ca3-b955-edd03ad929a5	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-04-06 19:44:47.27+00
d72fd950-3c7f-4305-b3f6-abe34adfe679	963076d1-bcef-5203-8e8a-5434830cb1b8	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT105M"}	2025-04-06 20:15:33.762+00
54735ac4-8ba2-4e4b-a6c2-10ff218e2da9	963076d1-bcef-5203-8e8a-5434830cb1b8	70423966-9ebb-5262-b082-4b8925547d57	scored	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.5761623642074534}}	2025-04-06 20:27:33.762+00
b0ee96c4-c0d7-4c4f-b8fa-6022a2bb3029	963076d1-bcef-5203-8e8a-5434830cb1b8	70423966-9ebb-5262-b082-4b8925547d57	completed	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.5761623642074534}}	2025-04-06 20:28:33.762+00
2be980d0-a663-4da6-a401-a93e1fed0da3	62656c39-1f1d-5a6e-b4d9-b5320dc37621	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT175M"}	2025-04-06 20:33:33.76+00
5c56ddba-6908-4073-afee-e3be3a1866f9	963076d1-bcef-5203-8e8a-5434830cb1b8	70423966-9ebb-5262-b082-4b8925547d57	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-06 20:36:33.762+00
43681066-dc7f-486b-989f-e1a703c2dea1	62656c39-1f1d-5a6e-b4d9-b5320dc37621	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-04-06 20:39:33.76+00
672b1a72-3b9d-4f96-838a-e1263a17c46f	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT125M"}	2025-04-06 21:49:47.27+00
dfad8995-e3d0-456c-8bec-dc79b9a6bae3	963076d1-bcef-5203-8e8a-5434830cb1b8	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-04-07 14:21:33.762+00
9b286ee8-1c53-4745-af82-f1f6f5e57744	963076d1-bcef-5203-8e8a-5434830cb1b8	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT90M"}	2025-04-07 15:51:33.762+00
42c576fe-a7fd-4493-8d20-e87e693ab1d9	963076d1-bcef-5203-8e8a-5434830cb1b8	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-04-07 15:58:33.762+00
4e8d1721-66dc-4cfa-aa13-59a8d3ce3706	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-04-08 10:10:33.762+00
8c0816f0-7ecd-43a6-b1d7-80492d1aec85	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT131M"}	2025-04-08 12:21:33.762+00
aee0a494-61f4-4744-bd19-fc455b21df75	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-04-08 12:25:28.472+00
1c9aaf68-c5ca-49a6-b7fd-0f1b137dddbb	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-04-08 12:29:28.472+00
df14f5cb-a138-4184-ae30-c95cdf807e8b	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-04-08 12:31:33.762+00
96a6b29a-9ce5-4feb-9237-9cac9efbada5	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-04-08 13:32:33.76+00
b0755f72-49c0-48e3-a8d4-230911a1fcd1	9e6eaafb-451e-5224-b656-fbd90faee84a	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-04-08 15:39:33.756+00
42b46ca2-a1d5-487f-b520-aab79152041c	9e6eaafb-451e-5224-b656-fbd90faee84a	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-04-08 15:43:33.756+00
45146771-72dc-4fc7-ae0b-52de7d974996	9e6eaafb-451e-5224-b656-fbd90faee84a	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT32M"}	2025-04-08 16:15:33.756+00
bb07b8b3-8446-4a82-864d-75fe74c4e53b	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT166M"}	2025-04-08 16:18:33.76+00
66bacffe-f76b-424e-8a73-04af51ab13af	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT271M"}	2025-04-08 17:00:28.472+00
b1b3fb54-5c62-4919-be19-91e4639b7d96	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-04-08 17:03:28.472+00
bbf387f8-3057-49e6-a94f-6b4c784ceb49	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-04-08 18:27:33.754+00
802152bf-ccab-4dc3-a3bf-ea3f3c179e39	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-08 18:32:33.754+00
266c3202-4eac-4b1f-afe3-4e84ac002e49	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT51M"}	2025-04-08 19:23:33.754+00
427466e5-6a4b-4306-8227-5cd3090f3279	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	scored	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.4245583678304486}}	2025-04-08 20:27:33.754+00
1d3f5f24-7a68-43e3-9efc-0a7d32c2abff	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	failed	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.4245583678304486}}	2025-04-08 20:46:33.754+00
af3d95a5-7cea-4408-bce9-3aba4d14a49a	9e6eaafb-451e-5224-b656-fbd90faee84a	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-04-09 12:32:33.756+00
bee80595-c70f-484f-a1a3-07fc85d8444f	9e6eaafb-451e-5224-b656-fbd90faee84a	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-04-09 12:36:33.756+00
6d5bb193-572d-4ebc-892e-72e893e332e6	c2698837-3e82-5bfc-b624-027b8b1d98b4	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-04-09 13:06:33.77+00
f6f0ab8b-a92e-41dc-ab97-441d353ab713	9e6eaafb-451e-5224-b656-fbd90faee84a	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT33M"}	2025-04-09 13:09:33.756+00
0b91507e-2b3f-4c0e-965e-0472be359159	c2698837-3e82-5bfc-b624-027b8b1d98b4	70423966-9ebb-5262-b082-4b8925547d57	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-09 13:12:33.77+00
42931549-c53e-4681-924e-711a8558afd0	963076d1-bcef-5203-8e8a-5434830cb1b8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-04-09 13:44:33.762+00
8b7138de-2427-4075-8939-f6494e04e7f9	c2698837-3e82-5bfc-b624-027b8b1d98b4	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT51M"}	2025-04-09 13:57:33.77+00
84df348c-8155-4d5f-b6b7-096756effc6d	963076d1-bcef-5203-8e8a-5434830cb1b8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT148M"}	2025-04-09 16:12:33.762+00
2a4f1dcf-63f3-4b99-a4e8-f531342d6284	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-04-10 13:14:33.754+00
72873150-5853-44f5-854e-21808c508168	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-10 13:16:33.754+00
1c120b13-476d-46c7-b883-eeae6dd79133	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT61M"}	2025-04-10 14:17:33.754+00
b96e882c-755b-4d18-b690-4a6df358677d	9e6eaafb-451e-5224-b656-fbd90faee84a	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-04-10 15:04:33.756+00
4170c7df-44c5-44b8-b33c-f45e9d5db49f	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-04-10 15:26:33.76+00
11c7591a-2202-4b8d-b377-b8b308badf89	9e6eaafb-451e-5224-b656-fbd90faee84a	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT31M"}	2025-04-10 15:35:33.756+00
36885b7c-3fd8-4d1a-9ac1-b038fa7d081f	9e6eaafb-451e-5224-b656-fbd90faee84a	628435a2-1aba-5f57-8452-22f0f6fe8b5a	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-10 15:40:33.756+00
b7afae29-a3bd-423f-9fa6-eaea6f561e61	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT95M"}	2025-04-10 17:01:33.76+00
da94ca72-06ba-4e7a-ae88-924a9768c5dd	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	scored	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.4754770754662632}}	2025-04-10 17:45:33.754+00
82368c80-76c8-4aab-ae3e-9b57c0b1e70d	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	failed	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.4754770754662632}}	2025-04-10 18:00:33.754+00
c479801f-49a6-4378-a62b-2a125e8ec43d	963076d1-bcef-5203-8e8a-5434830cb1b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-04-10 19:09:33.762+00
0851e9f8-41d6-4a5d-99ed-80ef4d424a45	963076d1-bcef-5203-8e8a-5434830cb1b8	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT113M"}	2025-04-16 14:21:33.762+00
69a8225e-0157-4795-b29d-4cf45769f473	9e6eaafb-451e-5224-b656-fbd90faee84a	628435a2-1aba-5f57-8452-22f0f6fe8b5a	scored	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.5466761902800374}}	2025-04-10 19:26:33.756+00
ef232d72-5c37-416f-a38f-84aef1be8754	963076d1-bcef-5203-8e8a-5434830cb1b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	scored	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.6886441671395549}}	2025-04-10 19:32:33.762+00
f3839a10-89f3-4f6f-a4a7-346512b527a9	963076d1-bcef-5203-8e8a-5434830cb1b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	completed	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.6886441671395549}}	2025-04-10 19:33:33.762+00
612bcf89-1249-4f4a-a658-024c7bb1dc43	963076d1-bcef-5203-8e8a-5434830cb1b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-10 19:40:33.762+00
87bed3a9-62d9-4581-8993-5a27648880d3	9e6eaafb-451e-5224-b656-fbd90faee84a	628435a2-1aba-5f57-8452-22f0f6fe8b5a	completed	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.5466761902800374}}	2025-04-10 19:51:33.756+00
c384027b-9b81-44d1-9fcc-0bba7dd1e042	963076d1-bcef-5203-8e8a-5434830cb1b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-04-11 12:36:33.762+00
c030dd54-cc2a-4e77-b774-7fe08b775fc9	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-04-11 13:19:26.681+00
27231428-43b2-4a01-a321-89b0786d95e7	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-11 13:22:26.681+00
b64e8912-af74-4836-8a23-52bbbce71acd	963076d1-bcef-5203-8e8a-5434830cb1b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT58M"}	2025-04-11 13:34:33.762+00
e4b43fa6-d3c9-431f-8f6d-97e1da76b95f	963076d1-bcef-5203-8e8a-5434830cb1b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-04-11 13:43:33.762+00
6dfc75a2-cc21-4135-9e48-f2eba51a46f0	963076d1-bcef-5203-8e8a-5434830cb1b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	scored	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.72165190726706}}	2025-04-11 14:34:33.762+00
87c10960-205a-40b3-82d0-32ab3cb65b12	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-04-11 14:34:58.083+00
b303dfaf-b8a3-421a-8e76-93d2b2fc38f0	963076d1-bcef-5203-8e8a-5434830cb1b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	completed	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.72165190726706}}	2025-04-11 14:35:33.762+00
c961cf77-a6dc-4c1b-96f4-4194e6d60ba0	963076d1-bcef-5203-8e8a-5434830cb1b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-04-11 14:41:33.762+00
8c26233c-b472-4318-9c97-6364c922dd04	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT182M"}	2025-04-11 17:36:58.083+00
fdf4729b-66b7-4f48-bb60-b1e6d3c1ca84	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-04-11 17:40:58.083+00
58d052bd-e483-4c8e-86eb-51d16da4b1be	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT315M"}	2025-04-11 18:37:26.681+00
bd266b88-02c9-4851-98ee-8ef6fc1644b9	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-04-11 18:41:33.754+00
79e404e3-48ec-4beb-8105-368ce65d083e	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-04-11 18:46:26.681+00
47d85d2c-c947-4a1b-b7aa-48549c2a24ce	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-11 18:46:33.754+00
8ebd552b-859b-4257-a44a-2ec300d66d67	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT68M"}	2025-04-11 19:54:33.754+00
f89a6f30-db27-4553-a2cc-993cc493cceb	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	scored	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.4910163066401774}}	2025-04-11 21:01:33.754+00
a644d99c-1319-4b86-9b31-d036e11d5a8a	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	failed	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.4910163066401774}}	2025-04-11 21:30:33.754+00
7fd09572-d417-4a9c-bccb-6cc545fdbdc4	62656c39-1f1d-5a6e-b4d9-b5320dc37621	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-04-12 11:41:33.76+00
450534f1-65d6-48a1-9588-fa2ec5b93bed	62656c39-1f1d-5a6e-b4d9-b5320dc37621	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT188M"}	2025-04-12 14:49:33.76+00
c9bd9594-24b3-4ed3-b690-e9173dd86c73	62656c39-1f1d-5a6e-b4d9-b5320dc37621	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-04-12 14:54:33.76+00
879d79ef-bc35-457e-9d94-febbb6d844a7	62656c39-1f1d-5a6e-b4d9-b5320dc37621	fcc40587-6fbe-570f-8676-ba7f80daec71	scored	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8009496210237481}}	2025-04-12 15:54:33.76+00
9ff812a2-bc59-4a3f-bd1f-05d5abbfe9bc	62656c39-1f1d-5a6e-b4d9-b5320dc37621	fcc40587-6fbe-570f-8676-ba7f80daec71	completed	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8009496210237481}}	2025-04-12 15:55:33.76+00
525a7568-951e-4a42-985a-5e1cbd1f6b6e	62656c39-1f1d-5a6e-b4d9-b5320dc37621	fcc40587-6fbe-570f-8676-ba7f80daec71	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-12 16:01:33.76+00
47ee8b6d-a54f-43da-ae56-8947aed06905	62656c39-1f1d-5a6e-b4d9-b5320dc37621	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-04-13 14:39:33.76+00
8f3a209f-5576-4779-ab18-d659fe506dc0	62656c39-1f1d-5a6e-b4d9-b5320dc37621	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT138M"}	2025-04-13 16:57:33.76+00
cfced5e7-7e96-4a3d-8605-d2d53f21a35d	62656c39-1f1d-5a6e-b4d9-b5320dc37621	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-04-13 17:02:33.76+00
a6133f27-27b4-4c6d-b27d-36167dd31323	963076d1-bcef-5203-8e8a-5434830cb1b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-04-13 20:44:33.762+00
4ba5ee28-a56e-4536-8db6-13e0c9b8c41d	963076d1-bcef-5203-8e8a-5434830cb1b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT77M"}	2025-04-13 22:01:33.762+00
aa3861f8-0b4d-4f29-87e7-583d4b3120a6	9e6eaafb-451e-5224-b656-fbd90faee84a	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-14 11:52:33.756+00
d03c041a-a633-4b4c-b7d6-cd3c3a3e58d1	9e6eaafb-451e-5224-b656-fbd90faee84a	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT26M"}	2025-04-14 12:18:33.756+00
9a9668e1-0217-4403-8a61-4b8c070a61d0	9e6eaafb-451e-5224-b656-fbd90faee84a	0f8226a0-d513-534c-871b-15d9f310349b	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-14 12:19:33.756+00
692617ea-5d5d-4c97-8e8c-783e18a83678	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-14 12:52:33.76+00
45cd1c9c-ae71-4ecb-9bf1-5cafe921e1e2	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-04-14 13:43:11.983+00
78449ac5-3133-40aa-b81b-3a92634d90a5	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-04-14 13:46:11.983+00
51ac6aac-c35c-480f-9e2f-343d39918b73	963076d1-bcef-5203-8e8a-5434830cb1b8	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-04-14 14:00:33.762+00
84036ecc-9f4b-4e0d-8e3f-aed3d1d2ab91	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT135M"}	2025-04-14 15:07:33.76+00
3f719dbf-7fc0-4990-a849-e20f0e0801e5	963076d1-bcef-5203-8e8a-5434830cb1b8	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT138M"}	2025-04-14 16:18:33.762+00
d3a35775-db39-48ea-9f0d-bbd5f0c9f637	963076d1-bcef-5203-8e8a-5434830cb1b8	f10c153c-968c-5979-b6cc-05736dc40095	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-04-14 16:22:33.762+00
2e8f56b4-d090-4350-bffb-687cf9d23f01	963076d1-bcef-5203-8e8a-5434830cb1b8	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-04-14 16:32:33.762+00
8d7608e9-2a9b-41ee-826d-276c28d00410	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-14 19:12:33.754+00
120246f9-82c7-434f-8d97-52d7d28890a0	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT52M"}	2025-04-14 20:04:33.754+00
bb27bb57-355d-4351-8605-15b0bcee087a	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-04-14 20:24:45.406+00
26552752-6111-416e-90c7-e6014ed58600	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT402M"}	2025-04-14 20:28:11.983+00
26ec9ce1-724f-4217-8e47-e3f5e366f0f9	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-04-14 20:37:11.983+00
f34d9912-4217-4b09-a505-6773fb5aed80	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	scored	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.5793667769705695}}	2025-04-14 21:39:33.754+00
11ead435-bdb9-47a5-91eb-1517d5b884f8	f077b3df-c8db-5980-9d45-a9f18b43994f	f8743c64-6b32-5a84-a231-88eaa828b8f3	completed	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.5793667769705695}}	2025-04-14 21:57:33.754+00
e71dee57-bee4-456a-9ace-310310932192	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT171M"}	2025-04-14 23:15:45.406+00
defb092a-1105-4944-b361-e7ac6ac9ea00	963076d1-bcef-5203-8e8a-5434830cb1b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-04-15 14:41:33.762+00
cf916fe9-1580-44b1-899f-52f677ae32e7	963076d1-bcef-5203-8e8a-5434830cb1b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT119M"}	2025-04-15 16:40:33.762+00
22164dbe-6187-4b1e-aa62-56dc609cfddb	963076d1-bcef-5203-8e8a-5434830cb1b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-04-15 16:48:33.762+00
af5059bf-c7bd-413e-8b5e-eefccc75842c	963076d1-bcef-5203-8e8a-5434830cb1b8	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-04-16 12:28:33.762+00
9f6f7fec-9869-4b06-8088-1a454eab7379	9e6eaafb-451e-5224-b656-fbd90faee84a	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-04-16 12:30:33.756+00
7c190f2f-08b4-4fa7-93b8-24cb16d90969	9e6eaafb-451e-5224-b656-fbd90faee84a	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-16 12:32:33.756+00
eaff9a2f-d0ae-45f4-95f3-a20787dec703	9e6eaafb-451e-5224-b656-fbd90faee84a	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT36M"}	2025-04-16 13:08:33.756+00
3a910dca-e637-4a66-857e-86856c896a57	62656c39-1f1d-5a6e-b4d9-b5320dc37621	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-04-16 14:23:33.76+00
41c141ff-7326-4e03-bfde-728db07d7eac	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-04-16 14:24:14.865+00
48b128e5-bc9f-490b-b541-c0154dd2412d	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-04-16 14:27:14.865+00
82dd71ee-6e54-44d3-80ee-c3cd4301d812	963076d1-bcef-5203-8e8a-5434830cb1b8	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-04-16 14:29:33.762+00
084291e7-47fa-4da2-a392-8a1d7bf067ff	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-04-16 14:30:15.979+00
e8ae117c-8a90-485d-9584-286aaba88fec	963076d1-bcef-5203-8e8a-5434830cb1b8	dd4608c4-45ad-543d-a42c-6276790440d3	scored	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.5834259231590693}}	2025-04-16 14:58:33.762+00
3eb98a12-7074-40cc-930f-d868c5bec0e9	963076d1-bcef-5203-8e8a-5434830cb1b8	dd4608c4-45ad-543d-a42c-6276790440d3	completed	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.5834259231590693}}	2025-04-16 14:59:33.762+00
a9d01874-1cbb-4065-9024-82d671a10e2a	963076d1-bcef-5203-8e8a-5434830cb1b8	dd4608c4-45ad-543d-a42c-6276790440d3	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-16 15:05:33.762+00
a9f179c4-08a8-4afc-9d01-9b451f7c363b	62656c39-1f1d-5a6e-b4d9-b5320dc37621	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT88M"}	2025-04-16 15:51:33.76+00
62f22443-7f1a-45ce-ba61-2f31410df61c	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT320M"}	2025-04-16 19:47:14.865+00
ddbdec82-b544-4168-8de9-36abf8936cc7	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-04-16 19:54:14.865+00
eeb090a3-2355-4e94-85c3-55d7677862e5	f077b3df-c8db-5980-9d45-a9f18b43994f	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-04-17 13:52:33.754+00
713e4815-9157-438e-9d99-70bb3d02733b	9e6eaafb-451e-5224-b656-fbd90faee84a	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-17 14:35:33.756+00
7f16b987-a1a2-4745-ad3d-aebdb9ac5e70	f077b3df-c8db-5980-9d45-a9f18b43994f	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT49M"}	2025-04-17 14:41:33.754+00
f3178092-9a25-45f4-a9b4-5d3d5b3060c7	9e6eaafb-451e-5224-b656-fbd90faee84a	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT30M"}	2025-04-17 15:05:33.756+00
aeaca263-da8a-4635-8688-e802e3feb71d	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-04-17 16:16:33.762+00
5b1bdfa1-0c2a-42de-8ebc-7dfd4529705b	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT113M"}	2025-04-17 18:09:33.762+00
9b00307c-d721-4113-8b7b-70bc6e569a2e	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-04-17 18:12:33.762+00
79f26cd4-89e8-4164-85cc-a2f7f87a4e97	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-04-18 12:53:15.036+00
750b9827-bca2-4f2a-acd4-3f05479c2ce6	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-04-18 12:56:15.036+00
bc7f28d3-1391-449c-86db-06b183a50b1f	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-04-18 13:56:33.762+00
7d2b5b90-8ebf-4987-b0d0-f663dfbd766f	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT163M"}	2025-04-18 15:39:15.036+00
6a9ddc6a-b2cd-4dfe-b23f-ff3c41bc5887	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-04-18 15:44:15.036+00
f3cc8a0b-e814-4e0c-87d5-15614995e7fd	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-04-18 16:05:01.671+00
4fe935d2-bb9e-4c5f-a0eb-afee7f0a05ff	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-04-18 16:07:01.671+00
d22d8c2c-1407-4f6d-911c-590b2d38ecf6	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT130M"}	2025-04-18 18:17:01.671+00
8835e984-ebf6-4f37-89e3-27d8c2d81b87	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	scored	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.487769758902567}}	2025-04-18 18:46:01.671+00
6176a6fa-c068-4c45-b63b-88d4459da44a	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	failed	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.487769758902567}}	2025-04-18 18:47:01.671+00
6b41da0a-f9e8-4d7a-b753-44f43aa96242	62656c39-1f1d-5a6e-b4d9-b5320dc37621	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-04-19 12:29:33.76+00
17f5ad13-710b-41a3-b538-74d7536e88b5	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-04-19 12:34:33.758+00
7a694339-7164-41e8-af9f-0411a1a6440f	025122bf-9317-5a26-a542-61d51306d411	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-04-19 12:34:33.77+00
69c42947-5cd0-47e7-91d2-3780447055c7	025122bf-9317-5a26-a542-61d51306d411	6db96e1f-b595-5aec-adbb-46b408029b79	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-19 12:39:33.77+00
c740b5c8-4a1b-47c1-90d1-f6618a301baa	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-04-19 12:44:33.764+00
6ea166c9-3edc-4432-a0b4-74ac15b5f15b	025122bf-9317-5a26-a542-61d51306d411	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-04-19 12:47:33.77+00
559c5639-5f4e-4b80-8650-972c5ee4425b	d8b612a2-dc91-5792-8e83-e230551cbe05	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-04-19 12:48:33.764+00
07b84ee0-13a8-46c5-b9a0-60b7be3c0313	9e6eaafb-451e-5224-b656-fbd90faee84a	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-19 13:12:33.756+00
4c9270b9-220c-4666-b2b7-43f7f246e98f	9e6eaafb-451e-5224-b656-fbd90faee84a	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT27M"}	2025-04-19 13:39:33.756+00
725f3d01-05b0-4656-ac51-5a3f02150e86	62656c39-1f1d-5a6e-b4d9-b5320dc37621	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT71M"}	2025-04-19 13:40:33.76+00
7b396f27-21b7-4ef7-b9ff-3f7c0685ab62	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT76M"}	2025-04-19 13:50:33.758+00
5435f129-7884-4218-8502-daaadd8a5a48	025122bf-9317-5a26-a542-61d51306d411	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT91M"}	2025-04-19 14:05:33.77+00
b2aeb6f3-05c1-4dae-8e1d-eed389ea644b	f077b3df-c8db-5980-9d45-a9f18b43994f	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-04-19 14:37:33.754+00
b803f192-2b47-4fb9-861d-67a364ec7c0c	d8b612a2-dc91-5792-8e83-e230551cbe05	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT132M"}	2025-04-19 15:00:33.764+00
827e924d-2c10-4a7b-9a69-93c791400a7c	d8b612a2-dc91-5792-8e83-e230551cbe05	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-04-19 15:07:33.764+00
97aa4bc8-97fc-477f-a2a1-d6fa8eaf63f1	f077b3df-c8db-5980-9d45-a9f18b43994f	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT61M"}	2025-04-19 15:38:33.754+00
d483554b-5e84-4895-a9a8-df034e0a9d63	963076d1-bcef-5203-8e8a-5434830cb1b8	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-04-19 19:15:33.762+00
3d2a3ac9-9017-46ff-8277-369305e4fd46	963076d1-bcef-5203-8e8a-5434830cb1b8	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT108M"}	2025-04-19 21:03:33.762+00
a50590b3-af06-4711-88ba-d7ba1829f529	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-04-20 11:35:33.76+00
6d02e0fb-e019-42eb-9ac5-575f4d90b4b2	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-04-20 12:43:33.751+00
475e8a43-7cfd-43f1-8413-ef3b5713a1b6	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-20 12:48:33.751+00
99931ceb-17fe-4705-a1cc-d146b9f6c6a0	9e6eaafb-451e-5224-b656-fbd90faee84a	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-20 13:58:33.756+00
eae1ff09-ac08-4e59-8362-be9e25155dd2	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT74M"}	2025-04-20 14:02:33.751+00
7c5c4b6a-9de9-40ea-a946-bf5e7ad630f5	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-04-20 14:07:33.751+00
4c55847b-4c17-4d2c-b1d9-80a073fafa76	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT168M"}	2025-04-20 14:23:33.76+00
cfc764ed-c416-4a51-a449-8c1e7ee0b980	9e6eaafb-451e-5224-b656-fbd90faee84a	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT31M"}	2025-04-20 14:29:33.756+00
945946c7-b366-464d-a8ef-eaf7c15538dc	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0895d383-5f59-51b2-ae8c-e0b985d81f1f	scored	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.8730045902793702}}	2025-04-20 15:17:33.76+00
606d2215-52ee-47ef-8950-40c0592a0642	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0895d383-5f59-51b2-ae8c-e0b985d81f1f	completed	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.8730045902793702}}	2025-04-20 15:18:33.76+00
513e8ff5-c2f4-4b44-a7d9-cb02b79d2c59	9e6eaafb-451e-5224-b656-fbd90faee84a	0f8226a0-d513-534c-871b-15d9f310349b	scored	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.6443558281110318}}	2025-04-20 17:11:33.756+00
1e1aaaac-4509-4a3a-a5b2-c42752143a5e	9e6eaafb-451e-5224-b656-fbd90faee84a	0f8226a0-d513-534c-871b-15d9f310349b	completed	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.6443558281110318}}	2025-04-20 17:39:33.756+00
abc026da-6249-45dc-aba9-a3c6451c0fe3	963076d1-bcef-5203-8e8a-5434830cb1b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-04-20 17:43:33.762+00
761a1a16-7704-46e6-8d9f-65c7a2de49ad	963076d1-bcef-5203-8e8a-5434830cb1b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT150M"}	2025-04-20 20:13:33.762+00
12b8d3ac-8fee-41cc-b36c-b69ee71a5d05	025122bf-9317-5a26-a542-61d51306d411	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-21 11:18:33.77+00
d1abaabb-622f-475b-9995-2ae36c74d415	025122bf-9317-5a26-a542-61d51306d411	f8743c64-6b32-5a84-a231-88eaa828b8f3	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-21 11:28:33.77+00
31a15030-7275-4e7f-a167-4cced1eab07c	025122bf-9317-5a26-a542-61d51306d411	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-04-21 11:33:33.77+00
8de28beb-556b-444f-8f98-3606e7d1a2ee	d8b612a2-dc91-5792-8e83-e230551cbe05	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-04-21 12:10:19.758+00
77a1222a-d729-45b8-b5c6-34665818dacd	d8b612a2-dc91-5792-8e83-e230551cbe05	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-04-21 12:14:19.758+00
9a609b55-fde0-4e27-a679-7061931968fe	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-21 12:56:33.751+00
c289896c-e768-4782-b368-717a383122f5	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-21 13:32:33.762+00
e4fd6fae-b315-476f-bf36-cd6205072a19	025122bf-9317-5a26-a542-61d51306d411	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT157M"}	2025-04-21 13:55:33.77+00
e9cc2ff2-3672-4573-beaf-731681bf0d40	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT83M"}	2025-04-21 14:19:33.751+00
47797be8-6bf4-470c-9557-d28467a5ebe9	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT88M"}	2025-04-21 15:00:33.762+00
2e855d13-0bec-4784-9a1a-83579b7a110a	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-04-21 15:05:33.762+00
3237a761-a812-4042-8ad2-6dba45f1f162	e94bb903-b682-50b3-984a-ecdfc8b428b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-04-21 16:34:33.758+00
adf54bc2-d2f1-4e58-8155-3c1c811c529a	d8b612a2-dc91-5792-8e83-e230551cbe05	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT333M"}	2025-04-21 17:47:19.758+00
bfff969e-d111-47ef-9d4d-d19355df8731	d8b612a2-dc91-5792-8e83-e230551cbe05	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-04-21 17:51:19.758+00
645b552d-7095-4877-bba6-77e44834042a	e94bb903-b682-50b3-984a-ecdfc8b428b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT87M"}	2025-04-21 18:01:33.758+00
77be84eb-9147-45ed-afa9-6503049b70e4	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-04-21 18:01:42.486+00
c058dd79-34da-4493-aa6f-587d0eafb3ec	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-04-21 18:03:42.486+00
74295f11-68a2-4ad5-a941-5883827f61a3	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT151M"}	2025-04-21 20:34:42.486+00
54a7a707-6fa7-4ecf-a760-4a54fbb32112	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-04-22 12:02:33.756+00
f02185f6-33d6-46b6-978c-0cfa8fc3ace1	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-04-22 12:07:33.756+00
3dcc9264-cd1d-4b08-81fd-529a334958b0	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT27M"}	2025-04-22 12:34:33.756+00
0a8b255e-9f73-490b-81e4-626abcba0c4a	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-22 12:38:33.756+00
611de1fc-6380-4409-bdf4-fb4d210203b7	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-22 14:06:33.758+00
ab3a9e91-57e5-4c80-a8fd-93b48c4eefc0	963076d1-bcef-5203-8e8a-5434830cb1b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-04-22 14:26:33.762+00
dfd18dc1-9020-4b23-9ecb-7cc495d18b83	62656c39-1f1d-5a6e-b4d9-b5320dc37621	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-04-22 14:47:33.76+00
be367892-316a-4760-a6ee-44418aa7a4de	963076d1-bcef-5203-8e8a-5434830cb1b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT56M"}	2025-04-22 15:22:33.762+00
4f480761-d61a-449a-9928-09346264a8c0	963076d1-bcef-5203-8e8a-5434830cb1b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-04-22 15:25:33.762+00
ed87a7e6-a87c-4e1d-a867-24b8e59496b2	963076d1-bcef-5203-8e8a-5434830cb1b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	scored	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.7117797979222846}}	2025-04-22 15:57:33.762+00
b7cdfebb-4a56-4085-97d8-04781e97ab7e	963076d1-bcef-5203-8e8a-5434830cb1b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	completed	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.7117797979222846}}	2025-04-22 15:58:33.762+00
22602d09-761e-4bf1-9e62-5956615f1a37	963076d1-bcef-5203-8e8a-5434830cb1b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-22 16:00:33.762+00
b3b9c196-1215-43f8-96b9-a1e024f0fcea	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT132M"}	2025-04-22 16:18:33.758+00
f0b70014-605b-4de0-ac93-1528068f3bd2	62656c39-1f1d-5a6e-b4d9-b5320dc37621	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT177M"}	2025-04-22 17:44:33.76+00
7695abeb-80fc-4448-b324-45ba54a5529d	62656c39-1f1d-5a6e-b4d9-b5320dc37621	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-04-22 17:49:33.76+00
18e4948d-ab62-40ba-8b26-f99296577810	f077b3df-c8db-5980-9d45-a9f18b43994f	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-04-22 18:12:33.754+00
a825cb06-eab2-4ff8-95c2-6a5ded9f211f	f077b3df-c8db-5980-9d45-a9f18b43994f	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT61M"}	2025-04-22 19:13:33.754+00
d12f37b8-6238-4ba6-93a8-e52c617098ed	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-04-23 12:34:33.756+00
427418ca-c02f-495a-9110-a53ee343e615	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT38M"}	2025-04-23 13:12:33.756+00
5c243ae7-4439-4254-989a-6e6178e17aa9	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-04-23 14:14:45.882+00
75bc584e-3ac1-465f-8aa1-433115b6151e	025122bf-9317-5a26-a542-61d51306d411	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-04-23 14:19:33.77+00
84e3f729-610c-4c51-b484-86255c83c210	025122bf-9317-5a26-a542-61d51306d411	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-04-23 14:26:33.77+00
6b0b62b5-72ae-4423-8ff5-3fec9ca50a1b	025122bf-9317-5a26-a542-61d51306d411	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-04-23 14:29:33.77+00
b6128ec3-35fd-4c49-b03a-059c7ce5d53e	e94bb903-b682-50b3-984a-ecdfc8b428b8	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-04-23 15:10:33.758+00
79c3a31d-3bb2-474b-a237-281ee5b090c4	e94bb903-b682-50b3-984a-ecdfc8b428b8	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT90M"}	2025-04-23 16:40:33.758+00
e9c79fb8-8fc4-446b-a556-38758b33162b	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT147M"}	2025-04-23 16:41:45.882+00
63d41c03-073d-406a-a394-5234de880404	62656c39-1f1d-5a6e-b4d9-b5320dc37621	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-04-23 17:12:33.76+00
cbf4315d-cd21-4219-b88c-b03dcfa3911c	d8b612a2-dc91-5792-8e83-e230551cbe05	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-23 17:33:15.062+00
de49d34e-aa49-4368-ba96-aa91e209941e	025122bf-9317-5a26-a542-61d51306d411	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT213M"}	2025-04-23 17:52:33.77+00
ed93b3f4-04be-42c3-b334-493b58951894	62656c39-1f1d-5a6e-b4d9-b5320dc37621	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT134M"}	2025-04-23 19:26:33.76+00
706a1c9c-fb90-440f-998e-eebe08ba8a96	62656c39-1f1d-5a6e-b4d9-b5320dc37621	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-04-23 19:35:33.76+00
5ad02356-8ccd-498e-98f0-271937def5ef	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-04-23 19:47:33.751+00
5e95858b-85ef-4100-8e4b-1f3368a319b8	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-23 19:49:33.751+00
31ba4583-9b9f-4298-a86e-f03d9418b308	d8b612a2-dc91-5792-8e83-e230551cbe05	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT183M"}	2025-04-23 20:36:15.062+00
9fb48efa-0142-4a9f-add6-a727800ba1ff	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-04-23 20:38:09.265+00
73b2f204-4a14-46db-b06a-fd14e40c84a4	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-04-23 20:40:09.265+00
ba2f9627-dfab-4cee-b176-68950f59fffb	d8b612a2-dc91-5792-8e83-e230551cbe05	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-04-23 20:41:15.062+00
dfefc73d-3a1f-48c6-ac3a-6e88150f4bb6	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT87M"}	2025-04-23 21:16:33.751+00
6776dd58-2072-442f-b048-d906768bea64	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT277M"}	2025-04-24 01:17:09.265+00
2158cf56-8937-42a3-89a5-b7d14280087d	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-04-24 01:22:09.265+00
aed96a4f-e20a-4294-8a29-8a00e8c5f036	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-04-24 13:22:33.756+00
232f4d8d-33b4-40f6-b7d2-4976b5c8d27c	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT26M"}	2025-04-24 13:48:33.756+00
7f18d1fb-850f-4bd3-b466-966489c81994	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-24 15:22:33.76+00
1368ac54-42d2-417d-be3d-0581d5fc4b32	025122bf-9317-5a26-a542-61d51306d411	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-04-24 15:23:33.77+00
c8c4c2f6-d685-4a5e-a6c0-5e4ba5cf76cb	e94bb903-b682-50b3-984a-ecdfc8b428b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-24 15:29:33.758+00
2be834c0-e30e-47cb-a44c-26ad80401318	025122bf-9317-5a26-a542-61d51306d411	70423966-9ebb-5262-b082-4b8925547d57	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-04-24 15:31:33.77+00
c056b643-1197-4129-b83a-7be53057d73d	025122bf-9317-5a26-a542-61d51306d411	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-04-24 15:37:33.77+00
84e2eedf-577d-4bfe-ac47-4908144bcb69	0852f8f7-947c-5834-aceb-2f6f5d022d75	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-04-24 15:52:33.771+00
b06af8d4-33b2-4f4e-a53b-762bdf0d178d	0852f8f7-947c-5834-aceb-2f6f5d022d75	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-04-24 15:55:33.771+00
9747a469-a2b4-4c4d-b8ec-93e6bd4692fd	0852f8f7-947c-5834-aceb-2f6f5d022d75	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-04-24 16:02:33.771+00
b3be065b-982a-4261-95b0-487258e39575	e94bb903-b682-50b3-984a-ecdfc8b428b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT49M"}	2025-04-24 16:18:33.758+00
94fe09d7-54e9-4493-9e73-51e94b721c6c	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT72M"}	2025-04-24 16:34:33.76+00
d646e472-db55-40d4-8d1e-6626fec3c05c	0852f8f7-947c-5834-aceb-2f6f5d022d75	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT77M"}	2025-04-24 17:09:33.771+00
48eb9ab7-23fc-4f0c-bcdf-cc379add6615	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	scored	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.32960376520188484}}	2025-04-24 17:16:33.756+00
c89be14d-cca5-4857-b472-a203163df82c	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-04-24 17:20:33.762+00
6f9c9e15-68f2-425b-a5f6-907c4ec5ff3e	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-05-02 16:36:33.751+00
ad225291-bef5-429d-9429-623e143f509d	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	failed	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.32960376520188484}}	2025-04-24 17:37:33.756+00
edae9f06-ac81-448b-aaf7-3222d6bd6dc7	025122bf-9317-5a26-a542-61d51306d411	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT192M"}	2025-04-24 18:35:33.77+00
f6c9f3dc-8caa-4a72-bd08-97a44fe470d0	f077b3df-c8db-5980-9d45-a9f18b43994f	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-04-24 19:25:33.754+00
a9a57561-1bab-412c-b5a4-1e5011897fe3	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT148M"}	2025-04-24 19:48:33.762+00
0fba05ac-d297-4c3b-8754-7a09ee764427	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-04-24 19:58:33.762+00
03ddc78b-38f2-4c20-b561-8c9ccd3e2690	f077b3df-c8db-5980-9d45-a9f18b43994f	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT55M"}	2025-04-24 20:20:33.754+00
f9aa14c0-0b00-421d-a9c5-b6f07e77146e	d8b612a2-dc91-5792-8e83-e230551cbe05	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-04-25 11:01:08.924+00
123ab73d-46e7-44b9-9870-f0bd3acdfd20	d8b612a2-dc91-5792-8e83-e230551cbe05	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT277M"}	2025-04-25 15:38:08.924+00
c026c073-f533-4ac7-a234-f16422fdb554	d8b612a2-dc91-5792-8e83-e230551cbe05	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-04-25 15:46:08.924+00
2042c21d-b667-4eee-9749-f92bcb3d19a9	62656c39-1f1d-5a6e-b4d9-b5320dc37621	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-04-25 15:57:33.76+00
8dd8d3f1-b3b7-465d-a992-2cb2437485b4	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-04-25 17:35:33.591+00
f55631d3-e2b1-4be7-8fe2-ea022124798f	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-04-25 17:38:33.591+00
7b9968b2-ad23-4fd5-bd0a-d61ae4ec83e1	62656c39-1f1d-5a6e-b4d9-b5320dc37621	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT197M"}	2025-04-25 19:14:33.76+00
9689c56a-ac1b-4a4a-806a-525bf6d70e20	62656c39-1f1d-5a6e-b4d9-b5320dc37621	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-04-25 19:24:33.76+00
05afe28b-17d3-4d29-9b0a-6d411b1fb987	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-25 19:28:33.751+00
ba0c74dd-8377-4771-be08-2db7a15b7454	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT71M"}	2025-04-25 20:39:33.751+00
a3592ccf-3e68-40c3-8dcd-a9aaabad304a	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-04-25 20:42:33.751+00
c5425857-b369-40d6-93a9-7615c99c20a2	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT513M"}	2025-04-26 02:11:33.591+00
70cd2777-cc2f-40dc-b6db-0e8be6183a2b	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-04-26 02:14:33.591+00
1e61be82-f98f-4b13-aa45-57fd52033a98	025122bf-9317-5a26-a542-61d51306d411	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-04-26 09:59:33.77+00
cad03c6a-10de-416c-8c4e-3b1fd3f7b058	025122bf-9317-5a26-a542-61d51306d411	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-04-26 10:03:33.77+00
2063d821-f7ea-4cc6-b54e-452f749f3906	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-26 10:40:33.762+00
f8a2faed-125c-48d3-b51c-f3edb7306cad	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-04-26 11:20:33.756+00
64a2d221-ae77-43a5-a2eb-85f1a7971402	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT36M"}	2025-04-26 11:56:33.756+00
a245f959-3781-4571-9d17-ef85c69e680d	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT87M"}	2025-04-26 12:07:33.762+00
6b43a3d6-04e9-4530-990e-8d33d9df95a9	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-04-26 12:10:33.762+00
14787f01-cfe8-41a0-b52a-ea7417cbccef	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	scored	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.371231524956714}}	2025-04-26 12:28:33.762+00
1ad7f996-70bc-4059-8af7-519f0699f156	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	failed	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.371231524956714}}	2025-04-26 12:29:33.762+00
d45d8ca3-36ed-479c-93d5-90659071d15d	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-04-26 12:33:33.762+00
9ef52175-c938-4c8e-af26-f5bfb05dc6d3	025122bf-9317-5a26-a542-61d51306d411	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT227M"}	2025-04-26 13:46:33.77+00
50eaa108-ae5e-495f-93b1-f097edf38828	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-04-26 14:36:18.425+00
a0dfc740-df9b-491e-8738-6c6f7ee9bec2	f077b3df-c8db-5980-9d45-a9f18b43994f	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-04-26 14:36:33.754+00
0b07ec4f-2a12-40cd-b59e-c96e55bb16ff	f077b3df-c8db-5980-9d45-a9f18b43994f	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-04-26 14:41:33.754+00
ad26f214-a317-4596-a986-c7f57a303850	f077b3df-c8db-5980-9d45-a9f18b43994f	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT69M"}	2025-04-26 15:50:33.754+00
ffa87568-755a-4f56-8fea-5c5b50173fe9	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT168M"}	2025-04-26 17:24:18.425+00
a6fb021e-e00a-4447-ac5f-60f34bc3d830	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-04-26 17:32:18.425+00
90b42761-cd32-4ad9-93c6-61e3d3444030	f077b3df-c8db-5980-9d45-a9f18b43994f	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	scored	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.5837006562593424}}	2025-04-26 18:42:33.754+00
042b9fab-78fc-4914-a243-a1b458782f4e	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-04-26 19:03:33.758+00
a1e06af9-861a-4776-8cdf-661a334b918e	f077b3df-c8db-5980-9d45-a9f18b43994f	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	completed	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.5837006562593424}}	2025-04-26 19:09:33.754+00
3ee392fa-6f95-4c6d-ab85-fe8e6e101ce1	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-04-27 13:39:33.76+00
e3a997c6-66d2-4832-89d2-57e73135d5fc	e94bb903-b682-50b3-984a-ecdfc8b428b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-04-27 14:01:33.758+00
017c65a6-2d73-4af1-b01a-5fd188003cff	d8b612a2-dc91-5792-8e83-e230551cbe05	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-04-27 14:51:17.629+00
10630cb6-a3a8-42d6-b9b4-e66cc9f7e70e	d8b612a2-dc91-5792-8e83-e230551cbe05	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-04-27 14:55:17.629+00
ff212e85-de97-4cbd-bd8f-dd2863ddc1d0	e94bb903-b682-50b3-984a-ecdfc8b428b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT114M"}	2025-04-27 15:55:33.758+00
a9662f21-866e-4d75-9644-5a35f62a2586	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-04-27 17:32:33.762+00
a1e64a90-c4e6-4df6-9d4d-4811d33dd1f6	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-04-27 19:03:33.751+00
c2663d9d-c15f-481a-8a0e-1b4bb2892697	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-27 19:06:33.751+00
09a10d90-b56e-4fce-8245-1c47b8a2caae	d8b612a2-dc91-5792-8e83-e230551cbe05	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT256M"}	2025-04-27 19:11:17.629+00
5038425e-c3ee-4ec9-a7ff-347482d626c6	d8b612a2-dc91-5792-8e83-e230551cbe05	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-04-27 19:14:17.629+00
5a9c640d-489b-455f-95b0-420a00ca239e	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT121M"}	2025-04-27 19:33:33.762+00
45f82824-b1f6-4c5b-bc80-3b3de096d213	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-04-27 19:40:33.762+00
2685a412-577f-4f0c-bc04-e84a8df981b0	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT68M"}	2025-04-27 20:14:33.751+00
c779e868-42f4-48b8-8f82-ebc57ce5ba92	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	scored	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39198689342996007}}	2025-04-27 20:34:33.762+00
43f9f408-0948-45f4-b42f-278a43144721	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	failed	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39198689342996007}}	2025-04-27 20:35:33.762+00
998951d7-49ce-47ee-82c7-34a4e114fb8c	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-04-27 20:39:33.762+00
3a4120c4-6609-45da-9293-965226fc7fff	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-04-27 20:54:19.581+00
2c36a32f-b38b-47a5-81f3-502c8bc724c4	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-04-27 20:56:19.581+00
be7a2b94-469c-4657-afe0-b5a92565affb	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT341M"}	2025-04-28 02:37:19.581+00
82bd0fc8-0de1-4e54-99e7-ea7466483061	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-04-28 02:46:19.581+00
f0823ed7-e9a1-4bf7-b122-59ecd7f492a6	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-04-28 03:26:19.581+00
95982610-3b3d-42b5-94d2-2bb95d9ca95f	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-04-28 03:27:19.581+00
b014aefb-29c9-444a-a1c2-0d618eee7ef5	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-28 03:34:19.581+00
d4503f99-4c44-42e4-9f9f-e3b8ebb0d2a9	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-04-28 12:13:33.756+00
c61c40a5-af9a-47ba-a0d0-7881c34c5316	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT35M"}	2025-04-28 12:48:33.756+00
bf4cf976-0191-4cbc-9b3e-f3dd2453562d	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	scored	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5687212330050093}}	2025-04-28 16:18:33.756+00
b91d30ef-c02d-48a2-9bb4-1a8e112402ca	9e6eaafb-451e-5224-b656-fbd90faee84a	4bfce604-c23f-530e-8c8e-a24764e1667a	completed	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5687212330050093}}	2025-04-28 16:34:33.756+00
1120f378-76d7-4b01-ab04-652ebd87c377	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-04-28 17:31:33.762+00
5e3e6364-bf7b-4e41-b9b3-215fb4adaf3c	e94bb903-b682-50b3-984a-ecdfc8b428b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-28 18:12:33.758+00
57a9f486-99fa-4043-a266-defd2fe92deb	e94bb903-b682-50b3-984a-ecdfc8b428b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT56M"}	2025-04-28 19:08:33.758+00
d6bb1ce9-795f-4eb7-8814-d6d4ed1cb978	e94bb903-b682-50b3-984a-ecdfc8b428b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-04-28 19:15:33.758+00
4a069066-d838-47f3-9273-38c355483aab	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT105M"}	2025-04-28 19:16:33.762+00
983c8543-ebeb-4147-8c14-2e523c47d0ab	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-04-28 19:25:33.762+00
e361acbf-1b69-4206-a291-ac586e787cba	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	scored	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9065412397653807}}	2025-04-28 19:58:33.762+00
2d7f4fca-f3c8-4b5a-92b1-34e62278583c	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	completed	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9065412397653807}}	2025-04-28 19:59:33.762+00
537a2695-471f-4a95-9e3e-ab3db70765a8	963076d1-bcef-5203-8e8a-5434830cb1b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-28 20:01:33.762+00
b1b46513-1c52-46e9-9dc5-35f2f479db0d	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-04-29 13:11:33.76+00
cc6e3482-5780-4b4e-abd7-1bd7b69fdccc	d8b612a2-dc91-5792-8e83-e230551cbe05	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-04-29 13:29:52.473+00
cb39719b-f5e8-4886-9281-f2df04f3cc3b	d8b612a2-dc91-5792-8e83-e230551cbe05	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-04-29 13:31:52.473+00
729675a6-dee1-4717-942f-a7be4cd08b35	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-04-29 14:27:33.068+00
55530cf3-f657-4341-8145-27310ce2633e	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-29 15:16:33.762+00
48eb2ec5-9a99-42e4-8792-9632688eb142	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-04-29 15:23:33.751+00
dc5389ab-b0d4-49e9-9238-8c94c85e5e7b	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-04-29 15:27:33.751+00
890d4577-d130-4f6e-b671-e470d625f4c3	d8b612a2-dc91-5792-8e83-e230551cbe05	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT121M"}	2025-04-29 15:32:52.473+00
595d44a3-f643-435c-8e47-42270e465869	025122bf-9317-5a26-a542-61d51306d411	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-04-29 15:37:33.77+00
7de3d1d0-4063-44d8-9b1e-9683c6ab8a20	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT147M"}	2025-04-29 15:38:33.76+00
a41f74e2-790f-411f-86ce-6856a871966a	d8b612a2-dc91-5792-8e83-e230551cbe05	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-04-29 15:41:52.473+00
e546436a-7ebe-42b8-98f5-7b5a1121b7c4	025122bf-9317-5a26-a542-61d51306d411	628435a2-1aba-5f57-8452-22f0f6fe8b5a	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-29 15:45:33.77+00
5887eef2-3c3c-4ec2-b79d-2d8cd80dd4eb	025122bf-9317-5a26-a542-61d51306d411	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-04-29 15:55:33.77+00
c003762a-675d-4d04-ab2d-edab8eb0fc4b	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT71M"}	2025-04-29 16:27:33.762+00
d4eb341f-18fb-4110-808f-634ac90f0643	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-04-29 16:32:33.762+00
ee981ead-206f-4047-a30d-2978bf5589a3	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT74M"}	2025-04-29 16:41:33.751+00
8601fe2b-61e5-4a16-a76e-f46fe57c8db2	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT145M"}	2025-04-29 16:52:33.068+00
39348d7d-8793-448a-83a3-c8f96617eba4	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-04-29 16:55:33.068+00
7bd840f4-3d5f-4ef8-a185-194676c1fbb4	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	scored	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48796968664473933}}	2025-04-29 17:23:33.762+00
e33841e6-72dd-4542-9b7c-fb5a05b135b8	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	failed	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48796968664473933}}	2025-04-29 17:24:33.762+00
298e00a8-96af-4959-b1de-213dc0c4af01	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-04-29 17:36:17.273+00
77af5384-ac58-4b33-ae53-5bd23f8b7382	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-04-29 17:39:17.273+00
885b94cc-36c2-45d8-bcad-8452c0b3374d	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	scored	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.8554769914073126}}	2025-04-29 18:22:33.751+00
e992c977-9dac-4069-8452-efe41e7ed9ee	e94bb903-b682-50b3-984a-ecdfc8b428b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-04-29 18:48:33.758+00
68f5df35-9771-4805-960f-a421992726e1	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	0f8226a0-d513-534c-871b-15d9f310349b	completed	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.8554769914073126}}	2025-04-29 18:52:33.751+00
84dd5c54-9586-4a39-9fae-5721738e9245	025122bf-9317-5a26-a542-61d51306d411	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT220M"}	2025-04-29 19:17:33.77+00
0e1f83b0-88e4-4266-926d-bd906733b2a6	e94bb903-b682-50b3-984a-ecdfc8b428b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT94M"}	2025-04-29 20:22:33.758+00
fc621afa-a11d-4747-876a-27ec037d5da1	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT386M"}	2025-04-30 00:05:17.273+00
84d7255f-1143-4fda-84cb-c3574c6380e4	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-04-30 00:14:17.273+00
3b68513d-9718-4cdc-bf19-584448b309e5	e94bb903-b682-50b3-984a-ecdfc8b428b8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-04-30 14:57:33.758+00
438ca397-d323-4d7a-a32d-49b1f7c30d99	d8b612a2-dc91-5792-8e83-e230551cbe05	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-04-30 15:48:04.826+00
ca1646f0-7772-486d-bce6-66d45fb2745b	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-04-30 15:53:04.826+00
df4b4934-40f8-47d4-b193-7a1720b21202	e94bb903-b682-50b3-984a-ecdfc8b428b8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT141M"}	2025-04-30 17:18:33.758+00
b18b2a64-62fb-48e0-95d1-be8168b4e6c3	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT210M"}	2025-04-30 19:23:04.826+00
d85626c3-9385-4e56-9fae-19840eb72e83	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-04-30 19:30:04.826+00
6bd67c32-e2ce-4949-bab0-143a545074b6	9e6eaafb-451e-5224-b656-fbd90faee84a	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-01 13:26:33.756+00
a075af67-a5b8-48c5-8a06-38ce776c666f	9e6eaafb-451e-5224-b656-fbd90faee84a	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT37M"}	2025-05-01 14:03:33.756+00
cef9bebe-4abf-4c2a-9f31-e402300dadb2	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-05-01 15:10:33.76+00
14291930-7377-460d-a423-5dee50837ee0	963076d1-bcef-5203-8e8a-5434830cb1b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-01 15:17:33.762+00
93fbc1a4-084b-4d49-9fa0-3f8904cb4bcf	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-05-01 15:57:33.758+00
e071907c-bf99-475e-9099-8c70406341fb	963076d1-bcef-5203-8e8a-5434830cb1b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT55M"}	2025-05-01 16:12:33.762+00
0218a0de-402d-4231-965f-21faa10ba886	963076d1-bcef-5203-8e8a-5434830cb1b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-05-01 16:17:33.762+00
c71781ca-afa1-4831-9b2b-9144918156cf	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT87M"}	2025-05-01 17:24:33.758+00
3328e93e-8cea-4041-984b-a818b9f09df5	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-05-01 17:28:33.758+00
e223f0d3-a3cb-4e32-864c-7d76a7e5396d	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT158M"}	2025-05-01 17:48:33.76+00
6b84da39-5e9c-42a3-a530-0f39108544ae	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-05-01 17:58:33.76+00
a9ff775e-e292-44cf-bf71-fff3466d183a	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-05-01 18:38:51.017+00
c4deb8d4-7382-4137-bfeb-2e9c1d00fb5b	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-05-01 18:43:51.017+00
30c11d97-0f69-499d-83be-9d828eed0967	f077b3df-c8db-5980-9d45-a9f18b43994f	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-01 19:29:33.754+00
0b21cbaa-f496-4d0d-b60f-1659edca146e	f077b3df-c8db-5980-9d45-a9f18b43994f	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT65M"}	2025-05-01 20:34:33.754+00
13e43102-025f-41ba-b1d6-6f1f3db61f06	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT594M"}	2025-05-02 04:37:51.017+00
0e19458f-8866-4c4d-9825-d7c11736ad7b	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-05-02 04:43:51.017+00
bf5e3c82-3e56-48ed-b9b1-ede1aab80194	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-05-02 15:22:15.961+00
50584f33-6248-4764-8284-4ffddde9f1df	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-05-02 15:27:15.961+00
e1fc4c54-66e4-4600-8cfd-e2d9e1a58cce	d8b612a2-dc91-5792-8e83-e230551cbe05	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-05-02 15:42:17.325+00
78b89da8-fb20-4cc2-80bc-fb96db52cc64	d8b612a2-dc91-5792-8e83-e230551cbe05	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-05-02 15:45:17.325+00
e1003e87-80a8-4c4e-8423-023ac5c4a6d4	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-05-02 17:12:33.76+00
7feebc08-6efe-4630-86d8-2bc76069a591	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-05-02 17:52:33.758+00
3cfaf033-74ab-4a1a-8121-25bb9018fecf	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT80M"}	2025-05-02 17:56:33.751+00
4fcf1c63-5689-4267-a664-d9abaa99aaff	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	628435a2-1aba-5f57-8452-22f0f6fe8b5a	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-02 17:59:33.751+00
0dc2d706-4f96-4cf7-8427-adb92fdf6935	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT161M"}	2025-05-02 18:08:15.961+00
3ce471c1-fdca-4cdc-81a3-f54da7003383	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT119M"}	2025-05-02 19:11:33.76+00
4a1cba4e-64ae-4348-9fbb-eddf3c2a9648	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-05-02 19:15:33.762+00
9c6a4a6a-bec3-4f6e-afff-64aebfd09aa0	d8b612a2-dc91-5792-8e83-e230551cbe05	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT255M"}	2025-05-02 20:00:17.325+00
7749bddd-6376-46ac-8deb-9b2c74686d0c	d8b612a2-dc91-5792-8e83-e230551cbe05	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-05-02 20:04:17.325+00
dd452978-c6f3-4ed9-b446-072ba3a22cd1	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT139M"}	2025-05-02 20:11:33.758+00
f564aa88-d8b7-4cc2-bc88-0b60dec3ee0d	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT138M"}	2025-05-02 21:33:33.762+00
1cbbbf75-a57a-4921-a4d0-8f718a1fac30	963076d1-bcef-5203-8e8a-5434830cb1b8	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-05-03 13:20:33.762+00
1bd3f77c-cdbf-4d8d-b8b4-503e2b961c46	9e6eaafb-451e-5224-b656-fbd90faee84a	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-05-03 13:53:33.756+00
b9e49db8-cf2d-4530-bcda-1bf157509f86	9e6eaafb-451e-5224-b656-fbd90faee84a	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-03 13:58:33.756+00
91cace1e-9a89-45a1-a7c0-99d81152ffad	9e6eaafb-451e-5224-b656-fbd90faee84a	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT25M"}	2025-05-03 14:23:33.756+00
88860d2b-5257-4a7b-931c-4ff89ad85f0d	963076d1-bcef-5203-8e8a-5434830cb1b8	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT153M"}	2025-05-03 15:53:33.762+00
92269428-1405-4ea2-998b-c3be1041792f	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-05-03 16:06:33.758+00
f2653584-09fb-44fb-bad7-54caa4ce70bd	963076d1-bcef-5203-8e8a-5434830cb1b8	fcc40587-6fbe-570f-8676-ba7f80daec71	scored	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.8716483596830913}}	2025-05-03 16:13:33.762+00
3964da21-7418-4bd5-85a4-38161d8cef95	963076d1-bcef-5203-8e8a-5434830cb1b8	fcc40587-6fbe-570f-8676-ba7f80daec71	completed	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.8716483596830913}}	2025-05-03 16:14:33.762+00
8eedcab1-5b3f-46d7-8784-210767c2e48b	963076d1-bcef-5203-8e8a-5434830cb1b8	fcc40587-6fbe-570f-8676-ba7f80daec71	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-05-03 16:22:33.762+00
1055b301-379f-4c70-b7d0-bcef643abf26	f077b3df-c8db-5980-9d45-a9f18b43994f	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-05-03 17:35:33.754+00
ae009f05-ff0c-4b24-8339-14a1ab212366	f077b3df-c8db-5980-9d45-a9f18b43994f	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-03 17:38:33.754+00
7c825e11-53f5-473d-864d-0ebe97ea643c	f077b3df-c8db-5980-9d45-a9f18b43994f	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT71M"}	2025-05-03 18:49:33.754+00
8ba022e2-3e3b-472e-b583-9211bc326a99	f077b3df-c8db-5980-9d45-a9f18b43994f	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-03 18:53:33.754+00
15a6c01a-9ffa-45f7-ba18-b9eecd8881d6	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-05-03 19:06:53.592+00
1c775b12-b162-4286-a41e-2376bb345e0a	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-05-03 19:08:53.592+00
f82c1ba4-1e0c-498e-bf03-b7124fd39d75	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT302M"}	2025-05-04 00:10:53.592+00
6935d9a0-9841-4209-8c77-6afebd9afe3b	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-05-04 00:20:53.592+00
347003c1-be3d-4b1a-afbc-34e0ba81dfc7	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-05-04 10:52:33.751+00
171b96b9-107f-455d-b35c-ea7fa261d608	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-05-04 10:54:33.751+00
7ff0c502-1f44-4fc5-af34-fd4469af9903	9e6eaafb-451e-5224-b656-fbd90faee84a	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-04 11:20:33.756+00
d163c892-f42d-4252-9090-7932ea0a11e5	9e6eaafb-451e-5224-b656-fbd90faee84a	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT37M"}	2025-05-04 11:57:33.756+00
7a10bb99-ad50-4a8f-b8e0-0f68ab3a048b	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT80M"}	2025-05-04 12:14:33.751+00
a36a9abe-4eeb-4b38-95c8-ff64115c6087	f077b3df-c8db-5980-9d45-a9f18b43994f	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-04 16:20:33.754+00
309f371a-553c-4180-be8f-0b8973d044ea	d8b612a2-dc91-5792-8e83-e230551cbe05	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-05-04 16:35:20.272+00
c53f1265-32af-4d37-a41e-c228ea99d1fc	d8b612a2-dc91-5792-8e83-e230551cbe05	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-05-04 16:38:20.272+00
63404805-21a0-4b4e-bf4d-702fcf74869b	f077b3df-c8db-5980-9d45-a9f18b43994f	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT56M"}	2025-05-04 17:16:33.754+00
dd074e4c-ce1d-4e0d-863f-5745c71908cc	f077b3df-c8db-5980-9d45-a9f18b43994f	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-04 17:19:33.754+00
b24e1559-d0c2-4e35-8970-25791d0225f5	e94bb903-b682-50b3-984a-ecdfc8b428b8	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-05-04 17:28:33.758+00
8cebad2c-d64e-4c6d-a056-d467e9e7534f	d8b612a2-dc91-5792-8e83-e230551cbe05	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT206M"}	2025-05-04 20:04:20.272+00
0f9d3039-a95e-4f29-b1c4-116d3ccb2905	d8b612a2-dc91-5792-8e83-e230551cbe05	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-05-04 20:09:20.272+00
6085d35f-230b-4340-9b8f-c27d3fffe2a9	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-05-04 20:36:33.762+00
6daf731d-369e-4fc2-81c0-7ca955f753fb	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT52M"}	2025-05-04 21:28:33.762+00
10fea684-6666-4863-ab04-a759a8c35307	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-05-04 21:34:33.762+00
a6d08c97-5555-4309-989b-4fc5c6d6ff90	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	scored	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.402622172490842}}	2025-05-04 22:30:33.762+00
e090f4cc-b83e-40d8-b1af-3bb9e285490f	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	failed	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.402622172490842}}	2025-05-04 22:31:33.762+00
a94f3a04-8add-4fd7-a0a3-8106a92319ac	9e6eaafb-451e-5224-b656-fbd90faee84a	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-05-05 11:36:33.756+00
ed759a98-fe5d-40d6-a550-33317cc2e9a5	9e6eaafb-451e-5224-b656-fbd90faee84a	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-05 11:40:33.756+00
598e6c4c-cb17-42de-9e7c-724f2629ff0b	9e6eaafb-451e-5224-b656-fbd90faee84a	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT30M"}	2025-05-05 12:10:33.756+00
f7b91533-42fe-4078-8c37-4f9091683210	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-05-05 12:56:08.969+00
23118b2e-ed44-43d2-ab17-4b5d3b788445	9e6eaafb-451e-5224-b656-fbd90faee84a	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	scored	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.6947805786189027}}	2025-05-05 14:09:33.756+00
36ef7969-2ed3-42c5-b039-df93be8ef3f6	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-05-05 14:21:33.751+00
e10b2413-d945-412f-a66c-72cec7301ba7	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-05-05 14:25:33.751+00
ecc6662c-9e7a-4949-9874-6275a0c61886	9e6eaafb-451e-5224-b656-fbd90faee84a	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	completed	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.6947805786189027}}	2025-05-05 14:38:33.756+00
0d8bc12e-054b-41a1-9ae1-e6a0706f92e0	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT87M"}	2025-05-05 15:52:33.751+00
705f1167-5098-4a91-8105-76b3bb25e29e	e94bb903-b682-50b3-984a-ecdfc8b428b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-05 16:00:33.758+00
d9aace10-6ea7-4614-8a5a-ea0228faa6f4	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-05-05 17:21:51.087+00
b23844fc-cac0-44dc-ab1c-830e7e533836	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-05-05 17:23:51.087+00
2564ace9-4b09-4268-82ca-dbaabe917d47	e94bb903-b682-50b3-984a-ecdfc8b428b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT102M"}	2025-05-05 17:42:33.758+00
4b5532f6-a0a2-437f-9b72-bde1dd11deef	e94bb903-b682-50b3-984a-ecdfc8b428b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-05-05 17:48:33.758+00
f0aee704-6f42-4705-8418-bfc6cc7dee6b	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	628435a2-1aba-5f57-8452-22f0f6fe8b5a	scored	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.7633744758593056}}	2025-05-05 19:48:33.751+00
9e759a7a-ec34-4337-9600-f2d25acb6c68	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	628435a2-1aba-5f57-8452-22f0f6fe8b5a	completed	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.7633744758593056}}	2025-05-05 20:10:33.751+00
975ea620-45e6-44c5-97b0-78a868f87db1	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT472M"}	2025-05-06 01:15:51.087+00
97529413-e5ee-49e8-8230-72f5a0c43aee	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-05-06 01:20:51.087+00
56fa820d-3db8-4181-ad50-7f7cffadde65	e94bb903-b682-50b3-984a-ecdfc8b428b8	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-05-06 14:13:33.758+00
c7ae8ef8-49d0-4f17-ba65-4add7c78ce9a	62656c39-1f1d-5a6e-b4d9-b5320dc37621	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-05-06 14:29:33.76+00
616cb2f5-7a8b-46ba-94c3-ffa8d103b1c2	d8b612a2-dc91-5792-8e83-e230551cbe05	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-05-06 14:39:10.695+00
f13a8725-38a2-40dd-8599-3fcb03ae24f5	d8b612a2-dc91-5792-8e83-e230551cbe05	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-05-06 14:44:10.695+00
880cc2e1-83cb-49ee-8f26-c48dfc699d70	62656c39-1f1d-5a6e-b4d9-b5320dc37621	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT127M"}	2025-05-06 16:36:33.76+00
be946007-5cd2-46e0-b77d-fcdc4a4f3299	d8b612a2-dc91-5792-8e83-e230551cbe05	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT207M"}	2025-05-06 18:11:10.695+00
9967d17e-bb4a-4ac7-a047-4924cb1e729b	d8b612a2-dc91-5792-8e83-e230551cbe05	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-05-06 18:18:10.695+00
fe1cae5c-557f-4096-ac8e-70296f2176dc	62656c39-1f1d-5a6e-b4d9-b5320dc37621	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-05-07 12:12:33.76+00
418c5f70-1376-4833-975a-8f53ebe2a225	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-05-07 12:28:33.756+00
83c2b2ed-ac54-476f-85d2-3793ac59ffdd	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-05-07 12:33:33.756+00
43cdf1c1-336b-4c05-a11a-38c01c3d63e6	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-05-07 12:37:33.762+00
148d6a16-0492-4a20-8b65-0ae68b4e7d52	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT28M"}	2025-05-07 13:01:33.756+00
e6f64c4a-cd4e-412d-8ea4-c4f091324b05	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-05-07 14:22:33.758+00
35c6dcea-67c1-43a1-ac48-bba1fc3ec8de	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT139M"}	2025-05-07 14:56:33.762+00
4fa619b6-63af-4cd1-8fe2-53f47c651489	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT51M"}	2025-05-07 15:13:33.758+00
8ad00488-c00f-487c-8bf8-6b91018bf504	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-05-07 15:17:27.79+00
68a36516-6a35-4b8a-8f0a-b8172eec3ce1	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	scored	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31105320274122283}}	2025-05-07 15:40:33.762+00
477cd73f-ec8d-4eec-b0b6-c1177decca76	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	failed	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31105320274122283}}	2025-05-07 15:41:33.762+00
b2de5e9b-4f95-4d8f-98f2-4bbecb6e7647	f077b3df-c8db-5980-9d45-a9f18b43994f	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-07 15:58:33.754+00
985786c6-c921-4083-a509-fda42f21fea0	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT88M"}	2025-05-07 16:45:27.79+00
514823d1-19a2-42f7-a6fa-0ab0ce833463	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-05-07 16:51:27.79+00
b92c7d0e-f127-496b-88e4-b47c09d66f2e	f077b3df-c8db-5980-9d45-a9f18b43994f	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT58M"}	2025-05-07 16:56:33.754+00
3004adcb-066f-48c9-91f0-10f6c9ea6bfd	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-05-07 17:20:52.161+00
1bdb2599-8545-437b-9e75-d71a6830eaa4	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-05-07 17:23:52.161+00
696a831b-2ca0-410d-b095-1fccb8a2416d	f077b3df-c8db-5980-9d45-a9f18b43994f	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	scored	{"score": {"max": 100, "min": 0, "raw": 83, "scaled": 0.8399294855872204}}	2025-05-07 18:42:33.754+00
25e1aa5a-b6d7-4eb1-bf26-0105ffc0fde2	f077b3df-c8db-5980-9d45-a9f18b43994f	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	completed	{"score": {"max": 100, "min": 0, "raw": 83, "scaled": 0.8399294855872204}}	2025-05-07 19:09:33.754+00
0f4e7ed9-6f9e-49e2-abf7-a851970b84a6	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT396M"}	2025-05-07 23:59:52.161+00
c89f56e8-071a-405a-8c16-9519a3808e00	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-05-08 00:04:52.161+00
c4377828-8782-4695-9cb6-dfb5472b307e	d8b612a2-dc91-5792-8e83-e230551cbe05	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-05-08 13:58:10.425+00
e8190db9-4f10-4fef-952a-a4f719fd64ca	d8b612a2-dc91-5792-8e83-e230551cbe05	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-05-08 14:01:10.425+00
7c4a31da-7b82-4f7e-8c4c-f9fbe958589b	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-05-08 14:39:33.758+00
328b00a9-8a62-43d3-a338-1ca2008fbbdc	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT70M"}	2025-05-08 15:49:33.758+00
bc54281e-6a12-47c1-8060-834814d72fb1	62656c39-1f1d-5a6e-b4d9-b5320dc37621	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-08 16:05:33.76+00
42ded61b-e963-49c5-a699-d38e4549fd62	d8b612a2-dc91-5792-8e83-e230551cbe05	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT143M"}	2025-05-08 16:24:10.425+00
1247d8b0-cb2a-4c9a-99a9-05596a627c13	d8b612a2-dc91-5792-8e83-e230551cbe05	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-05-08 16:28:10.425+00
597a311c-1b1f-4851-b61a-1c46852b94c9	62656c39-1f1d-5a6e-b4d9-b5320dc37621	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT141M"}	2025-05-08 18:26:33.76+00
df55017b-66f7-4443-a52c-77172edbfea7	62656c39-1f1d-5a6e-b4d9-b5320dc37621	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-08 19:10:33.76+00
077a89a4-7ce4-46bb-8980-b8ce945729f2	62656c39-1f1d-5a6e-b4d9-b5320dc37621	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-08 19:11:33.76+00
60d3de65-10e4-4819-a1d1-aec30d22f827	62656c39-1f1d-5a6e-b4d9-b5320dc37621	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-08 19:17:33.76+00
6723ad70-aded-4b28-9344-bc823038c7bc	963076d1-bcef-5203-8e8a-5434830cb1b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-08 20:34:33.762+00
ee4667a3-d0ea-475e-a605-4a81ac4e4bf4	963076d1-bcef-5203-8e8a-5434830cb1b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT112M"}	2025-05-08 22:26:33.762+00
1197c2a0-2697-4df3-bd2f-1f9243f74adf	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-05-09 13:54:33.751+00
95a04da3-7a19-4f27-9e0d-ee441d3166dd	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-05-09 15:05:33.76+00
039eaa15-a777-47c5-9577-99e12cee232d	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT78M"}	2025-05-09 15:12:33.751+00
cf8c24f9-eb51-456b-8c92-452c56e91471	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-05-09 15:40:33.756+00
6c73239f-42ea-4a88-8c9e-cb0256afa979	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-05-09 15:44:33.756+00
5d331593-0317-4d19-9215-8c479c1db0f3	e94bb903-b682-50b3-984a-ecdfc8b428b8	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-05-09 16:06:33.758+00
0525a17d-3310-403d-9908-bbc6241ea7a4	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT34M"}	2025-05-09 16:18:33.756+00
d79c2a7e-2eff-4663-9d73-f985b4c95d63	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-05-09 17:43:33.762+00
cce18859-1f32-4b9b-80b9-093e3f20147f	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-05-09 17:44:38.277+00
34dfd88c-4c7d-44c4-9382-5649a0b165a1	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-05-09 17:49:38.277+00
161f74f4-1bf7-49d8-b3a9-648c2b089b44	e94bb903-b682-50b3-984a-ecdfc8b428b8	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT129M"}	2025-05-09 18:15:33.758+00
9572cbc9-d03b-4811-a0ee-bdfc9d8b8862	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT193M"}	2025-05-09 18:18:33.76+00
a7995df0-d69a-4ff8-853d-12b5bfbd8926	e94bb903-b682-50b3-984a-ecdfc8b428b8	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-05-09 18:24:33.758+00
089257b7-6bf3-4653-9a88-4efc88cd3347	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-05-09 18:27:33.76+00
63bc5ac6-9877-4ff6-b8aa-611dc53f4401	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-05-09 18:31:33.76+00
841262fc-c88f-4269-9b27-84a9babd1a2e	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT69M"}	2025-05-09 18:52:33.762+00
e9469721-dfe8-475c-9695-6008d0eb265b	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-05-09 19:01:33.762+00
d9ee476a-cae4-499c-a65f-4aa131f96312	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	scored	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.7273924403098071}}	2025-05-09 19:39:33.762+00
2d148265-fc20-421d-afb3-c84327085fb5	963076d1-bcef-5203-8e8a-5434830cb1b8	6db96e1f-b595-5aec-adbb-46b408029b79	completed	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.7273924403098071}}	2025-05-09 19:40:33.762+00
dbf9426e-fcbb-4da4-9914-0fc82afbc937	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT585M"}	2025-05-10 03:34:38.277+00
34f1cdd3-fe49-4e7e-a526-2e322c7e66f7	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-05-10 03:42:38.277+00
6b98e94d-40e0-438a-8362-de50920a8348	d8b612a2-dc91-5792-8e83-e230551cbe05	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-05-10 13:21:17.794+00
8506210e-19e0-45a5-a40c-b749ce9d46d0	d8b612a2-dc91-5792-8e83-e230551cbe05	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-05-10 13:26:17.794+00
20615327-10c8-4abb-8bcb-de257713eece	e94bb903-b682-50b3-984a-ecdfc8b428b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-10 15:10:33.758+00
82f747df-8218-4d30-9914-a4b63af3d0c1	d8b612a2-dc91-5792-8e83-e230551cbe05	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT223M"}	2025-05-10 17:09:17.794+00
761debef-73b4-4ac8-abf7-d4901c7bf679	e94bb903-b682-50b3-984a-ecdfc8b428b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT131M"}	2025-05-10 17:21:33.758+00
ac28b855-7b0a-4b0a-ab03-46758c67b153	e94bb903-b682-50b3-984a-ecdfc8b428b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-05-10 17:28:33.758+00
d051627f-1d1a-4e15-ba7a-e897da6251dc	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-05-11 13:43:33.754+00
73639cdc-ad0a-4854-bd73-f11895d49d7b	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-05-11 14:09:33.751+00
9b99d3a2-0eac-41f2-b51e-e7bf41604255	963076d1-bcef-5203-8e8a-5434830cb1b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-05-11 14:12:33.762+00
281ba9c1-d327-424a-b2e3-ab8a70ef802c	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT63M"}	2025-05-11 14:46:33.754+00
2efc5eab-358e-45e7-be5b-726af78ff498	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-05-11 15:08:33.756+00
310bceb8-530b-4c67-b948-71550a0e69ef	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-05-11 15:12:33.756+00
87c40440-faf6-46b8-b590-011c18b0db6e	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT65M"}	2025-05-11 15:14:33.751+00
56a120fe-1fe1-44af-b731-afa3cc621f4d	963076d1-bcef-5203-8e8a-5434830cb1b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT76M"}	2025-05-11 15:28:33.762+00
4e478edf-38db-47d1-925a-ef1e925f8730	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT32M"}	2025-05-11 15:44:33.756+00
20117388-dbe6-42d1-a0af-21a8ad41a9e6	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-05-11 15:45:33.756+00
b88fc8ec-6cf5-4557-82c6-34805a633a0d	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-05-11 19:58:36.103+00
09859208-5dfa-40b4-9654-fec2df3c4c60	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-05-11 20:03:36.103+00
2cd4d703-41a4-457c-b976-af3eb77eca5f	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT500M"}	2025-05-12 04:23:36.103+00
8ad84882-53d6-4730-af16-f9d2a2cf52e1	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-05-12 04:28:36.103+00
d8a4490f-cd8a-4d06-b827-96b4f5b4cbbb	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-12 05:04:36.103+00
560afc21-ab97-4fd3-ad34-f0f1b63d3ce8	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-12 05:05:36.103+00
abb9df91-35c1-4561-af5a-262fafe5dfa0	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	fcc40587-6fbe-570f-8676-ba7f80daec71	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-12 05:14:36.103+00
c29da041-ada7-41ab-b5bd-4f26afd6a5c5	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-05-12 13:22:33.756+00
e8aa0c0d-3743-41b4-9273-afd60090f02c	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-05-12 13:24:33.756+00
4e656878-c9cd-43e4-a728-418934e3035e	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT28M"}	2025-05-12 13:52:33.756+00
8e1b781c-1078-455f-97de-915ce381c44d	d8b612a2-dc91-5792-8e83-e230551cbe05	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-05-12 14:01:44.218+00
3f20a935-5289-4198-9807-d003b53d494c	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-05-12 14:04:44.218+00
3c3b5cfd-12b4-49c3-b14e-1621c8599df6	e94bb903-b682-50b3-984a-ecdfc8b428b8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-05-12 15:16:33.758+00
e45772cf-ce37-4344-be90-d23c9b50a86b	62656c39-1f1d-5a6e-b4d9-b5320dc37621	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-05-12 15:44:33.76+00
049fba6f-c395-46e4-bcbc-71e0e4f0dbdb	963076d1-bcef-5203-8e8a-5434830cb1b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-05-12 17:09:33.762+00
cb755b83-cd86-4dd8-b687-a5bdf5365caa	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT189M"}	2025-05-12 17:13:44.218+00
23a2af00-5456-4b0d-b308-e2b87506e87a	e94bb903-b682-50b3-984a-ecdfc8b428b8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT120M"}	2025-05-12 17:16:33.758+00
1e7a68a0-020e-4396-8ac4-3921e73564db	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-05-12 17:20:44.218+00
7620c2cd-727c-492d-a8ee-e7ec75cf2eb3	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-05-12 17:21:33.754+00
891ce4bf-e284-4b66-a411-8675135792d9	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-05-12 17:23:33.754+00
5018f77b-381e-48c0-922c-f0036979ab04	e94bb903-b682-50b3-984a-ecdfc8b428b8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-05-12 17:25:33.758+00
9aa05f92-10c2-433d-88e3-39fa7c3c515b	62656c39-1f1d-5a6e-b4d9-b5320dc37621	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT102M"}	2025-05-12 17:26:33.76+00
424b5181-550a-4b8d-8b49-77cc2012244d	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT68M"}	2025-05-12 18:31:33.754+00
e47e7e18-043f-4850-846f-79f62be1683d	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-12 18:34:33.754+00
8f751eb9-4d1d-4b34-8b96-1a6f79558da9	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-05-13 12:12:33.76+00
cffe490c-a443-4336-bc68-aa2064c88809	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-05-13 12:16:33.751+00
64303f0c-e4ee-49d5-a4a7-a8547e37552c	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT65M"}	2025-05-13 13:21:33.751+00
78963f33-1d24-47c8-9f17-8e5ae3d944a4	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT86M"}	2025-05-13 13:38:33.76+00
becfaa29-193a-4677-aebd-4905b4bfd636	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-05-13 13:48:33.76+00
f14201e6-02c3-4adf-a79b-2da7df3d0720	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-05-13 14:16:17.908+00
b76f1188-4c1d-4a54-9102-c1a9b919003f	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-05-13 14:19:17.908+00
34d26ba4-a9ed-4c29-a147-1c89b75ba467	e94bb903-b682-50b3-984a-ecdfc8b428b8	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-05-13 14:44:33.758+00
be4e803a-e1ed-4b91-be53-84ee2d3829b4	e94bb903-b682-50b3-984a-ecdfc8b428b8	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT115M"}	2025-05-13 16:39:33.758+00
843e5fa5-32e7-46de-b28f-ed46f89fc320	963076d1-bcef-5203-8e8a-5434830cb1b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-05-13 17:14:33.762+00
67ab481f-3016-4e3c-a531-fc968b16c435	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT479M"}	2025-05-13 22:18:17.908+00
da50abfa-9f56-423f-afc0-6e17a90050e1	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-05-13 22:28:17.908+00
1b2b30e9-7299-419e-a24b-58a048babfa9	d8b612a2-dc91-5792-8e83-e230551cbe05	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-05-14 10:47:53.41+00
cc64f13f-d748-4329-9f14-c8678ffb7353	d8b612a2-dc91-5792-8e83-e230551cbe05	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-05-14 10:49:53.41+00
2b87d898-68b4-4c86-8788-56572be817ae	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-05-14 11:33:33.756+00
2bd107af-9de9-4d25-a812-f90efb3d5020	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT33M"}	2025-05-14 12:06:33.756+00
9d3d76b4-2212-4501-994e-fca76dac6f90	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-14 12:08:33.756+00
5780467a-1c91-40ec-9282-16778bc59b3b	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	scored	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.4800621519243435}}	2025-05-14 13:57:33.756+00
c4ee9f45-3b03-4f78-8589-dedc474d3d0a	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	failed	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.4800621519243435}}	2025-05-14 14:26:33.756+00
18099e8b-8db6-4498-849a-815f6d18f42c	963076d1-bcef-5203-8e8a-5434830cb1b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-05-14 14:47:33.762+00
8f8558ed-b8f6-43da-aace-1bcd07512001	d8b612a2-dc91-5792-8e83-e230551cbe05	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT341M"}	2025-05-14 16:30:53.41+00
8fe6f0a1-93cd-4b43-9ee8-1da7c23c09dd	d8b612a2-dc91-5792-8e83-e230551cbe05	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-05-14 16:33:53.41+00
f9c44f5b-498e-422a-b466-c9959aec295f	963076d1-bcef-5203-8e8a-5434830cb1b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT107M"}	2025-05-14 16:34:33.762+00
53cb8627-dd0b-4514-a3c9-854481ce11e8	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-05-14 18:03:33.754+00
88dcd51b-691a-41d0-976f-72f1d45a4f4b	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT59M"}	2025-05-14 19:02:33.754+00
7d4b17f5-5786-439b-baae-d12bb2c751fe	62656c39-1f1d-5a6e-b4d9-b5320dc37621	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-05-15 11:38:33.76+00
d2a57444-e665-4dc2-ba45-835348585f1d	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-05-15 12:12:33.756+00
77c42447-0edb-41ab-8f02-559a481e575c	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-05-15 12:15:33.756+00
43cef68b-e660-40d5-816a-814b1e2e3a30	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT25M"}	2025-05-15 12:40:33.756+00
8fe015f2-06d0-41fb-b745-cde547d2f5e1	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	scored	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.4792371319405408}}	2025-05-15 13:40:33.756+00
c5fcebdf-cd0f-476e-a864-c8f8897bce09	62656c39-1f1d-5a6e-b4d9-b5320dc37621	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT146M"}	2025-05-15 14:04:33.76+00
6fb4f98e-a0bb-443f-b3ab-2e2114beca6f	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	failed	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.4792371319405408}}	2025-05-15 14:09:33.756+00
b21c0eca-e2d1-4e2d-9129-7a5f8440a9ef	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-05-15 15:54:27.373+00
48f91e1b-59bf-4a2c-98da-02a2eefdb8a2	963076d1-bcef-5203-8e8a-5434830cb1b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-05-15 15:54:33.762+00
c003364a-7659-46db-8e54-928a21f492ce	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-05-15 15:57:27.373+00
db24d237-d870-48af-a455-c8fddd6491ce	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-05-15 16:15:33.758+00
eb6bbc7a-47dd-47fc-ad83-59f20efb5a21	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-05-15 17:24:33.751+00
43542c07-235c-4ef1-8279-8109eadf5d0c	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT120M"}	2025-05-15 18:15:33.758+00
4e679d2b-6821-4bb1-9155-6a5f55da986d	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-05-15 18:22:33.758+00
efe569c4-14ef-41be-aa4d-3ad79c8ba880	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT79M"}	2025-05-15 18:43:33.751+00
51213501-3d2a-4ba1-ab6a-531be6dcef2e	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	fcc40587-6fbe-570f-8676-ba7f80daec71	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-15 20:52:33.751+00
7dd0f6e6-ebde-4a37-b097-cadd5f41724d	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	fcc40587-6fbe-570f-8676-ba7f80daec71	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-15 21:17:33.751+00
ab289515-4edf-41b9-9beb-b85519306efd	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT375M"}	2025-05-15 22:12:27.373+00
c66140d1-7235-4e90-895f-eca7162db0d6	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-05-15 22:20:27.373+00
6e32b4f0-367e-4250-b569-77a3ce339050	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-15 23:09:27.373+00
6a821f49-9510-494a-b1da-02148b62465b	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-15 23:10:27.373+00
d1c1cc01-86ac-4144-864f-fda5f976358b	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-15 23:17:27.373+00
fed161da-97c9-4662-8811-21eb1d425cb1	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-05-16 11:42:33.756+00
7ee95dd1-2b40-4dcc-893f-ef256c158f54	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT36M"}	2025-05-16 12:18:33.756+00
d375810d-b5b9-487e-b3ca-fcf83870d9b7	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-05-16 13:48:10.579+00
3691e003-6f4d-451f-a442-2e89b8bed3fa	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	scored	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56891170930392}}	2025-05-16 13:51:33.756+00
63e01dba-f80c-458d-8451-94694312bca2	9e6eaafb-451e-5224-b656-fbd90faee84a	f8743c64-6b32-5a84-a231-88eaa828b8f3	completed	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56891170930392}}	2025-05-16 14:20:33.756+00
77552d97-0e04-45eb-8ee8-719b6b1c0e64	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-05-16 15:45:33.754+00
a1c84cb1-91be-4a4d-bddb-c07578e5c35f	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-05-16 16:51:33.758+00
100c60fc-ad50-452e-ad8c-dc74ebde85a4	d8b612a2-dc91-5792-8e83-e230551cbe05	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-05-16 16:55:23.672+00
928ec21c-3c8d-4e78-88c0-6ddb3d4ce790	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT71M"}	2025-05-16 16:56:33.754+00
533f942d-5580-4fb6-9619-cb283a6bec6b	d8b612a2-dc91-5792-8e83-e230551cbe05	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-05-16 16:59:23.672+00
ed5976d5-6381-4f27-8001-ff14984c1425	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	scored	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.5585687503515632}}	2025-05-16 18:05:33.762+00
214689ef-78b7-41bf-a9d6-fd7e7ffea77e	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	completed	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.5585687503515632}}	2025-05-16 18:06:33.762+00
2170de58-b893-4ea9-94d2-0ae893b5d8f1	963076d1-bcef-5203-8e8a-5434830cb1b8	0f8226a0-d513-534c-871b-15d9f310349b	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-16 18:15:33.762+00
2ee9c993-fd5d-41b7-9e33-2eeb313a0559	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT110M"}	2025-05-16 18:41:33.758+00
fe1a04cc-213a-49ad-ad9d-2eab64e3596f	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	scored	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42050133476060314}}	2025-05-16 19:26:33.758+00
2ab569b5-9c9c-4748-a672-5f2c71747240	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	failed	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42050133476060314}}	2025-05-16 19:27:33.758+00
b5e1d2db-59ec-420f-9a34-86ab2892dbbd	d8b612a2-dc91-5792-8e83-e230551cbe05	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT266M"}	2025-05-16 21:25:23.672+00
31ec9fb8-7650-41fc-bcea-b23fb1196c2d	d8b612a2-dc91-5792-8e83-e230551cbe05	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-05-16 21:30:23.672+00
ae9bd7c0-2679-4170-9d2d-5857522ab5eb	62656c39-1f1d-5a6e-b4d9-b5320dc37621	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-05-17 14:24:33.76+00
b2bdfd25-3903-4f77-ae8a-a0bb4b01b91d	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-05-17 16:18:33.758+00
68c58f69-9df7-4397-98a6-ac08aef07728	62656c39-1f1d-5a6e-b4d9-b5320dc37621	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT148M"}	2025-05-17 16:52:33.76+00
371fe319-8d5c-4f77-bd38-7831372882be	62656c39-1f1d-5a6e-b4d9-b5320dc37621	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-05-17 17:02:33.76+00
f2f175a1-edfa-434c-85a1-05d1e379f160	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-05-17 17:09:29.104+00
374f7694-37ba-4d84-b1ff-61cc54d3dad8	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-17 17:11:29.104+00
6d8462e1-c356-4f69-b05a-1231fbc34bb9	963076d1-bcef-5203-8e8a-5434830cb1b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-17 17:26:33.762+00
f5e29765-e926-48f1-b4f4-13e52fe04807	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT104M"}	2025-05-17 18:02:33.758+00
a2485c2b-5d82-4544-9dbf-3797ffa3cbb3	963076d1-bcef-5203-8e8a-5434830cb1b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT97M"}	2025-05-17 19:03:33.762+00
091ff174-be3d-430a-9cfa-3b9f14dbb6f1	963076d1-bcef-5203-8e8a-5434830cb1b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	scored	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.9203513962650993}}	2025-05-17 19:39:33.762+00
df5571a1-ee55-458e-8b8c-9e839e34eef2	963076d1-bcef-5203-8e8a-5434830cb1b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	completed	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.9203513962650993}}	2025-05-17 19:40:33.762+00
d7f18797-5008-4248-a145-c746f2fda3de	963076d1-bcef-5203-8e8a-5434830cb1b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-17 19:43:33.762+00
dc7d2097-c330-4153-8b72-9d535ea268fd	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT514M"}	2025-05-18 01:45:29.104+00
64ee3ed1-85d9-4471-8557-ea0117358376	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-05-18 01:54:29.104+00
fb20091f-5bda-4ce0-a658-1e9ab5b5acc2	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-18 02:14:29.104+00
968f877d-d209-4f11-b3ea-c1072a277664	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-18 02:15:29.104+00
bb5ffe39-1a73-4048-bad1-de4f3f1ec365	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-05-18 02:24:29.104+00
7e72682e-5efe-4fea-92ab-a2183ef240fc	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-05-18 10:21:33.751+00
42cd6341-5607-4cea-98b2-c80ea4c8a1f2	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-05-18 10:25:33.751+00
7d66006a-4463-4348-a66e-22c13aac440f	9e6eaafb-451e-5224-b656-fbd90faee84a	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-05-18 11:23:33.756+00
b13bce2e-ec1f-4612-9fce-59f8766e4a24	9e6eaafb-451e-5224-b656-fbd90faee84a	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-05-18 11:28:33.756+00
4358df42-ca0b-4f31-a02f-b247c4549b1e	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT79M"}	2025-05-18 11:44:33.751+00
1011d270-e517-492a-a005-5a44a145a5b4	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-18 11:46:33.751+00
be1ac436-20ec-49da-bd56-d5ebe547811b	9e6eaafb-451e-5224-b656-fbd90faee84a	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT30M"}	2025-05-18 11:58:33.756+00
410e4549-e608-4176-be7f-2961abeb939e	d8b612a2-dc91-5792-8e83-e230551cbe05	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-05-18 12:03:26.486+00
d7485155-ea25-4e94-80a5-c39b8d39b8f5	d8b612a2-dc91-5792-8e83-e230551cbe05	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-05-18 12:08:26.486+00
5896fbc7-130e-402a-a078-9073f2fdf5c6	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-05-18 12:53:33.754+00
bcfd19e5-1e8c-4ded-adde-76430462905c	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-05-18 12:56:33.754+00
13fba882-9a86-436c-832f-3e306db2008e	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-05-18 13:39:43.756+00
7dcff51b-7a0f-44b7-b3e2-5b50e3c7e4a1	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-05-18 13:41:43.756+00
50ce1de3-5ef5-4d8a-a9a2-621aa9d1cc22	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT63M"}	2025-05-18 13:59:33.754+00
f82a44d9-18e1-42e6-b2a6-940775c18f12	d8b612a2-dc91-5792-8e83-e230551cbe05	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT125M"}	2025-05-18 14:13:26.486+00
9e1c87f8-85bf-42fa-9061-a2361ae51959	d8b612a2-dc91-5792-8e83-e230551cbe05	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-05-18 14:19:26.486+00
fb936b92-dcfd-4a6b-9e44-abc81a5aad51	e94bb903-b682-50b3-984a-ecdfc8b428b8	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-05-18 14:19:33.758+00
4d867f66-a69e-4ce8-9ce4-fe0911ca046e	e94bb903-b682-50b3-984a-ecdfc8b428b8	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT112M"}	2025-05-18 16:11:33.758+00
b11a8297-9999-47d4-8c06-cb04621ade0a	963076d1-bcef-5203-8e8a-5434830cb1b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-05-18 16:18:33.762+00
b5b91867-b2b8-4672-86c7-ac052d138615	e94bb903-b682-50b3-984a-ecdfc8b428b8	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-05-18 16:20:33.758+00
a8171929-ea70-4d90-8395-3fcbb0ada454	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT171M"}	2025-05-18 16:32:43.756+00
48ed6ca4-1abd-4fab-8c69-526e566117f8	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-05-18 16:38:43.756+00
5c00714a-7299-4e63-be45-31efd743e24c	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f8743c64-6b32-5a84-a231-88eaa828b8f3	scored	{"score": {"max": 100, "min": 0, "raw": 9, "scaled": 0.09235459222915711}}	2025-05-18 17:31:43.756+00
906a89b9-7e4a-4559-9b18-7e7f9b336a73	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f8743c64-6b32-5a84-a231-88eaa828b8f3	failed	{"score": {"max": 100, "min": 0, "raw": 9, "scaled": 0.09235459222915711}}	2025-05-18 17:32:43.756+00
fcaaa954-1eae-434d-8745-bfb2783dde6a	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	scored	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9032102934958766}}	2025-05-18 17:38:33.754+00
b135f9a0-1e68-4dc2-a92b-c803bbc3f065	963076d1-bcef-5203-8e8a-5434830cb1b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT84M"}	2025-05-18 17:42:33.762+00
ad37601f-8446-4f3e-9f92-a3cd576ca82a	f077b3df-c8db-5980-9d45-a9f18b43994f	0895d383-5f59-51b2-ae8c-e0b985d81f1f	completed	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9032102934958766}}	2025-05-18 17:56:33.754+00
55fad66b-22d3-4877-8252-a3e075c991cd	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-05-19 09:49:33.751+00
4b0cabbe-4820-46c5-b581-d07ae7967f14	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT67M"}	2025-05-19 10:56:33.751+00
a2468057-3f9b-4965-90ff-fd98228c2edc	9e6eaafb-451e-5224-b656-fbd90faee84a	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-05-19 12:45:33.756+00
381ed760-6a6f-4347-a0a0-17253d9df4e0	9e6eaafb-451e-5224-b656-fbd90faee84a	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-05-19 12:48:33.756+00
e309d84a-6d01-4810-8bdf-e4883a771681	9e6eaafb-451e-5224-b656-fbd90faee84a	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT37M"}	2025-05-19 13:25:33.756+00
cee06b61-e482-4253-aff6-7000d59a41c5	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-05-19 15:49:33.758+00
fa6abbee-d188-40d1-886f-65bf1b5ddf76	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT49M"}	2025-05-19 16:38:33.758+00
93463de1-cc37-4dc6-bfcd-b15c759dc917	62656c39-1f1d-5a6e-b4d9-b5320dc37621	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-05-19 17:10:33.76+00
e20de980-d7ea-48b3-ab65-4cb686bf5b62	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	scored	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.4848677450393621}}	2025-05-19 17:23:33.758+00
659aed90-5bf6-4b2c-ba46-b6f1dda6da46	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	failed	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.4848677450393621}}	2025-05-19 17:24:33.758+00
84041d5f-e5e9-4f48-9989-ca566df5c34d	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-05-19 18:40:58.633+00
f2486ea4-ef3e-4225-8786-e41421deee4a	62656c39-1f1d-5a6e-b4d9-b5320dc37621	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT91M"}	2025-05-19 18:41:33.76+00
701f9cba-f40a-4138-b007-8b6ee5473dfb	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-05-19 18:45:58.633+00
c15bfd45-d309-4426-b685-75a332268ec9	963076d1-bcef-5203-8e8a-5434830cb1b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-05-19 19:18:33.762+00
9e24ede6-641b-4f54-950f-1d52fbbd2a3c	963076d1-bcef-5203-8e8a-5434830cb1b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT133M"}	2025-05-19 21:31:33.762+00
69ff7d5e-bdeb-47f2-90be-0a8f5b179dae	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT589M"}	2025-05-20 04:34:58.633+00
f6357ffd-b95e-4c36-8107-2681ba2e02e4	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-05-20 04:44:58.633+00
b7b2ef3f-5696-40fa-84c6-624e7266823d	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-20 05:18:58.633+00
f044741f-b937-4b25-aa09-65b80b8744d9	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-20 05:19:58.633+00
a34c0a79-bcdb-4c4d-8241-d9eadf02533b	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	0f8226a0-d513-534c-871b-15d9f310349b	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-05-20 05:21:58.633+00
3224d568-bcd7-4b14-bedc-583a1d49e7ef	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-05-20 11:46:33.762+00
3147dab7-472c-41ba-adba-d84cd7fd8aea	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT115M"}	2025-05-20 13:41:33.762+00
98c0bf2b-558c-4407-ac83-2b5408630b4c	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	scored	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35487530372381343}}	2025-05-20 14:08:33.762+00
98e9058d-5eaf-4f20-9436-b8869aa7c446	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	failed	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35487530372381343}}	2025-05-20 14:09:33.762+00
08f3d3ed-7d58-43ec-9aea-3a2d5afa31cd	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-20 14:12:33.762+00
b3715c19-059b-4f82-bcf8-6bb40d73580d	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-05-20 15:04:33.758+00
c6510c57-3853-4b62-8b46-96b6bdb3ee88	62656c39-1f1d-5a6e-b4d9-b5320dc37621	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-05-20 15:43:33.76+00
cd239243-e540-4d26-8ac5-dc917bba0c87	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT127M"}	2025-05-20 17:11:33.758+00
74d5aa13-1694-4ab2-9ca0-3bd708816b01	62656c39-1f1d-5a6e-b4d9-b5320dc37621	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT117M"}	2025-05-20 17:40:33.76+00
54550cc2-f87d-4d00-9c82-690fa23d8591	62656c39-1f1d-5a6e-b4d9-b5320dc37621	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-05-20 17:46:33.76+00
5b48744b-8d22-4820-b471-d4d9dafa91bd	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-05-20 18:24:24.887+00
1e9f6743-02d0-43f0-b119-5702c18f7261	f077b3df-c8db-5980-9d45-a9f18b43994f	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-05-20 19:18:33.754+00
4a821169-1131-4771-aa01-41b84a7ed02b	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT57M"}	2025-05-20 19:21:24.887+00
eacb2ae4-b293-4495-ba42-6c3a6210ecee	f077b3df-c8db-5980-9d45-a9f18b43994f	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-05-20 19:21:33.754+00
d9918f37-7c30-4974-8c97-d803245d6ded	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-05-20 19:25:24.887+00
46fc38a2-3463-4e7d-9fa2-645ba5292213	f077b3df-c8db-5980-9d45-a9f18b43994f	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT72M"}	2025-05-20 20:33:33.754+00
d838e7ed-5584-4b6d-89e7-89656fcce8df	9e6eaafb-451e-5224-b656-fbd90faee84a	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-05-21 12:38:33.756+00
ad1c1b1e-bec8-4696-b326-853a2670e550	9e6eaafb-451e-5224-b656-fbd90faee84a	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-05-21 12:43:33.756+00
5cc48634-f1bf-44bd-a289-e2fa6c273871	9e6eaafb-451e-5224-b656-fbd90faee84a	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT32M"}	2025-05-21 13:15:33.756+00
b02f8e4a-693a-4d2a-aabf-277dc6aa52e9	9e6eaafb-451e-5224-b656-fbd90faee84a	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-21 13:16:33.756+00
7ab715e3-bf9f-4a3d-9935-75a84a6f2939	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-05-21 15:22:33.758+00
fadc3a53-614b-4bce-920f-349353e42453	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT81M"}	2025-05-21 16:43:33.758+00
ed6f6e81-81a3-477e-b509-7d1ee9302fa5	9e6eaafb-451e-5224-b656-fbd90faee84a	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	scored	{"score": {"max": 100, "min": 0, "raw": 75, "scaled": 0.7524724347554839}}	2025-05-21 16:51:33.756+00
fd808e54-2fe1-4e95-9f78-5b0e589d8f4c	9e6eaafb-451e-5224-b656-fbd90faee84a	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	completed	{"score": {"max": 100, "min": 0, "raw": 75, "scaled": 0.7524724347554839}}	2025-05-21 17:06:33.756+00
b8ce681d-c4e7-405b-b9b6-71d7d5c787d9	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-05-21 18:48:09.956+00
1aa7b49c-b4fc-42bc-b2eb-fc7016e917ac	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-05-21 18:52:09.956+00
1506ed48-8be5-4b5f-9926-17c0d82bd8ca	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-05-21 19:34:33.751+00
3c2808b3-d8ba-4c9b-910a-93981d46702a	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT66M"}	2025-05-21 20:40:33.751+00
4328dc39-9d24-443b-b8ee-17216984c4e3	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-21 20:45:33.751+00
65ba86e8-6530-438a-a088-2f039671675b	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-05-21 20:47:33.762+00
febaa759-1c7b-4cd3-8673-831301233566	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT110M"}	2025-05-21 22:37:33.762+00
31890ca8-953c-41ef-a86e-a2354153efd0	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-05-21 22:41:33.762+00
6cbbfe7f-6e80-423b-9dcc-7f3076e28157	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	scored	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.2963974247077287}}	2025-05-21 23:22:33.762+00
6a3a52f0-1fcd-4784-acf4-61bda96fc9b8	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	failed	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.2963974247077287}}	2025-05-21 23:23:33.762+00
ee2970e6-64eb-47d6-b421-716891d36553	963076d1-bcef-5203-8e8a-5434830cb1b8	4bfce604-c23f-530e-8c8e-a24764e1667a	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-21 23:25:33.762+00
c91c4ff9-7679-4392-8b20-c75e3650f2d1	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT339M"}	2025-05-22 00:31:09.956+00
a53dc0c6-ef5b-43df-a92c-1794476b214f	fe17d1aa-87b5-5735-9eb1-6e54b52cb171	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-05-22 00:38:09.956+00
f9580c1e-a6cb-4006-bd56-0d167c947eee	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-05-22 11:13:33.76+00
26a28667-749a-4f03-ab06-eca4d305bfa4	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT185M"}	2025-05-22 14:18:33.76+00
bad79111-2f20-492e-a4a4-183573587912	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-05-22 15:05:33.758+00
bbe1eba6-2a13-41ef-bd58-523e9d8665b6	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT67M"}	2025-05-22 16:12:33.758+00
57aee9d7-425b-4f22-852f-fd34f665697e	963076d1-bcef-5203-8e8a-5434830cb1b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-05-22 20:38:33.762+00
1729aae1-c71a-428c-bf8b-8b2286bf631d	963076d1-bcef-5203-8e8a-5434830cb1b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT73M"}	2025-05-22 21:51:33.762+00
f368a2d5-9dcd-438f-9b5a-65e27dcc47cb	f077b3df-c8db-5980-9d45-a9f18b43994f	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-05-23 15:56:33.754+00
d3c543e0-7e46-4e49-8057-c00f10e3d39c	d8b612a2-dc91-5792-8e83-e230551cbe05	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-05-23 16:28:50.34+00
f811359f-4b43-4489-8619-9c8a05362969	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-05-23 16:46:33.758+00
c9153265-579b-450d-ad81-f1461dfa7a68	f077b3df-c8db-5980-9d45-a9f18b43994f	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT65M"}	2025-05-23 17:01:33.754+00
badb23c3-efdb-47bd-a1f1-0e9517857f96	f077b3df-c8db-5980-9d45-a9f18b43994f	f10c153c-968c-5979-b6cc-05736dc40095	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-23 17:03:33.754+00
c598f1d5-9c7d-4400-b7a7-935597dc9831	d8b612a2-dc91-5792-8e83-e230551cbe05	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT86M"}	2025-05-23 17:54:50.34+00
80fd8259-f22c-42c4-93a9-e822b934cd8b	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT82M"}	2025-05-23 18:08:33.758+00
fec520fb-82f7-4b23-97d2-63a3a9d42aaa	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-05-23 18:12:33.758+00
2bba3c80-03c4-400a-abc3-bb2ea1819630	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-05-23 19:34:33.751+00
db7be9f4-b3af-4b71-bdfb-28aaa3a2a259	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT67M"}	2025-05-23 20:41:33.751+00
1a8c94f0-8777-4b6b-91c8-12c2d479fad2	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	scored	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.7981536395012527}}	2025-05-23 23:47:33.751+00
be3244cf-cdd9-4c35-8491-1c8ab63d6196	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	completed	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.7981536395012527}}	2025-05-24 00:07:33.751+00
4e2ec5c7-f036-4c2c-a0b4-69d731886331	f077b3df-c8db-5980-9d45-a9f18b43994f	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-05-24 13:24:33.754+00
558eb3ce-8087-4d4f-b783-aa8519e813e9	f077b3df-c8db-5980-9d45-a9f18b43994f	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT71M"}	2025-05-24 14:35:33.754+00
de2ce875-a686-4e34-88ea-eb0acbdf8f18	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-05-24 15:56:41.719+00
ac0a4ca4-11a2-45f9-ab60-89a17741a502	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-05-24 15:58:41.719+00
149039ff-0145-4d42-b601-aaa1de7c718e	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-05-24 15:59:33.758+00
78f3713c-6687-40af-8ab9-e9ae7192c3a1	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-05-24 16:00:33.76+00
efb70153-d2a1-40b8-9a51-85e5299f4b12	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT64M"}	2025-05-24 17:03:33.758+00
b0d925b2-f052-412e-9885-122f83528327	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT112M"}	2025-05-24 17:52:33.76+00
b0fa75b5-392e-4133-9795-cfe57dc57e27	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-05-24 17:57:33.76+00
abc7ad94-1118-404f-8453-f27d0de59193	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-24 18:13:33.76+00
272e47ea-e6d2-47ec-8fa8-17423a7d6ca1	62656c39-1f1d-5a6e-b4d9-b5320dc37621	70423966-9ebb-5262-b082-4b8925547d57	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-24 18:14:33.76+00
dacc659c-a668-4dc6-95a4-9f2c00f4c7c4	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT316M"}	2025-05-24 21:14:41.719+00
5cdd1c58-565b-49e4-be68-bae73ea4e0bd	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-05-24 21:17:41.719+00
cb93aaf2-f8e5-4ef6-b01c-ef50cc4ba3de	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-24 22:12:41.719+00
8bfa84d8-4cd1-456f-85e1-4c2731bd951c	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-24 22:13:41.719+00
643d8298-538a-49f3-bb55-2bf10c0ceba3	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-24 22:17:41.719+00
8aea7f2c-6df6-4096-9181-d210947f63ea	62656c39-1f1d-5a6e-b4d9-b5320dc37621	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-05-25 17:43:33.76+00
43618f98-6df3-4656-90fe-d6e689eb4033	e94bb903-b682-50b3-984a-ecdfc8b428b8	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-05-25 18:27:33.758+00
4434cf83-081f-4f37-89f1-147bff8ca7f4	e94bb903-b682-50b3-984a-ecdfc8b428b8	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT73M"}	2025-05-25 19:40:33.758+00
a2ee18d0-ab38-4bf2-87c9-6f06b54a6863	e94bb903-b682-50b3-984a-ecdfc8b428b8	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-05-25 19:44:33.758+00
7453a86a-7980-4714-a09a-40919e7e6c5b	62656c39-1f1d-5a6e-b4d9-b5320dc37621	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT194M"}	2025-05-25 20:57:33.76+00
21541a63-a3cd-4a8c-a6dd-baea17781dd2	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-05-26 13:44:33.308+00
0a62db54-adfe-45cc-a8ad-7b6f7ee8a2d2	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-05-26 13:49:33.308+00
03757d7a-9434-4d79-a5c8-8890ebdef96a	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-05-26 15:26:33.758+00
6f73dd63-debf-4c1e-ac92-df474e896fbe	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT111M"}	2025-05-26 17:17:33.758+00
1bfc95b6-1efe-46f1-a1df-cf671c9f927e	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-05-26 18:00:33.751+00
470ed1c4-8fae-464f-b9eb-098b14036855	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT62M"}	2025-05-26 19:02:33.751+00
2c674d9c-bf0a-480e-8610-217603947edc	f077b3df-c8db-5980-9d45-a9f18b43994f	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-05-26 19:34:33.754+00
44c7d841-10f1-4990-a1cf-1dbec8d296b8	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT354M"}	2025-05-26 19:43:33.308+00
f024aa9b-0f5b-4098-9c95-2c8dac766bc8	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-05-26 19:50:33.308+00
7fffabdb-9624-447c-a589-73cc4a8f5d38	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-26 20:04:33.308+00
f5dad93f-6466-4b70-b2fd-77d37b213e30	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-26 20:05:33.308+00
85b673d3-9726-4606-8fdd-86d8c4dfc3a0	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-06-02 13:25:15.003+00
1ba6d0fd-101b-4302-9a9a-719b77f95a03	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-26 20:07:33.308+00
b40d9cc1-30a9-4859-bd68-5b2fd526c5ab	f077b3df-c8db-5980-9d45-a9f18b43994f	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT67M"}	2025-05-26 20:41:33.754+00
c68c74cc-4f47-4215-9e54-f3124df789c6	f077b3df-c8db-5980-9d45-a9f18b43994f	f10c153c-968c-5979-b6cc-05736dc40095	scored	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.777438110091107}}	2025-05-27 00:23:33.754+00
b2767797-f37a-40e5-aca9-32f287346d23	f077b3df-c8db-5980-9d45-a9f18b43994f	f10c153c-968c-5979-b6cc-05736dc40095	completed	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.777438110091107}}	2025-05-27 00:45:33.754+00
64f38677-be71-4a3e-aca2-f5f230ecb931	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-05-27 11:08:33.751+00
119495a5-673c-4f02-af78-7c26c4e3de56	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-05-27 11:13:33.751+00
535084f2-baa2-4de4-b308-71356f6b1a6d	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT64M"}	2025-05-27 12:17:33.751+00
57a514bd-68c0-4677-9087-76d1a4e260cb	62656c39-1f1d-5a6e-b4d9-b5320dc37621	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-05-27 17:24:33.76+00
e1898721-478d-4d9d-ab85-e14e4085eaa7	62656c39-1f1d-5a6e-b4d9-b5320dc37621	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT181M"}	2025-05-27 20:25:33.76+00
2727319c-8d12-4913-b73b-b75aa89636c3	62656c39-1f1d-5a6e-b4d9-b5320dc37621	6db96e1f-b595-5aec-adbb-46b408029b79	scored	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5698767661498264}}	2025-05-27 20:55:33.76+00
1e38c0f1-fc54-4bd5-beae-63f8deac680a	62656c39-1f1d-5a6e-b4d9-b5320dc37621	6db96e1f-b595-5aec-adbb-46b408029b79	completed	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5698767661498264}}	2025-05-27 20:56:33.76+00
48bd5f36-82f6-47b8-9bc5-e387ae1250ad	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-05-28 12:57:21.541+00
35ec1dbf-a397-440d-9869-9fe72e315c22	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-05-28 13:00:21.541+00
ca0ed6ca-eca9-4366-b22e-5df3bf75f2d7	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT219M"}	2025-05-28 16:39:21.541+00
8646e1cd-c047-4a65-863f-0203d904229d	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-05-28 16:49:21.541+00
eb8e1652-39e2-44b4-8528-8607c136e227	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-05-28 17:49:33.76+00
df8d09bc-7f99-491e-86ac-a3a020565b55	e94bb903-b682-50b3-984a-ecdfc8b428b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-05-28 18:39:33.758+00
e224c30d-42c2-4d7c-9a7f-305340bf5d61	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT168M"}	2025-05-28 20:37:33.76+00
6c8c3a9c-8a5d-40ef-8d52-eae291e862e5	e94bb903-b682-50b3-984a-ecdfc8b428b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT137M"}	2025-05-28 20:56:33.758+00
80e778ce-d6a5-4b68-bf7d-8279d13a3a64	e94bb903-b682-50b3-984a-ecdfc8b428b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-05-28 21:00:33.758+00
8e135a1c-6d1c-4407-ac39-3949db352583	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f10c153c-968c-5979-b6cc-05736dc40095	scored	{"score": {"max": 100, "min": 0, "raw": 97, "scaled": 0.9740556620131539}}	2025-05-28 21:20:33.76+00
937f540e-4061-4af5-aa0e-f16f2763e522	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f10c153c-968c-5979-b6cc-05736dc40095	completed	{"score": {"max": 100, "min": 0, "raw": 97, "scaled": 0.9740556620131539}}	2025-05-28 21:21:33.76+00
a1e4e047-3fdd-4007-aced-4d95c9d4b19e	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f10c153c-968c-5979-b6cc-05736dc40095	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-05-28 21:29:33.76+00
10fb3942-f2d0-44d6-85ec-b5d9d47b1ef2	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-05-29 13:27:33.751+00
5c0c4951-d795-49f6-b70c-e967d58c9c2f	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-05-29 13:32:33.751+00
e4381369-59d1-4f5b-8ffb-b650cd522a4f	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT82M"}	2025-05-29 14:54:33.751+00
38e644bd-c5e0-4484-81b4-24cb3d67958f	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-29 14:56:33.751+00
895ef1b8-679f-48ef-9bd5-4b9d643d5c17	e94bb903-b682-50b3-984a-ecdfc8b428b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-05-29 16:46:33.758+00
b4328a90-4092-4423-ad58-ac5d075673e7	e94bb903-b682-50b3-984a-ecdfc8b428b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT82M"}	2025-05-29 18:08:33.758+00
ff49c998-36ae-4cf1-81a8-8ab5d0f6532b	e94bb903-b682-50b3-984a-ecdfc8b428b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-05-29 18:17:33.758+00
c2fa2daf-f00e-4ca3-b557-5454410233e4	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-05-30 09:17:33.751+00
2f737a1d-0f02-4a04-9ea3-629ae2564f6b	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-05-30 09:19:33.751+00
953ad89a-b077-4107-8bf3-1b3f86385c86	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT70M"}	2025-05-30 10:29:33.751+00
ce5697c0-b33e-4e40-ab91-94a99b87a274	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-30 10:33:33.751+00
611eb715-52cb-43c0-bddb-25a5de17e870	62656c39-1f1d-5a6e-b4d9-b5320dc37621	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-05-30 13:06:33.76+00
7c22c2d2-0491-4b1c-a850-3f1179d1cbd1	62656c39-1f1d-5a6e-b4d9-b5320dc37621	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT190M"}	2025-05-30 16:16:33.76+00
9ea8e787-7bb7-4027-953c-f465cf5efeca	62656c39-1f1d-5a6e-b4d9-b5320dc37621	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-05-30 16:19:33.76+00
bc9cd2fa-91ec-41ba-9423-88a5cfacf239	62656c39-1f1d-5a6e-b4d9-b5320dc37621	dd4608c4-45ad-543d-a42c-6276790440d3	scored	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48691389540711055}}	2025-05-30 16:38:33.76+00
c1d8a303-4817-467a-822a-48cccaf16692	62656c39-1f1d-5a6e-b4d9-b5320dc37621	dd4608c4-45ad-543d-a42c-6276790440d3	failed	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48691389540711055}}	2025-05-30 16:39:33.76+00
7bc0dfcc-2b39-4665-b824-27d97a166edd	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-05-31 13:17:53.073+00
65cb1212-0ac3-4d1a-a391-bc9e0f95f335	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-05-31 13:21:53.073+00
b8ae9176-fb72-4bcb-9102-b6a89b1c3724	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT200M"}	2025-05-31 16:41:53.073+00
73958929-4f1f-4149-b892-833c7da168f5	e94bb903-b682-50b3-984a-ecdfc8b428b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-05-31 16:48:33.758+00
ae46a8e9-8a16-4696-8d75-1087e2cbc325	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-05-31 16:49:53.073+00
febe7758-9a3f-43b8-a3c9-f5bb4ddaa4e5	d8b612a2-dc91-5792-8e83-e230551cbe05	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-05-31 17:06:26.685+00
5e7558dc-87dc-4717-b0e2-140c9cd4a4e8	d8b612a2-dc91-5792-8e83-e230551cbe05	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-05-31 17:08:26.685+00
98712242-2256-40d6-b818-ee96068d746e	e94bb903-b682-50b3-984a-ecdfc8b428b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT59M"}	2025-05-31 17:47:33.758+00
a878bbc0-d50c-40d5-a80f-f96d0deb007b	e94bb903-b682-50b3-984a-ecdfc8b428b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	scored	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.8251098582366578}}	2025-05-31 18:23:33.758+00
083e712b-409d-43d7-991d-7bf8c5b7cd6a	e94bb903-b682-50b3-984a-ecdfc8b428b8	f8743c64-6b32-5a84-a231-88eaa828b8f3	completed	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.8251098582366578}}	2025-05-31 18:24:33.758+00
2e8cf25b-562d-441e-9672-45c0a80feaad	d8b612a2-dc91-5792-8e83-e230551cbe05	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT132M"}	2025-05-31 19:20:26.685+00
29a83567-e466-4663-8adc-9788c2ea9e23	f077b3df-c8db-5980-9d45-a9f18b43994f	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-05-31 19:58:33.754+00
46f9b975-1ca4-4cf1-861f-cebd6f447ed2	f077b3df-c8db-5980-9d45-a9f18b43994f	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT60M"}	2025-05-31 20:58:33.754+00
e49d6613-b087-4198-9456-96d951ec36f9	f077b3df-c8db-5980-9d45-a9f18b43994f	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-06-01 15:15:33.754+00
08d0cac6-be0b-4b0e-96ca-4a0f531d006b	f077b3df-c8db-5980-9d45-a9f18b43994f	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT55M"}	2025-06-01 16:10:33.754+00
9a64892e-1976-41a7-b27b-1f0a0bb865da	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-06-01 16:15:33.751+00
8f09f17c-e0aa-444a-8d55-ba1b3becd203	62656c39-1f1d-5a6e-b4d9-b5320dc37621	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-06-01 17:07:33.76+00
bca994b6-4332-4387-a93b-f41f9bfce1a7	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT84M"}	2025-06-01 17:39:33.751+00
3c8793b5-e624-4cc7-a21a-76adad698958	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	scored	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.6909941707753944}}	2025-06-01 20:50:33.751+00
f84c1017-c1c6-4874-9765-2271fad625c8	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	dd4608c4-45ad-543d-a42c-6276790440d3	completed	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.6909941707753944}}	2025-06-01 21:06:33.751+00
02eb90e7-0245-45a9-bb4a-2b3e1304eb55	d8b612a2-dc91-5792-8e83-e230551cbe05	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-06-02 12:34:30.503+00
d16dbe14-e4f8-489c-8a5e-83c0a3ff8621	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-06-02 13:23:15.003+00
47b087c4-27b3-4e1a-9c1e-b59bd09df92d	d8b612a2-dc91-5792-8e83-e230551cbe05	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT62M"}	2025-06-02 13:36:30.503+00
8145b5e5-43d6-44cf-80db-83f1c278e184	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-06-02 16:20:33.758+00
6ad5ed65-a646-4b1e-b211-fda913d7db4f	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT92M"}	2025-06-02 17:52:33.758+00
230acb7d-81b7-4ed8-90be-a799cc4bc347	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT384M"}	2025-06-02 19:49:15.003+00
b020593b-0fd4-40f7-a8aa-9d0029bcf357	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-06-02 19:52:15.003+00
d83708d6-1aae-4a4c-b806-0e97d3b510ad	62656c39-1f1d-5a6e-b4d9-b5320dc37621	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-06-03 13:48:33.76+00
ced85072-d4e4-484f-aa26-fa71e5bc63db	f077b3df-c8db-5980-9d45-a9f18b43994f	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-06-03 15:17:33.754+00
ae77dcdb-54a9-496c-9843-f50cc769cd1e	f077b3df-c8db-5980-9d45-a9f18b43994f	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT53M"}	2025-06-03 16:10:33.754+00
24bbb445-3676-423d-8699-1a827dc623a7	62656c39-1f1d-5a6e-b4d9-b5320dc37621	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT149M"}	2025-06-03 16:17:33.76+00
4dc45201-52e5-46cf-896d-7e9a724cab8e	f077b3df-c8db-5980-9d45-a9f18b43994f	6db96e1f-b595-5aec-adbb-46b408029b79	scored	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.6595206522546754}}	2025-06-03 17:16:33.754+00
f764557f-86fc-4af2-bed8-1aa3595abb20	f077b3df-c8db-5980-9d45-a9f18b43994f	6db96e1f-b595-5aec-adbb-46b408029b79	completed	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.6595206522546754}}	2025-06-03 17:34:33.754+00
8fe3318a-b1a7-4e07-8f78-162a338b3f3d	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-06-04 11:48:33.751+00
3c808489-37df-469a-a4ee-5b45abbbe002	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT82M"}	2025-06-04 13:10:33.751+00
22438d74-8f45-4a6a-8cee-ec52761e0c27	e94bb903-b682-50b3-984a-ecdfc8b428b8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-06-04 17:47:33.758+00
2946f9e7-5cb6-48b6-b844-cffa779eadac	62656c39-1f1d-5a6e-b4d9-b5320dc37621	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-06-04 17:51:33.76+00
078b6ae4-d141-4d40-9a54-548c13726244	e94bb903-b682-50b3-984a-ecdfc8b428b8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT101M"}	2025-06-04 19:28:33.758+00
76ab7567-24a4-447c-81e5-50589ff25fae	62656c39-1f1d-5a6e-b4d9-b5320dc37621	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT178M"}	2025-06-04 20:49:33.76+00
b9360121-2017-411e-ab2a-a43ba3be4918	62656c39-1f1d-5a6e-b4d9-b5320dc37621	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-06-04 20:54:33.76+00
9a6749fb-d9d7-4794-afbb-d3e0a88d58c0	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-06-05 12:28:33.76+00
d58d57be-61a8-48b1-9656-f2652f9e643a	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-06-05 13:30:23.093+00
397e24b4-129f-4da6-8624-0bfd480f23b7	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-06-05 13:32:23.093+00
7197f8ef-d933-47e2-9cb9-41235c615f4e	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-06-05 15:18:33.758+00
06eaa2d9-b097-4dfa-a6e5-6ee9b4ec120d	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT187M"}	2025-06-05 15:35:33.76+00
7cc65367-c418-4351-8b46-272301dfff38	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-06-05 15:43:33.76+00
ca254563-57cd-4a28-a41b-09e995cc9a91	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	scored	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.4776880436145596}}	2025-06-05 16:42:33.76+00
d0e6ba05-7706-46ea-9f68-7c4a6b793d43	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	failed	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.4776880436145596}}	2025-06-05 16:43:33.76+00
b52be54f-9556-48dd-9e17-29fc8b0618d1	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT457M"}	2025-06-05 21:09:23.093+00
11a87438-9653-47d9-9c91-bf65fc2866a2	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-06-05 21:19:23.093+00
f730f14c-9368-4026-94cd-f826bdd91f5a	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-05 22:14:23.093+00
dca046c9-65cb-4075-b151-adf21b37e7ea	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-05 22:15:23.093+00
00158e69-5c49-4ebc-beba-0a255fc11b42	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0f8226a0-d513-534c-871b-15d9f310349b	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-05 22:19:23.093+00
339562bb-9c15-4b13-acf8-1b76f9ee680c	d8b612a2-dc91-5792-8e83-e230551cbe05	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-06-06 11:20:30.865+00
36aaf67b-d497-4f02-aadf-e04508e35e17	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-06-06 12:19:33.76+00
4238078f-962f-4a3e-9ea7-1a1f2b217f2c	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-06-06 12:40:33.751+00
16e4ef3f-649a-4e57-976b-05347a0f20dc	d8b612a2-dc91-5792-8e83-e230551cbe05	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT102M"}	2025-06-06 13:02:30.865+00
9187cc73-ce21-4a3b-ab58-37690d0064fe	d8b612a2-dc91-5792-8e83-e230551cbe05	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-06-06 13:06:30.865+00
5bf1a9a1-5c66-4b45-ab90-d83efa7bf8bf	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT107M"}	2025-06-06 14:06:33.76+00
92decd5c-7f16-4c0c-b8db-f57db501d020	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT90M"}	2025-06-06 14:10:33.751+00
257604f4-970d-41b8-acc8-7ea6f0f8c1a8	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-06-06 16:53:33.754+00
e57b1b16-0c37-40e9-b1f2-6a9e326ca12d	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT54M"}	2025-06-06 17:47:33.754+00
99623648-0f87-4099-b6f1-1fa2183945ce	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-06 17:50:33.754+00
5317dd61-43e4-4c4a-9d65-039546e6eaa6	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-06-06 18:22:33.758+00
eb2bfad5-9b33-4c4a-8cef-be542ebaab7b	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT99M"}	2025-06-06 20:01:33.758+00
b6e33ae4-7b6b-4ec4-b8f9-97a86a94a10d	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-06-07 15:33:53.683+00
79884680-452e-4944-be27-fce7ad200810	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-06-07 15:37:53.683+00
9a6f743e-2be6-43b7-af0f-542c6e551d2a	e94bb903-b682-50b3-984a-ecdfc8b428b8	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-06-07 16:45:33.758+00
3b4af7cf-9d39-4e6a-8de5-3d098dec88c2	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT498M"}	2025-06-07 23:55:53.683+00
e4f85859-8bb2-435c-afa2-8ddc6f6681cd	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-06-07 23:58:53.683+00
df9abafb-9d17-40fe-899f-398bdc72c848	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-06-08 09:04:33.751+00
73e1ca4d-83a8-4981-b075-ad1877725f6d	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-06-08 09:07:33.751+00
20510db6-2c2b-431f-b468-e0727ad8e5e8	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT79M"}	2025-06-08 10:26:33.751+00
16279d96-33d3-42b2-8fb1-9d6cbc27487d	62656c39-1f1d-5a6e-b4d9-b5320dc37621	4bfce604-c23f-530e-8c8e-a24764e1667a	scored	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.5859025554425761}}	2025-06-08 11:52:33.76+00
fedea497-601e-4fce-82ac-490b30337578	62656c39-1f1d-5a6e-b4d9-b5320dc37621	4bfce604-c23f-530e-8c8e-a24764e1667a	completed	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.5859025554425761}}	2025-06-08 11:53:33.76+00
168277d2-7f37-40fb-b741-d68ff757ed42	62656c39-1f1d-5a6e-b4d9-b5320dc37621	4bfce604-c23f-530e-8c8e-a24764e1667a	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-08 11:55:33.76+00
e6e97766-2a41-4ad0-ba4e-84cf8358c2e4	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-06-08 14:18:33.754+00
632df03d-46b6-4ba4-bef1-16c6a2fa3d0d	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT60M"}	2025-06-08 15:18:33.754+00
584d888f-94d6-473b-ac00-36e0c81b74a7	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-06-08 16:47:33.758+00
b53c6b8e-c513-481c-b680-140dc24ad9ff	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT123M"}	2025-06-08 18:50:33.758+00
04886eb4-961e-4995-bd72-e06bac9cea93	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-06-08 18:57:33.758+00
251728b9-9071-49e8-8a12-e82196dfbcb0	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-06-09 10:59:33.751+00
b50d9685-1748-448f-93d0-bb128ecba624	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-06-09 11:02:33.751+00
2c8a2f11-c0e5-4298-8598-8d7d7d40aaaf	62656c39-1f1d-5a6e-b4d9-b5320dc37621	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-06-09 12:02:33.76+00
0cf09d92-58b7-45be-8660-a3fe2db824d8	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT66M"}	2025-06-09 12:08:33.751+00
fde509bd-5cc5-4a8e-abe6-75407dcfb2d6	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-06-09 13:13:33.754+00
03660b25-1630-4622-ae34-787cbb728f0b	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT68M"}	2025-06-09 14:21:33.754+00
3d75c1f5-cf82-4481-90d2-e5a302a6f782	62656c39-1f1d-5a6e-b4d9-b5320dc37621	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT146M"}	2025-06-09 14:28:33.76+00
055c471e-ee14-44d8-af5a-fd3f3f45df84	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-06-09 18:20:33.758+00
63c71aff-6e2b-4499-aa61-b26c009ca4ab	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT109M"}	2025-06-09 20:09:33.758+00
2c7e806d-6ed9-48c2-873a-6fd37fb90083	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-06-09 20:18:33.758+00
11bedeab-9ad3-40ff-98fc-e8706882d1c5	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	scored	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.8170872629363499}}	2025-06-09 21:12:33.758+00
3199a69b-bf62-45e6-a42e-76c013c92b84	e94bb903-b682-50b3-984a-ecdfc8b428b8	0f8226a0-d513-534c-871b-15d9f310349b	completed	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.8170872629363499}}	2025-06-09 21:13:33.758+00
2901dea3-0883-4901-b2f0-fa0e37b3ce2c	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-06-10 14:35:33.754+00
738d952e-8e4a-41bc-91f2-1c54743f12b9	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT52M"}	2025-06-10 15:27:33.754+00
9ac4fbd6-2302-4bdb-9801-441cca67b2dc	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-06-10 15:33:21.983+00
a2699997-31e3-4785-94bd-3ad9d6c6e2eb	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-06-10 15:37:21.983+00
b1d382e7-2a9d-4cd6-8da8-d9767f8f9ad1	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-06-10 16:04:33.751+00
66841e61-42b9-45d5-93db-75c45f9c8ed1	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT73M"}	2025-06-10 17:17:33.751+00
f53fa873-0ffb-4b4c-9b7c-ac4cd8ea3d09	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-06-10 17:18:33.751+00
2ccf10cf-6831-4337-a31a-0326821dbfdd	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	scored	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.4418905819080649}}	2025-06-10 18:02:33.754+00
45b3b8e1-fedb-4c7d-820c-1e2a1d9e57c3	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	failed	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.4418905819080649}}	2025-06-10 18:21:33.754+00
3dd31575-9ffd-46a0-9259-84f01a644553	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT228M"}	2025-06-10 19:25:21.983+00
b72afba4-4725-4ef4-b057-bcc739ad90a5	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-06-10 19:34:21.983+00
876df6fe-3eb7-4fe6-9111-13c6a5f435ab	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-10 19:53:33.751+00
c495cee1-98c9-4772-b1e5-5106cdb91269	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f10c153c-968c-5979-b6cc-05736dc40095	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-10 20:10:33.751+00
a085fc2b-b55b-4ac9-a722-cba8631e46a9	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-06-11 15:48:33.758+00
f63c573f-3453-40ee-993a-558571d5b24c	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT70M"}	2025-06-11 16:58:33.758+00
76f17ec3-3bea-4187-b35b-0f85d7fe70da	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-06-12 11:40:33.754+00
97360089-7f5f-4988-bcab-6deb8903a69f	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-06-12 11:42:33.754+00
c4e26d9a-a2cf-4784-a040-69eabf50349e	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT49M"}	2025-06-12 12:31:33.754+00
3c276a5d-951e-4379-97f8-ee59f1285221	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-06-12 12:33:39.426+00
6cfb5428-ace1-489a-84a3-a104161b35fe	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-06-12 12:37:39.426+00
812de895-17b7-4b9b-b00d-ad35302b2f3b	e94bb903-b682-50b3-984a-ecdfc8b428b8	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-06-12 14:32:33.758+00
1460a2c3-0872-4136-b200-7e69fb904338	62656c39-1f1d-5a6e-b4d9-b5320dc37621	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-06-12 14:33:33.76+00
bc0888cb-03df-47dc-a615-4bad2ba786b6	e94bb903-b682-50b3-984a-ecdfc8b428b8	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT60M"}	2025-06-12 15:32:33.758+00
32258fd6-51a1-4596-aa92-3a6972356ac4	e94bb903-b682-50b3-984a-ecdfc8b428b8	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-06-12 15:39:33.758+00
26ade34d-6b17-4f71-92e0-54db71d743eb	62656c39-1f1d-5a6e-b4d9-b5320dc37621	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT74M"}	2025-06-12 15:47:33.76+00
ca6b665a-54a2-433d-b05c-00fa1314c3ea	e94bb903-b682-50b3-984a-ecdfc8b428b8	fcc40587-6fbe-570f-8676-ba7f80daec71	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-12 15:56:33.758+00
0b7bdf1c-b62c-4c52-b930-1a88776cc500	e94bb903-b682-50b3-984a-ecdfc8b428b8	fcc40587-6fbe-570f-8676-ba7f80daec71	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-12 15:57:33.758+00
5879b584-1fcc-44a3-b3ca-3c2678a5714c	e94bb903-b682-50b3-984a-ecdfc8b428b8	fcc40587-6fbe-570f-8676-ba7f80daec71	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-12 15:59:33.758+00
6757470f-eb8c-4c7b-a96c-59d66230f181	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT383M"}	2025-06-12 19:00:39.426+00
49fa26e5-69b7-40dc-9de7-981d25ce043b	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-06-12 19:06:39.426+00
9ae44d30-59f8-46ac-88dd-6df206d52b1f	62656c39-1f1d-5a6e-b4d9-b5320dc37621	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-06-13 13:42:33.76+00
0dccb372-f521-4c40-86cb-c79c98c2575e	d8b612a2-dc91-5792-8e83-e230551cbe05	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-06-13 14:03:03.21+00
5c2177c1-8bfe-4519-b59d-70331581d83e	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-06-13 15:42:33.751+00
76e4987b-1b63-4612-a80f-b0eabb5ae5d4	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-06-13 15:44:33.751+00
b5a423cb-3e83-4190-9a4f-7d1b60e28cab	d8b612a2-dc91-5792-8e83-e230551cbe05	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT111M"}	2025-06-13 15:54:03.21+00
2191f8bc-27ba-4ca7-95d3-fe552a8499e0	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT80M"}	2025-06-13 17:04:33.751+00
35314de4-a74c-4af7-9560-5cbc56a46ff1	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-13 17:05:33.751+00
9b95cb92-bb14-43ae-a192-1395a7bedda1	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-06-14 15:40:33.758+00
5d257221-141e-422e-a1fd-3172c6d449f1	62656c39-1f1d-5a6e-b4d9-b5320dc37621	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-06-14 15:56:33.76+00
d7ecda23-b568-4a33-a379-f20e0ca3b085	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT115M"}	2025-06-14 17:35:33.758+00
272ffbf7-88ae-4334-8ed6-559c6e691e8e	62656c39-1f1d-5a6e-b4d9-b5320dc37621	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT119M"}	2025-06-14 17:55:33.76+00
b083267e-2df6-4ba4-8282-f982bbf81b16	62656c39-1f1d-5a6e-b4d9-b5320dc37621	dd4608c4-45ad-543d-a42c-6276790440d3	scored	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.7746770646100316}}	2025-06-14 18:38:33.76+00
15129bba-fb80-43e9-96f1-fa01a4668b04	62656c39-1f1d-5a6e-b4d9-b5320dc37621	dd4608c4-45ad-543d-a42c-6276790440d3	completed	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.7746770646100316}}	2025-06-14 18:39:33.76+00
bc062eb9-43ba-4c1a-833a-6ae5177edc4d	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-06-15 12:56:33.751+00
6f53062f-7f54-4a3d-867a-04b406db5ca0	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-06-15 13:30:03.676+00
3d6f37b8-2151-4f62-b27c-5bcb958b1816	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-06-15 13:33:03.676+00
fe810363-71bf-4e8c-b8ca-811344f6c7ad	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-06-15 13:56:33.754+00
5304f99c-d5a8-4993-9eeb-80cfc0769377	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT70M"}	2025-06-15 14:06:33.751+00
d10db402-f077-44aa-b449-e3e32342413a	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT66M"}	2025-06-15 15:02:33.754+00
4e5c3fda-ba54-440c-93af-281b33564759	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-06-15 15:51:33.76+00
3fdebb1c-5845-449e-a342-e79f6534c732	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT207M"}	2025-06-15 17:00:03.676+00
903fc279-d1ab-495d-9b8d-cf87f879ab1d	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-06-15 17:09:03.676+00
9705987d-a03b-4239-8e19-1c46b2e5f6f8	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-06-15 18:03:33.758+00
be285dec-a05d-464c-a366-dbb67f3c0e94	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT135M"}	2025-06-15 18:06:33.76+00
81527447-ba57-4284-bc44-77fe4ae4f527	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-06-15 18:13:33.76+00
bb370aff-2982-40ba-985b-b29c9bb4669c	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	scored	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.5518290183693824}}	2025-06-15 18:49:33.754+00
71e5ea6e-02e7-4501-a80e-56cac8b1378a	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-06-22 15:10:33.758+00
e8413725-6b94-4a2e-93ce-ef4d6675d57c	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	scored	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.638048364157044}}	2025-06-15 19:00:33.76+00
80aa6d3b-147d-4a08-b494-a70b28625bc0	62656c39-1f1d-5a6e-b4d9-b5320dc37621	f8743c64-6b32-5a84-a231-88eaa828b8f3	completed	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.638048364157044}}	2025-06-15 19:01:33.76+00
a16d8569-68ce-4115-8849-d676a46e6006	f077b3df-c8db-5980-9d45-a9f18b43994f	4bfce604-c23f-530e-8c8e-a24764e1667a	completed	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.5518290183693824}}	2025-06-15 19:17:33.754+00
4b3a7e4a-ee8c-40da-89db-50ed454a3603	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT102M"}	2025-06-15 19:45:33.758+00
aca00f89-e04d-403f-b260-7ac5cba63a8d	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-06-15 19:53:33.758+00
d33449a7-9133-4d3e-9581-0fc48954a750	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-06-15 20:03:33.758+00
2f4db635-a9c7-49ab-8398-3bea49501c4b	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	scored	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35472568609596355}}	2025-06-15 20:28:33.758+00
517e1064-f79b-4908-949f-87a66cea868e	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	failed	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35472568609596355}}	2025-06-15 20:29:33.758+00
215cd0b9-6b26-4ca5-9eae-85e7f55c3398	d8b612a2-dc91-5792-8e83-e230551cbe05	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-06-16 13:45:00.436+00
2ed5066f-8157-4c45-a3f4-a9e7f0f17b02	e94bb903-b682-50b3-984a-ecdfc8b428b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-06-16 15:01:33.758+00
ded98baa-018c-4e5f-9c65-38e9f9ce824e	e94bb903-b682-50b3-984a-ecdfc8b428b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT60M"}	2025-06-16 16:01:33.758+00
f63438ca-ae32-4923-85e5-e6002edfad57	e94bb903-b682-50b3-984a-ecdfc8b428b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-06-16 16:11:33.758+00
8f329191-d792-4437-9c10-73a8e9c6e0ec	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-06-16 20:42:33.751+00
2d466f48-74ae-40c2-a393-7db80dc11c09	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-06-16 20:44:33.751+00
af1b2e8b-407a-44e5-9f46-3e20e5b470f2	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT76M"}	2025-06-16 22:00:33.751+00
6e067e32-27ef-4b1b-8050-21688206ac09	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-06-17 13:00:33.751+00
bbefb79e-86c7-4723-95f0-232b9bfc3fd3	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT87M"}	2025-06-17 14:27:33.751+00
a52e31c6-34c6-4fa3-bf5d-65cdb2c1e7cb	62656c39-1f1d-5a6e-b4d9-b5320dc37621	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-06-17 15:33:33.76+00
31e54637-4372-4ac5-b036-2b8a013583b4	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-06-17 15:39:33.758+00
b77efd8b-c59d-4a23-99ae-60a666f8353e	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	scored	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.9230868823752088}}	2025-06-17 16:08:33.751+00
3700e9f4-cd7c-4ba9-ad98-37cefe538739	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	completed	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.9230868823752088}}	2025-06-17 16:37:33.751+00
7bc399a9-bcfd-437a-8e8b-c2c33253a721	62656c39-1f1d-5a6e-b4d9-b5320dc37621	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT74M"}	2025-06-17 16:47:33.76+00
ae4a0309-ae71-4f9c-9ded-2f6159e76be7	62656c39-1f1d-5a6e-b4d9-b5320dc37621	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	scored	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.8569914884400295}}	2025-06-17 17:15:33.76+00
8cecc801-2612-4a69-a854-0a3ffec85eac	62656c39-1f1d-5a6e-b4d9-b5320dc37621	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	completed	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.8569914884400295}}	2025-06-17 17:16:33.76+00
392939cf-88f5-4489-982e-7e7e4b29db46	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT116M"}	2025-06-17 17:35:33.758+00
f81aa1bb-1e2a-4062-b8d0-a0533dfafdb5	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-06-17 17:44:33.758+00
119e1d3c-c5a3-4ffc-b4b2-035e57b4b96e	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	scored	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.5354863545168388}}	2025-06-17 18:37:33.758+00
5e46a991-4267-4b87-9cf1-e86bdd117264	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	completed	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.5354863545168388}}	2025-06-17 18:38:33.758+00
780ba022-e751-4d9f-a8c0-a1098cf16f35	e94bb903-b682-50b3-984a-ecdfc8b428b8	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-17 18:47:33.758+00
89a27464-b3b7-4e7c-8cef-77f7c3286d67	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-06-18 13:10:13.212+00
6736e8aa-7fc6-46c3-ac08-5544071b8ab7	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-06-18 13:12:13.212+00
edcdff56-65e2-42be-ba18-eaf765ec39ef	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-06-18 15:20:33.76+00
88ee8a2b-404d-4769-b08b-d44210cd31db	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT95M"}	2025-06-18 16:55:33.76+00
27f1c8e6-7126-450b-952a-919abbe816c0	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-06-18 17:01:33.76+00
15830a87-d602-4f74-a825-e82f84609f23	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-06-18 17:14:33.758+00
a194ff0e-ae24-4fb8-8959-f4b40ff92aad	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0f8226a0-d513-534c-871b-15d9f310349b	scored	{"score": {"max": 100, "min": 0, "raw": 96, "scaled": 0.964786182656598}}	2025-06-18 17:20:33.76+00
4f072961-450f-4aa5-be9a-9263f77b7cf6	62656c39-1f1d-5a6e-b4d9-b5320dc37621	0f8226a0-d513-534c-871b-15d9f310349b	completed	{"score": {"max": 100, "min": 0, "raw": 96, "scaled": 0.964786182656598}}	2025-06-18 17:21:33.76+00
875d3dcf-219a-43f5-8624-67805e59b68a	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT96M"}	2025-06-18 18:50:33.758+00
75d4e414-002b-441b-85ad-e14fb516e2e5	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	scored	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.6384132663869353}}	2025-06-18 19:40:33.758+00
703a0e50-1e16-49dc-87e6-f4da60c91e45	e94bb903-b682-50b3-984a-ecdfc8b428b8	70423966-9ebb-5262-b082-4b8925547d57	completed	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.6384132663869353}}	2025-06-18 19:41:33.758+00
38f36c67-afc6-46f0-9b39-9a64a392616c	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT423M"}	2025-06-18 20:15:13.212+00
6e666ad1-1380-43bd-8145-e4700729255f	e435ea07-6b50-5f0a-92e1-d7b01f7c6296	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-06-18 20:24:13.212+00
8bf78a06-8a45-48db-b20d-88dab89e6c58	62656c39-1f1d-5a6e-b4d9-b5320dc37621	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-06-19 12:43:33.76+00
2f1d7089-7477-4e62-957b-2c5efe74b1b1	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-06-19 15:02:33.758+00
08ff58fb-0fcf-470f-a1b2-aa0ba0ea7107	62656c39-1f1d-5a6e-b4d9-b5320dc37621	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT167M"}	2025-06-19 15:30:33.76+00
5d115b00-9839-4c7d-80dd-d9ec6bad3438	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT67M"}	2025-06-19 16:09:33.758+00
972003c4-939a-4fd5-a8d1-8d9127b1ac5d	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-06-20 16:33:33.751+00
7c227f4f-795e-47c0-829b-f676d95e32bc	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-06-20 17:38:33.754+00
ca55dfcd-f409-4963-a2d8-14212c857a84	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-06-20 17:40:33.754+00
9119651a-4a90-4ec0-a55a-e747a753ade3	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT77M"}	2025-06-20 17:50:33.751+00
bda8ed7b-970d-4a8e-a47e-2014dac8730a	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT50M"}	2025-06-20 18:30:33.754+00
1b5c4b07-e776-400c-bb15-a3313f8695e4	d8b612a2-dc91-5792-8e83-e230551cbe05	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-06-20 18:49:45.082+00
f91f8168-0bfa-4ead-b670-269b63399cdf	d8b612a2-dc91-5792-8e83-e230551cbe05	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-06-20 18:54:45.082+00
35841213-86f4-4b00-a553-6f1cdcbdcf0d	d8b612a2-dc91-5792-8e83-e230551cbe05	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT426M"}	2025-06-21 02:00:45.082+00
57fe4029-df1e-43ac-b773-ec260ab1344c	d8b612a2-dc91-5792-8e83-e230551cbe05	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-06-21 02:05:45.082+00
836347f6-a6cb-474d-8b20-89c04b5e16ff	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-06-21 16:52:33.758+00
d66df25f-5832-4db9-93f6-bfe5d2906218	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT71M"}	2025-06-21 18:03:33.758+00
1a0465a5-2284-4898-9e78-f63b0b688e46	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	searched	\N	2025-06-21 18:13:33.758+00
70715b4c-95d0-4018-b353-766426bb92bd	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-06-22 14:40:33.754+00
eca7f5c6-7793-4aab-83f1-54a6db8a07a9	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-06-22 14:42:33.754+00
60dd4f5b-d4c7-46f1-81ce-dcf84c0fea9f	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT52M"}	2025-06-22 15:34:33.754+00
eea80442-f6e8-4302-bd3e-2d9b86ce3abe	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT80M"}	2025-06-22 16:30:33.758+00
6b3655e1-0047-4f6f-af6c-5518d6a74af1	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-06-22 16:36:33.758+00
8c79ec43-a23d-4121-bbc3-97acefdce875	d8b612a2-dc91-5792-8e83-e230551cbe05	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-06-22 18:47:03.246+00
07ffa15f-0877-46cb-ad27-ec6cbaa84cca	d8b612a2-dc91-5792-8e83-e230551cbe05	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-06-22 18:51:03.246+00
e2b319ef-b9e7-4a28-b17e-a740290200b5	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-06-22 19:58:33.751+00
c165c680-f036-48de-8eef-38ade20283ef	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT89M"}	2025-06-22 21:27:33.751+00
2449d7a7-93d2-4798-ac99-6d09b7af8dd7	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-06-22 21:28:33.751+00
f1d20ab3-45a5-4060-8c14-e2e6bfbc9c6f	d8b612a2-dc91-5792-8e83-e230551cbe05	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT241M"}	2025-06-22 22:52:03.246+00
4806bf10-dd02-47e2-aaa1-a130e23b1879	d8b612a2-dc91-5792-8e83-e230551cbe05	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-06-22 23:00:03.246+00
a8d53c8a-8c29-4987-8eb7-fc3b416d89b0	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-06-23 11:20:33.751+00
f278fe3b-6cf1-411c-ab3f-0aeecdf1766a	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT74M"}	2025-06-23 12:34:33.751+00
b92dae66-673b-404a-acaa-5ee2c39d22b6	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-23 12:35:33.751+00
4de0f600-22cc-4192-b217-c127f92770be	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	scored	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5691533157787628}}	2025-06-23 15:02:33.751+00
2aa62fe4-8c7e-49f7-b01d-da6ed0d914ea	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	completed	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5691533157787628}}	2025-06-23 15:26:33.751+00
31c9cb71-b314-46a5-89c6-44c651e056df	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-06-23 17:49:33.758+00
3f668249-7306-4156-9660-cbe3b5cdb597	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT67M"}	2025-06-23 18:56:33.758+00
39d52807-6fe6-48ef-b475-faa4425d43d1	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-06-23 19:04:33.758+00
54586911-4661-402e-8e6c-198795373e66	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	scored	{"score": {"max": 100, "min": 0, "raw": 75, "scaled": 0.7547002345679823}}	2025-06-23 20:00:33.758+00
8ee0ae0e-e923-480d-9dea-7f4fba43cd02	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	completed	{"score": {"max": 100, "min": 0, "raw": 75, "scaled": 0.7547002345679823}}	2025-06-23 20:01:33.758+00
5478634d-c12f-4df8-8c28-0c4c85f1df26	e94bb903-b682-50b3-984a-ecdfc8b428b8	4bfce604-c23f-530e-8c8e-a24764e1667a	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-06-23 20:03:33.758+00
bdcb25fd-a34d-4a06-8251-49f87e040108	d8b612a2-dc91-5792-8e83-e230551cbe05	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-06-24 11:22:04.435+00
0acfec31-208e-46b1-8e75-bbb776a1cd6b	d8b612a2-dc91-5792-8e83-e230551cbe05	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-06-24 11:26:04.435+00
6d9337f4-04cd-4dad-9220-628e063ed968	d8b612a2-dc91-5792-8e83-e230551cbe05	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT175M"}	2025-06-24 14:21:04.435+00
5e4b551e-fb12-42b3-b239-146ed2ee59ba	d8b612a2-dc91-5792-8e83-e230551cbe05	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-06-24 14:28:04.435+00
28f3ce6a-494b-4e9b-afb9-d95599a97e29	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	initialized	\N	2025-06-24 14:42:33.758+00
d045660d-495d-4f60-bcd0-69f3c942c762	d8b612a2-dc91-5792-8e83-e230551cbe05	628435a2-1aba-5f57-8452-22f0f6fe8b5a	scored	{"score": {"max": 100, "min": 0, "raw": 94, "scaled": 0.9407654351929111}}	2025-06-24 15:26:04.435+00
77aa1ffa-8b34-4a4e-9291-99547b1210f2	d8b612a2-dc91-5792-8e83-e230551cbe05	628435a2-1aba-5f57-8452-22f0f6fe8b5a	completed	{"score": {"max": 100, "min": 0, "raw": 94, "scaled": 0.9407654351929111}}	2025-06-24 15:27:04.435+00
1553adf4-6b99-4869-9a90-8665a0d04a07	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	exited	{"duration": "PT51M"}	2025-06-24 15:33:33.758+00
21624393-ddc5-4fde-ad0d-35f8338ac686	d8b612a2-dc91-5792-8e83-e230551cbe05	628435a2-1aba-5f57-8452-22f0f6fe8b5a	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-06-24 15:35:04.435+00
5b8a34ae-fa04-4a70-bf89-7de7f173df35	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-06-24 15:40:33.758+00
2263765e-ac3b-4876-a861-d9d896ec7e3e	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	scored	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.4233727233220621}}	2025-06-24 16:04:33.758+00
79f6b964-c4db-4e09-8375-d5daa7bdd03a	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	failed	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.4233727233220621}}	2025-06-24 16:05:33.758+00
df090402-0b08-4e4a-aa6b-279f0cad1050	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-06-24 16:09:33.758+00
4670f6ac-38a3-476c-94e2-ef6a408f731f	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-06-25 12:08:33.754+00
3ea71016-9bf6-4a60-bbbe-b3dc01298789	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-06-25 12:13:33.754+00
8c4f2952-052c-4b03-9fae-95e335bc2e1a	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT54M"}	2025-06-25 13:07:33.754+00
9a45a3a9-8465-4c32-891c-ebabf6434b84	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-06-25 16:27:33.751+00
50f14b90-8c89-4d4c-846c-cc20d85c0377	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-06-25 16:32:33.751+00
d2366923-6437-4d51-aa5e-d9a86b1657e3	e94bb903-b682-50b3-984a-ecdfc8b428b8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-06-25 17:08:33.758+00
3d363c04-a3c4-4909-ab77-76256a715416	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT66M"}	2025-06-25 17:38:33.751+00
503eb981-366d-4862-bd18-6738bda16331	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-25 17:39:33.751+00
ccfd5267-6db5-45d2-a7f0-d009723306fb	e94bb903-b682-50b3-984a-ecdfc8b428b8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT54M"}	2025-06-25 18:02:33.758+00
b3813662-8be2-439c-8886-9ed068aa51f6	e94bb903-b682-50b3-984a-ecdfc8b428b8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	scored	{"score": {"max": 100, "min": 0, "raw": 70, "scaled": 0.7059902371567022}}	2025-06-25 18:51:33.758+00
393bdd34-d365-4c47-a55b-2722e37a29a0	e94bb903-b682-50b3-984a-ecdfc8b428b8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	completed	{"score": {"max": 100, "min": 0, "raw": 70, "scaled": 0.7059902371567022}}	2025-06-25 18:52:33.758+00
d67c609b-c8c1-412c-b6aa-cfadd9a55561	e94bb903-b682-50b3-984a-ecdfc8b428b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-06-26 17:35:33.758+00
dd202e4a-078e-4594-af5f-b395a385f52f	d8b612a2-dc91-5792-8e83-e230551cbe05	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-06-26 18:04:03.628+00
37089363-9a3d-4ce8-a58e-b15d895f4a2d	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-06-26 18:08:03.628+00
6d0d8283-c21a-4b29-8c2a-ed081ba672b8	e94bb903-b682-50b3-984a-ecdfc8b428b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT105M"}	2025-06-26 19:20:33.758+00
c3fc4106-273e-4f47-b195-93ba1463ac89	e94bb903-b682-50b3-984a-ecdfc8b428b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	scored	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.8298655984393626}}	2025-06-26 19:48:33.758+00
3f092581-2924-47ee-9f8a-e6e0aec15064	e94bb903-b682-50b3-984a-ecdfc8b428b8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	completed	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.8298655984393626}}	2025-06-26 19:49:33.758+00
b9b19c21-274e-4c7e-9c40-12e29e61146d	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT302M"}	2025-06-26 23:10:03.628+00
f56edcd6-5bdf-4538-8150-4d391f8e7a28	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-06-26 23:16:03.628+00
f8f20be5-f898-486c-9438-6882c9221e10	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-06-27 16:17:33.758+00
70099f7d-1703-4e2a-a965-b272c0397638	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-06-27 16:30:33.754+00
dac5976f-dcef-4a3f-bc2f-6d910f1a29aa	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-06-27 16:32:33.754+00
02ff742e-d0e3-473b-9877-a9e4d6f25153	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-06-27 17:20:33.751+00
f69f749e-6135-496d-bc05-f122ac6487f4	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-06-27 17:25:33.751+00
e6fac008-221b-4676-af88-3ca90bd2e91d	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT72M"}	2025-06-27 17:44:33.754+00
c2ed40c6-9b62-4848-a441-08444c652dd4	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT66M"}	2025-06-27 18:31:33.751+00
f8533a22-14a1-423b-9cae-07acafe9f420	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-27 18:36:33.751+00
3177a88e-d463-40e6-8a2a-228baeaaa646	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT139M"}	2025-06-27 18:36:33.758+00
1bd494ed-7d30-46ae-b951-f3bec180a086	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-06-28 14:22:04.183+00
4b7f21ab-3f04-440d-a9bd-3ea2677e663a	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-06-28 14:24:04.183+00
8b578851-8b84-4248-949d-6875824d2b52	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-06-28 15:39:33.751+00
a0317335-d7ab-4f02-ae55-4b85e7e9c3ea	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-06-28 15:41:33.751+00
ac5509f1-7b2d-48f5-a025-a59aac02e802	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-06-28 16:27:33.754+00
541629da-4745-4b76-8e59-f9129830f0c5	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT70M"}	2025-06-28 16:51:33.751+00
867eeaca-4203-437d-98c7-1507acf0962e	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT69M"}	2025-06-28 17:36:33.754+00
7835e230-1e4c-45f7-a7d1-833eb72427b5	e94bb903-b682-50b3-984a-ecdfc8b428b8	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-06-28 17:49:33.758+00
bf68a67c-c517-4739-ab59-dd5b4c70a279	e94bb903-b682-50b3-984a-ecdfc8b428b8	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT117M"}	2025-06-28 19:46:33.758+00
d2eb80f3-2c03-478d-a7ad-49a65fe20d6a	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT410M"}	2025-06-28 21:14:04.183+00
300858b9-88b7-4461-ab58-ec6dd1542ddf	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-06-28 21:21:04.183+00
827956a7-dcfa-40ef-ac96-3f0f55574a3b	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-06-30 11:57:33.751+00
41e14f58-afce-4803-baa6-bf315d4541cb	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-06-30 12:01:33.751+00
d2fffcbd-1e76-45e1-ab48-808485e03b4f	d8b612a2-dc91-5792-8e83-e230551cbe05	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-06-30 12:49:14.665+00
6be8c561-a763-45bd-ba89-dd0870bce4ea	d8b612a2-dc91-5792-8e83-e230551cbe05	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-06-30 12:51:14.665+00
220537ed-3803-4658-90ef-dbb3fa792987	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT72M"}	2025-06-30 13:13:33.751+00
ceccc4e8-6448-4250-b922-7323d344feec	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	scored	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.6444712933894163}}	2025-06-30 15:31:33.751+00
a68670e8-f11f-4378-8548-25cf99c2e738	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	f8743c64-6b32-5a84-a231-88eaa828b8f3	completed	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.6444712933894163}}	2025-06-30 15:49:33.751+00
50085051-db11-4519-8187-c6e551b47fec	d8b612a2-dc91-5792-8e83-e230551cbe05	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT312M"}	2025-06-30 18:03:14.665+00
d6a3c295-578f-4d20-a250-ea0844ce274c	d8b612a2-dc91-5792-8e83-e230551cbe05	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-06-30 18:13:14.665+00
14641d65-1d29-40f8-8ffa-fc287cc543ed	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	initialized	\N	2025-07-01 17:13:33.754+00
1b23bdae-c2a2-46ff-9fba-0edf1dc8973d	e94bb903-b682-50b3-984a-ecdfc8b428b8	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-07-01 18:14:33.758+00
ab632f31-7566-40ff-8eb1-d39c2b8b57b1	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	exited	{"duration": "PT67M"}	2025-07-01 18:20:33.754+00
52a9cca5-ae8c-4de8-9bc8-5ae7bc9706e0	e94bb903-b682-50b3-984a-ecdfc8b428b8	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT47M"}	2025-07-01 19:01:33.758+00
b3ce7811-ade2-487f-b64a-045d31ee88b1	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	scored	{"score": {"max": 100, "min": 0, "raw": 95, "scaled": 0.950573963103235}}	2025-07-01 20:00:33.754+00
65d940a7-fb69-4871-9c34-93a0563cac1d	f077b3df-c8db-5980-9d45-a9f18b43994f	fcc40587-6fbe-570f-8676-ba7f80daec71	completed	{"score": {"max": 100, "min": 0, "raw": 95, "scaled": 0.950573963103235}}	2025-07-01 20:23:33.754+00
9c30cb04-e9e6-4909-b7df-6e4604318a9c	d8b612a2-dc91-5792-8e83-e230551cbe05	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-07-02 12:38:54.48+00
588d6fde-0ba9-49ea-800e-2857db5e1ffe	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-07-02 12:42:54.48+00
a1c45875-d29a-452f-a498-185e92cff24e	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT154M"}	2025-07-02 15:16:54.48+00
f0a1607a-1191-43a7-a49d-ddb6a3f1aec7	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-07-02 15:22:54.48+00
36caa49f-c04f-4dd5-9235-9db1c3bc18e9	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	scored	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.6867021201046315}}	2025-07-02 19:00:33.758+00
c6ad7e22-4b31-4278-950e-15951f83898d	e94bb903-b682-50b3-984a-ecdfc8b428b8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	completed	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.6867021201046315}}	2025-07-02 19:01:33.758+00
204f462f-4e65-40b6-a069-c71ec3e82763	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-07-03 17:51:33.751+00
65913c39-1e0e-4a31-88e1-61fc5452d959	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	initialized	\N	2025-07-03 18:57:33.758+00
b8175df0-32b4-49a7-a5ef-3ff4cb1d0cfc	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT80M"}	2025-07-03 19:11:33.751+00
b53ed845-c8af-4b0e-94c1-9540efaa26fb	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	exited	{"duration": "PT122M"}	2025-07-03 20:59:33.758+00
59452d7a-d031-4ff1-ad70-768e9e484d1a	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-07-03 21:04:33.758+00
6a794333-24f8-4ebc-a2d3-e5dd6cbdcd34	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	scored	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.6974170992840316}}	2025-07-03 21:25:33.758+00
4f1fb943-b0ea-4f0d-962d-2a65401cce4f	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	completed	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.6974170992840316}}	2025-07-03 21:26:33.758+00
8b5691a8-81b7-4936-950f-e34508d41014	e94bb903-b682-50b3-984a-ecdfc8b428b8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-03 21:33:33.758+00
1eb6e8e5-471d-4e1b-b3de-c8d5a1204eaa	d8b612a2-dc91-5792-8e83-e230551cbe05	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-07-04 11:24:24.361+00
f0897039-72b8-4952-a6b6-8d9f234df3cb	d8b612a2-dc91-5792-8e83-e230551cbe05	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-07-04 11:27:24.361+00
b577799f-5610-475f-aa08-3ddc8023294c	d8b612a2-dc91-5792-8e83-e230551cbe05	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT209M"}	2025-07-04 14:56:24.361+00
06343937-a899-4fff-bffe-f9ca22b73e3a	d8b612a2-dc91-5792-8e83-e230551cbe05	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-07-04 15:03:24.361+00
06211939-95e6-42c7-a1c1-464e9094debf	e94bb903-b682-50b3-984a-ecdfc8b428b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-07-04 15:16:33.758+00
a24a4f02-0782-4783-baa0-8734b6236b8b	e94bb903-b682-50b3-984a-ecdfc8b428b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT71M"}	2025-07-04 16:27:33.758+00
256dea77-dc1c-41bf-95d0-5839696f3d0e	e94bb903-b682-50b3-984a-ecdfc8b428b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	scored	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.8891153743577129}}	2025-07-04 17:20:33.758+00
0eb9e2b7-d8c0-4cac-a956-3a5147dd5be9	e94bb903-b682-50b3-984a-ecdfc8b428b8	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	completed	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.8891153743577129}}	2025-07-04 17:21:33.758+00
ff86679d-5f07-4e6d-86cc-b2183fdaf022	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-07-05 11:52:33.751+00
3f784abb-b77e-4246-83a1-fe8b507d4e70	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-07-05 11:57:33.751+00
f822dafb-c4e4-42b1-a197-89f4a2277a78	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT67M"}	2025-07-05 13:04:33.751+00
c4799c38-027f-4196-9031-595070b468d1	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-07-05 13:05:33.751+00
9996f334-9927-4c6e-a87c-b768de728c5c	f077b3df-c8db-5980-9d45-a9f18b43994f	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-07-05 16:27:33.754+00
fa7fc8b4-9660-418f-bbcf-8b917157b13c	f077b3df-c8db-5980-9d45-a9f18b43994f	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-07-05 16:32:33.754+00
4432b283-3cea-4b42-bb85-4f6709e07e7e	f077b3df-c8db-5980-9d45-a9f18b43994f	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT67M"}	2025-07-05 17:39:33.754+00
68c06be7-ce6e-4047-bcc7-d66c9bb8f4f6	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-07-05 18:21:33.758+00
41a66dba-fd91-409d-a9ed-68d24460052d	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT48M"}	2025-07-05 19:09:33.758+00
d042d1a3-c4d8-4455-98d0-f082045a21d4	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-07-05 19:13:33.758+00
18d522e8-b136-495c-ad0a-0e17b5cc2662	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-07-06 13:35:33.751+00
da219795-c72e-4b14-932e-2981fe50fe39	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT70M"}	2025-07-06 14:45:33.751+00
246cb852-89cd-4aba-9262-d613ff6db873	d8b612a2-dc91-5792-8e83-e230551cbe05	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-07-06 15:20:35.407+00
2b0167c7-a193-4cbe-a38a-cbf5e0acb5de	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-07-06 15:24:35.407+00
52f74b73-e283-4e52-afb5-ef24d4b3a799	e94bb903-b682-50b3-984a-ecdfc8b428b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-07-06 17:46:33.758+00
4f4a31cd-45da-456b-ab43-aeb3383986c9	e94bb903-b682-50b3-984a-ecdfc8b428b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT125M"}	2025-07-06 19:51:33.758+00
b31a8f61-e116-4f02-a2c9-ef0a83d9c284	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT364M"}	2025-07-06 21:28:35.407+00
d5bf0631-a360-4dc4-a6c5-03a1e55f3716	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-07-06 21:38:35.407+00
8d96b580-51d7-4161-9586-1d1c04788b93	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	scored	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.9961791783330289}}	2025-07-06 21:55:35.407+00
0cb40687-2f51-473c-a72d-f561181faaa7	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	completed	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.9961791783330289}}	2025-07-06 21:56:35.407+00
2de3fc47-3873-4918-ac08-d0e5a1a3f619	d8b612a2-dc91-5792-8e83-e230551cbe05	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-06 22:03:35.407+00
e2dafef9-39d8-4930-8473-bc34a3c1ab04	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-07-07 12:10:33.751+00
f965c4c1-3fce-4b75-9682-07fcac470e90	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT86M"}	2025-07-07 13:36:33.751+00
f2d5f9d7-ad4a-40cb-8331-df34c8c5cb0c	e94bb903-b682-50b3-984a-ecdfc8b428b8	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-07-07 14:19:33.758+00
77e4b0bd-cc77-4d58-944c-c3760af1791b	e94bb903-b682-50b3-984a-ecdfc8b428b8	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT88M"}	2025-07-07 15:47:33.758+00
d83ffd80-385f-4bb9-9ff7-bc1cd5072325	d8b612a2-dc91-5792-8e83-e230551cbe05	628435a2-1aba-5f57-8452-22f0f6fe8b5a	searched	\N	2025-07-08 11:17:58.144+00
2efda37f-d7c4-4d04-83c5-13a01ff62bfa	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-07-08 11:21:58.144+00
97eef1b4-3530-41f2-96cd-2725a0df6faa	f077b3df-c8db-5980-9d45-a9f18b43994f	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	searched	\N	2025-07-08 12:42:33.754+00
e512c596-a994-42d5-b2e1-fafcefd969d0	f077b3df-c8db-5980-9d45-a9f18b43994f	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-07-08 12:47:33.754+00
44975335-a2d6-463f-a129-e8ca316f2fea	f077b3df-c8db-5980-9d45-a9f18b43994f	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT68M"}	2025-07-08 13:55:33.754+00
ebc0aa8f-20a3-4833-b859-ac0d6d69f896	f077b3df-c8db-5980-9d45-a9f18b43994f	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-07-08 13:59:33.754+00
e7e91743-06c8-4e6c-a3b4-a68ab5821cf5	e94bb903-b682-50b3-984a-ecdfc8b428b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-07-08 16:34:33.758+00
20f6020a-67a0-4458-8f2b-e7a8bd9a5141	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT362M"}	2025-07-08 17:23:58.144+00
6a821932-b8bc-4b8b-ab8b-edf97062fb50	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-07-08 17:32:58.144+00
838ccdb6-15e2-4451-9e24-29dc9e9b6cde	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-08 18:23:58.144+00
6f25ed79-f3a2-4153-b7de-3a7a61635d93	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-08 18:24:58.144+00
c95a7fff-b451-41dc-941d-76fd7106f0a2	e94bb903-b682-50b3-984a-ecdfc8b428b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT111M"}	2025-07-08 18:25:33.758+00
dc6b7a5f-5a4d-40d6-ad18-170520236766	e94bb903-b682-50b3-984a-ecdfc8b428b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-08 18:30:33.758+00
38047770-2614-40fb-8dbb-de0b7c0b652c	d8b612a2-dc91-5792-8e83-e230551cbe05	70423966-9ebb-5262-b082-4b8925547d57	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-08 18:31:58.144+00
38b3531e-3527-454f-908d-368172d610a6	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-07-09 10:11:33.751+00
32cb5216-7354-4f2c-a668-17cbb1217f6d	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT90M"}	2025-07-09 11:41:33.751+00
75c0060b-e498-44c3-9221-667102955f58	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-09 11:45:33.751+00
ad0b8d6f-4487-4631-b62d-cfa0e170034a	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	scored	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.788774013806115}}	2025-07-09 14:08:33.751+00
b8b46e41-b634-4b42-8a47-ab2f5f9a353f	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	4bfce604-c23f-530e-8c8e-a24764e1667a	completed	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.788774013806115}}	2025-07-09 14:32:33.751+00
8aebc45f-f915-4bea-9a0e-b7e495a88fe4	e94bb903-b682-50b3-984a-ecdfc8b428b8	6db96e1f-b595-5aec-adbb-46b408029b79	searched	\N	2025-07-09 14:48:33.758+00
ccb753be-1dbd-4098-96ac-a341e5620481	d8b612a2-dc91-5792-8e83-e230551cbe05	fcc40587-6fbe-570f-8676-ba7f80daec71	searched	\N	2025-07-10 13:54:16.688+00
2aef2914-9125-4333-aec9-9c29d4d44704	d8b612a2-dc91-5792-8e83-e230551cbe05	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-07-10 13:59:16.688+00
55d095f8-aca9-480a-90c2-bbc69ddab0e8	d8b612a2-dc91-5792-8e83-e230551cbe05	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT229M"}	2025-07-10 17:48:16.688+00
795f34ad-d06e-470c-98a9-18b5bdffa431	d8b612a2-dc91-5792-8e83-e230551cbe05	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-07-10 17:52:16.688+00
cc8b289d-792f-47f9-97f5-5b6d3f1c7712	e94bb903-b682-50b3-984a-ecdfc8b428b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	initialized	\N	2025-07-10 18:57:33.758+00
80be4d43-0cee-4d96-b55d-53b88192f746	f077b3df-c8db-5980-9d45-a9f18b43994f	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-07-10 18:58:33.754+00
eb51b928-82fe-4c72-95ae-4e257e8bbb56	f077b3df-c8db-5980-9d45-a9f18b43994f	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT61M"}	2025-07-10 19:59:33.754+00
48f4abb5-045c-402c-987b-c4219be0d25d	e94bb903-b682-50b3-984a-ecdfc8b428b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	exited	{"duration": "PT96M"}	2025-07-10 20:33:33.758+00
30e34538-74d0-43c8-8ccf-b49a2be0bec5	e94bb903-b682-50b3-984a-ecdfc8b428b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-10 20:51:33.758+00
20fd3a36-6a1f-4a56-942b-673e7fa79b88	e94bb903-b682-50b3-984a-ecdfc8b428b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-10 20:52:33.758+00
518c9eb0-3efe-4be0-a30a-2b60142e997e	e94bb903-b682-50b3-984a-ecdfc8b428b8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-10 20:59:33.758+00
eddc8e55-aaa3-43e9-9534-a1cc778af722	e94bb903-b682-50b3-984a-ecdfc8b428b8	6db96e1f-b595-5aec-adbb-46b408029b79	initialized	\N	2025-07-11 15:33:33.758+00
f1b119b9-21b9-4178-84a7-658fa3ac73e3	e94bb903-b682-50b3-984a-ecdfc8b428b8	6db96e1f-b595-5aec-adbb-46b408029b79	exited	{"duration": "PT95M"}	2025-07-11 17:08:33.758+00
e7631998-7ccd-4f36-8c87-460bfff66d56	e94bb903-b682-50b3-984a-ecdfc8b428b8	6db96e1f-b595-5aec-adbb-46b408029b79	scored	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.8238864306216627}}	2025-07-11 18:00:33.758+00
bffc9171-ab76-4174-871b-1b6f719f8577	e94bb903-b682-50b3-984a-ecdfc8b428b8	6db96e1f-b595-5aec-adbb-46b408029b79	completed	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.8238864306216627}}	2025-07-11 18:01:33.758+00
50ebec7a-097d-4209-b8ea-9375b73cc3e8	f077b3df-c8db-5980-9d45-a9f18b43994f	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	initialized	\N	2025-07-11 19:22:33.754+00
62eaa5d0-786c-4886-afdf-1d6e95e933c7	f077b3df-c8db-5980-9d45-a9f18b43994f	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	exited	{"duration": "PT49M"}	2025-07-11 20:11:33.754+00
c62775b0-e5d9-424d-92d5-b26bead3142d	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-07-11 20:30:33.751+00
0f42eb93-fe81-4236-916f-d6c588f961b9	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-07-11 20:32:33.751+00
1adb1f0a-5a33-478c-922e-696986b9887d	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT85M"}	2025-07-11 21:57:33.751+00
87ff04d1-9703-4e0e-b66c-573d724b4424	f077b3df-c8db-5980-9d45-a9f18b43994f	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	scored	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.8489366458616856}}	2025-07-11 23:52:33.754+00
ca35d81e-445b-4091-9920-5c13b52d55e6	f077b3df-c8db-5980-9d45-a9f18b43994f	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	completed	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.8489366458616856}}	2025-07-12 00:12:33.754+00
aff67f9e-a9d1-45ca-9b79-ffbde1b0243e	d8b612a2-dc91-5792-8e83-e230551cbe05	0895d383-5f59-51b2-ae8c-e0b985d81f1f	searched	\N	2025-07-12 11:12:22.208+00
c234a316-873c-4873-969b-c48b49bbfdd5	d8b612a2-dc91-5792-8e83-e230551cbe05	4bfce604-c23f-530e-8c8e-a24764e1667a	initialized	\N	2025-07-12 11:15:22.208+00
065ae38e-a19e-4f17-a5c1-b2ddbfddf42b	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	searched	\N	2025-07-12 16:07:33.751+00
f168eced-6f5c-4b3a-8437-8e8d2a79a3f0	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-07-12 16:10:33.751+00
a673880a-bdad-48f4-8c73-fedf56b37f93	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT83M"}	2025-07-12 17:33:33.751+00
838260b9-b7bf-4e11-95d4-26bf75143fbc	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-12 17:38:33.751+00
de3ad47f-00de-4c03-a7e7-6bc677e7a3fb	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-07-12 17:53:33.758+00
3c842e21-11ec-482f-a420-11e4e646f3de	d8b612a2-dc91-5792-8e83-e230551cbe05	4bfce604-c23f-530e-8c8e-a24764e1667a	exited	{"duration": "PT419M"}	2025-07-12 18:14:22.208+00
30a9a953-2c39-4ec6-b40c-15784ac537a7	d8b612a2-dc91-5792-8e83-e230551cbe05	4bfce604-c23f-530e-8c8e-a24764e1667a	searched	\N	2025-07-12 18:17:22.208+00
9fa7bf06-4f82-4301-98d0-44d3289a0c02	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT100M"}	2025-07-12 19:33:33.758+00
a06ba17d-46e8-43aa-a0ef-2c25a8645d8c	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	scored	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24525473362241246}}	2025-07-12 20:23:33.758+00
b2fd4e80-4171-446d-b543-d596c05c904a	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	failed	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24525473362241246}}	2025-07-12 20:24:33.758+00
50d854e9-5484-439c-92d8-24a496b1e727	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	initialized	\N	2025-07-13 17:05:33.751+00
87f4d483-b142-4af3-b866-e106340523ee	e94bb903-b682-50b3-984a-ecdfc8b428b8	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-07-13 17:05:33.758+00
c3df8be6-3846-418b-8c89-c863e437d2dc	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	exited	{"duration": "PT89M"}	2025-07-13 18:34:33.751+00
d4d59607-9a24-403d-a023-445a2afde359	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-13 18:36:33.751+00
87653d21-4559-4e4d-840e-7a1b4c8b9789	e94bb903-b682-50b3-984a-ecdfc8b428b8	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT134M"}	2025-07-13 19:19:33.758+00
64f29757-35ac-4483-a54c-a80dfa4a7ce6	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	scored	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.7995934293107956}}	2025-07-13 22:05:33.751+00
c2aecd81-ece4-4d4d-8c45-aad49ecdd904	5a1da75c-d5d5-5258-a4c0-7092dbb9f9af	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	completed	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.7995934293107956}}	2025-07-13 22:30:33.751+00
43596f2c-1847-4695-a880-dc9b01114ccf	d8b612a2-dc91-5792-8e83-e230551cbe05	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-07-14 10:50:34.3+00
55f8762d-05db-4475-be17-86e10483173f	d8b612a2-dc91-5792-8e83-e230551cbe05	f8743c64-6b32-5a84-a231-88eaa828b8f3	initialized	\N	2025-07-14 10:55:34.3+00
ba0f5b5c-ee92-4534-ae1f-35bc3a04a54f	d8b612a2-dc91-5792-8e83-e230551cbe05	f8743c64-6b32-5a84-a231-88eaa828b8f3	exited	{"duration": "PT163M"}	2025-07-14 13:38:34.3+00
771c5eba-ede1-4734-bd4a-6f5ea862cfcf	d8b612a2-dc91-5792-8e83-e230551cbe05	f8743c64-6b32-5a84-a231-88eaa828b8f3	searched	\N	2025-07-14 13:48:34.3+00
2448c536-7c81-4770-a3e4-428813d3f747	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	initialized	\N	2025-07-14 15:46:33.758+00
000306d8-66d4-444d-b235-b373dac0fbc5	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	exited	{"duration": "PT107M"}	2025-07-14 17:33:33.758+00
30d30c17-b012-42d5-afac-c038788e5ba2	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	searched	\N	2025-07-14 17:36:33.758+00
01a39089-f783-4314-810e-b30c3f3b8bcf	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	scored	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.29044441828629364}}	2025-07-14 17:54:33.758+00
40b775e1-65c8-408b-9dc1-fb46c082b9ae	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	failed	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.29044441828629364}}	2025-07-14 17:55:33.758+00
7c731917-117f-4bdf-9976-bfbb9e62cd59	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-07-14 18:46:33.754+00
8e301f55-74bf-4eef-9221-55c61f6ae117	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-07-14 18:49:33.754+00
1e530140-7fc4-415a-bdfc-7bea76567e04	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT73M"}	2025-07-14 20:02:33.754+00
87c96304-6fa2-4585-8194-8304abdc26b1	d8b612a2-dc91-5792-8e83-e230551cbe05	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-07-15 10:51:09.267+00
b64c0e4d-a8ca-4d31-a393-967b32405e54	d8b612a2-dc91-5792-8e83-e230551cbe05	0f8226a0-d513-534c-871b-15d9f310349b	initialized	\N	2025-07-15 10:53:09.267+00
2b04e39c-df18-4c96-95db-85289c6008bf	e94bb903-b682-50b3-984a-ecdfc8b428b8	f10c153c-968c-5979-b6cc-05736dc40095	initialized	\N	2025-07-15 14:54:33.758+00
773ed3c7-b382-4e28-ad98-6c6da8ad76f7	e94bb903-b682-50b3-984a-ecdfc8b428b8	f10c153c-968c-5979-b6cc-05736dc40095	exited	{"duration": "PT72M"}	2025-07-15 16:06:33.758+00
235bd982-a1fe-4b58-8976-ef3f558ed061	e94bb903-b682-50b3-984a-ecdfc8b428b8	f10c153c-968c-5979-b6cc-05736dc40095	scored	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.6489649086756071}}	2025-07-15 16:55:33.758+00
89b7c418-d629-4fae-80d1-f1d6966d7fe9	e94bb903-b682-50b3-984a-ecdfc8b428b8	f10c153c-968c-5979-b6cc-05736dc40095	completed	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.6489649086756071}}	2025-07-15 16:56:33.758+00
6f675b9d-8bc7-4e82-bf75-6c99fe070a64	e94bb903-b682-50b3-984a-ecdfc8b428b8	f10c153c-968c-5979-b6cc-05736dc40095	rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-15 16:59:33.758+00
92c8a903-9071-4a53-a422-15f09078c4f8	d8b612a2-dc91-5792-8e83-e230551cbe05	0f8226a0-d513-534c-871b-15d9f310349b	exited	{"duration": "PT388M"}	2025-07-15 17:21:09.267+00
5d4b61d3-4eb1-4fd6-b87d-ed0549154f65	d8b612a2-dc91-5792-8e83-e230551cbe05	0f8226a0-d513-534c-871b-15d9f310349b	searched	\N	2025-07-15 17:26:09.267+00
57c986c6-dc49-4948-81fa-4a23e2624753	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	scored	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.5114889872003026}}	2025-07-16 14:57:33.758+00
31206d1a-6c79-4a7f-b637-1fc9582e96b4	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	completed	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.5114889872003026}}	2025-07-16 14:58:33.758+00
31e2ae9e-9c5e-4800-a459-45362d2e62de	e94bb903-b682-50b3-984a-ecdfc8b428b8	dd4608c4-45ad-543d-a42c-6276790440d3	rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-16 15:03:33.758+00
bc57b2e4-a468-460a-956f-40a0ebc84d4d	d8b612a2-dc91-5792-8e83-e230551cbe05	f10c153c-968c-5979-b6cc-05736dc40095	searched	\N	2025-07-17 12:04:12.158+00
6ed86861-7a3a-43ae-a055-771df3e9f214	d8b612a2-dc91-5792-8e83-e230551cbe05	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	initialized	\N	2025-07-17 12:08:12.158+00
41e29229-c341-4350-bc4f-fd10be182cd2	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-07-17 12:33:33.754+00
ff67188a-c6cb-4153-8844-dc624c28556b	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT70M"}	2025-07-17 13:43:33.754+00
dae08a43-9d33-4932-ac23-29bda9c5b2e1	d8b612a2-dc91-5792-8e83-e230551cbe05	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	exited	{"duration": "PT257M"}	2025-07-17 16:25:12.158+00
ab7f7071-b530-436e-8330-5b90d6cbac3b	d8b612a2-dc91-5792-8e83-e230551cbe05	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	searched	\N	2025-07-17 16:31:12.158+00
db349aa4-21ff-41fe-9545-bb1c715541fb	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	searched	\N	2025-07-19 12:50:33.754+00
c8cead69-eb45-4f68-a7d3-67d38cf9a9b2	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-07-19 12:54:33.754+00
49ea841e-af6a-4536-9205-6c1ba7814eef	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT64M"}	2025-07-19 13:58:33.754+00
5200f699-9884-44ed-b10d-0adc17816454	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-07-22 11:06:33.754+00
0514657c-f9f3-4c2d-b773-cdee9822f23c	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT68M"}	2025-07-22 12:14:33.754+00
51d5803e-3915-4464-91fb-5107905e0d87	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-07-22 12:18:33.754+00
1d3782e9-562e-486d-abd3-ef4544c5729c	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	scored	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.4678888887663875}}	2025-07-22 14:27:33.754+00
7030ab8a-8c72-4bd9-8717-f2c359c654f1	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	failed	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.4678888887663875}}	2025-07-22 14:48:33.754+00
537d1ede-e312-4aa2-9f49-4d47df26a8f5	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-07-24 11:12:33.754+00
b9ab955e-3318-4325-a7a9-918921a34f9c	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT59M"}	2025-07-24 12:11:33.754+00
89924239-1507-45cb-8630-ef642fee5aea	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	scored	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47141577909825044}}	2025-07-24 14:58:33.754+00
1ef93133-9dad-4cef-b3d5-779586c3d1b3	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	failed	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47141577909825044}}	2025-07-24 15:24:33.754+00
7635ecfc-0107-4cbf-92be-562ab6c9ff41	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-07-26 18:57:33.754+00
51be4caf-b952-405f-8170-d89ca3234754	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT49M"}	2025-07-26 19:46:33.754+00
10332275-59c6-4793-8af4-2b9a7f6f2f15	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	scored	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.4514901802031657}}	2025-07-26 23:03:33.754+00
d71b826b-811a-4506-81de-31bf0b0e070a	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	failed	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.4514901802031657}}	2025-07-26 23:20:33.754+00
e0cdaf91-c787-4e11-a360-fd66c00f8f6e	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	initialized	\N	2025-07-29 19:09:33.754+00
b863eeda-96b3-4068-9d57-a259e24df00e	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	exited	{"duration": "PT66M"}	2025-07-29 20:15:33.754+00
87ed027f-0a9b-4f62-b490-f46582700ec9	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	scored	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5010376777138532}}	2025-07-29 23:48:33.754+00
8815ee57-8d39-4bf7-8243-96331b8f1f61	f077b3df-c8db-5980-9d45-a9f18b43994f	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	completed	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5010376777138532}}	2025-07-30 00:10:33.754+00
8a4b58a7-f25f-46d9-bd3f-9cf75da3c49c	f077b3df-c8db-5980-9d45-a9f18b43994f	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-08-02 18:21:33.754+00
5e778eff-c0e0-41e4-aa9b-9b3156d42e4b	f077b3df-c8db-5980-9d45-a9f18b43994f	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT49M"}	2025-08-02 19:10:33.754+00
d58f164b-5cb6-4534-9214-b92c18595ae7	f077b3df-c8db-5980-9d45-a9f18b43994f	70423966-9ebb-5262-b082-4b8925547d57	rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-08-02 19:15:33.754+00
9e55999e-634d-41eb-afee-cd31674ee276	f077b3df-c8db-5980-9d45-a9f18b43994f	70423966-9ebb-5262-b082-4b8925547d57	searched	\N	2025-08-04 14:05:33.754+00
2a51d3fa-0b1e-4718-96ec-ef17c0b8f820	f077b3df-c8db-5980-9d45-a9f18b43994f	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-08-04 14:07:33.754+00
7d6de110-b9bb-4fce-a45b-05c3239530d5	f077b3df-c8db-5980-9d45-a9f18b43994f	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT53M"}	2025-08-04 15:00:33.754+00
7b72b2f9-2c7d-4e5a-86bc-13f68d75d019	f077b3df-c8db-5980-9d45-a9f18b43994f	70423966-9ebb-5262-b082-4b8925547d57	initialized	\N	2025-08-07 17:12:33.754+00
78302229-c437-427c-834b-bb8ff6b57452	f077b3df-c8db-5980-9d45-a9f18b43994f	70423966-9ebb-5262-b082-4b8925547d57	exited	{"duration": "PT50M"}	2025-08-07 18:02:33.754+00
da1880f5-2e7e-4dbe-9e37-a7791bee6dcb	f077b3df-c8db-5980-9d45-a9f18b43994f	70423966-9ebb-5262-b082-4b8925547d57	scored	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.6633983698047693}}	2025-08-07 19:54:33.754+00
b15d5a50-8248-4892-81c1-9e9036ef760a	f077b3df-c8db-5980-9d45-a9f18b43994f	70423966-9ebb-5262-b082-4b8925547d57	completed	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.6633983698047693}}	2025-08-07 20:17:33.754+00
\.


--
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: learning_resources learning_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.learning_resources
    ADD CONSTRAINT learning_resources_pkey PRIMARY KEY (id);


--
-- Name: modules modules_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);


--
-- Name: statements statements_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.statements
    ADD CONSTRAINT statements_pkey PRIMARY KEY (id);


--
-- Name: module_resources module_resources_module_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.module_resources
    ADD CONSTRAINT module_resources_module_id_fkey FOREIGN KEY (module_id) REFERENCES public.modules(id);


--
-- Name: module_resources module_resources_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.module_resources
    ADD CONSTRAINT module_resources_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES public.learning_resources(id);


--
-- Name: modules modules_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: modules modules_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.actors(id);


--
-- Name: statements statements_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.statements
    ADD CONSTRAINT statements_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actors(id);


--
-- Name: statements statements_module_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.statements
    ADD CONSTRAINT statements_module_id_fkey FOREIGN KEY (module_id) REFERENCES public.modules(id);


--
-- PostgreSQL database dump complete
--

