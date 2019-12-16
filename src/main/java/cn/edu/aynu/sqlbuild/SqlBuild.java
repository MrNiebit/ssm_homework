package cn.edu.aynu.sqlbuild;

import cn.edu.aynu.pojo.*;

import javax.rmi.CORBA.Tie;
import java.util.List;
import java.util.Map;

public class SqlBuild {


    public String selectAll(Map map){
        StringBuffer sql = new StringBuffer("select id, label_name, label_content, pid from newlabel ");
        Integer pid = (Integer) map.get("pid");
        if (0 == pid){
            return sql.toString();
        }
        sql.append("where pid = " + pid);
        return sql.toString();
    }

    public String selectBy(SqlPage<Newslabel> sqlPage) {
        StringBuffer buffer = new StringBuffer("select id, label_name, label_content, pid from newlabel ");
        if (0 == sqlPage.getPid()) {
            buffer.append("limit " + sqlPage.getCurrentPageIndex() + ", " + sqlPage.getPageSize());
            return buffer.toString();
        }
        buffer.append("where pid = " + sqlPage.getPid() + " limit " + sqlPage.getCurrentPageIndex() + ", " + sqlPage.getPageSize());
        return buffer.toString();
    }

    /*
     * @return
     * @param 批量删除新闻
     * @author: nie
     */

    public String deleteNews(IdsList list){
        System.out.println(list);
        StringBuffer buffer = new StringBuffer("delete from newmanage where ");
        List<Integer> idsList = list.getIds();
        if (idsList.size() == 1){
            buffer.append("1 = 0");
        }else{
            buffer.append("id in ( ");
            for (Integer id : idsList){
                buffer.append(id + ", ");
            }
            buffer.deleteCharAt(buffer.length() - 2);
            buffer.append(")");
        }
        return buffer.toString();
    }

    /**
     * @return 模糊查询
     * @param map 这里接收参数的时候, 接口上不能使用@Param. 否则会接收不到
     * @author: nie
     */
    public String selectMany(Map map){
        System.out.println(map);
        SqlPage sqlPage = (SqlPage) map.get("arg2");
        Integer labelId = (Integer) map.get("arg0");
        String title = (String) map.get("arg1");
        StringBuffer sql = new StringBuffer("select id, uid, labelid, title, content, date_format(time, '%Y-%m-%d') " +
                "as date , date_format(time, '%H') as hour, date_format(time, '%i') as minute," +
                " date_format(time, '%s') as seconds, suggest, status from newmanage ");
        if (labelId == 0){
            sql.append(" where title like concat('%', '" + title + "', '%') limit " + sqlPage.getCurrentPageIndex() + ", " + sqlPage.getPageSize());
        }else{
            sql.append(" where labelid = " + labelId + " and title like concat('%','" + title + "','%') limit " + sqlPage.getCurrentPageIndex() + ", " + sqlPage.getPageSize());
        }
        return sql.toString();
    }

    public String selectMany2(Integer labelId, String title){
        StringBuffer sql = new StringBuffer("select id, uid, labelid, title, content, date_format(time, '%Y-%m-%d') " +
                "as date , date_format(time, '%H') as hour, date_format(time, '%i') as minute," +
                " date_format(time, '%s') as seconds, suggest, status from newmanage ");
        if (labelId == 0){
            sql.append(" where title like concat('%', '" + title + "', '%')");
        }else{
            sql.append(" where labelid = " + labelId + " and title like concat('%','" + title + "','%')");
        }
        return sql.toString();
    }

    /*
     * @return
     * @param map  根据参数的位置 arg0, arg1 获取对应的对象
     * @author: nie
     */

    public String selectByTime(SelectTime selectTime, SqlPage<NewsInfo> sqlPage){
//        System.out.println(map);
//        SelectTime selectTime = (SelectTime) map.get("arg0");
//        SqlPage sqlPage = (SqlPage) map.get("arg1");
        return "select id, uid, labelid, title, content, date_format(time, '%Y-%m-%d') " +
                "as date , date_format(time, '%H') as hour, date_format(time, '%i') as minute," +
                " date_format(time, '%s') as seconds, suggest, status from newmanage where time >= '" + selectTime.getStartTime() +
                " " + selectTime.getStartHour() + ":" + selectTime.getStartMin() + "' and time <= '" + selectTime.getEndTime() +
                " " + selectTime.getEndHour() + ":" + selectTime.getEndMin()+ "' limit " + sqlPage.getCurrentPageIndex() +
                ", " + sqlPage.getPageSize();

    }




    /*
    * 测试成功, 下面方法可用 接口方法名和 sql语句构造方法名一样, 可以使用#{}获取对象的属性
    * */

//    public String addNewslabel(Newslabel newslabel){
//        System.out.println(newslabel);
//        StringBuffer buffer = new StringBuffer("insert into newlabel (label_name, label_content, pid) values ( ");
////        buffer.append(newslabel.getLabelName() + ", " + newslabel.getLabelContent() + ", " + newslabel.getPid() + " )");
//        buffer.append("#{labelName}, #{labelContent}, #{pid} )");
//        return buffer.toString();
//    }

}
