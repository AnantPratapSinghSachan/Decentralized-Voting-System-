const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  console.log("Deploying contract with the account:", deployer.address);

  const VotingSystem = await hre.ethers.getContractFactory("VotingSystem");
  const contract = await VotingSystem.deploy(); // ✅ No constructor args now

  await contract.deployed();

  console.log("VotingSystem deployed to:", contract.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
