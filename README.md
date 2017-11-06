# Background

<a href="http://www.state.nj.us/dep/fgw/ensp/landscape/index.htm" target="_blank">NJ Landscape Project data</a> is a database that combines imperiled and priority species location information with land-use/land-cover (LULC) data. Landscape Project species habitat areas are determined by running species-specific models on a species observation point dataset. NJDEP ENSP biologists create habitat models for each NJ Special Concern, Threatened, or Endangered species, including Federally Threatened or Endangered species. These models use a combination of species biology (i.e. movement patterns, habitat preferences, home ranges, etc) and statewide land-use land-cover polygons to create potential habitat areas (<a href="http://www.state.nj.us/dep/fgw/ensp/landscape/lp_report_3_3.pdf" target="_blank">see Landscape Project Report v3.3, page 18-23</a>).

The dataset has hundreds of thousands of polygons with continuous, topological coverage for the entire state. The dataset also as several associated tables with rich attribute information about habitat type and wildlife.

This Proof of Concept investigates a workflow to process this dataset into vector tiles that can be rendered responsively in a web browser with Mapbox services and Mapbox GL JS.

