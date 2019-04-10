package springhibernate;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.engine.jdbc.BlobProxy;
import org.apache.commons.logging.impl.Log4JLogger;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.pojo.AdminCred;
import com.pojo.MapperClass;

import springdao.DAOClass;

@Controller

public class IndexController {
	
	@Autowired
	DAOClass daoclass;
	
	MapperClass mcobject;

	private MultipartResolver multipartResolver;
	
	private static final Logger logger = Logger.getLogger(IndexController.class);
	
	static String uemail="";
	
	@RequestMapping(value="/welcome",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView display(HttpSession session,HttpServletRequest request)
	{
		
		logger.info("Msg from display method");
	
		
		//session closed
		System.out.println("Session That is going to close  is "+session.getId());
		session.invalidate();
		System.out.println("Previous session close");
		ModelAndView modelandview=new ModelAndView("welcomepage");
		return modelandview;
	}
	
	
	//method for login
	
	@RequestMapping(value="/userloginform",method= RequestMethod.POST)
	public ModelAndView userform(@RequestParam("email")String email,@RequestParam("password") String password,HttpSession session,HttpServletRequest request,Model model)
	{	
		logger.info("Msg from userform method");
		mcobject=new MapperClass();
		mcobject.setEmail(email);
		mcobject.setPassword(password);
		int usercheck=daoclass.loginsearch(mcobject);
	
		System.out.println(usercheck);
		if(usercheck>0)
		{
			uemail=email;
			//session start
			session=request.getSession();
			System.out.println("Current Session ID is "+session.getId()+"Time is "+session.getCreationTime());
			ModelAndView modelandview=new ModelAndView("firstpage");
			
			//set session variable
			HttpSession session1=request.getSession();
			session1.setAttribute("username", email);
			
			model.addAttribute("username", email);
			model.addAttribute("id",usercheck);
			return modelandview;
		}
		else {
			
			ModelAndView modelandview=new ModelAndView("welcomepage");
			modelandview.addObject("message", "Please Register");
			return modelandview; 
		}
		

	    		
	}
	
	@RequestMapping(value="/registrationpage")
	public ModelAndView registrationpage(HttpSession session)
	{
		ModelAndView modelandview=new ModelAndView("registrationpage");
		
		return modelandview;
	}
	
	@RequestMapping(value="/registration",method= {RequestMethod.POST,RequestMethod.GET})	
	public String registration(@RequestParam("email") String email,@RequestParam("password") String password, @RequestParam("password-repeat") String passwordrepeat,@RequestParam("fileToUpload") MultipartFile file,Model model,HttpServletRequest request) throws Exception
	{
			logger.info("Msg from Registration Method");
			mcobject=new MapperClass();
		
			mcobject.setEmail(email);
			mcobject.setPassword(password);
			
			String webApp="/home/cmssu/Mali/";
	
			//Testing
			byte[] bytes = file.getBytes();

			
			// Creating the directory to store file
			String rootPath ="/home/cmssu/Desktop" ;
		
			
			//Logic select image and store into /home/cmssu/Mali/tempFiles folder and from that path store image to database
			File dir = new File(rootPath + File.separator + "tmpFiles");
			if (!dir.exists())
				dir.mkdirs();

			// Copy file into folder
			File serverFile = new File(dir.getAbsolutePath()
					+ File.separator + email);
			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();

			//get image from folder and pass to getImage() method
			mcobject.setProfile_pic(BlobProxy.generateProxy(getImage(rootPath+File.separator + "tmpFiles"+File.separator+email)));
			daoclass.register(mcobject);
			model.addAttribute("message","Successfully Registered");

			return "welcomepage";
		
		
	}
		
	
	//use to convert image into bytes 
	public static byte[] getImage(String filename) {
		Path path = Paths.get(filename);
		byte[] data = null;
		try {
			data = Files.readAllBytes(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return data;
	}


	@RequestMapping("/adminloginpage")
	public ModelAndView adminloginpage(HttpSession session,Model model)
	{
		logger.info("Session Invalidated");
		session.invalidate();
		
		ModelAndView modelandview=new ModelAndView("adminloginpage");
		model.addAttribute("message","Admin");
		return modelandview;
		
	}
	@RequestMapping("/adminauthentication")
	public ModelAndView adminAuthentication(@RequestParam("email") String email,@RequestParam("password") String password,Model model,HttpSession session,HttpServletRequest request)
	{
		session.invalidate();
		
		if(email.equals("admin@gmail.com") && password.equals("admin@123")) {
			ModelAndView modelandview=new ModelAndView("firstpage");
			
			//call
			logger.info("Call to Dao service for fetch records");
			
			//set session variable
			HttpSession session1=request.getSession();
			session1.setAttribute("username", email);
			
			
			Map<Integer, List<String>>userlist =(Map<Integer, List<String>>) daoclass.useradminlist(daoclass.fetchuserslist());


			System.out.println(userlist.keySet());
			logger.info("List Created");
			
			
			model.addAttribute("lists", userlist);
			model.addAttribute("message","true1");
			
			return modelandview;
		}
		else {
			ModelAndView modelandview=new ModelAndView("adminloginpage");
			model.addAttribute("message","Invalid Credentials");
			return modelandview;
		}
		

	}


private void initMultipartResolver(ApplicationContext context)
  {
    try
    {
      this.multipartResolver = ((MultipartResolver)context.getBean("multipartResolver", MultipartResolver.class));
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("Using MultipartResolver [" + this.multipartResolver + "]");
      }
    }
    catch (NoSuchBeanDefinitionException ex)
    {
      this.multipartResolver = null;
      if (this.logger.isDebugEnabled())
        this.logger.debug("Unable to locate MultipartResolver with name 'multipartResolver': no multipart request handling provided");
    }
  }

@RequestMapping("/getSiteLogo")
public void getSiteLogo(HttpServletResponse response) throws IOException 
{
	byte site_logo[]=daoclass.getSite_Image("site_logo.png");
	InputStream inputstream=new ByteArrayInputStream(site_logo);
	IOUtils.copy(inputstream,response.getOutputStream());
}

@RequestMapping("/getProfile_Image")
public void getProfile_Image(HttpServletResponse response) throws IOException
{

	byte site_logo[]=daoclass.getSite_Image(uemail);
	InputStream inputstream=new ByteArrayInputStream(site_logo);
	IOUtils.copy(inputstream,response.getOutputStream());
}



}
