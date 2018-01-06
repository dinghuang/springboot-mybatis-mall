package com.shopping.mall.controller;

import com.shopping.mall.domain.Rolling;
import com.shopping.mall.domain.Shoppingcart;
import com.shopping.mall.domain.Tuser;
import com.shopping.mall.service.RollingService;
import com.shopping.mall.service.ShoppingcartService;
import com.shopping.mall.service.TuserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by dinghuang on 2018/1/3.
 */
@Controller
public class LoginController {
    @Autowired
    private RollingService rollingService;
    @Autowired
    private TuserService tuserService;
    @Autowired
    private ShoppingcartService shoppingcartService;

    private static Logger logger = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping("/index")
    public String userlogin(Map<String, Object> map) {
        List<Rolling> rollingList = rollingService.getRollings();
        map.put("rollingList", rollingList);
        return "index";
    }

    @RequestMapping("/userLogin")
    public String userLogin(Map<String, Object> map) {
        return "userlogin";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam String name, @RequestParam String password,HttpSession session,Map<String, Object> map) {
        if(name.equals("")){
            return "userlogin";
        }else{
            Tuser tuser = tuserService.getTuser(name);
            if(tuser!=null){
                if(tuser.getTpwd().equals(password)&&tuser.getTrights().equals("2")){
//                    session.setAttribute(WebSecurityConfig.SESSION_KEY, tuser);
                    List<Shoppingcart> shoppingCartList = shoppingcartService.selectShoppingCartByUserName(name);
                    map.put("shoppingCartList",shoppingCartList);
                    List<Rolling> rollingList = rollingService.getRollings();
                    map.put("rollingList", rollingList);
                    map.put("tUserBean",tuser);
                    return "index";
                }else{
                    map.put("message","Error password");
                    return "userlogin";
                }
            }else{
                map.put("message","User not exit");
                return "userlogin";
            }
        }
    }

    @RequestMapping("/")
    public String index(Map<String, Object> map) {
        List<Rolling> rollingList = rollingService.getRollings();
        map.put("rollingList", rollingList);
        return "index";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        // 移除session
//        session.removeAttribute(WebSecurityConfig.SESSION_KEY);
        return "redirect:/login";
    }

}
