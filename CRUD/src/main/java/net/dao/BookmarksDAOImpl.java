package net.dao;

import net.model.Bookmarks;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookmarksDAOImpl implements BookmarksDAO{
    private static final Logger logger = LoggerFactory.getLogger(BookmarksDAOImpl.class);
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addBookmark(Bookmarks bookmark) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(bookmark);
        logger.info("Запись добавлена в БД");
    }

    @Override
    public void updateBookmark(Bookmarks bookmark) {
        Session session = sessionFactory.getCurrentSession();
        session.update(bookmark);
        logger.info("Запись в БД обновлена");
    }

    @Override
    public void removeBookmark(int id){
        Session session = sessionFactory.getCurrentSession();
        Bookmarks bookmark = session.load(Bookmarks.class, id);
        if(bookmark != null) {
            session.delete(bookmark);
            logger.info("Запись удалена из БД");
        } else {
            logger.info("Запись не была удалена(bookmark == null)");
        }
    }

    @Override
    public Bookmarks getBookmarkById(int id) {
        Session session = sessionFactory.getCurrentSession();
        logger.info("Взята запись в БД по id");
        return session.load(Bookmarks.class, id);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Bookmarks> listBookmarks() {
        Session session = sessionFactory.getCurrentSession();
        logger.info("Взяты все записи из БД");
        return session.createQuery("FROM Bookmarks").list();
    }
}
