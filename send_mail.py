#!/usr/bin/python
#coding:utf-8  
import smtplib  
from email.mime.text import MIMEText  
from email.header import Header  
  
# 第三方 SMTP 服务  
mail_host="smtp.qq.com"  #设置服务器  
mail_user=""    #用户名  
mail_pass=""   #口令,QQ邮箱是输入授权码，在qq邮箱设置 里用验证过的手机发送短信获得，不含空格  
  
  
sender = ''  
receivers = ['']  # 接收邮件，可设置为你的QQ邮箱或者其他邮箱  

content = '服务宕机了'; # 内容
  
message = MIMEText(content, 'plain', 'utf-8')  
message['From'] = Header("大冲小浪", 'utf-8')  
message['To'] =  Header("you", 'utf-8')  
  
subject = '服务器通知:one_t11服务宕机了'       # 标题     
message['Subject'] = Header(subject, 'utf-8')
try:  
  smtpObj = smtplib.SMTP_SSL(mail_host, 465)   
  smtpObj.login(mail_user,mail_pass)    
  smtpObj.sendmail(sender, receivers, message.as_string())  
  smtpObj.quit()  
  print "邮件发送成功"  
except smtplib.SMTPException,e:  
  print e  
