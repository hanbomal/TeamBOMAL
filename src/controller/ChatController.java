package controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import model.Chatdata;

@Controller
@RequestMapping("/chatcontroller")
public class ChatController {

	@RequestMapping("/intro")
	public String intro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		 String cid="1";
		 String logPath = "C:\\save\\"+cid+".txt"; 
		
	     Path path = Paths.get(logPath);
	    
	     Charset cs = StandardCharsets.UTF_8;
	  
	     List<String> list = new ArrayList<String>();
	     List<Chatdata> chatd=new ArrayList<>();
	     
	     try{
	         list = Files.readAllLines(path,cs);
	     }catch(IOException e){
	         e.printStackTrace();
	     }
	     for(String readLine : list){
	    	 readLine.trim();
	        /* System.out.println(readLine);*/
	         
	         String[] tmp=readLine.substring(readLine.indexOf("[")+1, readLine.lastIndexOf("]")).split("\\]"+" "+"\\[");
	        List tmplist=new ArrayList();
	        for(int i=0;i<tmp.length;i++) {
	        	tmplist.add(tmp[i]);
	        }
	        if(tmp.length==2) {
	        	tmplist.add("");
	        }
	         
	         Chatdata cd=new Chatdata();
	         cd.setName((String)tmplist.get(0));
	         cd.setDate((String)tmplist.get(1));
	         cd.setContent((String)tmplist.get(2));
	      
	         chatd.add(cd);
	         
	     }

	    
			 
			  req.setAttribute("chatdata", chatd);
			  
		 
			  
		return "chat/websocketGroup";

	}
	

	@RequestMapping("/test")
	public String test(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		 String cid="1";
		 String logPath = "C:\\save\\"+cid+".txt"; 
		
	     Path path = Paths.get(logPath);
	    
	     Charset cs = StandardCharsets.UTF_8;
	  
	     List<String> list = new ArrayList<String>();
	     List<Chatdata> chatd=new ArrayList<>();
	     
	     try{
	         list = Files.readAllLines(path,cs);
	     }catch(IOException e){
	         e.printStackTrace();
	     }
	     for(String readLine : list){
	    	 readLine.trim();
	        /* System.out.println(readLine);*/
	         
	         String[] tmp=readLine.substring(readLine.indexOf("[")+1, readLine.lastIndexOf("]")).split("\\]"+" "+"\\[");
	        List tmplist=new ArrayList();
	        for(int i=0;i<tmp.length;i++) {
	        	tmplist.add(tmp[i]);
	        }
	        if(tmp.length==2) {
	        	tmplist.add("");
	        }
	         
	         Chatdata cd=new Chatdata();
	         cd.setName((String)tmplist.get(0));
	         cd.setDate((String)tmplist.get(1));
	         cd.setContent((String)tmplist.get(2));
	      
	         chatd.add(cd);
	         
	     }

	    
			 
			  req.setAttribute("chatdata", chatd);
			  
		 
			  
		return "chat/websocketGroup2";

	}
	
}
