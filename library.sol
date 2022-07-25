// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


library tools{
    function find(uint[] storage ar,uint x) internal view returns(uint){
        for(uint i=0;i<ar.length;i++){
            if(ar[i]==x) return i;
        }
        revert("Not found");
    }

}

contract a{

    using tools for uint[];
    uint[] arr=[1,2,3,4,5,6,7,8,9];

    function findindex(uint x) external view returns(uint){
        return arr.find(x);
    }


}


