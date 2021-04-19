pragma solidity ^0.7.3;

import '@openzeppelin/contract/ERC20/ERC20.sol';

contract UnderlyingToken is ERC20{
    constructor() ERC20('LP Token', 'LPK'){}

    function faucet(address to, uint amount) external{
        _mint(to, amount);
    }
}