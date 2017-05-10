/*
 * Copyright 2012-2016 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.example;

import com.example.model.App;
import com.example.service.AppService;
import com.example.tools.getSysTime;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller()
public class WelcomeController {

    @Value("${application.message:Hello World}")
    private String message = "Hello World";

    @Autowired
    private AppService appService;


    @GetMapping("/welcome")
    public String welcome1(Map<String, Object> model) {
        model.put("time", new Date());
        model.put("message", this.message);
        return "welcome";
    }


    @GetMapping("/")
    public ModelAndView welcome() {

        return new ModelAndView("main");
    }


    @RequestMapping("/app")

    public ModelAndView foo() {


        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/info/app");
    /*	modelAndView.addObject("page",pages.getNumber());
        modelAndView.addObject("total",pages.getTotalPages());
		modelAndView.addObject("records",pages.getTotalElements());
		modelAndView.addObject("rows",pages.getContent());*/
        /**
         * 	resultMap.put("page", page);  //当前页，前台传入
         resultMap.put("total", total);//总页数，计算得出
         resultMap.put("records", records);//总记录数，数据库中查出
         resultMap.put("rows", list);//记录数据

         */
        return modelAndView;
    }

    /**
     * 更新表格数据
     * @param request
     * @return
     */
    @RequestMapping("/json/updateApp")
    @ResponseBody
    public Map updateApp( HttpServletRequest request) {
        String appId = request.getParameter("app.appId");
        String appKey = request.getParameter("app.appKey");
        String appName = request.getParameter("app.appName");
        String appType = request.getParameter("app.appType");
        String id = request.getParameter("app.id");
        String masterSecret = request.getParameter("app.masterSecret");
        String type = request.getParameter("app.type");

        App app0=appService.findCityBy(Long.parseLong(id));



        app0.setAppId(appId);
        app0.setAppKey(appKey);
        app0.setAppName(appName);
        app0.setAppType(appType);
        app0.setId(Long.parseLong(id));
        app0.setMasterSecret(masterSecret);
        app0.setType(type);


        App app1=appService.save(app0);
        System.out.println("更新后的app.toString==="+app1);


        Map map=new HashMap();
        map.put("success",true);



        return map;
    }


    /**
     * 批量删除
     * @param request
     * @return
     */
    @RequestMapping("/json/delApp")
    @ResponseBody
    @Transactional
    public  Map delApp(HttpServletRequest request){
        Map map=new HashMap();
        String value = request.getParameter("ids");
        String[] ids = value.split(",");
        for(int i = 0; i < ids.length; ++i) {
            appService.deleteById(Long.parseLong(ids[i]));

        }





        map.put("success",true);
        return map;
    }




    @RequestMapping("/json/searchByAppName")
    @ResponseBody
    @Transactional
    public  Map searchByAppName(HttpServletRequest request) throws JsonProcessingException {
        System.out.println(request.toString()+"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");

        String appName= request.getParameter("app.appName");

        int page = Integer.parseInt(request.getParameter("page"));//第几页

        int rows = Integer.parseInt(request.getParameter("rows"));//每页几条数据

        Page<App> pages = appService.getJsonString(page, rows,appName);


        System.out.println(new ObjectMapper().writeValueAsString(pages));


        Map map =new HashMap();

        map.put("page", page);//当前页，前台传入

        map.put("total", pages.getTotalPages());//总页数，计算得出
        map.put("records", pages.getTotalElements());//总记录数，数据库中查出
        map.put("rows", pages.getContent());//记录数据
        return map;
    }









    /**
     * 增加
     * @param request
     * @return
     */
    @RequestMapping("/json/addApp")
    @ResponseBody
    public Map addApp( HttpServletRequest request) {
        Map map=new HashMap();
        String appId = request.getParameter("app.appId");
        String appKey = request.getParameter("app.appKey");
        String appName = request.getParameter("app.appName");
        String appType = request.getParameter("app.appType");

        String masterSecret = request.getParameter("app.masterSecret");
        String type = request.getParameter("app.type");

        App app=appService.save(new App( appName, getSysTime.getTestTime(),  appType,  type,  appId,  appKey,
                masterSecret));


        System.out.println("保存后的app.toString========"+app);
         map.put("success",true);

        return map;
    }

    /**
     * 获取表格数据
     *
     * @param request
     * @return
     */
    @RequestMapping("/json/app")
    @ResponseBody
    public Map foo3(HttpServletRequest request) {
        /**
         *  page; //这个是第几页
         rows;//每页几条数据
         sidx  按哪个字段排序
         sord  desc 升序还是降序列

         */

        int page = Integer.parseInt(request.getParameter("page"));//第几页

        int rows = Integer.parseInt(request.getParameter("rows"));//每页几条数据


        System.out.println("page" + page + ";rows" + rows + ";");

        Page<App> pages = appService.getJsonString(page, rows);


        Map map = new HashMap();
        map.put("page", page);//当前页，前台传入

        map.put("total", pages.getTotalPages());//总页数，计算得出
        map.put("records", pages.getTotalElements());//总记录数，数据库中查出
        map.put("rows", pages.getContent());//记录数据

        return map;
    }


    @RequestMapping("/innerMessage")
    public ModelAndView innerMessage() {
        System.out.println("---------=====================================");
        return new ModelAndView("/info/innerMessage");
    }


    @RequestMapping("/user")
    public ModelAndView pathUser() {
        System.out.println("---------=====================================");
        return new ModelAndView("/info/user");
    }


    @RequestMapping("/messageInfo")
    public ModelAndView pathmessageInfo() {
        System.out.println("---------=====================================");
        return new ModelAndView("/info/messageInfo");
    }


}
