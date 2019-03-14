package com.busan.main;

import org.springframework.stereotype.Component;

@Component("page")
public class PagingAction {
	//호텔 페이징
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
				sb.append(")>[이전]</a>");
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
				sb.append(")>[다음]</a>");
			}
			
		}

		return sb.toString();
	}
	//명품관광페이징
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
				sb.append("')>[이전]</a>");
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
				sb.append("')>[다음]</a>");
			}
		}
		return sb.toString();
	}
}
