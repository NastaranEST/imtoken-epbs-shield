// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../interfaces/IEpbsEvents.sol";

abstract contract ShieldGovernor is IEpbsEvents {
    address public shieldGovernor;

    modifier onlyGovernor() {
        require(msg.sender == shieldGovernor, "AUTH_GOVERNOR_RESTRICTION_VIOLATION");
        _;
    }

    constructor() {
        shieldGovernor = msg.sender;
    }

    function transferShieldGovernance(address newGovernor) external onlyGovernor {
        require(newGovernor != address(0), "INVALID_GOVERNOR_ADDRESS");
        shieldGovernor = newGovernor;
        emit GovernanceUpgraded(newGovernor);
    }
}
