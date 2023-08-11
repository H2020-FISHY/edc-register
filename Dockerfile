FROM basex/basexhttp:9.5.2
WORKDIR $HOME/
# COPY ./basex/data/ ./basex/data 
# COPY ./basex/repo/ ./basex/repo
COPY ./query/ /srv/basex/webapp
COPY ./db_files/ /srv/basex/db_files
EXPOSE 8984
CMD ["basexhttp"]
