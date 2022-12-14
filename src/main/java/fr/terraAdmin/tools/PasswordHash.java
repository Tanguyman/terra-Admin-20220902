package fr.terraAdmin.tools;

import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public class PasswordHash {

	/*
	 * AUTRES TUTOS
	 * - https://stackoverflow.com/questions/2860943/how-can-i-hash-a-password-in-java
	 * 
	 */
	/*
	 * HASHAGE password avec :
	 * https://howtodoinjava.com/java/java-security/how-to-generate-secure-password-hash-md5-sha-pbkdf2-bcrypt-examples/
	 */
	public static String generatePassword( String password ) 
			throws NoSuchAlgorithmException, InvalidKeySpecException {
		
		int iterations = 1000;
		char[] chars = password.toCharArray();
		byte[] salt = getSalt();
		
		PBEKeySpec spec = new PBEKeySpec(chars, salt, iterations, 64 * 8);
		SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
		
		byte[] hash = skf.generateSecret(spec).getEncoded();
		
		return iterations + ":" + toHex(salt) + ":" + toHex(hash);
	}
	
	private static byte[] getSalt() throws NoSuchAlgorithmException {
		
		SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
		byte[] salt = new byte[16];
		sr.nextBytes(salt);
		
		return salt;
	}

	private static String toHex( byte[] array ) {
		
		BigInteger bi = new BigInteger(1, array);
		String hex = bi.toString(16);
		
		int paddingLength = (array.length * 2) - hex.length();
		if ( paddingLength > 0 ) {
			return String.format("%0" + paddingLength + "d", 0) + hex;
		} else {
			return hex;
		}
	}
	
	/*
	 * CHECK password
	 */
	public static boolean isPasswordCorrect ( String originalPassword, String storePassword ) 
			throws NoSuchAlgorithmException, InvalidKeySpecException {
		
		String[] parts = storePassword.split( ":" );
		int iterations = Integer.parseInt( parts[0] );
		byte[] salt = fromHex( parts[1] );
		byte[] hash = fromHex( parts[2] );
		
		PBEKeySpec spec = new PBEKeySpec( originalPassword.toCharArray(), salt, iterations, hash.length * 8 );
		SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
		byte[] testHash = skf.generateSecret(spec).getEncoded();
		
		int diff = hash.length ^ testHash.length; // ^ : OU exclusif au niveau du bit
		
		for ( int i = 0; i < hash.length && i < testHash.length; i++ ) { // 2 conditions d???arr??t ???
			diff |= hash[i] ^ testHash[i]; // | : OU inclusif au niveau du bit
		}
		
		return diff == 0;
	}
	
	private static byte[] fromHex( String hex ) {
		
		byte[] bytes = new byte[ hex.length() / 2 ];
		
		for ( int i = 0; i < bytes.length; i++ ) {
			bytes[i] = (byte) Integer.parseInt( hex.substring( 2 * i, 2 * i + 2 ), 16 );
		}
		
		return bytes;
	}
}
