// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./IEpbsPrivacy.sol";

interface IObfuscatedRouter is IEpbsPrivacy {
    function dispatchBlindedPayload(BlindedPayload calldata payload) external payable returns (bytes32);
    function settleShieldedRoute(bytes32 commitment, uint256 clearValue, uint256 blindingFactor) external returns (bool);
}
