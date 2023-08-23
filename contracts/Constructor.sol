//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Constructor{
    string public tokenName;
    uint public totalSupply;

    /*constructor(string memory name, uint number){
        tokenName = name;
        totalSupply = number;
    }*/

    function set(uint number) public {
        totalSupply = number;
    }

    // constant, immutable : Bu iki kelime ile bir değişkeni işaretlersek bu değişken değeri bir daha değişmeyecek yani sabit
    // constant olursa direk değişkeni tanımladığımız yerde set ediyoruz amaa.
    // immutable olursa en başta set etmek yerine constructor'da dışarıdan gelen değere göre setliyoruz.

    uint public constant number = 10;

    /*function set2(uint num) public{
        number = num;
    }*/

    //uint public immutable number2;

    /*constructor(uint newNum){
        number2 = newNum;
    }

    function set3(uint newNumber) public{
        number2 = newNumber;
    }*/

    address public immutable owner;

    constructor(){
        owner = msg.sender;
    }
}