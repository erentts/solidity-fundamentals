// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Functions{

    uint public luckyNumber = 7;

    function showNumber() public view returns(uint){
        return luckyNumber;
    }

    function setNumber(uint newNumber) public {
        luckyNumber = newNumber;
    }

    function nothing() public pure returns(uint,bool,bool){
        return (5,true,false);
    }

    function nothing2() public pure returns(uint x,bool y,bool z){
        x = 1;
        y = false;
        z = true;
    }

    function add(uint a, uint b) public view returns(uint){
        return a+b+block.timestamp;
    }

    function add2(uint a, uint b) public pure returns(uint){
        return a+b;
    }

    function publicKeyword() public pure returns(string memory){
        return "This is a public function.";
    }

    function callPublicKeyword() public pure returns(string memory){
        return publicKeyword();
    }

    // Private : Bu fonksiyona sadece bu kontrat ulaşabilir. Dışarıdan kimse bu fonksiyona ulaşamaz.

    function privateKeyword() private pure returns(string memory){
        return "This is a private function.";
    }

    function callPrivateKeyword() public pure returns(string memory){
        return privateKeyword();
    }

    // Internal : Sadece miras alan kontratlar bu fonksiyonu çağırabilir. Dışarıdan kullanıcı çağıramaz.

    function internalKeyword() internal pure returns(string memory){
        return "This is internal function.";
    }

    function callInternalKeyword() public pure returns(string memory){
        return internalKeyword();
    }

    // External : Dışarıdan kullanıcılar çağırabilir fakat kontrat içerisinde çağırılmaz.

    function externalKeyword() external pure returns(string memory){
        return "This is external function.";
    }

    function callExternalKeyword() public pure returns(string memory){
        return externalKeyword();
    }
}