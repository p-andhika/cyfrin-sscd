// SPDX-License-Identifier: MIT
pragma solidity 0.8.24; // solidity versions

contract SimpleStorage {
    // basic types: boolean, uint, int, address & bytes
    // bool hasFavoriteNumber = false;
    // uint256 favoriteNumber = 99;
    // string favoriteNumberInText = "ninety-nine";
    // int256 favoritInt = -99;
    // address myDevelopmentAddress = 0xCD77776042b8c8B8Ef40E9C347eCEC46B16E30Cf;
    // bytes32 favoriteBytes32 = "cat";

    // this get initialize to 0 if no value given
    uint256 public myFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual  {
        myFavoriteNumber = _favoriteNumber;
    }

    // view, pure
    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }

    // uint256[] listOfFavoriteNumber;
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // Person public pat = Person({
    //     favoriteNumber: 7,
    //     name: ""
    // });

    // dynamic array
    Person[] public listOfPeople;
    
    // "something" -> 22221
    mapping(string => uint256) public nameToFavoriteNumber;

    // call data, memory & storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(
            Person(_favoriteNumber, _name)
        );

        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}