//package com.xxxx.controller;
//
//import java.io.BufferedReader;
//import java.io.BufferedWriter;
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.FileNotFoundException;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.io.OutputStream;
//import java.io.OutputStreamWriter;
//import java.util.ArrayList;
//import java.util.Collections;
//import java.util.Date;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.commons.CommonsMultipartResolver;
//
//import com.xxxx.controller.movieType;
//import com.xxxx.entity.*;
//import com.xxxx.service.*;
//
//@Controller
//@RequestMapping("/movie")
//public class MovieServlet {
//
//    @Autowired
//    MovieService movieService;
//    @Autowired
//    UserService clientService;
//    @Autowired
//    SessionsService sessionsService;
//    @Autowired
//    commentsService commentsService;
//
//    @RequestMapping("/addmovie")
//    public String addmovie(Movie movie, HttpSession session,HttpServletRequest request,@RequestParam(value = "file", required = false) MultipartFile file)
//            throws IOException {
////		 	System.out.println(request.getContextPath()+"/images");
////	        //String path = request.getSession().getServletContext().getRealPath("upload");
////		 	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
////		 	String path=request.getContextPath()+"/images"+"/";
////	        String fileName = new Date().getTime()+"1111111111.jpg"; //文件命名
////	        System.out.println("文件上传目录:"+path);
////	        System.out.println(fileName);
////	        File targetFile = new File(path, fileName);
////	        if(!targetFile.exists()){
////	            targetFile.mkdirs();
////	        }
////	        //保存
////	        try {
////	            file.transferTo(targetFile);
////	        } catch (Exception e) {
////	            e.printStackTrace();
////	        }
//
//        //调用service
//        int flag = movieService.addMovie(movie);
//        if(flag==0){
//            request.setAttribute("error", "上映时间已过，添加电影失败...");
//            return "/add_movie.jsp";
//        }else{
//            seleteMovies(session,"store");
//            return "redirect:/storeroom.jsp";
//        }
//    }
//
//    @RequestMapping("/updatemovie")
//    public String updatemovie(Movie movie, Model model,HttpSession session) {
//        movieService.updateMovie(movie);
//        seleteMovies(session, "manager");
//        return "redirect:/movie_admin.jsp";
//    }
//
//    @RequestMapping("/seleteMovies")
//    public String seleteMovies(HttpSession session,String moviedo) {
//        if(moviedo.equals("store"))
//        {
//            List<Movie> movieList = movieService.seleteMovies();
//            session.setAttribute("movieStore", movieList);
//            return "redirect:/storeroom.jsp";
//        }
//        if(moviedo.equals("manager"))
//        {
//            List<Movie> movieList = movieService.seleteMovies();
//            session.setAttribute("moviemanager", movieList);
//            return "redirect:/movie_admin.jsp";
//        }
//        else {
//            return "redirect:/storeroom.jsp";
//        }
//    }
//
//
//    @RequestMapping("/seleteMovieById")
//    public String seleteMovieById(@RequestParam("id") int id,HttpSession session){
//        Movie movie = movieService.seleteMovieById(id);
//
//        if(movie==null){
//            session.setAttribute("movie",null);
//            return null; //
//        }
//        else {
//            session.setAttribute("mov_detail", movie);
//            return "redirect:/detail.jsp";
//        }
//    }
//
//    @RequestMapping("/seleteMovieByActor")
//    public String seleteMovieByActor(String actor, Model model) {
//        List<Movie> movieList = movieService.seleteMovieByActor(actor);
//
//        if (movieList == null) {
//            model.addAttribute("movieList", null);
//            return null; //
//        } else {
//            model.addAttribute("movieList", movieList);
//            return "/";
//        }
//    }
//
//    @RequestMapping("/seleteMovieByDirector")
//    public String seleteMovieByDirector(String director, Model model) {
//        List<Movie> movieList = movieService.seleteMovieByDirector(director);
//
//        if (movieList == null) {
//            model.addAttribute("movieList", null);
//            return null; //
//        } else {
//            model.addAttribute("movieList", movieList);
//            return "/";
//        }
//    }
//
//    @RequestMapping("/seleteMovieByStatus")
//    public String seleteMovieByStatus(String moviedo,Integer status,HttpSession session,HttpServletRequest request) {
//        if(status==9){
//            seleteMovies(session,moviedo);
//            return "redirect:/storeroom.jsp";
//        }
//        List<Movie> movieByStatus = movieService.seleteMovieByStatus(status);
//        session.setAttribute("movieByStatus", movieByStatus);
//        session.setAttribute("status", status);
//        return "redirect:/storeroomByChoose.jsp?";
//    }
//    @RequestMapping("/seleteMovieByIndex")
//    public String seleteMovieByIndex(HttpSession session) {
//        List<Movie> moviesDoing = movieService.seleteMovieByStatus(1);
//        List<Movie> moviesComing = movieService.seleteMovieByStatus(0);
//        session.setAttribute("moviesDoing", moviesDoing);
//        session.setAttribute("moviesComing", moviesComing);
//        return "redirect:/testindex.jsp";
//
//    }
//
//    @RequestMapping("/seleteMovieBetweenDate")
//    public String seleteMovieBetweenDate(String showtime, Model model) {
//        List<Movie> movieList = movieService.seleteMovieBetweenDate(showtime);
//        if (movieList == null) {
//            model.addAttribute("movieList", null);
//            return null;
//        } else {
//            model.addAttribute("movieList", movieList);
//            return "/checkMovieList.jsp";
//        }
//    }
//    @RequestMapping("/seleteMovieBytype1")
//    public String seleteMovieBytype1(@RequestParam("type") int i ,HttpSession session) {
//        String type = movieType.gettype(i);
//        List<Movie> movieList = movieService.seleteMovieBytype(type);
//        if(movieList==null){
//            session.setAttribute("movieList",null);
//            return "redirect:/hotMovieBychoose.jsp";
//        }
//        else {
//            session.setAttribute("movieList", movieList);
//            return "redirect:/hotMovieBychoose.jsp";
//        }
//    }
//    @RequestMapping("/seleteMovieBytype0")
//    public String seleteMovieBytype0(@RequestParam("type") int i,HttpSession session){
//        String type = movieType.gettype(i);
//        List<Movie> movieList = movieService.seleteMovieBytype(type);
//        if(movieList==null){
//            session.setAttribute("movieList",null);
//            return "redirect:/comingMovieBychoose.jsp";
//        }
//        else {
//            session.setAttribute("movieList", movieList);
//            return "redirect:/comingMovieBychoose.jsp";
//        }
//    }
//
//    @RequestMapping("/seleteMovieBytypeSearch")
//    public String seleteMovieBytypeSearch(@RequestParam("type") int i,HttpSession session){
//        String type = movieType.gettype(i);
//        List<Movie> movieList = (List<Movie>) session.getAttribute("movieList");
//        List<Movie> movieList2 = new ArrayList<Movie>() ;
//        for(int index=0;index<movieList.size();index++){
//            if(movieList.get(index).getType().equals(type)){
//                movieList2.add(movieList.get(index));
//            }
//        }
//        System.out.println(type+"  "+movieList2.size());
//        session.setAttribute("searchflag", i);
//        session.setAttribute("movieList2", movieList2);
//        return "redirect:/searchMovie.jsp";
//
//    }
//
//    @RequestMapping("/selectByName")
//    public String selectByName(String movName,HttpSession session){
//        session.setAttribute("searchflag", -1);
//        session.setAttribute("movieList2",null);
//        List<Movie> movieList = movieService.seleteMovieByNama(movName);
//        if(movieList==null){
//            session.setAttribute("movieList",null);
//            session.setAttribute("searchName", movName);
//            return "redirect:/searchMovie.jsp";
//        }
//        else {
//            session.setAttribute("movieList", movieList);
//            session.setAttribute("searchName", movName);
//            return "redirect:/searchMovie.jsp";
//        }
//    }
//
//    @RequestMapping("/addsession")
//    public String addsession(HttpSession sessions){
//        List<Movie> movieList = movieService.seleteMovies();
//        sessions.setAttribute("movieList", movieList);
//        return "redirect:/add_session.jsp";
//    }
//
//    //管理员的统计管理
//    @RequestMapping("/seleteMoviesByStatis")
//    public String seleteMoviesByStatis(HttpSession session) {
//
//        List<Movie> movieList = movieService.seleteMovies();
//        for (Movie movie : movieList) {
//            double sumMoney = 0;
//            List<sessions> sessions = sessionsService.loadSessionsListByMov_id(movie.getId());
//            for (sessions sessions2 : sessions) {
//                sumMoney+=sessions2.getPrice()*sessions2.getTotalSold();
//            }
//            movie.setSumMoney(sumMoney);
//        }
//        session.setAttribute("movieStati", movieList);
//        return "redirect:/statistics_admin.jsp";
//
//    }
//    //管理员的统计管理---排序查看
//    @RequestMapping("/paixu")
//    public String paixu(String paixu,HttpSession session){
//        if(paixu.equals("0"))
//        {
//            List<Movie> moviePaixu = movieService.seleteMovies();
//            session.setAttribute("moviePaixu", moviePaixu);
//            return "redirect:/statistics_admin.jsp";
//        }
//        if(paixu.equals("1"))
//        {
//            List<Movie> moviePaixu = movieService.seleteMovies();
//            for (Movie movie : moviePaixu) {
//                double sumMoney = 0;
//                List<sessions> sessions = sessionsService.loadSessionsListByMov_id(movie.getId());
//                for (sessions sessions2 : sessions) {
//                    sumMoney+=sessions2.getPrice()*sessions2.getTotalSold();
//                }
//                movie.setSumMoney(sumMoney);
//            }
//            for(int i = 0;i<moviePaixu.size()-1;i++){
//                for(int j = i+1;j<moviePaixu.size();j++){
//                    if(moviePaixu.get(i).getSumMoney()<moviePaixu.get(j).getSumMoney())
//                    {
//                        Collections.swap(moviePaixu, i, j);
//                    }
//                }
//            }
//            session.setAttribute("moviePaixu", moviePaixu);
//            session.setAttribute("flag", "1");
//            return "redirect:/statisticsByChooes.jsp";
//        }
//        if(paixu.equals("2"))
//        {
//            List<Movie> moviePaixu = movieService.seleteMovies();
//            for (Movie movie : moviePaixu) {
//                double sumMoney = 0;
//                List<sessions> sessions = sessionsService.loadSessionsListByMov_id(movie.getId());
//                for (sessions sessions2 : sessions) {
//                    sumMoney+=sessions2.getPrice()*sessions2.getTotalSold();
//                }
//                movie.setSumMoney(sumMoney);
//            }
//            for(int i = 0;i<moviePaixu.size()-1;i++){
//                for(int j = i+1;j<moviePaixu.size();j++){
//                    if(moviePaixu.get(i).getTotalScore()<moviePaixu.get(j).getTotalScore())
//                    {
//                        Collections.swap(moviePaixu, i, j);
//                    }
//                }
//            }
//            session.setAttribute("moviePaixu", moviePaixu);
//            session.setAttribute("flag", "2");
//            return "redirect:/statisticsByChooes.jsp";
//        }
//        else return "redirect:/statisticsByChooes.jsp";
//    }
//
//    @RequestMapping("/goMovDetail")
//    public String goMovDetail(@RequestParam("id") int id,HttpSession session){
//        Movie movie = movieService.seleteMovieById(id);
//        List<sessions> sessionsList = sessionsService.loadSessionsListByMov_id(id);
//        List<comments> commentsList = new ArrayList<comments>();
//        List<User>  comCliList = new ArrayList<User>();
//        for(int i =0;i<sessionsList.size();i++){
//            List<comments> cList = commentsService.selectBySesId(sessionsList.get(i).getId());
//            commentsList.addAll(cList);
//
//            for(int j=0;j<cList.size();j++){
//                User cli = UserService.loadUserByID(cList.get(j).getCliId());
//                comCliList.add(cli);
//            }
//        }
//        session.setAttribute("comCliList", comCliList);
//        session.setAttribute("comList",commentsList );
//        session.setAttribute("mov_detail", movie);
//        return "redirect:/detail.jsp";
//    }
//}
package com.xxxx.controller;

import com.xxxx.entity.Movie;
import com.xxxx.entity.User;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.service.MovieService;
import com.xxxx.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.List;

@WebServlet("/selectByName")
public class MovieServlet extends HttpServlet {
    // 实例化 UserService对象
    MovieService movieService = new MovieService();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 接受客户端请求、用户参数
//        request.setCharacterEncoding("UTF-8");
        String movName = request.getParameter("movName");


        // 调用service层方法，返回消息模型对象
        List<Movie> movies = movieService.seleteMovieByName(movName);
        // 判断消息模型的状态码
        request.getSession().setAttribute("movieList", movies);
        request.getSession().setAttribute("searchName", movName);
        response.sendRedirect("searchMovie.jsp");
    }
}