FROM ubuntu
# FROM conanio/gcc5-armv7

# set time zone so tzdata does not hang
ENV TZ=America
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install build dependencies
RUN apt-get update && apt-get install -y g++ cmake libpng-dev libjpeg-dev ffmpeg libtiff-dev vim libavcodec-dev 
RUN apt-get install -y libavformat-dev
RUN apt-get install -y libswscale-dev
# python3-pip
# RUN pip install conan

# RUN cd ..
# RUN mkdir aradic
# RUN cd ./aradic
# RUN mkdir ./pHash

ADD ./ /

# RUN conan install .
# RUN cd ./pHash
RUN cmake .

RUN make