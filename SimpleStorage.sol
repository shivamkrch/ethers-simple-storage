// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; // Latest 0.8.12

contract SimpleStorage {
    // int and uint ranges from 8 to 256 bytes
    // storage type by default
    uint256 favoriteNumber; // Default value = 0

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    // view - readonly method
    // no gas used
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // doesn't allow to read or modilfy
    // no gas used
    // function add() public pure returns(uint256) {
    //     return (256*256);
    // }

    // calldata, memory- temporary, removed after txn
    // calldata- can't modify
    // storage- stored after txn
    // used only for arrays, struct and mapping types
    function addPerson(string memory _name, uint256 _num) public {
        // Same as People(_num, _name)
        People memory newPerson = People({name: _name, favoriteNumber: _num});
        people.push(newPerson);
        nameToFavoriteNumber[_name] = _num;
    }
}
