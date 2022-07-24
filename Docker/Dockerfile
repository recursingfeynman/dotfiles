FROM nvidia/cuda:10.2-cudnn8-devel-ubuntu18.04

WORKDIR /root

ENV TZ=Europe/Moscow

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update ; apt upgrade -y ; apt-get -y install software-properties-common git vim wget build-essential libboost-all-dev libeigen3-dev libgoogle-glog-dev libprotobuf-dev protobuf-compiler libhdf5-dev libatlas-base-dev libblas-dev liblapack-dev python3-dev librdkit-dev python3-numpy python3-pip python3-pytest mpich python3-sphinx 

RUN wget https://github.com/Kitware/CMake/releases/download/v3.22.1/cmake-3.22.1-linux-x86_64.tar.gz; \
	tar -xvf cmake-3.22.1-linux-x86_64.tar.gz; \
	cp cmake-3.22.1-linux-x86_64/bin/* /usr/local/bin; \
	cp -r cmake-3.22.1-linux-x86_64/share/cmake-3.22 /usr/local/share/

RUN git clone https://github.com/openbabel/openbabel.git; \
    cd openbabel; git checkout openbabel-3-1-1; mkdir build; cd build;  \
    cmake .. -DWITH_MAEPARSER=OFF -DWITH_COORDGEN=OFF;  \
    make -j4; make install

RUN wget https://github.com/gnina/gnina/archive/refs/tags/v1.0.2.tar.gz; \
	tar -xvf v1.0.2.tar.gz; \
    cd gnina-1.0.2; mkdir build; cd build; \
    cmake .. ;\
    make -j4 ; make install

RUN wget https://ftp.gromacs.org/gromacs/gromacs-2020.2.tar.gz; \
	tar -xvf gromacs-2020.2.tar.gz; \ 
	cd gromacs-2020.2.tar.gz; mkdir build; cd build; \
	cmake .. \
	-DGMX_BUILD_OWN_FFTW=ON \
	-DREGRESSIONTEST_DOWNLOAD=ON \
	-DGMX_GPU=ON \
	-DGMX_CUDA_TARGET_SM=30 \
	-DGMX_CUDA_TARGET_COMPUTE=30 \
	-DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda \
	-DCMAKE_INSTALL_PREFIX=/usr/local/gromacs; \ 
	make; make check; make install
