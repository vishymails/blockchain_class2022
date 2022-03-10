pragma solidity ^0.4.18;

contract Owned {
    address owner;

    function Owned() public {
        owner = msg.sender;
    }

   modifier onlyOwner {
       require(msg.sender == owner);
       _;
   }
}

// is Owned added
contract CoursesWithInheritance is Owned {

    struct Student {
        uint age;
        bytes16 fName;
        bytes16 lName;
    }

    mapping (address => Student) students;
    address[] public studentAccts;

     event studentInfo(
       bytes16 fName,
       bytes16 lName,
       uint age
    );

    // onlyOwner is added
    function setStudent(address _address, uint _age, bytes16 _fName, bytes16 _lName) onlyOwner public {
        var student = students[_address];

        student.age = _age;
        student.fName = _fName;
        student.lName = _lName;

        studentAccts.push(_address) -1;
        studentInfo(_fName, _lName, _age);
    }

    function getStudents() view public returns(address[]) {
        return studentAccts;
    }

    function getStudent(address _address) view public returns (uint, bytes16, bytes16) {
        return (students[_address].age, students[_address].fName, students[_address].lName);
    }

    function countStudents() view public returns (uint) {
        return studentAccts.length;
    }

}
