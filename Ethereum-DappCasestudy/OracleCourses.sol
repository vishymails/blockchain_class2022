pragma solidity ^0.4.18;

contract Courses {

  string fName;
  uint age;


  function setStudent(string _fName, uint _age) public {
    fName = _fName;
    age = _age;
  
  }

  function getStudent() public constant returns (string, uint) {
    return (fName, age);
  }
}
