#! /bin/bash
#Определение функции установки Rubu и Bundler
function InstallRubu
{
apt update
apt install -y ruby-full ruby-bundler build-essential
}
#Определение функции установки MongoDB
function InstallMongoDB
{
rm /etc/apt/sources.list.d/mongodb*.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E52529D4
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-4.0.list'
apt update
apt -y install mongodb-org
systemctl enable mongod.service
systemctl start mongod.service
}

#Определение функции установки приложения
function InstallApp
{
git clone -b monolith https://github.com/express42/reddit.git /opt/app
cd /opt/app && bundle install
puma -d
}

if [ ! -f  /opt/trigger.file ]; then 
  touch /opt/trigger.file #Создание триггер-файла для исключения повторного запуска скрипта при перезагрузке инстанса
  chattr +i /opt/trigger.file #Защита триггер-файла от удаления
  InstallRubu
  InstallMongoDB
  InstallApp
else exit 0  
fi
