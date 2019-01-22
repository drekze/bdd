--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.1
-- Dumped by pg_dump version 9.3.1
-- Started on 2019-01-10 23:26:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 189 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2069 (class 0 OID 0)
-- Dependencies: 189
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 27595)
-- Name: arrendataria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE arrendataria (
    ar_rut character varying(20) NOT NULL,
    ar_nombre character varying(20),
    ar_contaacto character varying(20),
    ar_telefono integer
);


ALTER TABLE public.arrendataria OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 27630)
-- Name: asiste; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE asiste (
    rut_turista character varying(20),
    id_tour integer
);


ALTER TABLE public.asiste OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 27513)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria (
    id_categoria integer NOT NULL,
    desc_categoria character varying(20)
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 27498)
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ciudad (
    id_ciudad integer NOT NULL,
    id_region integer,
    id_tour integer,
    nom_ciudad character varying(20)
);


ALTER TABLE public.ciudad OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 27615)
-- Name: descuento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE descuento (
    id_descuento integer NOT NULL,
    desc_descuento character varying(20),
    porcentaje_descuento double precision
);


ALTER TABLE public.descuento OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 27643)
-- Name: enfermedades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enfermedades (
    id_enfermedad integer NOT NULL,
    desc_enfermedad character varying(20)
);


ALTER TABLE public.enfermedades OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 27541)
-- Name: especialidades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE especialidades (
    id_especialidad integer NOT NULL,
    desc_especialidad character varying(20)
);


ALTER TABLE public.especialidades OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 27518)
-- Name: guia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE guia (
    rut_guia integer NOT NULL,
    id_ciudad integer,
    nombre_guia character varying(20),
    apellido_guia character varying(20),
    calle_guia character varying(20),
    numero_guia character varying(20)
);


ALTER TABLE public.guia OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 27572)
-- Name: lugares; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lugares (
    id_lugar integer NOT NULL,
    id_ciudad integer,
    nom_lug character varying(20),
    valor_lug_e integer,
    nivel_es character varying(20)
);


ALTER TABLE public.lugares OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 27648)
-- Name: padece; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE padece (
    id_enfermedad integer,
    rut_turista character varying(20)
);


ALTER TABLE public.padece OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 27559)
-- Name: poseen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE poseen (
    rut_guia integer,
    id_tour integer,
    pos_fecha date
);


ALTER TABLE public.poseen OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 27528)
-- Name: puedetener; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE puedetener (
    rut_guia integer,
    id_categoria integer
);


ALTER TABLE public.puedetener OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 27493)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE region (
    id_region integer NOT NULL,
    nom_region character varying(20)
);


ALTER TABLE public.region OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 27488)
-- Name: tour; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tour (
    id_tour integer NOT NULL,
    nom_tour character varying(20),
    cost_tourind integer,
    cost_tourg integer,
    min_ptour integer
);


ALTER TABLE public.tour OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 27620)
-- Name: turista; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE turista (
    rut_turista character varying(20) NOT NULL,
    id_descuento integer,
    nom_turist character varying(20),
    nom_tur_cont character varying(20),
    tel_tur integer,
    fecha_nacimiento date
);


ALTER TABLE public.turista OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 27582)
-- Name: visita; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE visita (
    id_tour integer,
    id_lugar integer,
    fecha_llegada date,
    hora_llegada time without time zone,
    fecha_salida date,
    hora_salida time without time zone
);


ALTER TABLE public.visita OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 27661)
-- Name: regiones_sindescuento; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW regiones_sindescuento AS
 SELECT re.nom_region AS nombreregion, 
    count(*) AS cantidad
   FROM region re, 
    tour tou, 
    turista tu, 
    descuento des, 
    asiste asi, 
    visita, 
    lugares, 
    ciudad, 
    descuento
  WHERE ((((((((((descuento.id_descuento = tu.id_descuento) AND ((asi.rut_turista)::text = (tu.rut_turista)::text)) AND (asi.id_tour = tou.id_tour)) AND (visita.id_tour = tou.id_tour)) AND (visita.id_lugar = lugares.id_lugar)) AND (ciudad.id_ciudad = lugares.id_ciudad)) AND (des.id_descuento = tu.id_descuento)) AND (ciudad.id_region = re.id_region)) AND (des.porcentaje_descuento = (0)::double precision)) AND ((visita.fecha_llegada >= '2018-11-01'::date) AND (visita.fecha_llegada <= '2018-11-30'::date)))
  GROUP BY re.nom_region;


