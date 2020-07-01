FROM rocker/shiny:3.6.3

LABEL   org.label-schema.vendor="Food and Agriculture Organization of the United Nations" \
        maintainer="Alfredo Irarrazaval <alfredo.irarrazaval@fao.org>"

# Add CALIPSEO packages and dependencies
RUN apt-get update -qq && \
    apt-get -y --no-install-recommends install \
        build-essential \
        libxml2-dev \
        libssl-dev \
        libssh2-1-dev \
        git \
        libgit2-dev \
        libudunits2-dev \
        libpq-dev && \
    R -e "install.packages('DT')" && \
    R -e "install.packages('ggplot2')" && \
    R -e "install.packages('RPostgreSQL')" && \
    R -e "install.packages('pool')" && \
    R -e "install.packages('DBI')" && \
    R -e "install.packages('shinydashboard')" && \
    R -e "install.packages('plotly')" && \
    R -e "install.packages('readxl')" && \
    R -e "install.packages('sp')" && \
    R -e "install.packages('leaflet')" && \
    R -e "install.packages('leaflet.minicharts')" && \
    R -e "install.packages('RColorBrewer')" && \
    rm -rf /tmp/downloaded_packages && \
    apt-get clean

EXPOSE 3838

CMD ["/usr/bin/shiny-server.sh"]
