package com.cam.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by wangl on 2017/3/3.
 */
public class MD5Utils {

    public static final String getMd5String(String str){
        byte[] input=str.getBytes();
        try {
            MessageDigest messageDigest=MessageDigest.getInstance("MD5");
            messageDigest.update(input);
            input=messageDigest.digest();
            int length=input.length;
            StringBuffer stringBuffer=new StringBuffer();
            for (int i=0;i<length;i++){
                int val=((int)input[i])&0xff;
                if(val<16){
                    stringBuffer.append('0');
                }
                stringBuffer.append(Integer.toHexString(val));
            }
//            return input.toString();
            return stringBuffer.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return str;
    }

}
