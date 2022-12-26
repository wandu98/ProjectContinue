package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.CrawlingDAO;
import com.cafe24.nonchrono.dto.CrawlingDTO;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
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
    @ResponseBody
    public String autoCrawling(@RequestParam int start) {

        CrawlingDTO crawlingDTO = null;
        int cnt = 0;

        // 전체 소프트웨어의 링크를 얻기 위한 1차 주소
        String AllURL = "https://store.nintendo.co.kr/games?product_list_order=release_date_asc";

        try {

            // 첫번째 크롤링
            Document doc = Jsoup.connect(AllURL).get();

            // 전체 소프트웨어의 a 링크 주소
            Elements AllTitle = doc.getElementsByAttributeValue("class", "category-product-item-img");
            AllTitle = AllTitle.select("a");

            // System.out.println(AllTitle);

            // 주소들을 담을 리스트
            List<String> list = new ArrayList<>();

            // 주소들을 리스트에 담기
            for (Element element : AllTitle) {
                String titleURL = element.attr("href");
                list.add(titleURL);
            }

            // 리스트의 사이즈를 출력
            System.out.println("전체 게임 수 : " + list.size() + "개");

            // for ( Element element : elements ) { // for (개별 : 덩어리)
            for (int i = start; i <= list.size(); i++) {

                System.out.println(i + "번째 데이터 수집 중...");

                // 두번째 크롤링. 사용자 추가를 해보았으나 403 에러는 해결할 수 없었다. https 쪽의 보안 문제일지도!
                Document doc2 = Jsoup.connect(list.get(i)).userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36").get();

                // 각 소프트웨어의 제목
                Elements title = doc2.select(".base");
                // 각 소프트웨어의 가격
                Elements price = doc2.getElementsByAttributeValue("class", "product-page-info-form");
                price = price.select(".price");
                // 각 소프트웨어의 카테고리
                Elements genre = doc2.getElementsByAttributeValue("class", "product-attribute game_category");
                genre = genre.select(".product-attribute-val");
                // 각 소프트웨어의 이용등급
                Elements level = doc2.select(".product-attribute-esrb");
                // 각 소프트웨어의 이미지
                Element image = doc2.getElementsByTag("img").get(4);

                try {
                    
                    // 변수 선언
                    String s_title = "";
                    int s_price = 0;
                    String s_genre = "";
                    String s_level = "";
                    String age = "";
                    String img = image.attr("src");

                    // 제목 분리
                    for (Element element : title) {
                        s_title = element.text();
                    } // for end

                    // 가격 분리
                    for (Element element : price) {
                        s_price = Integer.parseInt(element.text().replaceAll("[^0-9]", ""));
                    } // for end

                    // 카테고리 분리
                    for (Element element : genre) {
                        s_genre = element.text().replaceAll("[\\,]", "");
                    } // for end

                    // 이용등급 분리. 이미지로만 표시를 하길래 이미지를 글로 변경
                    for (Element element : level) {
                        age = element.attr("src");

                        if (age.equals("https://store.nintendo.co.kr/media/attribute/swatch/a/g/age_all.png")) {
                            age = "전체이용가";
                        } else if (age.equals("https://store.nintendo.co.kr/media/attribute/swatch/a/g/age_18.png")) {
                            age = "19세 이용가";
                        } else if (age.equals("https://store.nintendo.co.kr/media/attribute/swatch/a/g/age_15.png")) {
                            age = "15세 이용가";

                        } else if (age.equals("https://store.nintendo.co.kr/media/attribute/swatch/a/g/age_12.png")) {
                            age = "12세 이용가";
                        }

                    } // for end

                        /*for (Element element : image) {
                            img = element.attr("src");
                        } // for end*/

                    // 값이 하나라도 빈값이라면 패스
                    if (s_title.equals("") || s_genre.equals("") || age.equals("") || img.equals("")) {
                        continue;
                    } // if end

                    // Builder에 담기
                    crawlingDTO = CrawlingDTO.builder()
                            .gm_code("dt" + (String.format("%04d", i)))
                            .gm_name(s_title)
                            .gm_price(s_price)
                            .gm_category(s_genre)
                            .gm_level(age)
                            .gm_img(img)
                            .build();

                    System.out.println(crawlingDTO.getGm_category());
                    System.out.println(crawlingDTO.getGm_name());
                    System.out.println(crawlingDTO.getGm_price());
                    System.out.println(crawlingDTO.getGm_code());
                    System.out.println(crawlingDTO.getGm_level());
                    System.out.println(crawlingDTO.getGm_img());

                    // 크롤링 데이터를 DB에 저장
                    cnt = crawlingDAO.autoCrawling(crawlingDTO);

                    // static/images의 이미지를 가져오기
                    String path = ResourceUtils.getURL("classpath:static/images").getPath();

                    // 이미 크롤링한 적이 있다면 해당 폴더 삭제
                    /*File folder = new File(path + "/thumb");
                    if (folder.exists()) {
                        folder.delete();
                    }*/

                    // 폴더 생성
                    File folder2 = new File(path + "/thumb/" + crawlingDTO.getGm_code());
                    if (!folder2.exists()) {
                        folder2.mkdirs();
                    }

                    // 이미지 저장
                    URL url = new URL(crawlingDTO.getGm_img());
                    InputStream is = url.openStream();
                    FileOutputStream fos = new FileOutputStream(path + "/thumb/" + crawlingDTO.getGm_code() + "/thumb.jpg");
                    int j;
                    while ((j = is.read()) != -1) {
                        fos.write(j);
                    }
                    fos.close();

                    System.out.println(crawlingDTO.getGm_code() + " :: 이미지 저장 완료");

                    Thread.sleep(3000);

                } catch (Exception e) {
                    System.out.println("크롤링 오류 : " + e);
                } // try catch end

            } // for end

        } catch (Exception e) {
            e.printStackTrace();
        }

        String message = "";

        if (cnt == 0) {
            System.out.println("-----크롤링 실패");
            message = "더이상 자동 등록할 데이터가 없습니다";
        } else {
            System.out.println("-----크롤링 성공");
            message = "자동 등록이 완료되었습니다";
        } // if end

        return message;
    } // autoCrawling() end


} // class end
