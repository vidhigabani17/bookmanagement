const Migrations = artifacts.require("BookManagement");

module.exports = function(deployer){
	deployer.deploy(Migrations);
}
