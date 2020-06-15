package com.chatShuai.controller.user;

import com.alibaba.fastjson.JSON;
import com.chatShuai.pojo.User;
import com.chatShuai.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class UserController {
    @Resource(name = "userService")
    UserService userService;

    //处理ajax请求
    @RequestMapping(value = "/loginCheck", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String loginCheck(HttpServletRequest request) {
//        System.out.println(request.getParameter("pwd"));
//        System.out.println(request.getParameter("name"));
//        System.out.println(userService);

        int flag = userService.userLoginCheck(request.getParameter("name"), request.getParameter("pwd"));
        HashMap<String, String> res = new HashMap<String, String>();
        if (flag == -1) {
            res.put("stateCode", "-1");
            res.put("msg", "无此用户，请先注册！");
        } else if (flag == 0) {

            res.put("stateCode", "0");
            res.put("msg", "密码错误！");
        } else {
            //将用户信息存入session
            request.getSession().setAttribute("userSession",new User(null,request.getParameter("name"),request.getParameter("pwd")));
            System.out.println(request.getSession().getAttribute("userSession"));
            res.put("stateCode", "1");
            res.put("msg", "密码正确！正在转跳！");
        }
//        System.out.println("controller done");
//
//        System.out.println(JSON.toJSONString(res));
        return JSON.toJSONString(res);
    }

    @RequestMapping(value = "/registCheck", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String registerCheck(HttpServletRequest request) {

        int stateCode = userService.userRegister(request.getParameter("name"),request.getParameter("pwd"));
        HashMap<String, String> res = new HashMap<String, String>();
        if(stateCode == -1){
            res.put("msg","用户名已存在");
            res.put("stateCode","-1");
        }else{

            res.put("msg","registCheck Success");
            res.put("stateCode","1");
        }


        return JSON.toJSONString(res);
    }
}
