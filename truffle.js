
module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: "8545",
      gas: jsonDataSMDEV.dev.GasLimit,
      from: jsonDataSMDEV.dev.AccountAddress,
      network_id: jsonDataSMDEV.dev.NetworkID // Match any network id
    }
  }
};
