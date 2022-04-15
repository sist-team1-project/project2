package com.sist.manager;

import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

import java.io.*;
import java.net.*;

@Component
public class RecommendManager {

    public static void main(String[] args) {
        RecommendManager r = new RecommendManager();
        r.recommandData("겨울");
    }

    public List<Map<String,String>> recommandData(String fd) {
        System.out.println("검색어:" + fd);
        List<Map<String,String>> list  = new ArrayList<Map<String,String>>();
        
        String clientId = "zhzm8PcYn7zIUrxVIljo"; // 애플리케이션 클라이언트 아이디값"
        String clientSecret = "2JUmLTdvUJ"; // 애플리케이션 클라이언트 시크릿값"
        
        String text = null;
        try {
            text = URLEncoder.encode(fd + " 캠핑장", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패", e);
        }
        
        String apiURL = "https://openapi.naver.com/v1/search/local.xml?display=4&query=" + text; // xml 결과
        
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL, requestHeaders);
        
        
        try {
            Document doc = Jsoup.parse(responseBody); // URL → connection
            Elements item = doc.select("item");
            Elements title = doc.select("item > title");
            Elements category = doc.select("item > category");
            Elements address = doc.select("item > address");
            
            for (int i = 0; i < item.size(); i++) {
                
                Map map = new HashMap();
                map.put("title", title.get(i).text().replace("<b>", " ").replace("</b>", " "));
                map.put("category", category.get(i).text());
                map.put("address", address.get(i).text());
                list.add(map);
            }
        } catch (Exception ex) {
        }
        
        return list;
    }

    private static String get(String apiUrl, Map<String, String> requestHeaders) {
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }
            
            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl) {
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection) url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body) {
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();
            
            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }
            
            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}