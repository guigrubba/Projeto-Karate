package aula_inatel.fake_store;

import com.intuit.karate.junit5.Karate;

class FakeStoreRunner {
    
    @Karate.Test
    Karate testFakeStore() {
        return Karate.run("fake_store").relativeTo(getClass());
    }    

}
