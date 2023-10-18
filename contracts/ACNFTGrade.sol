// SPDX-License-Identifier: MIT
// Author: Yuankai Zhu

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract ACNFTGrade is ERC721Enumerable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    constructor() ERC721("Academic Certificate NFT Grade", "ACNFTGrade") {
        owner = msg.sender;
    }

    struct Grade {
        string school_name;
        string school_code;
        string student_name;
        string student_id;
        string course_name;
        string course_id;
        uint256 course_start_year;
        string course_other_info;
        uint256 grade_value;
        string grade_letter;
        string lecturer;
    }

    mapping(uint256 => Grade) public grades;

    event GradeMinted(uint256 tokenId, string studentName, string studentID, string courseName);

    function mintGrade(
        string memory _school_name,
        string memory _school_code,
        string memory _student_name,
        string memory _student_id,
        string memory _course_name,
        string memory _course_id,
        uint256 _course_start_year,
        string memory _course_other_info,
        uint256 _grade_value,
        string memory _grade_letter,
        string memory _lecturer
    ) public onlyOwner returns (uint256) {
        _tokenIdCounter.increment();
        uint256 newTokenId = _tokenIdCounter.current();
        _safeMint(owner, newTokenId);

        Grade memory newGrade = Grade({
            school_name: _school_name,
            school_code: _school_code,
            student_name: _student_name,
            student_id: _student_id,
            course_name: _course_name,
            course_id: _course_id,
            course_start_year: _course_start_year,
            course_other_info: _course_other_info,
            grade_value: _grade_value,
            grade_letter: _grade_letter,
            lecturer: _lecturer
        });

        grades[newTokenId] = newGrade;

        emit GradeMinted(newTokenId, _student_name, _student_id, _course_name);

        return newTokenId;
    }

    function burn(uint256 tokenId) public {
        require(msg.sender == owner || ownerOf(tokenId) == msg.sender, "Not the token owner");
        
        _burn(tokenId);

        delete grades[tokenId];
    }
}
