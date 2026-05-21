// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../src/core/ObfuscatedRouter.sol";

contract DeployRouter {
    function run() external returns (address) {
        ObfuscatedRouter router = new ObfuscatedRouter();
        return address(router);
    }
}
