
var HDWalletProvider = require("truffle-hdwallet-provider");

var infura_apikey = "your api key";
var mnemonic = "your mnemoic key";



module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: "8545",
      gas: "4600000",
      //from: jsonDataSMDEV.dev.AccountAddress,
      network_id: "*" // Match any network id
    },
    ropsten: {
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/"+infura_apikey),
      network_id: 3
    }
  }
};
