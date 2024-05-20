-- Database: crowdfunding_db

-- DROP DATABASE IF EXISTS crowdfunding_db;

CREATE DATABASE crowdfunding_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Table: public.Campaign

-- DROP TABLE IF EXISTS public."Campaign";

CREATE TABLE IF NOT EXISTS public."Campaign"
(
    cf_id integer NOT NULL,
    contact_id integer,
    company_name character varying(50) COLLATE pg_catalog."default",
    description character varying(75) COLLATE pg_catalog."default",
    goal money,
    pledged money,
    outcome character varying(30) COLLATE pg_catalog."default",
    backers_count integer,
    country character varying(5) COLLATE pg_catalog."default",
    currency character varying(5) COLLATE pg_catalog."default",
    launched_date date,
    end_date date,
    category_id character varying(5) COLLATE pg_catalog."default",
    subcategory_id character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT "Campaign_pkey" PRIMARY KEY (cf_id)
    CONSTRAINT category_id FOREIGN KEY (category_id)
        REFERENCES public.category (category_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT contact_id FOREIGN KEY (contact_id)
        REFERENCES public.contacts (contact_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT subcategory_id FOREIGN KEY (subcategory_id)
        REFERENCES public.subcategory (subcategory_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Campaign"
    OWNER to postgres;

-- Table: public.category

-- DROP TABLE IF EXISTS public.category;

CREATE TABLE IF NOT EXISTS public.category
(
    category_id character varying(5) COLLATE pg_catalog."default" NOT NULL,
    category character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT category_pkey PRIMARY KEY (category_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.category
    OWNER to postgres;

-- Table: public.contacts

-- DROP TABLE IF EXISTS public.contacts;

CREATE TABLE IF NOT EXISTS public.contacts
(
    contact_id integer NOT NULL,
    first_name character varying(20) COLLATE pg_catalog."default",
    last_name character varying(20) COLLATE pg_catalog."default",
    email character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT contacts_pkey PRIMARY KEY (contact_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.contacts
    OWNER to postgres;

-- Table: public.subcategory

-- DROP TABLE IF EXISTS public.subcategory;

CREATE TABLE IF NOT EXISTS public.subcategory
(
    subcategory_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    subcategory character varying(25) COLLATE pg_catalog."default",
    CONSTRAINT subcategory_pkey PRIMARY KEY (subcategory_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.subcategory
    OWNER to postgres;