const {ethers, defender} = require("hardhat");

async function main() {
  const REAT = await ethers.getContractFactory('REAT')

  const upgradeApprovalProcess = await defender.getUpgradeApprovalProcess();

  if (upgradeApprovalProcess.address === undefined) {
    throw new Error(`Upgrade approval process with id ${upgradeApprovalProcess.approvalProcessId} has no assigned address`);
  }

  const deployment = await defender.deployProxy(REAT, [upgradeApprovalProcess.address]);

  await deployment.waitForDeployment();

  console.log(`contract deployed to ${await deployment.getAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
