# Urban Columbidae Communities

Focus on
* phylogeny
* eco-morphological traits (related to e.g. trophic/diet traits, dispersal traits, locomotion traits)
* habitat preferences
* nativeness

## Directory structure

### Root directory
* `./analysis` contains RStudio work books split into different areas of analysis.
* `./data` contains data files used through the analysis split into directories based on their origin
* `./install_packages.R` R scipt to install all required packages.

### Analysis directory
The notebooks inside these directories give further details of the analysis.
Each directory also contains a `./cache` and a `./figures` directory. The cache directory that contains CSV files of expensive to create datasets, Clearing this directory will mean that a full analysis can be run, but it will take much longer. The figures directory contains imagery used in the manuscript and supplementary material.

* `./analysis/community_analysis` Analysis of the structure of communities
* `./analysis/cooccurance` Analysis based on which Colombidae species have been found in the same eBird localities.
* `./analysis/phylogenetic_signature` Phylogentic analysis
* `./analysis/urban_traits` Trait analysis

### Data directory
Each data file in the directories below has a corresponding schema file giving details of contents and columns.
* `./data/bigquery` We imported the eBird dataset into Google BigQuery for further filtering and transformation. Required data is then extracted here.
* `./data/earth_engine` Datasets exported from Google Earth Engine
* `./data/output` Datasets created from analysis files above, these can be recreated by running the corresponding RStudio notebook.
* `./data/third_party` Datasets provided by third parties.

