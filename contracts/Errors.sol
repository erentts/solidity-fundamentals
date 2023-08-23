//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Errors{
    
    uint256 public totalBalance;
    mapping(address => uint256) public userBalances;

    error ExceedingAmount(address user, uint256 exceedingAmount);
    error Deny(string reason);

    receive() external payable{
        revert Deny("No direct payments.");
    }

    fallback() external payable{
        revert Deny("No direct payments.");
    }

    function deposit() noZero(msg.value) external payable{
        require(msg.value == 1 ether, "Only payments in 1 ether");

        totalBalance += 1 ether; // 1e18
        userBalances[msg.sender] += 1 ether; // 10000.0000
    }

    function withdraw(uint256 _amount) noZero(_amount) external{

        uint256 initialBalance = totalBalance;

        if(userBalances[msg.sender] < _amount){
            //revert("Insufficient balance.")
            revert ExceedingAmount(msg.sender, _amount - userBalances[msg.sender]);
        }

        totalBalance -= _amount;
        userBalances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);

        assert(totalBalance < initialBalance);
    }

    modifier noZero(uint256 _amount){
        require(_amount != 0, "Amount should be greater than zero");
        _;
    }
}