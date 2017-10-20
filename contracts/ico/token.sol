pragma solidity ^0.4.0;


contract MyToken {

    mapping (address => uint) balances;
    mapping (address => mapping (address => uint)) allowed;
    uint public totalSupply;

    function MyToken(address a, address b){
        balances[a] += 100000000;
        totalSupply += 100000000;
        balances[b] += 500000000;
        totalSupply += 500000000;
    }

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint _value
    );

    // 返回充值后余额
    function deposit(address _to, uint _value) returns (uint) {
        balances[_to] += _value;
        totalSupply += _value;
        return balances[_to];
    }

    // 转账
    function transfer(address _to, uint _value) returns (bool) {
        if(balances[msg.sender] >= _value && balances[_to] + _value >= balances[_to]) {
            balances[_to] += _value;
            balances[msg.sender] -= _value;
            Transfer(msg.sender, _to, _value);
            return true;
        } else {
            return false;
        }
    }

    // 查询余额
    function balanceOf(address _owner) constant returns (uint) {
        return balances[_owner];
    }

    function allowance(address _owner, address _spender) constant returns (uint) {
        return allowed[_owner][_spender];
    }

    function approve(address _spender, uint _value) returns (bool) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
}