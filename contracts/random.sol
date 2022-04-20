//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./RandomNumberConsumer.sol";


contract random {

    RandomNumberConsumer public Ramdom;
    constructor( address _random) {       


        Ramdom = RandomNumberConsumer(_random);
      

    }

}