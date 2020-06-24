package com.project.basic;

import com.project.basic.controller.BasicController;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockServletContext;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class LoginTest {

    @Autowired
    private WebApplicationContext wac;
    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private BasicController basicController;

    @Test
    public void givenWac_whenServletContext_thenItProvidesGreetController() {
        ServletContext servletContext = wac.getServletContext();

        Assert.assertNotNull(servletContext);
        Assert.assertTrue(servletContext instanceof MockServletContext);
        Assert.assertNotNull(wac.getBean("basicController"));
    }

    @Test
    public void givenHomePageURI_whenMockMVC_thenReturnsIndexFTLViewName() throws Exception{
        this.mockMvc
                .perform(get("/"))
                .andDo(print())
                .andExpect(view().name("appHome"));
    }

    @Test
    public void contextLoadsTest1() throws Exception {
        this.mockMvc
                .perform(get("/"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("This")));
    }

    @Test
    public void contextLoadsTest2() throws Exception {
        this.mockMvc
                .perform(get("/login"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("User name:")));
    }



//    @Test
//    public void accessDeniedTest() throws Exception {
//        this.mockMvc
//                .perform(get("/main"))
//                .andDo(print())
//                .andExpect(status().is3xxRedirection())
//                .andExpect(redirectedUrl("http://localhost/login"));
//    }
//
//    @Test
//    public void correctLoginTest() throws Exception {
//        this.mockMvc
//                .perform(formLogin().user("admin").password("admin1"))
//                .andDo(print())
//                .andExpect(status().is3xxRedirection())
//                .andExpect(redirectedUrl("/"));
//    }
//
//    @Test
//    public void badCredentials() throws Exception {
//        this.mockMvc
//                .perform(post("/registration")
//                        .requestAttr("username", "qwe")
//                        .requestAttr("password", "asd")
//                        .requestAttr("password2", "asd")
//                        .requestAttr("cardNumber", "3000")
//                        .requestAttr("roomNumber", "200")
//                        .requestAttr("email", "nibema4693@mailcupp.com")
//                )
//                .andDo(print())
//                .andExpect(status().is5xxServerError());
//    }
}
