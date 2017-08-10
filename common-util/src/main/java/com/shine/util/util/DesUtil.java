package com.shine.util.util;

import org.apache.commons.lang3.StringUtils;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import java.security.SecureRandom;

public class DesUtil {
    private static final byte[] DES_KEY = {54, 13, -99, 64, -78, -69, -36, -83};

    private static final byte[] DES_KEY2 = {10, -38, 12, -77, 51, -15, 39, -43};

    public static String decryptBasedDes(String cryptData) {
        if (StringUtils.isBlank(cryptData)) {
            return "";
        }
        String decryptedData = null;
        try {
            // DES算法要求有一个可信任的随机数源
            SecureRandom sr = new SecureRandom();
            DESKeySpec deskey = new DESKeySpec(DES_KEY2);
            // 创建一个密匙工厂，然后用它把DESKeySpec转换成一个SecretKey对象
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey key = keyFactory.generateSecret(deskey);
            // 解密对象
            Cipher cipher = Cipher.getInstance("DES");
            cipher.init(Cipher.DECRYPT_MODE, key, sr);
            // 把字符串解码为字节数组，并解密
            cryptData = new String(cipher.doFinal(new sun.misc.BASE64Decoder().decodeBuffer(cryptData)));

            deskey = new DESKeySpec(DES_KEY);
            key = keyFactory.generateSecret(deskey);
            cipher.init(Cipher.DECRYPT_MODE, key, sr);
            decryptedData = new String(cipher.doFinal(new sun.misc.BASE64Decoder().decodeBuffer(cryptData)));
        } catch (Exception e) {
            throw new RuntimeException("解密错误，错误信息：", e);
        }
        return decryptedData;
    }

    public static String encryptBasedDes(String data) {
        if (StringUtils.isBlank(data)) {
            return "";
        }
        String encryptedData = null;
        try {
            //DES算法要求有一个可信任的随机数源
            SecureRandom sr = new SecureRandom();
            DESKeySpec deskey = new DESKeySpec(DES_KEY);
            // 创建一个密匙工厂，然后用它把DESKeySpec转换成一个SecretKey对象
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey key = keyFactory.generateSecret(deskey);
            // 加密对象
            Cipher cipher = Cipher.getInstance("DES");
            cipher.init(Cipher.ENCRYPT_MODE, key, sr);
            // 加密，并把字节数组编码成字符串
            data = new sun.misc.BASE64Encoder().encode(cipher.doFinal(data.getBytes()));
            //二次加密
            deskey = new DESKeySpec(DES_KEY2);
            key = keyFactory.generateSecret(deskey);
            cipher.init(Cipher.ENCRYPT_MODE, key, sr);
            encryptedData = new sun.misc.BASE64Encoder().encode(cipher.doFinal(data.getBytes()));
        } catch (Exception e) {
//            log.error("加密错误，错误信息：", e);
            throw new RuntimeException("加密错误，错误信息：", e);
        }
        return encryptedData;
    }


}
