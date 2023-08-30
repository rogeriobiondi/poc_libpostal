#!/bin/bash
docker run --rm -p 8888:8888 -v $(pwd):/app/test poc_libpostal/poc_libpostal:1.0 jupyter notebook --allow-root --ip 0.0.0.0