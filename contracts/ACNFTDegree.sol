// SPDX-License-Identifier: MIT
// Author: Yuankai Zhu

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract ACNFTDegree is ERC721Enumerable {
    using Counters for Counters.Counter;
    Counters.Counter private _degreeIdCounter;

    struct Degree {
        string school_name;
        string school_code;
        string student_name;
        string student_id;
        uint256[] associated_courses; // IDs of ACNFTGrade NFTs
        string other_information;
        string headmaster;  
    }

    mapping(uint256 => Degree) public degrees;

    constructor() ERC721("Academic Certificate NFT Degree", "ACNFTDegree") {}

    event DegreeMinted(uint256 degreeId, string studentName, string schoolName);

    function mintDegree(
        string memory _school_name,
        string memory _school_code,
        string memory _student_name,
        string memory _student_id,
        uint256[] memory _associated_courses,
        string memory _other_information,
        string memory _headmaster
    ) external returns (uint256) {
        _degreeIdCounter.increment();
        uint256 newDegreeId = _degreeIdCounter.current();
        _safeMint(msg.sender, newDegreeId);

        degrees[newDegreeId] = Degree({
            school_name: _school_name,
            school_code: _school_code,
            student_name: _student_name,
            student_id: _student_id,
            associated_courses: _associated_courses,
            other_information: _other_information,
            headmaster: _headmaster
        });

        emit DegreeMinted(newDegreeId, _student_name, _school_name);
        return newDegreeId;
    }

    function getAssociatedCourses(uint256 degreeId) external view returns (uint256[] memory) {
        return degrees[degreeId].associated_courses;
    }
}
