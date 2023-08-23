//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mapping{
    mapping(address => bool) public registered;
    mapping(address => int256) public favNums;

    // require usage for example : https://codedamn.com/news/solidity/what-is-require-in-solidity
    // require(koşul(must), message(optional))). --> Koşul : fonksiyona devam edecek tek koşul olmalı, bu koşul sağlanmaz ise fonksiyondan error mesajı fırlatılır. Message : Hata mesajı yazmak için kullanılır.

    function register(int256 _favNum) public{
        //require(!registered[msg.sender], "Kullanıcınız daha önce kayıt yaptı.")
        require(!isRegistered(), "User has registered before.");
        registered[msg.sender] = true;
        favNums[msg.sender] = _favNum;
    }

    function isRegistered() public view returns(bool) {
        return registered[msg.sender];
    }

    function deleteRegistered() public {
        require(isRegistered(), "User does not register.");
        delete(registered[msg.sender]);
        delete(favNums[msg.sender]);
    }
}

contract NestedMapping{
    // İlk mappingdeki adres benim adresim olsun ve içerdeki mappingdeki adres ile bana borçlu olanların adresi olsun ve bana uint256 değeride bana olan borç miktarı olsun.
    mapping(address => mapping(address => uint256)) public debts;

    // Borç arttırma
    function incDebt(address _borrower, uint256 _amount) public {
        debts[msg.sender][_borrower] += _amount;
    }

    // Borç düşürme
    function decDebt(address _borrower, uint256 _amount) public {
        require(debts[msg.sender][_borrower] >= _amount, "Not enough debt.");
        debts[msg.sender][_borrower] -= _amount;
    }

    // Borç görüntüleme
    function getDebt(address _borrower) public view returns(uint256){
        return debts[msg.sender][_borrower];
    }
}