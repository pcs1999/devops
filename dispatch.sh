source common.sh
set_path=$(pwd)

print_head "installing the golong"
yum install golang -y
condition_check 

print_head "user add"
useradd roboshop
condition_check

print_head "mkdir app"
mkdir -p /app 
condition_check

print_head "curl on process"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip 
condition_check

print_head "cd app "
cd /app 
condition_check

print_head "unzipping the"
unzip /tmp/dispatch.zip
condition_check

print_head "cd  app "
cd /app 
condition_check

print_head "init dispatch"
go mod init dispatch
condition_check

print_head "go on get"
go get 
condition_check


print_head "go build "
go build
condition_check

print_head "copying the files to etc"
cp ${set_path}/files/dispatch.service  /etc/systemd/system/dispatch.service
condition_check

print_head "daemon reload"
systemctl daemon-reload
condition_check

print_head "enabling the dispatch"
systemctl enable dispatch 
condition_check

print_head "starting the dispatch"
systemctl start dispatch
condition_check

print_head "restrting the dispatch"
systemctl restart dispatch
condition_check