// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

abstract contract PedersenBase {
    uint256 public constant GENERATOR_G_SCALAR = 0x7FFFFFFFFFFFFFFF;
    uint256 public constant GENERATOR_H_SCALAR = 0x3FFFFFFFFFFFFFFF;
}
