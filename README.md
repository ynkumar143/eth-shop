#eth-shop

Admin will whitelist the sellers to submit the products on the network

If the seller is registered with the product , now buyer will payable amount for that product and become as owner

It also have functionality to retrive count and ownership validation


Network is designed in flexible to deploy on both ropsten and development environment. 

npm install

truffle compile

modify the mnemoic key present in truffle.js according to your infura api key created specific with your mail address. 

truffle migrate --network ropsten 

Use metamask for performing operations like sending amount of ethere. 

Use Ropsten Explorer to view the transaction information 

Ropsten Deployed address - 0x1eeefa48770dab9eb6b2305602bc453d9f20d4cd

Explorer : https://ropsten.etherscan.io/address/0x1eeefa48770dab9eb6b2305602bc453d9f20d4cd

But as the ethereum, infura network only support one account ata time it s is not possible to test from console.  Below procedure exectued in dev environment lists out the process. 

Command to retrived object oriented value -  Whitelist.deployed().then(function(instance){res=instance;})

1. Add Product without whitelisting the seller party. 

  'truffle(development)> res.addProduct(123, 1000, {from:web3.eth.accounts[1]})
Error: VM Exception while processing transaction: revert
    at XMLHttpRequest._onHttpResponseEnd (/usr/local/lib/nod;

    It is not authorized and declined for account 1

2. Whitelist accounts[1] (seller party) only from admin account (0) account

truffle(development)> res.whiteListAddress(web3.eth.accounts[1], {from:web3.eth.accounts[0]})
{ tx: '0x18bdb4860138d654a67d5ee3612d5a4a81ea46d966f2029f21e293e12035d81c',
  receipt: 
   { transactionHash: '0x18bdb4860138d654a67d5ee3612d5a4a81ea46d966f2029f21e293e12035d81c',
     transactionIndex: 0,
     blockHash: '0x147ce96cc4eadc3b0e84f1c2c31602eb929b10dbaff3c78fe671df31a741ce49',
     blockNumber: 60,
     gasUsed: 43665,
     cumulativeGasUsed: 43665,
     contractAddress: null,
     logs: [],
     status: 1 },
  logs: [] }

3. Repeat 1st step to register product

truffle(development)> res.addProduct(123, 1000, {from:web3.eth.accounts[1]})
{ tx: '0x618045d1465deca3c89f345dcad80b3d4bd7c6efe0761a4d3170fab2cc220bfd',
  receipt: 
   { transactionHash: '0x618045d1465deca3c89f345dcad80b3d4bd7c6efe0761a4d3170fab2cc220bfd',
     transactionIndex: 0,
     blockHash: '0x86cfc904cf2139b14fc7afc9367d74e685a35f7c7de3494bff83d6011bd84378',
     blockNumber: 61,
     gasUsed: 163650,
     cumulativeGasUsed: 163650,
     contractAddress: null,
     logs: [],
     status: 1 },
  logs: [] }

4. Repeat adding another product

truffle(development)> res.addProduct(456, 1000, {from:web3.eth.accounts[1]})
{ tx: '0x251a79abc74b2d9bab8f9f81d652effce2b0d212235333908898b4e603a815a2',
  receipt: 
   { transactionHash: '0x251a79abc74b2d9bab8f9f81d652effce2b0d212235333908898b4e603a815a2',
     transactionIndex: 0,
     blockHash: '0x7cf3abf364d9ea6eaed86c8544f8001c1fa53764164f12e7e65ecce6b5fd6b20',
     blockNumber: 62,
     gasUsed: 148714,
     cumulativeGasUsed: 148714,
     contractAddress: null,
     logs: [],
     status: 1 },
  logs: [] }


5. Check ownership of product id

truffle(development)> res.productOwnerCheck(web3.eth.accounts[1], 123)
true
truffle(development)> res.productOwnerCheck(web3.eth.accounts[1], 456)
true
truffle(development)> res.productOwnerCheck(web3.eth.accounts[1], 789)
false  //some unregsiterd product

6. Display the product so far

ruffle(development)> res.getProductCount()
BigNumber { s: 1, e: 0, c: [ 2 ] }
truffle(development)> 

7.  Equal amount of wei is sent ot purchase product

truffle(development)> res.buyProduct(123, {from:web3.eth.accounts[2], value: web3.toWei(1000, 'wei')})
{ tx: '0x18680f9f16d5ef543a64ce5e6f9055dd10155ee6403f5f14c184706576472ca7',
  receipt: 
   { transactionHash: '0x18680f9f16d5ef543a64ce5e6f9055dd10155ee6403f5f14c184706576472ca7',
     transactionIndex: 0,
     blockHash: '0x030b06dd48afc7fab68a9207a506565754038b991d79e0d1b470b8eabcde54d5',
     blockNumber: 63,
     gasUsed: 35454,
     cumulativeGasUsed: 35454,
     contractAddress: null,
     logs: [],
     status: 1 },
  logs: [] }


8. Send different amout for 2nd product purchase. 

ruffle(development)> res.buyProduct(456, {from:web3.eth.accounts[2], value: web3.toWei(10003, 'wei')})
Error: VM Exception while processing transaction: revert
    at XMLHttpRequest._onHttpResponseEnd (/usr/local/lib/n

9. Check the ownership for product 1

truffle(development)> res.productOwnerCheck(web3.eth.accounts[1], 123)
false
truffle(development)> res.productOwnerCheck(web3.eth.accounts[2], 123)
true
truffle(development)> 

Product ownership is changed from seller to buyer