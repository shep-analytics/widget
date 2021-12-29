pragma solidity ^0.8.0;
//SPDX-License-Identifier: MIT



import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Widget is ERC20, Ownable {

    string private constant _name = "Widget";

    string private constant _symbol = "WDG";

    uint256 private constant _initial_supply =  0 * (10 ** 18);

    uint256 public total_supply = 0;

    constructor() ERC20(_name, _symbol) {
        _mint(msg.sender, _initial_supply);
    }

    function mint(address recipient, uint256 amount) public onlyOwner {
        _mint(recipient,amount);
        total_supply += amount;
    }

    function redeem(address account, uint256 amount) public onlyOwner {
        _burn(account,amount);
        total_supply -= amount;
    }
}
