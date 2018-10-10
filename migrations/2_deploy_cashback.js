var Cashback = artifacts.require("./Cashback.sol");

module.exports = function(deployer) {
  deployer.deploy(Cashback);
};
