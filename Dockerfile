FROM debian:sid

ENV PGHOST           "database"
ENV PGPORT           "5432"
ENV PGUSER           "georchestra"
ENV PGDATABASE       "vrt"
ENV PGCLIENTENCODING "utf8"
ENV PGPASSWORD       "georchestra"
ENV ACTIVESCHEMA     "public"
ENV SOURCEDIR        "/home/app/vrts"

VOLUME /home/app/vrts

RUN useradd -u 999 app && mkdir -p /home/app && chown -R app:app /home/app

COPY --chown=app:app vrt.sh /home/app/vrt.sh
COPY --chown=app:app vrts /home/app/vrts

RUN apt update && apt install -y gdal-bin gettext && apt clean && \
    rm -rf /var/lib/apt/lists/*

USER app
WORKDIR /home/app

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "/home/app/vrt.sh" ]

# OCI image labels (https://github.com/opencontainers/image-spec/blob/main/annotations.md)
LABEL org.opencontainers.image.title="vrt-bot"
LABEL org.opencontainers.image.description="geOrchestra VRT bot"
LABEL org.opencontainers.image.source="https://github.com/georchestra/vrt-bot"
LABEL org.opencontainers.image.url="https://github.com/georchestra/vrt-bot"
LABEL org.opencontainers.image.documentation="https://docs.georchestra.org/"
LABEL org.opencontainers.image.vendor="geOrchestra"
LABEL org.opencontainers.image.licenses="GPL-3.0-or-later"
