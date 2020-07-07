package entity;

public class students {
    private String name,gender,department,major;
    private int clas;//class不可使用，统一改为clas

    public students(){}

    public students(String name, String gender, String department, String major, int clas) {
        this.name = name;
        this.gender = gender;
        this.department = department;
        this.major = major;
        this.clas = clas;
    }

    @Override
    public String toString() {
        return "students{" +
                "name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", department='" + department + '\'' +
                ", major='" + major + '\'' +
                ", clas=" + clas +
                '}';
    }

    public String getName() {
        return name;
    }

    public String getGender() {
        return gender;
    }

    public String getDepartment() {
        return department;
    }

    public String getMajor() {
        return major;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setClas(int clas) {
        this.clas = clas;
    }

    public int getClas() {
        return clas;
    }
}
