docker-compose down
docker-compose up -d
docker exec -it zepalheta-api sh /home/node/api/setup.sh

echo '###############################################################################################'
echo 'Os containers do Zé Palheta devem estar no AR!'
docker ps


echo '###############################################################################################'
echo 'Se você usa Docker ToolBox faça os Hosteamentos para o IP 192.168.99.100'
echo 'Se você usa Docker Desktop faça os Hosteamentos para o IP 127.0.0.1'
echo '###############################################################################################'

echo 'Hosts:'
echo 'zepalheta-postgres'
echo 'zepalheta-pgadmin'
echo 'zepalheta-api'
echo 'zepalheta-web'