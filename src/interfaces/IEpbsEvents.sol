// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IEpbsEvents {
    event PayloadShielded(bytes32 indexed commitment, uint32 indexed targetChain, uint256 gasBid);
    event PayloadSettled(bytes32 indexed commitment, address indexed solver, bool success);
    event GovernanceUpgraded(address indexed newGovernor);
    event EmergencyCircuitBreakerTriggered(bool status);
}
