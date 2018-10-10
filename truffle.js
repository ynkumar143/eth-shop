
var HDWalletProvider = require("truffle-hdwallet-provider");

var infura_apikey = "8968b8c3167b44ff8c0387bae8241558";
var mnemonic = "wait easily guard wet immense exile club card turtle antenna express laptop";



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
