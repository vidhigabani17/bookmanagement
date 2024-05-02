// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BookManagement {
    struct Book {
        string title;
        string author;
        uint256 year;
    }

    mapping(uint256 => Book) public books;
    uint256 public bookCount;

    function addBook(string memory _title, string memory _author, uint256 _year) public {
        books[bookCount] = Book(_title, _author, _year);
        bookCount++;
    }

    function getBook(uint256 _index) public view returns (string memory, string memory, uint256) {
        require(_index < bookCount, "Book does not exist.");
        Book memory book = books[_index];
        return (book.title, book.author, book.year);
    }

    function deleteBook(uint256 _index) public {
        require(_index < bookCount, "Invalid index.");

        // Directly delete the book entry
        delete books[_index];

        // Optional: If you want to keep all books contiguous without gaps:
        // This will effectively move the last book to the deleted slot and decrease the count
        if (_index != bookCount - 1) {
            books[_index] = books[bookCount - 1];
            delete books[bookCount - 1];
        }
        bookCount--;
    }
}
