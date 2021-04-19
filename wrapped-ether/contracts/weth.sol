pragma solidity ^0.7.3;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Weth is ERC20{
    constructor() ERC20("Wrapped Ether", "WETH") {}

    //weth is deposited here
    function deposit() external payable{
        _mint(msg.sender, msg.value);
    }
    //user specifies amount of weth to withdraw, weth is then burnt and the ether is sent to user specified address
    function withdraw(uint amount){
        require(balanceOf(msg.sender) >= amount, 'balance too low');
        _burn(msg.sender, amount);
        msg.sender.transfer(amount);
    }
}
