package com.myweb.board.commons;

public class PageCreator {
	
	private PageVO paging;
	private int articleTotalCount; // 총 게시물의 개수
	private int beginPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	private boolean prev; // 이전 버튼 활성화 여부
	private boolean next; // 다음 버튼 활성화 여부
	
	private final int displayBtn = 10; //한 화면에 보여질 페이지 버튼 수
	
	//페이징 알고리즘을 수항할 메서드 선언
	private void calcDataOfPage() {
		
		//끝 페이지
		this.endPage = (int) Math.ceil(paging.getPage()/(double)displayBtn)*displayBtn;
		//시작 페이지
		this.beginPage = this.endPage-displayBtn+1;
		//버튼 비활성 판단
		this.prev = beginPage == 1 ? false:true;
		this.next = articleTotalCount <= endPage*paging.getCpp() ? false:true;
		//다음버튼 비활성화시 끝 페이지 보정
		if(!next) {
			endPage = (int)Math.ceil(articleTotalCount/(double)paging.getCpp());
		}
	}
	
	public PageCreator() {}

	public PageVO getPaging() {
		return paging;
	}

	public void setPaging(PageVO paging) {
		this.paging = paging;
	}

	public int getArticleTotalCount() {
		return articleTotalCount;
	}

	public void setArticleTotalCount(int articleTotalCount) {
		this.articleTotalCount = articleTotalCount;
		calcDataOfPage();
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	
}
