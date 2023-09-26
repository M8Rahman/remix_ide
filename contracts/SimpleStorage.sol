// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    //boolean, uint, int, address, bytes
    //bool hasFavoriteNumber = true;
    //uint256 favoriteNumber = 5;
    //string favpriteNumberInText = "Five";
    //int favoriteInt = -5;

    uint256 favoriteNumber;
    mapping(string => uint256) public nameToFavoriteNumber;


    struct People{
        uint favoriteNumber;
        string name;
    }

    People[] public people;




    function store(uint256 _favoriteNumber) public virtual{
        favoriteNumber = _favoriteNumber;
    }

    //view, pure type functions cost nothing if used outside of a costly function, just to see the state
    //pure is used when we need to use something again and again, it doesnt have to read any storage
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }


    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        //People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});     //its good practice to explicitly assign variable, which to which
        //People memory newPerson = People(_favoriteNumber, _name);     //no need to explicitly assign in written in the same format as the struct
        //people.push(newPerson);
        people.push(People(_favoriteNumber, _name)); //we can do it the uppor way but in this way no need of the memory keyword
        nameToFavoriteNumber[_name] = _favoriteNumber;

    }


}