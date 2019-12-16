package cn.edu.aynu.dao;

import cn.edu.aynu.pojo.IdsList;
import cn.edu.aynu.pojo.NewsInfo;
import cn.edu.aynu.pojo.SelectTime;
import cn.edu.aynu.pojo.SqlPage;
import cn.edu.aynu.sqlbuild.SqlBuild;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

/**
 * 对于新闻的管理
 */

public interface NewsInfoDao {

    /**
     * 添加新闻
     * @param newsInfo 新闻实体类
     * @return
     */
    @Insert("insert into newmanage (uid, labelid, title, content, time, status) values " +
            "(#{uid}, #{labelId}, #{title}, #{content}, current_timestamp(), 0)")
    int addNews(NewsInfo newsInfo);


    /**
     * 查询所有新闻, 以及所属栏目, 所属栏目的父栏目
     * @return
     */
    @Select("select * from newmanage")
    @Results(
            id = "newsInfoMap",
            value = {
                    @Result(id = true, property = "id", column = "id"),
                    @Result(property = "uid", column = "uid"),
                    @Result(property = "labelId", column = "labelid"),
                    @Result(property = "title", column = "title"),
                    @Result(property = "content", column = "content"),
                    @Result(property = "date", column = "date"),
                    @Result(property = "hour", column = "hour"),
                    @Result(property = "minute", column = "minute"),
                    @Result(property = "seconds", column = "seconds"),
                    @Result(property = "newslabel", column = "labelid", one = @One(
                            select = "cn.edu.aynu.dao.NewslabelDao.findById", fetchType = FetchType.EAGER
                        )
                    ),
                    @Result(property = "suggest", column = "suggest"),
                    @Result(property = "status", column = "status")

            }
    )
    List<NewsInfo> selectAll();


    /**
     * 分页查询所有新闻
     * @param sqlPage 分页类
     * @return
     */
    @Select("select id, uid, labelid, title, content, date_format(time, '%Y-%m-%d') " +
            "as date , date_format(time, '%H') as hour, date_format(time, '%i') as minute," +
            " date_format(time, '%s') as seconds, suggest, status from newmanage limit #{currentPageIndex}, #{pageSize}")
    @ResultMap("newsInfoMap")
    List<NewsInfo> selectByPage(SqlPage<NewsInfo> sqlPage);


    /**
     * 批量删除新闻, 可单个删除
     * @param idsList 新闻id的集合
     * @return
     */
    @DeleteProvider(type = SqlBuild.class, method = "deleteNews")
    int deleteNews(IdsList idsList);


    /**
     * @return 查询单个新闻
     * @param id 新闻id
     * @author: nie
     */

    @Select("select * from newmanage where id = #{id}")
    @ResultMap("newsInfoMap")
    NewsInfo selectOne(@Param("id") Integer id);


    /**
     * 修改新闻信息
     * @param newsInfo
     * @return
     */
    @Update("update newmanage set uid = #{uid}, labelid = #{labelId}, title = #{title}, content = #{content}, suggest = #{suggest}, status = #{status} " +
            " where id = #{id}")
    int updateNews(NewsInfo newsInfo);

    /**
     * 可以分页查询所有新闻, 也可以条件模糊查询 并分页
     * @param labelid
     * @param title
     * @param sqlPage
     * @return
     */
    @SelectProvider(type = SqlBuild.class, method = "selectMany")
    @ResultMap("newsInfoMap")
    List<NewsInfo> selectMany(Integer labelid, String title, SqlPage sqlPage);

    /**
     * @return 查询总的数量, 条件模糊查询的总数量
     * @param
     * @author: nie
     */
    @SelectProvider(type = SqlBuild.class, method = "selectMany2")
    List<NewsInfo> selectMany2(Integer labelid, String title);


    /**
     * @return 根据时间 查询总数量
     * @param selectTime 开始时间  和  结束时间 封装的对象
 *          这里要注意的是 日期_小时:分钟
     *                  日期和小时之间有一个空格, 小时和分钟之间有个':'号
     *                  否则会导致查询出的数据不匹配
     * @author: nie
     */

    @Select("select id, uid, labelid, title, content, date_format(time, '%Y-%m-%d') " +
            "as date , date_format(time, '%H') as hour, date_format(time, '%i') as minute," +
            " date_format(time, '%s') as seconds, suggest, status from newmanage where time >= concat(#{startTime}, ' ', #{startHour}, ':', #{startMin}) and time <= concat(#{endTime}, ' ', #{endHour}, ':', #{endMin})")
    @ResultMap("newsInfoMap")
    List<NewsInfo> selectByTime(SelectTime selectTime);


    /**
     *  根据时间段查询, 返回分页的数据, 规则同上
     * @param selectTime  时间的对象
     * @param sqlPage  分页类
     * @return
     */
//    @Select("select id, uid, labelid, title, content, date_format(time, '%Y-%m-%d') " +
//            "as date , date_format(time, '%H') as hour, date_format(time, '%i') as minute," +
//            " date_format(time, '%s') as seconds from newmanage where time >= concat(#{startTime},#{startHour}, #{startMin}) and time <= concat(#{endTime}, #{endHour}, #{endMin}) limit #{page.currentPageIndex}, #{page.pageSize}")
    @SelectProvider(type = SqlBuild.class, method = "selectByTime")
    @ResultMap("newsInfoMap")
    List<NewsInfo> selectByTimeAllDatas(SelectTime selectTime, SqlPage<NewsInfo> sqlPage );

}
