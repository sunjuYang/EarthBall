package com.kh.earthball.fo.store.template;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class GeocodingApi {
  private static final String REST_API_KEY = "83a4476c8819ab502b4056fe5534f388";

  // 주소를 입력받아 위도, 경도를 반환하는 메소드
  public double[] getGeocode(String address) {
    try {
      String encodedAddress = java.net.URLEncoder.encode(address, "UTF-8");
      String apiUrl = "https://dapi.kakao.com/v2/local/search/address.json?query=" + encodedAddress;
      URL url = new URL(apiUrl);
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("GET");
      conn.setRequestProperty("Authorization", "KakaoAK " + REST_API_KEY);

      BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      String line;
      StringBuilder sb = new StringBuilder();
      while ((line = br.readLine()) != null) {
        sb.append(line);
      }
      br.close();

      JSONParser parser = new JSONParser();
      JSONObject jsonObject = (JSONObject) parser.parse(sb.toString());
      JSONArray documents = (JSONArray) jsonObject.get("documents");
      if (documents.size() > 0) {
        JSONObject firstDocument = (JSONObject) documents.get(0);
        JSONObject addressInfo = (JSONObject) firstDocument.get("address");
        String latitudeStr = (String) addressInfo.get("y");
        double latitude = Double.parseDouble(latitudeStr);
        String longitudeStr = (String) addressInfo.get("x");
        double longitude = Double.parseDouble(longitudeStr);

        return new double[]{latitude, longitude};
      } else {
        System.out.println(address);
        System.out.println("검색 결과가 없습니다.");
        return new double[]{0.0, 0.0};
      }
    } catch (IOException e) {
      e.printStackTrace();
    } catch (ParseException e) {
      e.printStackTrace();
    }
    return null;
  }

  // 위도, 경도를 입력받아 주소를 반환하는 메소드
  public String getJibunAddress(double latitude, double longitude) {
    try {
      String apiUrl = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x=" + longitude + "&y=" + latitude + "&input_coord=WGS84";
      URL url = new URL(apiUrl);
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("GET");
      conn.setRequestProperty("Authorization", "KakaoAK " + REST_API_KEY);

      BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      String line;
      StringBuilder sb = new StringBuilder();
      while ((line = br.readLine()) != null) {
        sb.append(line);
      }
      br.close();

      JSONParser parser = new JSONParser();
      JSONObject jsonObject = (JSONObject) parser.parse(sb.toString());
      JSONArray documents = (JSONArray) jsonObject.get("documents");
      if (documents.size() > 0) {
        JSONObject firstDocument = (JSONObject) documents.get(0);
        JSONObject jibunAddress = (JSONObject) firstDocument.get("address");
        String jibunName = (String) jibunAddress.get("address_name");
        return jibunName;
      } else {
        System.out.println("검색 결과가 없습니다.");
        return "";
      }
    } catch (IOException | ParseException e) {
      e.printStackTrace();
    }
      return null;
  }

}