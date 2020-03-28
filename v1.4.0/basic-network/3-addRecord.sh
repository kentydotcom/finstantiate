#!/bin/bash

#  Dr Kent G Lau
#  kenty@kenty.com

#  Finspire 2020


echo
echo "#################################################################"
echo "#######    Add Record:  POLICY-ID 001   #########################"
echo "#######                 POLICY-ID 002   #########################"
echo "#######                 POLICY-ID 003   #########################"
echo "#################################################################"
sudo docker exec cli peer chaincode invoke -o orderer.insurerclaims.com:7050 -C policychannel -n policycc -c '{"function":"addRecord","Args":["001","Andy Lau","0x111","J31.0","hash","in-process","2019=0,2020=5"]}' &&
sudo docker exec cli peer chaincode invoke -o orderer.insurerclaims.com:7050 -C policychannel -n policycc -c '{"function":"addRecord","Args":["002","Jacky Cheung","0x222","K59.00","hash","missing document","2019=1,2020=3"]}' &&
sudo docker exec cli peer chaincode invoke -o orderer.insurerclaims.com:7050 -C policychannel -n policycc -c '{"function":"addRecord","Args":["003","Aaron Kwok","0x333","R53.82","hash","approved","2019=0,2020=0"]}'



# let data={
#   '001-POLICYHOLDER_ID:':policyholderId,
#   '002-DOCTOR_ID:':data1,
#   '003-VOUCHER_CODE:':data2,
#   '004-ICD_CODE:':data3,
#   '005-HASHES':data4,
#   '006-CLAIM_STATUS':data5,
#   '007-INCENTIVE:':data6,
#    };
