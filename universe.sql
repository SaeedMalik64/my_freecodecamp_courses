--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8';


\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_type character varying(40) NOT NULL,
    age_in_million_of_years numeric(6,1) NOT NULL,
    description text,
    name character varying(40) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    is_spherical boolean DEFAULT true,
    diameter_in_km integer
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.more_info (
    row_id integer NOT NULL,
    radius_in_solar_radius numeric(10,4),
    mass_in_solar_mass numeric(15,3),
    star_id integer NOT NULL
);


ALTER TABLE public.more_info OWNER TO postgres;

--
-- Name: more_info_row_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.more_info_row_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.more_info_row_id_seq OWNER TO postgres;

--
-- Name: more_info_row_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.more_info_row_id_seq OWNED BY public.more_info.row_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    has_life boolean DEFAULT false,
    description text,
    name character varying(40) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    description text,
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(40),
    distance_from_earth_light_years integer
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info row_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.more_info ALTER COLUMN row_id SET DEFAULT nextval('public.more_info_row_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Spiral', 13.6, 'Our own galaxy', 'The Milky Way');
INSERT INTO public.galaxy VALUES (2, 'Irr', 14.0, 'Our Neighbour', 'Canis Major Dwarf');
INSERT INTO public.galaxy VALUES (3, 'Spheroidal', 12.0, 'Moving Away', 'Segue 1');
INSERT INTO public.galaxy VALUES (4, 'Spheroidal', 13.0, 'Ursa Major Constellation', 'Ursa Major II');
INSERT INTO public.galaxy VALUES (5, 'Spheroidal', 13.5, 'Aries Constellation', 'Segue 2');
INSERT INTO public.galaxy VALUES (6, 'Spiral', 14.0, 'The Majestic', 'Andromeda');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (45, 'Ganymede', NULL, 5, true, 5268);
INSERT INTO public.moon VALUES (46, 'Titan', NULL, 6, true, 5152);
INSERT INTO public.moon VALUES (47, 'Callisto', NULL, 5, true, 4820);
INSERT INTO public.moon VALUES (48, 'Io', NULL, 5, true, 3643);
INSERT INTO public.moon VALUES (49, 'Luna', NULL, 3, true, 3474);
INSERT INTO public.moon VALUES (50, 'Europa', NULL, 5, true, 3121);
INSERT INTO public.moon VALUES (51, 'Triton', NULL, 8, true, 2706);
INSERT INTO public.moon VALUES (52, 'Titania', NULL, 7, true, 1576);
INSERT INTO public.moon VALUES (53, 'Rhea', NULL, 6, true, 1527);
INSERT INTO public.moon VALUES (54, 'Oberon', NULL, 7, true, 1522);
INSERT INTO public.moon VALUES (55, 'Iapetus', NULL, 6, true, 1468);
INSERT INTO public.moon VALUES (56, 'Charon', NULL, 9, true, 1212);
INSERT INTO public.moon VALUES (57, 'Umbriel', NULL, 7, true, 1169);
INSERT INTO public.moon VALUES (58, 'Ariel', NULL, 7, true, 1157);
INSERT INTO public.moon VALUES (59, 'Dione', NULL, 6, true, 1122);
INSERT INTO public.moon VALUES (60, 'Tethys', NULL, 6, true, 1062);
INSERT INTO public.moon VALUES (61, 'Enceladus', NULL, 6, true, 504);
INSERT INTO public.moon VALUES (62, 'Miranda', NULL, 7, true, 471);
INSERT INTO public.moon VALUES (63, 'Proteus', NULL, 8, true, 420);
INSERT INTO public.moon VALUES (64, 'Mimas', NULL, 6, true, 396);
INSERT INTO public.moon VALUES (65, 'Nereid', NULL, 8, true, 357);
INSERT INTO public.moon VALUES (66, 'Hyperion', NULL, 6, true, 277);
INSERT INTO public.moon VALUES (67, 'Phoebe', NULL, 6, true, 213);
INSERT INTO public.moon VALUES (68, 'Larissa', NULL, 8, true, 194);
INSERT INTO public.moon VALUES (69, 'Janus', NULL, 6, true, 179);
INSERT INTO public.moon VALUES (70, 'Galatea', NULL, 8, true, 174);
INSERT INTO public.moon VALUES (71, 'Himalia', NULL, 5, true, 170);
INSERT INTO public.moon VALUES (72, 'Amalthea', NULL, 5, true, 167);
INSERT INTO public.moon VALUES (73, 'Sycorax', NULL, 7, true, 165);
INSERT INTO public.moon VALUES (74, 'Puck', NULL, 7, true, 162);
INSERT INTO public.moon VALUES (75, 'Despina', NULL, 8, true, 156);
INSERT INTO public.moon VALUES (76, 'Portia', NULL, 7, true, 135);
INSERT INTO public.moon VALUES (77, 'Epimetheus', NULL, 6, true, 116);
INSERT INTO public.moon VALUES (78, 'Thebe', NULL, 5, false, 98);
INSERT INTO public.moon VALUES (79, 'Juliet', NULL, 7, false, 93);
INSERT INTO public.moon VALUES (80, 'Prometheus', NULL, 6, false, 86);
INSERT INTO public.moon VALUES (81, 'Thalassa', NULL, 8, false, 81);
INSERT INTO public.moon VALUES (82, 'Pandora', NULL, 6, false, 81);
INSERT INTO public.moon VALUES (83, 'Belinda', NULL, 7, false, 80);
INSERT INTO public.moon VALUES (84, 'Elara', NULL, 5, false, 79);
INSERT INTO public.moon VALUES (85, 'Cressida', NULL, 7, false, 79);
INSERT INTO public.moon VALUES (86, 'Caliban', NULL, 7, false, 72);
INSERT INTO public.moon VALUES (87, 'Rosalind', NULL, 7, false, 72);
INSERT INTO public.moon VALUES (88, 'Naiad', NULL, 8, false, 66);
INSERT INTO public.moon VALUES (89, 'Desdemona', NULL, 7, false, 64);
INSERT INTO public.moon VALUES (90, 'Halimede', NULL, 8, false, 62);
INSERT INTO public.moon VALUES (91, 'Neso', NULL, 8, false, 60);
INSERT INTO public.moon VALUES (92, 'Pasiphae', NULL, 5, false, 60);
INSERT INTO public.moon VALUES (93, 'Bianca', NULL, 7, false, 51);
INSERT INTO public.moon VALUES (94, 'Hydra', NULL, 9, false, 51);
INSERT INTO public.moon VALUES (95, 'Prospero', NULL, 7, false, 50);
INSERT INTO public.moon VALUES (96, 'Nix', NULL, 9, false, 49);
INSERT INTO public.moon VALUES (97, 'Setebos', NULL, 7, false, 48);
INSERT INTO public.moon VALUES (98, 'Carme', NULL, 5, false, 46);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.more_info VALUES (1, 1.0000, 1.000, 7);
INSERT INTO public.more_info VALUES (2, 832.0000, 12.000, 1);
INSERT INTO public.more_info VALUES (3, 887.0000, 16.000, 2);
INSERT INTO public.more_info VALUES (4, 1009.0000, 4.310, 3);
INSERT INTO public.more_info VALUES (5, 1200.0000, 2.150, 4);
INSERT INTO public.more_info VALUES (6, 1500.0000, 60.000, 5);
INSERT INTO public.more_info VALUES (7, 1700.0000, 10.000, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, false, 'Trade and Profit', 'Mercury', 7);
INSERT INTO public.planet VALUES (2, false, 'Love and Beauty', 'Venus', 7);
INSERT INTO public.planet VALUES (3, true, 'Life', 'Earth', 7);
INSERT INTO public.planet VALUES (4, false, 'War', 'Mars', 7);
INSERT INTO public.planet VALUES (5, false, 'Light and Sky', 'Jupiter', 7);
INSERT INTO public.planet VALUES (6, false, 'Agriculture', 'Saturn', 7);
INSERT INTO public.planet VALUES (7, false, 'Heaven', 'Uranus', 7);
INSERT INTO public.planet VALUES (8, false, 'Sea', 'Neptune', 7);
INSERT INTO public.planet VALUES (9, false, 'Undertaker', 'Pluto', 7);
INSERT INTO public.planet VALUES (10, false, '', 'Exoplanet 1', 1);
INSERT INTO public.planet VALUES (11, false, '', 'Exoplanet 2', 2);
INSERT INTO public.planet VALUES (12, false, '', 'Exoplanet 3', 3);
INSERT INTO public.planet VALUES (13, false, '', 'Exoplanet 4', 4);
INSERT INTO public.planet VALUES (14, false, '', 'Exoplanet 5', 5);
INSERT INTO public.planet VALUES (15, false, '', 'Exoplanet 6', 6);
INSERT INTO public.planet VALUES (16, false, '', 'Exoplanet 7', 1);
INSERT INTO public.planet VALUES (17, false, '', 'Exoplanet 8', 2);
INSERT INTO public.planet VALUES (18, false, '', 'Exoplanet 9', 3);
INSERT INTO public.planet VALUES (19, false, '', 'Exoplanet 10', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, '', 'Antares', 1, 'Red Supergiant', 550);
INSERT INTO public.star VALUES (2, 'Orion Star', 'Betelgeuse', 1, 'Supernova', 640);
INSERT INTO public.star VALUES (3, 'Sagittarius', 'KW Saggittarii', 1, 'Supergiant', 6200);
INSERT INTO public.star VALUES (4, '', 'Mu Cephei', 1, 'Red Supernova', 2838);
INSERT INTO public.star VALUES (5, '', 'VY Canis Majoris', 1, 'Hypergiant', 3900);
INSERT INTO public.star VALUES (6, '', 'UY Scuti', 1, 'Supernova', 9459);
INSERT INTO public.star VALUES (7, 'The Sun', 'SUN', 1, 'Yellow Dwart', 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 98, true);


--
-- Name: more_info_row_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.more_info_row_id_seq', 7, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_star_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_star_id_key UNIQUE (star_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

