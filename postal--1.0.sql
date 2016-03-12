-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION postal" to load this file. \quit

CREATE OR REPLACE FUNCTION postal_normalize(address text)
    RETURNS text[]
    AS 'MODULE_PATHNAME', 'postal_normalize'
    LANGUAGE 'c'
    IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION postal_parse(address text)
    RETURNS jsonb
    AS 'MODULE_PATHNAME', 'postal_parse'
    LANGUAGE 'c'
    IMMUTABLE STRICT;
