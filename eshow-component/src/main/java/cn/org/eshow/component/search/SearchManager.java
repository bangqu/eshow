package cn.org.eshow.component.search;

import cn.org.eshow.common.page.Page;
import com.chenlb.mmseg4j.analysis.MMSegAnalyzer;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.util.Version;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ReflectionUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class SearchManager<T> {

	@Autowired
	private SessionFactory sessionFactory;

	private static final Log log = LogFactory.getLog(SearchManager.class);

	public Page<T> search(Class object, String keyword, Integer offset, Integer pagesize, String... pros) throws Exception {
		Page<T> page = new Page<T>(offset, pagesize);
		List<T> list = new ArrayList<T>();
		Session session = sessionFactory.openSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);
		Transaction tx = fullTextSession.beginTransaction();
		QueryBuilder qb = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(object)
				.get();
		org.apache.lucene.search.Query query = qb.keyword().onFields(pros).matching(keyword)
				.createQuery();
		FullTextQuery hibQuery = fullTextSession.createFullTextQuery(query, object);
		hibQuery.setMaxResults(pagesize);
		hibQuery.setFirstResult(offset);
		list = hibQuery.list();
		tx.commit();
		list = hightLight(query, list, object, null, pros);
		page.setTotal(hibQuery.getResultSize());// 得到总数
		page.setDataList(list);
		// session.close();
		return page;
	}

	public List searchAll(Class object, String keyword, String... pros) {
		List result = new ArrayList();
		Session session = sessionFactory.openSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);
		Transaction tx = fullTextSession.beginTransaction();

        MMSegAnalyzer analyzer = new MMSegAnalyzer();
		QueryParser parser = new QueryParser("title", analyzer);
		try {
			org.apache.lucene.search.Query luceneQuery = parser.parse("title:" + keyword);
			org.hibernate.Query fullTextQuery = fullTextSession.createFullTextQuery(luceneQuery,
					object);
			result = fullTextQuery.list();
			tx.commit();
			session.close();
		} catch (ParseException e) {
		}
		return result;
	}

	/**
	 * @param luceneQuery Query
	 * @param searchResults 搜索结果集
	 * @param searchResultClass 搜索结果类型
	 * @param excludeFields 要排除高亮的字段
	 * @param fieldNames 需要高亮的字段
	 * @return 高亮后的searchResults
	 * @throws InvalidTokenOffsetsException
	 * @throws Exception
	 */
	private List<T> hightLight(org.apache.lucene.search.Query luceneQuery, List<T> searchResults, Class<T> searchResultClass, List<String> excludeFields, String... fieldNames) throws Exception {
		// 设置高亮

		SimpleHTMLFormatter formatter = new SimpleHTMLFormatter("<span class=\"red\">", "</span>");
		QueryScorer queryScorer = new QueryScorer(luceneQuery);
		Highlighter highlighter = new Highlighter(formatter, queryScorer);
        MMSegAnalyzer analyzer = new MMSegAnalyzer();

		for (T t : searchResults) {
			for (String fieldName : fieldNames) {

				if (null != excludeFields && excludeFields.contains(fieldName)) {
					continue;
				}

				Object fieldValue = ReflectionUtils.invokeMethod(BeanUtils.getPropertyDescriptor(searchResultClass, fieldName).getReadMethod(), t);
				String hightLightFieldValue = null;

				if (fieldValue instanceof String) {

					hightLightFieldValue = highlighter.getBestFragment(analyzer, fieldName, ObjectUtils.identityToString(fieldValue));

					ReflectionUtils.invokeMethod(BeanUtils.getPropertyDescriptor(searchResultClass, fieldName).getWriteMethod(), t, hightLightFieldValue);
				}
			}
		}

		return searchResults;
	}
}
