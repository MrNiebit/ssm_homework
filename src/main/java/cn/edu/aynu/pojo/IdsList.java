package cn.edu.aynu.pojo;


import java.util.List;

/*
 * @return
 * @param 存储id
 * @author: nie
 */
public class IdsList {

    private List<Integer> ids;

    public List<Integer> getIds() {
        return ids;
    }

    public void setIds(List<Integer> ids) {
        this.ids = ids;
    }

    @Override
    public String toString() {
        return "IdsList{" +
                "ids=" + ids +
                '}';
    }
}
