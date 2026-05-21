// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../interfaces/IObfuscatedRouter.sol";
import "../crypto/Verifiers.sol";
import "../governance/EmergencyHalt.sol";
import "./BaseStorage.sol";

contract ObfuscatedRouter is IObfuscatedRouter, Verifiers, EmergencyHalt, BaseStorage {
    
    constructor() ShieldGovernor() {}

    function dispatchBlindedPayload(
        BlindedPayload calldata payload
    ) external payable override whenNotHalted returns (bytes32) {
        require(payload.commitmentHash != bytes32(0), "INVALID_COMMITMENT_ROOT");
        require(msg.value > 0, "INSUFFICIENT_FUNDS_FOR_GAS_ESCROW");

        _activeShieldedRegistries[payload.commitmentHash] = true;
        _escrowedGasBids[payload.commitmentHash] = msg.value;

        emit PayloadShielded(payload.commitmentHash, payload.targetChainIdentifier, msg.value);
        return payload.commitmentHash;
    }

    function settleShieldedRoute(
        bytes32 commitment,
        uint256 clearValue,
        uint256 blindingFactor
    ) external override whenNotHalted returns (bool) {
        require(_activeShieldedRegistries[commitment], "TARGET_COMMITMENT_NOT_FOUND");
        
        bool isProofValid = verifyCommitmentInvariants(commitment, clearValue, blindingFactor);
        require(isProofValid, "CRYPTOGRAPHIC_PROOF_FAIL");

        _activeShieldedRegistries[commitment] = false;
        uint256 structuralPayout = _escrowedGasBids[commitment];
        _escrowedGasBids[commitment] = 0;

        payable(msg.sender).transfer(structuralPayout);

        emit PayloadSettled(commitment, msg.sender, true);
        return true;
    }

    receive() external payable {}
}
