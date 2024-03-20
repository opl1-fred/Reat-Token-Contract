const {ethers, defender} = require("hardhat");

async function main() {
  const REATV2 = await ethers.getContractFactory("REATV2");

  const proposal = await defender.proposeUpgradeWithApproval(process.env.DEPLOYED_CONTRACT_ADDRESS, REATV2);

  console.log(`Upgrade proposed with URL: ${proposal.url}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});