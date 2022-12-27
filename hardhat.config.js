require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
    goerli: {
      url: [GOERLI_SERVICE_PROVIDERS_URL],
      accounts: [ACCOUNTS_PRIVATE_KEY],
    },
  },
};
