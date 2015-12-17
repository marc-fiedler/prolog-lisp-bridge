#!/bin/bash

gcc swilisp.c -I/usr/lib/swi-prolog/include/ -fpic -c
gcc -shared -o swilisp.so swilisp.o
gcc -o swilisp swilisp.o -lswipl

swig2.0 -cffi -module swilisp swilisp.c
