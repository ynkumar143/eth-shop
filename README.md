# cashBack
   In this example if you send ether to smart contract address, smart contract address will take half and another internal transaction will initate for sending back other half of ether. 

Network is designed in flexible to deploy on both ropsten and development environment. 

npm install

truffle compile

modify the mnemoic key present in truffle.js according to your infura api key created specific with your mail address. 

truffle migrate --network ropsten 

Use metamask for performing operations like sending amount of ethere. 

Use Ropsten Explorer to view the transaction information 

Ropsten Deployed address - 0xe7439a3616badff7b8d8165dedc9f3467fad6c2a

Explorer : https://ropsten.etherscan.io/address/0xe7439a3616badff7b8d8165dedc9f3467fad6c2a

Fallback function 

1. For execution of fallback function the current smart contract will utilize 2300 gas usage. 


The usage of transfer() instead of using send()  in old versions because any failure in out of gas is deteced and displays to the user that call back funciton is not processed successfully. 

There is another way of sending the amount back in callback function which is    

     _receiver.call.value(msg.value).gas(*)();

     * - represents amount of gas would like to send for approving transactions. 



But the approach is not safe against re-entrency. For more details. "https://medium.com/@gus_tavo_guim/reentrancy-attack-on-smart-contracts-how-to-identify-the-exploitable-and-an-example-of-an-attack-4470a2d8dfe4"
