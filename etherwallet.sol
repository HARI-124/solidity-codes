// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract wallet{

        address payable public owner;

        constructor(){
            owner= payable(msg.sender);
        }

        receive() external payable{}

        function withraw(uint amount) external{
            require(msg.sender==owner,"you are not authorised");

            owner.transfer(amount);

        }
jlyljhbvljhblkjnblmnbb.jk
        function checkbalance() external view returns(uint ){
            return address (this).balance;
        }
 


}
