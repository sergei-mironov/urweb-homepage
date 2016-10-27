#!/bin/sh

echo -n "Enter password: "
read P

SWAKS=`which swaks` PASS=$P PING=`which ping` ./HomePage.exe
