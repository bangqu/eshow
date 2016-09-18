package cn.org.eshow.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * 随机数工具类
 */
public final class RandomCodeUtil {

    /**
     * 生成一个16位的编码
     *
     * @return String
     */
    public static final String numberCode(int length) {

        String base = "1234567890";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    /**
     *
     * @param length
     * @return
     */
    public static final String code(int length) {

        String base = "1234567890abcdefghijklmnopqrstuvwxyz";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    /**
     * 生成一个5位数组下标
     *
     * @return String
     */
    public static final List<Integer> index(int size, int length) {
        List<Integer> list = new ArrayList<Integer>();
        if (size > length) {
            for (int i = 0; i < size; i++) {
                Random random = new Random();
                int p = random.nextInt(size);
                while (list.contains(p)) {
                    p = random.nextInt(size);
                }
                if (list.size() < length) {
                    list.add(p);
                }
            }
            return list;
        }
        return null;
    }

    public static void main(String[] args) throws Exception {
//		System.out.println(RandomCodeUtil.numberCode(16));
//		System.out.println(RandomCodeUtil.code(20));
        List<Integer> list = index(100, 5);
        for (Integer integer : list) {
            System.out.println(integer);
        }

    }

}
