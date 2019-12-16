package cn.edu.aynu.pojo;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/9 0009
 */
public class SelectTime {

    private String startTime;
    private String startHour;
    private String startMin;

    private String endTime;
    private String endHour;
    private String endMin;

    public String getStartTime() {
        return startTime;
    }


    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getStartHour() {
        return startHour;
    }

    public void setStartHour(String startHour) {
        this.startHour = startHour;
    }

    public String getStartMin() {
        return startMin;
    }

    public void setStartMin(String startMin) {
        this.startMin = startMin;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getEndHour() {
        return endHour;
    }

    public void setEndHour(String endHour) {
        this.endHour = endHour;
    }

    public String getEndMin() {
        return endMin;
    }

    public void setEndMin(String endMin) {
        this.endMin = endMin;
    }

    @Override
    public String toString() {
        return "SelectTime{" +
                "startTime='" + startTime + '\'' +
                ", startHour='" + startHour + '\'' +
                ", startMin='" + startMin + '\'' +
                ", endTime='" + endTime + '\'' +
                ", endHour='" + endHour + '\'' +
                ", endMin='" + endMin + '\'' +
                '}';
    }
}
