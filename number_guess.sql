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

DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing_game OWNER TO freecodecamp;

\connect number_guessing_game

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
-- Name: number_guessing; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guessing (
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.number_guessing OWNER TO freecodecamp;

--
-- Data for Name: number_guessing; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guessing VALUES ('Cristian', 1, 12);
INSERT INTO public.number_guessing VALUES ('user_1679858817696', 2, 638);
INSERT INTO public.number_guessing VALUES ('user_1679858817697', 4, 273);
INSERT INTO public.number_guessing VALUES ('user_1679859610161', 2, 230);
INSERT INTO public.number_guessing VALUES ('user_1679858938356', 2, 830);
INSERT INTO public.number_guessing VALUES ('user_1679859610162', 5, 233);
INSERT INTO public.number_guessing VALUES ('Camilo', 1, 16);
INSERT INTO public.number_guessing VALUES ('user_1679858938357', 4, 313);
INSERT INTO public.number_guessing VALUES ('user_1679859001833', 2, 75);
INSERT INTO public.number_guessing VALUES ('user_1679859637658', 2, 210);
INSERT INTO public.number_guessing VALUES ('user_1679859001834', 5, 307);
INSERT INTO public.number_guessing VALUES ('user_1679859637659', 5, 180);
INSERT INTO public.number_guessing VALUES ('Carlos', NULL, NULL);
INSERT INTO public.number_guessing VALUES ('user_1679859070004', 2, 615);
INSERT INTO public.number_guessing VALUES ('user_1679859070005', 5, 46);
INSERT INTO public.number_guessing VALUES ('user_1679859118636', 1, 852);
INSERT INTO public.number_guessing VALUES ('user_1679859756403', 2, 257);
INSERT INTO public.number_guessing VALUES ('user_1679859118637', 5, 525);
INSERT INTO public.number_guessing VALUES ('user_1679859756404', 5, 115);
INSERT INTO public.number_guessing VALUES ('user_1679859160522', 2, 526);
INSERT INTO public.number_guessing VALUES ('user_1679859160523', 5, 118);
INSERT INTO public.number_guessing VALUES ('user_1679860058060', 2, 293);
INSERT INTO public.number_guessing VALUES ('user_1679860058061', 4, 331);
INSERT INTO public.number_guessing VALUES ('user_1679860133890', 1, 430);
INSERT INTO public.number_guessing VALUES ('user_1679860133891', 5, 276);
INSERT INTO public.number_guessing VALUES ('user_1679860204235', 2, 329);
INSERT INTO public.number_guessing VALUES ('user_1679860204236', 4, 47);
INSERT INTO public.number_guessing VALUES ('Jose', NULL, NULL);
INSERT INTO public.number_guessing VALUES ('user_1679860247230', 2, 181);
INSERT INTO public.number_guessing VALUES ('user_1679860247231', 5, 92);


--
-- PostgreSQL database dump complete
--

