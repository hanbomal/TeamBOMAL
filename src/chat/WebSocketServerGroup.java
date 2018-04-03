package chat;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/webGroup")
public class WebSocketServerGroup {
	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		synchronized (clients) {
			/*팀별 채팅을 위한 소스
			 * group명:이름:
			 * */
			
			
			String id = null;
		    Date date=new Date();
		    SimpleDateFormat sdf=new SimpleDateFormat("a h:mm");
		    String datetext=sdf.format(date);
			String name=session.getRequestParameterMap().get("name").toString();
			
			String movemessage 
			= "["+name.substring(1, name.indexOf("]"))
			+ "] [" +datetext+"] ["+ message+"]";
			
			System.out.println(movemessage);
			String cid = (String)	session.getRequestParameterMap().get("group").get(0);

		
			String logPath = "C:\\save\\"+cid+".txt"; 
			  
			  File file = new File(logPath);
			   
			  try {
			   
			   if(!file.exists())
				   file.createNewFile();
			  
			   BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file,true));
	            
	            if(file.isFile() && file.canWrite()){

	                bufferedWriter.write(movemessage.trim().replace("\n", ""));
	                bufferedWriter.newLine();
	                bufferedWriter.close();}
	            
			  } catch (Exception e) {
			   // TODO Auto-generated catch block
			   e.printStackTrace();
			  }
			  
			  
			
			for (Session client : clients) {
		/*cid  : client에서 보내는 group명	
		sid  : 서버가 가지고 있는 session  group명	*/
		
		String sid = (String)	client.getRequestParameterMap().get("group").get(0);
		
		System.out.println(sid+":"+cid);
				// 자기 자신한테는 보내지 않음
				if (!client.equals(session)) {
		if (cid.equals(sid))			
		client.getBasicRemote().sendText(movemessage);
					
				}

			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		System.out.println("onOpen");
		System.out.println(session.getRequestParameterMap());
		// Add session to the connected sessions set
		clients.add(session);
		String line ="===fromServer===";
		
		for (Session client : clients) {
			
		line += (String)client.getRequestParameterMap().get("name").get(0)+",";
		}
		line+=clients.size();
		System.out.println(line+"=============");
		
		try {
			for (Session client : clients) {
			
				String cid = (String)	session.getRequestParameterMap().get("group").get(0);
				String sid = (String)	client.getRequestParameterMap().get("group").get(0);
				
				System.out.println(sid+":"+cid);
					
					
				client.getBasicRemote().sendText(line);
							
						

					}
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
	}

	@OnClose
	public void onClose(Session session) {
		System.out.println("onClose");
		// Remove session from the connected sessions set
		clients.remove(session);
String line ="===fromServer===";
		
		for (Session client : clients) {
			
		line += (String)client.getRequestParameterMap().get("name").get(0)+",";
		}
		line+=clients.size();
		System.out.println(line+"=============");
		
		try {
			for (Session client : clients) {
			
				String cid = (String)	session.getRequestParameterMap().get("group").get(0);
				String sid = (String)	client.getRequestParameterMap().get("group").get(0);
				
				System.out.println(sid+":"+cid);
					
					
				client.getBasicRemote().sendText(line);
							
						

					}
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
}