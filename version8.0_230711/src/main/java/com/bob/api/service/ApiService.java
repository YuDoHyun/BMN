package com.bob.api.service;

import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Service;
import com.fasterxml.jackson.databind.ObjectMapper;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
@Service
public class ApiService {
    @SuppressWarnings("unchecked")
    public Map<String, String> restApi(Map<String,String> paramMap,String url) {
        
        Map<String, String> m = new HashMap<String, String>();
        
        try {
            
            ObjectMapper mapper = new ObjectMapper();
            String param = mapper.writeValueAsString(paramMap);
            
            System.out.println(param);
            
            OkHttpClient client = new OkHttpClient();
            MediaType mediaType = MediaType.parse("application/json");
            RequestBody body = RequestBody.create(mediaType,param);
            Request request = new Request.Builder().url(url).post(body)
                    .addHeader("cache-control", "no-cache").build();
            Response response = client.newCall(request).execute();
            String result = response.body().string();
            ObjectMapper resultMap = new ObjectMapper();
            m = mapper.readValue(result, Map.class);
            
            System.out.println("map 변환 = " + m.toString());
            System.out.println(result);
            
        } catch (Exception e) {
            System.out.println("-오류-");
        }
        
        
        return m;
    }
    
}