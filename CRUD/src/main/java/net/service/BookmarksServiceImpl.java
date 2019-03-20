package net.service;

import net.dao.BookmarksDAO;
import net.model.Bookmarks;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Date;
import java.util.List;

@Service
public class BookmarksServiceImpl implements BookmarksService{
    private BookmarksDAO bookmarksDAO;

    public void setBookmarksDAO(BookmarksDAO bookmarksDAO) {
        this.bookmarksDAO = bookmarksDAO;
    }


    @Override
    @Transactional
    public void addBookmark(Bookmarks bookmark) {
        if(!bookmarksDAO.listBookmarks().contains(bookmark)
                && bookmark != null
                && bookmark.getName().length() > 0) {
            bookmark.setDate(new Date());
            bookmarksDAO.addBookmark(bookmark);
        }
    }

    @Override
    @Transactional
    public void updateBookmark(Bookmarks bookmark) {
        bookmarksDAO.updateBookmark(bookmark);
    }

    @Override
    @Transactional
    public void removeBookmark(int id) {
        bookmarksDAO.removeBookmark(id);
    }

    @Override
    @Transactional
    public Bookmarks getBookmarkById(int id) {
        return bookmarksDAO.getBookmarkById(id);
    }

    @Override
    @Transactional
    public List<Bookmarks> listBookmarks() {
        return bookmarksDAO.listBookmarks();
    }
}
