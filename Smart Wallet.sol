pragma solidity ^0.6.0;

contract SmartWallet {

    mapping(address => uint) Balance;

    address payable public owner;

    event RecievedMoney(address _address, uint _amount);

    uint private funds;

    bool register; 
    

    constructor() public {
        owner = msg.sender;  
    }

    fallback() payable external {
        emit RecievedMoney(msg.sender, msg.value / 1 ether);
        Balance[owner] += msg.value;
    }

    function Register() public returns(bool) {
        if(owner == msg.sender){
            return register = true;
        }
        else{
            Balance[msg.sender] = 20;
            return register = true;
        }
        
    }

    function WithdrawMoney(uint _amount) payable public {
        require(register == true || Balance[msg.sender] == Balance[owner], "You are not registered");
        require(Balance[msg.sender] >= _amount, "Not enough remaining money on wallet");
        require(Balance[owner] >= _amount, "Not enough funds on wallet");
        assert(Balance[owner] - _amount <= Balance[owner]);
        assert(Balance[msg.sender] - _amount <= Balance[msg.sender]);
        payable(msg.sender).transfer(_amount * 1 ether);
        Balance[msg.sender] -= _amount;
        Balance[owner] -= _amount;
    }
}

