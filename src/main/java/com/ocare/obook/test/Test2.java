package com.ocare.obook.test;

import java.util.Random;


public class Test2 {

	public static byte generateRandomByte()
	{
	    byte out_byte = 0;
	     
	    int randInt = 0;
	 
	    Random rand_generator = new Random();
	 
	    for( int ii = 0 ; ii < 16 ; ii++) {
	        randInt = rand_generator.nextInt(62);
	        if( randInt <= 9) {
	            out_byte = (byte) ((randInt + 48) & 0xFF);     //digits
	        } else {
	            if( randInt > 9 && randInt <= 35) {
	                out_byte = (byte) ((randInt + 55) & 0xFF); //uppercase letters
	            } else {
	                out_byte = (byte) ((randInt + 61) & 0xFF); //lowercase letters
	            }
	        }
	    }
	 
	    return out_byte;
	}
	 
	public static String generateRandomSerialNumber()
	{
	    String out_str;
	     
	    byte[] byte_arry = new byte[16];
	 
	    for( int ii = 0 ; ii < 16 ; ii++) {
	        byte_arry[ii] = generateRandomByte();
	    }
	    //rip out chains
	    for( int ii = 1 ; ii < 16 ; ii++) {
	        if( byte_arry[ii-1] == byte_arry[ii] ) {   
	            do {
	                byte_arry[ii-1]= generateRandomByte();
	            } while( byte_arry[ii-1] == byte_arry[ii] );
	        }
	    }
	    out_str = new String(byte_arry);
	 
	    return out_str;
	}
	
	
	public static void main(String[] args){
		
		System.out.println(Test2.generateRandomSerialNumber());
		
	}
}
