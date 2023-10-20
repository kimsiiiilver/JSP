package Common;

public class BoardPage {
	
	public static String pagingStr(int totalCount, int postPage, int blockCount, int pageNum, int totalPage) {
		String pagingStr = "";
		
		
		int pageTemp = (((pageNum-1)/blockCount) * blockCount)+1;
		
		if(pageNum !=1) {
			pagingStr += "<a href='boardmain.jsp?pageNum=1'>[처음으로]</a>";
			pagingStr += "&nbsp";
			pagingStr += "<a href='boardmain.jsp?pageNum="+(pageNum-1)+"'>[이전]</a>";
		}
		
		for(int i = pageTemp; i < (pageTemp+10); i++) {
			if (pageNum == i) {
				pagingStr += i;
				pagingStr += "&nbsp";
			} else {
				pagingStr += "<a href='boardmain.jsp?pageNum="+i+"'>"+i+"</a>";
				pagingStr += "&nbsp";
			}
		}
		
		pagingStr += "<a href = 'boardmain.jsp?pageNum=" + (pageNum+1) + "'>[다음]</a>";
		pagingStr += "&nbsp";
		pagingStr += "<a href = 'boardmain.jsp?pageNum=" + totalPage + "'>[마지막으로]</a>";
		
		return pagingStr;
	}

}
