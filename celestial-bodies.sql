--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(64) NOT NULL,
    coordinates character varying(128) NOT NULL,
    more_info text,
    n_stars integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    coordinates character varying(128) NOT NULL,
    distance_from_earth_on_light_years bigint NOT NULL
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
    name character varying(30) NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer,
    equatorial_diameter numeric(12,1)
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
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    star_id integer,
    has_water boolean
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
    name character varying(30) NOT NULL,
    temperature_in_kelvin integer NOT NULL,
    galaxy_id integer,
    constellation_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', '12.0000, 24.0000, 0.0000', 'Orion is one of the most recognizable constellations in the night sky.', 7);
INSERT INTO public.constellation VALUES (2, 'Canis Major', '10.0000, 25.0000, 0.0000', 'Canis Major contains Sirius, the brightest star in the night sky.', 5);
INSERT INTO public.constellation VALUES (3, 'Leo', '5.0000, 10.0000, 0.0000', 'Leo is one of the constellations of the zodiac.', 9);
INSERT INTO public.constellation VALUES (4, 'Ursa Major', '30.0000, 45.0000, 0.0000', 'Ursa Major contains the Big Dipper asterism.', 7);
INSERT INTO public.constellation VALUES (5, 'Cygnus', '20.0000, 35.0000, 0.0000', 'Cygnus is known as the Northern Cross.', 6);
INSERT INTO public.constellation VALUES (6, 'Cassiopeia', '15.0000, 30.0000, 0.0000', 'Cassiopeia is named after the queen in Greek mythology.', 5);
INSERT INTO public.constellation VALUES (7, 'Taurus', '25.0000, 40.0000, 0.0000', 'Taurus is one of the oldest constellations.', 7);
INSERT INTO public.constellation VALUES (8, 'Pegasus', '40.0000, 55.0000, 0.0000', 'Pegasus is named after the mythical winged horse.', 5);
INSERT INTO public.constellation VALUES (9, 'Aquila', '55.0000, 70.0000, 0.0000', 'Aquila is associated with the eagle in Greek mythology.', 6);
INSERT INTO public.constellation VALUES (10, 'Gemini', '70.0000, 85.0000, 0.0000', 'Gemini is named after the twins Castor and Pollux.', 8);
INSERT INTO public.constellation VALUES (11, 'Scorpius', '45.0000, 60.0000, 0.0000', 'Scorpius is one of the constellations of the zodiac.', 15);
INSERT INTO public.constellation VALUES (12, 'Virgo', '18.0000, 34.0000, 0.0000', 'Virgo is one of the constellations of the zodiac.', 11);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', '30.0000, 45.0000, 0.0000', 100000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', '10.0000, 25.0000, 0.0000', 120000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', '5.0000, 10.0000, 0.0000', 50000000);
INSERT INTO public.galaxy VALUES (4, 'M87', 'Elliptic', '55.0000, 70.0000, 0.0000', 200000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', '20.0000, 35.0000, 0.0000', 90000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', '40.0000, 55.0000, 0.0000', 150000000);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel', 'Ring', '70.0000, 85.0000, 0.0000', 300000000);
INSERT INTO public.galaxy VALUES (8, 'Black Eye', 'Spiral', '25.0000, 40.0000, 0.0000', 80000000);
INSERT INTO public.galaxy VALUES (9, 'Cigar', 'Elliptic', '45.0000, 60.0000, 0.0000', 180000000);
INSERT INTO public.galaxy VALUES (10, 'Sunflower', 'Spiral', '15.0000, 30.0000, 0.0000', 70000000);
INSERT INTO public.galaxy VALUES (11, 'Bode''s', 'Spiral', '12.0000, 24.0000, 0.0000', 65000000);
INSERT INTO public.galaxy VALUES (12, 'Pinwheel', 'Spiral', '18.0000, 34.0000, 0.0000', 75000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (11, 'Callisto', true, 4, 4821.0);
INSERT INTO public.moon VALUES (12, 'Mimas', true, 5, 396.4);
INSERT INTO public.moon VALUES (13, 'Triton', true, 6, 2706.8);
INSERT INTO public.moon VALUES (14, 'Enceladus', true, 7, 499.8);
INSERT INTO public.moon VALUES (15, 'Dione', true, 8, 1123.0);
INSERT INTO public.moon VALUES (16, 'Charon', true, 9, 1212.0);
INSERT INTO public.moon VALUES (17, 'Iapetus', true, 10, 1469.6);
INSERT INTO public.moon VALUES (18, 'Oberon', true, 11, 1523.0);
INSERT INTO public.moon VALUES (19, 'Miranda', true, 12, 471.6);
INSERT INTO public.moon VALUES (20, 'Ariel', true, 11, 1157.8);
INSERT INTO public.moon VALUES (21, 'Tethys', true, 5, 1062.0);
INSERT INTO public.moon VALUES (22, 'Umbriel', true, 11, 1169.4);
INSERT INTO public.moon VALUES (23, 'Hyperion', true, 7, 270.0);
INSERT INTO public.moon VALUES (24, 'Proteus', true, 6, 420.0);
INSERT INTO public.moon VALUES (25, 'Larissa', true, 12, 194.0);
INSERT INTO public.moon VALUES (26, 'Nereid', true, 6, 340.0);
INSERT INTO public.moon VALUES (27, 'Janus', true, 5, 179.0);
INSERT INTO public.moon VALUES (28, 'Rosalind', true, 10, 72.0);
INSERT INTO public.moon VALUES (29, 'Puck', true, 10, 162.0);
INSERT INTO public.moon VALUES (30, 'Despina', true, 6, 148.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 1, true);
INSERT INTO public.planet VALUES (2, 'Mars', false, 1, false);
INSERT INTO public.planet VALUES (3, 'Venus', false, 2, false);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 2, false);
INSERT INTO public.planet VALUES (5, 'Saturn', false, 3, false);
INSERT INTO public.planet VALUES (6, 'Neptune', false, 3, true);
INSERT INTO public.planet VALUES (7, 'Mercury', false, 4, false);
INSERT INTO public.planet VALUES (8, 'Uranus', false, 4, false);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 5, false);
INSERT INTO public.planet VALUES (10, 'Europa', false, 5, true);
INSERT INTO public.planet VALUES (11, 'Titan', false, 6, true);
INSERT INTO public.planet VALUES (12, 'Ganymede', false, 6, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, 1, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 9940, 1, 2);
INSERT INTO public.star VALUES (3, 'Alpha', 7500, 2, 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3590, 2, 4);
INSERT INTO public.star VALUES (5, 'Vega', 9602, 3, 5);
INSERT INTO public.star VALUES (6, 'Polaris', 6050, 3, 6);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 3042, 4, 7);
INSERT INTO public.star VALUES (8, 'Rigel', 12100, 4, 8);
INSERT INTO public.star VALUES (9, 'Arcturus', 4300, 5, 9);
INSERT INTO public.star VALUES (10, 'Antares', 3510, 5, 10);
INSERT INTO public.star VALUES (11, 'Capella', 4940, 6, 11);
INSERT INTO public.star VALUES (12, 'Aldebaran', 3910, 6, 12);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 12, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

