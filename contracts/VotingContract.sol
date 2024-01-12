// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract Create {
    using Counters for Counters.Counter;

    Counters.Counter public _voterId;
    Counters.Counter public _candidateId;

    address public votingOrganizer;

    // CANDIDATE FOR VOTING
    struct Candidate {
        uint256 candidateId;
        string age;
        string name;
        string image;
        uint256 voteCount;
        address _address;
        string ipfs;
    }

    event CandidateCreate(
        uint256 indexed candidateId,
        string age,
        string name,
        string image,
        uint256 voteCount,
        address _address,
        string ipfs
    );

    address[] public candidateAddress;

    mapping(address => Candidate) public candidates;
    // END OF CANDIDATE DATA

    // VOTER DETAILS

    address[] public votedVoters;

    address[] public votersAddress;
    mapping(address => Voter) public voters;

    struct Voter {
        uint256 voterId;
        string name;
        string image;
        address voterAddress;
        bool allowed;
        bool voted;
        uint256 vote;
        string ipfs;
    }

    event VoterCreated(
        uint256 indexed voterId,
        string name,
        string image,
        address voterAddress,
        bool allowed,
        bool voted,
        uint256 vote,
        string ipfs
    );

    // END OF VOTER DATA

    constructor() {
        votingOrganizer = msg.sender;
    }

    function setCandidate(
        address _address,
        string memory _age,
        string memory _name,
        string memory _image,
        string memory _ipfs
    ) public {
        require(
            votingOrganizer == msg.sender,
            "Only organizer can authorize candidate"
        );

        _candidateId.increment();

        uint256 idNumber = _candidateId.current();

        Candidate storage candidate = candidates[_address];

        candidate.age = _age;
        candidate.name = _name;
        candidate.candidateId = idNumber;
        candidate.image = _image;
        candidate.voteCount = 0;
        candidate._address = _address;
        candidate.ipfs = _ipfs;

        // // Update the candidateAddress array
        candidateAddress.push(_address);

        emit CandidateCreate(
            idNumber,
            _age,
            _name,
            _image,
            candidate.voteCount,
            _address,
            _ipfs
        );
    }

    function getCandidate() public view returns (address[] memory) {
        return candidateAddress;
    }

    function getCandidateLength() public view returns (uint256) {
        return candidateAddress.length;
    }

    function getCandidateData(
        address _address
    )
        public
        view
        returns (
            string memory,
            string memory,
            uint256,
            string memory,
            uint256,
            string memory,
            address
        )
    {
        return (
            candidates[_address].age,
            candidates[_address].name,
            candidates[_address].candidateId,
            candidates[_address].image,
            candidates[_address].voteCount,
            candidates[_address].ipfs,
            candidates[_address]._address
        );
    }

    function voterRight(
        address _address,
        string memory _name,
        string memory _image,
        string memory _ipfs
    ) public {
        require(
            votingOrganizer == msg.sender,
            "Only organizer can create voter"
        );

        _voterId.increment();
        uint256 idNumber = _voterId.current();
        Voter storage voter = voters[_address];

        require(!voter.allowed, "Voter already exists");

        voter.allowed = true;
        voter.name = _name;
        voter.image = _image;
        voter.voterAddress = _address;
        voter.voterId = idNumber;
        voter.vote = 1000;
        voter.voted = false;
        voter.ipfs = _ipfs;

        votersAddress.push(_address);

        emit VoterCreated(
            idNumber,
            _name,
            _image,
            _address,
            voter.allowed,
            voter.voted,
            voter.vote,
            _ipfs
        );
    }

    function vote(
        address _candidateAddress,
        uint256 _candidateVoteId
    ) external {
        Voter storage voter = voters[msg.sender];

        require(!voter.voted, "You have already voted");
        require(voter.allowed, "You have no right to vote");

        voter.voted = true;
        voter.vote = _candidateVoteId;

        votedVoters.push(msg.sender);

        candidates[_candidateAddress].voteCount += voter.vote;
    }

    function getVoterLength() public view returns (uint256) {
        return votersAddress.length;
    }

    // With this modification
    function getVoterData(
        address _address
    )
        public
        view
        returns (
            uint256,
            string memory,
            string memory,
            address,
            bool,
            bool,
            uint256,
            string memory
        )
    {
        Voter storage voter = voters[_address];
        return (
            voter.voterId,
            voter.name,
            voter.image,
            voter.voterAddress,
            voter.allowed,
            voter.voted,
            voter.vote,
            voter.ipfs
        );
    }

    function getVotedVoterList() public view returns (address[] memory) {
        return votedVoters;
    }

    function getVoterList() public view returns (address[] memory) {
        return votersAddress;
    }
}
