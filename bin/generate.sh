#!/bin/bash
current_path=$(readlink -f $(dirname $BASH_SOURCE)/../../../../)
. ./.env

# User Setting
REVEALJS_VERSION=3.9.2

output_file=$(echo $1 | sed "s#src/doc##" | sed "s#\.adoc#.html#")

# Generate asciidoctor file.
bundle exec asciidoctor --safe-mode unsafe \
    -r asciidoctor-diagram \
    -a stylesheet=/var/www/docker/asciidoctor-skins/css/$theme.css \
    -a lang=ja -b html5 -d book  $1 -o doc/$output_file
# Generate revealjs file.
bundle exec asciidoctor-revealjs  -a revealjsdir=https://cdn.jsdelivr.net/npm/reveal.js@$REVEALJS_VERSION -o doc/revealjs/$output_file $1