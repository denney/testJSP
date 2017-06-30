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

package com.example.service.impl;

import com.example.dao.AppRepository;
import com.example.model.App;
import com.example.service.AppService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;


@Service("appService")
class AppServiceImpl implements AppService {
    @Resource
    private AppRepository appRepository;


    @Override
    public App save(App city) {
        return this.appRepository.save(city);
    }


    @Override
    public Iterable<App> findAll() {
        return this.appRepository.findAll();
    }

    @Override
    public App findCityBy(Long Id) {
        return appRepository.findOne(Id);
    }

    @Override
    public void deleteById(Long Id) {
        this.appRepository.delete(Id);
    }


    @Override
    public Page<App> getJsonString(int pageNum, int pageSize) {
        if (pageNum > 0) {
            pageNum--;
        }

        Pageable pageable = new PageRequest(pageNum, pageSize, Sort.Direction.ASC, "id");





   /*     Specification specification = new Specification<App>() {

            @Override
            public Predicate toPredicate(Root<App> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                return null;
            }


        };


        Page<App> pages=this.appRepository.findAll(specification,pageable);*/


        Page<App> pages = this.appRepository.findAll(pageable);
        return pages;
    }

    @Override
    public Page<App> getJsonString(int pageNum, int pageSize, String appName) {

        if (pageNum > 0) {
            pageNum--;
        }

        Pageable pageable = new PageRequest(pageNum, pageSize, Sort.Direction.ASC, "id");


        Specification specification = new Specification<App>() {

            @Override
            public Predicate toPredicate(Root<App> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder cb) {

                Predicate predicate=  cb.like(root.get("appName").as(String.class),"%"+appName+"%");


                return predicate;
            }


        };


        Page<App> pages = this.appRepository.findAll(specification, pageable);


        return pages;
    }


}
