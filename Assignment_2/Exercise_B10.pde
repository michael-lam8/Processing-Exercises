// Michael Lam & Vinay Meldrum
// May 4, 2018
// Set B, Exercise 10 & 11: Program displays characteristics of a sentence, such as its character count.
// Note: Exercise 10 and 11 are identical in function, except that Exercise 11 requires functions. The following code represents the requirements Exercise 11.

// Last updated June 2, 2018
// - Added additional documentation

class Exercise_B10 {
  // Declaring variables
  boolean programEnd = false;
  char mostOccuringLetter;
  String sentence = "Do you want to build a snowman?";
  String[] sentenceArray = new String[sentence.length()];
  int numberOfCapital, numberOfVowels, maxLetters, punctuationCount, amountOfWords, index;

  // Initial setup
  void setup() {
    background(0);
    textAlign(LEFT);
    textSize(12);
    if (programEnd == false) { // Runs once to prevent for statements from looping endlessly
      capitalLetters();
      vowels();
      wordCount();
      punctuation();
      mostUsedLetter();
      programEnd = true;
    } else { // Displays text characteristics once calculated
      text("Sentence: " + sentence, 50, 150);
      text("Length of the sentence: " + sentence.length() + " characters", 50, 200);
      text("Number of capital letters: " + numberOfCapital, 50, 250);
      text("Number of vowels: " + numberOfVowels, 50, 300);
      text("Number of words in sentence: " + amountOfWords, 50, 350);
      text("Number of punctuation marks: " + punctuationCount, 50, 400);
      text("Most occuring letter: " + mostOccuringLetter + " has occured " + maxLetters + " times.", 50, 450);
    }
  }

  // Displays the amount of capital letters
  void capitalLetters() {
    //Looping over the length of the string.
    for (int i = 0; i < sentence.length(); i++) {
      char c = sentence.charAt(i);
      if (c >= 'A' && c <= 'Z') {
        numberOfCapital++;
      }
    }
  }

  // Displays the amount of vowels
  void vowels() {
    for (int i = 0; i < sentence.length(); i++) {
      char c = sentence.charAt(i);
      if (c == 'a' || c == 'A' || c == 'e' || c == 'E' || c == 'i' || c == 'I' || c == 'o' || c == 'O' || c == 'u' || c == 'U') {
        numberOfVowels++;
      }
    }
  }

  // Displays the amount of words
  void wordCount() {
    for (int i = 0; i < sentence.length(); i++) {
      String[] list = split(sentence, ' ');
      amountOfWords = list.length;
    }
  }

  // Displays the amount of punctuation marks
  void punctuation() {
    for (int i = 0; i < sentence.length(); i++) {
      char c = sentence.charAt(i);
      if (c == '\'' || c == ':' || c ==  ';' || c == '.' || c == ',' || c == '!' || c == '?') {
        punctuationCount++;
      }
    }
  }

  // Displays the most frequently occuring character
  void mostUsedLetter() {
    char[] lowercaseArray = sentence.toLowerCase().toCharArray();
    int[] allLetters = new int [26];
    for (int i = 0; i < lowercaseArray.length; i++) {
      if (lowercaseArray[i] >= 'a' && lowercaseArray[i] <='z') {
        allLetters[lowercaseArray[i]-'a']++; // ASCII value. Subtract a to get the correct index. a - b = 1. a - a = 0.
      }
    }
    for (int i = 0; i < allLetters.length; i++) {
      if (allLetters[i] > maxLetters) {
        maxLetters = allLetters[i];
        index = i;
      }
    }
    mostOccuringLetter = char('a' + index);
  }
}