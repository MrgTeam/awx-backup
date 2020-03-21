--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE awx;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5dd7bffd66569c27ecec540e1cd523f9a';






--
-- Database creation
--

CREATE DATABASE awx WITH TEMPLATE = template0 OWNER = postgres;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect awx

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Debian 10.12-2.pgdg90+1)
-- Dumped by pg_dump version 10.12 (Debian 10.12-2.pgdg90+1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: conf_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_setting (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    key character varying(255) NOT NULL,
    value text,
    user_id integer
);


ALTER TABLE public.conf_setting OWNER TO postgres;

--
-- Name: conf_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_setting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_setting_id_seq OWNER TO postgres;

--
-- Name: conf_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conf_setting_id_seq OWNED BY public.conf_setting.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: main_activitystream; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream (
    id integer NOT NULL,
    operation character varying(13) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    changes text NOT NULL,
    object_relationship_type text NOT NULL,
    object1 text NOT NULL,
    object2 text NOT NULL,
    actor_id integer,
    setting text NOT NULL,
    deleted_actor text,
    action_node character varying(512) NOT NULL
);


ALTER TABLE public.main_activitystream OWNER TO postgres;

--
-- Name: main_activitystream_ad_hoc_command; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_ad_hoc_command (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    adhoccommand_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_ad_hoc_command OWNER TO postgres;

--
-- Name: main_activitystream_ad_hoc_command_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_ad_hoc_command_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_ad_hoc_command_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_ad_hoc_command_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_ad_hoc_command_id_seq OWNED BY public.main_activitystream_ad_hoc_command.id;


--
-- Name: main_activitystream_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_credential (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    credential_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_credential OWNER TO postgres;

--
-- Name: main_activitystream_credential_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_credential_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_credential_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_credential_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_credential_id_seq OWNED BY public.main_activitystream_credential.id;


--
-- Name: main_activitystream_credential_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_credential_type (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    credentialtype_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_credential_type OWNER TO postgres;

--
-- Name: main_activitystream_credential_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_credential_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_credential_type_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_credential_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_credential_type_id_seq OWNED BY public.main_activitystream_credential_type.id;


--
-- Name: main_activitystream_custom_inventory_script; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_custom_inventory_script (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    custominventoryscript_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_custom_inventory_script OWNER TO postgres;

--
-- Name: main_activitystream_custom_inventory_script_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_custom_inventory_script_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_custom_inventory_script_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_custom_inventory_script_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_custom_inventory_script_id_seq OWNED BY public.main_activitystream_custom_inventory_script.id;


--
-- Name: main_activitystream_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_group (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_group OWNER TO postgres;

--
-- Name: main_activitystream_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_group_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_group_id_seq OWNED BY public.main_activitystream_group.id;


--
-- Name: main_activitystream_host; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_host (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    host_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_host OWNER TO postgres;

--
-- Name: main_activitystream_host_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_host_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_host_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_host_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_host_id_seq OWNED BY public.main_activitystream_host.id;


--
-- Name: main_activitystream_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_id_seq OWNED BY public.main_activitystream.id;


--
-- Name: main_activitystream_instance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_instance (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    instance_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_instance OWNER TO postgres;

--
-- Name: main_activitystream_instance_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_instance_group (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    instancegroup_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_instance_group OWNER TO postgres;

--
-- Name: main_activitystream_instance_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_instance_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_instance_group_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_instance_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_instance_group_id_seq OWNED BY public.main_activitystream_instance_group.id;


--
-- Name: main_activitystream_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_instance_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_instance_id_seq OWNED BY public.main_activitystream_instance.id;


--
-- Name: main_activitystream_inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_inventory (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    inventory_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_inventory OWNER TO postgres;

--
-- Name: main_activitystream_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_inventory_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_inventory_id_seq OWNED BY public.main_activitystream_inventory.id;


--
-- Name: main_activitystream_inventory_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_inventory_source (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    inventorysource_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_inventory_source OWNER TO postgres;

--
-- Name: main_activitystream_inventory_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_inventory_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_inventory_source_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_inventory_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_inventory_source_id_seq OWNED BY public.main_activitystream_inventory_source.id;


--
-- Name: main_activitystream_inventory_update; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_inventory_update (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    inventoryupdate_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_inventory_update OWNER TO postgres;

--
-- Name: main_activitystream_inventory_update_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_inventory_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_inventory_update_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_inventory_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_inventory_update_id_seq OWNED BY public.main_activitystream_inventory_update.id;


--
-- Name: main_activitystream_job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_job (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    job_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_job OWNER TO postgres;

--
-- Name: main_activitystream_job_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_job_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_job_id_seq OWNED BY public.main_activitystream_job.id;


--
-- Name: main_activitystream_job_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_job_template (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    jobtemplate_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_job_template OWNER TO postgres;

--
-- Name: main_activitystream_job_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_job_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_job_template_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_job_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_job_template_id_seq OWNED BY public.main_activitystream_job_template.id;


--
-- Name: main_activitystream_label; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_label (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    label_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_label OWNER TO postgres;

--
-- Name: main_activitystream_label_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_label_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_label_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_label_id_seq OWNED BY public.main_activitystream_label.id;


--
-- Name: main_activitystream_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_notification (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    notification_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_notification OWNER TO postgres;

--
-- Name: main_activitystream_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_notification_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_notification_id_seq OWNED BY public.main_activitystream_notification.id;


--
-- Name: main_activitystream_notification_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_notification_template (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_notification_template OWNER TO postgres;

--
-- Name: main_activitystream_notification_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_notification_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_notification_template_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_notification_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_notification_template_id_seq OWNED BY public.main_activitystream_notification_template.id;


--
-- Name: main_activitystream_o_auth2_access_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_o_auth2_access_token (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    oauth2accesstoken_id bigint NOT NULL
);


ALTER TABLE public.main_activitystream_o_auth2_access_token OWNER TO postgres;

--
-- Name: main_activitystream_o_auth2_access_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_o_auth2_access_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_o_auth2_access_token_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_o_auth2_access_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_o_auth2_access_token_id_seq OWNED BY public.main_activitystream_o_auth2_access_token.id;


--
-- Name: main_activitystream_o_auth2_application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_o_auth2_application (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    oauth2application_id bigint NOT NULL
);


ALTER TABLE public.main_activitystream_o_auth2_application OWNER TO postgres;

--
-- Name: main_activitystream_o_auth2_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_o_auth2_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_o_auth2_application_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_o_auth2_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_o_auth2_application_id_seq OWNED BY public.main_activitystream_o_auth2_application.id;


--
-- Name: main_activitystream_organization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_organization (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    organization_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_organization OWNER TO postgres;

--
-- Name: main_activitystream_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_organization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_organization_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_organization_id_seq OWNED BY public.main_activitystream_organization.id;


--
-- Name: main_activitystream_project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_project (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_project OWNER TO postgres;

--
-- Name: main_activitystream_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_project_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_project_id_seq OWNED BY public.main_activitystream_project.id;


--
-- Name: main_activitystream_project_update; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_project_update (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    projectupdate_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_project_update OWNER TO postgres;

--
-- Name: main_activitystream_project_update_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_project_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_project_update_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_project_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_project_update_id_seq OWNED BY public.main_activitystream_project_update.id;


--
-- Name: main_activitystream_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_role (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_role OWNER TO postgres;

--
-- Name: main_activitystream_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_role_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_role_id_seq OWNED BY public.main_activitystream_role.id;


--
-- Name: main_activitystream_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_schedule (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    schedule_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_schedule OWNER TO postgres;

--
-- Name: main_activitystream_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_schedule_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_schedule_id_seq OWNED BY public.main_activitystream_schedule.id;


--
-- Name: main_activitystream_team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_team (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_team OWNER TO postgres;

--
-- Name: main_activitystream_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_team_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_team_id_seq OWNED BY public.main_activitystream_team.id;


--
-- Name: main_activitystream_unified_job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_unified_job (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    unifiedjob_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_unified_job OWNER TO postgres;

--
-- Name: main_activitystream_unified_job_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_unified_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_unified_job_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_unified_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_unified_job_id_seq OWNED BY public.main_activitystream_unified_job.id;


--
-- Name: main_activitystream_unified_job_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_unified_job_template (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    unifiedjobtemplate_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_unified_job_template OWNER TO postgres;

--
-- Name: main_activitystream_unified_job_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_unified_job_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_unified_job_template_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_unified_job_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_unified_job_template_id_seq OWNED BY public.main_activitystream_unified_job_template.id;


--
-- Name: main_activitystream_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_user (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_user OWNER TO postgres;

--
-- Name: main_activitystream_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_user_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_user_id_seq OWNED BY public.main_activitystream_user.id;


--
-- Name: main_activitystream_workflow_approval; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_workflow_approval (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    workflowapproval_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_workflow_approval OWNER TO postgres;

--
-- Name: main_activitystream_workflow_approval_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_workflow_approval_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_workflow_approval_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_workflow_approval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_workflow_approval_id_seq OWNED BY public.main_activitystream_workflow_approval.id;


--
-- Name: main_activitystream_workflow_approval_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_workflow_approval_template (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    workflowapprovaltemplate_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_workflow_approval_template OWNER TO postgres;

--
-- Name: main_activitystream_workflow_approval_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_workflow_approval_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_workflow_approval_template_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_workflow_approval_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_workflow_approval_template_id_seq OWNED BY public.main_activitystream_workflow_approval_template.id;


--
-- Name: main_activitystream_workflow_job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_workflow_job (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    workflowjob_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_workflow_job OWNER TO postgres;

--
-- Name: main_activitystream_workflow_job_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_workflow_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_workflow_job_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_workflow_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_workflow_job_id_seq OWNED BY public.main_activitystream_workflow_job.id;


--
-- Name: main_activitystream_workflow_job_node; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_workflow_job_node (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    workflowjobnode_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_workflow_job_node OWNER TO postgres;

--
-- Name: main_activitystream_workflow_job_node_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_workflow_job_node_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_workflow_job_node_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_workflow_job_node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_workflow_job_node_id_seq OWNED BY public.main_activitystream_workflow_job_node.id;


--
-- Name: main_activitystream_workflow_job_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_workflow_job_template (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    workflowjobtemplate_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_workflow_job_template OWNER TO postgres;

--
-- Name: main_activitystream_workflow_job_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_workflow_job_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_workflow_job_template_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_workflow_job_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_workflow_job_template_id_seq OWNED BY public.main_activitystream_workflow_job_template.id;


--
-- Name: main_activitystream_workflow_job_template_node; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_activitystream_workflow_job_template_node (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    workflowjobtemplatenode_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_workflow_job_template_node OWNER TO postgres;

--
-- Name: main_activitystream_workflow_job_template_node_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_activitystream_workflow_job_template_node_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_workflow_job_template_node_id_seq OWNER TO postgres;

--
-- Name: main_activitystream_workflow_job_template_node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_activitystream_workflow_job_template_node_id_seq OWNED BY public.main_activitystream_workflow_job_template_node.id;


--
-- Name: main_adhoccommand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_adhoccommand (
    unifiedjob_ptr_id integer NOT NULL,
    job_type character varying(64) NOT NULL,
    "limit" text NOT NULL,
    module_name character varying(1024) NOT NULL,
    module_args text NOT NULL,
    forks integer NOT NULL,
    verbosity integer NOT NULL,
    become_enabled boolean NOT NULL,
    credential_id integer,
    inventory_id integer,
    extra_vars text NOT NULL,
    diff_mode boolean NOT NULL,
    CONSTRAINT main_adhoccommand_forks_check CHECK ((forks >= 0)),
    CONSTRAINT main_adhoccommand_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_adhoccommand OWNER TO postgres;

--
-- Name: main_adhoccommandevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_adhoccommandevent (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    host_name character varying(1024) NOT NULL,
    event character varying(100) NOT NULL,
    event_data text NOT NULL,
    failed boolean NOT NULL,
    changed boolean NOT NULL,
    counter integer NOT NULL,
    host_id integer,
    ad_hoc_command_id integer NOT NULL,
    end_line integer NOT NULL,
    start_line integer NOT NULL,
    stdout text NOT NULL,
    uuid character varying(1024) NOT NULL,
    verbosity integer NOT NULL,
    CONSTRAINT main_adhoccommandevent_counter_check CHECK ((counter >= 0)),
    CONSTRAINT main_adhoccommandevent_end_line_check CHECK ((end_line >= 0)),
    CONSTRAINT main_adhoccommandevent_start_line_check CHECK ((start_line >= 0)),
    CONSTRAINT main_adhoccommandevent_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_adhoccommandevent OWNER TO postgres;

--
-- Name: main_adhoccommandevent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_adhoccommandevent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_adhoccommandevent_id_seq OWNER TO postgres;

--
-- Name: main_adhoccommandevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_adhoccommandevent_id_seq OWNED BY public.main_adhoccommandevent.id;


--
-- Name: main_channelgroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_channelgroup (
    id integer NOT NULL,
    "group" character varying(200) NOT NULL,
    channels text NOT NULL
);


ALTER TABLE public.main_channelgroup OWNER TO postgres;

--
-- Name: main_channelgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_channelgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_channelgroup_id_seq OWNER TO postgres;

--
-- Name: main_channelgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_channelgroup_id_seq OWNED BY public.main_channelgroup.id;


--
-- Name: main_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_credential (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    organization_id integer,
    admin_role_id integer,
    use_role_id integer,
    read_role_id integer,
    inputs jsonb NOT NULL,
    credential_type_id integer NOT NULL
);


ALTER TABLE public.main_credential OWNER TO postgres;

--
-- Name: main_credential_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_credential_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_credential_id_seq OWNER TO postgres;

--
-- Name: main_credential_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_credential_id_seq OWNED BY public.main_credential.id;


--
-- Name: main_credentialinputsource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_credentialinputsource (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    input_field_name character varying(1024) NOT NULL,
    metadata jsonb NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    source_credential_id integer,
    target_credential_id integer
);


ALTER TABLE public.main_credentialinputsource OWNER TO postgres;

--
-- Name: main_credentialinputsource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_credentialinputsource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_credentialinputsource_id_seq OWNER TO postgres;

--
-- Name: main_credentialinputsource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_credentialinputsource_id_seq OWNED BY public.main_credentialinputsource.id;


--
-- Name: main_credentialtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_credentialtype (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    kind character varying(32) NOT NULL,
    managed_by_tower boolean NOT NULL,
    inputs jsonb NOT NULL,
    injectors jsonb NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    namespace character varying(1024)
);


ALTER TABLE public.main_credentialtype OWNER TO postgres;

--
-- Name: main_credentialtype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_credentialtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_credentialtype_id_seq OWNER TO postgres;

--
-- Name: main_credentialtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_credentialtype_id_seq OWNED BY public.main_credentialtype.id;


--
-- Name: main_custominventoryscript; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_custominventoryscript (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    script text NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    organization_id integer,
    admin_role_id integer,
    read_role_id integer
);


ALTER TABLE public.main_custominventoryscript OWNER TO postgres;

--
-- Name: main_custominventoryscript_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_custominventoryscript_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_custominventoryscript_id_seq OWNER TO postgres;

--
-- Name: main_custominventoryscript_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_custominventoryscript_id_seq OWNED BY public.main_custominventoryscript.id;


--
-- Name: main_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_group (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    variables text NOT NULL,
    created_by_id integer,
    inventory_id integer NOT NULL,
    modified_by_id integer
);


ALTER TABLE public.main_group OWNER TO postgres;

--
-- Name: main_group_hosts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_group_hosts (
    id integer NOT NULL,
    group_id integer NOT NULL,
    host_id integer NOT NULL
);


ALTER TABLE public.main_group_hosts OWNER TO postgres;

--
-- Name: main_group_hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_group_hosts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_group_hosts_id_seq OWNER TO postgres;

--
-- Name: main_group_hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_group_hosts_id_seq OWNED BY public.main_group_hosts.id;


--
-- Name: main_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_group_id_seq OWNER TO postgres;

--
-- Name: main_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_group_id_seq OWNED BY public.main_group.id;


--
-- Name: main_group_inventory_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_group_inventory_sources (
    id integer NOT NULL,
    group_id integer NOT NULL,
    inventorysource_id integer NOT NULL
);


ALTER TABLE public.main_group_inventory_sources OWNER TO postgres;

--
-- Name: main_group_inventory_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_group_inventory_sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_group_inventory_sources_id_seq OWNER TO postgres;

--
-- Name: main_group_inventory_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_group_inventory_sources_id_seq OWNED BY public.main_group_inventory_sources.id;


--
-- Name: main_group_parents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_group_parents (
    id integer NOT NULL,
    from_group_id integer NOT NULL,
    to_group_id integer NOT NULL
);


ALTER TABLE public.main_group_parents OWNER TO postgres;

--
-- Name: main_group_parents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_group_parents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_group_parents_id_seq OWNER TO postgres;

--
-- Name: main_group_parents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_group_parents_id_seq OWNED BY public.main_group_parents.id;


--
-- Name: main_host; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_host (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    enabled boolean NOT NULL,
    instance_id character varying(1024) NOT NULL,
    variables text NOT NULL,
    created_by_id integer,
    inventory_id integer NOT NULL,
    last_job_host_summary_id integer,
    modified_by_id integer,
    last_job_id integer,
    ansible_facts jsonb NOT NULL,
    ansible_facts_modified timestamp with time zone,
    insights_system_id text
);


ALTER TABLE public.main_host OWNER TO postgres;

--
-- Name: main_host_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_host_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_host_id_seq OWNER TO postgres;

--
-- Name: main_host_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_host_id_seq OWNED BY public.main_host.id;


--
-- Name: main_host_inventory_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_host_inventory_sources (
    id integer NOT NULL,
    host_id integer NOT NULL,
    inventorysource_id integer NOT NULL
);


ALTER TABLE public.main_host_inventory_sources OWNER TO postgres;

--
-- Name: main_host_inventory_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_host_inventory_sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_host_inventory_sources_id_seq OWNER TO postgres;

--
-- Name: main_host_inventory_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_host_inventory_sources_id_seq OWNED BY public.main_host_inventory_sources.id;


--
-- Name: main_instance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_instance (
    id integer NOT NULL,
    uuid character varying(40) NOT NULL,
    hostname character varying(250) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    capacity integer NOT NULL,
    version character varying(120) NOT NULL,
    last_isolated_check timestamp with time zone,
    capacity_adjustment numeric(3,2) NOT NULL,
    cpu integer NOT NULL,
    memory bigint NOT NULL,
    cpu_capacity integer NOT NULL,
    mem_capacity integer NOT NULL,
    enabled boolean NOT NULL,
    managed_by_policy boolean NOT NULL,
    CONSTRAINT main_instance_capacity_check CHECK ((capacity >= 0))
);


ALTER TABLE public.main_instance OWNER TO postgres;

--
-- Name: main_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_instance_id_seq OWNER TO postgres;

--
-- Name: main_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_instance_id_seq OWNED BY public.main_instance.id;


--
-- Name: main_instancegroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_instancegroup (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    controller_id integer,
    policy_instance_list text NOT NULL,
    policy_instance_minimum integer NOT NULL,
    policy_instance_percentage integer NOT NULL,
    credential_id integer,
    pod_spec_override text NOT NULL
);


ALTER TABLE public.main_instancegroup OWNER TO postgres;

--
-- Name: main_instancegroup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_instancegroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_instancegroup_id_seq OWNER TO postgres;

--
-- Name: main_instancegroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_instancegroup_id_seq OWNED BY public.main_instancegroup.id;


--
-- Name: main_instancegroup_instances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_instancegroup_instances (
    id integer NOT NULL,
    instancegroup_id integer NOT NULL,
    instance_id integer NOT NULL
);


ALTER TABLE public.main_instancegroup_instances OWNER TO postgres;

--
-- Name: main_instancegroup_instances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_instancegroup_instances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_instancegroup_instances_id_seq OWNER TO postgres;

--
-- Name: main_instancegroup_instances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_instancegroup_instances_id_seq OWNED BY public.main_instancegroup_instances.id;


--
-- Name: main_inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_inventory (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    variables text NOT NULL,
    has_active_failures boolean NOT NULL,
    total_hosts integer NOT NULL,
    hosts_with_active_failures integer NOT NULL,
    total_groups integer NOT NULL,
    has_inventory_sources boolean NOT NULL,
    total_inventory_sources integer NOT NULL,
    inventory_sources_with_failures integer NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    organization_id integer,
    admin_role_id integer,
    adhoc_role_id integer,
    update_role_id integer,
    use_role_id integer,
    read_role_id integer,
    host_filter text,
    kind character varying(32) NOT NULL,
    pending_deletion boolean NOT NULL,
    insights_credential_id integer,
    CONSTRAINT main_inventory_hosts_with_active_failures_check CHECK ((hosts_with_active_failures >= 0)),
    CONSTRAINT main_inventory_inventory_sources_with_failures_check CHECK ((inventory_sources_with_failures >= 0)),
    CONSTRAINT main_inventory_total_groups_check CHECK ((total_groups >= 0)),
    CONSTRAINT main_inventory_total_hosts_check CHECK ((total_hosts >= 0)),
    CONSTRAINT main_inventory_total_inventory_sources_check CHECK ((total_inventory_sources >= 0))
);


ALTER TABLE public.main_inventory OWNER TO postgres;

--
-- Name: main_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_inventory_id_seq OWNER TO postgres;

--
-- Name: main_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_inventory_id_seq OWNED BY public.main_inventory.id;


--
-- Name: main_inventoryinstancegroupmembership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_inventoryinstancegroupmembership (
    id integer NOT NULL,
    "position" integer,
    instancegroup_id integer NOT NULL,
    inventory_id integer NOT NULL,
    CONSTRAINT main_inventoryinstancegroupmembership_position_check CHECK (("position" >= 0))
);


ALTER TABLE public.main_inventoryinstancegroupmembership OWNER TO postgres;

--
-- Name: main_inventoryinstancegroupmembership_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_inventoryinstancegroupmembership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_inventoryinstancegroupmembership_id_seq OWNER TO postgres;

--
-- Name: main_inventoryinstancegroupmembership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_inventoryinstancegroupmembership_id_seq OWNED BY public.main_inventoryinstancegroupmembership.id;


--
-- Name: main_inventorysource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_inventorysource (
    unifiedjobtemplate_ptr_id integer NOT NULL,
    source character varying(32) NOT NULL,
    source_path character varying(1024) NOT NULL,
    source_vars text NOT NULL,
    source_regions character varying(1024) NOT NULL,
    instance_filters character varying(1024) NOT NULL,
    group_by character varying(1024) NOT NULL,
    overwrite boolean NOT NULL,
    overwrite_vars boolean NOT NULL,
    update_on_launch boolean NOT NULL,
    update_cache_timeout integer NOT NULL,
    deprecated_group_id integer,
    inventory_id integer,
    source_script_id integer,
    timeout integer NOT NULL,
    scm_last_revision character varying(1024) NOT NULL,
    source_project_id integer,
    update_on_project_update boolean NOT NULL,
    verbosity integer NOT NULL,
    custom_virtualenv character varying(100),
    CONSTRAINT main_inventorysource_update_cache_timeout_check CHECK ((update_cache_timeout >= 0)),
    CONSTRAINT main_inventorysource_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_inventorysource OWNER TO postgres;

--
-- Name: main_inventoryupdate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_inventoryupdate (
    unifiedjob_ptr_id integer NOT NULL,
    source character varying(32) NOT NULL,
    source_path character varying(1024) NOT NULL,
    source_vars text NOT NULL,
    source_regions character varying(1024) NOT NULL,
    instance_filters character varying(1024) NOT NULL,
    group_by character varying(1024) NOT NULL,
    overwrite boolean NOT NULL,
    overwrite_vars boolean NOT NULL,
    license_error boolean NOT NULL,
    inventory_source_id integer NOT NULL,
    source_script_id integer,
    timeout integer NOT NULL,
    source_project_update_id integer,
    verbosity integer NOT NULL,
    inventory_id integer,
    custom_virtualenv character varying(100),
    org_host_limit_error boolean NOT NULL,
    CONSTRAINT main_inventoryupdate_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_inventoryupdate OWNER TO postgres;

--
-- Name: main_inventoryupdateevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_inventoryupdateevent (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    event_data text NOT NULL,
    uuid character varying(1024) NOT NULL,
    counter integer NOT NULL,
    stdout text NOT NULL,
    verbosity integer NOT NULL,
    start_line integer NOT NULL,
    end_line integer NOT NULL,
    inventory_update_id integer NOT NULL,
    CONSTRAINT main_inventoryupdateevent_counter_check CHECK ((counter >= 0)),
    CONSTRAINT main_inventoryupdateevent_end_line_check CHECK ((end_line >= 0)),
    CONSTRAINT main_inventoryupdateevent_start_line_check CHECK ((start_line >= 0)),
    CONSTRAINT main_inventoryupdateevent_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_inventoryupdateevent OWNER TO postgres;

--
-- Name: main_inventoryupdateevent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_inventoryupdateevent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_inventoryupdateevent_id_seq OWNER TO postgres;

--
-- Name: main_inventoryupdateevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_inventoryupdateevent_id_seq OWNED BY public.main_inventoryupdateevent.id;


--
-- Name: main_job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_job (
    unifiedjob_ptr_id integer NOT NULL,
    job_type character varying(64) NOT NULL,
    playbook character varying(1024) NOT NULL,
    forks integer NOT NULL,
    "limit" text NOT NULL,
    verbosity integer NOT NULL,
    extra_vars text NOT NULL,
    job_tags character varying(1024) NOT NULL,
    force_handlers boolean NOT NULL,
    skip_tags character varying(1024) NOT NULL,
    start_at_task character varying(1024) NOT NULL,
    become_enabled boolean NOT NULL,
    inventory_id integer,
    job_template_id integer,
    project_id integer,
    survey_passwords text NOT NULL,
    allow_simultaneous boolean NOT NULL,
    artifacts text NOT NULL,
    timeout integer NOT NULL,
    scm_revision character varying(1024) NOT NULL,
    project_update_id integer,
    use_fact_cache boolean NOT NULL,
    diff_mode boolean NOT NULL,
    job_slice_count integer NOT NULL,
    job_slice_number integer NOT NULL,
    custom_virtualenv character varying(100),
    scm_branch character varying(1024) NOT NULL,
    webhook_credential_id integer,
    webhook_guid character varying(128) NOT NULL,
    webhook_service character varying(16) NOT NULL,
    CONSTRAINT main_job_forks_check CHECK ((forks >= 0)),
    CONSTRAINT main_job_job_slice_count_check CHECK ((job_slice_count >= 0)),
    CONSTRAINT main_job_job_slice_number_check CHECK ((job_slice_number >= 0)),
    CONSTRAINT main_job_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_job OWNER TO postgres;

--
-- Name: main_jobevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_jobevent (
    id integer NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone NOT NULL,
    event character varying(100) NOT NULL,
    event_data text NOT NULL,
    failed boolean NOT NULL,
    changed boolean NOT NULL,
    host_name character varying(1024) NOT NULL,
    play character varying(1024) NOT NULL,
    role character varying(1024) NOT NULL,
    task character varying(1024) NOT NULL,
    counter integer NOT NULL,
    host_id integer,
    job_id integer NOT NULL,
    uuid character varying(1024) NOT NULL,
    parent_uuid character varying(1024) NOT NULL,
    end_line integer NOT NULL,
    playbook character varying(1024) NOT NULL,
    start_line integer NOT NULL,
    stdout text NOT NULL,
    verbosity integer NOT NULL,
    CONSTRAINT main_jobevent_counter_check CHECK ((counter >= 0)),
    CONSTRAINT main_jobevent_end_line_check CHECK ((end_line >= 0)),
    CONSTRAINT main_jobevent_start_line_check CHECK ((start_line >= 0)),
    CONSTRAINT main_jobevent_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_jobevent OWNER TO postgres;

--
-- Name: main_jobevent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_jobevent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_jobevent_id_seq OWNER TO postgres;

--
-- Name: main_jobevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_jobevent_id_seq OWNED BY public.main_jobevent.id;


--
-- Name: main_jobhostsummary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_jobhostsummary (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    host_name character varying(1024) NOT NULL,
    changed integer NOT NULL,
    dark integer NOT NULL,
    failures integer NOT NULL,
    ok integer NOT NULL,
    processed integer NOT NULL,
    skipped integer NOT NULL,
    failed boolean NOT NULL,
    host_id integer,
    job_id integer NOT NULL,
    ignored integer NOT NULL,
    rescued integer NOT NULL,
    CONSTRAINT main_jobhostsummary_changed_check CHECK ((changed >= 0)),
    CONSTRAINT main_jobhostsummary_dark_check CHECK ((dark >= 0)),
    CONSTRAINT main_jobhostsummary_failures_check CHECK ((failures >= 0)),
    CONSTRAINT main_jobhostsummary_ignored_check CHECK ((ignored >= 0)),
    CONSTRAINT main_jobhostsummary_ok_check CHECK ((ok >= 0)),
    CONSTRAINT main_jobhostsummary_processed_check CHECK ((processed >= 0)),
    CONSTRAINT main_jobhostsummary_rescued_check CHECK ((rescued >= 0)),
    CONSTRAINT main_jobhostsummary_skipped_check CHECK ((skipped >= 0))
);


ALTER TABLE public.main_jobhostsummary OWNER TO postgres;

--
-- Name: main_jobhostsummary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_jobhostsummary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_jobhostsummary_id_seq OWNER TO postgres;

--
-- Name: main_jobhostsummary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_jobhostsummary_id_seq OWNED BY public.main_jobhostsummary.id;


--
-- Name: main_joblaunchconfig; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_joblaunchconfig (
    id integer NOT NULL,
    extra_data text NOT NULL,
    survey_passwords text NOT NULL,
    char_prompts text NOT NULL,
    inventory_id integer,
    job_id integer NOT NULL
);


ALTER TABLE public.main_joblaunchconfig OWNER TO postgres;

--
-- Name: main_joblaunchconfig_credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_joblaunchconfig_credentials (
    id integer NOT NULL,
    joblaunchconfig_id integer NOT NULL,
    credential_id integer NOT NULL
);


ALTER TABLE public.main_joblaunchconfig_credentials OWNER TO postgres;

--
-- Name: main_joblaunchconfig_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_joblaunchconfig_credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_joblaunchconfig_credentials_id_seq OWNER TO postgres;

--
-- Name: main_joblaunchconfig_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_joblaunchconfig_credentials_id_seq OWNED BY public.main_joblaunchconfig_credentials.id;


--
-- Name: main_joblaunchconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_joblaunchconfig_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_joblaunchconfig_id_seq OWNER TO postgres;

--
-- Name: main_joblaunchconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_joblaunchconfig_id_seq OWNED BY public.main_joblaunchconfig.id;


--
-- Name: main_jobtemplate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_jobtemplate (
    unifiedjobtemplate_ptr_id integer NOT NULL,
    job_type character varying(64) NOT NULL,
    playbook character varying(1024) NOT NULL,
    forks integer NOT NULL,
    "limit" text NOT NULL,
    verbosity integer NOT NULL,
    extra_vars text NOT NULL,
    job_tags character varying(1024) NOT NULL,
    force_handlers boolean NOT NULL,
    skip_tags character varying(1024) NOT NULL,
    start_at_task character varying(1024) NOT NULL,
    become_enabled boolean NOT NULL,
    host_config_key character varying(1024) NOT NULL,
    ask_variables_on_launch boolean NOT NULL,
    survey_enabled boolean NOT NULL,
    survey_spec text NOT NULL,
    inventory_id integer,
    project_id integer,
    admin_role_id integer,
    execute_role_id integer,
    read_role_id integer,
    ask_limit_on_launch boolean NOT NULL,
    ask_inventory_on_launch boolean NOT NULL,
    ask_credential_on_launch boolean NOT NULL,
    ask_job_type_on_launch boolean NOT NULL,
    ask_tags_on_launch boolean NOT NULL,
    allow_simultaneous boolean NOT NULL,
    ask_skip_tags_on_launch boolean NOT NULL,
    timeout integer NOT NULL,
    use_fact_cache boolean NOT NULL,
    ask_verbosity_on_launch boolean NOT NULL,
    ask_diff_mode_on_launch boolean NOT NULL,
    diff_mode boolean NOT NULL,
    custom_virtualenv character varying(100),
    job_slice_count integer NOT NULL,
    ask_scm_branch_on_launch boolean NOT NULL,
    scm_branch character varying(1024) NOT NULL,
    webhook_credential_id integer,
    webhook_key character varying(64) NOT NULL,
    webhook_service character varying(16) NOT NULL,
    CONSTRAINT main_jobtemplate_forks_check CHECK ((forks >= 0)),
    CONSTRAINT main_jobtemplate_job_slice_count_check CHECK ((job_slice_count >= 0)),
    CONSTRAINT main_jobtemplate_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_jobtemplate OWNER TO postgres;

--
-- Name: main_label; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_label (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    organization_id integer NOT NULL
);


ALTER TABLE public.main_label OWNER TO postgres;

--
-- Name: main_label_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_label_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_label_id_seq OWNER TO postgres;

--
-- Name: main_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_label_id_seq OWNED BY public.main_label.id;


--
-- Name: main_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_notification (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    status character varying(20) NOT NULL,
    error text NOT NULL,
    notifications_sent integer NOT NULL,
    notification_type character varying(32) NOT NULL,
    recipients text NOT NULL,
    subject text NOT NULL,
    body text NOT NULL,
    notification_template_id integer NOT NULL
);


ALTER TABLE public.main_notification OWNER TO postgres;

--
-- Name: main_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_notification_id_seq OWNER TO postgres;

--
-- Name: main_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_notification_id_seq OWNED BY public.main_notification.id;


--
-- Name: main_notificationtemplate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_notificationtemplate (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    notification_type character varying(32) NOT NULL,
    notification_configuration text NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    organization_id integer,
    messages text
);


ALTER TABLE public.main_notificationtemplate OWNER TO postgres;

--
-- Name: main_notificationtemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_notificationtemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_notificationtemplate_id_seq OWNER TO postgres;

--
-- Name: main_notificationtemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_notificationtemplate_id_seq OWNED BY public.main_notificationtemplate.id;


--
-- Name: main_oauth2accesstoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_oauth2accesstoken (
    id bigint NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    description text NOT NULL,
    last_used timestamp with time zone,
    application_id bigint,
    user_id integer,
    source_refresh_token_id bigint,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.main_oauth2accesstoken OWNER TO postgres;

--
-- Name: main_oauth2accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_oauth2accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_oauth2accesstoken_id_seq OWNER TO postgres;

--
-- Name: main_oauth2accesstoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_oauth2accesstoken_id_seq OWNED BY public.main_oauth2accesstoken.id;


--
-- Name: main_oauth2application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_oauth2application (
    id bigint NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(1024) NOT NULL,
    name character varying(255) NOT NULL,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    description text NOT NULL,
    logo_data text NOT NULL,
    user_id integer,
    organization_id integer
);


ALTER TABLE public.main_oauth2application OWNER TO postgres;

--
-- Name: main_oauth2application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_oauth2application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_oauth2application_id_seq OWNER TO postgres;

--
-- Name: main_oauth2application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_oauth2application_id_seq OWNED BY public.main_oauth2application.id;


--
-- Name: main_organization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_organization (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    admin_role_id integer,
    auditor_role_id integer,
    member_role_id integer,
    read_role_id integer,
    custom_virtualenv character varying(100),
    execute_role_id integer,
    job_template_admin_role_id integer,
    credential_admin_role_id integer,
    inventory_admin_role_id integer,
    project_admin_role_id integer,
    workflow_admin_role_id integer,
    notification_admin_role_id integer,
    max_hosts integer NOT NULL,
    approval_role_id integer,
    CONSTRAINT main_organization_max_hosts_check CHECK ((max_hosts >= 0))
);


ALTER TABLE public.main_organization OWNER TO postgres;

--
-- Name: main_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_organization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_organization_id_seq OWNER TO postgres;

--
-- Name: main_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_organization_id_seq OWNED BY public.main_organization.id;


--
-- Name: main_organization_notification_templates_approvals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_organization_notification_templates_approvals (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_organization_notification_templates_approvals OWNER TO postgres;

--
-- Name: main_organization_notification_templates_approvals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_organization_notification_templates_approvals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_organization_notification_templates_approvals_id_seq OWNER TO postgres;

--
-- Name: main_organization_notification_templates_approvals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_organization_notification_templates_approvals_id_seq OWNED BY public.main_organization_notification_templates_approvals.id;


--
-- Name: main_organization_notification_templates_error; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_organization_notification_templates_error (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_organization_notification_templates_error OWNER TO postgres;

--
-- Name: main_organization_notification_templates_error_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_organization_notification_templates_error_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_organization_notification_templates_error_id_seq OWNER TO postgres;

--
-- Name: main_organization_notification_templates_error_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_organization_notification_templates_error_id_seq OWNED BY public.main_organization_notification_templates_error.id;


--
-- Name: main_organization_notification_templates_started; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_organization_notification_templates_started (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_organization_notification_templates_started OWNER TO postgres;

--
-- Name: main_organization_notification_templates_started_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_organization_notification_templates_started_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_organization_notification_templates_started_id_seq OWNER TO postgres;

--
-- Name: main_organization_notification_templates_started_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_organization_notification_templates_started_id_seq OWNED BY public.main_organization_notification_templates_started.id;


--
-- Name: main_organization_notification_templates_success; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_organization_notification_templates_success (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_organization_notification_templates_success OWNER TO postgres;

--
-- Name: main_organization_notification_templates_success_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_organization_notification_templates_success_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_organization_notification_templates_success_id_seq OWNER TO postgres;

--
-- Name: main_organization_notification_templates_success_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_organization_notification_templates_success_id_seq OWNED BY public.main_organization_notification_templates_success.id;


--
-- Name: main_organizationinstancegroupmembership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_organizationinstancegroupmembership (
    id integer NOT NULL,
    "position" integer,
    instancegroup_id integer NOT NULL,
    organization_id integer NOT NULL,
    CONSTRAINT main_organizationinstancegroupmembership_position_check CHECK (("position" >= 0))
);


ALTER TABLE public.main_organizationinstancegroupmembership OWNER TO postgres;

--
-- Name: main_organizationinstancegroupmembership_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_organizationinstancegroupmembership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_organizationinstancegroupmembership_id_seq OWNER TO postgres;

--
-- Name: main_organizationinstancegroupmembership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_organizationinstancegroupmembership_id_seq OWNED BY public.main_organizationinstancegroupmembership.id;


--
-- Name: main_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_profile (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    ldap_dn character varying(1024) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.main_profile OWNER TO postgres;

--
-- Name: main_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_profile_id_seq OWNER TO postgres;

--
-- Name: main_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_profile_id_seq OWNED BY public.main_profile.id;


--
-- Name: main_project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_project (
    unifiedjobtemplate_ptr_id integer NOT NULL,
    local_path character varying(1024) NOT NULL,
    scm_type character varying(8) NOT NULL,
    scm_url character varying(1024) NOT NULL,
    scm_branch character varying(256) NOT NULL,
    scm_clean boolean NOT NULL,
    scm_delete_on_update boolean NOT NULL,
    scm_update_on_launch boolean NOT NULL,
    scm_update_cache_timeout integer NOT NULL,
    credential_id integer,
    organization_id integer,
    admin_role_id integer,
    use_role_id integer,
    update_role_id integer,
    read_role_id integer,
    timeout integer NOT NULL,
    scm_revision character varying(1024) NOT NULL,
    playbook_files text NOT NULL,
    inventory_files text NOT NULL,
    custom_virtualenv character varying(100),
    scm_refspec character varying(1024) NOT NULL,
    allow_override boolean NOT NULL,
    CONSTRAINT main_project_scm_update_cache_timeout_check CHECK ((scm_update_cache_timeout >= 0))
);


ALTER TABLE public.main_project OWNER TO postgres;

--
-- Name: main_projectupdate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_projectupdate (
    unifiedjob_ptr_id integer NOT NULL,
    local_path character varying(1024) NOT NULL,
    scm_type character varying(8) NOT NULL,
    scm_url character varying(1024) NOT NULL,
    scm_branch character varying(256) NOT NULL,
    scm_clean boolean NOT NULL,
    scm_delete_on_update boolean NOT NULL,
    credential_id integer,
    project_id integer NOT NULL,
    timeout integer NOT NULL,
    job_type character varying(64) NOT NULL,
    scm_refspec character varying(1024) NOT NULL,
    scm_revision character varying(1024) NOT NULL,
    job_tags character varying(1024) NOT NULL
);


ALTER TABLE public.main_projectupdate OWNER TO postgres;

--
-- Name: main_projectupdateevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_projectupdateevent (
    id integer NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone NOT NULL,
    event character varying(100) NOT NULL,
    event_data text NOT NULL,
    failed boolean NOT NULL,
    changed boolean NOT NULL,
    uuid character varying(1024) NOT NULL,
    playbook character varying(1024) NOT NULL,
    play character varying(1024) NOT NULL,
    role character varying(1024) NOT NULL,
    task character varying(1024) NOT NULL,
    counter integer NOT NULL,
    stdout text NOT NULL,
    verbosity integer NOT NULL,
    start_line integer NOT NULL,
    end_line integer NOT NULL,
    project_update_id integer NOT NULL,
    CONSTRAINT main_projectupdateevent_counter_check CHECK ((counter >= 0)),
    CONSTRAINT main_projectupdateevent_end_line_check CHECK ((end_line >= 0)),
    CONSTRAINT main_projectupdateevent_start_line_check CHECK ((start_line >= 0)),
    CONSTRAINT main_projectupdateevent_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_projectupdateevent OWNER TO postgres;

--
-- Name: main_projectupdateevent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_projectupdateevent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_projectupdateevent_id_seq OWNER TO postgres;

--
-- Name: main_projectupdateevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_projectupdateevent_id_seq OWNED BY public.main_projectupdateevent.id;


--
-- Name: main_rbac_role_ancestors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_rbac_role_ancestors (
    id integer NOT NULL,
    role_field text NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    ancestor_id integer NOT NULL,
    descendent_id integer NOT NULL,
    CONSTRAINT main_rbac_role_ancestors_content_type_id_check CHECK ((content_type_id >= 0)),
    CONSTRAINT main_rbac_role_ancestors_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.main_rbac_role_ancestors OWNER TO postgres;

--
-- Name: main_rbac_role_ancestors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_rbac_role_ancestors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_rbac_role_ancestors_id_seq OWNER TO postgres;

--
-- Name: main_rbac_role_ancestors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_rbac_role_ancestors_id_seq OWNED BY public.main_rbac_role_ancestors.id;


--
-- Name: main_rbac_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_rbac_roles (
    id integer NOT NULL,
    role_field text NOT NULL,
    singleton_name text,
    implicit_parents text NOT NULL,
    content_type_id integer,
    object_id integer,
    CONSTRAINT main_rbac_roles_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.main_rbac_roles OWNER TO postgres;

--
-- Name: main_rbac_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_rbac_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_rbac_roles_id_seq OWNER TO postgres;

--
-- Name: main_rbac_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_rbac_roles_id_seq OWNED BY public.main_rbac_roles.id;


--
-- Name: main_rbac_roles_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_rbac_roles_members (
    id integer NOT NULL,
    role_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.main_rbac_roles_members OWNER TO postgres;

--
-- Name: main_rbac_roles_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_rbac_roles_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_rbac_roles_members_id_seq OWNER TO postgres;

--
-- Name: main_rbac_roles_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_rbac_roles_members_id_seq OWNED BY public.main_rbac_roles_members.id;


--
-- Name: main_rbac_roles_parents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_rbac_roles_parents (
    id integer NOT NULL,
    from_role_id integer NOT NULL,
    to_role_id integer NOT NULL
);


ALTER TABLE public.main_rbac_roles_parents OWNER TO postgres;

--
-- Name: main_rbac_roles_parents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_rbac_roles_parents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_rbac_roles_parents_id_seq OWNER TO postgres;

--
-- Name: main_rbac_roles_parents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_rbac_roles_parents_id_seq OWNED BY public.main_rbac_roles_parents.id;


--
-- Name: main_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_schedule (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    enabled boolean NOT NULL,
    dtstart timestamp with time zone,
    dtend timestamp with time zone,
    rrule character varying(255) NOT NULL,
    next_run timestamp with time zone,
    extra_data text NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    unified_job_template_id integer NOT NULL,
    char_prompts text NOT NULL,
    inventory_id integer,
    survey_passwords text NOT NULL
);


ALTER TABLE public.main_schedule OWNER TO postgres;

--
-- Name: main_schedule_credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_schedule_credentials (
    id integer NOT NULL,
    schedule_id integer NOT NULL,
    credential_id integer NOT NULL
);


ALTER TABLE public.main_schedule_credentials OWNER TO postgres;

--
-- Name: main_schedule_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_schedule_credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_schedule_credentials_id_seq OWNER TO postgres;

--
-- Name: main_schedule_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_schedule_credentials_id_seq OWNED BY public.main_schedule_credentials.id;


--
-- Name: main_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_schedule_id_seq OWNER TO postgres;

--
-- Name: main_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_schedule_id_seq OWNED BY public.main_schedule.id;


--
-- Name: main_smartinventorymembership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_smartinventorymembership (
    id integer NOT NULL,
    host_id integer NOT NULL,
    inventory_id integer NOT NULL
);


ALTER TABLE public.main_smartinventorymembership OWNER TO postgres;

--
-- Name: main_smartinventorymembership_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_smartinventorymembership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_smartinventorymembership_id_seq OWNER TO postgres;

--
-- Name: main_smartinventorymembership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_smartinventorymembership_id_seq OWNED BY public.main_smartinventorymembership.id;


--
-- Name: main_systemjob; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_systemjob (
    unifiedjob_ptr_id integer NOT NULL,
    job_type character varying(32) NOT NULL,
    extra_vars text NOT NULL,
    system_job_template_id integer
);


ALTER TABLE public.main_systemjob OWNER TO postgres;

--
-- Name: main_systemjobevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_systemjobevent (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    event_data text NOT NULL,
    uuid character varying(1024) NOT NULL,
    counter integer NOT NULL,
    stdout text NOT NULL,
    verbosity integer NOT NULL,
    start_line integer NOT NULL,
    end_line integer NOT NULL,
    system_job_id integer NOT NULL,
    CONSTRAINT main_systemjobevent_counter_check CHECK ((counter >= 0)),
    CONSTRAINT main_systemjobevent_end_line_check CHECK ((end_line >= 0)),
    CONSTRAINT main_systemjobevent_start_line_check CHECK ((start_line >= 0)),
    CONSTRAINT main_systemjobevent_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_systemjobevent OWNER TO postgres;

--
-- Name: main_systemjobevent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_systemjobevent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_systemjobevent_id_seq OWNER TO postgres;

--
-- Name: main_systemjobevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_systemjobevent_id_seq OWNED BY public.main_systemjobevent.id;


--
-- Name: main_systemjobtemplate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_systemjobtemplate (
    unifiedjobtemplate_ptr_id integer NOT NULL,
    job_type character varying(32) NOT NULL
);


ALTER TABLE public.main_systemjobtemplate OWNER TO postgres;

--
-- Name: main_team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_team (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    organization_id integer NOT NULL,
    admin_role_id integer,
    member_role_id integer,
    read_role_id integer
);


ALTER TABLE public.main_team OWNER TO postgres;

--
-- Name: main_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_team_id_seq OWNER TO postgres;

--
-- Name: main_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_team_id_seq OWNED BY public.main_team.id;


--
-- Name: main_toweranalyticsstate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_toweranalyticsstate (
    id integer NOT NULL,
    last_run timestamp with time zone NOT NULL
);


ALTER TABLE public.main_toweranalyticsstate OWNER TO postgres;

--
-- Name: main_toweranalyticsstate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_toweranalyticsstate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_toweranalyticsstate_id_seq OWNER TO postgres;

--
-- Name: main_toweranalyticsstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_toweranalyticsstate_id_seq OWNED BY public.main_toweranalyticsstate.id;


--
-- Name: main_towerschedulestate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_towerschedulestate (
    id integer NOT NULL,
    schedule_last_run timestamp with time zone NOT NULL
);


ALTER TABLE public.main_towerschedulestate OWNER TO postgres;

--
-- Name: main_towerschedulestate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_towerschedulestate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_towerschedulestate_id_seq OWNER TO postgres;

--
-- Name: main_towerschedulestate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_towerschedulestate_id_seq OWNED BY public.main_towerschedulestate.id;


--
-- Name: main_unifiedjob; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_unifiedjob (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    old_pk integer,
    launch_type character varying(20) NOT NULL,
    cancel_flag boolean NOT NULL,
    status character varying(20) NOT NULL,
    failed boolean NOT NULL,
    started timestamp with time zone,
    finished timestamp with time zone,
    elapsed numeric(12,3) NOT NULL,
    job_args text NOT NULL,
    job_cwd character varying(1024) NOT NULL,
    job_env text NOT NULL,
    job_explanation text NOT NULL,
    start_args text NOT NULL,
    result_stdout_text text,
    result_traceback text NOT NULL,
    celery_task_id character varying(100) NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    polymorphic_ctype_id integer,
    schedule_id integer,
    unified_job_template_id integer,
    execution_node text NOT NULL,
    instance_group_id integer,
    emitted_events integer NOT NULL,
    controller_node text NOT NULL,
    canceled_on timestamp with time zone,
    dependencies_processed boolean NOT NULL,
    CONSTRAINT main_unifiedjob_emitted_events_check CHECK ((emitted_events >= 0)),
    CONSTRAINT main_unifiedjob_old_pk_check CHECK ((old_pk >= 0))
);


ALTER TABLE public.main_unifiedjob OWNER TO postgres;

--
-- Name: main_unifiedjob_credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_unifiedjob_credentials (
    id integer NOT NULL,
    unifiedjob_id integer NOT NULL,
    credential_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjob_credentials OWNER TO postgres;

--
-- Name: main_unifiedjob_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_unifiedjob_credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjob_credentials_id_seq OWNER TO postgres;

--
-- Name: main_unifiedjob_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_unifiedjob_credentials_id_seq OWNED BY public.main_unifiedjob_credentials.id;


--
-- Name: main_unifiedjob_dependent_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_unifiedjob_dependent_jobs (
    id integer NOT NULL,
    from_unifiedjob_id integer NOT NULL,
    to_unifiedjob_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjob_dependent_jobs OWNER TO postgres;

--
-- Name: main_unifiedjob_dependent_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_unifiedjob_dependent_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjob_dependent_jobs_id_seq OWNER TO postgres;

--
-- Name: main_unifiedjob_dependent_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_unifiedjob_dependent_jobs_id_seq OWNED BY public.main_unifiedjob_dependent_jobs.id;


--
-- Name: main_unifiedjob_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_unifiedjob_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjob_id_seq OWNER TO postgres;

--
-- Name: main_unifiedjob_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_unifiedjob_id_seq OWNED BY public.main_unifiedjob.id;


--
-- Name: main_unifiedjob_labels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_unifiedjob_labels (
    id integer NOT NULL,
    unifiedjob_id integer NOT NULL,
    label_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjob_labels OWNER TO postgres;

--
-- Name: main_unifiedjob_labels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_unifiedjob_labels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjob_labels_id_seq OWNER TO postgres;

--
-- Name: main_unifiedjob_labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_unifiedjob_labels_id_seq OWNED BY public.main_unifiedjob_labels.id;


--
-- Name: main_unifiedjob_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_unifiedjob_notifications (
    id integer NOT NULL,
    unifiedjob_id integer NOT NULL,
    notification_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjob_notifications OWNER TO postgres;

--
-- Name: main_unifiedjob_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_unifiedjob_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjob_notifications_id_seq OWNER TO postgres;

--
-- Name: main_unifiedjob_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_unifiedjob_notifications_id_seq OWNED BY public.main_unifiedjob_notifications.id;


--
-- Name: main_unifiedjobtemplate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_unifiedjobtemplate (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    old_pk integer,
    last_job_failed boolean NOT NULL,
    last_job_run timestamp with time zone,
    next_job_run timestamp with time zone,
    status character varying(32) NOT NULL,
    created_by_id integer,
    current_job_id integer,
    last_job_id integer,
    modified_by_id integer,
    next_schedule_id integer,
    polymorphic_ctype_id integer,
    CONSTRAINT main_unifiedjobtemplate_old_pk_check CHECK ((old_pk >= 0))
);


ALTER TABLE public.main_unifiedjobtemplate OWNER TO postgres;

--
-- Name: main_unifiedjobtemplate_credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_unifiedjobtemplate_credentials (
    id integer NOT NULL,
    unifiedjobtemplate_id integer NOT NULL,
    credential_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjobtemplate_credentials OWNER TO postgres;

--
-- Name: main_unifiedjobtemplate_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_unifiedjobtemplate_credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjobtemplate_credentials_id_seq OWNER TO postgres;

--
-- Name: main_unifiedjobtemplate_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_unifiedjobtemplate_credentials_id_seq OWNED BY public.main_unifiedjobtemplate_credentials.id;


--
-- Name: main_unifiedjobtemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_unifiedjobtemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjobtemplate_id_seq OWNER TO postgres;

--
-- Name: main_unifiedjobtemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_unifiedjobtemplate_id_seq OWNED BY public.main_unifiedjobtemplate.id;


--
-- Name: main_unifiedjobtemplate_labels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_unifiedjobtemplate_labels (
    id integer NOT NULL,
    unifiedjobtemplate_id integer NOT NULL,
    label_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjobtemplate_labels OWNER TO postgres;

--
-- Name: main_unifiedjobtemplate_labels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_unifiedjobtemplate_labels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjobtemplate_labels_id_seq OWNER TO postgres;

--
-- Name: main_unifiedjobtemplate_labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_unifiedjobtemplate_labels_id_seq OWNED BY public.main_unifiedjobtemplate_labels.id;


--
-- Name: main_unifiedjobtemplate_notification_templates_error; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_unifiedjobtemplate_notification_templates_error (
    id integer NOT NULL,
    unifiedjobtemplate_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjobtemplate_notification_templates_error OWNER TO postgres;

--
-- Name: main_unifiedjobtemplate_notification_templates_error_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_unifiedjobtemplate_notification_templates_error_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjobtemplate_notification_templates_error_id_seq OWNER TO postgres;

--
-- Name: main_unifiedjobtemplate_notification_templates_error_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_unifiedjobtemplate_notification_templates_error_id_seq OWNED BY public.main_unifiedjobtemplate_notification_templates_error.id;


--
-- Name: main_unifiedjobtemplate_notification_templates_started; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_unifiedjobtemplate_notification_templates_started (
    id integer NOT NULL,
    unifiedjobtemplate_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjobtemplate_notification_templates_started OWNER TO postgres;

--
-- Name: main_unifiedjobtemplate_notification_templates_started_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_unifiedjobtemplate_notification_templates_started_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjobtemplate_notification_templates_started_id_seq OWNER TO postgres;

--
-- Name: main_unifiedjobtemplate_notification_templates_started_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_unifiedjobtemplate_notification_templates_started_id_seq OWNED BY public.main_unifiedjobtemplate_notification_templates_started.id;


--
-- Name: main_unifiedjobtemplate_notification_templates_success; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_unifiedjobtemplate_notification_templates_success (
    id integer NOT NULL,
    unifiedjobtemplate_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjobtemplate_notification_templates_success OWNER TO postgres;

--
-- Name: main_unifiedjobtemplate_notification_templates_success_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_unifiedjobtemplate_notification_templates_success_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjobtemplate_notification_templates_success_id_seq OWNER TO postgres;

--
-- Name: main_unifiedjobtemplate_notification_templates_success_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_unifiedjobtemplate_notification_templates_success_id_seq OWNED BY public.main_unifiedjobtemplate_notification_templates_success.id;


--
-- Name: main_unifiedjobtemplateinstancegroupmembership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_unifiedjobtemplateinstancegroupmembership (
    id integer NOT NULL,
    "position" integer,
    instancegroup_id integer NOT NULL,
    unifiedjobtemplate_id integer NOT NULL,
    CONSTRAINT main_unifiedjobtemplateinstancegroupmembership_position_check CHECK (("position" >= 0))
);


ALTER TABLE public.main_unifiedjobtemplateinstancegroupmembership OWNER TO postgres;

--
-- Name: main_unifiedjobtemplateinstancegroupmembership_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_unifiedjobtemplateinstancegroupmembership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjobtemplateinstancegroupmembership_id_seq OWNER TO postgres;

--
-- Name: main_unifiedjobtemplateinstancegroupmembership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_unifiedjobtemplateinstancegroupmembership_id_seq OWNED BY public.main_unifiedjobtemplateinstancegroupmembership.id;


--
-- Name: main_usersessionmembership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_usersessionmembership (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    session_id character varying(40) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.main_usersessionmembership OWNER TO postgres;

--
-- Name: main_usersessionmembership_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_usersessionmembership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_usersessionmembership_id_seq OWNER TO postgres;

--
-- Name: main_usersessionmembership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_usersessionmembership_id_seq OWNED BY public.main_usersessionmembership.id;


--
-- Name: main_workflowapproval; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowapproval (
    unifiedjob_ptr_id integer NOT NULL,
    workflow_approval_template_id integer,
    timeout integer NOT NULL,
    timed_out boolean NOT NULL,
    approved_or_denied_by_id integer
);


ALTER TABLE public.main_workflowapproval OWNER TO postgres;

--
-- Name: main_workflowapprovaltemplate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowapprovaltemplate (
    unifiedjobtemplate_ptr_id integer NOT NULL,
    timeout integer NOT NULL
);


ALTER TABLE public.main_workflowapprovaltemplate OWNER TO postgres;

--
-- Name: main_workflowjob; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowjob (
    unifiedjob_ptr_id integer NOT NULL,
    extra_vars text NOT NULL,
    workflow_job_template_id integer,
    survey_passwords text NOT NULL,
    allow_simultaneous boolean NOT NULL,
    is_sliced_job boolean NOT NULL,
    job_template_id integer,
    char_prompts text NOT NULL,
    inventory_id integer,
    webhook_credential_id integer,
    webhook_guid character varying(128) NOT NULL,
    webhook_service character varying(16) NOT NULL
);


ALTER TABLE public.main_workflowjob OWNER TO postgres;

--
-- Name: main_workflowjobnode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowjobnode (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    job_id integer,
    unified_job_template_id integer,
    workflow_job_id integer,
    char_prompts text NOT NULL,
    inventory_id integer,
    ancestor_artifacts text NOT NULL,
    extra_data text NOT NULL,
    survey_passwords text NOT NULL,
    do_not_run boolean NOT NULL,
    all_parents_must_converge boolean NOT NULL
);


ALTER TABLE public.main_workflowjobnode OWNER TO postgres;

--
-- Name: main_workflowjobnode_always_nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowjobnode_always_nodes (
    id integer NOT NULL,
    from_workflowjobnode_id integer NOT NULL,
    to_workflowjobnode_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobnode_always_nodes OWNER TO postgres;

--
-- Name: main_workflowjobnode_always_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_workflowjobnode_always_nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobnode_always_nodes_id_seq OWNER TO postgres;

--
-- Name: main_workflowjobnode_always_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_workflowjobnode_always_nodes_id_seq OWNED BY public.main_workflowjobnode_always_nodes.id;


--
-- Name: main_workflowjobnode_credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowjobnode_credentials (
    id integer NOT NULL,
    workflowjobnode_id integer NOT NULL,
    credential_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobnode_credentials OWNER TO postgres;

--
-- Name: main_workflowjobnode_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_workflowjobnode_credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobnode_credentials_id_seq OWNER TO postgres;

--
-- Name: main_workflowjobnode_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_workflowjobnode_credentials_id_seq OWNED BY public.main_workflowjobnode_credentials.id;


--
-- Name: main_workflowjobnode_failure_nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowjobnode_failure_nodes (
    id integer NOT NULL,
    from_workflowjobnode_id integer NOT NULL,
    to_workflowjobnode_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobnode_failure_nodes OWNER TO postgres;

--
-- Name: main_workflowjobnode_failure_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_workflowjobnode_failure_nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobnode_failure_nodes_id_seq OWNER TO postgres;

--
-- Name: main_workflowjobnode_failure_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_workflowjobnode_failure_nodes_id_seq OWNED BY public.main_workflowjobnode_failure_nodes.id;


--
-- Name: main_workflowjobnode_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_workflowjobnode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobnode_id_seq OWNER TO postgres;

--
-- Name: main_workflowjobnode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_workflowjobnode_id_seq OWNED BY public.main_workflowjobnode.id;


--
-- Name: main_workflowjobnode_success_nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowjobnode_success_nodes (
    id integer NOT NULL,
    from_workflowjobnode_id integer NOT NULL,
    to_workflowjobnode_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobnode_success_nodes OWNER TO postgres;

--
-- Name: main_workflowjobnode_success_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_workflowjobnode_success_nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobnode_success_nodes_id_seq OWNER TO postgres;

--
-- Name: main_workflowjobnode_success_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_workflowjobnode_success_nodes_id_seq OWNED BY public.main_workflowjobnode_success_nodes.id;


--
-- Name: main_workflowjobtemplate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowjobtemplate (
    unifiedjobtemplate_ptr_id integer NOT NULL,
    extra_vars text NOT NULL,
    admin_role_id integer,
    execute_role_id integer,
    organization_id integer,
    read_role_id integer,
    survey_enabled boolean NOT NULL,
    survey_spec text NOT NULL,
    allow_simultaneous boolean NOT NULL,
    ask_variables_on_launch boolean NOT NULL,
    ask_inventory_on_launch boolean NOT NULL,
    inventory_id integer,
    approval_role_id integer,
    ask_limit_on_launch boolean NOT NULL,
    ask_scm_branch_on_launch boolean NOT NULL,
    char_prompts text NOT NULL,
    webhook_credential_id integer,
    webhook_key character varying(64) NOT NULL,
    webhook_service character varying(16) NOT NULL
);


ALTER TABLE public.main_workflowjobtemplate OWNER TO postgres;

--
-- Name: main_workflowjobtemplate_notification_templates_approvals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowjobtemplate_notification_templates_approvals (
    id integer NOT NULL,
    workflowjobtemplate_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobtemplate_notification_templates_approvals OWNER TO postgres;

--
-- Name: main_workflowjobtemplate_notification_templates_approval_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_workflowjobtemplate_notification_templates_approval_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobtemplate_notification_templates_approval_id_seq OWNER TO postgres;

--
-- Name: main_workflowjobtemplate_notification_templates_approval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_workflowjobtemplate_notification_templates_approval_id_seq OWNED BY public.main_workflowjobtemplate_notification_templates_approvals.id;


--
-- Name: main_workflowjobtemplatenode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowjobtemplatenode (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    unified_job_template_id integer,
    workflow_job_template_id integer NOT NULL,
    char_prompts text NOT NULL,
    inventory_id integer,
    extra_data text NOT NULL,
    survey_passwords text NOT NULL,
    all_parents_must_converge boolean NOT NULL
);


ALTER TABLE public.main_workflowjobtemplatenode OWNER TO postgres;

--
-- Name: main_workflowjobtemplatenode_always_nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowjobtemplatenode_always_nodes (
    id integer NOT NULL,
    from_workflowjobtemplatenode_id integer NOT NULL,
    to_workflowjobtemplatenode_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobtemplatenode_always_nodes OWNER TO postgres;

--
-- Name: main_workflowjobtemplatenode_always_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_workflowjobtemplatenode_always_nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobtemplatenode_always_nodes_id_seq OWNER TO postgres;

--
-- Name: main_workflowjobtemplatenode_always_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_workflowjobtemplatenode_always_nodes_id_seq OWNED BY public.main_workflowjobtemplatenode_always_nodes.id;


--
-- Name: main_workflowjobtemplatenode_credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowjobtemplatenode_credentials (
    id integer NOT NULL,
    workflowjobtemplatenode_id integer NOT NULL,
    credential_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobtemplatenode_credentials OWNER TO postgres;

--
-- Name: main_workflowjobtemplatenode_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_workflowjobtemplatenode_credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobtemplatenode_credentials_id_seq OWNER TO postgres;

--
-- Name: main_workflowjobtemplatenode_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_workflowjobtemplatenode_credentials_id_seq OWNED BY public.main_workflowjobtemplatenode_credentials.id;


--
-- Name: main_workflowjobtemplatenode_failure_nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowjobtemplatenode_failure_nodes (
    id integer NOT NULL,
    from_workflowjobtemplatenode_id integer NOT NULL,
    to_workflowjobtemplatenode_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobtemplatenode_failure_nodes OWNER TO postgres;

--
-- Name: main_workflowjobtemplatenode_failure_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_workflowjobtemplatenode_failure_nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobtemplatenode_failure_nodes_id_seq OWNER TO postgres;

--
-- Name: main_workflowjobtemplatenode_failure_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_workflowjobtemplatenode_failure_nodes_id_seq OWNED BY public.main_workflowjobtemplatenode_failure_nodes.id;


--
-- Name: main_workflowjobtemplatenode_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_workflowjobtemplatenode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobtemplatenode_id_seq OWNER TO postgres;

--
-- Name: main_workflowjobtemplatenode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_workflowjobtemplatenode_id_seq OWNED BY public.main_workflowjobtemplatenode.id;


--
-- Name: main_workflowjobtemplatenode_success_nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_workflowjobtemplatenode_success_nodes (
    id integer NOT NULL,
    from_workflowjobtemplatenode_id integer NOT NULL,
    to_workflowjobtemplatenode_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobtemplatenode_success_nodes OWNER TO postgres;

--
-- Name: main_workflowjobtemplatenode_success_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_workflowjobtemplatenode_success_nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobtemplatenode_success_nodes_id_seq OWNER TO postgres;

--
-- Name: main_workflowjobtemplatenode_success_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_workflowjobtemplatenode_success_nodes_id_seq OWNED BY public.main_workflowjobtemplatenode_success_nodes.id;


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_grant (
    id bigint DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass) NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    revoked timestamp with time zone
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO postgres;

--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO postgres;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO postgres;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO postgres;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO postgres;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: sso_userenterpriseauth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sso_userenterpriseauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.sso_userenterpriseauth OWNER TO postgres;

--
-- Name: sso_userenterpriseauth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sso_userenterpriseauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sso_userenterpriseauth_id_seq OWNER TO postgres;

--
-- Name: sso_userenterpriseauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sso_userenterpriseauth_id_seq OWNED BY public.sso_userenterpriseauth.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO postgres;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO postgres;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO postgres;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO postgres;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: conf_setting id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_setting ALTER COLUMN id SET DEFAULT nextval('public.conf_setting_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: main_activitystream id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_id_seq'::regclass);


--
-- Name: main_activitystream_ad_hoc_command id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_ad_hoc_command ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_ad_hoc_command_id_seq'::regclass);


--
-- Name: main_activitystream_credential id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_credential ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_credential_id_seq'::regclass);


--
-- Name: main_activitystream_credential_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_credential_type ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_credential_type_id_seq'::regclass);


--
-- Name: main_activitystream_custom_inventory_script id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_custom_inventory_script ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_custom_inventory_script_id_seq'::regclass);


--
-- Name: main_activitystream_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_group ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_group_id_seq'::regclass);


--
-- Name: main_activitystream_host id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_host ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_host_id_seq'::regclass);


--
-- Name: main_activitystream_instance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_instance ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_instance_id_seq'::regclass);


--
-- Name: main_activitystream_instance_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_instance_group ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_instance_group_id_seq'::regclass);


--
-- Name: main_activitystream_inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_inventory_id_seq'::regclass);


--
-- Name: main_activitystream_inventory_source id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory_source ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_inventory_source_id_seq'::regclass);


--
-- Name: main_activitystream_inventory_update id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory_update ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_inventory_update_id_seq'::regclass);


--
-- Name: main_activitystream_job id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_job ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_job_id_seq'::regclass);


--
-- Name: main_activitystream_job_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_job_template ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_job_template_id_seq'::regclass);


--
-- Name: main_activitystream_label id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_label ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_label_id_seq'::regclass);


--
-- Name: main_activitystream_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_notification ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_notification_id_seq'::regclass);


--
-- Name: main_activitystream_notification_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_notification_template ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_notification_template_id_seq'::regclass);


--
-- Name: main_activitystream_o_auth2_access_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_access_token ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_o_auth2_access_token_id_seq'::regclass);


--
-- Name: main_activitystream_o_auth2_application id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_application ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_o_auth2_application_id_seq'::regclass);


--
-- Name: main_activitystream_organization id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_organization ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_organization_id_seq'::regclass);


--
-- Name: main_activitystream_project id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_project ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_project_id_seq'::regclass);


--
-- Name: main_activitystream_project_update id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_project_update ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_project_update_id_seq'::regclass);


--
-- Name: main_activitystream_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_role ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_role_id_seq'::regclass);


--
-- Name: main_activitystream_schedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_schedule ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_schedule_id_seq'::regclass);


--
-- Name: main_activitystream_team id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_team ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_team_id_seq'::regclass);


--
-- Name: main_activitystream_unified_job id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_unified_job ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_unified_job_id_seq'::regclass);


--
-- Name: main_activitystream_unified_job_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_unified_job_template ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_unified_job_template_id_seq'::regclass);


--
-- Name: main_activitystream_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_user ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_user_id_seq'::regclass);


--
-- Name: main_activitystream_workflow_approval id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_workflow_approval_id_seq'::regclass);


--
-- Name: main_activitystream_workflow_approval_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval_template ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_workflow_approval_template_id_seq'::regclass);


--
-- Name: main_activitystream_workflow_job id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_workflow_job_id_seq'::regclass);


--
-- Name: main_activitystream_workflow_job_node id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_node ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_workflow_job_node_id_seq'::regclass);


--
-- Name: main_activitystream_workflow_job_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_workflow_job_template_id_seq'::regclass);


--
-- Name: main_activitystream_workflow_job_template_node id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template_node ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_workflow_job_template_node_id_seq'::regclass);


--
-- Name: main_adhoccommandevent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_adhoccommandevent ALTER COLUMN id SET DEFAULT nextval('public.main_adhoccommandevent_id_seq'::regclass);


--
-- Name: main_channelgroup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_channelgroup ALTER COLUMN id SET DEFAULT nextval('public.main_channelgroup_id_seq'::regclass);


--
-- Name: main_credential id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credential ALTER COLUMN id SET DEFAULT nextval('public.main_credential_id_seq'::regclass);


--
-- Name: main_credentialinputsource id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credentialinputsource ALTER COLUMN id SET DEFAULT nextval('public.main_credentialinputsource_id_seq'::regclass);


--
-- Name: main_credentialtype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credentialtype ALTER COLUMN id SET DEFAULT nextval('public.main_credentialtype_id_seq'::regclass);


--
-- Name: main_custominventoryscript id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_custominventoryscript ALTER COLUMN id SET DEFAULT nextval('public.main_custominventoryscript_id_seq'::regclass);


--
-- Name: main_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group ALTER COLUMN id SET DEFAULT nextval('public.main_group_id_seq'::regclass);


--
-- Name: main_group_hosts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_hosts ALTER COLUMN id SET DEFAULT nextval('public.main_group_hosts_id_seq'::regclass);


--
-- Name: main_group_inventory_sources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_inventory_sources ALTER COLUMN id SET DEFAULT nextval('public.main_group_inventory_sources_id_seq'::regclass);


--
-- Name: main_group_parents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_parents ALTER COLUMN id SET DEFAULT nextval('public.main_group_parents_id_seq'::regclass);


--
-- Name: main_host id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_host ALTER COLUMN id SET DEFAULT nextval('public.main_host_id_seq'::regclass);


--
-- Name: main_host_inventory_sources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_host_inventory_sources ALTER COLUMN id SET DEFAULT nextval('public.main_host_inventory_sources_id_seq'::regclass);


--
-- Name: main_instance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_instance ALTER COLUMN id SET DEFAULT nextval('public.main_instance_id_seq'::regclass);


--
-- Name: main_instancegroup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_instancegroup ALTER COLUMN id SET DEFAULT nextval('public.main_instancegroup_id_seq'::regclass);


--
-- Name: main_instancegroup_instances id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_instancegroup_instances ALTER COLUMN id SET DEFAULT nextval('public.main_instancegroup_instances_id_seq'::regclass);


--
-- Name: main_inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventory ALTER COLUMN id SET DEFAULT nextval('public.main_inventory_id_seq'::regclass);


--
-- Name: main_inventoryinstancegroupmembership id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventoryinstancegroupmembership ALTER COLUMN id SET DEFAULT nextval('public.main_inventoryinstancegroupmembership_id_seq'::regclass);


--
-- Name: main_inventoryupdateevent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventoryupdateevent ALTER COLUMN id SET DEFAULT nextval('public.main_inventoryupdateevent_id_seq'::regclass);


--
-- Name: main_jobevent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobevent ALTER COLUMN id SET DEFAULT nextval('public.main_jobevent_id_seq'::regclass);


--
-- Name: main_jobhostsummary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobhostsummary ALTER COLUMN id SET DEFAULT nextval('public.main_jobhostsummary_id_seq'::regclass);


--
-- Name: main_joblaunchconfig id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_joblaunchconfig ALTER COLUMN id SET DEFAULT nextval('public.main_joblaunchconfig_id_seq'::regclass);


--
-- Name: main_joblaunchconfig_credentials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_joblaunchconfig_credentials ALTER COLUMN id SET DEFAULT nextval('public.main_joblaunchconfig_credentials_id_seq'::regclass);


--
-- Name: main_label id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_label ALTER COLUMN id SET DEFAULT nextval('public.main_label_id_seq'::regclass);


--
-- Name: main_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notification ALTER COLUMN id SET DEFAULT nextval('public.main_notification_id_seq'::regclass);


--
-- Name: main_notificationtemplate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notificationtemplate ALTER COLUMN id SET DEFAULT nextval('public.main_notificationtemplate_id_seq'::regclass);


--
-- Name: main_oauth2accesstoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_oauth2accesstoken ALTER COLUMN id SET DEFAULT nextval('public.main_oauth2accesstoken_id_seq'::regclass);


--
-- Name: main_oauth2application id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_oauth2application ALTER COLUMN id SET DEFAULT nextval('public.main_oauth2application_id_seq'::regclass);


--
-- Name: main_organization id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization ALTER COLUMN id SET DEFAULT nextval('public.main_organization_id_seq'::regclass);


--
-- Name: main_organization_notification_templates_approvals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_approvals ALTER COLUMN id SET DEFAULT nextval('public.main_organization_notification_templates_approvals_id_seq'::regclass);


--
-- Name: main_organization_notification_templates_error id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_error ALTER COLUMN id SET DEFAULT nextval('public.main_organization_notification_templates_error_id_seq'::regclass);


--
-- Name: main_organization_notification_templates_started id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_started ALTER COLUMN id SET DEFAULT nextval('public.main_organization_notification_templates_started_id_seq'::regclass);


--
-- Name: main_organization_notification_templates_success id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_success ALTER COLUMN id SET DEFAULT nextval('public.main_organization_notification_templates_success_id_seq'::regclass);


--
-- Name: main_organizationinstancegroupmembership id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organizationinstancegroupmembership ALTER COLUMN id SET DEFAULT nextval('public.main_organizationinstancegroupmembership_id_seq'::regclass);


--
-- Name: main_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_profile ALTER COLUMN id SET DEFAULT nextval('public.main_profile_id_seq'::regclass);


--
-- Name: main_projectupdateevent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_projectupdateevent ALTER COLUMN id SET DEFAULT nextval('public.main_projectupdateevent_id_seq'::regclass);


--
-- Name: main_rbac_role_ancestors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_role_ancestors ALTER COLUMN id SET DEFAULT nextval('public.main_rbac_role_ancestors_id_seq'::regclass);


--
-- Name: main_rbac_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_roles ALTER COLUMN id SET DEFAULT nextval('public.main_rbac_roles_id_seq'::regclass);


--
-- Name: main_rbac_roles_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_roles_members ALTER COLUMN id SET DEFAULT nextval('public.main_rbac_roles_members_id_seq'::regclass);


--
-- Name: main_rbac_roles_parents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_roles_parents ALTER COLUMN id SET DEFAULT nextval('public.main_rbac_roles_parents_id_seq'::regclass);


--
-- Name: main_schedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_schedule ALTER COLUMN id SET DEFAULT nextval('public.main_schedule_id_seq'::regclass);


--
-- Name: main_schedule_credentials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_schedule_credentials ALTER COLUMN id SET DEFAULT nextval('public.main_schedule_credentials_id_seq'::regclass);


--
-- Name: main_smartinventorymembership id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_smartinventorymembership ALTER COLUMN id SET DEFAULT nextval('public.main_smartinventorymembership_id_seq'::regclass);


--
-- Name: main_systemjobevent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_systemjobevent ALTER COLUMN id SET DEFAULT nextval('public.main_systemjobevent_id_seq'::regclass);


--
-- Name: main_team id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_team ALTER COLUMN id SET DEFAULT nextval('public.main_team_id_seq'::regclass);


--
-- Name: main_toweranalyticsstate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_toweranalyticsstate ALTER COLUMN id SET DEFAULT nextval('public.main_toweranalyticsstate_id_seq'::regclass);


--
-- Name: main_towerschedulestate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_towerschedulestate ALTER COLUMN id SET DEFAULT nextval('public.main_towerschedulestate_id_seq'::regclass);


--
-- Name: main_unifiedjob id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjob_id_seq'::regclass);


--
-- Name: main_unifiedjob_credentials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_credentials ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjob_credentials_id_seq'::regclass);


--
-- Name: main_unifiedjob_dependent_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_dependent_jobs ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjob_dependent_jobs_id_seq'::regclass);


--
-- Name: main_unifiedjob_labels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_labels ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjob_labels_id_seq'::regclass);


--
-- Name: main_unifiedjob_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_notifications ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjob_notifications_id_seq'::regclass);


--
-- Name: main_unifiedjobtemplate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjobtemplate_id_seq'::regclass);


--
-- Name: main_unifiedjobtemplate_credentials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_credentials ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjobtemplate_credentials_id_seq'::regclass);


--
-- Name: main_unifiedjobtemplate_labels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_labels ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjobtemplate_labels_id_seq'::regclass);


--
-- Name: main_unifiedjobtemplate_notification_templates_error id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_error ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjobtemplate_notification_templates_error_id_seq'::regclass);


--
-- Name: main_unifiedjobtemplate_notification_templates_started id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_started ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjobtemplate_notification_templates_started_id_seq'::regclass);


--
-- Name: main_unifiedjobtemplate_notification_templates_success id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_success ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjobtemplate_notification_templates_success_id_seq'::regclass);


--
-- Name: main_unifiedjobtemplateinstancegroupmembership id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplateinstancegroupmembership ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjobtemplateinstancegroupmembership_id_seq'::regclass);


--
-- Name: main_usersessionmembership id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_usersessionmembership ALTER COLUMN id SET DEFAULT nextval('public.main_usersessionmembership_id_seq'::regclass);


--
-- Name: main_workflowjobnode id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobnode_id_seq'::regclass);


--
-- Name: main_workflowjobnode_always_nodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_always_nodes ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobnode_always_nodes_id_seq'::regclass);


--
-- Name: main_workflowjobnode_credentials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_credentials ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobnode_credentials_id_seq'::regclass);


--
-- Name: main_workflowjobnode_failure_nodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_failure_nodes ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobnode_failure_nodes_id_seq'::regclass);


--
-- Name: main_workflowjobnode_success_nodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_success_nodes ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobnode_success_nodes_id_seq'::regclass);


--
-- Name: main_workflowjobtemplate_notification_templates_approvals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplate_notification_templates_approvals ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobtemplate_notification_templates_approval_id_seq'::regclass);


--
-- Name: main_workflowjobtemplatenode id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobtemplatenode_id_seq'::regclass);


--
-- Name: main_workflowjobtemplatenode_always_nodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_always_nodes ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobtemplatenode_always_nodes_id_seq'::regclass);


--
-- Name: main_workflowjobtemplatenode_credentials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_credentials ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobtemplatenode_credentials_id_seq'::regclass);


--
-- Name: main_workflowjobtemplatenode_failure_nodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_failure_nodes ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobtemplatenode_failure_nodes_id_seq'::regclass);


--
-- Name: main_workflowjobtemplatenode_success_nodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_success_nodes ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobtemplatenode_success_nodes_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: sso_userenterpriseauth id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_userenterpriseauth ALTER COLUMN id SET DEFAULT nextval('public.sso_userenterpriseauth_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	3	add_permission
2	Can change permission	3	change_permission
3	Can delete permission	3	delete_permission
4	Can view permission	3	view_permission
5	Can add group	4	add_group
6	Can change group	4	change_group
7	Can delete group	4	delete_group
8	Can view group	4	view_group
9	Can add user	2	add_user
10	Can change user	2	change_user
11	Can delete user	2	delete_user
12	Can view user	2	view_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can view content type	5	view_contenttype
17	Can add session	6	add_session
18	Can change session	6	change_session
19	Can delete session	6	delete_session
20	Can view session	6	view_session
21	Can add site	7	add_site
22	Can change site	7	change_site
23	Can delete site	7	delete_site
24	Can view site	7	view_site
25	Can add grant	8	add_grant
26	Can change grant	8	change_grant
27	Can delete grant	8	delete_grant
28	Can view grant	8	view_grant
29	Can add refresh token	9	add_refreshtoken
30	Can change refresh token	9	change_refreshtoken
31	Can delete refresh token	9	delete_refreshtoken
32	Can view refresh token	9	view_refreshtoken
33	Can add Tag	10	add_tag
34	Can change Tag	10	change_tag
35	Can delete Tag	10	delete_tag
36	Can view Tag	10	view_tag
37	Can add Tagged Item	11	add_taggeditem
38	Can change Tagged Item	11	change_taggeditem
39	Can delete Tagged Item	11	delete_taggeditem
40	Can view Tagged Item	11	view_taggeditem
41	Can add association	12	add_association
42	Can change association	12	change_association
43	Can delete association	12	delete_association
44	Can view association	12	view_association
45	Can add code	13	add_code
46	Can change code	13	change_code
47	Can delete code	13	delete_code
48	Can view code	13	view_code
49	Can add nonce	14	add_nonce
50	Can change nonce	14	change_nonce
51	Can delete nonce	14	delete_nonce
52	Can view nonce	14	view_nonce
53	Can add user social auth	15	add_usersocialauth
54	Can change user social auth	15	change_usersocialauth
55	Can delete user social auth	15	delete_usersocialauth
56	Can view user social auth	15	view_usersocialauth
57	Can add partial	16	add_partial
58	Can change partial	16	change_partial
59	Can delete partial	16	delete_partial
60	Can view partial	16	view_partial
61	Can add setting	17	add_setting
62	Can change setting	17	change_setting
63	Can delete setting	17	delete_setting
64	Can view setting	17	view_setting
65	Can add activity stream	18	add_activitystream
66	Can change activity stream	18	change_activitystream
67	Can delete activity stream	18	delete_activitystream
68	Can view activity stream	18	view_activitystream
69	Can add ad hoc command event	19	add_adhoccommandevent
70	Can change ad hoc command event	19	change_adhoccommandevent
71	Can delete ad hoc command event	19	delete_adhoccommandevent
72	Can view ad hoc command event	19	view_adhoccommandevent
73	Can add credential	20	add_credential
74	Can change credential	20	change_credential
75	Can delete credential	20	delete_credential
76	Can view credential	20	view_credential
77	Can add custom inventory script	21	add_custominventoryscript
78	Can change custom inventory script	21	change_custominventoryscript
79	Can delete custom inventory script	21	delete_custominventoryscript
80	Can view custom inventory script	21	view_custominventoryscript
81	Can add group	22	add_group
82	Can change group	22	change_group
83	Can delete group	22	delete_group
84	Can view group	22	view_group
85	Can add host	23	add_host
86	Can change host	23	change_host
87	Can delete host	23	delete_host
88	Can view host	23	view_host
89	Can add instance	24	add_instance
90	Can change instance	24	change_instance
91	Can delete instance	24	delete_instance
92	Can view instance	24	view_instance
93	Can add inventory	25	add_inventory
94	Can change inventory	25	change_inventory
95	Can delete inventory	25	delete_inventory
96	Can view inventory	25	view_inventory
97	Can add job event	26	add_jobevent
98	Can change job event	26	change_jobevent
99	Can delete job event	26	delete_jobevent
100	Can view job event	26	view_jobevent
101	Can add job host summary	27	add_jobhostsummary
102	Can change job host summary	27	change_jobhostsummary
103	Can delete job host summary	27	delete_jobhostsummary
104	Can view job host summary	27	view_jobhostsummary
105	Can add organization	28	add_organization
106	Can change organization	28	change_organization
107	Can delete organization	28	delete_organization
108	Can view organization	28	view_organization
109	Can add profile	29	add_profile
110	Can change profile	29	change_profile
111	Can delete profile	29	delete_profile
112	Can view profile	29	view_profile
113	Can add schedule	30	add_schedule
114	Can change schedule	30	change_schedule
115	Can delete schedule	30	delete_schedule
116	Can view schedule	30	view_schedule
117	Can add team	31	add_team
118	Can change team	31	change_team
119	Can delete team	31	delete_team
120	Can view team	31	view_team
121	Can add unified job	32	add_unifiedjob
122	Can change unified job	32	change_unifiedjob
123	Can delete unified job	32	delete_unifiedjob
124	Can view unified job	32	view_unifiedjob
125	Can add unified job template	33	add_unifiedjobtemplate
126	Can change unified job template	33	change_unifiedjobtemplate
127	Can delete unified job template	33	delete_unifiedjobtemplate
128	Can view unified job template	33	view_unifiedjobtemplate
129	Can add ad hoc command	34	add_adhoccommand
130	Can change ad hoc command	34	change_adhoccommand
131	Can delete ad hoc command	34	delete_adhoccommand
132	Can view ad hoc command	34	view_adhoccommand
133	Can add inventory source	35	add_inventorysource
134	Can change inventory source	35	change_inventorysource
135	Can delete inventory source	35	delete_inventorysource
136	Can view inventory source	35	view_inventorysource
137	Can add inventory update	36	add_inventoryupdate
138	Can change inventory update	36	change_inventoryupdate
139	Can delete inventory update	36	delete_inventoryupdate
140	Can view inventory update	36	view_inventoryupdate
141	Can add job	37	add_job
142	Can change job	37	change_job
143	Can delete job	37	delete_job
144	Can view job	37	view_job
145	Can add job template	38	add_jobtemplate
146	Can change job template	38	change_jobtemplate
147	Can delete job template	38	delete_jobtemplate
148	Can view job template	38	view_jobtemplate
149	Can add project	39	add_project
150	Can change project	39	change_project
151	Can delete project	39	delete_project
152	Can view project	39	view_project
153	Can add project update	40	add_projectupdate
154	Can change project update	40	change_projectupdate
155	Can delete project update	40	delete_projectupdate
156	Can view project update	40	view_projectupdate
157	Can add system job	41	add_systemjob
158	Can change system job	41	change_systemjob
159	Can delete system job	41	delete_systemjob
160	Can view system job	41	view_systemjob
161	Can add system job template	1	add_systemjobtemplate
162	Can change system job template	1	change_systemjobtemplate
163	Can delete system job template	1	delete_systemjobtemplate
164	Can view system job template	1	view_systemjobtemplate
165	Can add notification	42	add_notification
166	Can change notification	42	change_notification
167	Can delete notification	42	delete_notification
168	Can view notification	42	view_notification
169	Can add notification template	43	add_notificationtemplate
170	Can change notification template	43	change_notificationtemplate
171	Can delete notification template	43	delete_notificationtemplate
172	Can view notification template	43	view_notificationtemplate
173	Can add role	44	add_role
174	Can change role	44	change_role
175	Can delete role	44	delete_role
176	Can view role	44	view_role
177	Can add role ancestor entry	45	add_roleancestorentry
178	Can change role ancestor entry	45	change_roleancestorentry
179	Can delete role ancestor entry	45	delete_roleancestorentry
180	Can view role ancestor entry	45	view_roleancestorentry
181	Can add label	46	add_label
182	Can change label	46	change_label
183	Can delete label	46	delete_label
184	Can view label	46	view_label
185	Can add channel group	47	add_channelgroup
186	Can change channel group	47	change_channelgroup
187	Can delete channel group	47	delete_channelgroup
188	Can view channel group	47	view_channelgroup
189	Can add workflow job	48	add_workflowjob
190	Can change workflow job	48	change_workflowjob
191	Can delete workflow job	48	delete_workflowjob
192	Can view workflow job	48	view_workflowjob
193	Can add workflow job node	49	add_workflowjobnode
194	Can change workflow job node	49	change_workflowjobnode
195	Can delete workflow job node	49	delete_workflowjobnode
196	Can view workflow job node	49	view_workflowjobnode
197	Can add workflow job template	50	add_workflowjobtemplate
198	Can change workflow job template	50	change_workflowjobtemplate
199	Can delete workflow job template	50	delete_workflowjobtemplate
200	Can view workflow job template	50	view_workflowjobtemplate
201	Can add workflow job template node	51	add_workflowjobtemplatenode
202	Can change workflow job template node	51	change_workflowjobtemplatenode
203	Can delete workflow job template node	51	delete_workflowjobtemplatenode
204	Can view workflow job template node	51	view_workflowjobtemplatenode
205	Can add tower schedule state	52	add_towerschedulestate
206	Can change tower schedule state	52	change_towerschedulestate
207	Can delete tower schedule state	52	delete_towerschedulestate
208	Can view tower schedule state	52	view_towerschedulestate
209	Can add smart inventory membership	53	add_smartinventorymembership
210	Can change smart inventory membership	53	change_smartinventorymembership
211	Can delete smart inventory membership	53	delete_smartinventorymembership
212	Can view smart inventory membership	53	view_smartinventorymembership
213	Can add credential type	54	add_credentialtype
214	Can change credential type	54	change_credentialtype
215	Can delete credential type	54	delete_credentialtype
216	Can view credential type	54	view_credentialtype
217	Can add instance group	55	add_instancegroup
218	Can change instance group	55	change_instancegroup
219	Can delete instance group	55	delete_instancegroup
220	Can view instance group	55	view_instancegroup
221	Can add job launch config	56	add_joblaunchconfig
222	Can change job launch config	56	change_joblaunchconfig
223	Can delete job launch config	56	delete_joblaunchconfig
224	Can view job launch config	56	view_joblaunchconfig
225	Can add unified job deprecated stdout	57	add_unifiedjobdeprecatedstdout
226	Can change unified job deprecated stdout	57	change_unifiedjobdeprecatedstdout
227	Can delete unified job deprecated stdout	57	delete_unifiedjobdeprecatedstdout
228	Can view unified job deprecated stdout	57	view_unifiedjobdeprecatedstdout
229	Can add inventory update event	58	add_inventoryupdateevent
230	Can change inventory update event	58	change_inventoryupdateevent
231	Can delete inventory update event	58	delete_inventoryupdateevent
232	Can view inventory update event	58	view_inventoryupdateevent
233	Can add project update event	59	add_projectupdateevent
234	Can change project update event	59	change_projectupdateevent
235	Can delete project update event	59	delete_projectupdateevent
236	Can view project update event	59	view_projectupdateevent
237	Can add system job event	60	add_systemjobevent
238	Can change system job event	60	change_systemjobevent
239	Can delete system job event	60	delete_systemjobevent
240	Can view system job event	60	view_systemjobevent
241	Can add user session membership	61	add_usersessionmembership
242	Can change user session membership	61	change_usersessionmembership
243	Can delete user session membership	61	delete_usersessionmembership
244	Can view user session membership	61	view_usersessionmembership
245	Can add application	62	add_oauth2application
246	Can change application	62	change_oauth2application
247	Can delete application	62	delete_oauth2application
248	Can view application	62	view_oauth2application
249	Can add access token	63	add_oauth2accesstoken
250	Can change access token	63	change_oauth2accesstoken
251	Can delete access token	63	delete_oauth2accesstoken
252	Can view access token	63	view_oauth2accesstoken
253	Can add tower analytics state	64	add_toweranalyticsstate
254	Can change tower analytics state	64	change_toweranalyticsstate
255	Can delete tower analytics state	64	delete_toweranalyticsstate
256	Can view tower analytics state	64	view_toweranalyticsstate
257	Can add credential input source	65	add_credentialinputsource
258	Can change credential input source	65	change_credentialinputsource
259	Can delete credential input source	65	delete_credentialinputsource
260	Can view credential input source	65	view_credentialinputsource
261	Can add inventory instance group membership	66	add_inventoryinstancegroupmembership
262	Can change inventory instance group membership	66	change_inventoryinstancegroupmembership
263	Can delete inventory instance group membership	66	delete_inventoryinstancegroupmembership
264	Can view inventory instance group membership	66	view_inventoryinstancegroupmembership
265	Can add organization instance group membership	67	add_organizationinstancegroupmembership
266	Can change organization instance group membership	67	change_organizationinstancegroupmembership
267	Can delete organization instance group membership	67	delete_organizationinstancegroupmembership
268	Can view organization instance group membership	67	view_organizationinstancegroupmembership
269	Can add unified job template instance group membership	68	add_unifiedjobtemplateinstancegroupmembership
270	Can change unified job template instance group membership	68	change_unifiedjobtemplateinstancegroupmembership
271	Can delete unified job template instance group membership	68	delete_unifiedjobtemplateinstancegroupmembership
272	Can view unified job template instance group membership	68	view_unifiedjobtemplateinstancegroupmembership
273	Can add workflow approval template	69	add_workflowapprovaltemplate
274	Can change workflow approval template	69	change_workflowapprovaltemplate
275	Can delete workflow approval template	69	delete_workflowapprovaltemplate
276	Can view workflow approval template	69	view_workflowapprovaltemplate
277	Can add workflow approval	70	add_workflowapproval
278	Can change workflow approval	70	change_workflowapproval
279	Can delete workflow approval	70	delete_workflowapproval
280	Can view workflow approval	70	view_workflowapproval
281	Can add user enterprise auth	71	add_userenterpriseauth
282	Can change user enterprise auth	71	change_userenterpriseauth
283	Can delete user enterprise auth	71	delete_userenterpriseauth
284	Can view user enterprise auth	71	view_userenterpriseauth
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$5M3rLJCSPxpi$oFlqcpy7rzb5/KzheBoE6v6jjcmd+pGynOtz2suN2/g=	2020-03-21 21:15:13.197014+00	t	root			root@localhost	t	t	2020-03-21 21:10:53.519147+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: conf_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_setting (id, created, modified, key, value, user_id) FROM stdin;
1	2020-03-21 21:09:32.884672+00	2020-03-21 21:09:32.884694+00	AUTH_LDAP_GROUP_TYPE_PARAMS	{"name_attr": "cn", "member_attr": "member"}	\N
2	2020-03-21 21:10:09.811287+00	2020-03-21 21:10:09.811305+00	INSTALL_UUID	"69db22ec-4d83-4ff0-9f38-da6ae89ac743"	\N
3	2020-03-21 21:11:00.34542+00	2020-03-21 21:11:00.345442+00	AWX_TASK_ENV	{"HOME": "/var/lib/awx"}	\N
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	main	systemjobtemplate
2	auth	user
3	auth	permission
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	oauth2_provider	grant
9	oauth2_provider	refreshtoken
10	taggit	tag
11	taggit	taggeditem
12	social_django	association
13	social_django	code
14	social_django	nonce
15	social_django	usersocialauth
16	social_django	partial
17	conf	setting
18	main	activitystream
19	main	adhoccommandevent
20	main	credential
21	main	custominventoryscript
22	main	group
23	main	host
24	main	instance
25	main	inventory
26	main	jobevent
27	main	jobhostsummary
28	main	organization
29	main	profile
30	main	schedule
31	main	team
32	main	unifiedjob
33	main	unifiedjobtemplate
34	main	adhoccommand
35	main	inventorysource
36	main	inventoryupdate
37	main	job
38	main	jobtemplate
39	main	project
40	main	projectupdate
41	main	systemjob
42	main	notification
43	main	notificationtemplate
44	main	role
45	main	roleancestorentry
46	main	label
47	main	channelgroup
48	main	workflowjob
49	main	workflowjobnode
50	main	workflowjobtemplate
51	main	workflowjobtemplatenode
52	main	towerschedulestate
53	main	smartinventorymembership
54	main	credentialtype
55	main	instancegroup
56	main	joblaunchconfig
57	main	unifiedjobdeprecatedstdout
58	main	inventoryupdateevent
59	main	projectupdateevent
60	main	systemjobevent
61	main	usersessionmembership
62	main	oauth2application
63	main	oauth2accesstoken
64	main	toweranalyticsstate
65	main	credentialinputsource
66	main	inventoryinstancegroupmembership
67	main	organizationinstancegroupmembership
68	main	unifiedjobtemplateinstancegroupmembership
69	main	workflowapprovaltemplate
70	main	workflowapproval
71	sso	userenterpriseauth
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-03-21 21:08:19.692708+00
2	contenttypes	0002_remove_content_type_name	2020-03-21 21:08:19.715387+00
3	taggit	0001_initial	2020-03-21 21:08:19.750004+00
4	taggit	0002_auto_20150616_2121	2020-03-21 21:08:19.807041+00
5	auth	0001_initial	2020-03-21 21:08:19.891592+00
6	main	0001_initial	2020-03-21 21:08:30.578006+00
7	main	0002_v300_tower_settings_changes	2020-03-21 21:08:46.238783+00
8	main	0003_v300_notification_changes	2020-03-21 21:08:46.242454+00
9	main	0004_v300_fact_changes	2020-03-21 21:08:46.245497+00
10	main	0005_v300_migrate_facts	2020-03-21 21:08:46.248579+00
11	main	0006_v300_active_flag_cleanup	2020-03-21 21:08:46.250606+00
12	main	0007_v300_active_flag_removal	2020-03-21 21:08:46.252673+00
13	main	0008_v300_rbac_changes	2020-03-21 21:08:46.254947+00
14	main	0009_v300_rbac_migrations	2020-03-21 21:08:46.256971+00
15	main	0010_v300_create_system_job_templates	2020-03-21 21:08:46.258927+00
16	main	0011_v300_credential_domain_field	2020-03-21 21:08:46.260556+00
17	main	0012_v300_create_labels	2020-03-21 21:08:46.262081+00
18	main	0013_v300_label_changes	2020-03-21 21:08:46.263663+00
19	main	0014_v300_invsource_cred	2020-03-21 21:08:46.265185+00
20	main	0015_v300_label_changes	2020-03-21 21:08:46.266697+00
21	main	0016_v300_prompting_changes	2020-03-21 21:08:46.268242+00
22	main	0017_v300_prompting_migrations	2020-03-21 21:08:46.269866+00
23	main	0018_v300_host_ordering	2020-03-21 21:08:46.271444+00
24	main	0019_v300_new_azure_credential	2020-03-21 21:08:46.272901+00
25	main	0020_v300_labels_changes	2020-03-21 21:08:49.600797+00
26	main	0021_v300_activity_stream	2020-03-21 21:08:49.60279+00
27	main	0022_v300_adhoc_extravars	2020-03-21 21:08:49.604412+00
28	main	0023_v300_activity_stream_ordering	2020-03-21 21:08:49.605943+00
29	main	0024_v300_jobtemplate_allow_simul	2020-03-21 21:08:49.607438+00
30	main	0025_v300_update_rbac_parents	2020-03-21 21:08:49.608984+00
31	main	0026_v300_credential_unique	2020-03-21 21:08:49.610536+00
32	main	0027_v300_team_migrations	2020-03-21 21:08:49.612049+00
33	main	0028_v300_org_team_cascade	2020-03-21 21:08:49.613536+00
34	main	0029_v302_add_ask_skip_tags	2020-03-21 21:09:07.661894+00
35	main	0030_v302_job_survey_passwords	2020-03-21 21:09:07.666228+00
36	main	0031_v302_migrate_survey_passwords	2020-03-21 21:09:07.669941+00
37	main	0032_v302_credential_permissions_update	2020-03-21 21:09:07.672966+00
38	main	0033_v303_v245_host_variable_fix	2020-03-21 21:09:07.675389+00
39	main	0034_v310_release	2020-03-21 21:09:07.6778+00
40	conf	0001_initial	2020-03-21 21:09:08.267109+00
41	conf	0002_v310_copy_tower_settings	2020-03-21 21:09:08.435611+00
42	main	0035_v310_remove_tower_settings	2020-03-21 21:09:09.532163+00
43	main	0036_v311_insights	2020-03-21 21:09:09.535008+00
44	main	0037_v313_instance_version	2020-03-21 21:09:09.537668+00
45	main	0006_v320_release	2020-03-21 21:09:24.311697+00
46	main	0007_v320_data_migrations	2020-03-21 21:09:24.681575+00
47	main	0008_v320_drop_v1_credential_fields	2020-03-21 21:09:28.980857+00
48	main	0009_v322_add_setting_field_for_activity_stream	2020-03-21 21:09:29.144696+00
49	main	0010_v322_add_ovirt4_tower_inventory	2020-03-21 21:09:29.403824+00
50	main	0011_v322_encrypt_survey_passwords	2020-03-21 21:09:29.408203+00
51	main	0012_v322_update_cred_types	2020-03-21 21:09:29.411071+00
52	main	0013_v330_multi_credential	2020-03-21 21:09:31.991025+00
53	auth	0002_alter_permission_name_max_length	2020-03-21 21:09:32.097716+00
54	auth	0003_alter_user_email_max_length	2020-03-21 21:09:32.133744+00
55	auth	0004_alter_user_username_opts	2020-03-21 21:09:32.168921+00
56	auth	0005_alter_user_last_login_null	2020-03-21 21:09:32.202403+00
57	auth	0006_require_contenttypes_0002	2020-03-21 21:09:32.205405+00
58	auth	0007_alter_validators_add_error_messages	2020-03-21 21:09:32.242547+00
59	auth	0008_alter_user_username_max_length	2020-03-21 21:09:32.280641+00
60	auth	0009_alter_user_last_name_max_length	2020-03-21 21:09:32.332484+00
61	auth	0010_alter_group_name_max_length	2020-03-21 21:09:32.354723+00
62	auth	0011_update_proxy_permissions	2020-03-21 21:09:32.507001+00
63	conf	0003_v310_JSONField_changes	2020-03-21 21:09:32.544686+00
64	conf	0004_v320_reencrypt	2020-03-21 21:09:32.555776+00
65	conf	0005_v330_rename_two_session_settings	2020-03-21 21:09:32.724118+00
66	conf	0006_v331_ldap_group_type	2020-03-21 21:09:32.889185+00
67	sessions	0001_initial	2020-03-21 21:09:32.915096+00
68	main	0014_v330_saved_launchtime_configs	2020-03-21 21:09:38.125808+00
69	main	0015_v330_blank_start_args	2020-03-21 21:09:38.5987+00
70	main	0016_v330_non_blank_workflow	2020-03-21 21:09:38.853731+00
71	main	0017_v330_move_deprecated_stdout	2020-03-21 21:09:39.14366+00
72	main	0018_v330_add_additional_stdout_events	2020-03-21 21:09:40.694425+00
73	main	0019_v330_custom_virtualenv	2020-03-21 21:09:41.014505+00
74	main	0020_v330_instancegroup_policies	2020-03-21 21:09:41.588194+00
75	main	0021_v330_declare_new_rbac_roles	2020-03-21 21:09:44.999608+00
76	main	0022_v330_create_new_rbac_roles	2020-03-21 21:09:45.423255+00
77	main	0023_v330_inventory_multicred	2020-03-21 21:09:46.175682+00
78	main	0024_v330_create_user_session_membership	2020-03-21 21:09:46.337944+00
79	main	0025_v330_add_oauth_activity_stream_registrar	2020-03-21 21:09:47.109492+00
80	oauth2_provider	0001_initial	2020-03-21 21:09:48.534071+00
81	main	0026_v330_delete_authtoken	2020-03-21 21:09:48.767779+00
82	main	0027_v330_emitted_events	2020-03-21 21:09:48.966543+00
83	main	0028_v330_add_tower_verify	2020-03-21 21:09:49.146548+00
84	main	0030_v330_modify_application	2020-03-21 21:09:49.42808+00
85	main	0031_v330_encrypt_oauth2_secret	2020-03-21 21:09:49.606852+00
86	main	0032_v330_polymorphic_delete	2020-03-21 21:09:49.810803+00
87	main	0033_v330_oauth_help_text	2020-03-21 21:09:51.29372+00
88	main	0034_v330_delete_user_role	2020-03-21 21:09:51.818505+00
89	main	0035_v330_more_oauth2_help_text	2020-03-21 21:09:51.929298+00
90	main	0036_v330_credtype_remove_become_methods	2020-03-21 21:09:52.097985+00
91	main	0037_v330_remove_legacy_fact_cleanup	2020-03-21 21:09:52.306945+00
92	main	0038_v330_add_deleted_activitystream_actor	2020-03-21 21:09:52.470237+00
93	main	0039_v330_custom_venv_help_text	2020-03-21 21:09:52.822886+00
94	main	0040_v330_unifiedjob_controller_node	2020-03-21 21:09:53.046157+00
95	main	0041_v330_update_oauth_refreshtoken	2020-03-21 21:09:53.262358+00
96	main	0042_v330_org_member_role_deparent	2020-03-21 21:09:53.83836+00
97	main	0043_v330_oauth2accesstoken_modified	2020-03-21 21:09:54.013036+00
98	main	0044_v330_add_inventory_update_inventory	2020-03-21 21:09:54.976839+00
99	main	0045_v330_instance_managed_by_policy	2020-03-21 21:09:55.026091+00
100	main	0046_v330_remove_client_credentials_grant	2020-03-21 21:09:55.152247+00
101	main	0047_v330_activitystream_instance	2020-03-21 21:09:55.446338+00
102	main	0048_v330_django_created_modified_by_model_name	2020-03-21 21:10:01.041331+00
103	main	0049_v330_validate_instance_capacity_adjustment	2020-03-21 21:10:01.090334+00
104	main	0050_v340_drop_celery_tables	2020-03-21 21:10:01.130149+00
105	main	0051_v340_job_slicing	2020-03-21 21:10:03.0702+00
106	main	0052_v340_remove_project_scm_delete_on_next_update	2020-03-21 21:10:03.219736+00
107	main	0053_v340_workflow_inventory	2020-03-21 21:10:03.901769+00
108	main	0054_v340_workflow_convergence	2020-03-21 21:10:04.116608+00
109	main	0055_v340_add_grafana_notification	2020-03-21 21:10:04.373049+00
110	main	0056_v350_custom_venv_history	2020-03-21 21:10:04.73695+00
111	main	0057_v350_remove_become_method_type	2020-03-21 21:10:05.005445+00
112	main	0058_v350_remove_limit_limit	2020-03-21 21:10:05.43343+00
113	main	0059_v350_remove_adhoc_limit	2020-03-21 21:10:05.612199+00
114	main	0060_v350_update_schedule_uniqueness_constraint	2020-03-21 21:10:05.970182+00
115	main	0061_v350_track_native_credentialtype_source	2020-03-21 21:10:06.546718+00
116	main	0062_v350_new_playbook_stats	2020-03-21 21:10:06.890798+00
117	main	0063_v350_org_host_limits	2020-03-21 21:10:08.168806+00
118	main	0064_v350_analytics_state	2020-03-21 21:10:08.235052+00
119	main	0065_v350_index_job_status	2020-03-21 21:10:08.433141+00
120	main	0066_v350_inventorysource_custom_virtualenv	2020-03-21 21:10:08.571018+00
121	main	0067_v350_credential_plugins	2020-03-21 21:10:09.314326+00
122	main	0068_v350_index_event_created	2020-03-21 21:10:09.625075+00
123	main	0069_v350_generate_unique_install_uuid	2020-03-21 21:10:09.816274+00
124	main	0070_v350_gce_instance_id	2020-03-21 21:10:10.018226+00
125	main	0071_v350_remove_system_tracking	2020-03-21 21:10:10.290885+00
126	main	0072_v350_deprecate_fields	2020-03-21 21:10:13.809719+00
127	main	0073_v360_create_instance_group_m2m	2020-03-21 21:10:14.330558+00
128	main	0074_v360_migrate_instance_group_relations	2020-03-21 21:10:14.614352+00
129	main	0075_v360_remove_old_instance_group_relations	2020-03-21 21:10:15.132709+00
130	main	0076_v360_add_new_instance_group_relations	2020-03-21 21:10:15.771252+00
131	main	0077_v360_add_default_orderings	2020-03-21 21:10:17.938649+00
132	main	0078_v360_clear_sessions_tokens_jt	2020-03-21 21:10:18.470878+00
133	main	0079_v360_rm_implicit_oauth2_apps	2020-03-21 21:10:18.576814+00
134	main	0080_v360_replace_job_origin	2020-03-21 21:10:19.491701+00
135	main	0081_v360_notify_on_start	2020-03-21 21:10:21.488762+00
136	main	0082_v360_webhook_http_method	2020-03-21 21:10:21.738473+00
137	main	0083_v360_job_branch_override	2020-03-21 21:10:23.188514+00
138	main	0084_v360_token_description	2020-03-21 21:10:23.307019+00
139	main	0085_v360_add_notificationtemplate_messages	2020-03-21 21:10:23.681355+00
140	main	0086_v360_workflow_approval	2020-03-21 21:10:26.58516+00
141	main	0087_v360_update_credential_injector_help_text	2020-03-21 21:10:27.051975+00
142	main	0088_v360_dashboard_optimizations	2020-03-21 21:10:27.442832+00
143	main	0089_v360_new_job_event_types	2020-03-21 21:10:27.655828+00
144	main	0090_v360_WFJT_prompts	2020-03-21 21:10:30.344043+00
145	main	0091_v360_approval_node_notifications	2020-03-21 21:10:30.929581+00
146	main	0092_v360_webhook_mixin	2020-03-21 21:10:32.402133+00
147	main	0093_v360_personal_access_tokens	2020-03-21 21:10:32.918848+00
148	main	0094_v360_webhook_mixin2	2020-03-21 21:10:34.969084+00
149	main	0095_v360_increase_instance_version_length	2020-03-21 21:10:35.054239+00
150	main	0096_v360_container_groups	2020-03-21 21:10:35.822694+00
151	main	0097_v360_workflowapproval_approved_or_denied_by	2020-03-21 21:10:36.060186+00
152	main	0098_v360_rename_cyberark_aim_credential_type	2020-03-21 21:10:36.387248+00
153	main	0099_v361_license_cleanup	2020-03-21 21:10:36.586852+00
154	main	0100_v370_projectupdate_job_tags	2020-03-21 21:10:36.773938+00
155	main	0101_v370_generate_new_uuids_for_iso_nodes	2020-03-21 21:10:36.980341+00
156	main	0102_v370_unifiedjob_canceled	2020-03-21 21:10:37.155291+00
157	main	0103_v370_remove_computed_fields	2020-03-21 21:10:39.473049+00
158	main	0104_v370_cleanup_old_scan_jts	2020-03-21 21:10:39.845976+00
159	main	0105_v370_remove_jobevent_parent_and_hosts	2020-03-21 21:10:40.2679+00
160	main	0106_v370_remove_inventory_groups_with_active_failures	2020-03-21 21:10:40.432176+00
161	main	0107_v370_workflow_convergence_api_toggle	2020-03-21 21:10:40.8701+00
162	main	0108_v370_unifiedjob_dependencies_processed	2020-03-21 21:10:41.159256+00
163	oauth2_provider	0002_08_updates	2020-03-21 21:10:41.615643+00
164	oauth2_provider	0003_auto_20160316_1503	2020-03-21 21:10:41.790809+00
165	oauth2_provider	0004_auto_20160525_1623	2020-03-21 21:10:42.173702+00
166	oauth2_provider	0005_auto_20170514_1141	2020-03-21 21:10:45.791912+00
167	oauth2_provider	0006_auto_20171214_2232	2020-03-21 21:10:46.62321+00
168	sites	0001_initial	2020-03-21 21:10:46.640798+00
169	sites	0002_alter_domain_unique	2020-03-21 21:10:46.675492+00
170	default	0001_initial	2020-03-21 21:10:47.058164+00
171	social_auth	0001_initial	2020-03-21 21:10:47.062273+00
172	default	0002_add_related_name	2020-03-21 21:10:48.292849+00
173	social_auth	0002_add_related_name	2020-03-21 21:10:48.296319+00
174	default	0003_alter_email_max_length	2020-03-21 21:10:48.312451+00
175	social_auth	0003_alter_email_max_length	2020-03-21 21:10:48.315303+00
176	default	0004_auto_20160423_0400	2020-03-21 21:10:48.432892+00
177	social_auth	0004_auto_20160423_0400	2020-03-21 21:10:48.43688+00
178	social_auth	0005_auto_20160727_2333	2020-03-21 21:10:48.457684+00
179	social_django	0006_partial	2020-03-21 21:10:48.491602+00
180	social_django	0007_code_timestamp	2020-03-21 21:10:48.559099+00
181	social_django	0008_partial_timestamp	2020-03-21 21:10:48.625133+00
182	sso	0001_initial	2020-03-21 21:10:48.952581+00
183	sso	0002_expand_provider_options	2020-03-21 21:10:49.093234+00
184	taggit	0003_taggeditem_add_unique_index	2020-03-21 21:10:49.173215+00
185	social_django	0004_auto_20160423_0400	2020-03-21 21:10:49.185734+00
186	social_django	0005_auto_20160727_2333	2020-03-21 21:10:49.189312+00
187	social_django	0003_alter_email_max_length	2020-03-21 21:10:49.192865+00
188	social_django	0002_add_related_name	2020-03-21 21:10:49.195693+00
189	social_django	0001_initial	2020-03-21 21:10:49.198373+00
190	main	0004_squashed_v310_release	2020-03-21 21:10:49.201051+00
191	main	0005_squashed_v310_v313_updates	2020-03-21 21:10:49.203567+00
192	main	0003_squashed_v300_v303_updates	2020-03-21 21:10:49.20643+00
193	main	0002_squashed_v300_release	2020-03-21 21:10:49.209567+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
sx0795s72zmhpiy0dl77rlq1r5wt3otl	Y2Y5ZDkyZjUyMjY1YjkzNGYwOWIzNjgyMDE4NzIyZWFlMzliMDljYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==	2020-03-21 21:45:14.133394+00
chnc15da6f494a02776560fd2ad94c22	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 21:45:15.463197+00
chn2c02619331090df919e125adc8e25	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 21:48:14.37669+00
chnf834115c35d23ca7fbc7afa6a5f41	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 21:49:16.427784+00
chn9d9d3f338d07ab2ca9b90b8ac043d	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 21:50:18.497481+00
chn0b5b0e282828ca6b7a7e9ae755d59	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 21:51:20.554117+00
chna6a01519e1d4be01a65c4016e5749	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 21:52:22.617702+00
chn1c23f8666557e1622806655ddd611	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 21:53:24.674753+00
chnf5f0c6b627eb1cc4cecbb4f2b7723	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 21:54:26.729533+00
chn39362b078a8cf69fd3f7e4be71a1e	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 21:55:28.791206+00
chnfba3901b6b0e94e8973ae9599236e	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 21:56:30.84527+00
chn32164c158b9982cb46c6585809c6d	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 21:57:32.905231+00
chn127b25684625970732b02303aeb43	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 21:58:34.967391+00
chnbb72246ae09c8c9af2467aac57eb2	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 21:59:37.024031+00
chnd7e1f4be4951b998474ab87b990cc	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:00:39.083126+00
chn3f4410871fee124da4d65d22e5217	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:13:03.779272+00
chnbb56bf34db45ed05d04b816fe933a	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:14:05.840129+00
chn1a7fcdda650e43024bc5f69f632b4	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:01:41.146322+00
chn999ffae8a63e56c3124ee2eb8d8c6	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:15:07.894514+00
chn3fa334d2ad8ccfef565e7c1bcc74b	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:02:43.207277+00
chnee8b24cc42cf03d563f9b910c4313	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:03:45.258528+00
chn50785fc50c31a77b426109ef6c867	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:04:47.320824+00
chnc56aed418dc0df8eda62c8ced65a6	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:05:49.366303+00
chn5f968c59fe44339b190bbfc01e8bb	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:06:51.427917+00
chne6df577c1edc47f2547237755cc84	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:07:53.483943+00
chnf4f7755ee76881fab1484df4589fb	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:08:55.549935+00
chn1b17348183aab4fe5afdcde125d3f	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:09:57.601686+00
chn9cc1a7e9896390de17aff4e37dbaf	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:10:59.661644+00
chneec5a8bd561b8bda761776fa71150	NWUxMGI0NTU0NDJiZTA0MDNiNTQyYWIyMjA2MTIyMjg4ZjA4OTZhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNDA5NzU2NmQ3NjVhNzQ1NjgyYzQ5Yzk4M2E5YjllMzUyYzVhNzY2IiwiX2F1dGhfdXNlcl94cmYiOiJtWkdUdHdNeXRQWXU1cUVMUENxUnlwN2g3b1Y4c05QZDlZZUdyRE40bHdXbHBxb3QwVmd1Nm1sR3NpM3hmOTRhIiwiZ3JvdXBzIjpbImpvYnMtc3RhdHVzX2NoYW5nZWQiLCJjb250cm9sLWxpbWl0X3JlYWNoZWRfMSJdfQ==	2020-03-21 22:12:01.726532+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: main_activitystream; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream (id, operation, "timestamp", changes, object_relationship_type, object1, object2, actor_id, setting, deleted_actor, action_node) FROM stdin;
1	create	2020-03-21 21:10:06.303177+00	{"name": "Machine", "description": "", "kind": "ssh", "id": 1}		credential_type		\N	{}	\N	
2	create	2020-03-21 21:10:06.317698+00	{"name": "Source Control", "description": "", "kind": "scm", "id": 2}		credential_type		\N	{}	\N	
3	create	2020-03-21 21:10:06.326517+00	{"name": "Vault", "description": "", "kind": "vault", "id": 3}		credential_type		\N	{}	\N	
4	create	2020-03-21 21:10:06.334876+00	{"name": "Network", "description": "", "kind": "net", "id": 4}		credential_type		\N	{}	\N	
5	create	2020-03-21 21:10:06.343218+00	{"name": "Amazon Web Services", "description": "", "kind": "cloud", "id": 5}		credential_type		\N	{}	\N	
6	create	2020-03-21 21:10:06.356429+00	{"name": "OpenStack", "description": "", "kind": "cloud", "id": 6}		credential_type		\N	{}	\N	
7	create	2020-03-21 21:10:06.366994+00	{"name": "VMware vCenter", "description": "", "kind": "cloud", "id": 7}		credential_type		\N	{}	\N	
8	create	2020-03-21 21:10:06.377079+00	{"name": "Red Hat Satellite 6", "description": "", "kind": "cloud", "id": 8}		credential_type		\N	{}	\N	
9	create	2020-03-21 21:10:06.387744+00	{"name": "Red Hat CloudForms", "description": "", "kind": "cloud", "id": 9}		credential_type		\N	{}	\N	
10	create	2020-03-21 21:10:06.397496+00	{"name": "Google Compute Engine", "description": "", "kind": "cloud", "id": 10}		credential_type		\N	{}	\N	
11	create	2020-03-21 21:10:06.407905+00	{"name": "Microsoft Azure Resource Manager", "description": "", "kind": "cloud", "id": 11}		credential_type		\N	{}	\N	
12	create	2020-03-21 21:10:06.420008+00	{"name": "GitHub Personal Access Token", "description": "", "kind": "token", "id": 12}		credential_type		\N	{}	\N	
13	create	2020-03-21 21:10:06.431733+00	{"name": "GitLab Personal Access Token", "description": "", "kind": "token", "id": 13}		credential_type		\N	{}	\N	
14	create	2020-03-21 21:10:06.443939+00	{"name": "Insights", "description": "", "kind": "insights", "id": 14}		credential_type		\N	{}	\N	
15	create	2020-03-21 21:10:06.4582+00	{"name": "Red Hat Virtualization", "description": "", "kind": "cloud", "id": 15}		credential_type		\N	{}	\N	
16	create	2020-03-21 21:10:06.471595+00	{"name": "Ansible Tower", "description": "", "kind": "cloud", "id": 16}		credential_type		\N	{}	\N	
17	create	2020-03-21 21:10:06.484327+00	{"name": "OpenShift or Kubernetes API Bearer Token", "description": "", "kind": "kubernetes", "id": 17}		credential_type		\N	{}	\N	
18	create	2020-03-21 21:10:06.49472+00	{"name": "CyberArk AIM Central Credential Provider Lookup", "description": "", "kind": "external", "id": 18}		credential_type		\N	{}	\N	
19	create	2020-03-21 21:10:06.505468+00	{"name": "Microsoft Azure Key Vault", "description": "", "kind": "external", "id": 19}		credential_type		\N	{}	\N	
20	create	2020-03-21 21:10:06.517123+00	{"name": "CyberArk Conjur Secret Lookup", "description": "", "kind": "external", "id": 20}		credential_type		\N	{}	\N	
21	create	2020-03-21 21:10:06.526735+00	{"name": "HashiCorp Vault Secret Lookup", "description": "", "kind": "external", "id": 21}		credential_type		\N	{}	\N	
22	create	2020-03-21 21:10:06.538666+00	{"name": "HashiCorp Vault Signed SSH", "description": "", "kind": "external", "id": 22}		credential_type		\N	{}	\N	
23	create	2020-03-21 21:10:53.77825+00	{"username": "root", "first_name": "", "last_name": "", "email": "root@localhost", "is_superuser": true, "password": "hidden", "id": 1}		user		\N	{}	\N	awx
24	create	2020-03-21 21:10:57.120996+00	{"name": "Default", "description": "", "max_hosts": 0, "custom_virtualenv": null, "id": 1}		organization		1	{}	{"id": 1, "username": "root", "first_name": "", "last_name": ""}	awx
25	create	2020-03-21 21:10:57.212577+00	{"name": "Demo Project", "description": "", "local_path": "", "scm_type": "git", "scm_url": "https://github.com/ansible/ansible-tower-samples", "scm_branch": "", "scm_refspec": "", "scm_clean": false, "scm_delete_on_update": false, "credential": null, "timeout": 0, "organization": "Default-1", "scm_update_on_launch": true, "scm_update_cache_timeout": 0, "allow_override": false, "custom_virtualenv": null, "id": 6}		project		1	{}	{"id": 1, "username": "root", "first_name": "", "last_name": ""}	awx
26	create	2020-03-21 21:10:57.294176+00	{"name": "Demo Credential", "description": "", "organization": null, "credential_type": "Machine-1", "inputs": "hidden", "id": 1}		credential		1	{}	{"id": 1, "username": "root", "first_name": "", "last_name": ""}	awx
27	associate	2020-03-21 21:10:57.32011+00	{"object1": "credential", "object1_pk": 1, "object2": "user", "object2_pk": 1, "action": "associate", "relationship": "awx.main.models.rbac.Role_members"}	awx.main.models.credential.Credential.admin_role	credential	user	1	{}	{"id": 1, "username": "root", "first_name": "", "last_name": ""}	awx
28	create	2020-03-21 21:10:57.431473+00	{"name": "Demo Inventory", "description": "", "organization": "Default-1", "kind": "", "host_filter": null, "variables": "", "insights_credential": null, "id": 1}		inventory		1	{}	{"id": 1, "username": "root", "first_name": "", "last_name": ""}	awx
29	create	2020-03-21 21:10:57.443291+00	{"name": "localhost", "description": "", "inventory": "Demo Inventory-1", "enabled": true, "instance_id": "", "variables": "ansible_connection: local\\nansible_python_interpreter: '{{ ansible_playbook_python }}'", "id": 1}		host		1	{}	{"id": 1, "username": "root", "first_name": "", "last_name": ""}	awx
30	create	2020-03-21 21:10:57.552728+00	{"name": "Demo Job Template", "description": "", "job_type": "run", "inventory": "Demo Inventory-1", "project": "Demo Project-6", "playbook": "hello_world.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "host_config_key": "", "ask_scm_branch_on_launch": false, "ask_diff_mode_on_launch": false, "ask_variables_on_launch": false, "ask_limit_on_launch": false, "ask_tags_on_launch": false, "ask_skip_tags_on_launch": false, "ask_job_type_on_launch": false, "ask_verbosity_on_launch": false, "ask_inventory_on_launch": false, "ask_credential_on_launch": false, "survey_enabled": false, "become_enabled": false, "diff_mode": false, "allow_simultaneous": false, "custom_virtualenv": null, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "survey_spec": "{}", "id": 7}		job_template		1	{}	{"id": 1, "username": "root", "first_name": "", "last_name": ""}	awx
31	associate	2020-03-21 21:10:57.564284+00	{"object1": "job_template", "object1_pk": 7, "object2": "credential", "object2_pk": 1, "action": "associate", "relationship": "awx.main.models.unified_jobs.UnifiedJobTemplate_credentials"}	awx.main.models.unified_jobs.UnifiedJobTemplate_credentials	job_template	credential	1	{}	{"id": 1, "username": "root", "first_name": "", "last_name": ""}	awx
32	create	2020-03-21 21:11:00.462183+00	{"value": "{\\"HOME\\": \\"/var/lib/awx\\"}", "id": 3}		setting		\N	{"category": "jobs", "name": "AWX_TASK_ENV"}	\N	awx
33	create	2020-03-21 21:11:07.065555+00	{"name": "tower", "credential": null, "policy_instance_percentage": 0, "policy_instance_minimum": 0, "policy_instance_list": "[]", "pod_spec_override": "", "id": 1}		instance_group		\N	{}	\N	awx
34	update	2020-03-21 21:11:07.094904+00	{"policy_instance_percentage": [0, 100]}		instance_group		\N	{}	\N	awx
\.


--
-- Data for Name: main_activitystream_ad_hoc_command; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_ad_hoc_command (id, activitystream_id, adhoccommand_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_credential (id, activitystream_id, credential_id) FROM stdin;
1	26	1
2	27	1
3	31	1
\.


--
-- Data for Name: main_activitystream_credential_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_credential_type (id, activitystream_id, credentialtype_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
9	9	9
10	10	10
11	11	11
12	12	12
13	13	13
14	14	14
15	15	15
16	16	16
17	17	17
18	18	18
19	19	19
20	20	20
21	21	21
22	22	22
\.


--
-- Data for Name: main_activitystream_custom_inventory_script; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_custom_inventory_script (id, activitystream_id, custominventoryscript_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_group (id, activitystream_id, group_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_host; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_host (id, activitystream_id, host_id) FROM stdin;
1	29	1
\.


--
-- Data for Name: main_activitystream_instance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_instance (id, activitystream_id, instance_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_instance_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_instance_group (id, activitystream_id, instancegroup_id) FROM stdin;
1	33	1
2	34	1
\.


--
-- Data for Name: main_activitystream_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_inventory (id, activitystream_id, inventory_id) FROM stdin;
1	28	1
\.


--
-- Data for Name: main_activitystream_inventory_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_inventory_source (id, activitystream_id, inventorysource_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_inventory_update; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_inventory_update (id, activitystream_id, inventoryupdate_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_job; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_job (id, activitystream_id, job_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_job_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_job_template (id, activitystream_id, jobtemplate_id) FROM stdin;
1	30	7
2	31	7
\.


--
-- Data for Name: main_activitystream_label; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_label (id, activitystream_id, label_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_notification (id, activitystream_id, notification_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_notification_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_notification_template (id, activitystream_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_o_auth2_access_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_o_auth2_access_token (id, activitystream_id, oauth2accesstoken_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_o_auth2_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_o_auth2_application (id, activitystream_id, oauth2application_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_organization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_organization (id, activitystream_id, organization_id) FROM stdin;
1	24	1
\.


--
-- Data for Name: main_activitystream_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_project (id, activitystream_id, project_id) FROM stdin;
1	25	6
\.


--
-- Data for Name: main_activitystream_project_update; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_project_update (id, activitystream_id, projectupdate_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_role (id, activitystream_id, role_id) FROM stdin;
1	27	19
\.


--
-- Data for Name: main_activitystream_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_schedule (id, activitystream_id, schedule_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_team (id, activitystream_id, team_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_unified_job; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_unified_job (id, activitystream_id, unifiedjob_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_unified_job_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_unified_job_template (id, activitystream_id, unifiedjobtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_user (id, activitystream_id, user_id) FROM stdin;
1	23	1
2	27	1
\.


--
-- Data for Name: main_activitystream_workflow_approval; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_workflow_approval (id, activitystream_id, workflowapproval_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_workflow_approval_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_workflow_approval_template (id, activitystream_id, workflowapprovaltemplate_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_workflow_job; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_workflow_job (id, activitystream_id, workflowjob_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_workflow_job_node; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_workflow_job_node (id, activitystream_id, workflowjobnode_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_workflow_job_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_workflow_job_template (id, activitystream_id, workflowjobtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_workflow_job_template_node; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_activitystream_workflow_job_template_node (id, activitystream_id, workflowjobtemplatenode_id) FROM stdin;
\.


--
-- Data for Name: main_adhoccommand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_adhoccommand (unifiedjob_ptr_id, job_type, "limit", module_name, module_args, forks, verbosity, become_enabled, credential_id, inventory_id, extra_vars, diff_mode) FROM stdin;
\.


--
-- Data for Name: main_adhoccommandevent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_adhoccommandevent (id, created, modified, host_name, event, event_data, failed, changed, counter, host_id, ad_hoc_command_id, end_line, start_line, stdout, uuid, verbosity) FROM stdin;
\.


--
-- Data for Name: main_channelgroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_channelgroup (id, "group", channels) FROM stdin;
1	jobs-status_changed	{}
2	control-limit_reached_1	{}
\.


--
-- Data for Name: main_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_credential (id, created, modified, description, name, created_by_id, modified_by_id, organization_id, admin_role_id, use_role_id, read_role_id, inputs, credential_type_id) FROM stdin;
1	2020-03-21 21:10:57.240367+00	2020-03-21 21:10:57.240385+00		Demo Credential	1	1	\N	19	20	21	{"username": "root"}	1
\.


--
-- Data for Name: main_credentialinputsource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_credentialinputsource (id, created, modified, description, input_field_name, metadata, created_by_id, modified_by_id, source_credential_id, target_credential_id) FROM stdin;
\.


--
-- Data for Name: main_credentialtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_credentialtype (id, created, modified, description, name, kind, managed_by_tower, inputs, injectors, created_by_id, modified_by_id, namespace) FROM stdin;
22	2020-03-21 21:10:06.534386+00	2020-03-21 21:10:36.378439+00		HashiCorp Vault Signed SSH	external	t	{}	{}	\N	\N	hashivault_ssh
1	2020-03-21 21:10:06.298103+00	2020-03-21 21:10:36.257401+00		Machine	ssh	t	{}	{}	\N	\N	ssh
2	2020-03-21 21:10:06.314851+00	2020-03-21 21:10:36.264279+00		Source Control	scm	t	{}	{}	\N	\N	scm
3	2020-03-21 21:10:06.323638+00	2020-03-21 21:10:36.270437+00		Vault	vault	t	{}	{}	\N	\N	vault
4	2020-03-21 21:10:06.332091+00	2020-03-21 21:10:36.275864+00		Network	net	t	{}	{}	\N	\N	net
5	2020-03-21 21:10:06.340487+00	2020-03-21 21:10:36.281107+00		Amazon Web Services	cloud	t	{}	{}	\N	\N	aws
6	2020-03-21 21:10:06.352918+00	2020-03-21 21:10:36.286404+00		OpenStack	cloud	t	{}	{}	\N	\N	openstack
7	2020-03-21 21:10:06.36362+00	2020-03-21 21:10:36.291885+00		VMware vCenter	cloud	t	{}	{}	\N	\N	vmware
8	2020-03-21 21:10:06.373901+00	2020-03-21 21:10:36.297124+00		Red Hat Satellite 6	cloud	t	{}	{}	\N	\N	satellite6
9	2020-03-21 21:10:06.384177+00	2020-03-21 21:10:36.302551+00		Red Hat CloudForms	cloud	t	{}	{}	\N	\N	cloudforms
10	2020-03-21 21:10:06.394067+00	2020-03-21 21:10:36.307733+00		Google Compute Engine	cloud	t	{}	{}	\N	\N	gce
11	2020-03-21 21:10:06.403972+00	2020-03-21 21:10:36.312883+00		Microsoft Azure Resource Manager	cloud	t	{}	{}	\N	\N	azure_rm
12	2020-03-21 21:10:06.415967+00	2020-03-21 21:10:36.31824+00		GitHub Personal Access Token	token	t	{}	{}	\N	\N	github_token
13	2020-03-21 21:10:06.427623+00	2020-03-21 21:10:36.32387+00		GitLab Personal Access Token	token	t	{}	{}	\N	\N	gitlab_token
14	2020-03-21 21:10:06.439732+00	2020-03-21 21:10:36.329634+00		Insights	insights	t	{}	{}	\N	\N	insights
15	2020-03-21 21:10:06.45311+00	2020-03-21 21:10:36.335596+00		Red Hat Virtualization	cloud	t	{}	{}	\N	\N	rhv
16	2020-03-21 21:10:06.466703+00	2020-03-21 21:10:36.341349+00		Ansible Tower	cloud	t	{}	{}	\N	\N	tower
17	2020-03-21 21:10:06.480195+00	2020-03-21 21:10:36.347456+00		OpenShift or Kubernetes API Bearer Token	kubernetes	t	{}	{}	\N	\N	kubernetes_bearer_token
18	2020-03-21 21:10:06.491285+00	2020-03-21 21:10:36.353759+00		CyberArk AIM Central Credential Provider Lookup	external	t	{}	{}	\N	\N	aim
19	2020-03-21 21:10:06.50176+00	2020-03-21 21:10:36.36+00		Microsoft Azure Key Vault	external	t	{}	{}	\N	\N	azure_kv
20	2020-03-21 21:10:06.513333+00	2020-03-21 21:10:36.366063+00		CyberArk Conjur Secret Lookup	external	t	{}	{}	\N	\N	conjur
21	2020-03-21 21:10:06.523623+00	2020-03-21 21:10:36.372441+00		HashiCorp Vault Secret Lookup	external	t	{}	{}	\N	\N	hashivault_kv
\.


--
-- Data for Name: main_custominventoryscript; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_custominventoryscript (id, created, modified, description, name, script, created_by_id, modified_by_id, organization_id, admin_role_id, read_role_id) FROM stdin;
\.


--
-- Data for Name: main_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_group (id, created, modified, description, name, variables, created_by_id, inventory_id, modified_by_id) FROM stdin;
\.


--
-- Data for Name: main_group_hosts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_group_hosts (id, group_id, host_id) FROM stdin;
\.


--
-- Data for Name: main_group_inventory_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_group_inventory_sources (id, group_id, inventorysource_id) FROM stdin;
\.


--
-- Data for Name: main_group_parents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_group_parents (id, from_group_id, to_group_id) FROM stdin;
\.


--
-- Data for Name: main_host; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_host (id, created, modified, description, name, enabled, instance_id, variables, created_by_id, inventory_id, last_job_host_summary_id, modified_by_id, last_job_id, ansible_facts, ansible_facts_modified, insights_system_id) FROM stdin;
1	2020-03-21 21:10:57.437064+00	2020-03-21 21:10:57.437082+00		localhost	t		ansible_connection: local\nansible_python_interpreter: '{{ ansible_playbook_python }}'	1	1	\N	1	\N	{}	\N	\N
\.


--
-- Data for Name: main_host_inventory_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_host_inventory_sources (id, host_id, inventorysource_id) FROM stdin;
\.


--
-- Data for Name: main_instance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_instance (id, uuid, hostname, created, modified, capacity, version, last_isolated_check, capacity_adjustment, cpu, memory, cpu_capacity, mem_capacity, enabled, managed_by_policy) FROM stdin;
1	00000000-0000-0000-0000-000000000000	awx	2020-03-21 21:11:03.740249+00	2020-03-21 21:54:24.540984+00	79	9.2.0	\N	1.00	4	10478071808	16	79	t	t
\.


--
-- Data for Name: main_instancegroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_instancegroup (id, name, created, modified, controller_id, policy_instance_list, policy_instance_minimum, policy_instance_percentage, credential_id, pod_spec_override) FROM stdin;
1	tower	2020-03-21 21:11:07.061125+00	2020-03-21 21:11:07.099348+00	\N	[]	0	100	\N	
\.


--
-- Data for Name: main_instancegroup_instances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_instancegroup_instances (id, instancegroup_id, instance_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: main_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_inventory (id, created, modified, description, name, variables, has_active_failures, total_hosts, hosts_with_active_failures, total_groups, has_inventory_sources, total_inventory_sources, inventory_sources_with_failures, created_by_id, modified_by_id, organization_id, admin_role_id, adhoc_role_id, update_role_id, use_role_id, read_role_id, host_filter, kind, pending_deletion, insights_credential_id) FROM stdin;
1	2020-03-21 21:10:57.332874+00	2020-03-21 21:10:57.332893+00		Demo Inventory		f	0	0	0	f	0	0	1	1	1	22	24	23	25	26	\N		f	\N
\.


--
-- Data for Name: main_inventoryinstancegroupmembership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_inventoryinstancegroupmembership (id, "position", instancegroup_id, inventory_id) FROM stdin;
\.


--
-- Data for Name: main_inventorysource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_inventorysource (unifiedjobtemplate_ptr_id, source, source_path, source_vars, source_regions, instance_filters, group_by, overwrite, overwrite_vars, update_on_launch, update_cache_timeout, deprecated_group_id, inventory_id, source_script_id, timeout, scm_last_revision, source_project_id, update_on_project_update, verbosity, custom_virtualenv) FROM stdin;
\.


--
-- Data for Name: main_inventoryupdate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_inventoryupdate (unifiedjob_ptr_id, source, source_path, source_vars, source_regions, instance_filters, group_by, overwrite, overwrite_vars, license_error, inventory_source_id, source_script_id, timeout, source_project_update_id, verbosity, inventory_id, custom_virtualenv, org_host_limit_error) FROM stdin;
\.


--
-- Data for Name: main_inventoryupdateevent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_inventoryupdateevent (id, created, modified, event_data, uuid, counter, stdout, verbosity, start_line, end_line, inventory_update_id) FROM stdin;
\.


--
-- Data for Name: main_job; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_job (unifiedjob_ptr_id, job_type, playbook, forks, "limit", verbosity, extra_vars, job_tags, force_handlers, skip_tags, start_at_task, become_enabled, inventory_id, job_template_id, project_id, survey_passwords, allow_simultaneous, artifacts, timeout, scm_revision, project_update_id, use_fact_cache, diff_mode, job_slice_count, job_slice_number, custom_virtualenv, scm_branch, webhook_credential_id, webhook_guid, webhook_service) FROM stdin;
\.


--
-- Data for Name: main_jobevent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_jobevent (id, created, modified, event, event_data, failed, changed, host_name, play, role, task, counter, host_id, job_id, uuid, parent_uuid, end_line, playbook, start_line, stdout, verbosity) FROM stdin;
\.


--
-- Data for Name: main_jobhostsummary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_jobhostsummary (id, created, modified, host_name, changed, dark, failures, ok, processed, skipped, failed, host_id, job_id, ignored, rescued) FROM stdin;
\.


--
-- Data for Name: main_joblaunchconfig; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_joblaunchconfig (id, extra_data, survey_passwords, char_prompts, inventory_id, job_id) FROM stdin;
\.


--
-- Data for Name: main_joblaunchconfig_credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_joblaunchconfig_credentials (id, joblaunchconfig_id, credential_id) FROM stdin;
\.


--
-- Data for Name: main_jobtemplate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_jobtemplate (unifiedjobtemplate_ptr_id, job_type, playbook, forks, "limit", verbosity, extra_vars, job_tags, force_handlers, skip_tags, start_at_task, become_enabled, host_config_key, ask_variables_on_launch, survey_enabled, survey_spec, inventory_id, project_id, admin_role_id, execute_role_id, read_role_id, ask_limit_on_launch, ask_inventory_on_launch, ask_credential_on_launch, ask_job_type_on_launch, ask_tags_on_launch, allow_simultaneous, ask_skip_tags_on_launch, timeout, use_fact_cache, ask_verbosity_on_launch, ask_diff_mode_on_launch, diff_mode, custom_virtualenv, job_slice_count, ask_scm_branch_on_launch, scm_branch, webhook_credential_id, webhook_key, webhook_service) FROM stdin;
7	run	hello_world.yml	0		0			f			f		f	f	{}	1	6	27	28	29	f	f	f	f	f	f	f	0	f	f	f	f	\N	1	f		\N		
\.


--
-- Data for Name: main_label; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_label (id, created, modified, description, name, created_by_id, modified_by_id, organization_id) FROM stdin;
\.


--
-- Data for Name: main_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_notification (id, created, modified, status, error, notifications_sent, notification_type, recipients, subject, body, notification_template_id) FROM stdin;
\.


--
-- Data for Name: main_notificationtemplate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_notificationtemplate (id, created, modified, description, name, notification_type, notification_configuration, created_by_id, modified_by_id, organization_id, messages) FROM stdin;
\.


--
-- Data for Name: main_oauth2accesstoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_oauth2accesstoken (id, token, expires, scope, created, updated, description, last_used, application_id, user_id, source_refresh_token_id, modified) FROM stdin;
\.


--
-- Data for Name: main_oauth2application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_oauth2application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, skip_authorization, created, updated, description, logo_data, user_id, organization_id) FROM stdin;
\.


--
-- Data for Name: main_organization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_organization (id, created, modified, description, name, created_by_id, modified_by_id, admin_role_id, auditor_role_id, member_role_id, read_role_id, custom_virtualenv, execute_role_id, job_template_admin_role_id, credential_admin_role_id, inventory_admin_role_id, project_admin_role_id, workflow_admin_role_id, notification_admin_role_id, max_hosts, approval_role_id) FROM stdin;
1	2020-03-21 21:10:56.964171+00	2020-03-21 21:10:56.964189+00		Default	1	1	2	10	11	12	\N	3	9	6	5	4	7	8	0	13
\.


--
-- Data for Name: main_organization_notification_templates_approvals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_organization_notification_templates_approvals (id, organization_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_organization_notification_templates_error; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_organization_notification_templates_error (id, organization_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_organization_notification_templates_started; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_organization_notification_templates_started (id, organization_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_organization_notification_templates_success; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_organization_notification_templates_success (id, organization_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_organizationinstancegroupmembership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_organizationinstancegroupmembership (id, "position", instancegroup_id, organization_id) FROM stdin;
\.


--
-- Data for Name: main_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_profile (id, created, modified, ldap_dn, user_id) FROM stdin;
1	2020-03-21 21:15:13.219087+00	2020-03-21 21:15:13.219105+00		1
\.


--
-- Data for Name: main_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_project (unifiedjobtemplate_ptr_id, local_path, scm_type, scm_url, scm_branch, scm_clean, scm_delete_on_update, scm_update_on_launch, scm_update_cache_timeout, credential_id, organization_id, admin_role_id, use_role_id, update_role_id, read_role_id, timeout, scm_revision, playbook_files, inventory_files, custom_virtualenv, scm_refspec, allow_override) FROM stdin;
6	_6__demo_project	git	https://github.com/ansible/ansible-tower-samples		f	f	t	0	\N	1	15	16	17	18	0		[]	[]	\N		f
\.


--
-- Data for Name: main_projectupdate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_projectupdate (unifiedjob_ptr_id, local_path, scm_type, scm_url, scm_branch, scm_clean, scm_delete_on_update, credential_id, project_id, timeout, job_type, scm_refspec, scm_revision, job_tags) FROM stdin;
\.


--
-- Data for Name: main_projectupdateevent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_projectupdateevent (id, created, modified, event, event_data, failed, changed, uuid, playbook, play, role, task, counter, stdout, verbosity, start_line, end_line, project_update_id) FROM stdin;
\.


--
-- Data for Name: main_rbac_role_ancestors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_rbac_role_ancestors (id, role_field, content_type_id, object_id, ancestor_id, descendent_id) FROM stdin;
1	system_administrator	0	0	1	1
2	admin_role	28	1	2	2
3	inventory_admin_role	28	1	5	5
4	member_role	28	1	11	11
5	workflow_admin_role	28	1	7	7
6	approval_role	28	1	13	13
7	system_auditor	0	0	14	14
8	job_template_admin_role	28	1	9	9
9	credential_admin_role	28	1	6	6
10	execute_role	28	1	3	3
11	read_role	28	1	12	12
12	notification_admin_role	28	1	8	8
13	auditor_role	28	1	10	10
14	project_admin_role	28	1	4	4
15	admin_role	28	1	1	2
16	read_role	28	1	11	12
17	read_role	28	1	13	12
18	read_role	28	1	3	12
19	workflow_admin_role	28	1	2	7
20	job_template_admin_role	28	1	2	9
21	read_role	28	1	5	12
22	workflow_admin_role	28	1	1	7
23	inventory_admin_role	28	1	2	5
24	notification_admin_role	28	1	2	8
25	read_role	28	1	7	12
26	execute_role	28	1	2	3
27	project_admin_role	28	1	1	4
28	project_admin_role	28	1	2	4
29	credential_admin_role	28	1	2	6
30	notification_admin_role	28	1	1	8
31	approval_role	28	1	1	13
32	read_role	28	1	6	12
33	inventory_admin_role	28	1	1	5
34	read_role	28	1	10	12
35	execute_role	28	1	1	3
36	read_role	28	1	8	12
37	read_role	28	1	9	12
38	member_role	28	1	2	11
39	credential_admin_role	28	1	1	6
40	job_template_admin_role	28	1	1	9
41	approval_role	28	1	2	13
42	member_role	28	1	1	11
43	auditor_role	28	1	14	10
44	read_role	28	1	4	12
45	read_role	28	1	14	12
46	read_role	28	1	1	12
47	read_role	28	1	2	12
48	update_role	39	6	17	17
49	admin_role	39	6	1	15
50	admin_role	39	6	4	15
51	read_role	39	6	18	18
52	use_role	39	6	16	16
53	admin_role	39	6	15	15
54	admin_role	39	6	2	15
55	read_role	39	6	14	18
56	read_role	39	6	10	18
57	read_role	39	6	17	18
58	use_role	39	6	1	16
59	update_role	39	6	1	17
60	use_role	39	6	2	16
61	read_role	39	6	16	18
62	update_role	39	6	15	17
63	use_role	39	6	4	16
64	update_role	39	6	4	17
65	update_role	39	6	2	17
66	use_role	39	6	15	16
67	read_role	39	6	1	18
68	read_role	39	6	4	18
69	read_role	39	6	2	18
70	read_role	39	6	15	18
71	use_role	20	1	20	20
72	admin_role	20	1	19	19
73	read_role	20	1	21	21
74	read_role	20	1	14	21
75	admin_role	20	1	1	19
76	read_role	20	1	19	21
77	use_role	20	1	1	20
78	use_role	20	1	19	20
79	read_role	20	1	20	21
80	read_role	20	1	1	21
81	use_role	25	1	25	25
82	read_role	25	1	10	26
83	admin_role	25	1	2	22
84	adhoc_role	25	1	24	24
85	admin_role	25	1	5	22
86	update_role	25	1	23	23
87	admin_role	25	1	1	22
88	read_role	25	1	26	26
89	admin_role	25	1	22	22
90	read_role	25	1	14	26
91	read_role	25	1	5	26
92	use_role	25	1	24	25
93	adhoc_role	25	1	2	24
94	read_role	25	1	25	26
95	adhoc_role	25	1	5	24
96	adhoc_role	25	1	1	24
97	update_role	25	1	2	23
98	adhoc_role	25	1	22	24
99	update_role	25	1	1	23
100	update_role	25	1	22	23
101	read_role	25	1	22	26
102	read_role	25	1	23	26
103	update_role	25	1	5	23
104	read_role	25	1	2	26
105	read_role	25	1	1	26
106	use_role	25	1	2	25
107	use_role	25	1	22	25
108	use_role	25	1	5	25
109	read_role	25	1	24	26
110	use_role	25	1	1	25
111	execute_role	38	7	2	28
112	execute_role	38	7	28	28
113	admin_role	38	7	9	27
114	execute_role	38	7	1	28
115	execute_role	38	7	3	28
116	read_role	38	7	29	29
117	admin_role	38	7	1	27
118	admin_role	38	7	27	27
119	read_role	38	7	14	29
120	read_role	38	7	10	29
121	admin_role	38	7	2	27
122	read_role	38	7	1	29
123	read_role	38	7	27	29
124	read_role	38	7	28	29
125	read_role	38	7	3	29
126	execute_role	38	7	27	28
127	read_role	38	7	9	29
128	execute_role	38	7	9	28
129	read_role	38	7	2	29
\.


--
-- Data for Name: main_rbac_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_rbac_roles (id, role_field, singleton_name, implicit_parents, content_type_id, object_id) FROM stdin;
1	system_administrator	system_administrator	[]	\N	\N
2	admin_role	\N	[1]	28	1
3	execute_role	\N	[2]	28	1
4	project_admin_role	\N	[2]	28	1
5	inventory_admin_role	\N	[2]	28	1
6	credential_admin_role	\N	[2]	28	1
7	workflow_admin_role	\N	[2]	28	1
8	notification_admin_role	\N	[2]	28	1
9	job_template_admin_role	\N	[2]	28	1
14	system_auditor	system_auditor	[]	\N	\N
10	auditor_role	\N	[14]	28	1
11	member_role	\N	[2]	28	1
12	read_role	\N	[3, 4, 5, 6, 7, 8, 9, 10, 11, 13]	28	1
13	approval_role	\N	[2]	28	1
15	admin_role	\N	[1, 4]	39	6
16	use_role	\N	[15]	39	6
17	update_role	\N	[15]	39	6
18	read_role	\N	[10, 14, 16, 17]	39	6
19	admin_role	\N	[1]	20	1
20	use_role	\N	[19]	20	1
21	read_role	\N	[14, 19, 20]	20	1
22	admin_role	\N	[5]	25	1
23	update_role	\N	[22]	25	1
24	adhoc_role	\N	[22]	25	1
25	use_role	\N	[24]	25	1
26	read_role	\N	[10, 22, 23, 25]	25	1
27	admin_role	\N	[9]	38	7
28	execute_role	\N	[3, 27]	38	7
29	read_role	\N	[10, 27, 28]	38	7
\.


--
-- Data for Name: main_rbac_roles_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_rbac_roles_members (id, role_id, user_id) FROM stdin;
1	1	1
2	19	1
\.


--
-- Data for Name: main_rbac_roles_parents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_rbac_roles_parents (id, from_role_id, to_role_id) FROM stdin;
1	2	1
2	3	2
3	4	2
4	5	2
5	6	2
6	7	2
7	8	2
8	9	2
9	10	14
10	11	2
11	12	3
12	12	4
13	12	5
14	12	6
15	12	7
16	12	8
17	12	9
18	12	10
19	12	11
20	12	13
21	13	2
22	15	1
23	15	4
24	16	15
25	17	15
26	18	16
27	18	17
28	18	10
29	18	14
30	19	1
31	20	19
32	21	19
33	21	20
34	21	14
35	22	5
36	23	22
37	24	22
38	25	24
39	26	25
40	26	10
41	26	22
42	26	23
43	27	9
44	28	3
45	28	27
46	29	10
47	29	27
48	29	28
\.


--
-- Data for Name: main_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_schedule (id, created, modified, description, name, enabled, dtstart, dtend, rrule, next_run, extra_data, created_by_id, modified_by_id, unified_job_template_id, char_prompts, inventory_id, survey_passwords) FROM stdin;
1	2020-03-21 21:08:40.852552+00	2020-03-21 21:08:40.852552+00	Automatically Generated Schedule	Cleanup Job Schedule	t	2020-03-22 21:08:40+00	\N	DTSTART:20200321T210840Z RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=SU	2020-03-22 21:08:40+00	{"days": "120"}	\N	\N	1	{}	\N	{}
2	2020-03-21 21:08:40.852552+00	2020-03-21 21:08:40.852552+00	Automatically Generated Schedule	Cleanup Activity Schedule	t	2020-03-24 21:08:40+00	\N	DTSTART:20200321T210840Z RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TU	2020-03-24 21:08:40+00	{"days": "355"}	\N	\N	2	{}	\N	{}
4	2020-03-21 21:10:18.119041+00	2020-03-21 21:10:18.119041+00	Cleans out expired browser sessions	Cleanup Expired Sessions	t	2020-03-21 21:10:18+00	2020-03-21 21:10:18+00	DTSTART:20200321T211018Z RRULE:FREQ=WEEKLY;INTERVAL=1;COUNT=1	\N	{}	\N	\N	4	{}	\N	{}
5	2020-03-21 21:10:18.307376+00	2020-03-21 21:10:18.307376+00	Removes expired OAuth 2 access and refresh tokens	Cleanup Expired OAuth 2 Tokens	t	2020-03-21 21:10:18+00	2020-03-21 21:10:18+00	DTSTART:20200321T211018Z RRULE:FREQ=WEEKLY;INTERVAL=1;COUNT=1	\N	{}	\N	\N	5	{}	\N	{}
\.


--
-- Data for Name: main_schedule_credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_schedule_credentials (id, schedule_id, credential_id) FROM stdin;
\.


--
-- Data for Name: main_smartinventorymembership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_smartinventorymembership (id, host_id, inventory_id) FROM stdin;
\.


--
-- Data for Name: main_systemjob; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_systemjob (unifiedjob_ptr_id, job_type, extra_vars, system_job_template_id) FROM stdin;
\.


--
-- Data for Name: main_systemjobevent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_systemjobevent (id, created, modified, event_data, uuid, counter, stdout, verbosity, start_line, end_line, system_job_id) FROM stdin;
\.


--
-- Data for Name: main_systemjobtemplate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_systemjobtemplate (unifiedjobtemplate_ptr_id, job_type) FROM stdin;
1	cleanup_jobs
2	cleanup_activitystream
4	cleanup_sessions
5	cleanup_tokens
\.


--
-- Data for Name: main_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_team (id, created, modified, description, name, created_by_id, modified_by_id, organization_id, admin_role_id, member_role_id, read_role_id) FROM stdin;
\.


--
-- Data for Name: main_toweranalyticsstate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_toweranalyticsstate (id, last_run) FROM stdin;
\.


--
-- Data for Name: main_towerschedulestate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_towerschedulestate (id, schedule_last_run) FROM stdin;
1	2020-03-21 21:54:24.573896+00
\.


--
-- Data for Name: main_unifiedjob; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_unifiedjob (id, created, modified, description, name, old_pk, launch_type, cancel_flag, status, failed, started, finished, elapsed, job_args, job_cwd, job_env, job_explanation, start_args, result_stdout_text, result_traceback, celery_task_id, created_by_id, modified_by_id, polymorphic_ctype_id, schedule_id, unified_job_template_id, execution_node, instance_group_id, emitted_events, controller_node, canceled_on, dependencies_processed) FROM stdin;
\.


--
-- Data for Name: main_unifiedjob_credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_unifiedjob_credentials (id, unifiedjob_id, credential_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjob_dependent_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_unifiedjob_dependent_jobs (id, from_unifiedjob_id, to_unifiedjob_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjob_labels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_unifiedjob_labels (id, unifiedjob_id, label_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjob_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_unifiedjob_notifications (id, unifiedjob_id, notification_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjobtemplate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_unifiedjobtemplate (id, created, modified, description, name, old_pk, last_job_failed, last_job_run, next_job_run, status, created_by_id, current_job_id, last_job_id, modified_by_id, next_schedule_id, polymorphic_ctype_id) FROM stdin;
4	2020-03-21 21:10:18.119041+00	2020-03-21 21:10:18.119041+00	Cleans out expired browser sessions	Cleanup Expired Sessions	\N	f	\N	\N	ok	\N	\N	\N	\N	\N	1
5	2020-03-21 21:10:18.307376+00	2020-03-21 21:10:18.307376+00	Cleanup expired OAuth 2 access and refresh tokens	Cleanup Expired OAuth 2 Tokens	\N	f	\N	\N	ok	\N	\N	\N	\N	\N	1
6	2020-03-21 21:10:57.12808+00	2020-03-21 21:10:57.128099+00		Demo Project	\N	f	\N	\N	never updated	1	\N	\N	1	\N	39
7	2020-03-21 21:10:57.449291+00	2020-03-21 21:10:57.449309+00		Demo Job Template	\N	f	\N	\N	never updated	1	\N	\N	1	\N	38
1	2020-03-21 21:08:40.852552+00	2020-03-21 21:08:40.852552+00	Remove job history	Cleanup Job Details	\N	f	\N	2020-03-22 21:08:40+00	ok	\N	\N	\N	\N	1	1
2	2020-03-21 21:08:40.852552+00	2020-03-21 21:08:40.852552+00	Remove activity stream history	Cleanup Activity Stream	\N	f	\N	2020-03-24 21:08:40+00	ok	\N	\N	\N	\N	2	1
\.


--
-- Data for Name: main_unifiedjobtemplate_credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_unifiedjobtemplate_credentials (id, unifiedjobtemplate_id, credential_id) FROM stdin;
1	7	1
\.


--
-- Data for Name: main_unifiedjobtemplate_labels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_unifiedjobtemplate_labels (id, unifiedjobtemplate_id, label_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjobtemplate_notification_templates_error; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_unifiedjobtemplate_notification_templates_error (id, unifiedjobtemplate_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjobtemplate_notification_templates_started; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_unifiedjobtemplate_notification_templates_started (id, unifiedjobtemplate_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjobtemplate_notification_templates_success; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_unifiedjobtemplate_notification_templates_success (id, unifiedjobtemplate_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjobtemplateinstancegroupmembership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_unifiedjobtemplateinstancegroupmembership (id, "position", instancegroup_id, unifiedjobtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_usersessionmembership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_usersessionmembership (id, created, session_id, user_id) FROM stdin;
1	2020-03-21 21:15:13.236346+00	sx0795s72zmhpiy0dl77rlq1r5wt3otl	1
\.


--
-- Data for Name: main_workflowapproval; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowapproval (unifiedjob_ptr_id, workflow_approval_template_id, timeout, timed_out, approved_or_denied_by_id) FROM stdin;
\.


--
-- Data for Name: main_workflowapprovaltemplate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowapprovaltemplate (unifiedjobtemplate_ptr_id, timeout) FROM stdin;
\.


--
-- Data for Name: main_workflowjob; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowjob (unifiedjob_ptr_id, extra_vars, workflow_job_template_id, survey_passwords, allow_simultaneous, is_sliced_job, job_template_id, char_prompts, inventory_id, webhook_credential_id, webhook_guid, webhook_service) FROM stdin;
\.


--
-- Data for Name: main_workflowjobnode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowjobnode (id, created, modified, job_id, unified_job_template_id, workflow_job_id, char_prompts, inventory_id, ancestor_artifacts, extra_data, survey_passwords, do_not_run, all_parents_must_converge) FROM stdin;
\.


--
-- Data for Name: main_workflowjobnode_always_nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowjobnode_always_nodes (id, from_workflowjobnode_id, to_workflowjobnode_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobnode_credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowjobnode_credentials (id, workflowjobnode_id, credential_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobnode_failure_nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowjobnode_failure_nodes (id, from_workflowjobnode_id, to_workflowjobnode_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobnode_success_nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowjobnode_success_nodes (id, from_workflowjobnode_id, to_workflowjobnode_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobtemplate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowjobtemplate (unifiedjobtemplate_ptr_id, extra_vars, admin_role_id, execute_role_id, organization_id, read_role_id, survey_enabled, survey_spec, allow_simultaneous, ask_variables_on_launch, ask_inventory_on_launch, inventory_id, approval_role_id, ask_limit_on_launch, ask_scm_branch_on_launch, char_prompts, webhook_credential_id, webhook_key, webhook_service) FROM stdin;
\.


--
-- Data for Name: main_workflowjobtemplate_notification_templates_approvals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowjobtemplate_notification_templates_approvals (id, workflowjobtemplate_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobtemplatenode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowjobtemplatenode (id, created, modified, unified_job_template_id, workflow_job_template_id, char_prompts, inventory_id, extra_data, survey_passwords, all_parents_must_converge) FROM stdin;
\.


--
-- Data for Name: main_workflowjobtemplatenode_always_nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowjobtemplatenode_always_nodes (id, from_workflowjobtemplatenode_id, to_workflowjobtemplatenode_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobtemplatenode_credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowjobtemplatenode_credentials (id, workflowjobtemplatenode_id, credential_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobtemplatenode_failure_nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowjobtemplatenode_failure_nodes (id, from_workflowjobtemplatenode_id, to_workflowjobtemplatenode_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobtemplatenode_success_nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_workflowjobtemplatenode_success_nodes (id, from_workflowjobtemplatenode_id, to_workflowjobtemplatenode_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated, revoked) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: sso_userenterpriseauth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sso_userenterpriseauth (id, provider, user_id) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 284, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: conf_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_setting_id_seq', 3, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 71, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 193, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: main_activitystream_ad_hoc_command_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_ad_hoc_command_id_seq', 1, false);


--
-- Name: main_activitystream_credential_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_credential_id_seq', 3, true);


--
-- Name: main_activitystream_credential_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_credential_type_id_seq', 22, true);


--
-- Name: main_activitystream_custom_inventory_script_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_custom_inventory_script_id_seq', 1, false);


--
-- Name: main_activitystream_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_group_id_seq', 1, false);


--
-- Name: main_activitystream_host_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_host_id_seq', 1, true);


--
-- Name: main_activitystream_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_id_seq', 34, true);


--
-- Name: main_activitystream_instance_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_instance_group_id_seq', 2, true);


--
-- Name: main_activitystream_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_instance_id_seq', 1, false);


--
-- Name: main_activitystream_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_inventory_id_seq', 1, true);


--
-- Name: main_activitystream_inventory_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_inventory_source_id_seq', 1, false);


--
-- Name: main_activitystream_inventory_update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_inventory_update_id_seq', 1, false);


--
-- Name: main_activitystream_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_job_id_seq', 1, false);


--
-- Name: main_activitystream_job_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_job_template_id_seq', 2, true);


--
-- Name: main_activitystream_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_label_id_seq', 1, false);


--
-- Name: main_activitystream_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_notification_id_seq', 1, false);


--
-- Name: main_activitystream_notification_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_notification_template_id_seq', 1, false);


--
-- Name: main_activitystream_o_auth2_access_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_o_auth2_access_token_id_seq', 1, false);


--
-- Name: main_activitystream_o_auth2_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_o_auth2_application_id_seq', 1, false);


--
-- Name: main_activitystream_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_organization_id_seq', 1, true);


--
-- Name: main_activitystream_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_project_id_seq', 1, true);


--
-- Name: main_activitystream_project_update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_project_update_id_seq', 1, false);


--
-- Name: main_activitystream_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_role_id_seq', 1, true);


--
-- Name: main_activitystream_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_schedule_id_seq', 1, false);


--
-- Name: main_activitystream_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_team_id_seq', 1, false);


--
-- Name: main_activitystream_unified_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_unified_job_id_seq', 1, false);


--
-- Name: main_activitystream_unified_job_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_unified_job_template_id_seq', 1, false);


--
-- Name: main_activitystream_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_user_id_seq', 2, true);


--
-- Name: main_activitystream_workflow_approval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_workflow_approval_id_seq', 1, false);


--
-- Name: main_activitystream_workflow_approval_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_workflow_approval_template_id_seq', 1, false);


--
-- Name: main_activitystream_workflow_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_workflow_job_id_seq', 1, false);


--
-- Name: main_activitystream_workflow_job_node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_workflow_job_node_id_seq', 1, false);


--
-- Name: main_activitystream_workflow_job_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_workflow_job_template_id_seq', 1, false);


--
-- Name: main_activitystream_workflow_job_template_node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_activitystream_workflow_job_template_node_id_seq', 1, false);


--
-- Name: main_adhoccommandevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_adhoccommandevent_id_seq', 1, false);


--
-- Name: main_channelgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_channelgroup_id_seq', 2, true);


--
-- Name: main_credential_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_credential_id_seq', 1, true);


--
-- Name: main_credentialinputsource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_credentialinputsource_id_seq', 1, false);


--
-- Name: main_credentialtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_credentialtype_id_seq', 22, true);


--
-- Name: main_custominventoryscript_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_custominventoryscript_id_seq', 1, false);


--
-- Name: main_group_hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_group_hosts_id_seq', 1, false);


--
-- Name: main_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_group_id_seq', 1, false);


--
-- Name: main_group_inventory_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_group_inventory_sources_id_seq', 1, false);


--
-- Name: main_group_parents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_group_parents_id_seq', 1, false);


--
-- Name: main_host_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_host_id_seq', 1, true);


--
-- Name: main_host_inventory_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_host_inventory_sources_id_seq', 1, false);


--
-- Name: main_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_instance_id_seq', 1, true);


--
-- Name: main_instancegroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_instancegroup_id_seq', 1, true);


--
-- Name: main_instancegroup_instances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_instancegroup_instances_id_seq', 1, true);


--
-- Name: main_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_inventory_id_seq', 1, true);


--
-- Name: main_inventoryinstancegroupmembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_inventoryinstancegroupmembership_id_seq', 1, false);


--
-- Name: main_inventoryupdateevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_inventoryupdateevent_id_seq', 1, false);


--
-- Name: main_jobevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_jobevent_id_seq', 1, false);


--
-- Name: main_jobhostsummary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_jobhostsummary_id_seq', 1, false);


--
-- Name: main_joblaunchconfig_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_joblaunchconfig_credentials_id_seq', 1, false);


--
-- Name: main_joblaunchconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_joblaunchconfig_id_seq', 1, false);


--
-- Name: main_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_label_id_seq', 1, false);


--
-- Name: main_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_notification_id_seq', 1, false);


--
-- Name: main_notificationtemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_notificationtemplate_id_seq', 1, false);


--
-- Name: main_oauth2accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_oauth2accesstoken_id_seq', 1, false);


--
-- Name: main_oauth2application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_oauth2application_id_seq', 1, false);


--
-- Name: main_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_organization_id_seq', 1, true);


--
-- Name: main_organization_notification_templates_approvals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_organization_notification_templates_approvals_id_seq', 1, false);


--
-- Name: main_organization_notification_templates_error_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_organization_notification_templates_error_id_seq', 1, false);


--
-- Name: main_organization_notification_templates_started_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_organization_notification_templates_started_id_seq', 1, false);


--
-- Name: main_organization_notification_templates_success_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_organization_notification_templates_success_id_seq', 1, false);


--
-- Name: main_organizationinstancegroupmembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_organizationinstancegroupmembership_id_seq', 1, false);


--
-- Name: main_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_profile_id_seq', 1, true);


--
-- Name: main_projectupdateevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_projectupdateevent_id_seq', 1, false);


--
-- Name: main_rbac_role_ancestors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_rbac_role_ancestors_id_seq', 129, true);


--
-- Name: main_rbac_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_rbac_roles_id_seq', 29, true);


--
-- Name: main_rbac_roles_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_rbac_roles_members_id_seq', 2, true);


--
-- Name: main_rbac_roles_parents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_rbac_roles_parents_id_seq', 48, true);


--
-- Name: main_schedule_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_schedule_credentials_id_seq', 1, false);


--
-- Name: main_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_schedule_id_seq', 5, true);


--
-- Name: main_smartinventorymembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_smartinventorymembership_id_seq', 1, false);


--
-- Name: main_systemjobevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_systemjobevent_id_seq', 1, false);


--
-- Name: main_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_team_id_seq', 1, false);


--
-- Name: main_toweranalyticsstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_toweranalyticsstate_id_seq', 1, false);


--
-- Name: main_towerschedulestate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_towerschedulestate_id_seq', 1, false);


--
-- Name: main_unifiedjob_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_unifiedjob_credentials_id_seq', 1, false);


--
-- Name: main_unifiedjob_dependent_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_unifiedjob_dependent_jobs_id_seq', 1, false);


--
-- Name: main_unifiedjob_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_unifiedjob_id_seq', 1, false);


--
-- Name: main_unifiedjob_labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_unifiedjob_labels_id_seq', 1, false);


--
-- Name: main_unifiedjob_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_unifiedjob_notifications_id_seq', 1, false);


--
-- Name: main_unifiedjobtemplate_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_unifiedjobtemplate_credentials_id_seq', 1, true);


--
-- Name: main_unifiedjobtemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_unifiedjobtemplate_id_seq', 7, true);


--
-- Name: main_unifiedjobtemplate_labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_unifiedjobtemplate_labels_id_seq', 1, false);


--
-- Name: main_unifiedjobtemplate_notification_templates_error_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_unifiedjobtemplate_notification_templates_error_id_seq', 1, false);


--
-- Name: main_unifiedjobtemplate_notification_templates_started_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_unifiedjobtemplate_notification_templates_started_id_seq', 1, false);


--
-- Name: main_unifiedjobtemplate_notification_templates_success_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_unifiedjobtemplate_notification_templates_success_id_seq', 1, false);


--
-- Name: main_unifiedjobtemplateinstancegroupmembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_unifiedjobtemplateinstancegroupmembership_id_seq', 1, false);


--
-- Name: main_usersessionmembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_usersessionmembership_id_seq', 1, true);


--
-- Name: main_workflowjobnode_always_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_workflowjobnode_always_nodes_id_seq', 1, false);


--
-- Name: main_workflowjobnode_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_workflowjobnode_credentials_id_seq', 1, false);


--
-- Name: main_workflowjobnode_failure_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_workflowjobnode_failure_nodes_id_seq', 1, false);


--
-- Name: main_workflowjobnode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_workflowjobnode_id_seq', 1, false);


--
-- Name: main_workflowjobnode_success_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_workflowjobnode_success_nodes_id_seq', 1, false);


--
-- Name: main_workflowjobtemplate_notification_templates_approval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_workflowjobtemplate_notification_templates_approval_id_seq', 1, false);


--
-- Name: main_workflowjobtemplatenode_always_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_workflowjobtemplatenode_always_nodes_id_seq', 1, false);


--
-- Name: main_workflowjobtemplatenode_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_workflowjobtemplatenode_credentials_id_seq', 1, false);


--
-- Name: main_workflowjobtemplatenode_failure_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_workflowjobtemplatenode_failure_nodes_id_seq', 1, false);


--
-- Name: main_workflowjobtemplatenode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_workflowjobtemplatenode_id_seq', 1, false);


--
-- Name: main_workflowjobtemplatenode_success_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_workflowjobtemplatenode_success_nodes_id_seq', 1, false);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: sso_userenterpriseauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sso_userenterpriseauth_id_seq', 1, false);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 1, false);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: conf_setting conf_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_setting
    ADD CONSTRAINT conf_setting_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_ad_hoc_command main_activitystream_ad_h_activitystream_id_adhocc_710d9648_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_ad_hoc_command
    ADD CONSTRAINT main_activitystream_ad_h_activitystream_id_adhocc_710d9648_uniq UNIQUE (activitystream_id, adhoccommand_id);


--
-- Name: main_activitystream_ad_hoc_command main_activitystream_ad_hoc_command_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_ad_hoc_command
    ADD CONSTRAINT main_activitystream_ad_hoc_command_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_credential main_activitystream_cred_activitystream_id_creden_6b3be6d5_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_credential
    ADD CONSTRAINT main_activitystream_cred_activitystream_id_creden_6b3be6d5_uniq UNIQUE (activitystream_id, credential_id);


--
-- Name: main_activitystream_credential_type main_activitystream_cred_activitystream_id_creden_85746647_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_credential_type
    ADD CONSTRAINT main_activitystream_cred_activitystream_id_creden_85746647_uniq UNIQUE (activitystream_id, credentialtype_id);


--
-- Name: main_activitystream_credential main_activitystream_credential_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_credential
    ADD CONSTRAINT main_activitystream_credential_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_credential_type main_activitystream_credential_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_credential_type
    ADD CONSTRAINT main_activitystream_credential_type_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_custom_inventory_script main_activitystream_cust_activitystream_id_custom_2e4ddecc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_custom_inventory_script
    ADD CONSTRAINT main_activitystream_cust_activitystream_id_custom_2e4ddecc_uniq UNIQUE (activitystream_id, custominventoryscript_id);


--
-- Name: main_activitystream_custom_inventory_script main_activitystream_custom_inventory_script_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_custom_inventory_script
    ADD CONSTRAINT main_activitystream_custom_inventory_script_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_group main_activitystream_grou_activitystream_id_group__3068b98d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_group
    ADD CONSTRAINT main_activitystream_grou_activitystream_id_group__3068b98d_uniq UNIQUE (activitystream_id, group_id);


--
-- Name: main_activitystream_group main_activitystream_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_group
    ADD CONSTRAINT main_activitystream_group_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_host main_activitystream_host_activitystream_id_host_i_7ec5e62e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_host
    ADD CONSTRAINT main_activitystream_host_activitystream_id_host_i_7ec5e62e_uniq UNIQUE (activitystream_id, host_id);


--
-- Name: main_activitystream_host main_activitystream_host_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_host
    ADD CONSTRAINT main_activitystream_host_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_instance_group main_activitystream_inst_activitystream_id_instan_173bfccd_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_instance_group
    ADD CONSTRAINT main_activitystream_inst_activitystream_id_instan_173bfccd_uniq UNIQUE (activitystream_id, instancegroup_id);


--
-- Name: main_activitystream_instance main_activitystream_inst_activitystream_id_instan_eba71ee1_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_instance
    ADD CONSTRAINT main_activitystream_inst_activitystream_id_instan_eba71ee1_uniq UNIQUE (activitystream_id, instance_id);


--
-- Name: main_activitystream_instance_group main_activitystream_instance_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_instance_group
    ADD CONSTRAINT main_activitystream_instance_group_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_instance main_activitystream_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_instance
    ADD CONSTRAINT main_activitystream_instance_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_inventory_update main_activitystream_inve_activitystream_id_invent_28edee6e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory_update
    ADD CONSTRAINT main_activitystream_inve_activitystream_id_invent_28edee6e_uniq UNIQUE (activitystream_id, inventoryupdate_id);


--
-- Name: main_activitystream_inventory main_activitystream_inve_activitystream_id_invent_410769d5_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory
    ADD CONSTRAINT main_activitystream_inve_activitystream_id_invent_410769d5_uniq UNIQUE (activitystream_id, inventory_id);


--
-- Name: main_activitystream_inventory_source main_activitystream_inve_activitystream_id_invent_e9d8f675_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory_source
    ADD CONSTRAINT main_activitystream_inve_activitystream_id_invent_e9d8f675_uniq UNIQUE (activitystream_id, inventorysource_id);


--
-- Name: main_activitystream_inventory main_activitystream_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory
    ADD CONSTRAINT main_activitystream_inventory_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_inventory_source main_activitystream_inventory_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory_source
    ADD CONSTRAINT main_activitystream_inventory_source_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_inventory_update main_activitystream_inventory_update_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory_update
    ADD CONSTRAINT main_activitystream_inventory_update_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_job_template main_activitystream_job__activitystream_id_jobtem_ca7c997a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_job_template
    ADD CONSTRAINT main_activitystream_job__activitystream_id_jobtem_ca7c997a_uniq UNIQUE (activitystream_id, jobtemplate_id);


--
-- Name: main_activitystream_job main_activitystream_job_activitystream_id_job_id_dbb86499_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_job
    ADD CONSTRAINT main_activitystream_job_activitystream_id_job_id_dbb86499_uniq UNIQUE (activitystream_id, job_id);


--
-- Name: main_activitystream_job main_activitystream_job_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_job
    ADD CONSTRAINT main_activitystream_job_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_job_template main_activitystream_job_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_job_template
    ADD CONSTRAINT main_activitystream_job_template_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_label main_activitystream_labe_activitystream_id_label__04ca98fb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_label
    ADD CONSTRAINT main_activitystream_labe_activitystream_id_label__04ca98fb_uniq UNIQUE (activitystream_id, label_id);


--
-- Name: main_activitystream_label main_activitystream_label_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_label
    ADD CONSTRAINT main_activitystream_label_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_notification_template main_activitystream_noti_activitystream_id_notifi_2ecdc66e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_notification_template
    ADD CONSTRAINT main_activitystream_noti_activitystream_id_notifi_2ecdc66e_uniq UNIQUE (activitystream_id, notificationtemplate_id);


--
-- Name: main_activitystream_notification main_activitystream_noti_activitystream_id_notifi_3f05835f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_notification
    ADD CONSTRAINT main_activitystream_noti_activitystream_id_notifi_3f05835f_uniq UNIQUE (activitystream_id, notification_id);


--
-- Name: main_activitystream_notification main_activitystream_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_notification
    ADD CONSTRAINT main_activitystream_notification_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_notification_template main_activitystream_notification_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_notification_template
    ADD CONSTRAINT main_activitystream_notification_template_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_o_auth2_application main_activitystream_o_au_activitystream_id_oauth2_50acf66a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_application
    ADD CONSTRAINT main_activitystream_o_au_activitystream_id_oauth2_50acf66a_uniq UNIQUE (activitystream_id, oauth2application_id);


--
-- Name: main_activitystream_o_auth2_access_token main_activitystream_o_au_activitystream_id_oauth2_625b181f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_access_token
    ADD CONSTRAINT main_activitystream_o_au_activitystream_id_oauth2_625b181f_uniq UNIQUE (activitystream_id, oauth2accesstoken_id);


--
-- Name: main_activitystream_o_auth2_access_token main_activitystream_o_auth2_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_access_token
    ADD CONSTRAINT main_activitystream_o_auth2_access_token_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_o_auth2_application main_activitystream_o_auth2_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_application
    ADD CONSTRAINT main_activitystream_o_auth2_application_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_organization main_activitystream_orga_activitystream_id_organi_ad587114_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_organization
    ADD CONSTRAINT main_activitystream_orga_activitystream_id_organi_ad587114_uniq UNIQUE (activitystream_id, organization_id);


--
-- Name: main_activitystream_organization main_activitystream_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_organization
    ADD CONSTRAINT main_activitystream_organization_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream main_activitystream_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream
    ADD CONSTRAINT main_activitystream_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_project main_activitystream_proj_activitystream_id_projec_25dcced8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_project
    ADD CONSTRAINT main_activitystream_proj_activitystream_id_projec_25dcced8_uniq UNIQUE (activitystream_id, project_id);


--
-- Name: main_activitystream_project_update main_activitystream_proj_activitystream_id_projec_a3be3a08_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_project_update
    ADD CONSTRAINT main_activitystream_proj_activitystream_id_projec_a3be3a08_uniq UNIQUE (activitystream_id, projectupdate_id);


--
-- Name: main_activitystream_project main_activitystream_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_project
    ADD CONSTRAINT main_activitystream_project_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_project_update main_activitystream_project_update_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_project_update
    ADD CONSTRAINT main_activitystream_project_update_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_role main_activitystream_role_activitystream_id_role_i_b51f6b40_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_role
    ADD CONSTRAINT main_activitystream_role_activitystream_id_role_i_b51f6b40_uniq UNIQUE (activitystream_id, role_id);


--
-- Name: main_activitystream_role main_activitystream_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_role
    ADD CONSTRAINT main_activitystream_role_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_schedule main_activitystream_sche_activitystream_id_schedu_a871c992_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_schedule
    ADD CONSTRAINT main_activitystream_sche_activitystream_id_schedu_a871c992_uniq UNIQUE (activitystream_id, schedule_id);


--
-- Name: main_activitystream_schedule main_activitystream_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_schedule
    ADD CONSTRAINT main_activitystream_schedule_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_team main_activitystream_team_activitystream_id_team_i_89af4b2a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_team
    ADD CONSTRAINT main_activitystream_team_activitystream_id_team_i_89af4b2a_uniq UNIQUE (activitystream_id, team_id);


--
-- Name: main_activitystream_team main_activitystream_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_team
    ADD CONSTRAINT main_activitystream_team_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_unified_job main_activitystream_unif_activitystream_id_unifie_0fc17da3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_unified_job
    ADD CONSTRAINT main_activitystream_unif_activitystream_id_unifie_0fc17da3_uniq UNIQUE (activitystream_id, unifiedjob_id);


--
-- Name: main_activitystream_unified_job_template main_activitystream_unif_activitystream_id_unifie_e4b906b4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_unified_job_template
    ADD CONSTRAINT main_activitystream_unif_activitystream_id_unifie_e4b906b4_uniq UNIQUE (activitystream_id, unifiedjobtemplate_id);


--
-- Name: main_activitystream_unified_job main_activitystream_unified_job_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_unified_job
    ADD CONSTRAINT main_activitystream_unified_job_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_unified_job_template main_activitystream_unified_job_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_unified_job_template
    ADD CONSTRAINT main_activitystream_unified_job_template_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_user main_activitystream_user_activitystream_id_user_i_3fa08b1e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_user
    ADD CONSTRAINT main_activitystream_user_activitystream_id_user_i_3fa08b1e_uniq UNIQUE (activitystream_id, user_id);


--
-- Name: main_activitystream_user main_activitystream_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_user
    ADD CONSTRAINT main_activitystream_user_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_workflow_approval_template main_activitystream_work_activitystream_id_workfl_6145f2cd_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval_template
    ADD CONSTRAINT main_activitystream_work_activitystream_id_workfl_6145f2cd_uniq UNIQUE (activitystream_id, workflowapprovaltemplate_id);


--
-- Name: main_activitystream_workflow_approval main_activitystream_work_activitystream_id_workfl_7c76df21_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval
    ADD CONSTRAINT main_activitystream_work_activitystream_id_workfl_7c76df21_uniq UNIQUE (activitystream_id, workflowapproval_id);


--
-- Name: main_activitystream_workflow_job_template main_activitystream_work_activitystream_id_workfl_9cf83c74_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template
    ADD CONSTRAINT main_activitystream_work_activitystream_id_workfl_9cf83c74_uniq UNIQUE (activitystream_id, workflowjobtemplate_id);


--
-- Name: main_activitystream_workflow_job main_activitystream_work_activitystream_id_workfl_bfe2d0c3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job
    ADD CONSTRAINT main_activitystream_work_activitystream_id_workfl_bfe2d0c3_uniq UNIQUE (activitystream_id, workflowjob_id);


--
-- Name: main_activitystream_workflow_job_template_node main_activitystream_work_activitystream_id_workfl_c3080a18_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template_node
    ADD CONSTRAINT main_activitystream_work_activitystream_id_workfl_c3080a18_uniq UNIQUE (activitystream_id, workflowjobtemplatenode_id);


--
-- Name: main_activitystream_workflow_job_node main_activitystream_work_activitystream_id_workfl_d615af7e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_node
    ADD CONSTRAINT main_activitystream_work_activitystream_id_workfl_d615af7e_uniq UNIQUE (activitystream_id, workflowjobnode_id);


--
-- Name: main_activitystream_workflow_approval main_activitystream_workflow_approval_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval
    ADD CONSTRAINT main_activitystream_workflow_approval_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_workflow_approval_template main_activitystream_workflow_approval_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval_template
    ADD CONSTRAINT main_activitystream_workflow_approval_template_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_workflow_job_node main_activitystream_workflow_job_node_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_node
    ADD CONSTRAINT main_activitystream_workflow_job_node_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_workflow_job main_activitystream_workflow_job_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job
    ADD CONSTRAINT main_activitystream_workflow_job_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_workflow_job_template_node main_activitystream_workflow_job_template_node_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template_node
    ADD CONSTRAINT main_activitystream_workflow_job_template_node_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_workflow_job_template main_activitystream_workflow_job_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template
    ADD CONSTRAINT main_activitystream_workflow_job_template_pkey PRIMARY KEY (id);


--
-- Name: main_adhoccommand main_adhoccommand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_adhoccommand
    ADD CONSTRAINT main_adhoccommand_pkey PRIMARY KEY (unifiedjob_ptr_id);


--
-- Name: main_adhoccommandevent main_adhoccommandevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_adhoccommandevent
    ADD CONSTRAINT main_adhoccommandevent_pkey PRIMARY KEY (id);


--
-- Name: main_channelgroup main_channelgroup_group_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_channelgroup
    ADD CONSTRAINT main_channelgroup_group_key UNIQUE ("group");


--
-- Name: main_channelgroup main_channelgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_channelgroup
    ADD CONSTRAINT main_channelgroup_pkey PRIMARY KEY (id);


--
-- Name: main_credential main_credential_organization_id_name_cre_55ee19c5_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_organization_id_name_cre_55ee19c5_uniq UNIQUE (organization_id, name, credential_type_id);


--
-- Name: main_credential main_credential_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_pkey PRIMARY KEY (id);


--
-- Name: main_credentialinputsource main_credentialinputsour_target_credential_id_inp_8e297f1b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credentialinputsource
    ADD CONSTRAINT main_credentialinputsour_target_credential_id_inp_8e297f1b_uniq UNIQUE (target_credential_id, input_field_name);


--
-- Name: main_credentialinputsource main_credentialinputsource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credentialinputsource
    ADD CONSTRAINT main_credentialinputsource_pkey PRIMARY KEY (id);


--
-- Name: main_credentialtype main_credentialtype_name_kind_af26d717_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credentialtype
    ADD CONSTRAINT main_credentialtype_name_kind_af26d717_uniq UNIQUE (name, kind);


--
-- Name: main_credentialtype main_credentialtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credentialtype
    ADD CONSTRAINT main_credentialtype_pkey PRIMARY KEY (id);


--
-- Name: main_custominventoryscript main_custominventoryscript_name_organization_id_ff151956_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_custominventoryscript
    ADD CONSTRAINT main_custominventoryscript_name_organization_id_ff151956_uniq UNIQUE (name, organization_id);


--
-- Name: main_custominventoryscript main_custominventoryscript_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_custominventoryscript
    ADD CONSTRAINT main_custominventoryscript_pkey PRIMARY KEY (id);


--
-- Name: main_group_hosts main_group_hosts_group_id_host_id_0713d0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_hosts
    ADD CONSTRAINT main_group_hosts_group_id_host_id_0713d0ac_uniq UNIQUE (group_id, host_id);


--
-- Name: main_group_hosts main_group_hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_hosts
    ADD CONSTRAINT main_group_hosts_pkey PRIMARY KEY (id);


--
-- Name: main_group_inventory_sources main_group_inventory_sou_group_id_inventorysource_dcb51e86_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_inventory_sources
    ADD CONSTRAINT main_group_inventory_sou_group_id_inventorysource_dcb51e86_uniq UNIQUE (group_id, inventorysource_id);


--
-- Name: main_group_inventory_sources main_group_inventory_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_inventory_sources
    ADD CONSTRAINT main_group_inventory_sources_pkey PRIMARY KEY (id);


--
-- Name: main_group main_group_name_inventory_id_459cfada_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group
    ADD CONSTRAINT main_group_name_inventory_id_459cfada_uniq UNIQUE (name, inventory_id);


--
-- Name: main_group_parents main_group_parents_from_group_id_to_group_id_8c9a3fcb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_parents
    ADD CONSTRAINT main_group_parents_from_group_id_to_group_id_8c9a3fcb_uniq UNIQUE (from_group_id, to_group_id);


--
-- Name: main_group_parents main_group_parents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_parents
    ADD CONSTRAINT main_group_parents_pkey PRIMARY KEY (id);


--
-- Name: main_group main_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group
    ADD CONSTRAINT main_group_pkey PRIMARY KEY (id);


--
-- Name: main_host_inventory_sources main_host_inventory_sour_host_id_inventorysource__bdf6a207_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_host_inventory_sources
    ADD CONSTRAINT main_host_inventory_sour_host_id_inventorysource__bdf6a207_uniq UNIQUE (host_id, inventorysource_id);


--
-- Name: main_host_inventory_sources main_host_inventory_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_host_inventory_sources
    ADD CONSTRAINT main_host_inventory_sources_pkey PRIMARY KEY (id);


--
-- Name: main_host main_host_name_inventory_id_45aecd68_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_host
    ADD CONSTRAINT main_host_name_inventory_id_45aecd68_uniq UNIQUE (name, inventory_id);


--
-- Name: main_host main_host_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_host
    ADD CONSTRAINT main_host_pkey PRIMARY KEY (id);


--
-- Name: main_instance main_instance_hostname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_instance
    ADD CONSTRAINT main_instance_hostname_key UNIQUE (hostname);


--
-- Name: main_instance main_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_instance
    ADD CONSTRAINT main_instance_pkey PRIMARY KEY (id);


--
-- Name: main_instancegroup_instances main_instancegroup_insta_instancegroup_id_instanc_d224c278_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_instancegroup_instances
    ADD CONSTRAINT main_instancegroup_insta_instancegroup_id_instanc_d224c278_uniq UNIQUE (instancegroup_id, instance_id);


--
-- Name: main_instancegroup_instances main_instancegroup_instances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_instancegroup_instances
    ADD CONSTRAINT main_instancegroup_instances_pkey PRIMARY KEY (id);


--
-- Name: main_instancegroup main_instancegroup_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_instancegroup
    ADD CONSTRAINT main_instancegroup_name_key UNIQUE (name);


--
-- Name: main_instancegroup main_instancegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_instancegroup
    ADD CONSTRAINT main_instancegroup_pkey PRIMARY KEY (id);


--
-- Name: main_inventory main_inventory_name_organization_id_5137f34c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_name_organization_id_5137f34c_uniq UNIQUE (name, organization_id);


--
-- Name: main_inventory main_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_pkey PRIMARY KEY (id);


--
-- Name: main_inventoryinstancegroupmembership main_inventoryinstancegroupmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventoryinstancegroupmembership
    ADD CONSTRAINT main_inventoryinstancegroupmembership_pkey PRIMARY KEY (id);


--
-- Name: main_inventorysource main_inventorysource_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventorysource
    ADD CONSTRAINT main_inventorysource_group_id_key UNIQUE (deprecated_group_id);


--
-- Name: main_inventorysource main_inventorysource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventorysource
    ADD CONSTRAINT main_inventorysource_pkey PRIMARY KEY (unifiedjobtemplate_ptr_id);


--
-- Name: main_inventoryupdate main_inventoryupdate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventoryupdate
    ADD CONSTRAINT main_inventoryupdate_pkey PRIMARY KEY (unifiedjob_ptr_id);


--
-- Name: main_inventoryupdateevent main_inventoryupdateevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventoryupdateevent
    ADD CONSTRAINT main_inventoryupdateevent_pkey PRIMARY KEY (id);


--
-- Name: main_job main_job_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_job
    ADD CONSTRAINT main_job_pkey PRIMARY KEY (unifiedjob_ptr_id);


--
-- Name: main_jobevent main_jobevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobevent
    ADD CONSTRAINT main_jobevent_pkey PRIMARY KEY (id);


--
-- Name: main_jobhostsummary main_jobhostsummary_job_id_host_name_eb22f938_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobhostsummary
    ADD CONSTRAINT main_jobhostsummary_job_id_host_name_eb22f938_uniq UNIQUE (job_id, host_name);


--
-- Name: main_jobhostsummary main_jobhostsummary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobhostsummary
    ADD CONSTRAINT main_jobhostsummary_pkey PRIMARY KEY (id);


--
-- Name: main_joblaunchconfig_credentials main_joblaunchconfig_cre_joblaunchconfig_id_crede_77f9ef8b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_joblaunchconfig_credentials
    ADD CONSTRAINT main_joblaunchconfig_cre_joblaunchconfig_id_crede_77f9ef8b_uniq UNIQUE (joblaunchconfig_id, credential_id);


--
-- Name: main_joblaunchconfig_credentials main_joblaunchconfig_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_joblaunchconfig_credentials
    ADD CONSTRAINT main_joblaunchconfig_credentials_pkey PRIMARY KEY (id);


--
-- Name: main_joblaunchconfig main_joblaunchconfig_job_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_joblaunchconfig
    ADD CONSTRAINT main_joblaunchconfig_job_id_key UNIQUE (job_id);


--
-- Name: main_joblaunchconfig main_joblaunchconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_joblaunchconfig
    ADD CONSTRAINT main_joblaunchconfig_pkey PRIMARY KEY (id);


--
-- Name: main_jobtemplate main_jobtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_pkey PRIMARY KEY (unifiedjobtemplate_ptr_id);


--
-- Name: main_label main_label_name_organization_id_f79d7ac4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_label
    ADD CONSTRAINT main_label_name_organization_id_f79d7ac4_uniq UNIQUE (name, organization_id);


--
-- Name: main_label main_label_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_label
    ADD CONSTRAINT main_label_pkey PRIMARY KEY (id);


--
-- Name: main_notification main_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notification
    ADD CONSTRAINT main_notification_pkey PRIMARY KEY (id);


--
-- Name: main_notificationtemplate main_notificationtemplate_organization_id_name_07260e01_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notificationtemplate
    ADD CONSTRAINT main_notificationtemplate_organization_id_name_07260e01_uniq UNIQUE (organization_id, name);


--
-- Name: main_notificationtemplate main_notificationtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notificationtemplate
    ADD CONSTRAINT main_notificationtemplate_pkey PRIMARY KEY (id);


--
-- Name: main_oauth2accesstoken main_oauth2accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_oauth2accesstoken
    ADD CONSTRAINT main_oauth2accesstoken_pkey PRIMARY KEY (id);


--
-- Name: main_oauth2accesstoken main_oauth2accesstoken_source_refresh_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_oauth2accesstoken
    ADD CONSTRAINT main_oauth2accesstoken_source_refresh_token_id_key UNIQUE (source_refresh_token_id);


--
-- Name: main_oauth2accesstoken main_oauth2accesstoken_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_oauth2accesstoken
    ADD CONSTRAINT main_oauth2accesstoken_token_key UNIQUE (token);


--
-- Name: main_oauth2application main_oauth2application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_oauth2application
    ADD CONSTRAINT main_oauth2application_client_id_key UNIQUE (client_id);


--
-- Name: main_oauth2application main_oauth2application_name_organization_id_55462c8e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_oauth2application
    ADD CONSTRAINT main_oauth2application_name_organization_id_55462c8e_uniq UNIQUE (name, organization_id);


--
-- Name: main_oauth2application main_oauth2application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_oauth2application
    ADD CONSTRAINT main_oauth2application_pkey PRIMARY KEY (id);


--
-- Name: main_organization main_organization_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_name_key UNIQUE (name);


--
-- Name: main_organization_notification_templates_started main_organization_notifi_organization_id_notifica_2ef43b54_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_started
    ADD CONSTRAINT main_organization_notifi_organization_id_notifica_2ef43b54_uniq UNIQUE (organization_id, notificationtemplate_id);


--
-- Name: main_organization_notification_templates_success main_organization_notifi_organization_id_notifica_3ccf8832_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_success
    ADD CONSTRAINT main_organization_notifi_organization_id_notifica_3ccf8832_uniq UNIQUE (organization_id, notificationtemplate_id);


--
-- Name: main_organization_notification_templates_error main_organization_notifi_organization_id_notifica_88aa41f6_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_error
    ADD CONSTRAINT main_organization_notifi_organization_id_notifica_88aa41f6_uniq UNIQUE (organization_id, notificationtemplate_id);


--
-- Name: main_organization_notification_templates_approvals main_organization_notifi_organization_id_notifica_ec9bb02b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_approvals
    ADD CONSTRAINT main_organization_notifi_organization_id_notifica_ec9bb02b_uniq UNIQUE (organization_id, notificationtemplate_id);


--
-- Name: main_organization_notification_templates_approvals main_organization_notification_templates_approvals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_approvals
    ADD CONSTRAINT main_organization_notification_templates_approvals_pkey PRIMARY KEY (id);


--
-- Name: main_organization_notification_templates_error main_organization_notification_templates_error_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_error
    ADD CONSTRAINT main_organization_notification_templates_error_pkey PRIMARY KEY (id);


--
-- Name: main_organization_notification_templates_started main_organization_notification_templates_started_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_started
    ADD CONSTRAINT main_organization_notification_templates_started_pkey PRIMARY KEY (id);


--
-- Name: main_organization_notification_templates_success main_organization_notification_templates_success_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_success
    ADD CONSTRAINT main_organization_notification_templates_success_pkey PRIMARY KEY (id);


--
-- Name: main_organization main_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_pkey PRIMARY KEY (id);


--
-- Name: main_organizationinstancegroupmembership main_organizationinstancegroupmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organizationinstancegroupmembership
    ADD CONSTRAINT main_organizationinstancegroupmembership_pkey PRIMARY KEY (id);


--
-- Name: main_profile main_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_profile
    ADD CONSTRAINT main_profile_pkey PRIMARY KEY (id);


--
-- Name: main_profile main_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_profile
    ADD CONSTRAINT main_profile_user_id_key UNIQUE (user_id);


--
-- Name: main_project main_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_pkey PRIMARY KEY (unifiedjobtemplate_ptr_id);


--
-- Name: main_projectupdate main_projectupdate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_projectupdate
    ADD CONSTRAINT main_projectupdate_pkey PRIMARY KEY (unifiedjob_ptr_id);


--
-- Name: main_projectupdateevent main_projectupdateevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_projectupdateevent
    ADD CONSTRAINT main_projectupdateevent_pkey PRIMARY KEY (id);


--
-- Name: main_rbac_role_ancestors main_rbac_role_ancestors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_role_ancestors
    ADD CONSTRAINT main_rbac_role_ancestors_pkey PRIMARY KEY (id);


--
-- Name: main_rbac_roles_members main_rbac_roles_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_roles_members
    ADD CONSTRAINT main_rbac_roles_members_pkey PRIMARY KEY (id);


--
-- Name: main_rbac_roles_members main_rbac_roles_members_role_id_user_id_9803c082_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_roles_members
    ADD CONSTRAINT main_rbac_roles_members_role_id_user_id_9803c082_uniq UNIQUE (role_id, user_id);


--
-- Name: main_rbac_roles_parents main_rbac_roles_parents_from_role_id_to_role_id_1ab75c81_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_roles_parents
    ADD CONSTRAINT main_rbac_roles_parents_from_role_id_to_role_id_1ab75c81_uniq UNIQUE (from_role_id, to_role_id);


--
-- Name: main_rbac_roles_parents main_rbac_roles_parents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_roles_parents
    ADD CONSTRAINT main_rbac_roles_parents_pkey PRIMARY KEY (id);


--
-- Name: main_rbac_roles main_rbac_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_roles
    ADD CONSTRAINT main_rbac_roles_pkey PRIMARY KEY (id);


--
-- Name: main_rbac_roles main_rbac_roles_singleton_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_roles
    ADD CONSTRAINT main_rbac_roles_singleton_name_key UNIQUE (singleton_name);


--
-- Name: main_schedule_credentials main_schedule_credential_schedule_id_credential_i_11bed4b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_schedule_credentials
    ADD CONSTRAINT main_schedule_credential_schedule_id_credential_i_11bed4b0_uniq UNIQUE (schedule_id, credential_id);


--
-- Name: main_schedule_credentials main_schedule_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_schedule_credentials
    ADD CONSTRAINT main_schedule_credentials_pkey PRIMARY KEY (id);


--
-- Name: main_schedule main_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_schedule
    ADD CONSTRAINT main_schedule_pkey PRIMARY KEY (id);


--
-- Name: main_schedule main_schedule_unified_job_template_id_name_9ba35d7e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_schedule
    ADD CONSTRAINT main_schedule_unified_job_template_id_name_9ba35d7e_uniq UNIQUE (unified_job_template_id, name);


--
-- Name: main_smartinventorymembership main_smartinventorymembe_host_id_inventory_id_58137be6_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_smartinventorymembership
    ADD CONSTRAINT main_smartinventorymembe_host_id_inventory_id_58137be6_uniq UNIQUE (host_id, inventory_id);


--
-- Name: main_smartinventorymembership main_smartinventorymembership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_smartinventorymembership
    ADD CONSTRAINT main_smartinventorymembership_pkey PRIMARY KEY (id);


--
-- Name: main_systemjob main_systemjob_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_systemjob
    ADD CONSTRAINT main_systemjob_pkey PRIMARY KEY (unifiedjob_ptr_id);


--
-- Name: main_systemjobevent main_systemjobevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_systemjobevent
    ADD CONSTRAINT main_systemjobevent_pkey PRIMARY KEY (id);


--
-- Name: main_systemjobtemplate main_systemjobtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_systemjobtemplate
    ADD CONSTRAINT main_systemjobtemplate_pkey PRIMARY KEY (unifiedjobtemplate_ptr_id);


--
-- Name: main_team main_team_organization_id_name_70f0184b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_organization_id_name_70f0184b_uniq UNIQUE (organization_id, name);


--
-- Name: main_team main_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_pkey PRIMARY KEY (id);


--
-- Name: main_toweranalyticsstate main_toweranalyticsstate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_toweranalyticsstate
    ADD CONSTRAINT main_toweranalyticsstate_pkey PRIMARY KEY (id);


--
-- Name: main_towerschedulestate main_towerschedulestate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_towerschedulestate
    ADD CONSTRAINT main_towerschedulestate_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjob_credentials main_unifiedjob_credenti_unifiedjob_id_credential_f4b12e17_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_credentials
    ADD CONSTRAINT main_unifiedjob_credenti_unifiedjob_id_credential_f4b12e17_uniq UNIQUE (unifiedjob_id, credential_id);


--
-- Name: main_unifiedjob_credentials main_unifiedjob_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_credentials
    ADD CONSTRAINT main_unifiedjob_credentials_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjob_dependent_jobs main_unifiedjob_dependen_from_unifiedjob_id_to_un_8ee8a967_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_dependent_jobs
    ADD CONSTRAINT main_unifiedjob_dependen_from_unifiedjob_id_to_un_8ee8a967_uniq UNIQUE (from_unifiedjob_id, to_unifiedjob_id);


--
-- Name: main_unifiedjob_dependent_jobs main_unifiedjob_dependent_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_dependent_jobs
    ADD CONSTRAINT main_unifiedjob_dependent_jobs_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjob_labels main_unifiedjob_labels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_labels
    ADD CONSTRAINT main_unifiedjob_labels_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjob_labels main_unifiedjob_labels_unifiedjob_id_label_id_f6e1dc96_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_labels
    ADD CONSTRAINT main_unifiedjob_labels_unifiedjob_id_label_id_f6e1dc96_uniq UNIQUE (unifiedjob_id, label_id);


--
-- Name: main_unifiedjob_notifications main_unifiedjob_notifica_unifiedjob_id_notificati_895ae806_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_notifications
    ADD CONSTRAINT main_unifiedjob_notifica_unifiedjob_id_notificati_895ae806_uniq UNIQUE (unifiedjob_id, notification_id);


--
-- Name: main_unifiedjob_notifications main_unifiedjob_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_notifications
    ADD CONSTRAINT main_unifiedjob_notifications_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjob main_unifiedjob_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjobtemplate_credentials main_unifiedjobtemplate__unifiedjobtemplate_id_cr_e10bc7a4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_credentials
    ADD CONSTRAINT main_unifiedjobtemplate__unifiedjobtemplate_id_cr_e10bc7a4_uniq UNIQUE (unifiedjobtemplate_id, credential_id);


--
-- Name: main_unifiedjobtemplate_labels main_unifiedjobtemplate__unifiedjobtemplate_id_la_ad69a027_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_labels
    ADD CONSTRAINT main_unifiedjobtemplate__unifiedjobtemplate_id_la_ad69a027_uniq UNIQUE (unifiedjobtemplate_id, label_id);


--
-- Name: main_unifiedjobtemplate_notification_templates_success main_unifiedjobtemplate__unifiedjobtemplate_id_no_113bd2d4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_success
    ADD CONSTRAINT main_unifiedjobtemplate__unifiedjobtemplate_id_no_113bd2d4_uniq UNIQUE (unifiedjobtemplate_id, notificationtemplate_id);


--
-- Name: main_unifiedjobtemplate_notification_templates_error main_unifiedjobtemplate__unifiedjobtemplate_id_no_172864be_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_error
    ADD CONSTRAINT main_unifiedjobtemplate__unifiedjobtemplate_id_no_172864be_uniq UNIQUE (unifiedjobtemplate_id, notificationtemplate_id);


--
-- Name: main_unifiedjobtemplate_notification_templates_started main_unifiedjobtemplate__unifiedjobtemplate_id_no_5b15714c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_started
    ADD CONSTRAINT main_unifiedjobtemplate__unifiedjobtemplate_id_no_5b15714c_uniq UNIQUE (unifiedjobtemplate_id, notificationtemplate_id);


--
-- Name: main_unifiedjobtemplate_credentials main_unifiedjobtemplate_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_credentials
    ADD CONSTRAINT main_unifiedjobtemplate_credentials_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjobtemplate_labels main_unifiedjobtemplate_labels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_labels
    ADD CONSTRAINT main_unifiedjobtemplate_labels_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjobtemplate_notification_templates_error main_unifiedjobtemplate_notification_templates_error_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_error
    ADD CONSTRAINT main_unifiedjobtemplate_notification_templates_error_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjobtemplate_notification_templates_started main_unifiedjobtemplate_notification_templates_started_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_started
    ADD CONSTRAINT main_unifiedjobtemplate_notification_templates_started_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjobtemplate_notification_templates_success main_unifiedjobtemplate_notification_templates_success_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_success
    ADD CONSTRAINT main_unifiedjobtemplate_notification_templates_success_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjobtemplate main_unifiedjobtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtemplate_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjobtemplateinstancegroupmembership main_unifiedjobtemplateinstancegroupmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplateinstancegroupmembership
    ADD CONSTRAINT main_unifiedjobtemplateinstancegroupmembership_pkey PRIMARY KEY (id);


--
-- Name: main_usersessionmembership main_usersessionmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_usersessionmembership
    ADD CONSTRAINT main_usersessionmembership_pkey PRIMARY KEY (id);


--
-- Name: main_usersessionmembership main_usersessionmembership_session_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_usersessionmembership
    ADD CONSTRAINT main_usersessionmembership_session_id_key UNIQUE (session_id);


--
-- Name: main_workflowapproval main_workflowapproval_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowapproval
    ADD CONSTRAINT main_workflowapproval_pkey PRIMARY KEY (unifiedjob_ptr_id);


--
-- Name: main_workflowapprovaltemplate main_workflowapprovaltemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowapprovaltemplate
    ADD CONSTRAINT main_workflowapprovaltemplate_pkey PRIMARY KEY (unifiedjobtemplate_ptr_id);


--
-- Name: main_workflowjob main_workflowjob_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjob
    ADD CONSTRAINT main_workflowjob_pkey PRIMARY KEY (unifiedjob_ptr_id);


--
-- Name: main_workflowjobnode_always_nodes main_workflowjobnode_alw_from_workflowjobnode_id__550e0051_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_always_nodes
    ADD CONSTRAINT main_workflowjobnode_alw_from_workflowjobnode_id__550e0051_uniq UNIQUE (from_workflowjobnode_id, to_workflowjobnode_id);


--
-- Name: main_workflowjobnode_always_nodes main_workflowjobnode_always_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_always_nodes
    ADD CONSTRAINT main_workflowjobnode_always_nodes_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobnode_credentials main_workflowjobnode_cre_workflowjobnode_id_crede_75628d2d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_credentials
    ADD CONSTRAINT main_workflowjobnode_cre_workflowjobnode_id_crede_75628d2d_uniq UNIQUE (workflowjobnode_id, credential_id);


--
-- Name: main_workflowjobnode_credentials main_workflowjobnode_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_credentials
    ADD CONSTRAINT main_workflowjobnode_credentials_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobnode_failure_nodes main_workflowjobnode_fai_from_workflowjobnode_id__355631cb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_failure_nodes
    ADD CONSTRAINT main_workflowjobnode_fai_from_workflowjobnode_id__355631cb_uniq UNIQUE (from_workflowjobnode_id, to_workflowjobnode_id);


--
-- Name: main_workflowjobnode_failure_nodes main_workflowjobnode_failure_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_failure_nodes
    ADD CONSTRAINT main_workflowjobnode_failure_nodes_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobnode main_workflowjobnode_job_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode
    ADD CONSTRAINT main_workflowjobnode_job_id_key UNIQUE (job_id);


--
-- Name: main_workflowjobnode main_workflowjobnode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode
    ADD CONSTRAINT main_workflowjobnode_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobnode_success_nodes main_workflowjobnode_suc_from_workflowjobnode_id__59094efc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_success_nodes
    ADD CONSTRAINT main_workflowjobnode_suc_from_workflowjobnode_id__59094efc_uniq UNIQUE (from_workflowjobnode_id, to_workflowjobnode_id);


--
-- Name: main_workflowjobnode_success_nodes main_workflowjobnode_success_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_success_nodes
    ADD CONSTRAINT main_workflowjobnode_success_nodes_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobtemplatenode_always_nodes main_workflowjobtemplate_from_workflowjobtemplate_01869c4a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_always_nodes
    ADD CONSTRAINT main_workflowjobtemplate_from_workflowjobtemplate_01869c4a_uniq UNIQUE (from_workflowjobtemplatenode_id, to_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplatenode_failure_nodes main_workflowjobtemplate_from_workflowjobtemplate_5f970860_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_failure_nodes
    ADD CONSTRAINT main_workflowjobtemplate_from_workflowjobtemplate_5f970860_uniq UNIQUE (from_workflowjobtemplatenode_id, to_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplatenode_success_nodes main_workflowjobtemplate_from_workflowjobtemplate_b5f4a54a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_success_nodes
    ADD CONSTRAINT main_workflowjobtemplate_from_workflowjobtemplate_b5f4a54a_uniq UNIQUE (from_workflowjobtemplatenode_id, to_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplate_notification_templates_approvals main_workflowjobtemplate_notification_templates_approvals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplate_notification_templates_approvals
    ADD CONSTRAINT main_workflowjobtemplate_notification_templates_approvals_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobtemplate main_workflowjobtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemplate_pkey PRIMARY KEY (unifiedjobtemplate_ptr_id);


--
-- Name: main_workflowjobtemplate_notification_templates_approvals main_workflowjobtemplate_workflowjobtemplate_id_n_4b1a7a0a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplate_notification_templates_approvals
    ADD CONSTRAINT main_workflowjobtemplate_workflowjobtemplate_id_n_4b1a7a0a_uniq UNIQUE (workflowjobtemplate_id, notificationtemplate_id);


--
-- Name: main_workflowjobtemplatenode_credentials main_workflowjobtemplate_workflowjobtemplatenode__a6ba785b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_credentials
    ADD CONSTRAINT main_workflowjobtemplate_workflowjobtemplatenode__a6ba785b_uniq UNIQUE (workflowjobtemplatenode_id, credential_id);


--
-- Name: main_workflowjobtemplatenode_always_nodes main_workflowjobtemplatenode_always_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_always_nodes
    ADD CONSTRAINT main_workflowjobtemplatenode_always_nodes_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobtemplatenode_credentials main_workflowjobtemplatenode_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_credentials
    ADD CONSTRAINT main_workflowjobtemplatenode_credentials_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobtemplatenode_failure_nodes main_workflowjobtemplatenode_failure_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_failure_nodes
    ADD CONSTRAINT main_workflowjobtemplatenode_failure_nodes_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobtemplatenode main_workflowjobtemplatenode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode
    ADD CONSTRAINT main_workflowjobtemplatenode_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobtemplatenode_success_nodes main_workflowjobtemplatenode_success_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_success_nodes
    ADD CONSTRAINT main_workflowjobtemplatenode_success_nodes_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq UNIQUE (token, revoked);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: sso_userenterpriseauth sso_userenterpriseauth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_userenterpriseauth
    ADD CONSTRAINT sso_userenterpriseauth_pkey PRIMARY KEY (id);


--
-- Name: sso_userenterpriseauth sso_userenterpriseauth_user_id_provider_baa07d7f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_userenterpriseauth
    ADD CONSTRAINT sso_userenterpriseauth_user_id_provider_baa07d7f_uniq UNIQUE (user_id, provider);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: conf_setting_user_id_ce9d5138; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX conf_setting_user_id_ce9d5138 ON public.conf_setting USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: host_ansible_facts_default_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX host_ansible_facts_default_gin ON public.main_host USING gin (ansible_facts jsonb_path_ops);


--
-- Name: main_activitystream_actor_id_29aafc0f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_actor_id_29aafc0f ON public.main_activitystream USING btree (actor_id);


--
-- Name: main_activitystream_ad_hoc_command_activitystream_id_870ddb01; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_ad_hoc_command_activitystream_id_870ddb01 ON public.main_activitystream_ad_hoc_command USING btree (activitystream_id);


--
-- Name: main_activitystream_ad_hoc_command_adhoccommand_id_0df7bfcd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_ad_hoc_command_adhoccommand_id_0df7bfcd ON public.main_activitystream_ad_hoc_command USING btree (adhoccommand_id);


--
-- Name: main_activitystream_credential_activitystream_id_4be1a957; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_credential_activitystream_id_4be1a957 ON public.main_activitystream_credential USING btree (activitystream_id);


--
-- Name: main_activitystream_credential_credential_id_d5911596; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_credential_credential_id_d5911596 ON public.main_activitystream_credential USING btree (credential_id);


--
-- Name: main_activitystream_credential_type_activitystream_id_b7a4b49d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_credential_type_activitystream_id_b7a4b49d ON public.main_activitystream_credential_type USING btree (activitystream_id);


--
-- Name: main_activitystream_credential_type_credentialtype_id_89572b10; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_credential_type_credentialtype_id_89572b10 ON public.main_activitystream_credential_type USING btree (credentialtype_id);


--
-- Name: main_activitystream_custom_activitystream_id_2d7243ca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_custom_activitystream_id_2d7243ca ON public.main_activitystream_custom_inventory_script USING btree (activitystream_id);


--
-- Name: main_activitystream_custom_custominventoryscript_id_9208376f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_custom_custominventoryscript_id_9208376f ON public.main_activitystream_custom_inventory_script USING btree (custominventoryscript_id);


--
-- Name: main_activitystream_group_activitystream_id_94d31559; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_group_activitystream_id_94d31559 ON public.main_activitystream_group USING btree (activitystream_id);


--
-- Name: main_activitystream_group_group_id_fd48b400; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_group_group_id_fd48b400 ON public.main_activitystream_group USING btree (group_id);


--
-- Name: main_activitystream_host_activitystream_id_c4d91cb7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_host_activitystream_id_c4d91cb7 ON public.main_activitystream_host USING btree (activitystream_id);


--
-- Name: main_activitystream_host_host_id_0e598602; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_host_host_id_0e598602 ON public.main_activitystream_host USING btree (host_id);


--
-- Name: main_activitystream_instance_activitystream_id_04ccbf32; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_instance_activitystream_id_04ccbf32 ON public.main_activitystream_instance USING btree (activitystream_id);


--
-- Name: main_activitystream_instance_group_activitystream_id_e81ef38a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_instance_group_activitystream_id_e81ef38a ON public.main_activitystream_instance_group USING btree (activitystream_id);


--
-- Name: main_activitystream_instance_group_instancegroup_id_fca49f6c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_instance_group_instancegroup_id_fca49f6c ON public.main_activitystream_instance_group USING btree (instancegroup_id);


--
-- Name: main_activitystream_instance_instance_id_d10eb669; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_instance_instance_id_d10eb669 ON public.main_activitystream_instance USING btree (instance_id);


--
-- Name: main_activitystream_invent_inventorysource_id_235e699a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_invent_inventorysource_id_235e699a ON public.main_activitystream_inventory_source USING btree (inventorysource_id);


--
-- Name: main_activitystream_invent_inventoryupdate_id_817749c5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_invent_inventoryupdate_id_817749c5 ON public.main_activitystream_inventory_update USING btree (inventoryupdate_id);


--
-- Name: main_activitystream_inventory_activitystream_id_4a1242eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_inventory_activitystream_id_4a1242eb ON public.main_activitystream_inventory USING btree (activitystream_id);


--
-- Name: main_activitystream_inventory_inventory_id_8daf9251; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_inventory_inventory_id_8daf9251 ON public.main_activitystream_inventory USING btree (inventory_id);


--
-- Name: main_activitystream_inventory_source_activitystream_id_d88c8423; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_inventory_source_activitystream_id_d88c8423 ON public.main_activitystream_inventory_source USING btree (activitystream_id);


--
-- Name: main_activitystream_inventory_update_activitystream_id_732f074a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_inventory_update_activitystream_id_732f074a ON public.main_activitystream_inventory_update USING btree (activitystream_id);


--
-- Name: main_activitystream_job_activitystream_id_b1f2ab1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_job_activitystream_id_b1f2ab1b ON public.main_activitystream_job USING btree (activitystream_id);


--
-- Name: main_activitystream_job_job_id_aa6811b5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_job_job_id_aa6811b5 ON public.main_activitystream_job USING btree (job_id);


--
-- Name: main_activitystream_job_template_activitystream_id_abd63b6d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_job_template_activitystream_id_abd63b6d ON public.main_activitystream_job_template USING btree (activitystream_id);


--
-- Name: main_activitystream_job_template_jobtemplate_id_c05e0b6c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_job_template_jobtemplate_id_c05e0b6c ON public.main_activitystream_job_template USING btree (jobtemplate_id);


--
-- Name: main_activitystream_label_activitystream_id_afd608d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_label_activitystream_id_afd608d7 ON public.main_activitystream_label USING btree (activitystream_id);


--
-- Name: main_activitystream_label_label_id_b33683fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_label_label_id_b33683fb ON public.main_activitystream_label USING btree (label_id);


--
-- Name: main_activitystream_notifi_activitystream_id_214c1789; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_notifi_activitystream_id_214c1789 ON public.main_activitystream_notification_template USING btree (activitystream_id);


--
-- Name: main_activitystream_notifi_notificationtemplate_id_96d11a5d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_notifi_notificationtemplate_id_96d11a5d ON public.main_activitystream_notification_template USING btree (notificationtemplate_id);


--
-- Name: main_activitystream_notification_activitystream_id_7d39234a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_notification_activitystream_id_7d39234a ON public.main_activitystream_notification USING btree (activitystream_id);


--
-- Name: main_activitystream_notification_notification_id_bbfaa8ac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_notification_notification_id_bbfaa8ac ON public.main_activitystream_notification USING btree (notification_id);


--
-- Name: main_activitystream_o_auth_activitystream_id_9cd33ed4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_o_auth_activitystream_id_9cd33ed4 ON public.main_activitystream_o_auth2_access_token USING btree (activitystream_id);


--
-- Name: main_activitystream_o_auth_activitystream_id_ea629ffe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_o_auth_activitystream_id_ea629ffe ON public.main_activitystream_o_auth2_application USING btree (activitystream_id);


--
-- Name: main_activitystream_o_auth_oauth2accesstoken_id_76c333c8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_o_auth_oauth2accesstoken_id_76c333c8 ON public.main_activitystream_o_auth2_access_token USING btree (oauth2accesstoken_id);


--
-- Name: main_activitystream_o_auth_oauth2application_id_23726fd8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_o_auth_oauth2application_id_23726fd8 ON public.main_activitystream_o_auth2_application USING btree (oauth2application_id);


--
-- Name: main_activitystream_organization_activitystream_id_0283e075; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_organization_activitystream_id_0283e075 ON public.main_activitystream_organization USING btree (activitystream_id);


--
-- Name: main_activitystream_organization_organization_id_8ccdfd12; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_organization_organization_id_8ccdfd12 ON public.main_activitystream_organization USING btree (organization_id);


--
-- Name: main_activitystream_project_activitystream_id_f6aa28cc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_project_activitystream_id_f6aa28cc ON public.main_activitystream_project USING btree (activitystream_id);


--
-- Name: main_activitystream_project_project_id_836f7b93; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_project_project_id_836f7b93 ON public.main_activitystream_project USING btree (project_id);


--
-- Name: main_activitystream_project_update_activitystream_id_2965eda0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_project_update_activitystream_id_2965eda0 ON public.main_activitystream_project_update USING btree (activitystream_id);


--
-- Name: main_activitystream_project_update_projectupdate_id_8ac4ba92; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_project_update_projectupdate_id_8ac4ba92 ON public.main_activitystream_project_update USING btree (projectupdate_id);


--
-- Name: main_activitystream_role_activitystream_id_d591eb98; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_role_activitystream_id_d591eb98 ON public.main_activitystream_role USING btree (activitystream_id);


--
-- Name: main_activitystream_role_role_id_e19fce37; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_role_role_id_e19fce37 ON public.main_activitystream_role USING btree (role_id);


--
-- Name: main_activitystream_schedule_activitystream_id_a5fd87ef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_schedule_activitystream_id_a5fd87ef ON public.main_activitystream_schedule USING btree (activitystream_id);


--
-- Name: main_activitystream_schedule_schedule_id_9bde99e8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_schedule_schedule_id_9bde99e8 ON public.main_activitystream_schedule USING btree (schedule_id);


--
-- Name: main_activitystream_team_activitystream_id_c4874e73; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_team_activitystream_id_c4874e73 ON public.main_activitystream_team USING btree (activitystream_id);


--
-- Name: main_activitystream_team_team_id_725f033a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_team_team_id_725f033a ON public.main_activitystream_team USING btree (team_id);


--
-- Name: main_activitystream_unifie_activitystream_id_e4ce5d15; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_unifie_activitystream_id_e4ce5d15 ON public.main_activitystream_unified_job_template USING btree (activitystream_id);


--
-- Name: main_activitystream_unifie_unifiedjobtemplate_id_71f8a21f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_unifie_unifiedjobtemplate_id_71f8a21f ON public.main_activitystream_unified_job_template USING btree (unifiedjobtemplate_id);


--
-- Name: main_activitystream_unified_job_activitystream_id_e29d497f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_unified_job_activitystream_id_e29d497f ON public.main_activitystream_unified_job USING btree (activitystream_id);


--
-- Name: main_activitystream_unified_job_unifiedjob_id_bd9f07c6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_unified_job_unifiedjob_id_bd9f07c6 ON public.main_activitystream_unified_job USING btree (unifiedjob_id);


--
-- Name: main_activitystream_user_activitystream_id_f120c9d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_user_activitystream_id_f120c9d1 ON public.main_activitystream_user USING btree (activitystream_id);


--
-- Name: main_activitystream_user_user_id_435f8320; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_user_user_id_435f8320 ON public.main_activitystream_user USING btree (user_id);


--
-- Name: main_activitystream_workfl_activitystream_id_14401444; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_workfl_activitystream_id_14401444 ON public.main_activitystream_workflow_approval USING btree (activitystream_id);


--
-- Name: main_activitystream_workfl_activitystream_id_259ad363; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_workfl_activitystream_id_259ad363 ON public.main_activitystream_workflow_job_template USING btree (activitystream_id);


--
-- Name: main_activitystream_workfl_activitystream_id_7e8e02aa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_workfl_activitystream_id_7e8e02aa ON public.main_activitystream_workflow_approval_template USING btree (activitystream_id);


--
-- Name: main_activitystream_workfl_activitystream_id_b3d1beb6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_workfl_activitystream_id_b3d1beb6 ON public.main_activitystream_workflow_job_template_node USING btree (activitystream_id);


--
-- Name: main_activitystream_workfl_activitystream_id_c8397668; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_workfl_activitystream_id_c8397668 ON public.main_activitystream_workflow_job_node USING btree (activitystream_id);


--
-- Name: main_activitystream_workfl_workflowapproval_id_8d4193a7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_workfl_workflowapproval_id_8d4193a7 ON public.main_activitystream_workflow_approval USING btree (workflowapproval_id);


--
-- Name: main_activitystream_workfl_workflowapprovaltemplate_i_93e9e097; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_workfl_workflowapprovaltemplate_i_93e9e097 ON public.main_activitystream_workflow_approval_template USING btree (workflowapprovaltemplate_id);


--
-- Name: main_activitystream_workfl_workflowjobnode_id_85bb51d6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_workfl_workflowjobnode_id_85bb51d6 ON public.main_activitystream_workflow_job_node USING btree (workflowjobnode_id);


--
-- Name: main_activitystream_workfl_workflowjobtemplate_id_efd4c1aa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_workfl_workflowjobtemplate_id_efd4c1aa ON public.main_activitystream_workflow_job_template USING btree (workflowjobtemplate_id);


--
-- Name: main_activitystream_workfl_workflowjobtemplatenode_id_a2630ab6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_workfl_workflowjobtemplatenode_id_a2630ab6 ON public.main_activitystream_workflow_job_template_node USING btree (workflowjobtemplatenode_id);


--
-- Name: main_activitystream_workflow_job_activitystream_id_93d66e38; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_workflow_job_activitystream_id_93d66e38 ON public.main_activitystream_workflow_job USING btree (activitystream_id);


--
-- Name: main_activitystream_workflow_job_workflowjob_id_c29366d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_activitystream_workflow_job_workflowjob_id_c29366d7 ON public.main_activitystream_workflow_job USING btree (workflowjob_id);


--
-- Name: main_adhoccommand_credential_id_da6b1c87; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_adhoccommand_credential_id_da6b1c87 ON public.main_adhoccommand USING btree (credential_id);


--
-- Name: main_adhoccommand_inventory_id_b29bba0e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_adhoccommand_inventory_id_b29bba0e ON public.main_adhoccommand USING btree (inventory_id);


--
-- Name: main_adhoccommandevent_ad_hoc_command_id_1721f1e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_adhoccommandevent_ad_hoc_command_id_1721f1e2 ON public.main_adhoccommandevent USING btree (ad_hoc_command_id);


--
-- Name: main_adhoccommandevent_ad_hoc_command_id_end_line_f08bd1b4_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_adhoccommandevent_ad_hoc_command_id_end_line_f08bd1b4_idx ON public.main_adhoccommandevent USING btree (ad_hoc_command_id, end_line);


--
-- Name: main_adhoccommandevent_ad_hoc_command_id_event_85c463e3_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_adhoccommandevent_ad_hoc_command_id_event_85c463e3_idx ON public.main_adhoccommandevent USING btree (ad_hoc_command_id, event);


--
-- Name: main_adhoccommandevent_ad_hoc_command_id_start__6e575dd7_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_adhoccommandevent_ad_hoc_command_id_start__6e575dd7_idx ON public.main_adhoccommandevent USING btree (ad_hoc_command_id, start_line);


--
-- Name: main_adhoccommandevent_ad_hoc_command_id_uuid_f1fab1c8_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_adhoccommandevent_ad_hoc_command_id_uuid_f1fab1c8_idx ON public.main_adhoccommandevent USING btree (ad_hoc_command_id, uuid);


--
-- Name: main_adhoccommandevent_host_id_5613e329; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_adhoccommandevent_host_id_5613e329 ON public.main_adhoccommandevent USING btree (host_id);


--
-- Name: main_channelgroup_group_d2d86fff_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_channelgroup_group_d2d86fff_like ON public.main_channelgroup USING btree ("group" varchar_pattern_ops);


--
-- Name: main_credential_admin_role_id_6cd7ab86; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_credential_admin_role_id_6cd7ab86 ON public.main_credential USING btree (admin_role_id);


--
-- Name: main_credential_created_by_id_237add04; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_credential_created_by_id_237add04 ON public.main_credential USING btree (created_by_id);


--
-- Name: main_credential_credential_type_id_0120654c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_credential_credential_type_id_0120654c ON public.main_credential USING btree (credential_type_id);


--
-- Name: main_credential_modified_by_id_c290955a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_credential_modified_by_id_c290955a ON public.main_credential USING btree (modified_by_id);


--
-- Name: main_credential_organization_id_18d4ae89; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_credential_organization_id_18d4ae89 ON public.main_credential USING btree (organization_id);


--
-- Name: main_credential_read_role_id_12be41a2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_credential_read_role_id_12be41a2 ON public.main_credential USING btree (read_role_id);


--
-- Name: main_credential_use_role_id_122159d4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_credential_use_role_id_122159d4 ON public.main_credential USING btree (use_role_id);


--
-- Name: main_credentialinputsource_created_by_id_d2dc637c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_credentialinputsource_created_by_id_d2dc637c ON public.main_credentialinputsource USING btree (created_by_id);


--
-- Name: main_credentialinputsource_modified_by_id_e3fd88dd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_credentialinputsource_modified_by_id_e3fd88dd ON public.main_credentialinputsource USING btree (modified_by_id);


--
-- Name: main_credentialinputsource_source_credential_id_868d93af; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_credentialinputsource_source_credential_id_868d93af ON public.main_credentialinputsource USING btree (source_credential_id);


--
-- Name: main_credentialinputsource_target_credential_id_4bf0e248; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_credentialinputsource_target_credential_id_4bf0e248 ON public.main_credentialinputsource USING btree (target_credential_id);


--
-- Name: main_credentialtype_created_by_id_0f8451ed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_credentialtype_created_by_id_0f8451ed ON public.main_credentialtype USING btree (created_by_id);


--
-- Name: main_credentialtype_modified_by_id_b425580d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_credentialtype_modified_by_id_b425580d ON public.main_credentialtype USING btree (modified_by_id);


--
-- Name: main_custominventoryscript_admin_role_id_c18fcf29; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_custominventoryscript_admin_role_id_c18fcf29 ON public.main_custominventoryscript USING btree (admin_role_id);


--
-- Name: main_custominventoryscript_created_by_id_45a39526; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_custominventoryscript_created_by_id_45a39526 ON public.main_custominventoryscript USING btree (created_by_id);


--
-- Name: main_custominventoryscript_modified_by_id_6c74f1d0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_custominventoryscript_modified_by_id_6c74f1d0 ON public.main_custominventoryscript USING btree (modified_by_id);


--
-- Name: main_custominventoryscript_organization_id_b2fa3e3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_custominventoryscript_organization_id_b2fa3e3b ON public.main_custominventoryscript USING btree (organization_id);


--
-- Name: main_custominventoryscript_read_role_id_fb907425; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_custominventoryscript_read_role_id_fb907425 ON public.main_custominventoryscript USING btree (read_role_id);


--
-- Name: main_group_created_by_id_326129d5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_group_created_by_id_326129d5 ON public.main_group USING btree (created_by_id);


--
-- Name: main_group_hosts_group_id_524c3b29; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_group_hosts_group_id_524c3b29 ON public.main_group_hosts USING btree (group_id);


--
-- Name: main_group_hosts_host_id_672eaed0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_group_hosts_host_id_672eaed0 ON public.main_group_hosts USING btree (host_id);


--
-- Name: main_group_inventory_id_f9e83725; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_group_inventory_id_f9e83725 ON public.main_group USING btree (inventory_id);


--
-- Name: main_group_inventory_sources_group_id_1be295c4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_group_inventory_sources_group_id_1be295c4 ON public.main_group_inventory_sources USING btree (group_id);


--
-- Name: main_group_inventory_sources_inventorysource_id_5da14efc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_group_inventory_sources_inventorysource_id_5da14efc ON public.main_group_inventory_sources USING btree (inventorysource_id);


--
-- Name: main_group_modified_by_id_20a1b654; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_group_modified_by_id_20a1b654 ON public.main_group USING btree (modified_by_id);


--
-- Name: main_group_parents_from_group_id_9d63324d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_group_parents_from_group_id_9d63324d ON public.main_group_parents USING btree (from_group_id);


--
-- Name: main_group_parents_to_group_id_851cc1ce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_group_parents_to_group_id_851cc1ce ON public.main_group_parents USING btree (to_group_id);


--
-- Name: main_host_created_by_id_2b5e0abe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_host_created_by_id_2b5e0abe ON public.main_host USING btree (created_by_id);


--
-- Name: main_host_insights_system_id_0580b97b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_host_insights_system_id_0580b97b ON public.main_host USING btree (insights_system_id);


--
-- Name: main_host_insights_system_id_0580b97b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_host_insights_system_id_0580b97b_like ON public.main_host USING btree (insights_system_id text_pattern_ops);


--
-- Name: main_host_inventory_id_e5bcdb08; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_host_inventory_id_e5bcdb08 ON public.main_host USING btree (inventory_id);


--
-- Name: main_host_inventory_sources_host_id_03f0dcdc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_host_inventory_sources_host_id_03f0dcdc ON public.main_host_inventory_sources USING btree (host_id);


--
-- Name: main_host_inventory_sources_inventorysource_id_b25d3959; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_host_inventory_sources_inventorysource_id_b25d3959 ON public.main_host_inventory_sources USING btree (inventorysource_id);


--
-- Name: main_host_last_job_host_summary_id_b8bd727d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_host_last_job_host_summary_id_b8bd727d ON public.main_host USING btree (last_job_host_summary_id);


--
-- Name: main_host_last_job_id_d247075b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_host_last_job_id_d247075b ON public.main_host USING btree (last_job_id);


--
-- Name: main_host_modified_by_id_28b76283; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_host_modified_by_id_28b76283 ON public.main_host USING btree (modified_by_id);


--
-- Name: main_instance_hostname_f2698dae_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_instance_hostname_f2698dae_like ON public.main_instance USING btree (hostname varchar_pattern_ops);


--
-- Name: main_instancegroup_controller_id_043cd3a9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_instancegroup_controller_id_043cd3a9 ON public.main_instancegroup USING btree (controller_id);


--
-- Name: main_instancegroup_credential_id_98351d10; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_instancegroup_credential_id_98351d10 ON public.main_instancegroup USING btree (credential_id);


--
-- Name: main_instancegroup_instances_instance_id_d41cb05c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_instancegroup_instances_instance_id_d41cb05c ON public.main_instancegroup_instances USING btree (instance_id);


--
-- Name: main_instancegroup_instances_instancegroup_id_b4b19635; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_instancegroup_instances_instancegroup_id_b4b19635 ON public.main_instancegroup_instances USING btree (instancegroup_id);


--
-- Name: main_instancegroup_name_bde73070_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_instancegroup_name_bde73070_like ON public.main_instancegroup USING btree (name varchar_pattern_ops);


--
-- Name: main_inventory_adhoc_role_id_b57042aa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventory_adhoc_role_id_b57042aa ON public.main_inventory USING btree (adhoc_role_id);


--
-- Name: main_inventory_admin_role_id_3bb301cb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventory_admin_role_id_3bb301cb ON public.main_inventory USING btree (admin_role_id);


--
-- Name: main_inventory_created_by_id_5d690781; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventory_created_by_id_5d690781 ON public.main_inventory USING btree (created_by_id);


--
-- Name: main_inventory_insights_credential_id_ce91863f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventory_insights_credential_id_ce91863f ON public.main_inventory USING btree (insights_credential_id);


--
-- Name: main_inventory_modified_by_id_a4a91734; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventory_modified_by_id_a4a91734 ON public.main_inventory USING btree (modified_by_id);


--
-- Name: main_inventory_organization_id_3ee77ea9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventory_organization_id_3ee77ea9 ON public.main_inventory USING btree (organization_id);


--
-- Name: main_inventory_read_role_id_270dd070; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventory_read_role_id_270dd070 ON public.main_inventory USING btree (read_role_id);


--
-- Name: main_inventory_update_role_id_be0903a1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventory_update_role_id_be0903a1 ON public.main_inventory USING btree (update_role_id);


--
-- Name: main_inventory_use_role_id_77407b26; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventory_use_role_id_77407b26 ON public.main_inventory USING btree (use_role_id);


--
-- Name: main_inventoryinstancegroupmembership_instancegroup_id_8c752e87; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventoryinstancegroupmembership_instancegroup_id_8c752e87 ON public.main_inventoryinstancegroupmembership USING btree (instancegroup_id);


--
-- Name: main_inventoryinstancegroupmembership_inventory_id_76a877b6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventoryinstancegroupmembership_inventory_id_76a877b6 ON public.main_inventoryinstancegroupmembership USING btree (inventory_id);


--
-- Name: main_inventoryinstancegroupmembership_position_f7487717; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventoryinstancegroupmembership_position_f7487717 ON public.main_inventoryinstancegroupmembership USING btree ("position");


--
-- Name: main_inventorysource_inventory_id_3c1cac19; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventorysource_inventory_id_3c1cac19 ON public.main_inventorysource USING btree (inventory_id);


--
-- Name: main_inventorysource_source_project_id_5b9c4374; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventorysource_source_project_id_5b9c4374 ON public.main_inventorysource USING btree (source_project_id);


--
-- Name: main_inventorysource_source_script_id_03a7c8d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventorysource_source_script_id_03a7c8d7 ON public.main_inventorysource USING btree (source_script_id);


--
-- Name: main_inventoryupdate_inventory_id_e60f1f2e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventoryupdate_inventory_id_e60f1f2e ON public.main_inventoryupdate USING btree (inventory_id);


--
-- Name: main_inventoryupdate_inventory_source_id_bc4b2567; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventoryupdate_inventory_source_id_bc4b2567 ON public.main_inventoryupdate USING btree (inventory_source_id);


--
-- Name: main_inventoryupdate_source_project_update_id_b896d555; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventoryupdate_source_project_update_id_b896d555 ON public.main_inventoryupdate USING btree (source_project_update_id);


--
-- Name: main_inventoryupdate_source_script_id_f2d2c3a8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventoryupdate_source_script_id_f2d2c3a8 ON public.main_inventoryupdate USING btree (source_script_id);


--
-- Name: main_inventoryupdateeven_inventory_update_id_end__da3bcc42_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventoryupdateeven_inventory_update_id_end__da3bcc42_idx ON public.main_inventoryupdateevent USING btree (inventory_update_id, end_line);


--
-- Name: main_inventoryupdateeven_inventory_update_id_star_ee7580ed_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventoryupdateeven_inventory_update_id_star_ee7580ed_idx ON public.main_inventoryupdateevent USING btree (inventory_update_id, start_line);


--
-- Name: main_inventoryupdateevent_inventory_update_id_8974f1f7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventoryupdateevent_inventory_update_id_8974f1f7 ON public.main_inventoryupdateevent USING btree (inventory_update_id);


--
-- Name: main_inventoryupdateevent_inventory_update_id_uuid_c45a56f6_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_inventoryupdateevent_inventory_update_id_uuid_c45a56f6_idx ON public.main_inventoryupdateevent USING btree (inventory_update_id, uuid);


--
-- Name: main_job_inventory_id_1b436658; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_job_inventory_id_1b436658 ON public.main_job USING btree (inventory_id);


--
-- Name: main_job_job_template_id_070b0d56; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_job_job_template_id_070b0d56 ON public.main_job USING btree (job_template_id);


--
-- Name: main_job_project_id_a8f63894; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_job_project_id_a8f63894 ON public.main_job USING btree (project_id);


--
-- Name: main_job_project_update_id_5adf90ad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_job_project_update_id_5adf90ad ON public.main_job USING btree (project_update_id);


--
-- Name: main_job_webhook_credential_id_40ca94fa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_job_webhook_credential_id_40ca94fa ON public.main_job USING btree (webhook_credential_id);


--
-- Name: main_jobevent_created_1976e874; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobevent_created_1976e874 ON public.main_jobevent USING btree (created);


--
-- Name: main_jobevent_host_id_b03b6059; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobevent_host_id_b03b6059 ON public.main_jobevent USING btree (host_id);


--
-- Name: main_jobevent_job_id_571587e8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobevent_job_id_571587e8 ON public.main_jobevent USING btree (job_id);


--
-- Name: main_jobevent_job_id_end_line_18215490_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobevent_job_id_end_line_18215490_idx ON public.main_jobevent USING btree (job_id, end_line);


--
-- Name: main_jobevent_job_id_event_dc5f44fe_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobevent_job_id_event_dc5f44fe_idx ON public.main_jobevent USING btree (job_id, event);


--
-- Name: main_jobevent_job_id_parent_uuid_8de74312_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobevent_job_id_parent_uuid_8de74312_idx ON public.main_jobevent USING btree (job_id, parent_uuid);


--
-- Name: main_jobevent_job_id_start_line_76ab73f6_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobevent_job_id_start_line_76ab73f6_idx ON public.main_jobevent USING btree (job_id, start_line);


--
-- Name: main_jobevent_job_id_uuid_3df694c5_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobevent_job_id_uuid_3df694c5_idx ON public.main_jobevent USING btree (job_id, uuid);


--
-- Name: main_jobhostsummary_failed_42948cd9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobhostsummary_failed_42948cd9 ON public.main_jobhostsummary USING btree (failed);


--
-- Name: main_jobhostsummary_host_id_7d9f6bf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobhostsummary_host_id_7d9f6bf9 ON public.main_jobhostsummary USING btree (host_id);


--
-- Name: main_jobhostsummary_job_id_8d60afa0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobhostsummary_job_id_8d60afa0 ON public.main_jobhostsummary USING btree (job_id);


--
-- Name: main_joblaunchconfig_credentials_credential_id_2f5c0487; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_joblaunchconfig_credentials_credential_id_2f5c0487 ON public.main_joblaunchconfig_credentials USING btree (credential_id);


--
-- Name: main_joblaunchconfig_credentials_joblaunchconfig_id_37dc31b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_joblaunchconfig_credentials_joblaunchconfig_id_37dc31b9 ON public.main_joblaunchconfig_credentials USING btree (joblaunchconfig_id);


--
-- Name: main_joblaunchconfig_inventory_id_f905306d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_joblaunchconfig_inventory_id_f905306d ON public.main_joblaunchconfig USING btree (inventory_id);


--
-- Name: main_jobtemplate_admin_role_id_f9dc66ce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobtemplate_admin_role_id_f9dc66ce ON public.main_jobtemplate USING btree (admin_role_id);


--
-- Name: main_jobtemplate_execute_role_id_c2f0db2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobtemplate_execute_role_id_c2f0db2c ON public.main_jobtemplate USING btree (execute_role_id);


--
-- Name: main_jobtemplate_inventory_id_9b8df646; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobtemplate_inventory_id_9b8df646 ON public.main_jobtemplate USING btree (inventory_id);


--
-- Name: main_jobtemplate_project_id_36e80985; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobtemplate_project_id_36e80985 ON public.main_jobtemplate USING btree (project_id);


--
-- Name: main_jobtemplate_read_role_id_0e489c81; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobtemplate_read_role_id_0e489c81 ON public.main_jobtemplate USING btree (read_role_id);


--
-- Name: main_jobtemplate_webhook_credential_id_eff7fb4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_jobtemplate_webhook_credential_id_eff7fb4b ON public.main_jobtemplate USING btree (webhook_credential_id);


--
-- Name: main_label_created_by_id_201182c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_label_created_by_id_201182c0 ON public.main_label USING btree (created_by_id);


--
-- Name: main_label_modified_by_id_7f9aac68; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_label_modified_by_id_7f9aac68 ON public.main_label USING btree (modified_by_id);


--
-- Name: main_label_organization_id_78a1bd27; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_label_organization_id_78a1bd27 ON public.main_label USING btree (organization_id);


--
-- Name: main_notification_notification_template_id_9eed1d65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_notification_notification_template_id_9eed1d65 ON public.main_notification USING btree (notification_template_id);


--
-- Name: main_notificationtemplate_created_by_id_1f77983a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_notificationtemplate_created_by_id_1f77983a ON public.main_notificationtemplate USING btree (created_by_id);


--
-- Name: main_notificationtemplate_modified_by_id_83c40510; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_notificationtemplate_modified_by_id_83c40510 ON public.main_notificationtemplate USING btree (modified_by_id);


--
-- Name: main_notificationtemplate_organization_id_15933abb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_notificationtemplate_organization_id_15933abb ON public.main_notificationtemplate USING btree (organization_id);


--
-- Name: main_oauth2accesstoken_application_id_c21bc74c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_oauth2accesstoken_application_id_c21bc74c ON public.main_oauth2accesstoken USING btree (application_id);


--
-- Name: main_oauth2accesstoken_token_e3bb4f7a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_oauth2accesstoken_token_e3bb4f7a_like ON public.main_oauth2accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: main_oauth2accesstoken_user_id_71ee5fe6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_oauth2accesstoken_user_id_71ee5fe6 ON public.main_oauth2accesstoken USING btree (user_id);


--
-- Name: main_oauth2application_client_id_45882763_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_oauth2application_client_id_45882763_like ON public.main_oauth2application USING btree (client_id varchar_pattern_ops);


--
-- Name: main_oauth2application_client_secret_0b8ee789; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_oauth2application_client_secret_0b8ee789 ON public.main_oauth2application USING btree (client_secret);


--
-- Name: main_oauth2application_client_secret_0b8ee789_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_oauth2application_client_secret_0b8ee789_like ON public.main_oauth2application USING btree (client_secret varchar_pattern_ops);


--
-- Name: main_oauth2application_organization_id_5e579421; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_oauth2application_organization_id_5e579421 ON public.main_oauth2application USING btree (organization_id);


--
-- Name: main_oauth2application_user_id_c4dffdbb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_oauth2application_user_id_c4dffdbb ON public.main_oauth2application USING btree (user_id);


--
-- Name: main_organization_admin_role_id_e3ffdd41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_admin_role_id_e3ffdd41 ON public.main_organization USING btree (admin_role_id);


--
-- Name: main_organization_approval_role_id_14c1d96f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_approval_role_id_14c1d96f ON public.main_organization USING btree (approval_role_id);


--
-- Name: main_organization_auditor_role_id_f912df0a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_auditor_role_id_f912df0a ON public.main_organization USING btree (auditor_role_id);


--
-- Name: main_organization_created_by_id_141da798; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_created_by_id_141da798 ON public.main_organization USING btree (created_by_id);


--
-- Name: main_organization_credential_admin_role_id_55733eb5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_credential_admin_role_id_55733eb5 ON public.main_organization USING btree (credential_admin_role_id);


--
-- Name: main_organization_execute_role_id_76038d3c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_execute_role_id_76038d3c ON public.main_organization USING btree (execute_role_id);


--
-- Name: main_organization_inventory_admin_role_id_dae5c7e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_inventory_admin_role_id_dae5c7e2 ON public.main_organization USING btree (inventory_admin_role_id);


--
-- Name: main_organization_job_template_admin_role_id_25a265c4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_job_template_admin_role_id_25a265c4 ON public.main_organization USING btree (job_template_admin_role_id);


--
-- Name: main_organization_member_role_id_201ff67a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_member_role_id_201ff67a ON public.main_organization USING btree (member_role_id);


--
-- Name: main_organization_modified_by_id_dec7a500; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_modified_by_id_dec7a500 ON public.main_organization USING btree (modified_by_id);


--
-- Name: main_organization_name_3afd4fc6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_name_3afd4fc6_like ON public.main_organization USING btree (name varchar_pattern_ops);


--
-- Name: main_organization_notifica_notificationtemplate_id_1df2f173; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_notifica_notificationtemplate_id_1df2f173 ON public.main_organization_notification_templates_started USING btree (notificationtemplate_id);


--
-- Name: main_organization_notifica_notificationtemplate_id_392029b7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_notifica_notificationtemplate_id_392029b7 ON public.main_organization_notification_templates_approvals USING btree (notificationtemplate_id);


--
-- Name: main_organization_notifica_notificationtemplate_id_4edd98c4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_notifica_notificationtemplate_id_4edd98c4 ON public.main_organization_notification_templates_success USING btree (notificationtemplate_id);


--
-- Name: main_organization_notifica_notificationtemplate_id_7b1480c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_notifica_notificationtemplate_id_7b1480c0 ON public.main_organization_notification_templates_error USING btree (notificationtemplate_id);


--
-- Name: main_organization_notifica_organization_id_44a19957; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_notifica_organization_id_44a19957 ON public.main_organization_notification_templates_approvals USING btree (organization_id);


--
-- Name: main_organization_notifica_organization_id_48a058ac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_notifica_organization_id_48a058ac ON public.main_organization_notification_templates_started USING btree (organization_id);


--
-- Name: main_organization_notifica_organization_id_94b63d49; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_notifica_organization_id_94b63d49 ON public.main_organization_notification_templates_error USING btree (organization_id);


--
-- Name: main_organization_notifica_organization_id_96635cd6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_notifica_organization_id_96635cd6 ON public.main_organization_notification_templates_success USING btree (organization_id);


--
-- Name: main_organization_notification_admin_role_id_c36d2f0e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_notification_admin_role_id_c36d2f0e ON public.main_organization USING btree (notification_admin_role_id);


--
-- Name: main_organization_project_admin_role_id_442cfebe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_project_admin_role_id_442cfebe ON public.main_organization USING btree (project_admin_role_id);


--
-- Name: main_organization_read_role_id_e143c386; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_read_role_id_e143c386 ON public.main_organization USING btree (read_role_id);


--
-- Name: main_organization_workflow_admin_role_id_52011cd3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organization_workflow_admin_role_id_52011cd3 ON public.main_organization USING btree (workflow_admin_role_id);


--
-- Name: main_organizationinstanceg_instancegroup_id_526173a9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organizationinstanceg_instancegroup_id_526173a9 ON public.main_organizationinstancegroupmembership USING btree (instancegroup_id);


--
-- Name: main_organizationinstanceg_organization_id_35633383; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organizationinstanceg_organization_id_35633383 ON public.main_organizationinstancegroupmembership USING btree (organization_id);


--
-- Name: main_organizationinstancegroupmembership_position_00023fb0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_organizationinstancegroupmembership_position_00023fb0 ON public.main_organizationinstancegroupmembership USING btree ("position");


--
-- Name: main_project_admin_role_id_ba0e70c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_project_admin_role_id_ba0e70c7 ON public.main_project USING btree (admin_role_id);


--
-- Name: main_project_credential_id_370ba2a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_project_credential_id_370ba2a3 ON public.main_project USING btree (credential_id);


--
-- Name: main_project_organization_id_b8ff27cc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_project_organization_id_b8ff27cc ON public.main_project USING btree (organization_id);


--
-- Name: main_project_read_role_id_39a01fd4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_project_read_role_id_39a01fd4 ON public.main_project USING btree (read_role_id);


--
-- Name: main_project_update_role_id_36e33c42; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_project_update_role_id_36e33c42 ON public.main_project USING btree (update_role_id);


--
-- Name: main_project_use_role_id_7b6d9148; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_project_use_role_id_7b6d9148 ON public.main_project USING btree (use_role_id);


--
-- Name: main_projectupdate_credential_id_2f7d826a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_projectupdate_credential_id_2f7d826a ON public.main_projectupdate USING btree (credential_id);


--
-- Name: main_projectupdate_project_id_bdd73efe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_projectupdate_project_id_bdd73efe ON public.main_projectupdate USING btree (project_id);


--
-- Name: main_projectupdateevent_created_55746b86; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_projectupdateevent_created_55746b86 ON public.main_projectupdateevent USING btree (created);


--
-- Name: main_projectupdateevent_project_update_id_9d4358b2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_projectupdateevent_project_update_id_9d4358b2 ON public.main_projectupdateevent USING btree (project_update_id);


--
-- Name: main_projectupdateevent_project_update_id_end_line_59914839_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_projectupdateevent_project_update_id_end_line_59914839_idx ON public.main_projectupdateevent USING btree (project_update_id, end_line);


--
-- Name: main_projectupdateevent_project_update_id_event_d8c3c5e5_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_projectupdateevent_project_update_id_event_d8c3c5e5_idx ON public.main_projectupdateevent USING btree (project_update_id, event);


--
-- Name: main_projectupdateevent_project_update_id_start__0447b41c_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_projectupdateevent_project_update_id_start__0447b41c_idx ON public.main_projectupdateevent USING btree (project_update_id, start_line);


--
-- Name: main_projectupdateevent_project_update_id_uuid_c4ffd915_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_projectupdateevent_project_update_id_uuid_c4ffd915_idx ON public.main_projectupdateevent USING btree (project_update_id, uuid);


--
-- Name: main_rbac_role_ancestors_ancestor_id_c6aae106; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_rbac_role_ancestors_ancestor_id_c6aae106 ON public.main_rbac_role_ancestors USING btree (ancestor_id);


--
-- Name: main_rbac_role_ancestors_ancestor_id_content_type_35d994a4_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_rbac_role_ancestors_ancestor_id_content_type_35d994a4_idx ON public.main_rbac_role_ancestors USING btree (ancestor_id, content_type_id, object_id);


--
-- Name: main_rbac_role_ancestors_ancestor_id_content_type_9769b4f1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_rbac_role_ancestors_ancestor_id_content_type_9769b4f1_idx ON public.main_rbac_role_ancestors USING btree (ancestor_id, content_type_id, role_field);


--
-- Name: main_rbac_role_ancestors_ancestor_id_descendent_id_d0f3872a_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_rbac_role_ancestors_ancestor_id_descendent_id_d0f3872a_idx ON public.main_rbac_role_ancestors USING btree (ancestor_id, descendent_id);


--
-- Name: main_rbac_role_ancestors_descendent_id_23bfc463; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_rbac_role_ancestors_descendent_id_23bfc463 ON public.main_rbac_role_ancestors USING btree (descendent_id);


--
-- Name: main_rbac_roles_content_type_id_756d6b30; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_rbac_roles_content_type_id_756d6b30 ON public.main_rbac_roles USING btree (content_type_id);


--
-- Name: main_rbac_roles_content_type_id_object_id_b47703f5_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_rbac_roles_content_type_id_object_id_b47703f5_idx ON public.main_rbac_roles USING btree (content_type_id, object_id);


--
-- Name: main_rbac_roles_members_role_id_7318b4b7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_rbac_roles_members_role_id_7318b4b7 ON public.main_rbac_roles_members USING btree (role_id);


--
-- Name: main_rbac_roles_members_user_id_f5e05418; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_rbac_roles_members_user_id_f5e05418 ON public.main_rbac_roles_members USING btree (user_id);


--
-- Name: main_rbac_roles_parents_from_role_id_a02db9eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_rbac_roles_parents_from_role_id_a02db9eb ON public.main_rbac_roles_parents USING btree (from_role_id);


--
-- Name: main_rbac_roles_parents_to_role_id_c00b5087; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_rbac_roles_parents_to_role_id_c00b5087 ON public.main_rbac_roles_parents USING btree (to_role_id);


--
-- Name: main_rbac_roles_singleton_name_3f0df1dd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_rbac_roles_singleton_name_3f0df1dd_like ON public.main_rbac_roles USING btree (singleton_name text_pattern_ops);


--
-- Name: main_schedule_created_by_id_4e647be2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_schedule_created_by_id_4e647be2 ON public.main_schedule USING btree (created_by_id);


--
-- Name: main_schedule_credentials_credential_id_ced5894e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_schedule_credentials_credential_id_ced5894e ON public.main_schedule_credentials USING btree (credential_id);


--
-- Name: main_schedule_credentials_schedule_id_03ecad04; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_schedule_credentials_schedule_id_03ecad04 ON public.main_schedule_credentials USING btree (schedule_id);


--
-- Name: main_schedule_inventory_id_43b7b69d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_schedule_inventory_id_43b7b69d ON public.main_schedule USING btree (inventory_id);


--
-- Name: main_schedule_modified_by_id_3817bc47; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_schedule_modified_by_id_3817bc47 ON public.main_schedule USING btree (modified_by_id);


--
-- Name: main_schedule_unified_job_template_id_a9d931e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_schedule_unified_job_template_id_a9d931e2 ON public.main_schedule USING btree (unified_job_template_id);


--
-- Name: main_smartinventorymembership_host_id_c721cb8a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_smartinventorymembership_host_id_c721cb8a ON public.main_smartinventorymembership USING btree (host_id);


--
-- Name: main_smartinventorymembership_inventory_id_5e13df96; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_smartinventorymembership_inventory_id_5e13df96 ON public.main_smartinventorymembership USING btree (inventory_id);


--
-- Name: main_systemjob_system_job_template_id_8bba2060; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_systemjob_system_job_template_id_8bba2060 ON public.main_systemjob USING btree (system_job_template_id);


--
-- Name: main_systemjobevent_system_job_id_91bbbfc1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_systemjobevent_system_job_id_91bbbfc1 ON public.main_systemjobevent USING btree (system_job_id);


--
-- Name: main_systemjobevent_system_job_id_end_line_9bb9848e_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_systemjobevent_system_job_id_end_line_9bb9848e_idx ON public.main_systemjobevent USING btree (system_job_id, end_line);


--
-- Name: main_systemjobevent_system_job_id_start_line_60445b40_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_systemjobevent_system_job_id_start_line_60445b40_idx ON public.main_systemjobevent USING btree (system_job_id, start_line);


--
-- Name: main_systemjobevent_system_job_id_uuid_b25996b0_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_systemjobevent_system_job_id_uuid_b25996b0_idx ON public.main_systemjobevent USING btree (system_job_id, uuid);


--
-- Name: main_team_admin_role_id_a9e09a22; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_team_admin_role_id_a9e09a22 ON public.main_team USING btree (admin_role_id);


--
-- Name: main_team_created_by_id_c370350b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_team_created_by_id_c370350b ON public.main_team USING btree (created_by_id);


--
-- Name: main_team_member_role_id_a2f93dc9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_team_member_role_id_a2f93dc9 ON public.main_team USING btree (member_role_id);


--
-- Name: main_team_modified_by_id_9af533cd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_team_modified_by_id_9af533cd ON public.main_team USING btree (modified_by_id);


--
-- Name: main_team_organization_id_8b31bbc1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_team_organization_id_8b31bbc1 ON public.main_team USING btree (organization_id);


--
-- Name: main_team_read_role_id_ea02761f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_team_read_role_id_ea02761f ON public.main_team USING btree (read_role_id);


--
-- Name: main_unifiedjob_canceled_on_8695ca21; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_canceled_on_8695ca21 ON public.main_unifiedjob USING btree (canceled_on);


--
-- Name: main_unifiedjob_created_94704da7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_created_94704da7 ON public.main_unifiedjob USING btree (created);


--
-- Name: main_unifiedjob_created_by_id_d2a186ab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_created_by_id_d2a186ab ON public.main_unifiedjob USING btree (created_by_id);


--
-- Name: main_unifiedjob_credentials_credential_id_661c8f49; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_credentials_credential_id_661c8f49 ON public.main_unifiedjob_credentials USING btree (credential_id);


--
-- Name: main_unifiedjob_credentials_unifiedjob_id_4ed7ff5d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_credentials_unifiedjob_id_4ed7ff5d ON public.main_unifiedjob_credentials USING btree (unifiedjob_id);


--
-- Name: main_unifiedjob_dependent_jobs_from_unifiedjob_id_c8d58e88; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_dependent_jobs_from_unifiedjob_id_c8d58e88 ON public.main_unifiedjob_dependent_jobs USING btree (from_unifiedjob_id);


--
-- Name: main_unifiedjob_dependent_jobs_to_unifiedjob_id_3f04cbcc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_dependent_jobs_to_unifiedjob_id_3f04cbcc ON public.main_unifiedjob_dependent_jobs USING btree (to_unifiedjob_id);


--
-- Name: main_unifiedjob_finished_eccf6159; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_finished_eccf6159 ON public.main_unifiedjob USING btree (finished);


--
-- Name: main_unifiedjob_instance_group_id_f76a06e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_instance_group_id_f76a06e2 ON public.main_unifiedjob USING btree (instance_group_id);


--
-- Name: main_unifiedjob_labels_label_id_98814bad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_labels_label_id_98814bad ON public.main_unifiedjob_labels USING btree (label_id);


--
-- Name: main_unifiedjob_labels_unifiedjob_id_bd008d37; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_labels_unifiedjob_id_bd008d37 ON public.main_unifiedjob_labels USING btree (unifiedjob_id);


--
-- Name: main_unifiedjob_launch_type_f97c0639; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_launch_type_f97c0639 ON public.main_unifiedjob USING btree (launch_type);


--
-- Name: main_unifiedjob_launch_type_f97c0639_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_launch_type_f97c0639_like ON public.main_unifiedjob USING btree (launch_type varchar_pattern_ops);


--
-- Name: main_unifiedjob_modified_by_id_14cbb9bc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_modified_by_id_14cbb9bc ON public.main_unifiedjob USING btree (modified_by_id);


--
-- Name: main_unifiedjob_notifications_notification_id_cf3498bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_notifications_notification_id_cf3498bf ON public.main_unifiedjob_notifications USING btree (notification_id);


--
-- Name: main_unifiedjob_notifications_unifiedjob_id_65ab9c3c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_notifications_unifiedjob_id_65ab9c3c ON public.main_unifiedjob_notifications USING btree (unifiedjob_id);


--
-- Name: main_unifiedjob_polymorphic_ctype_id_cb46239b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_polymorphic_ctype_id_cb46239b ON public.main_unifiedjob USING btree (polymorphic_ctype_id);


--
-- Name: main_unifiedjob_schedule_id_766ca767; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_schedule_id_766ca767 ON public.main_unifiedjob USING btree (schedule_id);


--
-- Name: main_unifiedjob_status_ea421be2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_status_ea421be2 ON public.main_unifiedjob USING btree (status);


--
-- Name: main_unifiedjob_status_ea421be2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_status_ea421be2_like ON public.main_unifiedjob USING btree (status varchar_pattern_ops);


--
-- Name: main_unifiedjob_unified_job_template_id_a398b197; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjob_unified_job_template_id_a398b197 ON public.main_unifiedjob USING btree (unified_job_template_id);


--
-- Name: main_unifiedjobtemplate_cr_unifiedjobtemplate_id_d98d7c79; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_cr_unifiedjobtemplate_id_d98d7c79 ON public.main_unifiedjobtemplate_credentials USING btree (unifiedjobtemplate_id);


--
-- Name: main_unifiedjobtemplate_created_by_id_1f5fadfa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_created_by_id_1f5fadfa ON public.main_unifiedjobtemplate USING btree (created_by_id);


--
-- Name: main_unifiedjobtemplate_credentials_credential_id_fd216c80; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_credentials_credential_id_fd216c80 ON public.main_unifiedjobtemplate_credentials USING btree (credential_id);


--
-- Name: main_unifiedjobtemplate_current_job_id_8f449ab0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_current_job_id_8f449ab0 ON public.main_unifiedjobtemplate USING btree (current_job_id);


--
-- Name: main_unifiedjobtemplate_labels_label_id_d6a5ee75; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_labels_label_id_d6a5ee75 ON public.main_unifiedjobtemplate_labels USING btree (label_id);


--
-- Name: main_unifiedjobtemplate_labels_unifiedjobtemplate_id_c9307a9a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_labels_unifiedjobtemplate_id_c9307a9a ON public.main_unifiedjobtemplate_labels USING btree (unifiedjobtemplate_id);


--
-- Name: main_unifiedjobtemplate_last_job_id_7e983743; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_last_job_id_7e983743 ON public.main_unifiedjobtemplate USING btree (last_job_id);


--
-- Name: main_unifiedjobtemplate_modified_by_id_a8bf1de0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_modified_by_id_a8bf1de0 ON public.main_unifiedjobtemplate USING btree (modified_by_id);


--
-- Name: main_unifiedjobtemplate_next_schedule_id_955ff55d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_next_schedule_id_955ff55d ON public.main_unifiedjobtemplate USING btree (next_schedule_id);


--
-- Name: main_unifiedjobtemplate_no_notificationtemplate_id_9326cdf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_no_notificationtemplate_id_9326cdf9 ON public.main_unifiedjobtemplate_notification_templates_success USING btree (notificationtemplate_id);


--
-- Name: main_unifiedjobtemplate_no_notificationtemplate_id_9793a63a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_no_notificationtemplate_id_9793a63a ON public.main_unifiedjobtemplate_notification_templates_started USING btree (notificationtemplate_id);


--
-- Name: main_unifiedjobtemplate_no_notificationtemplate_id_b19df8ac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_no_notificationtemplate_id_b19df8ac ON public.main_unifiedjobtemplate_notification_templates_error USING btree (notificationtemplate_id);


--
-- Name: main_unifiedjobtemplate_no_unifiedjobtemplate_id_0ce91b23; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_no_unifiedjobtemplate_id_0ce91b23 ON public.main_unifiedjobtemplate_notification_templates_error USING btree (unifiedjobtemplate_id);


--
-- Name: main_unifiedjobtemplate_no_unifiedjobtemplate_id_3934753d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_no_unifiedjobtemplate_id_3934753d ON public.main_unifiedjobtemplate_notification_templates_success USING btree (unifiedjobtemplate_id);


--
-- Name: main_unifiedjobtemplate_no_unifiedjobtemplate_id_6e21dce4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_no_unifiedjobtemplate_id_6e21dce4 ON public.main_unifiedjobtemplate_notification_templates_started USING btree (unifiedjobtemplate_id);


--
-- Name: main_unifiedjobtemplate_polymorphic_ctype_id_ce19bb25; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplate_polymorphic_ctype_id_ce19bb25 ON public.main_unifiedjobtemplate USING btree (polymorphic_ctype_id);


--
-- Name: main_unifiedjobtemplateins_instancegroup_id_656188b4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplateins_instancegroup_id_656188b4 ON public.main_unifiedjobtemplateinstancegroupmembership USING btree (instancegroup_id);


--
-- Name: main_unifiedjobtemplateins_position_fd6edc28; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplateins_position_fd6edc28 ON public.main_unifiedjobtemplateinstancegroupmembership USING btree ("position");


--
-- Name: main_unifiedjobtemplateins_unifiedjobtemplate_id_e401e3d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_unifiedjobtemplateins_unifiedjobtemplate_id_e401e3d7 ON public.main_unifiedjobtemplateinstancegroupmembership USING btree (unifiedjobtemplate_id);


--
-- Name: main_usersessionmembership_session_id_fbab60a5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_usersessionmembership_session_id_fbab60a5_like ON public.main_usersessionmembership USING btree (session_id varchar_pattern_ops);


--
-- Name: main_usersessionmembership_user_id_fe163c98; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_usersessionmembership_user_id_fe163c98 ON public.main_usersessionmembership USING btree (user_id);


--
-- Name: main_workflowapproval_approved_or_denied_by_id_bb3eae41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowapproval_approved_or_denied_by_id_bb3eae41 ON public.main_workflowapproval USING btree (approved_or_denied_by_id);


--
-- Name: main_workflowapproval_workflow_approval_template_id_b87dda8a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowapproval_workflow_approval_template_id_b87dda8a ON public.main_workflowapproval USING btree (workflow_approval_template_id);


--
-- Name: main_workflowjob_inventory_id_8c31355b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjob_inventory_id_8c31355b ON public.main_workflowjob USING btree (inventory_id);


--
-- Name: main_workflowjob_job_template_id_cceff2a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjob_job_template_id_cceff2a3 ON public.main_workflowjob USING btree (job_template_id);


--
-- Name: main_workflowjob_webhook_credential_id_57c9fece; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjob_webhook_credential_id_57c9fece ON public.main_workflowjob USING btree (webhook_credential_id);


--
-- Name: main_workflowjob_workflow_job_template_id_0d9a93a0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjob_workflow_job_template_id_0d9a93a0 ON public.main_workflowjob USING btree (workflow_job_template_id);


--
-- Name: main_workflowjobnode_alway_from_workflowjobnode_id_19edb9d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobnode_alway_from_workflowjobnode_id_19edb9d7 ON public.main_workflowjobnode_always_nodes USING btree (from_workflowjobnode_id);


--
-- Name: main_workflowjobnode_alway_to_workflowjobnode_id_0edcda07; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobnode_alway_to_workflowjobnode_id_0edcda07 ON public.main_workflowjobnode_always_nodes USING btree (to_workflowjobnode_id);


--
-- Name: main_workflowjobnode_credentials_credential_id_6de5a410; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobnode_credentials_credential_id_6de5a410 ON public.main_workflowjobnode_credentials USING btree (credential_id);


--
-- Name: main_workflowjobnode_credentials_workflowjobnode_id_31f8c02b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobnode_credentials_workflowjobnode_id_31f8c02b ON public.main_workflowjobnode_credentials USING btree (workflowjobnode_id);


--
-- Name: main_workflowjobnode_failu_from_workflowjobnode_id_2172a110; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobnode_failu_from_workflowjobnode_id_2172a110 ON public.main_workflowjobnode_failure_nodes USING btree (from_workflowjobnode_id);


--
-- Name: main_workflowjobnode_failu_to_workflowjobnode_id_d2e09d9c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobnode_failu_to_workflowjobnode_id_d2e09d9c ON public.main_workflowjobnode_failure_nodes USING btree (to_workflowjobnode_id);


--
-- Name: main_workflowjobnode_inventory_id_1dac2da9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobnode_inventory_id_1dac2da9 ON public.main_workflowjobnode USING btree (inventory_id);


--
-- Name: main_workflowjobnode_succe_from_workflowjobnode_id_e04f9991; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobnode_succe_from_workflowjobnode_id_e04f9991 ON public.main_workflowjobnode_success_nodes USING btree (from_workflowjobnode_id);


--
-- Name: main_workflowjobnode_succe_to_workflowjobnode_id_e6c8cbb4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobnode_succe_to_workflowjobnode_id_e6c8cbb4 ON public.main_workflowjobnode_success_nodes USING btree (to_workflowjobnode_id);


--
-- Name: main_workflowjobnode_unified_job_template_id_8a30f93e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobnode_unified_job_template_id_8a30f93e ON public.main_workflowjobnode USING btree (unified_job_template_id);


--
-- Name: main_workflowjobnode_workflow_job_id_dcd715c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobnode_workflow_job_id_dcd715c7 ON public.main_workflowjobnode USING btree (workflow_job_id);


--
-- Name: main_workflowjobtemplate_admin_role_id_5675a40e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplate_admin_role_id_5675a40e ON public.main_workflowjobtemplate USING btree (admin_role_id);


--
-- Name: main_workflowjobtemplate_approval_role_id_220f0de1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplate_approval_role_id_220f0de1 ON public.main_workflowjobtemplate USING btree (approval_role_id);


--
-- Name: main_workflowjobtemplate_execute_role_id_ad8970f4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplate_execute_role_id_ad8970f4 ON public.main_workflowjobtemplate USING btree (execute_role_id);


--
-- Name: main_workflowjobtemplate_inventory_id_99929499; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplate_inventory_id_99929499 ON public.main_workflowjobtemplate USING btree (inventory_id);


--
-- Name: main_workflowjobtemplate_n_notificationtemplate_id_3811d35e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplate_n_notificationtemplate_id_3811d35e ON public.main_workflowjobtemplate_notification_templates_approvals USING btree (notificationtemplate_id);


--
-- Name: main_workflowjobtemplate_n_workflowjobtemplate_id_ce7a17be; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplate_n_workflowjobtemplate_id_ce7a17be ON public.main_workflowjobtemplate_notification_templates_approvals USING btree (workflowjobtemplate_id);


--
-- Name: main_workflowjobtemplate_organization_id_a585475f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplate_organization_id_a585475f ON public.main_workflowjobtemplate USING btree (organization_id);


--
-- Name: main_workflowjobtemplate_read_role_id_acdd95ef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplate_read_role_id_acdd95ef ON public.main_workflowjobtemplate USING btree (read_role_id);


--
-- Name: main_workflowjobtemplate_webhook_credential_id_ced1ad89; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplate_webhook_credential_id_ced1ad89 ON public.main_workflowjobtemplate USING btree (webhook_credential_id);


--
-- Name: main_workflowjobtemplateno_from_workflowjobtemplateno_8af14c32; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplateno_from_workflowjobtemplateno_8af14c32 ON public.main_workflowjobtemplatenode_always_nodes USING btree (from_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplateno_from_workflowjobtemplateno_9e16f49d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplateno_from_workflowjobtemplateno_9e16f49d ON public.main_workflowjobtemplatenode_success_nodes USING btree (from_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplateno_from_workflowjobtemplateno_fa405230; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplateno_from_workflowjobtemplateno_fa405230 ON public.main_workflowjobtemplatenode_failure_nodes USING btree (from_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplateno_to_workflowjobtemplatenode_2c1db0ae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplateno_to_workflowjobtemplatenode_2c1db0ae ON public.main_workflowjobtemplatenode_failure_nodes USING btree (to_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplateno_to_workflowjobtemplatenode_6fe11708; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplateno_to_workflowjobtemplatenode_6fe11708 ON public.main_workflowjobtemplatenode_always_nodes USING btree (to_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplateno_to_workflowjobtemplatenode_f16ee478; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplateno_to_workflowjobtemplatenode_f16ee478 ON public.main_workflowjobtemplatenode_success_nodes USING btree (to_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplateno_workflowjobtemplatenode_id_b91efe86; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplateno_workflowjobtemplatenode_id_b91efe86 ON public.main_workflowjobtemplatenode_credentials USING btree (workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplatenode_credentials_credential_id_e621c8d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplatenode_credentials_credential_id_e621c8d1 ON public.main_workflowjobtemplatenode_credentials USING btree (credential_id);


--
-- Name: main_workflowjobtemplatenode_inventory_id_2fab864f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplatenode_inventory_id_2fab864f ON public.main_workflowjobtemplatenode USING btree (inventory_id);


--
-- Name: main_workflowjobtemplatenode_unified_job_template_id_98b53e6c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplatenode_unified_job_template_id_98b53e6c ON public.main_workflowjobtemplatenode USING btree (unified_job_template_id);


--
-- Name: main_workflowjobtemplatenode_workflow_job_template_id_2fd591f0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_workflowjobtemplatenode_workflow_job_template_id_2fd591f0 ON public.main_workflowjobtemplatenode USING btree (workflow_job_template_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: sso_userenterpriseauth_user_id_5982f0ef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sso_userenterpriseauth_user_id_5982f0ef ON public.sso_userenterpriseauth USING btree (user_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: conf_setting conf_setting_user_id_ce9d5138_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_setting
    ADD CONSTRAINT conf_setting_user_id_ce9d5138_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_organization main_activitystream__activitystream_id_0283e075_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_organization
    ADD CONSTRAINT main_activitystream__activitystream_id_0283e075_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_instance main_activitystream__activitystream_id_04ccbf32_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_instance
    ADD CONSTRAINT main_activitystream__activitystream_id_04ccbf32_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_approval main_activitystream__activitystream_id_14401444_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval
    ADD CONSTRAINT main_activitystream__activitystream_id_14401444_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_notification_template main_activitystream__activitystream_id_214c1789_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_notification_template
    ADD CONSTRAINT main_activitystream__activitystream_id_214c1789_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job_template main_activitystream__activitystream_id_259ad363_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template
    ADD CONSTRAINT main_activitystream__activitystream_id_259ad363_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_project_update main_activitystream__activitystream_id_2965eda0_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_project_update
    ADD CONSTRAINT main_activitystream__activitystream_id_2965eda0_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_custom_inventory_script main_activitystream__activitystream_id_2d7243ca_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_custom_inventory_script
    ADD CONSTRAINT main_activitystream__activitystream_id_2d7243ca_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_inventory main_activitystream__activitystream_id_4a1242eb_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory
    ADD CONSTRAINT main_activitystream__activitystream_id_4a1242eb_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_credential main_activitystream__activitystream_id_4be1a957_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_credential
    ADD CONSTRAINT main_activitystream__activitystream_id_4be1a957_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_inventory_update main_activitystream__activitystream_id_732f074a_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory_update
    ADD CONSTRAINT main_activitystream__activitystream_id_732f074a_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_notification main_activitystream__activitystream_id_7d39234a_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_notification
    ADD CONSTRAINT main_activitystream__activitystream_id_7d39234a_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_approval_template main_activitystream__activitystream_id_7e8e02aa_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval_template
    ADD CONSTRAINT main_activitystream__activitystream_id_7e8e02aa_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_ad_hoc_command main_activitystream__activitystream_id_870ddb01_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_ad_hoc_command
    ADD CONSTRAINT main_activitystream__activitystream_id_870ddb01_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job main_activitystream__activitystream_id_93d66e38_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job
    ADD CONSTRAINT main_activitystream__activitystream_id_93d66e38_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_group main_activitystream__activitystream_id_94d31559_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_group
    ADD CONSTRAINT main_activitystream__activitystream_id_94d31559_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_o_auth2_access_token main_activitystream__activitystream_id_9cd33ed4_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_access_token
    ADD CONSTRAINT main_activitystream__activitystream_id_9cd33ed4_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_schedule main_activitystream__activitystream_id_a5fd87ef_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_schedule
    ADD CONSTRAINT main_activitystream__activitystream_id_a5fd87ef_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_job_template main_activitystream__activitystream_id_abd63b6d_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_job_template
    ADD CONSTRAINT main_activitystream__activitystream_id_abd63b6d_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_label main_activitystream__activitystream_id_afd608d7_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_label
    ADD CONSTRAINT main_activitystream__activitystream_id_afd608d7_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_job main_activitystream__activitystream_id_b1f2ab1b_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_job
    ADD CONSTRAINT main_activitystream__activitystream_id_b1f2ab1b_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job_template_node main_activitystream__activitystream_id_b3d1beb6_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template_node
    ADD CONSTRAINT main_activitystream__activitystream_id_b3d1beb6_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_credential_type main_activitystream__activitystream_id_b7a4b49d_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_credential_type
    ADD CONSTRAINT main_activitystream__activitystream_id_b7a4b49d_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_team main_activitystream__activitystream_id_c4874e73_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_team
    ADD CONSTRAINT main_activitystream__activitystream_id_c4874e73_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_host main_activitystream__activitystream_id_c4d91cb7_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_host
    ADD CONSTRAINT main_activitystream__activitystream_id_c4d91cb7_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job_node main_activitystream__activitystream_id_c8397668_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_node
    ADD CONSTRAINT main_activitystream__activitystream_id_c8397668_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_role main_activitystream__activitystream_id_d591eb98_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_role
    ADD CONSTRAINT main_activitystream__activitystream_id_d591eb98_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_inventory_source main_activitystream__activitystream_id_d88c8423_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory_source
    ADD CONSTRAINT main_activitystream__activitystream_id_d88c8423_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_unified_job main_activitystream__activitystream_id_e29d497f_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_unified_job
    ADD CONSTRAINT main_activitystream__activitystream_id_e29d497f_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_unified_job_template main_activitystream__activitystream_id_e4ce5d15_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_unified_job_template
    ADD CONSTRAINT main_activitystream__activitystream_id_e4ce5d15_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_instance_group main_activitystream__activitystream_id_e81ef38a_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_instance_group
    ADD CONSTRAINT main_activitystream__activitystream_id_e81ef38a_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_o_auth2_application main_activitystream__activitystream_id_ea629ffe_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_application
    ADD CONSTRAINT main_activitystream__activitystream_id_ea629ffe_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_user main_activitystream__activitystream_id_f120c9d1_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_user
    ADD CONSTRAINT main_activitystream__activitystream_id_f120c9d1_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_project main_activitystream__activitystream_id_f6aa28cc_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_project
    ADD CONSTRAINT main_activitystream__activitystream_id_f6aa28cc_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_ad_hoc_command main_activitystream__adhoccommand_id_0df7bfcd_fk_main_adho; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_ad_hoc_command
    ADD CONSTRAINT main_activitystream__adhoccommand_id_0df7bfcd_fk_main_adho FOREIGN KEY (adhoccommand_id) REFERENCES public.main_adhoccommand(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_credential main_activitystream__credential_id_d5911596_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_credential
    ADD CONSTRAINT main_activitystream__credential_id_d5911596_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_credential_type main_activitystream__credentialtype_id_89572b10_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_credential_type
    ADD CONSTRAINT main_activitystream__credentialtype_id_89572b10_fk_main_cred FOREIGN KEY (credentialtype_id) REFERENCES public.main_credentialtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_custom_inventory_script main_activitystream__custominventoryscrip_9208376f_fk_main_cust; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_custom_inventory_script
    ADD CONSTRAINT main_activitystream__custominventoryscrip_9208376f_fk_main_cust FOREIGN KEY (custominventoryscript_id) REFERENCES public.main_custominventoryscript(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_instance main_activitystream__instance_id_d10eb669_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_instance
    ADD CONSTRAINT main_activitystream__instance_id_d10eb669_fk_main_inst FOREIGN KEY (instance_id) REFERENCES public.main_instance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_instance_group main_activitystream__instancegroup_id_fca49f6c_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_instance_group
    ADD CONSTRAINT main_activitystream__instancegroup_id_fca49f6c_fk_main_inst FOREIGN KEY (instancegroup_id) REFERENCES public.main_instancegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_inventory main_activitystream__inventory_id_8daf9251_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory
    ADD CONSTRAINT main_activitystream__inventory_id_8daf9251_fk_main_inve FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_inventory_source main_activitystream__inventorysource_id_235e699a_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory_source
    ADD CONSTRAINT main_activitystream__inventorysource_id_235e699a_fk_main_inve FOREIGN KEY (inventorysource_id) REFERENCES public.main_inventorysource(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_inventory_update main_activitystream__inventoryupdate_id_817749c5_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_inventory_update
    ADD CONSTRAINT main_activitystream__inventoryupdate_id_817749c5_fk_main_inve FOREIGN KEY (inventoryupdate_id) REFERENCES public.main_inventoryupdate(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_job main_activitystream__job_id_aa6811b5_fk_main_job_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_job
    ADD CONSTRAINT main_activitystream__job_id_aa6811b5_fk_main_job_ FOREIGN KEY (job_id) REFERENCES public.main_job(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_job_template main_activitystream__jobtemplate_id_c05e0b6c_fk_main_jobt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_job_template
    ADD CONSTRAINT main_activitystream__jobtemplate_id_c05e0b6c_fk_main_jobt FOREIGN KEY (jobtemplate_id) REFERENCES public.main_jobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_notification main_activitystream__notification_id_bbfaa8ac_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_notification
    ADD CONSTRAINT main_activitystream__notification_id_bbfaa8ac_fk_main_noti FOREIGN KEY (notification_id) REFERENCES public.main_notification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_notification_template main_activitystream__notificationtemplate_96d11a5d_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_notification_template
    ADD CONSTRAINT main_activitystream__notificationtemplate_96d11a5d_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_o_auth2_access_token main_activitystream__oauth2accesstoken_id_76c333c8_fk_main_oaut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_access_token
    ADD CONSTRAINT main_activitystream__oauth2accesstoken_id_76c333c8_fk_main_oaut FOREIGN KEY (oauth2accesstoken_id) REFERENCES public.main_oauth2accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_o_auth2_application main_activitystream__oauth2application_id_23726fd8_fk_main_oaut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_application
    ADD CONSTRAINT main_activitystream__oauth2application_id_23726fd8_fk_main_oaut FOREIGN KEY (oauth2application_id) REFERENCES public.main_oauth2application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_organization main_activitystream__organization_id_8ccdfd12_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_organization
    ADD CONSTRAINT main_activitystream__organization_id_8ccdfd12_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_project main_activitystream__project_id_836f7b93_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_project
    ADD CONSTRAINT main_activitystream__project_id_836f7b93_fk_main_proj FOREIGN KEY (project_id) REFERENCES public.main_project(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_project_update main_activitystream__projectupdate_id_8ac4ba92_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_project_update
    ADD CONSTRAINT main_activitystream__projectupdate_id_8ac4ba92_fk_main_proj FOREIGN KEY (projectupdate_id) REFERENCES public.main_projectupdate(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_schedule main_activitystream__schedule_id_9bde99e8_fk_main_sche; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_schedule
    ADD CONSTRAINT main_activitystream__schedule_id_9bde99e8_fk_main_sche FOREIGN KEY (schedule_id) REFERENCES public.main_schedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_unified_job main_activitystream__unifiedjob_id_bd9f07c6_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_unified_job
    ADD CONSTRAINT main_activitystream__unifiedjob_id_bd9f07c6_fk_main_unif FOREIGN KEY (unifiedjob_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_unified_job_template main_activitystream__unifiedjobtemplate_i_71f8a21f_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_unified_job_template
    ADD CONSTRAINT main_activitystream__unifiedjobtemplate_i_71f8a21f_fk_main_unif FOREIGN KEY (unifiedjobtemplate_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_approval main_activitystream__workflowapproval_id_8d4193a7_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval
    ADD CONSTRAINT main_activitystream__workflowapproval_id_8d4193a7_fk_main_work FOREIGN KEY (workflowapproval_id) REFERENCES public.main_workflowapproval(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_approval_template main_activitystream__workflowapprovaltemp_93e9e097_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval_template
    ADD CONSTRAINT main_activitystream__workflowapprovaltemp_93e9e097_fk_main_work FOREIGN KEY (workflowapprovaltemplate_id) REFERENCES public.main_workflowapprovaltemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job main_activitystream__workflowjob_id_c29366d7_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job
    ADD CONSTRAINT main_activitystream__workflowjob_id_c29366d7_fk_main_work FOREIGN KEY (workflowjob_id) REFERENCES public.main_workflowjob(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job_node main_activitystream__workflowjobnode_id_85bb51d6_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_node
    ADD CONSTRAINT main_activitystream__workflowjobnode_id_85bb51d6_fk_main_work FOREIGN KEY (workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job_template main_activitystream__workflowjobtemplate__efd4c1aa_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template
    ADD CONSTRAINT main_activitystream__workflowjobtemplate__efd4c1aa_fk_main_work FOREIGN KEY (workflowjobtemplate_id) REFERENCES public.main_workflowjobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job_template_node main_activitystream__workflowjobtemplaten_a2630ab6_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template_node
    ADD CONSTRAINT main_activitystream__workflowjobtemplaten_a2630ab6_fk_main_work FOREIGN KEY (workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream main_activitystream_actor_id_29aafc0f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream
    ADD CONSTRAINT main_activitystream_actor_id_29aafc0f_fk_auth_user_id FOREIGN KEY (actor_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_group main_activitystream_group_group_id_fd48b400_fk_main_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_group
    ADD CONSTRAINT main_activitystream_group_group_id_fd48b400_fk_main_group_id FOREIGN KEY (group_id) REFERENCES public.main_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_host main_activitystream_host_host_id_0e598602_fk_main_host_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_host
    ADD CONSTRAINT main_activitystream_host_host_id_0e598602_fk_main_host_id FOREIGN KEY (host_id) REFERENCES public.main_host(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_label main_activitystream_label_label_id_b33683fb_fk_main_label_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_label
    ADD CONSTRAINT main_activitystream_label_label_id_b33683fb_fk_main_label_id FOREIGN KEY (label_id) REFERENCES public.main_label(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_role main_activitystream_role_role_id_e19fce37_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_role
    ADD CONSTRAINT main_activitystream_role_role_id_e19fce37_fk_main_rbac_roles_id FOREIGN KEY (role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_team main_activitystream_team_team_id_725f033a_fk_main_team_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_team
    ADD CONSTRAINT main_activitystream_team_team_id_725f033a_fk_main_team_id FOREIGN KEY (team_id) REFERENCES public.main_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_user main_activitystream_user_user_id_435f8320_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_activitystream_user
    ADD CONSTRAINT main_activitystream_user_user_id_435f8320_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_adhoccommand main_adhoccommand_credential_id_da6b1c87_fk_main_credential_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_adhoccommand
    ADD CONSTRAINT main_adhoccommand_credential_id_da6b1c87_fk_main_credential_id FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_adhoccommand main_adhoccommand_inventory_id_b29bba0e_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_adhoccommand
    ADD CONSTRAINT main_adhoccommand_inventory_id_b29bba0e_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_adhoccommand main_adhoccommand_unifiedjob_ptr_id_ef80f1dd_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_adhoccommand
    ADD CONSTRAINT main_adhoccommand_unifiedjob_ptr_id_ef80f1dd_fk_main_unif FOREIGN KEY (unifiedjob_ptr_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_adhoccommandevent main_adhoccommandeve_ad_hoc_command_id_1721f1e2_fk_main_adho; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_adhoccommandevent
    ADD CONSTRAINT main_adhoccommandeve_ad_hoc_command_id_1721f1e2_fk_main_adho FOREIGN KEY (ad_hoc_command_id) REFERENCES public.main_adhoccommand(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_adhoccommandevent main_adhoccommandevent_host_id_5613e329_fk_main_host_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_adhoccommandevent
    ADD CONSTRAINT main_adhoccommandevent_host_id_5613e329_fk_main_host_id FOREIGN KEY (host_id) REFERENCES public.main_host(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credential main_credential_admin_role_id_6cd7ab86_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_admin_role_id_6cd7ab86_fk_main_rbac_roles_id FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credential main_credential_created_by_id_237add04_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_created_by_id_237add04_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credential main_credential_credential_type_id_0120654c_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_credential_type_id_0120654c_fk_main_cred FOREIGN KEY (credential_type_id) REFERENCES public.main_credentialtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credential main_credential_modified_by_id_c290955a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_modified_by_id_c290955a_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credential main_credential_organization_id_18d4ae89_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_organization_id_18d4ae89_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credential main_credential_read_role_id_12be41a2_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_read_role_id_12be41a2_fk_main_rbac_roles_id FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credential main_credential_use_role_id_122159d4_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_use_role_id_122159d4_fk_main_rbac_roles_id FOREIGN KEY (use_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credentialinputsource main_credentialinput_created_by_id_d2dc637c_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credentialinputsource
    ADD CONSTRAINT main_credentialinput_created_by_id_d2dc637c_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credentialinputsource main_credentialinput_modified_by_id_e3fd88dd_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credentialinputsource
    ADD CONSTRAINT main_credentialinput_modified_by_id_e3fd88dd_fk_auth_user FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credentialinputsource main_credentialinput_source_credential_id_868d93af_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credentialinputsource
    ADD CONSTRAINT main_credentialinput_source_credential_id_868d93af_fk_main_cred FOREIGN KEY (source_credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credentialinputsource main_credentialinput_target_credential_id_4bf0e248_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credentialinputsource
    ADD CONSTRAINT main_credentialinput_target_credential_id_4bf0e248_fk_main_cred FOREIGN KEY (target_credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credentialtype main_credentialtype_created_by_id_0f8451ed_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credentialtype
    ADD CONSTRAINT main_credentialtype_created_by_id_0f8451ed_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credentialtype main_credentialtype_modified_by_id_b425580d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_credentialtype
    ADD CONSTRAINT main_credentialtype_modified_by_id_b425580d_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_custominventoryscript main_custominventory_admin_role_id_c18fcf29_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_custominventoryscript
    ADD CONSTRAINT main_custominventory_admin_role_id_c18fcf29_fk_main_rbac FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_custominventoryscript main_custominventory_created_by_id_45a39526_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_custominventoryscript
    ADD CONSTRAINT main_custominventory_created_by_id_45a39526_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_custominventoryscript main_custominventory_modified_by_id_6c74f1d0_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_custominventoryscript
    ADD CONSTRAINT main_custominventory_modified_by_id_6c74f1d0_fk_auth_user FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_custominventoryscript main_custominventory_organization_id_b2fa3e3b_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_custominventoryscript
    ADD CONSTRAINT main_custominventory_organization_id_b2fa3e3b_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_custominventoryscript main_custominventory_read_role_id_fb907425_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_custominventoryscript
    ADD CONSTRAINT main_custominventory_read_role_id_fb907425_fk_main_rbac FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group main_group_created_by_id_326129d5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group
    ADD CONSTRAINT main_group_created_by_id_326129d5_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group_hosts main_group_hosts_group_id_524c3b29_fk_main_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_hosts
    ADD CONSTRAINT main_group_hosts_group_id_524c3b29_fk_main_group_id FOREIGN KEY (group_id) REFERENCES public.main_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group_hosts main_group_hosts_host_id_672eaed0_fk_main_host_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_hosts
    ADD CONSTRAINT main_group_hosts_host_id_672eaed0_fk_main_host_id FOREIGN KEY (host_id) REFERENCES public.main_host(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group main_group_inventory_id_f9e83725_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group
    ADD CONSTRAINT main_group_inventory_id_f9e83725_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group_inventory_sources main_group_inventory_inventorysource_id_5da14efc_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_inventory_sources
    ADD CONSTRAINT main_group_inventory_inventorysource_id_5da14efc_fk_main_inve FOREIGN KEY (inventorysource_id) REFERENCES public.main_inventorysource(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group_inventory_sources main_group_inventory_sources_group_id_1be295c4_fk_main_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_inventory_sources
    ADD CONSTRAINT main_group_inventory_sources_group_id_1be295c4_fk_main_group_id FOREIGN KEY (group_id) REFERENCES public.main_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group main_group_modified_by_id_20a1b654_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group
    ADD CONSTRAINT main_group_modified_by_id_20a1b654_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group_parents main_group_parents_from_group_id_9d63324d_fk_main_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_parents
    ADD CONSTRAINT main_group_parents_from_group_id_9d63324d_fk_main_group_id FOREIGN KEY (from_group_id) REFERENCES public.main_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group_parents main_group_parents_to_group_id_851cc1ce_fk_main_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_group_parents
    ADD CONSTRAINT main_group_parents_to_group_id_851cc1ce_fk_main_group_id FOREIGN KEY (to_group_id) REFERENCES public.main_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_host main_host_created_by_id_2b5e0abe_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_host
    ADD CONSTRAINT main_host_created_by_id_2b5e0abe_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_host_inventory_sources main_host_inventory__inventorysource_id_b25d3959_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_host_inventory_sources
    ADD CONSTRAINT main_host_inventory__inventorysource_id_b25d3959_fk_main_inve FOREIGN KEY (inventorysource_id) REFERENCES public.main_inventorysource(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_host main_host_inventory_id_e5bcdb08_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_host
    ADD CONSTRAINT main_host_inventory_id_e5bcdb08_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_host_inventory_sources main_host_inventory_sources_host_id_03f0dcdc_fk_main_host_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_host_inventory_sources
    ADD CONSTRAINT main_host_inventory_sources_host_id_03f0dcdc_fk_main_host_id FOREIGN KEY (host_id) REFERENCES public.main_host(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_host main_host_last_job_host_summar_b8bd727d_fk_main_jobh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_host
    ADD CONSTRAINT main_host_last_job_host_summar_b8bd727d_fk_main_jobh FOREIGN KEY (last_job_host_summary_id) REFERENCES public.main_jobhostsummary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_host main_host_last_job_id_d247075b_fk_main_job_unifiedjob_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_host
    ADD CONSTRAINT main_host_last_job_id_d247075b_fk_main_job_unifiedjob_ptr_id FOREIGN KEY (last_job_id) REFERENCES public.main_job(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_host main_host_modified_by_id_28b76283_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_host
    ADD CONSTRAINT main_host_modified_by_id_28b76283_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_instancegroup main_instancegroup_controller_id_043cd3a9_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_instancegroup
    ADD CONSTRAINT main_instancegroup_controller_id_043cd3a9_fk_main_inst FOREIGN KEY (controller_id) REFERENCES public.main_instancegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_instancegroup main_instancegroup_credential_id_98351d10_fk_main_credential_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_instancegroup
    ADD CONSTRAINT main_instancegroup_credential_id_98351d10_fk_main_credential_id FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_instancegroup_instances main_instancegroup_i_instance_id_d41cb05c_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_instancegroup_instances
    ADD CONSTRAINT main_instancegroup_i_instance_id_d41cb05c_fk_main_inst FOREIGN KEY (instance_id) REFERENCES public.main_instance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_instancegroup_instances main_instancegroup_i_instancegroup_id_b4b19635_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_instancegroup_instances
    ADD CONSTRAINT main_instancegroup_i_instancegroup_id_b4b19635_fk_main_inst FOREIGN KEY (instancegroup_id) REFERENCES public.main_instancegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_adhoc_role_id_b57042aa_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_adhoc_role_id_b57042aa_fk_main_rbac_roles_id FOREIGN KEY (adhoc_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_admin_role_id_3bb301cb_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_admin_role_id_3bb301cb_fk_main_rbac_roles_id FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_created_by_id_5d690781_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_created_by_id_5d690781_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_insights_credential__ce91863f_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_insights_credential__ce91863f_fk_main_cred FOREIGN KEY (insights_credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_modified_by_id_a4a91734_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_modified_by_id_a4a91734_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_organization_id_3ee77ea9_fk_main_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_organization_id_3ee77ea9_fk_main_organization_id FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_read_role_id_270dd070_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_read_role_id_270dd070_fk_main_rbac_roles_id FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_update_role_id_be0903a1_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_update_role_id_be0903a1_fk_main_rbac_roles_id FOREIGN KEY (update_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_use_role_id_77407b26_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_use_role_id_77407b26_fk_main_rbac_roles_id FOREIGN KEY (use_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryinstancegroupmembership main_inventoryinstan_instancegroup_id_8c752e87_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventoryinstancegroupmembership
    ADD CONSTRAINT main_inventoryinstan_instancegroup_id_8c752e87_fk_main_inst FOREIGN KEY (instancegroup_id) REFERENCES public.main_instancegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryinstancegroupmembership main_inventoryinstan_inventory_id_76a877b6_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventoryinstancegroupmembership
    ADD CONSTRAINT main_inventoryinstan_inventory_id_76a877b6_fk_main_inve FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventorysource main_inventorysource_deprecated_group_id_f9e1dd7b_fk_main_grou; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventorysource
    ADD CONSTRAINT main_inventorysource_deprecated_group_id_f9e1dd7b_fk_main_grou FOREIGN KEY (deprecated_group_id) REFERENCES public.main_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventorysource main_inventorysource_inventory_id_3c1cac19_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventorysource
    ADD CONSTRAINT main_inventorysource_inventory_id_3c1cac19_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventorysource main_inventorysource_source_project_id_5b9c4374_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventorysource
    ADD CONSTRAINT main_inventorysource_source_project_id_5b9c4374_fk_main_proj FOREIGN KEY (source_project_id) REFERENCES public.main_project(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventorysource main_inventorysource_source_script_id_03a7c8d7_fk_main_cust; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventorysource
    ADD CONSTRAINT main_inventorysource_source_script_id_03a7c8d7_fk_main_cust FOREIGN KEY (source_script_id) REFERENCES public.main_custominventoryscript(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventorysource main_inventorysource_unifiedjobtemplate_p_6a11d509_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventorysource
    ADD CONSTRAINT main_inventorysource_unifiedjobtemplate_p_6a11d509_fk_main_unif FOREIGN KEY (unifiedjobtemplate_ptr_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryupdate main_inventoryupdate_inventory_id_e60f1f2e_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventoryupdate
    ADD CONSTRAINT main_inventoryupdate_inventory_id_e60f1f2e_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryupdate main_inventoryupdate_inventory_source_id_bc4b2567_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventoryupdate
    ADD CONSTRAINT main_inventoryupdate_inventory_source_id_bc4b2567_fk_main_inve FOREIGN KEY (inventory_source_id) REFERENCES public.main_inventorysource(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryupdateevent main_inventoryupdate_inventory_update_id_8974f1f7_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventoryupdateevent
    ADD CONSTRAINT main_inventoryupdate_inventory_update_id_8974f1f7_fk_main_inve FOREIGN KEY (inventory_update_id) REFERENCES public.main_inventoryupdate(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryupdate main_inventoryupdate_source_project_updat_b896d555_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventoryupdate
    ADD CONSTRAINT main_inventoryupdate_source_project_updat_b896d555_fk_main_proj FOREIGN KEY (source_project_update_id) REFERENCES public.main_projectupdate(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryupdate main_inventoryupdate_source_script_id_f2d2c3a8_fk_main_cust; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventoryupdate
    ADD CONSTRAINT main_inventoryupdate_source_script_id_f2d2c3a8_fk_main_cust FOREIGN KEY (source_script_id) REFERENCES public.main_custominventoryscript(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryupdate main_inventoryupdate_unifiedjob_ptr_id_a42ff4c2_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_inventoryupdate
    ADD CONSTRAINT main_inventoryupdate_unifiedjob_ptr_id_a42ff4c2_fk_main_unif FOREIGN KEY (unifiedjob_ptr_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_job main_job_inventory_id_1b436658_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_job
    ADD CONSTRAINT main_job_inventory_id_1b436658_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_job main_job_job_template_id_070b0d56_fk_main_jobt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_job
    ADD CONSTRAINT main_job_job_template_id_070b0d56_fk_main_jobt FOREIGN KEY (job_template_id) REFERENCES public.main_jobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_job main_job_project_id_a8f63894_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_job
    ADD CONSTRAINT main_job_project_id_a8f63894_fk_main_proj FOREIGN KEY (project_id) REFERENCES public.main_project(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_job main_job_project_update_id_5adf90ad_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_job
    ADD CONSTRAINT main_job_project_update_id_5adf90ad_fk_main_proj FOREIGN KEY (project_update_id) REFERENCES public.main_projectupdate(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_job main_job_unifiedjob_ptr_id_46108a43_fk_main_unifiedjob_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_job
    ADD CONSTRAINT main_job_unifiedjob_ptr_id_46108a43_fk_main_unifiedjob_id FOREIGN KEY (unifiedjob_ptr_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_job main_job_webhook_credential_id_40ca94fa_fk_main_credential_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_job
    ADD CONSTRAINT main_job_webhook_credential_id_40ca94fa_fk_main_credential_id FOREIGN KEY (webhook_credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobevent main_jobevent_host_id_b03b6059_fk_main_host_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobevent
    ADD CONSTRAINT main_jobevent_host_id_b03b6059_fk_main_host_id FOREIGN KEY (host_id) REFERENCES public.main_host(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobevent main_jobevent_job_id_571587e8_fk_main_job_unifiedjob_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobevent
    ADD CONSTRAINT main_jobevent_job_id_571587e8_fk_main_job_unifiedjob_ptr_id FOREIGN KEY (job_id) REFERENCES public.main_job(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobhostsummary main_jobhostsummary_host_id_7d9f6bf9_fk_main_host_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobhostsummary
    ADD CONSTRAINT main_jobhostsummary_host_id_7d9f6bf9_fk_main_host_id FOREIGN KEY (host_id) REFERENCES public.main_host(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobhostsummary main_jobhostsummary_job_id_8d60afa0_fk_main_job_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobhostsummary
    ADD CONSTRAINT main_jobhostsummary_job_id_8d60afa0_fk_main_job_ FOREIGN KEY (job_id) REFERENCES public.main_job(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_joblaunchconfig_credentials main_joblaunchconfig_credential_id_2f5c0487_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_joblaunchconfig_credentials
    ADD CONSTRAINT main_joblaunchconfig_credential_id_2f5c0487_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_joblaunchconfig main_joblaunchconfig_inventory_id_f905306d_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_joblaunchconfig
    ADD CONSTRAINT main_joblaunchconfig_inventory_id_f905306d_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_joblaunchconfig main_joblaunchconfig_job_id_6e18fad4_fk_main_unifiedjob_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_joblaunchconfig
    ADD CONSTRAINT main_joblaunchconfig_job_id_6e18fad4_fk_main_unifiedjob_id FOREIGN KEY (job_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_joblaunchconfig_credentials main_joblaunchconfig_joblaunchconfig_id_37dc31b9_fk_main_jobl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_joblaunchconfig_credentials
    ADD CONSTRAINT main_joblaunchconfig_joblaunchconfig_id_37dc31b9_fk_main_jobl FOREIGN KEY (joblaunchconfig_id) REFERENCES public.main_joblaunchconfig(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobtemplate main_jobtemplate_admin_role_id_f9dc66ce_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_admin_role_id_f9dc66ce_fk_main_rbac_roles_id FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobtemplate main_jobtemplate_execute_role_id_c2f0db2c_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_execute_role_id_c2f0db2c_fk_main_rbac_roles_id FOREIGN KEY (execute_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobtemplate main_jobtemplate_inventory_id_9b8df646_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_inventory_id_9b8df646_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobtemplate main_jobtemplate_project_id_36e80985_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_project_id_36e80985_fk_main_proj FOREIGN KEY (project_id) REFERENCES public.main_project(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobtemplate main_jobtemplate_read_role_id_0e489c81_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_read_role_id_0e489c81_fk_main_rbac_roles_id FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobtemplate main_jobtemplate_unifiedjobtemplate_p_4d0a792f_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_unifiedjobtemplate_p_4d0a792f_fk_main_unif FOREIGN KEY (unifiedjobtemplate_ptr_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobtemplate main_jobtemplate_webhook_credential_i_eff7fb4b_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_webhook_credential_i_eff7fb4b_fk_main_cred FOREIGN KEY (webhook_credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_label main_label_created_by_id_201182c0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_label
    ADD CONSTRAINT main_label_created_by_id_201182c0_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_label main_label_modified_by_id_7f9aac68_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_label
    ADD CONSTRAINT main_label_modified_by_id_7f9aac68_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_label main_label_organization_id_78a1bd27_fk_main_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_label
    ADD CONSTRAINT main_label_organization_id_78a1bd27_fk_main_organization_id FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_notification main_notification_notification_templat_9eed1d65_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notification
    ADD CONSTRAINT main_notification_notification_templat_9eed1d65_fk_main_noti FOREIGN KEY (notification_template_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_notificationtemplate main_notificationtem_created_by_id_1f77983a_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notificationtemplate
    ADD CONSTRAINT main_notificationtem_created_by_id_1f77983a_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_notificationtemplate main_notificationtem_modified_by_id_83c40510_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notificationtemplate
    ADD CONSTRAINT main_notificationtem_modified_by_id_83c40510_fk_auth_user FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_notificationtemplate main_notificationtem_organization_id_15933abb_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notificationtemplate
    ADD CONSTRAINT main_notificationtem_organization_id_15933abb_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_oauth2accesstoken main_oauth2accesstok_application_id_c21bc74c_fk_main_oaut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_oauth2accesstoken
    ADD CONSTRAINT main_oauth2accesstok_application_id_c21bc74c_fk_main_oaut FOREIGN KEY (application_id) REFERENCES public.main_oauth2application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_oauth2accesstoken main_oauth2accesstoken_source_refresh_token_id_0a8a7e3b_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_oauth2accesstoken
    ADD CONSTRAINT main_oauth2accesstoken_source_refresh_token_id_0a8a7e3b_fk FOREIGN KEY (source_refresh_token_id) REFERENCES public.oauth2_provider_refreshtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_oauth2accesstoken main_oauth2accesstoken_user_id_71ee5fe6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_oauth2accesstoken
    ADD CONSTRAINT main_oauth2accesstoken_user_id_71ee5fe6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_oauth2application main_oauth2applicati_organization_id_5e579421_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_oauth2application
    ADD CONSTRAINT main_oauth2applicati_organization_id_5e579421_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_oauth2application main_oauth2application_user_id_c4dffdbb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_oauth2application
    ADD CONSTRAINT main_oauth2application_user_id_c4dffdbb_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_admin_role_id_e3ffdd41_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_admin_role_id_e3ffdd41_fk_main_rbac_roles_id FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_approval_role_id_14c1d96f_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_approval_role_id_14c1d96f_fk_main_rbac FOREIGN KEY (approval_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_auditor_role_id_f912df0a_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_auditor_role_id_f912df0a_fk_main_rbac FOREIGN KEY (auditor_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_created_by_id_141da798_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_created_by_id_141da798_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_credential_admin_rol_55733eb5_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_credential_admin_rol_55733eb5_fk_main_rbac FOREIGN KEY (credential_admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_execute_role_id_76038d3c_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_execute_role_id_76038d3c_fk_main_rbac FOREIGN KEY (execute_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_inventory_admin_role_dae5c7e2_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_inventory_admin_role_dae5c7e2_fk_main_rbac FOREIGN KEY (inventory_admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_job_template_admin_r_25a265c4_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_job_template_admin_r_25a265c4_fk_main_rbac FOREIGN KEY (job_template_admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_member_role_id_201ff67a_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_member_role_id_201ff67a_fk_main_rbac_roles_id FOREIGN KEY (member_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_modified_by_id_dec7a500_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_modified_by_id_dec7a500_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_started main_organization_no_notificationtemplate_1df2f173_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_started
    ADD CONSTRAINT main_organization_no_notificationtemplate_1df2f173_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_approvals main_organization_no_notificationtemplate_392029b7_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_approvals
    ADD CONSTRAINT main_organization_no_notificationtemplate_392029b7_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_success main_organization_no_notificationtemplate_4edd98c4_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_success
    ADD CONSTRAINT main_organization_no_notificationtemplate_4edd98c4_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_error main_organization_no_notificationtemplate_7b1480c0_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_error
    ADD CONSTRAINT main_organization_no_notificationtemplate_7b1480c0_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_approvals main_organization_no_organization_id_44a19957_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_approvals
    ADD CONSTRAINT main_organization_no_organization_id_44a19957_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_started main_organization_no_organization_id_48a058ac_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_started
    ADD CONSTRAINT main_organization_no_organization_id_48a058ac_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_error main_organization_no_organization_id_94b63d49_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_error
    ADD CONSTRAINT main_organization_no_organization_id_94b63d49_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_success main_organization_no_organization_id_96635cd6_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization_notification_templates_success
    ADD CONSTRAINT main_organization_no_organization_id_96635cd6_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_notification_admin_r_c36d2f0e_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_notification_admin_r_c36d2f0e_fk_main_rbac FOREIGN KEY (notification_admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_project_admin_role_i_442cfebe_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_project_admin_role_i_442cfebe_fk_main_rbac FOREIGN KEY (project_admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_read_role_id_e143c386_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_read_role_id_e143c386_fk_main_rbac_roles_id FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_workflow_admin_role__52011cd3_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_workflow_admin_role__52011cd3_fk_main_rbac FOREIGN KEY (workflow_admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organizationinstancegroupmembership main_organizationins_instancegroup_id_526173a9_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organizationinstancegroupmembership
    ADD CONSTRAINT main_organizationins_instancegroup_id_526173a9_fk_main_inst FOREIGN KEY (instancegroup_id) REFERENCES public.main_instancegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organizationinstancegroupmembership main_organizationins_organization_id_35633383_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_organizationinstancegroupmembership
    ADD CONSTRAINT main_organizationins_organization_id_35633383_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_profile main_profile_user_id_b40d720a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_profile
    ADD CONSTRAINT main_profile_user_id_b40d720a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_project main_project_admin_role_id_ba0e70c7_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_admin_role_id_ba0e70c7_fk_main_rbac_roles_id FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_project main_project_credential_id_370ba2a3_fk_main_credential_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_credential_id_370ba2a3_fk_main_credential_id FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_project main_project_organization_id_b8ff27cc_fk_main_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_organization_id_b8ff27cc_fk_main_organization_id FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_project main_project_read_role_id_39a01fd4_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_read_role_id_39a01fd4_fk_main_rbac_roles_id FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_project main_project_unifiedjobtemplate_p_078080eb_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_unifiedjobtemplate_p_078080eb_fk_main_unif FOREIGN KEY (unifiedjobtemplate_ptr_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_project main_project_update_role_id_36e33c42_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_update_role_id_36e33c42_fk_main_rbac_roles_id FOREIGN KEY (update_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_project main_project_use_role_id_7b6d9148_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_use_role_id_7b6d9148_fk_main_rbac_roles_id FOREIGN KEY (use_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_projectupdate main_projectupdate_credential_id_2f7d826a_fk_main_credential_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_projectupdate
    ADD CONSTRAINT main_projectupdate_credential_id_2f7d826a_fk_main_credential_id FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_projectupdate main_projectupdate_project_id_bdd73efe_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_projectupdate
    ADD CONSTRAINT main_projectupdate_project_id_bdd73efe_fk_main_proj FOREIGN KEY (project_id) REFERENCES public.main_project(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_projectupdate main_projectupdate_unifiedjob_ptr_id_039312cd_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_projectupdate
    ADD CONSTRAINT main_projectupdate_unifiedjob_ptr_id_039312cd_fk_main_unif FOREIGN KEY (unifiedjob_ptr_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_projectupdateevent main_projectupdateev_project_update_id_9d4358b2_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_projectupdateevent
    ADD CONSTRAINT main_projectupdateev_project_update_id_9d4358b2_fk_main_proj FOREIGN KEY (project_update_id) REFERENCES public.main_projectupdate(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_rbac_role_ancestors main_rbac_role_ances_ancestor_id_c6aae106_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_role_ancestors
    ADD CONSTRAINT main_rbac_role_ances_ancestor_id_c6aae106_fk_main_rbac FOREIGN KEY (ancestor_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_rbac_role_ancestors main_rbac_role_ances_descendent_id_23bfc463_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_role_ancestors
    ADD CONSTRAINT main_rbac_role_ances_descendent_id_23bfc463_fk_main_rbac FOREIGN KEY (descendent_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_rbac_roles main_rbac_roles_content_type_id_756d6b30_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_roles
    ADD CONSTRAINT main_rbac_roles_content_type_id_756d6b30_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_rbac_roles_members main_rbac_roles_members_role_id_7318b4b7_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_roles_members
    ADD CONSTRAINT main_rbac_roles_members_role_id_7318b4b7_fk_main_rbac_roles_id FOREIGN KEY (role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_rbac_roles_members main_rbac_roles_members_user_id_f5e05418_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_roles_members
    ADD CONSTRAINT main_rbac_roles_members_user_id_f5e05418_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_rbac_roles_parents main_rbac_roles_pare_from_role_id_a02db9eb_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_roles_parents
    ADD CONSTRAINT main_rbac_roles_pare_from_role_id_a02db9eb_fk_main_rbac FOREIGN KEY (from_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_rbac_roles_parents main_rbac_roles_pare_to_role_id_c00b5087_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_rbac_roles_parents
    ADD CONSTRAINT main_rbac_roles_pare_to_role_id_c00b5087_fk_main_rbac FOREIGN KEY (to_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_schedule main_schedule_created_by_id_4e647be2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_schedule
    ADD CONSTRAINT main_schedule_created_by_id_4e647be2_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_schedule_credentials main_schedule_creden_credential_id_ced5894e_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_schedule_credentials
    ADD CONSTRAINT main_schedule_creden_credential_id_ced5894e_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_schedule_credentials main_schedule_creden_schedule_id_03ecad04_fk_main_sche; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_schedule_credentials
    ADD CONSTRAINT main_schedule_creden_schedule_id_03ecad04_fk_main_sche FOREIGN KEY (schedule_id) REFERENCES public.main_schedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_schedule main_schedule_inventory_id_43b7b69d_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_schedule
    ADD CONSTRAINT main_schedule_inventory_id_43b7b69d_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_schedule main_schedule_modified_by_id_3817bc47_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_schedule
    ADD CONSTRAINT main_schedule_modified_by_id_3817bc47_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_schedule main_schedule_unified_job_template_a9d931e2_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_schedule
    ADD CONSTRAINT main_schedule_unified_job_template_a9d931e2_fk_main_unif FOREIGN KEY (unified_job_template_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_smartinventorymembership main_smartinventorym_inventory_id_5e13df96_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_smartinventorymembership
    ADD CONSTRAINT main_smartinventorym_inventory_id_5e13df96_fk_main_inve FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_smartinventorymembership main_smartinventorymembership_host_id_c721cb8a_fk_main_host_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_smartinventorymembership
    ADD CONSTRAINT main_smartinventorymembership_host_id_c721cb8a_fk_main_host_id FOREIGN KEY (host_id) REFERENCES public.main_host(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_systemjob main_systemjob_system_job_template__8bba2060_fk_main_syst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_systemjob
    ADD CONSTRAINT main_systemjob_system_job_template__8bba2060_fk_main_syst FOREIGN KEY (system_job_template_id) REFERENCES public.main_systemjobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_systemjob main_systemjob_unifiedjob_ptr_id_9517b368_fk_main_unifiedjob_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_systemjob
    ADD CONSTRAINT main_systemjob_unifiedjob_ptr_id_9517b368_fk_main_unifiedjob_id FOREIGN KEY (unifiedjob_ptr_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_systemjobevent main_systemjobevent_system_job_id_91bbbfc1_fk_main_syst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_systemjobevent
    ADD CONSTRAINT main_systemjobevent_system_job_id_91bbbfc1_fk_main_syst FOREIGN KEY (system_job_id) REFERENCES public.main_systemjob(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_systemjobtemplate main_systemjobtempla_unifiedjobtemplate_p_60f12f55_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_systemjobtemplate
    ADD CONSTRAINT main_systemjobtempla_unifiedjobtemplate_p_60f12f55_fk_main_unif FOREIGN KEY (unifiedjobtemplate_ptr_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_team main_team_admin_role_id_a9e09a22_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_admin_role_id_a9e09a22_fk_main_rbac_roles_id FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_team main_team_created_by_id_c370350b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_created_by_id_c370350b_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_team main_team_member_role_id_a2f93dc9_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_member_role_id_a2f93dc9_fk_main_rbac_roles_id FOREIGN KEY (member_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_team main_team_modified_by_id_9af533cd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_modified_by_id_9af533cd_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_team main_team_organization_id_8b31bbc1_fk_main_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_organization_id_8b31bbc1_fk_main_organization_id FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_team main_team_read_role_id_ea02761f_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_read_role_id_ea02761f_fk_main_rbac_roles_id FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob main_unifiedjob_created_by_id_d2a186ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_created_by_id_d2a186ab_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_credentials main_unifiedjob_cred_credential_id_661c8f49_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_credentials
    ADD CONSTRAINT main_unifiedjob_cred_credential_id_661c8f49_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_credentials main_unifiedjob_cred_unifiedjob_id_4ed7ff5d_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_credentials
    ADD CONSTRAINT main_unifiedjob_cred_unifiedjob_id_4ed7ff5d_fk_main_unif FOREIGN KEY (unifiedjob_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_dependent_jobs main_unifiedjob_depe_from_unifiedjob_id_c8d58e88_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_dependent_jobs
    ADD CONSTRAINT main_unifiedjob_depe_from_unifiedjob_id_c8d58e88_fk_main_unif FOREIGN KEY (from_unifiedjob_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_dependent_jobs main_unifiedjob_depe_to_unifiedjob_id_3f04cbcc_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_dependent_jobs
    ADD CONSTRAINT main_unifiedjob_depe_to_unifiedjob_id_3f04cbcc_fk_main_unif FOREIGN KEY (to_unifiedjob_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob main_unifiedjob_instance_group_id_f76a06e2_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_instance_group_id_f76a06e2_fk_main_inst FOREIGN KEY (instance_group_id) REFERENCES public.main_instancegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_labels main_unifiedjob_labe_unifiedjob_id_bd008d37_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_labels
    ADD CONSTRAINT main_unifiedjob_labe_unifiedjob_id_bd008d37_fk_main_unif FOREIGN KEY (unifiedjob_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_labels main_unifiedjob_labels_label_id_98814bad_fk_main_label_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_labels
    ADD CONSTRAINT main_unifiedjob_labels_label_id_98814bad_fk_main_label_id FOREIGN KEY (label_id) REFERENCES public.main_label(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob main_unifiedjob_modified_by_id_14cbb9bc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_modified_by_id_14cbb9bc_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_notifications main_unifiedjob_noti_notification_id_cf3498bf_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_notifications
    ADD CONSTRAINT main_unifiedjob_noti_notification_id_cf3498bf_fk_main_noti FOREIGN KEY (notification_id) REFERENCES public.main_notification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_notifications main_unifiedjob_noti_unifiedjob_id_65ab9c3c_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob_notifications
    ADD CONSTRAINT main_unifiedjob_noti_unifiedjob_id_65ab9c3c_fk_main_unif FOREIGN KEY (unifiedjob_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob main_unifiedjob_polymorphic_ctype_id_cb46239b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_polymorphic_ctype_id_cb46239b_fk_django_co FOREIGN KEY (polymorphic_ctype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob main_unifiedjob_schedule_id_766ca767_fk_main_schedule_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_schedule_id_766ca767_fk_main_schedule_id FOREIGN KEY (schedule_id) REFERENCES public.main_schedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob main_unifiedjob_unified_job_template_a398b197_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_unified_job_template_a398b197_fk_main_unif FOREIGN KEY (unified_job_template_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_credentials main_unifiedjobtempl_credential_id_fd216c80_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_credentials
    ADD CONSTRAINT main_unifiedjobtempl_credential_id_fd216c80_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate main_unifiedjobtempl_current_job_id_8f449ab0_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtempl_current_job_id_8f449ab0_fk_main_unif FOREIGN KEY (current_job_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplateinstancegroupmembership main_unifiedjobtempl_instancegroup_id_656188b4_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplateinstancegroupmembership
    ADD CONSTRAINT main_unifiedjobtempl_instancegroup_id_656188b4_fk_main_inst FOREIGN KEY (instancegroup_id) REFERENCES public.main_instancegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_labels main_unifiedjobtempl_label_id_d6a5ee75_fk_main_labe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_labels
    ADD CONSTRAINT main_unifiedjobtempl_label_id_d6a5ee75_fk_main_labe FOREIGN KEY (label_id) REFERENCES public.main_label(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate main_unifiedjobtempl_last_job_id_7e983743_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtempl_last_job_id_7e983743_fk_main_unif FOREIGN KEY (last_job_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate main_unifiedjobtempl_next_schedule_id_955ff55d_fk_main_sche; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtempl_next_schedule_id_955ff55d_fk_main_sche FOREIGN KEY (next_schedule_id) REFERENCES public.main_schedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_notification_templates_success main_unifiedjobtempl_notificationtemplate_9326cdf9_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_success
    ADD CONSTRAINT main_unifiedjobtempl_notificationtemplate_9326cdf9_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_notification_templates_started main_unifiedjobtempl_notificationtemplate_9793a63a_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_started
    ADD CONSTRAINT main_unifiedjobtempl_notificationtemplate_9793a63a_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_notification_templates_error main_unifiedjobtempl_notificationtemplate_b19df8ac_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_error
    ADD CONSTRAINT main_unifiedjobtempl_notificationtemplate_b19df8ac_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate main_unifiedjobtempl_polymorphic_ctype_id_ce19bb25_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtempl_polymorphic_ctype_id_ce19bb25_fk_django_co FOREIGN KEY (polymorphic_ctype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_notification_templates_error main_unifiedjobtempl_unifiedjobtemplate_i_0ce91b23_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_error
    ADD CONSTRAINT main_unifiedjobtempl_unifiedjobtemplate_i_0ce91b23_fk_main_unif FOREIGN KEY (unifiedjobtemplate_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_notification_templates_success main_unifiedjobtempl_unifiedjobtemplate_i_3934753d_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_success
    ADD CONSTRAINT main_unifiedjobtempl_unifiedjobtemplate_i_3934753d_fk_main_unif FOREIGN KEY (unifiedjobtemplate_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_notification_templates_started main_unifiedjobtempl_unifiedjobtemplate_i_6e21dce4_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_started
    ADD CONSTRAINT main_unifiedjobtempl_unifiedjobtemplate_i_6e21dce4_fk_main_unif FOREIGN KEY (unifiedjobtemplate_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_labels main_unifiedjobtempl_unifiedjobtemplate_i_c9307a9a_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_labels
    ADD CONSTRAINT main_unifiedjobtempl_unifiedjobtemplate_i_c9307a9a_fk_main_unif FOREIGN KEY (unifiedjobtemplate_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_credentials main_unifiedjobtempl_unifiedjobtemplate_i_d98d7c79_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_credentials
    ADD CONSTRAINT main_unifiedjobtempl_unifiedjobtemplate_i_d98d7c79_fk_main_unif FOREIGN KEY (unifiedjobtemplate_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplateinstancegroupmembership main_unifiedjobtempl_unifiedjobtemplate_i_e401e3d7_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplateinstancegroupmembership
    ADD CONSTRAINT main_unifiedjobtempl_unifiedjobtemplate_i_e401e3d7_fk_main_unif FOREIGN KEY (unifiedjobtemplate_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate main_unifiedjobtemplate_created_by_id_1f5fadfa_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtemplate_created_by_id_1f5fadfa_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate main_unifiedjobtemplate_modified_by_id_a8bf1de0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtemplate_modified_by_id_a8bf1de0_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_usersessionmembership main_usersessionmemb_session_id_fbab60a5_fk_django_se; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_usersessionmembership
    ADD CONSTRAINT main_usersessionmemb_session_id_fbab60a5_fk_django_se FOREIGN KEY (session_id) REFERENCES public.django_session(session_key) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_usersessionmembership main_usersessionmembership_user_id_fe163c98_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_usersessionmembership
    ADD CONSTRAINT main_usersessionmembership_user_id_fe163c98_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowapproval main_workflowapprova_approved_or_denied_b_bb3eae41_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowapproval
    ADD CONSTRAINT main_workflowapprova_approved_or_denied_b_bb3eae41_fk_auth_user FOREIGN KEY (approved_or_denied_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowapproval main_workflowapprova_unifiedjob_ptr_id_b8cd5385_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowapproval
    ADD CONSTRAINT main_workflowapprova_unifiedjob_ptr_id_b8cd5385_fk_main_unif FOREIGN KEY (unifiedjob_ptr_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowapprovaltemplate main_workflowapprova_unifiedjobtemplate_p_289f0768_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowapprovaltemplate
    ADD CONSTRAINT main_workflowapprova_unifiedjobtemplate_p_289f0768_fk_main_unif FOREIGN KEY (unifiedjobtemplate_ptr_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowapproval main_workflowapprova_workflow_approval_te_b87dda8a_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowapproval
    ADD CONSTRAINT main_workflowapprova_workflow_approval_te_b87dda8a_fk_main_work FOREIGN KEY (workflow_approval_template_id) REFERENCES public.main_workflowapprovaltemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjob main_workflowjob_inventory_id_8c31355b_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjob
    ADD CONSTRAINT main_workflowjob_inventory_id_8c31355b_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjob main_workflowjob_job_template_id_cceff2a3_fk_main_jobt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjob
    ADD CONSTRAINT main_workflowjob_job_template_id_cceff2a3_fk_main_jobt FOREIGN KEY (job_template_id) REFERENCES public.main_jobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjob main_workflowjob_unifiedjob_ptr_id_2ee92d99_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjob
    ADD CONSTRAINT main_workflowjob_unifiedjob_ptr_id_2ee92d99_fk_main_unif FOREIGN KEY (unifiedjob_ptr_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjob main_workflowjob_webhook_credential_i_57c9fece_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjob
    ADD CONSTRAINT main_workflowjob_webhook_credential_i_57c9fece_fk_main_cred FOREIGN KEY (webhook_credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjob main_workflowjob_workflow_job_templat_0d9a93a0_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjob
    ADD CONSTRAINT main_workflowjob_workflow_job_templat_0d9a93a0_fk_main_work FOREIGN KEY (workflow_job_template_id) REFERENCES public.main_workflowjobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_credentials main_workflowjobnode_credential_id_6de5a410_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_credentials
    ADD CONSTRAINT main_workflowjobnode_credential_id_6de5a410_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_always_nodes main_workflowjobnode_from_workflowjobnode_19edb9d7_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_always_nodes
    ADD CONSTRAINT main_workflowjobnode_from_workflowjobnode_19edb9d7_fk_main_work FOREIGN KEY (from_workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_failure_nodes main_workflowjobnode_from_workflowjobnode_2172a110_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_failure_nodes
    ADD CONSTRAINT main_workflowjobnode_from_workflowjobnode_2172a110_fk_main_work FOREIGN KEY (from_workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_success_nodes main_workflowjobnode_from_workflowjobnode_e04f9991_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_success_nodes
    ADD CONSTRAINT main_workflowjobnode_from_workflowjobnode_e04f9991_fk_main_work FOREIGN KEY (from_workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode main_workflowjobnode_inventory_id_1dac2da9_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode
    ADD CONSTRAINT main_workflowjobnode_inventory_id_1dac2da9_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode main_workflowjobnode_job_id_7d2de427_fk_main_unifiedjob_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode
    ADD CONSTRAINT main_workflowjobnode_job_id_7d2de427_fk_main_unifiedjob_id FOREIGN KEY (job_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_always_nodes main_workflowjobnode_to_workflowjobnode_i_0edcda07_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_always_nodes
    ADD CONSTRAINT main_workflowjobnode_to_workflowjobnode_i_0edcda07_fk_main_work FOREIGN KEY (to_workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_failure_nodes main_workflowjobnode_to_workflowjobnode_i_d2e09d9c_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_failure_nodes
    ADD CONSTRAINT main_workflowjobnode_to_workflowjobnode_i_d2e09d9c_fk_main_work FOREIGN KEY (to_workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_success_nodes main_workflowjobnode_to_workflowjobnode_i_e6c8cbb4_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_success_nodes
    ADD CONSTRAINT main_workflowjobnode_to_workflowjobnode_i_e6c8cbb4_fk_main_work FOREIGN KEY (to_workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode main_workflowjobnode_unified_job_template_8a30f93e_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode
    ADD CONSTRAINT main_workflowjobnode_unified_job_template_8a30f93e_fk_main_unif FOREIGN KEY (unified_job_template_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode main_workflowjobnode_workflow_job_id_dcd715c7_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode
    ADD CONSTRAINT main_workflowjobnode_workflow_job_id_dcd715c7_fk_main_work FOREIGN KEY (workflow_job_id) REFERENCES public.main_workflowjob(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_credentials main_workflowjobnode_workflowjobnode_id_31f8c02b_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobnode_credentials
    ADD CONSTRAINT main_workflowjobnode_workflowjobnode_id_31f8c02b_fk_main_work FOREIGN KEY (workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_admin_role_id_5675a40e_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_admin_role_id_5675a40e_fk_main_rbac FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_approval_role_id_220f0de1_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_approval_role_id_220f0de1_fk_main_rbac FOREIGN KEY (approval_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_credentials main_workflowjobtemp_credential_id_e621c8d1_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_credentials
    ADD CONSTRAINT main_workflowjobtemp_credential_id_e621c8d1_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_execute_role_id_ad8970f4_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_execute_role_id_ad8970f4_fk_main_rbac FOREIGN KEY (execute_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_always_nodes main_workflowjobtemp_from_workflowjobtemp_8af14c32_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_always_nodes
    ADD CONSTRAINT main_workflowjobtemp_from_workflowjobtemp_8af14c32_fk_main_work FOREIGN KEY (from_workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_success_nodes main_workflowjobtemp_from_workflowjobtemp_9e16f49d_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_success_nodes
    ADD CONSTRAINT main_workflowjobtemp_from_workflowjobtemp_9e16f49d_fk_main_work FOREIGN KEY (from_workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_failure_nodes main_workflowjobtemp_from_workflowjobtemp_fa405230_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_failure_nodes
    ADD CONSTRAINT main_workflowjobtemp_from_workflowjobtemp_fa405230_fk_main_work FOREIGN KEY (from_workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode main_workflowjobtemp_inventory_id_2fab864f_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode
    ADD CONSTRAINT main_workflowjobtemp_inventory_id_2fab864f_fk_main_inve FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_inventory_id_99929499_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_inventory_id_99929499_fk_main_inve FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate_notification_templates_approvals main_workflowjobtemp_notificationtemplate_3811d35e_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplate_notification_templates_approvals
    ADD CONSTRAINT main_workflowjobtemp_notificationtemplate_3811d35e_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_organization_id_a585475f_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_organization_id_a585475f_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_read_role_id_acdd95ef_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_read_role_id_acdd95ef_fk_main_rbac FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_failure_nodes main_workflowjobtemp_to_workflowjobtempla_2c1db0ae_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_failure_nodes
    ADD CONSTRAINT main_workflowjobtemp_to_workflowjobtempla_2c1db0ae_fk_main_work FOREIGN KEY (to_workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_always_nodes main_workflowjobtemp_to_workflowjobtempla_6fe11708_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_always_nodes
    ADD CONSTRAINT main_workflowjobtemp_to_workflowjobtempla_6fe11708_fk_main_work FOREIGN KEY (to_workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_success_nodes main_workflowjobtemp_to_workflowjobtempla_f16ee478_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_success_nodes
    ADD CONSTRAINT main_workflowjobtemp_to_workflowjobtempla_f16ee478_fk_main_work FOREIGN KEY (to_workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode main_workflowjobtemp_unified_job_template_98b53e6c_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode
    ADD CONSTRAINT main_workflowjobtemp_unified_job_template_98b53e6c_fk_main_unif FOREIGN KEY (unified_job_template_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_unifiedjobtemplate_p_3854248b_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_unifiedjobtemplate_p_3854248b_fk_main_unif FOREIGN KEY (unifiedjobtemplate_ptr_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_webhook_credential_i_ced1ad89_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_webhook_credential_i_ced1ad89_fk_main_cred FOREIGN KEY (webhook_credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode main_workflowjobtemp_workflow_job_templat_2fd591f0_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode
    ADD CONSTRAINT main_workflowjobtemp_workflow_job_templat_2fd591f0_fk_main_work FOREIGN KEY (workflow_job_template_id) REFERENCES public.main_workflowjobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate_notification_templates_approvals main_workflowjobtemp_workflowjobtemplate__ce7a17be_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplate_notification_templates_approvals
    ADD CONSTRAINT main_workflowjobtemp_workflowjobtemplate__ce7a17be_fk_main_work FOREIGN KEY (workflowjobtemplate_id) REFERENCES public.main_workflowjobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_credentials main_workflowjobtemp_workflowjobtemplaten_b91efe86_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_credentials
    ADD CONSTRAINT main_workflowjobtemp_workflowjobtemplaten_b91efe86_fk_main_work FOREIGN KEY (workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_gran_application_id_81923564_fk_main_oaut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_gran_application_id_81923564_fk_main_oaut FOREIGN KEY (application_id) REFERENCES public.main_oauth2application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_access_token_id_775e84e8_fk_main_oaut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_access_token_id_775e84e8_fk_main_oaut FOREIGN KEY (access_token_id) REFERENCES public.main_oauth2accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_application_id_2d1c311b_fk_main_oaut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_application_id_2d1c311b_fk_main_oaut FOREIGN KEY (application_id) REFERENCES public.main_oauth2application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sso_userenterpriseauth sso_userenterpriseauth_user_id_5982f0ef_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_userenterpriseauth
    ADD CONSTRAINT sso_userenterpriseauth_user_id_5982f0ef_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Debian 10.12-2.pgdg90+1)
-- Dumped by pg_dump version 10.12 (Debian 10.12-2.pgdg90+1)

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Debian 10.12-2.pgdg90+1)
-- Dumped by pg_dump version 10.12 (Debian 10.12-2.pgdg90+1)

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

