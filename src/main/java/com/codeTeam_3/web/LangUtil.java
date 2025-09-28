// src/main/java/com/codeTeam_3/web/LangUtil.java
package com.codeTeam_3.web;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

public class LangUtil {
    public static String resolveLang(HttpServletRequest req) {
        // 1) Ưu tiên query param
        String p = req.getParameter("lang");
        if ("vi".equals(p) || "en".equals(p)) {
            req.getSession().setAttribute("lang", p);
            return p;
        }

        // 2) Session
        Object s = req.getSession().getAttribute("lang");
        if (s instanceof String str && ("vi".equals(str) || "en".equals(str))) {
            return str;
        }

        // 3) Cookie (tuỳ chọn)
        if (req.getCookies() != null) {
            for (Cookie c : req.getCookies()) {
                if ("lang".equals(c.getName())) {
                    String v = c.getValue();
                    if ("vi".equals(v) || "en".equals(v)) {
                        req.getSession().setAttribute("lang", v);
                        return v;
                    }
                }
            }
        }

        // 4) Mặc định
        req.getSession().setAttribute("lang", "vi");
        return "vi";
    }
}
