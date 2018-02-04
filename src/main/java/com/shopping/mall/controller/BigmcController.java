package com.shopping.mall.controller;

import com.shopping.mall.domain.Bigmc;
import com.shopping.mall.domain.Mc;
import com.shopping.mall.domain.Smallmc;
import com.shopping.mall.service.BigmcService;
import com.shopping.mall.service.McService;
import com.shopping.mall.service.SmallmcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by dinghuang on 2018/1/16.
 */
@RestController
@RequestMapping("/bigmc")
public class BigmcController {

    @Autowired
    private McService mcService;

    @Autowired
    private BigmcService bigmcService;

    @Autowired
    private SmallmcService smallmcService;

    @RequestMapping("/adminright")
    public String adminright(@RequestParam String task, @RequestParam String mid, HttpServletRequest request, Map<String, Object> map,HttpServletResponse response) {
        response.setContentType("text/html;charset=GBK");
        try {
            request.setCharacterEncoding("GBK");
        } catch (IOException e) {
            e.printStackTrace();
        }
        if("look".equals(task)){
            Long mcId = Long.parseLong(request.getParameter("mid"));
            Mc mc = mcService.getMc(mcId);
            map.put("mcListBean", mc);
            return "admin/jsp/lookMc";
        }else if("add".equals(task)){
            List<Bigmc> bigMcList = bigmcService.getAll();
            List<Smallmc> smallMcList = smallmcService.getAll();
            String mdate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            map.put("mid", mid);
            map.put("mdate", mdate);
            map.put("bigMcList", bigMcList);
            map.put("smallMcList", smallMcList);
            return "admin/jsp/addMc";
        }else if("addSubmit".equals(task)){
            Mc mc = new Mc();
//            mc.setMid(Long.parseLong(request.getParameter("mid")));
            mc.setMname(request.getParameter("mname"));
            mc.setMdescription(request.getParameter("mname"));
            mc.setMprice(Long.parseLong(request.getParameter("mprice")));
            mc.setMimg(request.getParameter("mming"));
            mc.setMtotal(Long.parseLong(request.getParameter("mtotal")));
            mc.setMstock("0");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                mc.setMdate(sdf.parse(request.getParameter("mdate")));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            mc.setSid(Long.parseLong(request.getParameter("sid")));
            mcService.addMc(mc);
            return "admin/jsp/mcList";
        }else if ("update".equals(task)) {
            Long mcId = Long.parseLong(request.getParameter("mid"));
            Mc mc = mcService.getMc(mcId);
            List<Bigmc> bigMcList = bigmcService.getAll();
            List<Smallmc> smallMcList = smallmcService.getAll();
            request.setAttribute("mcListBean", mc);
            request.setAttribute("bigMcList", bigMcList);
            request.setAttribute("smallMcList", smallMcList);
            return "admin/jsp/updateMc";
        }else if ("updateSubmit".equals(task)) {
            Mc mc = new Mc();
            mc.setMid(Long.parseLong(request.getParameter("mid")));
            mc.setMname(request.getParameter("mname"));
            mc.setMdescription(request.getParameter("mname"));
            mc.setMprice(Long.parseLong(request.getParameter("mprice")));
            mc.setMimg(request.getParameter("mming"));
            mc.setMtotal(Long.parseLong(request.getParameter("mtotal")));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                mc.setMdate(sdf.parse(request.getParameter("mdate")));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            mc.setSid(Long.parseLong(request.getParameter("sid")));
            String mstock = null;
            try {
                Long mtotal2 = mc.getMtotal();
                if (mtotal2 > 0) {
                    mstock = "0";
                } else {
                    mstock = "1";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            mc.setMstock(mstock);
            mcService.updateMc(mc);
            return "admin/jsp/mcList";
        }else if ("delete".equals(task)) {
            Long mcId = Long.parseLong(request.getParameter("mid"));
            mcService.deleteMc(mcId);
            return "admin/jsp/mcList";
        }else {
            List<Mc> list = mcService.getMcs();
            map.put("list", list);
            return "admin/jsp/mcList";
        }
    }
}
