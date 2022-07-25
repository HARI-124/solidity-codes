// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract counterr{
    uint public count;

    function inc() external{// as we are modifying the blockchain so view or pure is not required
         count+=1;
    }
     function dec() external{// we are modifying the state variale count which is stored in the blockcahin

         count-=1;
    }

    
}