% Define books with their properties
book(harry_potter_1, jk_rowling, 1997, fantasy).
book(harry_potter_2, jk_rowling, 1998, fantasy).
book(harry_potter_3, jk_rowling, 1999, fantasy).
book(the_hobbit, jrr_tolkien, 1937, fantasy).
book(the_lord_of_the_rings, jrr_tolkien, 1954, fantasy).
book(the_da_vinci_code, dan_brown, 2003, thriller).
book(angels_and_demons, dan_brown, 2000, thriller).
book(digital_fortress, dan_brown, 1998, thriller).
book(the_girl_with_the_dragon_tattoo, stieg_larsson, 2005, mystery).
book(the_girl_who_played_with_fire, stieg_larsson, 2006, mystery).
book(the_girl_who_kicked_the_hornets_nest, stieg_larsson, 2007, mystery).

% Define borrowers with their properties
borrower(john, doe, 12345).
borrower(jane, smith, 67890).
borrower(jack, black, 24680).

% Define the borrowed predicate
borrowed(harry_potter_1, 12345).
borrowed(the_hobbit, 67890).
borrowed(the_da_vinci_code, 24680).
borrowed(the_girl_with_the_dragon_tattoo, 12345).
borrowed(the_girl_who_played_with_fire, 67890).

% Define predicate for retrieving book details
find_book(Title, Author, Year, Genre) :-
    book(Title, Author, Year, Genre).

% Define predicate for retrieving borrower details
find_borrower(Id, FirstName, LastName) :-
    borrower(FirstName, LastName, Id).

% Define predicate for listing borrowed books with details
list_borrowed_books :-
    borrowed(BookTitle, BorrowerId),
    find_book(BookTitle, Author, Year, Genre),
    find_borrower(BorrowerId, FirstName, LastName),
    format('Book: ~w, Author: ~w, Year: ~w, Genre: ~w, Borrower: ~w ~w~n', [BookTitle, Author, Year, Genre, FirstName, LastName]).
