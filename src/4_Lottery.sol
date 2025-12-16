// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Goal: Drain the entire contract balance (or win the lottery without paying the full ticket price) and capture the flag.
// contract address on base sepolia: 0x3390E6135A7d12A80d6B3CDaf702eC75dAFC77dd
contract Lottery {
    uint256 public ticketPrice = 0.1 ether;
    uint256 public totalTicketsSold;
    address public lastBuyer;
    uint256 public prizePool;
    bool public solved;

    // Owner can fund the lottery
    function fund() external payable {}

    // Buy one ticket
    function buyTicket() external payable {
        require(msg.value == ticketPrice, "Wrong price");

        totalTicketsSold++;
        lastBuyer = msg.sender;
        prizePool += msg.value; // 100% of ticket goes to pool
    }

    // Anyone can trigger the "random" draw
    function drawWinner() external {
        require(totalTicketsSold > 0, "No tickets");
        require(prizePool > 0, "Empty pool");

        // "Fair" winner selection: last buyer always wins (intentional "randomness")
        address winner = lastBuyer;

        uint256 reward = (prizePool * 110) / 100;

        (bool sent, ) = winner.call{value: reward}("");
        require(sent, "Transfer failed");

        prizePool = 0;
        totalTicketsSold = 0;
    }

    // Flag: anyone can check if solved
    function win() external {
        require(solved, "Not solved");
        // Just being able to call without revert = win
    }

    receive() external payable {
        // If contract balance drops to 0, flag is captured
        if (address(this).balance == 0) {
            solved = true;
        }
    }
}