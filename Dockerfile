FROM maptiler/tileserver-gl:v4.11.1

COPY  data /data

RUN echo "Setting up container..."

CMD ["tileserver-gl"]
