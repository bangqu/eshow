package cn.org.eshow.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Generic Manager that talks to GenericDao to CRUD POJOs.
 *
 * <p>Extend this interface if you want typesafe (no casting necessary) managers
 * for your domain objects.
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 * @param <T> a type variable
 * @param <PK> the primary key for that type
 */
public interface GenericManager<T, PK extends Serializable> {

    /**
     * Generic method to get an object based on class and identifier. An
     * ObjectRetrievalFailureException Runtime Exception is thrown if
     * nothing is found.
     *
     * @param id the identifier (primary key) of the object to get
     * @return a populated object
     * @see org.springframework.orm.ObjectRetrievalFailureException
     */
    T get(PK id);
    
    /**
     * Generic method to get an object based on class and identifier. An
     * ObjectRetrievalFailureException Runtime Exception is thrown if
     * nothing is found.
     *
     * @param object
     * @param value
     * @return a populated object
     * @see org.springframework.orm.ObjectRetrievalFailureException
     */
    T getBy(String object, Object value);

    /**
     * Checks for existence of an object of type T using the id arg.
     * @param id the identifier (primary key) of the object to get
     * @return - true if it exists, false if it doesn't
     */
    boolean exists(PK id);

    /**
     * Generic method to save an object - handles both update and insert.
     * @param object the object to save
     * @return the updated object
     */
    T save(T object);

    /**
     * Generic method to delete an object
     * @param object the object to remove
     */
    void remove(T object);

    /**
     * Generic method to delete an object based on class and id
     * @param id the identifier (primary key) of the object to remove
     */
    void remove(PK id);
    
    /**
     * Find a list of records by using a named query
     * @param queryName query name of the named query
     * @param queryParams a map of the query names and the values
     * @return a list of the records found
     */
    List<T> findByNamedQuery(String queryName, Map<String, Object> queryParams);
    
    /**
     * Generic method to search for an object.
     * @param searchTerm the search term
     * @param clazz type of class to search for.
     * @return a list of matched objects
     */
    List<T> search(String searchTerm, Class clazz);
    
    /**
     * Generic method to regenerate full text index of the persistent class T
     */
    void reindex();

    /**
     * Generic method to regenerate full text index of all indexed classes
     * @param async true to perform the reindexing asynchronously
     */
    void reindexAll(boolean async);
    
    /**
     * 根据排序和数量得到列表
     * @param order 
     * @param count 
     * @return List<T>
     */
    List<T> list(String order,int count);
    
    /**
     * @param name
     * @return T
     */
    T exists(String name);
    
    /**
     * 计数
     * @param object
     */
    void count(Class<T> clazz, String object, int size, Integer id);
    
}
