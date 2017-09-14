package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.BlogQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.BlogDao;
import cn.org.eshow.dao.CategoryDao;
import cn.org.eshow.model.Blog;
import cn.org.eshow.model.Category;
import cn.org.eshow.service.BlogManager;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.WebService;
import java.util.Date;
import java.util.List;

@WebService(serviceName = "BlogService", endpointInterface = "cn.org.eshow.service.BlogManager")
@Service
public class BlogManagerImpl extends GenericManagerImpl<Blog, Integer> implements BlogManager {

    @Autowired
    BlogDao blogDao;
    @Autowired
    CategoryDao categoryDao;

    @Autowired
    public BlogManagerImpl(BlogDao blogDao) {
        super(blogDao);
        this.blogDao = blogDao;
    }

    @Override
    public List<Blog> list(BlogQuery query) {
        return blogDao.list(query);
    }

    @Override
    public Page<Blog> search(BlogQuery query) {
        return blogDao.search(query);
    }

    @Override
    public Blog saveBlog(Blog blog) {
        if (blog.getCategory() != null && blog.getCategory().getId() != null) {
            blog.setCategory(categoryDao.get(blog.getCategory().getId()));
        }
        return blogDao.save(blog);
    }

    @Override
    public Blog updateBlog(Blog old, Blog blog) {
        old.setUpdateTime(new Date());
        old.setTitle(blog.getTitle() != null ? blog.getTitle() : old.getTitle());
        old.setKeyword(blog.getKeyword() != null ? blog.getKeyword() : old.getKeyword());
        old.setContent(blog.getContent() != null ? blog.getContent() : old.getContent());
        old.setImg(blog.getImg() != null ? blog.getImg() : old.getImg());
        if (blog.getCategory() != null && blog.getCategory().getId() != null) {
            old.setCategory(categoryDao.get(blog.getCategory().getId()));
        }
        return blogDao.save(old);
    }

    @Override
    public Blog updateCount(Blog blog) {
        blog.setCount(blog.getCount() + CommonVar.STEP);
        return blogDao.save(blog);
    }

    @Override
    public Blog updateEnabled(Blog blog) {
        blog.setEnabled(!blog.getEnabled());//反向设置是否可用
        return blogDao.save(blog);
    }

}