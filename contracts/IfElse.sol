//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IfElse {

    // Stringleri doğrudan karşılaştıran method solidity'de yok bu yüzden stringlerin hashlerini alıp bu hashleri karşılaştırarak yapıyoruz.
    bytes32 private hashedPassword;
    uint private loginCount;

    constructor(string memory _password){
        hashedPassword = keccak256(abi.encode(_password));
    }

    function login(string memory _password) public view returns (bool){
        return hashedPassword == keccak256(abi.encode(_password));

        // Aşağıdaki İf koşulu yazıpta gönderebilirdik ama if else kullandığımız için daha fazla fee keserdi.
        // Bu nedenle yukarıdaki daha verimli..

        /*if(hashedPassword == keccak256(abi.encode(_password))){
            return true;
        }else{
            return false;
        }*/
    }

    function loginlogin(string memory _password) public returns(uint256){
        loginCount++;
        return (hashedPassword == keccak256(abi.encode(_password))) ? 1 : 0;
    }

    function loginStatus() public view returns(uint256){
        if(loginCount == 0){
            return 0;
        }
        else if(loginCount > 0 && loginCount != 1){
            return 1;
        }
        else if(loginCount == 1){
            return 2;
        }
        else{
            return 3;
        }
    }

}