package cn.edu.aynu.dao;

import cn.edu.aynu.pojo.Newslabel;
import cn.edu.aynu.pojo.SqlPage;
import cn.edu.aynu.sqlbuild.SqlBuild;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

public interface NewslabelDao {




    /**
     * 通过pid, 查找 指定父栏目的所有子栏目
     * @param pid
     * @return
     */
    @Results(
            id = "newslabelMap",
            value = {
                    @Result(id = true, column = "id", property = "id"),
                    @Result(column = "label_name", property = "labelName"),
                    @Result(column = "label_content", property = "labelContent"),
                    @Result(column = "pid", property = "pid"),
                    @Result(property = "newslabel", column = "pid", one = @One(
                            select = "cn.edu.aynu.dao.NewslabelDao.findById", fetchType = FetchType.EAGER))
                    /*
                    * FetchType.EAGER: 急加载, 加载一个实体时, 定义急加载的属性会立即从数据库中加载
                    * FetchType.LAZY: 懒加载, 加载一个实体时, 定义懒加载的属性不会马上从数据库中加载
                    * */
            }
    )
//    @Select("select id, label_name, label_content, pid from newlabel where pid = #{pid}")
    @SelectProvider(type = SqlBuild.class, method = "selectAll")
    List<Newslabel> selectAll(@Param("pid") Integer pid);   //// 根据pid查找父栏目


    /**
     *
     * @param sqlPage
     * @return
     */
    @ResultMap("newslabelMap")
//    @Select("select id, label_name, label_content, pid from newlabel where pid = #{pid} limit #{currentPageIndex}, #{pageSize}")
    @SelectProvider(type = SqlBuild.class, method = "selectBy")
    List<Newslabel> selectByPage(SqlPage<Newslabel> sqlPage);
    /*一直异常  猜想: 接口这里的参数 要么只放对象, 要么只放非对象参数
    * 结论: 参数可以同时放 对象和普通参数, 都需要加@param
    *       如果同时传入两个对象, 不能通过#{}获取, 只能通过@SelectProvider Map集合中查找
    * */


    /**
     * 查找单个栏目(包括子栏目或父栏目)
     * @param id
     * @return
     */
    @Select("select id, label_name, label_content, pid from newlabel where id = #{id}")
    @ResultMap("newslabelMap")
    Newslabel findById(@Param("id") Integer id);    // 根据id查询栏目



    /**
     *
     * 如果一个栏目的父栏目是它本身, 就会因为newslabelMap, 陷入死循环, 导致栈溢出
     *
     * Handler processing failed; nested exception is java.lang.StackOverflowError
     * 所以在修改栏目的父栏目的时候, 不能设置自己为自己的父栏目
     *
     *
     * */


    /**
     *
     * @param id  栏目的id
     *              如果传来的值为0, 因为表中的id没有为0的值, 所以 id != 0 恒成立
     *              也可以用来查询所有的父栏目, 并且不包括当前的父栏目, 即传来的id所对应的父栏目
     * @return
     */

    @Select("select id, label_name, label_content, pid from newlabel where pid is null and id != #{id}")
    @ResultMap("newslabelMap")
    List<Newslabel> findByPid(@Param("id") Integer id);    // 根据pid查找父栏目


    /**
     * 添加栏目
     * @param newslabel
     * @return
     */
//    @InsertProvider(type = SqlBuild.class, method = "addNewslabel")
    @Insert("insert into newlabel (label_name, label_content, pid) values (#{labelName}, #{labelContent}, #{pid} )")
    int addNewslabel(Newslabel newslabel);


    /**
     * 删除栏目
     * @param id
     * @return
     */
    @Delete("delete from newlabel where id = #{id}")
    int deleteNewslabel(@Param("id") Integer id);


    /**
     * 修改栏目
     * @param newslabel
     * @return
     */
    @Update("update newlabel set label_name = #{labelName}, label_content = #{labelContent}, pid = #{pid}" +
            " where id = #{id}")
    int modifyNewslabel(Newslabel newslabel);


    /**
     * 查询所有的栏目
     * @return
     */
    @Select("select * from newlabel")
    @ResultMap("newslabelMap")
    List<Newslabel> findAll();


}
