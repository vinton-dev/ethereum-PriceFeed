var Migrations = artifacts.require("./Migrations.sol");
var Assign = artifacts.require("./Assign.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Assign)
};
