docker run --rm -p 8789:8787 -e PASSWORD=foo -e ROOT=true -v $(dirname $(pwd)):/home/rstudio/rsdwr rsdwr:latest
