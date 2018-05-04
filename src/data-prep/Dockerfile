FROM ubuntu:16.04

# Install Python and other dependencies
RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    apt-get install -y git python3 python3-pip build-essential libsqlite3-dev zlib1g-dev wget curl unzip parallel

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash && \
    apt-get install -y nodejs

# Install GDAL
RUN add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable && \
    apt-get install -y gdal-bin libgdal-dev

# Download and install Tippecanoe.
RUN git clone -b 1.15.1 https://github.com/mapbox/tippecanoe.git /tmp/tippecanoe && \
    cd /tmp/tippecanoe && \
    make && \
    PREFIX=/usr/local make install && \
    rm -rf /tmp/tippecanoe

# Install Python packages
RUN pip3 install mapbox && \
    pip3 install -I fiona --no-binary fiona && \
    pip3 install --ignore-installed six

# Install Node.js packages
RUN npm install turf @turf/random @turf/points-within-polygon @mapbox/polylabel

RUN cd /opt && \
    wget https://github.com/mapbox/mbutil/archive/v0.3.0.zip && \
    unzip v0.3.0.zip && \
    ln -s `pwd`/mbutil-0.3.0/mb-util /usr/local/bin/mb-util

RUN apt-get install
