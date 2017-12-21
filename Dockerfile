FROM ubuntu:17.04

# Install Python and other dependencies
RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    apt-get install -y git python3 python3-pip build-essential libsqlite3-dev zlib1g-dev wget curl unzip parallel

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash && \
    apt-get install -y nodejs

# Install GDAL
RUN add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable && \
    apt-get install -y gdal-bin

# Download and install Tippecanoe.
RUN git clone -b 1.15.1 https://github.com/mapbox/tippecanoe.git /tmp/tippecanoe && \
    cd /tmp/tippecanoe && \
    make && \
    PREFIX=/usr/local make install && \
    rm -rf /tmp/tippecanoe

# Install Python packages
RUN pip3 install mapbox && \
    pip3 install --user fiona && \
    pip3 install --ignore-installed six

# Install Node.js packages
RUN npm install turf @turf/random @turf/points-within-polygon @mapbox/polylabel
