/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product;

import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lienm
 */
public class ProductDAO {
    public List<ProductDTO> getListProduct() throws SQLException{
        List<ProductDTO> list = new ArrayList();
        Connection conn=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                pst = conn.prepareStatement("SELECT SKU, Name, Price, Description, Quantity FROM Book");
                rs = pst.executeQuery();
                while(rs.next()){
                    String SKU = rs.getString("SKU");
                    String Name = rs.getString("Name");
                    double Price = rs.getDouble("Price");
                    String Description = rs.getString("Description");
                    int Quantity = rs.getInt("Quantity");
                    ProductDTO b = new ProductDTO(SKU, Name, Description, Price, Quantity);
                    list.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(rs!=null) rs.close();
            if(pst!= null) pst.close();
            if(conn!=null) conn.close();
        }
        return list;
    }
}
