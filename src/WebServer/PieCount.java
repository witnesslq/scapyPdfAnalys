package WebServer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import DataBase.CompanyTable;
import DataControl.TableDataControl;
import DataControl.TableTools;
import ServerTools.ServletTools;
/**
 * 饼状图数据返回
 * @author liaoshichao
 */
@WebServlet("/PieCount")
public class PieCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String COMPANY="companyName";
    private static final String TABLETYPE="tableType";
    private static final String TABLEPART="tablePart";
    private static final String YEAR="year";
	private static final String STATUS="status";	
    public PieCount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletTools.charSet(request, response);
		String companyName,year;
		int status,tableType,tablePart;
		companyName=request.getParameter(COMPANY);
		tableType=Integer.valueOf(request.getParameter(TABLETYPE));
		tablePart=Integer.valueOf(request.getParameter(TABLEPART));
		year=request.getParameter(YEAR);
		status=Integer.valueOf(request.getParameter(STATUS));
		String name[]=dealCompanyArray(companyName.split(","));//公司名称
		JSONObject json=new JSONObject();
		
		for (int i = 0; i < name.length; i++) {
			CompanyTable mtable = TableDataControl.getControl()
					.getTableByFilteValue(name[i], year, status);
			if (mtable == null)
				continue;
			ArrayList<ArrayList<String>> list = null;
			list = TableTools.getTableItem(mtable, tableType, tablePart,	null);
			// 1 , 2仅限于前三张表
			for (ArrayList<String> mlist : list) {
				json.put(mlist.get(0), mlist.get(1));
			}
		}
		response.getWriter().write(json.toString());
		System.gc();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
	/**
	 * 出于前端数据交换的需要
	 * @param name
	 * @return
	 */
	private String [] dealCompanyArray(String name[]){
		String temp[]=new String[name.length];
		for(int i=0;i<name.length;i++)
			temp[i]=name[i].split("-")[1];
		return temp;
	}
	
}
