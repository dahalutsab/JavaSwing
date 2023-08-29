
package javaatm;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class dbInfoLoader {
    Statement stat;
    Connection cn;
    private long dbCardNumber;
    private String dbCardHolderName;
    private int dbPIN;
    private boolean dbStatus;
    private double usrBalance;
    private int dbFlag;

    public dbInfoLoader(long cardNumber) {
        fetchDataFromDatabase(cardNumber);
    }

    private void fetchDataFromDatabase(long cardNumber) {
        DatabaseConnection db = new DatabaseConnection();
        cn = db.getConnection();

        try {
            stat = cn.createStatement();
            String sql = "SELECT * FROM user_accounts WHERE card_number = " + cardNumber;
            ResultSet rs = stat.executeQuery(sql);

            if (rs.next()) {
                dbCardNumber = rs.getLong("card_number");
                dbCardHolderName = rs.getString("name");
                dbPIN = rs.getInt("pin");
                dbStatus = rs.getBoolean("status");
                usrBalance = rs.getDouble("balance");
            } else {
                dbFlag = 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(dbInfoLoader.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getDbCardHolderName() {
        return dbCardHolderName;
    }

    public long getDbCardNumber() {
        return dbCardNumber;
    }

    public int getDbPIN() {
        return dbPIN;
    }

    public void setPIN(int dbPIN) {
        try {
            this.dbPIN = dbPIN;
            
            String PINUpdateQuery = "UPDATE user_accounts SET pin = '" + dbPIN + "' WHERE card_number = " + dbCardNumber + ";";
            stat.executeUpdate(PINUpdateQuery);
        } catch (SQLException ex) {
            Logger.getLogger(dbInfoLoader.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean getdbStatus() {
        return dbStatus;
    }
    
    public void setdbStatus() {
        try {
            String statusUpdateQuery = "UPDATE user_accounts SET status = '" + 0 + "' WHERE card_number = " + dbCardNumber + ";";
            stat.executeUpdate(statusUpdateQuery);
        } catch (SQLException ex) {
            Logger.getLogger(dbInfoLoader.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void setDbCount(int dbCount) {
        try {
            int remainingAttempts = dbCount;
            remainingAttempts--;
            String countUpdateQuery = "UPDATE user_accounts SET count = '" + remainingAttempts + "' WHERE card_number = " + dbCardNumber + ";";
            stat.executeUpdate(countUpdateQuery);
        } catch (SQLException ex) {
            Logger.getLogger(dbInfoLoader.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public double getUsrBalance() {
        double updatedBalance;
         try {
            String getUsrBalanceQuery = "SELECT balance FROM user_accounts WHERE card_number =  "+ dbCardNumber+""; 
            ResultSet rs = stat.executeQuery(getUsrBalanceQuery);
            if (rs.next()) {
                updatedBalance = rs.getDouble("balance");
                return updatedBalance;
            } else {
                return 0;
                // Handle the case where no balance is found
                // You might want to throw an exception or handle it accordingly
            }
        } catch (SQLException ex) {
            Logger.getLogger(dbInfoLoader.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public boolean depositBalance(double depositAmount) {
        double updatedBalance = depositAmount + usrBalance;
        try {
            String balanceUpdateQuery = "UPDATE user_accounts SET balance = '" + updatedBalance + "' WHERE card_number = " + dbCardNumber + ";";
            stat.executeUpdate(balanceUpdateQuery);
            //System.out.println(updatedBalance);
            return true;
          //JOptionPane.showMessageDialog(null, "Balance successfully deposited.");
        } catch (SQLException ex) {
            Logger.getLogger(dbInfoLoader.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
     public boolean depositBalanceforTransfer(double depositAmount, long cardNumber) {
        double updatedBalance = depositAmount + usrBalance;
        //long cardNumber;
//        try {
//            String balanceUpdateQuery = "UPDATE user_accounts SET balance = '" + updatedBalance + "' WHERE card_number = " + cardNumber + ";";
//            stat.executeUpdate(balanceUpdateQuery);
//            System.out.println(updatedBalance);
//            return true;
//          //JOptionPane.showMessageDialog(null, "Balance successfully deposited.");
//        } catch (SQLException ex) {
//            Logger.getLogger(dbInfoLoader.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return false;
        
         try {
            String balanceUpdateQuery = "UPDATE user_accounts SET balance = ? WHERE card_number = ?";

            PreparedStatement preparedStatement = cn.prepareStatement(balanceUpdateQuery);
            preparedStatement.setDouble(1, updatedBalance);
            preparedStatement.setLong(2, cardNumber);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Balance updated successfully: " + updatedBalance);
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "No user found with the given card number.");
                //System.out.println("No user found with the given card number.");
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(dbInfoLoader.class.getName()).log(Level.SEVERE, null, ex);
        }
         return false;
    }
    
    

     public boolean withDrawBalance(double withDrawAmount) {
        double updatedBalance =  usrBalance - withDrawAmount;
        try {
            String balanceUpdateQuery = "UPDATE user_accounts SET balance = '" + updatedBalance + "' WHERE card_number = " + dbCardNumber + ";";
            stat.executeUpdate(balanceUpdateQuery);
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(dbInfoLoader.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
     
     
    public int getDbFlag() {
        return dbFlag;
    }

    public void setDbFlag(int dbFlag) {
        this.dbFlag = dbFlag;
    }
 
}