FROM ubuntu:14.04

# Install GDAL, Python, and other dependencies
RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ubuntugis/ppa && \
    apt-get install -y git gdal-bin libgdal1-dev python3 python3-pip build-essential libsqlite3-dev zlib1g-dev wget curl

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash && \
    apt-get install -y nodejs build-essential

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
