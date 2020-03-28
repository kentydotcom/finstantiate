'use strict';
const { Contract} = require('fabric-contract-api');

class policy extends Contract {



   async queryRecord(ctx,policyholderId) {

    let dataAsBytes = await ctx.stub.getState(policyholderId);
    // let dataAsBytes = await ctx.stub.getState(policyholderId,policyTag);
    if (!dataAsBytes || dataAsBytes.toString().length <= 0) {
      throw new Error('POLICY WITH THIS ID DOES NOT EXIST: ');
       }
      let data=JSON.parse(dataAsBytes.toString());

      return JSON.stringify(data);
     }

   async addRecord(ctx,policyholderId,data1,data2,data3,data4,data5,data6) {

    let data={
      '001-POLICYHOLDER_ID:':policyholderId,
      '002-DOCTOR_ID:':data1,
      '003-VOUCHER_CODE:':data2,
      '004-ICD_CODE:':data3,
      '005-HASHES':data4,
      '006-CLAIM_STATUS':data5,
      '007-INCENTIVE:':data6,
       };

    await ctx.stub.putState(policyholderId,Buffer.from(JSON.stringify(data)));

    console.log('POLICY RECORD ADDED TO THE LEDGER SUCCESSFULLY!');

  }


  //  async addTag(ctx,policyTag,message) {
  //
  //   let tag={
  //     'POLICY-TAG:':policyTag,
  //     'MESSAGE:':message,
  //      };
  //
  //   await ctx.stub.putState(policyholderId,Buffer.from(JSON.stringify(tag)));
  //
  //   console.log('TAG ADDED TO POLICY RECORD SUCCESSFULLY!');
  //
  // }


}

module.exports=policy;
