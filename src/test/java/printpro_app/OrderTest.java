package printpro_app;

import com.printpro_app.model.Order;
import org.junit.Test;
import static org.junit.Assert.assertNotNull;

public class OrderTest {

    @Test
    public void createOrderInstanceTest() {
        Order order = new Order(1, "Descripción", 10);
        assertNotNull("El objeto order no debe ser nulo", order);
    }
}