ALTER TABLE public.regiones_sindescuento OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 27546)
-- Name: tiene; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tiene (
    rut_guia integer,
    id_especialidad integer,
    tie_nivel integer
);


ALTER TABLE public.tiene OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 27600)
-- Name: vehiculo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vehiculo (
    veh_patente character varying(10) NOT NULL,
    ar_rut character varying(20),
    id_tour integer,
    veh_ano integer,
    veh_marca character varying(20),
    veh_capacidad integer,
    nom_chofer character varying(20),
    fecha_dev date,
    precio_arriendo integer
);


ALTER TABLE public.vehiculo OWNER TO postgres;

--
-- TOC entry 2055 (class 0 OID 27595)
-- Dependencies: 181
-- Data for Name: arrendataria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY arrendataria (ar_rut, ar_nombre, ar_contaacto, ar_telefono) FROM stdin;
12321334	rent	clemidia	23131412
12321335	renta	francisca	2231412
12321336	maca	rentacarconce	23132112
\.


--
-- TOC entry 2059 (class 0 OID 27630)
-- Dependencies: 185
-- Data for Name: asiste; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY asiste (rut_turista, id_tour) FROM stdin;
12312315	1
12312312	2
12312313	2
\.


--
-- TOC entry 2047 (class 0 OID 27513)
-- Dependencies: 173
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categoria (id_categoria, desc_categoria) FROM stdin;
1	montañis
2	canopy
3	trekking
\.


--
-- TOC entry 2046 (class 0 OID 27498)
-- Dependencies: 172
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ciudad (id_ciudad, id_region, id_tour, nom_ciudad) FROM stdin;
1	1	1	cañete
2	2	2	concepcion
3	2	1	los alamos
\.


--
-- TOC entry 2057 (class 0 OID 27615)
-- Dependencies: 183
-- Data for Name: descuento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY descuento (id_descuento, desc_descuento, porcentaje_descuento) FROM stdin;
1	20porciento	0.20000000000000001
2	30porciento	0.29999999999999999
3	40porciento	0.40000000000000002
\.


--
-- TOC entry 2060 (class 0 OID 27643)
-- Dependencies: 186
-- Data for Name: enfermedades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY enfermedades (id_enfermedad, desc_enfermedad) FROM stdin;
1	resfrio
2	virus hanta
3	jaqueca
\.


--
-- TOC entry 2050 (class 0 OID 27541)
-- Dependencies: 176
-- Data for Name: especialidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY especialidades (id_especialidad, desc_especialidad) FROM stdin;
1	nose
2	nose
3	nose3
\.


--
-- TOC entry 2048 (class 0 OID 27518)
-- Dependencies: 174
-- Data for Name: guia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY guia (rut_guia, id_ciudad, nombre_guia, apellido_guia, calle_guia, numero_guia) FROM stdin;
12312323	1	marco	valenzuela	caupolican12	12312312
12312312	2	francisca	valenzuela	lientur21	3232133
434341434	2	branco	cid	paicavi21	23232311
\.


--
-- TOC entry 2053 (class 0 OID 27572)
-- Dependencies: 179
-- Data for Name: lugares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lugares (id_lugar, id_ciudad, nom_lug, valor_lug_e, nivel_es) FROM stdin;
1	1	canete	2300	experto
2	1	concepcion	2300	novato
3	1	los alamos	1200	aprendiz
\.


--
-- TOC entry 2061 (class 0 OID 27648)
-- Dependencies: 187
-- Data for Name: padece; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY padece (id_enfermedad, rut_turista) FROM stdin;
1	12312313
2	12312315
3	12312312
\.


--
-- TOC entry 2052 (class 0 OID 27559)
-- Dependencies: 178
-- Data for Name: poseen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY poseen (rut_guia, id_tour, pos_fecha) FROM stdin;
12312323	1	2018-11-10
12312323	1	2018-10-11
12312323	2	2018-10-11
\.


--
-- TOC entry 2049 (class 0 OID 27528)
-- Dependencies: 175
-- Data for Name: puedetener; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY puedetener (rut_guia, id_categoria) FROM stdin;
12312323	1
12312323	2
12312312	1
\.


--
-- TOC entry 2045 (class 0 OID 27493)
-- Dependencies: 171
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY region (id_region, nom_region) FROM stdin;
1	los maules
2	biobio
3	lagos
\.


