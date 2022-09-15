--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years numeric(10,3),
    galaxy_types_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(10,3),
    planet_id integer NOT NULL,
    year_of_discovery integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    star_id integer NOT NULL,
    planet_types_id integer NOT NULL,
    moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years numeric(10,3),
    distance_from_earth numeric(10,3),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'MILKY WAY', 'Its spiraling expanse contains at least 100 billion stars, our Sun among them', 16.610, 3);
INSERT INTO public.galaxy VALUES (2, 'URSA MAJOR B', 'The luminosity increases with distance from the core', 99999.000, 1);
INSERT INTO public.galaxy VALUES (3, 'UGC 12158', 'Spiral Galaxy', 99999.000, 3);
INSERT INTO public.galaxy VALUES (4, 'NGC 2008', 'Spiral Galaxy', 99999.000, 3);
INSERT INTO public.galaxy VALUES (5, 'ESO 338-4', 'Situada en Sagitario', 99999.000, 4);
INSERT INTO public.galaxy VALUES (6, 'ESO 486-21', 'Irregular', 99999.000, 4);
INSERT INTO public.galaxy VALUES (7, 'IC 3583', 'Irregular', 99999.000, 4);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'ELLIPTICAL', 'Elliptical galaxies are given their name because of ther oblong shape and lack of overall structure');
INSERT INTO public.galaxy_types VALUES (2, 'PECULIAR', 'Speaking of galactic collisions, peculiar galaxies are almost always the result of one');
INSERT INTO public.galaxy_types VALUES (3, 'SPIRAL', 'Can be recognized by their wide, flat disk of rotating gas and dust');
INSERT INTO public.galaxy_types VALUES (4, 'IRREGULAR', 'Irregular galaxies are galaxies that dont fall under any of the three galaxy types mentioned above');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (14, 'EGEON', 'Saturn s Moon', false, true, 9999.000, 8, NULL);
INSERT INTO public.moon VALUES (15, 'DAFNE', 'Saturn s Moon', false, false, 9999.000, 8, NULL);
INSERT INTO public.moon VALUES (16, 'ATLAS', 'Saturn s Moon', false, true, 9999.000, 8, NULL);
INSERT INTO public.moon VALUES (17, 'PROMETEO', 'Saturn s Moon', false, false, 9999.000, 8, NULL);
INSERT INTO public.moon VALUES (18, 'PANDORA', 'Saturn s Moon', false, true, 9999.000, 8, NULL);
INSERT INTO public.moon VALUES (19, 'FOBOS', 'Mars Moon', false, true, 9999.000, 6, NULL);
INSERT INTO public.moon VALUES (20, 'DEIMOS', 'Mars Moon', false, false, 9999.000, 6, NULL);
INSERT INTO public.moon VALUES (21, 'IO', 'Jupiter Moon', false, true, 9999.000, 7, NULL);
INSERT INTO public.moon VALUES (22, 'EUROPA', 'Jupiter Moon', false, true, 9999.000, 7, NULL);
INSERT INTO public.moon VALUES (23, 'CALISTO', 'Jupiter Moon', false, true, 9999.000, 7, NULL);
INSERT INTO public.moon VALUES (24, 'AMALTEA', 'Jupiter Moon', false, false, 9999.000, 7, NULL);
INSERT INTO public.moon VALUES (25, 'CORDELIA', 'Urano s Moon', false, true, 9999.000, 9, NULL);
INSERT INTO public.moon VALUES (26, 'OFELIA', 'Urano s Moon', false, false, 9999.000, 9, NULL);
INSERT INTO public.moon VALUES (27, 'BLANCA', 'Urano s Moon', false, true, 9999.000, 9, NULL);
INSERT INTO public.moon VALUES (28, 'CRESIDA', 'Urano s Moon', false, true, 9999.000, 9, NULL);
INSERT INTO public.moon VALUES (29, 'DESDEMONA', 'Urano s Moon', false, true, 9999.000, 9, NULL);
INSERT INTO public.moon VALUES (30, 'JULIETA', 'Urano s Moon', false, true, 9999.000, 9, NULL);
INSERT INTO public.moon VALUES (31, 'BELINDA', 'Urano s Moon', false, false, 9999.000, 9, NULL);
INSERT INTO public.moon VALUES (32, 'ROSALINDA', 'Urano s Moon', false, false, 9999.000, 9, NULL);
INSERT INTO public.moon VALUES (33, 'NAYADE', 'Neptuno s Moon', false, false, 9999.000, 10, NULL);
INSERT INTO public.moon VALUES (34, 'TALASA', 'Neptuno s Moon', false, false, 9999.000, 10, NULL);
INSERT INTO public.moon VALUES (35, 'DESPINA', 'Neptuno s Moon', false, false, 9999.000, 10, NULL);
INSERT INTO public.moon VALUES (36, 'GALATEA', 'Neptuno s Moon', false, false, 9999.000, 10, NULL);
INSERT INTO public.moon VALUES (37, 'HIPOCAMPO', 'Neptuno s Moon', false, false, 9999.000, 10, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'EARTH', 'Earth is special because it is an ocean planet', true, 1, 3, 1);
INSERT INTO public.planet VALUES (4, 'MERCURIO', 'Planet 1', false, 1, 3, NULL);
INSERT INTO public.planet VALUES (5, 'VENUS', 'Planet 2', false, 1, 3, NULL);
INSERT INTO public.planet VALUES (6, 'MARTE', 'Planet 4', false, 1, 3, NULL);
INSERT INTO public.planet VALUES (7, 'JUPETER', 'Planet 4', false, 1, 1, NULL);
INSERT INTO public.planet VALUES (8, 'SATURNO', 'Planet 4', false, 1, 1, NULL);
INSERT INTO public.planet VALUES (9, 'URANO', 'Planet 4', false, 1, 2, NULL);
INSERT INTO public.planet VALUES (10, 'NEPTUNO', 'Planet 4', false, 1, 2, NULL);
INSERT INTO public.planet VALUES (11, 'PLANET 21', 'Planet 21', false, 2, 1, NULL);
INSERT INTO public.planet VALUES (12, 'PLANET 22', 'Planet 22', false, 2, 2, NULL);
INSERT INTO public.planet VALUES (13, 'PLANET 23', 'Planet 23', false, 2, 3, NULL);
INSERT INTO public.planet VALUES (14, 'PLANET 24', 'Planet 24', false, 2, 2, NULL);
INSERT INTO public.planet VALUES (15, 'PLANET 31', 'Planet 21', false, 3, 1, NULL);
INSERT INTO public.planet VALUES (16, 'PLANET 32', 'Planet 32', false, 3, 2, NULL);
INSERT INTO public.planet VALUES (17, 'PLANET 33', 'Planet 33', false, 3, 3, NULL);
INSERT INTO public.planet VALUES (18, 'PLANET 34', 'Planet 34', false, 3, 2, NULL);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'GAS GIANTS', 'The biggest planets');
INSERT INTO public.planet_types VALUES (2, 'ICE GIANTS', 'The farthest planets from the Sun');
INSERT INTO public.planet_types VALUES (3, 'TERRESTRIAL PLANETS', 'Mostly made up of rock and metal');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SUN', 'The Sun is the center of our Solar System, a hot glowing ball of hydrogen and helium', true, 4.603, 93.000, 1);
INSERT INTO public.star VALUES (2, 'RIGEL', 'B', true, 999.000, 999.000, 1);
INSERT INTO public.star VALUES (3, 'ALTAIR', 'A', false, 999.000, 999.000, 1);
INSERT INTO public.star VALUES (4, 'PROCYON', 'F', true, 999.000, 999.000, 1);
INSERT INTO public.star VALUES (5, 'EPSILON', 'G', true, 999.000, 999.000, 1);
INSERT INTO public.star VALUES (6, 'PROXIMA CENTAURI', 'K', false, 999.000, 999.000, 1);
INSERT INTO public.star VALUES (7, 'ZETA OPHIUCHI', 'Z', true, 999.000, 999.000, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 37, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_types_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

