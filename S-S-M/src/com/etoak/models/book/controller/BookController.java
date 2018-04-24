package com.etoak.models.book.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.etoak.commons.page.Page;
import com.etoak.models.book.bean.AddCa;
import com.etoak.models.book.service.BookService;
import com.etoak.models.bookid.bean.Book;
import com.etoak.models.bookid.service.BookidService;




@Controller
@RequestMapping(value="book")
public class BookController {
	
	//注入类
	@Autowired
	private  BookService bookservic;
	
	@Autowired
	private BookidService bookidservice;
	
	//注入分页类
    @Autowired
	private Page<Book>pageplus;

    
    
    
    @RequestMapping(value = "/upload.do",method=RequestMethod.POST)  
    public ModelAndView upload(@RequestParam(value = "file") 
     MultipartFile file, HttpServletRequest request, Model model) {  
        ModelAndView mv=new ModelAndView();
        System.out.println("开始");  
        //获取的服务器的根(绝对路径)
        String path = request.getSession().getServletContext().getRealPath("/pages/models/upload");  
        //获取文件的性对路径  这个从前天拿去过来的file 路径
        String fileName = file.getOriginalFilename();  
       //   String fileName = new Date().getTime()+".jpg";  
        System.out.println(path);  
        File targetFile = new File(path, fileName);  
        if(!targetFile.exists()){  
            targetFile.mkdirs();  
        }  
  
        //保存  
        try {  
            file.transferTo(targetFile);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
     /*   model.addAttribute("fileUrl", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"pages/models/upload/"+fileName);  
  */
        mv.addObject("fileUrl", "成功");
       /* addAttribute("fileUrl", "成功");*/
        mv.setViewName("bookindex/uploadsuccess");
        return mv;  
    }  
  
  
    

    // 添加书籍类别的controller 
     @RequestMapping(value="addCa_book",method=RequestMethod.POST)
        /* public String addCabook(@RequestParam(value="name")String name){*/
	 public String addCabook(String name,HttpServletResponse response,HttpServletRequest request){
      response.setContentType("text/plain;charset='utf-8'"); 
	  bookservic.addca(name);    
      System.out.println(name);
	  return "bookindex/addca"; 
      }	
	
         
    //查询书籍的类型      
   @ResponseBody
   @RequestMapping(value="/ListAllCa",method=RequestMethod.POST)
    public List<AddCa> ListAllCa(HttpServletResponse response){
	   //response.setContentType("text/plain;charset='utf-8'"); 
	   List<AddCa> list = bookservic.ListAllCa();
	   //去遍历list数据 
	   for(AddCa list1: list){
			System.out.println(list1.getName());
		}
        return list;
    }
         	

     //添加书籍
      @RequestMapping(value="/addbook",method=RequestMethod.POST)  
      public String  addbook(Book book){
    	    bookidservice.addbookid(book);
    	   return "bookindex/addbook";
    	   
       }   
      
      //删除操作
      @ResponseBody
      @RequestMapping(value="delete_book")
      public  Map<String, String> delete_book(Integer id){
    	  Map<String, String> map = new HashMap<String, String>();
    	   map.put("msg","删除成功！！！");
    	   bookidservice.deletebook(id);
		   return map;
		   
      }
      
        //  查询书籍
        //@Bean (name="getPage")  @ResponseBody
       @ResponseBody
        /*ajax 异步请求怎么又去加载整个页面啦*/
        @RequestMapping(value="queryAll_book",method=RequestMethod.POST,produces = "application/json;charset=UTF-8")
        public Page<Book> queryAll_book(int currentPage, ModelMap model,HttpServletResponse response) throws IOException{
    	   
    	     //注入就是实例化一个对象的，和new一个性质的
    	     Page<Book> pageplus = new Page<Book>();
    	   
    	      pageplus.setCurrentPage(currentPage);
    	  
    	       int total =bookidservice.queryAll_booked();
    	       pageplus.setTotal(total); 
    		   // List<Book> rows  = bookidservice.querySome(page.getStart(),page.getPageSize());
    		   /*
    	       response.setContentType("text/html;charset=UTF-8");
    	       PrintWriter out = response.getWriter();
               */
    	        /*  [Book [id=12, name=商品袜子, price=234, author=小花, publishdate=2018-03-24 00:00:00.0, bookcount=2, category=68, status=1], 
    	       */
    	         List<Book> rows=bookidservice.querySome(pageplus.getStart(),pageplus.getPageSize());
    	         
    	         /* 当一个数据是全局变量时  ，只要我们的位置正确 不在里面他也会去加载的 
	      	        * */
    	          for (int i = 0; i < rows.size(); i++) {
    	           /*for (Book book:rows) { for(){} 他是对一维数组器作用的  如果我们利用的是二维数组的利用下标的方式去加载数组      */
    	             String id=rows.get(i).getCategory();
    	      	      String category = bookservic.ListAllCa1(id);
    	      	       rows.get(i).setCategory(category);
    	      	      
    	      	       /*
    	      	       book.setCategory(category);
    	      	       pageplus.setRows(rows);*/
    	            }
    	         pageplus.setRows(rows);
    	         
				 return  pageplus;
    		 
    		 
    		/* model.addAttribute("book",rows);*/
    	     /*return new ModelAndView("bookindex/listbook");*/
            /*   System.out.println(model);
              response.getWriter().print(total);
            */
    		/* for(Book book:rows){
    			 model.put("user", book);
    		 }*/
    		 
          /*  return "bookindex/listbook";*/
         }
         
      
   /*   
  	//加入这个类
  	private Page<Book> page;
  	public Page<Book> getPage(){return page;}
  	
  	private String caid;
  	public void setCaid(String caid){
  		this.caid = caid;
  	}
  	public String querySome(){
  		
  		// 这里的page 主要就把前端的 pagestart和 pagelast set到page类中
  		              page = new Page<Book>();
  		page.setCurrentPage(currentPage);
  		//总记录数  (统计所以得数据总数)
  		int total = bs.countBook(name, caid);
  		
          //总记录数给page类 		
  		page.setTotal(total);   
  		//得到是每条数据的集合 list 
  		List<Book> rows  = bs.querySome(page.getStart(),page.getPageSize(), name, caid);
  		page.setRows(rows);
  		//{pre:,next:xx,rows:[{id：xx,name:xx,category:{id:xxx;name:xxx,books:}}]}
  		return "querySome_success";
        */
      
         
         
         
      
      
         
}
