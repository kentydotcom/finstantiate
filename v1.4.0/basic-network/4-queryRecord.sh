#!/bin/bash

#  Dr Kent G Lau
#  kenty@kenty.com

#  Finspire 2020


echo
echo "#################################################################"
echo "#######    Query Record:  POLICY-ID 001   #######################"
echo "#######                   POLICY-ID 002   #######################"
echo "#######                   POLICY-ID 003   #######################"
echo "#################################################################"
sudo docker exec cli peer chaincode query -o orderer.insurerclaims.com:7050 -C policychannel -n policycc -c '{"function":"queryRecord","Args":["001"]}' && \
sudo docker exec cli peer chaincode query -o orderer.insurerclaims.com:7050 -C policychannel -n policycc -c '{"function":"queryRecord","Args":["002"]}' && \
sudo docker exec cli peer chaincode query -o orderer.insurerclaims.com:7050 -C policychannel -n policycc -c '{"function":"queryRecord","Args":["003"]}'
