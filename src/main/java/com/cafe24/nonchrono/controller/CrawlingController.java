package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.CrawlingDAO;
import com.cafe24.nonchrono.dto.CrawlingDTO;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CrawlingController {

    @Autowired
    private CrawlingDAO crawlingDAO;

    public CrawlingController() {
        System.out.println("-----CrawlingController() 객체 생성됨");
    } // CrawlingController() end

    @RequestMapping(value = "/crawling")
    public String autoCrawling() {

        CrawlingDTO crawlingDTO = null;
        int cnt = 0;

        String AllURL = "https://store.nintendo.co.kr/games/all-released-games";

        try {

            Document doc = Jsoup.connect(AllURL).get();

            Elements AllTitle = doc.getElementsByAttributeValue("class", "category-product-item-img");
            AllTitle = AllTitle.select("a");

            // System.out.println(AllTitle);

            List<String> list = new ArrayList<>();

            for (Element element : AllTitle) {
                String titleURL = element.attr("href");
                list.add(titleURL);
            }

            System.out.println(list.size());

            // for ( Element element : elements ) { // for (개별 : 덩어리)
            for (int i = 0; i <= list.size(); i++) {

                System.out.println("데이터 수집 중...");

                Document doc2 = Jsoup.connect(list.get(i)).userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36").get();

                Elements title = doc2.select(".base");
                Elements price = doc2.getElementsByAttributeValue("class", "product-page-info-form");
                price = price.select(".price");
                Elements genre = doc2.getElementsByAttributeValue("class", "product-attribute game_category");
                genre = genre.select(".product-attribute-val");
                Elements level = doc2.select(".product-attribute-esrb");


                    try {

                        String s_title = "";
                        int s_price = 0;
                        String s_genre = "";
                        String s_level = "";
                        String img = "";

                        for (Element element : title) {
                            s_title = element.text();
                        } // for end

                        for (Element element : price) {
                            s_price = Integer.parseInt(element.text().replaceAll("[^0-9]", ""));
                        } // for end

                        for (Element element : genre) {
                            s_genre = element.text().replaceAll("[\\,]", "");
                        } // for end

                        for (Element element : level) {
                            img = element.attr("src");

                            if (img.equals("https://store.nintendo.co.kr/media/attribute/swatch/a/g/age_all.png")) {
                                img = "전체이용가";
                            } else if (img.equals("https://store.nintendo.co.kr/media/attribute/swatch/a/g/age_18.png")) {
                                img = "19세 이용가";
                            } else if (img.equals("https://store.nintendo.co.kr/media/attribute/swatch/a/g/age_15.png")) {
                                img = "15세 이용가";

                            } else if (img.equals("https://store.nintendo.co.kr/media/attribute/swatch/a/g/age_12.png")) {
                                img = "12세 이용가";
                            } // 이용가 분류

                        } // for end

                        crawlingDTO = CrawlingDTO.builder()
                                .gm_code("dt"+(String.format("%04d", i)))
                                .gm_name(s_title)
                                .gm_price(s_price)
                                .gm_category(s_genre)
                                .gm_level(img)
                                .build();

                        System.out.println(crawlingDTO.getGm_category());
                        System.out.println(crawlingDTO.getGm_name());
                        System.out.println(crawlingDTO.getGm_price());
                        System.out.println(crawlingDTO.getGm_code());
                        System.out.println(crawlingDTO.getGm_level());

                        cnt = crawlingDAO.autoCrawling(crawlingDTO);

                    } catch (Exception e) {
                        System.out.println("크롤링 오류 : " + e);
                    } // try catch end

            } // for end

        } catch (Exception e) {
            e.printStackTrace();
        }

        if (cnt == 0) {
            System.out.println("-----크롤링 실패");
        } else {
            System.out.println("-----크롤링 성공");
        } // if end

        return "redirect:/admin";
    } // autoCrawling() end



} // class end
