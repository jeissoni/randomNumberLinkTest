import { task } from "hardhat/config";
import "@nomiclabs/hardhat-waffle";
require('dotenv').config()



const projeId=process.env.INFURA_PROJECT_ID
const privateKey = process.env.DEPLOYER_SIGNER_PRIVATE_KEY


task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});



module.exports = {
  solidity: "0.8.7",

  defaultNetwork: "hardhat",

  networks:{

    // hardhat:{
    //   forking:{
    //     url: `https://rinkeby.infura.io/v3/${projeId}`
    //   }
    // },
    hardhat: {
    },

    rinkeby:{
      url:`https://rinkeby.infura.io/v3/${projeId}`,
      accounts:[
        privateKey
      ]
    }
  },

  mocha: {
    timeout: 3000000
  }

};
