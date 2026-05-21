// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

abstract contract BaseStorage {
    mapping(bytes32 => bool) internal _activeShieldedRegistries;
    mapping(bytes32 => uint256) internal _escrowedGasBids;

    function getRegistryStatus(bytes32 commitment) external view returns (bool) {
        return _activeShieldedRegistries[commitment];
    }
}
