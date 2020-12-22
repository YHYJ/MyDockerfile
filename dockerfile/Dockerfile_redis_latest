# Version: 0.1

ARG base_image_name
ARG base_image_tag
FROM ${base_image_name}:${base_image_tag}
ENV TZ Asia/Shanghai
CMD redis-server --appendonly yes --stop-writes-on-bgsave-error no --maxmemory 1073741824 --maxmemory-policy volatile-ttl --maxmemory-samples 5 --slowlog-log-slower-than 10000 --databases 16
