package com.busan.main;

import org.springframework.stereotype.Component;

@Component("page")
public class PagingAction {
	//ȣ�� ����¡
	public String paging(int count, int PageSize,int currentPage) {
		

		int totPage = count / PageSize + (count % PageSize == 0 ? 0 : 1);
		int blockPage = 4;
		int startPage = ((currentPage - 1) / blockPage) * blockPage + 1;
		int endPage = startPage + blockPage - 1;
		if (endPage > totPage)
			endPage = totPage;
		
		StringBuffer sb = new StringBuffer();
		if(count>0) {
			if(startPage>blockPage) {
				sb.append("<a href=javascript:HotelPaging(");
				sb.append((startPage-blockPage));
				sb.append(")>[����]</a>");
			}
			for(int i = startPage ; i<=endPage ; i++) {
				if(i==currentPage) {
					sb.append("["+i+"]");
				}else {
					sb.append("<a href=javascript:HotelPaging(");
					sb.append(i);
					sb.append(")>["+i+"]</a>");
				}
			}
			if(endPage<totPage) {
				sb.append("<a href=javascript:HotelPaging(");
				sb.append((startPage+blockPage));
				sb.append(")>[����]</a>");
			}
			
		}

		return sb.toString();
	}
	//��ǰ��������¡
	public String ltpaging(int count, int PageSize,int currentPage, String course, String place, String fx, String theme) {
		int totPage = count / PageSize + (count % PageSize == 0 ? 0 : 1);
		int blockPage = 4;
		int startPage = ((currentPage - 1) / blockPage) * blockPage + 1;
		int endPage = startPage + blockPage - 1;
		if (endPage > totPage)
			endPage = totPage;
		
		StringBuffer sb = new StringBuffer();
		if(count>0) {
			if(startPage>blockPage) {
				sb.append("<a href=javascript:"+fx+"('");
				sb.append(course+"',"+(startPage-blockPage)+",'"+place+"','"+theme);
				sb.append("')>[����]</a>");
			}
			for(int i = startPage ; i<=endPage ; i++) {
				if(i==currentPage) {
					sb.append("["+i+"]");
				}else {
					sb.append("<a href=javascript:"+fx+"('");
					sb.append(course+"',"+i+",'"+place+"','"+theme);
					sb.append("')>["+i+"]</a>");
				}
			}
			if(endPage<totPage) {
				sb.append("<a href=javascript:"+fx+"('");
				sb.append(course+"',"+(startPage+blockPage)+",'"+place+"','"+theme);
				sb.append("')>[����]</a>");
			}
		}
		return sb.toString();
	}
	public String transpaging(int count, int PageSize, int currentPage, String linename, String code,String fx) {
		
		int totPage = count / PageSize + (count % PageSize == 0 ? 0 : 1);
		int blockPage = 4;
		int startPage = ((currentPage - 1) / blockPage) * blockPage + 1;
		int endPage = startPage + blockPage - 1;
		if (endPage > totPage)
			endPage = totPage;
		
		StringBuffer sb = new StringBuffer();
		if(count>0) {
			if(startPage>blockPage) {
				sb.append("<a href=javascript:"+fx+"('");
				sb.append(code+"','"+linename+"',"+(startPage-blockPage));
				sb.append(")>[����]</a>");
			}
			for(int i = startPage ; i<=endPage ; i++) {
				if(i==currentPage) {
					sb.append("["+i+"]");
				}else {
					sb.append("<a href=javascript:"+fx+"('");
					sb.append(code+"','"+linename+"',"+i);
					sb.append(")>["+i+"]</a>");
				}
			}
			if(endPage<totPage) {
				sb.append("<a href=javascript:"+fx+"('");
				sb.append(code+"','"+linename+"',"+(startPage+blockPage));
				sb.append(")>[����]</a>");
			}
		}
		return sb.toString();
	}
	public String searchpaging(int count, int pageSize, int currentPage, String field, String word) {
		
		int totPage = count/pageSize+(count%pageSize==0?0:1);
		int blockPage = 3;
		int startPage = ((currentPage-1)/blockPage)*blockPage+1;
		int endPage = startPage + blockPage-1;
		if(endPage>totPage)endPage=totPage;
		
		StringBuffer sb = new StringBuffer();
		if(count>0) {
			if(startPage>blockPage) {
				sb.append("<a href=/Board?pageNum=");
				sb.append((startPage-blockPage));
				sb.append("&field="+field+"&word="+word+">[����]</a>");
			}
			for(int i = startPage ; i<=endPage;i++) {
				if(i==currentPage) {
					sb.append("["+i+"]");
				}else {
					sb.append("<a href=/Board?pageNum=");
					sb.append(i);
					sb.append("&field="+field+"&word="+word+">["+i+"]</a>");
				}
			}
			if(endPage<totPage) {
				sb.append("<a href=/Board?pageNum=");
				sb.append((startPage+blockPage));
				sb.append("&field="+field+"&word="+word+">[����]</a>");
			}
		}
		
		return sb.toString();
	}
}
