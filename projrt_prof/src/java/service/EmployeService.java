/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.IDao;
import beans.Employe;
import beans.Machine;
import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author macbookpro
 */
public class EmployeService implements IDao<Employe> {

    @Override
    public boolean create(Employe o) {

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
    public boolean update(Employe o) {

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
    public boolean delete(Employe o) {

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
    public Employe findById(int id) {

        Employe m = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            m = (Employe) session.get(Employe.class, id);
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
    public List<Employe> findAll() {

        List<Employe> Employes = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Employes = session.createQuery("from Employe").list();
            tx.commit();
            session.close();
            return Employes;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            session.close();
            return Employes;
        }
    }

    public List<Employe> findByProfil(int id) {
        List<Employe> Employes = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Employes = session.createQuery("from Employe where profil_id=" + id).list();
            tx.commit();
            session.close();
            return Employes;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            session.close();
            return Employes;
        }

    }

    public List<Employe> findByProfilentredate(int id, String date1, String date2) {
        List<Employe> Employes = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Employes = session.createQuery("FROM Employe  WHERE profil_id=" + id + " and dateEmbauche BETWEEN '" + date1 + "'and '" + date2 + "'").list();
            tx.commit();
            session.close();
            return Employes;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            session.close();
            return Employes;
        }

    }

    public List<Long> count() {

        List<Long> Profils = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Profils = session.createQuery("SELECT COUNT(*) FROM Employe").list();
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

    public List<Employe> graphe1() {

        List<Employe> Profils = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Profils = session.createSQLQuery("SELECT P.libelle as libelle,count(*) as count FROM Employe E INNER JOIN Profil P \n"
                    + "on E.profil_id=P.id\n"
                    + "GROUP BY P.libelle").list();
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
    
    public List<Employe> findByIdee(int id) {

        List<Employe> m = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            m =   session.createSQLQuery("SELECT E.*,P.libelle as libelle FROM Employe E INNER JOIN Profil P on E.profil_id=P.id where E.id="+id).list();
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
    
    public List<Employe> findAllee() {

        List<Employe> m = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            m =   session.createSQLQuery("SELECT E.*,P.libelle as libelle FROM Employe E INNER JOIN Profil P on E.profil_id=P.id ").list();
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

}