--
-- TOC entry 2051 (class 0 OID 27546)
-- Dependencies: 177
-- Data for Name: tiene; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tiene (rut_guia, id_especialidad, tie_nivel) FROM stdin;
12312323	1	\N
12312323	2	\N
12312323	3	\N
\.


--
-- TOC entry 2044 (class 0 OID 27488)
-- Dependencies: 170
-- Data for Name: tour; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tour (id_tour, nom_tour, cost_tourind, cost_tourg, min_ptour) FROM stdin;
1	Escala	3000	2500	4
2	Zoologico	2000	3000	5
3	caleta	1000	2000	3
\.


--
-- TOC entry 2058 (class 0 OID 27620)
-- Dependencies: 184
-- Data for Name: turista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY turista (rut_turista, id_descuento, nom_turist, nom_tur_cont, tel_tur, fecha_nacimiento) FROM stdin;
12312313	1	marco	francisca	12321312	1991-10-10
12312312	1	francisca	adnres	2121312	1992-10-10
12312315	1	macarena	francisco	432321312	1993-10-10
\.


--
-- TOC entry 2056 (class 0 OID 27600)
-- Dependencies: 182
-- Data for Name: vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vehiculo (veh_patente, ar_rut, id_tour, veh_ano, veh_marca, veh_capacidad, nom_chofer, fecha_dev, precio_arriendo) FROM stdin;
xl2132	12321334	1	3012	nisan	4	2019-10-11	\N	\N
xl2133	12321335	1	3010	nissan	4	2019-12-12	\N	\N
xl2134	12321336	1	3009	nisssan	4	2019-11-11	\N	\N
\.


--
-- TOC entry 2054 (class 0 OID 27582)
-- Dependencies: 180
-- Data for Name: visita; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY visita (id_tour, id_lugar, fecha_llegada, hora_llegada, fecha_salida, hora_salida) FROM stdin;
1	1	2018-10-10	09:11:55	2018-11-11	09:11:55
1	1	2018-11-10	09:11:55	2018-12-11	09:11:54
1	1	2018-11-11	09:12:55	2018-12-11	09:11:55
\.


--
-- TOC entry 1908 (class 2606 OID 27599)
-- Name: arrendataria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY arrendataria
    ADD CONSTRAINT arrendataria_pkey PRIMARY KEY (ar_rut);


--
-- TOC entry 1900 (class 2606 OID 27517)
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 1898 (class 2606 OID 27502)
-- Name: ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id_ciudad);


--
-- TOC entry 1912 (class 2606 OID 27619)
-- Name: descuento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY descuento
    ADD CONSTRAINT descuento_pkey PRIMARY KEY (id_descuento);


--
-- TOC entry 1916 (class 2606 OID 27647)
-- Name: enfermedades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY enfermedades
    ADD CONSTRAINT enfermedades_pkey PRIMARY KEY (id_enfermedad);


--
-- TOC entry 1904 (class 2606 OID 27545)
-- Name: especialidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY especialidades
    ADD CONSTRAINT especialidades_pkey PRIMARY KEY (id_especialidad);


--
-- TOC entry 1902 (class 2606 OID 27522)
-- Name: guia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY guia
    ADD CONSTRAINT guia_pkey PRIMARY KEY (rut_guia);


--
-- TOC entry 1906 (class 2606 OID 27576)
-- Name: lugares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lugares
    ADD CONSTRAINT lugares_pkey PRIMARY KEY (id_lugar);


--
-- TOC entry 1896 (class 2606 OID 27497)
-- Name: region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id_region);


--
-- TOC entry 1894 (class 2606 OID 27492)
-- Name: tour_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT tour_pkey PRIMARY KEY (id_tour);


--
-- TOC entry 1914 (class 2606 OID 27624)
-- Name: turista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY turista
    ADD CONSTRAINT turista_pkey PRIMARY KEY (rut_turista);


--
-- TOC entry 1910 (class 2606 OID 27604)
-- Name: vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT vehiculo_pkey PRIMARY KEY (veh_patente);


--
-- TOC entry 1933 (class 2606 OID 27638)
-- Name: asiste_id_tour_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY asiste
    ADD CONSTRAINT asiste_id_tour_fkey FOREIGN KEY (id_tour) REFERENCES tour(id_tour);


