package dasim.devops.osinstaller.server.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"dasim.devops.osinstaller.application"})
public class ComponentScanConfiguration {
}
