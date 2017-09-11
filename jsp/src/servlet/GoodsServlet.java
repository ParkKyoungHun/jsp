package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.GoodsInfo;
import dto.VendorInfo;
import service.GoodsService;
import service.GoodsServiceImpl;

public class GoodsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private GoodsService gs = new GoodsServiceImpl();
	private Gson g = new Gson();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			String command = request.getParameter("command");
			if(command.equals("list")) {
				List<GoodsInfo> list = gs.selectGoodsList(null);
				List<VendorInfo> vList = gs.selectVendorList(null);
				request.setAttribute("goodsList", list);
				request.setAttribute("vendorList", vList);
				String url = "/goods/goods_list.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
			}
	} 

	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		if(command==null) {
			String param = request.getParameter("param");
			Map<String, String> hm = g.fromJson(param, HashMap.class);
			command = hm.get("command");
		} 
		if(command.equals("list")) {
			List<GoodsInfo> list = gs.selectGoodsList(null);
			List<VendorInfo> vList = gs.selectVendorList(null);
			request.setAttribute("goodsList", list);
			request.setAttribute("vendorList", vList);
			String url = "/goods/goods_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}else if(command.equals("vendorcombo")) {
			List<VendorInfo> vList = gs.selectVendorList(null);
			String result = g.toJson(vList);
			doProcess(response, result);
		}
	}
	
	public void doProcess(HttpServletResponse response, String result) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println(result);
	}
}
