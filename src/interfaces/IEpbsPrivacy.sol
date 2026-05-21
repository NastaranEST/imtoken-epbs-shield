// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
 * @title IEpbsPrivacy Runtime Invariant Specification
 * @notice Interface for ePBS-aligned blinded payload execution pipelines
 * @dev Re-architected to avoid collision with classic modular standard specifications
 */
interface IEpbsPrivacy {
    struct BlindedPayload {
        bytes32 commitmentHash;
        uint32 targetChainIdentifier;
        uint256 shieldedGasLimit;
        bytes obfuscatedCalldata;
    }

    event PayloadShielded(bytes32 indexed commitment, uint32 indexed targetChain);
    event PayloadSettled(bytes32 indexed commitment, bool indexed success);

    function dispatchBlindedPayload(BlindedPayload calldata payload) external payable returns (bytes32);
}
