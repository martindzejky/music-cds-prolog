/** <module> music_cd
 *
 * MUSIC CD DATABASE
 * -----------------
 *
 * This program is a database of good ol' music CDs.
 * It allows the user to add and remove CD, search for
 * a CD and filter and sort CDs.
 * It can also save the database to a file and later
 * restore from this file.
 *
 * @author chuckeles
 * @license MIT
 *
 */


/**
 * application.
 *
 * Runs the application.
 *
 * @see menu
 * @see action
 */
application :-
  header,
  repeat,
  (
    menu,
    action
  ).


/**
 * header.
 *
 * Show the initial application header.
 */
header :-
  write('MUSIC CD DATABASE'), nl,
  write('by chuckeles'), nl.


/**
 * menu.
 *
 * Shows the main menu.
 */
menu :-
  nl,
  write('MAIN MENU'), nl,
  write('  [add]  Add a new CD.'), nl,
  write('  [exit] Exit the application.'), nl.


/**
 * action.
 *
 * Read user input and take an action.
 */
action :-
  write('Your choice: '),
  read(Choice),
  (
    Choice = 'add' ->
      add_cd,
      fail;

    Choice = 'exit' ->
      write('Exiting the application!'), nl;

    write('What does that mean? I don\'t understand!'), nl,
    fail
  ).


/**
 * add_cd.
 *
 * Add a new music CD to the database.
 */
add_cd :-
  write('Please provide information about this CD:'), nl,
  write('ID number: '),
  read(ID_number),
  write('Name: '),
  read(Name),
  write('Author: '),
  read(Author),
  write('Studio: '),
  read(Studio),
  write('Date: '),
  read(Date),
  write('Length: '),
  read(Length),
  asserta(
    music_cd(
      ID_number,
      Name,
      Author,
      Studio,
      Date,
      Length
    )
  ),
  write('Added the new CD to the database.'), nl.
