--
-- PostgreSQL database cluster dump
--

-- Started on 2024-11-12 20:20:58

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE azure_pg_admin;
ALTER ROLE azure_pg_admin WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE azuresu;
ALTER ROLE azuresu WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE "martotoAdmin";
ALTER ROLE "martotoAdmin" WITH NOSUPERUSER INHERIT CREATEROLE CREATEDB LOGIN NOREPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:HoN2EyYNosansnCgpa9WVw==$76KKLGbV3qnD0JxUimQ9v7+CQMqFODSQS15LbM4EVCk=:rERf/BxLwLXN+zbHBtvF3g9dmrmNWx0lmJ+82RzyUX4=';
CREATE ROLE replication;
ALTER ROLE replication WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN REPLICATION NOBYPASSRLS;

--
-- User Configurations
--

--
-- User Config "azuresu"
--

ALTER ROLE azuresu SET search_path TO 'pg_catalog';


--
-- Role memberships
--

GRANT azure_pg_admin TO "martotoAdmin" WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_checkpoint TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_create_subscription TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_monitor TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_read_all_data TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_read_all_settings TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_read_all_settings TO "martotoAdmin" WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_read_all_stats TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_read_all_stats TO "martotoAdmin" WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_signal_backend TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_stat_scan_tables TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_stat_scan_tables TO "martotoAdmin" WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_use_reserved_connections TO replication WITH INHERIT TRUE GRANTED BY azuresu;




--
-- Tablespaces
--

CREATE TABLESPACE temptblspace OWNER azure_pg_admin LOCATION '/mnt/pg_tmp';


--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-12 20:20:58

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: azure_pg_admin
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO azure_pg_admin;

--
-- TOC entry 4056 (class 0 OID 0)
-- Dependencies: 215
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO azure_pg_admin;


--
-- TOC entry 4057 (class 0 OID 0)
-- Dependencies: 228
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO azure_pg_admin;


--
-- TOC entry 4058 (class 0 OID 0)
-- Dependencies: 220
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO azure_pg_admin;


--
-- TOC entry 4059 (class 0 OID 0)
-- Dependencies: 221
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO azure_pg_admin;


--
-- TOC entry 4060 (class 0 OID 0)
-- Dependencies: 222
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO azure_pg_admin;


--
-- TOC entry 4061 (class 0 OID 0)
-- Dependencies: 223
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO azure_pg_admin;


--
-- TOC entry 4062 (class 0 OID 0)
-- Dependencies: 224
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO azure_pg_admin;


--
-- TOC entry 4063 (class 0 OID 0)
-- Dependencies: 229
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO azure_pg_admin;


--
-- TOC entry 4064 (class 0 OID 0)
-- Dependencies: 225
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO azure_pg_admin;


--
-- TOC entry 4065 (class 0 OID 0)
-- Dependencies: 226
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO azure_pg_admin;


--
-- TOC entry 4066 (class 0 OID 0)
-- Dependencies: 227
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO azure_pg_admin;


--
-- TOC entry 4067 (class 0 OID 0)
-- Dependencies: 230
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO azure_pg_admin;


--
-- TOC entry 4068 (class 0 OID 0)
-- Dependencies: 216
-- Name: FUNCTION pg_stat_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset() TO azure_pg_admin;


--
-- TOC entry 4069 (class 0 OID 0)
-- Dependencies: 217
-- Name: FUNCTION pg_stat_reset_shared(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_shared(text) TO azure_pg_admin;


--
-- TOC entry 4070 (class 0 OID 0)
-- Dependencies: 219
-- Name: FUNCTION pg_stat_reset_single_function_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_function_counters(oid) TO azure_pg_admin;


--
-- TOC entry 4071 (class 0 OID 0)
-- Dependencies: 218
-- Name: FUNCTION pg_stat_reset_single_table_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_table_counters(oid) TO azure_pg_admin;


--
-- TOC entry 4072 (class 0 OID 0)
-- Dependencies: 98
-- Name: COLUMN pg_config.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- TOC entry 4073 (class 0 OID 0)
-- Dependencies: 98
-- Name: COLUMN pg_config.setting; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(setting) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- TOC entry 4074 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.line_number; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(line_number) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4075 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.type; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(type) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4076 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.database; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(database) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4077 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.user_name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(user_name) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4078 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.address; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(address) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4079 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.netmask; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(netmask) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4080 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.auth_method; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(auth_method) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4081 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.options; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(options) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4082 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.error; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(error) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4083 (class 0 OID 0)
-- Dependencies: 144
-- Name: COLUMN pg_replication_origin_status.local_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4084 (class 0 OID 0)
-- Dependencies: 144
-- Name: COLUMN pg_replication_origin_status.external_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(external_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4085 (class 0 OID 0)
-- Dependencies: 144
-- Name: COLUMN pg_replication_origin_status.remote_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(remote_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4086 (class 0 OID 0)
-- Dependencies: 144
-- Name: COLUMN pg_replication_origin_status.local_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4087 (class 0 OID 0)
-- Dependencies: 99
-- Name: COLUMN pg_shmem_allocations.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4088 (class 0 OID 0)
-- Dependencies: 99
-- Name: COLUMN pg_shmem_allocations.off; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(off) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4089 (class 0 OID 0)
-- Dependencies: 99
-- Name: COLUMN pg_shmem_allocations.size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4090 (class 0 OID 0)
-- Dependencies: 99
-- Name: COLUMN pg_shmem_allocations.allocated_size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(allocated_size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4091 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.starelid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(starelid) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4092 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.staattnum; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staattnum) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4093 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stainherit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stainherit) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4094 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stanullfrac; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanullfrac) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4095 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stawidth; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stawidth) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4096 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stadistinct; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stadistinct) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4097 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stakind1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4098 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stakind2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4099 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stakind3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4100 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stakind4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4101 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stakind5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4102 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.staop1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4103 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.staop2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4104 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.staop3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4105 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.staop4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4106 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.staop5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4107 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stacoll1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4108 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stacoll2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4109 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stacoll3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4110 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stacoll4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4111 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stacoll5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4112 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stanumbers1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4113 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stanumbers2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4114 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stanumbers3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4115 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stanumbers4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4116 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stanumbers5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4117 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stavalues1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4118 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stavalues2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4119 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stavalues3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4120 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stavalues4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4121 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stavalues5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4122 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.oid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(oid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4123 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subdbid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subdbid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4124 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4125 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subowner; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subowner) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4126 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subenabled; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subenabled) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4127 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subconninfo; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subconninfo) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4128 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subslotname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subslotname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4129 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subsynccommit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subsynccommit) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4130 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subpublications; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subpublications) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


-- Completed on 2024-11-12 20:21:00

--
-- PostgreSQL database dump complete
--

--
-- Database "azure_maintenance" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-12 20:21:01

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
-- TOC entry 4063 (class 1262 OID 16384)
-- Name: azure_maintenance; Type: DATABASE; Schema: -; Owner: azuresu
--

CREATE DATABASE azure_maintenance WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE azure_maintenance OWNER TO azuresu;

\connect azure_maintenance

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
-- TOC entry 2 (class 3079 OID 32769)
-- Name: pg_availability; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_availability WITH SCHEMA pg_catalog;


--
-- TOC entry 4064 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_availability; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_availability IS 'pg_availability - availability and monitoring extension for PostgreSQL service';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 24744)
-- Name: lsnmover; Type: TABLE; Schema: public; Owner: azuresu
--

CREATE TABLE public.lsnmover (
    single_row_id boolean DEFAULT true NOT NULL,
    id bigint,
    update_time timestamp without time zone DEFAULT now(),
    CONSTRAINT ensure_one_row CHECK (single_row_id)
);


ALTER TABLE public.lsnmover OWNER TO azuresu;

--
-- TOC entry 4057 (class 0 OID 24744)
-- Dependencies: 217
-- Data for Name: lsnmover; Type: TABLE DATA; Schema: public; Owner: azuresu
--

COPY public.lsnmover (single_row_id, id, update_time) FROM stdin;
t	658801	2024-11-12 23:19:54.848188
\.


--
-- TOC entry 3913 (class 2606 OID 24751)
-- Name: lsnmover lsnmover_pk; Type: CONSTRAINT; Schema: public; Owner: azuresu
--

ALTER TABLE ONLY public.lsnmover
    ADD CONSTRAINT lsnmover_pk PRIMARY KEY (single_row_id);


