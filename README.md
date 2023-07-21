# Token Blender for steward tokens and Toucan NCT

@EthicHub](https://t.me/ethichub) is one of the very first ReFi and even DeFi protocols, helping smallholder farmers in developing economies since 2018 (coffee producers in 6 countries of latin america for now).

We started as a lending/collateral project but in order to reach them in a sustainable way we have to develop a more holistic approach so we are also helping them sell their crops and now we are working on a solution for carbon credits for them.

The problem is that it's almost impossible to measure the carbon as the value of these carbon credits is much smaller than the measurement cost.

As an alternative we are blending Toucan already certified and tokenized carbon credits with our farmers steward tokens to produce a premium carbon token. Whatever premium we get in the selling process is additional income for our farmers.

We may use later Celo SocialConnect or Account Abstraction, Polygon ID, Ethereum Attestation Service, and maybe other tools.

This contract has the purpose to simplify the carbon offsetting process.

What it does in more exact terms is it abstracts the process of retiring TCO2, which normally looks like so:

- user exchanges USDC for BCT/NCT tokens at one of the DEXs (Uniswap, Sushiswap, etc. depending on network)
- user interacts with the BCT/NCT token contract to redeem the tokens for TCO2
- user interacts with the TCO2 token contract to retire the TCO2

With the OffsetHelper contract, the user only needs to interact with the OffsetHelper contract, which will take care of the rest in a single transaction.

## Deployments

For current deployments, see the `./deployments` folder.

## OffsetHelper

The `OffsetHelper` contract implements helper functions that simplify the carbon offsetting (retirement) process.

See [./docs/OffsetHelper.md](./docs/OffsetHelper.md) for detailed documentation.

### Development

## Preqrequisites

1. Install the required packages:
   ```
   yarn
   ```
2. Copy `.env.example` to `.env` and modify values of the required environment variables:
   1. `POLYGON_URL`/`MUMBAI_URL` to specify custom RPC endpoints for Polygon Mainnet, respectively, the Mumbai Testnet.
   2. `PRIVATE_KEY` and `POLYGONSCAN_KEY` in order to deploy contract and publish source code on [polygonscan](https://polygonscan.com).

## Commands

```bash
# install dependencies
yarn install

# test the contract
yarn test

# generate documentation
yarn doc

# deploy the contract
yarn hardhat deploy --network <network>

# verify the contract
yarn hardhat verify:offsetHelper --network mumbai --address <address where Offset Helper was deployed>
```
