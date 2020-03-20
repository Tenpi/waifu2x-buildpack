#!/bin/sh

indent() {
  sed -u 's/^/       /'
}

echo "-----> Install waifu2x-converter-cpp"
BUILD_DIR=$1
VENDOR_DIR="vendor"
DOWNLOAD_URL="https://github.com/tenpi/waifu2x-buildpack/raw/master/waifu2x-converter-cpp-5.3.3.tar.gz"

echo "DOWNLOAD_URL = " $DOWNLOAD_URL | indent

cd $BUILD_DIR
mkdir -p $VENDOR_DIR
cd $VENDOR_DIR
curl -L --silent $DOWNLOAD_URL | tar xz

echo "exporting PATH and LIBRARY_PATH" | indent
PROFILE_PATH="$BUILD_DIR/.profile.d/waifu2x-converter-cpp.sh"
mkdir -p $(dirname $PROFILE_PATH)
echo 'export PATH="$PATH:vendor/waifu2x-converter-cpp/bin"' >> $PROFILE_PATH
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:vendor/waifu2x-converter-cpp/lib"' >> $PROFILE_PATH