--
-- TOC entry 4065 (class 0 OID 0)
-- Dependencies: 221
-- Name: FUNCTION pg_ls_dir(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_ls_dir(text) TO replication;


--
-- TOC entry 4066 (class 0 OID 0)
-- Dependencies: 222
-- Name: FUNCTION pg_ls_dir(text, boolean, boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_ls_dir(text, boolean, boolean) TO replication;


--
-- TOC entry 4067 (class 0 OID 0)
-- Dependencies: 224
-- Name: FUNCTION pg_read_binary_file(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_read_binary_file(text) TO replication;


--
-- TOC entry 4068 (class 0 OID 0)
-- Dependencies: 225
-- Name: FUNCTION pg_read_binary_file(text, bigint, bigint); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_read_binary_file(text, bigint, bigint) TO replication;


--
-- TOC entry 4069 (class 0 OID 0)
-- Dependencies: 220
-- Name: FUNCTION pg_read_binary_file(text, bigint, bigint, boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_read_binary_file(text, bigint, bigint, boolean) TO replication;


--
-- TOC entry 4070 (class 0 OID 0)
-- Dependencies: 223
-- Name: FUNCTION pg_stat_file(filename text, OUT size bigint, OUT access timestamp with time zone, OUT modification timestamp with time zone, OUT change timestamp with time zone, OUT creation timestamp with time zone, OUT isdir boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_file(filename text, OUT size bigint, OUT access timestamp with time zone, OUT modification timestamp with time zone, OUT change timestamp with time zone, OUT creation timestamp with time zone, OUT isdir boolean) TO replication;


--
-- TOC entry 4071 (class 0 OID 0)
-- Dependencies: 219
-- Name: FUNCTION pg_stat_file(filename text, missing_ok boolean, OUT size bigint, OUT access timestamp with time zone, OUT modification timestamp with time zone, OUT change timestamp with time zone, OUT creation timestamp with time zone, OUT isdir boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_file(filename text, missing_ok boolean, OUT size bigint, OUT access timestamp with time zone, OUT modification timestamp with time zone, OUT change timestamp with time zone, OUT creation timestamp with time zone, OUT isdir boolean) TO replication;


-- Completed on 2024-11-12 20:21:02

--
-- PostgreSQL database dump complete
--

--
-- Database "azure_sys" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-12 20:21:02

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
-- TOC entry 4170 (class 1262 OID 24601)
-- Name: azure_sys; Type: DATABASE; Schema: -; Owner: azuresu
--

CREATE DATABASE azure_sys WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE azure_sys OWNER TO azuresu;

\connect azure_sys

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
-- TOC entry 10 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: azure_pg_admin
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO azure_pg_admin;

--
-- TOC entry 5 (class 3079 OID 24720)
-- Name: pgms_stats; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgms_stats WITH SCHEMA public;


--
-- TOC entry 4171 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION pgms_stats; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgms_stats IS 'PG Microsoft Stats';


--
-- TOC entry 4 (class 3079 OID 24624)
-- Name: pg_qs; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_qs WITH SCHEMA public;


--
-- TOC entry 4172 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pg_qs; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_qs IS 'Query Store';


--
-- TOC entry 6 (class 3079 OID 24728)
-- Name: azure; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS azure WITH SCHEMA public;


--
-- TOC entry 4173 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION azure; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION azure IS 'azure extension for PostgreSQL service';


--
-- TOC entry 3 (class 3079 OID 24623)
-- Name: pgms_wait_sampling; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgms_wait_sampling WITH SCHEMA public;


--
-- TOC entry 4174 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION pgms_wait_sampling; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgms_wait_sampling IS 'PG Microsoft Wait Sampling';


--
-- TOC entry 2 (class 3079 OID 24602)
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- TOC entry 4175 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- TOC entry 4176 (class 0 OID 0)
-- Dependencies: 244
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO azure_pg_admin;


--
-- TOC entry 4177 (class 0 OID 0)
-- Dependencies: 274
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO azure_pg_admin;


--
-- TOC entry 4178 (class 0 OID 0)
-- Dependencies: 266
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO azure_pg_admin;


--
-- TOC entry 4179 (class 0 OID 0)
-- Dependencies: 267
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO azure_pg_admin;


--
-- TOC entry 4180 (class 0 OID 0)
-- Dependencies: 268
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO azure_pg_admin;


--
-- TOC entry 4181 (class 0 OID 0)
-- Dependencies: 269
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO azure_pg_admin;


--
-- TOC entry 4182 (class 0 OID 0)
-- Dependencies: 270
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO azure_pg_admin;


--
-- TOC entry 4183 (class 0 OID 0)
-- Dependencies: 275
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO azure_pg_admin;


--
-- TOC entry 4184 (class 0 OID 0)
-- Dependencies: 271
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO azure_pg_admin;


--
-- TOC entry 4185 (class 0 OID 0)
-- Dependencies: 272
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO azure_pg_admin;


--
-- TOC entry 4186 (class 0 OID 0)
-- Dependencies: 273
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO azure_pg_admin;


--
-- TOC entry 4187 (class 0 OID 0)
-- Dependencies: 276
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO azure_pg_admin;


--
-- TOC entry 4188 (class 0 OID 0)
-- Dependencies: 245
-- Name: FUNCTION pg_stat_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset() TO azure_pg_admin;


--
-- TOC entry 4189 (class 0 OID 0)
-- Dependencies: 246
-- Name: FUNCTION pg_stat_reset_shared(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_shared(text) TO azure_pg_admin;


--
-- TOC entry 4190 (class 0 OID 0)
-- Dependencies: 260
-- Name: FUNCTION pg_stat_reset_single_function_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_function_counters(oid) TO azure_pg_admin;


--
-- TOC entry 4191 (class 0 OID 0)
-- Dependencies: 259
-- Name: FUNCTION pg_stat_reset_single_table_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_table_counters(oid) TO azure_pg_admin;


--
-- TOC entry 4192 (class 0 OID 0)
-- Dependencies: 105
-- Name: COLUMN pg_config.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- TOC entry 4193 (class 0 OID 0)
-- Dependencies: 105
-- Name: COLUMN pg_config.setting; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(setting) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- TOC entry 4194 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_hba_file_rules.line_number; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(line_number) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4195 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_hba_file_rules.type; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(type) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4196 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_hba_file_rules.database; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(database) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4197 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_hba_file_rules.user_name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(user_name) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4198 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_hba_file_rules.address; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(address) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4199 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_hba_file_rules.netmask; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(netmask) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4200 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_hba_file_rules.auth_method; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(auth_method) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4201 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_hba_file_rules.options; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(options) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4202 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_hba_file_rules.error; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(error) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4203 (class 0 OID 0)
-- Dependencies: 151
-- Name: COLUMN pg_replication_origin_status.local_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4204 (class 0 OID 0)
-- Dependencies: 151
-- Name: COLUMN pg_replication_origin_status.external_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(external_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4205 (class 0 OID 0)
-- Dependencies: 151
-- Name: COLUMN pg_replication_origin_status.remote_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(remote_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4206 (class 0 OID 0)
-- Dependencies: 151
-- Name: COLUMN pg_replication_origin_status.local_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4207 (class 0 OID 0)
-- Dependencies: 106
-- Name: COLUMN pg_shmem_allocations.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4208 (class 0 OID 0)
-- Dependencies: 106
-- Name: COLUMN pg_shmem_allocations.off; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(off) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4209 (class 0 OID 0)
-- Dependencies: 106
-- Name: COLUMN pg_shmem_allocations.size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4210 (class 0 OID 0)
-- Dependencies: 106
-- Name: COLUMN pg_shmem_allocations.allocated_size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(allocated_size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4211 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.starelid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(starelid) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4212 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.staattnum; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staattnum) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4213 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stainherit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stainherit) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4214 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stanullfrac; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanullfrac) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4215 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stawidth; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stawidth) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4216 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stadistinct; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stadistinct) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4217 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stakind1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4218 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stakind2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4219 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stakind3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4220 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stakind4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4221 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stakind5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4222 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.staop1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4223 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.staop2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4224 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.staop3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4225 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.staop4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4226 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.staop5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4227 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stacoll1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4228 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stacoll2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4229 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stacoll3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4230 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stacoll4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4231 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stacoll5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4232 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stanumbers1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4233 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stanumbers2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4234 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stanumbers3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4235 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stanumbers4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4236 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stanumbers5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4237 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stavalues1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4238 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stavalues2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4239 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stavalues3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4240 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stavalues4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4241 (class 0 OID 0)
-- Dependencies: 46
-- Name: COLUMN pg_statistic.stavalues5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4242 (class 0 OID 0)
-- Dependencies: 71
-- Name: COLUMN pg_subscription.oid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(oid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4243 (class 0 OID 0)
-- Dependencies: 71
-- Name: COLUMN pg_subscription.subdbid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subdbid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4244 (class 0 OID 0)
-- Dependencies: 71
-- Name: COLUMN pg_subscription.subname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4245 (class 0 OID 0)
-- Dependencies: 71
-- Name: COLUMN pg_subscription.subowner; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subowner) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4246 (class 0 OID 0)
-- Dependencies: 71
-- Name: COLUMN pg_subscription.subenabled; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subenabled) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4247 (class 0 OID 0)
-- Dependencies: 71
-- Name: COLUMN pg_subscription.subconninfo; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subconninfo) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4248 (class 0 OID 0)
-- Dependencies: 71
-- Name: COLUMN pg_subscription.subslotname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subslotname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4249 (class 0 OID 0)
-- Dependencies: 71
-- Name: COLUMN pg_subscription.subsynccommit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subsynccommit) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4250 (class 0 OID 0)
-- Dependencies: 71
-- Name: COLUMN pg_subscription.subpublications; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subpublications) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


-- Completed on 2024-11-12 20:21:04

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-12 20:21:04

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
-- TOC entry 7 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: azure_pg_admin
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO azure_pg_admin;

--
-- TOC entry 3 (class 3079 OID 24752)
-- Name: azure; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS azure WITH SCHEMA pg_catalog;


--
-- TOC entry 4341 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION azure; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION azure IS 'azure extension for PostgreSQL service';


--
-- TOC entry 2 (class 3079 OID 24577)
-- Name: pgaadauth; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgaadauth WITH SCHEMA pg_catalog;


--
-- TOC entry 4342 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgaadauth; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgaadauth IS 'Azure Active Directory Authentication';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 257 (class 1259 OID 25047)
-- Name: agents_agentclient; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.agents_agentclient (
    id bigint NOT NULL,
    label character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    api_key character varying(100) NOT NULL,
    base_url character varying(200) NOT NULL,
    agent_id bigint NOT NULL
);


ALTER TABLE public.agents_agentclient OWNER TO "martotoAdmin";

--
-- TOC entry 256 (class 1259 OID 25046)
-- Name: agents_agentclient_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.agents_agentclient ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.agents_agentclient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 259 (class 1259 OID 25057)
-- Name: agents_clientsettings; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.agents_clientsettings (
    id bigint NOT NULL,
    model text NOT NULL,
    temperature integer NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.agents_clientsettings OWNER TO "martotoAdmin";

--
-- TOC entry 258 (class 1259 OID 25056)
-- Name: agents_clientsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.agents_clientsettings ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.agents_clientsettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 24780)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "martotoAdmin";

--
-- TOC entry 223 (class 1259 OID 24779)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 24788)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "martotoAdmin";

--
-- TOC entry 225 (class 1259 OID 24787)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 24774)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "martotoAdmin";

--
-- TOC entry 221 (class 1259 OID 24773)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 24794)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO "martotoAdmin";

--
-- TOC entry 230 (class 1259 OID 24802)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO "martotoAdmin";

--
-- TOC entry 229 (class 1259 OID 24801)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 24793)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 24808)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO "martotoAdmin";

--
-- TOC entry 231 (class 1259 OID 24807)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 24866)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO "martotoAdmin";

--
-- TOC entry 233 (class 1259 OID 24865)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 24766)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "martotoAdmin";

--
-- TOC entry 219 (class 1259 OID 24765)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 24758)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "martotoAdmin";

--
-- TOC entry 217 (class 1259 OID 24757)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 260 (class 1259 OID 25084)
-- Name: django_session; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "martotoAdmin";

--
-- TOC entry 240 (class 1259 OID 24901)
-- Name: polls_agent; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.polls_agent (
    id bigint NOT NULL,
    score integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.polls_agent OWNER TO "martotoAdmin";

--
-- TOC entry 239 (class 1259 OID 24900)
-- Name: polls_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.polls_agent ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 24907)
-- Name: polls_agentpost; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.polls_agentpost (
    id bigint NOT NULL,
    text character varying(500) NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    owner_id bigint NOT NULL
);


ALTER TABLE public.polls_agentpost OWNER TO "martotoAdmin";

--
-- TOC entry 241 (class 1259 OID 24906)
-- Name: polls_agentpost_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.polls_agentpost ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_agentpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 244 (class 1259 OID 24915)
-- Name: polls_agentpost_likes; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.polls_agentpost_likes (
    id bigint NOT NULL,
    agentpost_id bigint NOT NULL,
    agent_id bigint NOT NULL
);


ALTER TABLE public.polls_agentpost_likes OWNER TO "martotoAdmin";

--
-- TOC entry 243 (class 1259 OID 24914)
-- Name: polls_agentpost_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.polls_agentpost_likes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_agentpost_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 249 (class 1259 OID 24941)
-- Name: polls_choice; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.polls_choice (
    id bigint NOT NULL,
    choice_text character varying(200) NOT NULL,
    score bigint NOT NULL,
    question_id bigint NOT NULL
);


ALTER TABLE public.polls_choice OWNER TO "martotoAdmin";

--
-- TOC entry 248 (class 1259 OID 24940)
-- Name: polls_choice_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.polls_choice ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_choice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 24887)
-- Name: polls_classification; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.polls_classification (
    id bigint NOT NULL,
    classification_text character varying(200),
    range numeric(5,2) NOT NULL,
    score bigint NOT NULL,
    benchmark numeric(5,2) NOT NULL,
    question_id bigint NOT NULL
);


ALTER TABLE public.polls_classification OWNER TO "martotoAdmin";

--
-- TOC entry 235 (class 1259 OID 24886)
-- Name: polls_classification_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.polls_classification ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_classification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 245 (class 1259 OID 24920)
-- Name: polls_crowd; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.polls_crowd (
    email character varying(254) NOT NULL,
    name character varying(30) NOT NULL,
    agent_id bigint NOT NULL,
    age integer,
    sex character varying,
    duration integer
);


ALTER TABLE public.polls_crowd OWNER TO "martotoAdmin";

--
-- TOC entry 247 (class 1259 OID 24928)
-- Name: polls_estimate; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.polls_estimate (
    id bigint NOT NULL,
    value numeric(5,2) NOT NULL,
    description text,
    agent_id bigint NOT NULL,
    classification_id bigint NOT NULL
);


