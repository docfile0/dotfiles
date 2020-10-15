#!/bin/bash

unzip hack-font.zip
cp ttf/* /usr/share/fonts
fc-cache -f -v
rm -rf ttf

