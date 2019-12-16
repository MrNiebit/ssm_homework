package cn.edu.aynu.controller;


import cn.edu.aynu.pojo.*;
import cn.edu.aynu.service.NewsInfoService;
import cn.edu.aynu.service.NewslabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;

@Controller
@RequestMapping("/news")
public class NewsInfoController {

    @Autowired
    private NewslabelService newslabelService;

    @Autowired
    private NewsInfoService newsInfoService;

    /**
     * Description: 新闻 -- 查询所有栏目 <br/>
     * @date: 19-12-14 下午9:08 <br/>
     * @param: [model] <br/>
     * @return:java.lang.String
     */
    @GetMapping("/newsPage")
    public String newsPage(Model model){
        model.addAttribute("newslabel_list", newslabelService.findAll());
        saveData(model);
        return "/html/news/新闻发布.jsp";
    }

    /**
     * Description: 添加新闻 <br/>
     * @date: 19-12-14 下午9:09 <br/>
     * @param: [model, newsInfo] <br/>
     * @return:java.lang.String
     */
    @PostMapping("/addNews")
    public String addNews(Model model, @ModelAttribute NewsInfo newsInfo) throws ParseException {
        int rows = newsInfoService.addNews(newsInfo);
        if (rows > 0){
            model.addAttribute("msg", "发布成功");
        }else{
            model.addAttribute("msg", "发布失败");
        }
        model.addAttribute("newslabel_list", newslabelService.findAll());
        saveData(model);
        return "/html/news/新闻发布.jsp";
    }

    /**
     * Description: 查询所有栏目 和 分页查询所有新闻 <br/>
     * @date: 19-12-14 下午9:10 <br/>
     * @param: [model, currentPage, pageSize] <br/>
     * @return:java.lang.String
     */
    @GetMapping("/selectPage")
    public String selectPage(Model model,
                             @RequestParam(value = "page", defaultValue = "1") Integer currentPage,
                             @RequestParam(defaultValue = "3") Integer pageSize){
        select(model, currentPage, pageSize);
        return "/html/news/新闻维护_普通查询.jsp";
    }

    @GetMapping("/selectPage2")
    public String selectPage2(Model model, @RequestParam(value = "page", defaultValue = "1") Integer currentPage,
                              @RequestParam(defaultValue = "3") Integer pageSize){
        select(model, currentPage, pageSize);
        return "/html/news/新闻维护_按时间查询.jsp";
    }

    /**
     * Description: 执行的函数 (查询所有栏目和所有新闻) <br/>
     * @date: 19-12-14 下午9:11 <br/>
     * @param: [model, currentPage当前页数, pageSize每页显示的数量] <br/>
     * @return:void
     */
    public void select(Model model, Integer currentPage, Integer pageSize){
        model.addAttribute("newslabel_list", newslabelService.findAll());
        saveData(model);
        // 分页查询所有的新闻
        SqlPage<NewsInfo> sqlPage = newsInfoService.getSqlPage(currentPage, pageSize);
        for (NewsInfo newsInfo : sqlPage.getDatas()){
            System.out.println(newsInfo);
        }
        model.addAttribute("page_list", sqlPage);
    }


    /**
     *
     * @param model
     * @param idsList
     * @param page  当前页数
     * @param pageSize
     * @param labelId  新闻所属栏目的id
     * @param title   标题模糊查询
     * @return
     */
    @PostMapping("/deleteNews")
    public String deleteNews(Model model,
                             @ModelAttribute IdsList idsList,
                             @RequestParam(defaultValue = "1") Integer page,
                             @RequestParam(defaultValue = "3") Integer pageSize,
                             @RequestParam(defaultValue = "null") Integer labelId,
                             @RequestParam(defaultValue = "") String title){
        delete(model, idsList);
        model.addAttribute("page_list", newsInfoService.selectMany(page, pageSize, labelId, title));
        model.addAttribute("newslabel_list", newslabelService.findAll());
        saveData(model);
        model.addAttribute("labelId", labelId);
        model.addAttribute("title", title);
        return "/html/news/新闻维护_普通查询.jsp";
    }

    @PostMapping("/deleteNews2")
    public String deleteNews2(Model model,
                              @ModelAttribute IdsList idsList,
                              @ModelAttribute SelectTime selectTime,
                              @RequestParam(defaultValue = "1") Integer currentPage,
                              @RequestParam(defaultValue = "3") Integer pageSize){
        delete(model, idsList);
        model.addAttribute("page_list", newsInfoService.selectByTime(selectTime, currentPage, pageSize));
        model.addAttribute("time", selectTime);
        saveData(model);
        return "/html/news/新闻维护_按时间查询.jsp";
    }

