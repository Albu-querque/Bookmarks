package net.dao;

import net.model.Bookmarks;

import java.util.List;

public interface BookmarksDAO {
    void addBookmark(Bookmarks bookmark);
    void updateBookmark(Bookmarks bookmark);
    void removeBookmark(int id);
    Bookmarks getBookmarkById(int id);
    List<Bookmarks>listBookmarks();
}
