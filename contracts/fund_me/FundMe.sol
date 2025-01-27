// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import { PriceConverterLib } from './PriceConverterLib.sol';

contract FundMe {
    using PriceConverterLib for uint256;

    uint256 public minimumUsd = 5e18; // 5e18 = 5 * (10 ** 18) = 5 * 1e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    // Get funds from users
    function fund() public payable {
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough ETH"); // 1e18 = 1 ETH = 1 * 10 ** 18
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }
    // Withdraw funds
    // function withdraw() public {

    // }
}



// Set a minimum funding value in USD