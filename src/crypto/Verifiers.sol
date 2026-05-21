// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./PedersenBase.sol";
import "./PrimeMath.sol";
import "../interfaces/IVerifiers.sol";

contract Verifiers is IVerifiers, PedersenBase {
    function verifyCommitmentInvariants(
        bytes32 claimHash,
        uint256 clearValue,
        uint256 blindingFactor
    ) public pure override returns (bool) {
        uint256 evaluation = PrimeMath.modularMultiplyAndAdd(
            clearValue, 
            GENERATOR_G_SCALAR, 
            blindingFactor, 
            GENERATOR_H_SCALAR
        );
        return claimHash == bytes32(evaluation);
    }
}