ALTER TABLE public.polls_estimate OWNER TO "martotoAdmin";

--
-- TOC entry 246 (class 1259 OID 24927)
-- Name: polls_estimate_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.polls_estimate ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_estimate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 24893)
-- Name: polls_question; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.polls_question (
    id bigint NOT NULL,
    question_query text,
    question_text text NOT NULL,
    available boolean NOT NULL
);


ALTER TABLE public.polls_question OWNER TO "martotoAdmin";

--
-- TOC entry 237 (class 1259 OID 24892)
-- Name: polls_question_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.polls_question ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 251 (class 1259 OID 24947)
-- Name: polls_questiongroup; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.polls_questiongroup (
    id bigint NOT NULL,
    label character varying(30),
    slug character varying(50) NOT NULL
);


ALTER TABLE public.polls_questiongroup OWNER TO "martotoAdmin";

--
-- TOC entry 250 (class 1259 OID 24946)
-- Name: polls_questiongroup_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.polls_questiongroup ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_questiongroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 253 (class 1259 OID 24955)
-- Name: polls_questiongroup_questions; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.polls_questiongroup_questions (
    id bigint NOT NULL,
    questiongroup_id bigint NOT NULL,
    question_id bigint NOT NULL
);


ALTER TABLE public.polls_questiongroup_questions OWNER TO "martotoAdmin";

--
-- TOC entry 252 (class 1259 OID 24954)
-- Name: polls_questiongroup_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.polls_questiongroup_questions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_questiongroup_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 255 (class 1259 OID 24961)
-- Name: polls_vote; Type: TABLE; Schema: public; Owner: martotoAdmin
--

CREATE TABLE public.polls_vote (
    id bigint NOT NULL,
    description text,
    agent_id bigint NOT NULL,
    choice_id bigint NOT NULL
);


ALTER TABLE public.polls_vote OWNER TO "martotoAdmin";

--
-- TOC entry 254 (class 1259 OID 24960)
-- Name: polls_vote_id_seq; Type: SEQUENCE; Schema: public; Owner: martotoAdmin
--

ALTER TABLE public.polls_vote ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_vote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4332 (class 0 OID 25047)
-- Dependencies: 257
-- Data for Name: agents_agentclient; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.agents_agentclient (id, label, slug, api_key, base_url, agent_id) FROM stdin;
\.


--
-- TOC entry 4334 (class 0 OID 25057)
-- Dependencies: 259
-- Data for Name: agents_clientsettings; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.agents_clientsettings (id, model, temperature, client_id) FROM stdin;
\.


--
-- TOC entry 4299 (class 0 OID 24780)
-- Dependencies: 224
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 4301 (class 0 OID 24788)
-- Dependencies: 226
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 4297 (class 0 OID 24774)
-- Dependencies: 222
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add classification	1	add_classification
2	Can change classification	1	change_classification
3	Can delete classification	1	delete_classification
4	Can view classification	1	view_classification
5	Can add question	2	add_question
6	Can change question	2	change_question
7	Can delete question	2	delete_question
8	Can view question	2	view_question
9	Can add agent	3	add_agent
10	Can change agent	3	change_agent
11	Can delete agent	3	delete_agent
12	Can view agent	3	view_agent
13	Can add agent post	4	add_agentpost
14	Can change agent post	4	change_agentpost
15	Can delete agent post	4	delete_agentpost
16	Can view agent post	4	view_agentpost
17	Can add crowd	5	add_crowd
18	Can change crowd	5	change_crowd
19	Can delete crowd	5	delete_crowd
20	Can view crowd	5	view_crowd
21	Can add estimate	6	add_estimate
22	Can change estimate	6	change_estimate
23	Can delete estimate	6	delete_estimate
24	Can view estimate	6	view_estimate
25	Can add choice	7	add_choice
26	Can change choice	7	change_choice
27	Can delete choice	7	delete_choice
28	Can view choice	7	view_choice
29	Can add question group	8	add_questiongroup
30	Can change question group	8	change_questiongroup
31	Can delete question group	8	delete_questiongroup
32	Can view question group	8	view_questiongroup
33	Can add vote	9	add_vote
34	Can change vote	9	change_vote
35	Can delete vote	9	delete_vote
36	Can view vote	9	view_vote
37	Can add agent client	10	add_agentclient
38	Can change agent client	10	change_agentclient
39	Can delete agent client	10	delete_agentclient
40	Can view agent client	10	view_agentclient
41	Can add client settings	11	add_clientsettings
42	Can change client settings	11	change_clientsettings
43	Can delete client settings	11	delete_clientsettings
44	Can view client settings	11	view_clientsettings
45	Can add log entry	12	add_logentry
46	Can change log entry	12	change_logentry
47	Can delete log entry	12	delete_logentry
48	Can view log entry	12	view_logentry
49	Can add permission	13	add_permission
50	Can change permission	13	change_permission
51	Can delete permission	13	delete_permission
52	Can view permission	13	view_permission
53	Can add group	14	add_group
54	Can change group	14	change_group
55	Can delete group	14	delete_group
56	Can view group	14	view_group
57	Can add user	15	add_user
58	Can change user	15	change_user
59	Can delete user	15	delete_user
60	Can view user	15	view_user
61	Can add content type	16	add_contenttype
62	Can change content type	16	change_contenttype
63	Can delete content type	16	delete_contenttype
64	Can view content type	16	view_contenttype
65	Can add session	17	add_session
66	Can change session	17	change_session
67	Can delete session	17	delete_session
68	Can view session	17	view_session
\.


--
-- TOC entry 4303 (class 0 OID 24794)
-- Dependencies: 228
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$720000$QjqEGx2vMii97mcCcMMjf9$5cTyX66IHDmV5xNEUFBG3+kqGj5XdbQuOsLC8tMkIuM=	2024-08-31 18:10:39.39565+00	f	teste				f	t	2024-08-31 18:10:23.04726+00
3	pbkdf2_sha256$720000$RKg1NexZS1rGwqDQgcyMqY$NkWmu7s2m97aTnshjERBna7ZH2Ff/H5BnnFf2YkDT5o=	2024-09-03 20:20:37.554399+00	f	Ferreira				f	t	2024-09-03 20:20:20.99034+00
1	pbkdf2_sha256$720000$dOnYm7XThYkbRUwV0LJJbF$4lhUl4+MS52yZMjzBGZB79rVET5eb4XHv+lCGeeDypY=	2024-09-28 20:23:59.49801+00	t	martoto			dansal@alunos.utfpr.edu.br	t	t	2024-08-30 23:05:35.030613+00
\.


--
-- TOC entry 4305 (class 0 OID 24802)
-- Dependencies: 230
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 4307 (class 0 OID 24808)
-- Dependencies: 232
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 4309 (class 0 OID 24866)
-- Dependencies: 234
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-08-30 23:07:08.514708+00	1	Question object (1)	1	[{"added": {}}, {"added": {"name": "classification", "object": "Classification object (1)"}}]	2	1
2	2024-08-30 23:09:32.67315+00	2	Question object (2)	1	[{"added": {}}, {"added": {"name": "classification", "object": "Classification object (2)"}}]	2	1
3	2024-08-30 23:10:17.1244+00	3	Question object (3)	1	[{"added": {}}, {"added": {"name": "classification", "object": "Classification object (3)"}}]	2	1
4	2024-08-30 23:11:40.066167+00	4	Question object (4)	1	[{"added": {}}, {"added": {"name": "classification", "object": "Classification object (4)"}}]	2	1
5	2024-08-30 23:12:27.337812+00	5	Question object (5)	1	[{"added": {}}, {"added": {"name": "classification", "object": "Classification object (5)"}}]	2	1
6	2024-08-30 23:13:24.189222+00	6	Question object (6)	1	[{"added": {}}, {"added": {"name": "classification", "object": "Classification object (6)"}}]	2	1
7	2024-08-30 23:14:39.641068+00	7	Question object (7)	1	[{"added": {}}, {"added": {"name": "classification", "object": "Classification object (7)"}}]	2	1
8	2024-08-30 23:17:00.717222+00	8	Question object (8)	1	[{"added": {}}, {"added": {"name": "classification", "object": "Classification object (8)"}}]	2	1
9	2024-08-30 23:17:31.460298+00	1	QuizFraude	1	[{"added": {}}]	8	1
10	2024-08-31 17:39:29.330001+00	1	Question object (1)	2	[{"changed": {"name": "classification", "object": "Classification object (1)", "fields": ["Benchmark"]}}]	2	1
11	2024-08-31 17:39:43.932374+00	2	Question object (2)	2	[{"changed": {"name": "classification", "object": "Classification object (2)", "fields": ["Benchmark"]}}]	2	1
12	2024-08-31 17:40:10.024456+00	3	Question object (3)	2	[{"changed": {"name": "classification", "object": "Classification object (3)", "fields": ["Benchmark"]}}]	2	1
13	2024-08-31 17:41:10.410161+00	4	Question object (4)	2	[{"changed": {"name": "classification", "object": "Classification object (4)", "fields": ["Benchmark"]}}]	2	1
14	2024-08-31 17:41:16.171904+00	4	Question object (4)	2	[]	2	1
15	2024-08-31 17:41:29.12329+00	6	Question object (6)	2	[{"changed": {"name": "classification", "object": "Classification object (6)", "fields": ["Benchmark"]}}]	2	1
16	2024-08-31 17:44:37.719368+00	7	Question object (7)	2	[{"changed": {"name": "classification", "object": "Classification object (7)", "fields": ["Benchmark"]}}]	2	1
17	2024-08-31 17:44:49.690106+00	8	Question object (8)	2	[{"changed": {"name": "classification", "object": "Classification object (8)", "fields": ["Benchmark"]}}]	2	1
18	2024-09-03 20:08:13.4902+00	16	Agent object (16)	3		3	1
19	2024-09-06 22:30:05.814748+00	9	Question object (9)	1	[{"added": {}}, {"added": {"name": "classification", "object": "Classification object (9)"}}]	2	1
20	2024-09-06 22:30:16.58534+00	1	QuizFraude	2	[{"changed": {"fields": ["Questions"]}}]	8	1
21	2024-09-07 19:32:33.673576+00	10	Question object (10)	1	[{"added": {}}, {"added": {"name": "classification", "object": "Classification object (10)"}}]	2	1
22	2024-09-07 19:37:31.950476+00	11	Question object (11)	1	[{"added": {}}, {"added": {"name": "classification", "object": "Classification object (11)"}}]	2	1
23	2024-09-07 19:42:26.729496+00	12	Question object (12)	1	[{"added": {}}, {"added": {"name": "classification", "object": "Classification object (12)"}}]	2	1
24	2024-09-07 19:49:02.709456+00	1	Question object (1)	2	[{"changed": {"fields": ["Question text"]}}]	2	1
25	2024-09-07 19:49:10.958055+00	1	Question object (1)	2	[]	2	1
26	2024-09-07 19:50:27.932534+00	2	Question object (2)	2	[{"changed": {"fields": ["Question text"]}}]	2	1
27	2024-09-07 19:58:22.882534+00	3	Question object (3)	2	[{"changed": {"fields": ["Question text"]}}]	2	1
28	2024-09-07 20:00:44.195826+00	4	Question object (4)	2	[{"changed": {"fields": ["Question text"]}}]	2	1
29	2024-09-07 20:27:23.847196+00	5	Question object (5)	2	[{"changed": {"fields": ["Question text"]}}]	2	1
30	2024-09-07 20:30:11.093392+00	5	Question object (5)	2	[{"changed": {"name": "classification", "object": "Classification object (5)", "fields": ["Benchmark"]}}]	2	1
31	2024-09-07 20:30:54.976634+00	6	Question object (6)	2	[{"changed": {"fields": ["Question text"]}}]	2	1
32	2024-09-07 20:31:00.56499+00	6	Question object (6)	2	[]	2	1
33	2024-09-07 21:29:44.647679+00	7	Question object (7)	2	[{"changed": {"fields": ["Question text"]}}]	2	1
34	2024-09-07 21:33:08.934509+00	8	Question object (8)	2	[{"changed": {"fields": ["Question text"]}}]	2	1
\.


