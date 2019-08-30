pragma solidity ^0.5.8;

contract KonfidioCont {
  address public addr;
  mapping (address  => uint) public balances;

  uint256 public totalSupply;
  string public name;
  string public symbol;
  uint32 public decimals;



  constructor() public {
    symbol = "KONF";
    name = "KonfidioCont";
    decimals = 18;
    totalSupply = 100000000000;

    addr = msg.sender;
    balances[address(this)] = totalSupply;
   }



  /// @dev Transfers sender's tokens to a given address. Returns success.
  /// @param _to Address of token receiver.
  /// @param _value Number of tokens to transfer.
  function transferKonf(address payable _to, uint256 _value) private returns (bool success) {
    if (balances[addr] >= _value && _value > 0) {
      /// Transfer(msg.sender, _to, _value);
      _to.transfer(_value);
      return true;
    }
    else {
      return false;
    }
  }

  function deposit(uint256 amount) public payable {
      require(msg.value == amount);
      balances[msg.sender]+=amount;
      transferKonf(msg.sender, amount*5);
  }

}
