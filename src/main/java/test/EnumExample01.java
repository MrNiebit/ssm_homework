package test;

public enum EnumExample01 {

    ONE("one"), TWO("two"){
        // 这里的区域可以复写枚举中的方法
    };

    public static String words = "你好, 世界!";

    EnumExample01(String s) {
        System.out.println("这个是" + s + "的构造方法执行.....");
    }

    public void say(){
        System.out.println(words);
    }

    public void test(EnumExample01 enumExample01){
        switch (enumExample01){
            case TWO:
                System.out.println("这个是TWO实例");
                break;
            case ONE:
                System.out.println("这个ONE实例");
                break;
            default:break;
        }
    }

}
