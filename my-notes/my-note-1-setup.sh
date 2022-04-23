
git clone https://github.com/VLTSankalpa/data-engineering-spark.git
cd data-engineering-spark/
ls -ltrh
cat docker-compose.yaml

# python and jupyter in itvdflab service
# SQL and postgres in pg.itversity.com service
# itvdflab service has volume bind to itversity-material dirctory

docker-compose up -d --build itvdflab 
# this will build itvdflab and pg.itversity.com both docker compose services 
# itvdflab depend on pg.itversity.com

# therefore if we stop pg.itversity.com it will stop itvdflab as well
docker-compose stop pg.itversity.com
# if we try to bring up itvdflab it will bring up pg.itversity.com as well
docker-compose start itvdflab


docker-compose ps
docker image ls
docker ps

# get jupyter token from docker python service
sudo docker-compose exec itvdflab bash
cat .local/share/jupyter/runtime/jpserver-*.json
sudo docker-compose exec itvdflab bash -c "cat .local/share/jupyter/runtime/jpserver-*.json" | grep -i token


# To setup and access jupyyerlab hosted in Google cloud VM

sudo apt install pip


pip install jupyter lab
# this will start jupyter lab bind to local ip (127.0.0.1)
jupyter lab 
# this will start jupyter lab bind to private ip
jupyter lab --ip 10.182.0.2
# we can't use public ip to start jupyter as the public ip is not bounded to VM (its a load balancer)

# we also can run jupyter bind to all the ips with universal ip (0.0.0.0)
jupyter lab --ip 0.0.0.0

# ones this is done check accesibility via all the ips as follows
telnet localhost 8888
telnet 10.182.0.2 8888
telnet <public-ip> 8888

# after that we can use sshuttle as a vpn
sudo apt install sshuttle
sshuttle -r tharindu_gpc@34.125.220.158 0/0

# now we can access from our local pc browser to jupyter runtime
http://34.125.220.158:8889/lab?token=bc921e78dc5461022dd5106eb73d3fe0abb95a02862f8ac4

# enter bash of postgres docker
docker-compose exec pg.itversity.com bash
# directly enter psql 
docker-compose exec pg.itversity.com psql -U postgres