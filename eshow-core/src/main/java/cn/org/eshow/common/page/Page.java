package cn.org.eshow.common.page;

import java.io.Serializable;
import java.util.List;

/**
 * <pre>
 *  用来在分页查询，其作用是将当前查询的某一页的信息，
 *  如上一页、下一页、总共多少页等信息存储下来，并提供友好的接口给用户
 *  另外，也提供了转载用户序列化对象的把手：userObject
 * </pre>
 * 
 * @param <T>
 */
public class Page<T> implements Serializable {

	private static final long serialVersionUID = 3258689914320533045L;

	/**
	 * 当前页的起始点
	 */
	private int offset;

	/**
	 * 设定的页面数目
	 */
	private int pageSize;

	/**
	 * 取得的实际数目
	 */
	private int realSize;

	/**
	 * 该查询总共可返回的数目
	 */
	private int total;

	/**
	 * 数据列表
	 */

	private List<T> dataList;

	/**
	 * @param offset
	 * @param pageSize
	 */
	public Page(int offset, int pageSize) {
		this.offset = offset;
		this.pageSize = pageSize;
	}

	/**
	 * @param offset 偏移量
	 * @param pageSize 每页大小
	 * @param total 总共大小
	 * @param dataList 取得的当页的对象
	 */
	public Page(int offset, int pageSize, int total, List<T> dataList) {

		this.offset = offset;
		this.pageSize = pageSize;
		this.total = total;
		this.dataList = dataList;
		this.realSize = dataList == null ? 0 : dataList.size();
	}

	/**
	 * @return int
	 */
	public int getOffset() {
		return offset;
	}

	/**
	 * @param offset
	 */
	public void setOffset(int offset) {
		this.offset = offset;
	}

	/**
	 * @return int
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * @return int
	 */
	public int getRealSize() {
		int currentPageSize = pageSize;
		if (currentPageSize == -1) {
			currentPageSize = total;
		}
		if ((offset + currentPageSize) > total) {
			realSize = total - offset;
		}
		else {
			realSize = currentPageSize;
		}
		return realSize;
	}

	/**
	 * @return int
	 */
	public int getTotal() {
		return total;
	}

	/**
	 * @param total
	 */
	public void setTotal(int total) {
		this.total = total;
	}

	/**
	 * @return List<T>
	 */
	public List<T> getDataList() {
		return dataList;
	}

	/**
	 * @param dataList
	 */
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	/**
	 * @return int
	 */
	public int nextOffset() {
		int nextOffset = offset + pageSize;
		return nextOffset;
	}

	/**
	 * @return int
	 */
	public int prevOffset() {
		int prevOffset = offset - pageSize;
		return prevOffset;
	}

	/**
	 * @return int
	 */
	public int getTotalPage() {
		int totalPage;
		if (total % pageSize == 0) {
			totalPage = total / pageSize;
		}
		else {
			totalPage = (total / pageSize) + 1;
		}
		return totalPage;
	}

	/**
	 * @return int
	 */
	public int getCurrentPage() {
		return pageSize <= 0 ? 1 : (offset / pageSize) + 1;
	}
}
