//THIS CODE IS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING A TUTOR
// OR CODE WRITTEN BY OTHER STUDENTS - Yibo Wang


//Note to self: I need to make this work for negative numbers!!!
import java.util.Arrays;

public class Nano
{
   public static void main(String[] args){
    System.out.println(parseNano(("!%")));
    //toString( -110);
   }
   public static char[] digit = {'#', '!', '%', '@', '(', ')', '[', ']', '$'};

   /* ==========================================================
      Return the 2's complement binary representation for the
      Nano number given in String s
      ========================================================== */
   public static int parseNano(String s)
   {
      /* ------------------------------------------------------------------
         This loop checks if the input contains an illegal (non-Nano) digit
         ------------------------------------------------------------------ */
      for (int i = 0 ; i < s.length(); i++)
      {
         int j = 0;
         while ( j < digit.length )
         {
            if ( s.charAt(i) == digit[j] || s.charAt(i) == '-' )
            {
               break;
            }

            j++;
         }

         if ( j >= digit.length )
         {
            System.out.println("Illegal nano digit found in input: " 
					+ s.charAt(i) );
            System.out.println("A Nano digit must be one of these: " 
				+ Arrays.toString (digit) );
            System.exit(1);
         }
      }

      // Write the parseNano() code here
      // 1) DONE - Convert the given string into a int
      // 2) DONE - Convert the nano int to the correct decimal number
      int number = 0;
      boolean negative= false;

      char[] characters = s.toCharArray(); //converts the string into a character array

      if (characters[0] == '-') { //adds the negative sign to the final result
         negative = true;
      }

      //goes through the character array and converts into a string
      for (int j = 0; j<characters.length; j++) {
         for (int i = 0; i < digit.length; i++) {
            if (characters[j] == digit[i]) {
               number = number*9 + i; //add the number to the number
            }
         }
      }

      //int decimalResult = Integer.parseInt(number);

      //int result = Integer.parseInt(number,9);

      if(negative == true){
         number = number *-1;
      }

      return number;
   }

   /* ==========================================================
      Return the String of Nano digit that represent the value
      of the 2's complement binary number given in 
      the input parameter 'value'
      ========================================================== */
   public static String toString(int value)
   {
      // Write the toString() code here
      //The first step would be to convert the base 10 to a base 9 number
      //The next step would be to convert the base 9 number to the string

      String finalString = "";
      int baseNine = Integer.parseInt(Integer.toString(value,9)); //this line converts the base 10 to a base 9 number
      String numberNine = Integer.toString(baseNine); //converts the base 9 number to a string e.g 11

      char[] characters = numberNine.toCharArray(); //converts the string into a character array
      int[] integer = new int[characters.length];


      for (int i=0; i< characters.length; i++) {
         integer[i] = (int) characters[i]-48;
      }

      if (characters[0] == '-') { //adds the negative sign to the final result
         finalString = finalString + "-";
      }

      //goes through the character array and converts into a string
      for (int i=0; i<integer.length; i++){
         for (int j=0; j<digit.length; j++){
            if (integer[i] == j){
               finalString  = finalString  + digit[j];
            }
         }
      }
      return finalString;
   }
}
