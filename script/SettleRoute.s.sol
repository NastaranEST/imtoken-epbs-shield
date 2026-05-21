// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../src/core/ObfuscatedRouter.sol";

contract SettleRoute {
    function executeSettlement(address routerAddress, bytes32 commitment, uint256 val, uint256 blind) external {
        ObfuscatedRouter(payable(routerAddress)).settleShieldedRoute(commitment, val, blind);
    }
}
