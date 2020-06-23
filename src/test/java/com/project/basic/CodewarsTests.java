package java.com.project.basic;

import org.junit.Test;

import java.util.stream.Stream;

public class CodewarsTests {
    @Test
    public void codewarsTest() throws Exception {
        String a = "qweasdzxc";
        Stream
                .of(a)
                .anyMatch(s -> s.matches("[a-z]+"));
        if(a.matches("[a-z]+"))
            System.out.println("true");
    }
}
