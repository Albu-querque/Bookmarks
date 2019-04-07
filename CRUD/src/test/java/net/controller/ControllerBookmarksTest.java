package net.controller;

import net.model.Bookmarks;
import net.service.BookmarksService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.Arrays;
import java.util.Date;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/config-test.xml",
                       "file:src/main/webapp/WEB-INF/config-root.xml"})
@WebAppConfiguration
public class ControllerBookmarksTest {

    private MockMvc mockMvc;

    @Autowired
    private BookmarksService bookmarksService;

    @Autowired
    private WebApplicationContext wac;

    @Before
    public void setUp() { ;
        Mockito.reset(bookmarksService);
        this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
    }

    @Test
    public void testListBookmarks() throws Exception {
        Bookmarks first = new Bookmarks();

        first.setId(1);
        first.setDescription("description");
        first.setDate(new Date());
        first.setName("name1");
        first.setReference("noReference");

        Mockito.when(bookmarksService.listBookmarks()).thenReturn(Arrays.asList(first));


        mockMvc.perform(get("/bm/bookmarks"))
                .andExpect(status().isOk())
                .andExpect(forwardedUrl(("WEB-INF/resources/bookmarks.jsp")));

    }
}
