# 
FROM rocker/verse:4.2.0

COPY init.R setup.R 
RUN Rscript setup.R


