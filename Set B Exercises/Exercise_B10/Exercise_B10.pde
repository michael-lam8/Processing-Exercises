// Michael Lam & Vinay Meldrum
// May 2018
// Program displays characteristics of a sentence, such as its character count

// Declaring variables
String sentence = "Do you want to build a snowman?";
String sentenceLength = sentence;
String[] sentenceArray = new String[sentenceLength.length()];
int numberOfCapital, numberOfVowels, maxLetters, punctuationCount, amountOfWords, index;

// Initial setup
void setup() {
  background(0);
  size(600, 600);
  lengthOfSentence();
  capitalLetters();
  vowels();
  wordCount();
  punctuation();
  mostUsedLetter();
}

// Displays sentence
void draw() {
  text("Sentence: " + sentence, 100, 150);
  noLoop();
}

// Displays length of the sentence
void lengthOfSentence() {
  text("Length of the sentence: " + sentenceLength.length() + " characters", 100, 200);
}

// Displays the amount of capital letters
void capitalLetters() {
  //Looping over the length of the string.
  for (int i = 0; i < sentence.length(); i++) {
    //Making the string a character. char means character.
    //So, it will become c will become the character based off of how far you
    //are in the loop cause of the charAt(i).
    char c = sentence.charAt(i);
    //This is the real code, checking if it is between A and Z. Then adding
    //1 to the count. EZPZ.
    if (c >= 'A' && c <= 'Z') {
      numberOfCapital++;
    }
  }
  text("Number of capital letters: " + numberOfCapital, 100, 250);
}

// Displays the amount of vowels
void vowels() {
  for (int i = 0; i < sentence.length(); i++) {
    char c = sentence.charAt(i);
    if (c == 'a' || c == 'A' || c == 'e' || c == 'E' || c == 'i' || c == 'I' || c == 'o' || c == 'O' || c == 'u' || c == 'U') {
      numberOfVowels++;
    }
  }
  text("Number of vowels: " + numberOfVowels, 100, 300);
}

// Displays the amount of words
void wordCount() {
  for (int i = 0; i < sentence.length(); i++) {
    String[] list = split(sentence, ' ');
    amountOfWords = list.length;
  }
  text("Number of words in sentence: " + amountOfWords, 100, 350);
}

// Displays the amount of punctuation marks
void punctuation() {
  for (int i = 0; i < sentence.length(); i++) {
    char c = sentence.charAt(i);
    if (c == '\'' || c == ':' || c ==  ';' || c == '.' || c == ',' || c == '!' || c == '?') {
      punctuationCount++;
    }
  }
  text("Number of punctuation marks: " + punctuationCount, 100, 400);
}

// Displays the most frequently occuring character
void mostUsedLetter() {
  //Lowercase
  char[] lowercaseArray = sentence.toLowerCase().toCharArray();
  int[] allLetters = new int [26];
  for (int i = 0; i < lowercaseArray.length; i++) {
    //Making sure it is a letter  
    if (lowercaseArray[i] >= 'a' && lowercaseArray[i] <='z') {
      //ASCII value. Subtract a from anything and you get the correct index. a - b = 1. a - a = 0.
      allLetters[lowercaseArray[i]-'a']++;
    }
  } //maxLetters, index
  for (int i = 0; i < allLetters.length; i++) {
    if (allLetters[i] > maxLetters) {
      maxLetters = allLetters[i];
      index = i;
    }
  }
  char mostOccuringLetter = char('a' + index);
  text("Most occuring letter: " + mostOccuringLetter + " has occured " + maxLetters + " times.", 100, 450);
}