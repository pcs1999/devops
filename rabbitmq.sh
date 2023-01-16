source common.sh
set_path=$(pwd)

print_head "curl on process"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | sudo bash
condition_check 

print_head "installing the erlang"
yum install erlang -y
condition_check 

print_head "curl on process"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
condition_check 

print_head "installing the rabbbit-mq"
yum install rabbitmq-server -y 
condition_check 

print_head "enbling the rabbit-server"
systemctl enable rabbitmq-server 
condition_check 

print_head "starting the rabbitmq"
systemctl start rabbitmq-server 
condition_check 

print_head "adding user with password"
rabbitmqctl add_user roboshop roboshop123
condition_check 

print_head "setting the roboshop as admin"
rabbitmqctl set_user_tags roboshop administrator
condition_check

print_head "setting the permissions"
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
condition_check 