package com.codeTeam_3.controller;

import com.codeTeam_3.dao.CategoryDao;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;

import java.io.IOException;
import java.util.Optional;

@WebServlet(urlPatterns = {"/categories"})
public class CategoryServlet extends HttpServlet {
    private final CategoryDao categoryDao = new CategoryDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String lang = Optional.ofNullable(req.getParameter("lang")).orElse("vi");
        req.setAttribute("lang", lang);
        req.setAttribute("categories", categoryDao.findAll(lang));
        req.getRequestDispatcher("/categories.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String nameVi = req.getParameter("name_vi");
        String nameEn = req.getParameter("name_en");
        boolean canBeShipped = "on".equals(req.getParameter("can_ship"));
        int id = categoryDao.create(canBeShipped);
        categoryDao.upsertTranslation(id, "vi", nameVi);
        categoryDao.upsertTranslation(id, "en", nameEn);
        resp.sendRedirect(req.getContextPath() + "/categories");
    }
}
