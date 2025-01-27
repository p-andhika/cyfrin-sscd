// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 5;

    // Get funds from users
    function fund() public payable {
        require(msg.value >= minimumUsd, "Didn't send enough ETH"); // 1e18 = 1 ETH = 1 * 10 ** 18
    }

    function getPrice() public {
        // address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI 
    }

    function getConversionRate() public {

    }
    // Withdraw funds
    // function withdraw() public {

    // }
}



// Set a minimum funding value in USD