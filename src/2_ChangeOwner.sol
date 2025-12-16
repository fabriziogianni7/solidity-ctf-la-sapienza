// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Goal: manage to Call win() 
// contract address on base sepolia: 0x02815e0077C2b2D1f236b75039552e01457c85Cd
contract ChangeOwner {
    address public owner;
    bool public solved;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address newOwner) external {
        require(tx.origin == owner, "Only owner");
        owner = newOwner;
    }

    function win() external {
        require(msg.sender == owner, "Not owner");
        solved = true;
    }
}