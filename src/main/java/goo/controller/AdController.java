package goo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import goo.ad.model.*;
import goo.area.model.*;
import goo.sigungu.model.*;

import java.io.*;
import java.util.List;

@Controller
public class AdController {
   
   @Autowired
   private AdService adService;
   
   
}