--
-- TOC entry 4295 (class 0 OID 24766)
-- Dependencies: 220
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	polls	classification
2	polls	question
3	polls	agent
4	polls	agentpost
5	polls	crowd
6	polls	estimate
7	polls	choice
8	polls	questiongroup
9	polls	vote
10	agents	agentclient
11	agents	clientsettings
12	admin	logentry
13	auth	permission
14	auth	group
15	auth	user
16	contenttypes	contenttype
17	sessions	session
\.


--
-- TOC entry 4293 (class 0 OID 24758)
-- Dependencies: 218
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-08-30 23:04:46.656692+00
2	auth	0001_initial	2024-08-30 23:04:46.910585+00
3	admin	0001_initial	2024-08-30 23:04:47.024033+00
4	admin	0002_logentry_remove_auto_add	2024-08-30 23:04:47.0788+00
5	admin	0003_logentry_add_action_flag_choices	2024-08-30 23:04:47.114865+00
8	contenttypes	0002_remove_content_type_name	2024-08-30 23:04:48.222003+00
9	auth	0002_alter_permission_name_max_length	2024-08-30 23:04:48.36236+00
10	auth	0003_alter_user_email_max_length	2024-08-30 23:04:48.504902+00
11	auth	0004_alter_user_username_opts	2024-08-30 23:04:48.598463+00
12	auth	0005_alter_user_last_login_null	2024-08-30 23:04:48.662005+00
13	auth	0006_require_contenttypes_0002	2024-08-30 23:04:48.66885+00
14	auth	0007_alter_validators_add_error_messages	2024-08-30 23:04:48.713044+00
15	auth	0008_alter_user_username_max_length	2024-08-30 23:04:48.784844+00
16	auth	0009_alter_user_last_name_max_length	2024-08-30 23:04:48.852712+00
17	auth	0010_alter_group_name_max_length	2024-08-30 23:04:48.922109+00
18	auth	0011_update_proxy_permissions	2024-08-30 23:04:49.003701+00
19	auth	0012_alter_user_first_name_max_length	2024-08-30 23:04:49.214565+00
20	sessions	0001_initial	2024-08-30 23:04:49.28238+00
21	polls	0001_initial	2024-08-31 16:37:57.620668+00
22	polls	0002_question_question_image	2024-08-31 16:37:57.632959+00
23	polls	0003_remove_question_question_image_and_more	2024-08-31 16:37:57.637108+00
24	polls	0004_remove_question_question_image_path_agent	2024-08-31 16:37:57.64075+00
25	polls	0005_remove_choice_votes_choice_score	2024-08-31 16:37:57.644781+00
26	polls	0006_vote	2024-08-31 16:37:57.649338+00
27	polls	0007_question_available_agentpost	2024-08-31 16:37:57.653246+00
28	polls	0008_vote_description_alter_question_question_text_and_more	2024-08-31 16:37:57.658555+00
29	polls	0009_agent_score	2024-08-31 16:37:57.662317+00
30	polls	0010_classification_benchmark_and_more	2024-08-31 16:37:57.667595+00
31	polls	0011_question_question_query	2024-08-31 16:37:57.672604+00
32	polls	0012_questiongroup_alter_agent_user_crowd_question_group	2024-08-31 16:37:57.680439+00
33	polls	0013_remove_question_group_questiongroup_questions	2024-08-31 16:37:57.683453+00
34	polls	0014_questiongroup_label	2024-08-31 16:37:57.686959+00
35	polls	0015_questiongroup_slug	2024-08-31 16:37:57.691317+00
36	polls	0016_alter_crowd_agent	2024-08-31 16:37:57.696968+00
37	polls	0017_alter_crowd_session_alter_questiongroup_questions	2024-08-31 16:37:57.700335+00
42	polls	0018_remove_crowd_session_remove_question_pub_date_and_more	2024-08-31 17:10:03.843638+00
43	polls	0019_crowd_duration	2024-09-17 09:32:35.206639+00
44	polls	0020_remove_crowd_duration	2024-09-17 09:32:35.257185+00
45	polls	0021_crowd_duration	2024-09-17 09:32:35.295642+00
\.


--
-- TOC entry 4335 (class 0 OID 25084)
-- Dependencies: 260
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
cjyvaq9y8sp1kv0pj5xpp5063609r80s	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoxfQ:1skAyW:v743wh7z_x8GwNQpBT5G0xZ0PHVsJkQmSRm1lHH7OJ0	2024-09-13 23:24:16.412554+00
ze89bs6j3kwtdib3x9lrfzyudyr53zqf	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoyfQ:1skB0M:nNCHFeIZbHXo9fpKq0mQDBbOOWu99LYde4Cc__pbVpM	2024-09-13 23:26:10.685463+00
s9erdldvaz8mvycd7m0dc1vfvxzjte0i	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoxMH0:1skSEl:DfBRCW8XEPnNxCdbly2WMgFof3wnRWvVQEmFubLyne0	2024-09-14 17:50:11.058608+00
e5h7dfy87lfg9vqfuwmxs3xgn9sn4i1t	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoxMn0:1skT0G:UBNbbBQtPeO6smwzAsW_nfZM9n-Mxc8aNQ4ohcoT3G8	2024-09-14 18:39:16.385531+00
ulsi58dnwflfw2quabeqs3sxrx33nwn6	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoxM30:1skT0R:GbHGWWBEvW7MYInmYWLmWqWGy4-PPSe31FeiO9c7E5o	2024-09-14 18:39:27.191545+00
1k5h1ld0zfo2p6du8d9lgjfjvbwly6t8	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoxNH0:1sl677:WmIwcIq60Nqq5p5ZjcwCtKoP_S59a3tTsGd43lxtoNg	2024-09-16 12:24:57.455743+00
gb080rok01jirim5iuw7nshl2eov6qdi	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoxNX0:1sl6DZ:3-TsVXHUTu91G9ICxBjaVQ67klAi3rsvzK_ChHdBIhg	2024-09-16 12:31:37.621895+00
9viovaixe1xc4wxu5jat8sl4vkihhwin	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoxNn0:1slCfj:iJZBWVxbWk9qOyBiCy1nOAFu3N6kjRA1d1XclIa4M88	2024-09-16 19:25:07.514292+00
ckz205ibrwv4g3qwy1p6bnk49tpbh6xy	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoxN30:1slEGV:n25b8THphr1mfRiSf9GH7nFvu5upwediZOGXr3RPbi8	2024-09-16 21:07:11.885753+00
ku7tylpqb2pc9qx4grr7f8662yw5h93f	.eJxVjE0PgjAQRP_LnknTRWBbjt49eib92ApqSmxpTDT-dyHhwnHmvZkvmJjfnNgj9EsqXMGrTJ9r5gQ9YgWDKcs4lDUPk4ceTnDorHEPjhvwdxNvs3BzXNJkxaaInWZxmT0_z7t7OBhNHtc12o6cqzVKdZLOW42hk9x4y9g2oe6UCS0ZRYiERgZJTunG65pRtkSa4PcHfphBgg:1sla0z:CE-n64YXr6k9PoAAWYX8tr37TTtGgA1qKRtTJGoQSRA	2024-09-17 20:20:37.590169+00
q5n8bkblrhzykubn5d8691jworfy4yrt	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoxOX0:1slaGo:Naqmw6kZX6LEggp56GjmgMo5zGP0yiDLQdofBwXSixw	2024-09-17 20:36:58.083644+00
m01hw30mr4kvndomwk8gvq4zm8d3c83o	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoyMH0:1slb9g:pWAgkl3rkudNhtMztHv_7l-ZndcbEr9mRLwiKT8MFVA	2024-09-17 21:33:40.157037+00
8i6h60462csblcsm5vonaztaaiapjmqi	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoyMX0:1sn3dH:gIXLCnHfI-tbVY4jH63-WHT8dmVjZQx6FXboVOF4j_4	2024-09-21 22:10:15.041364+00
xcnjd4egi0dxxly4abhf84vkgsh0zi7a	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoyMn0:1snSs3:ItFbDFjKy_Z7LhyeIQrDpt_arqMeQXsqi36wZcKYjf0	2024-09-23 01:07:11.544383+00
y3gt60i8zhtcju11dlka7kiov4ev9ndg	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoyNH0:1srosC:mGirwNbROqZf1vHbge7P4--VhH5Iz6XEoT8YL9wynJY	2024-10-05 01:25:20.131715+00
9keiix63yelhpipcw6rf5u1kj8qoxrj3	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoyNX0:1srqms:sVgF160Ht0Y2nwOzN4mQeAjnfBN_MX49tnf-v7RkjQA	2024-10-05 03:27:58.477963+00
m55ryo3sb03004sngjd8jenwz4ri225b	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoyNn0:1srr08:GTTst1M5jYE55nYlJtr-xpqKXU9EopzEdqJYODRKna4	2024-10-05 03:41:40.915134+00
hqvvus2mpqgl5u22htbf3lmau4w9ah9u	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoyN30:1srrEE:tTHc-jeP28A7c6ba3879vpiSriG3PqCBLpzSRYbplHM	2024-10-05 03:56:14.090301+00
ffo88n46ykp29kl7nz1594jv5ezpi4b2	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoyOH0:1srs3n:F0tUDnWLt3XMNFkiv254djfToFBaMsTgYaQ6pTIgf38	2024-10-05 04:49:31.146076+00
rgyxpn2jnx1abvwf53evigve16x3q90h	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjoyOX0:1srtU1:TkQuJ373sN-Nd0J28imn9GY_OexPDtVFiKs_I_oRhs8	2024-10-05 06:20:41.86348+00
5tbmywx50s63at8ptropm9bcctsolkx2	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjozMH0:1srtU2:4g_Rc-mnSNyahi9ocGl3y3yixTFOjuHTumWg_7T4UAA	2024-10-05 06:20:42.794214+00
f10cg49543uqlmba420w8yq3f59f5g7j	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjozMX0:1srwBp:zdmU6HTV9Bo-MjUWf_ARScXTyEqXJLph0sqtnni8t48	2024-10-05 09:14:05.77101+00
zugvjbhcunphgriiij9dhsh8fs2i1wm8	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjozMn0:1srxEO:YLahHdwvsImEKPDmmsJOOpkZ9xHBDbClz0_SP1McC08	2024-10-05 10:20:48.550521+00
t16n7aekeipe1cfk44y4leg80efsbyvi	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjozM30:1srzuR:rHAMOxQ7oSjVmvl1_I754hmFvoLsuNMkEVYm8RMRqVU	2024-10-05 13:12:23.371577+00
gympgzgere9a4ekqzrz0nw4j9anxkw7m	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjozNH0:1ss1c3:2LR9eYF6_CpMN0NZBB87q7mD9SJ0Mm4Oas3g03FK3vQ	2024-10-05 15:01:31.761696+00
0cyurrvyicauu0u4kb6ccjqd82w0fbhk	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjozNX0:1ss1xz:p09seP9wOsejfJ9f4tIzXcFejAaSQ4onRyKJ3sbZBks	2024-10-05 15:24:11.056178+00
d2ul4fejpva8kz7vd61wueuvuxl07qlq	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjozNn0:1ss64V:WUhMJL7yX-ujSYX6MtB7rKowA1H4NnZjx4dyDdkWXIw	2024-10-05 19:47:11.643624+00
lk9kwut1ainfrxutctykb47jagmves6o	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjozN30:1ss6pt:BZOOrh9B5l1ks_hM6Tosa28XQAeldbzCWFHdwBIMlKI	2024-10-05 20:36:09.646995+00
o11vknb4mk404k8il40fh44fdq5fxbwz	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjozOH0:1ssrNO:baJ5If1YfdKsjSpIYVjfP097U-skAQJx4oFSZpdpHXc	2024-10-07 22:17:50.896989+00
i794juec2b90odys2nv1p9ikszvgqf4u	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjozOX0:1stJMX:GivlgZSXak_NY2KAFa1w_u-Q1RlziczNiwHpNhMpUjI	2024-10-09 04:10:49.948525+00
8qa1fumy9fxt118iohkdfde11y5bz7fc	.eJxVjEEOwiAQRe_C2pBCKTAu3fcMzQwzlaqBpLQr491Nky50-997_60m3Lc87U3WaWF1VUZdfjfC9JRyAH5guVedatnWhfSh6JM2PVaW1-10_w4ytnzU4pMD6giN7akLPUPPSDPP3rAd2OAM1kN0kUMgH2IykNANINEHkE59vvvkOBo:1sudyx:g_s3IO4emi8JccA0tjY2zluH0iWflfMCo-4bnlOyqNY	2024-10-12 20:23:59.523436+00
cf6jk87b9oxss6jwrcn147ppc98w3qvg	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjo0MH0:1sug6O:fO_bZh9IiHmDLY8-hn9MgAPwykxtETN2T2AtrLa_zV0	2024-10-12 22:39:48.506957+00
d2chpcuyytooznyzjaypt57h7uu3t8ln	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjo0MX0:1sug76:9Y_gHZ8scvhKrLnkpCZeu7cX2CtuNkD-Roo2AyCa_YQ	2024-10-12 22:40:32.106655+00
s9j7uon12nsx2nd5tt9bjlzfe4l6f2sk	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjo0Mn0:1sug8A:4aA8ywSnSMLpVfOUyI13NeF3sV2lT4HwP7e5R4I18Kw	2024-10-12 22:41:38.579487+00
nhqw5gru79igi1thsb8ib5ypt0l3cd6u	eyJhbnN3ZXJlZDEiOnRydWUsInF1aXpVc2VyIjo0M30:1sug8L:Z6A0uQPPpPYX7zEUPzWJleQ2CqoobbtUU0BeLjPSiX4	2024-10-12 22:41:49.625947+00
\.


