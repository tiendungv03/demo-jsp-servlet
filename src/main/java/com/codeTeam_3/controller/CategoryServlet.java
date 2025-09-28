// src/main/java/com/codeTeam_3/controller/CategoryServlet.java
package com.codeTeam_3.controller;

import com.codeTeam_3.dao.CategoryDao;
import com.codeTeam_3.model.Category;
import com.codeTeam_3.web.LangUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/categories"})
public class CategoryServlet extends HttpServlet {
    private final CategoryDao dao = new CategoryDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String lang = LangUtil.resolveLang(req);
        req.setAttribute("lang", lang);

        List<Category> categories = dao.findAll(lang);
        req.setAttribute("categories", categories);

        req.getRequestDispatcher("/WEB-INF/views/categories.jsp").forward(req, resp);
    }
}
