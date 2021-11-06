# yuzu:latest image
# https://github.com/yuzu-emu/yuzu/wiki/Building-For-Linux
FROM ubuntu:20.04

RUN apt-get update && apt install -y sudo
# libpulse-dev が聞かれる
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y libpulse-dev
RUN sudo apt-get install -y autoconf cmake g++-10 gcc-10 git glslang-tools libasound2 libboost-context-dev libglu1-mesa-dev libhidapi-dev libtool libudev-dev libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-render-util0 libxcb-xinerama0 libxcb-xkb1 libxext-dev libxkbcommon-x11-0 mesa-common-dev nasm ninja-build python3 python3-pip qtbase5-dev qtbase5-private-dev qtwebengine5-dev libmbedtls-dev
RUN git clone https://github.com/conan-io/conan.git conan_src 
RUN cd conan_src && pip install -e .

RUN git clone --recursive https://github.com/yuzu-emu/yuzu

RUN mkdir /yuzu/build
WORKDIR /yuzu/build
RUN cmake .. -GNinja -DCMAKE_C_COMPILER=gcc-10 -DCMAKE_CXX_COMPILER=g++-10
RUN ninja


CMD ["bash"]
