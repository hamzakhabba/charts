/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import beans.Machine;
import beans.Profil;
import dao.IDao;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author macbookpro
 */
public class ProfileService implements IDao<Profil>{

    @Override
    public boolean create(Profil o) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(o);
            tx.commit();
            session.close();
            return true;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            session.close();
            return false;
        }
    }

    @Override
    public boolean update(Profil o) {
        
         Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(o);
            tx.commit();
            session.close();
            return true;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            session.close();
            return false;
        }
    }

    @Override
    public boolean delete(Profil o) {
        
         Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(o);
            tx.commit();
            session.close();
            return true;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            session.close();
            return false;
        }
    }

    @Override
    public Profil findById(int id) {
        
         Profil m = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            m = (Profil) session.get(Profil.class, id);
            tx.commit();
            session.close();
            return m;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            session.close();
            return m;
        }
    }

    @Override
    public List<Profil> findAll() {
        
         List<Profil> Profils = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Profils = session.createQuery("from Profil").list();
            tx.commit();
            session.close();
            return Profils;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            session.close();
            return Profils;
        }
    }
    
    public List<Long> count() {
        
        List<Long>  Profils = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Profils = session.createQuery("SELECT COUNT(*) FROM Profil").list();
            tx.commit();
            session.close();
            return Profils;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            session.close();
            return Profils;
        }
    }

   
    
}
