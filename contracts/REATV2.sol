// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.24;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

import { REAT } from './REAT.sol';

contract REATV2 is REAT {
    function requestRewardWithdrawal(uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s) public {
        permit(_msgSender(), address(this), value, deadline, v, r, s);
        sendRewardTokens(value);
    }

    function sendRewardTokens(uint256 value) internal {
        transferFrom(_msgSender(), address(this), value);
    }
}