--
-- TOC entry 4315 (class 0 OID 24901)
-- Dependencies: 240
-- Data for Name: polls_agent; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.polls_agent (id, score, user_id) FROM stdin;
1	533	1
12	461	1
15	417	1
19	545	1
23	585	1
26	395	1
2	199	1
29	497	1
33	639	1
20	534	1
13	564	1
37	607	1
41	619	1
24	547	1
10	493	1
17	489	1
14	433	1
27	573	1
21	577	1
30	497	1
11	493	1
34	615	1
18	491	1
25	575	1
38	395	1
28	565	1
22	589	1
42	585	1
31	689	1
35	515	1
39	525	1
32	477	1
43	567	1
36	399	1
40	591	1
\.


--
-- TOC entry 4317 (class 0 OID 24907)
-- Dependencies: 242
-- Data for Name: polls_agentpost; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.polls_agentpost (id, text, pub_date, owner_id) FROM stdin;
\.


--
-- TOC entry 4319 (class 0 OID 24915)
-- Dependencies: 244
-- Data for Name: polls_agentpost_likes; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.polls_agentpost_likes (id, agentpost_id, agent_id) FROM stdin;
\.


--
-- TOC entry 4324 (class 0 OID 24941)
-- Dependencies: 249
-- Data for Name: polls_choice; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.polls_choice (id, choice_text, score, question_id) FROM stdin;
\.


--
-- TOC entry 4311 (class 0 OID 24887)
-- Dependencies: 236
-- Data for Name: polls_classification; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.polls_classification (id, classification_text, range, score, benchmark, question_id) FROM stdin;
1	Fraude?	100.00	100	30.00	1
2	Fraude?	100.00	100	80.00	2
3	Fraude?	100.00	100	30.00	3
4	Fraude?	100.00	100	86.00	4
6	Fraude?	100.00	100	49.00	6
7	Fraude?	100.00	1	65.00	7
8	Fraude?	100.00	100	99.00	8
9	Fraude?	100.00	100	44.00	9
10	Fraude?	100.00	100	20.90	10
11	Fraude?	100.00	100	12.56	11
12	Fraude?	100.00	100	99.00	12
5	Fraude?	100.00	100	11.00	5
\.


--
-- TOC entry 4320 (class 0 OID 24920)
-- Dependencies: 245
-- Data for Name: polls_crowd; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.polls_crowd (email, name, agent_id, age, sex, duration) FROM stdin;
teste@aaa.com	teste1	1	\N	\N	\N
mirianferreirafr@gmail.com	Mirian	11	23	O	\N
igorcarneiro6661@gmail.com	Igor Carneiro	12	27	M	\N
kathlynsantosleticia@gmail.com	Kathlyn Leticia dos santos	13	22	F	\N
daniel.d.salles@bradesco.com.br	DANIEL DOS SANTOS SALLES	14	23	M	\N
augusto.cesar.lima@gmail.com	Augusto Cesar	15	21	M	\N
buconho@bol.com	bucinho	17	11	O	\N
asdfjkasdk@asdf.com	dff	18	13	M	\N
teste@123.com.it	Alexandre Graeml	19	56	M	\N
testeno@celular.com	graeml	20	56	M	\N
123@4.com	Alexandre R	21	56	M	\N
paulohenriqueveig@gmail.com	Arthur Sales Cavazotti	22	24	O	\N
teste@prod.com	testeProd	23	11	M	29
salles3@me.com	Dorival AFA	24	54	O	737
estafNo@gmail.com	Estefano	25	23	M	99
ggg@gg.com	Gg	26	55	M	52
joao@email.com	Joaozinho	27	26	M	261
nope@no.com	lol	28	99	O	185
add@hotmail.com	Asd asf	30	20	M	179
teste@email.com	Teste	31	140	M	340
j@j.cpm	J	32	20	M	109
lgb25445@dcobe.com	Sergio	33	36	F	232
hackle.bedside_0e@icloud.com	Henrique	34	24	M	196
viniciusfahd@gmail.com	Vinicius Fahd	35	34	M	421
corninho.hotwife@gmail.com	Corno manso	36	23	F	48
edison_msj@hotmail.com	sanja_tratos	37	140	O	59
jorn@gmail.com	Jorj	38	140	O	43
jj@n.com	Jj	39	66	M	202
gamescraqueadosparasteam@gmail.com	Henrique	40	20	M	329
aaaa@gmail.com	Gustavo	41	20	M	368
leonardomoscatelli18@gmail.com	Leonardo de Assis Moscatelli	42	19	M	348
eduardomestreg@gmail.com	Eduardo Mestre	43	20	M	418
\.


--
-- TOC entry 4322 (class 0 OID 24928)
-- Dependencies: 247
-- Data for Name: polls_estimate; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.polls_estimate (id, value, description, agent_id, classification_id) FROM stdin;
1	87.50	\N	1	1
2	0.00	\N	1	2
3	100.00	\N	1	3
4	7.50	\N	1	4
5	70.50	\N	1	5
6	100.00	\N	1	6
7	0.00	\N	1	7
8	0.00	\N	1	8
9	67.00	\N	2	1
10	11.00	\N	2	2
11	0.00	\N	2	3
12	100.00	\N	2	4
13	0.00	\N	2	5
14	0.00	\N	2	6
15	100.00	\N	2	7
16	100.00	\N	2	8
17	50.00		10	1
18	80.60		10	2
19	15.70		10	3
20	91.00		10	4
21	6.70		10	5
22	0.00		10	6
23	100.00		10	7
24	100.00		10	8
25	50.00		11	1
26	80.60		11	2
27	15.70		11	3
28	91.00		11	4
29	6.70		11	5
30	0.00		11	6
31	100.00		11	7
32	100.00		11	8
33	84.90		12	1
34	83.90		12	2
35	15.60		12	3
36	100.00		12	4
37	1.90		12	5
38	15.00		12	6
39	95.50		12	7
40	100.00		12	8
41	27.60	A forma nada formal de falar, pra mim, não me leva a desconfiar que seja frauda, pode ser amigos se falando 	13	1
42	100.00	Essa Url de procedência duvidoso, cadê o s ali do final? 	13	2
43	30.90		13	3
44	94.80		13	4
45	34.80		13	5
46	70.60		13	6
47	69.00		13	7
48	74.60		13	8
49	0.00		14	1
50	100.00		14	2
51	0.00		14	3
52	100.00		14	4
53	0.00		14	5
54	0.00		14	6
55	100.00		14	7
56	99.10		14	8
57	100.00		15	1
58	70.00		15	2
59	100.00		15	3
60	100.00		15	4
61	30.50		15	5
62	24.40		15	6
63	100.00		15	7
64	100.00		15	8
88	50.00		18	8
89	62.60		19	1
90	96.50		19	2
91	82.20		19	3
73	0.00		17	1
74	81.70		17	2
75	0.00		17	3
76	82.50		17	4
77	0.00		17	5
78	6.00		17	6
79	78.60		17	7
80	100.00		17	8
81	50.00		18	1
82	50.00		18	2
83	50.00		18	3
84	50.00		18	4
85	50.00		18	5
86	50.00		18	6
87	50.00		18	7
92	100.00		19	4
93	83.30		19	5
94	50.00		19	6
95	94.80		19	7
96	95.60		19	8
97	5.00		20	1
98	100.00		20	2
99	12.40		20	3
100	97.80		20	4
101	34.20		20	5
102	34.40		20	6
103	86.80		20	7
104	100.00		20	8
105	10.00		21	1
106	90.00		21	2
107	20.00		21	3
108	80.00		21	4
109	80.00		21	5
110	20.00		21	6
111	90.00		21	7
112	80.00		21	8
113	80.00		21	9
114	30.00		22	1
115	100.00		22	2
116	0.00		22	3
117	100.00		22	4
118	30.00		22	5
119	0.00		22	6
120	100.00		22	7
121	90.00		22	8
122	80.00		22	9
123	50.00		23	1
124	50.00		23	2
125	50.00		23	3
126	50.00		23	4
127	50.00		23	5
128	50.00		23	6
129	50.00		23	7
130	50.00		23	8
131	50.00		23	9
132	10.00		24	1
133	100.00		24	2
134	0.00		24	3
135	100.00		24	4
136	0.00		24	5
137	0.00		24	6
138	0.00		24	7
139	100.00		24	8
140	0.00		24	9
141	10.00		25	1
142	100.00		25	2
143	10.00		25	3
144	100.00		25	4
145	0.00		25	5
146	0.00		25	6
147	100.00		25	7
148	100.00		25	8
149	100.00		25	9
150	100.00		26	1
151	100.00		26	2
152	100.00		26	3
153	100.00		26	4
154	100.00		26	5
155	100.00		26	6
156	100.00		26	7
157	100.00		26	8
158	100.00		26	9
159	100.00	E-mail genérico e pedindo ação urgente/imediata 	27	1
160	100.00	E-mail com letras esquisitas  e link esquisito, also HTTP	27	2
161	0.00		27	3
162	50.00	Golpe	27	4
163	0.00		27	5
164	30.00		27	6
165	100.00		27	7
166	100.00		27	8
167	50.00		27	9
168	100.00		28	1
169	100.00		28	2
170	0.00		28	3
171	100.00		28	4
172	0.00		28	5
173	0.00		28	6
174	100.00		28	7
175	100.00		28	8
176	50.00		28	9
177	100.00		29	1
178	100.00		29	2
179	0.00		29	3
180	100.00		29	4
181	0.00		29	5
182	0.00		29	6
183	0.00		29	7
184	100.00		29	8
185	0.00		29	9
186	100.00		30	1
187	100.00		30	2
188	0.00		30	3
189	100.00		30	4
190	0.00		30	5
191	0.00		30	6
192	0.00		30	7
193	100.00		30	8
194	0.00		30	9
195	40.00		31	1
196	80.00		31	2
197	20.00		31	3
198	90.00		31	4
199	20.00		31	5
200	30.00		31	6
201	90.00		31	7
202	100.00		31	8
203	10.00		31	9
204	100.00		32	1
205	100.00		32	2
206	0.00		32	3
207	100.00		32	4
208	0.00		32	5
209	100.00		32	6
210	100.00		32	7
211	50.00		32	8
212	0.00		32	9
213	70.00		33	1
214	100.00		33	2
215	30.00		33	3
216	100.00		33	4
217	40.00		33	5
218	70.00		33	6
219	80.00		33	7
220	90.00		33	8
221	30.00		33	9
222	10.00		34	1
223	100.00		34	2
224	0.00		34	3
225	100.00		34	4
226	0.00		34	5
227	0.00		34	6
228	100.00		34	7
229	100.00		34	8
230	50.00		34	9
231	100.00	John Doe é o Sem Nome na cultura em inglês 	35	1
232	100.00	Ukprankcalls usando host externo	35	2
233	70.00	Falta de pontuação correta, capitalização errada em algumas letras	35	3
234	100.00	Apoio à sensibilidade 	35	4
235	0.00		35	5
236	100.00		35	6
237	100.00	Spam	35	7
238	100.00	Pirataria	35	8
239	0.00		35	9
240	0.00		36	1
241	0.00		36	2
242	0.00		36	3
243	100.00		36	4
244	100.00		36	5
245	0.00		36	6
246	0.00		36	7
247	100.00		36	8
248	0.00		36	9
249	70.00		37	1
250	100.00		37	2
251	0.00		37	3
252	100.00		37	4
253	30.00		37	5
254	50.00		37	6
255	50.00		37	7
256	50.00		37	8
257	50.00		37	9
258	100.00		38	1
259	100.00		38	2
260	100.00		38	3
261	100.00		38	4
262	100.00		38	5
263	100.00		38	6
264	100.00		38	7
265	100.00		38	8
266	100.00		38	9
267	100.00		39	1
268	100.00		39	2
269	100.00		39	3
270	100.00		39	4
271	0.00		39	5
272	100.00		39	6
273	90.00		39	7
274	100.00		39	8
275	30.00		39	9
276	70.00		40	1
277	100.00		40	2
278	0.00		40	3
279	90.00		40	4
280	20.00		40	5
281	20.00		40	6
282	20.00		40	7
283	90.00		40	8
284	20.00		40	9
285	100.00		41	1
286	100.00		41	2
287	0.00		41	3
288	90.00		41	4
289	20.00		41	5
290	20.00		41	6
291	80.00		41	7
292	100.00		41	8
293	40.00		41	9
294	60.00		42	1
295	100.00		42	2
296	70.00		42	3
297	100.00		42	4
298	0.00		42	5
299	100.00		42	6
300	100.00		42	7
301	100.00		42	8
302	30.00		42	9
303	70.00		43	1
304	100.00		43	2
305	0.00		43	3
306	100.00		43	4
307	0.00		43	5
308	0.00		43	6
309	90.00		43	7
310	100.00		43	8
311	0.00		43	9
\.


