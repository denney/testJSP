package com.example.tools;/**
 * Created by pc on 2017/4/17.
 */

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author
 * @create 2017-04-17 9:45
 **/

public class getSysTime {


    public static String getYYYYMMDD() {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String s = sdf.format(new Date());
        return s;
    }

    public static String getYYYYMMDDHHMISS() {
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHSS");
//        String s = sdf.format(new Date());

        Date today = new Date();
        SimpleDateFormat f = new SimpleDateFormat("yyyyMMddHHmmSS");
        String s = f.format(today);

        return s;
    }

    public static String getTestTime() {
        Date today = new Date();
        SimpleDateFormat f = new SimpleDateFormat("yyyy年MM月dd日 hh:mm:ss");
        String time = f.format(today);

        return time;
    }

    public static String getTime() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式

        return df.format(new Date());
    }


    public static String getyesterdayTimeYYYY_MM_dd() {

        Calendar cal = Calendar.getInstance();

        cal.add(Calendar.DATE, -1);
        Date time = cal.getTime();
        String s = new SimpleDateFormat("yyyy-MM-dd").format(time);

        return s;

    }


    public static void main(String[] args) {
       /* System.out.println(getSysTime.getYYYYMMDD());
        System.out.println(getSysTime.getYYYYMMDDHHMISS());*/

        System.out.println(getYYYYMMDD());


    }


}
