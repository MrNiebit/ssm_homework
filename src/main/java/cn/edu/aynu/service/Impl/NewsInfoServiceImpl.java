package cn.edu.aynu.service.Impl;

import cn.edu.aynu.dao.NewsInfoDao;
import cn.edu.aynu.pojo.IdsList;
import cn.edu.aynu.pojo.NewsInfo;
import cn.edu.aynu.pojo.SelectTime;
import cn.edu.aynu.pojo.SqlPage;
import cn.edu.aynu.service.NewsInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.List;

@Service
public class NewsInfoServiceImpl implements NewsInfoService {

    @Autowired
    private NewsInfoDao newsInfoDao;

    @Override
    public int addNews(NewsInfo newsInfo) throws ParseException {
        //添加当前时间
//        Date now = new Date();
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
//        java.util.Date date = sdf.parse(sdf.format(timestamp));

//        String s = sdf.format(now.getTime());
//        System.out.println(s);
//        java.sql.Date d1 = (java.sql.Date) sdf.parse(s);  //先把字符串转为util.Date对象
//        java.sql.Date d2 = new java.sql.Date(date);  //再转换为sql.Date对象
//        newsInfo.setTimePublish(d2);
//        System.out.println(newsInfo.getTimePublish());
        return newsInfoDao.addNews(newsInfo);
    }

    /*
     * 查询所有新闻
     * */

    @Override
    public List<NewsInfo> selectAll() {
        return newsInfoDao.selectAll();
    }

    /*
    * 分页查询新闻
    * */

    @Override
    public SqlPage<NewsInfo> getSqlPage(Integer currentPage, Integer pageSize){
//        if ("no".equals(pid)){
//            pid = "not null";
//        }
        SqlPage<NewsInfo> sqlPage = new SqlPage<>(pageSize);
        // 把总数量放在设置当前页数前, 算出总页数, if 当前页数 > 总页数 则 当前页数 = 总页数
        sqlPage.setTotalCount(newsInfoDao.selectAll().size());
        sqlPage.setCurrentPage(currentPage);
        sqlPage.setDatas(newsInfoDao.selectByPage(sqlPage));
        return sqlPage;
    }

    @Override
    public int deleteNews(IdsList idsList) {
        return newsInfoDao.deleteNews(idsList);
    }


    @Override
    public NewsInfo selectOne(Integer id) {
        return newsInfoDao.selectOne(id);
    }

    @Override
    public int updateNews(NewsInfo newsInfo) {
        return newsInfoDao.updateNews(newsInfo);
    }


    @Override
    public SqlPage<NewsInfo> selectMany(Integer currentPage, Integer pageSize, Integer labelId, String title) {
        SqlPage<NewsInfo> sqlPage = new SqlPage<>(pageSize);
        // 把总数量放在设置当前页数前, 算出总页数, if 当前页数 > 总页数 则 当前页数 = 总页数
        sqlPage.setTotalCount(newsInfoDao.selectMany2(labelId, title).size());
        sqlPage.setCurrentPage(currentPage);
        sqlPage.setDatas(newsInfoDao.selectMany(labelId, title, sqlPage));
        return sqlPage;
    }

    @Override
    public SqlPage<NewsInfo> selectByTime(SelectTime selectTime, Integer currentPage, Integer pageSize) {
        SqlPage<NewsInfo> sqlPage = new SqlPage<>(pageSize);
        // 把总数量放在设置当前页数前, 算出总页数, if 当前页数 > 总页数 则 当前页数 = 总页数
        sqlPage.setTotalCount(newsInfoDao.selectByTime(selectTime).size());
        sqlPage.setCurrentPage(currentPage);
        sqlPage.setDatas(newsInfoDao.selectByTimeAllDatas(selectTime, sqlPage));
        return sqlPage;
    }


}
