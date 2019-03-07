package net.service;

import net.model.Bookmarks;

import java.util.List;

public interface BookmarksService {
    void addBookmark(Bookmarks bookmark);
    void updateBookmark(Bookmarks bookmark);
    void removeBookmark(int id);
    Bookmarks getBookmarkById(int id);
    List<Bookmarks> listBookmarks();
}
