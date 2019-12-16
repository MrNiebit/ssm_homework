package cn.edu.aynu.pojo;

public class Newslabel {

    private Integer id;
    private String labelName;
    private String labelContent;
    private Newslabel newslabel;
    private Integer pid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLabelName() {
        return labelName;
    }

    public void setLabelName(String labelName) {
        this.labelName = labelName;
    }

    public String getLabelContent() {
        return labelContent;
    }

    public void setLabelContent(String labelContent) {
        this.labelContent = labelContent;
    }

    public Newslabel getNewslabel() {
        return newslabel;
    }

    public void setNewslabel(Newslabel newslabel) {
        this.newslabel = newslabel;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    @Override
    public String toString() {
        return "Newslabel{" +
                "id=" + id +
                ", labelName='" + labelName + '\'' +
                ", labelContent='" + labelContent + '\'' +
                ", newslabel=" + newslabel +
                ", pid=" + pid +
                '}';
    }
}
