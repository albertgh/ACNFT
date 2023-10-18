# ACNFT Project

## Prerequisites

- Ensure you have [Node.js](https://nodejs.org/) installed. This project was last tested with Node v18.17.1.
- [Truffle](https://www.trufflesuite.com/) is used for smart contract compilation and deployment. This project was last tested with Truffle v5.11.4 (core: 5.11.4).
- Solidity compiler version used is 0.8.13 (solc-js).

## Setup

1. First, make sure you have `npm` and `truffle` installed. You can install Truffle using npm:
    ```bash
    npm install -g truffle
    ```

2. Install the necessary npm packages:
    ```bash
    npm install @openzeppelin/contracts
    ```

3. Compile all smart contracts:
    ```bash
    truffle compile --all
    ```

## Deployment

You can deploy your smart contracts using Truffle or choose an alternative platform for deployment.

To deploy using Truffle, follow the [official Truffle deployment guide](https://www.trufflesuite.com/docs/truffle/getting-started/running-migrations).


## Last Tested Versions

- Node v18.17.1
- Solidity - 0.8.13 (solc-js)
- Truffle v5.11.4 (core: 5.11.4)
