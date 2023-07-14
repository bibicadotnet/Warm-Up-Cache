#!/bin/bash
while true
do
 docker run --rm -it eliashaeussler/cache-warmup:latest https://bibica.net/sitemap.xml --verbose --crawler-options '{"concurrency": 1}'
 docker run jradik/async-cache-warmer -s "https://bibica.net/sitemap.xml" -s "https://bibica.net/sitemap-post-type-post.xml" -s "https://bibica.net/sitemap-post-type-page.xml" -s "https://bibica.net/sitemap-taxonomy-category.xml" -l1
 sleep 1
done
