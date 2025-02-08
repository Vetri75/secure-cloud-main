/**
 * @author Subhadeep Dan
 * All Rights Reserved.
 */
package connection;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;

public class dbConnection {

    static Connection con = null;
    PreparedStatement pst = null;

    public static Connection makeConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://securecloud.cjkb13c3i1m0.ap-northeast-1.rds.amazonaws.com:3306/securecloud", "admin", "Vedi9095");
            //con = DriverManager.getConnection("securecloud.cjkb13c3i1m0.ap-northeast-1.rds.amazonaws.com", "admin", "Vedi9095");

        } catch (Exception e) {
        }
        return con;
    }
}