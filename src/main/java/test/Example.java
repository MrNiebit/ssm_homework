package test;

import org.junit.Test;

public class Example {


    @Test
    public void test01() throws IllegalAccessException, InstantiationException {
        // 获取一个实例
        EnumExample01 one = EnumExample01.valueOf("ONE");
        EnumExample01 two = EnumExample01.TWO;
        System.out.println(one);
        System.out.println(one.toString());
        one.say();
        System.out.println(two);
        two.say();
        System.out.println(EnumExample01.words.split(",")[0]);

        System.out.println(EnumExample01.values()[0]);
        System.out.println(EnumExample01.values()[1]);

        one.test(one);
        two.test(two);
    }

}
