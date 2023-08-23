//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {

    mapping(address => uint) balances;
    
    function sendEtherToContact() payable external {
        balances[msg.sender] = msg.value;
    }

    function showBalance() external view returns(uint){
        return balances[msg.sender];
    }

    // Transfer

    function withdraw() external{
        payable(msg.sender).transfer(balances[msg.sender]);
        balances[msg.sender] = 0;
    }

    function withdraw2(address payable to, uint amount) external{
        require(balances[msg.sender] >= amount, "Insufficient Balance !");
        to.transfer(amount);
        balances[msg.sender] -= amount;
    }

    // Send

    function withdraw3(address payable to, uint amount) external returns(bool){
        require(balances[msg.sender] >= amount, "Insufficient Balance !");
        bool ok = to.send(amount);
        balances[msg.sender] -= amount;
        return ok;
    }

    // Call

    function withdraw4(address payable to, uint amount) external returns(bool){
        require(balances[msg.sender] >= amount, "Insufficient Balance !");
        (bool sent,) = to.call{value:amount}("Optional message");
        balances[msg.sender] -= amount;
        return sent;
    }

    // Metoda ether gönderdiğimizde yukarıdaki fonksiyonları kullandık ama direk contract'a ether yollayacaksak;
    // Receive ve Fallback kullanıyoruz.

    // Receive

    uint public receiveCount = 0;
    receive() external payable{
        receiveCount += 1;
    }

    // Fallback
    uint public fallbackCount = 0;
    fallback() external payable{
        fallbackCount += 1;
    }
}