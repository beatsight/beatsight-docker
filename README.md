## Start & Stop

./start.sh

./stop.sh

## Create superuser

docker compose exec web python3 manage.py createsuperuser

## View public key

docker compose exec web  cat /data/id_rsa.pub
