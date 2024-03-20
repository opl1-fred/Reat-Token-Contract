// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0

pragma solidity 0.8.24;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract REAT is Initializable, ERC20Upgradeable, OwnableUpgradeable, ERC20PermitUpgradeable, UUPSUpgradeable {
    
    uint256[49] __gap;
    
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    /**
     * @dev Initializes the contract.
     * @param initialOwner The address that will have ownership upon deployment.
     */
    function initialize(address initialOwner) initializer public {
        __ERC20_init("REAT", "REAT");
        __Ownable_init(initialOwner);
        __ERC20Permit_init("REAT");
        __UUPSUpgradeable_init();

        _mint(msg.sender, 50_000_000 * 10 ** decimals());
    }

    /**
     * @dev Mints tokens and assigns them to the specified address.
     * @param to The address to which the minted tokens will be assigned.
     * @param amount The amount of tokens to be minted.
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    /**
     * @dev Overrides the function to authorize an upgrade.
     * @param newImplementation The address of the new implementation contract.
     */
    function _authorizeUpgrade(address newImplementation) internal onlyOwner override {}
}
