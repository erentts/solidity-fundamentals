//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
           Kontrat           <----                  Kontrata yapılan çağrı
           -------                                      -------------
    Kontrat depolama alanı           Fonksiyon için ayrılan hafıza ve çağrıdaki data alanı

    memory:          Geçici hafıza
    storage:         Kalıcı hafıza
    calldata:        Çağrıdaki argümanlar

    bytes, string, array, struct

    * Değer tipleri (uint, int, bool, bytes32) kontrat üzerinde storage, 
      fonksiyon içinde memory'dir
    
    * mapping'ler her zaman kontrat üzerinde tanımlanır ve storage'dadır.
*/

struct Student{
    uint8 age;
    uint16 score;
    string name;
}

contract School{
    uint256 totalStudents = 0;   // storage
    mapping(uint256 => Student) students;  // storage

    function addStudent(string calldata name,uint8 age, uint16 score) external{
        uint256 currentId = totalStudents++;
        students[currentId] = Student(age,score,name);
    }

    function changeStudentInfoStorage(uint256 id,string calldata newName,uint8 newAge,uint16 newScore) external{
        Student storage currentStudent = students[id];

        currentStudent.name = newName;
        currentStudent.age = newAge;
        currentStudent.score = newScore;
    }

    function changeStudentInfoMemory(uint256 id,string calldata newName,uint8 newAge,uint16 newScore) external view{
        Student memory currentStudent = students[id];

        currentStudent.name = newName;
        currentStudent.age = newAge;
        currentStudent.score = newScore;
    }

    function getStudentName(uint256 id) external view returns(string memory){
        return students[id].name;
    }
}