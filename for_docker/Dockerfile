FROM rocker/r-ver:latest
RUN apt-get update -qq && apt-get install -y libssl-dev libcurl4-gnutls-dev libpng-dev libpng-dev pandoc
RUN R -e "install.packages(c('tidymodels', 'plumber'))"
COPY api.R api.R
COPY ../docs/clean_data.RData ../docs/clean_data.RData
COPY ../docs/tree_final.RData ../docs/tree_final.RData
EXPOSE 8000
ENTRYPOINT ["R", "-e", \
"pr <- plumber::plumb('api.R'); pr$run(host = '0.0.0.0', port=8000)"]
