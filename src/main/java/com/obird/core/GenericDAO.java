package com.obird.core;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class GenericDAO<T> extends HibernateDaoSupport{

    @SuppressWarnings("rawtypes")
	private Class clazz;

    @SuppressWarnings("rawtypes")
	protected void setClass(Class clazz) {
        this.clazz = clazz;
    }

    /// Autowiring Process  
    @Autowired
     public void GenericcDAO(HibernateTemplate hibernateTemplate) {
         super.setHibernateTemplate(hibernateTemplate);
     }
    
    @SuppressWarnings("unchecked") 
    @Transactional(readOnly = false)
    public T save(T t) {
        getHibernateTemplate().saveOrUpdate(t);
        return t;
    }

    @SuppressWarnings("unchecked")
    @Transactional(readOnly = false)
    public void update(T t) {
        getHibernateTemplate().saveOrUpdate(t);
    }
    
    @SuppressWarnings("unchecked")
    @Transactional(readOnly = false)
    public void delete(T t) {
        getHibernateTemplate().delete(t);
    }
    
    @SuppressWarnings("unchecked")
    public T get(Integer id) {
        return (T) getHibernateTemplate().get(clazz.getName(), id);
    }
    
    @SuppressWarnings("unchecked")
    public List<T> findAll() {
       return (List<T>)getHibernateTemplate().find("from ", clazz.getName());
   }//end findAll
    
}//end Class    