    /**
     * Description: 批量删除新闻 <br/>
     * @date: 19-12-14 下午9:20 <br/>
     * @param: [model, idsList] 新闻id的集合所属对象 <br/>
     * @return:void
     */
    public void delete(Model model, IdsList idsList){
        System.out.println(idsList.getIds().size());
        int rows = newsInfoService.deleteNews(idsList);
        if (rows > 0){
            model.addAttribute("msg", "删除成功");
        }else{
            model.addAttribute("msg", "删除失败");
        }
        // model.addAttribute("newslabel_list", newslabelService.findAll());
        // saveData(model);
        // // 分页查询所有的新闻
        // SqlPage<NewsInfo> sqlPage = newsInfoService.getSqlPage(currentPage, pageSize);
        // for (NewsInfo newsInfo : sqlPage.getDatas()){
        //     System.out.println(newsInfo);
        // }
        // model.addAttribute("page_list", sqlPage);
    }

    /**
     * Description: 查询单条新闻的详细信息 <br/>
     * @date: 19-12-14 下午9:19 <br/>
     * @param: [model, id] <br/>
     * @return:java.lang.String
     */
    @GetMapping("/selectOne")
    public String selectOne(Model model, @RequestParam Integer id){
        model.addAttribute("news", newsInfoService.selectOne(id));
        return "/html/news/查看新闻详细信息.jsp";
    }

    @GetMapping("/modifyPage")
    public String modifyPage(Model model, @RequestParam Integer id){
        model.addAttribute("news", newsInfoService.selectOne(id));
        model.addAttribute("newslabel_list", newslabelService.findAll());
        saveData(model);
        return "/html/news/新闻修改.jsp";
    }

    /**
     * Description: 修改新闻 <br/>
     * @date: 19-12-14 下午9:18 <br/>
     * @param: [model, newsInfo新闻实体类] <br/>
     * @return:java.lang.String
     */
    @PostMapping("/modifyNews")
    public String modifyNews(Model model, @ModelAttribute NewsInfo newsInfo){

        int rows = newsInfoService.updateNews(newsInfo);
        if (rows > 0){
            model.addAttribute("msg", "修改成功");
        }else{
            model.addAttribute("msg", "修改失败");
        }
        model.addAttribute("newslabel_list", newslabelService.findAll());
        saveData(model);
        model.addAttribute("news", newsInfo);
        return "/html/news/新闻修改.jsp";
    }


    /**
     * Description: 根据栏目 或 新闻标题 进行模糊查询 <br/>
     * @date: 19-12-14 下午9:15 <br/>
     * @param: [model, labelId栏目id, title新闻标题, currentPage当前页数, pageSize每页显示的数量] <br/>
     * @return:java.lang.String
     */
    @GetMapping("/selectMany")
    public String selectMany(Model model,
                             @RequestParam(defaultValue = "0") Integer labelId,
                             @RequestParam(defaultValue = "") String title,
                             @RequestParam(value = "page", defaultValue = "1") Integer currentPage,
                             @RequestParam(defaultValue = "3") Integer pageSize){

        model.addAttribute("page_list", newsInfoService.selectMany(currentPage, pageSize, labelId, title));
        model.addAttribute("newslabel_list", newslabelService.findAll());
        saveData(model);
        model.addAttribute("labelId", labelId);
        model.addAttribute("title", title);
        return "/html/news/新闻维护_普通查询.jsp";
    }


    // 重复性函数User user = new User();
    public void saveData(Model model) {
        User user = new User();
        user.setUid(1);
        user.setNickname("张三");
        model.addAttribute("user", user);
    }

    /**
     * 前台传入多个参数, 后台只想需要将部分的参数转化为对象, 可以实现
     * @param model
     *       selectTime对象的封装
     * @param currentPage
     * @param pageSize
     * @return
     */
    @RequestMapping("/selectByTime")
    public String selectByTime(Model model,
                               @ModelAttribute SelectTime selectTime,
                               @RequestParam(value = "page", defaultValue = "1") Integer currentPage,
                               @RequestParam(defaultValue = "3") Integer pageSize){
        model.addAttribute("page_list", newsInfoService.selectByTime(selectTime, currentPage, pageSize));
        model.addAttribute("time", selectTime);
        saveData(model);
        return "/html/news/新闻维护_按时间查询.jsp";
    }

    @GetMapping("/verifyPage")
    public String verifyPage(Model model, @RequestParam Integer id){
        model.addAttribute("news", newsInfoService.selectOne(id));
        saveData(model);
        return "/html/news/新闻审核.jsp";
    }

    /**
     * Description: 审核新闻 <br/>
     * @date: 19-12-15 上午10:34 <br/>
     * @param: [model, id新闻的主键, suggest审核意见, status审核状态] <br/>
     * @return:java.lang.String
     */
    @PostMapping("/newsinfoVerify")
    public String newsinfoVerify(Model model,
                                 @RequestParam Integer id,
                                 @RequestParam String suggest,
                                 @RequestParam Integer status){
        NewsInfo newsInfo = newsInfoService.selectOne(id);
        newsInfo.setSuggest(suggest);
        newsInfo.setStatus(status);
        int rows = newsInfoService.updateNews(newsInfo);
        if (rows > 0) {
            model.addAttribute("msg", "审核成功");
        } else {
            model.addAttribute("msg", "审核失败");
        }
        model.addAttribute("news", newsInfo);
        saveData(model);
        return "/html/news/新闻审核.jsp";
    }


}
