require("@nomicfoundation/hardhat-toolbox");
require('@openzeppelin/hardhat-upgrades');

require("dotenv").config();

module.exports = {
  solidity: "0.8.24",
  defender: {
    apiKey: process.env.DEFENDER_KEY,
    apiSecret: process.env.DEFENDER_SECRET,
    useDefenderDeploy: true,
  },
  networks: {
    sepolia: {
      chainId: 11155111,
      url: "https://rpc.ankr.com/eth_sepolia",
    },
    mainnet: {
      chainId: 1,
      url: "https://rpc.ankr.com/eth",
    }
  }
};
