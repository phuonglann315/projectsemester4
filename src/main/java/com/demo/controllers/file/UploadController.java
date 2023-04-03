package com.demo.controllers.file;

import com.demo.Doanky4Application;
import com.demo.models.Roomtypeimage;
import com.demo.service.RoomtypeimageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.HashMap;
import java.util.Map;

import static com.fasterxml.jackson.databind.type.LogicalType.DateTime;

@Controller
@RequestMapping({"upload"})
public class UploadController {

    @Autowired
    RoomtypeimageService roomtypeimageService;

    @RequestMapping(value = { "/", "" }, method = RequestMethod.POST, consumes = {"multipart/form-data"})
    public ResponseEntity<Map<String,String>> uploadFile(@RequestParam("file") MultipartFile file){
        try{
            URL path = Doanky4Application.class.getClassLoader().getResource("static/backend/images/room/");
            String fileName = file.getOriginalFilename();
            Timestamp timestamp = Timestamp.from(Instant.now());
            fileName = timestamp.getTime() +fileName;
            InputStream is = file.getInputStream();
            Files.copy(is, Paths.get(path.getPath().toString().substring(1) + fileName));
            Map<String,String> response = new HashMap<String,String>();
            response.put("filename",fileName);
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
