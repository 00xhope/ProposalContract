// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ProposalContract {
    address internal owner; // Declare owner variable
    
    constructor() {
        owner = msg.sender; // Assign owner in the constructor
    }

    struct Proposal {
        string title; // Title of the proposal
        string description; // Description of the proposal
        uint256 approve; // Number of approve votes
        uint256 reject; // Number of reject votes
        uint256 pass; // Number of pass votes
        uint256 total_vote_to_end; // When the total votes in the proposal reaches this limit, proposal ends
        bool current_state; // This shows the current state of the proposal, meaning whether if passes of fails
        bool is_active; // This shows if others can vote to our contract
    }

    mapping(uint256 => Proposal) public proposal_history; // Recordings of previous proposals
    uint256 public counter;

    function create(string calldata _title, string calldata _description, uint256 _total_vote_to_end) external {
        counter += 1;
        require(msg.sender == owner, "Only owner can create a proposal");
        proposal_history[counter] = Proposal(_title, _description, 0, 0, 0, _total_vote_to_end, false, true);
    }
}
