source common.sh 
set_path=$(pwd)

print_head "installing python36"
yum install python36 gcc python3-devel -y
condition_check 

print_head "adding roboshop"
useradd roboshop
condition_check 

print_head "making directory"
mkdir /app 
condition_check 

print_head " curl on process"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip 
condition_check 

print_head "cd app"
cd /app 
condition_check 

print_head " unzipping"
unzip /tmp/payment.zip
condition_check 

print_head "cd app"
cd /app 
condition_check 

print_head "pip3.6 install"
pip3.6 install -r requirements.txt
condition_check 

print_head "cp files to etc"
cp ${set_path}/files/payment.service /etc/systemd/system/payment.service
condition_check

print_head "daemon reload"
systemctl daemon-reload
condition_check

print_head "enabling the payment"
systemctl enable payment 
condition_check

print_head "starting the payment"
systemctl start payment
condition_check 

print_head "restarting the payment"
systemctl start payment 
condition_check
