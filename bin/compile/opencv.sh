#!/bin/bash

# Usage:
#   bash opencv.sh

git clone --depth 1 https://github.com/Itseez/opencv.git
git clone --depth 1 https://github.com/Itseez/opencv_contrib.git

cd /usr/local/src/opencv || exit 1
mkdir build
cd build || exit 1
rm -rf /usr/local/src/opencv/build/*

cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=/usr/local/src/opencv_contrib/modules \
    -D PYTHON3_EXECUTABLE=/opt/python/virtual/3.6/bin/python \
    -D PYTHON3_INCLUDE_DIR=/opt/python/3.6/include/python3.6m/ \
    -D PYTHON3_LIBRARY=/opt/python/3.6/lib/libpython3.6m.so \
    -D PYTHON3_NUMPY_INCLUDE_DIRS=/opt/python/virtual/datascience/lib/python3.6/site-packages/numpy/ \
    ..

make
sudo make install
sudo ldconfig
