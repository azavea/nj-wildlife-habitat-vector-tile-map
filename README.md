# Background

[NJ Landscape Project data](http://www.state.nj.us/dep/fgw/ensp/landscape/index.htm) is a database that combines imperiled and priority species location information with land-use/land-cover (LULC) data. Landscape Project species habitat areas are determined by running species-specific models on a species observation point dataset. NJDEP ENSP biologists create habitat models for each NJ Special Concern, Threatened, or Endangered species, including Federally Threatened or Endangered species. These models use a combination of species biology (i.e. movement patterns, habitat preferences, home ranges, etc) and statewide land-use land-cover polygons to create potential habitat areas ([see Landscape Project Report v3.3, page 18-23](http://www.state.nj.us/dep/fgw/ensp/landscape/lp_report_3_3.pdf)). The dataset has hundreds of thousands of polygons with continuous, topological coverage for the entire state and several associated tables with rich attribute information about habitat type and wildlife.

This Proof of Concept investigates a workflow to process this dataset into vector tiles that can be rendered responsively in a web browser with Mapbox services and Mapbox GL JS.

# Usage

## 1. Install dependencies with `script/bootstrap`.

The project downloads, processes, and prepares data resources all within a Docker container. To build the Docker image, run `script/bootstrap`.

## 2. Prepare the data with `script/setup`.

Setup the web app by running `script/setup`. This will download the NJ Landscape Project data and prepares app resources in the `app/` directory.

## 3. Upload the prepared MBTiles files to Mapbox Tilesets.

Go to the [Mapbox Tilesets](https://www.mapbox.com/studio/tilesets/) page and upload the MBTiles files in `app/tiles/`. Once processing is complete, copy the Tileset IDs and use them in the next configuration step.

## 4. Configure the website application by editing `app/config.js`.

Edit `app/config.js` with your [Mapbox Access Token](https://www.mapbox.com/studio/account/tokens/), your Tileset IDs, and the hostname where `app/` will be served.

## 5. Serve the contents of the `app/` directory.

Start serving the contents of `app/` on a web server. Remember to update the `HOST` property in the `app/config.js` to match how you are serving out the data.

# Developing

You can get into the Docker container by running `script/console`.
