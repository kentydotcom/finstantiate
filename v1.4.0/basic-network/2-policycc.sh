#!/bin/bash

#  Dr Kent G Lau
#  kenty@kenty.com

#  Finspire 2020


echo
echo "#################################################################"
echo "#######    List all INSTALLED chaincode   #######################"
echo "#################################################################"
sudo docker exec cli peer chaincode list --installed


echo
echo "#################################################################"
echo "#######    Package POLICYCC chaincode   #########################"
echo "#################################################################"
# sudo docker exec cli peer chaincode package ehrccpack.out -n ehrcc -v 1.0 -p /opt/gopath/src/github.com/EHR/nodejs -l node

sudo docker exec cli peer chaincode package policyccpack.out -n policycc -v 1.0 -p /opt/gopath/src/github.com/policy/nodejs -l node


echo
echo "#################################################################"
echo "#######    Install POLICYCC chaincode package   ##################"
echo "#################################################################"

# sudo docker exec cli peer chaincode install ehrccpack.out -n ehrcc -v 1.0 -l node

sudo docker exec cli peer chaincode install policyccpack.out -n policycc -v 1.0 -l node
echo
echo "#################################################################"
echo "#######    List all INSTALLED chaincode   #######################"
echo "#################################################################"
sudo docker exec cli peer chaincode list --installed


# echo
# echo "#################################################################"
# echo "#######    List all INSTANTIATED chaincode   #######################"
# echo "#################################################################"
# sudo docker exec cli peer chaincode list --instantiated -C policychannel


echo
echo "#################################################################"
echo "#######    Instantiate POLICYCC chaincode   #####################"
echo "#################################################################"
# sudo docker exec cli peer chaincode instantiate ehrccpack.out -n ehrcc -v 1.0 -l node -o orderer.regulator.com:7050 -C policychannel -c '{"Args":[]}'

sudo docker exec cli peer chaincode instantiate policyccpack.out -n policycc -v 1.0 -l node -o orderer.insurerclaims.com:7050 -C policychannel -c '{"Args":[]}'


echo
echo "#################################################################"
echo "#######    Chaincode instantiation complete!   ##################"
echo "#################################################################"
# sudo docker exec cli peer chaincode list --instantiated -C policychannel
