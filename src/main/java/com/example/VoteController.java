package com.example;


import com.example.model.Vote;
import com.example.service.VoteService;
import org.hibernate.boot.jaxb.SourceType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.sound.midi.Soundbank;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/vote")
public class VoteController {
    @Value("${imgPath.Prefix}")
    private String filepath;
    @Autowired
    private VoteService voteService;





      public static Map<String, Object> resultJson(int resCode, String resMessage, Object objectValue) {
        Map map = new HashMap();
        map.put("resCode", resCode);
        map.put("resMessage", resMessage);
        map.put("values", objectValue);
        return map;
    }


    @RequestMapping("/pagefindAll")
    @ResponseBody
    public Map<String, Object> findAll(int pageNum, int pageSize, String direction,
                                       String property) {
        Page<Vote> values = voteService.findAll(pageNum, pageSize, direction, property);
        return resultJson(0000, "success", values);
    }

    @RequestMapping("/findOneById")
    @ResponseBody
    public Map findOneById(String id) {
        Vote vote = voteService.findOneById(Long.parseLong(id));
        return resultJson(0000, "success", vote);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map deleteById(String id) {
        Vote vote = voteService.findOneById(Long.parseLong(id));
        String s = vote.getOnlineStatus();
//        活动在线状态(0：上线，1：下线)

        if (s.equals("1")) {
            try {


                voteService.deleteById(Long.parseLong(id));


                return resultJson(0000, "success", null);
            } catch (Exception e) {
                //数据库异常
                return resultJson(101, "failure", null);
            }
        } else {
//            活动正在线上，不可删除
            return resultJson(102, "failure", null);
        }
    }


    //投票活动新建
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Map saveImgs(MultipartFile posterImg_file, HttpServletRequest request, Vote vote) {
        if (posterImg_file.isEmpty()) {
//海报文件为空
            return resultJson(102, "failure", vote);
        }

//        获取海报图片
        // 获取文件名,求得后缀名，图片重命名
        String fileName = getFileName(posterImg_file);


//        保存海报图片--检测文件夹是否存在，不存在就创建一个 ，上传海报
        File dest = new File(filepath + fileName);
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }

        try {
            posterImg_file.transferTo(dest);
//        将图片信息放入vote类
            vote.setPosterUrl(fileName);

        } catch (Exception e) {
            return resultJson(101, "上传海报失败", vote);
        }

        String[] t = null;
//        1.先判断选项有图片还是没图片,type为1说明选项有图片
        if (vote.getType().equals("1")) {
//            2 获取options字段，截取字符串
            String options = vote.getOptions();

            if (options != null && !options.equals("")) {
                try {
                    t = options.split("@");
                    System.out.println("得到的字符串"+options);
                    for (int i = 0; i < t.length; i++) {
                        System.out.println("截取到的值"+t[i]);
                    }
                } catch (Exception e) {
                    return resultJson(107, "投票活动必须有选项", vote);
                }

            } else {
                return resultJson(106, "选项信息不能为空", vote);
            }


//            3 判断选项个数与图片个数是否一致
//            3.1 获取图片个数
            List<MultipartFile> optionImg_files = ((MultipartHttpServletRequest) request).getFiles("file");
            System.out.println("item.length:"+t.length);

            System.out.println("optionImg_files.size:"+optionImg_files.size());
            if (t.length == optionImg_files.size()) {

//                4 将图片名插入options字符串中
                String fileName0 = "";
                String s_options = "";
                for (int i = 0; i < optionImg_files.size(); i++) {
                    if (optionImg_files.get(i).isEmpty()) {
                        return resultJson(107, "选项图片文件为空", vote);
                    }

                    //得到原始文件名字，然后取后缀，然后重命名
                    fileName0 = getFileName(optionImg_files.get(i));

                    System.out.println("t[i]的值"+t[i]);
                    System.out.println("fileName0"+fileName0);

                    s_options = s_options + t[i]+"|"+ fileName0+"@";
                    System.out.println("s_options"+s_options);


                }


//            5 将含有图片信息的options字符串放入vote类，
                vote.setOptions(s_options);
//


            } else {
                return resultJson(105, "选项图片个数与选项个数不匹配", vote);
            }
//


        }
        try {
            Vote vote1 = voteService.save(vote);
            System.out.println(vote);
            return resultJson(0000, "success", vote);

        } catch (Exception e) {
            return resultJson(103, ",图片上传成功，vote信息保存失败，数据库异常", vote);
        }


    }

    //修改投票活动
    //投票活动新建
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Map updateVoteAndImgs(MultipartFile posterImg_file, HttpServletRequest request, Vote vote) {

        if (!posterImg_file.isEmpty()) {      //如果海报文件不为空，则更新海报

//            获取海报图片
            // 获取文件名,求得后缀名，图片重命名
            String fileName = getFileName(posterImg_file);

            /**
             * posterUrl  该字段来自于表单 -或者来自于数据库
             */
            File file = new File(filepath+vote.getPosterUrl());
            file.delete();

//        保存海报图片--检测文件夹是否存在，不存在就创建一个 ，上传海报
            File dest = new File(filepath + fileName);
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }

            try {
                posterImg_file.transferTo(dest);
//        将图片信息放入vote类
                vote.setPosterUrl(fileName);

            } catch (Exception e) {
                return resultJson(101, "上传海报失败", vote);
            }

        }







        String[] item = null;
//        1.先判断选项有图片还是没图片,type为1说明选项有图片
        if (vote.getType().equals("1")) {
//            2 获取options字段，截取字符串
            String options = vote.getOptions();

            if (options != null && !options.equals("")) {
                try {
                    item = options.split(";");
                } catch (Exception e) {
                    return resultJson(107, "options", vote);
                }

            } else {
                return resultJson(106, "选项信息不能为空", vote);
            }


//            3 判断选项个数与图片个数是否一致
//            3.1 获取图片个数
            List<MultipartFile> optionImg_files = ((MultipartHttpServletRequest) request).getFiles("file");

            if (item.length == optionImg_files.size()) {

//                4 将图片名插入options字符串中
                String fileName0 = "";
                String s_options = "";
                for (int i = 0; i < optionImg_files.size(); i++) {
                    if (optionImg_files.get(i).isEmpty()) {
                        return resultJson(107, "选项图片文件为空", vote);
                    }

                    //得到原始文件名字，然后取后缀，然后重命名
                    fileName0 = getFileName(optionImg_files.get(i));
                    item[i] = item[i] + "," + fileName0;
                    s_options = s_options + item[i] + ";";


                }


//            5 将含有图片信息的options字符串放入vote类，
                vote.setOptions(s_options);
//


            } else {
                return resultJson(105, "选项图片个数与选项个数不匹配", vote);
            }
//


        }







        return null;
    }










    private static String getFileName(MultipartFile file) {
        String fileName = file.getOriginalFilename();
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        fileName = UUID.randomUUID() + suffixName;
        return fileName;
    }



}
