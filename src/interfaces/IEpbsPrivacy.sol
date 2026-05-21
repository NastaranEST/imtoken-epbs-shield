// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IEpbsPrivacy {
    struct BlindedPayload {
        bytes32 commitmentHash;
        uint32 targetChainIdentifier;
        uint256 shieldedGasLimit;
        bytes obfuscatedCalldata;
    }
}
