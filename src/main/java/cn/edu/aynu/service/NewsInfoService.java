package cn.edu.aynu.service;

import cn.edu.aynu.pojo.IdsList;
import cn.edu.aynu.pojo.NewsInfo;
import cn.edu.aynu.pojo.SelectTime;
import cn.edu.aynu.pojo.SqlPage;
import org.apache.ibatis.annotations.Select;

import java.text.ParseException;
import java.util.List;

public interface NewsInfoService {

    int addNews(NewsInfo newsInfo) throws ParseException;


    List<NewsInfo> selectAll();


    SqlPage<NewsInfo> getSqlPage(Integer currentPage, Integer pageSize);

    int deleteNews(IdsList idsList);

    NewsInfo selectOne(Integer id);

    int updateNews(NewsInfo newsInfo);

    /*
     * @return 模糊查询新闻
     * @param null
     * @author: nie
     */

    SqlPage<NewsInfo> selectMany(Integer currentPage, Integer pageSize, Integer labelId, String title);

    SqlPage<NewsInfo> selectByTime(SelectTime selectTime, Integer currentPage, Integer pageSize);





}
