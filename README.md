## Деплой тестового приложения

### Создание инстанса GCP  через gcloud shell

```
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure\
  --metadata startup-script-url=https://gist.githubusercontent.com/Andrey039/ca9ce56544e8fe3a43d632b7806ad0bb/raw/98c69b58e45ad62bc0056ac3ba3e5ceb478b2f0e/startupscript.sh
```
Где ``` --metadata startup-script-url ``` запуск startup-script c gist.

### Открытие порта в GCP через консоль

```
  gcloud compute --project=infra-253413 firewall-rules create puma \
  --direction=INGRESS \
  --priority=1000 \
  --network=default \
  --action=ALLOW \
  --rules=tcp:9292 \
  --source-ranges=0.0.0.0/0 \
  --target-tags=puma-server
```

```
testapp_IP = 34.77.229.218
testapp_port = 9292

```
### Самостоятельная работа

Написан простейший bash скрипт для провиженинга  ```  startupscript.sh  ``` при создании инстанса.


Скрипт с защитой от повтроного выполнения при рестарте инстанса.

someinternalhost_IP = 10.132.0.3