--
-- TOC entry 4313 (class 0 OID 24893)
-- Dependencies: 238
-- Data for Name: polls_question; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.polls_question (id, question_query, question_text, available) FROM stdin;
2	\N	De: uk.prankcalls@ajskfk2.com\r\nAssunto: Compartilhe com todos! Hilário\r\n\r\nVisite http://ukprankcalls.com para pregar uma peça hilária nos seus amigos!	t
3	\N	De: james.wagner@afu.edu.com\r\nAssunto: Amárico \r\n\r\nestou fazendo um estudo independente sobre o vale do rift na áfrica. amárico é um dialeto falado naquela área, principalmente na Etiópia. \r\nestou tentando afirmar quais seriam certas palavras naquela língua. por exemplo, \r\n  - leão \r\n  - morte\r\n  - bebê\r\n  - água \r\n  - homem \r\n  - mulher \r\n  - família. \r\nqualquer ajuda seria apreciada \r\ned. wagner	t
4	\N	Assunto: Bom Dia\r\nDe: Kristi Olariu\r\n\r\nOlá,\r\nTodo mundo adoraria receber P-P-T-V sem pagar um centavo. E você também! Confira o endereço web abaixo, copie e cole no seu navegador:\r\n\r\ncheck 4 choices. com\r\n\r\nSe você não gosta de receber este tipo de e-mail, por favor, adicione uma barra e a letra 'r' ao endereço acima. E, por favor, aguarde até 10 dias para processar sua solicitação.\r\n\r\nRetornarei em breve.\r\nAtenciosamente,  \r\nKristi Olariu	t
1	\N	De: john.doe@mail.com\r\nAssunto: Portugal \r\n\r\ndesculpe-me mas... alguém aí tem experiência de trabalho no ensino superior em portugal - se tiver, entre em contato. preciso falar com você!!	t
5	\N	Assunto: Agradecimentos\r\nRemetente: j.marron@enron.com\r\n\r\nSally,\r\n\r\nGostaria de agradecer pela oportunidade de organizar o seu Fórum de Operações Globais. Foi um prazer trabalhar com você e Patti, além de conhecer as outras pessoas que mantêm esta organização inovadora. Espero que você se lembre de mim caso precise de ajuda com uma função semelhante no futuro.\r\n\r\nDesejo boa sorte e sucesso contínuo.\r\n\r\nSinceramente,\r\nJulissa Marron	t
6	\N	Encaminhado por: Nev Dull\r\nDe: Gary Bianconi \r\nAssunto: A História da Medicina: 2000 a.C. -- Aqui, coma esta raiz.\r\n\r\n1000 d.C. -- Esta raiz é pagã. Faça esta oração.\r\n1850 d.C. -- Esta oração é superstição. Beba esta poção.\r\n1940 d.C. -- Esta poção é óleo de cobra. Engula esta pílula.\r\n1985 d.C. -- Esta pílula é ineficaz. Tome este antibiótico.\r\n2000 d.C. -- Este antibiótico é artificial. Aqui, coma esta raiz."	t
7	\N	Assunto: Chegou a Hora de Mudar Seu Treino\r\nDe: advvalue@gkhk.xyz\r\n\r\nEi  aí,\r\n\r\nVocê não está vendo resultados com seus treinos? Seus treinos estão ficando entediantes? Está realmente sério(a) em voltar à forma? Se sim, então é hora de fazer uma mudança!\r\n\r\nVisite: http://therein.advantagesandvalue.com/h\r\n\r\nAtenciosamente,	t
8	\N	Assunto: Precisa Baixar Programas?\r\n\r\nDe: Jefferson C. Francine \r\n\r\nEi,\r\n\r\nTodos os tipos de software estão disponíveis para download em nosso site: MS-Linux-XP, McAfee, Symantec, QuickBooks, Delphi, Visual Studio, AutoCAD, Adobe, Macromedia e centenas de outros! É a coisa real!\r\n\r\nVisite nosso site: mkweslfu.com/index.php?id=393\r\n\r\nRetorno mais tarde,\r\nJefferson C. Francine\r\nProjectHoneyPot @ projecthoneypot.org	t
9	\N	COMUNICADO DE IMPRENSA DO INSTITUTO AYN RAND\r\n2121 Alton Parkway, Suite 250\r\nIrvine, CA 92606\r\n24 de julho de 2002\r\nPARA DIVULGAÇÃO IMEDIATA\r\n\r\nA REGULAMENTAÇÃO GOVERNAMENTAL ESTÁ MATANDO O MERCADO DE AÇÕES\r\n\r\nIRVINE, CA — A forte queda no mercado de ações está sendo alimentada pela percepção dos investidores de que o aumento das restrições governamentais sobre as corporações americanas prejudicará os negócios e a economia, em vez de ajudá-los, afirmou Yaron Brook, diretor executivo do Instituto Ayn Rand.\r\n\r\n"Em vez de lançar uma caça às bruxas contra CEOs e apressar-se para dar ao governo mais poderes sobre as empresas, deveríamos eliminar as regulamentações complexas e contraditórias que incentivam a contabilidade ruim e impedem os acionistas de agirem em seu próprio interesse."\r\n\r\n"A explicação comum de que a 'ganância' é a culpada não faz sentido — os abusos em empresas como Enron e WorldCom não foram exercícios de interesse próprio, mas de autodestruição."\r\n\r\n"Em um mercado livre e desimpedido, o desejo de lucro é satisfeito por um comportamento honesto, de longo prazo e racional: inovando, contratando os melhores funcionários, vendendo produtos de qualidade e fornecendo informações precisas aos proprietários da corporação — os acionistas. Quanto aos gerentes de curto prazo, o mercado não os tolerará. Quanto aos verdadeiros trapaceiros, as leis existentes contra a força e a fraude são suficientes para nos proteger."\r\n\r\n"Se nossos políticos estão realmente preocupados com o mercado de ações", disse Dr. Brook, "deixem que demonstrem isso eliminando, em vez de adicionar, regulamentações e tornando o mercado realmente livre."\r\n###\r\n\r\nDr. Yaron Brook, diretor executivo do Instituto Ayn Rand, está disponível para entrevistas sobre este assunto.\r\nContato: Larry Benson\r\nE-mail: larryb@aynrand.org\r\nTelefone: (949) 222-6550, ramal 213	t
10	\N	Assunto: Declaração de CHER sobre sua última turnê\r\nEncaminhado por: Nev Dull\r\nEncaminhado por: newsletter@tvspy.com\r\n\r\n"Me dê um tempo. Eu tenho sido uma diva por 40 anos."\r\n\r\n— CHER, aos fãs em Las Vegas que vaiaram no último fim de semana quando ela disse que a apresentação fazia parte de sua última turnê.	t
11	\N	Assunto: Agradecimento pela Oportunidade de Entrevista\r\nDe: seskan.john@mailage.com\r\n\r\nPrezado(a),\r\n\r\nGostaria de expressar minha sincera gratidão pela oportunidade de participar de uma entrevista com a Enron. Devo dizer que fiquei muito impressionado(a) com o excelente ambiente de trabalho que a Enron proporciona. Estou ansioso(a) para receber boas notícias do grupo de pesquisa.\r\n\r\nSe houver algo mais que eu possa fazer para auxiliar ou acelerar o processo, por favor, não hesite em me enviar um e-mail.\r\n\r\nAtenciosamente,\r\nSeksan	t
12	\N	Assunto: Economize em Medicamentos\r\n\r\nRemetente: p.by.mail@yahoo.com\r\n\r\nOlá,\r\n\r\nVocê quer gastar menos com seus medicamentos? Visite a loja PharmacyByMail e economize mais de 80% em vários produtos como VGR, UMC, LS, entre outros.\r\n\r\nTenha um ótimo dia.\r\n\r\nP.S.: Experimente nossos serviços e você vai adorar nossa loja!\r\n\r\nAtenciosamente,	t
\.


