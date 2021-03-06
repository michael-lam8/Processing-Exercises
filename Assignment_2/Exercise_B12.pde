// Michael Lam & Vinay Meldrum
// May 4, 2018
// Set B, Exercise 12: This program loads text files and displays a specified characteristics, such as its character count.

// Last updated May 28, 2018
// - Fixed bug in which for statements looped endlessly
//    - Created a new boolean (programEnd) which calculates the text characteristics once

class Exercise_B12 {
  // Declaring variables
  boolean programEnd = false;
  char mostOccurringLetter;
  String othelloChar, illiadChar, romeoChar, odysseyChar, hamletChar, macbethChar;
  String[][] fileText = new String[6][];
  int numberOfCapital, numberOfVowels, maxLetters, punctuationCount, amountOfWords, index;

  // Initial setup
  void setup() {
    // Loading files and converting them to one string
    fileText[0] = loadStrings("data/Exercise B12 Data/othello.txt");
    fileText[1] = loadStrings("data/Exercise B12 Data/illiad.txt");
    fileText[2] = loadStrings("data/Exercise B12 Data/romeoAndJuliet.txt");
    fileText[3] = loadStrings("data/Exercise B12 Data/theOdyssey.txt");
    fileText[4] = loadStrings("data/Exercise B12 Data/hamlet.txt");
    fileText[5] = loadStrings("data/Exercise B12 Data/macbeth.txt");
    othelloChar = join(fileText[0], "");
    illiadChar = join(fileText[1], "");
    romeoChar = join(fileText[2], "");
    odysseyChar = join(fileText[3], "\n");
    hamletChar = join(fileText[4], "");
    macbethChar = join(fileText[5], "").toLowerCase();
    background(0);
    textAlign(LEFT);
    textSize(9);
    if (programEnd == false) {
      capitalCharacters();
      vowels();
      wordCount();
      punctuation();
      mostUsedLetter();
      programEnd = true;
    } else {
      text("Number of characters in othello.txt: " + othelloChar.length() + " characters", 50, 175);
      text("Number of capital letters in illiad.txt: " + numberOfCapital, 50, 225);
      text("Number of vowels in romeoAndJuliet.txt: " + numberOfVowels, 50, 275);
      text("Number of words in theOdyssey.txt: " + amountOfWords, 50, 325);
      text("Number of punctuation marks in hamlet.txt: " + punctuationCount, 50, 375);
      text("Most occurring letter in macbeth.txt: " + mostOccurringLetter + " has occured " + maxLetters + " times.", 50, 425);
    }
  }

  // Determines the amount of capital characters in illiad.txt
  void capitalCharacters() {
    for (int i = 0; i < illiadChar.length(); i++) {
      char c = illiadChar.charAt(i);
      if (c >= 'A' && c <= 'Z') {
        numberOfCapital++;
      }
    }
  }


  // Determines the amount of vowels in romeoAndJuliet.txt
  void vowels() {
    for (int i = 0; i < romeoChar.length(); i++) {
      char c = romeoChar.charAt(i);
      if (c == 'a' || c == 'A' || c == 'e' || c == 'E' || c == 'i' || c == 'I' || c == 'o' || c == 'O' || c == 'u' || c == 'U') {
        numberOfVowels++;
      }
    }
  }

  // Determines the amount of words in theOdyssey.txt
  void wordCount() {
    String[] odysseyWords = splitTokens(odysseyChar);
    amountOfWords = odysseyWords.length;
  }

  // Determines the amount of punctuation marks in hamlet.txt
  void punctuation() {
    for (int i = 0; i < hamletChar.length(); i++) {
      char c = hamletChar.charAt(i);
      if (c == '\'' || c == ':' || c ==  ';' || c == '.' || c == ',' || c == '!' || c == '?') {
        punctuationCount++;
      }
    }
  }

  // Determines the most frequently occurring letter in macbeth.txt
  void mostUsedLetter() {
    char[] lowercaseArray = macbethChar.toCharArray();
    int[] allLetters = new int [26];
    for (int i = 0; i < lowercaseArray.length; i++) {
      if (lowercaseArray[i] >= 'a' && lowercaseArray[i] <='z') {
        // ASCII value. Subtract a from anything and you get the correct index. a - b = 1. a - a = 0.
        allLetters[lowercaseArray[i]-'a']++;
      }
    } // maxLetters, index
    for (int i = 0; i < allLetters.length; i++) {
      if (allLetters[i] > maxLetters) {
        maxLetters = allLetters[i];
        index = i;
      }
    }
    mostOccurringLetter = char('a' + index);
  }
}