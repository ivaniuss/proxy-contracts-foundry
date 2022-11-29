// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/proxy/Clones.sol";
contract PairFactory {
    address public implementation;
    mapping(uint256 => address) public pairs;
    uint256 public pairsCounter; 

    event NewPair(address indexed pair);
    constructor(address _implementation){
        implementation = _implementation;
        pairsCounter = 1;
    }

    function createPair() external {
        uint256 currentCounter = pairsCounter++;
        address impl = Clones.clone(implementation);
        pairs[currentCounter] = impl; 
        emit NewPair(impl);
    }
}