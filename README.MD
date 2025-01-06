# MAPTILER-GL-IR

A tile server for MapLibre, focused on Iran’s map data.

## Usage

1. Clone the repo:
   ```sh
   git clone https://github.com/alijany/maptiler-gl-ir.git
   ```
2. Change into the repository directory:
   ```sh
   cd maptiler-gl-ir
   ```
3. Build the container image:
   ```sh
   docker build . -t map-tiler
   ```
4. Run the image:
   ```sh
   docker run -p 8080:8080 map-tiler
   ```
5. Access the server at http://localhost:8080.

---

## Update Map Instructions

1. Download the latest Iran PBF file from https://download.geofabrik.de/asia/iran-latest.osm.pbf.  
2. Convert it to MBTiles with tilemaker:
   ```sh
   docker run --rm -it -v $(pwd):/srv tilemaker --input=/srv/iran-latest.osm.pbf --output=/srv/iran.mbtiles
   ```
3. Replace the resulting MBTiles file in [data/mbtiles](data/mbtiles).  
4. Rebuild the Docker image to use the updated data.

---

## Update Styles Instruction

1. Generate a new style at https://maplibre.org/.  
2. Copy only the `layers` section from the generated style.
3. In `style.json`, replace its `layers` section with the freshly generated one.
4. Adjust any layer source references to `openmaptiles` if needed.
5. Rebuild the Docker image to apply your new style.

---

## Configuration

See [data/config.json](data/config.json) for server settings, data sources, fonts, styles, and paths.

---

## Docker Reference

See [Dockerfile](Dockerfile) for the container build instructions.