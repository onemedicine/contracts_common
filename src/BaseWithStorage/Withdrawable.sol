pragma solidity ^0.5.2;

import "contracts/contracts_common/src/Interfaces/ERC20.sol";
import "contracts/contracts_common/src/BaseWithStorage/Ownable.sol";

contract Withdrawable is Ownable {
    function withdrawEther(address payable _destination) external onlyOwner {
        _destination.transfer(address(this).balance);
    }

    function withdrawToken(ERC20 _token, address _destination) external onlyOwner {
        require(_token.transfer(_destination, _token.balanceOf(address(this))), "Transfer failed");
    }
}