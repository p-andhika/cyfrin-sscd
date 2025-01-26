// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract FundMe {
    // Get funds from users
    function fund() public payable {
        require(msg.value > 1e18, "Didn't send enough ETH"); // 1e18 = 1 ETH = 1 * 10 ** 18
    }

    // Withdraw funds
    // function withdraw() public {

    // }
}



// Set a minimum funding value in USD