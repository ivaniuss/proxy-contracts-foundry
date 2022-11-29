// SPDX-License-Identifier: UNLINCESED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract Pair is Initializable{
    address public owner;
    uint256 public val;
    constructor(){
        owner = msg.sender;
    }

    function initialize(uint256 a) external initializer {
        val = a;
    }
}