// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IVerifiers {
    function verifyCommitmentInvariants(bytes32 claimHash, uint256 clearValue, uint256 blindingFactor) external pure returns (bool);
}