--
-- TOC entry 4326 (class 0 OID 24947)
-- Dependencies: 251
-- Data for Name: polls_questiongroup; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.polls_questiongroup (id, label, slug) FROM stdin;
1	QuizFraude	quizfraude
\.


--
-- TOC entry 4328 (class 0 OID 24955)
-- Dependencies: 253
-- Data for Name: polls_questiongroup_questions; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.polls_questiongroup_questions (id, questiongroup_id, question_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
\.


--
-- TOC entry 4330 (class 0 OID 24961)
-- Dependencies: 255
-- Data for Name: polls_vote; Type: TABLE DATA; Schema: public; Owner: martotoAdmin
--

COPY public.polls_vote (id, description, agent_id, choice_id) FROM stdin;
\.


--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 256
-- Name: agents_agentclient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.agents_agentclient_id_seq', 1, false);


--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 258
-- Name: agents_clientsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.agents_clientsettings_id_seq', 1, false);


--
-- TOC entry 4420 (class 0 OID 0)
-- Dependencies: 223
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 4421 (class 0 OID 0)
-- Dependencies: 225
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 4422 (class 0 OID 0)
-- Dependencies: 221
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- TOC entry 4423 (class 0 OID 0)
-- Dependencies: 229
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 4424 (class 0 OID 0)
-- Dependencies: 227
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- TOC entry 4425 (class 0 OID 0)
-- Dependencies: 231
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 4426 (class 0 OID 0)
-- Dependencies: 233
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 34, true);


--
-- TOC entry 4427 (class 0 OID 0)
-- Dependencies: 219
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- TOC entry 4428 (class 0 OID 0)
-- Dependencies: 217
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 45, true);


--
-- TOC entry 4429 (class 0 OID 0)
-- Dependencies: 239
-- Name: polls_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.polls_agent_id_seq', 43, true);


--
-- TOC entry 4430 (class 0 OID 0)
-- Dependencies: 241
-- Name: polls_agentpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.polls_agentpost_id_seq', 1, false);


--
-- TOC entry 4431 (class 0 OID 0)
-- Dependencies: 243
-- Name: polls_agentpost_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.polls_agentpost_likes_id_seq', 1, false);


--
-- TOC entry 4432 (class 0 OID 0)
-- Dependencies: 248
-- Name: polls_choice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.polls_choice_id_seq', 1, false);


--
-- TOC entry 4433 (class 0 OID 0)
-- Dependencies: 235
-- Name: polls_classification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.polls_classification_id_seq', 12, true);


--
-- TOC entry 4434 (class 0 OID 0)
-- Dependencies: 246
-- Name: polls_estimate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.polls_estimate_id_seq', 311, true);


--
-- TOC entry 4435 (class 0 OID 0)
-- Dependencies: 237
-- Name: polls_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.polls_question_id_seq', 12, true);


--
-- TOC entry 4436 (class 0 OID 0)
-- Dependencies: 250
-- Name: polls_questiongroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.polls_questiongroup_id_seq', 1, true);


--
-- TOC entry 4437 (class 0 OID 0)
-- Dependencies: 252
-- Name: polls_questiongroup_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.polls_questiongroup_questions_id_seq', 9, true);


--
-- TOC entry 4438 (class 0 OID 0)
-- Dependencies: 254
-- Name: polls_vote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: martotoAdmin
--

SELECT pg_catalog.setval('public.polls_vote_id_seq', 1, false);


--
-- TOC entry 4112 (class 2606 OID 25055)
-- Name: agents_agentclient agents_agentclient_agent_id_key; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.agents_agentclient
    ADD CONSTRAINT agents_agentclient_agent_id_key UNIQUE (agent_id);


--
-- TOC entry 4114 (class 2606 OID 25051)
-- Name: agents_agentclient agents_agentclient_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.agents_agentclient
    ADD CONSTRAINT agents_agentclient_pkey PRIMARY KEY (id);


--
-- TOC entry 4117 (class 2606 OID 25053)
-- Name: agents_agentclient agents_agentclient_slug_key; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.agents_agentclient
    ADD CONSTRAINT agents_agentclient_slug_key UNIQUE (slug);


--
-- TOC entry 4120 (class 2606 OID 25063)
-- Name: agents_clientsettings agents_clientsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.agents_clientsettings
    ADD CONSTRAINT agents_clientsettings_pkey PRIMARY KEY (id);


--
-- TOC entry 4037 (class 2606 OID 25082)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 4042 (class 2606 OID 24823)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 4045 (class 2606 OID 24792)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4039 (class 2606 OID 24784)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 4032 (class 2606 OID 24814)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 4034 (class 2606 OID 24778)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 4053 (class 2606 OID 24806)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4056 (class 2606 OID 24838)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 4047 (class 2606 OID 24798)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 4059 (class 2606 OID 24812)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4062 (class 2606 OID 24852)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 4050 (class 2606 OID 25077)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 4065 (class 2606 OID 24873)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 4027 (class 2606 OID 24772)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 4029 (class 2606 OID 24770)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4025 (class 2606 OID 24764)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4123 (class 2606 OID 25090)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 4073 (class 2606 OID 24905)
-- Name: polls_agent polls_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_agent
    ADD CONSTRAINT polls_agent_pkey PRIMARY KEY (id);


--
-- TOC entry 4081 (class 2606 OID 24981)
-- Name: polls_agentpost_likes polls_agentpost_likes_agentpost_id_agent_id_4ecfdf14_uniq; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_agentpost_likes
    ADD CONSTRAINT polls_agentpost_likes_agentpost_id_agent_id_4ecfdf14_uniq UNIQUE (agentpost_id, agent_id);


--
-- TOC entry 4083 (class 2606 OID 24919)
-- Name: polls_agentpost_likes polls_agentpost_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_agentpost_likes
    ADD CONSTRAINT polls_agentpost_likes_pkey PRIMARY KEY (id);


--
-- TOC entry 4077 (class 2606 OID 24913)
-- Name: polls_agentpost polls_agentpost_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_agentpost
    ADD CONSTRAINT polls_agentpost_pkey PRIMARY KEY (id);


--
-- TOC entry 4094 (class 2606 OID 24945)
-- Name: polls_choice polls_choice_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_choice
    ADD CONSTRAINT polls_choice_pkey PRIMARY KEY (id);


--
-- TOC entry 4068 (class 2606 OID 24891)
-- Name: polls_classification polls_classification_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_classification
    ADD CONSTRAINT polls_classification_pkey PRIMARY KEY (id);


--
-- TOC entry 4085 (class 2606 OID 24926)
-- Name: polls_crowd polls_crowd_agent_id_key; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_crowd
    ADD CONSTRAINT polls_crowd_agent_id_key UNIQUE (agent_id);


--
-- TOC entry 4088 (class 2606 OID 24924)
-- Name: polls_crowd polls_crowd_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_crowd
    ADD CONSTRAINT polls_crowd_pkey PRIMARY KEY (email);


--
-- TOC entry 4092 (class 2606 OID 24934)
-- Name: polls_estimate polls_estimate_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_estimate
    ADD CONSTRAINT polls_estimate_pkey PRIMARY KEY (id);


--
-- TOC entry 4071 (class 2606 OID 24899)
-- Name: polls_question polls_question_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_question
    ADD CONSTRAINT polls_question_pkey PRIMARY KEY (id);


--
-- TOC entry 4097 (class 2606 OID 24951)
-- Name: polls_questiongroup polls_questiongroup_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_questiongroup
    ADD CONSTRAINT polls_questiongroup_pkey PRIMARY KEY (id);


--
-- TOC entry 4102 (class 2606 OID 25021)
-- Name: polls_questiongroup_questions polls_questiongroup_ques_questiongroup_id_questio_fb05b7c2_uniq; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_questiongroup_questions
    ADD CONSTRAINT polls_questiongroup_ques_questiongroup_id_questio_fb05b7c2_uniq UNIQUE (questiongroup_id, question_id);


--
-- TOC entry 4104 (class 2606 OID 24959)
-- Name: polls_questiongroup_questions polls_questiongroup_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_questiongroup_questions
    ADD CONSTRAINT polls_questiongroup_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 4100 (class 2606 OID 24953)
-- Name: polls_questiongroup polls_questiongroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_questiongroup
    ADD CONSTRAINT polls_questiongroup_slug_key UNIQUE (slug);


--
-- TOC entry 4110 (class 2606 OID 24967)
-- Name: polls_vote polls_vote_pkey; Type: CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_vote
    ADD CONSTRAINT polls_vote_pkey PRIMARY KEY (id);


--
-- TOC entry 4115 (class 1259 OID 25069)
-- Name: agents_agentclient_slug_7f59d5df_like; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX agents_agentclient_slug_7f59d5df_like ON public.agents_agentclient USING btree (slug varchar_pattern_ops);


--
-- TOC entry 4118 (class 1259 OID 25075)
-- Name: agents_clientsettings_client_id_4fbd46f0; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX agents_clientsettings_client_id_4fbd46f0 ON public.agents_clientsettings USING btree (client_id);


--
-- TOC entry 4035 (class 1259 OID 25083)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 4040 (class 1259 OID 24834)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 4043 (class 1259 OID 24835)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 4030 (class 1259 OID 24820)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 4051 (class 1259 OID 24850)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 4054 (class 1259 OID 24849)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 4057 (class 1259 OID 24864)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 4060 (class 1259 OID 24863)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 4048 (class 1259 OID 25078)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 4063 (class 1259 OID 24884)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 4066 (class 1259 OID 24885)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 4121 (class 1259 OID 25092)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 4124 (class 1259 OID 25091)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 4074 (class 1259 OID 24973)
-- Name: polls_agent_user_id_7d436ef0; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX polls_agent_user_id_7d436ef0 ON public.polls_agent USING btree (user_id);


--
-- TOC entry 4078 (class 1259 OID 24993)
-- Name: polls_agentpost_likes_agent_id_705b2b99; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX polls_agentpost_likes_agent_id_705b2b99 ON public.polls_agentpost_likes USING btree (agent_id);


--
-- TOC entry 4079 (class 1259 OID 24992)
-- Name: polls_agentpost_likes_agentpost_id_51485ada; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX polls_agentpost_likes_agentpost_id_51485ada ON public.polls_agentpost_likes USING btree (agentpost_id);


--
-- TOC entry 4075 (class 1259 OID 24979)
-- Name: polls_agentpost_owner_id_4aa323f6; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX polls_agentpost_owner_id_4aa323f6 ON public.polls_agentpost USING btree (owner_id);


--
-- TOC entry 4095 (class 1259 OID 25018)
-- Name: polls_choice_question_id_c5b4b260; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX polls_choice_question_id_c5b4b260 ON public.polls_choice USING btree (question_id);


--
-- TOC entry 4069 (class 1259 OID 25012)
-- Name: polls_classification_question_id_11298135; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX polls_classification_question_id_11298135 ON public.polls_classification USING btree (question_id);


--
-- TOC entry 4086 (class 1259 OID 24999)
-- Name: polls_crowd_email_475202ee_like; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX polls_crowd_email_475202ee_like ON public.polls_crowd USING btree (email varchar_pattern_ops);


--
-- TOC entry 4089 (class 1259 OID 25010)
-- Name: polls_estimate_agent_id_222d8e70; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX polls_estimate_agent_id_222d8e70 ON public.polls_estimate USING btree (agent_id);


