package examples.tests;

import com.intuit.karate.junit5.Karate;

public class PostRunnerTest {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("post").relativeTo(getClass());
    }
}
