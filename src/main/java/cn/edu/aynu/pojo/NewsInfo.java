package cn.edu.aynu.pojo;


public class NewsInfo {

    private Integer id;
    private Integer uid;
    private Integer labelId;
    private String title;
    private String content;
    private String date;
    private String hour;
    private String minute;
    private String seconds;
    private Newslabel newslabel;
    private String suggest;
    private Integer status;


    public NewsInfo() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getLabelId() {
        return labelId;
    }

    public void setLabelId(Integer labelId) {
        this.labelId = labelId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public Newslabel getNewslabel() {
        return newslabel;
    }

    public void setNewslabel(Newslabel newslabel) {
        this.newslabel = newslabel;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getMinute() {
        return minute;
    }

    public void setMinute(String minute) {
        this.minute = minute;
    }

    public String getSeconds() {
        return seconds;
    }

    public void setSeconds(String seconds) {
        this.seconds = seconds;
    }

    public String getHour() {
        return hour;
    }

    public void setHour(String hour) {
        this.hour = hour;
    }

    public String getSuggest() {
        return suggest;
    }

    public void setSuggest(String suggest) {
        this.suggest = suggest;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "NewsInfo{" +
                "id=" + id +
                ", uid=" + uid +
                ", labelId=" + labelId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", date='" + date + '\'' +
                ", hour='" + hour + '\'' +
                ", minute='" + minute + '\'' +
                ", seconds='" + seconds + '\'' +
                ", newslabel=" + newslabel +
                ", suggest='" + suggest + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}