// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/minimalProxy/Pair.sol";
import "../src/minimalProxy/PairFactory.sol";
contract MinimalProxyTest is Test {

    Pair public pair;
    PairFactory public pairFactory;
    address public owner;
    function setUp() public {
        pair = new Pair();
        pairFactory = new PairFactory(address(pair));
        owner = vm.addr(1);
        vm.label(owner, "ivan");
        vm.deal(owner, 100 ether);
    }

    function testIncrement() public {
        vm.startPrank(owner);
        pairFactory.createPair();
        assertEq(pairFactory.implementation(), address(pair));
        assertEq(pair.owner(), address(this));
        address pair1 = pairFactory.pairs(1);
        emit log_named_uint("original pair val", pair.val());
        emit log_named_address("pair1 owner", Pair(pair1).owner());
        Pair(pair1).initialize(6);
        emit log_named_uint("pair1 val", Pair(pair1).val());
        assertEq(Pair(pair1).val(), 6);
    }
}
