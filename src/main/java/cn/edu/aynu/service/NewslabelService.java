package cn.edu.aynu.service;

import cn.edu.aynu.pojo.Newslabel;
import cn.edu.aynu.pojo.SqlPage;

import java.util.List;

public interface NewslabelService {

    SqlPage<Newslabel> getSqlPage(Integer index, Integer pid, Integer pageSize);

    List<Newslabel> findByPid(Integer id);

    int addNewslabel(Newslabel newslabel);

    int deleteNewslabel(Integer id);

    Newslabel findById(Integer id);

    int modifyNewslabel(Newslabel newslabel);

    List<Newslabel> findAll();


}
