package config;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author David
 */
public class CheckIP {

    static private final Logger LOGGER = Logger.getLogger("mx.com.hash.checkip.CheckIP");

    public String obtenerIP() throws UnknownHostException {
        InetAddress ip = InetAddress.getLocalHost();
        return ip.getHostAddress();
    }

}
