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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    speed_km_per_s integer NOT NULL,
    period_in_years numeric(10,2),
    is_periodic boolean NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2),
    description text,
    has_life boolean NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    temperature_in_kelvin integer,
    is_spherical boolean NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 54, 75.32, true, 'Famous comet');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 44, 2533.00, true, 'Bright comet');
INSERT INTO public.comet VALUES (3, 'Hyakutake', 70, 17000.00, true, 'Close Earth approach');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0.00, 'Our home galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000.00, 'Nearest major galaxy', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 3000000.00, 'Local Group member', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000, 23000000.00, 'Classic spiral galaxy', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 13250, 29000000.00, 'Bright central bulge', false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 11000, 163000.00, 'Satellite galaxy', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 4500, true, 'Earth satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 4500, false, 'Mars moon');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 4500, false, 'Mars moon');
INSERT INTO public.moon VALUES (4, 'Io', 5, 4500, true, 'Volcanic moon');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 4500, true, 'Icy ocean moon');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 4500, true, 'Largest moon');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4500, true, 'Cratered moon');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 4500, false, 'Small moon');
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 4500, false, 'Outer moon');
INSERT INTO public.moon VALUES (10, 'Elara', 5, 4500, false, 'Outer moon');
INSERT INTO public.moon VALUES (11, 'Titan', 6, 4500, true, 'Largest Saturn moon');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 4500, true, 'Saturn moon');
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 4500, true, 'Two-tone moon');
INSERT INTO public.moon VALUES (14, 'Dione', 6, 4500, true, 'Saturn moon');
INSERT INTO public.moon VALUES (15, 'Tethys', 6, 4500, true, 'Saturn moon');
INSERT INTO public.moon VALUES (16, 'Enceladus', 6, 4500, true, 'Geysers');
INSERT INTO public.moon VALUES (17, 'Mimas', 6, 4500, true, 'Big crater');
INSERT INTO public.moon VALUES (18, 'Titania', 7, 4500, true, 'Uranus moon');
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 4500, true, 'Uranus moon');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 4500, true, 'Neptune moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 4500, 77.00, false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 4500, 41.00, false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 4500, 0.00, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 4500, 225.00, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 4500, 588.00, false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 4500, 1200.00, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 4500, 2600.00, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 4500, 4300.00, false, true);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Exoplanet', 4850, 4.24, false, true);
INSERT INTO public.planet VALUES (10, 'Proxima c', 2, 'Exoplanet', 4900, 4.24, false, true);
INSERT INTO public.planet VALUES (11, 'Sirius b-1', 3, 'Exoplanet', 300, 8.60, false, true);
INSERT INTO public.planet VALUES (12, 'Rigel x', 5, 'Gas Giant', 20, 860.00, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 4600, 5778, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Red Dwarf', 4500, 3042, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A-type', 242, 9940, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Red Supergiant', 10, 3500, true);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 'Blue Supergiant', 8, 12100, true);
INSERT INTO public.star VALUES (6, 'Alpheratz', 2, 'B-type', 60, 13800, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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


