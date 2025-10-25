# Degree Verification Smart Contract

This project contains a Solidity smart contract for degree verification and a Hardhat setup to compile, test, and deploy it locally.

---

## Prerequisites

- Node.js (v18+ recommended)
- npm (comes with Node.js)
- Git (for version control, optional)

**Project Structure**
degree-verification/
├─ contracts/          # Solidity contracts (.sol)
│  └─ DegreeVerification.sol
├─ scripts/            # Deployment scripts (.js or .ts)
│  └─ deploy.js
├─ hardhat.config.js   # Hardhat configuration
├─ package.json        # Node.js project file
└─ README.md           

## Project Setup

1. **Initialize project:**
```
npm init -y
```

2. **Install Hardhat & TypeScript support:**
```
npm install --save-dev hardhat@^2.17.0 typescript ts-node @types/node
```

3. **Install Ethers.js, Waffle & Testing tools::**
```
npm install --save-dev @nomiclabs/hardhat-waffle@^2.0.3 @nomiclabs/hardhat-ethers@^2.0.5 ethers@^5.7.0 chai @types/chai @types/mocha
```


4. **Compile smart contracts:**
```
npx hardhat compile
```


5. **Start a local blockchain:**
```
npx hardhat node
```


6. **Deploy the contract:**
```
npx hardhat run scripts/deploy.js --network localhost
```


**Expected Output:**
Deploying contracts with account: 0x...
DegreeVerification deployed at: 0x...

