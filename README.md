# PostgreSQL  Postal Address Normalizer

## Motivation

[Libpostal](https://github.com/openvenues/libpostal) is a C library for parsing/normalizing street addresses around the world. Having that functionality directly in PostgreSQL could potentially be useful.

This extension is for that.


## Usage Notes

* [libpostal](https://github.com/openvenues/libpostal) takes quite a lot of memory when intialized, and has a noticeable start-up time. When you first run `postal_normalize` or `postal_parse` there will be a delay while the library data first loads. 
* Backends with `libpostal` active will be quite large in terms of memory usage (about 1Gb on my computer) so you probably want to take care about spawning too many of them at once.


## Examples

    =# SELECT unnest(postal_normalize('412 first ave, victoria, bc'));
    
                      unnest                  
    ------------------------------------------
     412 1st avenue victoria british columbia
     412 1st avenue victoria bc
    (2 rows)


    =# SELECT postal_parse('412 first ave, victoria, bc');
    
                                      postal_parse                                   
    ---------------------------------------------------------------------------------
     {"city": "victoria", "road": "first ave", "state": "bc", "house_number": "412"}
    (1 row)


## Functions

* `postal_normalize(address TEXT)` returns `TEXT[]`
* `postal_parse(address TEXT)` returns `JSONB`


## Installation

### UNIX

If you have PostgreSQL devel packages and CURL devel packages installed, you should have `pg_config` on your path. Confirm by running `which pg_config`.

Edit the paths to `POSTAL_INCLUDE` and `POSTAL_LIBS` in the `Makefile` to refer to your `libpostal` install location, and then run:

    make
    make install

Then in your database `CREATE EXTENSION postal`.

### Windows

Sorry, no story here yet.


## To Do

- Perhaps allow normalization options other than the defaults.

