// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Goal: Drain all ETH
// contract address on base sepolia: 0x4F2557700117852414f559468bbA409df1b47469
contract DonationChallenge {
    mapping(address => uint256) public donationAmount;
    mapping(address => uint256) public lastDonationTime;
    address public leader;
    uint256 public totalDonations;
    bool public solved;

    function donate() external payable {
        require(msg.value >= 0.1 ether, "Min 0.1 ETH");

        donationAmount[msg.sender] += msg.value;
        lastDonationTime[msg.sender] = block.timestamp;

        totalDonations += msg.value;

        if (donationAmount[msg.sender] > donationAmount[leader]) {
            leader = msg.sender;
        }
    }

    // Anyone can trigger payout to "leader", 50% of donations go to leader as a reward
    function claimReward() external {
        address payable recipient = payable(leader);
        uint256 reward = address(this).balance / 2;

         (bool sent, ) = recipient.call{value: reward}("");

    }

    function win() external {
        require(address(this).balance == 0, "Drained!");
        solved = true;
    }

    receive() external payable {}
}