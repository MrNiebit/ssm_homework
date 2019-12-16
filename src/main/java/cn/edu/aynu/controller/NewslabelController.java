package cn.edu.aynu.controller;

import cn.edu.aynu.pojo.Newslabel;
import cn.edu.aynu.pojo.SqlPage;
import cn.edu.aynu.service.NewslabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/newslabel")
public class NewslabelController {

    @Autowired
    private NewslabelService newslabelService;


    @RequestMapping("/management")

    /*
     * @param model
     * @param currentPage : 当前页数
     * @param select    : 0 查询所有栏目, 其他值 查询父栏目对应的子栏目
     * @param pageSize  : 每页显示的数量
     *
     * @return
     * @author nie
     */

    public String newslabelManage(Model model,
                                  @RequestParam(value = "page", defaultValue = "1") int currentPage,
                                  @RequestParam(defaultValue = "0") Integer select,
                                  @RequestParam(defaultValue = "3") Integer pageSize) {
        SqlPage<Newslabel> sqlPage = newslabelService.getSqlPage(currentPage, select, pageSize);
        model.addAttribute("page_list", sqlPage);
        model.addAttribute("byPid", newslabelService.findByPid(0));
        model.addAttribute("pid", select);
        return "/html/news/栏目管理.jsp";
    }

    @GetMapping("/addPage")
    public String addPage(Model model) {
        model.addAttribute("byPid", newslabelService.findByPid(0));
        return "/html/news/栏目添加.jsp";
    }



    /*
     * 如果接收参数, 方法必须有返回值
     * 测试: 用void, 接收Newslabel对象, 报400错误
     *
     * */

    @PostMapping("/addNewslabel")
    public String addNewslabel(Model model, Newslabel newslabel) {
        System.out.println(newslabel);
        int rows = newslabelService.addNewslabel(newslabel);
        if (rows > 0) {
            model.addAttribute("msg", "添加成功");
        } else {
            model.addAttribute("msg", "添加失败");
        }
        model.addAttribute("byPid", newslabelService.findByPid(0));
        return "/html/news/栏目添加.jsp";
    }

    /**
     * Description: 删除栏目 <br/>
     * @date: 19-12-15 下午2:59 <br/>
     * @param: [model, id栏目的主键, currentPage当前页数, select栏目的pid] <br/>
     * @return:java.lang.String
     */
    @GetMapping("/deleteNewslabel")
    public String deleteNewslabel(Model model,
                                  @RequestParam Integer id,
                                  @RequestParam Integer currentPage,
                                  @RequestParam(defaultValue = "null") Integer select) {
        int rows = newslabelService.deleteNewslabel(id);
        if (rows > 0) {
            model.addAttribute("msg", "删除成功");
        } else {
            model.addAttribute("msg", "删除失败");
        }
        SqlPage<Newslabel> sqlPage = newslabelService.getSqlPage(currentPage, select, 3);
        model.addAttribute("page_list", sqlPage);
        model.addAttribute("byPid", newslabelService.findByPid(id));
        model.addAttribute("pid", select);
        return "/html/news/栏目管理.jsp";
    }


    @GetMapping("/modifyPage")
    public String modifyPage(Model model, @RequestParam Integer id) {
        model.addAttribute("newslabel", newslabelService.findById(id));
        model.addAttribute("byPid", newslabelService.findByPid(id));
        return "/html/news/栏目修改.jsp";
    }

    @PostMapping("/modifyNewslabel")
    public String modifyNewslabel(Model model, @ModelAttribute Newslabel newslabel) {
        // 这里 包装类之间的比较 是用equals,  == 比较的是地址
        if (newslabel.getId().equals(newslabel.getPid())){
            model.addAttribute("msg", "修改失败");
        }else {
            int rows = newslabelService.modifyNewslabel(newslabel);
            if (rows > 0) {
                model.addAttribute("msg", "修改成功");
            } else {
                model.addAttribute("msg", "修改失败");
            }
        }
        model.addAttribute("newslabel", newslabel);
        model.addAttribute("byPid", newslabelService.findByPid(0));
        return "/html/news/栏目修改.jsp";
    }

}
