#!/bin/bash 


# Step1 build MNN 
git clone https://github.com/alibaba/MNN.git
cd MNN
mkdir build && cd build
cmake .. # if using CUDA, add -DMNN_CUDA=ON
make -j8

cp -r ./MNN/include /path/to/ChatGLM-MNN/
cp ./MNN/build/libMNN.so /path/to/ChatGLM-MNN/libs
cp ./MNN/buildexpress/libMNN_Express.so /path/to/ChatGLM-MNN/libs


# Step2 download model 
cd ./resource/models 
./download_models.sh int8 

# Step3 make chat 
mkdir build
cd build
cmake ..
make -j8
./cli_demo # cli demo
./web_demo # web ui demo
