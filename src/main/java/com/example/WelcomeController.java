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


import com.example.dao.HeroRepository;
import com.example.model.Hero;
import com.example.service.AppService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;

import java.util.Date;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller()
public class WelcomeController {

    @Value("${application.message:Hello World}")
    private String message = "Hello World";

    @Autowired
    private AppService appService;

    @Autowired
    private HeroRepository heroRepository;

    @GetMapping("/")
    @ResponseBody
    public String welcome1(Map<String, Object> model) {
        model.put("time", new Date());
        model.put("message", this.message);
        return "success";
    }

    //http://127.0.0.1:8080/heroList
    @GetMapping("/heroList")
    @ResponseBody
    public List heroList() {


        return heroRepository.findAll();
    }

    //http://127.0.0.1:8080/save
    @RequestMapping(value = "/save", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public Hero heroSave(@RequestBody Hero hero) {

        return heroRepository.save(hero);

    }

    @RequestMapping(value = "/deleteHeroById", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String herodelete(@RequestBody Hero hero) {

        heroRepository.delete(hero.getId());
        return "success";
    }

    @RequestMapping("/findHeroById")
    @ResponseBody
    public String findHeroById(Long id) {

        heroRepository.delete(id);
        return "success";
    }

}
