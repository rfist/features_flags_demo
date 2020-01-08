--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6
-- Dumped by pg_dump version 11.6

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
-- Name: client_applications; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE public.client_applications (
    app_name character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT '2020-01-08 11:21:20.145109'::timestamp without time zone,
    updated_at timestamp with time zone DEFAULT '2020-01-08 11:21:20.145109'::timestamp without time zone,
    seen_at timestamp with time zone,
    strategies json,
    description character varying(255),
    icon character varying(255),
    url character varying(255),
    color character varying(255)
);


ALTER TABLE public.client_applications OWNER TO demo;

--
-- Name: client_instances; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE public.client_instances (
    app_name character varying(255),
    instance_id character varying(255),
    client_ip character varying(255),
    last_seen timestamp with time zone DEFAULT now(),
    created_at timestamp with time zone DEFAULT now(),
    sdk_version character varying(255)
);


ALTER TABLE public.client_instances OWNER TO demo;

--
-- Name: client_metrics; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE public.client_metrics (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    metrics json
);


ALTER TABLE public.client_metrics OWNER TO demo;

--
-- Name: client_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE public.client_metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_metrics_id_seq OWNER TO demo;

--
-- Name: client_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE public.client_metrics_id_seq OWNED BY public.client_metrics.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE public.events (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    type character varying(255) NOT NULL,
    created_by character varying(255) NOT NULL,
    data json
);


ALTER TABLE public.events OWNER TO demo;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO demo;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: features; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE public.features (
    created_at timestamp with time zone DEFAULT now(),
    name character varying(255) NOT NULL,
    enabled integer DEFAULT 0,
    description text,
    archived integer DEFAULT 0,
    strategies json,
    variants json DEFAULT '[]'::json
);


ALTER TABLE public.features OWNER TO demo;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    run_on timestamp without time zone NOT NULL
);


ALTER TABLE public.migrations OWNER TO demo;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO demo;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: strategies; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE public.strategies (
    created_at timestamp with time zone DEFAULT now(),
    name character varying(255) NOT NULL,
    description text,
    parameters json,
    built_in integer DEFAULT 0
);


ALTER TABLE public.strategies OWNER TO demo;