--
-- TOC entry 1932 (class 2606 OID 27633)
-- Name: asiste_rut_turista_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY asiste
    ADD CONSTRAINT asiste_rut_turista_fkey FOREIGN KEY (rut_turista) REFERENCES turista(rut_turista);


--
-- TOC entry 1917 (class 2606 OID 27503)
-- Name: ciudad_id_region_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_id_region_fkey FOREIGN KEY (id_region) REFERENCES region(id_region);


--
-- TOC entry 1918 (class 2606 OID 27508)
-- Name: ciudad_id_tour_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_id_tour_fkey FOREIGN KEY (id_tour) REFERENCES tour(id_tour);


--
-- TOC entry 1919 (class 2606 OID 27523)
-- Name: guia_id_ciudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY guia
    ADD CONSTRAINT guia_id_ciudad_fkey FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad);


--
-- TOC entry 1926 (class 2606 OID 27577)
-- Name: lugares_id_ciudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lugares
    ADD CONSTRAINT lugares_id_ciudad_fkey FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad);


--
-- TOC entry 1934 (class 2606 OID 27651)
-- Name: padece_id_enfermedad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY padece
    ADD CONSTRAINT padece_id_enfermedad_fkey FOREIGN KEY (id_enfermedad) REFERENCES enfermedades(id_enfermedad);


--
-- TOC entry 1935 (class 2606 OID 27656)
-- Name: padece_rut_turista_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY padece
    ADD CONSTRAINT padece_rut_turista_fkey FOREIGN KEY (rut_turista) REFERENCES turista(rut_turista);


--
-- TOC entry 1925 (class 2606 OID 27567)
-- Name: poseen_id_tour_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY poseen
    ADD CONSTRAINT poseen_id_tour_fkey FOREIGN KEY (id_tour) REFERENCES tour(id_tour);


--
-- TOC entry 1924 (class 2606 OID 27562)
-- Name: poseen_rut_guia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY poseen
    ADD CONSTRAINT poseen_rut_guia_fkey FOREIGN KEY (rut_guia) REFERENCES guia(rut_guia);


--
-- TOC entry 1921 (class 2606 OID 27536)
-- Name: puedetener_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY puedetener
    ADD CONSTRAINT puedetener_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria);


--
-- TOC entry 1920 (class 2606 OID 27531)
-- Name: puedetener_rut_guia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY puedetener
    ADD CONSTRAINT puedetener_rut_guia_fkey FOREIGN KEY (rut_guia) REFERENCES guia(rut_guia);


--
-- TOC entry 1923 (class 2606 OID 27554)
-- Name: tiene_id_especialidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tiene
    ADD CONSTRAINT tiene_id_especialidad_fkey FOREIGN KEY (id_especialidad) REFERENCES especialidades(id_especialidad);


--
-- TOC entry 1922 (class 2606 OID 27549)
-- Name: tiene_rut_guia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tiene
    ADD CONSTRAINT tiene_rut_guia_fkey FOREIGN KEY (rut_guia) REFERENCES guia(rut_guia);


--
-- TOC entry 1931 (class 2606 OID 27625)
-- Name: turista_id_descuento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY turista
    ADD CONSTRAINT turista_id_descuento_fkey FOREIGN KEY (id_descuento) REFERENCES descuento(id_descuento);


--
-- TOC entry 1929 (class 2606 OID 27605)
-- Name: vehiculo_ar_rut_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT vehiculo_ar_rut_fkey FOREIGN KEY (ar_rut) REFERENCES arrendataria(ar_rut);


--
-- TOC entry 1930 (class 2606 OID 27610)
-- Name: vehiculo_id_tour_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT vehiculo_id_tour_fkey FOREIGN KEY (id_tour) REFERENCES tour(id_tour);


--
-- TOC entry 1928 (class 2606 OID 27590)
-- Name: visita_id_lugar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visita
    ADD CONSTRAINT visita_id_lugar_fkey FOREIGN KEY (id_lugar) REFERENCES lugares(id_lugar);


--
-- TOC entry 1927 (class 2606 OID 27585)
-- Name: visita_id_tour_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visita
    ADD CONSTRAINT visita_id_tour_fkey FOREIGN KEY (id_tour) REFERENCES tour(id_tour);


--
-- TOC entry 2068 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-01-10 23:26:17

--
-- PostgreSQL database dump complete
--

