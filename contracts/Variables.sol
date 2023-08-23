// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Variables {

    // state variables
    string public bestName = "eren";

    function show() public view returns(string memory){
        return bestName;
    }

    bool isTrue = false;

    int8 number = 12; // int256    -2^256 to 2^256
    uint number2 = 12; // 0 to 2^256

    address myAddress = 0xF221a860e83954601791614D60Eb107DcA2FE598;
    bytes32 name1 = "marcus rashford";

    string name2 = "itu blockchain";
    bytes name3 = "itu bsc";

    uint[] arr = [1,2,3,4,5];
    mapping(address => uint) listt;

    
    //listt[0xF221a860e83954601791614D60Eb107DcA2FE598] = 3;

    // User Defined Value Types
    /*struct Human{
        uint ID;
        string name;
        uint age;
        address addresss;
    }

    Human person1;
    person1.ID = 2323232323;
    person1.name = "eren";
    person1.age = 25;
    person1.addresss = 0xF221a860e83954601791614D60Eb107DcA2FE598;

    enum trafficLight{
        RED,
        YELLOW,
        GREEN
    }

    trafficLight.RED*/
}