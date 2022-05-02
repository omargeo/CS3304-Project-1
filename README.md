# CS-Project-1

For this project, we are going to be looking at how resistors are color-coded and what those values mean. A string that is either 3, 4 or 5 characters longwill be given. Each of the characters represents a resistor value that has been encoded. The program will figure out what the resistor value is and what the upper and lower ranges on the tolerance are.

**Input**

The input to the program will be a file of “words”. The word is an encoded resistor using the values we see on this page (https://en.wikipedia.org/wiki/Electronic_color_code). Since single letters are used to represent the colors  either the first or last letter to represent the color. The color words are indicated with this table

Table of values for resistor band colors 

Color	Letter	Figure	Multiplier	Tolerance

Black	k	      0	      10^0	      --

Brown	n	      1	      10^1	      1%

Red	  r	      2	      10^2	      2%

Orange o	    3	      10^3	      --

Yellow w	    4	      10^4	      5%

Green	g	      5	      10^5	      .5% 

Blue	b	      6	      10^6	      .25%

Violet v	    7	      10^7	      0.1%

Gray	y	      8	      10^8	      0.05%

White	e	      9	      10^9	      --

Gold	d	      	      10^-1	      5%

Silver s	      	    10^-2	      10%

So, if given resistor with yellow, violet, red and gold, the input would be: wvrd

The meaning of the input is as follows:

If the length of the input string is 3, then the first and second characters are figures and the last character is a multiplier. The tolerance defaults to 20%.

If the length of the input string is 4, then the first and second characters are figures, the third character is a multiplier and the last character is the tolerance.

If the length of the input string is 5, then the first 3 characters are figures, the 4th character is a multiplier and the last character is the tolerance.
