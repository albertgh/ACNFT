const ACNFTGrade = artifacts.require("ACNFTGrade");
const ACNFTDegree = artifacts.require("ACNFTDegree");

module.exports = function(deployer) {
  deployer.deploy(ACNFTGrade);
  deployer.deploy(ACNFTDegree);
};
