package net.controller;

import net.model.Bookmarks;
import net.service.BookmarksService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/bm")
public class ControllerBookmarks {
    private BookmarksService bookmarksService;
    private static final Logger logger = LoggerFactory.getLogger(ControllerBookmarks.class);

    @Autowired
    @Qualifier("bookmarksService")
    public void setBookmarksService(BookmarksService bookmarksService) {
        this.bookmarksService = bookmarksService;
    }

    @RequestMapping(value = "/bookmarks", method = RequestMethod.GET)
    public String listBookmarks(Model model) {
        logger.info("Вызван: listBookmarks");
        model.addAttribute("bookmark", new Bookmarks());
        model.addAttribute("bookmarks", bookmarksService.listBookmarks());
        return "/bookmarks";
    }

    /*@RequestMapping(value = "/bookmarks", method = RequestMethod.GET)
    public ModelAndView d() {
        ModelAndView model = new ModelAndView();
        model.addObject("bookmark", new Bookmarks());
        model.addObject("bookmarks", bookmarksService.listBookmarks());
        model.setViewName("bookmarks");
        return model;
    }*/

    @RequestMapping(value = "/bookmarks/add", method = RequestMethod.POST)
    public String addBookmark(@ModelAttribute(value = "bookmark") Bookmarks bookmark) {
        logger.info("Вызван: addBookmark");
        if(bookmark.getId() == 0)
            bookmarksService.addBookmark(bookmark);
        else
            bookmarksService.updateBookmark(bookmark);

        return "redirect:/bookmarks";
    }

    @RequestMapping(value = "/remove/{id}")
    public String remove(@PathVariable("id") int id) {
        logger.info("Вызван: remove");
        bookmarksService.removeBookmark(id);
        return "redirect:/bookmarks";
    }

}
