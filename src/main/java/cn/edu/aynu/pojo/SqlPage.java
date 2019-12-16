package cn.edu.aynu.pojo;

import java.util.List;

public class SqlPage<T> {

    private int currentPage;  // 当前页数
    private int pageSize;  // 每页显示的数量
    private int currentPageIndex;  // 当前页数的索引值
    private int pages;  // 总页数
    private int totalCount;  // 数据的总条数
    private List<T> datas;  // 数据
    private Integer pid;  // 子项目的pid, 可不用

    public SqlPage(Integer pageSize) {
        this.currentPage = 1;
        this.pageSize = pageSize;
    }
    public SqlPage(int currentPage) {
        this.currentPage = currentPage;

    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        // 如果总页数为0, 当前页数也要为1
        if (currentPage > this.pages && this.pages != 0){
            this.currentPage = this.pages;
        }else {
            this.currentPage = currentPage;
        }
        // 求当前页的索引
        this.currentPageIndex = (this.currentPage - 1) * this.pageSize;
        System.out.println(this.currentPageIndex);
    }

    public int getCurrentPageIndex() {
        return currentPageIndex;
    }

    public int getPages() {
        return pages;
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        if (totalCount % pageSize == 0){
            this.pages = totalCount / this.pageSize;
        }else{
            this.pages = (totalCount / this.pageSize) + 1;
        }
    }

    public List<T> getDatas() {
        return datas;
    }

    public void setDatas(List<T> datas) {
        this.datas = datas;
    }


    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }
}
