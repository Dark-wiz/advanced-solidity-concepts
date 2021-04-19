pragma solidity ^0.7.3;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

interface ContractB{
    function deposit(uint amount) external;
    function withdraw(uint amount) external;
}

contract ConractA{
    ERC20 public token;
    ContractB public contractB;

    constructor(address _token, address _contractB){
        token = IERC20(_token);
        contractB = ContractB(_contractB);
    }

    function deposit(uint amount) external {
        token.transferFrom(msg.sender, address(this), amount);
        token.approve(address(contractB), amount);
        contractB.deposit(amount);
    }

    function withdraw(uint amount) external{
        contractB.withdraw(amount);
        token.transfer(msg.sender, amount);
    }
}