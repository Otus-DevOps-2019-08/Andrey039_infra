### Самостоятельное задание + дополнительное задание

#### Подключение при помощи команды ssh someinternalhost
Создаем файл (если его нет) ~/.ssh/config
```
Host someinternalhost
     HostName 10.132.0.3 #10.132.0.3 IP изолированной ВМ
     User appuser 
     Port 22
     IdentityFile ~/.ssh/appuser
     ProxyCommand ssh appuser@35.210.137.137 -W %h:%p  #35.210.137.137 IP bastionhost
```
В результате появляется возможность подключится к someinternalhost командой ``` ssh someinternalhost ```

#### Для подключения в одну команду someinternalhost

Для ленивых подойдет aliase (без использования ~/.ssh/config)

``` alias someinternalhost='ssh -i ~/.ssh/appuser -A appuser@10.132.0.3  -o "proxycommand ssh -W %h:%p appuser@35.210.137.137"'```  (Внимание на кавычки)

С использованием ~/.ssh/config для запуска одной командой ``` someinternalhost ``` создать алиас ``` alias someinternalhost='ssh  someinternalhost' ```


Использовалась статья https://www.cyberciti.biz/faq/create-ssh-config-file-on-linux-unix/

### OpenVPN (Pritunl)  в GCP


``` 
bastion_IP = 35.210.137.137

someinternalhost_IP = 10.132.0.3
```
