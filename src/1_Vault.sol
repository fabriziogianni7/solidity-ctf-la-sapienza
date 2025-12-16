// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Goal: Drain the contract's ETH balance and call win
// deployed address on base sepolia: 0x198bd919126Ef47D5fD48B7eD9AE69Caaf186a60
contract Vault {
    mapping(address => uint256) public balances;
    bool public solved;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external {
        uint256 bal = balances[msg.sender];
        require(bal > 0, "No balance");

        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send");

        balances[msg.sender] = 0; 
    }

    function win() external {
        require(solved, "Not solved yet");
        solved = true;
    }

    receive() external payable {
        if (address(this).balance < 1 ether) {
            solved = true; // Flag captured when contract < 1 ETH
        }
    }
}