//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/LinkTokenInterface.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

contract random is VRFConsumerBaseV2 {

    uint16 internal requestConfirmations = 3;
    
    bytes32 internal keyHash;
        //0xd89b2bf150e3b9e13446986e571fb9cab24b13cea0a43ea20a6049a85cc807cc;
    
    uint32 internal callbackGasLimit = 1000000;
    
    uint64 internal chainlinkSubscriptionId;

    uint256[] internal retunrRandomWords;

    VRFCoordinatorV2Interface internal COORDINATOR;

    LinkTokenInterface internal LINKTOKEN;



    function _roll(uint256 gameId) internal returns (uint256) {
        uint256 requestId = COORDINATOR.requestRandomWords(
            keyHash,
            chainlinkSubscriptionId,
            requestConfirmations,
            callbackGasLimit,
            1
        );

        return requestId;
    }

    function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords)
        internal
        override
    {
        
        retunrRandomWords = randomWords;
        
    }

    constructor( 
        address _vrfCoordinator,
        address _link,
        uint64 _chainlinkSubscriptionId,
        bytes32 _keyHash
    ) VRFConsumerBaseV2(_vrfCoordinator) {       

        chainlinkSubscriptionId = _chainlinkSubscriptionId;
        COORDINATOR = VRFCoordinatorV2Interface(_vrfCoordinator);
        LINKTOKEN = LinkTokenInterface(_link);      

    }




}