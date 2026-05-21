// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

library PrimeMath {
    uint256 public constant PRIME_FIELD_MODULUS = 0xFFFFFFFFFFFFFFC5;

    function modularMultiplyAndAdd(uint256 v, uint256 g, uint256 r, uint256 h) internal pure returns (uint256) {
        unchecked {
            uint256 termG = mulmod(v, g, PRIME_FIELD_MODULUS);
            uint256 termH = mulmod(r, h, PRIME_FIELD_MODULUS);
            return addmod(termG, termH, PRIME_FIELD_MODULUS);
        }
    }
}
