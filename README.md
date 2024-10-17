## Start & Stop

./start.sh

./stop.sh

## Create superuser

docker compose exec web python3 manage.py createsuperuser

## View public key

docker compose exec web  cat /data/id_rsa.pub

## DB dump and restore

docker run --rm -e PYTHONPATH=/home/beatsight/app/vendor/repostat -v beatsight-data:/data -v "$PWD/backups:/backups" reg.beatsight.com/beatsight/beatsight:v1.2.4 python3 manage.py dumpdata -o /backups/mydata.json.gz

docker run --rm -e PYTHONPATH=/home/beatsight/app/vendor/repostat -v beatsight-data:/data -v "$PWD/backups:/backups" reg.beatsight.com/beatsight/beatsight:v1.2.4 python3 manage.py loaddata /backups/mydata.json.gz -e contenttypes
