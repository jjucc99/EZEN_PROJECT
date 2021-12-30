package kr.co.ezenac.members.model.vo;

public class LoginVO {
    private String id;
    private String pw;
    private boolean rememberId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public boolean isRememberId() {
        return rememberId;
    }

    public void setRememberId(boolean rememberId) {
        this.rememberId = rememberId;
    }


    public void checkInfo(){
        if(this.getId() == null && this.getPw() == null){
            throw new NullPointerException("ID와 PW에 값이 없습니다.");
        }
    }

}