--
-- Name: client_metrics id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public.client_metrics ALTER COLUMN id SET DEFAULT nextval('public.client_metrics_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Data for Name: client_applications; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY public.client_applications (app_name, created_at, updated_at, seen_at, strategies, description, icon, url, color) FROM stdin;
newapp	2020-01-08 11:21:20.145109+00	2020-01-08 13:22:59.487796+00	\N	["default","applicationHostname","gradualRolloutRandom","gradualRolloutUserId","gradualRolloutSessionId","userWithId","remoteAddress","flexibleRollout","EnvStrategy"]	\N	\N	\N	\N
my-app-name	2020-01-08 11:21:20.145109+00	2020-01-08 13:02:38.997413+00	\N	["default","applicationHostname","gradualRolloutRandom","gradualRolloutUserId","gradualRolloutSessionId","userWithId","remoteAddress","flexibleRollout"]	\N	\N	\N	\N
\.


--
-- Data for Name: client_instances; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY public.client_instances (app_name, instance_id, client_ip, last_seen, created_at, sdk_version) FROM stdin;
my-app-name	my-unique-instance-id	::ffff:127.0.0.1	2020-01-08 13:02:39.007939+00	2020-01-08 12:33:53.911313+00	unleash-client-node:3.3.1
newapp	my-unique-instance-id	::ffff:127.0.0.1	2020-01-08 13:22:59.49403+00	2020-01-08 13:04:28.659459+00	unleash-client-node:3.3.1
\.


--
-- Data for Name: client_metrics; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY public.client_metrics (id, created_at, metrics) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY public.events (id, created_at, type, created_by, data) FROM stdin;
1	2020-01-08 11:21:20.116452+00	strategy-created	migration	{"name":"default","description":"Default on or off Strategy."}
2	2020-01-08 11:21:20.166816+00	strategy-created	migration	{"name":"userWithId","description":"Active for users with a userId defined in the userIds-list","parameters":[{"name":"userIds","type":"list","description":"","required":false}]}
3	2020-01-08 11:21:20.166816+00	strategy-created	migration	{"name":"applicationHostname","description":"Active for client instances with a hostName in the hostNames-list.","parameters":[{"name":"hostNames","type":"list","description":"List of hostnames to enable the feature toggle for.","required":false}]}
4	2020-01-08 11:21:20.166816+00	strategy-created	migration	{"name":"gradualRolloutRandom","description":"Randomly activate the feature toggle. No stickiness.","parameters":[{"name":"percentage","type":"percentage","description":"","required":false}]}
5	2020-01-08 11:21:20.166816+00	strategy-created	migration	{"name":"gradualRolloutSessionId","description":"Gradually activate feature toggle. Stickiness based on session id.","parameters":[{"name":"percentage","type":"percentage","description":"","required":false},{"name":"groupId","type":"string","description":"Used to define a activation groups, which allows you to correlate across feature toggles.","required":true}]}
6	2020-01-08 11:21:20.166816+00	strategy-created	migration	{"name":"gradualRolloutUserId","description":"Gradually activate feature toggle for logged in users. Stickiness based on user id.","parameters":[{"name":"percentage","type":"percentage","description":"","required":false},{"name":"groupId","type":"string","description":"Used to define a activation groups, which allows you to correlate across feature toggles.","required":true}]}
7	2020-01-08 11:21:20.166816+00	strategy-created	migration	{"name":"remoteAddress","description":"Active for remote addresses defined in the IPs list.","parameters":[{"name":"IPs","type":"list","description":"List of IPs to enable the feature toggle for.","required":true}]}
8	2020-01-08 11:21:20.213078+00	strategy-created	migration	{"name":"flexibleRollout","description":"Gradually activate feature toggle based on sane stickiness","parameters":[{"name":"rollout","type":"percentage","description":"","required":false},{"name":"stickiness","type":"string","description":"Used define stickiness. Possible values: default, userId, sessionId, random","required":true},{"name":"groupId","type":"string","description":"Used to define a activation groups, which allows you to correlate across feature toggles.","required":true}]}
9	2020-01-08 11:22:12.056492+00	feature-created	theseuship@gmail.com	{"name":"test","description":"first attempt","enabled":true,"strategies":[{"name":"default"}]}
10	2020-01-08 12:39:35.047919+00	feature-created	theseuship@gmail.com	{"name":"featureX","description":"new feature","enabled":true,"strategies":[{"name":"default"}]}
11	2020-01-08 12:43:56.25864+00	strategy-created	theseuship@gmail.com	{"name":"EnvStrategy","parameters":[{"name":"env","type":"string","description":"","required":true}],"editable":true}
12	2020-01-08 12:44:40.738468+00	feature-created	theseuship@gmail.com	{"name":"featureY","strategies":[{"name":"EnvStrategy","parameters":{"env":"staging"}}],"enabled":true,"description":"Only for staging"}
13	2020-01-08 12:53:18.550422+00	strategy-updated	theseuship@gmail.com	{"name":"EnvStrategy","description":null,"parameters":[{"name":"env","type":"list","description":"","required":true}],"editable":true}
14	2020-01-08 13:00:44.164324+00	strategy-updated	theseuship@gmail.com	{"name":"EnvStrategy","description":null,"parameters":[{"name":"env","type":"list","description":"","required":true}],"editable":true}
15	2020-01-08 13:06:33.616828+00	strategy-updated	theseuship@gmail.com	{"name":"EnvStrategy","description":"Environment strategy","parameters":[{"name":"env","type":"list","description":"","required":true}],"editable":true}
16	2020-01-08 13:09:44.385356+00	strategy-updated	theseuship@gmail.com	{"name":"EnvStrategy","description":"Environment strategy","parameters":[{"name":"env","type":"list","description":"staging, production","required":true}],"editable":true}
17	2020-01-08 13:10:16.154737+00	feature-updated	theseuship@gmail.com	{"name":"featureY","description":"Only for staging","enabled":true,"strategies":[{"name":"EnvStrategy","parameters":{"env":"staging,staging, production"}}],"variants":null,"createdAt":"2020-01-08T12:44:40.744Z"}
18	2020-01-08 13:10:21.17681+00	feature-updated	theseuship@gmail.com	{"name":"featureY","description":"Only for staging","enabled":true,"strategies":[{"name":"EnvStrategy","parameters":{"env":"staging, production"}}],"variants":null,"createdAt":"2020-01-08T12:44:40.744Z"}
19	2020-01-08 13:22:38.566462+00	feature-updated	theseuship@gmail.com	{"name":"featureY","description":"Only for staging","enabled":true,"strategies":[{"name":"EnvStrategy","parameters":{"env":"staging"}}],"variants":null,"createdAt":"2020-01-08T12:44:40.744Z"}
20	2020-01-08 13:32:43.398836+00	feature-updated	theseuship@gmail.com	{"name":"featureX","description":"new feature","enabled":true,"strategies":[{"name":"default"}],"variants":null,"createdAt":"2020-01-08T12:39:35.050Z"}
21	2020-01-08 14:19:32.418678+00	feature-archived	theseuship@gmail.com	{"name":"test"}
\.


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY public.features (created_at, name, enabled, description, archived, strategies, variants) FROM stdin;
2020-01-08 12:44:40.744+00	featureY	1	Only for staging	0	[{"name":"EnvStrategy","parameters":{"env":"staging"}}]	\N
2020-01-08 12:39:35.05+00	featureX	1	new feature	0	[{"name":"default"}]	\N
2020-01-08 11:22:12.063077+00	test	0	first attempt	1	[{"name":"default"}]	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY public.migrations (id, name, run_on) FROM stdin;
1	/20141020151056-initial-schema	2020-01-08 13:21:20.106
2	/20141110144153-add-description-to-features	2020-01-08 13:21:20.11
3	/20141117200435-add-parameters-template-to-strategies	2020-01-08 13:21:20.112
4	/20141117202209-insert-default-strategy	2020-01-08 13:21:20.114
5	/20141118071458-default-strategy-event	2020-01-08 13:21:20.117
6	/20141215210141-005-archived-flag-to-features	2020-01-08 13:21:20.121
7	/20150210152531-006-rename-eventtype	2020-01-08 13:21:20.126
8	/20160618193924-add-strategies-to-features	2020-01-08 13:21:20.132
9	/20161027134128-create-metrics	2020-01-08 13:21:20.139
10	/20161104074441-create-client-instances	2020-01-08 13:21:20.143
11	/20161205203516-create-client-applications	2020-01-08 13:21:20.149
12	/20161212101749-better-strategy-parameter-definitions	2020-01-08 13:21:20.157
13	/20170211085502-built-in-strategies	2020-01-08 13:21:20.163
14	/20170211090541-add-default-strategies	2020-01-08 13:21:20.178
15	/20170306233934-timestamp-with-tz	2020-01-08 13:21:20.206
16	/20170628205541-add-sdk-version-to-client-instances	2020-01-08 13:21:20.209
17	/20190123204125-add-variants-to-features	2020-01-08 13:21:20.211
18	/20191023184858-flexible-rollout-strategy	2020-01-08 13:21:20.214
\.


--
-- Data for Name: strategies; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY public.strategies (created_at, name, description, parameters, built_in) FROM stdin;
2020-01-08 11:21:20.114193+00	default	Default on/off strategy.	[]	1
2020-01-08 11:21:20.166816+00	userWithId	Active for users with a userId defined in the userIds-list	[{"name":"userIds","type":"list","description":"","required":false}]	1
2020-01-08 11:21:20.166816+00	applicationHostname	Active for client instances with a hostName in the hostNames-list.	[{"name":"hostNames","type":"list","description":"List of hostnames to enable the feature toggle for.","required":false}]	1
2020-01-08 11:21:20.166816+00	gradualRolloutRandom	Randomly activate the feature toggle. No stickiness.	[{"name":"percentage","type":"percentage","description":"","required":false}]	1
2020-01-08 11:21:20.166816+00	gradualRolloutSessionId	Gradually activate feature toggle. Stickiness based on session id.	[{"name":"percentage","type":"percentage","description":"","required":false},{"name":"groupId","type":"string","description":"Used to define a activation groups, which allows you to correlate across feature toggles.","required":true}]	1
2020-01-08 11:21:20.166816+00	gradualRolloutUserId	Gradually activate feature toggle for logged in users. Stickiness based on user id.	[{"name":"percentage","type":"percentage","description":"","required":false},{"name":"groupId","type":"string","description":"Used to define a activation groups, which allows you to correlate across feature toggles.","required":true}]	1
2020-01-08 11:21:20.166816+00	remoteAddress	Active for remote addresses defined in the IPs list.	[{"name":"IPs","type":"list","description":"List of IPs to enable the feature toggle for.","required":true}]	1
2020-01-08 11:21:20.213078+00	flexibleRollout	Gradually activate feature toggle based on sane stickiness	[{"name":"rollout","type":"percentage","description":"","required":false},{"name":"stickiness","type":"string","description":"Used define stickiness. Possible values: default, userId, sessionId, random","required":true},{"name":"groupId","type":"string","description":"Used to define a activation groups, which allows you to correlate across feature toggles.","required":true}]	1
2020-01-08 12:43:56.261513+00	EnvStrategy	Environment strategy	[{"name":"env","type":"list","description":"staging, production","required":true}]	0
\.


--
-- Name: client_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('public.client_metrics_id_seq', 1, false);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('public.events_id_seq', 21, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('public.migrations_id_seq', 18, true);


--
-- Name: client_applications client_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public.client_applications
    ADD CONSTRAINT client_applications_pkey PRIMARY KEY (app_name);


--
-- Name: client_metrics client_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public.client_metrics
    ADD CONSTRAINT client_metrics_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: strategies strategies_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public.strategies
    ADD CONSTRAINT strategies_pkey PRIMARY KEY (name);


--
-- PostgreSQL database dump complete
--

