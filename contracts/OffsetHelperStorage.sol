//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "./CO2KEN_contracts/ToucanCarbonOffsets.sol";
import "./CO2KEN_contracts/pools/BaseCarbonTonne.sol";
import "./CO2KEN_contracts/pools/NCT.sol";
import "./CO2KEN_contracts/IToucanContractRegistry.sol";

contract OffsetHelperStorage is OwnableUpgradeable {
    mapping(string => address) public eligibleTokenAddresses;
    address public contractRegistryAddress =
        0x6739D490670B2710dc7E79bB12E455DE33EE1cb6;
    address private constant UNISWAP_V2_ROUTER =
        0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;

    constructor() {
        eligibleTokenAddresses[
            "BCT"
        ] = 0xf2438A14f668b1bbA53408346288f3d7C71c10a1;

        eligibleTokenAddresses[
            "NCT"
        ] = 0x450471CC47FCB7A523DE90b64b98e47b66e27e49;

        eligibleTokenAddresses[
            "USDC"
        ] = 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174;

        eligibleTokenAddresses[
            "WETH"
        ] = 0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619;

        eligibleTokenAddresses[
            "WMATIC"
        ] = 0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270;
    }

    // @description you can use this to change or add eligible tokens and their addresses if needed
    // @param _tokenSymbol symbol of the token to add
    // @param _address the address of the token to add
    function setEligibleTokenAddress(
        string memory _tokenSymbol,
        address _address
    ) public virtual onlyOwner {
        eligibleTokenAddresses[_tokenSymbol] = _address;
    }

    // @description you can use this to delete eligible tokens  if needed
    // @param _tokenSymbol symbol of the token to add
    function deleteEligibleTokenAddress(string memory _tokenSymbol)
        public
        virtual
        onlyOwner
    {
        delete eligibleTokenAddresses[_tokenSymbol];
    }

    // @description you can use this to change the TCO2 contracts registry if needed
    // @param _address the contract registry to use
    function setToucanContractRegistry(address _address)
        public
        virtual
        onlyOwner
    {
        contractRegistryAddress = _address;
    }
}
