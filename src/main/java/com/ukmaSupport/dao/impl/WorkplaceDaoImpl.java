package com.ukmaSupport.dao.impl;

import com.ukmaSupport.dao.interfaces.WorkplaceDao;
import com.ukmaSupport.dao.mapper.WorkplaceMapper;
import com.ukmaSupport.models.Workplace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.List;

@Repository("workplaceDao")
public class WorkplaceDaoImpl implements WorkplaceDao {
    @Autowired
    private JdbcTemplate template;

    public WorkplaceDaoImpl(){}
    public WorkplaceDaoImpl(JdbcTemplate template) throws SQLException {
        this.template = template;
    }
    @Transactional(propagation= Propagation.REQUIRED, readOnly=false)
    @Override
    public void save(Workplace workplace) {
        this.template.update("INSERT INTO workplace (auditorium_id,access_num) VALUES(?,?)",
                workplace.getAuditoriumId(), workplace.getAccessNumber());
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public Workplace getById(int id) {
        String sql = "SELECT id,auditorium_id,acces_num FROM workplace WHERE id=?";
        return (Workplace) this.template.queryForObject(sql, new Object[]{id}, new WorkplaceMapper());

    }
    @Transactional(propagation= Propagation.REQUIRED, readOnly=false)
    @Override
    public void update(Workplace workplace) {
        this.template.update("UPDATE workplace SET auditorium_id=?,access_num=? WHERE id=?",
                 workplace.getAuditoriumId(), workplace.getAccessNumber(),workplace.getId());
    }

    @Override
    public void deleteById(int id) {
        this.template.update("DELETE FROM workplace WHERE id=?", id);
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public List<Workplace> getAll() {
        String sql = "SELECT id,auditorium_id,access_num FROM workplace";
        return this.template.query(sql, new WorkplaceMapper());
    }
}
