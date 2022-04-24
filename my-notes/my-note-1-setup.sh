# Clone repo and inspect docker-compose file

```shell
git clone https://github.com/VLTSankalpa/data-engineering-spark.git
cd data-engineering-spark/
ls -ltrh
cat docker-compose.yaml
```

# itvdflab service

#### Python and jupyter in itvdflab service

#### SQL and postgres in pg.itversity.com service

#### itvdflab service has volume bind to itversity-material dirctory



```shell
docker-compose up -d --build itvdflab 
```



#### This will build itvdflab and pg.itversity.com both docker compose services 

#### itvdflab depend on pg.itversity.com


#### Therefore if we stop pg.itversity.com it will stop itvdflab as well



```shell
docker-compose stop pg.itversity.com
```



#### If we try to bring up itvdflab it will bring up pg.itversity.com as well



```shell
docker-compose start itvdflab


docker-compose ps
docker image ls
docker ps
```



#### Get jupyter token from docker python service



```shell
sudo docker-compose exec itvdflab bash
cat .local/share/jupyter/runtime/jpserver-
.json
sudo docker-compose exec itvdflab bash -c "cat .local/share/jupyter/runtime/jpserver-
.json" | grep -i token
```



#### To setup and access jupyyerlab hosted in Google cloud VM



```shell
sudo apt install pip


pip install jupyter lab
```



#### This will start jupyter lab bind to local ip (127.0.0.1)



```shell
jupyter lab 
```



#### This will start jupyter lab bind to private ip



```shell
jupyter lab --ip 10.182.0.2
```



#### We cant use public ip to start jupyter as the public ip is not bounded to VM (its a load balancer)


#### We also can run jupyter bind to all the ips with universal ip (0.0.0.0)



```shell
jupyter lab --ip 0.0.0.0
```



Ones this is done check accesibility via all the ips as follows



```shell
telnet localhost 8888
telnet 10.182.0.2 8888
telnet <public-ip> 8888
```



After that we can use sshuttle as a vpn



```shell
sudo apt install sshuttle
sshuttle -r tharindu_gpc@34.125.220.158 0/0
```



Now we can access from our local pc browser to jupyter runtime



```shell
http://34.125.220.158:8889/lab?token=bc921e78dc5461022dd5106eb73d3fe0abb95a02862f8ac4
```



Enter bash of postgres docker



```shell
docker-compose exec pg.itversity.com bash
```



Directly enter psql 



```shell
docker-compose exec pg.itversity.com psql -U postgres

psql -h localhost -p 5432 -d itversity_sms_db -U itversity_sms_user -W


docker container create \
    --name my_pg \
    -p 9999:5432 \
    -h my_pg \
    -e POSTGRES_PASSWORD=itversity \
    postgres


docker exec \
    -it my_pg \
    psql -U postgres

```