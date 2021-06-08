# Kvaido_infra
Kvaido Infra repository

-------------------------
## Homework#11

1. Был создан и описан Vagrantfile.

2. Были доработаны роли app и db.

3. С помощью molecule были произведены тесты.

-------------------------
## Homework#10

1. Были созданы роли, куда были перенесены ранее созданные плейбуки.

2. Были описаны два окружения prod и stage.

3. Была интегрирована коммьюнити роль nginx.

4. Были зашифрованы окружения с помощью Ansible Vault.


-------------------------
## Homework#9

1. Был написан reddit_app.yml и опробованы tags

2. Был написан reddit_app2.yml и оптимизирован для более удобного выполнения.

3. Были добавлены шаблоны (templates).

4. reddit_app.yml и reddit_app2.yml были переименованы в reddit_app_one_play.yml и reddit_app_multiple_plays.yml.

5. Был написан плейбук site.yml с несколькими сценариями app.yml, db.yml, deploy.yml.

6. Были написаны плейбуки packer_app.yml и packer_db.yml для замены bash скриптов в Packer


-------------------------
## Homework#8

1. Был написан ansible-playbook clone.yml и inventory файл.

2. На виртуальную машину app была применена комманда, которая скачала репозиторий с github.
```
ansible app -m git -a 'repo=https://github.com/express42/reddit.git dest=/home/ubuntu/reddit'
```

3. Для проверки работы ansible удалим репозиторий.
```
ansible app -m command -a 'rm -rf ~/reddit'
```

и применим ansible-playbook clone.yml
```
user@computer:~/Documents/otus/Kvaido_infra/ansible$ ansible-playbook clone.yml

PLAY [Clone] **********************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************
ok: [appserver]

TASK [Clone repo] *****************************************************************************************************
changed: [appserver]

PLAY RECAP ************************************************************************************************************
appserver                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
В итоге измения были применены только по одному пункту, так как 'Gathering Facts' не были затронуты предыдущей командой.


-------------------------
## Homework#7

1. БД был вынесен на отдельный инстанс VM.

2. Были созданы модули app и db

3. Разделение проекта на prod и stage


-------------------------
## Homework#6

1. Для Terraform был создан отдльный service account.

2. Был создан main.tf с описанием создания интсанса с образом создынным в прошлом ДЗ.

3. Был создан инстанс.
```
terraform apply -auto-approve
```

4. Все переменные были вынесены в terraform.tfvars.

5. В рамках самостоятельной работы была переменная зоны и все файлы были отформатированы.

-------------------------
## Homework#5
1. Был создан сервисный аккаунт для Packer в Yandex.Cloud и делегированы права

2. Был создан service account key file

3. Был создан шаблон Packer ubuntu16.json

4. Была проведена проверка и создан образ
```
packer validate ./ubuntu16.json
packer build ./ubuntu16.json
```

5. Для дополнительного задания был создан bake-образ immutable.json
```
packer build -var-file=variables.json immutable.json
```

6. Для дополнительного задания был создан скрипт create-reddit-vm.sh создающий ВМ на базе bake-образ
```
http://178.154.226.239:9292
```

-------------------------
## Homework#4
```
testapp_IP = 130.193.49.229
testapp_port = 9292
```

1. Создать нового инстанса руководствуясь материалами практикума.

```
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/appuser.pub
 ```

2. Установить на инстанс Ruby, Bundler, MongoDB и произвести деплой приложения.

3. Команды по настройки системы и деплоя приложения были завернуты в bash скрипты
   - install_ruby.sh
   - install_mongodb.sh
   - deploy.sh

4. Был создан startup скрипт (metadata.yaml)

```
yc compute instance create --name reddit-app-2 --hostname reddit-app-2 --memory=4 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --metadata serial-port-enable=1 --metadata-from-file user-data=./metadata.yaml
```

-------------------------
## Homework#3
```
bastion_IP = 84.201.171.225
someinternalhost_IP = 10.128.0.28
```
1. Исследовать способ подключения к someinternalhost в одну
команду из вашего рабочего устройства

```
ssh -i ~/.ssh/appuser -J appuser@84.201.171.225 appuser@10.128.0.28
```

2. Предложить вариант решения для подключения из консоли при
помощи команды вида ssh someinternalhost из локальной
консоли рабочего устройства, чтобы подключение выполнялось по
алиасу someinternalhost.

На локальной машине в ~/.ssh/config (при необходимости создать файл) добавить

```
host bastion
user appuser
port 22
hostname 84.201.171.225

host someinternalhost
user appuser
port 22
hostname 10.128.0.28
proxyjump bastion
```

Для подключения выполнить команду
```
ssh someinternalhost
```

3. На ВМ установлен vpn-сервер Pritunl и настроено  подключение

4. Добавлен сертификат Let's Encrypt
https://pritunl.kvaido.com/

-------------------------
