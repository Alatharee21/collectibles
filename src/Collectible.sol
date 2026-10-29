// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    event Deployed(address indexed);
    event Transfer(address indexed, address indexed);
    event ForSale(uint, uint);
    event Purchase(uint, address indexed);

    address owner;
    uint public price;

    constructor() {
        owner = msg.sender;
        emit Deployed(msg.sender);
    }

    function transfer(address recipient) external {
        require(msg.sender == owner);
        owner = recipient;
        emit Transfer(msg.sender, recipient);
    }

    function markPrice(uint _price) external {
        require(msg.sender == owner);
        price = _price;
        emit ForSale(price, block.timestamp);
    }

    function purchase() external payable {
        require(msg.value == price, "1");
        require(price > 0, "2");
        price = 0;
        (bool success, ) = owner.call{value: msg.value}("");
        require(success);
        owner = msg.sender;
        emit Purchase(msg.value, msg.sender);
    }
}
