package com.codeTeam_3.dao;

import com.codeTeam_3.model.ProductView;
import com.codeTeam_3.util.dbMysql;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

    public List<ProductView> findByCategory(int categoryId, String lang, int limit) {
        String sql = """
                    SELECT p.ProductID, p.Price, p.Weight,
                           pt.ProductName, pt.ProductDescription,
                           pct.CategoryName
                    FROM Product p
                    LEFT JOIN ProductTranslation pt
                      ON pt.ProductID = p.ProductID AND pt.LanguageID = ?
                    LEFT JOIN ProductCategoryTranslation pct
                      ON pct.ProductCategoryID = p.ProductCategoryID AND pct.LanguageID = ?
                    WHERE p.ProductCategoryID = ?
                    ORDER BY p.ProductID
                    LIMIT ?
                """;
        List<ProductView> list = new ArrayList<>();
        try (Connection con = dbMysql.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, lang);
            ps.setString(2, lang);
            ps.setInt(3, categoryId);
            ps.setInt(4, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new ProductView(
                            rs.getInt("ProductID"),
                            rs.getString("ProductName"),
                            rs.getBigDecimal("Price"),
                            rs.getBigDecimal("Weight"),
                            rs.getString("CategoryName"),
                            rs.getString("ProductDescription")
                    ));
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public List<ProductView> findAll(String lang) {
        String sql = """
            SELECT p.ProductID, p.Price, p.Weight,
                   pt.ProductName, pt.ProductDescription,
                   pct.CategoryName
            FROM Product p
            LEFT JOIN ProductTranslation pt
              ON pt.ProductID = p.ProductID AND pt.LanguageID = ?
            LEFT JOIN ProductCategoryTranslation pct
              ON pct.ProductCategoryID = p.ProductCategoryID AND pct.LanguageID = ?
            ORDER BY p.ProductID
        """;
        List<ProductView> list = new ArrayList<>();
        try (Connection conn = dbMysql.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, lang);
            ps.setString(2, lang);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new ProductView(
                            rs.getInt("ProductID"),
                            rs.getString("ProductName"),
                            rs.getBigDecimal("Price"),
                            rs.getBigDecimal("Weight"),
                            rs.getString("CategoryName"),
                            rs.getString("ProductDescription")
                    ));
                }
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public ProductView findById(int id, String lang) {
        String sql = """
            SELECT p.ProductID, p.Price, p.Weight,
                   pt.ProductName, pt.ProductDescription,
                   pct.CategoryName
            FROM Product p
            LEFT JOIN ProductTranslation pt
              ON pt.ProductID = p.ProductID AND pt.LanguageID = ?
            LEFT JOIN ProductCategoryTranslation pct
              ON pct.ProductCategoryID = p.ProductCategoryID AND pct.LanguageID = ?
            WHERE p.ProductID = ?
        """;
        try (Connection c = dbMysql.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, lang);
            ps.setString(2, lang);
            ps.setInt(3, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new ProductView(
                            rs.getInt("ProductID"),
                            rs.getString("ProductName"),
                            rs.getBigDecimal("Price"),
                            rs.getBigDecimal("Weight"),
                            rs.getString("CategoryName"),
                            rs.getString("ProductDescription")
                    );
                }
                return null;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
