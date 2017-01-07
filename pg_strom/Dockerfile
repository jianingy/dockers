FROM nvidia/cuda
COPY sources.list /etc/apt/
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update 
RUN apt install ubuntu-gnome-desktop -y
RUN apt install nvidia-367 -y
RUN apt install libreadline-dev zlib1g-dev bison flex -y
RUN apt install git -y
RUN mkdir -p /usr/src
WORKDIR /usr/src/
RUN wget https://ftp.postgresql.org/pub/source/v9.5.5/postgresql-9.5.5.tar.bz2
RUN tar jxvf postgresql-9.5.5.tar.bz2
WORKDIR /usr/src/postgresql-9.5.5
RUN ./configure --prefix=/usr/local/postgresql
RUN make
RUN make install
ENV PATH=/usr/local/postgresql/bin:$PATH
WORKDIR /usr/src/
RUN git clone https://github.com/pg-strom/devel.git pg_strom
WORKDIR /usr/src/pg_strom
RUN make
RUN make install
WORKDIR / 
RUN useradd postgres
EXPOSE 5432
COPY postgresql.conf /etc/postgresql.conf.sample
COPY pg_hba.conf /etc/pg_hba.conf.sample
COPY run.sh /run.sh
CMD /run.sh
