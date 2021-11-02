FROM ubuntu:18.04

COPY . .

RUN apt update && apt install -y sudo fuse software-properties-common 

RUN sudo add-apt-repository ppa:ubuntu-x-swat/updates 
RUN sudo apt-get -y dist-upgrade 
#RUN sudo apt install -y --no-install-recommends ubuntu-desktop mesa-utils
CMD ["bash"]
