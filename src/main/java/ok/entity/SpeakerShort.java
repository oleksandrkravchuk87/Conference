package ok.entity;

/**
 * Created by OKK on 25.04.2017.
 */
public class SpeakerShort {

        private String title;
        private String firstName;
        private String secondName;
        private String reports;
    public SpeakerShort(){};
        public SpeakerShort(Speaker s){
            this.title = s.getTitle();
            this.firstName=s.getFirstName();
            this.secondName=s.getSecondName();
            String temp ="";
            /*for (Report r: s.getReportList()) {
                temp += (r.getTitle()+";"+"\\n");
            }
            this.reports = temp;*/
        }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSecondName() {
        return this.secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public String getReports() {
        return this.reports;
    }

    public void setReports(String reports) {
        this.reports = reports;
    }
}

