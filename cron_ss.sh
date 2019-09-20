#! /bin/sh  
#进程名字可修改  
PRO_NAME=ss_daemon.sh
#用ps获取$PRO_NAME进程数量  
 NUM=`ps aux | grep -w ${PRO_NAME} | grep -v grep |wc -l`  
 #echo $NUM  
 #少于1，重启进程  
 if [ "${NUM}" -lt "1" ];then  
	 echo "${PRO_NAME} was killed"  
	 sh ~/ss_daemon.sh &  #重启服务
	 echo ss_daemon down at >> ~/ss_err.log     #记下日志
	 date +%Y%m%d%H%M%S >> ~/ss_err.log 
	 python ~/send_mail.py            #发邮件
 fi  
 exit 0  
