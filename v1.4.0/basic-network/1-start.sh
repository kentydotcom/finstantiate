#!/bin/bash

#  Dr Kent G Lau
#  kenty@kenty.com
#  March 2020

#  For testing use only.  No guarantees or warranties provided whatsoever.
#  SPDX-License-Identifier: Apache-2.0


sudo docker-compose -f docker-compose.yml down

echo
echo "#################################################################"
echo "#######    Starting network    ##################################"
echo "#################################################################"
echo

./.env
sudo docker-compose -f docker-compose.yml up -d

echo
echo "#################################################################"
echo "#######    List of all network containers   #####################"
echo "#################################################################"

sudo docker ps -a

# wait for Hyperledger Fabric to start
# incase of errors when running later commands, issue export FABRIC_START_TIMEOUT=<larger number>
export FABRIC_START_TIMEOUT=10
#echo ${FABRIC_START_TIMEOUT}
sleep ${FABRIC_START_TIMEOUT}


echo
echo "#################################################################"
echo "#######    Creating policychannel    ############################"
echo "#################################################################"

# Create the channel
sudo docker exec -e "CORE_PEER_LOCALMSPID=InsurerClaimsMSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@insurerclaims.com/msp" peer0.insurerclaims.com peer channel create -o orderer.insurerclaims.com:7050 -c policychannel -f /etc/hyperledger/configtx/policychannel.tx

echo
echo "#################################################################"
echo "#######    Joining peer0.insurerclaims.com to policychannel   ########"
echo "#################################################################"

# Join peer0.patient.com to the channel.
sudo docker exec -e "CORE_PEER_LOCALMSPID=InsurerClaimsMSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@insurerclaims.com/msp" peer0.insurerclaims.com peer channel join -b policychannel.block


echo
echo "#################################################################"
echo "#######    List of all channels joined by peer0.insurerclaims.com   ###"
echo "#################################################################"

# Peer channel list
sudo docker exec -e "CORE_PEER_LOCALMSPID=InsurerClaimsMSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@insurerclaims.com/msp" peer0.insurerclaims.com peer channel list
