-- Database: vet_clinic

CREATE TABLE IF NOT EXISTS public.animals
(
    id integer,
    name character varying(100) COLLATE pg_catalog."default",
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric(5,2)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;
