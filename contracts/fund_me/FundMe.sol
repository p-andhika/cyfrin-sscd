// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract FundMe {
    uint256 public minimumUsd = 5;

    // Get funds from users
    function fund() public payable {
        require(msg.value >= minimumUsd, "Didn't send enough ETH"); // 1e18 = 1 ETH = 1 * 10 ** 18
    }

    // Withdraw funds
    // function withdraw() public {

    // }
}



// Set a minimum funding value in USD