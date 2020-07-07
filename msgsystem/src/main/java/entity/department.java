package entity;

public enum department {
    院系,外国语学院,信息技术学院,艺术设计学院,经济管理学院,会计学院,建筑工程学院;
}
enum english {
    商务日语,商务英语,外贸英语,阿拉伯语,葡萄牙语,韩语;
}
enum computer{
    计算机科学,通信工程,网络工程,软件工程,游戏开发,网页开发;
}
enum art{
    动漫设计,服装工程,动画制作,艺术设计,中外美术史,美术概论;
}
enum economy{
    金融工程,人力资源,航空,市场管理,行政管理,金融学;
}
enum accountant{
    会计学,财务管理,审计学,市场管理,国际商务,鉴证
}
enum build{
    岩石工程,结构工程,市政工程,建筑设计,轨道工程,房屋设计;
}
//        SELECT MAJOR FROM STUDENTS WHERE DEPARTMENT='外国语学院' GROUP BY MAJOR
//
//        SELECT MAJOR FROM STUDENTS WHERE DEPARTMENT='信息技术学院' GROUP BY MAJOR
//
//        SELECT MAJOR FROM STUDENTS WHERE DEPARTMENT='艺术设计学院' GROUP BY MAJOR
//
//        SELECT MAJOR FROM STUDENTS WHERE DEPARTMENT='经济管理学院' GROUP BY MAJOR
//
//        SELECT MAJOR FROM STUDENTS WHERE DEPARTMENT='会计学院' GROUP BY MAJOR
//
//        SELECT MAJOR FROM STUDENTS WHERE DEPARTMENT='建筑工程学院' GROUP BY MAJOR