// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract verifysign{

    function verify(address _signer,string memory _message,bytes memory _sig) 
    external  pure returns(bool){

        bytes32 messagehash = getmessagehash(_message);
        bytes32 ethsignedmessagehash= getethsignedmessagehash(messagehash);

        return recover(ethsignedmessagehash,_sig) == _signer;

    }


    function getmessagehash(string memory _message) public pure returns(bytes32){
        return keccak256(abi.encodePacked(_message));
    }

    function getethsignedmessagehash(bytes32  _messagehash) public pure returns(bytes32){
        return keccak256(abi.encodePacked("\x19 Ethereum Signed Message :\n32",_messagehash));
    }


    function recover(bytes32 _ethsignedmessagehash,bytes memory _sig) public pure returns(address){
        (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
        return ecrecover(_ethsignedmessagehash,v,r,s);
    }

    function _split(bytes memory _sig) internal pure returns(bytes32 r, bytes32 s, uint8 v){
        require(_sig.length == 65,"invalid length");
        /*
    1) _sig is a pointer which points the signature
    2) we use assembly here to store the values for r,,s,v by seperating them from signature    
    3) the first 32 bytes have length of the data so we need to ignore them
        */
        assembly{
            r := mload(add(_sig,32))//now the pointer points the 32 byte from the sig
            s := mload(add(_sig,64))
            v := byte(0,mload(add(_sig,96)))// as it requires only one byte
        }

    }


}