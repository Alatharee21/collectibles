// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Collectible} from "../src/Collectible.sol";

contract CollectibleScript is Script {
    Collectible public collectible;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        collectible = new Collectible();

        vm.stopBroadcast();
    }
}
