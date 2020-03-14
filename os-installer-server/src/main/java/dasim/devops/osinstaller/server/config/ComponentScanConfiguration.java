package dasim.devops.osinstaller.server.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {
        "dasim.devops.osinstaller.application", "dasim.devops.osinstaller.domain", "dasim.devops.osinstaller.infrastructure"
})
public class ComponentScanConfiguration {
}
