# Background

[NJ Landscape Project data](http://www.state.nj.us/dep/fgw/ensp/landscape/index.htm) is a database that combines imperiled and priority species location information with land-use/land-cover (LULC) data. Landscape Project species habitat areas are determined by running species-specific models on a species observation point dataset. NJDEP ENSP biologists create habitat models for each NJ Special Concern, Threatened, or Endangered species, including Federally Threatened or Endangered species. These models use a combination of species biology (i.e. movement patterns, habitat preferences, home ranges, etc) and statewide land-use land-cover polygons to create potential habitat areas ([see Landscape Project Report v3.3, page 18-23](http://www.state.nj.us/dep/fgw/ensp/landscape/lp_report_3_3.pdf)). The dataset has hundreds of thousands of polygons with continuous, topological coverage for the entire state and several associated tables with rich attribute information about habitat type and wildlife.

This Proof of Concept investigates a workflow to process this dataset into vector tiles that can be rendered responsively in a web browser with Mapbox services and Mapbox GL JS.

# Usage

## `script/bootstrap`

`script/bootstrap` is used solely for fulfilling dependencies of the project.

This can mean RubyGems, npm packages, Homebrew packages, Ruby versions, Git submodules, etc.

The goal is to make sure all required dependencies are installed.

## `script/setup`

`script/setup` is used to set up a project in an initial state. This is typically run after an initial clone, or, to reset the project back to its initial state.

This will accomplish:

1. Download the NJ Landscape Project data
2. Read the FileGDB
3. Process data into line-delimited GeoJSON
4. Process the line-delimited GeoJSON into vector tiles.

## `script/update`

`script/update` is used to update the project after a fresh pull.

This will run `script/bootstrap` and make sure the output of `script/setup` also exists, running `script/setup` again if necessary.

## `script/server`

`script/server` is used to start the application.

This will accomplish:

1. Uploading an MBTiles file to Mapbox, creating a new tileset.
2. Updating example HTML files to reference the correct Mapbox tileset ID and access tokens.
3. Serve examples maps on localhost.
