// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SSIIntegration {
    // Represents a Decentralized Identifier
    struct DID {
        address owner;
        string didType; // "student" or "employer"
        bool exists;
    }

    // Represents a Verifiable Credential
    struct VC {
        string holderDID;
        string degreeName;
        string course;
        uint256 year;
        bool verified;
    }

    mapping(string => DID) public dids;      // DID → details
    mapping(uint256 => VC) public vcs;       // VC ID → details
    uint256 public vcCount;

    address public admin;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    // DID CREATION
    function registerDID(string memory _did, string memory _type) public {
        require(!dids[_did].exists, "DID already exists");
        require(
            keccak256(bytes(_type)) == keccak256("student") ||
            keccak256(bytes(_type)) == keccak256("employer"),
            "Invalid type"
        );

        dids[_did] = DID(msg.sender, _type, true);
    }

    // VC ISSUANCE
    function issueVC(
        string memory _holderDID,
        string memory _degreeName,
        string memory _course,
        uint256 _year
    ) public onlyAdmin {
        require(dids[_holderDID].exists, "Holder DID not found");

        vcs[vcCount] = VC(_holderDID, _degreeName, _course, _year, true);
        vcCount++;
    }

    // VC VERIFICATION
    function verifyVC(uint256 _vcId) public view returns (bool, string memory, string memory) {
        require(_vcId < vcCount, "VC does not exist");
        VC memory vc = vcs[_vcId];
        return (vc.verified, vc.holderDID, vc.degreeName);
    }
}
