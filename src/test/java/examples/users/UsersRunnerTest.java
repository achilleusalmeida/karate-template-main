package examples.users;

import com.intuit.karate.junit5.Karate;

class UsersRunnerTest {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").relativeTo(getClass());
    }    

}
