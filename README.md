## Сборка образов VM при помощи Paker

- Создан файл ubuntu16.json с описанием базового образа reddit-base с использованием пользовательстких переменных м файле variables.json

- создан шаблон immutable.json (reddit-full)  с запуском puma как сервис systemd

- написан скрипт packer/config-scripts/create-reddit-vm.sh для запуска ВМ с gcloud console (reddit-full)