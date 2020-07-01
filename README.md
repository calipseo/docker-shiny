# Docker for Shiny Server

This is a Dockerfile for the [R Shiny Server](https://rstudio.com/products/shiny/shiny-server/).  The following image contains some additional R packages not present in the stock [rocker/shiny](https://hub.docker.com/r/rocker/shiny) Docker image.

## Usage

To run a temporary container with the Shiny Server:

```sh
docker run -p 3838:3838
```

## Default Application

This image comes with the default example Shiny Application which is located in `/srv/shiny-server`.  In order to use your own Shiny Application, you may expose a volume containing your application to the container. Then you can run the app by visiting <http://localhost:3838/myapp>.

```sh
docker run -p 3838:3838 \
  -v /path/to/my/app:/srv/shiny-server/myapp
```

You may also expose your own `shiny-server.conf` file to change the default Shiny Server configurarion (`/etc/shiny-server/shiny-server.conf`).

In the following example, the `site_dir` is pointing to `/srv/shiny-server/myapp`.  This way you can run your application by directly visiting <http://localhost:3838>.

> shiny-server.conf

```conf
# Instruct Shiny Server to run applications as the user "shiny"
run_as shiny;

# Define a server that listens on port 3838
server {
  listen 3838;

  # Define a location at the base URL
  location / {

    # Host the directory of Shiny Apps stored in this directory
    site_dir /srv/shiny-server/myapp;

    # Log all Shiny output to files in this directory
    log_dir /var/log/shiny-server;

    # When a user visits the base URL rather than a particular application,
    # an index of the applications available in this directory will be shown.
    directory_index on;
  }
}
```

Then you may run your docker container using the following command:

```sh
docker run -p 3838:3838 \
  -v /path/to/my/app:/srv/shiny-server/myapp
  -v /path/to/shiny-server.conf:/etc/shiny-server/shiny-server.conf:ro
```

## R Packages

The following is a list of additional R packages included in the Docker image:

| Package | Description |
|---------|-------------|
| [DT](https://cran.r-project.org/web/packages/DT/index.html) | A Wrapper of the JavaScript Library 'DataTables' |
| [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html) | Create Elegant Data Visualisations Using the Grammar of Graphics |
| [RPosgreSQL](https://cran.r-project.org/web/packages/RPostgreSQL/index.html) |  R Interface to the 'PostgreSQL' Database System |
| [pool](https://cran.r-project.org/web/packages/pool/index.html) | Object Pooling |
| [DBI](https://cran.r-project.org/web/packages/DBI/index.html) | R Database Interface |
| [shinydashboard](https://cran.r-project.org/web/packages/shinydashboard/index.html) | Create Dashboards with 'Shiny' |
| [plotly](https://cran.r-project.org/web/packages/plotly/index.html) | Create Interactive Web Graphics via 'plotly.js' |
| [readxl](https://cran.r-project.org/web/packages/readxl/index.html) | Read Excel Files |
| [sp](https://cran.r-project.org/web/packages/sp/index.html) | Classes and Methods for Spatial Data |
| [leaflet](https://cran.r-project.org/web/packages/leaflet/index.html) | Create Interactive Web Maps with the JavaScript 'Leaflet' Library |
| [leaflet.minicharts](https://cran.r-project.org/web/packages/leaflet.minicharts/index.html) | Mini Charts for Interactive Maps |
| [RColorBrewer](https://cran.r-project.org/web/packages/RColorBrewer/index.html) | ColorBrewer Palettes |
