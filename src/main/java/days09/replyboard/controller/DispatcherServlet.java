package days09.replyboard.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days09.replyboard.command.CommandHandler;


public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 2651573099997609735L;
	
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		// System.out.println("> DispatcherServlet.init() ...");
		String path = this.getInitParameter("path");
		// System.out.println(path);
		String realPath = this.getServletContext().getRealPath(path);
		// System.out.println(realPath);
		Properties prop = new Properties();
		
		try(FileReader reader = new FileReader(realPath)) {
			prop.load(reader);
		} catch (Exception e) {
			throw new ServletException();
		} 
		// 
		Set<Entry<Object, Object>> set = prop.entrySet();
		Iterator<Entry<Object, Object>> ir = set.iterator();
		while (ir.hasNext()) {
			Entry<Object, Object> entry = ir.next();
			String url = (String) entry.getKey();
			String className = (String) entry.getValue();
			
			// ListHandler h = new ListHandler();
			
			try {
				Class<?> commandHandlerClass = Class.forName(className);
				CommandHandler commandHandler;
				commandHandler = (CommandHandler) commandHandlerClass.newInstance();
				this.commandHandlerMap.put(url, commandHandler);
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println(request.getRequestURL());
		// System.out.println(request.getRequestURI());
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		requestURI = requestURI.replace(contextPath, "");
		
		CommandHandler handler = this.commandHandlerMap.get(requestURI);
		
		String viewPage = null;
		try {
			viewPage = handler.process(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	@Override
	public void destroy() {
		// System.out.println("> DispatcherServlet.destroy() ...");
	}
	
} // class
