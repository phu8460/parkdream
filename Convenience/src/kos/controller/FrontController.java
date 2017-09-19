package kos.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kos.board.BoardServlet;
import kos.member.MemberServlet;
import kos.order.OrderServlet;

public class FrontController extends HttpServlet {
	Logger logger = Logger.getLogger(FrontController.class);
	 
	public void doService(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		logger.info("doService ȣ��");
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		logger.info(command);
		String mode = "";
		ActionForward forward = new ActionForward();

		if(("/kos/reg.kos").equals(command)){//���� ��������
			logger.info("reg.kos ȣ��");
			mode = "insert";
			MemberServlet memServlet = new MemberServlet(mode);		
			try {
				forward = memServlet.execute(req, res);	
			} catch (Exception e){
				logger.info(e.getMessage());  
			}
			
		}
		else if(("/kos/checkMember.kos").equals(command)){
			logger.info("checkMember.kos ȣ��");
			mode = "check";
			MemberServlet memServlet = new MemberServlet(mode);
			try {
				forward = memServlet.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		else if(("/kos/login.kos").equals(command)){
			logger.info("login.kos ȣ��");
			mode = "login";
			MemberServlet memServlet = new MemberServlet(mode);
			try {
				forward = memServlet.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		} 
		else if(("/kos/logout.kos").equals(command)){
			logger.info("logout.kos ȣ��");
			mode = "logout";
			MemberServlet memServlet = new MemberServlet(mode);
			try {
				forward = memServlet.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		} 
		else if(("/kos/memUpdate.kos").equals(command)){
			logger.info("update.kos ȣ��");
			mode = "memUpdate";
			MemberServlet memServlet = new MemberServlet(mode);
			try {
				forward = memServlet.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/*************************board ����*****************************/
		else if(("/kos/getBoardList.kos").equals(command)){
			logger.info("getBoardList.kos ȣ��");
			mode = "getBoardList";
			BoardServlet boardServlet = new BoardServlet(mode);
			try {
				forward = boardServlet.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		else if(("/kos/getCommentList.kos").equals(command)){
			logger.info("getCommentList.kos ȣ��");
			mode = "getCommentList";
			BoardServlet boardServlet = new BoardServlet(mode);
			try {
				forward = boardServlet.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		else if(("/kos/boardView.kos").equals(command)){
			logger.info("boardView.kos ȣ��");
			mode = "boardView";
			int b_no = 0; 
			
			BoardServlet boardServlet = new BoardServlet(mode);
			try {
				forward = boardServlet.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		} 
	    else if("/kos/boardIns.kos".equals(command)){
	         logger.info("boardInsȣ��");
	         mode="boardIns";
	         BoardServlet boardServlet = new BoardServlet(mode);
	         try {
	            forward = boardServlet.execute(req, res); 
	         } catch (Exception e) {
	            // TODO: handle exception
	         }
	      }
	    else if("/kos/boardUpdate.kos".equals(command)){
	    	logger.info("boardUpdateȣ��");
	    	mode="boardUpdate";
	    	BoardServlet boardServlet = new BoardServlet(mode);
	    	try {
	    		forward = boardServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		// TODO: handle exception
	    	}
	    }
	    else if("/kos/boardDelete.kos".equals(command)){
	    	logger.info("boardDeleteȣ��");
	    	mode="boardDelete";
	    	BoardServlet boardServlet = new BoardServlet(mode);
	    	try {
	    		forward = boardServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		// TODO: handle exception
	    	}
	    }
	    else if("/kos/commentIns.kos".equals(command)){
	    	logger.info("commentIns ȣ��");
	    	mode="commentIns";
	    	BoardServlet boardServlet = new BoardServlet(mode);
	    	try {
	    		forward = boardServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		// TODO: handle exception
	    	}
	    }
	    else if("/kos/commentDelete.kos".equals(command)){
	    	logger.info("commentDelete ȣ��");
	    	mode="commentDelete";
	    	BoardServlet boardServlet = new BoardServlet(mode);
	    	try {
	    		forward = boardServlet.execute(req, res); 
	    	} catch (Exception e) { 
	    		// TODO: handle exception
	    	}
	    }
		
	      /****************************board ��**********************/
	       else if("/kos/getAirList.kos".equals(command)){
	    	  logger.info("getAirListȣ��");
	    	mode="getAirList";
	    	OrderServlet orderServlet = new OrderServlet(mode);
	    	try {
	    		forward = orderServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		// TODO: handle exception
	    	} 
	    }
	    else if("/kos/airBuy.kos".equals(command)){
	    	logger.info("airBuyȣ��");
	    	mode="airBuy";
	    	OrderServlet orderServlet = new OrderServlet(mode);
	    	try {
	    		forward = orderServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		// TODO: handle exception
	    	}
	    }
	    else if("/kos/airIns.kos".equals(command)){
	    	logger.info("airInsȣ��");
	    	mode="airIns";
	    	OrderServlet orderServlet = new OrderServlet(mode);
	    	try {
	    		forward = orderServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		// TODO: handle exception
	    	}
	    }
	    else if("/kos/airDel.kos".equals(command)){
	    	logger.info("airDelȣ��");
	    	mode="airDel";
	    	OrderServlet orderServlet = new OrderServlet(mode);
	    	try {
	    		forward = orderServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		// TODO: handle exception
	    	}
	    }
	    else if("/kos/airOrder.kos".equals(command)){
	    	logger.info("airOrderȣ��");
	    	mode="airOrder";
	    	OrderServlet orderServlet = new OrderServlet(mode);
	    	try {
	    		forward = orderServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		// TODO: handle exception
	    	}
	    }
	    else if("/kos/getAirOrder.kos".equals(command)){
	    	logger.info("getAirOrderȣ��");
	    	mode="getAirOrder";
	    	OrderServlet orderServlet = new OrderServlet(mode);
	    	try {
	    		forward = orderServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		// TODO: handle exception
	    	}
	    }
	    else if("/kos/getCarList.kos".equals(command)){
	    	logger.info("getCarListȣ��");
	    	mode="getCarList";
	    	OrderServlet orderServlet = new OrderServlet(mode);
	    	try {
	    		forward = orderServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		// TODO: handle exception
	    	}
	    }
	    else if("/kos/carBuy.kos".equals(command)){
	    	logger.info("carBuyȣ��");
	    	mode="carBuy";
	    	OrderServlet orderServlet = new OrderServlet(mode);
	    	try {
	    		forward = orderServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		
	    	}
	    }
	    else if("/kos/carOrder.kos".equals(command)){
	    	logger.info("carOrderȣ��");
	    	mode="carOrder";
	    	OrderServlet orderServlet = new OrderServlet(mode);
	    	try {
	    		forward = orderServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		
	    	}
	    }
	    else if("/kos/carOrderCheck.kos".equals(command)){
	    	logger.info("carOrderCheckȣ��");
	    	mode="carOrderCheck";
	    	OrderServlet orderServlet = new OrderServlet(mode);
	    	try {
	    		forward = orderServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		
	    	}
	    }
		/*********************hotel ���� **************************/
	    else if("/kos/getHotelList.kos".equals(command)){ 
	    	logger.info("getHotelList ȣ��");
	    	mode = "getHotelList";
	    	OrderServlet OrderServlet = new OrderServlet(mode); 
	    	try {
				forward = OrderServlet.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}
	    }
	    else if("/kos/hotelIDCheck.kos".equals(command)){ 
	    	logger.info("hotelIDCheck ȣ��");
	    	mode = "hotelIDCheck";
	    	OrderServlet OrderServlet = new OrderServlet(mode); 
	    	try {
	    		forward = OrderServlet.execute(req, res);
	    	} catch (Exception e) {
	    		// TODO: handle exception
	    	}
	    }
	    else if("/kos/hotelInsert.kos".equals(command)){
	    	logger.info("hotelInsert ȣ��");
	    	mode = "hotelInsert";
	    	OrderServlet OrderServlet = new OrderServlet(mode); 
	    	try {
	    		forward = OrderServlet.execute(req, res);
	    	} catch (Exception e) { 
	    		// TODO: handle exception
	    	}
	    }
	    else if("/kos/reservationIns.kos".equals(command)){
	    	logger.info("reservationIns ȣ��");
	    	mode = "reservationIns";
	    	OrderServlet OrderServlet = new OrderServlet(mode); 
	    	try {
	    		forward = OrderServlet.execute(req, res);
	    	} catch (Exception e) { 
	    		// TODO: handle exception
	    	}
	    }
		/*********************hotel �� **************************/
		
		/****************�ֹ� ����***************/
	    else if("/kos/reserveSearch.kos".equals(command)){
	    	logger.info("reserveSearch ȣ��");
	    	mode = "reserveSearch";
	    	OrderServlet orderServlet = new OrderServlet(mode);
	    	try {
	    		forward = orderServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		
	    	}
	    }
	    else if("/kos/airOrderOk.kos".equals(command)){
	    	logger.info("airOrderOk ȣ��");
	    	mode = "airOrderOk";
	    	OrderServlet orderServlet = new OrderServlet(mode);
	    	try {
	    		forward = orderServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		
	    	}
	    }
	    else if("/kos/rentOrderOk.kos".equals(command)){
	    	logger.info("rentOrderOk ȣ��");
	    	mode = "rentOrderOk";
	    	OrderServlet orderServlet = new OrderServlet(mode);
	    	try {
	    		forward = orderServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		
	    	}
	    }
	    else if("/kos/hotelOrderOk.kos".equals(command)){
	    	logger.info("hotelOrderOk ȣ��");
	    	mode = "hotelOrderOk";
	    	OrderServlet OrderServlet = new OrderServlet(mode);
	    	try {
	    		forward = OrderServlet.execute(req, res); 
	    	} catch (Exception e) {
	    		
	    	}
	    }
		/****************�ֹ� ����***************/
		
		if(forward.getRedirect()){//�� sendRedirect��?
			res.sendRedirect(forward.getPath());
		}else{//�� forward�Ұ���
			RequestDispatcher view = req.getRequestDispatcher(forward.getPath());
			view.forward(req, res);
		}
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		doService(req,res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		doService(req,res);
	}
}
