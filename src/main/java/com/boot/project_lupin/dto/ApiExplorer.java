package com.boot.project_lupin.dto;

import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import org.xml.sax.InputSource;

@Component
public class ApiExplorer {

    private final String serviceKey = "ANf7fu8j7ER7Q%2BayGGhK46lM5o8ro9cNlX5F6lqLZy0EFgpvo2KLL05mkOfxZq0a%2FmYt1OuyNQw0gw0YqY7cDQ%3D%3D";

    public List<PerformanceDTO> getPerformancesByRealm(String from, String to, int page, int rows, String realmCode) throws Exception {
        StringBuilder urlBuilder = new StringBuilder("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/realm");

        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("realmCode", "UTF-8") + "=" + URLEncoder.encode(realmCode, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("from", "UTF-8") + "=" + URLEncoder.encode(from, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("to", "UTF-8") + "=" + URLEncoder.encode(to, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("cPage", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(page), "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("rows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(rows), "UTF-8"));

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");

        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }

        rd.close();
        conn.disconnect();

        return parseXML(sb.toString());
    }

    // XML 파싱 메서드
    private List<PerformanceDTO> parseXML(String xmlData) throws Exception {
        List<PerformanceDTO> performances = new ArrayList<>();
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(new InputSource(new StringReader(xmlData)));

        NodeList performanceList = document.getElementsByTagName("perforList");

        for (int i = 0; i < performanceList.getLength(); i++) {
            Element element = (Element) performanceList.item(i);

            String title = getTagValue("title", element);
            String startDate = getTagValue("startDate", element);
            String endDate = getTagValue("endDate", element);
            String place = getTagValue("place", element);
            String thumbnail = getTagValue("thumbnail", element);

            PerformanceDTO performance = new PerformanceDTO(title, startDate, endDate, place, thumbnail);
            performances.add(performance);
        }
        return performances;
    }

    private String getTagValue(String tag, Element element) {
        NodeList nodeList = element.getElementsByTagName(tag);
        if (nodeList.getLength() > 0) {
            return nodeList.item(0).getTextContent();
        }
        return null;
    }
}
