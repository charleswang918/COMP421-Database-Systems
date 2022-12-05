import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Scanner;

class GoBabbyApp {
    public static void main(String[] args) throws SQLException {
        try {
            DriverManager.registerDriver(new com.ibm.db2.jcc.DB2Driver());
        } catch (Exception cnfe) {
            System.out.println("Class not found");
        }

        String url = "jdbc:db2://winter2022-comp421.cs.mcgill.ca:50000/cs421";
        String userid = null;
        String passward = null;

        if (userid == null && (userid = System.getenv("SOCSUSER")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if (passward == null && (passward = System.getenv("SOCSPASSWD")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        Connection con = DriverManager.getConnection(url, userid, passward);
        Statement stmt = con.createStatement();
        ResultSet practidrs = stmt.executeQuery("SELECT * FROM Midwife;");
        try {
            ArrayList<String> practidArray = new ArrayList<String>();

            while (practidrs.next()) {
                String practid = practidrs.getString("practid");
                practidArray.add(practid);
            }


            while (true) {
                String practid;
                System.out.println("Please enter your practitioner id [E] to exit: ");
                Scanner practidin = new Scanner(System.in);
                practid = practidin.nextLine();

                if (practid.equals("E")) {
                    con.close();
                    stmt.close();
                    System.exit(1);
                } else if (practidArray.contains(practid)) {
                    mainloop:
                    while (true) {
                        String date;
                        System.out.println("Please enter the date for appointment list [E] to exit: ");
                        Scanner datein = new Scanner(System.in);
                        date = datein.nextLine();
                        ArrayList<String> appdatearray = new ArrayList<String>();
                        ResultSet appdaters = stmt.executeQuery("SELECT * FROM Appointment INNER JOIN Parent ON Parent.pid=Appointment.pid\n" +
                                "INNER JOIN Mother ON Mother.hcid=Parent.hcid\n" +
                                "WHERE practid=" + "'" + practid + "'" + ";");
                        while (appdaters.next()) {
                            String appdate = appdaters.getString("appdate");
                            appdatearray.add(appdate);
                        }
                        if (date.equals("E")) {
                            con.close();
                            stmt.close();
                            System.exit(1);
                        } else if (appdatearray.contains(date)) {
                            ArrayList<String> pidArray = new ArrayList<String>();
                            ResultSet pidrs = stmt.executeQuery("SELECT pid, ppractid FROM Pregnancy INNER JOIN Midwife ON ppractid = Midwife.practid\n" +
                                    "WHERE ppractid=" + "'" + practid + "'" + ";");
                            while (pidrs.next()) {
                                String pid = pidrs.getString("pid");
                                pidArray.add(pid);
                            }
                            ArrayList<String> appArray = new ArrayList<String>();
                            ResultSet apprs = stmt.executeQuery("SELECT apptime, Parent.pid, Mother.name, Mother.hcid FROM Appointment INNER JOIN Parent ON Parent.pid=Appointment.pid\n" +
                                    "INNER JOIN Mother ON Mother.hcid=Parent.hcid\n" +
                                    "WHERE practid=" + "'" + practid + "'" + "AND appdate=" + "'" + date + "'" + "ORDER BY apptime ASC;");
                            int count = 0;
                            while (apprs.next()) {
                                Time time = apprs.getTime("apptime");
                                String pid = apprs.getString("pid");
                                String name = apprs.getString("name");
                                String hcid = apprs.getString("hcid");
                                String p_or_b;
                                if (pidArray.contains(pid)) {
                                    p_or_b = "P";
                                } else {
                                    p_or_b = "B";
                                }
                                count++;
                                appArray.add("For " + name + " " + hcid);
                                System.out.println(count + ": " + time + " " + p_or_b + " " + name + " " + hcid);
                            }
                            System.out.println("\n");
                            apploop:
                            while (true) {
                                String appnum;
                                System.out.println("Enter the appointment number that you would like to work on.\n" +
                                        "[E] to exit [D] to go back to another date");
                                Scanner appnumin = new Scanner(System.in);
                                appnum = appnumin.nextLine();
                                if (appnum.equals("E")) {
                                    con.close();
                                    stmt.close();
                                    System.exit(1);
                                } else if (appnum.equals("D")) {
                                    continue mainloop;
                                } else if (Integer.parseInt(appnum) <= count) {
                                    choiceloop:
                                    while (true) {
                                        int choice = 0;
                                        System.out.println(appArray.get(Integer.parseInt(appnum) - 1) + "\n");
                                        System.out.println("Select an operation\n 1. Review notes\n 2. Review tests\n" +
                                                " 3. Add a note\n 4. Prescribe a test\n 5. Go back to the appointments\n" +
                                                "\n Enter your choice: ");
                                        Scanner choicein = new Scanner(System.in);
                                        choice = choicein.nextInt();
                                        String[] element = appArray.get(Integer.parseInt(appnum) - 1).split(" ");
                                        ArrayList<String> elelist = new ArrayList<String>(Arrays.asList(element));
                                        String hcid = elelist.get(3);
                                        switch (choice) {
                                            case 1:
                                                ResultSet notesrs = stmt.executeQuery("SELECT obsdate, obstime, obsnote FROM Observation INNER JOIN Appointment\n" +
                                                        "    ON Appointment.appid = Observation.appid\n" +
                                                        "INNER JOIN Parent ON Appointment.pid = Parent.pid WHERE hcid=" + "'" + hcid + "'" + "\n" +
                                                        "ORDER BY obsdate DESC;");
                                                while (notesrs.next()) {
                                                    Date obsdate = notesrs.getDate("obsdate");
                                                    Time obstime = notesrs.getTime("obstime");
                                                    String obsnote = notesrs.getString("obsnote");
                                                    System.out.println(obsdate + " " + obstime + " " + obsnote);
                                                }
                                                System.out.println();
                                                continue choiceloop;
                                            case 2:
                                                ResultSet testrs = stmt.executeQuery("SELECT presdate, testtype, results FROM MedicalTest\n" +
                                                        "    INNER JOIN Parent P on MedicalTest.pid = P.pid\n" +
                                                        "    INNER JOIN Mother M on P.hcid = M.hcid\n" +
                                                        "WHERE M.hcid =" + "'" + hcid + "'" + "ORDER BY presdate DESC;");
                                                while (testrs.next()) {
                                                    Date presdate = testrs.getDate("presdate");
                                                    String type = testrs.getString("testtype");
                                                    String result = testrs.getString("results");
                                                    if (result == null) {
                                                        result = "PENDING";
                                                    }
                                                    System.out.println(presdate + " [" + type + "] " + result);
                                                }
                                                System.out.println();
                                                continue choiceloop;
                                            case 3:
                                                int appid = 0;
                                                int obsid = 1;
                                                ResultSet obsrs = stmt.executeQuery("SELECT * FROM Observation;");
                                                while (obsrs.next()) {
                                                    obsid++;
                                                }
                                                ResultSet appidrs = stmt.executeQuery("SELECT A.appid FROM Observation INNER JOIN Appointment A on A.appid = Observation.appid\n" +
                                                        "INNER JOIN Parent P on A.pid = P.pid WHERE hcid =" + "'" + hcid + "'" + "AND appdate=" + "'" + date + "';");
                                                while (appidrs.next()) {
                                                    appid = appidrs.getInt("appid");
                                                }
                                                System.out.println("Please type your observation: ");
                                                Scanner input = new Scanner(System.in);
                                                String obs = input.nextLine();
                                                String addnote = "INSERT INTO Observation VALUES(?, CURRENT_TIME, ?, ?, ?);";
                                                PreparedStatement statement = con.prepareStatement(addnote);
                                                statement.setInt(1, obsid);
                                                statement.setDate(2, java.sql.Date.valueOf(date));
                                                statement.setString(3, obs);
                                                statement.setInt(4, appid);
                                                statement.executeUpdate();
                                                System.out.println();
                                                continue choiceloop;
                                            case 4:
                                                int testid = 1;
                                                int pregnum = 0;
                                                String babyid = null;
                                                String pid = null;
                                                String techid = null;
                                                ResultSet testidrs = stmt.executeQuery("SELECT testid FROM MedicalTest;");
                                                while (testidrs.next()) {
                                                    testid++;
                                                }
                                                ResultSet babyidrs = stmt.executeQuery("SELECT DISTINCT babyid, pregnum FROM Parent INNER JOIN MedicalTest MT on Parent.pid = MT.pid\n" +
                                                        "INNER JOIN Mother M on M.hcid = Parent.hcid\n" +
                                                        "WHERE M.hcid =" + "'" + hcid + "';");
                                                while (babyidrs.next()) {
                                                    babyid = babyidrs.getString("babyid");
                                                    pregnum = babyidrs.getInt("pregnum");
                                                }
                                                ResultSet testpidrs = stmt.executeQuery("SELECT pid FROM Mother INNER JOIN Parent P on Mother.hcid = P.hcid\n" +
                                                        "WHERE P.hcid =" + "'" + hcid + "';");
                                                while (testpidrs.next()) {
                                                    pid = testpidrs.getString("pid");
                                                }
                                                ResultSet techidrs = stmt.executeQuery("SELECT techid FROM LabTech ORDER BY RAND() LIMIT 1;");
                                                while (techidrs.next()) {
                                                    techid = techidrs.getString("techid");
                                                }

                                                System.out.println("Please enter the type of test: ");
                                                Scanner typein = new Scanner(System.in);
                                                String type = typein.nextLine();
                                                String prestest = "INSERT INTO MedicalTest VALUES(?, CURRENT_DATE, CURRENT_DATE, CURRENT_DATE , ?, null, ?, ?, ?, ?, ?);";
                                                PreparedStatement preparedStatement = con.prepareStatement(prestest);
                                                preparedStatement.setInt(1, testid);
                                                preparedStatement.setString(2, type);
                                                preparedStatement.setString(3, practid);
                                                preparedStatement.setString(4, pid);
                                                preparedStatement.setInt(5, pregnum);
                                                preparedStatement.setString(6, babyid);
                                                preparedStatement.setString(7, techid);
                                                preparedStatement.executeUpdate();
                                                System.out.println();
                                                continue choiceloop;
                                            case 5:
                                                continue apploop;
                                            default:
                                                System.out.println("Please select the correct choice");
                                        }
                                    }
                                } else {
                                    System.out.println("Please enter a valid appointment number");
                                }
                            }
                        } else {
                            System.out.println("There is no appointments for that date");
                        }
                    }

                } else {
                    System.out.println("The practitioner id is not valid");
                }
            }
        } catch (Exception e){
            System.out.println(e.getMessage());;
        }
    }
}

