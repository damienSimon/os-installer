package dasim.devops.osinstaller.application.command;

import org.springframework.shell.standard.ShellComponent;
import org.springframework.shell.standard.ShellMethod;

/**
 * Class for the test's shell command
 */
@ShellComponent
public class TestCommands {

    /**
     * Test the installation of all your selected applications in a virtual machine. No impact on your operating system.
     *
     * @return information about process
     */
    @ShellMethod(group = "Tests commands",
                 value = "Test the installation of all your selected applications in a virtual machine. No impact on your operating " +
                         "system.")
    public String test() {

        return "Need to verify ? you are on the right place dude !";
    }
}
