FROM nvidia/cuda:10.2-cudnn8-devel-ubuntu18.04

# ENV CUDA_PATH /usr/local/cuda
# ENV LD_LIBRARY_PATH /usr/local/cuda/lib64

MAINTAINER recursingfeynman 

WORKDIR root/

# Update && add python repository
RUN apt-get update && apt-get install -y software-properties-common gcc python3 python3-distutils python3-pip python3-sphinx wget git vim mpich libblas-dev liblapack-dev

# Build Cmake 
ADD https://github.com/Kitware/CMake/releases/download/v3.22.1/cmake-3.22.1-linux-x86_64.tar.gz .
RUN tar -xzf cmake-3.22.1-linux-x86_64.tar.gz && rm cmake-3.22.1-linux-x86_64.tar.gz && \
	cp cmake-3.22.1-linux-x86_64/bin/* /usr/local/bin/ && \
	cp -r cmake-3.22.1-linux-x86_64/share/cmake-3.22 /usr/local/share/
#	rm -rf cmake-3.22.1-linux-x86_64
# Install pip requirements
RUN python3 -m pip install pytest pygments

# Build GROMACS
RUN mkdir gromacs
ADD https://ftp.gromacs.org/gromacs/gromacs-2020.3.tar.gz .
RUN tar -xzf gromacs-2020.3.tar.gz && rm gromacs-2020.3.tar.gz && \
	cd gromacs-2020.3 && mkdir build && cd build && \
	cmake .. -DGMX_MPI=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_PYTHON_PACKAGE=ON -DGMX_GPU=CUDA -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda -DGMX_CUDA_TARGET_SM=30 -DGMX_CUDA_TARGET_COMPUTE=30 -DGMX_EXTERNAL_BLAS=on -DCMAKE_INSTALL_PREFIX=gromacs && \
	make && make check && make install
