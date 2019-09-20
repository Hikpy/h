#! /bin/sh  
#进程名字可修改  
PRO_NAME=shadowsocks
  
while true ; do  
     #用ps获取$PRO_NAME进程数量  
     NUM=`ps aux | grep -w ${PRO_NAME} | grep -v grep |wc -l`  
     #echo $NUM  
     #少于1，重启进程  
     if [ "${NUM}" -lt "1" ];then  
         echo "${PRO_NAME} was killed"  
         /etc/init.d/shadowsocks restart  #重启服务
		 echo shadowsocks down at >> ~/ss_err.log     #记下日志
		 date +%Y%m%d%H%M%S >> ~/ss_err.log 
     fi  
     sleep 5s  
 done  
   
 exit 0  
