// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Collectible} from "../src/Collectible.sol";

contract CollectibleTest is Test {
    Collectible public collectible;

    function setUp() public {
        collectible = new Collectible();
    }

    function test_Transfer() public {
        collectible.transfer(0x1234567890123456789012345678901234567890);
    }

    function test_MarkPrice() public {
        collectible.markPrice(1 ether);
    }

    function test_Purchase() public {
        collectible.markPrice(1 ether);
        collectible.purchase{value: 1 ether}();
    }

    function testFuzz_MarkPrice(uint256 x) public {
        collectible.markPrice(x);
    }
}
