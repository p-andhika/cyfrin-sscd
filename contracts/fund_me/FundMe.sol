// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import { PriceConverterLib } from './PriceConverterLib.sol';

contract FundMe {
    using PriceConverterLib for uint256;

    uint256 public constant MINIMUM_USD = 5e18; // 5e18 = 5 * (10 ** 18) = 5 * 1e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    // Get funds from users
    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough ETH"); // 1e18 = 1 ETH = 1 * 10 ** 18
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    // Withdraw funds
    function withdraw() public onlyOwner {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // reset the array
        funders = new address[](0);

        // actually withdraw the funds
        // there are 3 way:

        // // transfer way
        // payable(msg.sender).transfer(address(this).balance);

        // // send way
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

        // call way
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner() {
        require(msg.sender == i_owner, "Sender is not owner!");
        _;
    }

}