--
-- TOC entry 4090 (class 1259 OID 25011)
-- Name: polls_estimate_classification_id_0c1ac335; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX polls_estimate_classification_id_0c1ac335 ON public.polls_estimate USING btree (classification_id);


--
-- TOC entry 4105 (class 1259 OID 25033)
-- Name: polls_questiongroup_questions_question_id_865414e3; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX polls_questiongroup_questions_question_id_865414e3 ON public.polls_questiongroup_questions USING btree (question_id);


--
-- TOC entry 4106 (class 1259 OID 25032)
-- Name: polls_questiongroup_questions_questiongroup_id_1373e4f4; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX polls_questiongroup_questions_questiongroup_id_1373e4f4 ON public.polls_questiongroup_questions USING btree (questiongroup_id);


--
-- TOC entry 4098 (class 1259 OID 25019)
-- Name: polls_questiongroup_slug_b6340358_like; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX polls_questiongroup_slug_b6340358_like ON public.polls_questiongroup USING btree (slug varchar_pattern_ops);


--
-- TOC entry 4107 (class 1259 OID 25044)
-- Name: polls_vote_agent_id_0d4d1e59; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX polls_vote_agent_id_0d4d1e59 ON public.polls_vote USING btree (agent_id);


--
-- TOC entry 4108 (class 1259 OID 25045)
-- Name: polls_vote_choice_id_17e8b17c; Type: INDEX; Schema: public; Owner: martotoAdmin
--

CREATE INDEX polls_vote_choice_id_17e8b17c ON public.polls_vote USING btree (choice_id);


--
-- TOC entry 4147 (class 2606 OID 25064)
-- Name: agents_agentclient agents_agentclient_agent_id_74af2223_fk_polls_agent_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.agents_agentclient
    ADD CONSTRAINT agents_agentclient_agent_id_74af2223_fk_polls_agent_id FOREIGN KEY (agent_id) REFERENCES public.polls_agent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4148 (class 2606 OID 25070)
-- Name: agents_clientsettings agents_clientsetting_client_id_4fbd46f0_fk_agents_ag; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.agents_clientsettings
    ADD CONSTRAINT agents_clientsetting_client_id_4fbd46f0_fk_agents_ag FOREIGN KEY (client_id) REFERENCES public.agents_agentclient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4126 (class 2606 OID 24829)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4127 (class 2606 OID 24824)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4125 (class 2606 OID 24815)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4128 (class 2606 OID 24844)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4129 (class 2606 OID 24839)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4130 (class 2606 OID 24858)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4131 (class 2606 OID 24853)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4132 (class 2606 OID 24874)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4133 (class 2606 OID 24879)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4135 (class 2606 OID 24968)
-- Name: polls_agent polls_agent_user_id_7d436ef0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_agent
    ADD CONSTRAINT polls_agent_user_id_7d436ef0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4137 (class 2606 OID 24982)
-- Name: polls_agentpost_likes polls_agentpost_like_agentpost_id_51485ada_fk_polls_age; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_agentpost_likes
    ADD CONSTRAINT polls_agentpost_like_agentpost_id_51485ada_fk_polls_age FOREIGN KEY (agentpost_id) REFERENCES public.polls_agentpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4138 (class 2606 OID 24987)
-- Name: polls_agentpost_likes polls_agentpost_likes_agent_id_705b2b99_fk_polls_agent_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_agentpost_likes
    ADD CONSTRAINT polls_agentpost_likes_agent_id_705b2b99_fk_polls_agent_id FOREIGN KEY (agent_id) REFERENCES public.polls_agent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4136 (class 2606 OID 24974)
-- Name: polls_agentpost polls_agentpost_owner_id_4aa323f6_fk_polls_agent_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_agentpost
    ADD CONSTRAINT polls_agentpost_owner_id_4aa323f6_fk_polls_agent_id FOREIGN KEY (owner_id) REFERENCES public.polls_agent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4142 (class 2606 OID 25013)
-- Name: polls_choice polls_choice_question_id_c5b4b260_fk_polls_question_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_choice
    ADD CONSTRAINT polls_choice_question_id_c5b4b260_fk_polls_question_id FOREIGN KEY (question_id) REFERENCES public.polls_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4134 (class 2606 OID 24935)
-- Name: polls_classification polls_classification_question_id_11298135_fk_polls_question_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_classification
    ADD CONSTRAINT polls_classification_question_id_11298135_fk_polls_question_id FOREIGN KEY (question_id) REFERENCES public.polls_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4139 (class 2606 OID 24994)
-- Name: polls_crowd polls_crowd_agent_id_c5bb9ddd_fk_polls_agent_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_crowd
    ADD CONSTRAINT polls_crowd_agent_id_c5bb9ddd_fk_polls_agent_id FOREIGN KEY (agent_id) REFERENCES public.polls_agent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4140 (class 2606 OID 25000)
-- Name: polls_estimate polls_estimate_agent_id_222d8e70_fk_polls_agent_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_estimate
    ADD CONSTRAINT polls_estimate_agent_id_222d8e70_fk_polls_agent_id FOREIGN KEY (agent_id) REFERENCES public.polls_agent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4141 (class 2606 OID 25005)
-- Name: polls_estimate polls_estimate_classification_id_0c1ac335_fk_polls_cla; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_estimate
    ADD CONSTRAINT polls_estimate_classification_id_0c1ac335_fk_polls_cla FOREIGN KEY (classification_id) REFERENCES public.polls_classification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4143 (class 2606 OID 25027)
-- Name: polls_questiongroup_questions polls_questiongroup__question_id_865414e3_fk_polls_que; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_questiongroup_questions
    ADD CONSTRAINT polls_questiongroup__question_id_865414e3_fk_polls_que FOREIGN KEY (question_id) REFERENCES public.polls_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4144 (class 2606 OID 25022)
-- Name: polls_questiongroup_questions polls_questiongroup__questiongroup_id_1373e4f4_fk_polls_que; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_questiongroup_questions
    ADD CONSTRAINT polls_questiongroup__questiongroup_id_1373e4f4_fk_polls_que FOREIGN KEY (questiongroup_id) REFERENCES public.polls_questiongroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4145 (class 2606 OID 25034)
-- Name: polls_vote polls_vote_agent_id_0d4d1e59_fk_polls_agent_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_vote
    ADD CONSTRAINT polls_vote_agent_id_0d4d1e59_fk_polls_agent_id FOREIGN KEY (agent_id) REFERENCES public.polls_agent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4146 (class 2606 OID 25039)
-- Name: polls_vote polls_vote_choice_id_17e8b17c_fk_polls_choice_id; Type: FK CONSTRAINT; Schema: public; Owner: martotoAdmin
--

ALTER TABLE ONLY public.polls_vote
    ADD CONSTRAINT polls_vote_choice_id_17e8b17c_fk_polls_choice_id FOREIGN KEY (choice_id) REFERENCES public.polls_choice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4343 (class 0 OID 0)
-- Dependencies: 261
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO azure_pg_admin;


--
-- TOC entry 4344 (class 0 OID 0)
-- Dependencies: 274
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO azure_pg_admin;


--
-- TOC entry 4345 (class 0 OID 0)
-- Dependencies: 266
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO azure_pg_admin;


--
-- TOC entry 4346 (class 0 OID 0)
-- Dependencies: 267
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO azure_pg_admin;


--
-- TOC entry 4347 (class 0 OID 0)
-- Dependencies: 268
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO azure_pg_admin;


--
-- TOC entry 4348 (class 0 OID 0)
-- Dependencies: 269
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO azure_pg_admin;


--
-- TOC entry 4349 (class 0 OID 0)
-- Dependencies: 270
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO azure_pg_admin;


--
-- TOC entry 4350 (class 0 OID 0)
-- Dependencies: 275
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO azure_pg_admin;


--
-- TOC entry 4351 (class 0 OID 0)
-- Dependencies: 271
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO azure_pg_admin;


--
-- TOC entry 4352 (class 0 OID 0)
-- Dependencies: 272
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO azure_pg_admin;


--
-- TOC entry 4353 (class 0 OID 0)
-- Dependencies: 273
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO azure_pg_admin;


--
-- TOC entry 4354 (class 0 OID 0)
-- Dependencies: 276
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO azure_pg_admin;


--
-- TOC entry 4355 (class 0 OID 0)
-- Dependencies: 262
-- Name: FUNCTION pg_stat_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset() TO azure_pg_admin;


--
-- TOC entry 4356 (class 0 OID 0)
-- Dependencies: 263
-- Name: FUNCTION pg_stat_reset_shared(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_shared(text) TO azure_pg_admin;


--
-- TOC entry 4357 (class 0 OID 0)
-- Dependencies: 265
-- Name: FUNCTION pg_stat_reset_single_function_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_function_counters(oid) TO azure_pg_admin;


--
-- TOC entry 4358 (class 0 OID 0)
-- Dependencies: 264
-- Name: FUNCTION pg_stat_reset_single_table_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_table_counters(oid) TO azure_pg_admin;


--
-- TOC entry 4359 (class 0 OID 0)
-- Dependencies: 100
-- Name: COLUMN pg_config.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- TOC entry 4360 (class 0 OID 0)
-- Dependencies: 100
-- Name: COLUMN pg_config.setting; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(setting) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- TOC entry 4361 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.line_number; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(line_number) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4362 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.type; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(type) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4363 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.database; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(database) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4364 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.user_name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(user_name) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4365 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.address; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(address) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4366 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.netmask; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(netmask) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4367 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.auth_method; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(auth_method) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4368 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.options; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(options) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4369 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.error; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(error) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4370 (class 0 OID 0)
-- Dependencies: 146
-- Name: COLUMN pg_replication_origin_status.local_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4371 (class 0 OID 0)
-- Dependencies: 146
-- Name: COLUMN pg_replication_origin_status.external_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(external_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4372 (class 0 OID 0)
-- Dependencies: 146
-- Name: COLUMN pg_replication_origin_status.remote_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(remote_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4373 (class 0 OID 0)
-- Dependencies: 146
-- Name: COLUMN pg_replication_origin_status.local_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4374 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_shmem_allocations.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4375 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_shmem_allocations.off; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(off) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4376 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_shmem_allocations.size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4377 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_shmem_allocations.allocated_size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(allocated_size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4378 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.starelid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(starelid) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4379 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.staattnum; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staattnum) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4380 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stainherit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stainherit) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4381 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stanullfrac; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanullfrac) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4382 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stawidth; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stawidth) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4383 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stadistinct; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stadistinct) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4384 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stakind1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4385 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stakind2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4386 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stakind3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4387 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stakind4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4388 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stakind5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4389 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.staop1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4390 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.staop2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4391 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.staop3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4392 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.staop4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4393 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.staop5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4394 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stacoll1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4395 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stacoll2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4396 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stacoll3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4397 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stacoll4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4398 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stacoll5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4399 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stanumbers1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4400 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stanumbers2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4401 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stanumbers3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4402 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stanumbers4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4403 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stanumbers5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4404 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stavalues1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4405 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stavalues2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4406 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stavalues3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4407 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stavalues4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4408 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stavalues5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4409 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.oid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(oid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4410 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subdbid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subdbid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4411 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4412 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subowner; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subowner) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4413 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subenabled; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subenabled) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4414 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subconninfo; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subconninfo) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4415 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subslotname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subslotname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subsynccommit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subsynccommit) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subpublications; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subpublications) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


-- Completed on 2024-11-12 20:21:06

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-11-12 20:21:06

--
-- PostgreSQL database cluster dump complete
--

