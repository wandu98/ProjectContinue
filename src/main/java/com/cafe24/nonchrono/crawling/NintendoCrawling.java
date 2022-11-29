package com.cafe24.nonchrono.crawling;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
/*
public class NintendoCrawling {
    public static void main(String[] args) throws IOException {

        String fileName = "D:/java202207/nintendo2.txt";
        FileWriter fw = new FileWriter(fileName, true);
        PrintWriter out = new PrintWriter(fw, true);

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


                for (int j = 0; j < title.size(); j++) {

                    try {

                        for (Element element : title) {
                            out.println(element.text());
                        } // for end

                        for (Element element : price) {
                            out.println(element.text());
                        } // for end

                        for (Element element : genre) {
                            out.println(element.text());
                        } // for end

                        for (Element element : level) {
                            String img = element.attr("src");

                            if (img.equals("https://store.nintendo.co.kr/media/attribute/swatch/a/g/age_all.png")) {
                                img = "전체이용가";
                            } else if (img.equals("https://store.nintendo.co.kr/media/attribute/swatch/a/g/age_18.png")) {
                                img = "19세 이용가";
                            } else if (img.equals("https://store.nintendo.co.kr/media/attribute/swatch/a/g/age_15.png")) {
                                img = "15세 이용가";
                            } else if (img.equals("https://store.nintendo.co.kr/media/attribute/swatch/a/g/age_12.png")) {
                                img = "12세 이용가";
                            } // 이용가 분류

                            out.println(img);
                        } // for end

                    } catch (Exception e) {
                        System.out.println("크롤링 오류 : " + e);
                    } // try catch end
                } // for end

            }

            out.close();
            fw.close();

            System.out.println("-------nintendo2.txt 완성!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    } // main() end

}
// class end
*/