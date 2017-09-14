package cn.org.eshow.component.pingpay.util;

import org.apache.commons.codec.binary.Base64;

import java.io.FileInputStream;
import java.security.*;
import java.security.spec.X509EncodedKeySpec;

/**
 * Created by alicas on 15/9/1.
 */
public class WebhooksUtil {

    /**
     *获取签名
     * @param pubKey
     * @return
     * @throws Exception
     */
    public static byte[] signBytes(String pubKey) throws Exception {
        byte[] signBytes = Base64.decodeBase64(pubKey);
        return signBytes;
    }

    /**
     * 获得公钥
     *
     * @return
     * @throws Exception
     */
    public static PublicKey getPubKey(String path) throws Exception {
        // read key bytes
        FileInputStream in = new FileInputStream(path);
        byte[] keyBytes = new byte[in.available()];
        in.read(keyBytes);
        in.close();

        String pubKey = new String(keyBytes, "UTF-8");
        pubKey = pubKey.replaceAll("(-+BEGIN PUBLIC KEY-+\\r?\\n|-+END PUBLIC KEY-+\\r?\\n?)", "");

        keyBytes = Base64.decodeBase64(pubKey);

        // generate public key
        X509EncodedKeySpec spec = new X509EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PublicKey publicKey = keyFactory.generatePublic(spec);
        return publicKey;
    }

    /**
     * 验证签名
     * @param data
     * @param sigBytes
     * @param publicKey
     * @return
     * @throws NoSuchAlgorithmException
     * @throws InvalidKeyException
     * @throws SignatureException
     */
    public static boolean verifyData(byte[] data, byte[] sigBytes, PublicKey publicKey) throws NoSuchAlgorithmException, InvalidKeyException, SignatureException {
        Signature signature = Signature.getInstance("SHA256withRSA");
        signature.initVerify(publicKey);
        signature.update(data);
        return signature.verify(sigBytes);
    }
}
