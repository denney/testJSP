/*
 * Copyright 2012-2013 the original author or authors.
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

package com.example.service;

import com.example.model.App;
import org.springframework.data.domain.Page;


public interface AppService {

    App save(App app);

    Iterable<App> findAll();

    App findCityBy(Long Id);

    void deleteById(Long Id);


    Page<App> getJsonString(int pageNum, int pageSize);
    Page<App> getJsonString(int pageNum, int pageSize,String appName);



}
