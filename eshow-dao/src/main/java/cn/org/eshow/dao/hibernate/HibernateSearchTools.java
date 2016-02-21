package cn.org.eshow.dao.hibernate;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.index.Fields;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.MatchAllDocsQuery;
import org.apache.lucene.search.Query;
import org.apache.lucene.util.Version;
import org.hibernate.Session;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.MassIndexer;
import org.hibernate.search.Search;
import org.hibernate.search.SearchFactory;
import org.hibernate.search.indexes.IndexReaderAccessor;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Utility class to generate lucene queries for hibernate search and perform full reindexing.
 * 
 * @author leida
 */
class HibernateSearchTools {
	
	protected static final Log log = LogFactory.getLog(HibernateSearchTools.class);

	/**
	 * Generates a lucene query to search for a given term in all the indexed
	 * fields of a class
	 * 
	 * @param searchTerm the term to search for
	 * @param searchedEntity the class searched
	 * @param sess the hibernate session
	 * @param defaultAnalyzer the default analyzer for parsing the search terms
	 * @return
	 * @throws ParseException
	 * @throws  
	 */
	public static Query generateQuery(String searchTerm, Class searchedEntity, Session sess, Analyzer defaultAnalyzer) throws ParseException {
		Query qry = null;

		if (searchTerm.equals("*")) {
			qry = new MatchAllDocsQuery();
		} else {
			// Search in all indexed fields

			IndexReaderAccessor readerAccessor = null;
			IndexReader reader = null;
			try {
				FullTextSession txtSession = Search.getFullTextSession(sess);

				// obtain analyzer to parse the query:
				Analyzer analyzer;
				if (searchedEntity == null) {
					analyzer = defaultAnalyzer;
				} else {
					analyzer = txtSession.getSearchFactory().getAnalyzer(searchedEntity);
				}

				SearchFactory searchFactory = txtSession.getSearchFactory();
				readerAccessor = searchFactory.getIndexReaderAccessor();
				reader = readerAccessor.open(searchedEntity);
				Fields fields = reader.getTermVectors(0);
				Iterator<String> it = fields.iterator();
				String[] fnames = new String[0];
				List<String> fieldNames = new ArrayList<String>();
				while (it.hasNext()) {
					String fi = it.next();
					if (fi.equals("_hibernate_class"))
						break;
					fieldNames.add(fi);
				}
				fnames = fieldNames.toArray(fnames);

				// To search on all fields, search the term in all fields
				String[] queries = new String[fnames.length];
				for (int i = 0; i < queries.length; ++i) {
					queries[i] = searchTerm;
				}

				qry = MultiFieldQueryParser.parse(queries, fnames, analyzer);
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (readerAccessor != null && reader != null) {
					readerAccessor.close(reader);
				}
			}
		}
		return qry;
	}

	/**
	 * Regenerates the index for a given class
	 * 
	 * @param clazz the class
	 * @param sess the hibernate session
	 */
	public static void reindex(Class clazz, Session sess) {
		FullTextSession txtSession = Search.getFullTextSession(sess);
		MassIndexer massIndexer = txtSession.createIndexer(clazz);
		try {
			massIndexer.startAndWait();
		} catch (InterruptedException e) {
			log.error("mass reindexing interrupted: " + e.getMessage());
		} finally {
			txtSession.flushToIndexes();
		}
	}

	/**
	 * Regenerates all the indexed class indexes
	 * 
	 * @param async true if the reindexing will be done as a background thread
	 * @param sess the hibernate session
	 */
	public static void reindexAll(boolean async, Session sess) {
		FullTextSession txtSession = Search.getFullTextSession(sess);
		MassIndexer massIndexer = txtSession.createIndexer();
		massIndexer.purgeAllOnStart(true);
		try {
			if (!async) {
				massIndexer.startAndWait();
			} else {
				massIndexer.start();
			}
		} catch (InterruptedException e) {
			log.error("mass reindexing interrupted: " + e.getMessage());
		} finally {
			txtSession.flushToIndexes();
		}
	}
}
