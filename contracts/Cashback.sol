pragma solidity ^0.4.23;

contract Cashback {

//constructor funciton to initialize contract
  constructor() public{

  }

 //Safely dividing the two values and returning uint256 value
 function div(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b > 0);
    uint256 c = a / b;
    return c;
  }

  function() public payable{
      //The amount that is recieving should be greater than 0(Otherwise it will revert back)
      require(msg.value > 0);
      msg.sender.transfer(div(msg.value, 2));
  }
}