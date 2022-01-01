FROM gcc:latest

WORKDIR /tmp

RUN wget https://github.com/Kitware/CMake/releases/download/v3.22.1/cmake-3.22.1.tar.gz

RUN tar -xf cmake-3.22.1.tar.gz

WORKDIR /tmp/cmake-3.22.1

RUN ./bootstrap
RUN make
RUN make install

WORKDIR /