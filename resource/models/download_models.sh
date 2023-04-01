
help(){
	echo "model download script"
	echo "Usage: ./download_model.sh [OPTIONS]" 

	echo "Options:"
  	echo "    -h,--help                   Print this help message and exit"
  	echo "    fp16,int8,int4              Chose different models"
}

# GITHUB_PROXY=https://ghproxy.com/
GITHUB_PROXY=""

fp16_model(){
	for i in `seq 0 27`
   do
      wget -c ${GITHUB_PROXY}https://github.com/wangzhaode/ChatGLM-MNN/releases/download/v0.1/glm_block_$i.mnn -P fp16
   done

   wget -c ${GITHUB_PROXY}https://github.com/wangzhaode/ChatGLM-MNN/releases/download/v0.1/lm.mnn -P fp16
   wget -c ${GITHUB_PROXY}https://github.com/wangzhaode/ChatGLM-MNN/releases/download/v0.1/slim_word_embeddings.bin -P fp16
}

int8_model(){
   for i in `seq 0 27`
   do
      wget -c ${GITHUB_PROXY}https://github.com/wangzhaode/ChatGLM-MNN/releases/download/v0.2/glm_block_$i.mnn -P int8
   done

   wget -c ${GITHUB_PROXY}https://github.com/wangzhaode/ChatGLM-MNN/releases/download/v0.1/lm.mnn -P int8
   wget -c ${GITHUB_PROXY}https://github.com/wangzhaode/ChatGLM-MNN/releases/download/v0.1/slim_word_embeddings.bin -P int8
}

int4_model(){
   for i in `seq 0 27`
   do
      wget -c ${GITHUB_PROXY}https://github.com/wangzhaode/ChatGLM-MNN/releases/download/v0.3/glm_block_$i.mnn -P in4
   done

   wget -c ${GITHUB_PROXY}https://github.com/wangzhaode/ChatGLM-MNN/releases/download/v0.1/lm.mnn -P in4
   wget -c ${GITHUB_PROXY}https://github.com/wangzhaode/ChatGLM-MNN/releases/download/v0.1/slim_word_embeddings.bin -P in4
}

if [ $# -eq 0 ]
then
   help
   exit 1
fi

for arg in "$@"
do
    case $arg in
        "--help" )
           help;;
        "-h" )
           help;;
        "fp16" )
           fp16_model;;
        "int8" )
           int8_model;;
        "int4" )
           int4_model;;
         * )
            help;;
   esac
done
