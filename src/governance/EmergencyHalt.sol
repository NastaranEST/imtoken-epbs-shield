// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./ShieldGovernor.sol";

abstract contract EmergencyHalt is ShieldGovernor {
    bool public isCircuitBreakerActive;

    modifier whenNotHalted() {
        require(!isCircuitBreakerActive, "SYSTEM_EXECUTION_HALTED_CRITICAL");
        _;
    }

    function toggleCircuitBreaker() external onlyGovernor {
        isCircuitBreakerActive = !isCircuitBreakerActive;
        emit EmergencyCircuitBreakerTriggered(isCircuitBreakerActive);
    }
}
