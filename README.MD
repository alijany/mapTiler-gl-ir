# MAPTILER-GL-IR

This library had been created to be used as a tile server for maplibre, and it only includes the Iran map.

## Usage 

- make a new clone of repository

    ```shell
    git clone https://github.com/alijany/maptiler-gl-ir.git
    ```

- goto repository dir

    ```shell
    cd maptiler-gl-ir
    ```

- build tile server image using docker:

    ```properties
    docker build . -t map-tiler
    ```

- run tile server container using docker:

    ```properties
    docker run -p 8080:8080 map-tiler
    ```

 - done! See https://maplibre.org/ for client instructions

---

## Update map Instruction

- download pbf file from  https://download.geofabrik.de/asia/iran-latest.osm.pbf
- convert pbf to mbtiler format using tilemaker:

    ```sh
    docker run --rm -it -v $(pwd):/srv tilemaker --input=/srv/iran-latest.osm.pbf --output=/srv/iran.mbtiles
    ```
- copy and replace iran.mbtiles to the `data/mbtiles/ folder
- build new image and enjoy!

## Update styles instruction

-  generate new style using https://maplibre.org/
-  replace `layers` section of output style with `layers` section of `data\styles\style.json`
- replace source of layers with `openmaptiles` if needed
- build new image and done!
