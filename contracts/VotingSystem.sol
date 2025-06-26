// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract VotingSystem {
    struct Proposal {
        string description;
        uint voteCount;
    }

    address public admin;
    mapping(address => bool) public hasVoted;
    Proposal[] public proposals;

    constructor() {
        admin = msg.sender;
        proposals.push(Proposal("Proposal A", 0));
        proposals.push(Proposal("Proposal B", 0));
        proposals.push(Proposal("Proposal C", 0));
    }

    function vote(uint proposalIndex) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(proposalIndex < proposals.length, "Invalid proposal index.");
        
        proposals[proposalIndex].voteCount += 1;
        hasVoted[msg.sender] = true;
    }

    function getProposalsCount() public view returns (uint) {
        return proposals.length;
    }

    function getProposal(uint index) public view returns (string memory description, uint voteCount) {
        require(index < proposals.length, "Invalid proposal index.");
        Proposal memory p = proposals[index];
        return (p.description, p.voteCount);
    }

    function hasUserVoted(address user) public view returns (bool) {
        return hasVoted[user];
    }
}
