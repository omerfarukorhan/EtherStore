// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract FeeCollector { 
    address public owner;
    uint256 public balance;
    
    constructor() {
        owner = msg.sender; 
    }
    
    receive() payable external {
        balance += msg.value;
    }
    
    function withdraw(uint amount, address payable destAddr) onlyOwner 
requiredFund(amount) public {
        destAddr.transfer(amount);
        balance -= amount;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can withdraw");
        _;
    }

    modifier requiredFund(uint amount) {
        require(amount <= balance, "Insufficient funds"); 
        _;
    }
}
