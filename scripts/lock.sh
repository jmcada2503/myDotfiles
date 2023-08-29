#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#b5b5b5'
TEXT='#ffffffff'
WRONG='#ff9999'
WRONG_INSIDE='#ffc2c2'
VERIFYING='#b5b5b5'
DARK='#383838'

i3lock \
--insidever-color=$BLANK     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$BLANK   \
--ringwrong-color=$DARK     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$BLANK          \
--wrong-color=$BLANK          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$DARK          \
--bshl-color=$WRONG          \
\
--screen 1                   \
--blur 5                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
