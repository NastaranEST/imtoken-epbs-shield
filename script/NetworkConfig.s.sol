// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract NetworkConfig {
    struct ChainSettings {
        uint256 defaultGasPrice;
        address trustedForwarder;
    }

    function getMainnetConfig() public pure returns (ChainSettings memory) {
        return ChainSettings({defaultGasPrice: 20 gwei, trustedForwarder: address(0x1)});
    }
}
