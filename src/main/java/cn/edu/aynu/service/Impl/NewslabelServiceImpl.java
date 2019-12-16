package cn.edu.aynu.service.Impl;

import cn.edu.aynu.dao.NewslabelDao;
import cn.edu.aynu.pojo.Newslabel;
import cn.edu.aynu.pojo.SqlPage;
import cn.edu.aynu.service.NewslabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewslabelServiceImpl implements NewslabelService {

    @Autowired
    private NewslabelDao newslabelDao;

    @Override
    public SqlPage<Newslabel> getSqlPage(Integer currentPage, Integer pid, Integer pageSize){
//        if ("no".equals(pid)){
//            pid = "not null";
//        }
        SqlPage<Newslabel> sqlPage = new SqlPage<>(pageSize);
        // 把总数量放在设置当前页数前, 算出总页数, if 当前页数 > 总页数 则 当前页数 = 总页数
        sqlPage.setTotalCount(newslabelDao.selectAll(pid).size());
        sqlPage.setPid(pid);
        sqlPage.setCurrentPage(currentPage);
        sqlPage.setDatas(newslabelDao.selectByPage(sqlPage));
        return sqlPage;
    }

    @Override
    public List<Newslabel> findByPid(Integer id){
        return newslabelDao.findByPid(id);
    }

    @Override
    public int addNewslabel(Newslabel newslabel) {
        if (newslabel.getPid() == 0){
            newslabel.setPid(null);
        }
        return newslabelDao.addNewslabel(newslabel);
    }

    /*
    * 这里为了复习spring事务, 没有使用mysql自带的级联
    * 删除某个栏目的时候, 并删除其子栏目
    *
    * */

    @Override
    public int deleteNewslabel(Integer id) {
        List<Newslabel> list = newslabelDao.selectAll(id);
        for (Newslabel newslabel : list){
            newslabelDao.deleteNewslabel(newslabel.getId());
        }
        return newslabelDao.deleteNewslabel(id);
    }

    @Override
    public Newslabel findById(Integer id) {
        return newslabelDao.findById(id);
    }

    @Override
    public int modifyNewslabel(Newslabel newslabel) {
        if (newslabel.getPid() == 0){
            newslabel.setPid(null);
        }
        return newslabelDao.modifyNewslabel(newslabel);
    }

    @Override
    public List<Newslabel> findAll() {
        return newslabelDao.findAll();
    }


}
