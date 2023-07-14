#!/bin/bash
while true
do
wget --quiet --no-check-certificate https://bibica.net/sitemap-post-type-post.xml --output-document - | egrep -o "https?://[^<]+" | wget -i - --no-check-certificate -O/dev/null && wget --quiet --no-check-certificate https://bibica.net/sitemap-post-type-page.xml --output-document - | egrep -o "https?://[^<]+" | wget -i - --no-check-certificate -O/dev/null && wget --quiet --no-check-certificate https://bibica.net/sitemap-taxonomy-category.xml --output-document - | egrep -o "https?://[^<]+" | wget -i - --no-check-certificate -O/dev/null && wget --quiet --no-check-certificate https://bibica.net/sitemap-taxonomy-post_tag.xml --output-document - | egrep -o "https?://[^<]+" | wget -i - --no-check-certificate -O/dev/null
sleep 1
done
