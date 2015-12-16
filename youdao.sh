#!/bin/bash
youdao(){

ARGS=${1}
curl -s \
        "http://fanyi.youdao.com/translate?smartresult=dict&smartresult=rule&smartresult=ugc&sessionFrom=dict.top" \
     -d \
	"type=AUTO& i=${ARGS}&doctype=json&xmlVersion=1.4&keyfrom=fanyi.web&ue=UTF-8&typoResult=true&flag=false" \
        | sed -E -n 's/.*tgt":"([^"]+)".*/\1/p' ;

return 0;
}
ARGS=`echo $@`
youdao "$ARGS"
