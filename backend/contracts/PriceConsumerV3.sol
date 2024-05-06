// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {

    AggregatorV3Interface internal priceFeed;
    int public storedPrice;

    /**
     * Network: Holesky
     * Aggregator: ETH/USD
     * Address: 0x246Bc1ca92c01D3aB062D0549Fb34373f195Aa98
     */
    constructor() {
        priceFeed = 
AggregatorV3Interface(0x246Bc1ca92c01D3aB062D0549Fb34373f195Aa98);
    }

    /**
     * Returns the latest price
     */
    function getLatestPrice() public view returns (int) {
        (
            /*uint80 roundID*/,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        return price;
    }

    function storeLatestPrice() external {
        storedPrice = getLatestPrice();
    }
}