// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address owner;
   constructor(string memory _tokenName, string memory _tokenSymbol) ERC20(_tokenName, _tokenSymbol) {
    owner = msg.sender;
   }
   modifier onlyOwner(){
    require(msg.sender==owner,"Only owner can call this function");
    _;
   }
   function mint(address to, uint256 amount) public onlyOwner {
       _mint(to, amount);
   }

   function burn(uint256 amount) public {
       _burn(_msgSender(), amount);
   }

    function transferTokens(address to, uint256 amount) public {
        _transfer(msg.sender, to, amount);
    }
}
